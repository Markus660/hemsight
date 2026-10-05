# Changelog

Jede Version steht zuerst auf Deutsch, darunter auf Englisch.
Each version appears in German first, followed by English.

## 0.0.16-beta

### Wichtig

#### System

- Der Verlaufsspeicher wird beim ersten Start nach dem Update umgebaut und braucht danach deutlich weniger Platz. Das läuft im Hintergrund, HEMSight arbeitet normal weiter. Schlägt der Umbau fehl, bleibt die alte Ablage in Betrieb.

#### Wallbox

- Ein gespeichertes „Aus“ der Wallbox wird beim Update zu „Fremdsteuerung“. Das Verhalten bleibt gleich.

#### §14a

- Ein §14a-Satz mit Zeitfenstern verlangt jetzt die Standardstufe deines Preisblatts. Fehlt sie, bleibt Modul 3 aus, bis du sie nachträgst.

### Neu

#### Wallbox

- Neuer Lademodus „Fremdsteuerung“: Steuert ein anderer Anbieter wie z. B. Tibber mit SmartCharging das Laden, lässt HEMSight die Wallbox in Ruhe. Der Assistent bietet den Modus an und erklärt ihn.
- Ohne gemessene Ladeleistung lassen sich „Fremdsteuerung“ und „Preis“ nicht mehr neu wählen. Fehlt sie einer bestehenden Wallbox, führt die Einrichtung gleich zum Nachtragen.

#### Speicher

- Im EV-Lademodus „Fremdsteuerung“ versorgt der Hausakku nur noch das Haus, nicht mehr das Auto, auch wenn der Plan fehlt. Das gilt für jeden steuerbaren Speicher.
- Das Journal zeigt bei jedem Takt der Speicherregel, mit welchen Werten sie entschieden hat. Reißt der Netzbezug während einer fremden Ladung die Grenze, steht dazu ein Befund da.

#### Preise

- Octopus Energy Deutschland ist als Preisquelle wählbar, auch mit dem dynamischen Tarif für Smart Meter.
- HEMSight erkennt selbst, ob die §14a-Staffel schon im Lieferantenpreis steckt. Du kannst es beim Strompreis auch festlegen: „automatisch messen“, „Staffel ist enthalten“ oder „Staffel fehlt“.
- Fehlt das Preisblatt deines Netzbetreibers für ein Jahr, zeigt HEMSight einen Hinweis. Vorher rechnete es still mit dem Vorjahr weiter.

#### §14a

- Die Einstellungen nehmen die Werte deines Preisblatts je Kalenderjahr auf. Ein neues Jahr überschreibt kein altes, und vorhandene Werte lassen sich ins nächste Jahr kopieren.

### Verbessert

#### Wallbox

- Die openWB-Vorlage fragt nach API-Version, Ladepunkt und Port, die Easee-Vorlage nach der E-Mail. Bestehende Anlagen werden beim Start einmal umgezogen.
- Bei Integrationen, die die Ladeleistung nicht selbst liefern, ordnest du jetzt immer einen Messwert zu.

#### Speicher

- Die Einstellung „Netzladen-vor-PV-Strafe“ entfällt. Der Speicher lädt dafür nicht mehr über seinen Bedarf hinaus voll.

#### Preise

- Die Ersparnis aus §14a Modul 2 wird am Zähler des Geräts gemessen. Dafür ordnest du den Zähler in den §14a-Einstellungen zu.
- Die Hilfe beschreibt die Jahressätze, die Wahl beim Strompreis und den §14a-Atlas.

#### System

- Planrechnung und Modelltraining bremsen Home Assistant nun weniger aus.
- HEMSight liest Einstellungen deutlich schneller und fragt Home Assistant gezielter ab.
- Ein unverändert blockiertes Gerät steht nicht mehr in jedem Takt im Verlauf.
- Die Leistung ist allgemein etwas besser.

### Behoben

#### Planung

- Ein Planlauf endet früher, wenn keine bessere Lösung mehr kommt. An einem Test sank die Wartezeit von vier auf etwa eineinhalb Minuten, der Plan blieb gleich.
- Der Speicher kauft bei unsicheren Preisprognosen nicht mehr Strom auf Vorrat. Auf einer Anlage lud er 15,6 statt 3,6 kWh aus dem Netz.
- Ein Gerät, das spät vorbereitet wurde, wird am nächsten passenden Tag geplant, statt bis Mitternacht zu blockieren.

#### Speicher

- Der Speicher lädt günstigen Netzstrom auch dann nach, wenn Warmwasser und Geräte ihn später leerziehen würden.
- Bei mehreren Speichern gibt jeder nur seinen Anteil der Hauslast ab. Vorher gaben zwei Speicher zusammen doppelt so viel ab, wie das Haus braucht.
- Der Anker-Speicher bekommt seine Betriebsart nicht mehr bei jedem Planwechsel erneut in die Cloud geschickt. Stehen zwei Anker-Anlagen im Konto, liest HEMSight nur noch die eigene.

#### Wallbox

- openWB 2.x und 1.x liefern wieder Messwerte, ebenso eine Wallbox mit OCPP 2.0.1. Bei openWB, Easee und OCPP erkennt HEMSight die Ladeleistung jetzt als solche.
- Nach dem Ladeende bleibt die Ladeleistung nicht mehr auf dem letzten Wert stehen. Der Akku-Schutz hielt deshalb ein längst beendetes Laden für fremd.
- Beim Aufräumen alter Anbindungen bleibt der Leistungssensor der Wallbox erhalten.

#### Preise

- Der §14a-Netzentgelt-Tarif (Modul 3) wirkt nur noch mit dem Unterschied zum Standardtarif. Die Nachtstunden werden günstiger, die Abendstunden teurer, alle übrigen bleiben, wie der Lieferant sie nennt.
- Die Preisprognose fragt Börsenpreise nicht mehr über das Ende der Auktion hinaus. Das galt auch für die eingebaute Marktquelle.
- Fehlen bei einer Preisquelle die Zugangsdaten, nennt der Befund die Felder. Nach dem Nachtragen liefert die Prognose sofort neu, und der Prüfknopf nennt fehlende Felder, bevor er den Anbieter anruft.

#### Verlauf und Prognose

- Lehnt InfluxDB 3 die Abfrage deines Basislast-Sensors ab, versucht HEMSight es noch zweimal.
- Große Zeitfenster liest HEMSight aus InfluxDB 3 wieder. Bei viel Verlauf kam sonst „0 Zeilen“, obwohl der Sensor über 280 000 Zeilen trug.
- Das Prognoseband einer frischen Anlage hat jetzt eine Breite, der Planer hält auch in den ersten Tagen eine Reserve für unsichere Sonnentage.
- „Plan gegen Ist“ zeigt für vergangene Zeitpunkte den Plan, der damals wirklich galt.

#### Einrichtung

- Ein unterbrochener Einrichtungsassistent lässt sich fortsetzen. Vorher half nur ein neuer Datenordner.
- Ein Benutzername, Passwort oder Token mit Umlauten führt nicht mehr zu einem Serverfehler bei der Anmeldung.
- Der Werksreset arbeitet auch im Docker-Betrieb. Wo er nicht starten kann, nennt er den Grund.
- Beim Speichern meldet HEMSight keine Passwörter mehr als „geändert“, die niemand angefasst hat.

#### Integrationen

- Antwortet Home Assistant nicht, steht das als Fehler da und nicht als lauter unbekannte Geräte.
- Zahlen, die eine Integration als Text liefert, zählen als Messwert.
- Tibber Pulse: Ein beschädigtes Telegramm der Bridge lässt den Netzzähler nicht mehr ausfallen, und ein Zählerstand ohne Einheit Wh erscheint nicht mehr um den Faktor 1000 zu groß.
- Per MQTT kommen die Attribute der PV-Prognosesensoren jetzt in Home Assistant an.

### Important

#### System

- The history storage is rebuilt on the first start after the update and needs much less space afterwards. This runs in the background, HEMSight keeps working normally. If the rebuild fails, the old store stays in use.

#### Wallbox

- A saved „Off“ of the wallbox becomes „External control“ with the update. The behavior stays the same.

#### §14a

- A §14a set with time windows now requires the standard tier of your price sheet. If it is missing, module 3 stays off until you add it.

### New

#### Wallbox

- New charging mode „External control“: if another provider such as Tibber with SmartCharging controls the charging, HEMSight leaves the wallbox alone. The assistant offers the mode and explains it.
- Without a measured charging power, „External control“ and „Price“ can no longer be newly selected. If an existing wallbox lacks it, the setup leads you straight to adding it.

#### Storage

- In the EV charging mode „External control“, the home battery only supplies the house, no longer the car, even if the plan is missing. This applies to every controllable storage unit.
- The journal shows at every cycle of the storage rule which values it decided with. If the measured grid draw exceeds the limit during an external charge, a finding is recorded for it.

#### Prices

- Octopus Energy Germany can be selected as a price source, also with the dynamic tariff for smart meters.
- HEMSight detects on its own whether the §14a tier scheme is already included in the supplier price. You can also set it at the electricity price: „measure automatically“, „tier scheme is included“ or „tier scheme is missing“.
- If the price sheet of your grid operator is missing for a year, HEMSight shows a notice. Before, it silently kept calculating with the previous year.

#### §14a

- The settings take the values of your price sheet per calendar year. A new year does not overwrite an old one, and existing values can be copied to the next year.

### Improved

#### Wallbox

- The openWB template asks for the API version, charge point and port, the Easee template for the email address. Existing installations are migrated once at start.
- For integrations that do not deliver the charging power themselves, you now always assign a measured value.

#### Storage

- The setting „Grid charging before PV penalty“ is removed. In return, the storage no longer charges beyond its need.

#### Prices

- The saving from §14a module 2 is measured at the device's meter. For this you assign the meter in the §14a settings.
- The help describes the annual rates, the choice at the electricity price and the §14a atlas.

#### System

- Plan calculation and model training slow down Home Assistant less.
- HEMSight reads settings much faster and queries Home Assistant more selectively.
- A device that stays blocked no longer appears in the history at every cycle.
- Performance is slightly better overall.

### Fixed

#### Planning

- A planning run ends earlier when no better solution is coming. In one test the waiting time dropped from four to about one and a half minutes, the plan stayed the same.
- The storage no longer buys electricity in advance when price forecasts are uncertain. On one installation it charged 15.6 instead of 3.6 kWh from the grid.
- A device that was prepared late is planned for the next suitable day instead of being blocked until midnight.

#### Storage

- The storage also recharges cheap grid power when hot water and appliances would drain it later.
- With several storage units, each one only gives its share of the house load. Before, two units together gave twice as much as the house needs.
- The Anker storage no longer has its operating mode sent to the cloud again at every plan change. If two Anker systems are in the account, HEMSight only reads its own.

#### Wallbox

- openWB 2.x and 1.x deliver measured values again, as does a wallbox with OCPP 2.0.1. For openWB, Easee and OCPP, HEMSight now recognizes the charging power as such.
- After charging ends, the charging power no longer stays at the last value. Because of that, the battery protection took a long-finished charge for a foreign one.
- When old connections are cleaned up, the power sensor of the wallbox is kept.

#### Prices

- The §14a grid fee tariff (module 3) only applies the difference to the standard tariff. The night hours get cheaper, the evening hours more expensive, all others stay as the supplier states them.
- The price forecast no longer requests exchange prices beyond the end of the auction. This also applied to the built-in market source.
- If a price source lacks its credentials, the finding names the fields. After you add them, the forecast updates immediately, and the test button names missing fields before it calls the provider.

#### History and forecast

