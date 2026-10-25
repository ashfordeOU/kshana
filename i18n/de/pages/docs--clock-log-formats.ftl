# docs--clock-log-formats: translations (de)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Quelle: <c1/>

# text
seg-0dfd1160c5d7 = Formate für Uhren-Logs

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> liest ein gemessenes Uhren-Log in eine einzige normierte Phasenreihe ein: ein gleichmäßiges Raster von Abtastwerten <c2/>, mit dem angegebenen oder ermittelten Abtastintervall <c3/>, wobei jede Lücke gezählt und die Einheiten des Logs benannt werden. Acht Formate werden gelesen, jeweils eine dokumentierte Teilmenge. Alles außerhalb der Teilmenge wird mit einem Fehler zurückgewiesen, der benennt, was gefunden wurde, statt es näherungsweise zu lesen.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Abkürzungen.</b> RINEX ist das Receiver Independent Exchange Format. TICC ist der Zeitintervallzähler von TAPR (Tucson Amateur Packet Radio). ADEV ist die überlappende Allan-Abweichung, TDEV die Zeitabweichung und MTIE der maximale Zeitintervallfehler. <c1/> ist das Abtastintervall in Sekunden.

# text
seg-1d5a6c2090af = Wo ein Log verwendet werden kann

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b>: <c2/> anstelle von <c3/> oder <c4/>. Die Phase des Logs in ns ist die gegen die Masken geprüfte Reihe des Zeitfehlers, und der Bericht erhält einen Block <c5/>, der angibt, wie es gelesen wurde.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>Der Typ Uhr</b>: Eine Tabelle <c1/> fügt dem Lauf einen Block <c2/> hinzu: wie das Log gelesen wurde, den SHA-256 der Tabelle (<c3/>; der <c4/> des Laufs deckt die Tabelle nicht ab) und der Phasenabtastwerte sowie die überlappende ADEV, TDEV und MTIE bei oktavweisen Mittelungsfaktoren. Er benötigt <c5/>. Das simulierte Holdover ist unverändert.

# text
seg-2f464fe709c9 = Ohne die Tabelle werden beide Typen exakt wie zuvor geparst, gehasht und ausgewiesen.

# text
seg-c931c5ec2f4a = Die Formate

# text
# c1: rinex-clk
# c2: TIME SYSTEM ID
# c3: END OF HEADER
# c4: AS
# c5: AR
# c6: CR
# c7: DR
# c8: MS
seg-7f608c733407 = <b><c1/></b>: RINEX-Uhrdateien, Versionen { "2" } und { "3.00" } bis { "3.04" } (einschließlich des Namensfelds mit neun Zeichen in { "3.04" }). Der Header wird nur auf <c2/> gelesen und bis <c3/> übersprungen. Von den Datensätzen werden nur die Datensätze <c4/> (Satellit) und <c5/> (Empfänger oder Station) einer Uhr behalten, die nach Namen ausgewählt wird. Ihr erstes Wertefeld, der Uhrenbias in Sekunden, ist die Phase. Fortsetzungszeilen und die Datensätze <c6/>, <c7/> und <c8/> werden übersprungen. Die Epochen sind die Kalenderfelder des Datensatzes, als Sekunden ab 1980-01-06 { "00" }:{ "00" }:{ "00" } im eigenen Zeitsystem der Datei, ohne Umrechnung.

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b>: ASCII-Phasen- oder Frequenz-Logs im Stil von TimeLab, die Klartextform, die TimeLab exportiert und die sein ASCII-Import und Stable32 lesen. Pro Zeile steht ein Messwert: entweder eine einzelne Spalte mit gleichmäßigem <c2/> oder zwei Spalten <c3/>. Spalten dürfen durch Leerraum, Kommas oder Semikola getrennt sein.

# text
# c1: #
# c2: ;
# c3: %
# c4: key = value
# c5: key: value
# c6: tau0
# c7: units
# c8: s
# c9: ms
# c10: us
# c11: ns
# c12: ps
# c13: data
# c14: phase
# c15: frequency
# c16: time_units
# c17: s
# c18: mjd
seg-a7ae9e712bea = Zeilen, die mit <c1/>, <c2/> oder <c3/> beginnen, sind Kommentare. Ein Kommentar der Form <c4/> (oder <c5/>) setzt <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> oder <c12/>, für die Phase), <c13/> (<c14/> oder <c15/>) oder <c16/> (<c17/> oder <c18/>, für die erste von zwei Spalten).

