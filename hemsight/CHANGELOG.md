# Changelog

## 0.0.6-beta

### Neu

- Der Strompreis kann jetzt aus jedem Home-Assistant-Sensor kommen – mit eigener Einheit und, wenn die Entity eine ganze Preisliste führt, mit frei benannten Feldern für Start, Ende und Preis.

- Eigene Preislisten lassen sich als CSV- oder JSON-Datei einlesen – ohne Konto, URL oder Schlüssel. Jede verworfene Zeile wird mit Nummer und Grund genannt, bevor gespeichert wird.

- Ostrom wird jetzt mit dem eigenen Kundenzugang aus dem Ostrom-Entwicklerportal angebunden, statt mit Abruf-URL und Token.

- HEMSight plant jetzt auch ohne Hausspeicher – eine PV-Anlage mit Wallbox oder nur schaltbaren Verbrauchern bekommt einen vollwertigen Plan.

### Verbessert

- E-Auto-Nachtladen wird über die Lademodus-Wahl aktiviert statt über einen eigenen Schalter; bestehende Einstellungen werden verlustfrei übernommen.

- Die Phasenwahl beim E-Auto-Laden (automatisch, einphasig, dreiphasig) wirkt jetzt auf Vorschau, geplanten Fahrplan und Live-Steuerung.

- Börsenpreise ohne Aufschläge verschieben jetzt ebenfalls Wallbox, Speicher und flexible Verbraucher in die günstigen Stunden und werden sichtbar als „ohne Aufschläge" geführt. Nur das Netzladen bei negativen Preisen verlangt weiterhin den echten Endpreis.

- Ein Zeitraum ohne Preis wird als „kein Preis" geführt statt als 0 ct/kWh – vorher war das für den Optimierer die Einladung, alles genau dann laufen zu lassen.

- Übersicht und Minutenoptimierung nennen jetzt einzeln, warum HEMSight noch nicht steuert, und führen direkt zu der Einstellung, die es löst.

- Der Optimierer startet mit einer gesicherten Lösung – ein Planlauf ganz ohne Ergebnis wird damit deutlich unwahrscheinlicher.

- Ein sofortiger Planlauf wird nur noch von echten Ereignissen ausgelöst (Auto eingesteckt, Ladeeinstellung geändert, Verbraucher vorbereitet) – nicht mehr von jeder Preis- oder Wetteraktualisierung.

- Geplante Startzeiten flexibler Verbraucher springen nicht mehr von Planlauf zu Planlauf.

- Die Meldung „Verschoben" nennt jetzt die neue Startzeit und kommt nur, wenn sich wirklich etwas verschiebt.

- Das Betriebslog nennt den Ausbaustand der Anlage: was geplant wurde und was mangels Gerät entfallen ist.

- Bei veralteten Gerätewerten benennt der Plan Gerät und betroffene Werte statt eines allgemeinen Hinweises.

- Ein Verbraucher, der sein Tagessoll erfüllt hat, zeigt „heute erledigt" statt „nicht vorbereitet".

- Die Laufzeitanzeige auf Geräte- und Verbraucherkarte zeigt, was das gewählte Laufmodell wirklich vorgibt.

- Die Geräteanbindungen laufen auf aktuellen Herstellerbibliotheken (Tesla, Viessmann, Kia/Hyundai, Renault, Polestar, Midea, Modbus, Anker Solix) – der Funktionsumfang bleibt gleich.

- Die Anleitung zur Sigenergy-Anbindung erklärt jetzt die Anlagen-Adresse und was ein erfolgreicher Verbindungstest bedeutet.

### Behoben

- Zwei ungleiche Speicher – andere Kapazität, anderer Ladestand, andere obere Grenze – machten den Plan unmöglich; die Anlage bekam gar keinen Plan.

- Ein Speicher mit erhöhter Untergrenze (10, 15 oder 20 %) machte den Plan unmöglich, sobald die Hauslast unter der Entladeleistung lag.

- Ein Speicher, der keinen Ladestand meldet, legte die ganze Anlage still – jetzt läuft die Planung ohne ihn weiter und der Ausfall wird benannt.

- Kein falscher „Batterievorzeichen unbestimmt"-Hinweis mehr bei getrennten Lade- und Entladekanälen oder bei einem über eine Integration angebundenen Speicher.

- Eine Sigenergy-Anbindung ohne Batteriewerte gilt nicht mehr als „verbunden".

- Ein schaltbarer Verbraucher hält seine eingestellte Tageslaufzeit jetzt wirklich ein – bei zwei Blöcken à einer Stunde lief die Poolpumpe vorher rund fünf Stunden.

