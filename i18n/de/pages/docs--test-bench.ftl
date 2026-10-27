# docs--test-bench: translations (de)

# text
seg-e305279d5b11 = Inhalt

# text
seg-245fe1f87b08 = Datei

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Quelle: <c1/>

# text
seg-d18a29239225 = Einen Empfänger gegen ein exportiertes Szenario betreiben

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Ein Empfängerhersteller, der einen GNSS-Simulator im Labor besitzt, kann die Fahrzeugbewegung eines Kshana-Szenarios darüber abspielen, aufzeichnen, was der zu prüfende Empfänger tut, und dieses Protokoll mit <c1/> anhand von Ereignissen bewerten, die vor dem Lauf festgelegt wurden. Kshana liefert die Bewegung, die Ereigniszeiten und die Bewertung. Es schreibt <b>kein Signal</b>: Nichts, was hier exportiert wird, synthetisiert, modelliert oder sendet eine Hochfrequenz- oder Basisband-Wellenform, und ein exportiertes Ereignis ist ein benanntes Zeitintervall, keine Anleitung zur Erzeugung von Störungen. Der Simulator und sein Betreiber liefern die Signale, und der Betreiber ist dafür verantwortlich, sie nur dort zu betreiben, wo es zulässig ist (leitungsgebunden oder abgeschirmt, gemäß den Sicherheitshinweisen des Simulators selbst).

# text
seg-414c7774d133 = Diese Seite ist ein Verfahren. Sie veröffentlicht keine Ergebnisse.

# text
seg-a0ad7b35922f = { "1" }. Export

# text
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
# c4: jamming
# c5: --epoch
# c6: YYYY-MM-DDTHH:MM:SS
# c7: Z
seg-798d75d3b65c = Gilt für die Szenarioart <c1/> (ein Fahrprofil mit Lage; die Ausfälle des Navigationszustands sind die Ereignisse) sowie für <c2/> und <c3/> (ein ruhender Empfänger für die Dauer des Szenarios; der Störsender eines <c4/>-Szenarios ist ein Ereignis über den gesamten Lauf). Andere Szenarioarten geben an, warum sie keine Fahrzeugtrajektorie haben. <c5/> ist der UTC-Zeitpunkt der Bewegungszeit null (Standard 2024-01-01T00:{ "00" }:00Z); die Szenarien tragen für die Fahrzeugbewegung kein eigenes Kalenderdatum. Er muss ein realer UTC-Zeitpunkt sein, <c6/> (ein abschließendes <c7/> wird akzeptiert), mit dem Jahr zwischen { "2000" } und { "2099" } und jedem Feld im zulässigen Bereich; alles andere wird abgelehnt. Die Ausgabe ist für dasselbe Szenario und dieselbe Epoche byte-identisch.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = eine Zeile pro Abtastwert: <c1/>, erdfest <c2/>, <c3/>, geodätisch <c4/>, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = die Epoche, Bezugssysteme, Einheiten, Spalten und Rundlauf-Toleranzen dieser CSV

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = NMEA-{ "0183" }-Sätze <c1/> und <c2/> pro Abtastwert, mit Prüfsummen

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = eine Zeile <c1/> und dann Zeilen <c2/> (nur geschrieben, wenn jedes Abtastintervall dieselbe ganze Zahl von Millisekunden beträgt; wird sie weggelassen, nennt der Befehl den Grund auf der Standardfehlerausgabe)

# text
# c1: [[events]]
# c2: receiver-trust
seg-d09d2dab9a17 = dieselben Ereignisse als <c1/>-Blöcke für ein <c2/>-Szenario

# text
# c1: kshana.test-conditions/1
# c2: receiver-log
# c3: recording.path
# c4: recording.sha256
# c5: receiver.*
# c6: type
seg-866a3c4870af = der Lauf als <a1><c1/></a1>-Dokument für eine <c2/>-Aufzeichnung: die Ereignisse als festgelegte Wahrheit, wobei <c3/>, <c4/>, <c5/>, der <c6/> jedes Ereignisses und die Leistung vom Labor auszufüllen bleiben

# text
seg-9ea6a94d4586 = Bezugssysteme und Konventionen

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Position:</b> WGS { "84" }, erdfest (ECEF: <c1/> durch den Äquator am Nullmeridian, <c2/> durch den Pol); <c3/>, <c4/>, <c5/> geben dieselbe Position geodätisch an, <c6/> über dem Ellipsoid.