# text
seg-84cf463d5e74 = Eine führende nichtnumerische Zeile wird als Spaltenkopf genommen.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Frequenzdaten (relative Frequenz) werden nur als einzelne Spalte akzeptiert. Sie werden zur Phase als <c1/> integriert (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = Binäre Projektdateien von TimeLab und Projektdateien <c1/> werden nicht gelesen.

# text
# c1: ticc
seg-3d8853fa9c92 = <b><c1/></b>: Logs des Zählers TAPR TICC (TICC Operation Manual, Revision vom { "23" }. November { "2016" }, „measurement modes“). Jedes Datenfeld ist in Sekunden mit { "12" } Dezimalstellen angegeben.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = Zeilen im Timestamp-Modus (<c1/>, <c2/>) und der Pseudo-Zeitstempelkanal des TimeLab-Modus (<c3/>) sind Zeitstempel von Ereignissen. Die Phase des gewählten Kanals ist sein Zeitstempel minus des nominellen Takts: <c4/>, wobei <c5/> die ganze Anzahl von <c6/> seit dem ersten Ereignis ist. Ein verpasstes Ereignis ist eine Lücke.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = Zeilen im Intervall-Modus (<c1/> oder jede mit <c2/> beginnende Bezeichnung) werden direkt als Phase gelesen, ein Messwert je <c3/>. Das Szenario muss <c4/> angeben, weil die Zeile keine Zeit enthält.

# text
seg-75301936698f = Ausgaben im Perioden-Modus und im Debug-Modus werden zurückgewiesen. Ein Kanal, dessen Messwerte nicht ansteigen, wird als Perioden-Modus gemeldet.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = Zeilen, die mit <c1/> beginnen, und Zeilen, die nicht <c2/> entsprechen (etwa das Startmenü), werden übersprungen und gezählt.

# text
seg-cb4b7062dd5a = Logs von linuxptp und chrony

# text
seg-c6c70813a988 = Diese fünf Formate lesen, was ein laufender Zeit-Daemon über seine eigene Uhr schreibt. Sie dienen dazu, eine Zeitkette nachträglich zu prüfen (eine Boundary Clock, die PHC eines Grandmasters, einen chrony-Client) und zwar mit denselben Schätzern wie die anderen Logs. Sie lesen nicht die Konfiguration eines Daemons, und nichts hier spricht mit einem Daemon.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: die Servo-Zeilen von linuxptp, wobei jedes Format nur Zeilen seines eigenen Programms liest. Ein Messwert ist eine Zeile der Form

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = Der Zeitstempel ist das erste <c1/> in der Zeile (die monotone Uhr des Daemons). Er wird auch nach einem Syslog-Präfix gelesen, wobei eine Prozess-ID wie <c2/> keinen Bruchteil hat und nicht übernommen wird.

# text
# c1: offset
seg-72678cd6c03e = Die Phase ist der protokollierte Wert <c1/> in Nanosekunden, in Sekunden umgerechnet. Es ist der vom Daemon gemessene Zeitfehler seiner Slave-Uhr gegenüber seiner Referenz, wie protokolliert: positiv, wenn die Slave-Uhr vorgeht. Es ist der unter Servo-Regelung verbleibende Fehler, nicht die Drift einer freilaufenden Uhr.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = Die Wörter zwischen dem Zeitstempel und <c1/> benennen die Quelle (<c2/>, <c3/> bei einem Präfix <c4/>, <c5/>, <c6/>). Ein Log mit mehr als einer Quelle braucht <c7/>; der Fehler listet sie auf.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = Messwerte, bevor das Servo erstmals <c1/> (locked) meldet, werden ausgelassen und in <c2/> gezählt: <c3/> und <c4/> sind die Zustände ungesperrt und Sprung, deren Offsets Einschwingvorgänge sind. Ein Servo, das <c5/> nie erreicht, wird zurückgewiesen. Eine Zeile ohne Zustandsfeld wird so gelesen, wie sie ist.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = Zusammenfassungszeilen (<c1/>), Meldungen <c2/> und <c3/> sowie Zeilen anderer Programme werden übersprungen und gezählt.

# text
seg-92164f4a56be = Zeitstempel, die rückwärts laufen (ein neu gestarteter Daemon), werden zurückgewiesen; das Log ist zu teilen.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: die Dateien <c3/> und <c4/> von chrony, nach Spaltenposition gelesen. Ein Messwert ist eine Zeile mit mindestens { "14" } Spalten (tracking) oder { "13" } (statistics), die mit einem UTC-Datum und einer Uhrzeit <c5/> beginnt. Die Spaltenkopfzeile wird übersprungen und gezählt; die Trennlinie <c6/> darunter wird übersprungen, ohne gezählt zu werden.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking: Spalte { "7" }, der lokale Offset bei der Aktualisierung der Uhr, in Sekunden. Die IP-Adresse oder Referenz-ID ändert sich mit der gewählten Quelle, sodass ohne <c1/> jede Zeile als eine lokale Uhr gelesen wird. <c2/> behält eine Referenz-ID.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics: Spalte { "5" }, der geschätzte Offset einer Quelle, in Sekunden. Es gibt eine Reihe je Quelladresse, und das Log braucht <c1/>, wenn es mehr als eine enthält.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = Die Epochen sind Sekunden ab 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, ohne Behandlung von Schaltsekunden. Chrony schreibt eine Zeile je Aktualisierung oder je Quellmesswert, sodass der Abstand nicht gleichmäßig ist. <c1/> ist der mediane Abstand; ein Messwert unter einem halben <c2/> nach dem davor behaltenen wird verworfen und in <c3/> gezählt, und ein größerer Abstand ist eine Lücke, die <c4/> meldet. Geben Sie <c5/> und <c6/> für ein Log mit gleichmäßigem Abfrageintervall an.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = Die Spalten von chrony und die Zeilenlayouts von linuxptp entsprechen der öffentlichen Dokumentation der Daemons. Die Fixtures in <c1/> sind für Kshana mit erfundenen Werten geschrieben (siehe dessen <c2/>); es wurde kein reales Log gelesen, sodass ein Layout, das sich zwischen Versionen eines Daemons unterscheidet, weiterhin zurückgewiesen oder falsch gelesen werden kann. Eine Zeile, die nicht passt, wird übersprungen und gezählt, nie erraten.

# text
# c1: tau0
seg-b120a37b7d60 = <c1/> und Lücken

# text
# c1: tau0
# c2: tau0
# c3: median-spacing
# c4: tau0_s
# c5: input
# c6: tau0
# c7: header
seg-6fd68aad2fd7 = Enthält das Log Zeitstempel und ist kein <c1/> angegeben, ist <c2/> der mediane Abstand aufeinanderfolgender Zeitstempel, auf vier signifikante Stellen gerundet, und die Quelle wird als <c3/> gemeldet. Der Abstand eines Zählers weicht vom nominellen um den Frequenzversatz der Referenz ab, Teile in { "10" }^{ "6" } oder weniger. Ein <c4/> im Szenario hat immer Vorrang (Quelle <c5/>), danach ein Kommentar im Kopf <c6/> (Quelle <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = Die Messwerte werden auf das Raster <c1/> gelegt, und eine fehlende Epoche ist eine Lücke. Messwerte, die um mehr als { "1" } % von <c2/> vom Raster abweichen, werden verworfen und gezählt, ebenso Duplikate (das erste bleibt erhalten). Die Regel für Lücken ist eine der folgenden:

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (der Standard): Jede Lücke ist ein Fehler, der die Lücken zählt;

# text
# c1: longest
seg-593c998b65e0 = <c1/>: den längsten lückenlosen Abschnitt behalten;

# text
# c1: linear
seg-f184ce746389 = <c1/>: innere Lücken durch lineare Interpolation füllen und die Zahl der gefüllten ausweisen.

# text
seg-1f3dc3429615 = Die Schätzer brauchen eine lückenlose Aufzeichnung, weshalb Lücken hier aufgelöst werden.

# text
# c1: src/clock_log.rs
# c2: tests/fixtures/clock_log/linuxptp_chrony/
# c3: tests/clock_log_allantools.rs
# c4: tests/fixtures/clock_log/PREREGISTRATION.md
seg-fe7d27a473aa = MODELLED. Dies ist ein Parser, und seine Ausgabe speist Schätzer, die an anderer Stelle gegen allantools validiert sind. Die Unit-Tests in <c1/> verwenden kleine, von Hand geschriebene Logs und für die Formate von linuxptp und chrony die Fixtures in <c2/>. <c3/> führt den in <c4/> vorregistrierten Vergleich aus: drei synthetische Logs mit Seed, eines je Format, von einem unabhängigen Leser zurückgelesen, der anhand dieser Seite vom selben Autor geschrieben wurde, wobei ADEV, TDEV und MTIE gegen allantools { "2024.6" } geprüft werden; dieser Vergleich deckt nur die ersten drei Formate ab, und die Leser für linuxptp und chrony haben Parser-Tests, aber keinen Vergleich mit einer unabhängigen Referenz. Die Logs sind synthetisch, sodass nichts hier eine reale Uhr oder einen realen Zähler beschreibt.

# text
seg-0f061f726ec5 = <s1>Zurück</s1>Holdover-Test und Zeitgebungs-Hardware in der Schleife

# text
seg-3c89cfcbbd04 = <s1>Weiter</s1>Hardware-Sicherheit

# text
seg-9b52cd5eb4be = tau0 und Lücken