- If InfluxDB 3 rejects the query for your base load sensor, HEMSight tries twice more.
- HEMSight reads large time windows from InfluxDB 3 again. With a lot of history it otherwise returned „0 rows“, although the sensor carried over 280,000 rows.
- The forecast band of a fresh installation now has a width, and the planner keeps a reserve for uncertain sunny days even in the first days.
- „Plan versus actual“ shows, for past points in time, the plan that was really valid then.

#### Setup

- An interrupted setup assistant can be resumed. Before, only a new data folder helped.
- A username, password or token with umlauts no longer causes a server error at login.
- The factory reset also works in Docker operation. Where it cannot start, it names the reason.
- When saving, HEMSight no longer reports passwords as „changed“ that nobody touched.

#### Integrations

- If Home Assistant does not answer, this is shown as an error and not as lots of unknown devices.
- Numbers that an integration delivers as text count as a measured value.
- Tibber Pulse: a damaged telegram from the bridge no longer makes the grid meter fail, and a meter reading without the unit Wh no longer appears too large by a factor of 1000.
- Via MQTT, the attributes of the PV forecast sensors now arrive in Home Assistant.

## 0.0.15-beta

### Neu

#### Speicher

- Growatt-Hybrid-Wechselrichter (SPH, SPA, MIN, MOD, MID-XH, WIT, WIS) laden und entladen den Speicher jetzt nach dem Plan. HEMSight zeigt, ob die gemessene Leistung folgt. Fällt HEMSight aus, endet die Vorgabe nach drei Minuten am Gerät.
- Growatt NOAH und NEXA lassen sich über die Growatt-Cloud einbinden und steuern, die NEXA auf Wunsch direkt im Heimnetz.
- Mehrere Growatt-Wechselrichter im Heimnetz sind möglich. HEMSight liest jeden einzeln und steuert den, den du im Speicher-Schritt wählst.
- Zendure-Speicher lassen sich nun korrekt steuern: SolarFlow direkt im Heimnetz, Hub, Hyper, AIO, ACE und SuperBase V über den Cloud-Key aus der Zendure-App.
- EcoFlow PowerStream, Stream und PowerOcean lassen sich einbinden und steuern. Ein PowerOcean mit freigeschaltetem Modbus, auch der Ocean 2, wird direkt im Heimnetz gesteuert.
- Hängen mehrere Geräte an einem Konto, wählst du im Speicher-Schritt das richtige. Kann HEMSight ein Gerät nur lesen, legt der Assistent den Speicher als reine Messung an und sagt es dazu.
- Nutzkapazität sowie Lade- und Entladegrenzen übernimmt HEMSight vom Gerät, wo es sie meldet. Planung und Live-Regelung rechnen nie mit mehr, als das Gerät leisten kann.

#### PV-Prognose

- Eine eigene Wetterstation lässt sich im Assistenten und in den Einstellungen einbinden: ein Sensor je Messgröße, und HEMSight prüft beim Auswählen, ob er passt.
- Die PV-Prognose zeigt ihren Lernstand, etwa „Tag 4 von 10 bis zur ersten Karte“.
- Eine eigene Strahlungsmessung wirkt erst auf die Prognose, wenn sie nachweislich besser liegt. Bis dahin läuft sie nur mit, und die technischen Details zeigen den Vergleich.
- Die technischen Details zeigen, wie brauchbar der nachgeladene Verlauf ist: Lücken, falsches Vorzeichen, Zählerstand statt Leistung, Kilowatt statt Watt. Solche Zeiträume lernt die Prognose nicht.

#### Assistent

- Beim Testen eines Messfelds prüft HEMSight, ob die Einheit des Sensors passt. Ein Thermometer als Netzleistung wird nun nicht mehr funktionieren.
- Die Bestätigung der Messquellen warnt, wenn derselbe Sensor als Netzleistung und als PV-Erzeugung eingetragen ist.

### Verbessert

#### Übersicht

- Wer HEMSight nur planen lässt, sieht einen ausblendbaren Hinweis statt eines dauerhaften.

#### PV-Prognose

- Das mitgelieferte Prognosemodell ist genauer und rechnet auf jedem Gerät.
- Die gelernte Schattenkarte lernt nicht mehr an Tagen, die der Wetterdienst mittags als trüb sieht. Dünne Wolken gelten so nicht mehr als Schatten.
- Die kurzfristige Anpassung an die aktuelle Leistung nutzt die Bewölkung aller Wetterdienste statt der eines einzelnen.
- Korrekturen der Wetterdaten, die Gewichtung der Wetterdienste und das Unsicherheitsband gelten nur noch dort, wo sie sich an den Folgetagen als besser erweisen.

#### E-Auto

- Die eingetragene Abfahrt wirkt nur noch im Preisladen. In den anderen Lademodi wird sie gespeichert, aber nicht mehr beachtet.
- Die Grenze „EV PV-Laden ab“ gilt in jedem Lademodus außer Batterieladen. Steht der Hausakku darunter, lädt die Sonne den Hausakku statt des Autos, außer im Preisladen, wenn die Abfahrt drängt. Vorschau, Plan und Live-Regelung rechnen dieselbe Grenze.
- Kopfleiste und Fahrzeugkacheln zeigen die Abfahrt nur noch im Preisladen, und die Begründungen im Plan nennen sie nur dort.

#### Speicher

- Der Speicher-Assistent gibt keine Lade- und Entladegrenze mehr vor. Meldet das Gerät seine Grenzen, stehen sie nach der Gerätewahl in den Feldern, sonst trägst du sie selbst ein.
- Die Einstellungen zeigen den Ladestand-Bereich je Speicher mit dessen eigenen Grenzen.
- Eine bestehende Konfiguration mit Netzladestufen über der Summe der Speicherleistungen lädt nach dem Update weiter. HEMSight streicht diese Stufen und legt die alte Datei als Sicherung ab.

#### Assistent

- Jeder Auswahlschritt hat einen „Weiter“-Knopf: Die Karte wählt, „Weiter“ übernimmt.
- Ohne Preisanbieter ist kein Anbieter mehr vorbelegt.

#### HA-Export

- Die Namen der Exportsensoren folgen der Sprache von Home Assistant.

#### Integrationen

- Anker Solix, Tesla, Kia/Hyundai, Renault, Viessmann, Fronius Wattpilot, Tibber Pulse und weitere Anbindungen laufen auf aktuellen Bibliotheksständen.

#### EEBus

- Der Verbindungsaufbau prüft das Zertifikat der Gegenstelle gegen den vertrauten Fingerabdruck. Wartende Nachrichten gehen vor dem Schließen einer Verbindung noch raus.

### Behoben

#### Planung

- Liegt die erwartete Hauslast über der Netzbezugsgrenze, fällt der Plan nicht mehr aus. HEMSight bezieht dann nur, was das Haus braucht, und zeigt einen Hinweis.
- Ein Plan, der sich nicht lösen lässt, hält den Planlauf nicht mehr minutenlang auf.
- Bei mehreren Speichern plant HEMSight einen, der noch nichts gemeldet hat, nicht mehr mit Ladestand und Kapazität eines anderen. Zwei Speicher derselben Marke bekamen denselben Ladestand, jetzt gilt alles je Speicher.

#### Netzanschluss

- Direkt nach dem Netzzähler fragt der Assistent nach dem Netzanschluss: maximaler Netzbezug als Absicherung (Ampere je Phase) oder in Watt. Dieselbe Eingabe steht in den Einstellungen.

#### Wallbox

- Wechselt HEMSight das Ladeziel, hält es die Hauslast von davor kurz fest. Der eigene Schaltbefehl machte die Messung für Sekunden unbrauchbar, und daraus folgte eine zu hohe Stromstärke.
- Die Notbremse gegen Netzbezug schaltet die Wallbox erst ab, wenn der Bezug zwei Regelrunden lang über der Grenze lag. Vorher blieb die Wallbox abgeschaltet, obwohl die Messung längst wieder 0 W zeigte.
- Über der Grenze „EV PV-Laden ab“ nimmt das Auto den Sonnenüberschuss auch dann, wenn der Hausakku es nicht stützen darf. Vorher lud es dort voll aus dem Netz, während der Hausakku jede Kilowattstunde Sonne bekam.
- Die Sperrzeit für den Phasenwechsel gilt auch über eine Ladepause hinweg. Vorher schaltete HEMSight nach 30 Sekunden trotz Sperre von einer auf drei Phasen um.
- Ändert oder deaktivierst du die OCPP-Anbindung einer Wallbox, gibt HEMSight den Anschluss wieder frei. Vorher blieb der alte Server aktiv, und die Wallbox sprach weiter mit ihm.
- Bei zwei Wallbox-Anbindungen zeigt HEMSight Ist- und Höchststrom nur von der eingestellten Wallbox.
- Jeder Befehl an die Wallbox steht im Verlauf der Live-Steuerung.

#### Steuerung

- Ein Gerät, das HEMSight nicht schreiben kann, lässt sich nicht mehr auf „Steuern“ stellen. Ein früher so gespeichertes steht nach dem Start auf „Planen“, und die Autonomie-Seite nennt den Grund.
- Die Übersicht zeigt keine Gerätegruppen mehr als gesteuert, für die kein Gerät eingerichtet ist.

#### Messwerte

- Sensoren in Kilowatt, Megawatt oder Kilowattstunden rechnet HEMSight jetzt um. Vorher lief ein Sensor mit 1,5 kW als 1,5 W.
- Ist ein Gerät als Netzzähler eingestellt, etwa Tibber Pulse, gilt sein Wert. Vorher konnte der Netzwert eines anderen Geräts ihn übertrumpfen, und die Netzquelle wechselte von Lauf zu Lauf.
- Wie frisch ein Wert ist, misst HEMSight jetzt an dem Gerät, von dem er kommt. Vorher ging eine Außentemperatur, die seit Stunden nicht mehr eintraf, noch als aktuell durch.
- Netz- und Akkuwerte, die ein Gerät von sich aus schickt, etwa Anker Solix über MQTT, kommen mit ihrem echten Zeitpunkt in der Live-Regelung an. Vorher konnten sie über eine Minute alt sein.
- Nach dem Firmware-Update der Tibber-Pulse-Bridge im September liest HEMSight den Netzzähler wieder. Über die Bridge im Heimnetz wird er alle 10 Sekunden abgefragt, und ein Wert gilt nach 30 statt 180 Sekunden als veraltet.
- Der nachgeladene Verlauf rechnet die Hauslast mit demselben Speicher-Vorzeichen wie die laufende Aufzeichnung. Ein seither umgepolter Sensor verdreht ältere Tage nicht mehr.

#### Tibber Pulse

- Die Anbindung ist aktualisiert und funktioniert wieder.

#### PV-Prognose

- Wetterstation und Außentemperatur lernten bei getrennten Datenbanken nie, weil HEMSight den Verlauf in der eigenen statt in der Datenbank von Home Assistant suchte.
- Die gelernte Verschattung einer Wetterstation konnte nie entstehen: Sie braucht 30 Tage Verlauf, gelesen wurden 15.
- Die Wettervorhersage des norwegischen Dienstes bricht nicht mehr nach gut zwei Tagen ab.
- Der Vergleich der Strahlungsprognose mit der Wetterstation stand um eine Viertelstunde versetzt und lernte eine Korrektur, die die Prognose verschlechterte.
- Die Schattenkarte zog den Schatten doppelt ab und fiel im Herbst und nach einem Quellenwechsel zu Unrecht zurück. Nach einem Wechsel der Wetterquellen kalibriert die Prognose ab dem siebten Tag nur noch auf der neuen Quelle.
- Im Modellvergleich sieht das mitgelieferte Modell dieselbe Wettervorschau wie im Betrieb. Vorher konnte es zu Unrecht verlieren.
- Ein kurzer Datenbankausfall löscht die gelernten PV-Modelle nicht mehr.
- Springt die gemessene PV-Leistung dauerhaft auf ein anderes Niveau, etwa weil ein Sensor nach einem Update Kilowatt statt Watt meldet, lernt die Prognose aus diesen Tagen nicht.

