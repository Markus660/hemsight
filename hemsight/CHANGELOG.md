# Changelog

## 0.0.6-alpha

- Der Einrichtungsassistent wurde in neun Durchläufen am echten Home-Assistant-Ingress überarbeitet und abgenommen.
- Angemeldete Integrationen liefern Ladestand, Leistung und Erzeugung von selbst; die Werte müssen nicht mehr von Hand zugeordnet werden.
- Vorschlagslisten zeigen alle passenden Geräte, auch ausgeschaltete — Backöfen, Spül- und Waschmaschinen melden sich erst beim Einschalten.
- Ohne Photovoltaik ist der Plan gültig statt blockiert; ohne Netzzähler bleibt er nutzbar und sagt, was fehlt.
- Nach dem Abschluss des Assistenten wird sofort ein Plan gerechnet, statt auf den nächsten Anlass zu warten.
- Die Außentemperatur für die Lastprognose holt HEMSight auf Wunsch selbst, auch ohne eigenen Sensor.
- Schaltbare Verbraucher wie Backöfen lassen sich bei negativen Preisen steuern und melden ihren Zustand zurück.
- Das Protokoll zeigt Zeitstempel in der eigenen Zeitzone, und die gewählte Stufe gilt für alle Meldungen — auch die der Geräteanbindungen.
- Ein frisch installiertes System startet ohne erfundene Beispielgeräte und ohne voreingestellten Kalender.
- Thermostate liefern Temperatur und Luftfeuchte gemeinsam; Wallboxen und Hausgeräte mit Zustandstexten werden richtig erkannt.
- Alle Geräte- und Dienstanbindungen laufen auf dem aktuellen Stand ihrer Bibliotheken.

## 0.0.5-alpha

- Der Tariftest prüft jetzt die tatsächlich konfigurierte Preisquelle und ihren aktuellen Livewert.
- Fahrzeuge bleiben nach dem Speichern sichtbar; weitere Fahrzeuge und die Navigation zurück sind eindeutig erreichbar.
- TRV-Einrichtung und Bereitschaftshinweise führen wieder weiter und nennen das konkret betroffene Gerät.
- Programmgeräte verlangen einen echten Startknopf oder eine direkte Geräteanbindung statt eines reinen Stromschalters.
- Home-Assistant- und Webhook-Benachrichtigungen können vollständig im Einrichtungsassistenten angelegt werden.
- Beispielwerte, PV-Dachflächen, EV-Schwellen und Auswahlkarten sind verständlicher und eindeutig dargestellt.
- Die automatische Akku-Vorzeichenerkennung nutzt die gemessene Energiebilanz.
- Der Werksreset ist als eigener Bereich in den HEMSight-Einstellungen erreichbar.
- Die Demo zeigt Gerätenamen und Batteriegründe vollständig in der gewählten Sprache statt als englische Namen oder technische Codes.

## 0.0.4-alpha

- Der Einrichtungsassistent funktioniert nun vollständig über den Home-Assistant-Ingress.
- Die Standortauswahl verwendet eine eindeutige Länderliste und übernimmt das in Home Assistant eingestellte Land.
- Tarifänderungen werden im Assistenten gemeinsam gespeichert; ein Festpreis bleibt als zuverlässiger Rückweg verfügbar.
- Protokollstufe und HTTP-Zugriffsprotokoll können in den App-Einstellungen gewählt werden.
- Ein Werksreset kann in HEMSight zweistufig bestätigt werden und lässt Home-Assistant-Daten unangetastet.
