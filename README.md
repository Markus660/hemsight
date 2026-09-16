<h1 align="center">HEMSight</h1>

<p align="center">
  <strong>Energiemanager für zu Hause – plant deinen Strom und schaltet deine Geräte</strong>
</p>

<p align="center"><img src="https://img.shields.io/badge/version-0.0.11--beta-blue.svg" alt="Version"> <img src="https://img.shields.io/badge/status-fr%C3%BChe%20Beta-orange.svg" alt="Status"> <a href="LICENSE"><img src="https://img.shields.io/badge/lizenz-propriet%C3%A4r-green.svg" alt="Lizenz"></a> <img src="https://img.shields.io/badge/l%C3%A4uft%20auf-Docker%20%7C%20Home%20Assistant-lightgrey.svg" alt="Läuft auf"></p>

<p align="center"><strong><a href="https://hemsight.de">hemsight.de</a></strong> – alle Funktionen im Überblick und das komplette Handbuch</p>

<p align="center">Deutsch · <a href="README.en.md">English</a></p>

> **Frühe Beta.** Tester gesucht!

Nachts um drei ist Strom manchmal halb so teuer wie abends um sieben. Und wenn die Sonne
richtig aufs Dach knallt, ist meistens keiner da, der die Waschmaschine anstellt.

Genau dafür ist HEMSight da. Es rechnet für die nächsten Tage durch, wann sich was lohnt,
und schaltet deine Geräte dann auch selbst. Alles läuft bei dir zu Hause, ohne Cloud und
ohne Abo.

**Wenn dir das Projekt gefällt und du mich unterstützen möchtest:**

<a href="https://ko-fi.com/hemsight"><img height="36" src="https://ko-fi.com/img/githubbutton_sm.svg" alt="Kaffee spendieren auf Ko-fi"></a> <a href="https://github.com/sponsors/Markus660"><img height="36" src="https://img.shields.io/badge/Sponsor-ea4aaa?logo=githubsponsors&logoColor=white&style=for-the-badge&labelColor=ea4aaa" alt="GitHub Sponsor"></a>

---

<p align="center">
  <img src="bilder/uebersicht.png" width="900" alt="Die Übersichtsseite mit dem aktuellen Energiefluss">
</p>

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

<p align="center">
  <img src="bilder/plan.png" width="900" alt="Die Plantabelle mit 288 Viertelstunden">
</p>

Der Plan ist das Herz davon: 15-Minuten-Schritte über die nächsten zwei bis drei Tage, mit
allem, was in der Zeit passieren soll. Er wird laufend neu gerechnet, wenn sich Wetter,
Preise oder dein Verbrauch ändern.

## Was du brauchst

Das, was du schon hast. PV, Speicher, Wallbox, Wärmepumpe, ein dynamischer Stromtarif –
das nimmt HEMSight alles mit, aber nichts davon ist Pflicht. Nur mit PV und Tarif lohnt es
sich auch schon.

Home Assistant ist kein Muss. Hast du es, sparst du dir viel Einrichterei, weil deine
Geräte da schon hängen.

## Versionen

### 0.0.12-beta

- Für das Preisladen lässt sich ein Höchstpreis eintragen; über diesem Preis geht kein Netzstrom ins Auto.
- Eine eingetragene Abfahrt geht vor: um sie zu erreichen, lädt das Auto auch über dem Höchstpreis, so weit wie nötig.
- Die Wettermodelle werden nur noch einmal pro Stunde abgefragt statt bei jedem Planlauf.
- Der Plan stand oft auf „Eingeschränkt", wenn eine Wetterquelle kurz ausfiel; das passiert nicht mehr.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.11-beta