#### Tarif

- Festpreis und Börsenpreis lassen sich speichern, ohne dass Zugangsdaten eines Anbieters verlangt werden.

#### Toyota

- Der E-Auto-Status kam nie an: Die Bibliothek fehlte im Abbild, und der Aufruf passte nicht zur aktuellen Version. Ladestand, Ladestatus, Reichweite und Restladezeit kommen jetzt über den heutigen Weg der Bibliothek.

#### Smart

- Smart #1, #3 und #5: Die Bibliothek der Anbindung lag nicht im Abbild und ist jetzt enthalten.

#### Anzeige

- Ein ruhender Speicher zeigt „0 W“ statt „-0 W“.

### New

#### Storage

- Growatt hybrid inverters (SPH, SPA, MIN, MOD, MID-XH, WIT, WIS) now charge and discharge the storage according to the plan. HEMSight shows whether the measured power follows. If HEMSight goes down, the setpoint ends at the device after three minutes.
- Growatt NOAH and NEXA can be connected and controlled over the Growatt cloud, the NEXA directly in your home network if you prefer.
- Several Growatt inverters in the home network are possible. HEMSight reads each one separately and controls the one you pick in the storage step.
- Zendure storage units can now be controlled correctly: SolarFlow directly in the home network, Hub, Hyper, AIO, ACE and SuperBase V over the cloud key from the Zendure app.
- EcoFlow PowerStream, Stream and PowerOcean can be connected and controlled. A PowerOcean with Modbus enabled, including the Ocean 2, is controlled directly in the home network.
- If several devices hang on one account, you pick the right one in the storage step. If HEMSight can only read a device, the assistant creates the storage as a pure measurement and says so.
- HEMSight takes usable capacity and charge and discharge limits from the device where it reports them. Planning and live control never calculate with more than the device can deliver.

#### PV forecast

- Your own weather station can be connected in the assistant and in the settings: one sensor per measured quantity, and HEMSight checks while you select whether it fits.
- The PV forecast shows its learning progress, for example „Day 4 of 10 until the first map“.
- Your own irradiance measurement only affects the forecast once it is demonstrably better. Until then it just runs along, and the technical details show the comparison.
- The technical details show how usable the loaded history is: gaps, wrong sign, a meter reading instead of a power, kilowatts instead of watts. The forecast does not learn from such periods.

#### Assistant

- When testing a measurement field, HEMSight checks whether the sensor's unit fits. A thermometer as grid power will no longer work.
- The confirmation of the measurement sources warns if the same sensor is entered as grid power and as PV generation.

### Improved

#### Overview

- If you only let HEMSight plan, you see a dismissible notice instead of a permanent one.

#### PV forecast

- The bundled forecast model is more accurate and runs on every device.
- The learned shading map no longer learns on days the weather service sees as overcast at noon. Thin clouds no longer count as shade.
- The short-term adjustment to the current power uses the cloud cover of all weather services instead of a single one.
- Weather data corrections, the weighting of the weather services and the uncertainty band only apply where they prove better on the following days.

#### Electric car

- The entered departure time now only applies in price charging. In the other charging modes it is saved but no longer taken into account.
- The limit „EV PV charging from“ applies in every charging mode except battery charging. If the home battery is below it, the sun charges the home battery instead of the car, except in price charging when the departure is pressing. Preview, plan and live control calculate the same limit.
- Header bar and vehicle tiles show the departure only in price charging, and the reasons in the plan mention it only there.

#### Storage

- The storage assistant no longer presets a charge and discharge limit. If the device reports its limits, they appear in the fields after you pick the device, otherwise you enter them yourself.
- The settings show the charge level range per storage unit with its own limits.
- An existing configuration with grid charging steps above the sum of the storage powers keeps charging after the update. HEMSight removes these steps and keeps the old file as a backup.

#### Assistant

- Every selection step has a „Next“ button: the card selects, „Next“ confirms.
- Without a price provider, no provider is preselected any more.

#### HA export

- The names of the export sensors follow the language of Home Assistant.

#### Integrations

- Anker Solix, Tesla, Kia/Hyundai, Renault, Viessmann, Fronius Wattpilot, Tibber Pulse and other integrations run on current library versions.

#### EEBus

- The connection setup checks the counterpart's certificate against the trusted fingerprint. Queued messages still go out before a connection is closed.

### Fixed

#### Planning

- If the expected house load is above the grid draw limit, the plan no longer fails. HEMSight then draws only what the house needs and shows a hint.
- A plan that cannot be solved no longer holds up the planning run for minutes.
- With several storage units, HEMSight no longer plans one that has not reported anything yet with the charge level and capacity of another. Two storage units of the same brand got the same charge level, now everything applies per unit.

#### Grid connection

- Right after the grid meter, the assistant asks for the grid connection: maximum grid draw as a fuse rating (amperes per phase) or in watts. The same input is in the settings.

#### Wallbox

- When HEMSight switches the charging target, it briefly holds the house load from before. Its own switching command made the measurement useless for seconds, and a current that was too high followed.
- The emergency brake against grid draw only switches the wallbox off when the draw was above the limit for two control rounds. Before, the wallbox stayed off although the measurement showed 0 W again long ago.
- Above the limit „EV PV charging from“, the car takes the solar surplus even when the home battery may not support it. Before, it charged fully from the grid there while the home battery got every kilowatt hour of sun.
- The lock time for phase switching also applies across a charging pause. Before, HEMSight switched from one to three phases after 30 seconds despite the lock.
- If you change or deactivate the OCPP connection of a wallbox, HEMSight frees the port again. Before, the old server stayed active and the wallbox kept talking to it.
- With two wallbox connections, HEMSight shows actual and maximum current only from the selected wallbox.
- Every command to the wallbox appears in the live control history.

#### Control

- A device that HEMSight cannot write to can no longer be set to „Control“. One saved that way earlier is set to „Plan“ after the start, and the autonomy page names the reason.
- The overview no longer shows device groups as controlled for which no device is set up.

#### Measurements

- HEMSight now converts sensors in kilowatts, megawatts or kilowatt hours. Before, a sensor with 1.5 kW ran as 1.5 W.
- If a device is set as grid meter, such as Tibber Pulse, its value counts. Before, the grid value of another device could outrank it, and the grid source changed from run to run.
- HEMSight now measures how fresh a value is at the device it comes from. Before, an outdoor temperature that had not arrived for hours still passed as current.
- Grid and battery values that a device sends on its own, such as Anker Solix over MQTT, reach live control with their real timestamp. Before, they could be over a minute old.
- After the firmware update of the Tibber Pulse bridge in September, HEMSight reads the grid meter again. Over the bridge in the home network it is polled every 10 seconds, and a value counts as stale after 30 instead of 180 seconds.
- The loaded history calculates the house load with the same storage sign as the running recording. A sensor that has been reversed since then no longer distorts older days.

#### Tibber Pulse

- The integration has been updated and works again.

#### PV forecast

- Weather station and outdoor temperature never learned with separate databases, because HEMSight looked for the history in its own database instead of the one of Home Assistant.
- The learned shading of a weather station could never come about: it needs 30 days of history, 15 were read.
- The weather forecast of the Norwegian service no longer breaks off after a good two days.
- The comparison of the irradiance forecast with the weather station was shifted by a quarter of an hour and learned a correction that made the forecast worse.
- The shading map subtracted the shade twice and wrongly fell back in autumn and after a source change. After a change of weather sources, the forecast calibrates only on the new source from the seventh day.
- In the model comparison, the bundled model sees the same weather forecast as in operation. Before, it could lose unjustly.
- A short database outage no longer deletes the learned PV models.
- If the measured PV power jumps permanently to another level, for example because a sensor reports kilowatts instead of watts after an update, the forecast does not learn from those days.

#### Tariff

- Fixed price and exchange price can be saved without asking for a provider's credentials.

#### Toyota

- The electric car status never arrived: the library was missing from the image, and the call did not match the current version. State of charge, charging status, range and remaining charging time now come through the library's current route.

#### Smart

- Smart #1, #3 and #5: the library of the integration was not part of the image and is now included.

#### Display

- A resting storage unit shows „0 W“ instead of „-0 W“.

## 0.0.14-beta

### Wichtig

Wärmepumpe, Heizkörper-Thermostate und Klimaanlage funktionieren derzeit nicht richtig und sind deshalb gesperrt. HEMSight plant und steuert sie nicht mehr. Vorhandene Geräte werden abgeschaltet und lassen sich löschen. Warmwasser läuft unverändert weiter.

### Neu

#### PV-Prognose

- Weitere Vorbereitungen für das PV-Prognose-Update, etwa Wetterstation und eine vorsichtige PV-Erwartung, aktuell noch ohne Einstellmöglichkeit.

#### HA-Export

- Sensoren lassen sich jetzt gruppenweise und einzeln abwählen, statt immer alle zu schreiben.
- Läuft wahlweise über ein eigenes MQTT-Gerät statt über REST.
- Folgt jetzt automatisch der App-Sprache.

### Verbessert

#### E-Auto

- Nachtladen nutzte den Hausakku bisher nur auf dem Papier. Der Plan verschob die Ladung faktisch auf den nächsten Sonnentag, in der Nacht selbst blieb der Akku unangetastet. Er lädt das Auto jetzt wirklich in der laufenden Nacht.
- Die Wallbox schaltete beim Anlauf im Halbminutentakt ein und aus. Das ist behoben.

#### Planer

- Ein Ladeplan mit Auto am Ladepunkt im Preisladen-Modus braucht jetzt weniger Rechenzeit und wird dadurch öfter wirklich angewendet, statt nur angezeigt zu werden.

#### HA-Export

- Läuft jetzt auch bei gedrücktem Not-Aus weiter, statt komplett zu stoppen. Die Sollwerte stehen dann neutral.
- Sensoren tragen jetzt Einheit, Gerätetyp und übersetzten Namen.

### Behoben

#### Steuerung

- Ein Gerät auf „Aus“ zu stellen wirkte manchmal nicht, wenn gerade kein gültiger Plan vorlag. Ein ausdrücklicher Abschaltbefehl kommt jetzt unabhängig davon am Gerät an.
- Eine gestörte Verbindung zu einem einzelnen Gerät blockierte bisher die Steuerung aller anderen Geräte mit. Sie blockiert jetzt nur noch das betroffene Gerät selbst.
- Eine seit Stunden andauernde Blockade sah in der Meldung genauso aus wie ein kurzer Aussetzer. Dafür gibt es jetzt eine eigene, klare Meldung.

#### Preise

- Ein hinterlegter Zugangsschlüssel, etwa der Tibber-Token, ging verloren, sobald danach eine zweite Preiseinstellung gespeichert wurde. Er bleibt jetzt erhalten.

#### Geräte

- Eine eigene Sicherung ließ sich nicht mehr einspielen, die Prüfung wies die eigene Exportdatei ab. Das ist behoben, und ein zwischenzeitlich gelöschtes Gerät kommt beim Einspielen zurück.

#### Anker Solix

- Ein einzelner Anmeldefehler bei der Anker Solix Cloud legte bisher auch die MQTT-Anbindung für bis zu 30 Minuten lahm. Das ist behoben.

#### Einrichtung