# text
seg-93a2975d2a19 = <b>Geschwindigkeit:</b> erdfeste Achsen, relativ zur Erde.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> im Uhrzeigersinn von geografisch Nord in [{ "0" }, { "360" }), <c2/> positiv bei Bug nach oben, <c3/> positiv bei rechtem Flügel nach unten; Gier-Nick-Roll (3-2-1) vom lokalen Nord-Ost-Unten-System zu den Körperachsen x vorwärts, y rechts, z unten. Eine ruhende Quelle schreibt Nullen. NMEA und der Wegpunkttext enthalten keine Lage.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>Der Kurs ist das Gieren des Körpers, nicht die Fahrtrichtung.</b> Im Fahrprofil <c1/> giert der Körper in Rechteckwellen, während die Geschwindigkeit folgt, sodass sich Kurs und Kurs über Grund um mehrere zehn Grad unterscheiden können (bis zu etwa { "77" } Grad im mitgelieferten Szenario <c2/>). Der NMEA-Kurs <c3/> ist der Kurs über Grund, die Richtung des Geschwindigkeitsvektors, daher sehen ein Simulator, der den Kurs aus der Bewegungsdatei liest, und einer, der den Kurs aus der NMEA-Datei liest, unterschiedliche Winkel. Der Kurs über Grund aus der CSV ist <c4/> seiner nach Nord-Ost-Unten gedrehten Geschwindigkeit.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>Die Höhe folgt dem Szenario.</b> Bei <c1/> ist <c2/> die eigene Tangentialebenen-Schrittrechnung der Szenarioart für ihre Wahrheit und wird nicht konstant gehalten (etwa { "7" } m über die { "180" } s von <c3/>); sie ist die Bewegung des Szenarios, so geschrieben, wie sie ist.

# text
# c1: GGA
seg-f78a354f96ee = <b>NMEA-<c1/>-Platzhalter.</b> Fix-Qualität ({ "1" }), verwendete Satelliten ({ "12" }) und HDOP ({ "1.0" }) werden nur geschrieben, damit der Satz wohlgeformt ist. Sie sagen nichts über die Geometrie des Szenarios oder einen Empfängerzustand aus.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> nach der Epoche, UTC, Schaltsekunden nicht modelliert.

# text
# c1: GGA
seg-d2a2f655760d = <b>NMEA-Höhen sind ellipsoidisch.</b> Die Höhe in <c1/> enthält die ellipsoidische Höhe, und die Geoidabweichung wird als { "0.0" } geschrieben. Ein Simulator, der die Höhe als Höhe über dem mittleren Meeresspiegel behandelt, setzt das Fahrzeug um die lokale Geoidundulation versetzt.

# text
seg-ee3a9a3ec84d = <b>Rundlauf-Toleranzen</b> (getestet durch Zurücklesen jeder Datei): CSV-Position { "0.1" } mm, Breite und Länge { "1e-9" } Grad, Geschwindigkeit { "0.1" } mm/s, Winkel { "1e-6" } Grad; NMEA-Horizontalposition { "5" } mm, Höhe { "1" } mm, Geschwindigkeit { "0.001" } Knoten, Kurs { "0.001" } Grad.

# text
seg-a554992d2694 = Die Dateien in einen Simulator laden

# text
seg-757382614413 = Laborsimulatoren unterscheiden sich, und dieses Repository gibt kein Handbuch eines Simulators wieder. Prüfen Sie, welches der obigen Formate Ihr Simulator liest und welche Anforderungen er angibt:

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = Viele Bewegungsimporte erwarten eine feste Aktualisierungsrate, häufig { "10" } Hz. Das Szenario <c1/> arbeitet mit einer Schrittweite von { "0.1" } s; bei einem ruhenden Szenario setzen Sie <c2/> auf die Rate, die Ihr Simulator verlangt.

# text
seg-e98bf4bf6c6e = Manche Importe überspringen Abtastwerte, die zwischen ganzen Sekunden liegen, oder ignorieren die Zeitspalte und verwenden die Zeilenreihenfolge. Beginnen Sie die Bewegung auf einer ganzen Sekunde und halten Sie das Raster regelmäßig.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = Ein CSV-Import, bei dem sich Spalten zuordnen lassen, kann <c1/> direkt lesen: Wählen Sie die erdfesten oder die geodätischen Spalten und legen Sie ihre Einheiten anhand von <c2/> fest. Das Abschneiden der Dezimalstellen erzeugt eine falsche Beschleunigung, daher behalten Sie die geschriebene Genauigkeit bei.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = Die Datei enthält nur die Bewegung. Konfigurieren Sie die Konstellation, die Störung und das Empfänger-Frontend im Simulator und legen Sie deren Zeiten auf die Ereignisse in <c1/>.

