# Changelog

## 0.0.5-alpha

- Der Tariftest prüft jetzt die tatsächlich konfigurierte Preisquelle und ihren aktuellen Livewert.
- Fahrzeuge bleiben nach dem Speichern sichtbar; weitere Fahrzeuge und die Navigation zurück sind eindeutig erreichbar.
- TRV-Einrichtung und Bereitschaftshinweise führen wieder weiter und nennen das konkret betroffene Gerät.
- Programmgeräte verlangen einen echten Startknopf oder eine direkte Geräteanbindung statt eines reinen Stromschalters.
- Home-Assistant- und Webhook-Benachrichtigungen können vollständig im Einrichtungsassistenten angelegt werden.
- Beispielwerte, PV-Dachflächen, EV-Schwellen und Auswahlkarten sind verständlicher und eindeutig dargestellt.
- Die automatische Akku-Vorzeichenerkennung nutzt die gemessene Energiebilanz.
- Der Werksreset ist als eigener Bereich in den HEMSight-Einstellungen erreichbar.

## 0.0.4-alpha

- Der Einrichtungsassistent funktioniert nun vollständig über den Home-Assistant-Ingress.
- Die Standortauswahl verwendet eine eindeutige Länderliste und übernimmt das in Home Assistant eingestellte Land.
- Tarifänderungen werden im Assistenten gemeinsam gespeichert; ein Festpreis bleibt als zuverlässiger Rückweg verfügbar.
- Protokollstufe und HTTP-Zugriffsprotokoll können in den App-Einstellungen gewählt werden.
- Ein Werksreset kann in HEMSight zweistufig bestätigt werden und lässt Home-Assistant-Daten unangetastet.