- Verbindungstests zeigen jetzt den genauen Fehlgrund statt nur „Verbindung fehlgeschlagen“.

### Important

Heat pump, radiator thermostats and air conditioning do not work properly at the moment and are therefore locked. HEMSight no longer plans or controls them. Existing devices are switched off and can be deleted. Hot water keeps running as before.

### New

#### PV forecast

- Further preparations for the PV forecast update, such as a weather station and a cautious PV expectation, currently without settings.

#### HA export

- Sensors can now be deselected by group and individually, instead of always writing all of them.
- Runs either over its own MQTT device or over REST.
- Now follows the app language automatically.

### Improved

#### Electric car

- Night charging only used the home battery on paper. The plan effectively pushed charging to the next sunny day, and the battery stayed untouched during the night itself. It now really charges the car in the current night.
- The wallbox switched on and off every half minute when starting. This is fixed.

#### Planner

- A charging plan with the car at the charge point in price charging mode now needs less calculation time and is therefore applied more often, instead of only being shown.

#### HA export

- Now keeps running when the emergency stop is pressed, instead of stopping completely. The setpoints are neutral then.
- Sensors now carry unit, device type and a translated name.

### Fixed

#### Control

- Setting a device to „Off“ sometimes had no effect when no valid plan was available. An explicit switch-off command now reaches the device regardless.
- A disturbed connection to a single device used to block control of all other devices too. It now only blocks the affected device itself.
- A block lasting for hours looked the same in the message as a short dropout. There is now a separate, clear message for it.

#### Prices

- A stored access key, such as the Tibber token, was lost as soon as a second price setting was saved afterwards. It is now kept.

#### Devices

- Your own backup could no longer be restored, the check rejected its own export file. This is fixed, and a device deleted in the meantime comes back on restore.

#### Anker Solix

- A single login error at the Anker Solix cloud also brought down the MQTT connection for up to 30 minutes. This is fixed.

#### Setup

- Connection tests now show the exact reason for the failure instead of only „Connection failed“.

## 0.0.13-beta

### Wichtig

**Ein weiterer Teil des großen PV-Prognose-Updates.** Ein vortrainiertes Prototyp-Modell rechnet ab jetzt mit.

### Neu

#### Preise

- HEMSight hat jetzt eine eigene Preisprognose für die Stunden, die dein dynamischer Anbieter noch nicht kennt. Gerechnet wird sie aus Wetter-, Gas- und Preisverlaufsdaten. Die rohen Börsenpreise, die dabei herauskommen, vergleicht HEMSight mit den Preisen deines Anbieters und rechnet daraus deinen Aufschlag. Ganz genau wird die Prognose aber erst, wenn du deine Aufschläge in den Einstellungen einträgst. Sie stehen auf deiner Stromrechnung.
- Ein gerechneter Preis trägt in der Plan-Tabelle ein kleines „ca.".

#### Geräte über MQTT

- Geräte aus Zigbee2MQTT lassen sich direkt übernehmen. Ein Heizungsthermostat wird zur Wärmezone, eine schaltbare Steckdose zum Verbraucher. Die Liste zeigt dir vorher, was aus jedem Gerät wird. Steuern kannst du sie danach auch über HEMSight.
- Den MQTT-Broker trägst du jetzt einmal in den Einstellungen ein statt in jeder Anbindung, auf Wunsch verschlüsselt. Was in der alten MQTT-Anbindung stand, steht nach dem Update im neuen Abschnitt.

#### Geräte

- Der Anker SOLIX Smart Plug Gen 2 wird jetzt über Cloud und Modbus unterstützt.

#### Anzeige

- Im Browser-Tab steht endlich das HEMSight-Zeichen statt des leeren Platzhalters.

### Verbessert

#### Demo

- Die Struktur der Demo wurde komplett überarbeitet. Du kannst sie jetzt von vorn bis hinten bedienen: Assistent, Einstellungen, Benachrichtigungen und Szenarien wirken, und der Plan rechnet mit dem, was du eingibst.

### Behoben

#### E-Auto

- Hing das Auto an der Wallbox, während seine Hersteller-App noch „nicht angesteckt" meldete, kam gar kein Ladeplan zustande. Der Ladepunkt zeigte „Fahrzeug verbunden", die Planung blieb bei null und sagte nicht, warum.
- Kommt der Steckerstatus deines Autos aus Home Assistant, galt es nie als angesteckt. Bei zwei Autos sprang die Wahl im Fahrzeugdialog deshalb immer wieder zurück.

#### Steuerung

- Fanden zwei Planläufe hintereinander keinen genauen Plan, setzte die Steuerung aus. Mit Auto am Ladepunkt stand dann alles still, obwohl der letzte Plan noch galt. Ein freigegebener Plan steuert jetzt weiter, solange er gilt.

#### PV-Vorhersage

- Die gelernte Verschattungskarte wurde zu selten scharf. Ein einziger bewölkter Tag reichte, um eine Karte abzulehnen, an der HEMSight sechs Wochen gelernt hatte. Jetzt zählen Tage und nicht nur Messpunkte.

#### Einstellungen

- Ein Gerät auf „Planen" zu stellen, legte die Zeitreihen-Datenbank und die Preisquelle lahm. HEMSight verlor beim Speichern die hinterlegten Zugangsdaten. Zu sehen war es Minuten später am fehlenden Lastverlauf, ein Neustart brachte alles zurück.
- Ein Gerät, das absichtlich auf „Planen" steht, meldet nicht mehr jede Minute „Gerät blockiert".

#### Flexible Verbraucher

- Warmwasser ohne Leistungsmessung ließ sich nicht speichern. Der Assistent bot „keine Messung" an, und die Prüfung lehnte genau das ab.
- Warmwasser mit Home-Assistant-Schalter bekam auf einer frischen Installation keinen Steuerweg. HEMSight hätte den Schalter nie angefasst.

#### Speicher

- Ein Speicherverbund mit einem Anker SOLIX Power Dock galt dauerhaft als „nicht bestätigt", obwohl er genau das tat, was der Plan wollte.
- Hinter „nicht bestätigt" standen Seriennummern und ein Fehlercode. Jetzt steht da, welche Größe nicht stimmt, beim Sollwert mit beiden Werten in Watt.
- Den Sollwert eines Speicherverbunds las HEMSight nur einmal pro Stunde, obwohl er sich mit jeder Planänderung bewegt. Jetzt liest es ihn jede Minute.

#### Geräte über MQTT

- Über Zigbee2MQTT ausgewählte Werte kamen nie an. Die Geräte standen eingetragen da, ohne Fehler und ohne einen einzigen Messwert. Nach dem Update laufen sie, ohne dass du etwas neu einträgst.

#### Einrichtung

- Lehnte HEMSight eine Zuordnung ab, kam ein Sammelsatz, der nichts sagte. Jetzt steht da, was fehlt: „Diese Zuordnung fehlt: Leistungsmessung".
- War „Speichern" bei einem flexiblen Verbraucher gesperrt, stand für jeden Grund derselbe Satz, und der nannte eine Mindestlaufzeit, die es nie gab. Jetzt steht der Grund am Knopf, für jede Bedingung einzeln.
- Eine Entität, die es in Home Assistant gibt und die gerade nicht antwortet, blockiert das Speichern nicht mehr. HEMSight warnt und speichert, geplant wird, sobald wieder Werte kommen.
- War Home Assistant beim Speichern nicht erreichbar, hieß es obendrein, die Entitäten gäbe es dort nicht. Jetzt steht da nur, dass sie nicht geprüft werden konnten.
- Der rote Kasten über eine abgelehnte Speicherung blieb stehen, auch wenn du das beanstandete Feld längst geändert hattest. Das betraf dreizehn Bereiche des Assistenten.

#### Datenbank

- Unter Schreiblast brach ein Lesezugriff nach fünf Sekunden mit „database is locked" ab.

#### Preise

- Bei Tibber, Octopus und Ostrom und bei festen wie Tag/Nacht-Tarifen behauptete die Preisübersicht „geschätzte Aufschläge für deinen Standort", obwohl deren Preis vollständig ist.

#### Anzeige

- Nach dem Leeren des Browserspeichers stand auf der Anlagenseite Euro und die Zeitzone deines Rechners statt dessen, was du eingestellt hast.

### Important

**Another part of the big PV forecast update.** A pre-trained prototype model now takes part in the calculation.

### New

#### Prices

- HEMSight now has its own price forecast for the hours your dynamic provider does not know yet. It is calculated from weather, gas and price history data. The raw exchange prices that come out of it are compared against your provider's prices, and your surcharge is derived from that. The forecast only gets fully accurate once you enter your surcharges in the settings. You find them on your electricity bill.

- A calculated price carries a small „approx." in the plan table.

#### Devices over MQTT

- Devices from Zigbee2MQTT can be taken over directly. A heating thermostat becomes a heat zone, a switchable socket becomes a load. The list shows you beforehand what each device will become. You can then control them through HEMSight as well.

- You now enter the MQTT broker once in the settings instead of in every integration, encrypted if you want. What used to sit in the old MQTT integration is in the new section after the update.

#### Devices

- The Anker SOLIX Smart Plug Gen 2 is now supported over cloud and Modbus.

#### Display

- The browser tab finally shows the HEMSight mark instead of the empty placeholder.

### Improved

#### Demo

- The structure of the demo has been completely reworked. You can now operate it from front to back: assistant, settings, notifications and scenarios take effect, and the plan calculates with what you enter.

### Fixed

#### Electric car

- If the car was plugged in at the wallbox while its manufacturer app still reported „not plugged in", no charging plan came about at all. The charge point showed „vehicle connected", planning stayed at zero and did not say why.

- If your car's plug status comes from Home Assistant, the car never counted as plugged in. With two cars, the choice in the vehicle dialog kept jumping back.

#### Control

- If two planning runs in a row found no accurate plan, control stopped. With a car at the charge point everything then stood still, although the last plan was still valid. A released plan now keeps controlling as long as it is valid.

#### PV forecast

- The learned shading map went live too rarely. A single cloudy day was enough to reject a map HEMSight had learned over six weeks. Days now count, not just measuring points.

#### Settings

- Setting a device to „plan" brought the time series database and the price source down. HEMSight lost the stored credentials while running. It showed minutes later in the missing load history, and a restart brought everything back.

- A device deliberately set to „plan" no longer reports „device blocked" every minute.

#### Flexible loads

- Hot water without power metering could not be saved. The assistant offered „no metering", and the check rejected exactly that.

- Hot water with a Home Assistant switch got no control path on a fresh installation. HEMSight would never have touched the switch.

#### Storage

- A storage cluster with an Anker SOLIX Power Dock permanently counted as „not confirmed", although it did exactly what the plan wanted.

- Behind „not confirmed" there were serial numbers and an error code. It now says which value is off, for the setpoint with both figures in watts.

- HEMSight read the setpoint of a storage cluster only once per hour, although it moves with every change of plan. It now reads it every minute.

#### Devices over MQTT

- Values selected over Zigbee2MQTT never arrived. The devices sat there entered, without an error and without a single reading. After the update they run, without you entering anything again.

#### Setup

- When HEMSight rejected an assignment, a collective sentence came up that said nothing. It now says what is missing: „This assignment is missing: power metering".

- When „save" was blocked on a flexible load, the same sentence appeared for every reason, and it named a minimum runtime that never existed. The reason now sits at the button, separately for each condition.

- An entity that exists in Home Assistant and is not answering right now no longer blocks saving. HEMSight warns and saves, planning follows as soon as values come back.

- If Home Assistant was unreachable while saving, it also claimed the entities did not exist there. It now only says they could not be checked.