# text
seg-024ab011a2e3 = Kshana schreibt keine herstellerspezifische Skriptschnittstelle.

# text
seg-6d67d4e2cdf0 = Mit den Readern eines Open-Source-Simulators geprüft

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Den Bewegungslesern von gps-sdr-sim (MIT, Commit 28ca29a6) wurden die Exporte von acht mitgelieferten Szenarien übergeben. Jeder Leser gab die exportierte Trajektorie zurück (<c1/>, vorab registriert in <c2/>):

# text
seg-3caed3fc2e47 = gps-sdr-sim-Option

# text
seg-ad9e78555851 = Übergeben Sie

# text
seg-4f9be75880d3 = Größte Abweichung von der CSV

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> wie geschrieben

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (Zeit, Breite, Länge, Höhe)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (Zeit, x, y, z)

# text
seg-ff26559a85e8 = exakt

# text
# c1: -u
seg-f4c13a327904 = Übergeben Sie <c1/> nicht die vollständige Bewegungs-CSV. Ihr Leser fasst { "100" } Zeichen pro Zeile, und eine CSV-Zeile hat etwa { "160" } Zeichen, sodass jede Zeile als zwei Abtastwerte gelesen wird. Die Kopfzeile wird als ein weiterer Abtastwert ohne Zahlen gelesen.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = gps-sdr-sim fasst höchstens { "3000" } Abtastwerte, also { "300" } s bei seinen festen { "10" } Hz, und ignoriert die Zeitspalte. Die Exporte von <c1/> arbeiten mit genau { "0.1" } s Schrittweite. Längere Szenarien, etwa das 20-minütige <c2/>, werden nur bis zu den ersten { "300" } s gelesen.

# text
seg-500243b6e402 = Dies prüft, dass die Dateien wie geschrieben gelesen werden. Es prüft weder die Physik des Szenarios noch irgendetwas, das der Simulator sendet.

# text
seg-a4c4514276e9 = { "2" }. Vor dem Lauf festlegen, was bewertet wird

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = Die Ereignisdatei enthält die Intervalle, die das Szenario definiert. Kopieren Sie <c1/> in ein <c2/>-Szenario, fügen Sie jede Vorhersage hinzu, die geprüft werden soll, und legen Sie die Monitorschwellen und Toleranzen fest, <b>bevor</b> der Empfänger läuft. Passen Sie sie nicht an, nachdem Sie das Protokoll gesehen haben; das Szenario, die Schwellen und das SHA-256 des Protokolls sind alle im Hash des Ergebnisses enthalten.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Die exportierten Ereignisse tragen die eigene Art des Szenarios: Der Störsender eines <c1/>-Szenarios ist <c2/>; ein Ausfall des Navigationszustands ist <c3/>, weil das Szenario angibt, dass GNSS nicht verfügbar war, nicht wie. Ändern Sie <c4/> entsprechend dem, was Sie im Simulator einstellen.

# text
seg-faa87b3ba315 = { "3" }. Den Empfänger betreiben

# text
seg-0a3b63cf5615 = Starten Sie den Empfänger und seinen Logger, starten Sie das Simulatorszenario mit der Bewegungsdatei und lassen Sie den Lauf das Kalibrierintervall, jedes Ereignis und einen Spielraum nach dem letzten abdecken. Bewahren Sie das eigene Protokoll des Empfängers auf (UBX, RINEX-{ "3" }-Beobachtungen, eine CSV eines Android-Loggers oder NMEA mit Satellitenstatus-Sätzen). Ein Protokoll ohne Signalstärke pro Satellit kann dennoch anhand der eigenen Position des Empfängers bewertet werden, aber die Träger-Rausch-Monitore benötigen sie.

# text
seg-fbbc12dfeb3f = { "4" }. Die Uhren abgleichen

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> zählt Ereigniszeiten ab der ersten Epoche des Empfängerprotokolls; die Bewegungsdatei zählt ab ihrem ersten Abtastwert. Beginnt das Protokoll <c2/> Sekunden vor dem ersten Abtastwert der Bewegung, addieren Sie <c3/> zu jedem <c4/> und <c5/>. Notieren Sie den Versatz und wie Sie ihn gemessen haben und geben Sie ihn im <c6/> des Szenarios oder in einem Kommentar an, denn ein falscher Versatz verschiebt jede Bewertung. Ereigniszeiten allein verraten den Versatz nicht; verwenden Sie die Startmarke des Simulatorszenarios oder die eigenen Zeitstempel des Empfängers.

