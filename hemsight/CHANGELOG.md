# Changelog

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