- The red box about a rejected save stayed up even after you had long since changed the field in question. That affected thirteen areas of the assistant.

#### Database

- Under write load, a read access broke off after five seconds with „database is locked".

#### Prices

- With Tibber, Octopus and Ostrom and with fixed and day/night tariffs, the price overview claimed „estimated surcharges for your location", although their price is complete.

#### Display

- After clearing browser storage, the system page showed euro and your computer's time zone instead of what you had set.

## 0.0.12-beta

### Neu

#### E-Auto

- Neu unter „E-Mobilität" und im Einrichtungsassistenten: die Geldgrenze für Netzstrom. Über deinem Höchstpreis geht kein Netzstrom ins Auto. Ist der ganze Tag teuer, wartet es, statt zum Tageshöchstpreis zu laden. Sofortladen lädt weiter ohne Grenze.

- Eine eingetragene Abfahrt geht vor. Reicht der günstige Strom nicht, lädt das Auto in den nächstgünstigen Stunden darüber weiter, so weit wie nötig.

### Behoben

#### PV-Vorhersage

- Konnte eine Wetterquelle nicht abgerufen werden, stand der Plan auf „Eingeschränkt". Die Wettermodelle werden jetzt nur noch einmal pro Stunde abgefragt statt bei jedem Planlauf, und sie blockieren sich dabei nicht mehr gegenseitig.

### New

#### Electric car

- New under „E-mobility" and in the setup assistant: the money limit for grid power. Above your maximum price, no grid power goes into the car. If the whole day is expensive, the car waits instead of charging at the day's peak price. Instant charging keeps charging without a limit.

- A scheduled departure comes first. If cheap power is not enough, the car keeps charging in the next cheapest hours above the limit, just as far as needed.

### Fixed

#### PV forecast

- If a weather source could not be fetched, the plan showed „Limited". The weather models are now queried once per hour instead of on every planning run, and they no longer block each other.

## 0.0.11-beta

### Wichtig

**Die PV-Vorhersage lernt ab jetzt von deiner Anlage.** Das ist die Vorbereitung für ein großes PV-Prognose-Update, das bald kommt. Den Anfang macht die Wetterlage: Welche Wetterquellen HEMSight nutzt, entscheidet es ab jetzt selbst, die Einstellung dazu ist weg. Bestehende Anlagen werden beim ersten Start umgestellt.

### Neu

#### PV-Vorhersage

- HEMSight lernt selbst, an welchem Sonnenstand deine Anlage verschattet ist, und rechnet das ein. Bisher musstest du dafür eine Dämpfung für Morgen und Abend von Hand eintragen. Unter „Einstellungen → PV-Prognose" steht, wie weit es damit ist.

- Schnee, Laub oder eine Plane auf den Modulen erkennt HEMSight jetzt selbst und nimmt die Vorhersage zurück, bis die Module wieder frei sind.

- HEMSight lernt aus den Messwerten ein eigenes Korrekturmodell. Übernommen wird es erst, wenn es eine Woche lang im Stillen besser lag als die bisherige Rechnung. Ein Knopf nimmt es wieder zurück.

- Home Assistant bekommt eigene Sensoren für die PV-Vorhersage: erwartete Leistung, Tages- und Morgenenergie, Tagesspitze mit Uhrzeit. Ohne Nacharbeit im Dashboard brauchbar.

#### Solaranlage

- Für einen zweiten Wechselrichter ohne eigenen Akku, zum Beispiel ein Balkonkraftwerk, trägst du jetzt ein, welche Dachflächen zu ihm gehören. Der Plan weiß dann, dass dessen Sonne ins Haus und ins Netz geht und nicht in den Speicher. Bei akku-gekoppelten Wechselrichtern ändert sich nichts.

#### Flexible Verbraucher

- Die Warmwasser-Karte im Reiter „Flexible Verbraucher" zeigt jetzt Mindest- und Maximaltemperatur, die gemessene Entnahme je Tag und die Verlustrate, mit der geplant wurde. Die Rate stand vorher nur in der Diagnose.

#### Einstellungen

- Den „Testen"-Knopf gibt es jetzt auch an Werten aus Anker, Shelly, go-e und den übrigen Direktintegrationen. Bisher ging das nur bei Home-Assistant-Entitäten. Kommt kein Wert zurück, steht der Grund dabei.

### Verbessert

#### PV-Vorhersage

- Die eigene Vorhersage rechnet mit vier Wettermodellen gleichzeitig statt mit einem: ICON vom Deutschen Wetterdienst, ECMWF, GFS und das norwegische MEPS.

#### Warmwasser

- Solarstrom geht nicht mehr zuerst ins Warmwasser, wenn dein Hausspeicher noch Platz hat. Vorher heizte der Speicher bei jeder freien Sonne bis zum Maximum hoch, und die Wärme war bis zum nächsten Sonnentag größtenteils wieder weg.

- Wie weit der Speicher geladen wird, entscheidet HEMSight jetzt selbst: so viel, dass es bis zum nächsten günstigen Fenster reicht. Die Zieltemperatur zwischen Minimum und Maximum ist dafür weggefallen.

- HEMSight unterscheidet jetzt, ob der Speicher von allein auskühlt oder ob jemand warmes Wasser gezapft hat. Vorher war beides eine Zahl, und der Speicher galt als undichter, als er ist.

#### Einrichtung

- Assistent und Einstellungen zeigen dieselben Felder. Beide waren getrennt gebaut und liefen auseinander. Wochentage beim Tag/Nacht-Tarif, die Prüfung einer Börsenpreisreihe und die Gebotszone stehen jetzt auf beiden Seiten.

- Der Assistent wählt keinen Preisanbieter mehr vor. Wer den Schritt bisher durchklickte, richtete Tibber ein, ohne es gewählt zu haben.

#### Planung

- Der Plan kommt in derselben Zeit näher ans günstigste Ergebnis, weil der Planlauf nicht mehr vorzeitig aufhört, solange er noch etwas holen kann.

- Hast du zwei Speicher verschiedener Bauart, plant HEMSight für jeden die Schrittweite, die er selbst annimmt. Bisher galt die des einen für beide.

#### E-Auto

- Der Regler „Limit-Stop" heißt jetzt „Hausakku-Reserve" und sagt, wofür er gilt: Unter diesem Ladestand gibt der Hausakku nichts mehr ans Auto. Beim Sofortladen wirkt er jetzt genauso wie beim Preisladen.

#### Oberfläche

- Formulare reagieren schneller auf jede Taste. Das Negativpreis-Panel sortierte bei jedem Tastendruck dreimal den ganzen Gerätekatalog aus Home Assistant.

- Der Plan, den die Oberfläche alle zwei Minuten lädt, ist weniger als halb so groß. Der Rest war Rechenprotokoll, das niemand zu sehen bekam.

- Jeder Wert frischt sich in seinem eigenen Takt auf. Bisher hing das daran, welche Seite gerade offen war.

#### Geräteanbindungen

- Die Anbindungen laufen auf aktuellen Herstellerbibliotheken: Tesla, Kia, Hyundai, Genesis, Viessmann, Midea und Anker Solix. Der Funktionsumfang bleibt gleich.

#### Installation

- Das Update lädt weniger. Mitgebaut wurden bisher fünfundzwanzig Sprachen, auswählen ließen sich vier.

### Behoben

#### Warmwasser

- Der Warmwasserspeicher ging nicht mehr aus. Eingeschaltet hat HEMSight ihn planmäßig, der Abschaltbefehl entstand aber nie, und er heizte weiter, bis jemand von Hand ausschaltete.

- Ein Speicher, dessen Temperaturfühler direkt an einer Integration hängen, ließ sich nicht mehr speichern. Der Dialog verlangte einen Sensor aus Home Assistant, den es dort nicht gab.

#### E-Auto

- Preisladen ohne Abfahrtszeit plante gar nichts, auch keine Solarladung. Jetzt nimmt das Auto den Sonnenüberschuss und lädt aus dem Netz in den günstigsten Stunden.

- Stand „Batterieentladung verhindern" auf Nein, zog der Plan beim Preisladen deinen Hausakku fürs Auto bis zur allgemeinen Mindestladung leer. Jetzt hält er an der Hausakku-Reserve an.

- Ein Sofortladen mit Akku-Anteil, den der Akku nicht liefern konnte, ließ den ganzen Planlauf scheitern. Jetzt übernimmt das Netz den Rest.

#### Live-Steuerung

- Alle sechs Stunden räumt HEMSight alte Verlaufsdaten auf. Auf MariaDB ließ das den Live-Optimierer einen Takt aussetzen, und der fertige Plan wurde fälschlich als fehlgeschlagen gemeldet.

#### Einrichtung

- Wer §14a eingerichtet hatte, den Assistenten erneut durchlief und dort „Nein, überspringen" wählte, verlor seinen ganzen Vertrag ohne Hinweis. Jetzt wird nur ausgeschaltet.

- Beim Wärmeerzeuger griffen drei Änderungen nicht: Ein ausgeschalteter Heizungspuffer blieb an, eine geleerte Steuer-Entität blieb stehen, und der Wechsel auf „nur beobachten" wurde abgewiesen.

- Ein Klick auf die Beschriftung über einer Kachelauswahl wählte still die erste Kachel. Der Text ist jetzt nur noch Text.

#### Einstellungen

- Für Preisanbieter mit eigener Internetadresse ließ sich die Anmeldeart nur auf fünf von neun Werten stellen, und ausgerechnet die aus dem Assistenten war keine davon. Wer dort etwas anklickte, verlor sie ohne Weg zurück.

- Wer die Auto-Kalibrierung der PV-Vorhersage einschaltete und danach irgendetwas unter „PV-Prognose" speicherte, hatte sie wieder aus, ohne Hinweis.

- Ein neuer Negativpreis-Zusatzverbraucher startete ausgeschaltet und mit null Watt. Er sah eingerichtet aus und konnte nie laufen.

#### Geräte

- Wer im Wallbox-Dialog nur den Ladestrom änderte, verlor beim Speichern die Home-Assistant-Entitäten der Wallbox.

#### Diagramme

- Im Diagramm-Reiter des Plans blieb die Auswahl „7 Tage" leer. Jetzt gelten dieselben sieben Tage wie beim Live-Verlauf.

---

### Important

**The PV forecast now learns from your system.** This is the groundwork for a large PV forecast update that is coming soon. It starts with the weather: HEMSight now decides for itself which weather sources it uses, and the setting for it is gone. Existing systems are switched over on the first start.

### New

#### PV forecast

- HEMSight now works out by itself at which sun position your system is shaded, and takes that into account. Until now you had to enter a damping for morning and evening by hand. „Settings → PV forecast" shows how far along it is.

- Snow, leaves or a tarpaulin on the panels are now spotted by HEMSight itself, and it holds the forecast back until the panels are clear again.

- HEMSight also learns a correction model of its own from the measurements. It is only adopted once it has quietly done better than the previous calculation for a week. A button takes it back again.

- Home Assistant gets its own sensors for the PV forecast: expected power, daily and morning energy, daily peak with time. Usable in a dashboard without any further work.

#### Solar system

- For a second inverter without a battery of its own, a balcony power plant for example, you now enter which roof areas belong to it. The plan then knows that its sun goes into the house and into the grid and not into the battery. Nothing changes for battery-coupled inverters.

#### Flexible appliances

- The hot water card in the „Flexible appliances" tab now shows minimum and maximum temperature, the measured draw per day and the loss rate it planned with. The rate was previously only in the diagnostics.

#### Settings

- The „Test" button is now also available for values from Anker, Shelly, go-e and the other direct integrations. Until now it only worked for Home Assistant entities. If no value comes back, the reason is shown next to it.