# text
seg-22f7b68c445b = { "5" }. Bewerten

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = schreibt <c1/>, <c2/> und <c3/>. Für jedes Ereignis gibt das Ergebnis die Fehlalarme vor dem Beginn, den ersten Alarm und seine Monitore, die Latenz und den Ausgang (<c4/>, <c5/>, <c6/>, <c7/>) an, dazu einen vorhergesagten und einen beobachteten Rückgang des Träger-Rausch-Verhältnisses, wo Sie eine Vorhersage angegeben haben. Eine Abweichung wird berichtet, nie weggeregelt. Siehe <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Um zu sehen, für welche öffentlichen Framework-Zeilen die Sitzung Belege liefert:

# text
seg-abc6aaf44c95 = Siehe <a1>compliance/README.md</a1>. Dieser Bericht beschreibt die Evidenz in den Läufen, die Sie ihm übergeben; er trifft keine Feststellung über den Empfänger oder ein Framework.

# text
seg-69fa39640c2d = { "6" }. Den Rundlauf in einem signierten Paket verknüpfen

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Nach der Bewertung verknüpft <c1/> die vier Aufzeichnungen: das exportierte Szenario, die <a1>Testbedingungen</a1> des Labors, das Empfängerprotokoll und die Bewertung. Füllen Sie <c2/> aus (Pfad und SHA-256 des Protokolls, den geprüften Empfänger, Typ und angegebene Leistung jedes Ereignisses), dann:

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> enthält einen Block <c2/> (<c3/>) mit <c4/>, <c5/>, <c6/> und der Bewertung (erkannte Ereignisse von auswertbaren, erster Alarm), abgedeckt durch die Hashes des Manifests und die Signatur. Der Befehl lehnt ein Paket ab, dessen Bedingungen und Bewertungsereignisse nicht übereinstimmen oder dessen angegebener Protokoll-Hash nicht der des Protokolls ist. Wie jedes Nachweispaket ist es eine technische Aufzeichnung, keine Rechtsauffassung.

# text
seg-5fe6548911da = Durchgespieltes Beispiel: gps-sdr-sim schreibt eine Datei

# text
seg-eeccc823e109 = Dieses Beispiel verwendet den Open-Source-Simulator gps-sdr-sim nur, um aus der exportierten Bewegung <b>eine Basisbanddatei zu schreiben</b>. Kshana sendet nicht, und nichts auf dieser Seite automatisiert das Abspielen dieser Datei über ein Funkgerät. Wenn Ihr Labor eine solche Datei in einen Empfänger einspielt, liegt das in der Verantwortung Ihres Betreibers und geschieht nur dort, wo es zulässig ist (kabelgebunden oder abgeschirmt, gemäß den Sicherheitshinweisen des Simulators und des Funkgeräts), und Kshana dokumentiert oder kapselt es weder.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = Was das Labor anschließend mit <c1/> tut, geschieht außerhalb von Kshana. Das eigene Protokoll des Empfängers, wie auch immer gewonnen, ist das, was Schritt { "5" } bewertet und Schritt { "6" } verknüpft. Die Dateien und die Prüfungen, die Kshana an seinen eigenen Exporten vornimmt, sind nur mit synthetischen Daten getestet (<c2/>); hier wird kein Laborlauf behauptet.

# text
seg-dffcbdb8e6c3 = Was dieses Verfahren nicht leistet

# text
seg-d0b62c238953 = Es erzeugt kein Signal und sagt nicht, welche Störung ein Simulator erzeugen soll. Die Ereignisse sagen wann, nicht was.

# text
seg-3aa11bed60c8 = Eine einzelne Sitzung ist ein einzelner Datenpunkt. Das Ergebnis beschreibt dieses Protokoll unter dieser Konfiguration und sagt nichts über andere Empfänger, Firmware, Antennen oder reale Störungen.

# text
seg-b156403456e4 = Höhen, Raten und Zeitabgleich sind vom Betreiber gegen den Simulator zu prüfen; der Export gibt seine eigenen Konventionen und Toleranzen an und nicht mehr.

# text
seg-337ff53bc890 = <s1>Zurück</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Weiter</s1>Compliance-Zuordnung