- Die PV-Vorhersage lernt jetzt von deiner Anlage und rechnet mit vier Wettermodellen statt einem.
- Sie merkt selbst, an welchem Sonnenstand die Anlage verschattet ist und ob Schnee oder Laub auf den Modulen liegt.
- Home Assistant bekommt eigene Sensoren für die PV-Vorhersage.
- Der Warmwasserspeicher ging nicht mehr aus; jetzt schaltet er wieder ab.
- Wie weit der Speicher geladen wird, entscheidet HEMSight selbst; die Zieltemperatur dazwischen entfällt.
- Preisladen ohne Abfahrtszeit plante gar nichts; jetzt lädt das Auto in den günstigsten Stunden.
- Einrichtungsassistent und Einstellungen zeigen dieselben Felder.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.10-beta

- Will der Plan die Hauslast nicht aus der Solaranlage decken, geht der Solarstrom jetzt in den Speicher statt ins Haus.
- Im Plan steht keine Netzladung von einem Watt mehr, wo gar nichts aus dem Netz geladen wird.
- Für die Netzladung plant HEMSight nur noch Werte, die der Speicher wirklich annimmt.
- Für Stunden, in denen nur Solarstrom in den Speicher geht, nennt der Plan jetzt einen eigenen Grund.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.9-beta

- Im Add-on waren Planautomatik und Messwertaufzeichnung ab Werk abgeschaltet; diese Version holt beides zurück.
- Der Börsenpreis darf jetzt aus einer Home-Assistant-Integration kommen, ohne eigenen Zugang und Schlüssel.
- Ein Neustart von Home Assistant legt die Steuerung nicht mehr lahm.
- Die Vorhersage für die PV-Anlage wechselt nicht mehr bei jeder kleinen Störung ihre Quelle.
- Ein eingeplanter Gerätestart wandert nicht mehr grundlos durch den Tag.
- Eine Wallbox ließ sich weder anlegen noch ändern; das geht wieder.
- Plan-, Kosten- und Statuswerte gingen auf neueren InfluxDB-Servern spurlos verloren.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.8-beta

- Der neue Planrechner war im Add-on und im Docker-Abbild gar nicht enthalten; jetzt ist er drin, und die Pläne werden besser und schneller.
- In mehreren Lagen kam gar kein Plan zustande: bei einem Speicher über seiner Ladegrenze, bei einem gedrosselten Vorrangspeicher und bei einem Auto mit mehreren Speichern.
- Der Plan sagt jetzt, ob er wirklich der beste ist. Kommt keiner zustande, steht dabei, was sich in die Quere kommt.
- Die Live-Seite nennt zu jedem Gerät einzeln, welche Voraussetzung der Steuerung noch fehlt.
- Geschirrspüler und Poolpumpe laufen wieder in der Sonne, auch wenn das Auto ansteckt.
- Texte, die HEMSight unverändert vom Server durchgereicht hat, kommen jetzt in der eingestellten Sprache an.
- Dazu rund zwanzig weitere Fehlerbehebungen in Planung, Speichern, Ladeplanung und Geräten.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.7-beta

- Der Plan geht nur noch zwei Tage weit statt drei; die Einstellung dazu entfällt.
- Lädt das Auto im PV-Modus, bekommt es den Sonnenüberschuss jetzt vor dem Hausakku.
- Große Anlagen bekommen wieder einen Plan: Kommt die feine Rechnung nicht durch, rechnet HEMSight gröber weiter statt gar nicht.
- Anker-Geräte lassen sich direkt im Heimnetz auslesen, ohne Anker-Konto und ohne Home Assistant.
- Speicher, die es können, laden stufenlos aus dem Netz statt nur ganz oder gar nicht.
- Zeigt ein Gerät auf eine Home-Assistant-Entity, die es nicht gibt, sagt HEMSight das und lässt es in den Einstellungen geradebiegen.
- Dazu rund dreißig weitere Fehlerbehebungen in Planung, Speichern, Ladeplanung, Warmwasser und Einrichtung.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.6-beta