- Auch ein von Hand gestarteter Lauf zählt auf die Tageslaufzeit.

- Die Pause zwischen zwei Läufen gilt ab dem tatsächlichen Ende des vorigen.

- „Zweimal täglich" ergibt zwei Läufe statt eines doppelt langen.

- Die Anzeige „x von y heute" zählt nur noch echte Läufe.

- Die angezeigte Startzeit eines laufenden Geräts bleibt stehen.

- Ein beendeter Block meldet nicht mehr „Gerät fertig".

- Eine Wetterregel kürzt die Laufzeit jetzt auch im Laufmodell „Tagesbudget", und der Wetterfaktor entsteht je Tag aus der erlaubten Laufzeit statt aus dem ganzen Zeitraum samt Nächten. Wer seine Schwelle nach der alten Rechnung eingestellt hat, sollte sie prüfen – die Regel kürzt ab jetzt tatsächlich.

- Wetterregeln wirken über den ganzen Planungszeitraum, nicht nur über die ersten 48 Stunden.

- Die eigene Wetterprognose reichte einen Kalendertag zu kurz.

- Der Diagnosetext behauptete „nicht unterbrechbar" auch für unterbrechbar konfigurierte Geräte.

- Ein beobachteter Verbraucher wird zeitgenau eingeplant statt als schwache Dauerlast über die ganze Stunde.

- Kalender und Zeitfenster bestimmen die künftige Last, nicht ihre bisherige Häufigkeit.

- Verbraucher, deren Messung über eine Integration statt über einen Home-Assistant-Sensor kommt, tauchen jetzt in der Verwaltung auf und lassen sich bearbeiten und löschen.

- Löschen und Umbenennen lassen keine Gerätebindung mehr zurück.

- Der Einrichtungsassistent überspringt „Live & Sicherheit" nicht mehr still, während die Geräteliste lädt oder ihre Abfrage fehlschlägt.

- Eine frisch eingerichtete Anlage kann ohne Umweg über den Not-Aus steuern.

- „Schreibstopp aktiv" heißt nicht mehr zweierlei – ein nie bestätigter Sicherheitszustand wird als solcher benannt, samt Weg dorthin.

- Der Not-Aus bricht jetzt auch einen bereits laufenden Sendevorgang ab.

- Eine über Home-Assistant-Dienste gesteuerte Wallbox gilt nicht mehr als go-e-Anlage.

- Assistent, Vorflug, Standortsuche und Preislisten-Vorschau sind auf Anlagen ohne Anmeldung – und im Home-Assistant-Add-on – wieder erreichbar.

- „Kein Leistungssensor konfiguriert" erscheint nicht mehr für Geräte, deren Leistung über eine Direktintegration gemessen wird.

- Die Geräteverwaltung unterscheidet Home-Assistant-Rollen von Direktintegrationen und meldet keinen falschen „liefert noch keine Werte"-Hinweis mehr.

- Der Minutenabgleich läuft nach einem Neuplan nicht mehr bis zur nächsten Viertelstunde leer.

- Ab der eingestellten Hausakku-Untergrenze zeigt der Plan das E-Auto im PV-Modus zuverlässig mit dem Sonnenüberschuss statt als aus.

- „Gerät blockiert" nennt den wirklichen Grund, einmal statt viermal je Planlauf.

- Kein Fehlalarm mehr für eine Haushaltsgeräte-Direktanbindung (Home Connect, Miele, Samsung, LG), die gar nicht eingerichtet ist.

- Die Prognosewarnung am Tageswechsel weckt nachts nicht mehr; bis zu einer einstellbaren Uhrzeit (Vorgabe 06:00) gilt der Übergang als erwartbar.

- Eine Benachrichtigung wird bei Lese-, Schreib- oder Absturzfehlern nicht mehr doppelt verschickt.

- Der Fehlerbericht nennt wieder, was die Inbetriebnahme-Prüfung blockiert.

- Ein Messkanal, der versehentlich zwei Verbrauchern zugeordnet ist, wird nur noch einmal gezählt; der Widerspruch wird ausgewiesen.

- Fehlen die Qualitätsangaben der Prognose vollständig, gilt der Plan als wenig vertrauenswürdig statt als voll vertrauenswürdig.

## 0.0.5-beta

### Verbessert

- Löschen ist jetzt sowohl direkt an der jeweiligen Gerätekarte als auch in der aufklappbaren Verwaltung möglich.

- Jede In-App-Feedbackart (Fehler, Wunsch, Idee, Sonstiges) enthält jetzt dasselbe anonymisierte Diagnosepaket (zur besseren Analyse).