### Improved

#### PV forecast

- The built-in forecast calculates with four weather models at once instead of one: ICON from the German weather service, ECMWF, GFS and the Norwegian MEPS.

#### Hot water

- Solar power no longer goes into hot water first while your house battery still has room. The tank used to heat up to its maximum on every bit of free sun, and by the next sunny day most of that warmth was gone again.

- How far the tank is charged is now decided by HEMSight itself: enough to last until the next cheap window. The target temperature between minimum and maximum has gone with it.

- HEMSight now tells apart whether the tank cools down on its own or whether somebody drew hot water. Both used to be one number, and the tank looked leakier than it is.

#### Setup

- The wizard and the settings show the same fields. Both were built separately and had drifted apart. Weekdays for the day/night tariff, checking an exchange price series and the bidding zone are now on both sides.

- The wizard no longer preselects a price provider. Anyone who clicked through that step used to set up Tibber without having chosen it.

#### Planning

- The plan gets closer to the cheapest result in the same time, because the planning run no longer stops early while there is still something to gain.

- If you have two batteries of different types, HEMSight plans for each of them the step size it really accepts. The step size of the one used to apply to both.

#### Electric car

- The „Limit stop" slider is now called „House battery reserve" and says what it is for: below this charge level the house battery gives nothing more to the car. With immediate charging it now works just as it does with price charging.

#### Interface

- Forms react faster to every keystroke. The negative price panel used to sort the whole Home Assistant device catalogue three times on every key.

- The plan that the interface loads every two minutes is less than half its previous size. The rest was calculation log that nobody ever saw.

- Every value now refreshes at its own rate. Until now that depended on which page happened to be open.

#### Device connections

- The connections run on current manufacturer libraries: Tesla, Kia, Hyundai, Genesis, Viessmann, Midea and Anker Solix. The range of functions stays the same.

#### Installation

- The update downloads less. Twenty-five languages used to be built in, four could be selected.

### Fixed

#### Hot water

- The hot water tank no longer switched off. HEMSight switched it on as planned, but the off command never came about, and it kept heating until somebody switched it off by hand.

- A tank whose temperature probes hang directly off an integration could no longer be saved. The dialogue demanded a sensor from Home Assistant that was not there.

#### Electric car

- Price charging without a departure time planned nothing at all, not even solar charging. Now the car takes the solar surplus and charges from the grid in the cheapest hours.

- With „Prevent battery discharge" set to no, the plan drained your house battery for the car down to the general minimum charge during price charging. It now stops at the house battery reserve.

- An immediate charge with a battery share that the battery could not deliver made the whole planning run fail. The grid now covers the rest.

#### Live control

- Every six hours HEMSight clears out old history data. On MariaDB that made the live optimiser skip a cycle, and the finished plan was wrongly reported as failed.

#### Setup

- Anyone who had set up §14a, went through the wizard again and chose „No, skip" there lost their entire contract without any warning. It is now only switched off.

- Three changes did not take effect for the heat generator: a switched-off heating buffer stayed on, a cleared control entity stayed in place, and switching to „observe only" was rejected.

- A click on the label above a tile selection silently picked the first tile. The text is now only text.

#### Settings

- For price providers with their own internet address, the login type could only be set to five of nine values, and the one the wizard enters was not among them. Anyone who clicked something there lost it with no way back.

- Anyone who switched on auto calibration of the PV forecast and then saved anything under „PV forecast" had it switched off again, without any warning.

- A new negative price appliance started switched off and at zero watts. It looked set up and could never run.

#### Devices

- Anyone who only changed the charging current in the wallbox dialogue lost the Home Assistant entities of the wallbox on saving.

#### Charts

- The „7 days" option in the plan's chart tab stayed empty. The same seven days as in the live history now apply.

---

## 0.0.10-beta

### Behoben

#### Speicher

- Will der Plan die Hauslast nicht aus der Solaranlage decken, schickt HEMSight den Solarstrom jetzt richtig in den Speicher statt ins Haus. Bisher regelte die Batterie in diesen Stunden nach der Hauslast, also genau umgekehrt zum Plan.

- Im Plan steht keine Netzladung von einem Watt mehr, wo gar nichts aus dem Netz geladen wird. Am Gerät kam dieses Watt nie an. Es stand dort nur, weil der Plan sonst nicht ausdrücken konnte, dass der Speicher einem festen Wert folgt.

### Verbessert

#### Planung

- Für die Netzladung plant HEMSight nur noch Werte, die dein Speicher wirklich annimmt, je nach Gerät in Schritten von zehn oder hundert Watt. Krumme Werte wurden beim Stellen abgerundet. Auf manchen Anlagen hätte das eine Watt sogar den Betrieb lahmgelegt, wäre es wirklich gestellt worden.

- Für Stunden, in denen nur Solarstrom in den Speicher geht und das Netz das Haus versorgt, steht jetzt ein eigener Grund im Plan: „Solarstrom in den Speicher, Haus aus dem Netz (Preisvorteil)." Vorher stand dort „PV-Überschuss in die Batterie." und die Preisentscheidung dahinter blieb unsichtbar.

---

### Fixed

#### Storage

- When the plan does not want house load covered from solar, HEMSight now sends the solar power into the battery instead of into the house. Before, the battery followed house load in those hours, the exact opposite of the plan.

- The plan no longer shows grid charging of one watt where nothing is charged from the grid at all. That watt never reached a device. It was only there because the plan had no other way to say that the battery follows a fixed value.

### Improved

#### Planning

- For grid charging, HEMSight now plans only values your battery really accepts, in steps of ten or a hundred watts depending on the device. Odd values were rounded down when they were set. On some systems that single watt would even have taken operation down, had it really been set.

- For hours in which only solar power goes into the battery while the grid supplies the house, the plan now gives a reason of its own: „Solar into storage, house from the grid (price advantage)." It previously read „PV surplus into the battery." and said nothing about the price decision behind it.

---

## 0.0.9-beta

### Wichtig

**Im Home-Assistant-Add-on waren Planautomatik und Messwertaufzeichnung ab Werk abgeschaltet.** Wer HEMSight als Add-on betreibt, bekam nach der Einrichtung keine selbst gerechneten Pläne und keine aufgezeichneten Messwerte, ohne jeden Hinweis darauf. Auf einer betroffenen Anlage war der letzte Plan fast sechs Tage alt. Diese Version holt beides beim ersten Start zurück. Nur wer unter „Technische Details" schon einmal gespeichert hat, legt die zwei Schalter selbst um. Die Docker-Installation war nicht betroffen.

### Neu

#### Preis und Tarif

- Der Börsenpreis darf jetzt aus Home Assistant kommen. Wer dort EPEX Spot, Nord Pool, ENTSO-E oder eine verwandte Integration hat, wählt deren Sensor aus, ohne eigenen Zugang und Schlüssel.

- Vor dem Speichern zeigt „Reihe prüfen", was HEMSight aus dem Sensor liest: Form, Einheit, Preisart und Zeiträume. Eine Einheit, die sich nicht ablesen lässt, wird erfragt statt geraten.

- Deckt deine Quelle nur heute und morgen ab, füllt HEMSight den Rest des Planungszeitraums wie bisher selbst auf.

#### Einstellungen

- Planautomatik und Messwertaufzeichnung lassen sich unter „Technische Details" ein- und ausschalten.

### Verbessert

#### Live-Steuerung

- Ein Neustart von Home Assistant legt die Steuerung nicht mehr lahm. Fielen die Messwerte kurz aus, schalteten fünf Minuten später Batterie, Wallbox und alle Verbraucher ab. Jetzt trägt der letzte gute Plan darüber hinweg, bis zwei Läufe hintereinander scheitern oder er älter als fünfunddreißig Minuten wird.

- Fehlt der Netzbezug oder der Ladestand des Speichers, hält die Steuerung weiterhin sofort an.

- Während eines solchen Ausfalls kommt keine Meldung „Aktion erforderlich" mehr für Geräte, an denen nichts kaputt ist. Ein Ausfall, der länger dauert, meldet sich weiterhin.

#### Planung

- Ein eingeplanter Gerätestart wandert nicht mehr grundlos durch den Tag. Ein Umzug kostet jetzt umso mehr, je weiter er geht: Der Geschirrspüler rückt für ein wirklich günstigeres Fenster weiterhin, für kleine Schwankungen in der Vorhersage nicht mehr.

#### Vorhersage

- Die Vorhersage für deine PV-Anlage wechselt nicht mehr bei jeder kleinen Störung ihre Quelle. Vorher sprang der erwartete Ertrag dabei um 20 bis 32 Prozent.

- Wechselt sie doch die Quelle, steht der Grund jetzt im Plan.

#### Einstellungen

- Die Betriebstakt-Maske speichert nur noch das, was du wirklich geändert hast. Wer dort ein Intervall anpasste, schrieb bisher die übrigen Werte mit fest.

### Behoben

#### Einstellungen

- Eine Wallbox ließ sich weder anlegen noch ändern, und unter „Steuerpfade" kam kein neuer Aktor zustande. Beides brach beim Speichern mit „Nicht unterstützte Geräteeinstellung" ab.

#### Geräte

- Die Fertigmeldung am Ende eines Gerätelaufs gilt jetzt für jeden Verbraucher, auch für den Warmwasserspeicher. Bisher war sie nur bei Geräten mit eigener Statusmeldung zuverlässig.

#### Diagramme

- Plan-, Kosten-, Ladestands- und Statuswerte gingen auf neueren InfluxDB-Servern spurlos verloren. In den Diagrammen fehlte alles außer den Geräteverläufen, ohne jede Fehlermeldung.

#### Diagnose

- Systeminfo und Diagnosepaket nennen jetzt die Konfigurationsdatei, die wirklich geladen wurde. Auf jeder Add-on-Installation stand dort die Beispieldatei.

#### Sprache

- Die Bestätigung nach dem Speichern des Betriebstakts erscheint in der Sprache der Oberfläche. Auf Englisch stand dort ein deutscher Satz.

---

### Important

**In the Home Assistant add-on, automatic planning and measurement recording shipped switched off.** If you run HEMSight as an add-on, it calculated no plans on its own after setup and recorded no measurements, with nothing anywhere to tell you. On one affected system the last plan was almost six days old. This version brings both back on the first start. Only if you have saved something under „Technical details" before do you flip the two switches yourself. The Docker installation was not affected.

### New

#### Price and tariff

- The exchange price may now come from Home Assistant. If you already run EPEX Spot, Nord Pool, ENTSO-E or a related integration, you pick its sensor, with no account and no key of your own.

- Before saving, „Check series" shows what HEMSight reads from the sensor: format, unit, price type and periods. A unit that cannot be read is asked for instead of guessed.

- If your source only covers today and tomorrow, HEMSight fills the rest of the planning horizon itself, as before.

#### Settings

- Automatic planning and measurement recording can be switched on and off under „Technical details".

### Improved

#### Live control

- A restart of Home Assistant no longer paralyses control. When measurements dropped out briefly, battery, wallbox and every appliance switched off five minutes later. The last good plan now carries across that gap, until two runs fail in a row or it grows older than thirty-five minutes.

- If grid import or the battery's state of charge is missing, control still stops immediately.

- During such an outage, no „Action required" message arrives any more for devices that are perfectly fine. An outage that lasts longer still reports itself.

#### Planning

- A scheduled appliance start no longer drifts through the day without reason. Moving it now costs more the further it goes: the dishwasher still moves for a genuinely cheaper window, but no longer for small changes in the forecast.

#### Forecast

