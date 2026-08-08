# HEMSight

Nachts um drei ist Strom manchmal halb so teuer wie abends um sieben. Und wenn die Sonne
richtig aufs Dach knallt, ist meistens keiner da, der die Waschmaschine anstellt.

Genau dafür ist HEMSight da. Es rechnet für die nächsten Tage durch, wann sich was lohnt,
und schaltet deine Geräte dann auch selbst. Alles läuft bei dir zu Hause, ohne Cloud und
ohne Abo.

> **Frühe Beta.** Tester gesucht! Rückmeldungen bitte über den Reiter *Bug / Feedback* in
> der App — da hängt eine Diagnose dran, mit der sich meistens sehen lässt, woran es liegt.

## Was HEMSight für dich macht

Dein Auto fängt nicht mehr sofort an zu laden, nur weil das Kabel dran ist. Es wartet auf
die billigen Stunden und ist morgens trotzdem voll.

Der PV-Überschuss geht ins Warmwasser, in den Speicher oder ins Auto, statt für ein paar
Cent ins Netz zu wandern.

Waschmaschine und Spülmaschine starten, wenn die Sonne da ist oder der Strom gerade nichts
kostet. Du räumst nur noch ein.

Der Speicher füllt sich vor den teuren Stunden. Kommt morgen früh sowieso Sonne, bleibt er
leer.

Heizung und Klimageräte halten deine Temperatur, arbeiten aber lieber dann, wenn Strom
billig ist.

Und wenn dir mal eine Schaltung komisch vorkommt: zu jeder steht da, warum sie passiert
ist. Oben rechts sitzt ein Not-Aus, der alles sofort anhält.

Der Plan ist das Herz davon: 15-Minuten-Schritte über die nächsten zwei bis drei Tage, mit
allem, was in der Zeit passieren soll. Er wird laufend neu gerechnet, wenn sich Wetter,
Preise oder dein Verbrauch ändern.

## Was du brauchst

Das, was du schon hast. PV, Speicher, Wallbox, Wärmepumpe, ein dynamischer Stromtarif –
das nimmt HEMSight alles mit, aber nichts davon ist Pflicht. Nur mit PV und Tarif lohnt es
sich auch schon.

Deine Geräte hängen in Home Assistant ja bereits. HEMSight liest sie von dort und spart dir
damit den größten Teil der Einrichterei.

## Nach dem Start

Öffne HEMSight über den Eintrag in der Seitenleiste. Beim ersten Aufruf führt dich der
Einrichtungsassistent durch alles: Standort, Tarif, Geräte, Grenzen. Ein Passwort brauchst
du hier nicht — die App liegt hinter deinem Home-Assistant-Login.

Deine Einstellungen liegen im `/data`-Verzeichnis der App und wandern damit in jedes
Home-Assistant-Backup. Zugangsdaten und Token stehen dort verschlüsselt.

## Einstellungen dieser App

Beide Schalter unter *Konfiguration* betreffen nur die Protokollierung, nicht die
Optimierung:

| Einstellung | Bedeutung |
| --- | --- |
| **Protokollstufe** | Wie ausführlich HEMSight ins App-Protokoll schreibt. `info` ist richtig für den Normalbetrieb; `debug` nur, wenn du einem Problem nachgehst — es wird schnell sehr viel. |
| **HTTP-Zugriffsprotokoll** | Schreibt jede einzelne Anfrage mit. Hilfreich bei der Fehlersuche, sonst unnötiges Rauschen. |

Alles Weitere — Home Assistant, Tarife, Geräte, Zeitfenster, Grenzen — stellst du **in der
App** ein, nicht hier. Es landet in `/data` und übersteht jedes Update.

## Hilfe und Handbuch

Das komplette Handbuch mit jeder Seite und jedem Eingabefeld steht auf
**[hemsight.de](https://hemsight.de)**.

Läuft etwas nicht, schick eine Rückmeldung über den Reiter *Bug / Feedback* in der App.
Kommst du gar nicht so weit, geht es auch über ein
[Issue](https://github.com/Markus660/hemsight/issues/new/choose).

Eine Sicherheitslücke bitte **nicht** als öffentliches Issue melden, sondern über
*Security → Report a vulnerability* im Repository — siehe
[SECURITY.md](https://github.com/Markus660/hemsight/blob/main/SECURITY.md).

---

# HEMSight (English)

At three in the morning electricity is sometimes half the price it is at seven in the
evening. And when the sun really hits the roof, nobody is usually home to start the washing
machine.

That's what HEMSight is for. It works out when things are worth doing over the next few
days, and then switches your devices itself. Everything runs in your home, no cloud, no
subscription.

> **Early beta.** Testers wanted! Please send feedback through the *Bug / Feedback* tab in
> the app — it attaches a diagnostic report that usually shows the cause.

## What it does for you

Your car no longer starts charging the moment the cable is plugged in; it waits for the
cheap hours and is still full in the morning. Your solar surplus goes into hot water, the
battery or the car instead of being sold to the grid for a few cents. The washing machine
and the dishwasher start when the sun is out, or when electricity costs next to nothing.
The battery fills up before the expensive hours — and stays empty if tomorrow morning
brings sun anyway. Heating and air conditioning hold your temperature, but do the work when
electricity is cheap.

Every switching decision says why it happened, and there's an emergency stop top right that
halts everything at once.

The plan is the heart of it: quarter-hour steps across the next two to three days,
recalculated continuously as weather, prices or your consumption change.

## What you need

What you already have. Solar, a battery, a wallbox, a heat pump, a dynamic tariff — HEMSight
takes all of it, and none of it is required. Solar and a tariff alone are already worth it.
Your devices are already in Home Assistant, and HEMSight reads them from there, which saves
you most of the setup work.

## After starting

Open HEMSight from the sidebar entry. On the first visit the setup assistant walks you
through location, tariff, devices and limits. No password needed — the app sits behind your
Home Assistant login.

Your settings live in the app's `/data` directory and are therefore part of every Home
Assistant backup. Credentials and tokens are stored encrypted.

## This app's settings

Both switches under *Configuration* only affect logging, not the optimisation:

| Setting | Meaning |
| --- | --- |
| **Log level** | How much detail HEMSight writes to the app log. `info` is right for normal use; `debug` only while chasing a problem — it gets verbose quickly. |
| **HTTP access log** | Records every single request. Useful for troubleshooting, noise otherwise. |

Everything else — Home Assistant, tariffs, devices, time windows, limits — is configured
**in the app**, not here. It is stored in `/data` and survives every update.

## Help and manual

The full manual, covering every page and every input field, is at
**[hemsight.de](https://hemsight.de)**.

If something doesn't work, use the *Bug / Feedback* tab in the app. If you never get that
far, open an [issue](https://github.com/Markus660/hemsight/issues/new/choose).

Please report a security vulnerability privately through *Security → Report a
vulnerability*, not as a public issue — see
[SECURITY.md](https://github.com/Markus660/hemsight/blob/main/SECURITY.md).