- Bei der Docker-Installation reicht zum Aktualisieren jetzt `docker compose pull && docker compose up -d` – die Compose-Datei holt sich selbst die neueste Version, eine feste Versionsnummer muss nicht mehr von Hand nachgezogen werden.

### Behoben

- PV-Ertrag hinter einem DC-gekoppelten Speicher wird jetzt automatisch erkannt und korrekt auf PV-Erzeugung und Hausverbrauch verteilt.

- Die PV-Prognose läuft der Sonne nicht mehr eine Viertelstunde hinterher.

- Die Windgeschwindigkeit der Wetterprognose wird jetzt in der richtigen Einheit gerechnet.

- Tageswerte bleiben beim laufenden Viertelstundenintervall stabil.

- Batterierichtung und abgeleitete Hauslast werden zuverlässig angezeigt.

- PV- und Speicherzuordnungen bleiben beim Öffnen und Speichern vollständig erhalten.

- Laufende Warmwasserblöcke überleben eine Neuplanung.

- Ergebnislose Solverläufe übernehmen nicht mehr die Steuerung.

- Ein zufälliges 30-Sekunden-Solverergebnis blockiert das Speichern der Konfiguration nicht mehr.

- Ein bereits überschrittener Maximal- oder Zielwert blockiert den Betrieb nicht mehr pauschal.

- Der PV-Assistent löscht vorhandene Dachflächen nicht mehr still.

- Nacht-Ladegrenze und PV-Ladeschwelle des Fahrzeugs gelten jetzt zuverlässig für den angezeigten Plan.

- Der zuletzt geöffnete Bereich bleibt im Home-Assistant-Add-on erhalten.

## 0.0.4-beta

### Neu

- Speicherpläne bleiben auch bei konfigurierten Ladeprofilen sauber steuerbar – Überschuss wird korrekt exportiert oder abgeregelt, Netzbezug neu berechnet.

- Probleme mit der Datenlage (abgelehnte Zugangsdaten, tote Quelle, fehlender Sensor) melden sich jetzt als eigene Benachrichtigung statt im Log unterzugehen.

- Flexible Verbraucher lassen sich direkt auf der Betriebsseite an- und ausschalten.

### Verbessert

- Das Betriebslog zeigt jeden Hinweis einzeln, übersetzt und nach Dringlichkeit sortiert.

- Die Preisseite zeigt jetzt den wirklich hinterlegten Zugang, statt fälschlich „kein Token" zu melden.

- Ausgefallene Temperatur- oder Wetterdaten der Verbrauchsprognose werden jetzt angezeigt statt versteckt.

### Behoben

- Ein abgelehntes Speichern im Assistenten nennt jetzt überall den Grund und das betroffene Feld.

- Ein leer gelassenes Zahlenfeld wird nicht mehr als 0 gespeichert.

- Der Preisschritt zeigt nach einem Moduswechsel wieder den eigenen gespeicherten Preis.

- Kurze Datenaussetzer lösen erst beim zweiten Mal eine Meldung aus, nicht mehr sofort nachts.

- Kia UVO / Hyundai Bluelink klopft nach abgelehnter Anmeldung nicht mehr alle fünf Minuten an.

- Spülmaschine und Waschmaschine melden bei langen Programmen wieder „fertig" statt „Laufzeit überschritten".

- Eine wiederholte Meldung blockiert nicht mehr das ganze Stundenkontingent.

- Ein Zugangsbefund erscheint jetzt am Schritt im Assistenten, der ihn beheben kann.

- Ein fertiges Gerät meldet sich nur noch einmal.

- Ein einzelner überschriebener Zugang wirft eine eingerichtete Anlage nicht mehr in die Einrichtung zurück.

- Ein überschriebener Zugang wird benannt und kann nicht mehr versehentlich entstehen.

- Ein einzelner überschriebener Zugang blockiert nicht mehr die gesamte Zugangsdaten-Umstellung beim Start.

- Fällt Home Assistant beim Standort-Abruf aus, wird das jetzt gemeldet.

- Bestätigte Geräteabschlüsse werden zuverlässig einmal gemeldet.

- Die Übersicht zeigt die gemessene Hauslast und aktualisiert Tageswerte ohne Planlauf.

- Der Assistent behält Einstellungen jetzt auch bei wiederholten Durchläufen.

- Ein beschädigter Plan-Lauf legt die Instanz nicht mehr komplett lahm.

- Fehler aus Home Assistant erscheinen übersetzt statt als englischer Rohtext.

- Ein nicht lesbarer Kalender einer planbaren Last wird jetzt auch auf dem lernenden Weg richtig gemeldet.

## 0.0.3-beta