- Der Strompreis darf jetzt aus jedem Home-Assistant-Sensor kommen, eigene Preislisten lassen sich als CSV- oder JSON-Datei einlesen, und Ostrom wird mit dem eigenen Kundenzugang angebunden.
- HEMSight plant jetzt auch ohne Hausspeicher – eine PV-Anlage mit Wallbox oder nur schaltbaren Verbrauchern bekommt einen vollwertigen Plan.
- Zwei ungleiche Speicher oder ein Speicher mit erhöhter Untergrenze machen den Plan nicht mehr unmöglich.
- Ein schaltbarer Verbraucher hält seine eingestellte Tageslaufzeit jetzt wirklich ein.
- Übersicht und Minutenoptimierung nennen einzeln, warum HEMSight noch nicht steuert, und führen zu der Einstellung, die es löst.
- Die Phasenwahl beim E-Auto-Laden wirkt jetzt auf Vorschau, geplanten Fahrplan und Live-Steuerung.
- Dazu rund vierzig weitere Fehlerbehebungen in Planung, flexiblen Verbrauchern, Einrichtung und Integrationen.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.5-beta

- Löschen geht jetzt sowohl direkt an der Gerätekarte als auch in der aufklappbaren Verwaltung.
- PV-Ertrag hinter einem DC-gekoppelten Speicher wird jetzt automatisch erkannt und korrekt auf Erzeugung und Hausverbrauch verteilt.
- Die PV-Prognose läuft der Sonne nicht mehr eine Viertelstunde hinterher, und die Windgeschwindigkeit wird in der richtigen Einheit gerechnet.
- Batterierichtung, abgeleitete Hauslast und Tageswerte werden zuverlässig angezeigt.
- Dazu rund ein Dutzend weiterer Fehlerbehebungen in Planung, Einrichtung und Live-Steuerung.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.4-beta

- Flexible Verbraucher lassen sich direkt auf der Betriebsseite an- und ausschalten.
- Probleme mit der Datenlage – abgelehnte Zugangsdaten, eine tote Quelle, ein fehlender Sensor – melden sich jetzt als eigene Benachrichtigung, statt im Log unterzugehen.
- Das Betriebslog zeigt jeden Hinweis einzeln, übersetzt und nach Dringlichkeit sortiert.
- Ein abgelehntes Speichern im Assistenten nennt jetzt Grund und betroffenes Feld; ein leer gelassenes Zahlenfeld wird nicht mehr als 0 gespeichert.
- Spülmaschine und Waschmaschine melden bei langen Programmen wieder „fertig" statt „Laufzeit überschritten".
- Ein einzelner überschriebener Zugang wirft eine eingerichtete Anlage nicht mehr in die Einrichtung zurück.
- Dazu rund zwanzig weitere Fehlerbehebungen in Benachrichtigungen, Einrichtung und Datenhaltung.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.3-beta

- Der Netzbezug lässt sich hart begrenzen, und der Plan hält die Grenze ein.
- Neue Sensoren bekommen beim Einrichten die letzten 14 Tage aus Home Assistant – die Lastprognose fängt nicht mehr bei null an.
- Speicher mit getrennten Lade- und Entlade-Eingängen lassen sich vollständig steuern.
- Die Übersicht zeigt gemessene Tageswerte statt Summen über den Planungszeitraum.
- HEMSight hält fest, was es wann vorhergesagt hat, und macht die Treffgenauigkeit nachvollziehbar.
- Warmwasser-Grenzwerte greifen im Plan und in der Live-Steuerung gleichermaßen.
- Dazu rund fünfzig behobene Fehler in Planung, Speicher-Steuerung, Integrationen und Einrichtung.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

### 0.0.2-beta