- The forecast for your PV system no longer switches its source on every small glitch. Before, the expected yield jumped by 20 to 32 percent whenever it did.

- If it does switch source, the reason is now in the plan.

#### Settings

- The operating interval form now saves only what you actually changed. Adjusting one interval used to write the other values down with it.

### Fixed

#### Settings

- A wallbox could neither be created nor edited, and no new actuator could be added under „Control paths". Both failed on saving with „Unsupported device setting".

#### Devices

- The finished message at the end of an appliance run now applies to every load, including the hot water tank. Until now it was only reliable for devices that report a status of their own.

#### Charts

- Plan, cost, state-of-charge and status values were silently lost on newer InfluxDB servers. Everything but the device traces was missing from the charts, with no error message at all.

#### Diagnostics

- System info and the diagnostics bundle now name the configuration file that was actually loaded. On every add-on installation they showed the example file.

#### Language

- The confirmation after saving the operating intervals appears in the language of the interface. In English it showed a German sentence.

## 0.0.8-beta

### Wichtig

**Der neue Planrechner war in den fertigen Abbildern gar nicht drin.** Das ist ein Fehler von mir: Seit 0.0.7 plant HEMSight mit einem schnelleren Verfahren, aber ein Programmteil davon hat es weder ins Home-Assistant-Add-on noch ins Docker-Abbild geschafft. HEMSight ist trotzdem gestartet und hat geplant, nur eben mit dem alten, langsamen Ersatz. Die Pläne sollten ab jetzt besser und schneller werden. Was das ausmacht: Auf einer Anlage mit zwei Speichern und zwei Tagen Vorausschau lag der Ersatz 1,80 € neben dem besten Plan, das neue Verfahren 0,04 €. Bei größeren Anlagen kam manchmal gar kein Plan heraus. Wer HEMSight selbst aus den Quellen baut, war nie betroffen.

### Neu

#### Planung

- Der Plan sagt jetzt, ob er wirklich der beste ist oder ob HEMSight nur die Zeit ausging. Hörte die Rechnung vorzeitig auf, steht auch da, warum. Zu sehen auf der Planungsseite.

- HEMSight hört früher auf zu rechnen, wenn nichts Besseres mehr kommt. Ein Planlauf darf weiterhin bis zu vier Minuten dauern, aber wenn davon eine Minute ohne Verbesserung vergeht, ist Schluss. Der beste bis dahin gefundene Plan bleibt und steuert weiter. An der echten Anlage gemessen: 123 statt 240 Sekunden, bei genau demselben Plan. Beide Zeiten lassen sich einstellen.

- Kommt gar kein Plan zustande, steht jetzt dabei, was sich in die Quere kommt. Vorher stand da nur „keine Lösung", und ohne Zugriff auf die Anlage war nicht mehr herauszufinden, woran es lag.

#### Live-Steuerung

- Die Live-Seite sagt zu jedem einzelnen Gerät, was der Steuerung noch fehlt. Diese Auskunft gab es bisher nur für die Anlage als Ganzes. Angezeigt wird nur, was wirklich im Weg steht.

#### Fehlerberichte

- Ein Fehlerbericht nimmt den Planlauf mit: wie er ausging, warum er aufhörte, wie weit er vom besten Plan weg war. Bei einem Problem mit der Planung war ein Bericht ohne das nicht zu gebrauchen.

### Verbessert

#### Planung

- Die Planung ist schneller. Sie hat vieles doppelt gerechnet und Entscheidungen mitgeschleppt, die nichts entschieden haben. Für denselben Plan braucht sie jetzt 96 statt 195 Sekunden.

#### Warmwasser

- Der Warmwasserspeicher wird genauer gerechnet. Er bekam pauschal 20 Kelvin Spielraum nach oben und unten; jetzt zählt, was er in der Zeit überhaupt erreichen kann. Dabei kommen bessere Pläne heraus, in derselben Zeit.

- Ab dem zweiten Tag plant HEMSight die Wärme in Stundenschritten statt in Viertelstunden. So weit voraus gibt der Plan sowieso nur die Richtung vor.

### Behoben

#### Planung

- Steht ein Speicher über seiner eingestellten Maximal-Ladung, kam gar kein Plan mehr zustande und die Steuerung fiel auf den Ersatzplan zurück. Das passiert schneller als man denkt, etwa wenn die Grenze saisonal unter den aktuellen Ladestand rutscht. Betroffen waren Anlagen mit einem Speicher, zwei Speichern im Ausgleichsmodus und zwei Speichern mit fester Reihenfolge.

- War der vorrangige Speicher gerade gedrosselt, gab es ebenfalls keinen Plan. HEMSight hat ihn an seiner vollen Ladeleistung gemessen, hielt ihn deshalb nie für ausgeschöpft, und der zweite Speicher kam nie an die Reihe.

- Anlagen mit Auto und mehreren Speichern bekamen bei voller Ausstattung teils gar keinen Plan mehr. Die Rechnung lief in ihre vier Minuten, ohne überhaupt eine Lösung zu finden.

- Stand im letzten Plan ein Lademodus fürs Auto, den HEMSight nicht kennt, ist der ganze Planlauf gescheitert, ohne erkennbaren Grund. Jetzt bleibt nur diese eine Viertelstunde ohne Ladung, und der Grund steht in den Planhinweisen.

- Anlagen ohne schaltbare Geräte, ohne Wärmeplanung und ohne Speicher haben nie gesteuert. Ihr Plan galt immer als zu teuer, obwohl er nachweislich der beste war. Dasselbe passierte kurz nach einem Neustart, solange ein Speicher noch keinen Ladestand meldete.

- Geschirrspüler und Poolpumpe laufen wieder in der Sonne, auch wenn das Auto ansteckt. Bisher sind sie bei angestecktem Auto in billige Netzstunden ausgewichen; eine Poolpumpe lief dadurch nur noch in 10 von 18 Sonnenstunden. Am Vorrang ändert sich nichts: Haus und schaltbare Geräte kommen weiter vor dem Auto.

- Lief die Rechnung in ihre Zeit und kam trotzdem ein brauchbarer Plan heraus, hat HEMSight das vergessen und beim nächsten Mal wieder vier Minuten verbrannt. Jetzt merkt es sich das und rechnet gleich gröber weiter. Die feine Rechnung wird stündlich noch einmal versucht.

- Ob ein Plan am Zeitlimit entstand, hat HEMSight aus der Laufzeit geraten. Ein Lauf, der eine halbe Sekunde darunter blieb, galt als bester Plan. Jetzt zählt, was die Rechnung selbst dazu sagt. Die Qualitätsprüfung hing an derselben Schätzung und fragt jetzt ebenfalls nach.

- Die neue Bremse gegen ergebnisloses Weiterrechnen hat zu früh zugeschlagen: Sie zählte schon die Vorbereitung als Stillstand. Auf einer gut ausgestatteten Anlage war damit nach anderthalb Minuten Schluss, nachdem HEMSight drei Möglichkeiten geprüft hatte statt einiger Tausend.

- Manche Pläne standen als „bester Plan, 0,00 € Abstand" da, obwohl gar nichts gerechnet worden war. Solche Läufe zählen jetzt nicht mehr als Ergebnis.

- Was die Rechnung ausgab, wurde ungeprüft zum Steuerplan. HEMSight rechnet jetzt nach, ob das Ergebnis alle Vorgaben einhält und ob die genannten Kosten stimmen. Passt etwas nicht, rechnet es mit dem zweiten Verfahren weiter.

- Der letzte Plan dient der neuen Rechnung als Startpunkt. Der wurde regelmäßig komplett weggeworfen, sobald ein einziger Wert nicht mehr passte. Vier Auslöser dafür sind im laufenden Betrieb der Normalfall: ein Speicher über seiner Ladegrenze, ein Speicher, der voll in den Zeitraum startet, eine Wärmequelle mitten in ihrer Mindestlaufzeit, und Heizzonen mit zu kurzen Schaltzeiten. Jetzt fällt nur weg, was wirklich nicht passt.

- Zum Planbeginn rechnet HEMSight jetzt mit dem gemessenen Ladestand statt mit dem, der eine Viertelstunde vorher erwartet wurde. Die beiden stimmen fast nie überein.

- Bei Speichern, die Erzeugung und Entladung über denselben Anschluss führen, etwa der Anker Solarbank, hat HEMSight nie erkannt, dass sie schon mit voller Leistung laden. Der Einspeisung und der Abregelung fehlte damit eine ihrer drei Begründungen.

- Bei älteren gespeicherten Plänen konnte „vorzeitig abgebrochen" stehen, wo nie ein Plan zustande gekommen war. Im schlimmsten Fall fiel dadurch die ganze Bewertung des Plans aus, nicht nur dieser eine Wert.

- Ist für den Planungszeitraum nichts zu planen, sagt HEMSight das, statt mit einem internen Fehler abzubrechen.

- „Regelbasierter Ersatzplan genutzt" nennt jetzt den Grund. Er lag die ganze Zeit im Plan, wurde nur nirgends angezeigt.

#### Geräte

- Ein Geschirrspüler, der im Standby mehr zieht als die Abschlussschwelle, galt nach dem Programm nicht als fertig. Seine Sitzung blieb offen, bis Stunden später die Notbremse kam, und statt „fertig" gab es eine Warnung. Die Schwelle liegt jetzt bei fünf Watt.

- Meldet sich ein Gerät gegen Programmende abwechselnd als laufend und als fertig, sprang die Planungsseite zwischen „läuft" und „fertig" hin und her, und die eingeplante Zeit und die Tagesbilanz mit. Beim Trocknen zieht ein Spüler zu wenig, um am Strom erkannt zu werden; da war die Meldung des Geräts das Einzige, was blieb. HEMSight beruhigt sie jetzt genauso wie die Leistung.

- Endete ein Gerätelauf und meldete sich das Gerät sofort wieder als bereit, konnte die Fertigmeldung ganz ausbleiben. Ob sie kam, war Zufall. Jetzt kommt sie, weiterhin genau einmal, und eine per Notbremse beendete Laufzeit meldet sich nicht zusätzlich als fertig.

#### Sprache

- Überall dort, wo HEMSight die Antwort des Servers unverändert durchgereicht hat, stand der Text auf Deutsch oder Englisch, egal welche Sprache eingestellt war.

## 0.0.7-beta

### Bitte vorher lesen

**Der Plan geht nur noch zwei Tage weit, nicht mehr drei.** Die Einstellung dazu ist weg. Wer drei Tage stehen hatte, läuft nach dem Update mit zwei. Für den dritten Tag gab es sowieso nie einen echten Strompreis, rechnen musste HEMSight ihn trotzdem, und bei größeren Anlagen hat das gebremst.

**Wer das Auto im PV-Modus lädt, sieht abends einen leereren Hausakku.** Steht im E-Auto-Menü der PV-Modus, bekommt jetzt das Auto den Sonnenüberschuss, sobald der Hausakku über seiner Schwelle liegt. Vorher hat die Planung das jedes Mal neu ausgerechnet und der Hausakku hat fast immer gewonnen: an einem Tag mit 22 kWh Ladebedarf fielen 13 von 36 Ladefenstern aus, der Speicher lief derweil von 65 auf 76 Prozent. Die Reihenfolge ist jetzt fest: Haus, schaltbare Verbraucher, Auto, Hausakku. In den anderen Lademodi ändert sich nichts.

### Neu

#### Planung

- Große Anlagen bekommen wieder einen Plan. Findet der Optimierer in seiner Zeit keine Lösung, rechnet HEMSight gröber weiter: die nächsten 24 Stunden in Viertelstunden, danach in Stundenschritten. Beim nächsten Lauf fängt er gleich so an und probiert die feine Rechnung einmal pro Stunde noch mal. Wer heute einen Plan bekommt, merkt nichts davon.