### Neu

- Netzbezug lässt sich jetzt hart begrenzen – die Grenze wird im Plan eingehalten, dazu ein neues Panel für Preis und Tarif.

- Warmwasser-Grenzwerte werden zuverlässig eingehalten, egal ob im Plan oder in der direkten Live-Steuerung.

- Neue Sensoren werden beim Einrichten automatisch mit den letzten 14 Tagen aus Home Assistant befüllt – die Lastprognose muss nicht mehr bei null anfangen.

- Speicher mit getrennten Lade- und Entlade-Eingängen (statt einem vorzeichenbehafteten Sollwert) lassen sich jetzt vollständig steuern, inklusive eigenem Einrichtungsdialog.

- HEMSight merkt sich ab sofort, was es wann vorhergesagt hat – inklusive Wetterlauf und Rechengrundlage. Damit lässt sich die Treffgenauigkeit auch für Tage in der weiteren Zukunft nachvollziehen.

### Verbessert

- Aufgeräumter HA-Sensor-Katalog – nicht mehr benötigte Sensoren werden automatisch entfernt.

- Im Plan steht jetzt, warum ein Preisblock als vertrauenswürdig gilt oder nicht.

- **Die Übersicht zeigt jetzt echte Tageswerte statt Plansummen.** Bisher kamen Netzbezug, Kosten und Export für 48 oder 72 Stunden aus dem Plan – jetzt stehen dort die gemessenen Werte des laufenden Tages, dazu Exporterlös, geladene EV-Menge, PV-Ertrag und wohin er geflossen ist. Aus dem Plan kommen nur noch die Prognosen für PV und Hauslast, und die jetzt für den ganzen Tag statt nur ab jetzt. „Nächste Aktion" und „Batterie Soll" sind dafür von der Übersicht verschwunden, die Kacheln stehen jetzt zweispaltig neben dem Bild. Der volle Planungszeitraum bleibt auf der Planseite.

- Der Assistent warnt jetzt, wenn für die PV-Prognose kein Ersatz vorhanden ist.

- Die PV-Prognose wird jetzt auch für die Folgetage aufgezeichnet, nicht nur für heute.

- Der Fehlerbericht deckt wieder mehrere Tage ab statt nur ein paar Stunden.

- Abgelehnte Schreibvorgänge tauchen jetzt im Fehlerbericht auf.

- Ein Hinweis erscheint, wenn der gebundene Gesamtverbrauch die Ladeleistung offensichtlich nicht mit einschließt.

- Die Zustandsanzeige erklärt im Klartext, was los ist – vorher stand nur die betroffene Komponente da.

### Behoben

- EV, Akku und geplante Verbraucher hielten die Netzbezugsgrenze zwischen zwei Planläufen nicht mehr ein.

- EV-Vorschau und Hauptplanung trafen bei Preis-, Netzbezugs- und Ladezeit-Randfällen unterschiedliche Entscheidungen; Sperrgründe erschienen als Rohcode statt in der eingestellten Sprache.

- Speicher- und Wärmepläne hielten ihre Gerätegrenzen in Randfällen nicht ein.

- Unbelastbare Preisquellen konnten den Plan fehlleiten.

- Große PV- oder Negativpreislasten konnten einen unlösbaren Plan erzeugen.

- EV-Haltezeiten und der verbleibende Solver-Rest wurden zu klein ausgewiesen.

- Ein Speicher mit nur einer Lade- oder Entladeentität wurde stillschweigend außer Betrieb gesetzt.

- Zusatzlasten bei Negativpreisen konnten auch außerhalb eines vollständigen, vertrauenswürdigen Preisfensters starten.

- Ein Hybrid-Wechselrichter fehlte in der Wechselrichter-Liste der Betriebsseite, obwohl er längst eingerichtet war.

- Vorentlade-Verbraucher liefen auch dann, wenn die entnommene Energie hinterher nicht wieder in den Akku zurückfloss.

- Der Basislast-Abzug einer planbaren Last griff bei bestimmten Namen ins Leere.

- Deferrables fielen bei einem eigenen Basislast-Sensor komplett aus der Prognose.

- Die Kalibrierung der externen PV-Prognosequelle hatte nie gewirkt.

- Die EV-Projektion nutzt jetzt bevorzugt die direkte Fahrzeugtelemetrie.

- Hängende Aktualisierungsanfragen bei Kia-Fahrzeugen konnten die Integration dauerhaft blockieren.

- Benachrichtigungen für Starts am nächsten Tag gingen verloren.

- Die Fronius-Integration lieferte wegen zwei falsch geschriebener Endpunkte keine Werte mehr.