- Fronius Wattpilot ist jetzt als direkte Integration verfügbar.
- Für Fahrzeuge können über Home Assistant zusätzlich Ladestatus, Steckerstatus und Ist-Ladestrom hinterlegt werden – etwa mit TeslaMate-MQTT-Sensoren.
- Wallbox-Sollwert, Iststrom und Maximalstrom werden getrennt behandelt.
- Ein Wallbox-Befehl wird erst nach der Rückmeldung des Geräts als bestätigt gewertet.
- Das PV-Überschussladen des Elektroautos nutzt steigenden Überschuss direkt und reagiert richtig, wenn andere Verbraucher Leistung benötigen.
- Die Tageszusammenfassung der Benachrichtigungen bezieht sich auf den abgeschlossenen Vortag.
- Bei mehreren Speichern bricht die Planung nicht mehr ab, wenn Netzladen deaktiviert ist (`SolverConfig object has no field "grid_charge_enabled"`).
- Nicht-kritische Benachrichtigungen werden nicht mehr bei jedem einzelnen kurzen Problem gesendet.

Das vollständige [Änderungsprotokoll](hemsight/CHANGELOG.md) steht im Add-on-Ordner.

## Installation

Zwei Wege, beide holen dasselbe fertige Programm aus der GitHub-Container-Registry.

### In Home Assistant

1. Einstellungen → Apps → App installieren
2. Oben rechts das Dreipunkt-Menü → Repositories
3. `https://github.com/Markus660/hemsight` eintragen und hinzufügen
4. HEMSight taucht als neue Karte auf. Installieren, starten, fertig.

Danach liegt es in deiner Home-Assistant-Oberfläche hinter deinem HA-Login. Kein eigener
Port, kein zweites Passwort.

### Mit Docker

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Markus660/hemsight/main/install.sh)"
```

Ein Befehl. Er prüft, ob Docker bereit ist, legt den Ordner `hemsight` an, holt die
Compose-Datei, zieht die Abbilder und startet. Am Ende steht die fertige Adresse da. Ist der
übliche Port schon belegt, weicht er auf den nächsten freien aus und sagt es dir.

Läuft schon eine Installation im Ordner, aktualisiert derselbe Befehl sie – dein `data/`
bleibt unangetastet. Zum Aktualisieren also einfach noch einmal ausführen.

Wer lieber sieht, was passiert, macht es von Hand; das
[Skript](install.sh) tut nichts anderes:

```bash
mkdir hemsight && cd hemsight
curl -fsSLO https://raw.githubusercontent.com/Markus660/hemsight/main/compose.yaml
docker compose up -d
```

Dann im Browser auf `http://<deine-adresse>:18081`. Den Rest macht der Assistent beim ersten
Aufruf, dort vergibst du auch dein Passwort.

Auf einem Linux-Server, im LXC-Container oder in einer VM läuft genau derselbe Weg. Für
EEBus-Geräte kommt noch `docker compose --profile eebus up -d` dazu.

Deine Einstellungen landen in `data/` neben der `compose.yaml`, bei der Home-Assistant-App
unter `/data`. Das Verzeichnis gehört in deine Sicherung.

Zum Aktualisieren genügt `docker compose pull && docker compose up -d` – die Compose-Datei
holt von sich aus die neueste Ausgabe, die Datei selbst musst du nicht noch einmal
herunterladen.

Wer auf einer bestimmten Ausgabe bleiben will oder den Schlüssel für die verschlüsselten
Zugangsdaten selbst vergeben möchte, legt daneben eine `.env` an; die Vorlage mit allen
Erklärungen liegt [hier](.env.example). Nötig ist sie nicht. Steht dort schon eine
Versionsnummer aus einer früheren Installation, bleibst du darauf stehen, bis du die Zeile
änderst oder entfernst.

## Tester gesucht!

Das Handbuch mit allem, was man einstellen kann, steht auf **https://hemsight.de**.

Schick mir bitte jede Rückmeldung direkt in der App über den Reiter *Bug / Feedback* – ob
etwas läuft und vor allem, wenn etwas nicht läuft. Da hängt eine Diagnose dran, mit der ich
meistens sehe, woran es liegt. Kommst du gar nicht so weit, mach hier ein
[Issue](https://github.com/Markus660/hemsight/issues/new/choose) auf.
