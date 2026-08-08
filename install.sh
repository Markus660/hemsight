#!/usr/bin/env bash
# HEMSight – install with a single command.
#
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Markus660/hemsight/main/install.sh)"
#
# It creates a directory, fetches the Compose file and starts the containers. Docker itself
# has to be there already; this script does not install it.
#
# Run it twice and nothing breaks: an existing installation is updated, never replaced. Your
# settings live in data/ and are not touched here.

set -euo pipefail

source_url="${HEMSIGHT_SOURCE_URL:-https://raw.githubusercontent.com/Markus660/hemsight/main}"
target_dir="${HEMSIGHT_DIR:-$PWD/hemsight}"
default_port=18081

say() { printf '%s\n' "$*"; }
step() { printf '\n==> %s\n' "$*"; }
fail() { printf '\nInstallation stopped: %s\n' "$*" >&2; exit 1; }

# --- What has to be there before we start -------------------------------------------------

step "Checking prerequisites"

command -v docker >/dev/null 2>&1 ||
  fail "Docker is not installed. See https://docs.docker.com/engine/install/ and run this again."

docker info >/dev/null 2>&1 ||
  fail "Docker is installed but not reachable. Start the service, or add your user to the docker group and log in again."

docker compose version >/dev/null 2>&1 ||
  fail "The Docker Compose plugin is missing. On Debian and Ubuntu: apt install docker-compose-plugin"

# The Compose file marks the .env as optional, which older Compose versions reject outright.
# Better to say so here than to leave someone with a parse error they cannot place.
compose_version="$(docker compose version --short 2>/dev/null || echo 0)"
compose_major="${compose_version%%.*}"
compose_rest="${compose_version#*.}"
compose_minor="${compose_rest%%.*}"
if [ "${compose_major:-0}" -lt 2 ] || { [ "$compose_major" -eq 2 ] && [ "${compose_minor:-0}" -lt 24 ]; }; then
  fail "Docker Compose $compose_version is too old, 2.24 or newer is needed. Update the docker-compose-plugin package."
fi

command -v curl >/dev/null 2>&1 || fail "curl is missing."

say "Docker and Compose $compose_version are ready."

# --- Where it goes ------------------------------------------------------------------------

updating=0
if [ -e "$target_dir/compose.yaml" ]; then
  updating=1
  step "Found an existing installation in $target_dir – updating it"
  say "Your data/ directory and your .env stay as they are."
elif [ -e "$target_dir" ] && [ -n "$(ls -A "$target_dir" 2>/dev/null)" ]; then
  fail "$target_dir exists and is not empty, but holds no HEMSight installation. Pick another directory with HEMSIGHT_DIR=/path/to/dir."
else
  step "Installing into $target_dir"
fi

mkdir -p "$target_dir"
cd "$target_dir"

# --- The recipe ---------------------------------------------------------------------------

step "Fetching the Compose file"

# Into a temporary file first: a half-finished download must not replace a working one.
tmp_compose="$(mktemp "$target_dir/.compose.yaml.XXXXXX")"
trap 'rm -f "$tmp_compose"' EXIT
curl -fsSL "$source_url/compose.yaml" -o "$tmp_compose" ||
  fail "Could not download the Compose file from $source_url."
mv "$tmp_compose" compose.yaml
trap - EXIT

docker compose config --quiet ||
  fail "The downloaded Compose file is not valid. Please report this."

say "compose.yaml is in place."

# --- The port -----------------------------------------------------------------------------
#
# Silently moving to a different port would be the kind of surprise nobody can explain later,
# so a busy port is written into the .env and named in plain sight.

port_busy() { (exec 3<>"/dev/tcp/127.0.0.1/$1") 2>/dev/null && exec 3>&- && return 0 || return 1; }

port="$default_port"
if [ "$updating" -eq 0 ] && port_busy "$default_port"; then
  step "Port $default_port is taken – looking for a free one"
  for candidate in $(seq $((default_port + 1)) $((default_port + 20))); do
    if ! port_busy "$candidate"; then port="$candidate"; break; fi
  done
  [ "$port" != "$default_port" ] || fail "No free port found between $default_port and $((default_port + 20))."
  printf 'HEMSIGHT_FRONTEND_PORT=%s\n' "$port" >> .env
  say "Using port $port instead. It is written to .env and you can change it there."
elif [ -f .env ]; then
  configured="$(sed -n 's/^HEMSIGHT_FRONTEND_PORT=//p' .env | tail -1)"
  [ -n "$configured" ] && port="$configured"
fi

# --- Start --------------------------------------------------------------------------------

step "Pulling the images and starting"
say "The app image is around 1.5 GB, so the first run takes a while."

docker compose pull ||
  fail "Could not fetch the images from ghcr.io. Usually that is the machine's internet connection or a proxy in between. Nothing has been started; running this command again is safe."

docker compose up -d ||
  fail "The images are here but the containers did not start. 'docker compose logs' in $target_dir says why."

# --- Where to go now ----------------------------------------------------------------------

address="$(hostname -I 2>/dev/null | awk '{print $1}')"
[ -n "$address" ] || address="localhost"

step "Done"
say ""
say "  Open HEMSight at:  http://$address:$port"
say ""
say "The setup assistant takes it from here – it asks for your password on the first visit."
say "Your settings are stored in $target_dir/data and belong in your backup."
say ""
if [ "$updating" -eq 1 ]; then
  say "To update again later, just run this command once more."
else
  say "The manual is at https://hemsight.de – feedback goes through the Bug / Feedback tab in the app."
fi