- Geräteadressen dürfen jetzt mit `http://` eingetragen werden.

- Ein fehlgeschlagener Verbindungstest nennt jetzt den Grund statt nur „fehlgeschlagen".

- Der Systemzustand zeigte gestörte Integrationen teils als „normal" an.

- Der Hinweistext zu eingeschränkten Integrationen behauptete fälschlich, das Gerät antworte zumindest teilweise.

- Eine fehlgeschlagene Übermittlung des Fehlerberichts nennt jetzt den Grund.

- Ein Rate-Limit einer Integration wurde übersehen, wenn die Integration sich selbst als in Ordnung meldete.

- Tageswerte am Tag der Zeitumstellung galten fälschlich als unvollständig.

- Ein einziger ungültiger Altwert in der Konfiguration blockierte jedes weitere Speichern; jetzt wird das betroffene Feld benannt und lässt sich gezielt zurücksetzen.

- Ein Basislast-Sensor ohne Werte meldete sich nicht – HEMSight wich still auf die eigene Aufzeichnung aus.

- „Prognose beruht auf wenigen Tagen" stand dauerhaft da, auch nach Monaten Aufzeichnung.

- In der letzten Viertelstunde eines Tages meldete die Übersicht fälschlich „Plan veraltet".

- Nicht schreibbare Steuerfelder eines Speichers verschwanden beim Speichern kommentarlos.

- Ein per Skript gesteuerter Speicher verlor beim erneuten Speichern seinen Aufrufaufbau.

- Ohne gewählten Automatikmodus schrieb HEMSight fälschlich „manual" in den Speicher.

- Eine Modus-Zuordnung ohne Zielfeld wird jetzt abgewiesen, statt stillschweigend nichts zu schalten.

- Beim blockierten Speichern verschwand der eigene Tippfehler, wenn dasselbe Feld schon vorher ungültig war.

- Nach einer Feldreparatur verschwand der Hinweis, dass der neue Wert erst nach einem Neustart gilt.

- Der Historien-Import erfand für den laufenden Tag teilweise Messpunkte.

- Ein nicht erreichbarer Home-Assistant-Recorder blockierte den Import älterer Tage.

- Adressen im Steuerpfad (Wallbox, Modbus) wurden nicht so bereinigt wie im Lesepfad.

- Ein fehlgeschlagenes Speichern nennt jetzt den Grund statt nur einer allgemeinen Fehlermeldung.

- Der Energiefluss auf der Übersicht rechnete die Wallbox-Ladeleistung doppelt aus dem Hausverbrauch heraus.

- War nur „Hausverbrauch ohne E-Auto" gebunden, zeigte der Haus-Knoten im Energiefluss keine Zahl.

- Der Ersatzwert für die nutzbare Speicherkapazität ließ sich nicht dauerhaft speichern.

- „Home Assistant ist noch nicht verbunden" erschien, obwohl die Verbindung stand.

- „Rolle fehlt" erschien für einen Netzzähler, der korrekt als Integration eingetragen war.

- Das Nachtladen konnte den Hausspeicher unter die eingestellte Entladesperre entladen.

- Änderungen vor vollständig geladenen Einstellungen konnten ungewollt alle Werte auf die Vorgabe zurücksetzen.

- Die PV-Prognose fiel komplett aus, wenn Home Assistant beim Prognoselauf nicht antwortete.

- Ein Hinweis der Zustandsanzeige konnte einen echten Gerätefehler verdecken.

## 0.0.2-beta

### Neu

- Fronius Wattpilot ist jetzt als direkte Integration verfügbar.

- Für Fahrzeuge können über Home Assistant zusätzlich Ladestatus, Steckerstatus und Ist-Ladestrom hinterlegt werden – etwa mit TeslaMate-MQTT-Sensoren.

### Verbessert

- Wallbox-Sollwert, Iststrom und Maximalstrom werden getrennt behandelt.

- Ein Wallbox-Befehl wird erst nach der Rückmeldung des Geräts als bestätigt gewertet.

- Das PV-Überschussladen des Elektroautos nutzt steigenden Überschuss direkt und reagiert richtig, wenn andere Verbraucher Leistung benötigen.

- Die Tageszusammenfassung der Benachrichtigungen bezieht sich auf den abgeschlossenen Vortag.

### Behoben

- Bei mehreren Speichern bricht die Planung nicht mehr ab, wenn Netzladen deaktiviert ist (`SolverConfig object has no field "grid_charge_enabled"`).

- Nicht-kritische Benachrichtigungen werden nicht mehr bei jedem einzelnen kurzen Problem gesendet.

## 0.0.1-beta

Beta-Start.