- Der Plan sagt, was er höchstens kostet: „Bis zu 0,19 € teurer als der bestmögliche Plan". Wird der Abstand zu groß, ist der Plan noch zu sehen, steuern darf er aber nicht mehr.

#### Speicher

- Speicher, die es können, laden stufenlos aus dem Netz statt nur ganz oder gar nicht. Ob ein Gerät das kann, findet HEMSight selbst heraus und schreibt es auf die Speicherkarte. Wenn nicht, steht der Grund daneben und man kann nachhelfen.

- Die Speicherkarte zeigt, wohin der Zeitplan den Speicher schickt: ans Haus oder ans Netz.

#### Warmwasser

- Den Fühler am Aufstellort eines Warmwasserspeichers kann man jetzt im Assistenten eintragen, auch als zweiten Fühler am selben Shelly.

#### Schaltbare Verbraucher

- Schaltet HEMSight ein Gerät ein und es läuft nicht an, schaltet es wieder ab. Beim dritten Fehlversuch am selben Tag kommt eine Meldung. Bisher gab es diese Kontrolle nur für Warmwasser und Home Connect.

#### Integrationen

- Anker-Geräte lassen sich direkt im Heimnetz auslesen. Kein Anker-Konto, kein Home Assistant dazwischen. Den Anfang macht der Smart Meter Gen 2 als Netz-Zähler.

#### Einstellungen und Einrichtung

- Zeigt ein Gerät auf eine Entity, die es in Home Assistant nicht gibt, sagt HEMSight das jetzt. Mit Gerät und Feld, und in den Einstellungen gleich mit einem Knopf zum Geradebiegen. Bisher stand so ein Gerät einfach still. Geprüft wird auch, was nur zum Schalten gebraucht wird.

- Fehlt bei einem flexiblen Verbraucher alles, woran sich „startbereit" erkennen ließe, sagt das der Einrichtungscheck. Ohne so eine Quelle wird das Gerät nie eingeplant.

- Die Netzbezugsgrenze hat einen eigenen Bereich „Netzanschluss". Vorher lag sie eingeklappt beim Tarif, wo sie keiner gesucht hat.

### Verbessert

#### Planung

- Rechnen tut jetzt der Optimierer HiGHS. Bei zwei Speichern und vielen Geräten kam der alte in der verfügbaren Zeit oft auf nichts Brauchbares. Einstellen muss man nichts.

- Der Planrechner darf alle Kerne benutzen, die ihm zustehen. Bisher lief er auf einem.

- Am Ende des Planungszeitraums ist gespeicherte Energie nicht mehr wertlos. Der Plan hat nachts nur noch so viel geladen, wie bis zum Ende reichte, und den Speicher leerer stehen lassen als nötig.

#### Speicher

- Wer die Schwellen fürs Netzladen nie angefasst hat, bekommt keine unsichtbaren Vorgaben mehr aufgedrückt: Steht alles auf null, folgt das Netzladen einfach dem Plan.

- Die §14a-Drosselung bremst nur noch den Bezug aus dem Netz. Vorher hat sie auch das gedrosselt, was der Speicher ans Haus abgibt, und damit das Gegenteil bewirkt.

#### Schaltbare Verbraucher

- Ein Gerät gilt nach einer halben Minute als angelaufen, nicht erst nach fünf. Die Schwelle richtet sich nach seiner Größe. Eine Umwälzpumpe hat die alten 300 Watt nie erreicht.

- Verschiebt man die Frist eines flexiblen Verbrauchers, rechnet HEMSight sofort neu.

#### Integrationen

- Gerätemeldungen kommen in der Sprache der Oberfläche, auch die guten: „Sollwert gesetzt", „Verbunden, 2 Fahrzeuge gefunden" und rund sechshundert weitere aus siebenundachtzig Anbindungen. Übersetzt war bisher nur, was schiefging.

- Und wenn etwas schiefgeht, steht jetzt dabei was: Zeitüberschreitung, abgelehnte Anmeldung, Gerät nicht erreichbar. Vorher hieß alles „Verbindungsfehler".

- Anker-Werte kommen jede Minute aus der Cloud statt alle fünf.

- Die Gerätebibliotheken für Tesla und Kia/Hyundai/Genesis sind auf dem neuesten Stand.

#### Einstellungen und Einrichtung

- Die Bereitschaftsprüfung redet Deutsch. Jeder Bereich und jeder Prüfpunkt sagt in einem Satz, was Sache ist, und wo am Gerät etwas fehlt, steht die Anleitung dabei.

- Die Einstellungsformulare speichern nur noch ihre eigenen Felder. Hat jemand anders zwischendurch etwas geändert, gibt es einen Hinweis mit „Neu laden", statt dass seine Änderung verschwindet.

#### Meldungen und Anzeige

- Vier Benachrichtigungen kamen ohne Erklärung an: Netzladen aus Preisgründen, erreichte Ladegrenze, nahende Abfahrt, unsichere Planlage. Jetzt steht dabei, was gemeint ist.

- Die Live-Seite trennt „darf steuern" von „steuert gerade". Bisher stand da „HEMSight steuert live", auch wenn jeder Versuch an einer Sicherheitsprüfung hängenblieb.

- Im Fehlerbericht steht jetzt auch die Ladevorschau.

### Behoben

#### Planung

- Zwei Speicher und eine Einspeisegrenze führten zu „kein Plan möglich". Der Optimierer hat mit gerundeten Zahlen gerechnet, und darin ging die Regel „der zweite lädt erst, wenn der erste voll ist" nicht mehr auf.

- Nach einem Neustart wird sofort gerechnet, wenn der gespeicherte Plan nicht mehr weit genug reicht. Vorher stand die Steuerung bis zu einer Viertelstunde still, ohne dass irgendetwas kaputt war.

- Ein Plan, der nicht steuern darf, wird trotzdem angezeigt. Bisher blieb der alte stehen und man sah stundenalte Zahlen ohne Hinweis.

- Ein zu alt gewordener Plan wird auch so genannt. Vorher hieß es „letzter Planlauf gescheitert", und im Verlauf war kein gescheiterter Lauf zu finden.

- Ein Anlass zum Neuplanen geht nicht mehr verloren, wenn er in die Wartezeit nach dem letzten Lauf fällt.

- Nach einem Update plant HEMSight nicht mehr neu, bloß weil ein Messwert wieder da ist.

#### Speicher

- Bei Speichern mit einstellbarer Richtung steht in jedem Befehl, wohin die Leistung soll. Vorher hat das Gerät die letzte Richtung behalten. Aus „gib 500 W ans Haus" konnte so „zieh 500 W aus dem Netz" werden, ohne Fehlermeldung.

- Nach einem Befehl an den Speicher wird auch die Richtung nachgeprüft, und der Wert genau. 100 W daneben galten bisher als getroffen.

- Ein von Hand gesetzter Sollwert wird nicht mehr auf volle 100 W abgerundet.

- Das Netzladen hält sich wieder an den Plan. Es schaltete sich ein, wo keine Schwellen gesetzt waren, und hörte zu früh wieder auf.

#### E-Mobilität

- Der PV-Überschuss geht wieder ins Auto. Lief nebenbei etwas anderes, etwa die Warmwasserbereitung, plante HEMSight eine Spur zu viel Ladeleistung und ließ das Ladefenster dann ganz aus, obwohl eine Stufe darunter gepasst hätte. An einem Tag auf einer echten Anlage waren das 21 von 41 Ladefenstern und 12,3 kWh.

- „Ziel nicht erreichbar" zeigt die Energie, die wirklich geplant ist. Vorher stand da ein Zwischenwert, manchmal doppelt so hoch.

- Eine laufende Ladung verschwindet nicht mehr aus dem Plan, nur weil das Auto veraltet „nicht angesteckt" meldet oder die Wallbox ihren Status verschluckt. Solange Strom fließt, wird weitergeplant. Vorher rechnete HEMSight mit null und hat den Solarstrom ein zweites Mal verplant.

- Eine kurze Ladepause löscht das erkannte Fahrzeug nicht mehr. Eine Wolke hat gereicht, und danach wurde für den Rest des Zeitraums gar nicht mehr geladen.

- Die Ladestands-Spalte im Plan gehört zu dem Auto, für das gerechnet wurde. Vorher konnten zwei Fahrzeuge darin durcheinandergeraten, zu sehen als Sprung um zehn Prozentpunkte in einer Viertelstunde.

- Ein anderer Lademodus wirkt sofort, nicht erst beim nächsten Planlauf.

#### Warmwasser

- Der Warmwasserspeicher wird nach seiner echten Abkühlung geplant. Bisher hat HEMSight immer den geschätzten Wert aus der Konfiguration genommen, weil der Temperaturverlauf nirgends aufgezeichnet wurde.

- Heißt ein Warmwasserspeicher mit Großbuchstaben oder Leerzeichen, findet er seine Messwerte wieder. Kamen sie von einer Direkt-Integration, galt er als fühlerlos.

- Die Temperatur eines Warmwasserspeichers landete in der Messreihe als Leistungswert, Grad als Watt.

#### Schaltbare Verbraucher

- Ein schaltbarer Verbraucher läuft am Stück durch, statt jede Viertelstunde neu anzufangen. Dabei gingen Startzeit und Bestätigung verloren, und am Ende hat die Notbremse abgeschaltet, obwohl das Gerät lief.

- Die Notbremse schaltet nichts mehr ab, was messbar Strom zieht.

- Ein direkt angebundener Geschirrspüler löst wieder sofort eine Neuplanung aus, sobald man ihn startbereit macht.

- Ein Backofen wird nicht mehr wie ein Geschirrspüler geplant, bloß weil der Verbraucher zufällig so heißt.

#### Integrationen

- Betriebszustand und Restlaufzeit gibt es jetzt auch bei Miele, Samsung SmartThings und LG ThinQ.

- Ein Home-Connect-Gerät gilt nicht mehr als verschwunden, wenn es bei einem einzelnen Abruf fehlt. Ausgeschaltet ist ein Normalzustand, keine Meldung.

#### Einstellungen und Einrichtung

- Wer im Assistenten „Offen lassen" gewählt hat, kommt auch wieder hinein. Da stand „Backend nicht erreichbar", während dieselbe Anlage jede Einstellung anstandslos anzeigte.

- Kommt man nicht weiter, steht der richtige Grund da: Anlage antwortet nicht, Anmeldung fehlt, Rechte fehlen. Bei abgelaufener Sitzung geht es zur Anmeldung statt in die Sackgasse.

- Die Konfiguration ließ sich nicht mehr speichern, sobald an einer Integration ein Feld hing, das HEMSight nicht kennt, etwa die Mindest-Einschaltzeit von Shelly.

- Alte Einstellwerte, die es nicht mehr gibt, räumt das Update selbst weg. Bisher standen sie als „offene Probleme" da.

#### Meldungen und Anzeige

- Die Übersicht der Betriebszustände behauptet keine Einschränkung mehr, die es nicht gibt. Geräte mit Werten aus einer Integration standen dort als „ohne Wertquelle", und die Planung hat sich daraufhin grundlos unsicher gegeben.

- Sind mehrere Geräte betroffen, sagt die Meldung wie viele. Bei sieben Zonen mit totem Fühler erfuhr man von einer.

- Fällt eine Entity aus, ohne die ein Gerät nicht arbeitet, klingelt es wieder.

- Steht eine Gerätegruppe still, sagt HEMSight verständlich warum. Drei Fälle kamen als technisches Kürzel an.

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
