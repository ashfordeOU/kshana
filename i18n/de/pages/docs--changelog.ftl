# docs--changelog: translations (de)

# text
seg-9a2a5f0a8a02 = Sonnensystem

# text
seg-20db2c79b998 = Validiert

# text
seg-a20b4a6e8f53 = chipskalige Atomuhr

# text
seg-49a994d77d2f = temperaturkompensierter Quarzoszillator

# text
seg-2247a2344710 = Bedeutung

# text
seg-5770537524d3 = Bereich

# text
# c1: CHANGELOG.md
seg-40d4fc0d3922 = Quelle: <c1/>

# text
seg-7333b85d448f = Alle nennenswerten Änderungen an Kshana sind hier dokumentiert.

# text
seg-bbc8f38627f1 = Das Format basiert auf <a1>Keep a Changelog</a1>, und dieses Projekt hält sich an <a2>Semantic Versioning</a2>. Solange das Projekt vor 1.0 ist, kann sich das öffentliche Schema für Szenarien und Ergebnisse noch ändern; inkompatible Änderungen werden ausdrücklich genannt.

# text
seg-985f7b4c001a = Unveröffentlicht

# text
seg-a2f583aadd0b = Keine neuen Funktionen: eine Korrektur an der Befehlszeile, Abhängigkeitsaktualisierungen im Werkzeug für die Kreuzvalidierung und Dokumentation. Die Ergebnisse der Engine sind gegenüber { "0.38.0" } unverändert.

# text
seg-c9a8a5898ced = Behoben

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = Die Befehlszeile beendet sich still mit dem Status { "141" }, wenn ihre Standardausgabe schließt (<c1/>), statt mit "failed printing to stdout: Broken pipe" abzustürzen. { "141" } ist { "128" } plus SIGPIPE, der Status, den eine Shell für <c2/> meldet. Behandelt wird nur eine geschlossene Pipe: Eine volle Festplatte oder jeder andere Schreibfehler meldet sich weiterhin selbst, und ein Live-Feed, der in einen geschlossenen Socket schreibt, erhält weiterhin seinen Schreibfehler. <c3/> schließt den Leser, bevor das Programm startet, sodass der erste Schreibvorgang in jedem Lauf fehlschlägt.

# text
# c1: xval/
seg-2a47e785cc1d = Abhängigkeitsaktualisierungen im Werkzeug für die Kreuzvalidierung (<c1/>); keine Änderungen an ausgelieferten Crates, Wheels oder Paketen.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } auf { "0.9.11" } (RUSTSEC-2026-0186) in den Locks der ANISE-Gegenprüfung (<c2/>, <c3/>); die Locks synchronisieren außerdem die Pfadabhängigkeit <c4/> im Repository neu.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } auf { "13.0.0" } und <c2/> { "2026.7.22" } auf { "2026.10.19" } in den Versionsfestlegungen der Umgebung für die unabhängigen Referenzen (<c3/>, <c4/>): die korrigierten Versionen für acht pillow-Sicherheitshinweise und einen certifi-Sicherheitshinweis.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, die README und diese Datei führen jeden Zielwert von kshana-bench auf, der NOT MET ist, wie in <c2/> festgehalten: <b>A2</b> (<c3/> AUC { "0.766" } gegenüber mindestens { "0.80" } auf dem Test-Split), <b>D1</b> (größte Lücke { "0.0301" }) und <b>Aufgabe (b) R1</b> (übernommen, nicht erneut ausgeführt). Kein Zielwert wird gelockert.

# text
# c1: docs/kinds/by-kind/
# c2: docs/KINDS.md
# c3: docs/COMMANDS.md
# c4: docs/ALL-SURFACES.md
# c5: docs/CAPABILITY-DOMAINS.md
# c6: tools/gen_kinds_index.py
# c7: tools/gen_readme_blocks.py
# c8: tools/gen_figures_038.py
# c9: tools/readme_audit.py
# c10: tests/readme_completeness_doc_sync.rs
seg-44d9c9622c24 = Vervollständigung der README: ein Inhaltsverzeichnis; die Szenarioarten, nach Familien abgelegt, jeweils mit einer Seite unter <c1/> (die Beschreibung und die Felder der Engine, die Eingaben und Ergebnisse eines Beispiellaufs, die Registerzeilen und unabhängigen Referenzen, die Einschränkungen, die der Bericht des Laufs nennt, und das Diagramm, das die Engine schreibt), ein Übersichtsblatt je Familie, alle indiziert durch <c2/>; jeder Befehl in <c3/>; jede Oberfläche, jeder Plugin-Befehl, jede Skill und jede Studio-Seite in <c4/>; jeder Fähigkeitsbereich in <c5/>; eingebettete Mermaid-Diagramme (Systemüberblick, Oberflächen, innere Schleife, Empfängervertrauen, Labor-Rundreise, Studio, Test- und Release-Ablauf, Modulkarte, Verteilung). Geschrieben von <c6/>, <c7/> und <c8/>; geprüft von <c9/>; abgesichert durch <c10/>, das außerdem Beschreibung und Felder jedes Eintrags an die Engine bindet.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/>: rendert ein Mermaid-Diagramm unter Linux als SVG und PNG und aktualisiert den Render-Nachweis.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README: Die Abbildungen zu Weltraumnutzern und zum Mond verwendeten Pfade relativ zu <c1/> und wurden daher in der README nicht geladen; ein Link zeigte auf <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Zwei veraltete, von Hand kopierte Diagrammdateien entfernt (<c1/>, <c2/>), die keine Seite verwendete und die nicht mehr zur Engine passten; <c3/> enthält die aktuellen Diagramme.

# text
seg-033d52126d8a = Hinzugefügt

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>GNSS jenseits der Konstellation (<c1/>).</b> Eine neue Szenarioart für Raumfahrzeuge oberhalb, rund um und jenseits der GNSS-Umlaufbahnen (<a1><c2/></a1>): Verfügbarkeit von einem und von vier Signalen, Ausfalldauern, C/N0, DOP sowie Hauptkeulen- gegenüber Nebenkeulen-Verbindungen für GPS, GLONASS, Galileo, BDS, QZSS und NavIC auf einer Schale oder entlang von LEO-, MEO-, GEO-, HEO- und Mondtransfer-Trajektorien; Sendemuster aus dem Heft, parametrisch oder vom Benutzer geliefert; ein Modell für Ionosphäre, Plasmasphäre und Atmosphäre mit Randstrahl; ein Empfängerentwurf für schwache Signale; ein bordeigener GNSS-erweiterter Kalman-Filter für HEO und Mondtransfer; und relative Navigation im Verbund. Verglichen mit dem Heft zum ICG Space Service Volume unter einer Vorregistrierung, die vor dem Lauf committet wurde: Die Konstanten der minimal abgestrahlten Leistung und der Zielwert für den Mond stimmen überein, die übrigen Zielwerte sind unter der vorab registrierten Lesart nicht erreicht (fast alle durch den inkonsistenten GLONASS-Strahlwinkel des Hefts), und der parametrische Nebenkeulen-Ersatz reproduziert die gemessenen Antennendiagramme der GPS-Panels nicht. Alles bleibt MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Mondbahn und Mondoberfläche als Navigations- und Geodäsie-Infrastruktur (<c1/>).</b> Eine neue Szenarioart mit fünf Studien, ausgewählt über <c2/> (<a1><c3/></a1>): Konsistenz einer bordeigenen Bahnbestimmung per Erd-GNSS in einer nahezu geradlinigen Halo-Bahn gegenüber einer unabhängigen Bodenbestimmung aus Entfernung und Entfernungsrate; gemeinsame doppeldifferenzierte Trägerphase von Oberflächenstation und Orbiter mit ganzzahliger LAMBDA-Festlegung; Fisher-Information des siebenparametrigen Mond-Datums mit und ohne Entfernungsmessungen zwischen Orbiter und Oberfläche; Versätze zwischen den Techniken GNSS, VLBI und Laserentfernungsmessung gegenüber dem lokalen Anschluss; und Sensitivität gegenüber h2, k2, l2 und der physikalischen Libration. MODELLED, mit ILLUSTRATIVE-Eingaben: Die Numerik wird an unabhängigen numpy- und scipy-Programmen geprüft, und nichts wird mit einer Messung einer Mondgröße verglichen. Die Zielwerte wurden in <c4/> und zwei offengelegten Änderungen festgelegt. Drei sind NOT MET, und jeder ist durch einen Test festgeschrieben, der die Verfehlung behauptet: C3 (ein eingespeister Kraftfehler wird nicht mit der vorab registrierten Rate erkannt), Q3 (die Bootstrap-Erfolgsrate weicht von der numpy-Referenz um { "1.7e-6" } ab, bei einem Zielwert von { "1e-9" }, wegen der Normalverteilungs-Näherung von LAMBDA), und die Spurhälfte von G3 (das Hinzufügen einer Entfernungsmessungsfamilie senkt die Spur der Pseudoinversen nicht immer). Die übrigen sind erreicht (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Ein sechstes Paper in der Forschungstabelle.</b> „Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever“ (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) zeigt, dass die Verdünnung der Präzision für reine Entfernungsverfolgung im cislunaren Raum nicht definiert ist, und verwendet stattdessen die Beobachtbarkeits-Gramian-Matrix auf vier ebenen weiten retrograden Bahnen: Reine Entfernungsmessung hat Rang { "2" } von { "4" } in einem Augenblick und braucht einen Bogen von etwa { "2.09" } h, Entfernungsrate (Doppler) ergibt sofort Rang { "4" }, und die gemeinsame Schätzung einer Station mit Satellitenzuständen und Uhren bleibt ohne eine externe interferometrische Beobachtungsgröße um eins rangdefizient. Ihre Zahlen werden von der Szenarioart <c1/> (<c2/>) neu erzeugt; <c3/> prüft die Schwelle mit einem unabhängigen Schätzer. Die Forschungskarte der README, die READMEs von Crates, npm und PyPI sowie der Generator führen es.

# text
seg-d74a1b2dcb38 = Der neutrale Schiedsrichter, messbar gemacht.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> liest den veröffentlichten NPRA-Jammertest-Katalog und -Sendeplan als geplante Wahrheit (Katalog-IDs bleiben erhalten), und <c2/> bewertet ein Empfängerprotokoll dagegen je Test (Erkennungslatenz, verpasste Alarme, Fehlalarme, Erholungszeit), wahlweise als signiertes Nachweispaket (<a1><c3/></a1>). Die Zielwerte der Bewertung wurden vor jedem bewerteten Lauf vorab registriert (<c4/>). Beim Datensatz JammerTest { "2024" } (abgerufen, nie eingebunden) scheiterte die vorab registrierte Mindestdatenregel sowohl im ersten Lauf als auch in der Überarbeitung der Datenbehandlung, sodass kein Zielwert bewertbar ist und nichts behauptet wird; beide Läufe sind festgehalten und festgeschrieben. MODELLED: Der Plan besteht aus den protokollierten Fenstern des Datensatzes, nicht aus aufgezeichneten Sendezeiten. Der NMEA-Satz von SimulaMet aus { "2025" } wird nicht angebunden (auf seiner Seite ist keine Lizenz angegeben).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Die eigenen Flags des Empfängers neben denen von Kshana.</b> UBX-NAV-STATUS <c1/> und UBX-SEC-SIG werden in jeder Epoche in <c2/> gelesen, und der Vergleich <c3/> im Ergebnis stellt sie den Monitoren von Kshana gegenüber (beide, nur Empfänger, nur Kshana, keiner); er löst keinen Alarm aus und ändert keine Bewertung. Ein Septentrio-SBF-Leser (PVTGeodetic, MeasEpoch, RFStatus, nur lesend, auf dem MIT-lizenzierten Crate <c4/>) und <c5/> (ein serieller oder USB-NMEA-Feed, nur lesend; er schreibt nie in einen Empfänger) kommen hinzu.

# text
# c1: docs/TIMING-HIL.md
# c2: docs/HARDWARE-SAFETY.md
# c3: holdover-test
# c4: clock_log
# c5: ptp4l
# c6: phc2sys
# c7: ts2phc
# c8: tracking
# c9: statistics
# c10: iq scene --format sdrx
# c11: iq monitor --follow
# c12: compliance-report
# c13: lab-attestation
# c14: HARDWARE-SAFETY.md
seg-90d9927fe3e2 = <b>Zeitgebung und Hardwaresicherheit</b> (<a1><c1/></a1>, <a2><c2/></a2>). Die Szenarioart <c3/> bewertet einen Holdover-Test eines Zeitgebungssystems (GNSS vom Betreiber entfernt, Holdover, Wiederherstellung) aus einer gemessenen Zeitfehleraufzeichnung, gemessen an den ITU-T-Masken aus öffentlichen Tabellen. <c4/> liest Protokolle von linuxptp (<c5/>, <c6/>, <c7/>) und chrony (<c8/>, <c9/>). <c10/> schreibt ION-GNSS-SDR-Metadaten, und <c11/> überwacht eine SigMF-Aufzeichnung, während sie wächst (nur Empfang). <c12/> erhält das Foundational PNT Profile von NIST IR 8323r1 ({ "15" } paraphrasierte Zeilen, liefert Belege für). Ein Nachweispaket kann die <c13/> des Betreibers in seinem signierten Manifest festhalten, nie verifiziert; die Hardwarestufen { "0" } bis { "4" } und die rechtlichen Hinweise stehen in <c14/> (rechtliche Prüfung steht aus). Es gibt keinerlei Sendepfad.

# text
# c1: kshana bench
# c2: bench/SPEC.md
# c3: docs/BENCH.md
# c4: xval/bench/PREREGISTRATION.md
# c5: agc_k_sigma
# c6: xval/bench/RESULTS-v2.md
# c7: bench_score
# c8: bench_leaderboard
# c9: score_benchmark
# c10: render_leaderboard
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): feste Aufgaben, Splits und Metriken für die Erkennung von GNSS-Störungen in Empfängerprotokollen (JammerTest { "2024" }) und IQ, die Vorhersage des Holdovers der Zeitgebung (IGS-Uhren) und die Optimismuslücke bei Daten außerhalb der Verteilung; Split-Manifeste mit festgeschriebenen Hashes und Abrufskripten (keine Daten eingebunden), ein versiegelter zurückgehaltener Datensatz per Commit und Aufdeckung, ein Schema für Ergebnisdateien und eine statische Bestenlistenseite. Basislinien unter Zielwerten, die in <c4/> vorab registriert wurden: Zielwerte des Bewerters erreicht, C1 bis C3 erreicht, D2 erreicht; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } gegenüber mindestens { "0.80" } auf dem Test-Split), <b>D1 NOT MET</b> (größte Lücke { "0.0301" }) und <b>Aufgabe (b) R1 NOT MET</b> (übernommen, nicht erneut ausgeführt), jeweils festgeschrieben (<c6/>). Jede Bewertung ist MODELLED. Python <c7/>, <c8/>; WebAssembly dasselbe; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Störungs-Observatorium</b> (<c1/>, <c2/>, <a1><c3/></a1>): ein reproduzierbares tägliches GeoJSON, PNG und Vorfallbericht-JSON mit drei Zuständen (degraded, not degraded, not observed), einer Mindestverzögerung von { "24" } h, Zellen von { "0.5" } Grad oder gröber, ohne zugeschriebene Ursache und mit zurückgewiesenen OpenSky-Daten; eine Sensitivitätsstudie der vorab registrierten Parameter; ein 30-tägiger Baltik-Rückkatalog von adsb.lol.

# text
# c1: receiver-trust
# c2: docs/MACHINE-INPUTS.md
# c3: [log] format
# c4: rtklib-pos
# c5: .pos
# c6: novatel
# c7: BESTPOS
# c8: RANGE
# c9: RXSTATUS
# c10: self_report
# c11: receiver-self-report
# c12: rtcm3
# c13: NOTICE
# c14: gnss-sdr
# c15: integrations/gnss-sdr/relay.py
seg-497ae18bfb03 = <b>Maschinen- und Sensoreingänge für <c1/></b> (<a1><c2/></a1>). Neue Werte für <c3/>, alle nur lesend, MODELLED, mit selbst geschriebenen Fixtures und ohne eingebundene Daten: <c4/> (RTKLIB-Lösungsdateien <c5/>), <c6/> (OEM7-ASCII und Binär <c7/>, <c8/> C/No und <c9/>; das Jammer-Flag des Empfängers wird zur <c10/> der Epoche, den Alarmen von Kshana gegenübergestellt durch den Vergleich <c11/>), <c12/> (MSM4- und MSM7-C/N0 für GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou und NavIC; Layouts aus den unter BSD lizenzierten pyrtcm-Tabellen, deren Hinweis in <c13/> steht, nicht aus dem RTCM-Standard) und <c14/> (GNSS-SDR-Monitor- und PVT-Monitor-Nachrichten als JSON-Zeilen, weitergereicht von <c15/>).

# text
seg-22e8b434782f = IMU-Protokolle als zweiter Sensor.

# text
# c1: [log.imu]
# c2: csv
# c3: euroc
# c4: heading-course
# c5: kshana imu-fit
# c6: imu_fit
# c7: imu_fit
# c8: fit_imu_log
# c9: /kshana-fit-imu
# c10: hybrid
# c11: fusion
# c12: [accel_classical]
seg-5491196d6421 = <c1/> (<c2/> oder <c3/>) integriert die Gierrate des Kreisels zu dem Kurs, den der Monitor <c4/> liest; inline auf jeder Oberfläche und durch Nachweispakete weitergetragen. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, Plugin <c9/>, eine JetBrains-Aktion) passt die Parameter von Beschleunigungsmesser und Kreisel der Szenarien <c10/> und <c11/> aus einem Ruheprotokoll per Allan-Abweichung an und gibt eine Tabelle <c12/> mit dem SHA-256 des Protokolls in ihrer Herkunftsangabe aus.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Integrationen:</b> ein ROS-{ "2" }-Paket (<c1/>: NavSatFix und <c2/> als Eingang, Vertrauens-Topics als Ausgang; seine ROS-freie Brücke wird gegen die reale Engine getestet, der Knoten selbst lief nicht in einem laufenden ROS-Graphen), eine Brücke zu <c3/> (<c4/>, Abhängigkeit unter MIT, optional) und ein GNSS-SDR-Relay.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Home-Assistant-MQTT-Exporter</b> für Vertrauenstelemetrie: <c1/> und <c2/> (Discovery-Nachrichten und ein JSON-Zustandsdokument; nur Veröffentlichen, keine Zugangsdaten oder TLS) sowie <c3/> als Text in Python, WebAssembly und MCP.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Optische Streckenreserve über die Zeit.</b> Die Szenarioart <c1/> nimmt eine optionale Tabelle <c2/> (<c3/>, <c4/>, <c5/>) entgegen und schreibt dann auch je Standort eine mit Startwert erzeugte Realisierung des angegebenen Standortmodells über die Zeit: Wolkenepisoden, eine Flüssigwassersäule je Episode, eine Gamma-Gamma-Szintillationsprobe je Schritt, und daraus die Streckenreserve, die Wolken- und Szintillations-Fades und das Flag für aktive Strecke, mit realisierter Verfügbarkeit, Wolkenanteil, Anzahl der Ausfälle und längstem Ausfall. MODELLED (eine Ziehung aus dem Modell, nicht das Klima; keine externe unabhängige Referenz). Ohne die Tabelle ist das Ergebnis das Dokument { "0.37" }. Die beiden mitgelieferten optischen Szenarien tragen die Tabelle ({ "336" } h, { "600" } s, Startwert { "37" }). Zielwerte, vorab registriert in <c6/> vor dem ersten Lauf.

# text
seg-78524dbb3bd2 = Spezifikation der Testbedingungen und die Labor-Rundreise.

# text
# c1: kshana.test-conditions/1
# c2: docs/spec/TEST-CONDITIONS.md
# c3: recording.kind = "receiver-log"
# c4: kshana bench-export
# c5: <base>.conditions.json
# c6: kshana evidence round-trip
# c7: evidence_round_trip
# c8: create_round_trip_pack
# c9: /kshana-evidence-pack
seg-fbf034925641 = <c1/> wird als <a1><c2/></a1> mit einem JSON-Schema veröffentlicht und erhält <c3/>. <c4/> schreibt außerdem <c5/>. <c6/> erstellt ein signiertes Paket, das den Szenario-Hash, den Hash der angegebenen Bedingungen, den Hash des Empfängerprotokolls und die Bewertung gegen die angegebenen Ereignisse verknüpft, und weist Bedingungen zurück, die den Bewertungsereignissen widersprechen. Ausgearbeitetes Beispiel, bei dem gps-sdr-sim nur eine Datei schreibt; das Abspielen liegt in der Verantwortung des Betreibers und wird nie automatisiert. Python <c7/>, MCP <c8/>, Plugin <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Standardpakete</b> (<c1/>, <c2/>): die Testprofile des DHS-Rahmenwerks Resilient PNT für die Stufen { "1" } bis { "4" }, die Genauigkeitsstufen und die Integritätsbewertung nach IMO MSC.1/Circ.1575 sowie Überwachen, Bewerten und Abmildern nach ICAO Doc { "9849" } Anhang F, jeweils eine Reihe von Szenarien, bewertet gegen Zielwerte, die vor dem Lauf festgelegt wurden, mit den Zeilen von compliance-report, für die sie Belege liefern. Verfehlungen sind festgehalten und festgeschrieben: DHS L4-T1 und die vier Genauigkeitstests der IMO. Doc { "9849" } selbst wurde nicht gelesen (kostenpflichtig); das ICAO-Paket folgt der eigenen Präsentation der ICAO zum RFI Mitigation Plan. <c3/> erhält einen Abschnitt zu Standardpaketen. Alles MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I-Gold- und AFS-Q-Weil-Codes für PRN { "1" } bis { "210" }, die Signale <c2/> und <c3/> in <c4/>, der SB1-BCH-Code, CRC-24Q und Interleaver sowie <c5/> (<c6/>, <c7/>, <c8/>), festgelegt auf LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" }. Januar { "2025" }). Codes VALIDATED gegen die gedruckten Tabellen des Dokuments (die es mit TBC kennzeichnet); eine gedruckte Tertiärspalte (PRN { "147" }) ist wahrscheinlich ein Druckfehler, und die Abweichung ist festgeschrieben. Die LDPC-Kodierung der Subframes { "2" } bis { "4" } ist nicht implementiert.

# text
seg-e2290a640df7 = Die Galileo-E1-Speichercodes werden nicht mehr mitgeliefert.

# text
# c1: data/galileo-os-sis-icd/C7_E1B.txt
# c2: C8_E1C.txt
# c3: LICENSING.md
# c4: galileo::e1b_table
# c5: e1c_table
# c6: Result
# c7: KSHANA_GALILEO_E1B
# c8: KSHANA_GALILEO_E1C
# c9: data/galileo-os-sis-icd/
# c10: scripts/fetch_galileo_e1_codes.sh
# c11: galileo::E1B_TABLE_TEXT
# c12: E1C_TABLE_TEXT
# c13: galileo-e1b
# c14: galileo-e1c
# c15: tests/iq_signals.rs
seg-80f8ca869682 = <c1/> und <c2/> (ICD-Anhang C.7/C.8) sind aus dem Repository und aus den Paketen entfernt. Die Bedingungen des ICD (zitiert in <c3/>) erlauben es einem Nutzer, die Codes unter Nennung der Quelle zu speichern und in einem Produkt zu verwenden, gestatten die Weitergabe aber nur für nichtkommerzielle Zwecke, und Kshana wird auch unter einer kommerziellen Lizenz angeboten. <c4/> / <c5/> liefern jetzt ein <c6/> und lesen die eigene Kopie des Nutzers aus <c7/> / <c8/> oder, in einem Source-Checkout, aus <c9/>, wohin das neue <c10/> sie aus dem ICD-PDF extrahiert (mit Hash-Prüfung). <c11/> / <c12/> sind entfernt. Ohne die Tabellen geben die Galileo-E1-Signale (<c13/>, <c14/>) einen Fehler zurück, der angibt, wie sie bereitzustellen sind, und die E1-Tests werden mit einer Meldung übersprungen. Sind die Tabellen vorhanden, bleibt jede E1-Ausgabe unverändert. Kein Szenario, keine Golden-Ausgabe und keine Spektrumsausgabe verwendet die Codetabellen. Die E5a-Testfixtures aus Anhang C.3/C.4 (die LFSR-Referenz in <c15/>) werden genauso behandelt: Sie werden mit demselben Skript geholt, von git ignoriert, und der Test wird ohne sie übersprungen.

# text
# c1: f64
# c2: rand_distr
# c3: libm
# c4: portable_math::PortableFloat
# c5: portable_distr
# c6: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c7: europa-surface-pnt
# c8: lunar-joint-od-clock
# c9: paper/crossover/inertial.json
# c10: vibration_psd
# c11: cislunar-observability
# c12: skyline_scenarios
# c13: geometry_corpus_identity
# c14: geometry_trust_no_change
# c15: docs/predictions/*.portable-0.36.json
# c16: tests/lunar_joint_od_numpy_oracle.rs
# c17: docs/revisions/STUDIO15-lunar-joint-od-oracle-rerecord.md
# c18: docs/revisions/STUDIO15-batch4-rebaseline.md
# c19: iq_campaign
# c20: gnss-ins
# c21: docs/revisions/STUDIO15-greenhall-edf-portable.md
# c22: docs/revisions/STUDIO15-testbench-gpssdrsim-rerun.md
seg-654d0358137b = <b>Portable Mathematik überall</b> ({ "0.36" }, STUDIO-15): Jede transzendente <c1/>-Funktion der Bibliothek sowie die Normal-, Gamma- und Exponential-Sampler von <c2/> rechnen jetzt über die reine Rust-Bibliothek <c3/> (<c4/>, <c5/>), sodass ein nativer Build und der WebAssembly-Build für alle { "141" } mitgelieferten Szenarien und für den kurzen IQ-Lauf byte-identisches Ergebnis-JSON liefern. Der Preis dafür ist, dass sich die letzten Bits der mit der Mathematikbibliothek des Hosts berechneten Ergebnisse verschoben haben: { "98" } der { "141" } mitgelieferten Szenarien haben sich geändert, { "43" } nicht; bei { "5" } änderte sich ihr größtes Feld um mehr als { "1e-3" }, bei den übrigen um weniger. Jeder verschobene Wert ist alt -> neu in <a1><c6/></a1> aufgeführt (mit einer CSV aller { "136,127" } verschobenen Zahlen); kein Zielwert, keine Toleranz und keine Schwelle wurde geändert. Veröffentlichte Zahlen, die sich geändert haben: <c7/> Verfügbarkeit mit der Erdentfernung { "0.719" } -> { "0.713" } und RMS-Fehler { "86.147" } -> { "86.499" } m (eine Epoche am Rand der Verfügbarkeit wird nun überall gleich aufgelöst; auf macOS arm64 wurden { "0.725" } / { "85.800" } m ausgegeben); <c8/> Stationsfehler { "3.541350" } -> { "3.536885" } m mit VLBI und { "2183.558" } -> { "2184.021" } m ohne; <c9/>, acht <c10/>-Werte um { "3" } Einheiten in der letzten Stelle (Erratum im technischen Bericht); das veröffentlichte Dokument <c11/> bei Größen im Rundungsrauschen (acht Werte jenseits von sechs signifikanten Stellen, bis zu { "6.8e-5" } relativ; kein Rang und keine Schwelle verschoben). Die festgelegten Hashes der Byte-Identitäts-Wächter (<c12/>, <c13/>, <c14/>) sind auf eine benannte Basislinie „{ "0.36" } portable“ umgestellt, wobei die Werte von { "0.35.0" } als historische Aufzeichnung erhalten bleiben; die eingefrorene Vorhersage der Mond-Referenzstation bleibt unberührt, und ihr portabler Neulauf liegt daneben (<c15/>). <c16/> (die validierte Zeile zur gemeinsamen Mond-Bahnbestimmung): Die Fixtures wurden neu exportiert und der numpy-Vergleich mit numpy { "2.4.6" } erneut ausgeführt, der registrierten Version; Skript und Zielwert unverändert; alle sechs Netze bestehen (<a2><c17/></a2>). Die nach STUDIO-15 zusammengeführten Arbeiten der Batches 2-3 verwenden ebenfalls portable Mathematik ({ "457" } Aufrufstellen in { "62" } Dateien); was sich dadurch verschoben hat, steht in <a3><c18/></a3>: { "12" } mitgelieferte Szenarien (größte relative Änderung { "5.2e-8" }, keine ausgegebene Zahl verschiebt sich), { "28" } neu bestätigte Skyline-Wächterzeilen, der M2M4-Digest von <c19/>, die alten Truth-Hashes von <c20/>, die Datum-Sigma der unbeobachteten Bake ({ "632.3769" } -> { "632.3772" } m) und zwei festgehaltene Befunde (CR3BP-DRO-Schließungen; CRPA A3, { "194" } von { "456" } Verbindungen). Die exakte Greenhall-edf behält ihren validierten Zielwert mit einem Double-Double-Logarithmus in ihrem Kern (<a4><c21/></a4>), und die gps-sdr-sim-test-bench-Referenz wurde auf den verschobenen NMEA-Exporten erneut ausgeführt, wobei jeder Zielwert eingehalten wird (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README: Die Zeile zur Mond-Suite nennt die Evidenzstufe jedes Teils (zuvor hieß es, alle seien MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> liefert <c2/> (Reihe, Gridding-Protokoll, Zeitsystem, ob es angegeben war, Satztyp) statt eines <c3/>-Tupels. Es greift jetzt von Satelliten-Datensätzen (<c4/>) auf Empfänger-/Stationsdatensätze (<c5/>) mit dem angeforderten Namen zurück.

# text
# c1: tests/geometry_trust_no_change.rs
# c2: tests/geometry_corpus_identity.rs
# c3: score_model.weights
# c4: geometry
# c5: class
# c6: geometry
# c7: class
# c8: geometry
# c9: monitors_run
# c10: [score.weights]
# c11: [geometry]
seg-6777ca96624a = Kein Wert ändert sich, außer wenn die Geometrie schlecht ist; das Label wird immer ausgegeben. Bei guter oder mittlerer Geometrie (einschließlich eines GPS-only-Himmels ohne Abschattung mit { "8" } Satelliten) oder bei unbekannter Geometrie (der Monitor läuft nicht) ist jeder Wert wie in { "0.35" }: <c1/> hält die Ausgaben beider Beispielsitzungen und <c2/> jedes eingecheckte NMEA-Korpus von Schiffen (auch als GPS-only-Himmel ohne Abschattung) sowie die Szenarien des Crew-Trainings auf die Bytes von { "0.35.0" } fest, sobald die angehängten Schlüssel entfernt sind; in den beiden Trainingsszenarien, deren jamming die Geometrie schlecht macht, unterscheiden sich die schlechten Epochen allein durch den Geometrieabzug. Ein Log mit schlechter Geometrie verliert bis zu { "15" } Punkte, die es in { "0.35" } nicht verlor. Gewollte Änderungen sonst, alle als Ergänzungen: die obigen Schlüssel im Ergebnis-JSON und in den Nachweispaketen (<c3/> ist unverändert); das Live-JSON-Lines-Schema geht von { "1.2" } auf { "1.3" } (<c4/> angehängt, <c5/> in jedem Abzug); die Auszugszusammenfassung erhält <c6/>; die Telemetrie erhält Geometrie-Reihen, Felder und das Label <c7/> nur für Eingaben, die sie mitbringen, sodass ein Strom oder Ergebnis aus { "0.35" } Byte für Byte wie zuvor dargestellt wird. <c8/> ist der 17. Monitorname; er steht zuletzt in <c9/>, wenn er entschieden hat (ein Schiff, dessen Log die Geometrie liefert; eine Liste aus { "0.35" } behält ihre Reihenfolge, und die Monitoranzahl der Zusammenfassung steigt um eins) und hat keinen Eintrag in <c10/> (einen zu setzen wird abgelehnt: sein Abzug wird in <c11/> festgelegt).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> nannte die Lizenz von gnss_lib_py Apache-2.0; die Version { "1.0.4" } steht unter MIT.

# text
seg-a1a670a9c63e = Der NMEA-Leser liest jetzt GSA (ein kurzer GSA-Satz wird ignoriert, nicht als übersprungen gezählt) und behält GSV-Elevationen und -Azimute, auch für Satelliten, die ohne Signal aufgeführt sind; der UBX-Leser behält die Elevation und den Azimut aus NAV-SAT. C/N0 wird genau wie zuvor gelesen.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Ergebnisänderung: Breitband- und Sweep-Störsender verwenden jetzt Q = { "2" }.</b> Die Anti-Jam-Gleichung verwendet für diese Störsender die in Lehrbüchern übliche Spreizspektrum-Anpassung Q, wo sie zuvor { "1" } verwendete. Q = { "2" } entspricht weißem Rauschen über die Hauptkeule bei normalisierter Signalleistung im Band; es ist in den Tests auf die geschlossene Form aus <c1/> festgelegt.

# text
# c1: q_override
seg-21f31ec302de = <b>Unverändert:</b> CW- und Schmalband-Störsender (Q = { "1" }), ein nicht erkannter Störsendertyp (Q = { "1" }, der schädlichste Wert) und <c1/>.

# text
seg-f362499d2ed0 = <b>Wirkung:</b> Wo ein Breitband- oder Sweep-Störsender wirkt, steigt das effektive C/N0 um bis zu { "3.0103" } dB, abgeleitete J/S-Schwellen steigen um { "3.0103" } dB, und die Sperrradien im freien Raum schrumpfen um den Faktor { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Geänderte mitgelieferte Szenarien:</b> { "12" } von { "144" } ändern sich, alle wie vorab registriert (<c1/>, Ergebnisse in <c2/>):

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/>: verlorene Satelliten { "26" } → { "0" }, Median des Abstands bis zum Verlust der Verriegelung { "27.4" } → { "19.4" } km;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/>: Sperrradius der Schleifendynamik { "75.2" } → { "53.2" } km;

# text
seg-096a24491872 = und die Kampagnen und Spektrum-Gegenprüfungen, die diese enthalten.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = JetBrains-Plugin: keine veraltete und nicht zur Entfernung vorgesehene Plattform-API. Die fünf Auswahldialoge verwenden einen kleinen <c1/> mit Dropdown anstelle des veralteten <c2/>; Einzeldatei-Auswahldialoge verwenden den Konstruktor <c3/> anstelle des veralteten <c4/>; die Animation öffnet sich mit <c5/> anstelle von <c6/>, das die Plattform { "2026.3" } zur Entfernung vorsieht. Since-build bleibt { "243" }. Der IntelliJ Plugin Verifier meldet Compatible ohne veraltete oder zur Entfernung vorgesehene Verwendung gegenüber { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) und { "2026.3" } EAP (IU-263.6259.32); <c7/> prüft standardmäßig { "2024.3" } sowie jede in <c8/> angegebene Liste.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> und <c2/> liefern <c3/>: Ein ungültiger Abschnitt <c4/> ist bei direktem Aufruf ein Fehler, wie er es über <c5/> bereits war, statt eines stillen Rückfalls auf die flache Maske. <b>Breaking</b> für Rust-Aufrufer dieser beiden Funktionen.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Kampagnen-Bewerter: Ein echtes Falsch-Einrasten des Trackers wurde nie gezählt</b> (<c1/>). Die Falsch-Einrast-Prüfung des Trackers setzt einen Kanal beim Auslösen von LOCKED auf LOST. Der Bewerter markierte stattdessen die nächste Aktualisierung des Kanals, die dann entriegelt war und deshalb nie gezählt wurde. Ein Ereignis <c2/>, das aus LOCKED gemeldet wird, ist jetzt eine Episode zu seinem Zeitpunkt, im Lauf und in jedem angegebenen Ereignis, das es enthält. Eines, das während des Pull-in gefunden oder von einem bereits LOST-Kanal wiederholt wird, ist keine neue Episode. Ein neuer Test erzeugt ein echtes Falsch-Einrasten: ein legitimer GPS-L1-C/A-Träger, der im verriegelten Zustand um 1/(2T) springt (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = In der Referenzkampagne von <c1/> ändert sich nur PRN { "11" } von ramp/agc-3bit (Falsch-Einrast-Episoden { "0" } → { "1" }, { "426" } und { "437" } pro verriegelter Stunde).

# text
seg-cfc47d9d9237 = Die DIGESTs seiner Zellen sind neu festgelegt.

# text
seg-fcfa0de18b05 = Die vorab registrierte Festlegung der bewerteten Ergebnisse bleibt aktiv und lässt sich weiterhin exakt reproduzieren: In ihrem Hash werden nur jene sechs Felder, die sich durch diese nach der Registrierung vorgenommene Korrektur geändert haben, auf ihre Werte vor der Korrektur zurückabgebildet. Die korrigierten Werte sind für sich festgelegt.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign: Eine Bake ohne Beobachtung wird jetzt gemeldet</b> (gefunden von MR-05). Der Bericht erhält <c1/> und <c2/> nur dann, wenn irgendeine Bake keine Beobachtung hat, und die Sigmas der beobachteten Baken stammen dann aus ihrer eigenen Information, statt alle null zu sein. Das Datum ist unverändert, und keine Standard-, mitgelieferte oder veröffentlichte Ausgabe verschiebt sich (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Hauptachsen-Bezugssystem des Mondes</b> (<c1/>, verwendet von <c2/> und der LRO-Anpassung): Der DE421-Versatz vom mittleren Erdsystem zum Hauptachsensystem aus <c3/> wurde in der falschen Richtung und mit der falschen Euler-Reihenfolge angewendet, sodass das analytische PA-System etwa { "208" }″ von PA entfernt lag, statt darauf. Es ist jetzt so übertragen, wie es SPICEs Frames Required Reading definiert, und stimmt mit SPICE <c4/> auf { "2.6e-16" } rad überein; das analytische PA-System liegt { "6" }″ bis { "8" }″ von DE440 PA entfernt (vorab registriert e1ead19b, neu registriert be33382e, nachdem die erste vorgeschlagene Änderung den Zielwert { "1e-12" } verfehlt hatte; <c5/>). Veröffentlichte Zahlen, die sich verschieben: die LRO-Anpassung (<c6/>) Roh-Überlappung { "53.8" } → { "39.9" } m, dynamisch { "12.6" } → { "12.05" } m, reduziert-dynamisch { "6.65" } → { "6.67" } m (Zielwerte unverändert). Der analytische Stack stimmt nun auf beiden Stufen mit der DE-Güte-Kreuzvalidierung von ANISE ({ "12.0" } / { "6.67" } m) überein; die frühere Lücke auf der dynamischen Stufe war dieser Fehler.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> mit einem gebrochenen Tagesanteil verwarf den Bruchteil in den Umrechnungen UTC, TAI, UT1 und Erdrotation (eine Stunde Tagesanteil ließ die Erde um { "15" }° falsch stehen); der Tagesanteil wird jetzt auf eine ganze Zahl normalisiert. Kein Aufrufer der Engine war betroffen: Jeder übergibt einen ganzzahligen Tag, und jede ausgelieferte Ausgabe ist bitidentisch.

# text
seg-144d90307ec6 = Geplant

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = Die Geometrie aus einer angegebenen Skyline ({ "0.36" } Punkt { "1" }, jetzt in der Engine als <c1/>): <c2/> und <c3/> aus der Skyline, wo die Eingabe eine liefert (die Azimutlücke als Ausweichlösung), ein Ereignis natürlicher Beeinträchtigung (Fjord oder Terminal) in <c4/> und die beiden maskierten Geometrien der Designnotiz in der Zeile sigma_UERE x DOP, vorab als Nachtrag registriert.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = Geometrie für RINEX-Logs mit Navigationsdaten (aus dem eigenen Fix der Engine) und für Android-Logs (aus den <c1/>-Zeilen); beide lesen heute <c2/>. Geometrie in <c3/> (Version { "1" } in { "0.36" } unverändert) und die Integrationen für Signal K und OpenCPN.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Eine bereits bestehende Lücke, in { "0.36" } nicht eingeführt: Sobald das SNR-Feld jedes Satelliten leer ist, löst weder <c1/> noch ein C/N0-Abzug aus; der vollständige Signalverlust ist nur über das <c2/> des Geometrie-Monitors sichtbar (klassifiziert als <c3/>). Ein Abzug dafür ist geplant.

# text
seg-a5a7a10ee11c = Ein Strom nach Schema { "1.3" } in den externen Telemetrie-Referenzen (Prometheus-Textformat-Parser und OTLP-Collector), die heute nur Ströme nach { "1.2" } abdecken.

# text
seg-caa1977b5b5e = Eine beidseitige Abschattung (eine Schlucht oder ein enger Fjord) wird als Signalverlust gelesen und nicht als blockierter Himmel, bis die Skyline integriert ist.

# text
seg-4bd0f178ca4e = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier ausgelassen; sie steht in <a1>CHANGELOG.md</a1> auf GitHub.

# text
seg-b2689beaba9e = Galileo-OSNMA-Verifizierer

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Neues Modul <c1/> und <c2/>: ein offener Verifizierer auf Empfängerseite für Galileo OSNMA in reinem Rust.</b> Er liest I/NAV-Seiten und meldet je Satellit und Epoche, ob die Navigationsdaten authentifiziert sind, mit einem Grund für jeden Fehlschlag oder jede Verzögerung: Parsen von HKROOT und MACK, Wiederzusammensetzen von DSM-KROOT und DSM-PKR, Merkle-Verifizierung des öffentlichen Schlüssels, Verifizierung der TESLA-Schlüsselkette, MACSEQ- und Tag-Verifizierung für ADKD { "0" }, { "4" } und { "12" } einschließlich Kreuzauthentifizierung sowie ein Ergebnis in der Form von <c3/> für den Receiver-Trust-Monitor. Die Ausgabe trägt einen Hinweis, dass der Status kein Navigations-Integritätsdienst ist. <c4/> legt dar, was verifiziert wird und was nicht, die Zeitanforderung und dass Kshana keine Rechte unter den IPRs des ICD von OSNMA der EU gewährt (Nutzer stützen sich auf die Autorisierung in Anhang E des ICD). Umgesetzt gegen das SIS ICD Issue { "1.1" } und die Receiver Guidelines Issue { "1.3" }. Seiten werden per CRC geprüft, und ein Bytestrom UBX-RXM-SFRBX von u-blox kann direkt gelesen werden (<c5/>). Die Standardtests verwenden synthetische Daten und veröffentlichte Known-Answer-Tests der Primitive; ein optionaler Test liest eine lokal heruntergeladene Kopie der offiziellen Vektoren. Nach unabhängiger Prüfung entnimmt der Verifizierer seine Zeit nur aus verifizierten TESLA-Schlüsseln (ein gefälschter Subframe weit in der Zukunft kann einen Fehlschlag nicht mehr löschen), lässt eine Authentifizierung ablaufen und dem verwendeten IODnav folgen, beachtet verifizierte Alarmmeldungen (deren Merkle-Blatt jetzt das zufällige Feld NPK enthält) und den NMA-Status „don't use“, hält Dummy-Tags aus dem Satellitenstatus heraus, führt Ketten nach CID mit Widerruf und Erneuerung, prüft den Padding-Hash von KROOT und begrenzt UBX-Framelängen und den Aufwand der TESLA-Verifizierung. Ein Satellit gilt nur so lange als authentifiziert, wie die neuesten von ihm gesendeten Ephemeriden- und Uhrdaten Bit für Bit die Daten sind, die authentifiziert wurden (nicht lediglich unter demselben IODnav); ein Status oder Widerruf aus dem nicht authentifizierten NMA-Header zählt nur, wenn zwei Satelliten übereinstimmen oder ein verifiziertes KROOT ihn trägt; ein wieder eingespieltes älteres KROOT kann eine Kette nicht ersetzen, und ein stockender Schlüsselstrom wird gemeldet.

# text
seg-3e7df5c888ca = Hinzugefügt (MCP-Server-Kanäle)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, Streamable HTTP, selbst gehostet.</b> Standardmäßig Loopback; eine Nicht-Loopback-Adresse braucht <c2/> und ein Bearer-Token in <c3/>; kein Tool liest oder schreibt einen Pfad (die IQ-Dateitools sind aus); Grenzen für Anfragegröße, Zeit und Nebenläufigkeit; kein CORS-Header; Prüfungen von Host und Origin. Kshana betreibt keinen Endpunkt (<c4/>, mit Vorlagen für Docker, Fly.io und Cloud Run).

# text
seg-c392cde151c9 = Hinzugefügt (Oberflächen)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> in Python und WebAssembly.</b> Der Verifizierer hinter <c2/> auf Bytes im Speicher, der das JSON zurückgibt, das <c3/> ausgibt (Hinweis in seinem Feld <c4/>; nur Authentifizierungsstatus, kein Navigations-Integritätsdienst). Dieselben Ablehnungen wie auf der Kommandozeile. Nicht über MCP: Die Eingabe ist ein langer roher Empfängerstrom, der besser von der CLI und von Python bedient wird. <c5/> und <c6/> sagen das.

# text
# c1: trust_telemetry
# c2: receiver-trust
# c3: kshana trust-telemetry
# c4: kshana::surface::trust_telemetry
# c5: /kshana-trust-telemetry
# c6: trust-telemetry
# c7: wasm
# c8: python
# c9: otlp
seg-6128929994b4 = <b><c1/> in WebAssembly, Python und MCP, mit einem Plugin-Befehl und einer JetBrains-Aktion.</b> Stellt einen Vertrauensstrom oder ein <c2/>-Ergebnis als Prometheus-Text, als CEF- oder LEEF-Syslog-Zeilen oder als OTLP-JSON-Nutzlast dar, mit den Encodern, die <c3/> verwendet (<c4/>); kein Socket und keine Uhr. Plugin: <c5/> und der Skill <c6/>. JetBrains: Render Trust Telemetry. Die Features <c7/> und <c8/> und der MCP-Server aktivieren jetzt auch <c9/>, was kein Crate hinzufügt.

# text
seg-062ef0cf7ee7 = Hinzugefügt (Nachweispakete)

# text
# c1: kshana receiver-trust evidence
# c2: kshana evidence verify
# c3: kshana evidence keygen
# c4: *.evidence-key
# c5: verify
# c6: --pubkey
# c7: openssl ts -verify
# c8: kshana::evidence
# c9: wasm32
# c10: ed25519-dalek
# c11: zeroize
# c12: docs/EVIDENCE-PACKS.md
seg-9889575c2df1 = <b><c1/> und <c2/>: signierte, verifizierbare Nachweispakete für ein GNSS-Vertrauensereignis.</b> Ein Paket bündelt den rohen Log-Ausschnitt und das SHA-256 des vollständigen Logs, die Konfiguration mit jeder Schwelle, die Ergebnisse und Gründe je Epoche, die Engine-Version, ein hashverkettetes Manifest und eine eigenständige HTML-Zusammenfassung, signiert mit Ed25519 (ein Schlüssel aus <c3/> oder Ihre eigene Datei; Schlüssel werden nie in einem Paket gespeichert, und <c4/> wird von git ignoriert). <c5/> prüft jeden Hash, die Kette und die Signatur und nennt genau, was fehlschlägt; mit <c6/> legt es den Unterzeichner fest. Ein RFC-{ "3161" }-Token kann angehängt werden und wird gelesen und an das Manifest gebunden (die eigene Signatur der Instanz wird von diesem Build nicht geprüft; <c7/> deckt sie ab). Der Log-Ausschnitt besteht aus den exakten Bytes des Fensters, wo der Leser Quellspannen meldet (NMEA, UBX, RINEX { "3" }, Android), sonst aus dem ganzen Log, und das Manifest sagt, was zutrifft. Erstellung und Verifizierung sind reine öffentliche Funktionen (<c8/>), die für <c9/> gebaut werden. Die Pakete geben an, dass sie eine technische Aufzeichnung sind, kein Rechtsgutachten. Die neuen Abhängigkeiten sind der Baum von <c10/> (BSD-3-Clause und Apache-2.0/MIT, minimale Features) und ein direktes <c11/> (bereits in diesem Baum), um Schlüsselmaterial zu löschen. Siehe <c12/>.

# text
seg-280fd37126c1 = Hinzugefügt (Vertrauenstelemetrie)

# text
# c1: kshana trust-telemetry
# c2: receiver-trust
# c3: /metrics
# c4: otlp
# c5: kshana_trust_syslog_send_failures_total
# c6: /metrics
# c7: deploy/grafana/
# c8: docs/TRUST-TELEMETRY.md
# c9: src/telemetry/sample.rs
seg-ebd269c618b0 = <b><c1/>: GNSS-Vertrauen als Quelle für Sicherheitstelemetrie.</b> Liest den Vertrauensstrom je Epoche (JSON Lines: Wert 0-100, Band, Gründe) oder ein Batch-Ergebnis von <c2/> und speist einen Prometheus-Endpunkt <c3/> (standardmäßig localhost), Syslog-Ereignisse in CEF oder LEEF innerhalb eines RFC-{ "5424" }-Umschlags (UDP oder TCP) und, hinter dem standardmäßig ausgeschalteten Feature <c4/>, den OTLP/HTTP-JSON-Export. Die Zustellung läuft in Worker-Threads mit Zeitgrenzen für Verbindungsaufbau und Schreiben, begrenztem Reconnect-Backoff und einem Zähler <c5/>, sodass ein toter oder hängender Collector weder die Live-Bewertung anhalten noch <c6/> einfrieren kann; Gründe-Labels sind auf { "64" } Reihen begrenzt. Keine neuen Abhängigkeiten. Ein Beispiel-Grafana-Dashboard liegt in <c7/>. Metriknamen, Labels und die CEF/LEEF-Feldzuordnung stehen in <c8/>. Das Stromformat ist in <c9/> isoliert.

# text
seg-fa5e803edb44 = Maritimes Vertrauen: ein Live-Vertrauenswert von 0-100 für den Fix eines fahrenden Schiffes, aus dem NMEA { "0183" }, das der Empfänger ohnehin ausgibt, mit einem optionalen Gate.

# text
# c1: kshana receiver-trust
# c2: [platform]
# c3: kind = "static"
# c4: "vessel"
# c5: [maritime]
# c6: [score]
# c7: kshana receiver-trust live <session.toml>
# c8: $PKSHT
# c9: --gate
# c10: V
# c11: N
# c12: --listen tcp:<port>
# c13: examples/maritime-trust/
# c14: docs/MARITIME-TRUST.md
seg-c5b3fcb9bba8 = <c1/> nimmt eine Tabelle <c2/> entgegen (<c3/> oder <c4/>, die Höchstgeschwindigkeit, Beschleunigung und Drehrate des Schiffes, die Antennenhöhe über der Wasserlinie und ein optionaler Kurssensor; jeder Standardwert ist mit seiner Begründung dokumentiert). Für ein Schiff wird der statische Positionssprung-Monitor, der den Abstand vom Kalibrierungsmittel misst und auf einem fahrenden Schiff falsch liegt, durch kausale Monitore für bewegte Plattformen ersetzt: kinematische Konsistenz der Position mit der gemeldeten Geschwindigkeit und dem gemeldeten Kurs sowie mit den Grenzen des Schiffes, Kreiselkompasskurs gegen Kurs über Grund, Logge gegen Geschwindigkeit über Grund, Antennenhöhe gegen die angegebene Höhe über der Wasserlinie, ein Zusammenbruch der C/N0-Streuung, der zusammen mit einem Anstieg gegen die Kalibrierungs-Basislinie auftritt, und Zeitkonsistenz (im Live-Modus auch gegen die Uhr dieses Rechners). Er liest außerdem einen gemeldeten Authentifizierungsstatus, insgesamt oder je Satellit (nur ein gemeldeter Status: keine OSNMA-Kryptografie). Jede Schwelle wird vor dem Lauf in einer Tabelle <c5/> angegeben. Jede Epoche erhält dann einen Wert von { "0" } bis { "100" } durch eine deterministische, vorab registrierte Abbildung (kein Lernen, nichts an Ereignisse angepasst; Gewichte, Bandgrenzen und der Nachweis stehen in einer Tabelle <c6/>), abgebildet auf die bestehenden Vertrauenszustände, mit den Monitoren, die Punkte abgezogen haben, und deren Punkten. Statische Szenarien sind unverändert und haben denselben Hash wie zuvor. <c7/> liest stdin, eine Datei, an die angehängt wird, TCP oder UDP und schreibt je Epoche eine JSON-Zeile und einen proprietären Satz <c8/>; mit <c9/> reicht es den Strom unverändert durch, solange der Fix vertrauenswürdig ist, und markiert den Fix als ungültig (GGA-Qualität { "0" }, RMC- und GLL-Status <c10/>, GNS- und VTG-Modus <c11/>), solange er es nicht ist. Das Gate ist aus, sofern es nicht verlangt wird; <c12/> stellt den gefilterten Strom beliebig vielen TCP-Clients bereit (standardmäßig Loopback, ein langsamer Client wird getrennt, statt die anderen zu blockieren). Dies ist beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }); der Betreiber bleibt verantwortlich. <c13/> ist ein synthetisches Log von Tallinn nach Helsinki, nur als Text geschrieben, mit einem Wegdriften der Position auf halber Strecke, währenddessen der Empfänger weiter einen gültigen Fix meldet; seine erwartete Ausgabe ist durch einen Test festgelegt. Leitfaden: <c14/>. Die Prüfungen können einen Spoofer nicht erkennen, dessen Fix mit allem auf dem Bus konsistent ist; der Leitfaden sagt das.

# text
seg-80f3f0aae42c = Störungskarte

# text
# c1: kshana interference-map
# c2: kshana route-exposure
# c3: fetch-land --allow-network
# c4: flate2
# c5: null
# c6: <source>-<dataset>-<date>.geojson
# c7: docs/INTERFERENCE-MAP.md
# c8: docs/data/INTERFERENCE-DATA-SOURCES.md
seg-8539a42718cb = <b><c1/> und <c2/>: ein öffentliches Bild davon, wo Flugzeuge und Schiffe beeinträchtigte Navigationsdaten gemeldet haben und wie viel einer Route davon berührt wird.</b> Eingaben sind lokale CSV-Dateien, erstellt aus offen lizenzierten ADS-B-Daten (adsb.lol, ODbL { "1.0" }) und AIS-Daten (NOAA MarineCadastre, Kystverket unter NLOD { "2.0" }); jede Ausgabedatei umfasst eine Quelle und einen UTC-Tag als GeoJSON und trägt die Methode, ihre Schwellen, die Datenlizenz, die Namensnennung und die Abdeckungsverzerrung der Quelle. Die ADS-B-Methode aggregiert NIC und NACp auf ein festes Raster und stuft eine Zelle anhand des Anteils verschiedener Flugzeuge als beeinträchtigt ein, mit Schutzvorkehrungen für Geräte, die nie eine Genauigkeit melden, für geringe Höhe und für großräumige Ursachen. Die AIS-Methode lässt fünf Detektoren laufen: Positionen an Land (gegen eine vom Nutzer gelieferte Küstenlinie), Kreisbahnen, unplausible Sprünge, unplausible Geschwindigkeiten und viele Schiffe an einer Position. Schwellen sind vorab registrierte Konstanten einer benannten Methodenversion. Nur Aggregate: Kennungen werden im Speicher gehasht und nie geschrieben, und Zellen mit weniger als { "5" } verschiedenen Flugzeugen oder Schiffen werden nicht veröffentlicht. Eine beeinträchtigte Zelle ist kein Befund einer Störung. Die Standardbefehle verwenden kein Netzwerk; ein optionaler Helfer <c3/> lädt Natural-Earth-Landpolygone von einer an einen Commit gebundenen Adresse herunter und behält die Datei nur, wenn ihr SHA-256 übereinstimmt. ADS-B-Eingabe ist eine CSV oder direkt die readsb-History-Dateien von adsb.lol (neue Abhängigkeit: <c4/> mit seinem reinen Rust-Backend, für gzip). Beide Methoden haben die Version { "2" }: Eine Einstufung als beeinträchtigt oder anomal braucht mindestens { "5" } Flugzeuge oder Schiffe (das Veröffentlichungsminimum), jede Anzahl je Zelle unter { "5" } wird als <c5/> zurückgehalten, und ein Tag, dessen Hintergrund nicht geschätzt werden kann, hält seine Einstufungen zurück. Ausgabedateien heißen <c6/> und werden nie überschrieben; die Eingabe wird zeilenweise gestreamt; die Routenexposition behandelt den Antimeridian. Tests verwenden nur synthetische Daten. Siehe <c7/> und die Lizenzprüfung in <c8/>.

# text
seg-7a54dfab93dc = Hinzugefügt (Trainingsströme)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/>: synthetisches Brücken-NMEA { "0183" } für das Crew-Training im Erkennen von GNSS-jamming und -spoofing.</b> Aus einem Szenario-TOML schreibt es eine Datei oder streamt über TCP oder UDP (Unicast oder Broadcast; in Echtzeit, beschleunigt oder so schnell wie möglich) den vollständigen Brückensatz GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT und VBW für einen Schiffskurs mit Grenzen für Drehrate, Beschleunigung und Strömung, mit Satellitengeometrie aus den eigenen nominalen Konstellationen der Engine. Geskriptete Ereignisse auf einer Zeitachse: jamming, Wegdriften der Position (ein gültiger Fix, der sich entfernt), Zeit-spoofing und eine Wiedergabeverzögerung, jeweils mit Anstiegs- und Abklingrampen. Ein Ausbilderlog (JSON und Text) hält fest, was wann eingespeist wurde, mit dem wahren Kurs gegenüber dem gemeldeten. Eine Bibliothek in <c2/> (jamming auf offener See, Wegdriften an der Küste, Zeit-spoofing bei der Hafeneinfahrt, kombiniert) enthält Trainerhinweise. Die Ausgabe ist prüfsummengültig und je Seed deterministisch; die Tests legen für jedes Szenario einen Golden-Auszug fest und lesen jeden Satz mit dem NMEA-Leser von <c3/>. Nur Text: keine HF-, IQ- oder Wellenformausgabe; die Ströme dienen Training und Test und dürfen nie in die Live-Navigationssysteme eines Schiffes eingespeist werden. Siehe <c4/>.

# text
seg-bb8d508c92fa = Maritime Integrationen ({ "0.35.0" }, Arbeitsstrang B)

# text
# c1: integrations/signalk/
# c2: kshana receiver-trust live
# c3: $PKSHT
# c4: navigation.gnss.kshana.*
# c5: navigation.position
# c6: warn
# c7: alarm
seg-538cdf145ac1 = <b>Signal-K-Plugin</b> (<c1/>, nicht auf npm veröffentlicht): führt <c2/> aus oder verbindet sich damit (der eigene NMEA-Eingang des Servers, benutzerdefinierte Eingabeargumente, ein JSON-Lines-TCP-Feed oder die Sätze <c3/> eines Gate-Stroms), veröffentlicht den Vertrauenswert, das Band, die Gründe, die Alarme und den Gate-Zustand unter <c4/> (einschließlich der vom Empfänger gemeldeten Position als Kontext, nie als <c5/>) und löst eine Signal-K-Benachrichtigung aus (<c6/> bei degraded, <c7/> bei untrusted, mit Schwellen für Halten, Löschen und Veralten, alle im Konfigurationsschema). Keine npm-Abhängigkeiten. Getestet an aufgezeichneter synthetischer Ausgabe.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b>: NMEA im Gate-Modus wird direkt von <c1/> bereitgestellt (empfohlen); ein abhängigkeitsfreies TCP-Relay (<c2/>) ist die optionale Alternative. In beiden Fällen sieht OpenCPN einen ungültigen Fix, wenn das Vertrauen zusammenbricht, und <c3/> in seinem NMEA-Debug-Fenster; die Tests spielen den synthetischen gefilterten Strom über einen echten TCP-Socket ab und prüfen, was ein Verbraucher erhält. Ein natives Plugin mit Wertanzeige (<c4/>, Plugin-API { "1.18" }, CMake) liest <c5/> aus dem eigenen NMEA-Strom von OpenCPN und alarmiert im Band untrusted; es baut, seine Logik ist per Unit-Test geprüft, und es lief in OpenCPN { "5.8.4" } unter einem virtuellen Display (Nachweis und ein Reproduktionsskript in <c6/>); es ist nicht für den Plugin-Manager paketiert.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Referenzaufbau</b> (<c1/>): generische Teileliste, Betriebssystem-Einrichtung, systemd-Units für den beratenden Monitor und das optionale Gate (von <c3/> mit <c2/> geprüft), eine Container-Option, Signal-K-Verdrahtung.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = Das Signal-K-Plugin akzeptiert das Live-JSON-Schema { "1.2" } (ein Schlüssel <c1/>, dann ein Schlüssel <c2/> angehängt; unbekannte angehängte Schlüssel werden ignoriert), geprüft an echter Ausgabe nach { "1.2" } und gegen einen echten signalk-server.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Beratende Software, kein typzugelassenes Gerät; der Betreiber bleibt verantwortlich. Nur Software: Nichts sendet, und es wird keine Erkennungs- oder Fehlalarmzahl behauptet.

# text
seg-72cb9f45ce99 = Hinzugefügt: compliance-Zuordnung und test-bench-Export

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> und <c2/>.</b> Eine Zuordnung von Kshana-Ausgaben zu fünf Resilienz-Rahmenwerken und Normen (das Resilient PNT Conformance Framework v2.0 des US-DHS, IMO-Leitlinien für Schiffe, EASA-Leitlinien für die Luftfahrt, NIS2 Artikel { "21" }, EN { "16803" }, eine kostenpflichtige Norm, zitiert nach Teil und nach den wenigen im Katalogtext sichtbaren Abschnittsnummern), eine Tabelle je Rahmenwerk: die Referenz, was sie in unserer Paraphrase verlangt, die Ausgaben, die Belege dafür liefern, und die Lücke. Quellversionen, URLs und was gelesen wurde und was nicht, sind festgehalten. <c3/> füllt die Zuordnung aus den angegebenen Läufen und markiert jede Zeile als <c4/>, <c5/>, <c6/> oder <c7/>, als Markdown und JSON, wobei die Lücke in jeder Zeile erhalten bleibt. Die Formulierung lautet „liefert Belege für“; nichts wird bewertet oder genehmigt. Die Tests verwenden synthetische Läufe und schlagen fehl, wenn eine eingecheckte Tabelle vom Code abweicht.

# text
# c1: kshana bench-export <scenario.toml>
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: GGA
# c6: RMC
# c7: receiver-trust
# c8: [[events]]
# c9: src/interop/testbench.rs
# c10: tests/interop_testbench.rs
# c11: docs/TEST-BENCH.md
# c12: kshana receiver-trust
seg-ee9a0a43e4b0 = <b><c1/>.</b> Schreibt die Fahrzeugbewegung und die Ereignisse eines Szenarios der Art <c2/>, <c3/> oder <c4/> für einen GNSS-Simulator im Labor: eine Nutzerbewegungs-CSV mit dokumentierten Bezugssystemen und einer Metadaten-Begleitdatei, NMEA { "0183" } <c5/>/<c6/>, Wegpunkttext und die Ereignisse als CSV und als <c8/>-Blöcke von <c7/> (<c9/>). Nur Bewegung und Ereignisse: Es wird kein Signal geschrieben. Jede Datei wird in <c10/> zurückgelesen und innerhalb ihrer angegebenen Toleranz verglichen. <a1><c11/></a1> gibt die Methode an, den Export über einen Simulator abzuspielen und das Log des Empfängers mit <c12/> zu bewerten.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>Was als Nachweis zählt.</b> Ein Ergebnis zählt nur dann für eine Fähigkeit, wenn es die Felder trägt, die seine Art schreibt; ein Art-Label allein zählt nichts. Unbekannte Arten, ein Ergebnis, das seinem Geschwister-Szenario widerspricht, nicht hexadezimale Hashes und fehlerhafte receiver-trust-Zählungen werden als nicht verwendet aufgeführt, mit dem Grund. Der Bericht maskiert Markdown-Zellen und kann bei einem Nicht-ASCII-Hash nicht in Panik geraten. <c1/> und <c2/> nehmen Texte entgegen, keine Pfade.

# text
seg-6b46de1164d8 = Test-bench-Export.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> wird auf Wertebereich geprüft (<c2/>); die Wegpunktdatei prüft jedes Intervall, und der Befehl sagt, warum, wenn eines ausgelassen wird; die Dokumentation legt dar, dass der Heading von <c3/> der Gierwinkel des Körpers ist und nicht der Kurs, die Platzhalterfelder von <c4/> und die eigene Höhenänderung des Szenarios. <c5/> und <c6/> stehen im Nutzungstext.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> legt die wahre Zustandshistorie des Fahrprofils von <c2/> offen (dieselbe Schrittfolge, die die eigene Truth der Art verwendet), und <c3/> erhält NMEA-Datums- und Zeitfelder.

# text
seg-fbfc1a59e99b = Validierung der Störungskarte

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>Die Dekodiersemantik und die Geometrie der Störungskarte werden an synthetischen Eingaben gegen unabhängige Implementierungen geprüft.</b> Die Bedeutungen der NIC- und NACp-Codes gegen die pyModeS-Dekodierung synthetischer ADS-B-Frames, die AIS-Werte für „nicht verfügbar“ gegen die pyais-Dekodierung synthetischer AIVDM-Sätze, die Zuordnung zu Rasterzellen gegen shapely, die Streckenlänge je Zellzustand gegen shapely und GeographicLib sowie die Maskierung des Binnenlands gegen shapely und pyproj, jeweils mit einer Toleranz, die vor dem ersten Vergleich festgelegt wurde (<c1/>). Das validiert, wie Codes und Feldwerte gelesen werden, und die Geometrie, nicht aber, dass eine markierte Zelle eine Störung ist. Der Leser für Landpolygone schließt jetzt einen Ring, der seinen ersten Eckpunkt nicht wiederholt und den er zuvor ohne seine letzte Kante las. Die Dokumentation gibt die Schwellen für niedrige Genauigkeit bei NACp und NIC als die Grenze an, für die jeder Code steht (NACp { "6" } ist eine EPU-Grenze von { "556" } m, NIC { "5" } eine Einschlussgrenze von { "1" } NM).

# text
seg-cf4ffdbba1a6 = Hinzugefügt (Validierung der Telemetrieformate und Nachweispakete)

# text
# c1: docs/EVIDENCE-PACKS.md
# c2: cryptography
# c3: opentelemetry-proto
# c4: docs/EVIDENCE-PACKS.md
# c5: VerifyReport
# c6: signature_valid
# c7: scripts/gen_ed25519_rfc8032_ref.py
# c8: scripts/gen_evidence_pack_ref.py
# c9: scripts/evidence_verify_cleanroom.py
# c10: scripts/gen_telemetry_formats_ref.py
# c11: evidence_crypto_reference
# c12: evidence_pack_reference
# c13: telemetry_formats_reference
seg-ad6730e0e891 = <b>Externe Prüfungen der Kryptografie der Nachweispakete, des Paket-Verifizierers und der Telemetrie-Wire-Formate.</b> Die Ed25519-Testvektoren aus RFC { "8032" } Abschnitt { "7.1" } ({ "1" }, { "2" }, { "3" } und { "1024" }) und die SHA-256-Beispiele aus FIPS 180-4 laufen durch die eigenen Signier-, Verifizier- und Hash-Funktionen des Pakets, bis zur exakten Gleichheit. Ein Verifizierer, der in Python allein aus dem normativen Abschnitt von <c1/> geschrieben wurde (hashlib und <c2/>), stimmt mit dem Rust-Verifizierer bei { "71" } intakten und manipulierten Paketen überein: Urteil, Fehlermenge, Signatururteil und beide Kettenköpfe. Unsere Prometheus-Ausgabe wird vom Parser des offiziellen Python-Clients gelesen und unser OTLP-JSON von der offiziellen Nachricht <c3/>, streng, und beide stimmen mit dem Zustand überein, aus dem sie erzeugt wurden. CEF und LEEF haben keinen unabhängigen offenen Validator und bleiben modelliert. <c4/> hat das normative Paketformat und das Verifizierungsverfahren erhalten, aus dem der Clean-Room-Verifizierer geschrieben wurde; <c5/> hat <c6/> erhalten. Referenzen und Fixtures: <c7/>, <c8/> mit <c9/>, <c10/>; Tests <c11/>, <c12/> und <c13/>. Die CI braucht kein Python.

# text
seg-20d1b02bfda4 = Hinzugefügt (Validierung der CEF-Ereignisse)

# text
seg-8c464e43e43d = Die CEF-Ereignisse der Telemetrie werden von zwei unabhängigen Open-Source-Parsern korrekt zurückgelesen.

# text
# c1: pycef
# c2: logstash-codec-cef
# c3: =
# c4: pycef
# c5: tests/cef_reference.rs
# c6: tests/fixtures/cef/
# c7: scripts/gen_cef_ref.py
# c8: scripts/gen_cef_logstash_ref.py
# c9: cfp1
# c10: cfp2
# c11: cn1
# c12: cn2
seg-a6321d13b0ab = <c1/> { "1.11" } und der Logstash-CEF-Codec (<c2/> { "6.2.7" } in Logstash { "8.15.3" }) parsen { "157" } CEF-Zeilen (jeden Bandwechsel und jede Epoche des eingecheckten Telemetriestroms sowie gegnerischen Text mit <c3/>, Backslashes, Pipes, Zeilenumbrüchen, Tabulatoren und Mehrbyte-Text) und stellen jedes Headerfeld, den Schweregrad, die exakte Menge der Erweiterungsschlüssel und jeden Wert exakt wieder her. Der Logstash-Codec liest außerdem vier Zeilen, deren Headertext Escaping braucht, was <c4/> nicht kann. Der Zielwert wurde registriert, bevor einer der beiden Parser lief (<c5/>); Fixtures in <c6/>, Referenzskripte <c7/> und <c8/>; die CI braucht weder Python noch Logstash. LEEF hat keinen gepflegten offenen Parser und bleibt modelliert. Die CEF-Ereignisse tragen jetzt den Vertrauenswert und den Epochenversatz in den benutzerdefinierten Gleitkommafeldern des CEF-Wörterbuchs (<c9/>, <c10/>) statt in den Ganzzahlfeldern <c11/> und <c12/>, die für keinen der beiden Werte passten; CEF ist in diesem Release neu, daher ändert sich nichts bereits Ausgeliefertes.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP: <c1/> akzeptiert das Log als <c2/> oder <c3/>; die Tool-Eingabe ist auf { "4" } MiB begrenzt.

# text
seg-8999974aa1fa = Auch das jamming-Diagramm bezieht seine Farben aus der Palette.

# text
# c1: src/jamming.rs
# c2: *.chart.svg
# c3: jamming
# c4: maritime-strait-jamming
# c5: jamming
# c6: src/palette.rs
# c7: tests/palette_sync.rs
# c8: jamming-demo
# c9: maritime-strait-jamming
# c10: font-family
# c11: web/studio/recorded/
seg-8c8ff384dbf6 = <c1/> war das eine Modul, das die Überarbeitung der Observatory-Palette bei seinen eigenen Farben beließ, während die jammer-Q-Arbeit einging; sein <c2/> (die Szenarien <c3/>, <c4/> und andere Szenarien der Art <c5/>) liest jetzt <c6/>, und die Allowlist in <c7/> ist leer. Nur Farben und Schrift: Die Diagramme <c8/> und <c9/> sind gleich ihren zuvor aufgezeichneten Darstellungen, sobald Farbe, <c10/> und die Versionsfußzeile normalisiert sind. Kein dargestellter Wert hat sich verschoben. Die aufgezeichneten Studio-Kopien unter <c11/> wurden bei den Re-Ports von { "0.33.0" } und { "0.34.0" } neu aufgezeichnet (nur der Versionsstempel): Sie tragen noch den alten Anstrich des jamming-Diagramms und übernehmen den Anstrich der Palette beim nächsten Re-Port.

# text
# c1: flicker_floor
# c2: clock-ensemble
# c3: consistent = false
# c4: flicker_floor
# c5: integrity
# c6: clock-ensemble
# c7: filter_health
# c8: holdover_s
# c9: timing_p95_ns
# c10: scenarios/orbit-gnss-challenged.toml
# c11: fom.integrity
# c12: filter_health
# c13: filter_health.consistent
# c14: true
# c15: false
seg-a059d10c5330 = <b>Die 3-Sigma-Grenze des clock-ensemble deckt jetzt den Flicker-Boden ab, und die Filtergesundheitsprüfung sieht ihn.</b> Mit einem <c1/> trug die Truth-Uhr Flicker-FM, das Zwei-Zustands-Filter, das die Integritätsgrenze liefert, jedoch nicht, sodass die 3-Sigma-Abdeckung des ausgelieferten Szenarios <c2/> { "0.41" } (klassisch) und { "0.33" } (Quanten) betrug und die NIS/NEES-Prüfung, die ihre eigene Truth aus dem Modell des Filters zog, mit und ohne Boden identische Werte meldete. Die Grenze ist jetzt die Zwei-Zustands-Varianz plus die exakte Varianz der seit der letzten Synchronisierung aufgelaufenen Flicker-Phase, berechnet aus derselben Bank, die die Truth-Uhr verwendet; die NIS/NEES-Prüfung zieht ihre Truth aus dem erweiterten Modell mit dieser Bank und lässt das passende erweiterte Filter laufen (und das Zwei-Zustands-Filter gegen Flicker-Truth meldet <c3/>). Ausgabeänderung, nur für Uhren mit einem <c4/> ungleich null: <c5/> in <c6/> geht von { "0.40866" } / { "0.33026" } auf { "0.99970" } / { "1.0" } (klassisch / Quanten), und die NIS/NEES von <c7/> enthalten jetzt den Flicker; der Zeitfehler, <c8/> und <c9/> sind unverändert, und Szenarien ohne Boden sind byte-identisch. <c10/> (Art orbit, Seed { "7" }, Böden { "1e-16" } / { "2e-11" }) verschiebt sich ebenfalls: <c11/> klassisch { "0.7734" } auf { "1.0" } und Quanten { "0.9796" } auf { "1.0" }, und die NIS/NEES von <c12/> und ihre Bänder ändern sich. Sein Quanten-<c13/> kippt von <c14/> auf <c15/>: ein Stichprobenereignis des Flicker-Ensembles aus 16 Seeds mal 60 Schritten (NIS { "0.8815" } gegen ein Band von [{ "0.9125" }, { "1.0914" }]), kein Defekt. Das Band ist ein { "95" }-%-Band, sodass etwa { "5" } % der Seeds ein passendes Filter konstruktionsbedingt markieren ({ "40" } frische Seeds dieses Szenarios: Quanten { "1" } und klassisch { "2" } markiert); bei { "64" } mal { "200" } liegt derselbe Seed für beide Uhren im Band (NIS { "0.990" } und { "1.001" }). Bekannte Nacharbeit: Die Art fusion hat dieselbe Lücke (klassische Integrität { "0.80" } mit einem Boden); die Art hybrid bleibt über { "0.99" }.

# text
seg-c7308350b6d4 = <b>Eingabe des MCP-Servers gehärtet.</b> Die Szenario-Tools des MCP-Servers akzeptieren jetzt nur Inline-Inhalt und lehnen Dateiquellenfelder ab; die Eingabegröße ist begrenzt. Hinweis: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-912ecb44cee4 = Lab-Replay: Testbedingungen, Kampagnenläufer und Bewertung ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> spielt Aufzeichnungen × Front-End-Ketten × Schleifenentwürfe (<c2/>) ab und bewertet jede Zelle gegen eine Testbedingungsdatei je Aufzeichnung (<c3/>, TOML oder JSON). Diese Datei gibt an, was ein Labor über die Aufzeichnung weiß: die erwarteten Satelliten und für jedes Ereignis sein Typ-Label, Beginn und Ende, betroffene Satelliten und das angegebene J/S- oder Störsenderleistungsprofil. Sie besteht nur aus Metadaten. Die Bewertungen je Satellit, für den ganzen Lauf und je Ereignis, sind:

# text
seg-180447aaf31e = Verfügbarkeit, Zeit bis zum Verlust der Verriegelung und das angegebene J/S beim Verlust;

# text
seg-1ababddb0d87 = Wiedererfassungszeit, vom Ereignisende und vom Verlust an;

# text
seg-a6468323c971 = gemessene C/N0-Degradation je Bin des angegebenen J/S;

# text
seg-4cb6f510e159 = Falsch-Einrast-Episoden je verriegelter Stunde (die Markierung des Trackers oder Doppler gegen eine Truth-Begleitdatei);

# text
seg-97c6243bac2e = Jitter der PLL- und DLL-Diskriminatoren.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = Neben jeder gemessenen Degradationskurve ist eine analytische Referenz der spektralen Trennung (<c1/> mit dem <c2/> des Typs) eingezeichnet und überall, wo sie erscheint, als MODELLED beschriftet.

# text
# c1: data_class
# c2: synthetic
# c3: client-confidential
# c4: run.epochs
# c5: kshana.track-epoch/1
# c6: cell_key
# c7: report::digest
# c8: scorecard.csv
# c9: .json
# c10: report.html
# c11: DIGEST
# c12: [scoring.bars]
seg-eb5c38197dab = Zellen laufen parallel durch die Verriegelungs-Zustandsmaschine der Tracking-Sitzung, und jede wird atomar unter einem Inhalts-Hash-Schlüssel geschrieben. Der Schlüssel umfasst das SHA-256 der Aufzeichnung, die Hashes von Bedingung, Front-End, Entwurf, Lauf und Bewertung, die erforderliche <c1/> (<c2/> | <c3/>) und die Engine-Version. Ist <c4/> gesetzt, werden auch der Strom <c5/> und die Verriegelungsereignisse jeder Zelle aufbewahrt, nach dem Zellschlüssel benannt und in die Zelle gehasht. <c6/> und <c7/> sind öffentlich, sodass ein Verbraucher jeden Schlüssel und den Digest neu ableiten kann. Ein erneuter Lauf überspringt daher fertige Zellen, und Ausgaben hängen nie von der Anzahl der Worker ab. Der Lauf schreibt <c8/>/<c9/>, ein eigenständiges <c10/> und einen <c11/>. Pass/Fail-Zielwerte (<c12/>, je Aufzeichnung überschreibbar) werden beim Erstellen des Berichts angewendet.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (Standard <c2/>, Teil des Bewertungs-Hashes) wählt das C/N0 hinter dem gemeldeten C/N0 und der Degradationskurve. Beide Schätzungen werden immer bewertet und gemeldet (Mediane über den ganzen Lauf und über die Basislinie sowie je J/S-Bin), und die Zelle und die Scorecard halten den Schätzer fest. NWPR liest unter dem eigenen Jitter der Schleife um etwa { "8" } dB × Bn·T zu niedrig; M2M4 nicht.

# text
seg-baf1a2422a66 = Ebenfalls neu:

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> baut die Scorecards, den Bericht und den Digest aus den Zellen neu auf;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> prüft eine Testbedingungsdatei gegen ihr Schema;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> importiert die Annotationen <c2/> einer SigMF-Aufzeichnung als Ereignisse;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = Python erhält <c1/>, <c2/> und <c3/>;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> erhält <c2/>, das inkrementell und unter dem Sample-Budget je Aufruf fortsetzbar ist, wobei jede Datei auf das Arbeitsverzeichnis beschränkt ist, und <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Tests: <c1/> führt eine synthetische Kampagne aus { "3" } Aufzeichnungen × { "2" } Front-Ends × { "2" } Entwürfen aus. Ihre Szenen tragen angegebene C/N0-Profile, und sie deckt Folgendes ab:

# text
seg-3f2fbdecb101 = jede Metrik, geprüft gegen die eingespeiste Truth;

# text
seg-e103a30260db = Fortsetzung nach einem teilweisen Einzel-Worker-Lauf mit einer beschädigten Zelle, byte-identisch zu einem ununterbrochenen Lauf mit vier Workern;

# text
seg-79164d8b0b22 = Epochendateien je Zelle;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = eine Regression der Wiedererfassung mit drei Satelliten über { "20" } s: Mit eingeschaltetem <c1/> ist jeder Kanal innerhalb von { "2" } s nach einer Lücke von { "2" } s zurück; das Ergebnis bei ausgeschaltetem <c2/> ist festgelegt;

# text
seg-1deb4ab83054 = Zielwerte, die ohne erneuten Lauf neu beurteilt werden;

# text
seg-351f9cdcbcd6 = die CLI;

# text
seg-2c35af369a36 = ignorierte Durchsatz- und Speicherprüfungen im Release-Modus, darunter eine Aufzeichnung von { "4" } GB ({ "5.45" }× Echtzeit, Spitzenspeicher { "2" } MB über dem anfänglichen RSS; Messungen auf einer Maschine, keine Zielwerte).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Nur Software: Nichts sendet, und es wird keine Störungs- oder Spoofing-Wellenform synthetisiert. Entwurfs- und Ist-Notizen: <c1/>.

# text
seg-c9871226c82f = Tracking-Engine für Lab-Replay ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Schleifenentwurfsdateien</em>: <c1/>-TOML (<c2/>; Parser <c3/>). Ein oder mehrere benannte Entwürfe legen jedes Schleifenfeld fest:

# text
seg-0437148324ca = Trägerart (PLL, FLL oder FLL-gestützte PLL), Ordnungen und Bandbreiten;

# text
seg-4e722960f8c6 = PLL-/FLL-/DLL-Diskriminatoren und Trägerstützung;

# text
seg-44976e3ad4e7 = Abstand und Integration;

# text
seg-5c06173036d6 = Verriegelungsschwellen und C/N0-Fenster sowie Bitsynchronisation;

# text
seg-405e693dd757 = die Verriegelungs-Zustandsmaschine;

# text
# c1: "auto"
seg-e6908584e2f4 = die Übergabe-Akquisition (<c1/> oder explizit).

# text
# c1: extends
seg-8844cc963705 = Entwürfe können einander mit <c1/> erweitern. Unbekannte Schlüssel werden abgelehnt. Jeder aufgelöste Entwurf hat einen SHA-256-Hash über eine kanonische JSON-Form (auf jeder Ebene sortierte Schlüssel, feste Zahlenformatierung), sodass der Hash nicht von der Feldreihenfolge abhängt; jede Ausgabe hält ihn fest. Oberflächen:

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, wobei explizite Flags den Entwurf überschreiben und festgehalten werden;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, das jeden Entwurf der Datei ausführt;

# text
# c1: iq_track(design=, design_name=, reacquire=)
# c2: iq_loop_designs
seg-6815ec9b33c6 = Python <c1/>, <c2/>;

# text
# c1: iq_track
# c2: design
# c3: design_name
seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

# text
# c1: EpochOutput.cn0_m2m4_dbhz
# c2: cn0_m2m4_dbhz
# c3: cn0_beaulieu_dbhz
seg-70d3b295bea0 = <em>M2M4-C/N0</em> (<c1/>, die Spalte <c2/> der Track-Epoche nach <c3/>; Python-Epochen-Dicts). Die Schätzung aus zweitem und viertem Moment über dieselben Fenster wie NWPR, nur aus der Prompt-Leistung: NWPR liest unter dem eigenen Trägerjitter der Schleife zu niedrig (etwa { "8" } dB × Bn_PLL·T), M2M4 nicht. Auf GPS L2C CM ({ "20" } ms, nominal { "40" } dB-Hz, PLL { "1" } bis { "10" } Hz) liest es bei jeder Bandbreite { "39.93" } dB-Hz, während NWPR von { "39.55" } auf { "38.22" } fällt; auf L1 C/A bei { "45" } dB-Hz liest es { "45.34" }. NWPR und jede andere Ausgabe sind unverändert (eine Bit-für-Bit-Festlegung). Der binäre Datensatz bleibt bei { "184" } Bytes (der Wert nimmt den reservierten Float und das Flag-Bit { "6" }).

# text
seg-c02d07475717 = Zusätzliche Korrelator-Taps (Multikorrelator / SQM).

# text
# c1: [design.integration] extra_taps_chips = [..]
# c2: EpochOutput.extra
# c3: (offset, value)
# c4: kshana.track-epoch/1
# c5: 184 + 16 × taps
# c6: extra_taps_chips
# c7: --extra-taps
# c8: extra_taps
# c9: extra_taps_chips
# c10: iq_track
seg-70fcdc903413 = <c1/> (Versätze in Chips vom Prompt, positiv früh; höchstens { "16" }, jeder innerhalb von ±{ "2" }) korreliert zusätzliche Replikate neben E/P/L und gibt sie als <c2/> zurück (<c3/> in Entwurfsreihenfolge). Die Schleifen verwenden sie nie. Der Schlüssel wird aus dem kanonischen JSON weggelassen, wenn er leer ist, sodass der Hash des Standardentwurfs und jede Ausgabe ohne Taps unverändert sind (<c4/> bleibt; die CSV/JSONL/Binärdaten ohne Taps sind bitidentisch). Mit Taps: CSV-/JSONL-Spalten und ein binärer Datensatz von <c5/> Bytes, dessen Header <c6/> trägt, sodass ein alter Leser die Datei ablehnt, statt sie falsch zu parsen. <c7/> (CLI), <c8/> (Python) und <c9/> (MCP <c10/>). Die Entwürfe eines Laufs müssen bei den Taps übereinstimmen.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Parallele Kanäle</em> (<c1/> / <c2/>; Rust <c3/>). Die Kanäle jedes Chunks laufen auf bis zu N Threads (<c4/>; <c5/> bleibt seriell). Die Korrelation und die Verriegelungs-Zustandsmaschine eines Kanals berühren nur diesen Kanal; seine Epochen und Ereignisse werden gepuffert und in Kanalreihenfolge in die Senken geschrieben, sodass die Ausgabe (CSV, JSONL, Binärdaten, Ereignisse, Zusammenfassung) für jedes N byte-identisch zum seriellen Lauf ist. Der Standard bleibt { "1" } Thread. Gemessen an einer Aufzeichnung mit 12 Kanälen, { "4" } s, { "4.092" } MHz auf { "4" } Kernen: { "19.5" } s seriell, { "11.5" } s bei { "2" } Threads, { "6.3" } s bei { "4" } ({ "3.1" }×; die anfängliche Akquisition ist seriell).

# text
# c1: kshana.acq-surface/1
# c2: iq::acq_surface
# c3: docs/design/ACQ-SURFACE.md
# c4: iq acquire --surface <path>
# c5: iq_acq_surface
# c6: iq_acquire
# c7: surface_out
# c8: acquire
# c9: acquire
seg-cf59911d458f = <em>Export der Akquisitionsfläche</em> (<c1/>; <c2/>, <c3/>). <c4/> (ein PRN; CSV, JSON oder Binärdaten), Python <c5/> und MCP <c6/> <c7/> schreiben die gesamte Korrelationsleistungsfläche aus Doppler × Codephase, die die Suche berechnet (ihre Zellen sind Bit für Bit die von <c8/>), mit dem Maximum und zwei feinen Doppler-Verfeinerungen: einer parabolischen Schätzung und einer Feinsuche mit 1/16-Bin (≈{ "5" } Hz bei { "4" } ms kohärent, gegenüber Bins von { "167" } Hz). <c9/> selbst und jeder Standard sind unverändert.

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Streaming-Epochenausgabe</em> (<c1/>; <c2/>). Jede Schleifenaktualisierung trägt:

# text
seg-ff549f07ce78 = die Early-/Prompt-/Late-Korrelatoren;

# text
seg-00457c1bb059 = alle drei Diskriminatorausgaben;

# text
seg-b17d335f6cac = die NCO-Zustände von PLL/FLL/DLL und die Trägerphase;

# text
seg-a3bf3f1034cd = das PLI und die Verriegelungs-Flags;

# text
seg-7912a72da79b = beide C/N0-Schätzungen und die Bits;

# text
seg-8d105d656041 = den Verriegelungszustand.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = Sie wird laufend geschrieben, als CSV, JSON Lines oder in einer versionierten Binärform, mit Lesern in Rust (<c1/>) und Python (<c2/>).

# text
# c1: iq track
# c2: --epochs
# c3: --events
# c4: --summary
# c5: kshana.track-summary/1
# c6: iq sweep
# c7: --epochs
# c8: --events
# c9: iq_track
# c10: epochs_out
# c11: events_out
seg-aa081bfd9878 = <c1/> erhält <c2/>, <c3/> und <c4/> (<c5/>), und <c6/> erhält <c7/> und <c8/>. MCP <c9/> erhält <c10/>/<c11/> und baut seine Antwort aus der Zusammenfassung mit begrenztem Speicher.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = Der Heap eines Laufs wächst nicht mehr mit der Länge der Aufzeichnung: <c1/> misst ihn mit einem zählenden Allocator ({ "6" }× die Länge, derselbe Spitzenwert innerhalb von { "64" } KiB), mit einer Kontrolle, die zeigt, dass der In-Memory-Pfad wächst.

# text
seg-e3336e670d51 = Ein Patch-Release auf { "0.29.2" }. Kshana Studio ist um zwei Ansichten neu aufgebaut: eine Einfache Ansicht, die zuerst antwortet und in einfachen Worten erklärt, und eine Erweiterte Ansicht mit dem vollständigen Dashboard. Zwei kleine Korrekturen auf kshana.dev kommen hinzu. Die Engine ändert sich nicht: Jedes mitgelieferte Szenario liefert bis auf den Versionsstempel ein byte-identisches Ergebnis zu { "0.29.2" }.

# text
seg-c40ab967ace6 = <b>Kshana Studio hat eine Einfache Ansicht.</b> Mit ihr öffnet sich das Studio.

# text
seg-6a5ae001d00e = Die Antwort kommt zuerst: Ein Szenario öffnet sich mit seinem Ergebnis, in einem einfachen Satz formuliert. Jedes mitgelieferte Szenario hat einen eigenen Satz, geschrieben für das, was dieses Szenario misst.

# text
seg-375421534e4c = Höchstens fünf Einstellungen sind sichtbar, nämlich die, die die Antwort am stärksten verändern. Die übrigen stehen unter „Erweiterte Einstellungen“, eingeklappt, bis Sie sie öffnen.

# text
seg-d8650ae64549 = „So wird es berechnet“ erklärt die Methode in wenigen Zeilen, und „Für Forschende“ zeigt die eigenen Zahlen der Engine, die Szenariodatei und die Belege hinter dem Ergebnis.

# text
seg-36af7640e6ad = <b>Das vollständige Dashboard ist die Erweiterte Ansicht.</b> Jedes Panel, jedes Diagramm, jeder Export und jeder Bericht des früheren Studios ist dort vorhanden.

# text
# c1: view=advanced
seg-0428d0a7921b = <b>Ein Schalter wechselt zwischen den beiden Ansichten und behält Ihre Position bei.</b> Das Szenario, die Ansicht, in der Sie waren, und alle bearbeiteten Einstellungen werden übernommen. Das Studio merkt sich, welche Ansicht Sie zuletzt benutzt haben. Links von der Website und aus der Dokumentation öffnen die Einfache Ansicht; ein Link mit <c1/> öffnet die Erweiterte Ansicht, und jeder frühere Studio-Link öffnet weiterhin dasselbe Szenario in derselben Ansicht.

# text
seg-2c98ed084c10 = <b>Eine schnellere erste Ansicht bei langsamen Verbindungen.</b> Die aufgezeichnete Antwort eines Szenarios wird gezeichnet, bevor der Rest des Studios geladen ist; bei einer langsamen mobilen Verbindung erscheint die Antwort so nach etwa zwei Sekunden statt nach etwa neun.

# text
seg-2214d2dcfab4 = <b>Bessere Suche.</b> Eine Suche listet nun zuerst Szenarien auf, deren Bereich oder Titel zu den Wörtern passt, vor Szenarien, die sie nur im Dateinamen oder im Text erwähnen.

# text
seg-aa8d43280c19 = <b>Der Globus auf der Startseite wird bei eingeschalteter reduzierter Bewegung nicht mehr leer.</b> Bei eingeschalteter Systemeinstellung für reduzierte Bewegung konnte das Ändern der Fenstergröße den Hero-Globus leer lassen, bis die Seite gescrollt wurde. Der Globus wird nun im selben Frame wie die Größenänderung neu gezeichnet.

# text
seg-da4b78816df1 = <b>Die L-Band-Konsole auf der Startseite erklärt ihr leeres Band.</b> In „Watch a jammer take the band“ blieb das Panel GPS L5 / Galileo E5a die ganze Minute lang dunkel, was wie ein Defekt wirkte. In diesem Szenario sendet kein Jammer in diesem Band, und die Satellitensignale liegen unter dem Rauschteppich, sodass sich dort nichts über ihn erhebt. Ein dezentes Etikett sagt das nun in jedem Panelabschnitt, in dem nichts über dem Rauschteppich liegt (das Panel L5 / E5a und das Panel L2C, bevor sein Rauschjammer startet), zusammen mit dem C/N0 und dem Lock-Zustand jedes Bandes aus demselben Lauf. Es wird nur dort gesetzt, wo nichts über dem Rauschteppich liegt, und verdeckt daher nie Jammer-Energie.

# text
seg-e353fdee7033 = Ein Patch-Release auf { "0.29.1" }. Es entfernt doppelten Code in den LEO-Navigationsnachrichten-, Fusions- und Spektrummodulen, fügt kshana.dev ein helles Thema hinzu, verlegt Kshana Studio auf eine eigene Adresse, macht die Website für Suchmaschinen und KI-Assistenten lesbar, behebt mehrere Kleinigkeiten im Studio und lässt npm-Releases ohne gespeichertes Token veröffentlichen. Keine Engine-Ausgabe ändert sich: Jedes mitgelieferte Szenario liefert bis auf den Versionsstempel ein byte-identisches Ergebnis zu { "0.29.1" }.

# text
seg-e8bf0a4fdc35 = <b>Ein helles Thema für kshana.dev.</b> Jede Seite kann hell oder dunkel gelesen werden. Die Website folgt der Systemeinstellung der lesenden Person und hat einen Schalter zum Ändern.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: llms.txt
# c4: llms-full.txt
seg-8e7cabc14c40 = <b>Suchmaschinen und KI-Assistenten können die Website lesen.</b> Jede Seite hat nun einen eigenen Titel, eine eigene Beschreibung, eine kanonische Adresse, Social-Card-Tags und strukturierte schema.org-Daten sowie Klartext für die Abschnitte, die ein Skript zeichnet. Die Website veröffentlicht <c1/>, eine <c2/> mit dem Datum der letzten Änderung jeder Seite, <c3/> und <c4/> (einen kurzen und einen vollständigen Klartext-Leitfaden für KI-Assistenten) sowie einen IndexNow-Schlüssel, damit ein Deploy Suchmaschinen mitteilen kann, was sich geändert hat.

# text
# c1: NPM_TOKEN
# c2: docs/RELEASING.md
seg-804ba71be9ed = <b>npm-Releases können ohne gespeichertes Token veröffentlichen.</b> Der npm-Job läuft nun mit Node { "24" } und npm { "11.5.1" } oder höher, die npm Trusted Publishing unterstützen: npm tauscht die GitHub-Identität des Release-Jobs gegen eine kurzlebige Anmeldeinformation. Das Secret <c1/> funktioniert weiterhin und wird verwendet, solange es gesetzt ist; es ändert sich also nichts, bis Trusted Publishing für das Paket auf npmjs.com eingeschaltet wird. <c2/> listet die Schritte auf.

# text
seg-81405e5a5e06 = <b>Die Überschrift der Startseite ist über dem Globus lesbar.</b> Ein weicher Schatten liegt nun hinter der Überschrift und ihrem Text und blendet die Bahnlinien und Satellitenpunkte des animierten Globus aus, wo sie ihn kreuzen.

# text
# c1: /playground/
seg-24b8363acc14 = <b>Kshana Studio hat eine eigene Adresse: <a1>https://kshana.dev/studio/</a1>.</b> Jeder Link auf der Website und in der Dokumentation zeigt dorthin. Die alte Adresse <c1/> funktioniert weiterhin und leitet zur neuen weiter, wobei Szenario, Ansicht und andere Einstellungen im Link erhalten bleiben.

# text
seg-12f223b986bd = <b>Studio-Korrekturen.</b> Die Engine-Datei wird einmal statt zweimal heruntergeladen. Während des Downloads zeigt das Studio sofort das aufgezeichnete Ergebnis des Szenarios, als aufgezeichnet gekennzeichnet, statt eines leeren Bildschirms. Auf einem Smartphone ist die Kopfzeile eine kompakte Zeile. Die Kennzahlen umbrechen zu zweit pro Zeile, sodass keine über den Bildschirmrand hinausragt. Feldbezeichnungen verwenden die eigenen Worte des Szenarios mit dem Feldnamen daneben, und die Suche findet Felder über beides.

# text
# c1: downsample_grid
# c2: navsignal::simpson
# c3: leo_link::geometry
# c4: leo_fusion::geom
# c5: scenarios/
seg-c130d8a4dc5e = <b>Weniger doppelter Code.</b> Die Einheitentabelle der LEO-Navigationsnachricht schrieb dieselben zehn SISRE-Statistikzeilen für vier Fit-Zusammenfassungen. Ein Makro schreibt sie nun einmal. Die beiden Spektrum-Wasserfalldiagramme teilen sich eine Zeitachse, eine Farbleiste und ein C/N0-Balkenpanel. Das Downsampling des Hauptgitters verwendet <c1/> wieder, und das Simpson-Integral verwendet <c2/> wieder. Die zwei Einstiegspunkte der LEO-Durchlaufart teilen sich einen Einrichtungsschritt. <c3/> importiert die Vektorhilfen von <c4/>, statt sie zu kopieren. Der erweiterte Bericht importiert das HTML-Escaping des API-Berichts, statt es zu kopieren. Jede der { "139" } Szenariodateien in <c5/> wurde auf { "0.29.1" } und mit diesem Code ausgeführt, und jede Ausgabedatei ist byte-identisch.

# text
# c1: src/leo_navmsg/units.rs
# c2: src/leo_fusion/pvt_units.rs
# c3: PVT_UNITS
# c4: sonar-project.properties
# c5: tests/sonar_cpd_exclusions_are_justified.rs
seg-166b0435c96f = <b>Die Einheitentabellen von leo-navmsg und leo-pvt haben eigene Dateien.</b> Sie wurden aus Modulen, die auch Logik enthalten, nach <c1/> und <c2/> verschoben. <c3/> behält seinen öffentlichen Pfad. Nur diese beiden Tabellendateien kommen zu den Ausnahmen der Copy-Paste-Erkennung für deklarative Kataloge in <c4/> hinzu, die <c5/> prüft.

# text
# c1: event=push
seg-f8b372e08ef9 = <b>Das CI-Badge der README zeigt das Ergebnis von Pushes auf main.</b> Das Badge zählte Läufe jedes Ereignisses auf main, sodass es „failing“ anzeigen konnte, obwohl jeder Push-Lauf grün war; es fragt nun nur Push-Läufe ab (<c1/>).

# text
seg-7c41a482c7d8 = Ein Patch-Release auf { "0.29.0" }: die gemessene Abdeckungszahl, die Namenszeile des Projekts auf kshana.dev, ein schnellerer Coverage-Job und eine überarbeitete README. Keine Engine-Ausgabe ändert sich: Jedes Szenario liefert dasselbe Ergebnis wie auf { "0.29.0" }.

# text
seg-997490bd1696 = Korrekturen an veröffentlichten Zahlen

# text
# c1: db796dd
# c2: 95.35 %
# c3: src/
# c4: b1d350d
# c5: tests/coverage_figure_doc_sync.rs
# c6: docs/COVERAGE.md
seg-ed4b071e4bd9 = <b>Zeilenabdeckung: ~{ "96" } % → ~{ "95" } %.</b> Der Coverage-Job hat den freigegebenen Code von { "0.29.0" } neu gemessen (Commit <c1/>, CI-Lauf { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } von { "58,697" } Zeilen in <c3/>. Die veröffentlichte Zahl war { "95.63" } % ({ "37,697" } von { "39,419" } Zeilen), gemessen auf <c4/> vor { "0.28.0" }; sie rundete auf ~{ "96" } %. Die neue Zahl rundet auf ~{ "95" } %, sodass sich jede Stelle, die <c5/> festhält, gemeinsam ändert: <c6/>, das README-Badge, die Evidence-Zeile und die CI-Tabelle, die Badges von crates.io, PyPI und npm, der technische Bericht und die Coverage-Seite auf kshana.dev. Die Untergrenze von { "85" } % bleibt unverändert.

# text
# c1: web/fonts/
# c2: web/fonts/FONTS.json
# c3: web/tools/fetch_third_party.py
# c4: text=
seg-577baa03af04 = <b>Die Namenszeile auf kshana.dev.</b> „Kshana · क्षण · the precise instant“ eröffnet nun den Home-Hero und steht in der Fußzeile jeder Seite unter der Marke. kshana.dev stellt weiterhin keine Anfrage an einen anderen Host: Die Devanagari-Schrift ist eine selbst gehostete Noto-Sans-Devanagari-Teilmenge der drei Buchstaben von क्षण ({ "1,692" } Bytes, <c1/>, mit ihrem Text der SIL Open Font License und ihrem SHA-256 in <c2/>). <c3/> kann nun eine Google-Fonts-Teilmenge mit <c4/> unter einem inhaltsadressierten Dateinamen speichern.

# text
# c1: /evidence#research
# c2: /docs/changelog
# c3: /
# c4: .html
# c5: ROADMAP.md
seg-35b5bc4ee466 = <b>Die Links der Website landen dort, worauf sie zeigen, mit sauberen Adressen.</b> Ein Link zu einem Abschnitt setzt diesen Abschnitt auf Smartphone und Desktop knapp unter die Kopfzeile: Ein Missions-Sektor-Link öffnet diesen Sektor mit seinem Panel oben; Links zu Capabilities und Editions halten ihre Position, während die Diagramme darüber gezeichnet werden; Editions fügt keinen zweiten Kopfzeilenversatz mehr hinzu; und ein Link in einen eingeklappten Teil einer Docs-Seite öffnet ihn. Jede Seite wird über ihre saubere Adresse verlinkt (<c1/>, <c2/>, <c3/> für Home), und die kanonischen Links, die Sitemap und die Weiterleitungen alter Adressen nennen dieselben; die Adressen mit <c4/> funktionieren weiterhin. Research hat einen eigenen Link in der Kopfzeile, zwischen Evidence und Developers, und in der Fußzeile. Die Docs zeigen die Roadmap nicht mehr (<c5/> bleibt im Repository): Die Gruppe Project besteht aus Changelog, Licensing, Security, Contributing, Governance und Code of conduct, und das Glossary ist zu Get started umgezogen.

# text
seg-3da9f00f5ce6 = <b>Der Coverage-Job ist schneller.</b> Auf { "0.29.0" } dauerte er { "143" } Minuten gegenüber gesunden { "91" } bis

# text
# c1: tests/property.rs
# c2: determinism
# c3: advanced_report
# c4: animation
# c5: tests/support/corpus.rs
# c6: determinism
# c7: KSHANA_CORPUS_THREADS=1
seg-85d502773367 = Der Fuzzer <c1/>, beim letzten Mal die Ursache, benötigte { "4" } davon. Das mitgelieferte Korpus wuchs von { "74" } auf { "139" } Szenarien, und drei Test-Binaries gingen es Datei für Datei vollständig durch (<c2/> zweimal, <c3/> und <c4/> je einmal): zusammen { "37" } Minuten unter Coverage-Instrumentierung, gegenüber { "3" } auf { "0.27.2" }. Sie teilen sich nun <c5/>, das die Arbeit pro Szenario auf allen Kernen ausführt und die Ergebnisse sortiert zurückgibt; jedes Szenario und jede Assertion bleibt erhalten. Auf einem arm64-Laptop, Debug-Build: <c6/> braucht { "143" } s auf { "14" } Kernen gegenüber { "612" } s mit <c7/> (dem alten seriellen Durchlauf).

# text
# c1: tools/capture_site_shots.mjs
# c2: tools/readme_shots.py
# c3: docs/assets/readme/site/SHOTS.json
seg-bb69dbadbc81 = <b>Die README, überarbeitet.</b> Sie beginnt mit derselben Namenszeile wie die Website; die Studio-Screenshots sind vom Studio { "0.29.1" } neu aufgenommen, mit einem neuen vom Studio auf einem Smartphone und seiner unteren Schrittleiste; ein neuer Streifen „The site“ zeigt drei Seiten von kshana.dev aus dem Build { "0.29.1" } (<c1/>, zusammengestellt von <c2/> und festgehalten in <c3/>); die Coverage-Zahl lautet ~{ "95" } %; und der Alternativtext der Research-Abbildung, der den der Architekturabbildung wiederholte, beschreibt nun die Papers. Die Header-Badges sind kleiner und kürzer ({ "18" } px hoch; „~{ "95" }%“, „83/223“, „quality“, „AGPL-3.0“, „zenodo.20528627“), sodass die elf auf zwei Zeilen passen; jeder Link und jeder Alternativtext behält seine volle Bedeutung.

# text
# c1: kshana-mcp
seg-f61ef3e16884 = <b>Der Container-Image-Job erhält { "90" } Minuten.</b> Bei { "v0.29.0" } erreichte der emulierte linux/arm64-Build des Images <c1/> beim Kompilieren seines letzten Crates das alte Limit von 45 Minuten, sodass das Image, der Eintrag in der MCP-Registry und die Kanalprüfung nicht veröffentlicht wurden. Das Limit beträgt nun { "90" } Minuten; das Image ist unverändert.

# text
# c1: src/ephem.rs
# c2: src/sgp4.rs
# c3: 0.323_273_64
# c4: 0.323_273_640
# c5: _64
# c6: _32
# c7: f64
# c8: f32
seg-1688bf9f0fec = <b>Acht Float-Literale neu gruppiert</b> in <c1/> und <c2/> (<c3/> → <c4/>): SonarQube Cloud las eine letzte Gruppe <c5/> oder <c6/> als fehlendes Suffix <c7/> oder <c8/> (Regel S7454). Die Werte sind dieselben Zahlen, sodass jedes Ergebnis unverändert bleibt.

# text
seg-81fd160937db = Zwölf neue Szenarioarten und drei neue Arten, einen Lauf zu lesen. Die Engine deckt nun das Funkspektrum, das gesamte Sonnensystem, Konstellationen um jeden Körper, Kampagnen, die Szenarien zu einer Mission verketten, sowie Positionierung, Navigation und Zeitgebung (PNT) aus der niedrigen Erdumlaufbahn (LEO) vom Signal bis zur Lösung ab. Jeder Lauf kann außerdem als Animation, als vollständiger Bericht und als Satz von Interoperabilitätsdateien für andere Werkzeuge geschrieben werden.

# text
seg-118be64d7cb2 = Rund um die Engine: eine neu gestaltete kshana.dev (eine mehrseitige Website und ein neues Dashboard Kshana Studio, das jede Fähigkeit im Browser ausführt), eine neu geschriebene README, vierzehn Werkzeuge auf dem Model-Context-Protocol-Server (MCP), ein Browser-Build, der dieselben Zahlen liefert wie der native, und eine öffentliche Seite für Kshana Pro.

# text
seg-ea31356bc17d = Szenariodateien (plus ein Suite-Manifest)

# text
# c1: kshana example
seg-26654cd81de1 = { "138" }, davon { "132" } für <c1/> mitgeliefert

# text
seg-3d1a85e93e48 = davon MODELLED (angegebenes Modell, auf interne Konsistenz geprüft)

# text
seg-e77f9d273ee1 = davon PARTNER (benötigt Hardware oder Daten eines Partners)

# text
seg-e94cd6b3561a = Woher das Wachstum kommt:

# text
seg-1759a8cce7d6 = Arten

# text
seg-94de9433d99f = Szenariodateien

# text
seg-03d7aea335dc = Matrixzeilen (validated + modelled)

# text
seg-fdd674722717 = Spektrum

# text
seg-59583fa40da3 = Sonnensystem und Positionierung um jeden Körper

# text
seg-fafa167623df = Maritime, Straßen- und Schienenszenarien

# text
seg-fc571c46e522 = Animation, Berichte, Interoperabilitäts-Exporte

# text
seg-2746e0d9f787 = LEO-Signalentwürfe und das Mehrband-Spektrum

# text
seg-d40ec114d1f9 = LEO-Positionierung, Zeitgebung und Fusion

# text
seg-0157f649e65b = LEO-Ende-zu-Ende-Kette

# text
seg-423283112128 = LEO-Resilienz-, Schwerpunktbereichs- und Endnutzerszenarien

# text
seg-395beca13299 = Insgesamt hinzugefügt

# text
# c1: src/celeste_iod.rs
seg-ea9dc4093d8a = Die LEO-Fähigkeit ist systemunabhängig: Sie läuft mit generischen, angegebenen Parametern und braucht kein benanntes System. Benannte Systeme sind optionale Voreinstellungen, jede in einer eigenen Datei mit ihrer öffentlichen Quelle. Eine Voreinstellung, Celeste IOD (In-Orbit-Demonstration), verwendet Zahlen, die auf dem ESA-NAVISP-LEO-PNT-Workshop { "2026" } vorgestellt wurden (ESA ist die Europäische Weltraumorganisation; NAVISP ist ihr Navigation Innovation and Support Programme); sie liegt in einer Datei, <c1/>, mit ihren fünf Szenarien, die nur im Repository liegen, sodass sie ohne Quelländerung zurückgehalten werden kann, und keine ihrer Workshop-Zahlen wird in diesem Changelog wiederholt.

# text
# c1: ephemeris
seg-c36a5015c03c = <b>Lesen Sie „Revisions to published numbers“ vor dem Upgrade.</b> Eine Engine-Ausgabe ändert sich (die Spalten im inertialen Bezugssystem der Art <c1/>, nach einer Vorzeichenkorrektur in der Nutationsmatrix), und das Audit der Dokumentation hat Zahlen korrigiert, die frühere Dokumente gedruckt hatten.

# text
seg-7fe505d3232b = Status: <b>VALIDATED</b> bedeutet, gegen eine unabhängige externe Referenz geprüft (eine veröffentlichte Tabelle, die Software einer anderen Gruppe oder Messdaten); <b>MODELLED</b> bedeutet, ein angegebenes Modell, nur auf interne Konsistenz geprüft; <b>PARTNER</b> bedeutet, die Prüfung benötigt Hardware oder Daten eines Partners.

# text
seg-ec7abb62f217 = 3GPP, 5G, NTN

# text
seg-c5eb2d160429 = 3rd Generation Partnership Project; Mobilfunknetz der fünften Generation; nichtterrestrisches Netz

# text
seg-9bb1a987fedc = AD, BC

# text
seg-bbe2b5aa0557 = Zeitrechnungen (anno Domini, vor Christus)

# text
seg-05bbe79b1991 = AIAA

# text
seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

# text
seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

# text
seg-81799e2a0c43 = Alternative Binary Offset Carrier; Binary Offset Carrier; binäre Phasenumtastung; Multiplexed Binary Offset Carrier (Signalmodulationen)

# text
seg-b2d165acb4e7 = ATOMIC

# text
seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (ein veröffentlichtes LEO-Ephemeridenmodell)

# text
seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

# text
seg-7f71a4795674 = Coarse/Acquisition-Code sowie die Träger- und Zivilsignalnamen des Global Positioning System

# text
seg-e464509f3abb = Träger-zu-Rauschleistungsdichte-Verhältnis

# text
seg-d8ba917c09b8 = CIO

# text
seg-4321532214e3 = Celestial Intermediate Origin

# text
seg-de6c33774c9c = CLI

# text
seg-3096eb1d5a15 = Kommandozeilenschnittstelle

# text
seg-9aa3c2e54398 = zyklische 24-Bit-Redundanzprüfung (Qualcomm-Polynom)

# text
seg-1e1009e225aa = CSAC

# text
seg-6ff440ff2c0c = CSS, HTML, SVG, XML

# text
seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

# text
seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

# text
seg-b4758ea40624 = durch Kommas getrennte Werte; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; Uniform Resource Locator

# text
seg-3ad592244ea8 = Dauerstrich (continuous wave)

# text
seg-287014fdc28d = CZML, KML, GeoJSON

# text
seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (Karten- und Globusformate)

# text
seg-3415aa029e39 = Development Ephemeris { "441" } des Jet Propulsion Laboratory

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = Digital Object Identifier

# text
seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

# text
seg-a149d6e76bcb = Dilution of Precision: geometrisch, Position, horizontal, vertikal

# text
seg-bc679de1b3a8 = E1, E5, E5a, E5b

# text
seg-bb2b62a48d99 = Signalnamen von Galileo

# text
seg-544f4fcbd68f = ein Slot-Name in der Konstellationstabelle des Global Positioning System

# text
seg-dd9cfd581e5d = ECEF

# text
seg-1a59ad88eca9 = erdzentriert, erdfest

# text
seg-7cf8bec6418e = EE

# text
seg-ceacb6924d4d = Gleichung der Äquinoktien

# text
seg-5d59005d9757 = Earth Gravitational Model { "2008" }

# text
seg-de3b39993e2a = EIRP

# text
seg-7f1b85286c96 = äquivalente isotrope Strahlungsleistung

# text
seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (astronomische Referenzbibliotheken)

# text
seg-51f1fda55cc7 = ESA, NAVISP

# text
seg-399a11a6e7c7 = Europäische Weltraumorganisation; ihr Navigation Innovation and Support Programme

# text
seg-01eb6fdcdb90 = FDMA

# text
seg-6723fd8624df = Frequenzmultiplex-Vielfachzugriff

# text
seg-6d5d27174fe9 = GCRF, GCRS

# text
seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

# text
seg-d41af8f18aed = GLONASS

# text
seg-81f742947af1 = das Globale Satellitennavigationssystem Russlands

# text
seg-d2a107373b59 = GNSS, GPS

# text
seg-d703f29c82eb = globales Satellitennavigationssystem; Global Positioning System

# text
seg-1df73b95ae4d = IAU

# text
seg-0461e1933d23 = Internationale Astronomische Union

# text
seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

# text
seg-a54e0f483ad5 = Interface Control Document; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame

# text
seg-aa7091bb80e6 = IMO

# text
seg-6a7c8caf2a55 = Internationale Seeschifffahrts-Organisation

# text
seg-dbcf65546abf = INS, MEMS

# text
seg-b767f348dab9 = Trägheitsnavigationssystem; mikroelektromechanisches System

# text
seg-1be5a43002db = IOD

# text
seg-7eb2ca980e20 = In-Orbit-Demonstration

# text
seg-92cd0058a058 = IQ

# text
seg-c7fa50165400 = Gleichphasen- und Quadraturkomponente

# text
seg-41471e51e661 = die Schnittstellenspezifikation des Global Positioning System

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Internationale Raumstation

# text
seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

# text
seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; Pseudo-Earth-Fixed; True Equator, Mean Equinox (Bezugssysteme)

# text
seg-8f1cbbae84aa = ITU, ITU-R

# text
seg-d1b7680b4762 = Internationale Fernmeldeunion; ihr Radiocommunication Sector

# text
seg-a524e4c4a670 = Störer-zu-Signal-Verhältnis (jammer-to-signal)

# text
seg-5d93361e20d4 = J2 bis J6, J2000

# text
seg-50255586b303 = zonale Harmonische des Schwerefelds; die Epoche 2000-01-01 { "12" }:{ "00" }

# text
seg-368f7969b33a = JPL

# text
seg-44db8a7ae8f7 = Jet Propulsion Laboratory

# text
seg-e0e589aaa8fe = LEO, MEO

# text
seg-f4b580b88664 = niedrige Erdumlaufbahn; mittlere Erdumlaufbahn

# text
seg-aad5b54bfffd = MBSE

# text
seg-800a5f6b96ad = modellbasiertes Systems Engineering

# text
seg-535ba4896ba4 = NEES

# text
seg-a230ecd2fe39 = normiertes quadratisches Schätzfehlermaß (normalised estimation error squared)

# text
seg-56d5135d987d = das Ionosphärenmodell von Galileo

# text
seg-408af08fe37b = OEM, SP3, TLE

# text
seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (präzise Bahnen); Two-Line-Element-Satz

# text
seg-ac4878697ee5 = PNT, PPP

# text
seg-c19b5f77acc5 = Positionierung, Navigation und Zeitgebung; Precise Point Positioning

# text
seg-dd94b086ed4b = PSD, SSC

# text
seg-6e937d7e984e = spektrale Leistungsdichte; spektraler Trennungskoeffizient

# text
seg-e0421c657cc1 = RAIM, SQM

# text
seg-d6fee8d2ce49 = Receiver Autonomous Integrity Monitoring; Signalqualitätsüberwachung

# text
seg-dc53bead2cf5 = RINEX, RTCM

# text
seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

# text
seg-dcd6afa24ea6 = RMS

# text
seg-0b4fc648e96c = quadratischer Mittelwert (root mean square)

# text
seg-e1c3c49833fc = eine quelloffene GNSS-Positionierungsbibliothek, hier als unabhängige Referenz verwendet

# text
seg-9ead536db4aa = Simplified General Perturbations { "4" } (das Bahnmodell der Two-Line-Element-Sätze)

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 Bit

# text
seg-8c718f7f9f5d = SigMF

# text
seg-7830c93a5803 = Signal Metadata Format

# text
seg-d282e836d47b = SISRE

# text
seg-3c48d3ad7b43 = Entfernungsfehler im Signal im Raum (signal-in-space range error)

# text
seg-f045a03a5598 = SPS PS

# text
seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

# text
seg-758b51d8d5b6 = SRTM

# text
seg-7e45c32b04e4 = Shuttle Radar Topography Mission

# text
seg-8104773e1484 = STK

# text
# c1: .e
seg-f4fca0494aae = Systems Tool Kit (sein Ephemeridendateiformat <c1/>)

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-1043491566b5 = SVID

# text
seg-d67f9665f054 = Kennung des Raumfahrzeugs (space vehicle identifier)

# text
seg-de4e841ce8a2 = die Gesamtzahl der Satelliten, Bahnebenen und die Phasierung einer Walker-Konstellation

# text
seg-4d6ebfefc096 = TEC

# text
seg-5149401781dd = Gesamtelektronengehalt

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = Ultrahochfrequenz

# text
seg-3cd6018f5b78 = UTC

# text
seg-4d7d6ff2e8a5 = Koordinierte Weltzeit

# text
seg-41b9b462d434 = WGS { "84" }

# text
seg-ec04054b9f8e = World Geodetic System { "1984" }

# text
seg-613b7c13cd32 = X1, X5

# text
seg-349e041a5a90 = Signalnamen des Systems Xona Pulsar

# text
seg-d6a3f210958a = Eine geänderte veröffentlichte Zahl ist eine Revision und wird festgehalten, nie stillschweigend korrigiert. Dieses Release enthält eine Revision der Engine-Ausgabe und mehrere von Zahlen, die in der Dokumentation gedruckt waren.

# text
seg-1669eb4224f1 = Engine-Ausgabe

# text
seg-185961ebab61 = Die Reduktion TEME→GCRS drehte um { "2" }·Δψ: Die Nutationsmatrix hatte das Vorzeichen von Δψ vertauscht.

# text
# c1: nutation::numat
# c2: Rx(−(ε̄+Δε))·Rz(Δψ)·Rx(ε̄)
# c3: iauNumat
# c4: Rx(−(ε̄+Δε))·Rz(−Δψ)·Rx(ε̄)
# c5: nutation_matrix
# c6: nutation_matrix_2000a
# c7: teme_to_gcrs
# c8: gcrs_to_teme
# c9: numat
# c10: tests/frame_reference_vectors.rs::teme_to_gcrs_matches_vallado_gcrf
# c11: nutation::tests::nutation_matrix_matches_erfa_numat
# c12: src/cio.rs
# c13: ephemeris
# c14: gcrs_r_m
# c15: gcrs_v_m_s
# c16: Propagator::position_in_frame
# c17: state_gcrs
# c18: orbit-sgp4-gps
# c19: sgp4
seg-504b78f30c54 = <c1/> baute <c2/>, wo <c3/> von SOFA <c4/> baut, sodass <c5/>, <c6/>, <c7/> und <c8/> um das Doppelte der Nutation in Länge drehten, etwa { "25" } Bogensekunden. Jede Prüfung der Kette war ein Eigenschaftstest (echte Rotation, Hin-und-zurück, ein von null verschiedener Nutationsbeitrag), den ein Vorzeichenfehler besteht; der Ende-zu-Ende-Test nach Vallado deckte TEME→PEF, TEME→ITRF und GCRS→ITRS ab, aber nicht TEME→GCRS. Im Vallado-Beispiel (AIAA 2006-6753, 2004-04-06) verfehlte die Kette das veröffentlichte GCRF um { "1 145" } m; nun liegt sie { "0.11" } m davon entfernt, und die Matrix gleicht <c9/> von ERFA auf { "1e-14" }. <c10/> und <c11/> schlagen beide mit dem alten Vorzeichen fehl. Der Konsistenztest des CIO (Celestial Intermediate Origin) in <c12/> hatte die daraus folgende Abweichung von ~{ "130" } m auf „≈ { "2" }·EE“ zurückgeführt; das Residuum beträgt nun { "5" } cm, und seine Schranke ist von { "250" } m auf { "1" } m verschärft. <b>Dies verändert veröffentlichte Zahlen und wird hier als Revision festgehalten:</b> die Spalten <c14/> und <c15/> der Art <c13/> (etwa { "0.8" }–{ "1.0" } km für das mitgelieferte Szenario der ISS (Internationale Raumstation); ihre Spalten für TEME, erdfest, Bodenspur, Blickwinkel und Doppler ändern sich nicht) sowie <c16/> / <c17/> für die Bezugssysteme GCRS und ITRS. Keine Zusammenfassungszeile, kein Diagramm und kein Golden-Hash eines mitgelieferten Szenarios liest diese Spalten. Die neuen Interoperabilitäts-Exporte verwenden die korrigierte Kette: Die CZML-Position des ersten Satelliten von <c18/> stimmt mit einer ERFA-Reduktion desselben TLE (propagiert vom Python-Paket <c19/>) auf { "2.3" } cm überein.

# text
# c1: leo-navmsg
# c2: leo-navmsg
# c3: navmsg
# c4: leo-pnt-chain
# c5: docs/LEO-NAVMSG.md
# c6: 0x110315
# c7: 0x19105F
# c8: leo-navmsg-fit-interval-trade
seg-a0a4026d22ed = <b>Die Art <c1/>, nativ und im Browser-Build.</b> Die Art berechnet nun jede transzendente Funktion über eine portable Mathematikbibliothek, sodass ihr Frame auf jeder Plattform und in jedem Build dieselben Bytes hat (unter Fixed). Jede Zahl von <c2/> ändert sich damit, ebenso die Stufe <c3/> von <c4/>. Die Art ist neu in diesem Release, sodass sich nichts aus einem früheren Release ändert, wohl aber Zahlen, die vor der Korrektur gedruckt wurden: Der Prüfwert von <c5/> für das Encode-und-Decode-Szenario war <c6/> und ist <c7/>, und der SISRE der dekodierten Nachricht beträgt { "0.129" } cm. Auf kshana.dev zeigte die Missions-Karte für <c8/> einen größten Entfernungsfehler von { "1.6" } mm mit einem Fit von { "60" } s und { "40.3" } mm mit einem Fit von { "900" } s; die Website wird nun aus der Engine dieses Releases gebaut und zeigt { "1.8" } mm und { "46.6" } mm.

# text
# c1: maritime-strait-jamming
seg-77f441bfc3c3 = <b>Die Jamming-Footprint-Karte auf kshana.dev (Missions).</b> Jede ihrer { "875" } Zellen ist ein Lauf von <c1/>, bei dem sich nur die Position des Empfängers ändert. Die Zellen werden nun aus denselben dreistelligen Dezimalkoordinaten berechnet, die der Link „open this run“ der Zelle Kshana Studio übergibt, sodass eine Zelle genau das zeigt, was ihr Link reproduziert. Das mittlere Störer-zu-Signal-Verhältnis (J/S) von { "30" } Zellen ändert sich um { "0.1" } dB, nach oben oder unten; die Tracking-Verfügbarkeit keiner Zelle ändert sich. Die Engine liefert für jede Zelle in { "0.28.0" } und { "0.29.0" } identische Ergebnisse.

# text
# c1: quantum-anomaly-detect
# c2: [0.9901265, 0.9938305]
# c3: [0.99035875, 0.993861]
seg-146588a39e7c = <b>Resampling mit festem Seed im WebAssembly-Paket (WASM).</b> Der Browser-Build zog aus demselben Seed andere Bootstrap- und Shuffle-Indizes als der native Build (unter Fixed). Das Intervall von <c1/> für die Fläche unter der Kurve lautete im Browser <c2/> und ist nun das native <c3/>. Keine native Zahl ändert sich.

# text
seg-017810049453 = In der Dokumentation gedruckte Zahlen

# text
seg-85ab2a364a37 = Die Dokumentation wurde Wort für Wort gegen Läufe der Engine dieses Releases geprüft. Wo eine gedruckte Zahl nicht zum Lauf passte, wurde das Dokument korrigiert, und jede Korrektur ist hier aufgeführt, alt → neu. In jedem der folgenden Fälle hat sich die Engine-Ausgabe nicht geändert; das Dokument hatte sie falsch gelesen, falsch gerundet oder war von ihr überholt worden.

# text
# c1: docs/SOLAR-SYSTEM.md
# c2: docs/CONSTELLATION-DESIGN.md
# c3: leo-pnt-mega-shell
seg-1eacdefbfda2 = <b>Dokumentationsaudit der Seiten zu Spektrum, Konstellation, Kampagne, Animation, Bericht und Interoperabilität sowie ein neues <c1/>.</b> Jede Zahl wurde mit dieser Engine neu ausgeführt. Zwei veröffentlichte Zahlen ändern sich: <c2/> nannte den Abdeckungstest mit { "5" } 000 Satelliten „etwa { "0.13" } s in einem Debug-Build“; das ließ sich nicht reproduzieren ({ "1.24" } s auf einem ausgelasteten Laptop), sodass die Seite nun den Anteil des Vorfilters angibt, den der Test ausgibt ({ "9.9" } % von { "19 440 000" } Paartests), und die { "0.14" } s des Release-Binarys für das mitgelieferte <c3/>. Dieselbe Seite nannte die Kreuzung von E3F „um { "0.050" } Grad daneben“; kein Test gibt diese Zahl aus, sodass die Seite nun nur den Zielwert von { "0.06" } Grad nennt, den der Test erzwingt, und die Herleitung { "7.30" } gegenüber { "7.36" } Grad dahinter. Keine Engine-Ausgabe ändert sich.

# text
seg-2ad182e2db15 = LEO-PNT-Dokumente: korrigierte veröffentlichte Zahlen (auf der Engine dieses Releases neu ausgeführt).

# text
# c1: docs/LEO-SIGNAL.md
# c2: generic-s
# c3: generic-c-wide
# c4: docs/LEO-NAVMSG.md
# c5: docs/LEO-PASS.md
seg-6c2401365dd5 = <c1/>, Bandvergleich: Die ionosphärische Verzögerung erster Ordnung von <c2/> beträgt { "3.24" } m (gedruckt war { "3.25" } m) und die von <c3/> { "0.77" } m (war { "0.78" } m). <c4/>, Kodieren und Dekodieren: Der SISRE der dekodierten Nachricht war mit { "0.119" } cm gedruckt, wo der Lauf { "0.122" } cm lieferte; die Seite druckt nun { "0.129" } cm, die Zahl nach der Korrektur der Plattformunabhängigkeit unter Fixed weiter unten. <c5/>, LEO-gegen-GNSS-Überflug: { "32" } dB weniger Freiraumdämpfung am Höhepunkt des Überflugs (war „{ "26" } bis { "32" } dB“). Bei den Signal- und Überflugzahlen hat sich die Engine-Ausgabe nicht geändert; die Dokumente hatten sie falsch gelesen oder falsch gerundet.

# text
# c1: /kshana-run
# c2: <scenario>.table.csv
# c3: leo-navmsg
# c4: telecom-timing
# c5: docs/tutorials/README.md
# c6: commands/kshana-run.md
# c7: oem-interop
# c8: docs/examples/multi-tool-pipeline.md
seg-fc3c8ba1b789 = <b>Tutorials, das durchgearbeitete Pipeline-Beispiel und der Befehl <c1/>, gegen die Engine dieses Releases geprüft.</b> Korrekturen an veröffentlichten Zahlen, alt → neu: Die Arten, die <c2/> schreiben, sind sechs, nicht vier (<c3/> und <c4/> fehlten; <c5/>, <c6/>); die Kreuzung ½bT² des Kaltatom-Sensors in Tutorial { "3" } liegt bei { "18,443" } s, nicht bei { "18,440" } s; der Hin-und-zurück-Fehler von <c7/> in <c8/> beträgt gemessene { "4.88e-7" } km, nicht „~{ "1e-7" } km“; das Holdover-Band der CSAC in Tutorial { "2" } ist das von { "2000" }–{ "3200" } s, das der Test festlegt, nicht „~{ "2600" }–{ "4400" } s“; Tutorial { "1" } zitiert die SP3-Zeilen und den Geometrieblock in der Genauigkeit, in der die Engine sie schreibt. Keine Engine-Ausgabe hat sich geändert.

# text
seg-4c613cabb87b = Seiten zu Validierung, Quanten, SGP4, Animation, Aussagen und Integrität.

# text
# c1: docs/VALIDATION.md
# c2: orbit-gnss-challenged
# c3: docs/QUANTUM.md
# c4: docs/SGP4-VALIDATION.md
# c5: docs/ANIMATION.md
# c6: docs/CLAIMS-VS-REALITY.md
# c7: docs/INTEGRITY.md
seg-c49d5cdb36e1 = <c1/>: Die erzwungene Schranke für die simulierte Allan-Abweichung bei einer Sekunde einer Uhr mit weißem Frequenzrauschen beträgt { "20" } % (gedruckt war { "25" } %; die Schranke von { "25" } % ist die auf der Kurve bei { "1" }, { "10" } und { "100" } s); die Zeile zum Geschwindigkeits-Random-Walk nennt nun ihre erzwungene Schranke von { "20" } % neben den beobachteten etwa { "12" } %; und die Verfügbarkeit der Chip-Scale-Atomuhr in <c2/> beträgt etwa { "0.73" } (gedruckt war etwa { "0.83" }). <c3/>: Das schwingungsbegrenzte Rauschen pro Messung im durchgerechneten Kaltatom-Beispiel der Seite beträgt etwa das { "46" }-Fache seiner Schrotrauschgrenze (war „~{ "45" }×“; neu berechnet { "46.49" }), und der Bereich „{ "1" }–{ "50" } µg/√Hz“ für im Feld eingesetzte Geräte, der einem von der Seite selbst zitierten Gerät widersprach, ist durch die veröffentlichten Zahlen der beiden zitierten Geräte ersetzt. <c4/>: Die größte Positionsdifferenz beträgt { "4.12" } mm (war „≈ { "4" } mm“), mit Nennung des Satelliten. <c5/>: Das Beispiel mit dem Video-Encoder las die Frames mit { "24" } Bildern pro Sekunde mit { "12" }; es verwendet nun { "24" }, die Rate, die das Frame-Manifest nennt. <c6/>: Das Jamming-Modell hat { "10" } Tests (waren { "8" }), und die Angabe „{ "2.97" } m gegenüber { "48.8" } m“ des gekoppelten Filters ist durch das ersetzt, was sein Test festlegt (der Positionsfehler des gekoppelten Filters unter dem { "0.6" }-Fachen des entkoppelten, bei mindestens { "90" } von { "100" } Versuchen gewinnend). <c7/>: Der Stempel „Today“ lautete { "v0.22.0" }; er nennt nun dieses Release, und zwei seither gebaute Fähigkeiten (der konstellationsweite Fehlermodus und die Integritäts-Unterstützungsnachricht) verlassen seine Lückenliste.

# text
# c1: spectrum
# c2: src/spectrum.rs
# c3: src/sigmf.rs
# c4: docs/SPECTRUM.md
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: [recording]
# c9: scenarios/l-band-waterfall-jamming.toml
seg-4fde8788f95f = <b>Szenarioart <c1/>: ein Spektrummodell und Wasserfall für das L-Band</b> (<c2/>, <c3/>, <c4/>). Das gesamte GNSS-L-Band als eine spektrale Leistungsdichte (PSD): GPS L1 Coarse/Acquisition (C/A) und L2 Civil (L2C) (BPSK({ "1" })), Galileo E1 (Multiplexed Binary Offset Carrier, MBOC(6,1,1/11), oder BOC({ "1,1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), ein kT-Rauschteppich mit einer Rauschzahl des Empfängers sowie Dauerstrich-Jammer (CW), Schmalband-, Chirp- und Matched-Noise-Jammer auf einer skriptgesteuerten Zeitachse. Jeder Jammer wird pro Band über seinen spektralen Trennungskoeffizienten (SSC) bewertet, woraus sich das Störer-zu-Signal-Verhältnis (J/S) und die effektive Träger-zu-Rauschleistungsdichte (C/N0) pro Band und Zeile ergeben. Das Diagramm ist ein SVG-Wasserfall mit C/N0-Balken; result.json enthält das Gitter, in der Leistung blockweise gemittelt. Optionales <c5/> zeichnet das Modell als IQ-Samples, schreibt und liest eine Aufnahme im Signal Metadata Format (SigMF) (<c6/>, <c7/>) und vergleicht eine Welch-Schätzung mit dem Modell; optionales <c8/> schätzt eine echte SigMF-Datei. Mitgeliefertes Beispiel <c9/>: Ein Chirp nimmt L1 C/A und E1 bei { "10" } s, ein CW-Ton auf dem L1-Träger hält C/A nach dem Ende des Chirps bei { "17.98" } dB-Hz, während sich E1, dessen Spektrum dort eine Nullstelle hat, erholt; L5 und E5a bleiben unberührt.

# text
# c1: navsignal
# c2: spectral_separation_coeff_offset
seg-5c5c695e7c0a = <c1/>: eine MBOC-Variante und <c2/>.

# text
seg-673dfe048dad = <b>Sonnensystem-Ephemeride und Positionierung um jeden Körper.</b> Zwei neue Szenarioarten.

# text
# c1: solar-system
# c2: scenarios/solar-system-tour.toml
seg-3e1b0e8e99e9 = <c1/>: die Sonne, die acht Planeten, Pluto, der Mond, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan zu einer Epoche: heliozentrische Position und Geschwindigkeit im International Celestial Reference Frame (ICRF), Gravitationsparameter, Radien, J2 (die zweite zonale Harmonische), wo veröffentlicht, siderische Rotation, der Pol und der Nullmeridian der Internationalen Astronomischen Union (IAU), eine Bahnspur über einen Umlauf sowie die Lichtlaufzeit, die Ein- und Zweiweg-Entfernung, die solare Shapiro-Verzögerung und der Sonnenabstand von einem Beobachterkörper aus und für jede zusätzliche Verbindung. Die Planeten stammen aus den Keplerschen Elementen des Jet Propulsion Laboratory (JPL) von Standish und Williams (Tabelle { "1" }, { "1800" } n. Chr. bis { "2050" } n. Chr.; Tabellen 2a/2b, { "3000" } v. Chr. bis { "3000" } n. Chr.); die Monde aus mittleren JPL-Elementen mit der synchronen Rotationsrate der IAU, und Titan aus dem Rotationsmodell der IAU. Beispiel: <c2/>.

# text
# c1: body-pnt
# c2: scenarios/mars-orbit-pnt.toml
# c3: scenarios/europa-surface-pnt.toml
seg-6a094973208b = <c1/>: ein Orbiter oder eine Oberflächenlandeeinheit um einen dieser Körper, die mit Pseudoentfernungen aus einer Walker-Konstellation um den Körper und einer uhrenfreien Zweiweg-Entfernung von der Erde navigieren; Dilution of Precision, formale Unsicherheit und Least-Squares-Lösungen mit festem Seed mit und ohne die Erdverbindung. Beispiele: <c2/>, <c3/>.

# text
# c1: Body
# c2: AnalyticSolarSystem
# c3: EphemerisProvider
seg-ed5063379a8b = <c1/> erhält Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto und die sieben Monde, eine Namenssuche und einen physikalischen Datensatz; <c2/> liefert jeden Körper relativ zu jedem anderen über die bestehende Schnittstelle <c3/>.

# text
# c1: src/ephem.rs
seg-a3c83f6d2078 = Befund: Die Mondreihe von Montenbruck & Gill in <c1/> ist durch ihren eigenen Präzessionsterm bereits auf das Äquinoktium J2000 bezogen ({ "0.05" } Grad von Horizons), sodass sie ohne weitere Präzessionsrotation verwendet wird. Sechs neue Matrixzeilen: zwei validated (Planetenpositionen, Lichtlaufzeit) und vier modelled.

# text
seg-564133d6a0c4 = Konstellationen um jeden Körper

# text
# c1: constellation-design
# c2: src/constellation.rs
# c3: solar-system
seg-d1ddb76d8bf3 = <b>Konstellationsentwurf im großen Maßstab (Art <c1/>, <c2/>).</b> Walker-Delta- und Walker-Star-Muster (T/P/F), explizite Elementlisten und Mehrschalen-Entwürfe, mehrere Konstellationen pro Lauf, um die Erde, den Mond, den Mars oder einen anderen Planeten, Pluto oder einen großen Mond aus den Körperkonstanten, die die Art <c3/> hinzugefügt hat. Voreinstellungen aus veröffentlichten Nennelementen: die GPS-Basiskonstellation (Global Positioning System) und die erweiterbare 24-Slot-Konstellation (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, Ausgabe { "1.1" }), BeiDou in der mittleren Erdumlaufbahn Walker 24/3/1 plus geostationäre und geneigte geosynchrone Satelliten (Open Service Performance Standard { "3.0" }) und GLONASS 24/3/1 (Interface Control Document { "5.1" }). Abdeckung und Dilution of Precision (DOP) über einem Breiten-/Längengitter: sichtbare Satelliten, GDOP, PDOP, HDOP und VDOP (geometrisch, Position, horizontal, vertikal) und Verfügbarkeit pro Zelle, global und am ungünstigsten Standort, mit einer Empfängeruhr pro Konstellation. Ein Sichtbarkeits-Vorfilter (Abdeckungs-Halbwinkel plus ein Breitenband des Subsatellitenpunkts, auf einem kugelförmigen Körper exakt) verarbeitet { "5 000" } Satelliten auf einem { "10" }-Grad-Gitter in einem Debug-Build in etwa { "0.13" } s.

# text
seg-8f4ebd177f3d = VALIDATED: Der Walker-Generator reproduziert Tabelle { "23" } des Galileo OS SDD und die Slot-Formel des GLONASS ICD; die GPS-Voreinstellung reproduziert die Spalte der Äquatorkreuzungen des SPS PS ({ "35" } von { "36" } Orten innerhalb von { "0.0108" } Grad; E3F innerhalb von { "0.06" } Grad, wobei die Tabellenzeile selbst inkonsistent ist); die globale HDOP-Verteilung der GPS-Basiskonstellation entspricht dem SPS PS, Anhang B (Median { "0.940" } gegenüber { "0.94" }, { "95" } % { "1.255" } gegenüber { "1.25" }, Mittelwert { "0.965" } gegenüber { "0.96" }; Zielwert { "0.03" }).

# text
seg-65658a896a73 = MODELLED: beliebige Entwürfe, andere Körper, die Phasen- und geneigten geosynchronen Knoten von BeiDou, Zweikörperbahnen mit optionalem J2, nur Geometrie.

# text
# c1: constellation-multi-gnss-coverage
# c2: leo-pnt-mega-shell
# c3: lunar-relay-constellation
# c4: kshana example
# c5: docs/CONSTELLATION-DESIGN.md
seg-3dfe470e8a5c = Szenarien: <c1/> ({ "102" } Satelliten, Verfügbarkeit { "100" } %, mittlerer PDOP { "0.95" }, { "31.0" } sichtbar über { "10" } Grad), <c2/> ({ "5 000" } Satelliten, Verfügbarkeit { "99.22" } % bei PDOP { "3" } oder weniger über { "20" } Grad, { "0" } % an den Polkappen, der Vorfilter behält { "11.5" } % der Paartests), <c3/> ({ "14" } Satelliten um den Mond, Verfügbarkeit { "21.33" } % insgesamt und am höchsten über der Südpolregion). Alle drei sind für <c4/> mitgeliefert. Hinweise: <c5/>. Drei neue Matrixzeilen: zwei validated (Walker-Generator und GNSS-Voreinstellungen, globaler GPS-DOP) und eine modelled.

# text
seg-79e2d2c42166 = Eine vom Spektrummodell gesteuerte Kampagne und Konstellationen um jeden Körper.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: tests/campaign_composition_reference.rs
# c4: constellation-design
# c5: Body::by_name
# c6: solar-system
seg-4ab5f6f6bbbb = <c1/> verkettet die Art <c2/> mit einem Uhren-Holdover und einem Integritätsmonitor (ein Chirp nimmt L1 C/A und E1; ein CW-Ton hält danach C/A unten, während sich E1 erholt und der Empfänger auf einen reinen Galileo-Himmel zurückfällt), festgehalten gegen das eigenständige Wasserfallbeispiel in <c3/>. <c4/> löst seinen Zentralkörper nun über <c5/> auf, sodass eine Konstellation um jeden Planeten, Pluto oder großen Mond gelegt werden kann, mit den Konstanten, die die Art <c6/> verwendet.

# text
# c1: campaign
# c2: src/campaign.rs
# c3: docs/CAMPAIGNS.md
seg-dc904f639fed = <b>Kampagnen: viele Szenarien zu einem Lauf zusammengesetzt.</b> Eine neue Art <c1/> (<c2/>, dokumentiert in <c3/>) führt Mitglieder bestehender Arten über dieselbe Verteilung wie die Kommandozeile aus und liest Zahlen aus ihren Ergebnissen zurück. Vier Abschnitte, in beliebiger Kombination:

# text
# c1: [[phases]]
# c2: carry
# c3: handoff
# c4: end_at
seg-903ee141047a = <c1/>: eine verkettete Mission auf einer Zeitachse. Voreinstellungen pro Art lesen den Uhrzeitfehler gegen seine Schutzgrenze, das mittlere effektive Träger-zu-Rauschleistungsdichte-Verhältnis (C/N0) gegen die Tracking-Untergrenze, das vertikale Schutzniveau gegen die Alarmgrenze, den Positionsfehler, die trackenden Satelliten und die Alarmflags, festgehalten auf einem gemeinsamen Gitter mit Phasengrenzen und Ereignissen. Der Zustand wird durch <c2/>, <c3/> und <c4/> weitergereicht.

# text
# c1: [sweep]
seg-4eeedde09a77 = <c1/>: ein bis drei Punktschlüssel einer beliebigen Art, optional mit einem Ensemble mit festem Seed an jedem Knoten.

# text
# c1: [monte_carlo]
seg-4c113198cbb7 = <c1/>: Realisierung k mit Basis-Seed + k, mit Mittelwert, Streuung, Perzentilen und einem Bootstrap-Konfidenzintervall von { "95" }% mit festem Seed.

# text
# c1: [compose]
# c2: campaign-jam-spoof-holdover-integrity
# c3: campaign-sweep-jammer-power
# c4: campaign-shared-jammer-sea-road
# c5: campaign-monte-carlo-clock-holdover
# c6: tests/campaign_composition_reference.rs
seg-df107253752d = <c1/>: gemeinsame Werte, die an mehrere Mitglieder gebunden sind, mit einer kombinierten Zusammenfassung von bestem und schlechtestem Fall. Jedes Ergebnis trägt einen Kampagnen-Hash und einen Digest über jedes Mitgliedsergebnis. Vier mitgelieferte Szenarien: <c2/> (nominal, Jamming, Spoofing, das bei der Detektion des Uhrenmonitors nach { "370" } s endet, Holdover, der den gespooften Offset von { "37.0" } ns trägt, mit auslaufender Inertialeinheit, ein Integritätsalarm, Erholung), <c3/>, <c4/> und <c5/>. <c6/> hält die Kompositionsidentitäten fest: Eine Kampagne mit einer Phase reproduziert den eigenständigen Lauf bei drei Arten bitgenau, ein Ensemble mit festem Seed ist byte-stabil, und bei einer Uhr mit weißem Frequenzrauschen liegt der Ensemble-Mittelwert innerhalb des gemeldeten Intervalls, mit der Streuung innerhalb des Chi-Quadrat-Intervalls von sqrt(q_wf * tau) = { "16.459" } ns. Drei neue modelled-Matrixzeilen.

# text
seg-c611ee59301a = Animation

# text
# c1: --animate svg|html|frames|all
# c2: src/animation.rs
# c3: docs/ANIMATION.md
# c4: manifest.json
# c5: prefers-color-scheme
# c6: prefers-reduced-motion
# c7: --animate-fps
# c8: --animate-duration
# c9: kshana::api::animate_toml
# c10: kshana::animation::animate_result
# c11: result.json
# c12: animation
# c13: --animate
# c14: tests/animation.rs
seg-14b2d3cc9e7c = <b>Animationsexport (<c1/>, <c2/>, <a1><c3/></a1>).</b> Jeder Lauf, dessen Ergebnis eine Zeitreihe enthält, kann nun als animierte SVG-Datei (Scalable Vector Graphics) geschrieben werden (CSS-Keyframes (Cascading Style Sheets), kein Skript: Die Kurven zeichnen sich hinter einem wandernden Zeitcursor ein), als einzelner, in sich geschlossener HTML-Player (HyperText Markup Language) (Wiedergabe und Pause, Scrubbing, Geschwindigkeit, jedes Panel an einem synchronisierten Cursor, Ereignismarken, die beim Klick springen; keine externe Ressource) oder als nummerierte SVG-Frame-Folge mit einer <c4/>, die Bilder pro Sekunde, Dauer und Frame-Zeiten für einen Video-Encoder nennt. Eine Kampagne wird als ihre Phasen abgespielt, mit markierten Alarmen; ein Spektrumlauf animiert seinen Wasserfall Zeile für Zeile. Der Player folgt <c5/>, und unter <c6/> zeigen sowohl die SVG als auch der Player das fertige Bild, statt sich zu bewegen. <c7/> und <c8/> legen die Wiedergabe fest; <c9/> und <c10/> sind die Einstiegspunkte der Bibliothek, und <c11/> erhält nur dann einen Block <c12/>, wenn <c13/> läuft. Die Ausgabe ist eine reine Funktion von Ergebnis und Optionen, bei einem erneuten Lauf byte-identisch, ohne Zeitstempel. Eine Art ohne abgetastete Zeitachse wird mit „no time series to animate“ abgelehnt, und es wird nichts geschrieben. Der Exporter zeichnet die eigenen Samples des Laufs und fügt keine Zahl hinzu, ist also MODELLED (interne Konsistenz) und trägt keine Zeile der Verifikationsmatrix; keine veröffentlichte Zahl ändert sich. Tests: <c14/> (Determinismus, Frame-Anzahl, keine externe Adresse, wohlgeformtes XML, der Pfad für reduzierte Bewegung und jedes mitgelieferte Szenario mit Zeitreihe, das animiert).

# text
seg-c01b78b64065 = Berichte

# text
# c1: src/advanced_report.rs
# c2: <scenario>.report.html
# c3: <scenario>.report.json
# c4: units
# c5: sweep
# c6: sweep-nd
# c7: orbit
# c8: slot-timing
# c9: KSHANA_GIT_COMMIT
# c10: --study-name
# c11: --report pdf
# c12: tests/advanced_report.rs
# c13: tests/advanced_report_cli.rs
# c14: result.json
seg-2662fdb991f3 = <b>Erweiterte Laufberichte (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Jeder Lauf der Kommandozeilenschnittstelle (CLI) schreibt nun <c2/>, einen druckbaren HTML-Bericht (HyperText Markup Language), und <c3/>, denselben Inhalt als maschinenlesbares JSON-Dokument (JavaScript Object Notation). Abschnitte: eine Kurzfassung; jede Szenarioeingabe mit ihrer Einheit, gelesen aus dem Schema der Feldeinheiten (der Block <c4/> des Ergebnisses), sonst aus dem Suffix des Feldnamens, sonst als nicht angegeben ausgewiesen; die Ergebnisse mit dem Diagramm des Laufs, jedem Skalar und einer Zusammenfassung jeder numerischen Spalte; bei einer Kampagne die Knotentabelle des Sweeps, der Monte-Carlo-Mittelwert, die Standardabweichung, das 5.-/50.-/95.-Perzentil und das Bootstrap-Konfidenzintervall mit einem Histogramm pro Metrik, die Phasentabelle der Kette oder die Mitglieder der Komposition und ihre kombinierte Zusammenfassung (und das Gitter eines Laufs von <c5/> oder <c6/>); eine Ereigniszeitleiste; die Kennzeichnung VALIDATED / MODELLED / PARTNER, die unabhängige Referenz und der Testnachweis jeder Zeile der Verifikationsmatrix, die die Arten des Laufs berühren, gelesen aus der Matrix über eine Zuordnung von Art zu Zeile (eine Zeile, die einen Eingabepfad bewertet, etwa den Pfad Simplified General Perturbations { "4" } (SGP4) von <c7/> oder den Pfad des gemessenen Datensatzes von <c8/>, wird nur aufgeführt, wenn der Lauf diesen Pfad genommen hat, und die Zeile des Shuttle-Radar-Topography-Mission-Lesers (SRTM) wird für keine Art aufgeführt, da kein Szenariofeld eine SRTM-Kachel liest); die Aussagen zu Nicht-Modelliertem und die Annahmen, jeweils mit ihrer Quelle zitiert; und ein Reproduzierbarkeitsprotokoll (Engine-Version, der Quell-Commit, wenn der Build <c9/> setzt, Digests im Secure Hash Algorithm 256-bit (SHA-256) der Szenariodatei und des Ergebnisdokuments, Seed, Plattform und der genaue Befehl). Der Bericht liest keine Uhr: Gleiches Szenario, gleicher Seed und gleicher Engine-Build ergeben einen byte-identischen Bericht, und der einzige Zeitstempel, den er zeigen kann, ist der, den <c10/> bereits schreibt. Ein Druck-Stylesheet passt auf A4 und US Letter, wiederholt Tabellenköpfe und hält Zeilen und Abbildungen über Seiten hinweg zusammen; eine Datei im Portable Document Format (PDF) entsteht mit „Als PDF speichern“ des Browsers. Eine Option <c11/> gibt es nicht, weil das Rendern der Diagramme in ein PDF eine neue, schwere Abhängigkeit erfordern würde. Tests: <c12/> berichtet jedes mitgelieferte Szenario (kein leerer Abschnitt, kein Platzhaltertext, Kennzeichnungen gleich der Matrix, der Szenario-Digest gleich dem der Datei, byte-identisch bei erneutem Lauf), und <c13/> führt den aufgezeichneten Befehl in einem frischen Verzeichnis erneut aus und verlangt ein byte-identisches <c14/>. Keine veröffentlichte Zahl ändert sich, und die Anzahlen der Arten, Szenariodateien und Matrixzeilen bleiben unverändert.

# text
# c1: report.json
# c2: companions
seg-ce45e75c6d67 = <b>Bericht, Animation und Exporte arbeiten zusammen.</b> Der erweiterte Bericht erhält einen Abschnitt „Animation and exports“: die animierte Zeichnung des Laufs als inaktives Bild eingebettet (oder der Grund, warum es keine gibt), Links zu den daneben geschriebenen Animations- und Exportdateien und jedes Interoperabilitätsformat mit der Angabe, ob es zutrifft, warum nicht und wie seine Spezifikation lautet; <c1/> trägt denselben Block <c2/>. Der HTML-Animationsplayer listet die daneben geschriebenen Exportdateien auf. Die Kommandozeilenschnittstelle (CLI) rendert die Exporte nun vor dem Schreiben des Berichts, sodass beide die Dateien nennen können.

# text
seg-c60dc5b92a60 = Interoperabilitäts-Exporte

# text
# c1: --export
# c2: src/interop/
seg-5bfce52c5a13 = Interoperabilitäts-Exporte und -Importe (<c1/>, <c2/>, docs/INTEROP.md).

# text
# c1: kshana <scenario.toml> --export <format>
# c2: gx:Track
# c3: .e
# c4: EphemerisTimePosVel
# c5: spectrum
# c6: src/sigmf.rs
# c7: --export all
# c8: --export list
# c9: INERTIAL
# c10: ICRF
# c11: FIXED
# c12: jamming
# c13: --import-route <file.geojson>
# c14: LineString
# c15: terrain-nav
# c16: terrain-slam
# c17: gravity-map
# c18: combined-altpnt
# c19: tests/interop_formats.rs
# c20: spectrum
# c21: PassesScenario
# c22: propagator()
# c23: epoch_calendar()
# c24: epoch
# c25: t = 0
# c26: Sgp4::epoch_jd_utc
# c27: Sp3Interpolator::jd_ut1
# c28: Propagator::own_jd_utc
seg-44e7c902490a = <c1/> schreibt die Geometrie des Szenarios als CZML (die Cesium Language), KML (Keyhole Markup Language { "2.2" }, ein Standard des Open Geospatial Consortium, mit zeitmarkierten Spuren <c2/>), GeoJSON (Request for Comments { "7946" } der Internet Engineering Task Force) und als Ephemeriden <c3/> von Ansys STK (Systems Tool Kit) (<c4/>, Meter, eine Datei pro bewegtem Objekt) sowie den synthetisierten IQ-Schnappschuss (Gleichphasen- und Quadraturkomponente) der Art <c5/> als SigMF-Paar (Signal Metadata Format) über das bestehende <c6/>. <c7/> schreibt jedes zutreffende Format und gibt aus, warum die anderen nicht zutreffen; <c8/> berichtet, ohne zu laufen. Bewegte Objekte werden im Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) und als erdfeste Länge, Breite und Höhe in WGS { "84" } (World Geodetic System { "1984" }) geschrieben (KML, GeoJSON); feste Standorte in CZML sind <c11/>. Die Art <c12/> fügt zwei Jammer-Footprints aus ihren eigenen Streckengleichungen hinzu. <c13/> schreibt ein GeoJSON <c14/> in die Spureingaben von <c15/>, <c16/>, <c17/> und <c18/>. Exporte sind byte-deterministisch und tragen keinen Zeitstempel. <c19/> validiert jeden Export gegen seine veröffentlichte Spezifikation, vergleicht exportierte Satellitenzustände auf { "1" } mm mit denen der Engine selbst und führt jedes mitgelieferte Szenario durch jedes Format, wobei jedes entweder exportiert oder angibt, warum nicht (die Tabelle in docs/INTEROP.md). Keine veröffentlichte Zahl ändert sich: Die IQ-Synthese der Art <c20/> wurde in eine gemeinsame Funktion verschoben, und ihr Ergebnisdokument ist byte-identisch, und <c21/> erhält <c22/> und <c23/>, die sein eigener Lauf verwendet. Die Anzahlen der Arten, Szenariodateien und Zeilen der Verifikationsmatrix bleiben unverändert. Ein Bahn- oder Integritätsszenario ohne <c24/> wird nach den eigenen Daten seiner Satelliten datiert: <c25/> ist die früheste Epoche eines TLE (Two-Line-Element-Satz), einer Broadcast-Ephemeride oder von SP3 (Standard Product { "3" }), und jeder solche Satellit wird zu seinem eigenen Zeitpunkt in das GCRS und in erdfeste Bezugssysteme gedreht; 2000-01-01T00:{ "00" }:00Z wird nur verwendet, wenn kein Satellit eine Epoche trägt. Die Exporte SP3 und OEM (Orbit Ephemeris Message) behalten ihre Bezeichnung 2000-01-01. Um dies zu unterstützen, wurden <c26/>, <c27/> und <c28/> hinzugefügt; nichts, was es bereits gab, liest sie.

# text
seg-12c151a800f9 = Navigation in der niedrigen Erdumlaufbahn: Signal

# text
# c1: leo-signal
# c2: spectrum
seg-9b665682695a = <b>LEO-PNT-Signalentwürfe und ein Mehrband-Spektrum.</b> Eine neue Art <c1/> und eine Art <c2/>, die über das L-Band hinausreicht: eine Art, vier Szenariodateien (drei mitgeliefert; die Datei Celeste IOD liegt nur im Repository) und vier Matrixzeilen (zwei VALIDATED, zwei MODELLED).

# text
# c1: leo-signal
# c2: data/leo-signals/
# c3: scenarios/leo-band-trade.toml
# c4: scenarios/xona-pulsar-signals.toml
# c5: scenarios/celeste-iod-classical-pilot-signals.toml
# c6: docs/LEO-SIGNAL.md
seg-b355b28bfd1b = <c1/>: parametrierte Signalentwürfe für Positionierung, Navigation und Zeitgebung (PNT) in der niedrigen Erdumlaufbahn (LEO) für jedes System (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n), BOC(m,n), MBOC oder flachen Spektren, Leistungsanteile, FDMA-Unterträger, Codelängen und Datenraten), aus einkompilierten öffentlichen Voreinstellungsdateien unter <c2/> (Xona Pulsar X1/X5, Iridium STL, ein Gelegenheitssignal von Starlink, CentiSpace, ein repräsentativer C-Band-Entwurf und repräsentative Entwürfe für UHF/L/S/C/Breit-C, jeweils mit Angabe ihrer Quell-URL) oder inline geschrieben. Pro Signal: die bandbegrenzte PSD und die Leistungsanteile im Band, die Gabor-Bandbreite, der bandbegrenzte Early-Late-Code-Tracking-Jitter gegen C/N0 und Abstand (Betz & Kolodziejski { "2009" }) und die Entfernungsmessgenauigkeit, der Akquisitionssuchraum, die Detektionswahrscheinlichkeit und die mittlere serielle und codeparallele Akquisitionszeit, der SSC in und aus GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und AltBOC mit dem C/N0-Verlust, die Toleranz gegenüber CW-, Breitband- und Matched-J/S aus dem SSC-Code der Spektrum-Art, ein Bandvergleich (ionosphärische Verzögerung, Freiraumdämpfung, Entfernungsmessung bei gleichem C/N0 und gleicher EIRP, Jammer-Toleranz) und optionale Formprüfungen gegen eine beschriebene Messung. Beispiele: <c3/>, <c4/>, <c5/> (die Bänder und die Signalkonfiguration von Celeste IOD, vorgestellt auf dem ESA-NAVISP-LEO-PNT-Workshop { "2026" }; zurückgehalten mit der Voreinstellung Celeste IOD, siehe „LEO-PNT end to end“ weiter unten). Hinweise in <c6/>.

# text
# c1: spectrum
# c2: [[panels]]
# c3: wideband
# c4: bands[].tracked_power_dbw
# c5: bands[].design
# c6: panels
# c7: not_modelled
# c8: scenarios/multi-band-jamming-waterfall.toml
seg-8f58debf721f = <c1/>: Bänder können nun eine voreingestellte Signalentwurf sein (jede Komponente gezeichnet, bandbegrenzt, C/N0 und J/S bezogen auf die getrackte Komponente) oder ein benutzerdefinierter Träger mit Modulation; <c2/> fügen Wasserfälle über andere Frequenzbereiche auf einer Zeitachse hinzu; ein Jammer <c3/> (Barrage) gesellt sich zu den vier Wellenformen. Der Bericht fügt <c4/>, <c5/> und <c6/> sowie einen Eintrag <c7/> hinzu. Einfache Bänder liefern dieselben Zahlen wie zuvor. Beispiel: <c8/>.

# text
# c1: moonlight-service-volume
# c2: n_sats
# c3: n_sats > 12
seg-17fbc566dc5b = <b>Eine veraltete Satellitenbegrenzung in <c1/>.</b> Das Szenario begrenzte <c2/> auf { "12" }, obwohl sein eigener Konstellationsgenerator { "24" } unterstützt und ein Test { "24" } prüft. Daher wurde jede angeforderte Anzahl über { "12" } stillschweigend reduziert, und ein Sweep über die Satellitenzahl lieferte oberhalb von { "12" } identische Werte, die sich nicht von echter geometrischer Sättigung unterscheiden ließen. Jetzt wird an der Grenze des Generators begrenzt. Dies ist eine Verhaltensänderung nur für <c3/>.

# text
# c1: lunar-differential-pnt
seg-4df7d4d61b40 = Dieselbe veraltete Begrenzung in <c1/>.

# text
# c1: lunar_dpnt
# c2: n_sats
# c3: dpnt_nsats_sweep.csv
# c4: n = 16
# c5: n = 12
# c6: n = 16
# c7: n_sats > 12
seg-8adfbd27c4f8 = <c1/> begrenzte <c2/> auf { "12" } mit derselben Folge, und diese erreichte eine veröffentlichte Tabelle: <c3/> enthält eine Zeile <c4/>, die byteidentisch mit der Zeile <c5/> ist, weil die Engine die Antwort für zwölf Satelliten unter einer Bezeichnung für sechzehn Satelliten lieferte. Jetzt wird an der Generatorgrenze von { "24" } begrenzt, und ein neuer Test hält dies fest: Jede größere Konstellation muss sowohl ihre eigene Anzahl melden als auch das Schutzniveau streng verbessern, sodass die Begrenzung nicht unbemerkt zurückkehren kann. <b>Dies verschiebt veröffentlichte Zahlen</b>: Das Schutzniveau für <c6/> wird von { "16.92" } m zu { "14.57" } m. Bis { "24" } durchgerechnet ist die Kurve streng monoton ({ "11.94" } m bei { "24" } Satelliten, { "29.5" } % besser als bei { "12" }), es gibt also keine Sättigung bei { "12" }: Das scheinbare Plateau war die Begrenzung. Verhaltensänderung nur für <c7/>.

# text
seg-ebee158b73c8 = Ein Release für Dokumentation, Transparenz und Playground. Keine Änderungen am Engine-Verhalten: Die Verifikationsmatrix steht bei <b>{ "102" } Zeilen: { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, unverändert gegenüber { "0.25.0" }.

# text
# c1: //!
# c2: lib.rs
seg-7af422ed6d89 = <b>Rustdoc auf Crate-Ebene</b> (<c1/> in <c2/>), die Einstiegspunkte, das Modell von Ehrlichkeit und Evidenzstufen sowie die Reproduzierbarkeit abdeckt, sodass docs.rs mit einer echten Startseite statt einer bloßen Modulwand öffnet.

# text
# c1: docs/SCENARIOS.md
# c2: 50
# c3: api::list_scenario_kinds()
# c4: gen_validation_artifacts
# c5: tests/scenarios_reference_doc_sync.rs
seg-dd44c25f3af5 = <b><c1/></b>: eine Referenz je Art für alle <c2/> Szenarioarten, von <c4/> aus <c3/> (der einzigen maßgeblichen Quelle) erzeugt und durch <c5/> abgesichert, sodass sie nicht vom Dispatcher abweichen kann.

# text
# c1: allan
# c2: estimator
# c3: fom
# c4: hybrid
# c5: inertial
# c6: models
# c7: report
# c8: run
# c9: scenario
# c10: timetransfer
# c11: types
seg-e2cc77d3b413 = <b>Moduldokumentation</b> für die { "11" } zuvor undokumentierten öffentlichen Module (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

# text
# c1: batch_ls
# c2: cr3bp
# c3: detection
# c4: attitude_budget
# c5: reentry
seg-8d156713799d = <b>Literaturquellen</b> für fünf Formelmodule, die eine Gleichung angaben, aber keine Referenz nannten: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

# text
# c1: security.txt
seg-832b4bfbc48a = <b>Eine veröffentlichte <c1/></b> auf kshana.dev für koordinierte Offenlegung.

# text
# c1: fomTier()
# c2: src/fom_label.rs
seg-30603f59e27d = <b>Validierungsstufe je Lauf im Playground.</b> Die Gütemaßtabelle eines Einzellaufs trägt jetzt je Kennzahl eine Markierung VALIDATED/MODELLED, gelesen aus derselben Abfrage <c1/>, die auch der herunterladbare Bericht verwendet (spiegelt <c2/>, selbst aus der Verifikationsmatrix abgeleitet), sodass die neben einer Live-Zahl angezeigte Stufe dem Register nie widersprechen kann.

# text
# c1: lunar-attack-surface
seg-93b203f3a1c0 = <b><c1/></b> im Playground-Menü: Alle { "50" } aufrufbaren Arten sind jetzt einen Klick entfernt (zuvor 49/50).

# text
seg-1ec0830db404 = <b>Fünf weitere lauffähige Capability-Karten</b> (Weltraumwetter, Bewertung von HF-Beeinträchtigungen, Resilienz, CCSDS-OEM-Interoperabilität, KIF), wodurch die lauffähigen Karten von { "11" } auf { "16" } steigen. Karten nur für API und Bibliothek behalten einen ehrlichen Dokumentationslink statt einer vorgetäuschten Ausführen-Schaltfläche.

# text
seg-977ea074dd9d = Die Dokumentationsabdeckung wird jetzt in der CI schrittweise hochgesetzt.

# text
# c1: check-doc-coverage.sh
# c2: missing_docs
# c3: #![warn(missing_docs)]
# c4: -D warnings
seg-beb308bcaafb = <c1/> kompiliert die Bibliothek mit <c2/>, zählt die Warnungen und schlägt nur fehl, wenn die Zahl über eine festgelegte Obergrenze ({ "986" }) steigt. Ein hartes <c3/> unter <c4/> hätte ~{ "1000" } derzeit undokumentierte öffentliche Elemente über Nacht zu einem Build-Abbruch gemacht; so lassen neue undokumentierte öffentliche Elemente den Build scheitern, während der bestehende Rückstand gezielt abgebaut wird.

# text
# c1: list_scenario_kinds
# c2: api::list_scenario_kinds()
seg-27668072a608 = <b>Die Zeile des MCP-Werkzeugs <c1/> nannte „~{ "17" } eingebaute Szenarioarten“</b>, während <c2/> seit einiger Zeit { "50" } bereitstellte: eine für Agenten gedachte Dokumentation, die die tatsächliche Fähigkeit um das Dreifache zu niedrig angab. Auf die tatsächliche Zahl festgesetzt.

# text
seg-1ffc9f9816e8 = Die unabhängige Referenz für die Schema-Übereinstimmung des CycloneDX-SBOM wurde für den aktualisierten Abhängigkeitsgraphen ({ "60" } Komponenten) neu erzeugt. Der Übereinstimmungsbefund ist unverändert: null normalisierte Schemafehler, und jede atomare Lizenzkennung steht weiterhin in der offiziellen SPDX-Aufzählung.

# text
seg-a6db590bbcbe = <b>Fünf Fähigkeiten zu extern VALIDATED hochgestuft</b>, jede jetzt gegen eine unabhängige Drittimplementierung derselben eindeutig definierten Größe gegengeprüft (nicht zirkulär, mit offline neu erzeugbaren Fixtures):

# text
# c1: allantools
# c2: tests/powerlaw_oadev_reference.rs
seg-98588143b4bb = <b>Umrechnung IEEE-1139-Potenzgesetz → Allan-Abweichung</b> gegen die geschlossenen Formen aus <c1/> für alle fünf Rauscharten (<c2/>);

# text
# c1: tests/crpa_reference.rs
seg-ce37d70fa8bc = <b>Gewichte des CRPA-MVDR-/Minimum-Norm-Nullsteuerungs-Beamformers</b> gegen numpy/scipy LAPACK (<c1/>);

# text
# c1: Rotation.align_vectors
# c2: tests/wahba_reference.rs
seg-0f033d1027f8 = <b>Lagebestimmung nach Wahba / TRIAD / QUEST</b> gegen die SVD-Funktion <c1/> von SciPy bei rauschfreien Beobachtungen (<c2/>);

# text
# c1: oem
# c2: tests/ccsds_oem_covariance_reference.rs
seg-e1e2283cb524 = <b>CCSDS-{ "502.0" }-OEM-Austausch von Kovarianzblöcken</b>, per Round-Trip durch den Parser der unabhängigen Bibliothek <c1/> geführt (<c2/>);

# text
# c1: ncx2
# c2: chi2
# c3: tests/acquisition_reference.rs
seg-579eefbb646f = der <b>Kern für die Detektionsstatistik der Square-Law-Akquisition</b> (verallgemeinertes Marcum-Q / P_d / P_fa / Schwelle) gegen SciPy <c1/>/<c2/> (<c3/>). Die maschinell geprüfte Validierungsmatrix wandert auf <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> über <b>{ "102" } Zeilen</b> (zuvor { "51" } · { "47" } · { "4" }). Die ehrlichen Einschränkungen des Geltungsbereichs bleiben erhalten, z. B. deckt die Hochstufung der Akquisition nur den Kern der Detektionsstatistik ab; CFAR/Straddling-Verlust bleibt MODELLED.

# text
# c1: fom::positioning_performance
# c2: 0.589·(σ₁+σ₂)
# c3: scipy.stats
# c4: tests/positioning_fom_reference.rs
# c5: ()
# c6: (cov_enu, hpl_m)
# c7: PositioningFom
seg-b6a140d55580 = <b>Gütemaße im Positionsbereich</b> (<c1/>): exakte CEP, SEP und 2DRMS aus der 3-D-ENU-Positionskovarianz einer Navigationslösung plus einem horizontalen Schutzniveau. CEP/SEP sind die <em>exakten</em> medianen Radialfehler (nicht die lineare Regel <c2/>), gegengeprüft gegen die Rayleigh-/Maxwell-Quantile aus <c3/> und einen unabhängigen NumPy-Monte-Carlo-Median (<c4/>). Ersetzt den bisherigen ehrlichen Stub „nicht implementiert“: <b>Die Funktionssignatur hat sich geändert</b> von <c5/>, das einen Fehler lieferte, zu <c6/>, das ein <c7/> liefert.

# text
# c1: assurance::uncertainty::edf
# c2: allantools
# c3: edf_greenhall
# c4: edf_totdev
# c5: tests/uncertainty_edf_reference.rs
seg-1551afa17154 = <b>Äquivalente Freiheitsgrade (EDF) für Konfidenzintervalle für alle Estimatoren der Allan-Familie vervollständigt</b> (<c1/>): Die EDF für modifizierte Allan-, Hadamard- und Gesamtvarianz verwenden jetzt den kombinierten EDF-Algorithmus von Greenhall & Riley und die TOTVAR-Form aus Tabelle 7 von NIST SP { "1065" } (zuvor war nur die EDF der überlappenden Allan-Varianz implementiert; die anderen verwendeten diese stillschweigend mit), gegengeprüft gegen <c2/> <c3/>/<c4/> (<c5/>).

# text
# c1: tests/validate_p*.rs
# c2: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c3: scipy.special.j1
# c4: (HᵀH)⁻¹
# c5: finals2000A
# c6: src/verification.rs
seg-39753e7919cc = <b>Unabhängige externe Gegenprüfungen für die Fähigkeiten Mond-PNT-Geometrie, DOP, EOP, DRO und HF-Entfernungsmessung</b> (<c1/>, mit Fixtures und Generatoren der unabhängigen Referenz unter <c2/>). Jede Prüfung lässt eine bereits ausgelieferte <b>modellierte</b> Fähigkeit gegen eine Referenz laufen, die von einer <em>anderen</em> Implementierung erzeugt wurde, sodass die Übereinstimmung nicht zirkulär ist: der Sende-/Erfassungs-Footprint im Orbit gegen <c3/> (Cephes, eine tatsächlich andere Bessel-J1); die DOP der Oberflächenbaken-Geometrie gegen eine unabhängige NumPy-Lösung von <c4/>; das Fehlerwachstum der UT1/EOP-Persistenzvorhersage gegen ein separates NumPy-Neueinlesen derselben wörtlichen IERS-Zeilen aus <c5/>; die Familie ebener retrograder Fernbahnen gegen die NASA/JPL Three-Body Periodic Orbit Database; und das Budget der HF-Entfernungsmessgenauigkeit gegen eine Referenz aus ersten Prinzipien. Dies sind zusätzliche Regressionsbelege für bestehende Module; das Hinzufügen dieser Gegenprüfungstests stuft für sich genommen keine Fähigkeit um (die fünf Hochstufungen oben sind separate, durch eine unabhängige Referenz gestützte Statusänderungen in <c6/>).

# text
# c1: lunar-attack-surface
# c2: src/attack_surface.rs
# c3: kind = "lunar-attack-surface"
# c4: run_toml
seg-662c04f0552f = <b>Szenario <c1/></b> (<c2/>, <c3/>): ein zusammengesetzter, binär erreichbarer (CLI / Python / MCP / wasm über <c4/>) Lauf zur P1-Signalsicherheit auf dem Mond, der das Leistungsdefizit der Link-Bilanz und sein Sensitivitätsband von { "12" }–{ "18" } dB, die erforderliche Jam-/Spoof-Sendeleistung gegenüber dem Abstand, den Erfassungs-Footprint im Orbit unter einem realen Antennendiagramm, das Ergebnis des Einrastens (Pull-in) bei Spoof-Erfassung der Tracking-Schleife, die Horizontreichweite auf einem Körper ohne Atmosphäre und das OSNMA/TESLA-Authentifizierungsbudget zusammenführt. Ein leerer Rumpf reproduziert die P1-Basislinie.

# text
# c1: linkbudget::deficit_sensitivity_band
# c2: deficit_power_factor
# c3: sweep::SweepAxis
# c4: received_signal_power_dbw
seg-a9b7ee942a23 = <b>Sensitivitätsband des Leistungsdefizits</b> (<c1/>, <c2/>): ein echter mehrachsiger Sweep (Referenz × EIRP × Schrägentfernung), aufgebaut auf <c3/> und ausgewertet über <c4/>, der das P1-Band von { "12" }–{ "18" } dB reproduziert und die linearen Faktoren { "32" }× (gerundet) / { "36" }× (ungerundet) in Einklang bringt.

# text
# c1: spoof_capture::capture_cube
# c2: capture_map
seg-0734a4ca7535 = <b>Dreidimensionaler Spoof-Erfassungswürfel</b> (<c1/>): ergänzt die Karte um die Achse des Träger-/Doppler-Versatzes (J/S × Codeversatz × Trägerversatz, Einrastzeit je Zelle); die Schicht mit Trägerversatz null reduziert sich exakt auf die 2-D-<c2/>.

# text
# c1: monitor_network
# c2: spoof_monitors
# c3: lunar_service
# c4: detection
# c5: SurfaceMonitor
# c6: SpoofEvent
seg-3b9bbc25b114 = <b>Detektion mit spärlichem Monitornetz</b> (<c1/>) setzt jetzt die physikalische AGC-Statistik aus <c2/> und das selenographische Sichtbarkeitsraster aus <c3/> zusammen, um Detektionsstatistik und Geometrie jeder Station abzuleiten, statt freier Parameter und einer ad-hoc-Überlappung auf dem Großkreis; die Detektionswahrscheinlichkeiten je Monitor und für das Netz bleiben die geschlossenen Chi-Quadrat-/Marcum-Q-Formen aus <c4/>. <b>Die Felder von <c5/> / <c6/> haben sich geändert</b> auf physikalische Größen (Breite/Länge/Höhe/Leistung).

# text
# c1: nma_budget
# c2: auth_latency
seg-54c36267382c = <b>Dimensionierung des OSNMA/TESLA-Authentifizierungsaufwands</b> (<c1/>): Die OSNMA-Feldanteile je Seite (8 Bit HKROOT + 32 Bit MACK pro Seite von { "2" } s) waren fälschlich als Summen je Subframe bezeichnet, wodurch der Aufwand um das { "15" }-Fache zu niedrig angegeben war ({ "1.33" } bit/s). Korrigiert auf die veröffentlichten Summen je Subframe von 30 s aus dem SIS-ICD (HKROOT { "120" } + MACK { "480" } Bit ⇒ <b>{ "20" } bit/s</b>). Die Folge wird nun ehrlich benannt: Bei einer AFS-Navigationsrate von { "50" } bit/s ist der Authentifizierungsaufwand ein Kostenfaktor <b>erster Ordnung von ≈{ "40" } %</b>, nicht ein vernachlässigbarer Anteil von wenigen Prozent; das Feld <c2/> ist als Verzögerung der Schlüsselfreigabe dokumentiert (eine untere Schranke der Ende-zu-Ende-Zeit bis zur ersten authentifizierten Lösung).

# text
seg-0cf179a34252 = Ein breites Capability-Release. Es bringt zwei vollständig <b>extern validierte</b> Analysesuiten: eine vollständige Familie der <b>multikriteriellen Entscheidungsanalyse (MCDA)</b> und die Estimatoren für <b>Allan-Wander / Uhrenstabilität bei langem τ</b>. Dazu öffnet es auf dem Unterbau eine neue lauffähige Szenarioschicht für <b>Mond-Zeitbudget, Echtzeit-Frame/EOP, optisch/HF-hybride Verfahren, cislunare Beobachtbarkeit und Konfliktresilienz geschichteter PNT</b>, sowie einen Unterbau für <b>Mond-Oberflächenbaken</b> und <b>Signalsicherheit</b>. Die maschinell geprüfte Validierungsmatrix wächst auf <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> über <b>{ "102" } Zeilen</b> (zuvor { "40" } · { "47" } · { "4" } über { "91" }): Alle elf neuen Zeilen sind Validierungen der Entscheidungsanalyse- und Zeitschätzer gegen eine externe unabhängige Referenz, gegen unabhängige Bibliotheken (SciPy, pymcdm, pyDecision, allantools) auf enge Toleranz geprüft, während die neue PNT-Fähigkeitsoberfläche ehrlich als MODELLED ausgewiesen wird. Wie immer wird keine numerische Modellaussage ohne externen Datensatz dahinter hochgestuft.

# text
# c1: kind
# c2: tests/determinism.rs
# c3: scenarios/*.toml
seg-267e50f8dd56 = <b>Lauffähige Szenarien</b>: jedes ein registriertes Szenario-<c1/>, über die Engine ausgeliefert und in der CI durchgängig durch <c2/> belegt (das jedes mitgelieferte <c3/> ausführt und bei jeder nicht lauffähigen Fixture hart fehlschlägt):

# text
# c1: hybrid-optical-rf
# c2: src/hybrid_integrity.rs
# c3: src/optical_availability.rs
# c4: src/optical_linkbudget.rs
# c5: src/cross_raim.rs
seg-92fb333483e5 = <b>Heterogene optisch/HF-hybride Kontinuität und Integrität</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>): domänenübergreifende Verfügbarkeit und Integrität, wenn optische und HF-PNT kombiniert werden. MODELLED.

# text
# c1: lunar-time-budget
# c2: src/lunar_time_budget.rs
# c3: realtime-frame-eop
# c4: src/realtime_frame_eop.rs
# c5: src/frame_eop.rs
seg-08e2f640ae14 = <b>Endogenes Mond-Zeitbudget</b> (<c1/>, <c2/>) und <b>Echtzeit-Frame-/EOP-Budget</b> (<c3/>, <c4/>, <c5/>): die Budgets für Mondzeit und Erdorientierung nach P3/P4, endogen aus der Zeitgebungskette abgeleitet statt behauptet. MODELLED.

# text
seg-52c2f9c2c9a7 = <b>Extern validierte Analysesuiten</b>: Bibliotheksfähigkeiten, die jeweils als neue Zeilen VALIDATED in die Matrix eingehen (gegen eine unabhängige externe Referenz geprüft, keine Selbstprüfung):

# text
# c1: src/mcda/
# c2: tests/mcda_*_reference.rs
seg-709789e8fb04 = <b>Vollständige Suite zur multikriteriellen Entscheidungsanalyse (MCDA)</b> (<c1/>): die vier Methodenfamilien: Wertaggregation (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), Verhältnissystem (<b>MOORA</b>) und proportional (<b>COPRAS</b>), Abstand zum Ideal (<b>TOPSIS</b>), Kompromissprogrammierung (<b>VIKOR</b>) und Outranking (<b>PROMETHEE II</b> mit sechs verallgemeinerten Kriterienformen, <b>ELECTRE I</b> Konkordanz/Diskordanz), dazu <b>AHP</b>-Prioritätsgewichte aus dem Perron-Eigenvektor mit dem Gate des Saaty-Konsistenzverhältnisses (CR < { "0.10" }), <b>MAUT</b>-Nutzen, Extraktion der Pareto-Front und <b>Sensitivitäts</b>analyse der Gewichte. Die neun Aggregatoren reproduzieren <b>pymcdm</b> / <b>pyDecision</b>, und der AHP-Eigenvektor stimmt mit SciPy/LAPACK überein, jeweils auf < { "1e-9" } (<c2/>). Das Sensitivitäts-Tornadodiagramm wird auch im Szenario zur Konfliktresilienz ausgewiesen.

# text
# c1: src/allan.rs
seg-2ce49cbfd8bf = <b>Allan-Wander- und Langzeit-τ-Uhrenstabilitätsschätzer</b> (<c1/>): <b>MTIE</b> (die Wanderstatistik des Spitze-Spitze-Zeitfehlers nach ITU-T G.810/G.823/G.8261, auf die Synchronisationsmasken geschrieben sind), die Zeitbereichs-Wanderstatistiken <b>MDEV</b> und <b>TDEV</b> sowie die Schätzer mit erweitertem Bereich <b>Theo1 / TOTVAR</b>. VALIDATED gegen <b>allantools</b> an der Serie aus NIST SP { "1065" }; das auf TOTVAR aufbauende, biasbereinigte Hybridverfahren <b>ThéoH</b> bleibt ehrlich MODELLED.

# text
# c1: src/assurance/
seg-68bcdf8bd5de = <b>Assurance-/Harness für externe unabhängige Referenzen</b> (<c1/>): ein Harness für unabhängige Referenzen, direkt an das Ehrlichkeits-Gate der CI angebunden, ein <b>W3C-PROV</b>-Herkunftsprotokoll mit deterministischer Merkle-Wurzel sowie äquivalente Freiheitsgrade nach <b>Greenhall</b> + Chi-Quadrat-Konfidenzintervalle für Stabilitätsschätzungen.

# text
# c1: src/registry.rs
# c2: src/api.rs
# c3: ExternalPack::register_into
seg-dcb91813b24c = <b>PackRegistry / ExternalPack-Erweiterungsnaht</b> (<c1/>, <c2/>): eine Dispatch-Naht, damit Capability-Packs über eine einzige Registry laufen (der eingebaute Dispatch liegt auf dem heißen Pfad der CLI; Packs außerhalb des Baums werden hinter einem vorbelegten <c3/> angebunden), abgesichert durch eine Golden-Suite zur Byte-Identität sowie Standalone-/wasm32-CI-Gates.

# text
# c1: kind
seg-16b1f5d249ed = <b>Unterbau modellierter Fähigkeiten</b>: neue Bibliotheksmodule, die die obigen und künftige Szenarien speisen (noch kein eigenständiges Szenario-<c1/>):

# text
# c1: src/lunar_beacon.rs
# c2: src/lunar_perturbed.rs
# c3: src/jamming.rs
# c4: src/linkbudget.rs
seg-f8c9ffbc56cf = <b>DOP von Mond-Oberflächenbaken</b> (<c1/>) mit Budget der realisierten Genauigkeit, Sweep über die Satellitenzahl und GDOP-Karte, außerdem eine gestörte Mond-Ephemeride (<c2/>) sowie Geometrie des atmosphärelosen Horizonts / Inverse der Spoof-Leistung / AFS-Defizitband (<c3/>, <c4/>). Verwendet den mit gnss_lib_py validierten DOP-Kern wieder.

# text
# c1: src/realdata/lola_dem.rs
seg-28209a2747d5 = <b>Einlesen von DEM im LOLA-Format</b> + Sichtlinie über das Gelände (<c1/>).

# text
# c1: src/spoof_capture.rs
# c2: src/cross_sensor_integrity.rs
# c3: src/monitor_network.rs
# c4: src/antenna.rs
# c5: src/nma_budget.rs
seg-6e98ac90a0e2 = <b>Dreischichtige Abwehr für Signalsicherheit</b>: Spoof-Erfassung, sensorübergreifende Integrität und Dimensionierung des Monitornetzes (<c1/>, <c2/>, <c3/>) mit einem Antennen-Footprint des Orbitalstrahls und einem OSNMA-Authentifizierungsbudget (<c4/>, <c5/>). MODELLED.

# text
# c1: src/verification.rs
seg-bd5b9511accb = Die Validierungsmatrix und jedes abgeleitete Artefakt wurden aus der einzigen maßgeblichen Quelle (<c1/>) neu erzeugt: das Register auf der Website, die Diagramme der Modulkarte und der Validierungsherkunft sowie die Zählstrings in README und je Oberfläche lauten jetzt <b>{ "51" } / { "47" } / { "4" } von { "102" }</b> (zuvor { "40" } / { "47" } / { "4" } von { "91" }); der Wächter für die Ehrlichkeit der Zählung durchsucht jetzt die vollständige Git-Historie, und die README-Abbildungen sind auf die dunkle Markenpalette vereinheitlicht.

# text
# c1: integrate
# c2: integrate_dopri
# c3: src/integrator.rs
seg-c2ec7e2b6296 = Ein gemeinsamer adaptiver Integrationstreiber trägt jetzt sowohl <c1/> als auch <c2/> (<c3/>) und beseitigt den duplizierten Stepper.

# text
seg-85cfb0f10268 = Statische Analyse mit <b>SonarQube Cloud</b> zur CI hinzugefügt (Rust + importierte Abdeckung), mit Bewertungsabzeichen für Sicherheit / Wartbarkeit / Zuverlässigkeit im README.

# text
seg-deeef8318367 = Disziplin bei Release und Paketierung: Die CI registriert je Paket/Registry-Veröffentlichung eine Deployment-Umgebung, und der fokussierte öffentliche Standalone-Job ist von den langsamen Validierungs-Binaries abgekoppelt.

# text
seg-30181148b098 = Der Hygiene-Wächter gegen Urheberschaftsangaben ist nur noch auf Urheberschaftsmarkierungen beschränkt, sodass die Nennung eines Integrationshosts oder Produkts den Build nicht mehr scheitern lässt.

# text
seg-6eb3868fdce0 = Dokumentation: Der Abschnitt <b>Citing</b> im README listet jetzt die vier veröffentlichten arXiv-Preprints, und die Fähigkeit DOP von Oberflächenbaken ist in der Mond-Zeile dokumentiert.

# text
seg-d12533cbf1f2 = Ganzzahlige Schleifenzähler für gleitkommagesteuerte Schleifen (Sonar S2193).

# text
seg-3c213354187f = Genaues Chi-Quadrat-Inverses bei niedrigen Freiheitsgraden durch Newton-Verfeinerung im Pfad der Konfidenzintervalle der Assurance.

# text
seg-386b7094d34d = kshana.dev: Der Abschnitt zu den Standards ist jetzt standardmäßig geöffnet, und der Fallback der Registerzählung ist korrigiert; veraltete Strings in README / Website rund um die Beobachtbarkeitsschicht wurden abgeglichen.

# text
seg-33448f46894f = Ein Capability-Release, das eine allgemeine <b>Schicht für Fisher-Information / Cramér-Rao-Beobachtbarkeit und optimale Versuchsplanung</b> hinzufügt, und das Release, auf dem das Paper zur Beobachtbarkeit von Mond-PNT beruht. Die maschinell geprüfte Validierungsmatrix wächst auf <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> über <b>{ "91" } Zeilen</b> (zuvor { "39" } · { "46" } · { "4" } über { "89" }): Die neue Schätz-Engine ist gegen eine externe unabhängige Referenz geprüft und VALIDATED; ihre Anwendung auf den Mond ist ehrlich MODELLED. Wie immer wird keine numerische Modellaussage ohne externen Datensatz dahinter hochgestuft.

# text
# c1: src/fim.rs
# c2: M = HᵀWH
# c3: best_design
# c4: eigh
# c5: inv
# c6: tests/fim_observability_reference.rs
seg-c377207026f4 = <b><c1/>: Fisher-Information, Cramér-Rao-Schranken und optimale Versuchsplanung.</b> Eine allgemeine, wiederverwendbare Engine der Schätztheorie: die Fisher-Informationsmatrix <c2/> aus einer Messungs-Jacobi-Matrix und Gewichten; ein symmetrischer Eigenlöser (zyklisches Jacobi-Verfahren); die untere Cramér-Rao-Schranke über die Inverse oder, wenn die Information rangdefizient ist (der Fall des freien Netzes / Datumsdefekts), über die Moore-Penrose-Pseudoinverse plus eine Nullraumbasis; und D-, A-, E- und T-optimale Metriken der Versuchsplanung mit einem Selektor <c3/> über Kandidatengeometrien. <b>VALIDATED</b> gegen NumPy (<c4/>/<c5/>) und die veröffentlichten geschlossenen Schranken von Kay ({ "1993" }) auf { "1e-9" } (<c6/>), sodass sie als Zeile mit externer unabhängiger Referenz statt als Selbstprüfung in die Matrix eingeht.

# text
# c1: lunar_observability
# c2: src/lunar_combination.rs
seg-91d09b4e737f = <b>Beobachtbarkeit der gemeinsamen Bahnbestimmung (OD) auf dem Mond</b> (<c1/> in <c2/>, im Bericht zur Mond-Kombination ausgewiesen): wendet die FIM/CRLB-Engine auf die gemeinsame Lösung von Bahn und Uhr an, um den Datumsdefekt der absoluten Station, die Wiederherstellung des Rangs bei Hinzunahme von Stationen auf Erdbasislinien, die erreichte CRLB der Stationsposition und die E-optimale Konditionierung offenzulegen. Ehrlich <b>MODELLED</b>: Die Schätz-Engine ist extern validiert, aber das Mondnetz, auf das sie angewendet wird, ist eine repräsentative Simulation, und kein derzeitiger Datensatz kann diese Geometrie in eine Messung überführen.

# text
# c1: orbit_ecc
# c2: orbit_inc_deg
# c3: orbit_argp_deg
# c4: orbit_planes
# c5: elfo_geometry_confirms_the_observability_structure
seg-6b1cd00aca8c = <b>Repräsentative Geometrie einer elliptischen eingefrorenen Mondbahn (ELFO)</b> für das Szenario zur Mond-Kombination (<c1/>, <c2/>, <c3/>, <c4/>; kreisförmige Platzierung bleibt die Voreinstellung) und ein Beobachtbarkeitsfeld ohne VLBI im Bericht, sodass sich zeigen lässt, dass das Ergebnis zum Datumsdefekt geometrieunabhängig gilt. Dieselbe Stufenfolge { "3" }→{ "1" }→{ "0" } und dieselbe Schwelle von drei Stationen gelten auf einer ELFO der Moonlight/LCNS-Familie, und mit drei Erd-VLBI-Basislinien ist die absolute Stationsposition mit einer Schranke im Submeterbereich beobachtbar, festgehalten durch <c5/>. Weiterhin MODELLED.

# text
# c1: src/verification.rs
# c2: web/data/verification-matrix.json
# c3: docs/VERIFICATION-MATRIX.md
# c4: docs/MODELLED-RATIONALE.md
seg-9e6627c0c417 = Die Validierungsmatrix und jedes erzeugte Nachweisartefakt wurden aus der einzigen maßgeblichen Quelle (<c1/>) neu erzeugt: das Register (<c2/>), <c3/>, <c4/>, die Abbildungen der Validierungsaufschlüsselung und der Arten unabhängiger Referenzen sowie die Zählstrings im README auf allen Verteilungsoberflächen lauten jetzt <b>{ "40" } / { "47" } / { "4" } von { "91" }</b>.

# text
seg-6f90233290a2 = Ein reines Packaging-Patch-Release. Keine Änderungen an Engine, Szenario oder Ergebnissen; die Validierungsmatrix bleibt unverändert bei { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER über { "89" } Zeilen.

# text
# c1: repository.url
# c2: AshfordeOU
# c3: repository
# c4: ashfordeOU
# c5: package.json
seg-9d41e1412d1f = npm publish: Das aus dem Crate-Manifest abgeleitete Paketfeld <c1/> verwendete den GitHub-Eigentümer in falscher Groß-/Kleinschreibung (<c2/>), woran die sigstore-Provenienzprüfung von npm scheiterte (sie vergleicht den Eigentümer unter Beachtung der Groß-/Kleinschreibung). Das Manifestfeld <c3/> ist jetzt das kanonische <c4/> in Kleinschreibung, sodass die erzeugte <c5/> zum Provenienzsubjekt passt und das npm-Release veröffentlicht wird.

# text
# c1: codegen-units = 1
seg-fe1f8aae99f4 = Der Wheel-Build legt <c1/> fest, damit das manylinux-Wheel über Neubuilds hinweg byte-reproduzierbar ist (die Reproduzierbarkeitsprüfung per Neubau und Diff).

# text
seg-b87075b47007 = Ein Konsolidierungs-Release mit Schwerpunkt auf <b>Evidenz, Herkunft und Disziplin bei der Verteilung</b>. Die maschinell geprüfte Validierungsmatrix wächst auf <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> über ihre <b>{ "89" } Zeilen</b> (zuvor { "15" } · { "42" } · { "4" } über { "61" }), getragen von der Kreuzvalidierung modellierter Fähigkeiten gegen unabhängige externe Referenzen. Jedes verteilte Artefakt trägt jetzt eine kryptografische SLSA-Build-Provenienzbescheinigung, liefert ein CycloneDX-SBOM mit und wird im Gleichschritt über alle Oberflächen veröffentlicht. Keine numerische Modellaussage wird ohne externen Datensatz dahinter hochgestuft; neue Fähigkeiten bleiben ehrlich MODELLED.

# text
# c1: src/attitude_dynamics.rs
seg-f6de783bfd29 = <b>Lagedynamik</b> (<c1/>, MODELLED): momentenfreie Eulergleichungen des starren Körpers + Quaternionenkinematik (RK4), mit Selbsttests der Erhaltungssätze (Quaternionennorm, kinetische Energie, |Iω|, Präzession des symmetrischen Kreisels).

# text
# c1: quantum_trade
# c2: tests/fixtures/optical_clock_adev/
# c3: src/sdr.rs
# c4: src/altpnt/terrain.rs
seg-339bc18b9fc4 = <b>Kreuzvalidierung modellierter Fähigkeiten</b> gegen unabhängige externe Referenzen, womit die Validierungsmatrix auf { "39" } Zeilen VALIDATED kommt, jede durch einen externen Datensatz gestützt (das Ehrlichkeits-Gate der CI verbietet den Status VALIDATED ohne einen solchen). Die neuesten Validierungen gegen externe unabhängige Referenzen: die <b>gemessene Stabilitätskurve optischer Uhren</b> (der ADEV-Kurvenfit von <c1/> reproduziert das veröffentlichte σ_y(τ) der ⁸⁸Sr-Optischen-Gitteruhr von Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, unter <c2/> mitgeliefert); die <b>Erzeugung des GPS-L1-C/A-Spreizcodes</b> (das G1/G2-LFSR von <c3/> reproduziert die Oktalwerte der Codephase aus IS-GPS-200 Tabelle 3-Ia für PRN { "1" }–{ "9" }); und der <b>SRTM-Höhenmodell-Leser auf realem Gelände</b> (<c4/> liest eine mitgelieferte gemeinfreie NASA/USGS-SRTM-v3-Kachel, N36W117 / Death Valley, und platziert Badwater Basin innerhalb seines dokumentierten Vermessungsbandes).

# text
seg-b3f53d5e3c3a = <b>Evidenzregister aus einer einzigen Quelle</b> mit erzeugter Verifikationsdokumentation und einem Wächter gegen Abweichung; ein durchsuchbares Validierungsregister auf kshana.dev mit Tiefenlinks zur Evidenz je Karte.

# text
# c1: codemeta.json
# c2: .zenodo.json
# c3: tests/citation_metadata_doc_sync.rs
seg-b3c0545157b3 = <b>Maschinenlesbare Zitiermetadaten</b>: <c1/> (CodeMeta { "2.0" }) und <c2/>, durch <c3/> an das Cargo-Manifest gebunden.

# text
seg-2ca8875da9de = <b>Herkunft der Lieferkette</b>: SLSA-Build-Provenienzbescheinigung für Crate-Tarball, Wheels, sdist und npm-Tarball; PyPI-OIDC-Trusted-Publishing; CycloneDX-SBOM, mitgeliefert im Wheel und im npm-Paket; Diff für reproduzierbare Builds und Verifikation nach dem Release.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: validation-breakdown
seg-18fdecf7f2fa = <b>Auffindbarkeit</b>: <c1/>, <c2/> und Open-Graph-/JSON-LD-Metadaten auf kshana.dev; eine erzeugte Abbildung <c3/>, aus der Matrix abgeleitet.

# text
seg-f80db0b0f545 = <b>READMEs je Oberfläche</b> für crates.io / PyPI / npm mit einem Wächter für die Ehrlichkeit der Zählung.

# text
seg-bd33b21f8f91 = Die unabhängige Referenz für <b>Sagnac-Zeitübertragung</b> wurde auf ExternalDataset hochgestuft: Die Sagnac-Korrektur für die äquatoriale Erdumrundung wird jetzt gegen Ashbys veröffentlichte { "207.4" } ns geprüft (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, Gl. { "1.29" }; auf < { "0.05" } ns reproduziert). Die zusammengesetzte Fähigkeit der Zeitübertragung bleibt ehrlich MODELLED.

# text
# c1: oracle-kind-stacked
seg-882133bf1fcc = <b>Dokumentation, Diagramme und Abbildungen aktualisiert</b> auf die aktuelle Matrix (39/46/4/89): das Diagramm der Validierungsherkunft, die Abbildung <c1/> (jetzt aus der Matrix erzeugt, mit einem CI-Wächter gegen Abweichung), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, die Architektur- und Tutorial-Dokumente sowie die Gesamtzahl im Register auf kshana.dev.

# text
seg-a9be3d71a52c = Der Quellbaum wurde mit dem festgelegten rustfmt (Toolchain { "1.93.0" }) neu formatiert: reine Formatierung, keine Verhaltensänderung.

# text
# c1: scripts/check-version-sync.sh
seg-4542eb4fabfc = <b>Versionierung im Gleichschritt.</b> Jede Verteilungsoberfläche (Crate, PyPI, npm, MCP-Crate + OCI-Image, JetBrains-Plugin) wird jetzt im Gleichschritt mit der Engine versioniert, in der CI durch <c1/> erzwungen.

# text
seg-792df0cdc8a7 = Das <b>JetBrains-Plugin</b> wurde auf <b>AGPL-3.0-only</b> umlizenziert (die veröffentlichte Version { "0.1.1" } wies noch Apache-2.0 aus) und leitet seine Marketplace-Version jetzt aus dem Release-Tag ab.

# text
# c1: unwrap
# c2: clippy::unwrap_used
seg-171f5649c90f = <b>Härtung der Robustheit</b>: Nicht-Test-<c1/>s entfernt oder begründet; <c2/> für Nicht-Test-Code als Gate gesetzt.

# text
seg-0e5abb2fad02 = <b>kshana.dev</b>, Überarbeitung nach dem Grundsatz Beleg zuerst: dominanter Hero-Bereich, Architekturdiagramme und Ergebnisabbildungen, i18n, einklappbare/responsive Abschnitte für Register und Standards.

# text
seg-05ef9b9f3653 = <b>Präzise SP3-Ephemeride</b>: Die IGS-Knotenkorrektur der Erdrotation wird bei der Interpolation angewendet.

# text
# c1: tests/surface_readme_image_urls_doc_sync.rs
seg-bbd0dc3dd9cb = <b>Registry-Bilder</b>: Die READMEs für PyPI/crates.io/npm verwenden absolute Bild-URLs; die relativen Bildpfade des Haupt-README wurden auf der PyPI-Seite { "0.21.0" } als defekte Bilder dargestellt. Ein CI-Wächter (<c1/>) verhindert den Rückfall.

# text
# c1: fmt
# c2: clippy
seg-6d044971dbc8 = <b>CI</b>: <c1/> + <c2/> grün; nicht mehr gegen per Git ignorierte reale Daten kompilieren.

# text
seg-c3c260b7063e = Tests

# text
# c1: tests/property.rs
seg-5dca3defcfe3 = Die Kalman-Uhrenkovarianz bleibt positiv semidefinit und symmetrisch (Eigenschaftstest, <c1/>).

# text
seg-c861779f04ca = Doc-Sync-Wächter: Jeder öffentliche String mit Validierungszahlen, die Zitiermetadaten, die erzeugte Abbildung und die Bild-URLs der READMEs je Oberfläche sind alle an ihre maßgebliche Quelle gebunden.

# text
# c1: src/timetransfer_chain.rs
seg-07532f03a1f1 = <b>Vertrauenswürdige Quanten-Zeitübertragung</b> (<c1/>): ein Zweiwege-Budget aus optischer Gitteruhr + photonischer Strecke gegenüber CSAC + HF, das das Schutzniveau der Zeitgebung wiederverwendet, mit einem Sicherheitsgütemaß gegen Verzögerungs-/Replay-Angriffe ({ "1" } − P_md) und Uhrenanomalie-Erkennung + CUSUM-Latenz.

# text
# c1: src/quantum_nav_od.rs
seg-4c9036cffe1b = <b>GNSS-freie Quantennavigation</b> (<c1/>): ein Kaltatom-Interferometer im inertialen Auslauf gegenüber einem INS der Navigationsklasse über einen GNSS-Ausfall, mit dem ehrlichen Hinweis, dass ohne externe Lösung der Beschleunigungsmesser-Bias unbeobachtbar bleibt und der Fehler deshalb weiter wächst.

# text
# c1: src/quantum_faults.rs
seg-6188f1c6893a = <b>Quanten-Fehler-/Anomalieerkennung</b> (<c1/>): ein gelabelter Fehlerkatalog mit einer ROC-AUC mit Bootstrap-Konfidenzintervall und einem minimal erkennbaren Fehler bei fester Falschalarmrate.

# text
# c1: src/quantum_devices.rs
# c2: src/qtrade.rs
seg-9e22314b1337 = Eine gemeinsame Bibliothek von Fehlermodellen für Quantengeräte (<c1/>) und ein einheitliches Trade-Harness Quanten gegen klassisch (<c2/>) bilden die Grundlage aller drei.

# text
seg-a892ce052e3c = <b>Sechs neue Validierungen gegen externe unabhängige Referenzen</b> (die Validierungsmatrix steht jetzt bei { "15" } validierten):

# text
# c1: tests/cs5071a_reference.rs
seg-c30ae6767c6c = <b>ADEV / HDEV an einer realen 5071A-Cäsiumuhr</b>: validiert gegen die Dekadenpunkt-Referenzen von Stable32 (<c1/>).

# text
# c1: PHASE.DAT
# c2: tests/phasedat_reference.rs
seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV an der Stable32-Referenz <c1/></b>: validiert gegen die veröffentlichten Tabellen von Stable32 (<c2/>).

# text
# c1: tests/opssat_ad_reference.rs
seg-e8728f57effa = <b>ROC-AUC der Anomalieerkennung an realer ESA-OPS-SAT-Telemetrie</b>: validiert gegen scikit-learn (<c1/>).

# text
# c1: tests/icgem_gravity_reference.rs
seg-5446957ac631 = <b>ICGEM-Synthese von Schwerefeldfunktionalen</b>: validiert gegen den GRS80-Normalschwerestandard (Somigliana-γ auf { "3.5e-12" }; EGM2008-Störungskarte, <c1/>).

# text
# c1: tests/klobuchar_reference.rs
seg-751c5ac90229 = <b>Klobuchar-Broadcast-Ionosphärenmodell</b>: validiert gegen RTKLIB (<c1/>).

# text
# c1: tests/raim_reference.rs
# c2: tests/sbas_reference.rs
seg-dcc6d4e04a5c = <b>RAIM-Detektionskern</b> ({ "171" } Fälle, <c1/>) und das <b>SBAS-DO-229E-Schutzniveau</b> an realen EGNOS-Daten (RTKLIB-SBAS-PL-Fork, <c2/>): beide validiert gegen ihre externen unabhängigen Referenzen.

# text
# c1: --study-name
# c2: --validate
seg-6b4c78bdaf35 = <b>Studienaggregation & CLI-Ergonomie.</b> Ein Manifest für Szenariosuiten mit Studienaggregation per Einzelbefehl, hash-stabile Studienmetadaten + <c1/>, Linting von Szenarien mit <c2/> und Ausweis der Validierungsstufe je Gütemaß in Studienberichten.

# text
seg-e24230b80a89 = <b>kshana.dev neu gestaltet um ein gemeinsames Domänenrückgrat</b>: Fähigkeiten und Validierung zu einem Domänen-Explorer mit gemeinsamem Vokabular zusammengeführt, die neuen validierten Inseln ausgewiesen, ein landgenaues animiertes Erdinstrument und ein CTA zur Studienanfrage sowie das Branding und die Links von Ashforde OÜ.

# text
seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE auf Vollständigkeit und Ehrlichkeit geprüft</b>: veraltete Zahlen validierter Fähigkeiten korrigiert (jetzt { "15" } externe unabhängige Referenzen), die Diagramme erweitert, und die Preprints zum Conditional Timing Protection Level (arXiv:{ "2606.24210" }) und zur Optimismuslücke bei HF-Beeinträchtigungen (arXiv:{ "2606.22054" }) zitiert.

# text
# c1: paper/
seg-42a317c6ce06 = Die Quellen in <c1/> und die JOSS-Entwurfspipeline werden im öffentlichen Repository gehalten.

# text
seg-8ed5cf845b00 = Dieses Release fügt der offenen Engine vier Studienfähigkeiten hinzu: ein bedingtes Timing Protection Level, eine am Rahmenwerk ausgerichtete Bewertung der PNT-Resilienz, eine Bewertung der Optimismuslücke bei HF-Beeinträchtigungen und ein Frontend für Software-Defined-Receiver / reale Daten, jede aus einem einzigen Befehl reproduzierbar und mit byte-deterministischem Artefakt. Alle Studien sind MODELLED (synthetische oder auf öffentlichen Datensätzen kalibrierte Daten), tragen ihre ehrliche Herkunft (Engine-Version, Seeds, Konfigurations-Hash) und Validierungslabels und sind keine Zertifizierungen.

# text
# c1: tpl
# c2: cargo run --release --example tpl_jammertest
seg-0c9f0c665491 = <b>Bedingtes Timing Protection Level (<c1/>).</b> Eine durch Holdover begrenzte Schranke des unerkannten Zeitfehlers bei GNSS-Spoofing, mit einer k-Sigma-Untergrenze des Monitors, einer Coast-Varianz nach van Loan über die Detektionslatenz und einer CUSUM-Zeit bis zum Alarm. Kalibriert an einem realen aufgezeichneten Angriff (JammerTest { "2024" }, Szenario { "2.1.1" }) über <c2/>, das seine Referenztabelle aus Skalaren reproduziert, die aus der öffentlichen Aufzeichnung gewonnen wurden (der Rohdatensatz wird nicht weiterverteilt).

# text
# c1: resilience
# c2: cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json
# c3: docs/RESILIENCE-CROSSWALK.md
seg-d874d7f13f28 = <b>Am Rahmenwerk ausgerichtete Bewertung der PNT-Resilienz + Studie zur Entscheidungsinstabilität (<c1/>).</b> Architekturmodell, an RPCF ausgerichtete Bewertung, Dirichlet-Gewichtungssimplex, Instabilität nach Kendall-Tau und Top-1-Flip-Rate sowie Zusammenbruch der Gleichtaktdiversität (Hill-N2), mit <c2/>. Zuordnungstabelle in <a1><c3/></a1>.

# text
# c1: impairment_study
# c2: impairment_ml
# c3: eval_stats
# c4: cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
seg-343f7af54503 = <b>Studie zur Optimismuslücke bei HF-Beeinträchtigungen (<c1/>, <c2/>, <c3/>).</b> Ein Panel aus 13 Detektoren über einem parametergestützten synthetischen Korpus, eine Optimismuslücke zwischen In- und Out-of-Distribution, Skalierungsgesetz-Trends mit einer Permutations-Nullhypothese und ein Leave-one-out-Prädiktor der Degradation, über <c4/>.

# text
# c1: sdr
# c2: realdata/
seg-6eed55859bbf = <b>Frontend für Software-Defined-Receiver (<c1/>) und Adapter für reale Daten (<c2/>).</b> Roh-IQ/IF bis zu Korrelator-Taps und SQM, dazu Einlese-Adapter (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) und Beispiele zur Sondierung. Diese lesen Aufzeichnungen, die der Nutzer lokal bereitstellt; es werden keine Aufzeichnungen eingecheckt.

# text
# c1: optimism-study.json
# c2: resilience-study.json
# c3: paper-artifacts/
# c4: /realdata-cache/
seg-afe2282fa771 = <b>Eingecheckte Studienartefakte.</b> Die byte-deterministischen Dateien <c1/> und <c2/> werden jetzt unter <c3/> versioniert, sodass die Studienzahlen ohne Neubau geprüft werden können; sie bleiben aus den obigen Generatoren neu erzeugbar. Rohdatensätze bleiben außerhalb des Repositorys (<c4/>).

# text
# c1: Cargo.toml
# c2: CITATION.cff
# c3: README
seg-450d82cddc28 = Version auf { "0.20.0" } angehoben in <c1/>, <c2/> und <c3/>; die Studienartefakte zum Crossover sind neu erzeugt, damit ihr Stempel zur veröffentlichten Version passt.

# text
# c1: LICENSE
# c2: LICENSING.md
seg-a0a66af8fd14 = <b>Umlizenziert von Apache-2.0 auf die GNU AGPL-3.0-only, mit einer von Ashforde OÜ erhältlichen kommerziellen Lizenz (Dual-Licensing).</b> Die offene Engine bleibt vollständig offen und öffentlich verifizierbar; das Netzwerk-Copyleft der AGPL (§{ "13" }) bedeutet, dass eine geschlossene oder gehostete abgeleitete Fassung zu Open Source zurückkehren muss, oder eine kommerzielle Lizenz erwerben. Dies schützt den validierten Kern vor Fork-und-Schließen und wahrt zugleich die Glaubwürdigkeit einer öffentlichen, ausführbaren, prüfbaren Engine. Siehe <a1><c1/></a1> (AGPL) und das neue <a2><c2/></a2> (was jede Lizenz abdeckt und wann sie gilt).

# text
# c1: LICENSE
# c2: AGPL-3.0-only
# c3: NOTICE
# c4: README
# c5: GOVERNANCE
# c6: GLOSSARY
# c7: Cargo.toml
# c8: pyproject.toml
# c9: CITATION.cff
seg-ffa799fdb814 = <c1/> enthält jetzt den Text der AGPL-3.0; die SPDX-Header in allen Quellen sind auf <c2/> aktualisiert; <c3/>, <c4/>, <c5/>, <c6/>, die Website und die Crate-/Paketmetadaten (<c7/>, <c8/>, <c9/>, das MCP-Crate + Image) wurden entsprechend aktualisiert.

# text
# c1: CONTRIBUTING.md
seg-8d67aba2af0b = Die <b>Beitragsbedingungen</b> (<a1><c1/></a1>) lizenzieren eingehende Beiträge jetzt unter der AGPL <b>und</b> räumen Ashforde OÜ das Recht ein, Beiträge in die kommerziell lizenzierte Edition aufzunehmen, damit das Dual-Licensing weiter funktioniert.

# text
# c1: deny.toml
# c2: GOVERNANCE
seg-93644d1c1420 = <b>Abhängigkeitsrichtlinie unverändert, aber neu begründet</b> (<a1><c1/></a1>, <c2/>): Abhängigkeiten bleiben permissiv (Apache/MIT/BSD/ISC). AGPL ist nur für das eigene Crate von kshana erlaubt: Eine Copyleft-<em>Abhängigkeit</em> würde die kommerzielle Edition infizieren und das Dual-Licensing brechen.

# text
# c1: v0.18.0
# c2: v0.19.0
seg-9b77c2d36241 = <b>Hinweis für nachgelagerte Nutzer:</b> Dies ist eine Copyleft-Umlizenzierung. Nutzer, die sich auf die permissiven Bedingungen von Apache-2.0 verlassen haben, können das letzte Apache-2.0-Release weiterverwenden (<c1/> und früher, wie veröffentlicht); ab <c2/> gilt AGPL-3.0 / kommerziell.

# text
# c1: pyo3
# c2: BoundList/TupleIterator::nth
# c3: nth_back
# c4: PyCFunction::new_closure
# c5: pyo3
# c6: python
# c7: src/python.rs
# c8: scenario_kinds
# c9: skip_from_py_object
# c10: RunOutput
seg-51e32f15b7ea = <b><c1/> von { "0.24" } auf { "0.29" } angehoben</b>, um RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) aus externen OSV-/Abhängigkeitsscans zu beseitigen. Beides sind Hinweise auf <em>Funktionsebene</em>, deren betroffene Funktionen (<c2/>/<c3/>, <c4/>) Kshana nie aufruft, und <c5/> ist eine optionale Abhängigkeit (Feature <c6/>), die tatsächliche Gefährdung war also null; die Anhebung hält aber den Scan für nachgelagerte Auditoren sauber. <c7/> wurde auf die API von pyo3 { "0.29" } migriert (Bound-Rückgabetyp für <c8/>; explizites <c9/> an der pyclass <c10/>). Alle { "11" } Python-Binding-Tests bestehen gegen die neu gebaute Erweiterung.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-20b74caf58cc = <c1/> (<c2/>): Testumgebung zur Bewertung maschineller Lernverfahren zur Erkennung von HF-Beeinträchtigungen: ein gelabelter <b>synthetischer</b> Korpus + ein detektorunabhängiges <b>ROC/AUC</b>-Harness + ein Bericht zur <b>Optimismuslücke</b> zwischen In- und Out-of-Distribution (nur Betriebskennlinien, nie Feld-/IQ-Daten).

# text
# c1: quantum-trade
# c2: src/quantum_trade.rs
seg-0253656a0ecf = <c1/> (<c2/>): Trade PNT Quanten gegen klassisch mit Einlesen gemessener ADEV und einer Resilienzhülle für GNSS-verweigerte Umgebungen.

# text
# c1: space-weather
# c2: src/space_weather.rs
seg-901bd713bd62 = <c1/> (<c2/>): solare/geomagnetische Indizes (Kp↔ap-Tabelle der IAGA, tägliches Ap, zentriertes 81-Tage-F10.7a), exosphärische Temperatur nach <b>Jacchia-71</b> und eine aktivitätsgetriebene Kopplung der thermosphärischen Dichte über einer statischen Atmosphäre (KEIN Modell absoluter Dichte nach NRLMSISE).

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
seg-2323b43c0ffc = <c1/> (<c2/>): Import + Round-Trip-Brücke für <b>CCSDS-{ "502.0" }-OEM</b> für Ephemeriden aus GMAT / Orekit / STK (der Leser <c3/>, exakte Umkehrung des Schreibers).

# text
# c1: launch-window
# c2: src/launch.rs
# c3: sin Az = cos i/cos lat
seg-188aeb3e8219 = <c1/> (<c2/>): <b>Startazimut</b> im Zweikörperproblem (<c3/>), Δv für Ebenenwechsel, Bonus durch die Rotation des Startplatzes und Geometrie der täglichen Startgelegenheiten.

# text
# c1: reentry
# c2: src/reentry.rs
seg-6200a47276e6 = <c1/> (<c2/>): ballistischer Wiedereintrittskorridor nach <b>Allen-Eggers</b>: maximale Verzögerung, Geschwindigkeiten bei Spitzen-g und Spitzenheizung, Höhe bei Spitzen-g.

# text
# c1: eo-coverage
# c2: src/eo_payload.rs
seg-0874c2241748 = <c1/> (<c2/>): Geometrie von EO-<b>Streifenbreite / GSD / Zugriff / Wiederkehr</b> (SMAD-Raumdreieck).

# text
# c1: space-packet
# c2: src/space_packet.rs
seg-83c7588ff074 = <c1/> (<c2/>): Kodierung/Dekodierung des Primary Header des <b>CCSDS-133.0-B-Space-Packets</b> mit bitgenauem Round-Trip.

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
seg-ae1bcad02880 = <c1/> (<c2/>): 3-DOF-<b>Gravitationsgradientenmoment</b> + <b>RSS-Budget des Ausrichtungsfehlers</b> (skalares Budget vor der Hardware, keine Regelschleife).

# text
# c1: passes
# c2: src/passes.rs
seg-65f59cc12e02 = <c1/> (<c2/>): <b>Vorhersage von Auf-/Untergangsüberflügen</b> für Bodenstationen (AOS/TCA/LOS, maximale Elevation, Zugriff).

# text
# c1: link-budget
# c2: src/linkbudget.rs
# c3: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-178776497627 = <c1/> (<c2/>): Einweg-Linkgleichung nach <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / Marge / Schließung).

# text
# c1: hybrid-ukf
# c2: src/fusion/hybrid_ukf.rs
# c3: scenarios/hybrid-ukf.toml
# c4: src/fusion/tightly_coupled17.rs
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: clock_state::q_from_allan
# c8: q_wf
# c9: q_rw
# c10: q_factor
# c11: r_factor
# c12: Ukf::update_stats
# c13: TightlyCoupled17::{update_gnss_nis, nees, nees_subset}
seg-e7fee32a00f5 = <b>Hybrider eng gekoppelter UKF mit 17 Zuständen aus Quanten- und klassischen Sensoren, als lauffähiges Szenario ausgewiesen (MODELLED).</b> Eine neue Szenarioart <c1/> (<c2/>, <c3/>), die den bisher nur über die API nutzbaren eng gekoppelten GNSS/INS-Unscented-Filter mit 17 Zuständen (<c4/>) zu einem Szenario macht, das die Bindings für CLI/Python/WASM/MCP aufrufen können. Der Fehlervektor mit 17 Zuständen besteht aus den <b>{ "15" } INS-Fehlerzuständen</b> (Position, Geschwindigkeit, Lagefehlausrichtung, Beschleunigungs- + Gyro-Bias), ergänzt um die <b>aus dem CAI abgeleitete Korrektur des Beschleunigungsmesser-Bias</b> (das Kaltatom-Interferometer (<c5/>) legt die Untergrenze der Geschwindigkeits-Zufallsbewegung <c6/> fest, sodass die langfristige Coast-Drift die durch den Quantensensor begrenzte ist), und eine <b>Uhr mit 2 Zuständen für Phase + Frequenz</b>, deren Prozessrauschen aus der <b>Uhren-Engine mit q-Parametern</b> stammt (<c7/>, die das Allan-Abweichungsprofil einer Uhr auf die PSDs <c8/>/<c9/> abbildet, skaliert auf Entfernungseinheiten). Die Plattform wird für einen Vorlauf durch GNSS gestützt (der Filter lernt Biases, Geschwindigkeit und Uhr), läuft dann durch einen GNSS-Ausfall allein auf dem CAI-IMU + der Uhr aus, sodass der Lauf die Hybridisierung <b>klassischer IMU kurzfristig + Quanten langfristig</b> zeigt. Das Gütemaß ist die <b>Selbstkonsistenz des Filters</b>: gepoolte <b>NEES</b> (Normalised Estimation Error Squared, über die schätzbare Teilmenge aus Position/Geschwindigkeit/Uhr) und <b>NIS der Innovationsweißheit</b> (Normalised Innovation Squared) über ein Monte-Carlo-Ensemble, geprüft gegen ihre { "95" }-%-χ²-Bänder (Bar-Shalom §{ "5.4" }). Der angepasste Filter liegt innerhalb der Bänder; ein absichtlich falsch abgestimmter Filter (die Stellgrößen <c10/> / <c11/>) wird markiert: ein objektiv prüfbares, trennscharfes Gate, kein Abnicken. <b>Die Prüfung von NEES/Innovationsweißheit ist die STATISTISCHE UNABHÄNGIGE REFERENZ: eine Aussage zur Selbstkonsistenz (die vom Filter gemeldete Kovarianz stimmt ehrlich mit der Streuung seiner eigenen Fehler unter dem modellierten Rauschen überein), KEINE Garantie realer Genauigkeit.</b> Ehrlicher Geltungsbereich: Alles ist <b>modelliert / Simulation</b>: Die Eingaben für CAI und Uhr sind eingegrenzte, für die Literatur repräsentative Werte, keine gemessene Hardware; die CAI-Hardware und ihre Schlüsselperson bleiben beim Partner; nichts hier impliziert TRL > { "3" }, Flugerfahrung oder externe Validierung (das Ergebnis-JSON und die einzeilige Zusammenfassung tragen diese Labels ausdrücklich). Die einzelne ebene Trajektorie mit konstanter Geschwindigkeit lässt die Zustände für Lage und IMU-Bias nur schwach beobachtbar, daher wird NEES über die { "8" } schätzbaren Zustände bewertet; eine Trajektorie mit Manövern für volle Beobachtbarkeit aller 17 steht auf der Roadmap. Ergänzt außerdem <c12/> (liefert den NIS je Update) und die Konsistenzinstrumentierung <c13/>. Alle bestehenden Szenarien sind unberührt (additiv; Reproduzierbarkeits-Goldens unverändert).

# text
# c1: terrain-slam
# c2: src/altpnt/sequential.rs
# c3: scenarios/terrain-slam.toml
# c4: particle_filter
# c5: terrain-nav
seg-9b55f4ac5053 = <b>Sequenzielle (rekursive) geländegestützte Navigation: SITAN als laufender Filter.</b> Eine neue Szenarioart <c1/> (<c2/>, <c3/>), die das bestehende Messmodell Höhenmesser gegen DEM <b>Epoche für Epoche</b> durch die SIR-Engine <c4/> laufen lässt, statt der gestuften Batch-Suche von grob zu fein, mit der <c5/> einen einzelnen <em>konstanten</em> INS-Versatz wiedergewinnt. An jedem Wegpunkt wird die Wolke um das vom INS gemeldete Inkrement fortgeschrieben (selbst durch das Driftwachstum je Schritt verfälscht), durch den Geländeabgleich neu gewichtet und bei Degeneration neu abgetastet, sodass eine <b>zeitvariable</b> INS-Drift entlang der Spur <em>verfolgt</em> wird, was eine Anpassung mit konstantem Versatz strukturell nicht kann. Auf dem synthetischen DEM bleibt die rekursive Schätzung beschränkt und konvergiert erneut (am Ende ≈ { "70" } m), während die ungestützte inertiale Lösung unbegrenzt auf ≈ { "5" } km divergiert; der Fehler je Epoche folgt der Eindeutigkeit des Geländes (über flachen Sätteln läuft sie auf dem verzerrten INS aus und rastet über markantem Relief wieder ein), und der Monitor der effektiven Stichprobengröße bestätigt eine gesunde Wolke. Ehrlicher Geltungsbereich: Die Karte ist <b>bekannt und fest</b>, es ist rekursive <em>Lokalisierung</em> gegen ein gespeichertes DEM (die Lokalisierungshälfte von Gelände-SLAM), keine gemeinsame Kartenschätzung; nicht zirkulär per Konstruktion (die eingespeiste Driftrampe ist die unabhängige Wahrheit). Alle bestehenden Szenarien sind unberührt (additiv; Reproduzierbarkeits-Goldens unverändert).

# text
# c1: src/holdover.rs
# c2: src/impairment_eval.rs
# c3: src/quantum_trade.rs
# c4: src/navsignal.rs
# c5: src/inertial/quantum_imu.rs
# c6: src/verification.rs
seg-87ba3bc926fa = <b>Resilienzrückgrat bei GNSS-Verweigerung + Demonstrator-Slices für FutureNAV</b> (<c1/> sowie Grundlagen der Resilienzhülle unter <c2/>, <c3/>, <c4/>, <c5/>, mit Verifikations-Slices für FutureNAV in <c6/>). Setzt die Bausteine alternativer PNT, nämlich Uhren-Holdover, Signalverfolgung, inertialen Auslauf und Gelände, zu einer einzigen Resilienzerzählung für GNSS-Ausfälle zusammen. MODELLED; additiv.

# text
# c1: src/interchange.rs
seg-071bb6654f24 = <b>Kshana Interchange Format (KIF): ein versionierter, selbstbeschreibender Artefaktumschlag</b> (<c1/>). Ein Schema-markierter Umschlag um Szenarioergebnisse, sodass ein gespeichertes Artefakt seine Art, seine Schemaversion und seine Labels MODELLED/VALIDATED mit sich führt und ältere Umschläge vorwärtskompatibel lesbar bleiben. Additiv; bestehendes Ergebnis-JSON unverändert.

# text
# c1: src/navsignal.rs
# c2: src/cr3bp.rs
seg-07147766ab22 = <b>Modulation / Verfolgung von Navigationssignalen + CR3BP-Differentialkorrektor für Halo/NRHO</b> (<c1/>, <c2/>). Ein Modell der Modulation und Verfolgung von Navigationssignalen in erster Ordnung sowie ein Differentialkorrektor für das eingeschränkte Dreikörperproblem mit Kreisbahnen für Halo-/nahezu geradlinige Halo-Bahnen, ausgewiesen auf der bestehenden Achse Deep-Space-Fähigkeit. MODELLED.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-d0d2366e3351 = <b>Auswertungsmodus für Verteilungsverschiebung + Regler der Schweregradskala des Korpus für <c1/></b> (<c2/>). Ergänzt das Harness zur Optimismuslücke bei ROC/AUC um eine ausdrückliche Aufteilung In-/Out-of-Distribution und eine einstellbare Schweregradskala des Korpus (nur Betriebskennlinien, nie Feld-/IQ-Daten).

# text
# c1: src/frugal.rs
# c2: src/integrity_impact.rs
seg-9bb8ee93e70b = <b>ROI Kosten je Abdeckung + Abbildung der Integritätsauswirkung verpasster Detektionen</b> (<c1/>, <c2/>). Eine ROI-Sicht des frugalen Engineerings (Kosten je Abdeckungseinheit) und eine Abbildung von der Rate verpasster Detektionen auf die Integritätsauswirkung. MODELLED; additiv.

# text
# c1: src/inertial/quantum_imu.rs
# c2: hybrid-ukf
seg-55f8ba5b52ee = <b>Zitiertes Parameterblatt für das Fehlermodell des Kaltatom-Interferometers (CAI)</b> (<c1/>). Ein mit Literatur belegtes, eingegrenztes Parameterblatt für das inertiale CAI-Modell: Die Eingaben sind <b>zitiert, keine gemessene Hardware</b> (keine Aussage zu TRL / Flug); es speist die Untergrenze der Geschwindigkeits-Zufallsbewegung von <c2/>.

# text
seg-cfbff4acc64c = Projekt-Governance.

# text
# c1: GOVERNANCE.md
# c2: none → partial
seg-982f9ea3eee8 = <c1/> dokumentiert das Entscheidungsmodell und die Grenze zwischen offen und geschlossen; die Zeile Community/Governance der Capability-Map wechselt von <c2/>, um dies abzubilden.

# text
# c1: b_nom
# c2: b_k = Σ_i |s_i|·b_nom
# c3: #[serde(default)]
# c4: sigma_ura_m
# c5: b_nom_m
# c6: docs/ARAIM_REFERENCE.md
# c7: b_k
seg-c9ff6a7183eb = <b>Integritäts-Schutzniveau der ARAIM: nominaler Bias (<c1/>) und σ_URA jetzt angewendet.</b> Das MHSS-Schutzniveau subtrahiert jetzt je Fehlermodus die einseitige Projektion des nominalen Bias <c2/> und verwendet das <b>Integritäts</b>-Sigma σ_URA (verschieden vom <b>Genauigkeits</b>-Sigma σ_URE), das in der Integrity Support Message mitgeführt wird. Dies macht das Schutzniveau konservativer und normgerecht, und <b>ändert daher die PL-Werte, die bestehende Integritätsszenarien melden</b>. ISM/Szenario erhalten die Felder <c3/> <c4/> / <c5/>, sodass Eingaben, die sie nicht setzen, das bisherige Verhalten behalten. Siehe <c6/> für die wiederhergestellte Formel <c7/> und den ehrlichen Implementierungshinweis.

# text
seg-c408f8944ac6 = Konsistenz des Spoof-Monitors per χ².

# text
# c1: parity_raim_test
# c2: raim::chi2_quantile
seg-92e2b5c5458c = <c1/> verwendet jetzt den gemeinsamen Pfad des inversen χ² aus <c2/> und beseitigt damit eine zweite abweichende χ²-Implementierung, sodass RAIM und der Paritäts-Spoof-Monitor bei ihren Schwellen übereinstimmen.

# text
# c1: gravity-map-nav
# c2: kind=
seg-6d424034e500 = <b><c1/> an den CLI-Dispatcher angebunden.</b> Das Szenario war bisher nur über die API erreichbar; es wird jetzt wie jedes andere Szenario als <c2/> aufgerufen.

# text
# c1: tests/navego_imu_crossval.rs
# c2: navego_example_allan.m
# c3: ADEV(1 s) = σ·√dt
# c4: .mat
seg-815eda56aad9 = <b>NaveGo-Kreuzvalidierung der IMU-Rauschpipeline</b> (<c1/>). Eine externe Gegenprüfung mit NaveGo (der Open-Source-INS/GNSS-Toolbox von R. Gonzalez): Sie reproduziert den synthetischen Round-Trip von <c2/> auf dem veröffentlichten Referenzprofil des Microstrain 3DM-GX3-35 und bestätigt, dass unser überlappender ADEV-Schätzer die Koeffizienten des Geschwindigkeits- und Winkel-Random-Walk von NaveGo (<c3/>) auf unter { "5" }% genau wiedergewinnt, mit der erwarteten Steigung von −1/2 für weißes Rauschen. (Das { "40" } MB große aufgezeichnete STIM300-<c4/>-Log wird nicht eingelesen — durch das Binärformat blockiert.)

# text
seg-b67b3ec240de = Eng gekoppeltes (Pseudorange-)GNSS/INS-Update.

# text
# c1: GnssInsEkf::update_tightly_coupled
# c2: ClosedLoopInsGnss::fuse_tightly_coupled
# c3: tight_coupling
seg-c926dddc5256 = <c1/> (und der Wrapper <c2/>) implementieren die zuvor nur als Platzhalter vorhandene Messung im Entfernungsbereich: Die Innovation ist die vorhergesagte Entfernung von der INS-Position zu jedem Satelliten im Vergleich zur gemessenen Pseudorange, mit einer Line-of-Sight-Jacobi-Matrix auf den Positionsfehler. Da jeder Satellit eine skalare Messung ist, korrigiert das Filter weiter, auch mit <b>weniger als vier Satelliten</b> — wo ein lose gekoppelter PVT-Fix nicht existiert. Fünf Tests decken das Nullen mit vier Satelliten, die Korrektur mit zwei Satelliten (kein PVT möglich), die Beobachtbarkeit entlang der Sichtlinie mit einem einzelnen Satelliten und die Eingabevalidierung ab. Nur Pseudorange; Trägerphase und ein expliziter Empfängeruhr-Zustand bleiben Roadmap. Das ungenutzte Cargo-Feature <c3/> (das den alten Fehler-Platzhalter absicherte) wurde entfernt.

# text
# c1: kind = "gnss-ins"
# c2: src/fusion/pack.rs
# c3: closed_loop
# c4: gnss_ins_ekf
# c5: scenarios/gnss-ins.toml
seg-94ebfac3bbc3 = <b>Lose gekoppeltes GNSS/INS-Szenariopaket (<c1/>, <c2/>).</b> Verbindet den dreiachsigen Strapdown-Navigator und den Fehlerzustands-EKF mit 15 Zuständen (<c3/> / <c4/>) zu einem lauffähigen Szenario mit einer Gütekennzahl — der EKF diszipliniert die Mechanisierung mit verrauschten GNSS-Fixes, solange Abdeckung besteht, und überbrückt dann den Ausfall, wobei er den Truth-Snap-Reset des früheren skalaren 1-DOF-Pakets durch echte Fusion ersetzt. Das Ergebnis meldet die fusionierte Reihe des horizontalen Fehlers, die bewertete Positionsgütekennzahl (Verfügbarkeit / Ausfall-RMS / holdover) und den RMS der freilaufenden INS im offenen Regelkreis zum Vergleich; ein Quanten-/klassisches IMU-Paar unterscheidet sich nur im wahren Bias. Aufgerufen über den CLI-/Python-/wasm-Einstiegspunkt mit einem Beispiel <c5/>. Ehrliche Einordnung: nur lose gekoppelt, eine deterministische Trajektorie, und der fusionierte Ausfallfehler wird durch den Lagefehler bei der Übergabe nach unten begrenzt (daher wird nicht behauptet, dass er mit dem Bias skaliert) — die belastbaren Befunde sind, dass die Fusion die ungestützte Koppelnavigation bei einem Sensor mit Bias schlägt und dass ein Sensor mit geringerem Bias die bessere ungestützte Überbrückung hat.

# text
# c1: src/walker.rs
# c2: walker
# c3: i: T/P/F
# c4: pdop_sweep
# c5: {planes × sats × inclination}
# c6: coverage_revisit
# c7: gps-ops
seg-0a2df01f99d8 = <b>Konstellationsentwurf auf dem validierten SGP4-Kern (<c1/>).</b> Ein neues Modul <c2/> erzeugt ein entworfenes Walker-Delta-Muster (<c3/>) als SGP4-<b>Mittelelemente</b>, sodass die synthetische Konstellation über denselben SGP4-Pfad propagiert wird, der gegen die Vektoren von AIAA 2006-6753 auf { "4.12" } mm validiert wurde — nicht über den analytischen Kepler-Generator. Darauf aufbauend: <c4/> tabelliert Abdeckung und mittleren/schlechtesten PDOP über einem Entwurfsraster <c5/>, und <c6/> meldet den Abdeckungsanteil und die Revisit-Lücken (schlechteste/mittlere) an einem Bodenpunkt. Validiert anhand der physikalischen Monotonien, die ein Trade einhalten muss (mehr Satelliten ⇒ höhere Abdeckung, niedrigerer PDOP, kürzerer Revisit). Außerdem wird ein echter <b>Celestrak-<c7/>-TLE-Snapshot</b> (2021-07-28, { "30" } betriebsbereite GPS-Satelliten) als reine Test-Fixture hinzugefügt und der Pfad der realen Geometrie TLE → SGP4 → ECEF dagegen validiert (komplette MEO-Schale innerhalb von { "1" }%, neun Satelliten gleichzeitig sichtbar bei PDOP { "1.64" }), neben den bestehenden Realdaten-Pfaden für SP3 und RINEX.

# text
seg-9e051f3725df = Rauschtyp-spezifische effektive Freiheitsgrade für die Allan-Konfidenzintervalle.

# text
# c1: allan::edf_overlapping_adev
# c2: PowerLawNoise
# c3: classify_power_law
# c4: overlapping_adev_curve
# c5: AdevPoint
# c6: noise
# c7: edf
# c8: ci_lo
# c9: ci_hi
seg-2392bec8f0b6 = <c1/> implementiert die geschlossenen Formeln aus NIST SP { "1065" } Tabelle { "5" } (der einfache Satz von Stable32) für alle fünf kanonischen Potenzgesetz-Rauschtypen — weißes/Flicker-PM, weißes/Flicker-FM, Random-Walk-FM — und ersetzt damit die konservative Zählung ohne Überlappung als χ²-Freiheitsgrade. Ein neues Enum <c2/> und <c3/> bestimmen den dominanten Typ aus der Steigung der <b>modifizierten</b> Allan-Abweichung des Datensatzes (MDEV trennt weißes von Flicker-PM, wo ADEV es nicht kann), und <c4/> hängt nun an jeden Punkt der exportierten ADEV-Kurve den bestimmten Rauschtyp, seinen edf und ein { "95" }%-Konfidenzband an (<c5/> erhält <c6/>/<c7/>/<c8/>/<c9/>, additiv mit serde-Defaults). Auf zwei Wegen validiert: Die fünf Formeln stimmen mit von Hand ausgewerteten Werten auf { "1e-12" } überein, und ein Monte-Carlo-Ensemble mit { "4" } 000 Datensätzen mit weißem FM bestätigt, dass die Formel den tatsächlichen Chi-Quadrat-edf des Schätzers auf { "20" }% genau vorhersagt (und dass sie die konservative Zählung deutlich übertrifft). Acht neue Tests.

# text
seg-df59cc71120f = Stochastisches Modell für den Zwei-Wege-Zeitvergleich.

# text
# c1: timetransfer::TwoWayLink
# c2: (m_AB - m_BA)/2
# c3: two_way_offset_estimate
# c4: 1/sqrt(2)
# c5: ClockModel
# c6: sigma_y^2(tau) = q_rw*tau/3
# c7: LinkCfg
# c8: q_wf_s
# c9: q_rw_s
# c10: adev_tau0
# c11: timetransfer
# c12: tau/3
# c13: step()
# c14: q=0
seg-d2add1ce01e1 = <c1/> ersetzt den reinen White-Noise-Sampler durch ein physikalisch fundiertes Modell: Die reziproke (Gleichtakt-)Pfadverzögerung hebt sich in der Schätzung <c2/> auf (<c3/>, sodass zwei unabhängige Einweg-Messungen zu <c4/> mitteln), und das Residuum ist die <b>nicht reziproke</b> differenzielle Verzögerung — modelliert als farbiger Prozess aus weißem FM + Random-Walk-FM (das validierte <c5/>), was der Reihe des Synchronisationsfehlers eine realistische Allan-Signatur (<c6/>) statt flachen weißen Rauschens gibt. <c7/> erhält <c8/>/<c9/> (serde-Default { "0" } ⇒ das frühere Verhalten mit reinem White-Noise, bitgenau), die Link-Gütekennzahl meldet <c10/> (die Allan-Abweichung des Modells beim Basisschritt), und das Szenario bzw. die CLI <c11/> machen sie zugänglich. Golden-Gütekennzahl neu festgesetzt. Sechs von Hand hergeleitete Tests (Gleichtakt-Auslöschung, der sqrt({ "2" })-Zwei-Wege-Gewinn, das RWFM-Gesetz <c12/> über das <c13/> des Links selbst, Äquivalenz zum früheren Verhalten bei <c14/>, Determinismus und durchgängige Ausweisung der Gütekennzahl).

# text
seg-6c7a1dd63be0 = Numerische Übereinstimmung mit Stable32 für die Schätzer der Allan-Familie (NBS14).

# text
# c1: tests/allan_reference.rs
seg-adbb47ca87b4 = <c1/> validiert die Schätzer für überlappende ADEV, modifizierte ADEV, Zeitabweichung und überlappende Hadamard-Abweichung gegen die Stable32-Referenzabweichungen für den kanonischen Datensatz <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ca. S. 107) bei tau = { "1" }, { "2" } mit einer relativen Toleranz von { "1e-4" } — tatsächliche Übereinstimmung ca. { "1e-6" }. Das verankert die Schätzer-Mathematik an der De-facto-Referenzimplementierung und nicht nur an der eigenen analytischen Selbstkonsistenz der Schätzer. Es werden nur die öffentlichen Referenzzahlen verwendet; kein Code Dritter.

# text
# c1: integrity
# c2: integrity
# c3: IntegrityScenario
# c4: seed
seg-35b0c0644fa2 = <b>Vom Szenario <c1/> exportiertes vertikales Stanford-Integritätsdiagramm.</b> Die lauffähige Szenarioart <c2/> exportiert nun neben der HPL/VPL-Verfügbarkeitskarte ein vertikales Stanford(-ESA)-Diagramm: In jeder geschützten Epoche wird eine mit Seed reproduzierbare Ziehung eines fehlerfreien Entfernungsfehlers über die Geometrie auf einen tatsächlichen vertikalen Positionsfehler abgebildet und gegen die VPL und die vertikale Alarmgrenze klassifiziert (Available / System-Unavailable / Misleading / Hazardously-Misleading). Das Diagramm (Punkte je Epoche + Regionszähler) steht im Ergebnis-JSON, die Zähler für Integritätsereignisse / HMI in der CLI-Zusammenfassung, sodass der Stanford-Klassifikator — bisher nur als Bibliothek vorhanden — durchgängig erreichbar ist. <c3/> erhält ein Feld <c4/> (Default { "0" }), das die Fehlerrealisierung steuert; die Verfügbarkeitskarte selbst bleibt rein geometrisch und unabhängig vom Seed.

# text
seg-5d76a638ae77 = ARAIM-Integritätsrisiko-Budget (P_HMI) für die Schutzniveaus.

# text
# c1: raim::araim_raim
# c2: K_md
# c3: (prior, detection threshold, σ)
# c4: araim_protection_level
# c5: araim_integrity_risk
# c6: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c7: P_HMI
seg-449adb9ad6e6 = <c1/> leitet die horizontalen und vertikalen Schutzniveaus aus einem expliziten Integritätsrisiko-Budget statt aus einem festen Multiplikator <c2/> ab: Für die All-in-View-Lösung und jede Teillösung mit Ausschluss eines einzelnen Satelliten bildet es das <c3/> je Modus auf jeder Achse, dann löst <c4/> das kleinste PL, dessen summierte Wahrscheinlichkeit gefährlich irreführender Information (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) das zugewiesene <c7/> einhält. Das Ergebnis meldet das Integritätsrisiko, das die Niveaus tatsächlich erreichen, sodass man Integrität und Alarmgrenze explizit gegeneinander abwägen kann. Sechs von Hand hergeleitete Tests (geschlossene Formeln für fehlerfreien und schwellenbehafteten Einzelmodus, Mehrmodus-Summation/Monotonie, durchgängiger fehlerfreier Schutz, bei dem ein um 10⁵× engeres Budget das PL anhebt, Fehlererkennung/-identifikation und die Redundanzuntergrenze bei sechs Satelliten). Single-Fault-MHSS ist die ARAIM-Basislinie; gleichzeitige Fehler in mehreren SV-Teilmengen, der konstellationsweite Fehlermodus und die Validierung mit dem gLAB-Referenzdatensatz sind dokumentierte Erweiterungen.

# text
seg-3e33581644a5 = Zwei-Raten-Coning-/Sculling-Kompensation für die Strapdown-Mechanisierung.

# text
# c1: inertial::mechanization::coning_sculling_compensate
# c2: NavState::step_increments
# c3: ScalarErrorBudget
# c4: AccelModel
# c5: NavState
seg-c900e193ac29 = <c1/> faltet die hochratigen Coning-Terme (Lage) und Rotations-+Sculling-Terme (Geschwindigkeit) aus den geordneten IMU-Inkrementen der Teilintervalle eines groben Updates heraus, sodass ein <c2/> mit moderater Rate die durch Vibration gleichgerichtete Bewegung reproduziert, die ein grober Schritt über den rohen Summen verfehlt. Ein Validierungstest treibt eine Coning+Sculling-Umgebung mit { "10" } Hz über { "60" } s und vergleicht die Wahrheit bei feiner Rate, die naive grobe Integration und die gefaltete grobe Integration: Die Faltung senkt den Positionsfehler um ca. { "18" }× (von Metern naiver Drift auf unter einen Dezimeter) und bestätigt damit, dass die Coning-/Sculling-Terme tragend sind. Ein Typalias <c3/> benennt das frühere 1-DOF-<c4/> als das, was es ist, abgegrenzt vom dreiachsigen Navigator <c5/>.

# text
# c1: rinex_obs
# c2: parse_obs
# c3: SYS / # / OBS TYPES
# c4: C1C
# c5: L1C
seg-ceb037e7a6ea = <b>Parser für RINEX-Beobachtungsdateien.</b> Das neue Modul <c1/> liest die RINEX-3.0x- / { "4.00" }-<em>Beobachtungsdatei</em> — die tatsächlichen Messungen des Empfängers — und vervollständigt damit das RINEX-Paar neben dem bestehenden Parser für Navigationsnachrichten. <c2/> dekodiert den Header (Version/Typ, die Listen <c3/> je System mit Fortsetzungszeilen, genäherte Position, Intervall, Zeit der ersten Beobachtung) und die Datensätze je Satellit in jeder Epoche: Pseudorange, Trägerphase, Doppler und Signalstärke, adressiert über ihren RINEX-{ "3" }-Beobachtungscode (<c4/>, <c5/>, …) mit den Flags für Lock-Verlust (LLI) und Signalstärke (SSI), wobei ein leeres Feld als nicht vorhanden statt als null erhalten bleibt. Ehrlicher Umfang: Dies ist der <em>Einlese</em>-Pfad für das Standardformat (ein echtes Beobachtungslog von RTKLIB/gLAB/IGS-Station hinein, typisierte Messungen heraus), keine Positionierungs-Engine — hier gibt es keine Pseudorange-Lösung, kein PPP und kein RTK.

# text
# c1: oem
# c2: OemFile::from_propagators
# c3: OemFile::to_oem_string
# c4: CCSDS_OEM_VERS
# c5: CREATION_DATE
# c6: ORIGINATOR
# c7: META_START … META_STOP
# c8: OBJECT_NAME
# c9: OBJECT_ID
# c10: CENTER_NAME
# c11: REF_FRAME = TEME
# c12: TIME_SYSTEM = GPS
# c13: START_TIME
# c14: STOP_TIME
# c15: epoch X Y Z X_DOT Y_DOT Z_DOT
# c16: CREATION_DATE
seg-60efb0c44522 = <b>CCSDS-OEM-Writer (Orbit Ephemeris Message).</b> Das neue Modul <c1/> exportiert eine propagierte Konstellation als gültige CCSDS-502.0-B-OEM-{ "2.0" }-Nachricht — das KVN-Ephemeridenformat, das GMAT, Orekit, STK und die meisten Flugdynamik-Werkzeuge einlesen. <c2/> tastet den inertialen (TEME-)Zustand jedes Satelliten — Position <b>und</b> Geschwindigkeit, direkt aus dem Propagator ohne erdfeste Rotation, anders als beim SP3-Export — auf einem Zeitraster ab, und <c3/> serialisiert den Header <c4/>/<c5/>/ <c6/> plus ein Segment <c7/> je Satellit (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>), gefolgt von dessen Zeilen <c15/> (km, km/s). Das <c16/> wird vom Aufrufer geliefert, nie aus der Systemuhr genommen, sodass die Ausgabe über Läufe hinweg byteidentisch ist (der Reproduzierbarkeitsvertrag). Dies ist das Gegenstück für Raumfahrzeug-Ephemeriden zum GNSS-SP3-Export: Eine Kshana-Bahn kann nun in einem Standardformat an ein Flugdynamik-Werkzeug übergeben werden.

# text
seg-f8538db4a17c = Präzise SP3-Ephemeride als Propagationsquelle.

# text
# c1: Sp3File::interpolator
# c2: Sp3Interpolator
# c3: Propagator::Sp3Precise
seg-2cf2e224deb9 = <c1/> baut je Satellit einen <c2/>, der die Position zwischen den tabellierten SP3-Epochen mit einem Lagrange-Polynom 9. Ordnung füllt (übliche IGS-Praxis) und sie in das gemeinsame TEME-System dreht; verfügbar als <c3/>. Eine Präzisionsbahndatei eines IGS-/Analysezentrums kann nun dieselbe Pipeline für Geometrie, Sichtbarkeit und Integrität antreiben wie die Broadcast- und die analytischen Propagatoren. Validiert per Round-Trip: Eine in SP3 geschriebene und über den Interpolator wieder eingelesene Kepler-Bahn stimmt an den Stützstellen auf unter einen Meter und im Intervallinneren auf < { "100" } m mit dem Original überein. Die Uhreninterpolation folgt als Nächstes.

# text
# c1: glonass
# c2: parse_glonass_nav
# c3: R
# c4: J2
# c5: Propagator::Glonass
# c6: rinex
seg-8d50fd42f53c = <b>GLONASS-Broadcast-Ephemeride (vervollständigt die Multi-GNSS-RINEX-Navigation).</b> Neues Modul <c1/>: GLONASS sendet keine Kepler-Elemente, sondern einen erdfesten <b>Zustandsvektor</b> im PZ-90 (Position, Geschwindigkeit, lunisolare Beschleunigung). <c2/> liest die RINEX-{ "3" }-Datensätze <c3/>, und die Satellitenposition zu einem beliebigen Zeitpunkt ergibt sich durch <b>Runge-Kutta-Integration 4. Ordnung</b> der Bewegungsgleichungen aus dem GLONASS-ICD (zentrale Gravitation + <c4/> + Coriolis-/Zentrifugalterme der Erdrotation + die gesendete Beschleunigung). Verfügbar als <c5/>, sodass GLONASS-Satelliten neben den Kepler-Systemen durch die Pipeline für Konstellation/Sichtbarkeit/Integrität laufen; ein einzelner Konstellationsblock <c6/> kann nun GPS, Galileo, QZSS, BeiDou und GLONASS mischen.

# text
# c1: E
# c2: J
# c3: C
# c4: G
# c5: Propagator::Rinex
seg-8d88144e3726 = <b>Multi-GNSS-RINEX-Navigation (GPS, Galileo, QZSS, BeiDou).</b> Der RINEX-{ "3" }-Navigationsparser dekodiert nun Datensätze von Galileo (<c1/>), QZSS (<c2/>) und BeiDou (<c3/>, MEO/IGSO) neben GPS (<c4/>) — sie teilen dasselbe Kepler-Layout und denselben Nutzeralgorithmus —, jeweils ausgewertet mit eigener Gravitationskonstante und eigener Erdrotationsrate (Galileo/BeiDou μ, BeiDou Ω̇ₑ). Eine Datei mit gemischten Konstellationen liefert alle davon, die als <c5/> durch die Pipeline für Konstellation/Sichtbarkeit/Integrität laufen. Geostationäre BeiDou-Satelliten verwenden eine andere Koordinatenrotation und werden übersprungen, bis eine Referenz-Fixture zur Validierung vorliegt. Der Datensatz-Walker verwendet systemspezifische Zeilenzahlen und behebt damit einen latenten Fehler, bei dem vierzeilige GLONASS-/SBAS-Datensätze übersprungen wurden, als wären sie acht Zeilen lang. GLONASS (ein Zustandsvektormodell) folgt als Nächstes.

# text
# c1: sp3
# c2: parse_sp3
# c3: Sp3File
# c4: V
# c5: Sp3File::from_propagators
# c6: to_sp3_string
seg-91a6907acc8d = <b>Leser und Schreiber für präzise SP3-c/d-Ephemeriden.</b> Das neue Modul <c1/> parst SP3-Präzisionsbahndateien von IGS-/Analysezentren (<c2/>) — das nachbearbeitete ECEF-Positions-/Uhrenprodukt, das PPP-Engines (Ginan, RTKLIB, gLAB) als Referenz behandeln — in eine strukturierte <c3/> (Header, Epochenraster, Position je Satellit km→m, Uhr µs und Geschwindigkeit dm/s→m/s für <c4/>-Produkte) und bewahrt dabei die SP3-Platzhalter für ungültige Werte. Auch die Gegenrichtung ist abgedeckt: <c5/> baut aus einer propagierten Konstellation ein SP3 (TEME→ECEF je Epoche), und <c6/> serialisiert es, sodass Kshana-Bahnen in dem Format exportiert werden können, das externe PPP-Werkzeuge einlesen — der Round-Trip Lesen↔Schreiben. Epocheninterpolation und eine SP3-Propagatorquelle folgen als Nächstes.

# text
# c1: rinex
# c2: tle
# c3: scenarios/orbit-rinex.toml
seg-7d51d1b6f39f = <b>RINEX-Broadcast-Ephemeride als lauffähige Konstellationsquelle.</b> Eine Konstellation akzeptiert nun einen Inline-Block <c1/> (RINEX-{ "3" }-GPS-Navigationstext) neben der bestehenden Option <c2/>, sodass eine echte Broadcast-Datei ein Szenario durchgängig über die CLI, Python oder den Playground im Browser antreibt — RINEX hinein, PNT-Geometrie heraus. Das neue <c3/> demonstriert GNSS-Verfügbarkeit und DOP für acht GPS-Satelliten, die direkt aus Broadcast-Datensätzen aufgebaut werden. (Nur GPS LNAV; Multi-GNSS und SP3 folgen als Nächstes.)

# text
# c1: RinexEphemeris
# c2: orbit::Propagator
# c3: Propagator::Rinex
# c4: sv_position_teme
seg-9730835bfc64 = <b>RINEX-Broadcast-Ephemeride als Propagationsquelle.</b> Eine geparste <c1/> lässt sich nun in einen <c2/> (<c3/>) umwandeln: Die Position ist die Broadcast-Bahn nach IS-GPS-200, von ECEF in das gemeinsame inertiale TEME-System gedreht (<c4/>, mit schaltsekundenkorrekter Zeit GPS→UT1), die Geschwindigkeit per zentraler finiter Differenz und die Kepler-Umlaufzeit. Echte GPS-Broadcast-Daten können nun dieselbe Pipeline für Geometrie, Sichtbarkeit und Integrität (RAIM) antreiben wie die analytischen SGP4-/Kepler-Propagatoren. (Noch nicht als Szenarioart für RINEX-Dateien verfügbar — das und Multi-GNSS/SP3 folgen als Nächstes.)

# text
seg-a355e3e52ec3 = <b>Archiv-DOI.</b> Releases werden nun bei Zenodo hinterlegt und erhalten eine zitierfähige DOI.

# text
seg-c6e4556e1ce5 = <b>Dokumentation.</b> Das README wurde auf institutionelles Niveau überarbeitet: ein Überblick über die Fähigkeiten des gesamten Stacks { "v0.9.0" }, ein Abschnitt zu Versionierung & Releases, ein aufgeräumter Header mit dem neuen Zeichen und eine knappe Statuszeile. Keine Änderungen an der Engine.

# text
# c1: integrity
seg-1bfc4e965d2b = Dieses Release fügt auf dem SGP4-Unterbau von { "0.8.0" } drei umfangreiche Fähigkeitsbereiche hinzu: ein echtes dreiachsiges Strapdown-INS, einen lose gekoppelten GNSS/INS-Fehlerzustands-EKF mit Closed-Loop-Rückführung, echtes Snapshot- und Solution-Separation-RAIM (im Stil von ARAIM) mit HPL/VPL und einem lauffähigen Szenario <c1/>, sowie den ersten Schritt zur Interoperabilität mit GNSS-Formaten (Einlesen der RINEX-3-GPS-Ephemeride).

# text
# c1: src/rinex.rs
# c2: parse_nav
# c3: G
# c4: BROADCAST ORBIT
# c5: RinexEphemeris
# c6: D
# c7: parse_d
# c8: D
seg-7fa2f68d436a = <b>Parser für die RINEX-{ "3" }-GPS-Navigationsnachricht (<c1/>).</b> Erster Schritt zur Interoperabilität mit GNSS-Formaten: <c2/> liest eine RINEX-{ "3" }.x-Navigationsdatei und dekodiert jeden GPS-Broadcast-Ephemeridendatensatz (<c3/>) — den achtzeiligen Block SV/Epoche + <c4/> — in eine <c5/> aus Kepler-Elementen und Uhrenkorrekturen, mit Feldnamen und Einheiten nach IS-GPS-200. Behandelt das Fortran-Gleitkommaformat mit <c6/>-Exponent (<c7/>) und das Spaltenlayout fester Breite; Datensätze für Nicht-GPS-Systeme werden übersprungen, nicht abgelehnt, sodass eine gemischte Datei weiterhin ihre GPS-Ephemeriden liefert. Vier Tests: Parsen des <c8/>-Exponenten (einschließlich Leerfeldern und Fehlern), ein vollständiger Datensatz, dekodiert gegen bekannte Feldwerte mit einer Plausibilitätsprüfung der GPS-Halbachse (√A² ≈ { "26 560" } km), das Überspringen von Nicht-GPS-Systemen und der Fall der leeren Datei.

# text
# c1: src/rinex.rs
seg-9c4a068f204c = GPS-Broadcast-Ephemeride → ECEF-Position (<c1/>).

# text
# c1: RinexEphemeris::sv_position_ecef(t_tow)
# c2: μ
# c3: Ω̇ₑ
# c4: tk
seg-5deeec4b8cc9 = <c1/> wertet die erdfeste Position des Satelliten aus der geparsten Ephemeride über den Nutzeralgorithmus nach IS-GPS-200 §{ "20.3.3.4.3.1" } aus: Newton-Lösung der Kepler-Gleichung für die exzentrische Anomalie, die Korrekturen zweiter Harmonischer für Argument der Breite / Radius / Inklination und die Drehung nach ECEF unter Berücksichtigung der Erdrotation seit der Referenzepoche (mit dem von der Spezifikation vorgeschriebenen GPS-<c2/> und -<c3/> sowie einer Faltung <c4/> beim Wochenüberlauf). Drei Tests: Der geozentrische Radius bleibt im GPS-Bereich (≈ { "26 560" } km), die erdfeste Geschwindigkeit beträgt ca. { "3.9" } km/s, und die Auswertung genau eine Woche entfernt reproduziert dieselbe Position.

# text
# c1: src/rinex.rs
seg-583433389a70 = GPS-SV-Uhrenversatz mit der relativistischen Korrektur (<c1/>).

# text
# c1: RinexEphemeris::sv_clock_bias_s(t_tow)
# c2: af0 + af1·Δt + af2·Δt²
# c3: Toc
# c4: F·e·√A·sin Ek
# c5: EpochUtc::gps_time_of_week
# c6: TGD
# c7: Propagator
# c8: docs/CAPABILITY.md
seg-957588ed5dff = <c1/> wertet das Broadcast-Uhrenpolynom <c2/> um <c3/> aus, plus den relativistischen Exzentrizitätsterm <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Ein neues <c5/> wandelt die Kalenderepoche des Datensatzes per Julianischer-Tage-Arithmetik ab der GPS-Epoche (1980-01-06) in die GPS-Wochensekunde um, und die Kepler-Lösung wird mit der Positionsauswertung geteilt. Tests: GPS-Wochensekunde für einen Sonntag/Dienstag/Samstag (Wochengrenzen), und der Uhrenversatz, der von af0 dominiert wird und einen vorhandenen, begrenzten relativistischen Term enthält. Die L1-Gruppenlaufzeit <c6/> wird bereitgestellt, aber bewusst nicht einbezogen. Ehrlicher Umfang: Eine <c7/>-Quelle, Galileo/BeiDou/GLONASS und SP3 bleiben nächste Schritte. (<c8/> wurde entsprechend angepasst.)

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: kind = "integrity"
# c4: IntegrityScenario
# c5: (sigma, P_fa, P_md, AL_H, AL_V)
# c6: constellation_raim_availability
# c7: kshana scenarios/integrity-raim.toml
seg-ef971feff16c = <b>Vom Nutzer ausführbare Szenarioart <c1/> (<c2/>).</b> Die RAIM-Verfügbarkeitsfähigkeit ist nun wie jedes andere Paket über CLI/TOML erreichbar: <c3/> parst ein <c4/> (Nutzerbahn, eine oder mehrere GNSS-Konstellationen, Elevationsmaske und die Integritätskonfiguration <c5/>), führt <c6/> aus und gibt die HPL/VPL-Verfügbarkeitskarte je Epoche als JSON aus, plus ein eigenständiges SVG — Schutzniveaus über die Zeit gegen die Alarmgrenzen, mit einem grün/roten Verfügbarkeitsstreifen. <c7/> schreibt das JSON, die Grafik und einen HTML-Bericht. Das mitgelieferte Szenario (24-Satelliten-Walker, Zweifrequenz-Entfernungsmessung mit { "1" } m, APV-I-Grenzen) meldet ca. { "95" } % Verfügbarkeit; es dokumentiert, dass Einfrequenz-RAIM die vertikale APV-I-Grenze mit einer Konstellation nicht erfüllt, weshalb die vertikale Führung SBAS/Zweifrequenz/ARAIM nutzt. Die Tests decken den Aufruf, das JSON der Verfügbarkeitskarte und das SVG ab.

# text
# c1: src/raim.rs
# c2: constellation_raim_availability
# c3: Propagator
# c4: serde
# c5: RaimAvailabilityReport
# c6: n_visible
# c7: available
# c8: RaimConfig
# c9: (sigma, P_fa, P_md, AL_H, AL_V)
# c10: raim_availability_epoch
# c11: None
seg-bbe5721c1785 = <b>Lauffähige RAIM-Verfügbarkeit über eine Konstellation (<c1/>).</b> Das Integritätsmodul hatte keinen Aufrufer — <c2/> macht es zu einem echten durchgängigen Einstiegspunkt: In jeder Epoche eines Zeitrasters propagiert es die sichtbaren Satelliten (dieselben SGP4-/Kepler-<c3/> wie in der Engine), berechnet die fehlerfreien Schutzniveaus und beurteilt die Verfügbarkeit gegen die horizontalen/vertikalen Alarmgrenzen und liefert einen mit <c4/> serialisierbaren <c5/> zurück (je Epoche <c6/>/HPL/VPL/<c7/> plus den Verfügbarkeitsanteil). Ein <c8/> bündelt <c9/>, und das <c10/> je Epoche wird für Aufrufer bereitgestellt, die ihre eigene Geometrie auflösen. Drei Tests: eine Epoche, die unter APV-I-Grenzen bei einer Geometrie mit zehn Satelliten als verfügbar beurteilt wird, durch eine unmöglich enge Grenze nicht verfügbar wird, und <c11/>-Niveaus unter fünf Satelliten; sowie ein durchgängiger Lauf über eine 24-Satelliten-Walker-Konstellation, der eine endliche Verfügbarkeitskarte ergibt und sich serialisieren lässt. (Sechs Satelliten — die Redundanzuntergrenze des Residuen-RAIM — erfüllen APV-I ehrlicherweise selbst bei { "1" } m Entfernungsmessung <em>nicht</em>; für die APV-I-Verfügbarkeit braucht es die dichtere Geometrie, die der Test verwendet.)

# text
# c1: src/raim.rs
# c2: y = x
# c3: Available
# c4: SystemUnavailable
# c5: MisleadingInformation
# c6: HazardouslyMisleadingInformation
# c7: classify_stanford
# c8: StanfordDiagram
# c9: (error, PL)
# c10: serde
# c11: error == PL
seg-91e32e587cb6 = <b>Akkumulator für das Stanford(-ESA)-Integritätsdiagramm (<c1/>).</b> Die Standardmethode, einen Integritätsmonitor über viele Epochen zusammenzufassen: Er trägt den tatsächlichen Positionsfehler (x) gegen das Schutzniveau (y) auf und klassifiziert jede Epoche anhand der Diagonale <c2/> und der Alarmgrenze als <c3/> (PL begrenzt den Fehler, innerhalb AL), <c4/> (PL begrenzt den Fehler, überschreitet aber AL — sicher, nicht nutzbar), <c5/> (PL < Fehler ≤ AL) oder <c6/> (PL < Fehler und Fehler > AL — das unsichere Versagen). <c7/> ist der reine Klassifikator; <c8/> akkumuliert Punkte <c9/> gegen eine feste Alarmgrenze und legt Regionszähler, Verfügbarkeit, Summen der Integritätsereignisse sowie mit <c10/> serialisierbare Punkte für Plot/JSON-Export offen. Vier Tests: jede Region (einschließlich der Grenze <c11/> als begrenzt), Akkumulation von Zählern/Verfügbarkeit und JSON-Round-Trip. Dies ist die Berichtsoberfläche für die RAIM-Schutzniveaus; die Einbindung in das Konstellationsszenario und die Validierung gegen einen öffentlichen Datensatz bleiben Roadmap-Punkte.

# text
# c1: src/raim.rs
# c2: snapshot_raim
# c3: Δ_k = x_k − x₀
# c4: Cov(x_k) − Cov(x₀)
# c5: PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])
# c6: K_fa = Φ⁻¹(1−P_fa/2)
# c7: K_md = Φ⁻¹(1−P_md)
# c8: normal_cdf
# c9: normal_quantile
# c10: erf(x) = P(½,x²)
# c11: excluded_sv == 2
seg-cdeb3a5a4acf = <b>RAIM mit Solution Separation (im Stil von ARAIM) (<c1/>).</b> Ein Integritätsmonitor mit Mehrfachhypothesen neben dem bestehenden Residuen-/Paritäts-Chi-Quadrat-<c2/>. Für die All-in-View-Kleinste-Quadrate-Lösung und jede Teillösung mit Ausschluss eines einzelnen Satelliten bildet er die Separation <c3/> — mittelwertfrei gaußverteilt ohne Fehler, mit der Kovarianz <c4/> (die Identität genesteter Schätzer, gültig, weil die All-in-View-Lösung BLUE ist) — und so <b>erkennt</b> er sowohl einen Fehler als auch <b>identifiziert</b> den fehlerhaften Satelliten (jenen, dessen Ausschluss die größte normierte Separation ergibt). Die horizontalen/vertikalen Schutzniveaus folgen der Standard-MHSS-Zuteilung <c5/>, mit <c6/>, <c7/>. Neue abhängigkeitsfreie <c8/>/<c9/>, aufgebaut auf der bereits im Modul vorhandenen regularisierten unvollständigen Gammafunktion (<c10/>). Vier von Hand hergeleitete Tests: Normalverteilungs-CDF / Quantil gegen Lehrbuchwerte (Φ({ "1.95996" })={ "0.975" }, der { "1e-7" }-Rand = { "5.1993" }, Symmetrie); eine fehlerfreie Geometrie, die keinen Alarm auslöst und endliche, positive HPL/VPL ergibt; ein Bias von 60 σ auf einem einzelnen Satelliten, der erkannt <em>und</em> korrekt identifiziert wird (<c11/>); und die Redundanzuntergrenze bei sechs Satelliten. Schließt auf Algorithmusseite die P0-Lücke des Audits „tautologische Integrität — kein echtes RAIM/HPL/VPL"; die Validierung mit dem gLAB-Datensatz und der Stanford-Diagramm-Akkumulator bleiben Roadmap-Punkte.

# text
# c1: src/fusion/closed_loop.rs
seg-67e771fc0a48 = Closed-Loop-GNSS/INS-Integration (<c1/>).

# text
# c1: ClosedLoopInsGnss
# c2: mechanization::radii_of_curvature
# c3: NavState::omega_ie_n
# c4: omega_en_n
seg-5aa467783b99 = <c1/> verbindet den Fehlerzustands-EKF-Kern mit der dreiachsigen Strapdown-Mechanisierung: Jede IMU-Probe wird mit den laufenden Bias-Schätzungen korrigiert, vorwärts mechanisiert, und die EKF-Kovarianz wird mit dem passenden Navigationskontext zeitlich propagiert; jeder GNSS-Positions-/Geschwindigkeits-Fix bildet die INS−GNSS-Innovation und führt die geschätzten <b>Position, Geschwindigkeit, Lagefehler (ψ, als Quaternionen-Rotation) und Beschleunigungs-/Gyro-Biases</b> in die Lösung zurück und setzt den Mittelwert des Fehlerzustands zurück. Die Rückführung der Lage (nicht nur der Biases) ist für die Stabilität erforderlich — die Neigung und der Beschleunigungs-Bias sind ein gekoppeltes Paar, sodass die Korrektur des einen ohne den anderen divergiert. INS und GNSS werden in einem lokalen NED-Tangentialebenen-System verglichen, unter Verwendung der eigenen Krümmungsradien der Mechanisierung (neu <c2/>; <c3/>/<c4/> offengelegt). Dies ist der ehrliche Ersatz für den <em>Truth-Snap-Reset</em> des Hybridpakets. Drei Tests: ein Closed Loop, der einen eingespeisten Positionsfehler von { "8" } m / −{ "5" } m auf <{ "0.1" } m nullt; eine gestützte Lösung, die auf einer Fahrtrajektorie meterbegrenzt bleibt (<{ "6" } m), während eine freilaufende INS über { "100" } m hinaus divergiert; und der Meilenstein-Benchmark — der <b>Monte-Carlo-Positions-RMS der fusionierten Lösung über einen GNSS-Ausfall von { "60" } s schlägt einen ungestützten Koppelnavigator im offenen Regelkreis um >{ "2" }× (≈{ "4" }× über alle Seeds)</b>. Im Modul dokumentierte ehrliche Einschränkung: Im lose gekoppelten Modus sind Beschleunigungs-Bias und Neigung nur schwach trennbar (beide koppeln über die Schwerkraft), sodass der gelieferte Wert der begrenzte, korrigierte Zustand und ein sauberer Eintritt in den Ausfall ist — keine präzise inertiale Kalibrierung; reichhaltigere Dynamik und die eng gekoppelte Erweiterung bleiben Roadmap-Punkte.

# text
# c1: src/fusion/gnss_ins_ekf.rs
# c2: δx = [δp, δv, ψ, b_a, b_g]
# c3: Φ = I + F·dt
# c4: H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]
# c5: tight_coupling
# c6: P/(P+R)
seg-aa9bf0ff6f84 = <b>Kern des lose gekoppelten GNSS/INS-Fehlerzustands-EKF (<c1/>).</b> Ein erweitertes Kalman-Filter mit 15 Fehlerzuständen — <c2/> — mit der Strapdown-Fehlerdynamik nach Groves { "2013" } §{ "14.2" } (Kopplung von spezifischer Kraft und Neigung, Coriolis, Projektion des Bias vom Körper- ins Navigationssystem, Gauß-Markov-Bias-Modelle), einem diskreten Übergang erster Ordnung <c3/> und einem lose gekoppelten Messupdate für Position+Geschwindigkeit (<c4/>) in Joseph-Form. Abhängigkeitsfreie dichte lineare Algebra (Gauß-Jordan-Inverse, Joseph-Kovarianzupdate). Ein Cargo-Feature <c5/> sichert ein dokumentiertes, noch nicht implementiertes Pseudorange-/Doppler-Update ab. { "7" } Tests mit von Hand hergeleiteten Erwartungen: die Skew-/Kreuzprodukt-Identität, eine verifizierte { "3" }×{ "3" }-Inverse, eine Kovarianz, die unter Prädiktion symmetrisch/PSD bleibt (und eine ungestützt wachsende Positionsunsicherheit), ein Positions-Fix, der die Positionskovarianz verkleinert, die exakte Wiedergewinnung eines bekannten Positionsfehlers beim analytischen Kalman-Gain <c6/> und kleinere Korrekturen bei größerem Messrauschen. Dies ist der Kern, der den Open-Loop-Truth-Snap-Reset des Hybridpakets durch Closed-Loop-Rückführung ersetzen wird (Paketanbindung + NaveGo-Validierung folgen).

# text
# c1: coning_increment
# c2: ½ Δθ_prev × Δθ_cur
# c3: sculling_increment
# c4: ½ Δθ × Δv
# c5: NavState::step_increments
# c6: Δθ_rel = Δθ_b − C_n^b ζ
seg-f57bc89d4688 = <b>Coning- und Sculling-Kompensation für den Strapdown-Integrator.</b> Der Lagepfad erhält das Zwei-Proben-<c1/> (<c2/>); eine Integration mit grober Rate ({ "30" } Hz, 5 Proben/Zyklus) einer Coning-Umgebung mit { "5" } Hz folgt nachweislich der Wahrheit bei feiner Rate mit der Korrektur um ≥ { "3" }× besser als naives Aufsummieren der Inkremente. Der Geschwindigkeitspfad erhält <c3/> (<c4/>, Groves Gl. { "5.82" }) und löst das Geschwindigkeitsinkrement im Körpersystem über ein neues inkrementbasiertes Update <c5/> mit der körperrelativen Rotation <c6/> auf, sodass eine erdfeste Plattform kein falsches Sculling erfährt, während eine echte Vibration den vollen Term auslöst.

# text
# c1: src/inertial/mechanization.rs
seg-56c599250ed4 = Vollständige dreiachsige Strapdown-Mechanisierung im NED-System (<c1/>).

# text
# c1: NavState { q, v_ned, p_llh }
# c2: step(gyro_b, accel_f_b, dt)
# c3: ω_in = ω_ie + ω_en
# c4: v̇ = f_n − (2 ω_ie + ω_en) × v + g_n
# c5: v_N ≈ a·t
# c6: ½ a t²
seg-d0897492e89b = <c1/> wird mit <c2/> nach den üblichen NED-Gleichungen im erdfesten System fortgeschrieben (Groves §{ "5.4" }): Die Lage Körper→NED wird um die Rate vom inertialen zum Navigationssystem <c3/> (Erdrotation + Transportrate) korrigiert; die spezifische Kraft wird über die DCM von Körper→NED aufgelöst; die Geschwindigkeit integriert <c4/> (Coriolis/Transport + Schwerkraft); und die geodätische Position ergibt sich über die Meridian-/Quer-Krümmungsradien. Die Schwerkraft ist die geschlossene WGS-84-Somigliana-<b>Normalschwere (Lotschwere)</b> mit einer Freiluft-Höhenkorrektur nach NIMA — nie eine fest eincodierte Konstante. Dies ist der echte dreiachsige Navigator, der den skalaren 1-DOF-Fehlerbudgetpfad ablöst. Verifiziert durch physikalische Invarianten: Eine an die rotierende Erde geschraubte Plattform bei { "45" }°N (die Erdrate + { "1" } g erfasst) bleibt über { "60" } s innerhalb von { "1" } mm; eine horizontale spezifische Kraft nach Norden ergibt <c5/> und eine Verschiebung <c6/>; die Normalschwere entspricht den bekannten Oberflächenwerten am Äquator, am Pol und bei 45° sowie dem Freiluft-Gradienten.

# text
# c1: src/frames.rs
seg-5e6e5bba25a5 = Geodätisch korrekte Sichtbarkeit von Bodenstationen (<c1/>).

# text
# c1: elevation
# c2: is_visible
# c3: visible_count
seg-69bdb1e5bfc8 = <c1/>, <c2/> und <c3/> berechnen die Elevation eines Satelliten über dem Horizont einer Bodenstation gegen die <b>Normale des WGS-84-Ellipsoids</b> (die wahre lokale Vertikale), nicht gegen die geozentrische Radialrichtung — beide unterscheiden sich um bis zu die geodätische Lotabweichung von ca. { "0.19" }°, genug, um Satelliten nahe dem Horizont in eine Elevationsmaske hinein- oder aus ihr herauszuschieben. Durchgängig verifiziert (eine Walker-Konstellation propagiert, von TEME nach ECEF gedreht und von einem geodätischen Standort aus gezählt) sowie gegen die geozentrische Näherung.

# text
# c1: test-python-bindings
# c2: PyO3/maturin-action
# c3: maturin build
# c4: rustfmt-preview
# c5: cargo-fmt
# c6: deny
# c7: cargo-deny
# c8: taiki-e/install-action
# c9: cargo-deny-action
seg-4de1d79d2e76 = <b>CI-Zuverlässigkeit.</b> Der Job <c1/> baut das Wheel nun mit <c2/> (manylinux-Container) statt mit einem rohen <c3/> auf dem Host und beseitigt damit einen sporadischen rustup-Konflikt zwischen <c4/>/<c5/> auf dem Runner-Image. Der Job <c6/> installiert <c7/> als vorgebaute Binärdatei über <c8/> statt über die Docker-basierte <c9/> und beseitigt damit einen Timeout beim Pull aus der Docker-Hub-Registry. Keine der Änderungen wirkt sich auf die durchgeführten Prüfungen aus.

# text
seg-05055c993904 = Die inertiale Geschwindigkeit wird an nachgelagerte Stellen weitergegeben.

# text
# c1: Propagator::velocity_eci
# c2: Propagator::state_eci
# c3: StateEci { r_m, v_m_s }
# c4: Orbit::velocity_eci
seg-1228235c99b6 = <c1/> und <c2/> (liefert <c3/>) reichen die analytische TEME-Geschwindigkeit, die SGP4 ohnehin berechnet — bisher verworfen — in m/s an die Aufrufer durch; <c4/> gibt dem Kepler-Pfad eine konsistente Geschwindigkeit. Der Verifikationstest nach AIAA 2006-6753 prüft nun für jede Referenzzeile auch die Geschwindigkeit (schlechtester Geschwindigkeitsfehler { "1.85e-9" } km/s über alle { "666" } Zustände) und legt die Zahl der verglichenen Zeilen exakt auf { "666" } fest.

# text
# c1: ParseOpts { strict_checksum }
# c2: parse_propagators_opts
# c3: strict_checksum
# c4: ConstellationCfg
seg-8ac2598291b8 = <b>Strengeres, panikfreies TLE-Parsen.</b> Zeilen müssen ASCII sein und werden sicher zerteilt (keine Panics durch Byte-Indizes mehr bei Mehrbyte-Eingaben); Elemente werden auf Wertebereiche geprüft (Inklination, Exzentrizität, mittlere Bewegung); die Prüfsumme in Spalte 69 kann über <c1/> / <c2/> und das neue Flag <c3/> in <c4/> erzwungen werden (standardmäßig nachsichtig).

# text
# c1: adev_curve
# c2: [{tau_s, adev, n_samples}]
seg-1cd2c6621a04 = <b>Allan-Abweichungskurve in der Ausgabe.</b> Jeder Uhrenlauf meldet nun eine <c1/> (<c2/>), und der Browser-Playground stellt ein doppelt logarithmisches Diagramm „Uhrenstabilität (ADEV)“ dar.

# text
seg-c76ff20811e7 = Validierung der Eingabe des Zeitrasters.

# text
# c1: TimeCfg::validate
# c2: MAX_TIME_STEPS
seg-75436d067802 = <c1/> weist ein nicht endliches, null, negatives oder überdimensioniertes Zeitraster zurück (einen Schritt größer als die Dauer oder mehr als <c2/> Proben), bevor irgendetwas allokiert wird, sodass ein fehlerhaftes Szenario einen Fehler zurückgibt, statt zu paniken oder den Speicher zu erschöpfen.

# text
seg-d0a8ce50cf6e = Monte-Carlo-Ensembles für das Inertialpaket.

# text
# c1: web/share.test.mjs
seg-2967872bfca1 = <b>Geführter Playground-Modus.</b> Der Browser-Playground wirft Sie nicht mehr auf eine rohe TOML-Wand: Ein Streifen „Hier starten“ mit Szenariokarten für einen Klick lädt und führt ein durchgerechnetes Beispiel aus, Schieberegler legen die allgemeinen Stellgrößen (Seed, Zeitgebungsschwelle) offen, ohne das TOML anzufassen, ein Hinweis „So lesen Sie das“ erklärt das Ergebnis, und das vollständige TOML ist nur einen Klick zum Einklappen entfernt. Jeder Lauf ist teilbar — <b>Freigabelink kopieren</b> kodiert das gesamte Szenario in das URL-Fragment (nichts wird hochgeladen), sodass ein Link beim Laden genau denselben Lauf reproduziert. Der Codec ist per Unit-Test geprüft (<c1/>, läuft in der CI).

# text
# c1: src/sweep.rs
seg-2e47e8864718 = N-dimensionale Parameter-Sweeps (<c1/>).

# text
# c1: nd_sweep
# c2: SweepAxis
seg-5076a9ad20d7 = <c1/> wertet eine Kennzahl über das gesamte kartesische Produkt mehrerer Bereiche <c2/> aus (die Trade-Studie mit mehreren Parametern), in zeilenweiser Reihenfolge, deterministisch. Additiv — die bestehende 1-D-Sweep-API bleibt unverändert. Bootstrap-Konfidenzintervalle je Knoten und die Verallgemeinerung über das Uhrenpaket hinaus bleiben auf der Roadmap.

# text
# c1: src/raim.rs
seg-958718831037 = <b>Echtes Snapshot-RAIM (<c1/>).</b> Echtes Receiver Autonomous Integrity Monitoring im Positionsbereich: Es baut die Sichtlinien-Geometrie zu den sichtbaren Satelliten auf, bildet die Kleinste-Quadrate-Lösung und die Residuen, führt einen χ²-Residuentest zur Fehlererkennung aus (exakte Schwelle aus einem abhängigkeitsfreien unvollständigen-Gamma-χ²/nichtzentralen-χ²) und berechnet steigungsbasierte horizontale und vertikale Schutzniveaus (HPL/VPL) mit dem für die konfigurierten P_fa/P_md hergeleiteten Bias bei verpasster Erkennung. Dies ist verschieden von der Integritätskennzahl der Filter-Selbstkonsistenz in der Szenario-Pipeline — und noch <b>nicht an sie angebunden</b>; Fehlerausschluss, Budgetierung von Alarmgrenze/P_HMI und ARAIM bleiben auf der Roadmap.

# text
# c1: src/allan.rs
# c2: TDEV = tau/sqrt(3) * MDEV
# c3: deviation_ci
seg-1675540acbd9 = <b>Suite zur Frequenzstabilität: MDEV, TDEV, HDEV + Konfidenzintervalle</b> (<c1/>). Neben der überlappenden ADEV: die modifizierte Allan-Abweichung (trennt weißes von Flicker-Phasenrauschen), die Zeitabweichung (<c2/>) und die Hadamard-Abweichung (unterdrückt linearen Frequenzdrift exakt und konvergiert für divergente Rotrausch-Typen). χ²-basierte Konfidenzintervalle (<c3/>) verwenden ein abhängigkeitsfreies Paar von Normal-/χ²-Quantilen (Acklam + Wilson-Hilferty) mit einem konservativen edf ohne Überlappung; rauschtyp-spezifische edf und numerische Übereinstimmung mit Stable32 bleiben auf der Roadmap.

# text
# c1: src/frames.rs
seg-446a9ed4467c = <b>Reduktion zwischen Bezugssystemen (<c1/>).</b> GMST-basierte Rotation TEME↔ECEF (mit derselben Sternzeit nach IAU-1982 wie der Propagator), exaktes geodätisch↔ECEF nach WGS-84 mit einer iterativen Umkehrung mit Bowring-Startwert (Maschinengenauigkeit in allen Höhen, einschließlich MEO/GEO) und ein geodätischer Bodenstations-Beobachter, der Azimut / Elevation / Entfernung im lokalen East-North-Up-System liefert. Polbewegung und Nutation unterhalb einer Bogensekunde werden nicht angewandt (nur GMST, unterhalb eines Kilometers auf der Bodenspur); eine ITRF-präzise CIO-Kette steht auf der Roadmap.

# text
# c1: src/timescales.rs
# c2: f64
seg-9f6f53583cf5 = <b>Grundlage für Zeitskalen (<c1/>).</b> Eine abhängigkeitsfreie Julianisches-Datum-API (Gregorianisch zivil ↔ JD, MJD), die vollständige ganzzahlige IERS-Schaltsekunden-Historie (UTC↔TAI, { "10" } s im Jahr { "1972" } bis { "37" } s seit { "2017" }), der definierte Offset TAI→TT, die UT1-Korrektur über ein bereitgestelltes DUT1 und der Erdrotationswinkel nach IAU-2000. Dies ist das Zeitfundament, auf dem die (geplante) Reduktion ins erdfeste System aufsetzt. Zeitpunkte sind Julianische Daten als einzelnes <c2/> (ca. { "50" } µs Auflösung nahe der heutigen Epoche; ein zweiteiliges JD steht auf der Roadmap), und die Ära der Gummisekunden vor 1972 wird nicht modelliert — beides ist im Modul dokumentiert.

# text
# c1: scripts/gen-sbom.sh
# c2: libm
# c3: docs/REPRODUCIBILITY.md
seg-6ecc053f101f = <b>Reproduzierbarkeit & Herkunft.</b> Ein deterministischer CycloneDX-SBOM-Generator (<c1/>) und eine SLSA-Build-Provenance-Attestierung für die Release-Binärdatei und das SBOM; die Release-Toolchain ist passend zur CI festgelegt. Determinismus-Garantien, der plattformübergreifende Vorbehalt zu <c2/> und der Ansatz des Festsetzens von Golden-Werten sind in <c3/> dokumentiert.

# text
# c1: tests/property.rs
# c2: TimeCfg::validate
seg-3e98dcdcb82b = <b>Eigenschaftsbasierte und Fuzz-Tests</b> (<c1/>). Deterministische Zufallstests (keine neue Abhängigkeit) prüfen Invarianten über Tausende von Eingaben: Die TLE- und Szenario-Parser paniken nie bei Müll, Nicht-ASCII, mutierter oder abgeschnittener Eingabe; <c2/> paniert nie bei NaN/inf/negativen Rastern; die TLE-Prüfsumme ist konsistent und nur auf Spalte 69 bezogen; geodätisch↔ECEF-Round-Trips und die Rotation TEME→ECEF erhalten die Norm über den ganzen Globus und ein weites Höhenband.

# text
# c1: libm
seg-ea252b5d7427 = Golden-Tests <b>legen die Gütekennzahlen nun feldweise fest</b> für die vier Referenzszenarien (mit einer Toleranz, die plattformübergreifendes <c1/>-Jitter auffängt) und ersetzen die früheren reinen Ungleichungsprüfungen, sodass eine stille numerische Regression sofort auffällt.

# text
# c1: schema_version
# c2: 0.1
# c3: 0.7
seg-4b2a0b78984b = <c1/> in den Ergebnisartefakten wurde von <c2/> auf <c3/> angehoben (sie war eingefroren, während die Engine weiterentwickelt wurde).

# text
# c1: CAPABILITY.md
# c2: SCHEMA.md
# c3: INTEGRITY.md
# c4: QUANTUM-MODELS.md
# c5: REAL_TLE_GUIDE.md
# c6: Cargo.toml
seg-c48af44de5b4 = Neue Dokumente: <c1/> (ehrliche Umfangskarte), <c2/> (Referenz der Ergebnisfelder), <c3/>, <c4/>, <c5/>. Ein CI-Wächter schlägt fehl, wenn das Versionsabzeichen im README von <c6/> abweicht.

# text
seg-8ef32ebec7f5 = <b>SGP4/SDP4-Bahnpropagation.</b> Eine vollständige, abhängigkeitsfreie Implementierung des Standard-Propagators für vereinfachte Störungen — erdnahes SGP4 zusammen mit der Erweiterung SDP4 für den tiefen Raum (säkulare und periodische Mond-Sonne-Störungen sowie Geopotential-Resonanz bei { "12" } h / { "24" } h). Sie ist gegen die offiziellen Verifikationsvektoren von AIAA 2006-6753 („Revisiting Spacetrack Report #3“) validiert: Alle { "666" } Referenzzustände der erdnahen, Tiefraum-, Resonanz- und Fehlercode-Fälle stimmen mit einem Positionsfehler im ungünstigsten Fall von etwa { "4" } mm überein. Dies ist das Modell, gegen das Two-Line-Element-Sätze definiert sind, sodass es reale Konstellationen abbildet — insbesondere die GNSS-Bahnen mit ca. { "12" } h, die im tiefen Raum liegen und resonant sind und die das frühere Zwei-Körper- + J2-säkulare Modell nicht erfassen kann.

# text
# c1: orbit-sgp4-gps.toml
seg-06a77fb9233e = Eine Konstellation, die als <b>vollständige Two-Line-Element-Sätze</b> (Zeile { "1" } + Zeile { "2" }) angegeben ist, wird nun mit SGP4/SDP4 propagiert; eine Konstellation, die nur mit Elementen der Zeile 2 angegeben ist, behält die analytische Kepler-Zwei-Körper-Propagation unverändert bei. Die beiden Formen lassen sich in einem Block mischen. Neues Referenzszenario <c1/> (eine GPS-ähnliche MEO-Konstellation im echten Two-Line-Format, mit SGP4 propagiert) — mit einem aktuellen Celestrak-Satz „gps-ops“ lässt sich die live betriebene Konstellation untersuchen.

# text
# c1: spoof
# c2: spoof-attack.toml
seg-2dbb4054e9b8 = <b>Demonstrator für aktive Spoofing-Angriffe.</b> Eine neue Szenarioart <c1/> speist ein ansteigendes falsches Zeit-Spoofing ein und führt den uhrengestützten Integritätsmonitor jeder Uhr aus; sie meldet, ob und wann das Spoofing erkannt wird und ob es unentdeckt die betriebliche Spezifikation erreicht — und macht die Sicherheits-Gütekennzahl so zu einer konkreten Angriffs-/Verteidigungsdemonstration. Neues Referenzszenario <c2/>.

# text
# c1: [[constellations]]
# c2: [constellation]
# c3: orbit-multignss.toml
seg-aa0cb8038baa = <b>Verfügbarkeit mit mehreren Konstellationen.</b> Ein Bahnszenario kann mehrere Konstellationen kombinieren (eine Liste <c1/> neben der primären <c2/>) für Multi-GNSS-Verfügbarkeit und Dilution of Precision — z. B. GPS plus Galileo. Neues Referenzszenario <c3/>.

# text
seg-9b9dcd5be0a7 = <b>HTML-Scorecard-Bericht.</b> Jeder Lauf erzeugt nun außerdem eine eigenständige HTML-Scorecard im Brand-Design — die einzeilige Zusammenfassung, das Diagramm (als inertes Data-URI-Bild eingebettet) und das vollständige JSON —, von der CLI neben JSON und SVG geschrieben. Ein teilbares Einzeldatei-Artefakt für ein Studienergebnis oder einen Anhang.

# text
# c1: fusion
# c2: [phase, frequency]
# c3: [position, velocity]
# c4: fusion-pnt.toml
seg-76c573048a91 = <b>Gemeinsamer Sensorfusions-Schätzer.</b> Eine neue Szenarioart <c1/> führt ein einziges rekursives Kalman-Filter als Navigationslösung aus — es fusioniert den Uhrenzustand <c2/> und den Positionszustand <c3/>, wird durch GNSS diszipliniert (lernt den Frequenzoffset und die Geschwindigkeit) und während des Ausfalls durch optischen Zeitvergleich gestützt —, statt unabhängige Prädiktoren zusammenzusetzen. Es meldet fusioniertes holdover von Zeitgebung/Position und eine Integrität aus der gemeinsamen Kovarianz. Neues Referenzszenario <c4/>.

# text
# c1: bias_instability
# c2: q_aa
seg-10f0501c91ef = <b>Vollständigeres IMU-Rauschmodell.</b> Der Beschleunigungsmesser modelliert nun die übrigen Terme der Allan-Varianz über den konstanten Bias und den Geschwindigkeits-Random-Walk hinaus: <b>Bias-Instabilität</b> (eine 1/f-Flicker-Untergrenze beim üblichen Allan-Koeffizienten der Bias-Instabilität, unter Wiederverwendung der Flicker-Synthese der Uhr) und <b>Beschleunigungs-Random-Walk</b>. Neue optionale Szenariofelder <c1/> und <c2/> für Inertialszenarien; ein erneuter GNSS-Fix kalibriert die verbleibende Bias-Drift neu.

# text
# c1: tle
# c2: orbit-real-tle.toml
seg-251ffc7b7722 = <b>Reale Konstellationsgeometrie aus TLEs.</b> Eine Konstellation kann über ein Feld <c1/> als Block von Two-Line-Element-Sätzen (dem NORAD-/Celestrak-Standardformat) angegeben werden, sodass Verfügbarkeit und Dilution of Precision die veröffentlichte Geometrie einer realen Konstellation statt eines synthetischen Walker-Musters verwenden. Die Engine liest die mittleren Kepler-Elemente jedes TLE und propagiert sie als Zwei-Körper-Problem — nicht mit SGP4 —, was für eine Momentaufnahmestudie von einer gemeinsamen Epoche aus tragfähig ist. Neues Referenzszenario <c2/>.

# text
# c1: sweep
# c2: threshold_ns
# c3: duration_s
# c4: quantum_q_wf
# c5: classical_q_wf
# c6: sweep-clock-stability.toml
seg-7deb93b51cc7 = <b>Parameter-Sweeps für Trade-Studien.</b> Eine neue Szenarioart <c1/> variiert einen Parameter (<c2/>, <c3/>, <c4/> oder <c5/>) über einen linearen oder logarithmischen Bereich und zeichnet an jedem Punkt für beide Uhren eine gewählte Gütekennzahl auf; so entsteht das Vergleichsdiagramm „Wie skaliert holdover mit der Uhrenstabilität?“, das ein Entwurfs-Trade braucht. Neues Referenzszenario <c6/>.

# text
# c1: runs
# c2: clock-ensemble.toml
seg-ef6f3e77b476 = <b>Monte-Carlo-Konfidenzbänder.</b> Das Uhren-holdover-Szenario kann viele Realisierungen ausführen (neues optionales Feld <c1/>): Jede Gütekennzahl wird dann als Mittelwert mit einer Streuung vom 5. bis 95. Perzentil gemeldet, und das Diagramm schattiert für jede Uhr die Fehlerhüllkurve von { "5" }–{ "95" }% um den Median. Ein einzelner Lauf bleibt der Standard. Neues Referenzszenario <c2/>.

# text
# c1: eccentricity
# c2: argp_deg
# c3: j2
# c4: orbit-molniya.toml
seg-e70cc0973fa3 = <b>Exzentrische Bahnen und J2-Drift.</b> Der Bahntyp ist nun eine vollständige Kepler-Bahn (große Halbachse, Exzentrizität, Inklination, RAAN, Argument des Perigäums, mittlere Anomalie), propagiert durch Lösen der Kepler-Gleichung, mit optionaler säkularer J2-Knotenregression und Apsidenpräzession. Neue optionale Szenariofelder <c1/>, <c2/> und <c3/> sowie ein Referenzszenario <c4/> (ein hochexzentrischer Nutzer mit kritischer Inklination und { "12" } h Umlaufzeit). Kreisbahnen behalten den ursprünglichen geschlossenen Pfad bitgenau bei.

# text
seg-cc041e16d418 = Das Hybridpaket (kombiniertes PNT) meldet nun <b>Integrität</b> und <b>Sicherheit</b>, sodass alle vier Pakete den vollen Satz betrieblicher Gütekennzahlen abdecken. Die Integrität ist die Einschließung durch die Schutzgrenze im Zeitgebungskanal, aus einem Kalman-Schätzer, der gegen die Wahrheit diszipliniert wird, solange GNSS nominal ist, und bei jeder optischen Neu-Synchronisation (lockerer) neu verankert wird; ihre Grenze enthält die Messrauschuntergrenze des Links, sodass eine Uhr, die weit besser ist als der Link, gegen das tatsächliche Rauschen der gelieferten Lösung bewertet wird. Die Sicherheit ist der uhrengestützte Spoofing-Erkennungswert gegen die Zeitgebungsspezifikation.

# text
# c1: scripts/changelog-extract.sh
seg-e0b666457d6e = Release Notes werden nun aus dem kuratierten CHANGELOG-Abschnitt für das Tag erzeugt (<c1/>), sodass jedes GitHub-Release hervorhebt, was sich geändert hat, statt rohe Commits aufzulisten.

# text
# c1: [0, 1]
seg-f785718e9454 = <b>Sicherheits</b>-Gütekennzahl (bisher unbelegt): ein uhrengestützter Spoofing-Erkennungswert für die Pakete Uhren-holdover und Bahn. Sie modelliert einen Integritätsmonitor, der die aus GNSS abgeleitete Zeit über ein kohärentes Fenster mit der eigenen fortgeschriebenen Vorhersage der Uhr abgleicht; die Erkennungsuntergrenze kombiniert das gemittelte Messrauschen mit der Fortschreibungsunsicherheit der Uhr, sodass eine ruhigere Uhr kleinere, langsamere Zeit-Spoofings erkennt. Der Wert wird in <c1/> relativ zur Zeitgebungsspezifikation gemeldet und vervollständigt damit die sechs betrieblichen Gütekennzahlen.

# text
# c1: Q = (HᵀH)⁻¹
# c2: sigma_uere_m
seg-9164140872c8 = Aus der Geometrie abgeleitete <b>Positionsgenauigkeit</b> für das Bahnpaket: Aus der Sichtlinien-Geometrie zu den sichtbaren Satelliten bildet sie die Entwurfsmatrix und ihren Kovarianzfaktor <c1/> und liefert so die Dilution-of-Precision-Faktoren (GDOP/PDOP/HDOP/VDOP/TDOP). Die Positionsgenauigkeit ist der Positions-DOP, skaliert mit einem konfigurierbaren Nutzeräquivalent-Entfernungsfehler (neues optionales Szenariofeld <c2/>). Ein Bahnergebnis trägt nun eine Geometriezusammenfassung (Anteil der Proben mit Fix, bester und mittlerer PDOP und Positionssigma).

# text
# c1: web/
# c2: pages
# c3: summary
seg-3285502161c6 = Ein <b>Playground</b> im Browser (<c1/>), der die Engine clientseitig als WebAssembly ausführt: Man wählt ein Referenzszenario oder bearbeitet das TOML, führt es aus und sieht Zusammenfassung, Diagramm und vollständiges JSON, ohne dass etwas hochgeladen wird. Ein Workflow <c2/> baut und veröffentlicht ihn auf GitHub Pages, und ein neuer WebAssembly-Export <c3/> liefert die Anzeige.

# text
# c1: chart
seg-0dca5318f7ce = Beschriftete y-Achsen in den SVG-Diagrammen: Gitternetzlinien, numerische Teilstrichbeschriftungen und ein Achsentitel mit Einheiten (über einen gemeinsamen Helfer <c1/>), sodass Größenordnungen lesbar sind.

# text
# c1: publish
seg-ce84a3d61f19 = Workflow zur Paketveröffentlichung (<c1/>) für crates.io, PyPI und npm, jeweils abhängig vom Token der Registry und ausgelöst durch ein veröffentlichtes Release.

# text
# c1: flicker_floor
seg-0f01369fc29b = Flicker-(1/f-)FM-Untergrenze für das Uhrenfehlermodell, synthetisiert als Summe logarithmisch verteilter Ornstein-Uhlenbeck-Prozesse und so kalibriert, dass die flache Untergrenze der Allan-Abweichung auf einem konfigurierbaren Niveau liegt. Standardmäßig aus; je Uhr über das optionale Szenariofeld <c1/> aktivierbar.

# text
# c1: gyro_bias
# c2: q_arw
seg-5b7fcd386fd3 = Gyro-Kanal für das Inertialmodell: Der verbleibende Gyro-Bias und der Winkel-Random-Walk treiben einen Lagefehler (Neigung) an, der die Schwerkraft in einen horizontalen Fehler der spezifischen Kraft einkoppelt, den dominanten Mechanismus des Fehlerwachstums beim Strapdown. Standardmäßig aus; je Sensor über die optionalen Felder <c1/> und <c2/> aktivierbar.

# text
# c1: q_wf*T + q_rw*T^3/3
seg-efe9f10d2641 = Kalman-Uhrenschätzer mit zwei Zuständen (Phase, Frequenz) mit exakter Diskretisierung des Prozessrauschens nach van Loan. Das Fortschreiben von einem bekannten Zustand aus reproduziert das analytische Wachstum des holdover-Fehlers (<c1/>) exakt, und das Filter liefert zusätzlich eine Online-Unsicherheitsgrenze von 1 Sigma.

# text
seg-539e24f34ed1 = Der Uhrenlauf meldet nun die <b>Integritäts</b>-Gütekennzahl (bisher unbelegt): den Anteil der Ausfallproben, deren Fehler innerhalb der 3-Sigma-Schutzgrenze des Filters bleibt, ausgewiesen im JSON-Ergebnis und in der CLI-Zusammenfassung.

# text
# c1: orbit
# c2: orbit-gnss-challenged.toml
seg-80620c97e3f5 = Aus der Geometrie abgeleitete GNSS-Verfügbarkeit: Kreisbahn-Propagation, ein Walker-Delta-Konstellationsgenerator und Sichtlinien-Sichtbarkeit (Erdverdeckung plus Elevationsmaske) erzeugen den Verfügbarkeitsverlauf aus realer Bahngeometrie. Neue Szenarioart <c1/> und das Referenzszenario <c2/> (ein Raumfahrzeug innerhalb der GNSS-Schale mit zeitweiliger Abdeckung).

# text
# c1: run
# c2: run_full
# c3: version
# c4: pyproject.toml
# c5: wheels
seg-67549163ad7d = Optionale Python-Erweiterung (PyO3, abi3), die <c1/>, <c2/> und <c3/> bereitstellt, mit maturin verpackt (<c4/>) und für Linux, macOS und Windows durch einen Workflow <c5/> beim Release-Tag gebaut. Die Anbindung ist eine optionale Abhängigkeit hinter einem Feature-Schalter: Der Standard-Build, die Tests und das Gate der Abhängigkeitsprüfung bleiben unberührt.

# text
# c1: run
# c2: chart_svg
# c3: version
# c4: wasm
# c5: getrandom
# c6: wasm32
seg-c76dc363f0b1 = Optionales WebAssembly-Modul (wasm-bindgen), das <c1/>, <c2/> und <c3/> bereitstellt, mit wasm-pack unter dem Feature <c4/> gebaut; <c5/> ist zielabhängig geschaltet, um auf <c6/> die Entropiequelle des Browsers zu nutzen.

# text
# c1: api::run_toml
seg-cf1b0eef2201 = Gemeinsamer Aufruf <c1/>, den die CLI und beide Anbindungen verwenden, sodass Kommandozeile und Anbindungen nicht auseinanderlaufen können.

# text
seg-8d4f855d11bd = Die holdover-Bewertung ist nun segmentbewusst: Ausfallverläufe werden bei der GNSS-Wiedererfassung in zusammenhängende Segmente geteilt, und das gemeldete holdover ist die ungünstigste (kürzeste) Überbrückung über diese. Szenarien mit einem einzelnen Ausfall bleiben unverändert. Gilt für die Bewerter von Uhr, Inertial und Hybrid.

# text
# c1: kind
# c2: inertial
# c3: accelerometer
seg-8b3556d125ed = Das gemeldete <c1/> des Inertialmodells ist nun <c2/> (zuvor <c3/>) und spiegelt die kombinierten Kanäle von Beschleunigungsmesser und Gyro wider.

# text
seg-d842f9cc0a9c = Erstes Release.

# text
# c1: scenario + seed + engine version
# c2: kind
seg-962b75c38735 = <b>Deterministische Simulations-Engine</b> für hybrides Quanten-/klassisches PNT: eine gemeinsame Fehlermodell-Schnittstelle, deklarative GNSS-Verfügbarkeitsszenarien, holdover- / Koppelnavigations-Schätzer und Bewertung der Gütekennzahlen gegen die üblichen betrieblichen PNT-Kriterien. Die Ergebnisse sind reproduzierbar aus <c1/> (versioniertes, selbstbeschreibendes JSON mit einem Szenario-Hash) und werden als SVG-Diagramme dargestellt. Die CLI ruft Szenarien über <c2/> auf.

# text
seg-16e574edc3a8 = <b>Vier Sensorpakete</b>, jedes an veröffentlichte Daten kalibriert und gegen die Standardbeziehung validiert:

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Kurs-Notebooks</b> (<c1/>): Jamming, Spoofing, Holdover, Integrität, OSNMA und Störungskarte, jeweils mit Übungen.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>Studie zur maximalen URA im EU-US-WG-C-ARAIM-Meilenstein { "3" }</b> (<c1/>, <c2/>), ersetzt den zurückgezogenen Plan „Table A-3“; MODELLED unter genannten Abweichungen.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Entwürfe zur Freigabe durch den Eigentümer</b> unter <c1/>: JOSS-Paper, Änderung der TSC-Satzung, Prozess für das Register unabhängiger Referenzen und ein Aufteilungsvorschlag für <c2/>. Nichts davon ist angenommen.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Studio-Ansichten für die Funktionen von { "0.38" }</b> (kshana.dev/studio/). Bridge-Wiedergabe (zwei synthetische Läufe auf einer Uhr: Spur, Vertrauenswert, die Satelliten, die das Protokoll hört, und das Urteil, mit den eigenen Markierungen des Empfängers neben den Alarmen von Kshana); Optical PNT (die beiden Szenarien <c1/>, mit einer optionalen, mit Seed erzeugten Realisierung von <c2/>, MODELLED); Holdover-Test (das Ergebnis von <c3/>, gemessen an den ITU-T-Masken, gezeichnet aus der <c4/> des Ergebnisses selbst); ein Viewer für das Störungs-Observatorium, der die von Ihnen erzeugten Dateien öffnet und keine mitliefert; auf der Seite Tools ein Jammertest-Scorer, eine IMU-Anpassung und MQTT als Telemetrieformat; und unter Trust eine Auswahl des Protokollformats (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) mit optionaler IMU-Datei. Jede Ansicht liest Dateien im Browser und lädt nichts hoch; jede Zahl behält die Kennzeichnung, die das Register für sie führt, und jede trägt den Hinweis. Die Seite <c6/> der Website zeigt das Fragment <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Issue #36: byteexakte Pin-Schichten.</b> Byteexakte Pin-Schichten laufen nur auf einem Host, der als Basislinie erklärt ist (<c1/>, gesetzt durch <c2/>), nicht auf jedem Apple-Silicon-Mac, weil sich Apples Mathematikbibliothek zwischen macOS-Versionen unterscheidet; die portable Schicht läuft überall, und <c3/> verhindert, dass eine byteexakte Schicht erneut allein nach Plattform freigeschaltet wird. Die Vergleiche mit den unabhängigen Referenzen selbst bestehen unter macOS. Kein Literal wurde neu aufgenommen und keine Toleranz geändert. <c4/> und <a1><c5/></a1> beschreiben, wie ein Unterschied zu sichten ist; <c6/> ist eine manuelle und wöchentliche Diagnose, keine Schranke.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL: ein nicht verankertes Muster im Trust-Open-Helfer des Studios</b> passt jetzt auf den gesamten Header (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI: Speicherplatz des Runners.</b> Der Job <c1/> baut die Profile dev und test ohne Debug-Informationen, sodass das Linken den Speicherplatz nicht mehr füllt.

# text
seg-38c59868835e = <b>Quellcode-Wächter.</b> Jede Quelldatei mit Test-Fixtures, die Pins enthalten, erklärt ihren Pin-Geltungsbereich, und die Tests, die temporäre Dateien schreiben, verwenden bei jedem Aufruf einen eindeutigen Pfad, sodass parallele Läufe nicht kollidieren können.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> wird für das optionale Feld <c2/> von optical-atmosphere neu erzeugt.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>JetBrains-Plugin: keine Verwendung veralteter oder zur Entfernung vorgesehener Plattform-API.</b> Der IntelliJ Plugin Verifier (<c1/>) gegen IntelliJ IDEA Build { "263" } ({ "2026.3" }: { "263.6800.24" } und { "263.7031.23" }) fand einen veralteten Aufruf, <c2/>, in Insert Example; die neue Datei wird jetzt mit <c3/> geöffnet. Das Plugin ist mit { "2024.3" } (dem unveränderten since-build) und beiden Builds { "263" } kompatibel und ohne Befunde. CI führt jetzt <c4/> aus und schlägt bei Kompatibilitätsproblemen und bei jeder Verwendung von zur Entfernung vorgesehener API fehl.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>Optisches PNT durch die Atmosphäre</b> (Szenarioart <c1/>, <a1><c2/></a1>, Entwurfsnotiz <c3/>). Für eine optische Verbindung und eine Menge von Bodenstationen liefert es die von Wellenlänge und Elevation abhängige Dämpfung bei klarer Luft, den Zustand der Turbulenz nach Hufnagel-Valley (Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Schwunde, Aperturmittelung), die Verfügbarkeit gegenüber der Link-Reserve aus einem genannten Wolkenklima, die für Ziel-Verfügbarkeiten nötige Reserve und die Obergrenze, die keine Reserve anhebt, die Verteilung der Ausfalldauer, den Zeit- und Entfernungsfehler pro Ausfall über das Holdover-Modell der Uhr, entfernungskorrelierte Standortdiversität sowie Was-wäre-wenn-Gewinne für eine Wellenlängenänderung, eine größere Apertur, die Verringerung der Szintillation durch adaptive Optik und zusätzliche Reserve. <c4/> erhält ein atmosphärenbewusstes Budget; ohne eines ist seine Ausgabe bitgleich mit { "0.36" } (Zielwert A5). Zwei mitgelieferte Szenarien tragen ILLUSTRATIVE Wolkenklimata. MODELLED: drei Registerzeilen. Die Numerik erfüllt die Zielwerte A1 bis A6, vorab registriert in <c5/>, gegenüber einem unabhängigen mpmath-Programm; das prüft die Umsetzung der genannten Formeln, nicht die Atmosphäre, und es wurde keine gemessene Verfügbarkeitsaufzeichnung verglichen, daher ist keine Zeile VALIDATED. Der Zielwert A4 wurde zunächst um { "3e-9" } verfehlt, weil die verwendete Normalverteilungs-CDF eine Näherung mit { "1.5e-7" } war; die CDF wurde ersetzt und der Zielwert blieb wie registriert. Die nativen und die WebAssembly-Builds liefern für beide mitgelieferten Szenarien byteidentische Dokumente (A7, ausgeführt auf dem Integrations-Commit von { "0.37.0" }).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>Detektions-ROC der IQ-Monitore</b> (PRO-32, <a1><c1/></a1>). Eine Kampagne mit Monitoren behält das Maximum der Teststatistik jeder Alarmart über genannte Ereignisfenster (positiv) und über Fenster, die außerhalb der Ereignisse gekachelt sind (negativ, <c2/>). Der Bericht fasst sie pro Alarmart zu einer ROC mit ihrer AUC und dem Arbeitspunkt bei der konfigurierten Schwelle zusammen, als <c3/> und als Berichtsabschnitt. Bei synthetischen Kampagnen ist die Prüfung auf Zufallsniveau erfüllt. Der Zielwert der C/N0-AUC ({ "0.95" }) ist nicht erreicht ({ "0.79" }), weil die negativen Fenster unmittelbar nach einem Ereignis den Abfall der CUSUM aus der Detektion erben; das ist festgehalten. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>IQ-Monitore in der Lab-Replay-Kampagne</b> (PRO-31, <a1><c1/></a1>). Eine optionale Tabelle <c2/> in einer Kampagnendatei lässt die IQ-Monitore im einzigen Durchlauf des Runners laufen: Leistung und Spektrum nach jeder Front-End-Kette sowie C/N0, SQM und Lock pro verfolgtem Kanal. Ihre Alarme werden an den genannten Ereignissen bewertet: erkannt oder verpasst, Zeit bis zur Erkennung und Fehlalarme pro Stunde Exposition. Die geschlossene Fehlalarmzahl jedes Tests ist angegeben, darunter eine neue zweiseitige Gauß-Zahl für die SQM-Tests (<c3/>). Ohne die Tabelle ändert sich nichts. Bei synthetischen Kampagnen sind die Fehlalarm-Zielwerte für Leistung und SQM sowie der Fehlalarm-Zielwert für C/N0 erfüllt; { "18" } von { "18" } Dämpfungen werden erkannt, aber die Schranke für die Zeit bis zur Erkennung, konstruktionsbedingt unter einem Detektor-Abtastwert, ist nicht erfüllt und ist festgehalten. MODELLED; Registerzeile „IQ monitors scored in lab-replay campaigns“.

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Lab-Anpassung aus IQ-Kampagnen, Folgeprüfung</b> (<c1/>, CI-Job <c2/>). Sie prüft die beiden Hypothesen, die §{ "13.6" } von <c3/> offen ließ, gegen Zielwerte, die in 1e532f84 vorab registriert wurden. Sie fügt zwei synthetische Kampagnen hinzu: S mit gestuftem J/S (Seed 2026_1014) und R, eine frische Rampe (Seed 2026_1015). Die Ergebnisse stehen in <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 erfüllt: Bei jeweils gehaltenem J/S-Niveau wird <c1/> innerhalb von +{ "0.185" } dB wiedergewonnen. Der Fehler von −{ "1.1" } dB bei den Rampenkampagnen ist Schätzer-Verzögerung.

# text
seg-ea9f206c2999 = S2 nicht erfüllt, festgehalten durch einen Test, der den Fehlschlag prüft: (d) wie geschrieben gilt bei der gestuften Kampagne für das Tracking-Loop-Modell ({ "0.45" } dB), aber nicht für das empirische ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 erfüllt: Bei der frischen Rampenkampagne liegt (d) mit den angepassten Abfall-Verweilzeiten, zu denen die Rampenrate jedes Ereignisses addiert wird, für beide Modelle innerhalb von { "1" } dB.

# text
seg-24c6725c2c7d = Die Fehlschläge bei (a′) und (d) wiederholen sich bei R.

# text
# c1: step
seg-7cbbce356973 = Eine Kampagne kann ihr J/S jetzt im Test-Harness als Profil <c1/> angeben.

# text
seg-34007ba58a9f = Kein Urteil in §{ "13" } ändert sich, und die Registerzeile bleibt MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Begrenztes FLL-Pull-in, optional</b> (DS-LOOP-05): ein neuer Schlüssel im Schleifenentwurf <c1/> (s), in Rust <c2/>. Unter <c3/> erzwingt er nach dieser Dauer die Übergabe von FLL an PLL, unabhängig vom PLI. Standardmäßig nicht gesetzt, und dann nicht im Entwurfs-Hash; der Standardentwurf und sein Hash bleiben unverändert.

# text
seg-ae2794b2d3d5 = Geprüft gegen Zielwerte, die bei 58789af0 vorab registriert wurden, an eingespeister Wahrheit. Die Kontrolle ist erfüllt: Der Standard übergibt bei { "33" } dB-Hz in { "9" } von { "10" } Seeds nie.

# text
seg-6d9483874b35 = Nicht erfüllt: Mit einer Begrenzung von { "1.0" } s halten { "16" } von { "20" } Läufen bei { "33" } dB-Hz den Lock und { "8" } von { "20" } bei { "31" } dB-Hz; die übrigen wechseln zwischen erzwungenen Übergaben und der Rückkehr der FLL. Der Phasenjitter beträgt bei { "33" } dB-Hz das { "1.8" }-Fache der PLL allein.

# text
seg-deeefaf50e3e = Die Pull-in-Untergrenze von ~{ "35" } dB-Hz bleibt die dokumentierte Grenze des Standards.

# text
seg-780de73c01e1 = MODELLED; Registerzeile „Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)“.

# text
# c1: jamming
seg-ace6b53749bd = <b>Akquisitions-Hysterese und der Front-End-Quantisierer in der Art jamming</b> (CAP-06c): zwei optionale Abschnitte für ein Szenario <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, auf oder über der Tracking-Schwelle) und <c3/> (s, Standard { "0" }). Ein Satellit ist akquiriert, wenn er auf oder über der Akquisitionsschwelle liegt, nachdem er für die Dauer der Verzögerung nicht akquiriert war. Er wird gehalten, solange er auf oder über der Tracking-Schwelle liegt. Ausgaben: <c4/> (wahr/falsch), <c5/> (Anzahl) und <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/>: <c2/> ({ "1" } bis { "16" }) und <c3/> (MHz, Standard das Doppelte der Chiprate). Gibt einen Block <c4/> aus: <c5/> (dB, <c6/>), <c7/> (dB, von der effektiven C/N0 jeder Verbindung abgezogen) und <c8/>. Der Verlust ist der für gaußsche Eingänge und ist als nicht gültig für CW-, Schmalband- und gewobbelte Jammer gekennzeichnet.

# text
seg-0dad81736863 = Ohne die Abschnitte ist jede Ausgabe byteidentisch.

# text
seg-92007bfb6680 = Geprüft gegen Zielwerte, die bei 70c72fcc vorab registriert wurden. Der Quantisierungsverlust liegt innerhalb von { "0.0007" } dB eines unabhängigen Monte-Carlo-Laufs, und der AGC-Wert innerhalb von { "0.012" } dB der AGC-Schleife der IQ-Schicht.

# text
seg-973e451df99d = Die registrierten Hysterese-Läufe waren nicht aussagekräftig (jede Verbindung verloren), daher ist dieser Zielwert NOT MET. Ein ergänzender Lauf-Satz, registriert bei { "37793290" }, erfüllt ihn: Jede Markierung entspricht einer unabhängigen Neuberechnung, und { "732" } von { "1824" } Verbindungen zeigen die Hysterese.

# text
seg-912e9f1a4d5b = Befund: Mit einem CW-Jammer verliert ein 1-Bit-ADC etwa { "5" } dB mehr als der gaußsche Wert.

# text
seg-a19aee81b581 = MODELLED; Registerzeile „Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations“.

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Geländeabschattung des Jammers in der Art jamming</b> (CAP-06b): ein optionaler Abschnitt <c1/> in einem Szenario <c2/> mit Jammer. Felder:

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/>: eine SRTM-Kachel <c2/>, relativ zum Arbeitsverzeichnis;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> und <c3/> (Grad): Größe und Ecke der Kachel;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, Standard { "0" }), <c2/> (Standard 4/3) und <c3/> (m, Standard { "30" }).

# text
seg-ad58fe7ff627 = Die Engine tastet das Geländeprofil entlang des Großkreises zwischen Jammer und Empfänger ab und findet die dominante Schneidenkante. Die empfangene Leistung des Jammers und damit jedes J/S wird um den Einzelschneiden-Beugungsverlust nach ITU-R P.526-15 §{ "4.1" } gesenkt.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = Das Ergebnis erhält einen Block <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) und <c7/> (Anzahl).

# text
seg-b9696f5eda4b = Ohne den Abschnitt ist jede Ausgabe byteidentisch.

# text
# c1: ν
seg-593b6a5b4480 = Geprüft gegen Zielwerte und zehn Platzierungen, die bei 92cd2bfd vorab registriert wurden, an der eingecheckten echten SRTM-Kachel des Death Valley, gegen eine unabhängige Neuberechnung mit numpy. Alle erfüllt: größte Abweichung { "1.6e-10" } bei <c1/> und beim Verlust (Zielwert { "1e-9" }), der Verlust monoton in der Jammerhöhe, und der Verlust erreicht J/S exakt.

# text
seg-62e07defd715 = MODELLED; Registerzeile „Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile“.

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>CRPA-Antennengewinne in der Art jamming</b> (CAP-06a): ein optionaler Abschnitt <c1/> in einem Szenario <c2/>. Felder: <c3/> (Elementpositionen in lokalem Ost-Nord-Oben, m), <c4/> (<c5/> oder <c6/>) und <c7/> (MVDR-Rauschbandbreite, MHz, Standard das Doppelte der Chiprate).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Jeder Kanal bildet einen verzerrungsfreien Strahl zu seinem Satelliten. Das Rauschen der Verbindung wird mit <c1/> und der Jammer mit <c2/> skaliert, bevor die bestehende Anti-Jam-C/N0-Gleichung angewandt wird.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Jede Verbindung erhält einen Block <c1/>: <c2/> (dB) und <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Ein ungültiger Abschnitt (eine leere Elementliste, eine unbekannte Gewichtung, eine nicht positive Bandbreite) ist ein Fehler, über <c1/> und <c2/> ebenso wie über <c3/>.

# text
seg-2464d9dde85f = Geprüft gegen Zielwerte, die bei 08d83b4d vorab registriert wurden. Erfüllt: Additivität (nach einer Korrektur: Der erste Build fügte die neuen Einheiten der Einheitentabelle jedes Jamming-Laufs hinzu); ein Element ist kein Array; Rauschgewinn und effektive C/N0 innerhalb von { "1e-9" } dB einer unabhängigen Neuberechnung mit numpy; MVDR strebt bei hohem JNR zur Nullstelle.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = Nicht erfüllt: der MVDR-Jammergewinn bei { "194" } von { "456" } Verbindungen mit der portablen Mathematik von { "0.36" } ({ "202" } mit der Host-Mathematik; <c1/>) (schlechtester Wert { "1.7e-6" } dB). Die Residuen von −{ "100" } bis −{ "188" } dB liegen unter der Auflösung von float64 bei diesem Zielwert, und numpy weicht von sich selbst in derselben Größenordnung ab.

# text
seg-c10e1c72eb15 = MODELLED; Registerzeile „CRPA antenna gains in the jamming kind against an independent numpy recomputation“.

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>IQ-Tracking-Engine gegen GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> und GNSS-SDR verfolgen dieselben unabhängigen numpy-Aufzeichnungen von GPS L1 C/A bei { "30" } bis { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Zielwerte vorab registriert bei 48edd4a5. Die registrierte Kalibrierung scheiterte an einer falschen Übergabe von GNSS-SDR (F3), daher ergänzt Nachtrag { "1" } (1e4288c4) beiden Empfängern eine reine Pull-in-FLL, eingecheckt vor jeder Testaufzeichnung.

# text
seg-1d651ff134f9 = Erfüllt: Träger- und Codejitter sowie Doppler stimmen bei jeder C/N0 innerhalb von { "5" } % überein.

# text
seg-bc9c9a0247d1 = Nicht erfüllt: Die NWPR-C/N0 der Engine liegt { "2.3" }–{ "7.1" } dB unter dem SNV von GNSS-SDR (F4, eine bekannte Schätzergrenze; M2M4 liegt innerhalb von { "0.06" } dB der Wahrheit); die Lock-Indikatoren unterscheiden sich per Definition (F5); eine abweichende Bewertung eines Slips bei { "30" } dB-Hz (F6).

# text
seg-7c32867b5c27 = MODELLED; Registerzeile „IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings“.

# text
seg-55524624777b = <b>BeiDou B1I.</b> Alle { "63" } primären B1I-Codes stimmen Chip für Chip mit dem unabhängigen Generator von GNSS-SDR { "v0.0.19" } überein (Zielwert vorab registriert bei 911106d1). Nur die Ausgabe dieses Programms ist eingecheckt: die B1I-PRN-Codes, die das öffentliche ICD definiert, als Präfix und Hash.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Alle { "126" } L1CP/L1CD-Codes und { "63" } L1CO-Overlays stimmen mit den Prüfspalten überein, die IS-GPS-800J ausweist, und die berechnete Legendre-Folge stimmt mit ihrer Tabelle 6.2-1 überein (Zielwerte vorab registriert bei fe372e26).

# text
seg-f445784a7f2d = Zeilen: „BeiDou B1I primary ranging codes against an independent generator“ und „GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns“.

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>GLONASS-, BeiDou- und Galileo-E6-Bänder im Spektrummodell</b> (CAP-12, Signale): neue Bandnamen <c1/> und <c2/> (jeder FDMA-Kanal als <c3/>, K = −{ "7" } bis { "6" }), <c4/>, <c5/>, <c6/>, <c7/> und <c8/>. Jedes trägt Träger, Modulation und minimale Empfangsleistung aus seinem ICD. Sie sind nur über den Namen optional zuschaltbar: Der Standard-Bandsatz und jede bestehende Ausgabe bleiben unverändert.

# text
seg-158a6ec19d6b = Geprüft gegen Zielwerte, die bei 5806f28b vorab registriert wurden: Die ICD-Werte, Nullstellen, der B1C-Verbund und der C/N0-Pfad sind erfüllt.

# text
seg-805092ae8ca2 = Zwei Zielwerte wurden nicht erfüllt. Der Zielwert für die Flächeneinheit war wie geschrieben unerreichbar (F1). Die Wellenformen B1I und B1C der IQ-Schicht stimmen mit dem Modell nur bandgemittelt überein, wegen der ungleichmäßigen Linienspektren ihrer Codes (F2).

# text
seg-db88f07d97bb = MODELLED; Registerzeile „Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)“.

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Option Cell-Averaging-CFAR in der IQ-Akquisition</b> (PRO-37): <c1/> und <c2/> entscheiden auf einem Akquisitionsraster, indem jede Zelle mit dem Mittel der Referenzzellen in ihrer Doppler-Zeile verglichen wird. Die Schwelle ergibt sich aus der geschlossenen CA-CFAR-Fehlalarmwahrscheinlichkeit für <c3/> nichtkohärente Blöcke (<c4/>, <c5/>), sodass die Entscheidung nicht von der Normierung der Abtastleistung abhängt. Sie ist optional; der Standarddetektor und jede bestehende Ausgabe bleiben unverändert.

# text
seg-a56e74b1e091 = Geprüft gegen Zielwerte, die bei 3724aefa vorab registriert wurden: die geschlossene Form gegen Monte Carlo ({ "18" } von { "18" } Fällen) und eine Entwurfsrate von { "1" } %, gemessen mit { "0.97" }–{ "1.01" } % bei gaußschem und 2-Bit-quantisiertem Rauschen.

# text
seg-f88fe97e0ee6 = Ein Zielwert wurde nicht erfüllt: Bei einem rauschfreien 2-Bit-Signal überschreiten { "1.28" } % der Zellen außerhalb des Peaks die Schwelle, an den Korrelationsnebenmaxima des Codes (Befund F1).

# text
seg-8d88b626c31e = MODELLED; Registerzeile „Cell-averaging CFAR option in IQ acquisition“.

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Szintillationsmodell gegen Messdaten</b> (PRO-34): Das Cornell-Szintillationsmodell des IQ-Kanals wurde mit gemessener Intensität und Phase von GPS L1 bei { "50" } Hz aus einer äquatorialen Szintillationsnacht verglichen (Zenodo-Eintrag { "16941224" }, INGV, Malindi, CC BY { "4.0" }), unter bei b6ccb499 vorab registrierten Zielwerten. Erfüllt: die Intensitätsverteilung und die an S4 gebundene Phasenszintillation. Nicht erfüllt: Das Modell schwindet { "2.4" }-mal so oft unter −{ "10" } dB und { "3.5" }-mal so lang (Befund F1). Die registrierte Verarbeitung liest die umbrochene Phase des Modells (Befund F2); das Phasenergebnis gilt auch entfaltet. <c1/> lädt die Daten. Die Zeile bleibt MODELLED: „IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation“.

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Korrigierter LuGRE-Sample-Leser</b> (MR-09): <c1/> liest einen LuGRE-IQ-Stapel mit I im hohen Nibble und den Mid-Rise-Pegeln <c2/> (<c3/>), die das Mittel von −½ beseitigen, das die reinen Zweierkomplement-Ganzzahlen bei I und Q tragen. <c4/> gibt GNSS-SDR dieselbe Lesart. Der generische ION-Leser und jede bestehende Ausgabe bleiben unverändert: { "149" } Szenarioergebnisse und eine Studie sind vorher und nachher byteidentisch, und die festgehaltenen LuGRE-Befunde lesen sich wie registriert (<c5/>). Keine Registerzeile ändert sich.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Optionales BOC({ "1,1" })-Tracking</b> (CAP-07 (a)): <c1/> skaliert die DLL-Diskriminatoren für den Sinus-BOC({ "1,1" })-Hauptpeak und fügt einen Bump-Jump-Monitor hinzu (sehr frühe und sehr späte Korrelatoren bei ±{ "0.5" } Chip, Auf-/Ab-Zähler, <c2/>), der den Code-NCO von einem Nebenpeak weg bewegt; <c3/> listet die Sprünge auf. Standardmäßig aus, und jede bestehende Ausgabe bleibt unverändert. Geprüft gegen Zielwerte, die bei 6b68f6cc vorab registriert wurden, an einem synthetischen BeiDou-B1C-Signal: Ein Start auf einem Nebenpeak, der ohne die Option { "0.55" } Chip daneben bleibt, wird mit ihr durch einen Sprung bei { "0.08" } s auf den Hauptpeak gezogen, und es wurde kein falscher Sprung vom Hauptpeak aus beobachtet. Ein Zielwert wurde nicht erfüllt: Das Raster des Unit-Tests für die Skalierung reicht über den linearen Bereich der Diskriminatoren hinaus (Befund F1 in <c4/>). MODELLED; Registerzeile „BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)“.

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Lab-Anpassung aus IQ-Kampagnen</b> (B7.1, <a1><c1/></a1>). Das <c2/> eines Labfit-Szenarios passt einen Ausgabeordner von <c3/> an, in der CLI (<c4/>), in Python (<c5/>) und im MCP-Labfit-Werkzeug (nur Ordner innerhalb seines Arbeitsverzeichnisses). Es passt eine Einheit pro Signal, Schleifenentwurf, Front-End-Kette und Jammer-Typ an:

# text
seg-1726361b81c4 = das C/N0-Modell gegen genanntes J/S, mit Zensierung;

# text
seg-e1b8a27b06fd = die Tracking-Schwelle, direkt und in geschlossener Form;

# text
seg-8dce89923619 = die Tracking-Loop- und empirischen Lock-Modelle, über das C/N0-Modell gekoppelt, mit ihren Verweilzeiten;

# text
seg-108646713c97 = ein Cluster-Bootstrap mit Seed über Aufzeichnungen, { "90" }-%-Prädiktionsintervalle und Hold-outs mit je einer ausgelassenen Aufzeichnung;

# text
# c1: [validation]
seg-ee5deb4d5d4b = eine vorab registrierte, gehashte Tabelle <c1/>, mit PASS/FAIL pro Zielwert.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = Der Bericht ist <c1/> als JSON, CSV und Markdown, mit einem Einheitenblock. <b><c2/> ist aus C/N0-Daten nicht identifizierbar</b>, ohne eine unabhängige Leistungsmessung. Es wird angegeben, nie angepasst, und der angepasste Parameter ist <c3/> (Entwurfsänderung 2026-10-12). Ein unbekannter Jammer-Typ nimmt das schädlichste angegebene <c4/> (cw, { "1" }). Bei synthetischen Kampagnen aus Kshanas eigenen Szenen besteht der Zielwert für die Hold-out-Abdeckung (c). Die Zielwerte (a') und (b') für <c5/> ({ "0" } von { "50" } Kampagnen abgedeckt) und der Zielwert (d) für die Schwelle in geschlossener Form sind nicht erfüllt: Sie sind mit ihren Werten festgehalten. MODELLED; Registerzeile „Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error“. Der Labfit-Pfad für Empfängerprotokolle und seine Ausgaben bleiben unverändert.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> auf einem JPL-Kernel</b> (CAP-31): <c2/> nimmt jeden Körper, den die SPK enthält (mit de440s: Merkur, Venus, die Erde, den Mond), aus dem Kernel, Label <c3/>, und fügt einen Block <c4/> nur hinzu, wenn gesetzt. Neue Zeile, VALIDATED gegen SPICE (vorab registriert f8e946ea; schlechtester Wert { "3.3e-5" } m, { "1.0e-11" } m/s). Der Standardbericht bleibt unverändert.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop auf der Ephemeride DE440</b> (CAP-20b): <c1/> durchfährt C3 und Ankunfts-V∞ auf heliozentrischen Zuständen aus einer DE440-SPK. Neue Zeile, VALIDATED gegen SPICE-Zustände

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (vorab registriert 2d857fb1; Erde zu Mars 2026-2028, { "304" } Zellen, schlechtester Wert { "2.6e-14" }, dieselbe Zelle mit minimalem C3).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>Nichtgravitatives Makromodell für LRO: NOT MET</b> (DS-LRO-10, vorab registriert e82047e2). <c1/> (optional über <c2/>): ebene Platten mit direkter Sonnenstrahlung mit dem Schatten des Mondes, ein der Sonne nachgeführtes Array sowie Mond-Albedo und thermisches IR; <c3/> ist eine gekennzeichnete generische LRO-Näherung aus veröffentlichten Fakten (keine Bus-Platten: Die Plattentabelle konnte nicht beschafft werden). Beim LRO-Bogen von { "4" } h lässt es den reduziert-dynamischen RMS bei { "6.668" } m und den dynamischen bei { "11.94" } m, mit einem unplausiblen Strahlungsfaktor (etwa +{ "21" } / −{ "22" }), sodass alle drei Zielwerte verfehlt werden. Der Befund ist durch einen Test festgehalten, und keine Standardausgabe ändert sich (<c4/>). Das optionale lunare Kanonenkugel-SRP verwendet jetzt den konischen Schatten des Mondes statt den der Erde (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>Lunare Bahnbestimmung: optionale feste k2-Gezeit und selenozentrische Relativität</b> (DS-LRO-11), standardmäßig aus (<c1/>, <c2/>); ein Schalter <c3/> für die ANISE-Kreuzvalidierung (DS-LRO-04); eine Fixture mit einem LRO-Bogen von { "24" } h und eine nur informative Anpassung über einen langen Bogen (DS-LRO-09). Informationsläufe sind in <c4/> festgehalten; keine veröffentlichte Zahl ändert sich.

# text
seg-b065138adba8 = <b>CR3BP-NRHO { "9" }:{ "2" } gegen CAPSTONE</b> (CAP-29d): neue Zeile MODELLED, die die kreisförmig-eingeschränkte NRHO der Engine gegen die geflogene Bahn von CAPSTONE misst (JPL Horizons, März { "2023" }; vorab registriert { "4e868170" }): Periode { "1.07" } %, Apolun { "0.05" } %, Perilun { "4.1" } % von den Mittelwerten von CAPSTONE, innerhalb der registrierten Zielwerte von { "3" } / { "5" } / { "20" } %. Eine Messung, keine Validierung.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>CR3BP-Rotationszustände nach mondzentriertem ICRF</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> bilden einen dimensionslosen rotierenden Erde-Mond-Zustand auf die momentane Erde-Mond-Linie von DE440 ab, einschließlich der Rate des Bezugssystems außerhalb der Ebene. Neue Zeile, VALIDATED gegen ein SPICE-Zwei-Vektor-Bezugssystem (vorab registriert 2313eb1b, vor jedem Lauf geändert d5ef79b3; { "72" } Fälle, schlechtester Wert { "1.8e-7" } m und { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>CR3BP-Familienmitglieder gegen die JPL Three-Body Periodic Orbits API: NOT MET</b> (RM-35, vorab registriert a9074f65). <c1/> (Halo-, NRHO- und DRO-Korrektur, Stabilitätsindex der Monodromie, Pseudo-Bogenlängen-Fortsetzung) stimmt bei { "54" } von { "58" } API-Mitgliedern bei jedem Zielwert überein (Zustand, Periode und Jacobi überall innerhalb von { "1e-10" }). Ein L1-Halo-Stabilitätsindex ({ "9.5e-2" }) und drei Schließungen kleiner DROs ({ "1.5e-8" } bis { "3.3e-8" } gegen { "1e-8" }) verfehlen ihn, daher ist das Modul <c2/> und keine Zeile beansprucht es. Ergebnisse: <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Optionale lunare Orientierung und Umgebung nach DE440</b> (FUT-05, DS-LRO-08; Standards unverändert): <c1/>, <c2/> / <c3/> (epochenverankert, Hauptachsen nach DE440) und <c4/> (eingebettete DE440-PA-Orientierung plus die geozentrische Sonne und der geozentrische Mond aus einer vom Nutzer gelieferten DE440-SPK). Gegen ANISE (vorab registriert ea537710): Orientierung innerhalb von { "3.5e-7" } rad und LRO-Anpassungen innerhalb von { "1" } mm, aber das Ephemeriden-Teilstück verfehlte seinen Zielwert (Sonne { "30.7" } m, Mond { "1.1" } m, ein Zeitversatz von ~{ "1" } ms auf der ANISE-Seite), daher ist es keine validierte Zeile. Ergebnisse: <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Datum der Kampagne im lunaren Bezugssystem, konditionsskalierter NumPy-Zielwert: NOT MET</b> (vorab registriert b887eb05; bleibt MODELLED). Schritt { "0" } schließt den Pseudo-Inversen-Rückfall als Ursache der Lücke von { "0.30" } bei geschätzten Stationen aus; NumPy stimmt bei sechs von acht Szenarien innerhalb des Zielwerts überein, aber stations_estimated verfehlt ihn ({ "6.8e-6" } gegen { "5.9e-7" }), und am frischen Datum 2026-12-01 macht eine unbeobachtete Bake am Südpol die Informationsmatrix der Bake rangdefizient, was die unveränderte unabhängige Referenz nicht auswerten kann. Ergebnisse: <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Datum des lunaren Bezugssystems aus einer realen Beobachtungskampagne (analytischer Mond) VALIDATED</b> an frischen EDC-Normalpunkten von { "2025" } (vorab registriert 31f5283, bevor einer abgerufen wurde): Die unveränderte unabhängige Referenz aus SPICE und NumPy stimmt bei Buchführung, Rängen und Nullkopplung überein und innerhalb von { "1.11e-3" } bei den Sigmas (Zielwert { "1e-2" }), { "8.95e-4" } bei der Kondition und { "1.79e-3" } bei den Verhältnissen quer/längs (Zielwert { "2e-2" }). Eine Library-Prüfung allein der Kovarianzberechnung; die Zielwerte unterscheiden keine Mondmodelle. Ergebnisse: <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>IAU-Orientierung und GM der vierzehn hinzugefügten Körper des Sonnensystems</b>, aus der Zeile „Physical constants of every solar-system body“ in eine Zeile VALIDATED ausgelagert (vorab registriert 154bc54): <c1/> stimmt mit SPICE <c2/> auf pck00011 innerhalb von { "1e-9" } rad bei { "574" } Matrizen zu den ursprünglichen Epochen und bei { "574" } zu { "41" } frischen, nie zuvor verglichenen Epochen überein (schlechtester Wert Phobos { "1.38e-10" } rad), und <c3/> entspricht gm_de440 für alle vierzehn Körper. Der Rest der ursprünglichen Zeile (J2, mittlerer Radius, der Bericht) bleibt MODELLED. Ergebnisse: <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Lambert mit mehreren Umläufen</b> (<c1/>): jede Lösung mit bis zu drei Umläufen, beide Zweige. Neue Registerzeile, VALIDATED gegen pykep { "3.0.1" } (vorab registriert a75de851; { "382" } Fälle, { "1058" } Lösungen, größte Geschwindigkeitsdifferenz { "1.6e-13" } gegen { "1e-8" }). Der interne Kepler-Landing-Wächter fand bei einem Bogen mit e = { "0.994" } eine Einschränkung von <c2/>; sie ist in <c3/> festgehalten.

# text
seg-b62dc38b09e9 = Solarer Strahlungsdruck nach Box-Wing und ECOM2 (DS-PA-14), optional.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/>: ein Box-Wing-Modell aus ebenen Platten mit den Galileo-FOC/IOV-Tabellen aus den GSC-Satellitenmetadaten, bei nominaler GNSS-Gier-Steuerung, mit Strahlungsfaktor und Ableitungen pro Panel, sowie das empirische ECOM2-Modell mit seinen Ableitungen. Ausgewählt mit <c2/> / <c3/> (Felder <c4/>, Standard <c5/>: der Kanonenkugel-Pfad und jeder Golden-Wert bleiben unverändert); bei einem Box-Wing-Satz ist <c6/> sein Strahlungsfaktor. Verglichen mit Orekit { "12.2" } unter einer Vorregistrierung (<c7/>): jeder Zielwert erfüllt, etwa { "1e-15" } relativ; VALIDATED als Modellauswertung, die Vorhersage des Galileo-SRP bleibt MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>SRP-Schatten der abgeplatteten Erde und Randverdunkelung der Sonne (FUT-09, RM-11).</b> Neues Modul <c1/>: <c2/> (verdeckendes WGS-84-Ellipsoid), <c3/> (Eddington-Gesetz) und <c4/>, ausgewählt mit <c5/> (Standard: der bestehende sphärische konische Schatten, unverändert); <c6/>. Der Schatten der abgeplatteten Erde stimmt mit dem Beleuchtungsverhältnis von Orekit { "12.2" } innerhalb von { "7.4e-9" } über { "2400" } Geometrien überein (VALIDATED, <c7/>); die Randverdunkelung hat keine externe unabhängige Referenz (MODELLED).

# text
seg-f09d4b831dfe = NRLMSISE-00-Thermosphäre (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/>: eine Portierung von <c2/> und <c3/> (Schalter, Modi mit täglichem Ap und 3-stündlichem ap-Array) aus der gemeinfreien C-Version des NRL-Fortran. Sie ist bitgleich mit dieser C-Portierung und liegt innerhalb von { "1.9e-6" } relativ zu pymsis { "0.13.0" } (NRL-Fortran, einfache Genauigkeit) auf einem Raster mit 720 Punkten, und sie reproduziert die { "17" } veröffentlichten Testfälle (VALIDATED; <c4/>). Das validiert die Portierung, nicht die Genauigkeit des Modells gegenüber gemessener Dichte.

# text
seg-9e8e9018dbaf = Optionale Stufe für die Luftwiderstandsdichte nach NRLMSISE-00.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> und <c4/>. Das statische Exponentialmodell bleibt der Standard, Bit für Bit. Das Weltraumwetter ist pro Modell konstant. VALIDATED auf Bahnebene gegen den eigenen NRLMSISE-00-Luftwiderstand von Orekit { "12.2" } über { "24" } h (schlechtester Wert { "0.03" } m gegen bis zu { "142" } km Luftwiderstandsverschiebung; <c5/>).

# text
seg-b1b2ac9ac91e = Optionale DE440-Sonne und -Mond im Cowell-Propagator (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> nimmt jeden <c2/> (z. B. einen DE440-<c3/>) für die Terme des dritten Körpers und des SRP; sie lehnt einen Anbieter ab, der die Epoche nicht bedienen kann, zählt Rückfälle auf die analytische Reihe und ist standardmäßig aus. <c4/> behält die Zweiteilpräzision. Gegen Orekit { "12.2" } mit dessen eigenem DE440-Leser stimmen Bahnen von { "24" } h auf { "0.017" } m überein; der vorab registrierte Zielwert für die Position von Sonne und Mond wurde verfehlt ({ "6.4" } m / { "0.24" } m; SPICE zeigt dieselbe Lücke), daher MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Optionale atmosphärische S1-Gezeit (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> und <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabelle { "1" } Modell N1, Grade { "2" }–{ "6" }), aktiviert mit <c3/> bei <c4/> und <c5/>; standardmäßig aus. MODELLED (Koeffizienten gegen die veröffentlichte Tabelle erneut geprüft; keine externe unabhängige Referenz für die Kraftwirkung).

# text
seg-c62d816a93cf = Batch-Bahnbestimmung aus Range-Rate und Azimut/Elevation mit Elevationsmaske (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variationelle STM mit analytischen Zweikörper- und J2-Ableitungen), <c5/>, <c6/>; <c7/>. Der Pfad nur mit Entfernung bleibt unverändert. Verglichen mit der Batch-Kleinste-Quadrate-Methode von Orekit { "12.2" } über { "8" } vorab registrierte Szenarien: jeder Zielwert erfüllt, außer der rauschfreien Zustandsübereinstimmung (≤ { "1" } cm), die bei { "2" } von { "4" } Szenarien mit { "1.46" } und { "1.74" } cm verfehlt wurde, wobei kshana innerhalb von { "1e-8" } m der Wahrheit liegt; festgehalten, MODELLED.

# text
seg-223f1e39669f = SP3-Genauigkeitsgewichtung (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> und <c2/> bilden die Genauigkeitscodes aus Header und je Datensatz auf Beobachtungs-Sigmas ab; eine SP3-gewichtete Variante der Galileo-Anpassung (3D-RMS der Stufe 2 { "0.035" } m gegen { "0.070" } m ungewichtet) kommt neben den unveränderten aufgezeichneten Läufen hinzu. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Swarm-A-Dispatch-Job für den vollen Bogen (DS-PA-08)</b> in <c1/>.

# text
seg-cc5e8af7cb0d = Planetare Gravitation aus PDS-SHADR-Tabellen (CAP-30, Teil von CAP-31).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) liest Mars GMM-3 (Grad/Ordnung { "120" }) und GRAIL GL0660B (Grad/Ordnung { "660" }); <c3/> hängt jedes geladene Feld an (Standards unverändert). Ausschnitte bis Grad 20 sind mitgeliefert (NASA PDS, gemeinfrei; <c4/>); die vollständigen Dateien lädt <c5/>. VALIDATED gegen pyshtools { "4.14.1" } (innerhalb von { "4e-15" } der gesamten Gravitation bei Grad/Ordnung { "120" } über die ganze Kugel, { "5e-14" } bei Grad/Ordnung { "660" } für |lat| ≤ { "60" }°); die Verdrahtung im körperfesten Bezugssystem bleibt MODELLED (das native Bezugssystem jedes Feldes ist nicht das verwendete IAU-System).

# text
seg-afb5fbf86ffc = Gravitation hohen Grades bis Grad { "2190" } (RM-14, FUT-07).

# text
# c1: SphericalHarmonicField::acceleration_hf
# c2: potential_hf
# c3: prepare_high_degree
# c4: from_gfc_file
# c5: from_gfc_reader
# c6: scripts/fetch_egm2008.sh
# c7: KSHANA_EGM2008_GFC
# c8: propagator::FieldEvaluator
# c9: Geopotential
# c10: xval/
seg-28bc597b06b2 = <c1/> / <c2/> (modifizierte Vorwärtsspalte nach Holmes–Featherstone, kein Unterlauf, keine Polsingularität), <c3/>, ein streamender ICGEM-Lader <c4/> / <c5/> (Prüfungen von Norm und Maximalgrad, Gezeitensystem festgehalten, zeitvariable Terme abgelehnt) und <c6/> (vollständiges EGM2008, SHA-256 festgelegt, nicht mitgeliefert; Tests gesteuert über <c7/>). <c8/> wählt es beim optionalen <c9/> aus. Stimmt mit Orekit { "12.2" } auf { "7.3e-17" } m/s² bis Grad { "2190" } überein, und eine Bahn von { "24" } h mit { "200" }×{ "200" } stimmt auf { "0.13" } m überein. MODELLED: pyshtools verfehlte den vorab registrierten Zielwert nahe dem Pol (auf pyshtools zurückgeführt), und die Empfindlichkeitskontrolle der Bahn bei Grad 70 verfehlte ihren Zielwert ({ "0.73" } m < { "1" } m); beides ist in <c10/> festgehalten.

# text
seg-4ef4f74f21c1 = DOP853-Integrator (FUT-11).

# text
# c1: integrator::integrate_dop853
# c2: integrate_dop853_checked
# c3: integrate_dop853_dense
# c4: dop853_step
# c5: dop853_initial_step
# c6: propagator::Integrator::Dop853
# c7: propagate_dop853
# c8: propagate_dop853_checked
# c9: solve_ivp(method="DOP853")
# c10: xval/dop853-scipy/
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (dichte Ausgabe 7. Ordnung), <c4/>, <c5/>, mit einem Schrittwächter, der im Zweifel sperrt; <c6/>, <c7/>, <c8/>. Der Standardtreiber bleibt unverändert. VALIDATED gegen SciPy { "1.18.1" } <c9/>: Einzelschritte innerhalb von { "5.6e-15" }, übereinstimmende Schrittfolgen, Endzustände innerhalb von { "1.6e-12" } (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Robuster Kepler-Löser (FUT-12).</b> Neues Modul <c1/>: <c2/> (Startwert nach Markley { "1995" }, auslöschungsfreies Residuum) für alle { "0" } ≤ e < { "1" }, eingebettet in <c3/>. VALIDATED gegen mpmath-Wurzeln mit 50 Stellen auf { "0.9" } ε·|E| bis e = { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Optionale tesserale Erdgravitation im Cowell-Propagator (RM-09).

# text
# c1: propagator::ForceModel
# c2: geopotential: Option<Geopotential>
# c3: with_geopotential
# c4: with_egm2008(nmax)
# c5: SphericalHarmonicField
# c6: .gfc
# c7: EarthFixedFrame::Era
# c8: EarthFixedFrame::Cio
# c9: None
# c10: xval/cowell-tesseral-orekit/PREREGISTRATION.md
seg-e1a7ad42211e = <c1/> erhält <c2/> (<c3/>, <c4/>). Es wertet ein <c5/> (mitgeliefertes EGM2008 bis Grad/Ordnung { "70" } oder jede ICGEM-Datei <c6/>) in einem erdfesten Bezugssystem aus, das über den Erdrotationswinkel (<c7/>) oder die CIO-Kette GCRS-nach-ITRS (<c8/>) erreicht wird. Standard <c9/>: Keine bestehende Ausgabe ändert sich. VALIDATED gegen Orekit { "12.2" } Holmes–Featherstone über { "24" } h ({ "6" } Fälle, schlechtester Wert { "0.036" } m), mit den in <c10/> vorab registrierten Zielwerten.

# text
# c1: jd2::gmst82
# c2: cio::gcrs_to_itrs_matrix_jd2
# c3: frames::teme_to_itrf_jd2
# c4: itrf_to_teme_jd2
# c5: orbit::Propagator::position_in_frame_jd2
# c6: own_jd2_utc
# c7: From
# c8: jd2::Jd2
# c9: timescales::TwoPartJd
# c10: two_part_jd = true
# c11: ephemeris
# c12: gmst82
# c13: c2t06a
# c14: f64
# c15: f64
seg-957686bb351e = <b>Zweiteilige Julianische Daten durch die Erdrotation auf dem Bahnpfad</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> und <c6/>, <c7/>-Umwandlungen zwischen <c8/> und <c9/> sowie ein optionales <c10/> für das Szenario <c11/> (ECEF, Bodenspur und Stationsansicht; standardmäßig aus und unverändert, und der Schlüssel bleibt im Szenario-Hash weg, wenn er aus ist). Neue Registerzeile, VALIDATED gegen pyerfa <c12/>/<c13/> (vorab registriert b10475ee; { "40" } Daten: GMST bitgleich, Matrix innerhalb von { "2.7e-14" }, Rotation über Schritte von { "1" } µs innerhalb von { "1.1e-14" } rad, wo der Pfad mit einzelnem <c14/> sie verfehlt). Die Epoche des Cowell-Kraftmodells bleibt einzeln <c15/>; der Grund steht in seiner Dokumentation.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>EOP-Vorhersage über die Tabelle hinaus</b> (<c1/>, <c2/>): eine optionale Erweiterung einer IERS-Erdorientierungsreihe durch den LS+AR-Prädiktor, der an ihrer letzten Zeile ausgegeben wird, sodass die Bezugssystemargumente einer späteren Epoche der Vorhersage folgen, statt an der letzten Zeile zu klemmen. Antworten innerhalb der Tabelle sind bitgleich (getestet); die Reihe klemmt weiterhin, solange dies nicht aufgerufen wird. Die Genauigkeit der Vorhersage bleibt der bestehende LS+AR-Befund gegen Bulletin A (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Offsets dX, dY des Himmelspols auf der CIO-Kette</b> (<c1/>), und direkte ERFA-Vektorprüfungen von <c2/>, <c3/> und der neuen Funktion. Neue Registerzeile, VALIDATED gegen pyerfa (vorab registriert 979c1e39; { "40" } Epochen { "1950" }–{ "2100" }: Präzession und CIO bitgleich, TEME→GCRS innerhalb von { "1.1e-10" } rad, der vorhergesagte Effekt der zweitermigen Reihe der Äquinoktien-Gleichung). Bestehende Funktionen bleiben unverändert.

# text
# c1: timescales::tai_minus_utc_on_date
# c2: Jd2::from_utc_calendar
# c3: jd2::utc_to_tai
# c4: jd2::tai_to_utc
# c5: dtf2d
# c6: utctai
# c7: taiutc
# c8: f64
# c9: timescales::tai_minus_utc
seg-20d19a2d65ec = <b>UTC vor 1972 auf dem zweiteiligen Zeitpfad</b> (<c1/>, sowie <c2/>, <c3/> und <c4/> ab 1960-01-01): die Ära mit driftender Rate („Gummisekunde“), mit der Drifttabelle von SOFA, gebrochenen Schritten am Tagesende und der Skalierung des Tagesbruchteils von UTC auf SI. Neue Registerzeile, VALIDATED gegen pyerfa <c5/>/<c6/>/<c7/> (vorab registriert 23c40661; { "117" } Zeitpunkte { "1960" }–{ "1971" }, schlechtester Wert { "2.9e-11" } s gegen einen Zielwert von { "1" } µs). Jedes Ergebnis ab { "1972" } ist bitgleich (Prüfsumme vor der Änderung festgelegt). Vor { "1960" } ist TAI − UTC { "0" }, wie in SOFA. Das einzelne <c8/> <c9/> bleibt unverändert.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>GLONASS-Broadcast-Satellitenuhr</b> (<c1/>): <c2/> aus dem RINEX-Datensatz, zu einer auf der Satellitenuhr abgelesenen Zeit (zwei Festkomma-Iterationen, die RTKLIB-Konvention). Die geparsten <c3/> und <c4/> waren zuvor ungenutzt. Neue Registerzeile „GLONASS broadcast satellite clock and broadcast-orbit propagation“, VALIDATED gegen RTKLIB 2.4.2-p13 <c5/>/<c6/> (vorab registriert e099c42a; { "292" } Fälle in einer echten Broadcast-Datei von { "2013" }: Uhrendifferenz { "0" } s, schlechteste Position { "1.1" } mm gegen einen Zielwert von { "1" } cm). Library-Funktion; keine Szenarioausgabe ändert sich. Es wird keine Transformation PZ-90.11 → ITRF angewandt, und das Modul sagt das.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>PPP-Zeitlösung gegen die IGS-Stationsuhr</b> ({ "0.36" }, FUT-19): Die Empfängeruhr des Float-PPP-Filters auf WTZR stimmt mit der kombinierten IGS-Final-Uhr für die Station auf { "0.075" } ns (Standardabweichung) überein, mit einem konstanten Versatz von −{ "0.66" } ns über die konvergierten zwei Stunden. Die Zielwerte wurden in <c1/> vorab registriert. VALIDATED (neue Registerzeile). Neue Fixture <c2/>, die Stationsuhr-Datensätze der IGS-Final-Uhrendatei, die bereits für die Satellitenuhren verwendet wird.

# text
seg-463ac67600b1 = <b>PPP-Parität mit gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } wurde auf denselben WTZR-Eingaben als getrenntes Werkzeug ausgeführt (Apache-2.0-Kern; Prüfsumme des Downloads gegen die veröffentlichte Liste geprüft), mit der Kommandozeile eines vor dem Lauf eingecheckten verfahrensmäßigen Nachtrags. Bei ihrem ersten registrierten Lauf stimmen das Float-PPP von Kshana und das von gLAB bei { "240" } von { "240" } Epochen innerhalb von { "0.05" } m überein und bei der letzten auf { "5.0" } mm. Der SPP-Zielwert wurde verfehlt (Median { "1.187" } m gegen { "0.50" } m) und ist als Befund festgehalten: Die eigenen SPP-Lösungen von gLAB und RTKLIB unterscheiden sich voneinander um { "0.852" } m. Die registrierte Regel lässt daher die Teilstücke beider Werkzeuge insgesamt nicht erfüllt, während die PPP-Parität gilt.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>Lesen von RINEX-{ "4" }-Navigationsdateien</b> ({ "0.36" }, WP-07, PRO-41): <c1/> liest RINEX-4.00-4.02-Navigationsdateien (<c2/> GPS LNAV, Galileo I/NAV und F/NAV, BeiDou D1/D2, QZSS LNAV; andere Datensätze bis zum nächsten Datensatz-Header übersprungen), und <c3/> nimmt Optionen. VALIDATED gegen die zusammengeführte IGS-RINEX-{ "3" }-Datei desselben Tages: jedes dekodierte Feld identisch und { "0" } m in der Position. Das Lesen von RINEX 2/3 bleibt unverändert.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>BeiDou-GEO-Broadcast-Positionen</b> (optional): <c1/> und <c2/> (BDS ICD, Neigung −{ "5" } Grad). <c3/> überspringt GEOs weiterhin. MODELLED: Der vorab registrierte Vergleich mit einer präzisen Bahn ist datengesteuert und noch nicht gelaufen.

# text
seg-416f58111d1f = <b>RINEX-{ "4" }-Beobachtungsdateien</b>: Eine echte RINEX-{ "4.00" }-MGEX-Beobachtungsdatei wird in Tests gelesen (MODELLED, Formatkonformität).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK mit LAMBDA auf echtem RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, Doppeldifferenzen kurzer Basislinien aus Zweifrequenz-GPS-Code und -Phase mit einem Float-Kalman-Filter und ganzzahliger Fixierung nach LAMBDA (Ratio-Test). VALIDATED an den IGS-Stationen WTZR und WTZZ ({ "1.4" } m voneinander entfernt) gegen ihre ITRF2020-Basislinie unter vorab registrierten Zielwerten: nach den ersten zehn Minuten bei jeder Epoche fixiert, Basislinienfehler Median { "4.5" } mm und 95. Perzentil { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>RTKLIB-Parität des PPP mit Echtdaten</b> (RM-31): <c1/> und <c2/> mit vorab registrierten Zielwerten. RTKLIB v2.4.2-p13 PPP auf denselben WTZR-Eingaben stimmt bei der dritten Registrierung mit Kshana bei jeder Epoche der letzten zwei Stunden innerhalb von { "5" } cm überein ({ "9.7" } mm am Ende); die ersten beiden Läufe, als Befunde festgehalten, hatten die feste Gezeit aus und die Empfängerantenne auf dem Basis-Slot von RTKLIB. Der Zielwert für die Single-Point-Parität wurde verfehlt ({ "1.09" } m Median gegen { "0.5" } m). Das Teilstück mit gLAB ist nicht gelaufen (datengesteuert).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Kodierer für Navigationsnachrichten über LNAV hinaus</b> ({ "0.36" }, WP-07, PRO-40): <c1/> kodiert GPS CNAV (Nachrichtentypen { "10" }, { "11" }, { "30" }; CRC-24Q; kontinuierliche Kodierung mit Rate 1/2, K={ "7" }), Galileo I/NAV (Worttypen 1-5 in geraden/ungeraden nominalen Seiten; 30x8-Interleaver; Sync <c2/>) und Galileo F/NAV (Seitentypen 1-4; 61x8-Interleaver; Sync <c3/>), mit Test-Dekodierern. MODELLED: Round-Trips und bekannte Antworten aus dem ICD; eine vorab registrierte Prüfung, dass gesendete Galileo-Ephemeriden auf dem LSB-Raster des Kodierers liegen, hielt (schlechtester Wert { "3.6e-3" } LSB), verfehlte aber ihren Zielwert für die Satellitenzahl ({ "15" } von { "20" }), festgehalten. Die Kodierer sind Library-Funktionen; die Szenenanbindung ist nicht Teil dieser Änderung.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>IONEX-Dateileser</b> ({ "0.36" }, WP-07): <c1/> mit <c2/>, <c3/>, <c4/>, <c5/> und <c6/>: ein strenger IONEX-{ "1.0" }-Leser mit festen Spalten, mit Epochen, die ab dem Tag der ersten Karte gezählt werden, <c7/> als fehlend gelesen, RMS-Karten und den Zeitinterpolationen des Formats (nächste, aufeinanderfolgende und rotierte Karte); Slant-TEC auf der Schalenhöhe des Headers. Geprüft an einer eingecheckten synthetischen Karte und, datengesteuert (zur Testzeit mit festgelegter SHA-256 geladen, nicht mitgeliefert), an einem Ausschnitt eines echten CODE-GIM: jeder Knoten exakt; die Interpolation stimmt mit einer Formelreferenz auf { "4e-13" } TECU überein. <c8/> von RTKLIB stimmt auf { "3.6e-13" } TECU bei { "6885" } Punkten überein (vorab registriert B6). VALIDATED auf datengesteuerter Evidenz (Entscheidung des Eigentümers, 2026-10-13): Der Test schlägt bei jeder anderen Karte als der SHA-festgelegten fehl.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Hatch-Trägerglättung</b> ({ "0.36" }, WP-07): <c1/> und <c2/>, die divergenzfreie (ionosphärenfreie) Form im präzisen Single-Point-Aufbau. MODELLED mit festgehaltenem Befund: An der IGS-Station WTZR senkt sie den medianen Single-Point-Fehler von { "1.55" } m auf { "1.12" } m und das 95. Perzentil von { "3.47" } m auf { "3.21" } m, was unter der vorab registrierten Verringerung von { "40" } % bleibt (der verbleibende Fehler ist biasartig, kein Rauschen).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>Float-PPP auf echtem RINEX</b> ({ "0.36" }, WP-07): <c1/>, ein statischer Float-Filter für präzise Punktbestimmung auf echtem Zweifrequenz-GPS-Code und -Phase mit IGS-Final-Produkten (Antennenversätze und -variationen, feste Erdgezeit, Phase-Wind-up, Shapiro-Verzögerung, geschätzte feuchte Verzögerung, Erkennung von Cycle-Slips), mit <c2/>. VALIDATED an der zurückgehaltenen IGS-Station WTZR gegen ihre ITRF2020-Koordinate unter vorab registrierten Zielwerten: nach { "6" } h beträgt der Fehler { "1.5" } mm horizontal und { "2.9" } cm vertikal, und jede Epoche der letzten zwei Stunden liegt innerhalb von { "10" } cm.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>Interpolation der präzisen Uhren aus SP3</b> ({ "0.36" }, WP-07): <c1/> und <c2/> interpolieren die tabellierten SP3-Satellitenuhren linear zwischen den beiden einschließenden gültigen Knoten (Sentinel für schlechte Uhr übersprungen), und <c3/> übergibt sie an <c4/>, sodass die präzise Kette allein aus einer SP3 läuft. VALIDATED gegen die IGS-Final-Uhren von { "30" } s vom 2025-02-24 unter vorab registrierten Zielwerten: { "32" } GPS-Satelliten, RMS am Mittelpunkt { "0.121" } ns (Zielwert { "0.15" } ns), 95. Perzentil { "0.265" } ns (Zielwert { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM neben den Gütemaßen des Uhren-Holdovers</b> (CAP-05b): ein optionaler Abschnitt <c1/> in der Art clock meldet einen getrennten Block <c2/> (Snapshot-RAIM auf einem voreingestellten Himmel von einem genannten Standort: Urteil je Epoche und Schutzniveaus, Verfügbarkeit; nicht verfügbar, solange GNSS verweigert ist, nie extrapoliert). Die Holdover-Zahlen bleiben unverändert; ohne den Abschnitt ist die Ausgabe byteidentisch. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>Am JammerTest { "2024" } kalibrierte Schwellen für das Empfänger-Vertrauen</b> (CAP-13): eine vorab registrierte Kalibrierung der Monitore für C/N0-Abfall, AGC und Jamming-Indikator am öffentlichen JammerTest-Datensatz { "2024" } (zur Laufzeit geladen, nie mitgeliefert; <c1/>), nur als optionales <c2/> ausgeliefert ({ "1.5" } dB, { "3.5" } Sigma, { "29" }). Zurückgehalten: Die Zielwerte für AGC, Jamming-Indikator und Vereinigung bestehen; der Fehlalarm-Zielwert für C/N0 wird nicht bestanden ({ "0.023" } gegen { "0.02" }), daher ist die Zeile MODELLED (<c3/>). Standards und Ausgaben ohne das Profil bleiben unverändert.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>ARAIM-Fehlerhypothesen für mehrere Satelliten</b> (CAP-05a): die Teilmengenregel des ADD v4.2, über Paare hinaus verallgemeinert (<c1/>, <c2/>; Ordnung { "2" } ist genau der bestehende, von MAAST geprüfte Pfad) und ein optionales fortgeschrittenes RAIM über diese Hypothesen (<c3/>), das bei erkanntem Fehler die Teilmenge der größten Trennung meldet. Prioren, die tiefere Teilmengen brauchen, werden abgelehnt, nie gekürzt. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Skyline im Empfänger-Vertrauen</b> (FUT-01): Eine Empfänger-Vertrauens-Sitzung kann eine <c1/> angeben; Satelliten dahinter gehen für den Himmel verloren (<c2/>, <c3/>, <c4/>) und ihre Verluste werden als <c5/> eingestuft, nie als <c6/>; ohne sie sind der Azimutlücken-Rückfall und jede Ausgabe wie zuvor. Der Generator für Besatzungstraining erhält ein Ereignis <c7/> (ein blockierter Himmel, keine Störung) und das Szenario <c8/>. Der UERE-x-DOP-Monte-Carlo erhält die zwei Geometrien mit maskierter Skyline aus der Entwurfsnotiz, allein vorab registriert: alle { "26" } Prüfungen bestehen.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>Prüfung von Zeitstempeln nach RFC { "3161" }</b> (CAP-14): <c1/> prüft offline die Signatur eines Zeitstempel-Tokens (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 und P-384), seine ESS-Bindung an das Signaturzertifikat, die Verwendung timeStamping des Signierers und seine Kette zu einem vertrauenswürdigen Anker zur genTime des Tokens; <c2/> wendet es auf die <c3/> eines Pakets an (optional; ohne sie bleibt der Bericht unverändert). VALIDATED, eng gefasst: alle { "27" } selbst erzeugten Fälle stimmen bei Urteil und genTime mit OpenSSL { "3.0.13" } überein, unter einem Vergleich, der vorab registriert wurde, bevor der Prüfer geschrieben war. Der Widerruf wird nicht geprüft.

# text
# c1: figure_tiers
# c2: api::without_figure_tiers
# c3: lunar-station-coverage
# c4: figure_tiers
# c5: leo-ppp
# c6: solar-system
# c7: sweep
# c8: sweep-nd
# c9: lunar-attack-surface
seg-1b7777e600a8 = <b>Verifikationsstufen je Kennzahl für jede Art</b> (RM-04): Das Ergebnis jeder Szenarioart endet jetzt mit einem Block <c1/>, der ihre Kernzahlen nennt, die Zeile der Verifikationsmatrix, der jede gehört, und die aus dieser Zeile gelesene Stufe (Kennzahlen, die keiner Zeile gehören, werden als ohne Stufe aufgeführt). Der Block wird nach dem Lauf angehängt und lässt sich Byte für Byte auf das vorherige Dokument zurückführen (<c2/>). <c3/> hat kein <c4/>, bis eine neue datierte Vorhersage die eingefrorene ersetzt; <c5/>, <c6/>, <c7/> und <c8/> haben keine skalare Kernzahl, und <c9/> schreibt kompaktes JSON. Kampagnenmitglieder behalten ihre Dokumente ohne Stufe.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Quanten-Preset <c1/></b> (CAP-08c): ein mitgeliefertes Inertialszenario, in dem ein Kaltatom-Interferometer-Beschleunigungsmesser, spezifiziert durch seine Interferometer-Physik (<c2/> mit einem genannten Schwingungsniveau der Plattform), während eines GNSS-Ausfalls von 110 Minuten gegen einen Quarz-Beschleunigungsmesser in Navigationsqualität ausläuft. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Exakte äquivalente Freiheitsgrade nach Greenhall</b> (CAP-03): <c1/>, der vollständige Algorithmus von Greenhall und Riley ({ "2003" }) (Differenzordnungen { "1" } bis { "3" }, Rauschexponenten +{ "2" } bis -4, überlappend und nicht überlappend, modifiziert und unmodifiziert, mit den Tabellen für großes J), mit Hüllfunktionen für ADEV, MDEV und HDEV. VALIDATED unter einem vorab registrierten Vergleich mit allantools { "2024.6" }: { "4 876" } Rasterpunkte innerhalb von { "6.0e-13" } relativ; allantools scheitert bei { "32" } weiteren Punkten, die ohne Wert der unabhängigen Referenz festgehalten sind. Die Konfidenzintervalle von <c2/> sind Bit für Bit unverändert.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Fehlerterme des Kaltatom-Interferometers</b> (RM-26/27/28): Raman-Laser-Phasenrauschen (mit dem Term der Rückreflexionsverzögerung), der Wellenfront-Krümmungsbias einer thermischen Wolke (reine Defokussierung, mit einem Detektionsradius) und die Auflösung der Streifenmehrdeutigkeit (klassisch gestützt und zwei Abfragezeiten), als Library-Funktionen in <c1/>, jede geschlossene Form gegen Quadratur oder Monte Carlo geprüft. MODELLED; noch nicht aus einer Szenarioart erreichbar (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Uhrenprotokoll-Formate</b> (RM-03): <c1/> liest RINEX-Uhrendateien, Phasen- oder Frequenzprotokolle im ASCII-Stil von TimeLab und Zählerprotokolle des TAPR TICC in eine normalisierte Phasenreihe (tau0 angegeben oder gefunden, Lücken gezählt, eine Lückenregel). Optional: Eine Telecom-Timing-Reihe kann ein Protokoll benennen (<c2/>), und die Tabelle <c3/> eines Uhrenszenarios fügt einen Block <c4/> hinzu (ADEV, TDEV, MTIE). Ohne die Tabelle sind beide Arten byteidentisch (<a1><c5/></a1>). Ein vorab registrierter Vergleich an drei synthetischen Protokollen erfüllte seine Zielwerte für Phase und Anbindung; die Schätzer stimmen mit allantools innerhalb von { "2.5e-14" } überein, wo es auswertet, und es wertet den MTIE-Punkt der gesamten Aufzeichnung nicht aus (festgehalten). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Wander-Masken für die Frequenzsynchronisation</b> (RM-01): Die Art <c1/> erhält sieben MTIE- und TDEV-Masken für die Wander-Erzeugung bei konstanter Temperatur, ITU-T G.811 PRC, G.812 Typen I bis III, G.8262 EEC Optionen { "1" } und { "2" } und G.8262.1 eEEC, mit den Potenzgesetz-Stücken, die die Tabellen schreiben, und das Referenzszenario <c2/> (ein freilaufender OCXO gegen die EEC-Masken: Er scheitert bei { "1 000" } s, wo eine Regelschleife die Arbeit leisten muss). Jede Zeile wurde gegen den Text von itu.int erneut gelesen; G.812 (06/2004) wird durch eine vorab veröffentlichte Ausgabe 08/2026 abgelöst, die nicht gelesen werden konnte. MODELLED (eine Abschrift); bestehende Masken und Ausgaben bleiben unverändert.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Hinweise zum Filter-Prior für die Art <c1/></b> ({ "0.36" }, WP-09, Befund RM-21): Der Standard-Filter-Prior des Pakets passt zu einer IMU taktischer Qualität. Mit einer IMU in Navigationsqualität kann der Standard die fusionierte Auslaufphase schlechter machen als reine freie INS: { "52" } m gegen { "11" } m bei einem Flugzeugprofil mit { "70" } m/s. Setzen Sie <c2/> passend zur Qualität des Sensors, wie es die neuen Pakete für See, Schiene und Luftfahrt tun. Kein mitgeliefertes Szenario koppelt eine IMU in Navigationsqualität mit dem Standard-Prior: Jedes, das den Standard verwendet, hat Restverzerrungen des Beschleunigungsmessers von mindestens { "0.015" } m/s². Nur Dokumentation; keine Ausgabe ändert sich.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Mit den eigenen Lesern eines Simulators geprüfter Test-Bench-Export</b> ({ "0.36" }, WP-09, CAP-16): Die Bewegungsdateien von <c1/> aus { "8" } mitgelieferten Szenarien wurden von den Lesern für NMEA, Breite/Länge/Höhe und erdfeste Bewegung von gps-sdr-sim zurückgelesen (MIT, Commit 28ca29a6, als getrenntes Werkzeug über <c2/> verwendet; es wird keine Signalfunktion aufgerufen). Sie geben die exportierte Trajektorie auf { "1.2" } mm, { "0.15" } mm und exakt zurück. BEFUND: Der erdfeste Leser dieses Simulators kann die CSV mit voller Breite nicht aufnehmen, weil sein Zeilenpuffer von 100 Zeichen jede Zeile teilt. <c3/> nennt jetzt die zu verwendenden Spaltenschnitte und die Begrenzung des Simulators auf { "300" } s. VALIDATED (neue Registerzeile); die Bytes des Exports bleiben unverändert.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS auf dem KF-GINS-Datensatz</b> ({ "0.36" }, WP-09, FUT-17): Lader und Runner für <c1/> und das Hebelarm-Messmodell im geschlossenen EKF. Auf dem KF-GINS-Demodatensatz (zur Testzeit geladen, nicht mitgeliefert) beträgt der horizontale RMS von Kshana gegen die Referenztrajektorie { "1.09" } cm gegen { "1.11" } cm von KF-GINS selbst, und jeder vorab registrierte Zielwert wurde gehalten. VALIDATED auf datengesteuerter Evidenz (Entscheidung des Eigentümers, 2026-10-13): Der Datensatz wird mit SHA-256-Pins geladen, und der Reproduktionspfad steht in <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Gekoppelter PNT-Filter im Fusionspaket</b> ({ "0.36" }, WP-09, FUT-16): Die Art <c1/> nimmt eine optionale Tabelle <c2/>, die einen gestapelten Filter auf Pseudoentfernungen mit einem Bias-Zustand des Beschleunigungsmessers laufen lässt (<c3/>), und <c4/> ist die 3D-Version mit 8 Zuständen. Neues mitgeliefertes Szenario <c5/>: Mit verzerrten Beschleunigungsmessern hält der gekoppelte Modus die Position der Quanten-Suite auf { "18.7" } m (95. Perzentil) bei voller Integrität, wo die entkoppelten Filter { "430" } m erreichen. Ohne die Tabelle sind <c6/> und <c7/> unverändert (festgelegt); <c8/> lehnt die Tabelle ab. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>GNSS/INS-Pakete für See, Schiene und Luftfahrt</b> ({ "0.36" }, WP-09, RM-21): mitgelieferte Szenarien <c1/>, <c2/> und <c3/> auf der Trajektorienbibliothek und eine optionale Tabelle <c4/> für die Art <c5/>, die Pseudoentfernungen aus einer SGP4-Walker-Konstellation fusioniert (alle Satelliten im Normalfall, die höchsten wenigen bei Verschlechterung). Beim Schienenpaket hält die enge Kopplung die Lösung in Navigationsqualität bei { "5.3" } m durch einen Einschnitt und Tunnel, gegen { "12.9" } m bei loser Kopplung. Ohne <c6/> ist das Paket unverändert (festgelegt). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Enge Kopplung mit Trägerphase</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, ein Fehlerzustands-EKF mit ausdrücklicher Empfängeruhr mit zwei Zuständen und Float-Trägermehrdeutigkeiten, angetrieben von einer SGP4-Walker-Konstellation mit Klobuchar- und Saastamoinen-Korrekturen in der Messschleife, Slip-Erkennung über zeitdifferenzierte Trägerphase und Neuinitialisierung der Mehrdeutigkeiten, und einem Lauf nur mit Code auf denselben Messungen zum Vergleich. MODELLED: Bei einer Fahrt in Form einer 8 beträgt die Trägerlösung { "2.5" } cm gegen { "47" } cm nur mit Code, und NIS/NEES sind über die Seeds konsistent.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>GNSS/INS-Trajektorienbibliothek</b> ({ "0.36" }, WP-09, RM-24): Die Art <c1/> nimmt eine optionale Tabelle <c2/> mit <c3/>. Die Profile geben aus dem Wahrheitszustand Euler-Raten und Beschleunigung in Fahrtrichtung vor und leiten die wahre IMU aus der Kinematik starrer Körper ab (koordinierte Kurven, Steigflüge, Coriolis); <c4/> importiert eine Wahrheitstrajektorie (<c5/>) und löst die IMU, die sie reproduziert. Ohne die Tabelle fliegt das Paket seine historische Fahrt, Bit für Bit (festgelegt). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>DEM-Kacheln nach Breite/Länge für den lunaren Horizont</b>: <c1/> liest eine Textkachel <c2/> (Höhen über der mittleren Kugel auf einem Breiten-/Längenraster) anstelle der polar-stereographischen <c3/>, sowohl für <c4/> als auch für <c5/>; der Bericht gibt die Kachel wieder (<c6/>, mit ihrer SHA-256). <c7/> ist jetzt in das Ray-Marching des Horizonts eingebunden. Eine aus dem mitgelieferten Ausschnitt neu abgetastete Kachel gibt der Station den Horizont des Ausschnitts auf { "0.22" } Grad. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Gelände am Exportstandort des Service-Volumens</b>: Mit einem Abschnitt <c1/> trägt jede Zeile des Geometrie-Exports je Satellit von <c2/> den Wert <c3/> (der Satellit liegt über der flachen Maske und dem Horizont des Exportstandorts in seinem Azimut), der Bericht trägt den Horizont des Standorts (<c4/>), und das Laufzeit-CSV erhält die Spalte. Ohne Gelände ist der Export unverändert. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Kernfelder aus der Engine</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> und das WebAssembly-<c3/> geben für zwölf Arten an, welche Felder eines Szenarios seine Frage beantworten, die besten zuerst, als gepunktete Pfade (<c4/>). Das Studio liest sie vor seiner eigenen Rangfolge. Nur Anzeige-Metadaten: Die Engine liest sie nie, keine Szenariodatei braucht sie, kein Ergebnis hängt von ihnen ab. <c5/> schlägt fehl, wenn eine Art nicht versendbar ist oder ein Pfad in keinem der mitgelieferten Szenarien der Art gefunden wird (es fing zwei Pfade, die die abgeflachten IDs des Studios ohne die Array-Klammern geschrieben hatten).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Tabelle Art-zu-Modul aus der Engine</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> und das WebAssembly-<c3/> geben für jede Szenarioart, deren Zeilen der Verifikationsmatrix ein anderes Modul als ihr eigenes nennen, die Modulnamen an. Die Fähigkeitenkarte des Studios benutzte ihre eigene handgeschriebene Kopie; <c4/> schlägt fehl, wenn eine Art in der Tabelle nicht versendbar ist oder ein Modul in keiner Zeile der Matrix vorkommt. Keine Ausgabe hat sich geändert.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Kurzer IQ-Lauf im Browser-Build</b> ({ "0.36" }): <c1/> und <c2/> im WebAssembly-Modul bauen eine synthetische Szene, akquirieren jeden Satelliten und verfolgen die akquirierten, alles im Speicher, begrenzt auf { "0.25" } s, { "1 000 000" } Abtastwerte und { "8" } Satelliten. Der Szenenbauer und die Signalsuche nach Namen wurden aus dem nur nativen <c3/> (nach <c4/> und <c5/>) verschoben, sodass beide Builds sie teilen; die Ausgabe der Kommandozeile bleibt unverändert. Der native Test und <c6/> vergleichen dieselbe Anfrage Byte für Byte mit einem Golden-Wert (<c7/>): Seit der Änderung auf portable Mathematik (STUDIO-15, unten) liefern der Browser-Build und der native Build dieselben Bits.

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: ErrorKind
# c4: ProvenanceClass
# c5: KindMeta
# c6: FieldUnit
# c7: scenario_kinds()
# c8: error_kind()
# c9: run_typed
# c10: RunOutput
# c11: data
# c12: scenario_kinds
# c13: KindMeta[]
# c14: kshana.d.ts
# c15: error_kind
# c16: ErrorKind | ""
# c17: tests/typed_api_sync.rs
seg-c0eab9b97b7d = <b>Typisierte APIs für Python und TypeScript</b> (CAP-34): <c1/> typisiert die geschlossenen Vokabulare (<c2/>, jeder Artname; <c3/>; <c4/>) und die Wörterbücher <c5/> und <c6/>; <c7/> und <c8/> geben sie zurück. Das WebAssembly-Paket fügt <c9/> hinzu (ein Lauf als typisiertes Objekt <c10/> mit dem geparsten Dokument als <c11/>) und <c12/> (die geparsten <c13/>), und sein <c14/> trägt dasselbe Vokabular; <c15/> ist als <c16/> typisiert. <c17/> hält beide Listen gleich mit denen der Engine.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Einheiten für jede Spalte von <c1/></b> (FUT-28): Ein Ergebnis von <c2/> trägt jetzt <c3/> und <c4/>, die Einheit jedes durchgefahrenen Schlüssels und jeder aufgezeichneten Metrik, gelesen aus der eigenen Einheitentabelle des durchgefahrenen Pakets. Eine Achse kann <c5/> für einen Schlüssel angeben, den das Paket nicht ausgibt; eine angegebene Einheit, die der des Pakets widerspricht, wird abgelehnt, und eine Einheit, die keines von beiden angibt, ist <c6/>, nie geraten. <c7/> und <c8/> sind beschrieben, sodass jede der { "76" } Arten jetzt vollständig vom Einheiten-Gate der Felder abgedeckt ist (Obergrenze nicht abgedeckter Arten { "1" } -> { "0" }).

# text
# c1: RunOutput
# c2: RunOutput
# c3: array(path)
# c4: columns(path)
# c5: series()
# c6: numpy.ndarray
# c7: numpy.asarray
# c8: data()
# c9: kshana.pyi
seg-3a83af8daa43 = <b>NumPy-Arrays aus <c1/></b> (FUT-26): Das Python-Objekt <c2/> erhält <c3/>, <c4/> und <c5/>, die <c6/>s zurückgeben für eine numerische Liste, die numerischen Spalten einer Liste von Datensätzen oder jede Datensatzreihe im Dokument. Jedes Array ist gleich <c7/> derselben Werte aus <c8/> (dtype und Bits). NumPy wird nur importiert, wenn eines davon aufgerufen wird, und gehört nicht zu den Laufzeitanforderungen. Typisiert in <c9/> und mit stubtest geprüft.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Kampagnen-Optimierer</b> (CAP-32): Der neue, optionale Abschnitt <c2/> der Art <c1/> sucht ein bis drei Szenarioschlüssel innerhalb genannter Grenzen nach dem besten Wert einer Metrik: minimieren, maximieren oder einen Zielwert treffen. Er sucht erschöpfend auf einem Raster oder mit einem deterministischen, begrenzten Nelder–Mead-Simplex. Jede Auswertung ist ein echter Lauf der genannten Art und steht im <c3/> des Ergebnisses. Beispiel: <c4/>. Die Zielwerte wurden vorab registriert (<c5/>):

# text
seg-f4e79236b6bf = die Rosenbrock-Funktion ist erfüllt (f* = { "1.7e-20" });

# text
seg-3dbe3fdfebcf = eine 1D-Zielwertlösung in geschlossener Form ist erfüllt ({ "6e-15" } relativ);

# text
seg-5ab478e03354 = das Raster ist bitgleich mit einer unabhängigen Brute-Force-Suche;

# text
seg-ea0a04c6e713 = der Simplex schneidet in { "177" } Läufen mindestens so gut ab wie ein Raster von { "41" } × { "41" }.

# text
seg-161d8c5b55e8 = Der 1D-Zielwert von Runde { "1" } ist als NOT MET festgehalten, weil die vorab registrierte Box die Lösung ausschloss. MODELLED; Registerzeile „Bounded optimisation of one metric over campaign parameters“. Additiv: Kampagnen ohne den Abschnitt bleiben unverändert.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Kalibrierungs-Ensembles</b> (CAP-10): drei Prüfungen mit einzelnem Seed, erneut über { "200" } unabhängige Seeds gegen vorab registrierte Zielwerte gelaufen, in <a1><c1/></a1> (erzeugt von <c2/>; Werte je Seed in <c3/>).

# text
seg-b163e53e06e9 = Das { "95" }-%-Bootstrap-Intervall des Kampagnen-Monte-Carlo deckt den wahren Mittelwert bei { "192" } von { "200" } Ensembles ab, und seine Chi-Quadrat-Prüfung wird bei { "196" } bestanden.

# text
seg-022a7fbee13a = Die Perzentil-Toleranz mit einzelnem Seed wird nur bei { "183" } von { "200" } bestanden: NOT MET, wie vorhergesagt. Sie ist ein Zielwert von etwa 2 Sigma, festgehalten und nicht gelockert.

# text
seg-096f36d21b02 = Die ADEV-Kalibrierungen für weißes FM werden bei jedem Seed bestanden, mit ihrem schlechtesten Fehler weit innerhalb der Toleranz.

# text
# c1: Scenario
# c2: BuiltinKind
# c3: api::BuiltinKind
# c4: append_figure_tiers
# c5: inertial
# c6: spoof
# c7: passes
# c8: link-budget
# c9: jamming
# c10: tests/scenario_output_manifest.rs
seg-369c7f2a115c = <b>Eingebaute Arten über den Trait <c1/></b> (FUT-27, in Arbeit): der Trait <c2/> (<c3/>, mit einem Haken für die Stufe je Kennzahl und <c4/>) und die ersten Arten, die darauf umgestellt wurden (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Die Ausgabe bleibt unverändert: Ein Manifest des gesamten Katalogs mit der SHA-256 jeder Ausgabe ist vorher und nachher identisch (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>No-fetch-Prüfung des Playgrounds</b> (RM-07): <c1/> prüft drei Dinge:

# text
seg-3e424188f6e1 = Jedes Szenario der Studio-Bibliothek ist im Browser-Bundle enthalten;

# text
# c1: scenarios/
seg-2803ccf8b9ae = das Bundle ist byteidentisch mit <c1/>;

# text
seg-b98016a4a844 = jedes Browser-Szenario läuft aus einem leeren Arbeitsverzeichnis.

# text
# c1: gravity-map
# c2: [reference]
# c3: .gfc
# c4: gfc_path
# c5: gps-denied-gravity-nav-egm2008
# c6: [map_error_mc]
# c7: gravity-map-error-mc
# c8: combined-altpnt
# c9: [magnetic_grid]
# c10: csv_path
# c11: column
# c12: tools/fetch_emag2_tile.py
# c13: altpnt::sequential::run_sequential_trn_on_map
# c14: xval/terrain-slam-rbpf/
# c15: terrain-slam
# c16: xval/srtm-ungate/
seg-efc143b4f2a9 = <b>Alt-PNT-Karten: reales Schwerefeld, Monte Carlo der Kartenfehler, SRTM in voller Auflösung</b> ({ "0.36" }, WP-10). Die Art <c1/> nimmt ein optionales <c2/>: eine aus den mitgelieferten EGM2008-Koeffizienten synthetisierte Schwereanomalie (oder eine ICGEM-Datei <c3/> über <c4/>, nur native Builds). Diese Synthese stimmt mit dem ICGEM Calculation Service auf etwa { "1e-8" } mGal über { "794" } Knoten in zwei Regionen überein, gegen vorab registrierte Zielwerte von { "0.005" } mGal RMS und { "0.02" } mGal Maximum (VALIDATED; Registerzeile „Gravity-anomaly synthesis from a spherical-harmonic model“). Das neue mitgelieferte Szenario <c5/> lässt den 60-Minuten-Benchmark auf diesem realen Feld vom Grad 70 laufen. Vorab registriertes Ergebnis: angepasster Fehler { "3106" } m, daher ist der Zielwert < { "500" } m NOT MET, wie vorhergesagt (Grad { "70" } ist zu glatt), und die zehnfache Verringerung der Drift ist MET (MODELLED). Ein optionales <c6/> lässt den Benchmark erneut über Kartenfehler laufen, die mit Seed erzeugt und gaußsch korreliert sind, und meldet die Verteilung des angepassten Fehlers (mitgeliefertes Szenario <c7/>). Explorativ und nicht vorab registriert: Mit einem Kartenfehler von { "2" } mGal, korreliert über { "0.2" } Grad (die Größe, die der eigene Sigma-Haushalt des Matchers vorsieht), bleibt { "1" } von { "20" } Realisierungen innerhalb von { "500" } m (Median { "2.9" } km, p95 { "14.7" } km), gegen { "144" } m mit einer perfekten Karte. Die Fixierung des synthetischen Benchmarks unter 500 m nimmt an, dass die Karte exakt ist. Ohne eine der beiden Optionen ist das Dokument byteidentisch mit früheren Veröffentlichungen. <c8/> nimmt ein optionales <c9/> (<c10/>, <c11/>), das den magnetischen Kanal aus einer CSV im Format EMAG2v3 liest. EMAG2 wird nicht mitgeliefert, weil seine Bedingungen nicht eindeutig sind: <c12/> lädt es mit einer festgelegten SHA-256 und schneidet eine Box aus. Auf dem realen EMAG2-Raster wird kein Navigationsergebnis beansprucht. Gemeinsame Kartenschätzung (Terrain-SLAM, RM-18): <c13/> lässt den sequenziellen Geländenavigator über eine gespeicherte Karte fliegen, die von der Wahrheit abweicht, und vertraut ihr entweder oder schätzt mit einem Rao-Blackwell-Filter im Stil von FastSLAM eine Kartenkorrektur je Zelle. Vorab registriert gegen SITAN mit bekannter Karte bei einem korrelierten Kartenfehler von { "15" } m über { "20" } Seeds: ein mittlerer Gewinn von { "1.5" } %, besser bei { "10" } von { "20" }, daher sind beide Verbesserungs-Zielwerte NOT MET ({ "10" } % und { "12" } von { "20" }), ohne Schaden bei einer perfekten Karte (MET). Ein einzelner Durchgang ohne Wiederbesuche lässt die Karte nicht lernen (<c14/>, MODELLED). Dokumente von <c15/> sind byteidentisch. Die SRTM-Tests mit echten Daten laufen jetzt in CI auf zwei eingecheckten Ausschnitten in voller Auflösung; alle vorab registrierten Zielwerte sind erfüllt, wobei der nächste Knoten bei { "8" } von { "8" } Punkten GDAL { "3.8.4" } entspricht (<c16/>).

# text
seg-aa7ac7a47111 = <b>Interoperabilität, WP-08</b> ({ "0.36" }; jeder Punkt vorab registriert und allein eingecheckt vor seinem Lauf der unabhängigen Referenz, jeder eine neue Registerzeile VALIDATED, außer dem Telemetriepunkt, der eine bestehende Zeile erweitert):

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 und OCM { "3.0" } (Blöcke TRAJ, PHYS, COV, MAN, USER) in KVN und NDM/XML geschrieben und gelesen, und ein OMM in voller Genauigkeit aus einem SGP4-Elementsatz (<c2/>); die Ausgabe von <c3/> bleibt unverändert. Gegen Orekit { "13.1.8" } in beide Richtungen: { "27" } von { "30" } Kshana-Nachrichten werden in Orekit geparst, und Kshana liest jede von Orekit geschriebene, Werte innerhalb von { "1e-14" } relativ und Epochen innerhalb von { "1e-9" } s; vier Befunde festgehalten (Orekit verlangt <c4/>, lehnt <c5/> in benutzerdefinierten XML-Parametern ab, schreibt <c6/> nicht ohne <c7/> und liest relative OCM-Epochen unter TDB in SI-Sekunden). Das <c8/> des alten OMM-Schreibers wird von Orekit abgelehnt (festgehalten). Zeile „CCSDS Orbit Data Messages (OPM, OMM, OCM)“.

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 und APM { "2.0" } in KVN und XML gegen Orekit { "13.1.8" }, jeder Zielwert erfüllt; der APM-Schreiber von Orekit lehnt ein Manöver ohne <c3/> ab (festgelegt). Zeile „CCSDS Attitude Data Messages (AEM, APM)“.

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>SPICE-SPK-Export</b> (<c1/>): Schreiber und Leser für SPK-Typen { "9" } und { "13" } sowie OEM-nach-SPK-Export; gegen CSPICE N0067 sind die Kernel byteidentisch mit denen von SPICE und werten bitgleich aus. Zeile „SPICE SPK export (types { "9" } and { "13" })“.

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>SPICE-SPK-Typen { "3" } und { "21" }</b> (<c1/>): Segmente vom Typ { "3" } (Tschebyscheff) und vom Typ { "21" } (erweiterte Differenzzeilen), aus gegebenen Datensätzen geschrieben und so ausgewertet, wie SPICE es tut; gegen CSPICE N0067 sind die Kernel byteidentisch mit denen von SPICE, und jede Auswertung stimmt in beide Richtungen Bit für Bit überein. Zeile „SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)“.

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Erweiterungen für Space Packets</b> (<c1/>): Sekundär-Header mit den Zeitcodes CUC/CDS, Paketfehlerkontrolle, Segmentierung und Stream-Prüfungen, gegen ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } und CPython <c2/>, null Abweichungen. Zeile „CCSDS Space Packet secondary header, packet error control and segmentation“.

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Telemetrieschema { "1.3" } über echte Konsumenten</b>: die Prometheus-Exposition und das OTLP/HTTP-JSON eines synthetischen Streams nach Schema 1.3, einschließlich der Geometriereihe und des Labels <c1/>, exakt gelesen von prometheus_client und dem OTLP-Proto, von promtool { "3.5.0" } <c2/> ohne Lint-Problem akzeptiert und unverändert durch den OpenTelemetry Collector contrib { "0.135.0" } geleitet (datengesteuert: Werkzeuge mit festgelegter SHA-256 geladen, Ausgaben eingecheckt).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Mars-Bahnbestimmung, Lauf { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skaliert die Normalmatrix mit ihrer Diagonale und dämpft den Schritt (Levenberg-Marquardt), nachdem die registrierte Gauß-Newton-Anpassung an einer Matrix scheiterte, deren rohe Diagonale acht Größenordnungen umspannt. Gesondert registriert (<c2/>, derselbe Bogen, dieselben Zielwerte und Bearbeitung). Auf den bewerteten MRO-Überflügen liegt die Bahn innerhalb von { "0.36" } km RMS ({ "0.53" } km Maximum) der MRO-Navigationsrekonstruktion, Zielwerte erfüllt. Der Doppler nach der Anpassung beträgt { "48.6" } mHz gegen den Zielwert von { "30" } mHz, nicht erfüllt (Befund festgelegt). Ein Nachtrag nur zur Bewertung, R2-A1, ist in <c3/> offengelegt. Die Zeile bleibt MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Mars-Modell des Ramped-2-Wege-Dopplers und Bahnbestimmung</b> ({ "0.36" }, WP-14, Teil von CAP-30, Stufe { "2" }): <c1/> sagt den Ramped-2-Wege-Doppler im X-Band des DSN aus ODF-Rampentabellen vorher (Lichtlaufzeit, Shapiro, Troposphäre, Stationszeit, DSN-Stationen über die CIO-Kette und IERS-EOP) und passt einen Mars-Orbiter an (GMM-3, dritte Körper, SRP, Luftwiderstand). <c2/> liest SPK-Typ { "1" } (gegen CSPICE geprüft) und <c3/> liest PDS-SHADR-Felder. Vorab registriert gegen die MRO-Navigationsrekonstruktion an echten MRO-Überflügen (datengesteuert, <c4/>, monatliches CI): Der vorhergesagte Doppler stimmt mit den Beobachtungen auf { "12.5" } mHz überein (Zielwert { "30" } mHz, erfüllt); die registrierte Bahnanpassung scheiterte auf dem bewerteten Bogen und lieferte keine Bahn (Befund festgelegt). Die Zeile bleibt MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>Leser für DSN Orbit Data Files</b> ({ "0.36" }, WP-14, Teil von CAP-30): <c1/> liest ODFs nach TRK-2-18. An einer echten ODF des Mars Reconnaissance Orbiter (NASA PDS, mitgeliefert) stimmt der Leser mit der Datensatzzahl, den Gruppenpositionen, Stationen und Zeiten des PDS-Labels überein, und alle seine Datentypen sind bekannt. Die Tabelle am Dateiende im Label hat eine Zeile weniger als die Datei, eine Inkonsistenz des Labels, als Befund festgehalten. MODELLED. Die Bahnbestimmung mit diesen Daten ist noch nicht erfolgt.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>TWSTFT-Budget und Stabilität der Zeitübertragung: die Art <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Zwei-Wege-Gleichung:

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> löst sie nach T_A − T_B mit den Geräteverzögerungen der Stationen, der Ionosphären-Asymmetrie im Ku-Band zwischen Auf- und Abwärtsstrecke, der Differenz der Transponderverzögerung und den Sagnac-Termen und gewinnt das Vorwärtsmodell auf { "1e-15" } s zurück.

# text
seg-a5468765380d = <b>Unsicherheitsbudget:</b> quadratisch kombiniert, mit dem TDEV der Verbindung als Typ-A-Term.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Verbindungsrauschen:</b> Die Zwei-Wege-Reihe erhält einen Flicker-Phasenrauschboden, eine tageszeitliche Nicht-Reziprozität und einen konstanten Reziprozitätsrest. Das Paket <c1/> mit weißem Jitter bleibt unverändert.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Reale Reihen:</b> die Stabilität gelieferter Reihen von BIPM Circular T, <c1/>-CSV oder IGS-Stationsuhren.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Neues mitgeliefertes Szenario <c1/>. Die PPP-Zeitlösung ist gesondert gegen die IGS-Stationsuhr VALIDATED, im GNSS-Zweig mit Echtdaten.

# text
seg-ae33b92da4a6 = <b>Eintrittsheizung, EO-Radiometrie und Aufstiegsverluste</b> ({ "0.36" }, WP-14, CAP-28): drei neue Arten.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/>: ein Eintritt eines Massenpunkts mit 3 Freiheitsgraden über einer rotierenden Erde oder einem rotierenden Mars, mit Staupunktheizung nach Sutton-Graves.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/>: SNR des Imagers, MTF bei Nyquist, relative Kantenantwort und GIQE-{ "4" }-NIIRS.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/>: ein aus mehreren Stufen bestehender Aufstieg mit Schwerkraftkurve, mit Verlusten durch Gravitation, Luftwiderstand, Lenkung und Gegendruck, geprüft über die exakte Identität ideales dv minus Verluste.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = Die maximale Verzögerung beim Eintritt wurde unter einem vorab registrierten Zielwert gegen den veröffentlichten Stardust-Nominalwert geprüft: { "35.44" } g gegen { "33.4" } g (+{ "6.1" } %, Zielwert { "10" } %). Diese Zeile ist VALIDATED. Heizung, Radiometrie und Aufstieg sind MODELLED. Ebenfalls neu: <c1/>, mitgelieferte Szenarien <c2/>, <c3/> und <c4/> sowie <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Lageregelung mit Reaktionsrädern: die Art <c1/></b> ({ "0.36" }, WP-14, CAP-21). Ein Schwenk mit inertialer Ausrichtung eines starren Hubs mit drei oder mehr ausgewuchteten Reaktionsrädern unter MRP-Rückführung, mit Raddrehmomenten kleinster Norm, die auf das Limit jedes Motors begrenzt sind (<c2/>). Sie kann die Schleife auch über einen multiplikativen EKF aus einem simulierten Gyro und Sternsensor schließen (<c3/>). Die Schleife mit wahrem Zustand wurde mit Basilisk { "2.9.1" } an drei Fällen verglichen, die vorab registriert wurden, bevor der Code existierte (drei orthogonale Räder, eine Vierrad-Pyramide, ein Sättigungsfall). Jede MRP-Komponente, Körperrate, Raddrehzahl und jedes Motordrehmoment stimmte an jedem Abtastwert überein, schlechtester Wert { "2.4e-14" } bei Sigma und { "2.9e-11" } rad/s bei der Raddrehzahl. Diese Zeile ist VALIDATED; der MEKF ist MODELLED (NEES-Konsistenz). Neue mitgelieferte Szenarien <c4/> und <c5/> sowie <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Planung von Bodenkontakten und DVB-S2-ACM</b> ({ "0.36" }, WP-14, CAP-22/23): zwei neue Szenarioarten. <c1/> liefert für einen Satelliten über einer Station das Es/N0 jedes Überflugs und das entlang davon gewählte DVB-S2-MODCOD (Schwellen aus ETSI EN { "302" } 307-1 Tabelle { "13" } plus eine Reserve). Es liefert auch das Datenvolumen, das ACM gegenüber der Basislinie mit konstanter Kodierung bewegt. <c2/> tut dasselbe für mehrere Satelliten über mehreren Stationen und baut einen konfliktfreien Kontaktplan (Antennenumlauf, eine Station je Satellit, prioritätsgewichtete Auslieferung, bei jedem Rückstand gedeckelt). Es meldet einen Greedy-Plan nach Grenzwert, eine Basislinie nach Eingangsreihenfolge und bei kleinen Mengen das exakte Optimum, mit der Optimalitätslücke des Greedy-Plans. Zugangsfenster stammen aus dem VALIDATED Prädiktor für scheinbare Überflüge. Neue mitgelieferte Szenarien <c3/> und <c4/> (illustrative Eingaben) sowie <c5/>. MODELLED (zwei neue Registerzeilen).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Starlink-Doppler-Positionierung gegen ein veröffentlichtes Experiment</b> ({ "0.36" }, WP-14, Teil von CAP-11, MODELLED). Dies ist ein vorab registrierter Stellvertreter-Vergleich des Doppler-Modus von <c1/> mit dem Preset <c2/> gegen die Perzentile des Datensatzes 3 aus „Unveiling Starlink for PNT“ (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Das Modell verwendete { "3" } Satelliten (eine Maske von { "47" } Grad, nach einer festen Regel gewählt), keine Höhenstützung und ein Doppler-Sigma von { "30" } Hz, über { "200" } Seeds. Sein 90.-Perzentil des 3D-Fehlers beträgt { "92.2" } m bei { "20" } s und { "870" } m bei { "8" } s, gegen die veröffentlichten { "2" } m und { "10" } m, daher sind beide Zielwerte vom Faktor zwei NOT MET. Das Modell ist pessimistisch, nicht optimistisch wie vorhergesagt: drei feste Satelliten geben weit weniger geometrische Vielfalt als die { "63" } Satelliten des Experiments über { "10" } Minuten mit Kanalwechsel alle { "15" } s. Beide Fehlschläge sind festgeschrieben (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Optimierer für impulsive Transfers auf DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> findet die Abflug- und Ankunftsdaten eines ballistischen Zwei-Impuls-Transfers mit einem Umlauf, die das Abflug-C3 oder das Ankunfts-V-unendlich innerhalb von Typ I oder Typ II minimieren. Er durchsucht ein Raster von 2 Tagen und verfeinert dann mit Nelder-Mead in 2D, auf heliozentrischen Zuständen aus dem DE440-Kernel; er baut auf <c2/> auf. Der Vergleich wurde vorab registriert (bf0439e8) gegen einen unabhängigen Optimierer aus SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } an der Gelegenheit Erde-Mars von { "2026" }: alle vier Optimierungen stimmen auf { "8.7e-13" } relativ überein, mit Daten innerhalb von { "1e-5" } Tag (VALIDATED, neue Registerzeile). Als sekundäre veröffentlichte Referenz wird NASA/TM-2010-216764 (das Handbuch Erde-Mars 2026-2045) beim minimalen C3 des Typs II ({ "9.182" } gegen { "9.144" }) und beim minimalen Ankunfts-V-unendlich des Typs II ({ "2.564" } gegen { "2.565" }) getroffen. Sein minimales C3 des Typs I wird nicht getroffen: { "10.535" } gegen { "11.11" } (-5.18 %), wo die unabhängige Referenz der Bibliothek mit Kshana übereinstimmt. Dieser Fehlschlag ist festgehalten und festgeschrieben.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Studie zur lunaren Referenzstation</b> ({ "0.36" }, angeregt durch veröffentlichtes Material zu einer geplanten Referenzstation am lunaren Südpol; Quellen in <a1><c1/></a1>): die Art <c2/>, ein Monte-Carlo-Durchlauf des lunaren differenziellen PNT-Modells über ein südpolares Nutzerraster und einen Tag von Epochen, der je Punkt und über die Region den Perzentilfehler mit und ohne Korrektur, die Verfügbarkeit mit Gründen, die Abdeckung gegen eine genannte Schwelle, Schutzniveaus, den Abdeckungsradius je Azimut und das Budget der Korrekturstrecke liefert. Sie reduziert sich bei einem Punkt, einer Epoche und einem Versuch exakt auf <c3/>; ihre Arithmetik wurde unter einem vorab registrierten Zielwert mit numpy neu berechnet (Positionen und Perzentile erfüllt; die Stationskorrekturen verfehlten ihren durch Rundung in doppelter Genauigkeit, festgehalten). MODELLED; Registerzeile „Lunar reference-station coverage and accuracy map“. Nicht mit einer Behörde verbunden oder von ihr unterstützt; keine Aussage über die Leistung irgendeines realen Systems.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Vorab registrierte Vorhersage: Abdeckung der lunaren Referenzstation</b> (keine Validierung; MODELLED). <a1><c1/></a1> friert bei Commit c05dac1d die Ergebnisse von <c2/> unter den öffentlich genannten Annahmen ein, mit SHA-256-Hashes der Eingaben und Ergebnisse und einem jetzt festgelegten Bewertungsprotokoll (Faktor { "2" } für Genauigkeiten und Schutzniveaus, { "10" } Prozentpunkte für Verfügbarkeit und Abdeckung; eine geänderte Annahme erhält eine neue datierte Vorhersage, nie eine Bearbeitung; ein Fehlschlag wird ebenso deutlich veröffentlicht wie ein Treffer). Jede Zahl wird vom unveröffentlichten Elementsatz der Konstellation mit vier Satelliten bestimmt, der ILLUSTRATIVE ist und das auch sagt. <c3/> schützt sie; <c4/> erhält einen Abschnitt „Pre-registered predictions“. Keine Registerzeile.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Erweiterungen der lunaren Referenzstation</b> ({ "0.36" }; die Einschränkungen { "2" } und { "3" } der Stationsstudie und der Lösungsstil der Quellen), jede optional bei <c1/> und standardmäßig nicht vorhanden, sodass jedes bestehende Dokument, auch die eingefrorene Vorhersage, unverändert ist: <c2/> (Mehrwegeausbreitung <c3/> beim Nutzer und bei der Station, bei der Station wahlweise Gauß-Markov über Epochen, DLL-Coderauschen aus C/N0, Bias zwischen Kanälen; Werte auf dem Mond ILLUSTRATIVE); <c4/> (lineares Wachstum des Broadcast-Bahnfehlers über die Latenz der Korrektur, ILLUSTRATIVE); <c5/> (Höhenbedingung, ein Minimum von drei Satelliten damit, ein Fenster für statische Nutzer über Epochen). Zwei Nachträge zum Vergleich mit den veröffentlichten Behauptungen, jeder allein vor seinem Lauf vorab registriert, stehen neben dem unveränderten aufgezeichneten Lauf: K5 mit Wachstum scheitert bei jeder Rate; mit dem Lösungsstil der Quellen scheitern K1 bis K5 und K6 besteht ({ "1" } von { "6" }), wobei der korrigierte 3D-Fehler im p95 von R300 von { "280.6" } m auf { "2.11" } m fällt. MODELLED; drei Registerzeilen.

# text
# c1: [terrain]
# c2: lunar-station-coverage
# c3: moonlight-service-volume
# c4: station_horizon
# c5: user_horizon
# c6: dem_path
# c7: LDEM_75S_240M
# c8: data/lunar-dem/
# c9: scripts/make_lola_south_polar_crop.py
# c10: scenarios/lunar-station-coverage-terrain.toml
seg-1d0a0dcd42de = <b>Maske des lunaren Geländehorizonts</b> ({ "0.36" }; die erste Einschränkung der Studie zur lunaren Referenzstation): ein optionaler Abschnitt <c1/> bei <c2/> (die Station und jeder Nutzerpunkt) und <c3/> (jeder Rasterpunkt) gibt jedem Standort einen azimutabhängigen Horizont im Format der Skyline-Tabelle von { "0.36" }, aus einem genannten Profil, das mit seiner Quelle gekennzeichnet ist (<c4/>, <c5/>), und/oder aus einem Ray-Marching über ein polares DEM (<c6/>) entlang von Großkreisen der Mondkugel mit exakter Krümmung. Liefert einen Ausschnitt von { "0.98" } MB des gemeinfreien südpolaren LRO-LOLA-DEM <c7/> mit, { "5" } x { "5" } blockgemittelt neu abgetastet auf { "1200" } m (<c8/>, mit seiner NOTICE, SHA-256 und <c9/>), und das nur im Repository liegende Szenario <c10/>. Geprüft gegen Horizonte in geschlossener Form (bloße Kugel, Krater in einem Plateau, gerasterter Kegel); MODELLED, Registerzeile „Lunar terrain horizon masks from a stated profile or a polar DEM“. Ohne den Abschnitt ist jedes Dokument, den Einheitenblock eingeschlossen, byteidentisch.

# text
# c1: receiver-trust
# c2: good
# c3: degraded
# c4: few-satellites
# c5: high-pdop
# c6: high-hdop
# c7: sky-blocked
# c8: unknown
# c9: orbit::dop
# c10: good
# c11: fair
# c12: poor
# c13: geometry
# c14: geometry
# c15: environment
# c16: inconsistency
# c17: loss-of-lock
# c18: geometry
# c19: inconsistency
# c20: [geometry]
# c21: signal_loss
# c22: environment
# c23: cap_points
# c24: full_ratio
# c25: floor
# c26: degraded_min
# c27: [geometry]
# c28: min(cap_points, 100 - floor)
# c29: [score]
# c30: degraded_min
# c31: degraded_min
seg-ca0c6ca7396a = <b>Geometriebewusstes Vertrauen</b> (Entwurfsnotiz zur Geometrie von { "0.36" }, Abschnitt { "4" }). Jede Epoche von <c1/>, statisch oder Schiff, Batch oder live, trägt ihre Satellitengeometrie: <c2/>, <c3/> (Gründe <c4/>, <c5/>, <c6/> und informativ <c7/>) oder <c8/>, wo das Protokoll keine Satellitengeometrie angibt, mit HDOP, PDOP, VDOP und den verwendeten Satelliten. Sie wird aus den Elevationen und Azimuten abgeleitet, die der Empfänger meldet (NMEA GSV, UBX NAV-SAT), über den bestehenden Kernel <c9/>, oder aus NMEA GSA übernommen. Jede Epoche trägt außerdem ein Label, <c10/>, <c11/> oder <c12/>, stets gemeldet und nie bewertet, und eine Notiz mit HDOP, PDOP, VDOP, Satellitenzahl und Signalverlust in Worten. Der Wert eines Schiffs erhält einen Monitor <c13/>, der nichts abzieht, solange die Geometrie nicht schlecht ist (HDOP über { "4" }, PDOP über { "6" } oder weniger als { "5" } verwendete Satelliten), und dann bis zu einer Obergrenze von { "15" } Punkten ansteigt; die Geometrie allein erreicht höchstens das Band „beeinträchtigt“, nie das nicht vertrauenswürdige (kein Alarm). Jeder Abzug erhält eine Klasse, <c14/>, <c15/> oder <c16/>, sodass ein schlechter Himmel nicht als Angriff gelesen wird. <c17/> ist <c18/>, wenn die verlorenen Satelliten bei ihrer letzten Meldung alle unter { "15" } Grad lagen; ein Abzug wegen schlechter Geometrie ist <c19/>, wenn der vom Empfänger genannte HDOP um mehr als max({ "1.0" }, { "25" } % des abgeleiteten HDOP) von seinem genannten Himmel abweicht, sodass ein gefälschter schlechter Himmel das Label nicht erkaufen kann. Eine neue Tabelle <c20/> nennt jede Schwelle mit ihrer Herkunft (HDOP { "4" }, PDOP { "6" }, mindestens { "5" } verwendet, sigma_UERE { "1.5" } m, eine HDOP-Toleranz von max({ "1.0" }, { "25" } % des abgeleiteten HDOP), wobei { "25" } % eine repräsentative Wahl für Empfänger mit Uhren je Konstellation oder Teilmengenlösungen ist, { "15" } Grad; die Zahlen aus IEC 61108-1 und GPS SPS wie zitiert, gegen den Text der Normen zu prüfen). Ein vollständiger Signalverlust wird nicht als Himmel etikettiert: Wenn sichtbare Satelliten nicht verfolgt werden und der DOP der sichtbaren Satelliten gut ist (und die nicht verfolgten nicht auf eine Hälfte des Horizonts beschränkt sind), trägt die Epoche <c21/>, und der Geometrieabzug ist <c22/>. Ein genannter HDOP oder PDOP von { "99" } oder mehr, GGA-Qualität { "0" } und GSA-Modus { "1" } werden als keine Lösung gelesen, nicht als DOP. Die Obergrenze (<c23/> { "15" }), das Ende der Rampe (<c24/> { "1.5" }) und die Untergrenze (<c25/>, Standard der <c26/> des Werts) stehen in <c27/>, ebenso die guten Stufen des Labels (HDOP { "2" }, PDOP { "3" }, { "6" } Satelliten, repräsentativ); die geltende Obergrenze ist <c28/>, sodass eine Tabelle <c29/>, die <c30/> anhebt (auch eine von { "0.35" }), die Obergrenze senkt, statt abgelehnt zu werden, und eine Untergrenze unter <c31/> abgelehnt wird. MODELLED; Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
# c1: epochs[].geometry
# c2: class
# c3: geometry_model
# c4: geometry_summary
# c5: receiver_trust
# c6: assess_vessel_log
# c7: receiver_trust_replay
# c8: assess_*
# c9: epochs.json
# c10: config.json
# c11: trust-telemetry
# c12: kshana_trust_geometry*
# c13: class
# c14: kshana_trust_reason_active
# c15: kshana.geometry.*
# c16: cs6
# c17: cfp3
# c18: cfp4
# c19: geoStatus
# c20: geoHdop
# c21: geoClass
# c22: kshana_trust_geometry_label{label}
# c23: kshana_trust_geometry_vdop
# c24: kshana.geometry.label
# c25: kshana.geometry.vdop
# c26: geoLabel
# c27: geoPdop
# c28: geoVdop
# c29: geoUsed
# c30: cs6
# c31: cn1
# c32: geometry_summary.hdop_mismatch
# c33: degraded
# c34: kshana_trust_geometry_signal_loss
# c35: kshana.geometry.signal_loss
# c36: geoSignalLoss=1
# c37: environment
# c38: cs6
seg-d976d3495695 = Die Geometrie erreicht jede Oberfläche: das Ergebnis-JSON (<c1/>, <c2/> bei jedem Abzug, <c3/>, <c4/>), die Live-JSON-Zeilen (Schema { "1.3" }), die Python- und WebAssembly-Funktionen <c5/>, <c6/> und <c7/>, die MCP-Werkzeuge <c8/>, Nachweispakete (<c9/>, <c10/>, eine Geometriespur auf der Zusammenfassungsseite) und <c11/> (Prometheus <c12/> und ein Label <c13/> bei <c14/>, OTLP <c15/>, benutzerdefinierte CEF-Felder <c16/> (Geometriestatus und Klassen), <c17/> (HDOP) und <c18/> (PDOP), gegen beide CEF-Parser der unabhängigen Referenz geprüft, und LEEF <c19/>, <c20/>, <c21/>). Das Geometrie-Label wird ebenfalls exportiert, nach jeder früheren Reihe und jedem früheren Feld angehängt und nur für Eingaben, die es tragen: Prometheus <c22/> und <c23/>, OTLP <c24/> und <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, und CEF ein drittes Feld <c30/> (das Label) und <c31/> (verwendete Satelliten); der VDOP steht nicht in CEF (die benutzerdefinierten Gleitkommafelder sind vergeben). Beide CEF-Parser der unabhängigen Referenz lesen die Label-Fälle wie geschrieben zurück (Nachtrag { "5" }: { "176" } Zeilen, { "172" } von pycef geparst, { "176" } von Logstash). Ein genannter HDOP, den der genannte Himmel nicht erklärt, wird bei jeder Epoche markiert und gezählt (<c32/>, eine Zeile auf der Zusammenfassungsseite des Nachweises), und nur bewertet, wenn die Geometrie schlecht ist. Der Signalverlust wird für sich exportiert, da der Geometriestatus <c33/> bleibt, solange er besteht: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; in CEF erscheint er als Klasse <c37/> in <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/>: der Kovarianzfaktor <c2/> hinter <c3/>, mit derselben Arithmetik daraus herausgelöst.

# text
seg-c6cc061a3ed6 = Registerzeile „Position error from geometry: RMS error = sigma_UERE x DOP“ (<b>MODELLED</b>, interne Konsistenz): ein Monte-Carlo-Lauf mit Seed des Fixes der Engine nach kleinsten Quadraten auf den { "8" } mit gnss_lib_py abgeglichenen DOP-Geometrien gegen den Kovarianzfaktor des validierten DOP-Kernels, mit Toleranzen, die vor dem ersten Lauf vorab registriert wurden, und zwei Negativkontrollen, die wie verlangt scheitern; daneben eine frühere Prüfung an vier von Hand gewählten Himmeln mit Chi-Quadrat-Konfidenzintervallen, berichtet als vor der Vorregistrierung gelaufen.

# text
# c1: src/skyline.rs
# c2: docs/SKYLINE.md
# c3: max(mask_deg, skyline)
# c4: city-street
# c5: harbour-approach
# c6: fjord
# c7: container-terminal
# c8: [skyline]
# c9: gnss-sim
# c10: jamming
# c11: leo-pvt
# c12: leo-pass
# c13: nmea-scenario
# c14: orbit
# c15: integrity
# c16: user_site = { lat_deg, lon_deg, height_m }
# c17: epoch + t
# c18: epoch
# c19: user
# c20: skyline { source, open_fraction, provenance }
# c21: masked_by_skyline
# c22: orbit-urban-canyon-skyline
# c23: integrity-harbour-approach
# c24: gnss-sim-container-terminal-skyline
# c25: jamming-harbour-approach-skyline
# c26: leo-pvt-fjord-skyline
# c27: leo-vertical-autonomous-vehicle-skyline
seg-b87b6eafd465 = <b>Azimutabhängige Skyline-Masken</b> (<c1/>, <a1><c2/></a1>, Punkt { "1" } der Entwurfsnotiz): ein von Azimut abhängiger Elevationsschnitt, das punktweise Maximum von Tabellen (jede für sich interpoliert, bei { "360" }° umbrochen), eine Straßenschlucht in geschlossener Form (mit optionalen offenen Enden), scharfkantige Sektoren und ein Geländeprofil mit der Krümmung der Erde; der wirksame Schnitt ist <c3/>. Vier REPRESENTATIVE Presets mit genannter Herkunft (<c4/>, <c5/>, <c6/>, <c7/>), Feld für Feld überschreibbar. Ein optionaler Abschnitt <c8/> in den Trainingsdateien <c9/>, <c10/>, <c11/> (jeder Modus, der polare Durchlauf eingeschlossen), <c12/> und <c13/> sowie in <c14/> und <c15/> über einen neuen Bodenstandort-Nutzer, <c16/> (geodätische Blickwinkel auf der rotierenden Erde, mit dem geodätischen Oben für die horizontale und vertikale Aufteilung bei ARAIM; jeder Abtastwert ist ein absoluter Zeitpunkt, <c17/>, auf den Elementsätze, Broadcast-Ephemeriden und SP3-Dateien von ihren eigenen Epochen aus fortgeschrieben werden, datiert von der neuesten Satellitenepoche, wenn keine <c18/> angegeben ist; ein umlaufender <c19/> lehnt eine Skyline ab). Ergebnisse erhalten <c20/> und je Abtastwert <c21/>. Ohne den Abschnitt ist jedes Szenario byteidentisch mit { "0.35.0" }, geprüft gegen Digests vom Release-Commit. Sechs mitgelieferte Beispiele: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> und die Kampagne <c27/> (die Schlucht des autonomen Fahrzeugs als flacher Schnitt und als Straße; die bestehende Kampagne bleibt unverändert). MODELLED.

# text
# c1: src/geometry.rs
# c2: sky_geometry
# c3: tle
# c4: epoch
# c5: sky_source
# c6: sky_statement
# c7: tle_skipped
# c8: sky_monte_carlo
# c9: skyline_presets
# c10: skyline_profile
# c11: skyplot_svg
# c12: orbit::dop_cov
# c13: orbit::dop
# c14: kshana sky
# c15: kshana skyline
# c16: sky_geometry
# c17: notebooks/geometry.ipynb
# c18: .md
# c19: tests/python/test_notebooks.py
seg-95cdecf341d6 = <b>Funktionen zur Himmelsgeometrie</b> (<c1/>, Punkt { "2" } der Entwurfsnotiz): <c2/> (sichtbare und maskierte Satelliten von einem Standort, einer Zeit und Konstellations-Presets, Zweizeilen-Elementsätzen (<c3/>, höchstens { "4" } MiB, vom SGP4 der Engine auf eine UTC-<c4/> propagiert) oder gegebenen Satelliten; <c5/> und <c6/> sagen, ob der Himmel repräsentativ ist oder der Himmel, den die Elementsätze zu dieser Epoche geben, keine Messung; <c7/> listet jede unbenutzte Zeile mit ihrem Grund; Eingabegrenzen von { "2000" } Satelliten über dem Horizont, vor dem Bau einer Systemtabelle geprüft, und { "16" } Empfängeruhren; die fünf DOPs; der ENU-Kofaktor und die Kovarianz mit einer Uhr je System oder einer gemeinsamen; die horizontale Fehlerellipse bei einem Sigma und bei einer genannten Konfidenz), <c8/> (Fehler nach kleinsten Quadraten mit Seed, höchstens { "5000" }), <c9/>, <c10/> und <c11/>. <c12/> legt die Kovarianz hinter <c13/> offen, das jetzt ihre Reduktion ist (die validierten Skalare bleiben unverändert). Oberflächen: <c14/> und <c15/>, Python- und WASM-Funktionen mit denselben Namen und das MCP-Werkzeug <c16/> ({ "40" } Werkzeuge) sowie das Notebook <c17/> (mit seinem Spiegel <c18/>; ausgeführt von <c19/>). Jedes Ergebnis trägt das Label MODELLED, die Aussage zum Fehlermodell und den Hinweis.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Register: fünf Zeilen zu Skyline und Himmelsgeometrie. <b>VALIDATED</b>, jede in einem Vergleich, der vorab registriert wurde, bevor ihre unabhängige Referenz lief: <em>Azimutabhängige Skyline-Maske: sichtbare Menge, Azimut und Elevation sowie DOP unter der Maske</em> gegen Orekit { "12.2" } (<c1/>, <c2/>) und gnss_lib_py { "1.0.4" } (<c3/>), schlechteste Unterschiede bei Blickwinkel und Maske { "1.1e-12" }° gegen { "1e-9" }°, identische sichtbare Mengen, DOP { "3.3e-13" } relativ (<c4/>); <em>Horizontale Fehlerellipse und Kofaktor je System aus der Geometrie-Kovarianz</em> gegen numpy <c5/> und <c6/> (Standard P2), { "270" } Fälle, Achsen { "5.1e-13" } relativ (<c7/>). <b>MODELLED</b>: die Reduktionen für Schlucht, Sektor und Gelände; die Presets; die Zusammensetzung der Himmelsgeometrie (Preset-Himmel, Monte-Carlo-Wolke).

# text
seg-8f5ebce999fe = Mit den Zeilen zu Geometrie-Vertrauen, Skyline und lunarer Referenzstation hat das Register { "274" } Zeilen: { "134" } validiert, { "136" } modelliert, { "4" } Partner.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Lunare Referenzstation: Zeitlabor der Station</b> (<b>MODELLED</b>). Ein optionaler Block <c1/> bei <c2/> (<c3/>). Er modelliert eine Stationsuhr (standardmäßig die Klasse miniRAFS, jede benannte Klasse oder eine an genannte Stabilitätspunkte angepasste Gerätekarte), die auf LTC gesteuert wird und dann frei läuft oder alle N Sekunden neu gesteuert wird. Er gibt die Zeitfehlerkurve x(t), die Zeit bis { "1" }, { "10" } und { "100" } ns (Bisektion neben der geschlossenen Form) und den dominanten Term je Horizont aus, alles mit Einheiten. Der Steuerrest ist ILLUSTRATIVE. Die LTC-Rate wird nicht neu abgeleitet und behält ihre eigene Zeile VALIDATED. Das Ziel im Nanosekundenbereich aus dem öffentlichen Material des ICG WG-B zu lunarem PNT (Juni { "2024" }) wird als Aussage der Quelle zitiert, nicht als Anspruch. Die Uhrenordnung optisch < PHM < RAFS < miniRAFS gilt von { "1" } s bis { "7e5" } s, und der Test legt die Kreuzung der Kurven von PHM und RAFS nahe { "7.5e5" } s fest. Diese Kreuzung ist eine Eigenschaft der Uhrenmodelle mit einem einzigen Rauschtyp (reines Flicker-FM gegen reines White-FM), kein physikalisches Ergebnis. Ohne den Block sind der Bericht, seine Tabelle und seine Zusammenfassung unverändert. Beispiel: <c4/>. Fügt eine Registerzeile hinzu, gekennzeichnet MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Lunare Referenzstation: Geodäsie der Station</b> (<b>MODELLED</b>). Optionale Eingaben <c1/> und <c2/> bei <c3/> fügen einen Block <c4/> hinzu. Die Datums-Information mit fünf Arrays aus dem archivierten Ausschnitt der Laserentfernungsmessung wird mit dem kombiniert, was ein hinzugefügter Retroreflektor und eine hinzugefügte VLBI-Bake an genannten Standorten beitragen würden. Die Entfernung zum Reflektor wird zu den archivierten Epochen, die er sehen kann, mit ihren archivierten Gewichten gemessen. Die Bake verwendet das Netz und den Zeitplan von <c5/>, mit festgehaltenen Stationen. Der Block gibt jedes Helmert-1-Sigma davor und danach sowie ihr Verhältnis an. Das sind Cramér-Rao-Schranken für einen reduzierten Parametersatz, bei einem ILLUSTRATIVE Zeitplan und Standort. Fehlende oder leere Eingaben lassen den Bericht byteidentisch. Beispiele: <c6/> und <c7/>. Fügt eine Registerzeile hinzu, gekennzeichnet MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Lunare Referenzstation: Vergleich mit veröffentlichten Behauptungen</b> (<b>MODELLED</b>). Jede numerische Behauptung in fünf öffentlichen Quellen ist mit ihrem genauen Wortlaut, ihrer Seite und ihren genannten Annahmen aufgeführt und als vergleichbar, teilweise vergleichbar oder nicht vergleichbar eingestuft (<c1/>; Quellen mit URL, Abrufdatum, SHA-256 und Lizenz in <c2/>). Die teilweise vergleichbaren Behauptungen wurden unter sechs einseitigen Zielwerten bewertet, die vor dem Lauf vorab registriert wurden (<c3/>, Revision { "2" }, 05bf9a19): { "1" } von { "6" } Behauptungen innerhalb des vorab registrierten Zielwerts (vorab registriert 05bf9a19). Die Abdeckung beträgt { "0.00" } gegen >= { "0.95" } auf beiden südpolaren Kreisen, und das korrigierte p95 beträgt { "280.6" } m gegen <= { "1.5" } m. Die Ursache sind die Bahnelemente der Satelliten, die keine Quelle veröffentlicht: Mit den ILLUSTRATIVE Elementen im Repository sind vier Satelliten in { "8" } % der Epochen gemeinsam in Sicht, bei nahezu singulärer Geometrie. Der Lauf reproduziert die Behauptungen mit diesen Elementen nicht und ist kein Beleg dafür, dass die Behauptungen falsch sind. Festgelegt in <c4/>. Eine Registerzeile, gekennzeichnet MODELLED mit dem Befund.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Lunare Referenzstation: Datenbereitschaft der Uhrendatei</b>. <c1/> nennt jetzt das Zeitsystem seiner Epochen. Es ist der Wert von <c2/> oder, wenn dieser nicht erklärt ist, der Standard des Satellitensystems des Headers. Das Ergebnis sagt auch, ob das System erklärt wurde. Die Funktion lehnt ein unbekanntes Zeitsystem (zum Beispiel eine lunare Zeitskala), eine Datei mit nicht erklärtem gemischtem System und Dateien, die sich widersprechen, ab, statt sie als GPS-Zeit zu lesen. Sie liefert eine synthetische Fixture einer Stationsuhr mit. Es ist kein Format für Korrekturdateien definiert, weil es kein öffentliches gibt.

# text
seg-0fb89eb36003 = Geändert

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = Die Modul-Dokumentation von <c1/>, <c2/> und <c3/> nennt den UKF-Navigator mit 17 Zuständen, die enge Kopplung mit vollem INS und den ausdrücklichen Uhrenzustand nicht mehr als künftige Arbeit; sie verweisen auf <c4/>, <c5/> und <c6/>.

# text
seg-aedd06cf6127 = <b>RINEX { "4" } wird nicht mehr abgelehnt</b> ({ "0.36" }, WP-07): Eine RINEX-{ "4" }-Navigationsdatei wurde früher absichtlich abgewiesen; sie wird jetzt gelesen (siehe Hinzugefügt). Bei Beobachtungsdateien der Version { "4" } und später werden Header-Labels nur in den Spalten 61-80 abgeglichen, sodass die neuen Freitext-Datensätze nicht als Labels durchgehen können.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> liest echte IONEX-Dateien</b> ({ "0.36" }, WP-07): Ein vollständiger Datensatz mit 16 Werten füllt die Spalten 61-80, die der Leser für ein Label hielt, sodass er bei jeder echten IONEX-Datei <c2/> zurückgab. Jetzt liest er einen Datensatz, dessen Label-Feld numerisch ist, als Werte. Keine ausgelieferte Ausgabe hat ihn verwendet.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Empfangsleistungen von Galileo E1 und E5a nach OS SIS ICD Issue { "2.1" }</b> (Revision, 2026-10-14). Die Spektrumbänder <c1/> und <c2/> und die GNSS-Opfer mit LEO-Signal, die ihre Leistung von dort beziehen, verwenden jetzt die minimalen Empfangsleistungen aus Tabelle { "12" } des Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (war −{ "157.0" }) und −{ "155.25" } dBW (war −{ "155.0" }).

# text
seg-b0386f62923f = Neun Szenarioergebnisse verschieben sich: die Spektrumbeispiele, die Spektrumkampagne, drei LEO-Resilienz-Vertikalen und drei LEO-Signalentwürfe. Die effektive C/N0 verschiebt sich um −{ "0.25" } dB und J/S um +{ "0.25" } dB bei diesen Bändern.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Jeder verschobene Wert ({ "1766" }, alt → neu) ist in <c1/> und seiner CSV aufgeführt, mit den verschobenen Dokumentationstabellen. Keine Registerzeile ändert ihren Status.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Zweiter Teil, am selben Tag: die LEO-Signal-Opfer <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Tabelle { "12" } E5b) und <c2/> (−{ "152.0" } → −{ "152.24" } dBW). Das ICD hat keine Zeile für den vollständigen Bereich E5, daher ist der AltBOC-Wert die Leistungssumme der Gesamtwerte E5a und E5b aus Tabelle { "12" }, so gebildet wie der alte Wert. Drei Ergebnisse von LEO-Signalentwürfen verschieben sich ({ "64" } Werte: diese Empfangsleistungen und die Verschlechterung der C/N0 durch LEO gegenüber GNSS bei den beiden Opfern), aufgeführt in derselben Revision (§{ "5" }) und CSV. Nichts sonst verschiebt sich.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>Korrektur der atmosphärischen S2-Gezeit</b> (<c1/>). Die S2-Luftdruckharmonischen von Ray ({ "2001" }) sind Koeffizienten der nicht normierten <c2/> mit Kosinus-Phasenverzögerungen; sie wurden als vollständig normiert verwendet, mit der Verzögerung als Sinus-Vorlauf nach IERS. Sie gehen jetzt geteilt durch <c3/> mit <c4/> ein; das neue <c5/> reproduziert das Modell A2 von GFZ STR06/01 Tabelle { "5" } für alle { "21" } Wellen (schlechtester Wert { "0.0005" } cm, { "0.05" }°; VALIDATED). Nur Ausgaben mit aktivierter Gezeit verschieben sich: die CI-Anpassung von Galileo { "0.132" } → { "0.133" } m, die Komponenten von Swarm-A um { "1" }–{ "2" } mm (vorab registriert in <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Nur Dokumentation: <c1/>, <c2/> und <c3/> sind als Legacy-Löser dokumentiert, numerisch unverändert, mit Verweis auf <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>Stand von D9, Runde { "3" } (<c1/>).</b> BIPM Circular T { "465" } erschien am 2026-10-12. Die vorab registrierte prospektive Bewertung ist weiterhin nicht gelaufen: Ausgabe { "465" } enthält etwa { "285" } Testwerte, und die Abbruchregel braucht { "1000" }, also etwa die Ausgaben { "465" }–{ "468" }. Der Lauf braucht außerdem die archivierten Dateien je Labor vom 2026-09-30, weil das BIPM seitdem { "87" } der { "113" } neu geschrieben hat. Die Registerzeile und der Kopf des Tests sagen das; der Test, seine Zielwerte und seine Aufteilung bleiben unverändert.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Durchgang zur Wahrheit der Dokumentation ({ "0.36" }).</b> Roadmap, Fähigkeitszeilen, Statuszeilen der Entwurfsdokumente und Modulkommentare wurden mit dem Code in Einklang gebracht; keine Ausgabe ändert sich. Punkte, die schon gebaut, aber noch als offen aufgeführt waren, sind jetzt als erledigt markiert: die Prüfungen der ITU-T-Masken, das Holdover-Szenario von { "24" } h und die Aufnahme von Uhrenprotokollen (Telecom-Timing), die Quickstarts der ersten Minute, Lense–Thirring und die Kreuzprüfung des Orekit-Propagators, die ITRF-präzise GCRS-Kette, Golden- und plattformübergreifende Hashes, Provenienz, ARAIM bei mehreren Fehlern (ADD v4.2), FDE bei einem Satelliten, die CRPA-Bibliothek, die Grenze der CAI-Streifenmehrdeutigkeit, die Dimensionierung von Streets of Coverage und die 3D-Bahnansicht, Lagedynamik starrer Körper, der OMM-Schreiber und der NAIF-Kernel-Leser, die lunare Libration nach DE440, der Satz zur Bedeutung des Laufs im Playground, <c1/>, der eng gekoppelte Navigator mit 17 Zuständen und die Art gravity-map. Die Zeilen sagen auch genau, was noch offen ist (zum Beispiel das zweiteilige JD in <c2/>, der Leser <c3/> gegen ein reales Produkt und der Ausschluss mehrerer Satelliten in <c4/>). Die fehlende <c5/> ist aus einem frischen Lauf ihrer Tests geschrieben (M1–M4 bestehen), und der partnerseitige Entwurf zur IQ-Validierung hat aktuelle Registerzahlen.

# text
seg-e3eff59db445 = Gestreamte Ausgabe ist bitgleich mit der Wiedergabe im Speicher.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Lock-Zustandsautomat</em> (<c1/>, <c2/>): Pull-in → Lock → verloren → Wiederakquisition → Pull-in, oder außer Dienst gestellt, sobald ein Verlust länger dauert als <c3/> (Standard { "30" } s). Fehlgeschlagene Suchen werden alle <c4/> ({ "0.1" } s) wiederholt, gleichmäßig verteilt, sodass der Wiederholungsplan zu einer gemessenen Zeit der Wiederakquisition höchstens { "0.1" } s hinzufügt. Ein optionales Back-off (<c5/> über <c6/>) ist standardmäßig aus, und <c7/> ist eine optionale Obergrenze ({ "0" }, standardmäßig keine). Ein Ausfall von { "2" } s bei drei PRNs mit { "4.092" } MS/s endet jetzt damit, dass jeder Kanal wieder akquiriert und im Lock ist. Bei einem Budget von 3 Versuchen wurde jeder Kanal innerhalb von { "0.2" } s nach dem Verlust außer Dienst gestellt.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Schwellen (<c1/>, <c2/>, das Doppler-Fenster der Wiederakquisition) stammen aus dem Entwurf. Jeder Übergang ist ein Ereignis mit seinem Grund.

# text
seg-b1c551e48389 = Die Prüfung auf falschen Lock durchsucht den verfolgten Doppler gegen seinen FLL/PLL-Alias bei ±1/(2T). Sie fängt den falschen Lock, den PR #38 gemessen hat (−{ "2400" } Hz verfolgt, { "500" } Hz daneben). Bei eingeschalteter Wiederakquisition endet der Kanal im Lock beim eingespeisten Doppler.

# text
seg-39409dd0b4bc = Eine Signallücke von { "0.8" } s wird als verloren erklärt und innerhalb von { "0.3" } s nach der Rückkehr des Signals wieder akquiriert.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (und die Spalte der Tabelle) ist der Zustand nach dem letzten Übergang, sodass ein Kanal, der nach seiner letzten Aktualisierung der Schleife außer Dienst gestellt wurde, <c2/> zeigt.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>FLL-Unterstützung nur während des Pull-in</b> (<c1/>, der Standard; <c2/> behält das frühere Verhalten Bit für Bit bei). Die FLL übergibt an die PLL, sobald der geglättete PLI für <c4/> ({ "0.1" } s) auf oder über <c3/> ({ "0.8" }) gehalten hat, und kehrt unter <c5/> ({ "0.6" }) zurück. Eingeschaltet gelassen, brach der FLL-Pfad mit { "10" } Hz bei sauberen Signalen unter etwa { "38" } dB-Hz den Phasen-Lock: bei { "35" } dB-Hz betrug der Anteil des Phasen-Locks { "10" }–{ "16" } %, mit einem wahren Phasenfehler von { "38" }–{ "41" }°. Mit Gate hält der Standard { "100" } % bei { "35" } dB-Hz mit { "4.5" }°, dasselbe wie eine PLL allein. Das Pull-in aus einem Übergabefehler von { "100" } Hz ist unverändert. Evidenz mit vorab registrierten Zielwerten: <c6/>. <b>Die Standardschleifen sind daher nicht Bit für Bit mit früheren Läufen des Standardentwurfs identisch.</b> Verwenden Sie <c7/>, um sie zu reproduzieren. Bekannte Grenze: Bei { "35" } dB-Hz erfolgt die Übergabe { "1.9" }–{ "2.6" } s nach Beginn des Trackings, und bei { "33" } dB-Hz hält die FLL mit { "10" } Hz den PLI unter der Übergabeschwelle, sodass das Pull-in nie abgeschlossen wird.

# text
seg-1a911b958f8e = Neue Schlüssel des Schleifenentwurfs und neue API, aufgeführt:

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, wobei <c5/> von einem Standard von { "3" } auf eine optionale Obergrenze (Standard { "0" }) geändert wurde;

# text
# c1: LoopConfig.fll_assist
# c2: FllAssist
# c3: FllGate
# c4: LoopCore::set_fll_enabled
# c5: EpochOutput.fll_active
# c6: ChannelSummary.final_state
seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

# text
# c1: 33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80
seg-eecacf54975b = Der Hash des Entwurfs wird über eine kanonische JSON-Form gebildet, und der Hash des eingebauten Standards ist <c1/> (durch einen Test festgelegt).

# text
seg-2405be1bc0c6 = Hinweise zur Kompatibilität der Ausgabe:

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = die Tabelle von <c1/> hat eine abschließende Spalte <c2/>;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = die CSV von <c1/> hat eine abschließende Spalte <c2/>, und ihr JSON hat <c3/> und <c4/>;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = das <c1/> des Sweeps ist jetzt der Mittelwert über jede Aktualisierung mit einer NWPR-Schätzung (Zusammenfassung mit begrenztem Speicher), nicht mehr über die zweite Hälfte des Laufs.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = Die Wiederakquisition ist <b>im eingebauten Standard aus</b>, wo der Zustandsautomat nur beobachtet und die Schleifen Bit für Bit so laufen wie ohne ihn. (Die Standardschleifen selbst haben sich jedoch geändert: siehe FLL-Unterstützung oben.) Schalten Sie sie je Entwurf ein (<c1/>), mit <c2/> oder mit <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = Eine <b>Warnung <c1/></b>: Wenn fs innerhalb von { "1e-6" } eines Vielfachen der halben Chiprate liegt (<c2/>), warnen <c3/>/<c4/> (Ausgabe, <c5/>, Sweep-JSON), die MCP-Antwort <c6/> und das Python-Ergebnis <c7/>, dass Jitter und Bias der Code-Schleife nicht repräsentativ sind. Die Ursache ist mit vorab registrierten Zielwerten in <c8/> dokumentiert. Bei genau { "2" } Abtastwerten je Chip mit Abstand von 0.5 Chip ist die DLL-S-Kurve eine einzelne Stufe, und die Schleife zittert: ≈ { "0.09" } Chip RMS Codefehler (≈ { "26" } m) bei { "45" } dB-Hz, gegen ≈ { "0.004" } Chip bei einer inkommensurablen Rate. Die um ~{ "2" } dB zu niedrige NWPR-C/N0 bei dieser Rate hat dieselbe Ursache. Bei genau { "0" } Hz Code-Doppler und { "4" } Abtastwerten je Chip überschreitet der Code nie die Totzone von ±0.21 Chip, sodass ein Codephasen-Bias von bis zu etwa { "0.2" } Chip bestehen bleiben kann, ohne im Jitter sichtbar zu werden (gemessen: Abstand von 0.5 Chip gibt das { "2.0" }-Fache des Codefehlers der Kontrolle mit einem Mittel von +{ "0.011" } Chip; Abstand von 0.25 Chip gibt +{ "0.125" } Chip); die Warnung deckt die Rate ab.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Bekannte Grenze: Der Standardentwurf übergibt unter etwa { "35" } dB-Hz nicht von FLL an PLL</b> (eine Pull-in-Untergrenze von ~{ "35" } dB-Hz; siehe FLL-Unterstützung oben und <c1/>).

# text
seg-43f02bc861be = Eine Suche nach falschem Lock oder Wiederakquisition, die nicht laufen kann (eine Rate ohne ganze Zahl von Abtastwerten je Codeperiode), beendet das Tracking nicht mehr.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Tests: <c1/>, <c2/>, <c3/>, <c4/> und der MCP-IQ-Round-Trip.

# text
seg-60141bb08f64 = C/N0-Profile in synthetischen Szenen ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> plant zeitveränderliche C/N0 je Satellit in den eigenen Szenen von Kshana ein, als dB-Offsets relativ zur C/N0 der Szene. Formen: Stufe, Rampe, stückweise linear und Rice-Schwunde mit Seed, die Szintillation ähneln, mit genanntem S4 und genannter Dekorrelationszeit. Sie werden über den bestehenden Kanal-Haken der Szene angewandt (<c2/>, zusammengesetzt mit den Effekten von Ionosphäre, Troposphäre, Szintillation und Mehrwegeausbreitung), ohne Änderung am Szenenkern. Das <c3/> des Wahrheits-Sidecars folgt dem Profil.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Oberflächen: <c1/> und <c2/>.

# text
seg-a242e4d9f071 = Wofür es gedacht ist: Schleifen, Monitore und die Bewertung von Kampagnen lassen sich gegen eine bekannte Wahrheit belasten. Es ändert nur die Stärke der legitimen Signale.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Prüfungen (<c1/>). Zielwerte: mittlere Intensität des Schwunds innerhalb von { "5" } % von { "1" }, S4 innerhalb von { "8" } % des Ziels (bei S4 = { "0.3" }, { "0.7" } und { "1" }), Intensitätskorrelation über { "0.9" } bei { "0.05" } τ und unter { "0.05" } bei { "5" } τ; die Wahrheit genau die genannte C/N0 plus das Profil; ein Abfall der verfolgten NWPR-C/N0 innerhalb von { "0.7" } dB einer Stufe von { "6" } dB. Gemessen: S4 innerhalb von { "1.3" } % des Ziels und ein verfolgter Abfall von { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>Detektions-Monitore für den IQ-Pfad ({ "0.34.0" } „Lab replay“).</b> Neues Modul <c1/>, Befehl <c2/> und Anbindung <c3/>. Sie beobachten eine Aufzeichnung und melden Zeitreihen sowie markierte Ereignisse (Start-, Alarm- und Endzeiten, Spitze, Schwelle). Sie detektieren und messen nur; nichts hier erzeugt ein Signal.

# text
seg-5b05b2a54fab = <b>Gesamtleistung / AGC</b>: Blockleistung und die Verstärkung, die eine ideale AGC anwenden würde; markiert Anstiege und Abfälle.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Spektrum vor der Korrelation</b>: Welch-PSD je Block gegen eine gelernte Basislinie. Die Überschuss-Schwelle ergibt sich aus einem Fehlalarmziel. Außerdem komplexe Kurtosis und ein Pulsdetektor. Der Pulsdetektor zählt Abtastwerte über einer Schwelle in jedem Block und löst ein Ereignis aus, wenn der exakte binomiale obere Rand dieser Zahl unter <c1/> liegt (Standard { "1e-4" } je Block), nicht wenn ein z-Wert eine Grenze überschreitet: Bei den kleinen erwarteten Zahlen kurzer Blöcke liegt ein einzelner Abtastwert schon mehrere Sigma darüber.

# text
seg-7704ac807c38 = <b>C/N0 je Kanal</b>: zwei einseitige CUSUM-Änderungsdetektoren (Abfall und Anstieg), gespeist mit unabhängigen Schätzungen (die Schrittweite wird aus dem C/N0-Fenster der Schleife gesetzt).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM aus den Korrelatoren</b>: Delta <c1/> und Verhältnis <c2/>, dazu Asymmetrietests aus zusätzlichen Korrelatoren, wenn ein Kanal sie liefert.

# text
seg-a4006c2e8692 = <b>Lock-Indikator-Reihen</b>: PLI und ein Frequenz-Lock-Indikator aus aufeinanderfolgenden Prompts, als Rohsignale. Entscheidungen über Lock und Lock-Verlust bleiben beim Lock-Zustandsautomaten der Tracking-Engine.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Ein einziger streamender Durchlauf (<c1/>) führt alles aus, mit einer TOML/JSON-Einstellungsdatei (<c2/>); der Kampagnen-Runner verwendet denselben Einstiegspunkt. Alles MODELLED. Jede Statistik wird durch Simulation mit Seed gegen ihre geschlossene Form geprüft (<c3/>):

# text
seg-0ff96e4c5a20 = Überschreitungen der Blockleistung gegen den Gamma-Rand;

# text
# c1: 2/√N
seg-97b559ea0897 = Kurtosis-Mittel { "2" } und Streuung <c1/>;

# text
# c1: e^{−t}
seg-2b941c702b7f = Pulsanteil <c1/>;

# text
seg-e8f068c41f0c = Lauflängen der CUSUM gegen die Näherung von Siegmund (gemessen { "330" } und { "8.46" } Abtastwerte gegen { "338" } und { "8.34" });

# text
seg-e2cd6a55e49b = der Phasen-Lock-Indikator gegen das Mittel der Rice-Phase;

# text
seg-06291b1c6274 = bei einem verfolgten C/A-Signal weichen die Streuungen von SQM-Delta und -Verhältnis um etwa { "6" } % von den Formen in geschlossener Form erster Ordnung ab (gemessen { "5.97" } %; Zielwert des Tests { "12" } %).

# text
seg-12deb36a2e3a = Die Formel für den Fehlalarm bei spektralem Überschuss ist eine Näherung; die gemessene Rate war das { "1.3" }-Fache der Formel. Von Ende zu Ende markieren die Monitore:

# text
seg-b002c66c7881 = eine C/N0-Stufe von { "6" } dB (Zeitpunkt der Änderung innerhalb einer Schätzung);

# text
seg-2e828d106393 = einen reflektierten Pfad, der in der Mitte der Aufzeichnung erscheint (Verhältnistest);

# text
seg-68063f036e2c = einen Signalausfall (PLI fällt dabei von { "0.999" } auf −{ "0.3" } und FLI von { "0.93" } auf { "0.03" });

# text
seg-0cd95f0197ec = einen Schmalbandton und vereinzelte Abtastwerte mit hoher Amplitude (Spektral-, Puls- und Kurtosis-Tests). Das sind generische DSP-Testeingaben, keine Störungsmodelle.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> streamen durch die neue Sitzung (siehe Hinzugefügt).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> behält seine Spalten von { "0.32" }, wird aber jetzt gestreamt, sodass sich Zeilen mehrerer Kanäle in zeitlicher Reihenfolge verschränken, statt nach Kanal gruppiert zu sein. <c2/> behält seine Form von { "0.32" } und hält weiterhin jede Epoche im Speicher: Verwenden Sie <c3/> für lange Aufzeichnungen.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> misst den Jitter über die Aktualisierungen in der zweiten Hälfte der Dauer des Laufs (zuvor die zweite Hälfte der Zahl der Aktualisierungen), und seine CSV/JSON erhalten eine Spalte <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = Die Track-Tabelle erhält eine Spalte <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = Der Hilfetext behauptet nicht mehr, dass <c1/> die Front-End-Flags annimmt; nur <c2/> wendet sie an.

# text
# c1: iq_track
# c2: acq_noncoherent
# c3: doppler_max
# c4: None
# c5: carrier_phase_cycles
# c6: bit_edge
# c7: bit
# c8: state
# c9: design
# c10: events
seg-cf28fa21786a = <c2/> und <c3/> von Python <c1/> haben jetzt <c4/> als Standard (die Werte des Entwurfs, { "1" } und { "5000" } Hz im eingebauten Entwurf). Seine Epochen erhalten die Early-/Late-Korrelatoren, <c5/>, <c6/>, <c7/> und <c8/>, und das Ergebnis erhält <c9/> und <c10/>.

# text
# c1: 2 / (3 · N · T_code)
# c2: 1 / (3 · N · T_code)
# c3: 1 / (4 T_track)
# c4: N = 1
# c5: 0.2 / T_track
# c6: kshana::iq::acq::default_step_hz
# c7: N = 4
# c8: "auto"
# c9: doppler_step_hz
# c10: --doppler-step
# c11: iq acquire
# c12: --summary
# c13: resolved
seg-666b9e3faa5d = <b>Der Standard-Akquisitionsschritt übergibt dem Tracking von Galileo E1 kein Residuum mehr, das die FLL nicht einziehen kann.</b> Der Schritt <c1/> lässt bei der Übergabe bis zu <c2/> Doppler-Fehler, aber die standardmäßige Zwei-Quadranten-FLL zieht nur <c3/> ein. Bei jedem Code von { "4" } ms oder länger (<c4/>), einschließlich Galileo E1-B und E1-C, lag das Residuum ({ "83.3" } Hz bei { "4" } ms) außerhalb des Pull-in von { "62.5" } Hz, und das Tracking rastete bei +{ "125" } Hz falsch ein, mit einem Phasen-Lock-Indikator von { "0.97" }, der es verdeckte. Der Standardschritt wird jetzt außerdem auf <c5/> begrenzt (<c6/>), { "0.8" } des Pull-in, sodass die Übergabe innerhalb davon bleibt, auch wenn der benachbarte Bin gewinnt. ({ "0.4" } wurde zuerst versucht: Es rastete bei E1-B in { "1" } Lauf von { "42" } falsch ein, und eine kohärente GPS-L1-C/A-Suche mit { "1" } ms wählte einen Bin mit { "350" } Hz Abstand und rastete bei +{ "500" } Hz ein; { "0.25" } und { "0.2" } hatten in denselben Läufen keinen.) Kosten: Galileo E1-B/E1-C gehen von Bins mit { "166.7" } Hz auf { "50" } Hz, { "201" } Bins über ±{ "5" } kHz statt { "61" }; die Codes mit { "1" } ms ({ "166.7" } Hz, <c7/>) bleiben unverändert. <c8/> in einem Schleifenentwurf bedeutet dies; ein ausdrücklicher Wert <c9/> oder <c10/> wird wie geschrieben verwendet, und <c11/> (keine Tracking-Übergabe) behält den Lehrbuchschritt. Der Epochen-Header und <c12/> halten jetzt für jeden Kanal den aufgelösten Schritt und die Schleifenbandbreiten fest (<c13/>). Der Hash des Standardentwurfs ist unverändert. Änderung der Ausgabe: Detektionen bei Codes von { "4" } ms und länger können auf anderen Doppler-Bins landen.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>GPS L2C CM (Schleifenaktualisierung von { "20" } ms) hält den Lock mit dem Standardentwurf.</b> Die standardmäßige PLL mit { "15" } Hz und FLL mit { "10" } Hz haben <c1/> von { "0.3" } und { "0.2" } bei T = { "20" } ms, und die Schleife verlor den Lock sogar bei perfektem Start (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Neuer Entwurfsschlüssel <c2/> (Standard { "0.1" }) begrenzt die Rauschbandbreiten von PLL und FLL auf <c3/>, wenn die Aktualisierungszeit der Schleife länger als { "4" } ms ist (<c4/>): { "5" } Hz und { "5" } Hz bei { "20" } ms, { "10" } Hz und { "10" } Hz bei { "10" } ms von BeiDou B1C; die Codes mit { "1" } ms und { "4" } ms behalten { "15" } und { "10" } Hz. Es gilt auch für ausdrückliche Bandbreiten; <c5/> schaltet es ab. Der Schlüssel entfällt in der kanonischen Form bei seinem Standard, sodass der Standard-Hash unverändert ist; ein Entwurf, der einen anderen Wert setzt, hat einen anderen Hash. Bei { "45" } dB-Hz ergibt L2C CM jetzt PLI { "0.996" }, Doppler-Fehler { "0.00" } Hz und M2M4 { "42.71" } dB-Hz. Bekannter offener Punkt: Die NWPR-C/N0 liegt dort { "1.76" } dB zu niedrig (und { "2.45" } dB zu niedrig bei B1C mit { "10" } ms), sodass T5 der Matrix für L2C ein ignorierter Befund bleibt.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> neu erzeugt: Die eingecheckte Abbildung war gegenüber ihrem eigenen Szenario veraltet (eine Datenänderung, kein Neuzeichnen).</b> Das Diagramm wurde am 2026-06-02 aus <c2/> gezeichnet; zwei Tage später setzte 67fed19e die Flicker-FM-Böden in diesem Szenario (Quanten <c3/>, CSAC <c4/>), und die Abbildung wurde nie neu gezeichnet. Sie zeigte den Lauf vor den Böden: y-Achse { "0" } bis { "47" } ns, Ausfall-p95 je Lauf bei CSAC von { "10.5" } bis { "47.6" } ns (Mittel { "25.2" } ns), klassischer Holdover { "4050" } s im Mittel. Das ausgelieferte Szenario (und wie schon Tutorial und CLI-Zusammenfassung angeben) ergibt eine y-Achse von { "0" } bis { "407" } ns, p95 je Lauf bei CSAC { "40.8" } bis { "374.0" } ns (Mittel { "167.0" } ns), klassischen Holdover { "844" } s [{ "220" } bis { "2130" } s]; die Spezifikationslinie von { "20" } ns liegt bei denselben { "20" } ns auf einer etwa neunmal höheren Achse. Die Engine ist unverändert: Die heutige Engine reproduziert mit der Szenariodatei von Juni exakt die Achse der alten Abbildung. Auf die Abbildung wird weder aus der README noch aus der Dokumentation verwiesen.

# text
seg-75636f9419b2 = Bekannte Einschränkungen

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>Die NWPR-C/N0 liest bei hoher C/N0·T je Prompt zu niedrig, und BOC({ "1,1" }) bei { "5" } MS/s verliert etwa { "1" } dB.</b> NWPR ist bei idealen Prompts unverzerrt, aber der eigene PLL-Jitter der Schleife kostet etwa einen angepassten Wert von { "8" } dB × Bn·T (eine Szene, vier Punkte: −0.24/−0.44/−0.77/−{ "1.58" } dB bei 1/2.5/5/10 Hz und { "20" } ms; etwa −{ "1" } dB beim Standard <c1/>); M2M4 ist unempfindlich. BeiDou-B1C-Daten bei { "5" } MS/s verlieren durch die Bandbegrenzung ebenfalls etwa { "1" } dB Prompt-Leistung (verwenden Sie { "10" } MS/s oder mehr). Keines von beiden ist ein Defekt des Schätzers; die Zeilen T5 der Signalmatrix für GPS L2C und BeiDou B1C bleiben ignorierte Befunde mit diesen Ursachen.

# text
seg-ff195e575023 = <b>Diagrammtext und Übernahme von Diagrammen im Studio gehärtet.</b> Text, den ein Szenario in ein erzeugtes Diagramm trägt, wird jetzt von einer gemeinsamen Routine einheitlich maskiert, und das Studio übernimmt aus einem Diagramm nur Zeichenmarkup. Die Adressparameter des Studios, Nachschlagen nach Art und Abrufe von Szenarien sind auf bekannte Werte beschränkt. Mitgelieferte Diagramme, aufgezeichnete Ergebnisse und veröffentlichte Zahlen bleiben unverändert. Ein Upgrade wird allen empfohlen, die Szenariodateien aus nicht vertrauenswürdigen Quellen im Studio öffnen oder erzeugte Diagramme in Webseiten einbetten. Sicherheitshinweis: <a1>GHSA-h25h-cg9f-v2cg</a1>.

# text
# c1: iq::scene
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
# c5: sdr
# c6: iq::acq
# c7: iq::track
# c8: docs/POSITIONING.md
# c9: docs/SPECTRUM.md
seg-7f566858d036 = <b>Der Umfang der IQ-Schicht bei Störung und Spoofing, genau angegeben.</b> Die Einträge von { "0.31.0" } und { "0.32.0" } unten sagen, die IQ-Schicht füge „keine Synthese von Störungs- oder Spoofing-Wellenformen“ hinzu. Das stimmt für die IQ-Schicht selbst (<c1/> erzeugt nur legitime GNSS-Signale), las sich aber wie eine Aussage über die ganze Engine, und das ist sie nicht: Seit { "0.29.0" } schreibt der Abschnitt <c3/> der Art <c2/> einen SigMF-Schnappschuss seines analytischen Modells mit den konfigurierten Jammern darin (rauschartige Jammer Bin für Bin, Töne und Chirps als Wellenformen), und <c4/> summiert ein authentisches und ein Spoofer-Replikasignal im Speicher, um den Capture der Schleife zu testen (das Verbundsignal wird nie ausgeschrieben). Die Engine trägt außerdem seit { "0.20.0" } einen Software-GNSS-Empfänger (<c5/>: Akquisition und Tracking; seit { "0.31.0" } auch <c6/> und <c7/>). Nichts in Kshana sendet oder steuert Funkhardware. Die Statuszeile der README, <c8/>, <c9/> und die IQ-Entwurfsnotizen sagen das jetzt; die veröffentlichten Einträge bleiben so, wie sie veröffentlicht wurden. Kein Verhalten ändert sich.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Bekannte Einschränkung: kommensurable Abtastung.</b> Bei einer Abtastrate, die ein ganzzahliges oder halbzahliges Vielfaches der Chiprate ist, liegen die Abtastwerte in jedem Chip auf denselben Chipphasen, und der Code-Diskriminator wird zu einer Treppe. Bei einem synthetischen GPS-L1-C/A-Signal mit { "45" } dB-Hz und Abstand von 0.5 Chip gibt { "2.046" } MHz ({ "2" } Abtastwerte/Chip) ≈ { "0.09" } Chip (≈ { "26" } m) RMS Codefehler und einen Bias von −{ "0.09" } Chip, gegen ≈ { "0.003" } Chip bei einer inkommensurablen Rate. Die NWPR-C/N0 liest dort ≈ { "2.4" } dB zu niedrig. Bei { "4.092" } MHz hängt es vom Abstand und vom Code-Doppler ab. Bei { "0.5" } Chip ist es bei { "1500" } Hz Doppler harmlos, aber { "2" }× bei { "0" } Hz mit einem Bias von { "0.011" } Chip, und bei { "0.25" } oder { "0.1" } Chip ist es das { "8" }–{ "10" }-Fache des Codefehlers. Das Carrier-Tracking ist nicht betroffen. <c1/> enthält die Messungen.

# text
seg-3a30bd47380a = GNSS-IQ-Schicht auf dem MCP-Server (Phase B.1).

# text
# c1: kshana-mcp
# c2: kshana iq
# c3: iq_signals
# c4: iq_info
# c5: iq_scene
# c6: iq_acquire
# c7: iq_track
# c8: iq_frontend
# c9: KSHANA_MCP_IQ_DIR
# c10: overwrite
# c11: KSHANA_MCP_IQ_MAX_SAMPLES
# c12: kshana::iq::cli::execute
# c13: iq::cli::build_code
# c14: iq::cli::signal_names
# c15: server.json
# c16: mcp/kshana-mcp/tests/iq_round_trip.rs
seg-ef81eca03bca = <c1/> erhält sechs Werkzeuge, die die Schicht <c2/> von einem Agenten aus ansteuern: <c3/> (die akzeptierten Signalnamen und die IQ-Einrichtung), <c4/> (eine Aufzeichnung beschreiben), <c5/> (eine Szene mit genanntem Profil oder aus Broadcast-Ephemeriden erzeugen, mit dem optionalen Kanal auf Signalebene), <c6/> (FFT-Akquisition, wahlweise hinter Front-End-Stufen), <c7/> (akquirieren, dann die Bank aus DLL/PLL/FLL) und <c8/> (Bandpass, Notch, Blanking, Excision, AGC, Quantisierer). IQ-Abtastwerte überqueren nie das Protokoll: Jedes Werkzeug nimmt Dateipfade innerhalb eines Arbeitsverzeichnisses, das über <c9/> gesetzt wird (nicht gesetzt, bleiben die IQ-Dateiwerkzeuge aus und jedes andere Werkzeug unberührt), lehnt Pfade, die außerhalb davon auflösen, und bereits vorhandene Ausgaben ab, sofern nicht <c10/> gesetzt ist, erzwingt vor jeder Arbeit ein Abtastwert-Budget je Aufruf (<c11/>, Standard { "50 000 000" }), lehnt unbekannte Argumente ab und antwortet mit einer kompakten JSON-Zusammenfassung (Detektionen, C/N0, Lock-Zustand und jede geschriebene Datei mit ihrer Byte-Zahl). Die Ausgabe je Epoche geht nur in Dateien, die der Aufrufer benennt. Die Werkzeuge führen über eine neue öffentliche Naht, <c12/>, denselben Codepfad aus wie die CLI, die die Meldung der CLI zurückgibt, statt sie zu drucken (stdout ist der JSON-RPC-Kanal von MCP); <c13/> und <c14/> sind jetzt ebenfalls öffentlich. Nur Software und additiv: Die IQ-Schicht fügt keine Synthese von Störungen oder Spoofern hinzu, nichts wird je gesendet, und es gibt keine neuen Abhängigkeiten. <c15/> erklärt die beiden Umgebungsvariablen. Round-Trip-Tests in <c16/> erzeugen eine kurze Szene mit zwei Satelliten und prüfen die Akquisition gegen das eigene Wahrheits-Sidecar der Szene, Tracking-Lock und C/N0, das Front-End, die SigMF-Ausgabe, das Budget, die Pfadbeschränkung und den deaktivierten Zustand.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>Die GNSS-IQ-Schicht im Validierungsregister.</b> Eine vorab registrierte Kreuzprüfung gegen gps-sdr-sim (ein unabhängiger GPS-L1-C/A-Basisbandgenerator, MIT, Commit 28ca29a6) ist jetzt Teil der stets laufenden Testsuite (<c1/>). Ihre eingecheckte Referenzausgabe (<c2/>: { "20" } ms des eigenen 8-Bit-I/Q von gps-sdr-sim, seine Kanalliste und der Kanalzustand dahinter aus einem Harness, das gegen denselben Build gelinkt ist) wird von <c3/> neu erzeugt. Nichts zur Testzeit braucht Netz oder das externe Werkzeug. Zwei Registerzeilen werden hinzugefügt ({ "251" } Zeilen: { "124" } validiert, { "123" } modelliert, { "4" } Partner):

# text
seg-21d005e2ef0e = <em>Signalgeometrie der GNSS-IQ-Szene gegen einen unabhängigen Basisbandgenerator</em>: <b>Validiert</b>. Die Wahrheit der Szene (sichtbare Menge, Pseudoentfernung, Codephase, Doppler, Blickwinkel) für eine Szene aus Broadcast-Ephemeriden stimmt auf allen { "11" } Kanälen mit dem Kanalzustand von gps-sdr-sim überein: schlechtester Wert { "1.6" } mm, { "5.5e-6" } Chip, { "7.4e-5" } Hz, { "4e-9" } Grad, gegen Zielwerte von { "0.05" } m, { "2e-4" } Chip, { "0.02" } Hz und { "1e-4" } Grad, die vor dem Lauf festgelegt wurden.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>GNSS-IQ-Akquisition an unabhängig erzeugten I/Q-Abtastwerten</em>: <b>Modelliert, mit einem Befund</b>. <c1/> findet jeden simulierten Satelliten in den Abtastwerten von gps-sdr-sim innerhalb der registrierten Zielwerte (Codephase innerhalb von { "0.195" } Chip, Doppler innerhalb von { "72" } Hz). Der registrierte Zielwert „kein anderer PRN detektiert“ scheitert allerdings: Bei der rauschfreien Ausgabe von gps-sdr-sim wird die Schwelle für gaußsches Rauschen von der Kreuzkorrelation der anderen Satelliten für alle { "21" } abwesenden PRNs überschritten. Der strikte Test bleibt erhalten, mit dem Befund ignoriert, und ein festgelegter Test hält ihn fest. Kein Engine-Code und keine öffentliche API ändert sich. Das Abtastwert-I/Q wird nicht Abtastwert für Abtastwert verglichen: Die ganzzahlige Sinustabelle von gps-sdr-sim, Verstärkungen, die anfängliche Trägerphase null und abgeschnittene LNAV-Felder sind keine Größen, in denen ein Empfänger übereinstimmen muss. Der Vergleich erfolgt an den Observablen, die ein Empfänger misst.

# text
# c1: iq track
# c2: ceil(4 ms / T_code)
# c3: T_code
# c4: 2 / (3 · N · T_code)
# c5: docs/design/evidence/iq-track-acq-default/
# c6: kshana iq track
# c7: kshana iq sweep
# c8: --acq-coherent
# c9: kshana.iq_track
# c10: acq_coherent=None
# c11: iq_track
# c12: acq_coherent=1
# c13: --acq-coherent 1
# c14: kshana iq acquire
# c15: --coherent
# c16: iq::acq::auto_coherent_periods
# c17: iq::acq::AUTO_COHERENT_S
# c18: tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did
seg-a2be63287ce4 = <b><c1/> übergibt standardmäßig aus einer Akquisition von ≈{ "4" } ms (Verhaltensänderung).</b> Die Akquisition, die jeden Tracking-Kanal initialisiert, integriert jetzt <c2/> Codeperioden kohärent statt einer, wobei <c3/> die volle Periode des Codes ist (Primär- mal Sekundärlänge bei einem gestuften Code, die Einheit, über die die Akquisition integriert). Die ungestuften Codes mit { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) durchsuchen jetzt { "4" } Perioden ({ "4" } ms), sodass der Standard-Dopplerschritt <c4/> ~{ "167" } Hz statt ~{ "667" } Hz beträgt. Jeder Code, dessen volle Periode bereits { "4" } ms oder länger ist, behält { "1" } Periode: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) und die gestuften GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q und E1-C ({ "10" } bis { "100" } ms mit ihren Overlay-Codes) sowie GPS L2C. Jedes Signal integriert daher mindestens ~{ "4" } ms. Eine Suche mit einer Periode konnte einen Kanal mit bis zu ~{ "333" } Hz Abweichung übergeben, außerhalb des Pull-in der FLL, und er verfolgte dann einen falschen Lock ~{ "500" } Hz entfernt und meldete dabei ein sauberes Tracking. Bei einem Sweep mit Seed über { "180" } GPS-L1-C/A-Kanäle (Doppler über ±{ "5" } kHz, { "38" } bis { "47" } dB-Hz, die Hälfte mit Navigationsdaten; <c5/>, wiederholbar) sinken falsche Locks von { "27" } von { "180" } auf { "1" } von { "180" } und verpasste Akquisitionen von { "102" } auf { "11" }, bei ~{ "40" } ms mehr Suche je PRN auf GPS L1 ({ "11" } → { "52" } ms). Der eine verbleibende falsche Lock liegt bei { "38" } dB-Hz, { "36" } Hz daneben. Jede Oberfläche stimmt überein: <c6/> und <c7/> (<c8/>), Python <c9/> (<c10/> ist jetzt automatisch; Stub aktualisiert) und das MCP-Werkzeug <c11/>. Wer sich auf den alten Standard verlassen hat, kann <c12/> übergeben (<c13/>). Der eigene Standard <c15/> von <c14/> bleibt { "1" }. Neue öffentliche <c16/> und <c17/>; Regressionstest <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Jede erzeugte Grafik folgt jetzt dem Observatory-Design der Website: Die Bytes jedes Diagramms ändern sich.</b> Das ist eine bewusste Überarbeitung der veröffentlichten Abbildungen, nur bei Farben und Schriften; kein gezeichneter Wert, keine Koordinate und kein Label hat sich bewegt. Das <c1/> jedes Szenarios (und damit die Diagrammexporte des Studios und die Demo-Diagramme der README), das HTML des Laufberichts (<c2/>), die Zeitleisten-Animation (<c3/>), die HTML-Seiten für Szenarioergebnisse und Studien, die Validierungszusammenfassung und die Abbildungen und Diagramme der Dokumentation verwendeten die warm-dunkle Palette vom Juli (Grund <c4/>, Gold <c5/>) und ein warmes Papier-Design für Berichte. Sie nehmen jetzt jede Farbe und Schrift aus einem einzigen Modul, <c6/>, das <c7/> spiegelt: Diagramme werden instrumentendunkel auf dem Observatory-Grund (<c8/>) im Schriftstapel Geist gezeichnet; der Bericht, der Animationsplayer und die Ergebnisseiten folgen der Hell/Dunkel-Einstellung des Betrachters mit den hellen und dunklen Tokens des Observatory. Die sechs Fehlerdomänen behalten je eine Farbe (Störung Koralle, Spoofing Magenta, Zeitgebung Blau, Bahnen Cyan, Integrität Limette, Navigation Bernstein), und die Evidenzstufen lesen sich validiert Limette, modelliert Bernstein, Partner Magenta. Die Rampen des Wasserfalls behalten ihre wahrnehmungsbasierte Ordnung (Inferno), neu verankert am neuen Grund.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> hält das Modul in beiden Designs auf <c2/>, prüft, dass <c3/> und <c4/> (beide aus dem Modul erzeugt, für die Python-Abbildungswerkzeuge und mermaid-cli) aktuell sind, und schlägt fehl, wenn ein Hex-Farbliteral in <c5/> außerhalb der Palette auftaucht.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> erhält eine dritte Diagnose, „nur Farben und Schriften haben sich bewegt“, sodass eine Palettenrevision von einem verschobenen gezeichneten Wert unterschieden wird. Jedes neu gerenderte README-Diagramm wurde unter diesem Normalisierer als gleich mit seinem Vorgänger geprüft.

# text
# c1: tools/gen_validation_figures.py
# c2: domain-coverage-map
# c3: scenario-fom
# c4: sgp4-regime-bars
# c5: web/capabilities.json
# c6: clock-holdover
# c7: tests/fixtures/sgp4_comparison.md
# c8: tools/gen_readme_assets.py
# c9: sgp4-regime-bars
# c10: kshana↔ref
# c11: tests/figures_doc_sync.rs
seg-3bc4056fd57e = <c1/> liest die Palette und erzeugt jetzt auch die drei README-Ergebnisabbildungen, die keinen eingecheckten Generator hatten (<c2/>, <c3/>, <c4/>), mit echten Textelementen, aus <c5/>, dem Ergebnis von <c6/> und <c7/>. <c8/> liest dieselbe Palette, was seine Abweichung des hellen Designs von der Website korrigiert. Die Werte von <c9/> sind die Spalte des schlechtesten Falls <c10/> dieser Fixture ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } und { "4.12e-6" } km), unverändert gegenüber der Matplotlib-Abbildung, und <c11/> schlägt jetzt fehl, wenn die eingecheckte Abbildung und die Fixture nicht übereinstimmen.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> auf aktuelle Daten aktualisiert (eine Datenänderung, kein Neuzeichnen).</b> Die Abbildung nannte { "28" } Fähigkeiten in { "8" } Domänen ({ "11" } validiert, { "17" } modelliert), veraltet gegenüber ihrer eigenen genannten Quelle; jetzt von ihrem neuen Generator aus <c2/> gezeichnet, nennt sie { "46" } Fähigkeiten in { "8" } Domänen ({ "17" } validiert, { "29" } modelliert).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>Q des CW-/Schmalband-Jammers ist jetzt { "1.0" }, nicht { "1.5" }.</b> Der Lehrbuchwert für einen Ton auf dem Träger ist { "1" } (ein Ton behält die spektrale Spitze des Signals, <c1/>, <c2/>); der alte Wert { "1.5" } machte einen Ton bei gleichem J/S weniger schädlich als Breitbandrauschen. Änderung der Ausgabe: etwa −{ "1.8" } dB effektive C/N0 bei CW-/Schmalband-Jammern mit hohem J/S in den Arten <c3/>, <c4/> und interop (der Ton des mitgelieferten Beispiels <c5/>: { "17.98" } dB-Hz aus der Tabelle, vorher { "19.74" }). Das Q für Breitband bleibt { "1.0" } (konservativ, etwa { "3" } dB unter dem Lehrbuchwert ~{ "2" }), bis die Prüfung von { "0.34" } vorliegt. Setzen Sie <c6/>, um den alten Wert { "1.5" } zu behalten.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b>Die Ganzzahlausgabe von <c1/> nutzt den ganzzahligen Bereich.</b> Mit Rauschen mit Einheitsleistung und einer Schreiber-Skala von { "1" } kamen die Szenen <c2/>/<c3/> als etwa { "{" }-1, { "0" }, { "1" }{ "}" } heraus, und Szenen mit 2 Bit hatten ihre Schwellen bei { "2.8" } Sigma. Ganzzahlformate werden jetzt so skaliert, dass der erwartete RMS je Komponente ein Viertel des Vollausschlags beträgt ({ "31.75" } LSB bei ci8, { "8191.75" } bei ci16) oder { "2" } LSB bei 2 Bit. Die Skala und die Zahl der abgeschnittenen Elemente werden gedruckt und in das Sidecar geschrieben. Die Float-Ausgabe ist unverändert.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Acht Fixture-Pins in sieben Testdateien schlagen unter macOS nicht mehr wegen Unterschieden im letzten Bit fehl</b> (Teil von Issue #36). Die Pins, die prüfen, dass die Engine die eingecheckten Eingaben einer unabhängigen Referenz noch aufbaut (Jacobi-Matrizen, eine Zustandstabelle, Startazimute), verglichen Bit für Bit und schlugen unter macOS arm64 um { "2" } bis einige tausend Einheiten in der letzten Stelle fehl. Sie vergleichen jetzt innerhalb von { "1e-12" } einer aus der Fixture genommenen Skala; Ganzzahlen, Schlüssel und Längen werden weiterhin exakt verglichen, und ein Mutationstest zeigt, dass eine relative Änderung von { "1e-6" } weiterhin fehlschlägt. Der Pin für den Startazimut vergleicht <c1/> und den aufsteigenden/absteigenden Zweig statt des Azimuts selbst, weil <c2/> ein Ulp seines Arguments auf etwa { "3e-9" } rad verstärkt, wo eine Inklination der Kobreite eines Standorts entspricht. Keine Toleranz einer unabhängigen Referenz und kein vorab registrierter Zielwert hat sich geändert. Zwei Tests (lunare gemeinsame Bahnbestimmung, lunare Beobachtbarkeit) sind nicht abgedeckt: Unter macOS verschieben sich ihre vorab registrierten Vergleiche selbst, und das bleibt einem Folgeschritt überlassen.

# text
# c1: kshana iq track
# c2: kshana iq sweep
# c3: --bandpass
# c4: --notch
# c5: --blank
# c6: --excise
# c7: --agc
# c8: --bits
# c9: track
# c10: track
# c11: sweep
# c12: --notch
# c13: iq acquire
# c14: iq frontend
seg-b6c354fa0c28 = <b><c1/> und <c2/> wenden die Front-End-Flags an.</b> Der Hilfetext bewarb <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> bei <c9/>, aber <c10/> und <c11/> bauten die Kette nie auf: Die Flags wurden stillschweigend ignoriert, und ein Flag ohne Wert wie <c12/> verschluckte das Flag danach. Beide Befehle parsen sie jetzt wie <c13/> und setzen eine frische Front-End-Kette vor den Akquisitionsdurchlauf und den Tracking-Durchlauf. Die Ausgabe entspricht dem Ausführen des Befehls auf der Datei, die <c14/> für dieselben Flags schreibt.

# text
seg-d7238dab610e = IQ-Szenendaten werden je Signal platziert.

# text
# c1: kshana iq scene --data
# c2: NavData::Seeded
# c3: SpreadingCode::data_modulation()
# c4: DataModulation
# c5: iq::signals
# c6: NavData::Lnav
# c7: Scene
# c8: NavData::Lnav
# c9: NavData::Seeded
seg-46ace9a3e008 = <c1/> (und <c2/>) legen Bits mit { "50" } bit/s auf jedes Signal, Pilotsignale eingeschlossen, und mit der GPS-LNAV-Rate auf Galileo und BeiDou. Die Daten folgen jetzt dem eigenen Symboltakt jedes Signals, angegeben durch das neue <c3/> (<c4/>, gesetzt von jedem Konstruktor in <c5/>). Das sind { "10" } ms bei L5-I5, { "4" } ms bei E1-B, { "2" } ms bei BeiDou B1I GEO (D2) und Bits mit { "20" } ms mit einem Mäander von { "10" } ms bei GLONASS L1OF. Daten werden bei Pilotsignalen abgelehnt, bei GPS L2C als einem CM/CL-Strom, und <c6/> bei allem außer L1 C/A. Benutzerdefinierte Codes behalten standardmäßig den früheren Takt von { "20" } ms. Eine programmatische <c7/>, die <c8/> bei einem Code, der nicht L1 C/A ist, oder <c9/> bei einem Pilotsignal verlangte, erzeugte früher stillschweigend und gibt jetzt beim ersten Lesen einen Fehler zurück.

# text
seg-9dd38fa39d14 = GLONASS-L1OF-Kanäle werden auf ihrem eigenen FDMA-Träger akquiriert und verfolgt.

# text
# c1: iq::acq::acquire
# c2: if_hz
# c3: SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)
# c4: carrier − center
# c5: if_hz
# c6: k
# c7: u32
# c8: k = -7
# c9: sat_id
# c10: k + 2^32
# c11: k
# c12: i32
seg-a775751ed6f6 = <c1/> und die Tracking-Kanäle mischten jeden Code allein von <c2/> herunter. In einer GLONASS-Aufzeichnung mit mehreren Kanälen fand eine Suche nach Kanal +{ "3" } daher das Signal von Kanal { "0" } (alle Kanäle teilen sich einen Entfernungscode) und schaute nie { "1.6875" } MHz höher. Beide verwenden jetzt <c3/>. Der Trägerterm ist null für jede Aufzeichnung, die auf dem eigenen Träger des Signals zentriert ist, und entfällt, wenn die Mitte unbekannt ist, sodass die CDMA-Verarbeitung unverändert ist. Wenn Sie das alte Verhalten umgangen haben, indem Sie <c4/> in das <c5/> des Sidecars eingerechnet haben, entfernen Sie diesen Term: Der Versatz wird jetzt aus Träger und Mitte angewandt, sodass er bei Beibehaltung zweimal angewandt wird. Bekannte Einschränkung, hier unverändert: Eine GLONASS-Szene identifiziert jeden Satelliten über seinen Frequenzkanal <c6/>, und die Satelliten-ID <c7/> umbricht einen negativen Kanal. Das Wahrheits-Sidecar schreibt <c8/> als <c9/> { "4294967289" } (<c10/>). Lesen Sie ihn als <c11/> mit einem Cast auf <c12/> zurück.

# text
# c1: iq
# c2: kshana iq
# c3: scene
# c4: acquire
# c5: track
# c6: sweep
# c7: labfit
# c8: kshana.iq_scene
# c9: iq_acquire
# c10: iq_track
# c11: iq_labfit
# c12: iq_signals
# c13: iq::cli
# c14: tests/iq_cli.rs
seg-1c88bffc605b = <b>GNSS-IQ-Schicht in CLI und Python ({ "0.32.0" } Phase A).</b> Das bestehende Modul <c1/> ist jetzt ohne Rust-Programmierung nutzbar. Fünf neue Befehle <c2/> kommen zur Gruppe der Datenverarbeitung hinzu: <c3/> erzeugt eine lange IQ-Szene mit mehreren Satelliten in eine Datei, mit einem Wahrheits-Sidecar; <c4/> führt FFT-Akquisition eines oder mehrerer PRNs über eine Aufzeichnung aus und meldet jede Detektion (PRN, Doppler, Codephase, Statistik, Schwelle); <c5/> akquiriert und lässt dann die Bank aus DLL/PLL/FLL über eine Aufzeichnung laufen und gibt das Tracking je Epoche aus (CSV/JSON), mit konfigurierbaren Schleifenbandbreiten, Integrationszeit und Korrelatorabstand; <c6/> spielt eine Aufzeichnung über mehrere Schleifenentwürfe ab und meldet den resultierenden Jitter und die Lock-Kennzahlen je Entwurf; und <c7/> passt das Lock-Verlust-Modell der Tracking-Schleife an eine Zeitreihe des Empfänger-Vertrauens an. Derselbe Kern wird Python zugänglich gemacht (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>) und liefert NumPy-freundliche Listen und Wörterbücher. Nur Software und additiv: keine neuen Abhängigkeiten, kein Senden, keine Synthese von Störungs- oder Spoofing-Wellenformen; Engine, Akquisition, Tracking und Schleifenentwürfe sind die eigenen des Crates, sodass ein Aufrufer von CLI oder Python dieselben Bits erhält wie die Rust-Tests. Neues Modul <c13/>; das eigene Wahrheits-Sidecar der Szene ist die unabhängige Referenz in <c14/> (die Akquisition gewinnt jede eingespeiste Codephase und jeden Doppler zurück, das Tracking konvergiert zum eingespeisten Doppler). Keine veröffentlichte Zahl von Szenarioarten und keine Zeile der Verifikationsmatrix ändert sich.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Übrige Fähigkeiten der GNSS-IQ-Bibliothek in der CLI <c1/> und in Python ({ "0.32.0" } Phase A.2).</b> Baut auf Phase A auf und macht den Rest der Schicht <c2/> ohne Rust-Programmierung zugänglich:

# text
# c1: iq scene
# c2: iq_scene
# c3: --iono-stec
# c4: --iono-vtec
# c5: --iono-klobuchar
# c6: --tropo
# c7: --s4
# c8: --scint-tau0
# c9: --sigma-phi
# c10: --multipath-height
# c11: --multipath-ground
# c12: --land-mobile
# c13: --nlos
# c14: iq::channel::SceneChannelAdapter
seg-67c485097357 = <b>Ausbreitungskanal bei <c1/></b> (und im Python-<c2/>): eine Ionosphäre erster Ordnung (<c3/>/<c4/> oder <c5/>), die Troposphäre nach Saastamoinen/Niell (<c6/>), das Cornell-Szintillationsmodell (<c7/>, <c8/>, <c9/>), spekulare Mehrwegeausbreitung am Boden (<c10/>/<c11/>), der Land-Mobil-Kanal mit drei Zuständen (<c12/>) und ein Block ohne Sichtverbindung (<c13/>) wirken über eine neue crate-interne Brücke (<c14/>), die die absoluten Pfade der Kanalmodelle in die Überschuss-über-Geometrie-Form der Szene umwandelt, auf jeden Satelliten.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>SigMF-Ausgabe bei <c1/></b> (<c2/>): schreibt die Abtastwerte als Paar <c3/>/<c4/> mit einem Capture und Annotationen je Satellit; <c5/>/<c6/> lesen SigMF bereits, sodass eine Szene den Round-Trip besteht.

# text
# c1: iq frontend <in> <out>
# c2: acquire
# c3: track
# c4: --bandpass
# c5: --notch
# c6: --blank
# c7: --excise
# c8: --agc
# c9: --bits
# c10: iq::frontend
# c11: iq_frontend
seg-c59ae97779ae = <b>Front-End-DSP</b>: ein neuer Befehl <c1/> und dieselben Flags bei <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) führen die Stufen von <c10/> aus (Bandpass-FIR, adaptiver Notch, Pulsaustastung, Excision im Frequenzbereich, AGC, Quantisierer); in Python gespiegelt als <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Szenen aus Broadcast-Ephemeriden</b>: <c1/> (mit <c2/>/<c3/>/<c4/>) setzt mit dem RINEX-Leser der Engine jeden gesunden GPS-Satelliten auf seine wahre Broadcast-Geometrie, sodass das Wahrheits-Sidecar die reale Entfernung, den Doppler und die Codephase je Satellit trägt; in Python gespiegelt als <c5/>. Nur Software und additiv: keine neuen Abhängigkeiten, kein Senden, keine Synthese von Störungs- oder Spoofing-Wellenformen (Ausbreitungseffekte des Kanals wirken nur auf das legitime Signal). Jede numerische Behauptung wird in den Unit-Tests für Kanal und Front-End und in <c6/> gegen eine unabhängige Referenz geprüft (geschlossene Form oder eingespeiste Wahrheit).

# text
# c1: iq
# c2: kshana iq
# c3: iq::scene
# c4: iq::channel
# c5: iq::acq
# c6: iq::track
# c7: iq::frontend
# c8: iq::io
# c9: iq::signals
# c10: iq::labfit
# c11: docs/design/GNSS-IQ-PLAN.md
seg-1e71370d87d8 = <b>GNSS-IQ-Schicht: Simulation auf Signalebene und Verarbeitung durch Software-Empfänger.</b> Ein neues Modul <c1/> führt Kshana von einem Einzelsatelliten-Front-End für kurze Blöcke mit L1 C/A zu einer vollständigen Schicht auf Signalebene, erreichbar über die Befehlsgruppe <c2/>. Es erzeugt lange rohe IQ-Szenen mit mehreren Satelliten und einem Wahrheits-Sidecar je Epoche (<c3/>); wendet die Ausbreitung auf Signalebene an – Ionosphäre mit Code-Träger-Divergenz, Troposphäre, Amplituden- und Phasenszintillation (Cornell-Modell), Fresnel-Mehrwegeausbreitung und einen Land-Mobil-Kanal mit drei Zuständen, mit fehlender Sichtverbindung (<c4/>); akquiriert und verfolgt mit FFT-Akquisition und einer Bank aus mehreren DLL/PLL/FLL-Kanälen und spielt eine Aufzeichnung durch viele Schleifenentwürfe ab (<c5/>, <c6/>); modelliert das Front-End – FIR-/IIR-Filterung, Quantisierung mit 1 bis 14 Bit, AGC, Notch, Pulsaustastung und Excision im Frequenzbereich (<c7/>); streamt große aufgezeichnete Datensätze mit begrenztem Speicher – Formate int8/int16/float32/gepackt mit 2 Bit und reale ZF, SigMF aus mehreren Dateien, Resampling, ein Datensatzinventar mit SHA-256 je Datei und ein Batch-Runner (<c8/>); fügt Spreizcodes für GPS L5/L2C, Galileo E1 (CBOC, reale ICD-Speichercodes) und E5a, BeiDou B1C/B1I und GLONASS L1OF hinzu, jeweils gegen sein Interface Control Document geprüft (<c9/>); und passt das Lock-Verlust-Modell der Tracking-Schleife an das beobachtete Verhalten eines realen Empfängers in Laborläufen an, mit Hold-out-Fehler bei Auslassung je eines Laufs und als Vorhersage gekennzeichneter Extrapolation (<c10/>). Jede numerische Behauptung wird gegen eine unabhängige Referenz geprüft (eine ICD-Tabelle, eine geschlossene Form oder einen unabhängigen Empfänger, der die eingespeiste Wahrheit zurückgewinnt); die physikalischen Kanal- und Schleifenmodelle bleiben MODELLED. Das ist nur eine Software-Schicht: Sie schreibt IQ-Dateien für Software-Empfänger und synthetisiert keine Störungs- oder Spoofing-Wellenformen und steuert keine Funkhardware an. Keine veröffentlichte Zahl von Szenarioarten und keine Zeile der Verifikationsmatrix ändert sich. Entwurf: <c11/>.

# text
seg-943e21ccb25f = Empfänger-Vertrauen: ein reales GNSS-Empfängerprotokoll bewerten.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> liest ein Protokoll von u-blox UBX, RINEX { "3" } (mit optionaler Broadcast-Navigationsdatei), Android GnssLogger oder NMEA { "0183" } in eine zeitgestempelte Zeitleiste und lässt darüber Vertrauens-Monitore laufen: Abfall der Trägerrauschdichte (C/N0), Lock-Verlust, automatische Verstärkungsregelung (AGC), den Jamming-Indikator von u-blox, Positionssprung und, mit RINEX und Navigation, die eigene Single-Point-Lösung der Engine mit Paritäts-RAIM (receiver autonomous integrity monitoring) und den uhrengestützten Monitor. Jede Epoche ist nominal, beeinträchtigt oder nicht vertrauenswürdig, und das Ergebnis sagt, wann und warum. Im Szenario genannte Ereignisse und vorhergesagte C/N0-Abfälle werden gegen Toleranzen bewertet, die in derselben Datei genannt sind: erkannt, verspätet oder verpasst, und übereinstimmend oder abweichend. Ausgaben sind das Ergebnis-JSON, eine CSV je Epoche und ein Diagramm; das Ergebnis trägt die SHA-256 des Protokolls und jede Schwelle. Auch erreichbar aus Python (<c2/>), dem WebAssembly-Paket (<c3/>, Protokolle inline) und dem neuen Werkzeug <c4/> des Model-Context-Protocol-Servers (MCP). Anleitung: <c5/>; Beispiel: <c6/>. Bei den Spoofing-Protokollen von JammerTest { "2024" } reproduziert der Pfad der Engine den ersten Alarm der vorab registrierten Pipeline der unabhängigen Referenz bei jedem veröffentlichten Beginn (<c7/>). Die Monitore bleiben MODELLED; keine Zeile der Verifikationsmatrix ändert sich.

# text
seg-55669fe92932 = Ein Minor-Release. Validierungsrunden { "2" } und Pakete der Welle 1 heben die Verifikationsmatrix von { "223" } Zeilen ({ "93" } VALIDATED) bei { "0.29.3" } auf { "249" } Zeilen ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); jede Beförderung wurde gegen eine unabhängige Referenz bei einer vor dem Lauf festgelegten Toleranz geprüft, und jede Abweichung ist als Befund veröffentlicht. Neu: ein nativer Leser für NAIF-Kernel und ein Pfad für DE440, ein validierter Pfad für SGP4-nach-ITRS-Propagation und Zeit, eine gemessene Uhrenbibliothek, ein Referenzgenerator für LunaNet AFS, Löser mit erweiterter Genauigkeit und Quadratwurzel-Information sowie reale lunare IQ-Verarbeitung an LuGRE-Daten. Veröffentlichte Zahlen, die sich verschoben haben, sind unten als Revisionen aufgeführt.

# text
seg-8d542741fa77 = nach Runde { "1" }

# text
seg-ae3743f976c5 = Zeilen der Verifikationsmatrix

# text
seg-6c4b1fd56a31 = davon VALIDATED gegen eine externe unabhängige Referenz

# text
seg-90450fe87280 = davon MODELLED

# text
seg-86972e4c7f12 = davon PARTNER

# text
seg-61c5c5e308ed = In diesem Eintrag verwendete Abkürzungen

# text
seg-5907283b71da = Abkürzung

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (von ARAIM); advanced receiver autonomous integrity monitoring; das Matlab Algorithm Availability Simulation Tool der Stanford University

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = Allan-Abweichung; Random Walk der Geschwindigkeit; Random Walk des Winkels

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = ein quelloffenes Werkzeug für Astrodynamik (Nyx Space); das Toolkit Spacecraft, Planet, Instrument, C-matrix, Events der NASA aus ihrer Navigation and Ancillary Information Facility; Kernel für Planetenkonstanten

# text
seg-0789b1b8dba2 = BCRS, TDB, TT

# text
seg-584e509c80a5 = Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time

# text
seg-f03148ef3497 = BIPM, UTC(k)

# text
seg-d6e01fbf4f10 = Internationales Büro für Maß und Gewicht; die Realisierung der koordinierten Weltzeit durch ein Labor

# text
seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

# text
seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; lunare Zeitsysteme, die in das Feld TIME_SYSTEM der Nachricht geschrieben werden

# text
seg-bed3cea7e74f = CRLB

# text
seg-525ebb08f4bc = untere Schranke nach Cramér–Rao

# text
seg-a1fff77503b4 = CW

# text
seg-064470740a35 = Relativbewegung nach Clohessy–Wiltshire

# text
seg-d70a9b3e92a7 = Development Ephemeris { "440" } des Jet Propulsion Laboratory

# text
seg-6f6e14685742 = DOP, PDOP

# text
seg-08aad29b6845 = Dilution of Precision; Position Dilution of Precision

# text
seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

# text
seg-e9ecdbb0f600 = erweiterter Kalman-Filter; Unscented-Kalman-Filter; Inertialnavigationssystem; globales Satellitennavigationssystem; inertiale Messeinheit

# text
seg-86765c7a6bbf = EMT, VPL, HPL

# text
seg-23029e0ceed2 = effektive Monitorschwelle; vertikales und horizontales Schutzniveau

# text
seg-27786c406107 = EOP, IERS, PCC, MAE

# text
seg-9d0a1a9fdebc = Erdorientierungsparameter; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; mittlerer absoluter Fehler

# text
seg-1508f3d3a180 = ERFA, SOFA

# text
seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

# text
seg-900c7c7e99cd = GMAT

# text
seg-0382d12eabc8 = das General Mission Analysis Tool der NASA

# text
seg-025aec0f5e29 = NTN, SSB

# text
seg-183dca4a747b = nichtterrestrisches Netz (3GPP); Synchronisationssignalblock

# text
seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

# text
seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

# text
seg-eaca07ff8609 = ILS, LAMBDA

# text
seg-b3cb3e6ea499 = ganzzahlige kleinste Quadrate; Least-squares AMBiguity Decorrelation Adjustment

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = Bias zwischen Systemen

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = niedrige Erdumlaufbahn

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = Lösungstrennung bei mehreren Hypothesen; Schutzniveau; Schutzniveau der Zeitgebung

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = spektrale Leistungsdichte; Abtastwerte in Phase und Quadratur; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = Quantenprojektionsrauschen

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = receiver autonomous integrity monitoring

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = satellitengestütztes Ergänzungssystem; das US-amerikanische Wide Area Augmentation System; Mehrfrequenz und mehrere Konstellationen; ein geostationärer SBAS-Satellit

# text
seg-eabf9641678b = RMS, SISRE

# text
seg-50a677b8e972 = quadratischer Mittelwert; Entfernungsfehler im Signal im Raum

# text
seg-430b3c681347 = RTKLIB

# text
seg-3e75054c0034 = eine quelloffene Bibliothek für GNSS-Positionierung

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-264e9e51b8f8 = Interferometrie mit sehr langer Basislinie

# text
seg-c3bc7d828ecc = Jede Zeile unten nennt die Art ihrer unabhängigen Referenz (Library: eine unabhängige Bibliothek eines Dritten, die eine eindeutig definierte Größe berechnet; Measured: reale Messdaten; P2: eine unabhängige numerische Bibliothek, die eine Größe der linearen Algebra auf eingecheckten Eingaben neu berechnet), die unabhängige Referenz, die vor dem Lauf festgelegte Toleranz und das Ergebnis. Jede Beförderung wurde von einem zweiten Prüfer erneut ausgeführt, der die Fixture Byte für Byte neu erzeugte und zeigte, dass eine bewusste Mutation der Engine den Test rot werden lässt.

# text
seg-be0a4e3ac81c = <b>GNSS/INS-Sensorfusion</b> (Library), begrenzt auf den lose gekoppelten Fehlerzustands-EKF mit 15 Zuständen: NaveGo v1.4 (LGPL-3.0, unter GNU Octave ausgeführt) auf seiner eigenen realen IMU/GNSS-Fahrt mit Ekinox. Der horizontale, der vertikale und der Positions-Innovations-RMS von Kshana betragen { "0.912" }, { "0.940" } und { "0.861" } von denen von NaveGo (Zielwert { "1.2" }), und seine mittlere normierte Innovation beträgt { "0.395" } (Zielwert { "1.5" }). GNSS ist während der ganzen Fahrt vorhanden, daher wird kein Ausfall getestet. Der eng gekoppelte UKF und der gekoppelte Uhrenfilter bleiben außerhalb der Behauptung.

# text
seg-0c82afd5ba30 = <b>Fehlerbudget für 3-DOF-Lage und Ausrichtung</b> (Library), eingegrenzt auf die Spitze des Gravitationsgradienten-Moments: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } Fälle, innerhalb von { "1e-12" } relativ (schlechtester Wert { "2.1e-15" }). Das RSS-Budget der Ausrichtung ist eine Summe vom Aufrufer gelieferter Zahlen und bleibt außerhalb davon.

# text
seg-71cf58e91a09 = <b>Lunare gemeinsame Geometrie für Kommunikation und Navigation</b> (Library), eingegrenzt auf Standortplatzierung, Azimut, Elevation und Entfernung: ANISE { "0.10.2" }, { "768" } Stichproben, innerhalb von { "1e-6" } Grad und { "1" } mm (schlechtester Wert { "2.2e-12" } Grad und { "5.6e-9" } m). Der Parameter für die Genauigkeit der Entfernungsmessung ist eine Entwurfseingabe außerhalb der Behauptung.

# text
seg-0687c757231b = <b>Momentenfreie Lagedynamik starrer Körper</b> (Library): der Basilisk-{ "2.9.1" }-Raumfahrzeug-Hub, { "1e4" } s auf zwei allgemeinen Trägheiten, Quaternion und Raten innerhalb von { "1e-9" } (schlechteste Werte { "3.3e-11" } und { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>Auflösung der ganzzahligen Mehrdeutigkeit der GNSS-Trägerphase (LAMBDA)</b> (Library), eingegrenzt auf die ILS-Lösung und ihre beiden besten Normen: RTKLIB v2.4.2-p13 <c1/>, { "300" } Kovarianzen, { "0" } ganzzahlige Abweichungen, Normen innerhalb von { "1e-9" } relativ (schlechtester Wert { "5.6e-13" }). Die Erfolgsrate des Bootstrap bleibt nur intern geprüft.

# text
seg-c23196cbdc96 = <b>Zusammengesetzte Zeitgebungs-PL, skalares MHSS</b> (P2): numpy { "2.3.5" } und scipy { "1.18.1" } auf { "300" } festgeschriebenen Eingaben, PL innerhalb von { "1e-9" } relativ (schlechtester Wert { "1.2e-10" }), Teilmenge der Ansteuerung identisch.

# text
seg-8f524d815949 = <b>GLS-Gleichtakt-Whitening und die Mahalanobis-Identität</b> (P2): numpy { "2.3.5" } LAPACK auf { "201" } festgeschriebenen Kovarianzen, innerhalb von { "1e-12" } relativ (schlechtester Wert { "7.9e-16" }); Konditionszahlen bis { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>DE440-Anbieter der Hauptachsenorientierung des Mondes</b> (Bibliothek): SPICE <c1/> auf dem binären PCK bei { "2 000" } Epochen außerhalb der Knoten, innerhalb von { "1.7e-5" } rad (schlechtester Wert { "1.7e-6" } rad, etwa { "3" } m an der Oberfläche), nach der unter "Fixed" aufgeführten Korrektur.

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>SigMF-Aufzeichnungs-Ein- und -Ausgabe sowie Welch-Spektren</b> (Bibliothek), eingegrenzt auf SigMF-Lesen und -Schreiben und <c1/>: scipy { "1.18.1" } <c2/> innerhalb von { "1e-12" } relativ je Bin (schlechtester Wert { "6.0e-14" }); sigmf-python { "1.13.0" }-Aufzeichnungen bitidentisch dekodiert; die Metadaten des Crates gültig gegen das SigMF-Schema { "v1.2.6" }. IQ-Synthese und ihre Modellvergleiche bleiben außerhalb.

# text
seg-a7756d2e124a = <b>LEO-Broadcast-Ephemeriden-Fitter und SISRE gegen das Fit-Intervall</b> (Measured), eingegrenzt auf den Kepler-Fit mit 16 Parametern und dessen reine Bahn-SISRE: präzise TU-Graz-ITSG-Bahnen von vier Satelliten gegen die Statistik von Liu et al. { "2025" }, Komponenten innerhalb des 1.5-Fachen ({ "0.804" } bis { "1.087" }) und SISRE innerhalb des 1.5-Fachen ({ "0.716" } bis { "0.809" }).

# text
seg-99debd58724a = Befunde

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = Die unabhängige Referenz widersprach diesen Zeilen, daher bleiben sie MODELLED. Jeder Befund ist zusätzlich in den Referenztext der Zeile geschrieben (und damit in <c1/>), mit einem Test, der ihn festschreibt.

# text
seg-e28fac875d8c = <b>Zustandsschätzung der Borduhr:</b> auf zurückgehaltenen IGS-Uhren von { "11" } GPS-Block-IIF-Satelliten ist das Filter mit drei Zuständen einen Schritt voraus konsistent, aber nach einer Stunde bei { "9" } von { "11" } übermäßig zuversichtlich (periodische und Flicker-Terme sind nicht im Modell).

# text
seg-5900ce454dc7 = <b>Spoofing-Erkennung:</b> bei JammerTest { "2024" } schlug kein Monitor auf Beobachtungsebene innerhalb von { "10" } s nach einem der { "8" } veröffentlichten Einsätze Alarm, und drei Fenster vor dem Einsatz enthielten Fehlalarme.

# text
seg-08b6e6aa7d08 = <b>Zeitgebungs-Schutzniveau unter Spoofing:</b> der gemessene unentdeckte Zeitfehler überschreitet das TPL bei { "3" } von { "8" } erkannten Einsätzen (1.9x bis 5.3x); eine Uhrenkalibrierung von { "60" } s deckt das Wandern des TCXO des Empfängers nicht ab.

# text
seg-a2f4df11d9cc = <b>Startfenster und Aufstiegsgeometrie:</b> gegenüber Orekit { "12.2" } stimmt die Geometrie bis auf Rundung überein, aber die Standortgeschwindigkeit aus der Erdrotation verfehlt { "1e-6" } relativ bei { "62.9" } Grad Breite ({ "1.12e-6" }, die Polbewegung, die das sphärische Modell auslässt). Runde { "2" }: die Geschwindigkeit am wahren Pol mit Epoche stimmt überein, die Standardgeschwindigkeit ohne Epoche verfehlt weiterhin (siehe unten).

# text
seg-f6b6c9251a17 = <b>Ballistischer Wiedereintrittskorridor (Allen–Eggers):</b> die vorhergesagte Spitzenverzögerung für den Stardust-Eintritt beträgt { "61.8" } g gegenüber den rekonstruierten { "32.89" } g (+{ "88" } %, Toleranz { "15" } %).

# text
seg-5d83648dd867 = <b>Gemeinsamer UT1- und Polbewegungsfehler:</b> gegenüber der in { "178" } IERS-Bulletin-A-Ausgaben gedruckten Genauigkeitsformel stimmt der Pol innerhalb des 1.5-Fachen überein, UT1 jedoch nicht ({ "0.48" } bei { "10" } Tagen, { "1.59" } bei { "40" } Tagen). In Runde { "2" } abgelöst: die Zeile ist jetzt VALIDATED (siehe unten).

# text
seg-98a99bcba894 = <b>Standard-Erdorientierungseingabe offline:</b> astropy bestätigt die Zeilenzählung, aber die { "12" } Zeilen, die das Crate als Bulletin-A-Vorhersagen bezeichnet, sind als gemessen (I) gekennzeichnet, nicht als vorhergesagt (P). Die Übereinstimmungswerte der Zeile des operativen Prädiktors bezogen sich daher auf gemessene Zeilen. In Runde { "2" } abgelöst: die Engine klassifiziert Zeilen nach Kennzeichen, und die Zeile ist VALIDATED.

# text
seg-d96fbfa4be79 = <b>Vorhersagefehler der Erdorientierung im operativen Stil:</b> der UT1-Fehler des Prädiktors ist 2.4x bis 12.6x der von Bulletin A bei { "1" } bis { "10" } Tagen und { "5.32" } ms bei { "10" } Tagen, außerhalb des Bereichs von { "0.36" } bis { "3.13" } ms des 2nd EOP PCC.

# text
seg-1833bf6e3b6f = <b>Mondgeodätische VLBI:</b> gegenüber ANISE-Lichtlaufzeiten über DE440 liegt keine Verzögerung innerhalb von { "1" } ps; die größte Abweichung beträgt { "24" } µs, überwiegend durch das analytische Mondzentrum (etwa { "200" } km von DE440). Runde { "2" }: der Kernel-Pfad ist in einer eigenen Zeile VALIDATED; dieser analytische Pfad bleibt MODELLED.

# text
seg-0ec8a2a91702 = <b>Export zur Interoperabilität auf dem Mond:</b> Orekit { "12.2" } verweigert die Zeitsysteme LTC und TCL, daher ist der Austausch der lunaren OEM-Dateien mit einem zweiten Leser nicht belegt.

# text
seg-09cfd4e61b7b = <b>Clohessy–Wiltshire-Relativbewegung:</b> gegenüber der nichtlinearen Bewegung in Orekit bei { "100" } m beträgt die Abweichung { "1.2" } bis { "6.3" } mm, über { "1" } mm; sie skaliert wie der ausgelassene Term zweiter Ordnung, sodass die vorab festgelegte Toleranz unter dem Linearisierungsfehler lag. In Runde { "2" } abgelöst: die Korrektur zweiter Ordnung ist gegen denselben Zielwert VALIDATED.

# text
seg-af1bdd974ba5 = <b>Fehlerwachstum bei INS/TRN-Koppelnavigation:</b> gegenüber einer freien inertialen Monte-Carlo-Rechnung von NaveGo gelten die Wachstumsgesetze innerhalb von { "5" } % bis { "600" } s und überschätzen darüber hinaus (2.2x bis 8x nach einer Stunde), weil sie die Schuler-Rückkopplung auslassen. In Runde { "2" } abgelöst: das Schuler-Fehlermodell ist VALIDATED.

# text
seg-8459bc50f8b4 = <b>Mond-Dienstvolumen aus realer Konstellationsgeometrie:</b> { "4" } von { "12" } veröffentlichten Verfügbarkeitsstatistiken weichen um mehr als { "2" } Prozentpunkte ab (bis zu { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Überschranke der Rückführbarkeitsabweichung heterogener UTC(k):</b> auf { "105 024" } BIPM-Zeilen wird die Überschranke bei { "50.8" } % der Zeilen überschritten; die veröffentlichte Unsicherheit begrenzt die Messung des Versatzes durch das BIPM, nicht den Versatz.

# text
seg-814acf34cffd = <b>Klassifikation des Nullraums des Mond-Datums:</b> bei der veröffentlichten Fünf-Reflektor-Geometrie beträgt die Korrelation -0.78 gegenüber -0.97, und die CRLB des Ursprungs liegt { "96" } bis { "98" } % unter der der Veröffentlichung.

# text
seg-da01b5e08a87 = <b>Geometriesubstrat des Mond-LLR-Datums:</b> gegenüber { "192" } lunaren ILRS-Normalpunkten von { "2024" } betrug der RMS des Einweg-Residuums { "96" } m mit der früheren Orientierungsinterpolation und beträgt { "22.7" } m nach der unten genannten Korrektur, weiterhin über dem Zielwert von { "10" } m (gerundete Stationskoordinaten, keine Polbewegung). Die Orientierungsreihe wird außerhalb von 2024-2025 stillschweigend begrenzt. Runde { "2" }: das Modell der gemessenen Entfernung ist in einer eigenen Zeile VALIDATED ({ "2.81" } m); die Reihe deckt jetzt 2014-2030 ab und meldet außerhalb davon Fehler.

# text
seg-fd9ad94680e9 = <b>Kopplung der relativistischen Uhrenrate an das Bezugssystem:</b> der Eigenpotentialterm liegt { "3.18e-4" } über dem veröffentlichten Wert (Toleranz { "1e-4" }); die Veröffentlichung wertet ein anderes Potential aus, sodass für diese geschlossene Form kein veröffentlichter Wert existiert. In Runde { "2" } abgelöst: das äquatoriale Potential vom Grad 2 ist gegen dieselbe Veröffentlichung VALIDATED.

# text
seg-e002819c1e2d = <b>Physikalische Konstanten jedes Körpers des Sonnensystems:</b> { "12" } von { "84" } Konstanten der hinzugefügten Körper weichen von NAIF pck00011 und gm_de440 ab (ältere Elemente der Marsmonde; andere GM-Lösungen für Uranus, Neptun und Pluto). Runde { "2" }: die Konstanten folgen jetzt NAIF (eine Transkription, nicht gezählt), und die berechnete Orientierung stimmt mit SPICE überein; die Zeile bleibt MODELLED.

# text
seg-e722d242e78e = <b>Wählbare LEO-Ephemeridenmodelle:</b> der Fit mit 22 Parametern lässt das 1.71-Fache und das 1.86-Fache des veröffentlichten Along-Track-Fehlers auf Bögen von { "20" } min, über dem 1.5-Fachen. In Runde { "2" } abgelöst: das Modell mit 22 Parametern und sein Fit sind in einer eigenen Zeile VALIDATED.

# text
seg-c136023752df = <b>Gemeinsame GNSS- und LEO-Positionierung:</b> die Intersystemabweichung stimmt mit RTKLIB überein, aber { "93.2" } % der Epochen liegen innerhalb von { "3" } m von ITRF2020 gegenüber { "95" } %; RTKLIB selbst erreicht auf den Daten { "88.2" } % ({ "93.6" } % nach der Gruppenlaufzeitkorrektur aus Runde 2).

# text
seg-e5f0e3c21def = <b>Integritätsblindheit im Gleichtakt</b> und <b>Abdeckungs- und DOP-Karten:</b> beide Vergleiche bestanden, wurden aber bei der Prüfung abgelehnt, weil auch eine absichtlich falsche Engine sie besteht (der erste prüft nur eine interne Identität; die veröffentlichten Untergrenzen des zweiten können ein verdoppeltes PDOP nicht erkennen). Runde { "2" }: die Integritätsblindheit im Gleichtakt ist bei paritätstragenden Eingaben VALIDATED; die Abdeckungskarten bleiben ein Befund (siehe unten).

# text
seg-688e1753cd53 = Validierungsrunde { "2" }

# text
seg-b320fbdb72c3 = Die zweite Runde nahm jede Zeile, die die erste Runde noch routbar ließ, mit frischen Vorregistrierungen, die festgeschrieben wurden, bevor ein Fixture abgerufen oder eine unabhängige Referenz ausgeführt wurde, mit einem adversarialen zweiten Prüfer, der jeden Vergleich erneut ausführte, und mit einer absichtlichen Engine-Mutation, die jeden Test rot färben muss. Der Eigentümer nahm am 2026-10-02 den korrigierten Wortlaut der Zeile zur Schranke außerhalb von Omega an, bevor sie hochgestuft wurde (ihr alter Text widersprach dem Code).

# text
seg-7b7c584caaaf = <b>Zu VALIDATED hochgestuft ({ "17" }).</b> Art der unabhängigen Referenz in Klammern; Toleranz vor dem Lauf festgelegt.

# text
seg-555e6ad454d2 = <b>Kopplung der relativistischen Uhrenrate an das Bezugssystem</b> (Referenz): L_m von Ashby und Patla { "2024" } innerhalb von { "2.8e-6" } (Zielwert { "1e-4" }) aus dem äquatorialen Potential vom Grad 2 der beiden Felder, die die Veröffentlichung zitiert; pyshtools-Gravitation vom Grad 350 für den radialen Eintrag ({ "8.3e-5" }); DE441-Mondgeschwindigkeit ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Standard-Erdorientierungseingabe offline</b> (Bibliothek): astropy { "8.0.1" } und IERS Bulletin A Nr. { "039" } bestätigen die { "30" } endgültigen, { "54" } schnellen und { "90" } vorhergesagten Zeilen des neu zugeschnittenen Auszugs.

# text
seg-b77253dd26b5 = <b>Gemeinsamer UT1- und Polbewegungsfehler</b> (Bibliothek): vollständige Rotationen von astropy und pyerfa reproduzieren die gemeinsame Tabelle (UT1 und Pol innerhalb von { "6e-16" }, die Kombination innerhalb von { "1.9e-7" }); die realisierten Fehler des IERS Annual Report { "2019" } ergeben Verhältnisse von { "1.001" } bis { "1.100" }.

# text
seg-378414f812c1 = <b>Fußabdruck und Abdeckung der EO-Nutzlast</b> (Bibliothek): Orekit { "12.2" } und GeographicLib { "2.1" } bei jedem vorab festgelegten Zielwert, wobei die J2-Knotenregression jetzt im Knotenabstand enthalten ist.

# text
seg-792bf58a1c1e = <b>Clohessy–Wiltshire-Relativbewegung</b> (Bibliothek): mit einer Korrektur zweiter Ordnung in geschlossener Form innerhalb von { "1.2e-7" } m von der nichtlinearen Bewegung in Orekit gegenüber { "1e-3" } m; die lineare Matrix allein bleibt charakterisiert ({ "1.2" } bis { "6.3" } mm).

# text
seg-423437d90022 = <b>B-Ebenen-Zielführung und Gravity Assist mit Patched Conics</b> (Bibliothek): GMAT R2026a B-Ebene, Asymptoten, C3 und heliozentrische Elemente; sbpy { "0.6.0" } sowie Kasuga und Jewitt { "2019" } für den Tisserand-Parameter.

# text
seg-b29b0dfcd3a4 = <b>Fehlerwachstum bei INS/TRN-Koppelnavigation</b> (Bibliothek): ein Schuler-Fehlermodell mit neun Zuständen innerhalb von { "5" } % der korrigierten NaveGo-Koppelläufe an allen { "48" } Punkten (schlechtester Wert { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Integritätsblindheit im Gleichtakt</b> (P2): numpy <c1/> auf { "1464" } paritätstragenden Eingaben innerhalb von { "1e-12" } (schlechtester Wert { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>Gemeinsame lunare Multi-Technik-OD und Uhr</b> (P2): numpy berechnet jeden Gauß-Newton-Schritt, jedes Sigma und jeden Stationsfehler auf sechs Netzen (innerhalb von { "2.4e-11" }) nach einer Korrektur der QR-Lösung neu.

# text
seg-7ed9b059f888 = <b>Stationskoordinaten-Kovarianz der Mond-VLBI</b> (Bibliothek): eine mit SPICE aufgebaute Jacobi-Matrix reproduziert Zeitplan, Spektrum, Sigmas und Nullraum innerhalb von { "1" } % und { "0.1" } Grad; numpy bis { "2e-13" }.

# text
seg-0e4e1c3fc899 = <b>Nicht erkennbare Gleichtaktschranke bei Residuum außerhalb von Omega</b> (P2, Wortlaut durch Entscheidung des Eigentümers korrigiert): numpy LAPACK auf { "256" } Fällen innerhalb von { "1e-12" }, sechs exakte Unendlichkeiten.

# text
seg-0fc8ce9cde6c = <b>Basisinvariante Klassifikation des Nullraums</b> (P2): Unterraumschnitt mit SciPy und NumPy auf { "72" } konstruierten Matrizen, ganze Zahlen exakt, Projektornorm innerhalb von { "6.0e-15" }.

# text
seg-4e5e7a6072bc = <b>Einfrequenz-Ionosphären- und UTC-Dienste einer LEO-Navigationsnachricht</b> (Bibliothek): GNSSTk { "15.3.1" } für Klobuchar, Az und die UTC-Drift; ERFA für die drei Schaltsekundenfälle.

# text
seg-a644bf49c816 = <b>Positionierungsschranke für 5G-Nicht-Terrestrische-Netze</b> (P1): Einzel-SSB-Schranken von Bachl, Lei und Nabeel { "2026" } innerhalb einer halben gedruckten Stelle; numpy für die Fix-Kovarianzen.

# text
seg-b326f6fc55ad = <b>LLR-Modell der gemessenen Entfernung</b> (Measured, neue Zeile, abgespalten vom LLR-Datumssubstrat): { "192" } lunare ILRS-Normalpunkte bei { "2.81" } m RMS gegenüber einem Zielwert von { "10" } m, mit der baryzentrischen Lichtlaufzeit nach IERS { "2010" }; die Komponenten unterhalb des Zielwerts werden nicht einzeln aufgelöst, und die Zeile sagt das.

# text
seg-82e9fba684dc = <b>Mondgeodätische VLBI, Kernel-Pfad</b> (Bibliothek, neue Zeile, abgespalten von der Zeile zur Mond-VLBI): konvergierte Lichtlaufzeiten aus SPICE innerhalb von { "1" } ps und Partialableitungen innerhalb von { "1e-6" } bei Epochen nahe J2000; der analytische Standardpfad bleibt MODELLED.

# text
seg-03c47d262ff3 = <b>LEO-Ephemeridenmodell mit 22 Parametern nach Liu et al. { "2025" } und sein Fit</b> (Measured, neue Zeile, abgespalten von der Zeile der wählbaren Modelle): reale präzise Bahnen innerhalb des 1.5-Fachen der veröffentlichten Statistik an Tagen der Veröffentlichung und an zurückgehaltenen Tagen ({ "0.683" } bis { "1.186" }); die Skalenkonvention von n_dot ist übernommen und wird durch diesen Vergleich nicht validiert, und die Abbruchregel ist die Parameterkonvergenzregel von Kshana, nicht die RMS-Änderungsregel der Veröffentlichung. Das ATOMIC-Polynom und die Tabelle mit fünf Höhen bleiben MODELLED.

# text
seg-4e26bec3297c = <b>Planetenpositionen aus den JPL-Standish-Elementen</b> und <b>Lichtlaufzeit zwischen Körpern des Sonnensystems</b>: die nachträglichen Zielwerte mit doppeltem Nennwert werden durch vorregistrierte Vergleiche mit JPL Horizons DE441 ersetzt (RMS höchstens der Wert der Tabelle { "8.10.1" } des Explanatory Supplement, schlechtester Wert { "0.778" }, einschließlich der Aufteilung der Erde und der ICRF-Rotation; Lichtlaufzeiten innerhalb von { "1e-6" } s von Horizons auf DE441-Positionen, schlechtester Wert { "6.7e-9" } s). Ihre Kennzeichen "Grenze nach dem Vergleich festgelegt" sind entfernt.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Integrität (RAIM/ARAIM/SBAS)</b>: die Zeile beruht nicht mehr auf Plausibilitätsprüfungen. Sie sagt jetzt: die Multiple-Hypothesen-Lösungstrennung von ARAIM nach ADD v4.2 stimmt bei ARAIM { "2" } auf { "270" } realen Fällen mit Stanford MAAST überein (schlechteste VPL-Differenz { "2.2e-3" } m gegenüber { "0.05" } m); Snapshot-RAIM-Erkennung und -Ausschluss stimmen mit RTKLIB <c1/> bei { "2016" } von { "2016" } Entscheidungen überein, mit dem Schutzniveau der Steigung innerhalb von { "2.7e-12" } m; die L1-Schutzniveaus des SBAS DO-229E stimmen bei realen WAAS-Aussendungen mit Stanford MAAST überein ({ "2868" } Paare innerhalb von { "1.6e-5" } m). Sie stellt klar fest, dass die Funktionen mit einheitlichem Sigma <c2/> und <c3/> NICHT ADD-konform sind (Lücken bei gleichen Eingaben 0.75/4.04 m und 0.39/1.93 m VPL/HPL, ein Befund), dass der DFMC-L5-SBAS-Vergleich ein Befund ist ({ "308" } Paare ohne GEO in Sicht werden von Kshana geschützt und von MAAST nicht) und dass <c4/> keinen externen Vergleich hat. Ihr Selbstkennzeichen ist entfernt.

# text
seg-d059b9953c3f = <b>LEO-Broadcast-Ephemeriden-Fitter</b>: die integrierte Wahrheitsbahn wird dem validierten Teil hinzugefügt (Orekit { "12.2" } innerhalb von { "4.55" } mm über { "6" } h, Zielwert { "2" } cm); die Korrekturpolynome, der Uhr-Fit und der Kompromiss bei der Aktualisierungsperiode bleiben modelliert.

# text
seg-166d511bbba3 = <b>Befunde und blockierte Zeilen (bleiben MODELLED).</b> Der Referenztext jeder Zeile enthält den Befund und seinen festgeschriebenen Test.

# text
seg-7f233dbdf110 = Modulation von Navigationssignalen (Betz { "2001" }, Hein { "2006" }): Spektren und Korrelationen stimmen überein; die Nebenkeulen bei { "24" } MHz und jede Mehrwegabweichung ({ "11" } bis { "15" } % zu niedrig) nicht, Ursache ungeklärt.

# text
seg-4d5a6bb44d64 = TDOA/FDOA-Geolokalisierung: die Schranken stimmen mit Ho und Chan sowie Ho und Xu überein, und mit dem Code der Autoren bis { "3e-12" }; die aus einer Monte-Carlo-Rechnung gedruckten Ottawa-Faktoren weichen um { "1.3" } % und { "4.4" } % ab.

# text
seg-5fa189f788ca = Erd-GNSS in Monddistanz: die GENESIS-Zenitmittelwerte stimmen bei { "5" } von { "6" } mit Montenbruck et al. { "2023" } überein; die Nadirmittelwerte liegen { "1.0" } bis { "2.4" } Satelliten zu hoch.

# text
seg-d7e5b5a64f43 = Abdeckungs- und DOP-Karten: Erd-Designs stimmen bei jedem Zielwert mit Orekit, gnss_lib_py und numpy überein; Mond- und Mars-Designs überschreiten { "1e-9" } nur bei nahezu singulären Zellen.

# text
seg-3c8fb07d83ec = Gemeinsame GNSS-Positionierung: Zweifrequenz { "79.9" } % und präzise Produkte { "94.2" } % innerhalb von { "3" } m gegenüber { "95" } % (RTKLIB { "67.9" } % und { "94.1" } %); die ISB-Lücke bei den präzisen Produkten entsteht, weil RTKLIB Antennenversätze ignoriert.

# text
seg-5d3d4d99fbc4 = Nachführschleifen (GNSS-SDR { "0.0.19" }): stimmen bei { "35" } bis { "45" } dB-Hz überein; bei { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, Schwellen +{ "1.5" } dB; Slip-Zeiten { "0.5" } bis { "2" } Dekaden kürzer.

# text
seg-0dd24947169c = Mond-Dienstvolumen (Orekit und Hipparchus): { "155" } von { "160" } Werten stimmen überein; die Anforderung an die schlechteste Stichprobe scheitert bei nahezu singulärer LNCSS-B-Geometrie.

# text
seg-74002245287f = Quanteninertialsensor: die Untergrenze nur aus QPN liegt { "21" } bis { "31" } % unter dem gemessenen Rauschen von Gauguet { "2009" } (Zielwert { "30" } %, um { "0.5" } Punkte verfehlt).

# text
seg-ab8b17cf325e = Oszillator-Voreinstellungen: gemessene Einheiten überschreiten die Holdover-Voreinstellung für Rubidium, die Kurzzeitvoreinstellung für Caesium und die Voreinstellungen für die schlechteste Einheit des CSAC; für die OCXO-Voreinstellung gibt es keine Messaufzeichnung.

# text
seg-81ad9b839a28 = Weltraumwetter-Dichte: Jacchia { "1971" } liegt im Sonnenmaximum innerhalb eines Faktors { "2" } der Beschleunigungsmesserdichten, ist aber im Minimum { "2008" } etwa 1.7x zu dicht.

# text
seg-68e5d0942847 = Geometriefreies schräges TEC: { "33" } von { "36" } Bögen innerhalb von { "3" } TECU der CODE-Karte (schlechtester Wert { "6.84" }).

# text
seg-f410ce9cf195 = Spoofing-Erkennung und TPL gegen das offizielle JammerTest-{ "2024" }-Protokoll: { "4" } von { "10" } Einsätzen rechtzeitig erkannt; das TPL wird bei { "4" } von { "10" } überschritten.

# text
seg-41eb2c318469 = Uhrenfilter auf frischen IGS-Uhren: zwei von { "11" } Satelliten verfehlen das Kriterium der Innovationssumme.

# text
seg-064b623e918b = EOP-Prädiktor aus kleinsten Quadraten plus Autoregression: UT1 { "1.73" } bis 2.11x Bulletin A bei { "2" } bis { "10" } Tagen.

# text
seg-d98571cc21f4 = Überschranke des realisierten UTC(k)-Versatzes: gepoolte Überschreitung { "0.0333" } gegenüber { "1e-2" }.

# text
seg-527aca91ec7c = Mond-Bezugssystemdatum aus einer Kampagne: der SPICE-Zweig stimmt überein; der Zweig P2 mit geschätzten Stationen verfehlt { "1e-9" } bei einem Problem mit Kondition 2.1e8.

# text
seg-9805c4c821f9 = Mond-Bezugssystemdatum aus realem LLR: { "15" } von { "16" } Werten stimmen mit SPICE überein; das Sigma der z-Translation ist { "1.03" } % zu hoch gegenüber { "1" } %.

# text
seg-08e6c541b59e = Wiedereintritt (Allen-Eggers): die Punktmassenlösung stimmt mit Rekonstruktionen von Raumfahrtagenturen überein (nur eine Gegenprüfung); der Vergleich mit dem Beschleunigungsmesser ist blockiert, bis eine lesbare Hayabusa2-Quelle vorliegt.

# text
seg-0bb78ffbd915 = ITU-T-Masken: die gedruckten Rechenbeispielwerte stimmen überein; für die Klassengrenzen von G.8273.2 gibt es keine (blockiert).

# text
seg-308c1bca3fd9 = Startfenstergeometrie: die Standortgeschwindigkeit am wahren Pol mit Epoche stimmt mit Orekit überein ({ "4.9e-8" }); die Standardgeschwindigkeit ohne Epoche verfehlt weiterhin ({ "1.12e-6" }). Nicht hochgestuft; Nachverfolgung steht aus.

# text
seg-f0b7c3d60df8 = Physikalische Konstanten jedes Körpers: jetzt weichen { "0" } von { "84" } von NAIF ab (eine Transkription), und die berechnete Orientierung stimmt mit SPICE bis { "1.4e-10" } rad überein. Nicht hochgestuft; Nachverfolgung steht aus.

# text
seg-a5a787c9a761 = Blockiert durch eine Festlegung des Eigentümers zum Umfang, jeweils mit festgeschriebenem übereinstimmendem Vergleich: lunare Beobachtbarkeit absoluter Stationen, DOP von Oberflächenbaken, der Off-Boresight-Export, Erkennungsleistung über Modalitäten hinweg, die Konsistenzstatistik im Gleichtakt und polare LEO-Abdeckung.

# text
seg-cf638ec9878b = Blockiert durch Daten: Fehlerbudgetierung bei der Zeitübertragung (braucht eine Reduktion realer Daten), JammerTest C/N0 (Antennenposition und Leistungsaufteilung nicht dokumentiert).

# text
seg-e8709509eef3 = Revisionen (veröffentlichte Zahlen, die sich verschoben haben, alt -> neu).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = Die Schutzniveaus von <c1/> liegen jetzt auf dem geodätischen lokalen Niveau statt auf dem radialen: bis zu { "0.31" } m HPL und { "0.14" } m VPL bei ABMF ({ "16" } Grad N); kein Golden-Wert hat sich bewegt, aber die aufgezeichnete Zusammenfassung des Tutorials <c2/> wechselt von mittlerem HPL { "22.1" } m / VPL { "40.0" } m zu { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Standardwerte der Ratenkopplung im Mondbezugssystem: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } pro Meter.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = EOP-Lauf mit Standardwerten offline (<c1/>, Zellen aufgeführt in <c2/>): predicted_rows { "12" } -> { "90" }; Polgrenze { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; die Zeilen der Tabelle { "2" } von <c3/>; Übereinstimmung des operativen Prädiktors 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> liu22 SISRE Bahn/mit Uhr: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Höhentabelle von Liu, Kshana (Verhältnis): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = LEO-Navigationsnachricht <c1/> Skala { "2" }^-60 -> { "2" }^-58 (nicht vorregistriert, offengelegt; außerhalb des Fit-Vergleichs); der CRC des liu22-Beispielframes 0x62373A -> 0xDED99C.

# text
seg-537f5d80b66c = Zeilentext zur DE440-Hauptachsenorientierung des Mondes: Spanne 2024-2025 / { "731" } Zeilen -> 2014-2030 / { "6 209" } Zeilen; "clamps silently" -> Fehler außerhalb ihrer Spanne.

# text
# c1: eo-coverage
seg-17a5dd090566 = Szenario <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; neue Felder inclination_deg ({ "98.19" }) und nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (Bezugsuhr für TDOP/GDOP ist jetzt die Konstellation mit der niedrigsten Nummer in Sicht): globales GDOP-Maximum { "2.2236" } -> { "2.1205" }, Mittelwert { "1.122" } -> { "1.131" }, Median { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } und die GDOP-Karte je Zelle; mean_visible_by_constellation als ganze Zahlen summiert (etwa { "1e-12" } relativ, bei { "4" } Dezimalstellen unsichtbar).

# text
seg-e48b212c4881 = Gemeinsamer GNSS-Einfrequenz-Fix nach der Korrektur der Broadcast-Gruppenlaufzeit: { "93.2" } % -> { "93.6" } % innerhalb von { "3" } m; ISB-Median -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-Schleife SNR rho/4): an der Schwelle von { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; bei { "25" } dB-Hz { "9.55" } -> { "1.60" }; bei { "22" } dB-Hz { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/>: jede Ausgabe verschiebt sich mit dem Schuler-Fehlermodell; die TRN-Spitze des ausgelieferten Szenarios { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = <c1/>-Bericht: neuer Schlüssel geometry_path ("analytic" beim Standardlauf, kein numerischer Wert geändert); neue optionale Felder planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path, mit epoch_partials auf dem Kernel-Pfad; die Beschreibung der Art ist neu geschrieben. Die unabhängige Referenz der Verifikationszeile für den Kernel-Pfad ist SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) wird zu einer Gegenprüfung der Kernel-Auswertung.

# text
seg-3631a31e7b26 = Körperkonstanten: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); Äquatorradius von Phobos { "13.1" } -> { "13.0" } km; Pol und Nullmeridian von Phobos und Deimos aus pck00011; der prime_meridian_deg des Sonnensystems enthält jetzt die quadratischen und periodischen Terme.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> auf Europa), aus der vollständigen Europa-Orientierung nach pck00011 (7cfd66b4; die Orientierung stimmt mit SPICE pxform bis { "1.4e-10" } rad überein), die den Lander im inertialen Raum verschiebt: Verfügbarkeit nur Relais / mit der Erdentfernung { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } von { "171" } Epochen nur Relais), mittleres PDOP { "5.266" } -> { "5.360" }, RMS des Fix-Fehlers { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, mittleres formales Sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Die Tabelle in <c3/> und die Festschreibung in <c4/> folgen; <c5/> ist unverändert.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), der kalibrierte Faktor ersetzt durch Jacchia { "1971" }: activity_density_kg_m3 bei 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k entfernt, mean_exospheric_temperature_k hinzugefügt ({ "1186.7" } K); <c2/>: der Sonnenzyklus-Hub bei { "800" } km beträgt jetzt 10.4x (NRLMSISE-00 13.6x), und die Höhenaussage folgt dem Anstieg von NRLMSISE bis { "500" } km und dem Abfall bei { "800" } km.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (Zusammenfassungstext unverändert bei { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (QR-Lösung): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> neu erzeugt für die neuen und entfernten Felder oben.

# text
seg-717c51e1cca0 = Validierungspakete

# text
seg-d28005966948 = Teil { "1" }, unabhängige Referenz mit erweiterter Genauigkeit:

# text
seg-b055435a2138 = Umgebung der unabhängigen Referenz: mpmath { "1.3.0" } hinzugefügt.

# text
seg-d0c2b2a8e635 = Revisionen: keine. Keine Golden-Datei und keine veröffentlichte Zahl ändert sich; die Zeile "Lunar frame datum from an observing campaign" bleibt MODELLED (Entscheidung des Gründers 2026-10-02, Option A: sie übernimmt nicht den Status der separaten Zeile); ihr Testtext nennt den neuen Test und seinen Befund.

# text
seg-50b53908fb7c = Teil { "2" }, Datumslöser mit Quadratwurzel-Information:

# text
# c1: fim::crlb_srif
# c2: batch_ls::gauss_newton_srif
# c3: orbit_determination::determine_orbit_batch_srif
# c4: lunar_combination::formal_covariance_srif
# c5: precise_od::fit_srif
# c6: cislunar_srif::srif_cross_validation_sqrt
# c7: linalg_sr::weighted_lstsq
# c8: covariance_from_sqrt_information
# c9: precise_od::fit
seg-de9aeb2adde0 = Optional zuschaltbare Quadratwurzelwege neben den unveränderten Standardwegen: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> und <c6/>, auf den neuen <c7/> und <c8/>. Jeder stimmt mit seinem Standardweg überein, wo beide genau sind (eine interne Prüfung, keine Zeile; für sie wird keine Validierung behauptet). <c9/> delegiert jetzt an eine gemeinsame Routine; ihre Ausgabe und die Standardausgabe jedes Szenarios sind unverändert.

# text
seg-87a632404f32 = Rangentscheidungen der Mond-Bezugssystemkampagne: eine vorregistrierte Prüfung mit erweiterter Genauigkeit über { "40" } Tage bestätigt jede entscheidbare Stationsblock- und Vollrang-Helmert-Entscheidung. Die a-priori-Schranke kann die { "20" } rangdefizitären Helmert-Tage nicht belegen; in exakter Arithmetik ist ihr Defekt geometrisch, wobei die Schwelle { "1e-9" } innerhalb des natürlichen Bereichs der Eigenwertverhältnisse der Kampagne liegt. Keine Zeile.

# text
seg-3b24e7fa36bf = Die Aussage der Zeile zur Kampagne mit erweiterter Genauigkeit wird auf "innerhalb der Worst-Case-Schranke" eingegrenzt, und ihre Prüfung der schwächsten Richtung bei festen Stationen misst jetzt einen echten Winkel ({ "6.6e-16" } rad; der Vergleichsoperator wechselte von acos zu einer Sehne, der Zielwert nicht).

# text
seg-4fad02ab4b6d = Revisionen: keine. Keine Golden-Datei und keine veröffentlichte Zahl ändert sich; die Zeile "Lunar frame datum from an observing campaign" ist unverändert und bleibt MODELLED (Entscheidung des Gründers 2026-10-02, Option A).

# text
seg-30e8a645191f = Der NAIF-Kernel-Leser hat eine eigene Zeile.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (DAF-Container, SPK-Typ { "2" }, binäres PCK vom Typ { "2" }) stimmt mit dem SPICE Toolkit (CSPICE N0067 über spiceypy { "8.2.0" }) und mit ANISE { "0.10.6" } bei allen { "600" } DE440-Zuständen und { "200" } Mondorientierungsrotationen eines Zufallsgitters überein, das aus dem eigenen Hash des Vorregistrierungs-Commits gezogen wurde (abcd9133), innerhalb von Zielwerten, die vorab aus der Chebyshev-Auswertung in doppelter Genauigkeit abgeleitet wurden (schlechtester Wert { "0.6" } % des Zielwerts, { "1.95e-3" } m). Die Zeile behauptet, dass die Engine JPL-Kernel korrekt liest, nicht dass DE440 oder die analytische Reihe genau ist (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b>: DE440- (oder beliebige SPK-Typ-2-) Positionen über den eigenen Leser der Engine, mit zweiteiligen TDB-Epochen und dem SHA-256 des Kernels für Berichte; sie setzt nie einen Systembarycentre für einen Planeten ein. <c2/> lässt einen Geometriepfad die analytische Reihe (die Voreinstellung) oder einen Kernel wählen.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Optional zuschaltbarer Kernel-Mond für <c1/> und <c2/></b>: ein Schlüssel <c3/> liest den geozentrischen Mondmittelpunkt aus dem Kernel; sonst ändert sich nichts, und der Bericht erhält einen Block <c4/>, der den Kernel und seinen SHA-256 nennt. Ohne den Schlüssel sind beide Berichte bytegleich mit früher.

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Befunde: die eine Verfehlung des LLR-Datumsvergleichs (Sigma der z-Translation { "1.025" } % gegenüber { "1" } %) fällt auf { "0.049" } %, wenn nur der Mondmittelpunkt aus DE440 gelesen wird, an bereits gesehenen Daten (<c1/>); auf dem frischen Ausschnitt von { "2019" } besteht auch der analytische Mond, die Verfehlung von { "2015" } lag also randständig an der Geometrie jenes Quartals. Die analytischen Zeilen "Lunar frame datum from a REAL observing campaign" und "Lunar-surface-point coordinate covariance … kept distinct from the Earth-station one" bleiben MODELLED; ihre Texte zur unabhängigen Referenz verweisen jetzt auf die Zeilen des Kernel-Pfads.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> sagt nicht mehr, dass die Engine keinen Leser für binäre Kernel hat; es verweist auf die Zeile des Lesers und erklärt, warum Raumfahrzeug-Kernel (Typen { "13" } und { "21" }) weiterhin über Horizons kommen.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Revisionen: keine. Keine Golden-Datei, keine veröffentlichte Zahl und kein bestehender Testwert ändert sich; die analytischen Berichte <c1/>, <c2/> und der Bericht <c3/> mit allen festen Stationen sind bytegleich mit früher (Präfixe des Ergebnis-SHA-256 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, gemessene Uhrenbibliothek "Clock Atlas" (drei neue Zeilen, eine VALIDATED: { "232" } -> { "235" } Zeilen, { "116" } -> { "117" } validiert).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Gemessene Uhrenbibliothek (<c1/>).</b> Gerätekarten (weißes Phasenrauschen, weiße, Flicker- und Random-Walk-Frequenzmodulation, eine lineare Frequenzdrift und optional Phasenterme mit ein- bis vierfacher Frequenz pro Umlauf), angepasst an eine benannte gemessene Uhrenaufzeichnung und an zurückgehaltenen Daten bewertet; lückenbewusste Allan- und Hadamard-Varianzen; ein Konditionierungsdetektor, der jede Lücke, jeden Phasenausreißer, jeden Phasensprung, jeden Burst und jeden Frequenzsprung protokolliert und nichts von Datei- oder Tagesgrenzen weiß; Umwandlung einer Karte in das Rauschmodell der Slot-Zeitgebung, das erweiterte Kalman-Uhrenmodell und die Rauschpegel des Spoofing-Monitors. Leser für RINEX- und IGS-Uhrendateien, BIPM-Dateien je Labor und Circular T Abschnitt { "1" } (<c2/>); eine gepoolte, hierarchische Alterungsschranke für UTC(k) (<c3/>, noch nicht bewertet).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, Zustandsschätzung der Borduhr, Runde { "3" }</b> (ein Befund, bleibt MODELLED): nach dem eingefrorenen Konditionierungsdetektor erfüllt das erweiterte Filter aus Runde 2 mit unveränderter Abstimmung und unveränderten Kriterien (a) und (c) erstmals auf allen { "11" } Satelliten; (b) scheitert bei G09 ({ "0.894" }) und G26 ({ "0.876" }) (vorregistriert fb475550; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, Spoofing-Erkennung, Runden { "3" } bis 4b</b> (bleibt MODELLED): Runde { "3" } blockiert ({ "167" } Trainingsepochen aus den anderen Sitzungen der JammerTest-Einheit gegenüber { "3600" }); mit einer Karte der Modellklasse ZED-F9P (Runden { "4" } und 4b) löst der Uhrenmonitor bei allen { "10" } protokollierten Einsätzen null Fehlalarme vor dem Einsatz aus (Runde { "2" }: { "86" }), und { "6" } von { "10" } Einsätzen werden innerhalb von { "10" } s erkannt (Runde { "2" }: { "4" }); dieselben vier bleiben verspätet (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, Überschranke für UTC(k), Runde { "3" }</b>: prospektiv vorregistriert (fb475550) auf Circular-T-Ausgaben ab { "465" }, noch nicht ausgeführt (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Umgebung der unabhängigen Referenz: die Wroclaw-ZED-F9P-Aufzeichnung ist unter <c1/> datengebunden (CC BY { "4.0" }, etwa { "1.5" } GB); die IGS-Uhren-Fixtures sind mitgeliefert (IGS-Produkte, mit Quellenangabe).

# text
seg-b05fa0811a3e = Revisionen: keine. Keine Golden-Datei, keine veröffentlichte Zahl und kein bestehender Testwert ändert sich; auf M001 (Holdover-Neuverankerung) wird nicht reagiert, weil keine Uhrenklasse hochgestuft wurde.

# text
seg-d7a612528765 = Die Erdorbit-Arten, die eigene Zweikörper-, säkulare J2- oder nur auf Sternzeit beruhende Modelle mitführten, teilen sich jetzt einen Pfad: SGP4/SDP4-Elementsätze mit zweiteiligen Julianischen Daten, überführt in das GCRS und das ITRS (International Terrestrial Reference System) über die Kette IAU (International Astronomical Union) 2006/2000A, mit optionalen Erdorientierungsparametern.

# text
# c1: sgp4::MeanElementSet
# c2: sgp4::SgpOrbit
# c3: sgp4::Eop
# c4: sgp4::teme_to_itrs_matrix[_eop]
# c5: sgp4::gcrs_to_itrs_matrix[_eop]
# c6: Sgp4::new_at
# c7: Sgp4::propagate_at
# c8: jd2::Jd2::from_utc_calendar
# c9: dtf2d
# c10: jd2::utc_to_tai
# c11: tai_to_utc
# c12: utc_to_ut1
# c13: utcut1
# c14: tai_to_tt
# c15: jd2::earth_rotation_angle
seg-016507ccdb8f = Neu: <c1/>, <c2/>, <c3/>, <c4/> und <c5/>; <c6/> und <c7/> nehmen zweiteilige Epochen. Neu: <c8/> (SOFA-Konvention <c9/> für Schaltsekundentage), <c10/>, <c11/>, <c12/> (über TAI, wie SOFA <c13/>), <c14/> und ein zweiteiliges <c15/>.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = Der Polarmodus von <c1/> propagiert per SGP4 bei 2026-01-01T00:{ "00" }:{ "00" } UTC auf der IAU-Kette (<c2/> nimmt jede Epoche); der SGP4-Walker-Generator rotiert über die IAU-Kette in das erdfeste System.

# text
# c1: passes
# c2: passes::predict_passes_apparent
# c3: apparent_look_angles
# c4: refraction
# c5: light_time
# c6: ut1_minus_utc_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: passes::predict_passes
seg-86ecad91a601 = Die Art <c1/> führt einen neuen Prädiktor für scheinbare Überflüge aus (<c2/>, <c3/>): SGP4 auf der IAU-Kette, Refraktion nach ITU-R P.834-9 und die Downlink-Lichtlaufzeit (neue Schalter <c4/> und <c5/>, standardmäßig an), Erdorientierungsparameter (<c6/>, <c7/>, <c8/>, Voreinstellung { "0" }), Durchgänge bis { "1e-7" } s gelöst und die Kulmination per Goldener-Schnitt-Suche. Der geometrische <c9/> ist unverändert.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> sorgt dafür, dass die Geometrie-, Zeit- und Propagationskerne des Pakets keine private Kepler-Propagation, keine säkularen J2-Raten und keine reine Sternzeitrotation mitführen; benannte schnelle Stufen und Physik, die Gegenstand einer Zeile ist, sind begründete Ausnahmen.

# text
seg-a72ccdc2516e = M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS" wird VALIDATED: Orekit { "13.1.8" } nimmt die GCRS-Zustände der Engine, rotiert sie und berechnet Sichtbarkeit und DOP (NumPy für Mehr-Uhren-Gruppen); Positionen innerhalb von { "6.8e-5" } m (Zielwert { "0.2" } m), Anzahlen sichtbarer Satelliten identisch bei 4040/4040 Stichproben, mittleres DOP innerhalb von { "2.3e-11" } relativ.

# text
seg-ab87bb0ee63d = Befunde, festgeschrieben: die ersten Vergleiche der vollen Aussage mit Orekit Ende zu Ende verfehlten ihre Positions- und Richtungszielwerte, nicht wegen der Engine, sondern weil das SDP4 von Orekit { "13.1.8" } bei kreisförmigen (e = { "0" }) Deep-Space-Bahnen vom Referenz-SGP4 abweicht (bis zu { "67" } m) und sein Standard-TEME auf der Nutation nach IERS { "1996" } (IAU { "1980" }) aufbaut, etwa { "72" } Millibogensekunden von der Kette IAU 2006/2000A entfernt ({ "2.7" } m bei LEO). Der Koeffizient von h*theta0^{ "2" } in ITU-R P.834 ist bei Orekit { "0.011380" }, wo die Empfehlung { "0.01380" } druckt; der Vergleich erfolgt auf Meereshöhe, wo der Term verschwindet, und die Differenz darüber ist festgeschrieben.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = "Ground-station pass prediction (ground segment)" bleibt VALIDATED, wobei ihre Aussage auf den geometrischen <c1/> eingegrenzt wird; die Art <c2/> gehört zur neuen Zeile.

# text
# c1: xval/d8-orekit13/setup.sh
seg-60d6ac0011f1 = Umgebung der unabhängigen Referenz: Orekit { "13.1.8" } mit Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

# text
# c1: scenarios/passes.toml
# c2: passes
# c3: docs/examples/multi-tool-pipeline.md
# c4: passes
# c5: docs/CAPABILITY.md
# c6: polar-arctic-leo-coverage
seg-532e10ead5a2 = Revisionen: mitgeliefertes <c1/> Gesamtzugang { "1675" } s -> { "1659" } s (fünf Überflüge wie zuvor; beste maximale Elevation { "73.25" } Grad -> { "70.08" } Grad), und jede Ausgabe von <c2/> verschiebt sich mit dem neuen Pfad (die gedruckte Zeile in <c3/> und der Eintrag <c4/> von <c5/> sagen das jetzt); mitgeliefertes <c6/> GNSS-VDOP am Äquator { "1.19669" } -> { "1.19710" }, bei { "89.9" } Grad { "1.50645" } -> { "1.50590" }, fusioniertes VDOP bei { "89.9" } Grad { "1.14388" } -> { "1.14250" } (die veröffentlichten Zahlen mit zwei Dezimalstellen { "1.20" }, { "1.51" } und { "1.14" } sind unverändert). Keine Golden-Datei ändert sich.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Noch nicht geroutet: <c1/>, die Doppler-, Gemeinsam- und Zeitgebungsmodi von <c2/> und die Wahrheitsbahn von <c3/> (ihre Modelle liegen in <c4/> und <c5/>) sowie Erd-Designs in <c6/> (eine benannte schnelle Zweikörperstufe).

# text
seg-03f638f20376 = D6, Referenzgenerator für LunaNet AFS, LSIS V1.0 (vier neue Zeilen, zwei VALIDATED: { "238" } -> { "242" } Zeilen, validiert { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>Referenzgenerator für das LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), festgelegt auf den LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 vom { "29" }. Januar { "2025" } und mit Nennung dieser Version in jeder Ausgabe: der Träger { "2492.028" } MHz; der AFS-I-BPSK({ "1" })-Datenkanal mit { "500" } Symbolen pro Sekunde und seinem Gold-Code mit 2046 Chips; der AFS-Q-BPSK({ "5" })-Pilot mit seinem primären Weil-Code mit 10230 Chips, dem sekundären Code mit 4 Chips und dem tertiären Code mit 1500 Chips; der Frame mit Frame-Kennung { "0" } (Synchronisationsmuster, BCH ({ "51" }, { "8" }) Subframe { "1" }, CRC-24, LDPC-Subframes mit Rate ein Halb { "2" } bis { "4" }, Blockinterleaver { "60" } mal { "98" }) mit einem erschöpfenden Subframe-1-Decoder und einem Min-Sum-LDPC-Decoder, der allein aus der Paritätsprüfmatrix geschrieben wurde; und Basisband-IQ-Synthese mit Wahrheitsetiketten, geschrieben als SigMF-Aufzeichnung. Die Codes werden aus den Schieberegistern und den Legendre-/Weil-Konstruktionen des Standards erzeugt. Nichts aus dem Standard Kopiertes wird weiterverbreitet (er enthält keine Wiederverwendungsbedingungen): die primären AFS-Q-Indizes stammen aus IS-GPS-800J, und was nur die Anhänge des Standards festlegen (AFS-I-G2-Verzögerungen, tertiäre Codes, LDPC-Teilmatrizen), wird zur Laufzeit aus einem lokalen Cache gelesen, den <c2/> aus dem von der NASA gehosteten PDF füllt, jede Datei geprüft gegen ein festgelegtes SHA-256 (<c3/>). Das Modell ist eine Referenz für die Übereinstimmung mit dem Standard, kein Kanal-, Ausbreitungs- oder Link-Budget-Modell.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> und <c2/>: eine Aufzeichnung kann Erweiterungsfelder mit Namensraum tragen, die in <c3/> deklariert sind.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Beide hochgestuften Zeilen sind an den LSIS-Cache datengebunden: ihr Test zur unabhängigen Referenz wird mit einem Hinweis übersprungen, bis <c1/> ausgeführt wurde.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Korrigiert: der Standardträger von <c1/> (<c2/>), <c3/> und <c4/> war ein gerundetes { "2.4" } GHz; er ist jetzt der AFS-Träger aus LSIS-020, { "2492.028" } MHz. Beim alten Standardwert war die Freiraumdämpfung um { "0.327" } dB zu niedrig angesetzt.

# text
seg-ed7c170ccc2c = Revisionen: keine. Jedes mitgelieferte Szenario nennt seinen Träger, und die Ergebnisse aller { "138" } Szenariodateien sind bytegleich mit dem vorherigen main.

# text
seg-3ec7f5b17122 = D7, reale lunare IQ-Daten und GPS LNAV (sieben neue Zeilen, keine VALIDATED: { "242" } -> { "249" } Zeilen, validiert { "123" } unverändert).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/>: eine schnelle Fourier-Transformation (FFT) mit gemischter Basis, deren Ausgabe auf jeder Plattform dieselben Bits ergibt; ein SHA-256-Pin der Transformationen mit 8000 und 24000 Punkten besteht auf x86_64 und auf wasm32-wasip1 (Runner in <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/>: parallele Codephasensuche auf abgetasteten IQ-Daten (<c2/>, <c3/>) mit kohärenter Faltung, nichtkohärenter Akkumulation, einer Chi-Quadrat-Schwelle für eine suchweite Fehlalarmwahrscheinlichkeit und einer zellmittelnden Statistik für bandbegrenztes Rauschen; <c4/>, <c5/> mit Code-Doppler sowie die Schätzer für die Träger-Rauschleistungsdichte (C/N0) nach M2M4 und aus der Gitterspitze.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/>: ein Encoder für die Legacy-Navigationsnachricht (LNAV) nach IS-GPS-200 für die Subframes { "1" } bis { "3" }, mit der Parität aus Tabelle 20-XIV und einem Felddecoder.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/>: ein Leser für den ION GNSS SDR Metadata Standard (<c2/>) und seine Beispieldateien, mit <c3/> für Zweierkomplement-Pegel.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/>: der IQS-Batch-Header des LuGRE (Lunar GNSS Receiver Experiment), RAW-, ACQ- und NAV-Telemetrie sowie CLK-Dateien und eine Prüfung, die auflistet, wo die Metadaten von <c2/> dem binären Header widersprechen.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> und, in <c2/>, das Yaw-Steering-Körpersystem, Sendeazimut und Off-Nadir-Winkel sowie <c3/> für relatives C/N0 mit gemessenen Mustern.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = Kodierung der GPS-LNAV-Navigationsnachricht (neue Zeile, bleibt nach der Nachverifikation durch den Integrator MODELLED): auf der IGS-Broadcast-Datei vom { "2" }. März { "2025" }, von RTKLIB v2.4.2-p13 geparst und dekodiert, bestehen alle { "960" } Wörter die Paritätsprüfung, alle { "96" } Subframes dekodieren und alle { "608" } Broadcast-Ganzzahlen sind gleich denen von Kshana (<c1/>), aber die Vorregistrierung (d4d9eb9d) erreichte den öffentlichen Branch zwei Sekunden nach dem Commit mit dem Ergebnis, sodass die Reihenfolge "registriert, bevor die Datei abgerufen wurde" nicht gezeigt werden kann und die Zeile nicht hochgestuft wird.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> füllt Wörter ab dem höchstwertigen Bit (I im oberen Nibble eines LuGRE-Bytes; die frühere Lesart ergab das konjugierte Signal), behält die alte Lesart als <c2/> und liest Abtastwerte, die breiter als ein Wort sind.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/>: phasenkohärente Doppler-Verfeinerung ({ "0.2" } Hz RMS bei { "30" } dB-Hz über { "200" } ms in der Simulation).

# text
seg-b0f6a61acce0 = GPS L1 C/A gegenüber gps-sdr-sim: Chips und Paritätsbit bitgenau; { "230" } von { "1152" } LNAV-Feldern unterscheiden sich um eine Einheit, weil gps-sdr-sim abschneidet, wo die Broadcast-Ganzzahl Rundung braucht.

# text
seg-1c525ca495c0 = LNAV dekodiert von RTKLIB: alle Paritäten und Subframes bestehen, und jeder Parameter liegt innerhalb eines halben Quantums; { "41" } skalierte Werte weichen durch die dezimale Konstante { "2" }^-43 von RTKLIB um einige Einheiten in der letzten Stelle ab, über dem registrierten Zielwert.

# text
seg-14e26e69777b = LuGRE-Akquisition gegenüber GNSS-SDR { "0.0.19" }: { "266" } von { "266" } Entscheidungen stimmen überein, { "250" } auf derselben Zelle lokalisiert; die meisten Positiven sind Artefakte eines Mittelwerts von −{ "0.5" } in den nackten 4-Bit-Pegeln; für den C/N0-Zweig gab es keine zeitgleichen Flugdaten. Zwei Batches (OP5, OP12) wurden irrtümlich ausgeschlossen: ihre Metadaten stimmen mit ihren Headern überein, aber der Leser konnte damals keinen Abtastwert lesen, der breiter als ein Wort ist.

# text
seg-3a32ff9d66fc = LuGRE-Akquisition gegenüber bahnvorhergesagtem Doppler: bei der Entscheidung nach Abtastleistung kreuzt jede Suche auf bandbegrenztem Rauschen; bei der zellmittelnden Entscheidung stimmen die stärksten Paare im Betrag überein, mit umgekehrtem Vorzeichen, was zeigt, dass die registrierte I/Q-Reihenfolge das Konjugierte der Daten ist.

# text
seg-2bb618ba4059 = Blinde Akquisition auf den Batches der Mondoberfläche: vier Batches erfassen je einen Satelliten (als sichtbar vorhergesagt, kein Fehlalarm bei { "1e-7" }), keiner zwei, sodass der Zielwert für die Doppler-Differenz kein Paar zum Bewerten hat.

# text
seg-f95606e17fd1 = Relatives C/N0 in Monddistanz (M039 neu formuliert): { "15" } Aufzeichnungen von Block IIR/IIR-M und ein Paar, zu wenig für den registrierten Zielwert.

# text
seg-9306cf44fc44 = Revisionen: keine; keine veröffentlichte Zahl, keine Golden-Datei und keine Zahl der Dokumentation hat sich geändert.

# text
seg-2a3cb68c94d6 = Die M039-Zeile "Earth-GNSS at lunar distance" formuliert ihre Aussage in Monddistanz neu als das relative C/N0 zwischen Satelliten zu einer Epoche plus Sichtbarkeit (ein absolutes C/N0 wird nicht behauptet); sie bleibt MODELLED. Der NOTICE auf oberster Ebene trägt die Namensnennung für LuGRE CC BY { "4.0" }.

# text
seg-e1e4094a186a = Die DE440-Hauptachsenorientierung des Mondes wird jetzt entlang der Geodäte zwischen den Tagesknoten interpoliert. Die frühere elementweise Interpolation war nahe den Viertelpunkten jedes Tages um bis zu { "2.0e-4" } rad ({ "340" } m an der Mondoberfläche) fehlerhaft, nicht "etwa { "14" } m", wie die Zeile angab. Ihre Nutzer (Geometrie der Laserentfernungsmessung zum Mond, Mond-Datum, Beobachtbarkeit von Mondverwerfungen) erhalten die korrigierte Orientierung.

# text
# c1: snapshot_raim
seg-a2071d345923 = Engine-Korrekturen der Runde { "2" }, jeweils erneut gegen die unveränderte vorregistrierte Toleranz ausgeführt: die IERS-Ausgabe einer EOP-Zeile wird aus ihren I/P-Kennzeichen gelesen statt aus einem leeren Bulletin-B-Block; <c1/> verwendet das geodätische lokale Niveau; die Ratenkopplung im Mondbezugssystem verwendet Äquatorradius, J2 und Rotation; der liu22-Fit beginnt mit Korrekturen von null ohne Priors und verwendet die Rate der mittleren Bewegung aus der Veröffentlichung; der Knotenabstand für EO enthält die J2-Knotenregression; die Cycle-Slip-Zeit der Costas-Schleife verwendet rho/4; der gemeinsame Fix wendet die Broadcast-Gruppenlaufzeit des Paars an; die gemeinsame lunare Lösung verwendet einen QR-Schritt; die NTN-Schranke wird an der wahren Position ausgewertet; die Uhrenreferenz des Konstellationsdesigns ist die Konstellation mit der niedrigsten Nummer in Sicht; die DE440-Orientierungsreihe umfasst 2014-2030 und meldet außerhalb davon Fehler, statt zu begrenzen.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, eine Wahrheitsbahn, aufgebaut aus tabellierten erdfesten Zuständen, verwendet beim Vergleich des Fitters mit realen Bahnen.

# text
# c1: NOTICE.md
seg-7293b717d978 = Die Testdateien und Fixtures der obigen Vergleiche, jeweils mit ihrem Generator und einem <c1/> mit Quelle, Lizenz, Abrufdatum und SHA-256.

# text
# c1: araim_reference::add_v42_protection_levels
# c2: _ecef
# c3: raim::snapshot_raim_fde
# c4: cw_dynamics::second_order_correction
# c5: propagate_second_order
# c6: inertial::coast::ErrorDynamics
# c7: lunar_vlbi::KernelGeometry
# c8: lunar-vlbi
# c9: naif_kernel
# c10: lunar_llr_geometry::llr_bcrs_one_way_m
# c11: solar_system::link_on
# c12: launch::site_rotation_speed_at
# c13: eo_payload::j2_nodal_period
# c14: ground_track_spacing_equator_j2
# c15: batch_ls::gauss_newton_qr
# c16: precise_products
seg-920fe965bda9 = Runde { "2" }: <c1/> und <c2/> (Fehlererkennung nach ADD v4.2, nach Stanford MAAST für ARAIM { "2" }, BSD-3-Hinweis im Quelltext); <c3/>; <c4/> und <c5/>; das INS-Fehlermodell mit neun Zuständen <c6/>; Partialableitungen von <c7/> und die Eingaben von <c8/> auf dem Kernel-Pfad; <c9/>, ein Leser für SPK-Typ { "2" } und binäre PCK-Kernel; <c10/> mit ITRF2020-Stationen; Dichte nach Jacchia { "1971" }; <c11/> über jeden Ephemeridenanbieter; <c12/>; <c13/> und <c14/>; <c15/>; <c16/> (Leser für RINEX-Uhren, ANTEX und DCB).

# text
# c1: jamming
seg-bb346f4942a9 = Der Bericht gibt das C/N0 aus, das die repräsentative Q-Tabelle der Art <c1/> ergäbe, neben dem aus dem Spektrum abgeleiteten; bei einem CW-Ton auf dem C/A-Träger unterscheiden sie sich um { "1.8" } dB. Drei neue Matrixzeilen: eine validiert (Signalspektren und spektrale Trennkoeffizienten) und zwei modelliert.

# text
# c1: tests/fixtures/solar_system/
# c2: body-pnt
seg-8b5c2fbe91f7 = VALIDATED gegenüber JPL Horizons (Development Ephemeris DE441; Fixtures und Abfragen in <c1/>): Merkur bis Saturn und die Erde aus Tabelle { "1" } innerhalb des Doppelten des angegebenen Nennfehlers (schlechtester Wert { "1.87" }-fach), alle acht Planeten aus den Tabellen 2a/2b (schlechtester Wert { "1.71" }-fach) und die Lichtlaufzeit von Erde zu Mars und Jupiter. MODELLED: Uranus und Neptun aus Tabelle { "1" }, die gegenüber DE441 den angegebenen Fehler überschreiten ({ "2.0" }- und { "5.2" }-fach), Pluto, die Monde, die Körperkonstanten und die Ergebnisse von <c2/>.

# text
# c1: navsignal
# c2: Modulation::label
seg-98f74d85c54b = <c1/> erhält das Sinusintegral, die geschlossenen Formen für BPSK-Leistung im Band und bandbegrenzte Gabor-Bandbreite, den bandbegrenzten Early-Late-Jitter für jedes Spektrum und seine Gabor-Schranke, die geschlossene Form des Offset-BPSK-SSC, das Galileo-E5-AltBOC({ "15,10" })-Spektrum und einen Parser für Modulationsbezeichnungen; <c2/> gibt BPSK(1/3) als Bruch aus.

# text
# c1: leo-signal
seg-78d9e5e2c615 = Vier Matrixzeilen: VALIDATED bandbegrenzte geschlossene Formen ({ "90.3" } % der BPSK-Leistung im Hauptkeulenbereich, der Jitter, der sich auf die kohärente Form von Kaplan & Hegarty reduziert, { "0.0039564" } Chips bei { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } Chip, T { "20" } ms, und auf seine Gabor-Schranke, und das BPSK-Eigen-SSC 2/({ "3" } R_c); die geschlossene Gabor-Form und das Offset-SSC gegenüber seiner Parseval-Form sind als interne Gegenprüfungen angegeben); VALIDATED maximaler LEO-Doppler (Xona X1 { "33.2" } kHz innerhalb der veröffentlichten { "32" } bis { "34" } kHz, Iridium innerhalb von { "0.5" } kHz von { "36" } kHz); MODELLED <c1/>; MODELLED Multiband-Spektrum.

# text
seg-45d3d4a46d6b = Navigation im niedrigen Erdorbit: Link

# text
# c1: leo-pass
# c2: constellation-design
# c3: [iot]
seg-1d120db87aae = <b>LEO-PNT-Überflug und Link-Budget je Band: die Art <c1/>.</b> LEO-PNT bezeichnet Positionierung, Navigation und Zeitgebung (PNT) durch Satelliten im niedrigen Erdorbit (LEO). Ein Nutzer (am Boden, auf See, in der Luft oder in Gebäuden, statisch oder bewegt) und ein oder mehrere LEO-Satelliten aus einem entworfenen Überflug, expliziten Elementen, einem Two-Line-Element-Satz (TLE) über SGP4 oder einer Walker-Konstellation aus dem Code von <c2/>. Je Satellit, Band und Epoche: Blickwinkel, Entfernung, Entfernungsrate und Entfernungsbeschleunigung in geschlossener Form (bei jedem Lauf gegen zentrale Differenzen geprüft), Doppler und Dopplerrate, Freiraumdämpfung, EIRP (äquivalente isotrope Strahlungsleistung) mit isoflux-, Gauß-Strahl- oder flachem Satellitenmuster, einer Patch-Nutzerantenne, gasförmiger Dämpfung nach ITU-R P.676, Regendämpfung nach ITU-R P.838/P.618, troposphärischer Szintillation nach P.618, Gebäudeeindringdämpfung nach ITU-R P.2109 für einen Nutzer in Gebäuden, Polarisationsfehlanpassung, Systemrauschtemperatur und C/N0 (Träger-Rauschleistungsdichte); die ionosphärische Laufzeit erster Ordnung je Band aus einem Klobuchar- oder einem schrägen vertikal-TEC-Wert (Gesamtelektroneninhalt) unterhalb des Satelliten sowie ionosphärenfreie Bandpaare mit ihrer Rauschverstärkung. Galileo- oder GPS-Satelliten werden mit demselben Empfänger aus den Empfangsleistungen ihrer Schnittstellendokumente ausgewertet, sodass der glockenförmige LEO-Überflug und die flachen MEO-Träger (mittlerer Erdorbit) in einem Diagramm stehen. Ein Abschnitt <c3/> gibt Zeit bis zum ersten Fix, Energie je Fix und Batterielebensdauer gegenüber dem Tastverhältnis an (MODELLED).

# text
# c1: src/celeste_iod.rs
seg-17f3503e1be3 = Systemunabhängig: die Engine braucht keine Voreinstellung. Optionale Voreinstellungen, jede in einer eigenen Datei und gekennzeichnet als PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP: generisches Multiband (UHF, L, S, C), generisches C-Band, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und Celeste IOD (Demonstration im Orbit), dessen Signalparameter auf dem ESA-NAVISP-LEO-PNT-Workshop { "2026" } vorgestellt wurden und in <c1/> liegen, sodass sie zurückgehalten werden können (siehe "LEO-PNT end to end" unten).

# text
# c1: src/leo_link/
seg-a338cc46a1e0 = Öffentliche Bausteine in <c1/> (Geometrie, Antenne, ITU, Ionosphäre, Energie, Voreinstellungen), die andere Module aufrufen können.

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-pass-celeste-iod-multiband
seg-887ad03cb6f6 = Szenarien: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
# c1: docs/LEO-PASS.md
seg-a20f1602c236 = Neun Matrixzeilen. VALIDATED ({ "6" }): Koeffizienten nach ITU-R P.838-3 gegenüber ihrer Tabelle { "5" }; Regendämpfung und Szintillation nach P.618-14 gegenüber den Validierungsbeispielen der ITU-R Study Group { "3" }; Gebäudeeindringdämpfung nach P.2109 gegenüber der Arbeitsmappe der Study Group { "3" }; ionosphärische Skalierung erster Ordnung gegenüber dem Gruppenlaufzeitverhältnis aus IS-GPS-200, mit der Freiraumdämpfung; der maximale Doppler eines statischen Nutzers auf einer Kreisbahn gegenüber arXiv { "2509.19551" } Tabelle { "1" }. MODELLED ({ "3" }): der Überflug und das Link-Budget, die Voreinstellungen und das Budget für Fixes mit niedrigem Energiebedarf. Eine Art und sechs Szenariodateien. Hinweise in <c1/>.

# text
seg-ef74b0f08aa1 = Navigation im niedrigen Erdorbit: Navigationsnachricht

# text
# c1: leo-navmsg
# c2: src/leo_navmsg/
# c3: docs/LEO-NAVMSG.md
seg-866ff4ee8b19 = <b>LEO-Navigationsnachricht (Art <c1/>, <c2/>).</b> Die Broadcast-Ephemeriden- und Uhrennachricht eines Satelliten für Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO), für jede Bahn, jeden Träger und jedes Modell; benannte Voreinstellungen sind optionale Daten, und jede Fähigkeit läuft ohne sie. Eine Art, fünf Szenariodateien und neun Matrixzeilen (drei VALIDATED, sechs MODELLED). Siehe <c3/>.

# text
seg-c42821b6e855 = Nachrichteninhalt: SVID, Datenausgabe, Band und Signalzustand; Woche, Wochenzeit und ein Uhrenpolynom zweiter Ordnung; die Ephemeride in einem von vier Modellen — dem Kepler-Satz mit 16 Parametern aus dem Galileo OS SIS ICD, diesem Satz plus Korrekturpolynomen für Along-Track, Cross-Track und radial, dem Modell mit 22 Parametern von Liu et al. { "2025" } (doi 10.3390/rs17162894) oder dem ATOMIC-Zero-Clock-ECEF-Polynom — sowie ein Klobuchar-Satz, NeQuick-G-Koeffizienten mit dem effektiven Ionisationsniveau und Parameter von Systemzeit zu UTC mit den Schaltsekundenfällen des ICD.

# text
seg-e4565696f162 = Fitter: eine Wahrheitsbahn, integriert mit zonaler J2–J6- oder EGM2008-Gravitation und Luftwiderstand, eine mit Startwert versehene freie oder gesteuerte Uhr, ein Levenberg–Marquardt-Fit auf nichtsingulären Elementen, dann lineare Korrekturpolynome nach kleinsten Quadraten und eine Uhr, die abzüglich des relativistischen Terms des Nutzers angepasst wird.

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
seg-a7287b7b336c = Vier Analysen und Szenarien: <c1/> (Signal-in-Space-Entfernungsfehler (SISRE) gegenüber Fit-Intervall und Aktualisierungsperiode), <c2/> (vier Modelle, Bits und der Fit mit 22 Parametern von Kshana auf den Höhen von Liu et al. neben den veröffentlichten Zahlen, MODELLED), <c3/> (Kontinuität bei jedem Nachrichtenwechsel während eines Überflugs) und <c4/> (der eigene dokumentierte Binärframe von Kshana mit CRC-24Q und einem Quantisierungsbudget, ein Block im Stil von RINEX 4, der als Kshana-Erweiterung gekennzeichnet ist, und eine CSV-Tabelle).

# text
# c1: tests/leo_navmsg_reference.rs
seg-e272dce3d10f = VALIDATED: die global gemittelten SISRE-Gewichte gegenüber der veröffentlichten Tabelle für mittlere und geostationäre Bahnen von Montenbruck et al. { "2018" }; der Galileo-Nutzeralgorithmus gegenüber RTKLIB auf vier realen Galileo-Broadcast-Ephemeriden (<c1/>); CRC-24Q gegenüber dem Katalogprüfwert und dem Beispielframe RTCM { "10403" } { "1005" }.

# text
# c1: src/celeste_iod.rs
seg-5c8592195b0d = Voreinstellungen, je eine Datei mit Quellen: Xona Pulsar und Pulsar-0, Iridium, Starlink, CentiSpace, ein repräsentatives C-Band-System, ATOMIC und Celeste IOD (die einzige Voreinstellung mit Material, das auf dem ESA-NAVISP-LEO-PNT-Workshop { "2026" } vorgestellt wurde, gehalten in <c1/> mit ihren Szenarien, sodass sie zurückgehalten werden kann).

# text
seg-9fb0cbf29cef = Navigation im niedrigen Erdorbit: Fusion

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
# c5: src/celeste_iod.rs
seg-071f4db017c5 = <b>Fusionierte MEO- + LEO-Positionierung, -Navigation und -Zeitgebung: <c1/>, <c2/> und <c3/>.</b> Drei neue Szenarioarten in <c4/>, systemunabhängig: jede Konstellation besteht aus Walker-Schalen, Elementsätzen oder einer GNSS-Voreinstellung, jedes Signal aus einem Träger, einer Chiprate und einer Hüllkurve der Träger-Rauschleistungsdichte (C/N0), jedes Fehlerbudget aus einem ausdrücklichen Ein-Sigma, und benannte Systeme im niedrigen Erdorbit (LEO) sind optionale Voreinstellungen, je eine Datei mit ihren als öffentlich, Workshop oder abgeleitet gekennzeichneten Quellen (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink-Gelegenheitssignale, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Zero-Clock-Ephemeridenmodell und eine Voreinstellung für die ESA-Demonstration im Orbit Celeste, deren aus dem Workshop abgeleitete Parameter in <c5/> liegen, sodass sie zurückgehalten werden können).

# text
# c1: leo-pvt
seg-f28f7a441263 = <c1/> hat vier Modi: Doppler-Positionierung (Batch-Ausgleichung nach kleinsten Quadraten auf der Entfernungsrate mit Uhrendrift- und Geschwindigkeitszuständen, ein reiner Doppler-Gelegenheitssignalmodus, die Along-Track- und Cross-Track-Genauigkeit eines einzelnen Überflugs sowie die Hüllkurve aus Doppler, Dopplerrate und Ruck); gemeinsame GNSS- + LEO-gewichtete kleinste Quadrate mit einer Uhr je System (die Intersystemabweichung) oder einem bekannten Versatz, Sigmas je Messung als Eingaben und dem DOP gegenüber der Anzahl der LEO-Satelliten; polare und arktische Abdeckung gegenüber der Breite; und LEO-Zeitübertragung zur koordinierten Weltzeit (UTC) gegenüber C/N0 und dem Empfängeroszillator mit dem Ausdruck von Systemzeit zu UTC aus IS-GPS-200.

# text
# c1: ntn-positioning
seg-3fa0556b3737 = <c1/>: Positionierung in 5G-Nicht-Terrestrischen-Netzen (NTN) im mobilen Satelliten-S-Band 3GPP n256 aus der Cramér-Rao-Schranke für Ankunftszeit und Doppler.

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: leo-ppp-convergence
# c5: ntn-5g-positioning
# c6: polar-arctic-leo-coverage
# c7: leo-timing-utc
# c8: celeste-iod-fused-pvt
seg-a0cc2699e276 = Szenarien: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (mitgeliefert) und <c8/> (nur im Repository, zurückgehalten mit der Voreinstellung Celeste IOD).

# text
# c1: tests/leo_doppler_reference.rs
# c2: docs/LEO-PNT-FUSION.md
seg-c0b6b98eeac3 = Acht Matrixzeilen: die LEO-Doppler-Hüllkurve VALIDATED gegenüber den veröffentlichten Zahlen für Iridium (±{ "36" } kHz: { "35.9" } kHz, innerhalb von { "5" }%) und Xona Pulsar X1 ({ "32" } bis { "34" } kHz: { "33.6" } kHz aus der Schale mit { "97" } Grad, ohne Aufweitung) (<c1/>); Doppler-Positionierung, gemeinsame Pseudorange-Positionierung, PPP-Konvergenz, NTN-Schranken, LEO-Zeitgebung, polare Abdeckung und die Voreinstellungen MODELLED. Drei Arten und acht Szenariodateien. Dokumentation: <c2/>.

# text
# c1: leo-pnt-chain
# c2: docs/LEO-PNT.md
seg-173793480abc = <b>LEO-PNT Ende zu Ende: die Art <c1/> und die miteinander verdrahteten LEO-Stufen.</b> Ein System für Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO), verfolgt von seinem Signalentwurf bis zur Position des Nutzers, jede Stufe eine eigene Art der Engine auf ihrer eigenen Szenariotabelle, mit im Code weitergereichten Werten (<a1><c2/></a1>):

# text
# c1: leo-pass
# c2: leo-signal
# c3: signal = "xona-x5"
# c4: iono_free
seg-41a4a2183ba3 = Bänder von <c1/> können einen Entwurf <c2/> benennen (<c3/>): das Band übernimmt die Mittenfrequenz, die Sendebandbreite und die Chiprate der verfolgten Komponente des Entwurfs, teilt seine EIRP (äquivalente isotrope Strahlungsleistung) auf die Komponenten des Entwurfs auf und meldet für jede Epoche das C/N0 (Träger-Rauschleistungsdichte) der verfolgten Komponente und den bandbegrenzten Code-Tracking-Jitter (den Entfernungsfehler; das Paarrauschen von <c4/> verwendet ihn ebenfalls). Ein Band ohne Entwurf liefert dieselbe Ausgabe wie zuvor.

# text
# c1: leo-pnt-chain
# c2: leo-pvt
# c3: leo-ppp
# c4: od_sisre_m
# c5: tests/leo_pnt_chain.rs
# c6: LeoNavmsgScenario::broadcast_sisre
seg-a076a43a9d44 = <c1/> führt aus: Signal -> Überflug -> Navigationsnachricht -> fusionierter gemeinsamer Fix von <c2/> -> optional <c3/>. Jedes LEO-System der Positionierungsstufe, das sie nicht gesetzt lässt, übernimmt eine C/N0-Linie in sin(Elevation), angepasst an den Überflug, den Signal-in-Space-Entfernungsfehler der Nachricht (SISRE: ihren Darstellungsfehler auf der Bahn des Überflugsatelliten, mit einem angegebenen Bahnbestimmungsterm <c4/> als Wurzel der Quadratsumme) sowie Träger und Chiprate des Entwurfs; die Fälle des Precise Point Positioning (PPP) übernehmen den SISRE. Jede Übergabe ist mit Wert und Einheit aufgeführt, und <c5/> prüft, dass jede der Ausgabe davor entspricht und dass Änderungen davor die nachfolgenden Zahlen verschieben. <c6/> ist der neue Einstiegspunkt der Nachricht.

# text
# c1: leo-pnt-end-to-end
# c2: generic-l
# c3: xona-pulsar-end-to-end
# c4: celeste-iod-end-to-end
seg-8c256ed478e9 = Szenarien: <c1/> (eine generische Konstellation mit { "1080" } km und das repräsentative Signal <c2/>), <c3/> (das öffentliche X5-Signal), beide mitgeliefert, sowie das optionale, nur im Repository vorhandene <c4/>.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: kshana_celeste
# c4: scenarios/*celeste-iod*.toml
# c5: tests/workshop_preset_isolation.rs
seg-879259c7ff86 = Die Celeste-IOD-Voreinstellungen (Demonstration im Orbit) der Bereiche Überflug, Nachricht und fusionierte Positionierung liegen jetzt in einer Datei, <c1/>, die <c2/> nur einbindet, wenn sie existiert (das Konfigurationskennzeichen <c3/>). Ihre fünf Szenarien (<c4/>) gibt es nur im Repository, sodass das Löschen dieser Datei und dieser Szenarien jede auf dem ESA-NAVISP-LEO-PNT-Workshop { "2026" } vorgestellte Zahl ohne Quelltextänderung zurückhält; <c5/> prüft, welche Dateien die Voreinstellung nennen oder ihre Bandplan-Zahlen tragen dürfen.

# text
# c1: leo-pvt
# c2: t_s
# c3: leo-ppp
# c4: t_min
# c5: leo-pass
# c6: leo-pnt-chain
seg-110b1f7c7c63 = Jede LEO-Art in der Gegenüberstellung des erweiterten Berichts, wobei ihre pfadspezifischen Zeilen nur aufgeführt werden, wenn der Lauf diesen Pfad nahm (eine Regenrate, ein Gebäude, eine Analyse oder ein Modus, der lief). Doppler-Fenster von <c1/> erhalten <c2/> und Fälle von <c3/> erhalten <c4/>, sodass beide animiert werden; <c5/> und <c6/> exportieren CZML, KML, GeoJSON und STK-Ephemeriden, und die anderen LEO-Arten geben an, warum ein Format nicht zutrifft.

# text
seg-1419edea5329 = Navigation im niedrigen Erdorbit: Resilienz, Schwerpunktbereiche und Endnutzer-Szenarien

# text
# c1: docs/LEO-PNT.md
seg-d084d86044b4 = <b>LEO-PNT-Resilienz, ein Szenario je Experiment-Schwerpunktbereich und eines je Endnutzer-Vertikale sowie <c1/> als Überblick über jede LEO-Art und jedes Szenario.</b> Jedes Szenario läuft ohne Celeste-Daten und ist mitgeliefert.

# text
# c1: leo-pass
# c2: [spoofer]
# c3: leo_link::spoof
seg-07e91f076ab2 = <c1/> erhält einen Abschnitt <c2/>: ein Spoofer fälscht in sich konsistent in Entfernung und Entfernungsrate die Signale einer behaupteten Position, die nach einem Einsatz springt und/oder von der wahren weggeschoben wird (je LEO-Band und das MEO-GNSS-Signal), mit oder ohne Ionosphäre. Zwei Monitore laufen bei einer angegebenen Fehlalarmwahrscheinlichkeit: Doppler- und Überflug-Geometrie-Konsistenz (gemessene Entfernungsraten gegenüber den aus den Bahnen und einer unabhängigen vorherigen Position und Geschwindigkeit vorhergesagten; ein verallgemeinertes Chi-Quadrat nach kleinsten Quadraten über ein Fenster, auf den GNSS-, LEO- und allen Kanälen, Rauschen der Frequenzregelschleife aus C/N0) und Konsistenz zwischen den Bändern (der Sprung der modellkorrigierten geometriefreien Kombination jedes LEO-Bandpaars). Das Ergebnis gibt die Statistiken je Epoche an (sodass es animiert wird), jedes Paar und wann jeder Monitor erkennt. Bausteine in <c3/>. Fehlt der Abschnitt, bleibt die Ausgabe unverändert.

# text
# c1: leo-pass
# c2: leo-pass
seg-6a7852f1f053 = Jedes Bandpaar von <c1/> meldet außerdem den schrägen Gesamtelektroneninhalt (TEC), den seine geometriefreie Kombination im Überflugmaximum zurückgewinnt, und das Code-Rauschsigma dieser Schätzung (Ionosphärensondierung). Das fügt jedem Multiband-Ergebnis von <c2/> zwei Felder hinzu; keine bestehende Zahl ändert sich.

# text
# c1: leo-pvt
# c2: trace = true
seg-bdf333f4c978 = Der Zeitgebungsmodus von <c1/> nimmt <c2/>: jede Zeile meldet dann ihren Zeitfehler und ihr vorhergesagtes Sigma zu jeder Epoche, mit denselben Ziehungen, sodass die Zeilenstatistiken unverändert sind und der Lauf animiert und in einer Kampagne verkettet wird.

# text
# c1: docs/INTEROP.md
seg-eb4461740dc5 = Eine Kampagne exportiert jetzt jedes Mitgliedsszenario mit Geometrie (Phasenläufe, die Basisszenarien von Sweep und Monte-Carlo, zusammengesetzte Mitglieder mit ihren gebundenen gemeinsamen Werten) als eigenen Dateisatz, mit der Mitgliedsbezeichnung im Dateinamen; zuvor exportierte eine Kampagne nichts. Die Interoperabilitätstabelle in <c1/> ändert sich entsprechend.

# text
# c1: system.2.sisre_m
seg-c0b1f4d9fed0 = Ein Sweep-Schlüssel einer Kampagne kann ein Array von Tabellen nach Position indizieren (<c1/>).

# text
# c1: leo-resilience-multiband-diversity
# c2: leo-resilience-js-margin
# c3: leo-resilience-spoof-doppler
# c4: leo-resilience-spoof-monitors
# c5: leo-resilience-gnss-jammed-leo-carries
seg-4c995017dd9c = Resilienzszenarien: <c1/> (ein Breitbandstörer von { "50" } MHz im L5-Band, in der Leistung durchgefahren: jedes L-Band-Signal fällt, die LEO-Signale in UHF-, S- und C-Band behalten ihr C/N0), <c2/> (J/S-Marge aus der Empfangsleistung: GPS L5, Galileo E5a und Xona X5 gehen bei -105, -100 und -95 dBW verloren, ein generisches LEO-Signal mit -135 dBW wird bei -90 dBW noch verfolgt), <c3/> (ein Sprung von { "30" } m, vom reinen GNSS-Doppler-Test verfehlt und vom Test auf allen Kanälen { "105" } s nach dem Einsatz erkannt), <c4/> (vier Spoofer gegen beide Monitore) und <c5/> (GNSS gestört, die LEO-Schicht in S- und C-Band verfolgt, die Überwachung der Empfängerintegrität (RAIM) allein auf der LEO-Schicht schlägt bei { "2" } von { "30" } Epochen Alarm).

# text
# c1: leo-focus-ppp-altitude
# c2: leo-focus-ntn-bandwidth
# c3: leo-focus-iot-eirp
# c4: leo-focus-science-iono-sounding
# c5: leo-focus-data-services
# c6: leo-focus-indoor-uhf
# c7: leo-focus-fused-pnt-sisre
# c8: leo-resilience-multiband-diversity
seg-bae66dac04cc = Szenarien der Schwerpunktbereiche: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (Resilienz in L, S und C ist <c8/>).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: leo-vertical-rail-maritime
# c3: leo-vertical-critical-infrastructure-timing
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-5g-network-timing
# c6: leo-vertical-asset-tracking-iot
# c7: docs/LEO-PNT.md
seg-c7947d9cc592 = Vertikale Kampagnen, jede animiert und mit Export ihrer LEO-Überflüge: <c1/>, <c2/> (die mitgelieferten Szenarien für See und Schiene plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Einzeilige Ergebnisse in <c7/>.

# text
# c1: leo-pass
# c2: docs/LEO-PASS.md
# c3: docs/LEO-PNT.md
seg-f650b42bf210 = Die Seite <c1/> zieht nach <c2/> um; <c3/> ist der Überblick.

# text
seg-00a4ba834f37 = <b>Szenarien für See, Straße und Schiene.</b> Fünf mitgelieferte Beispiele zu bestehenden Arten, sodass Schiffe, Straßenfahrzeuge und Züge je einen durchgerechneten Fall haben. Jede Zahl ist MODELLED; keine ist gegen Messdaten validiert.

# text
# c1: scenarios/maritime-strait-jamming.toml
# c2: jamming
seg-682414bbe0c6 = <c1/> (<c2/>): ein Breitbandstörer von { "50" } W auf einem Mast von { "30" } m, { "30" } km über offenes Wasser von einem Schiff entfernt. Mittleres Stör-Signal-Verhältnis (J/S) etwa { "48" } dB, und die Verfügbarkeit fällt von { "1.00" } auf { "0.00" }.

# text
# c1: scenarios/maritime-port-approach-coast.toml
# c2: ins-trn-coast
seg-4666dcd72c24 = <c1/> (<c2/>): ein Trägheitsnavigationssystem (INS) der Navigationsklasse bei { "12" } Knoten, GNSS verloren und ohne Stützung. Es überschreitet { "10" } m nach { "281" } s und { "100" } m nach { "833" } s, die Werte für Hafenansteuerung und Ozeangewässer aus der Resolution A.1046({ "27" }) der Internationalen Seeschifffahrts-Organisation (IMO), hier als Budgets verwendet.

# text
# c1: scenarios/maritime-spoof-position-push.toml
# c2: spoof-detect
seg-7407bb97aedd = <c1/> (<c2/>): ein nicht trägerausgerichteter Spoofer mit +{ "2" } dB, der vier Satelliten schiebt, um ein Schiff um { "500" } m abzulenken. Der fusionierte Monitor erkennt ihn (Wert { "0.70" } gegenüber einer Schwelle von { "0.50" }) über die Überwachung der Empfängerintegrität (RAIM) und die Überwachung der Signalqualität (SQM); die reine Leistungsüberwachung verfehlt ihn.

# text
# c1: scenarios/automotive-urban-canyon.toml
# c2: gnss-ins
seg-1edc0541930b = <c1/> (<c2/>): ein Auto durch eine Unterführung von { "15" } s und einen Ausfall durch einen Straßenrandstörer von { "60" } s, gegenüber einem Budget von { "1.5" } m für eine halbe Fahrspur. Der fusionierte quadratische Mittelwert (RMS) des Fehlers beim Ausfall beträgt { "1.9" } m für eine mikroelektromechanische (MEMS) Einheit der Automobilklasse und { "0.7" } m für einen Vergleich der taktischen Klasse; im freien Lauf driftet die MEMS-Einheit auf { "850.8" } m.

# text
# c1: scenarios/rail-tunnel-coast.toml
# c2: ins-trn-coast
# c3: kshana example
seg-f9830a49659f = <c1/> (<c2/>): ein INS der taktischen Klasse auf einem Zug mit { "160" } km/h in einem Tunnel. Es überschreitet { "2" } m (Gleisunterscheidung) nach { "35.8" } s, etwa { "1.6" } km im Tunnel, und { "20" } m nach { "107.3" } s. Das ist nur INS: die Engine hat kein Odometermodell, daher ist es die pessimistische Schranke. Die Anzahl der Szenariodateien in der README steigt von { "77" } auf { "82" }. Alle fünf sind für <c3/> mitgeliefert und im Browser-Playground aufgelistet.

# text
seg-77c8c53126fd = Model-Context-Protocol-Server

# text
seg-2deb4b35b41a = Der Server des Model Context Protocol (MCP) erreicht jede Art und jede Ansicht eines Laufs: sieben neue Werkzeuge, insgesamt vierzehn.

# text
# c1: run_scenario
seg-7f4035dfd9db = <c1/> hat bereits jede Art bedient; was einem Agenten fehlte, war ein Weg zu einem gültigen Szenario einer Art und zu den drei Ausgaben, die die Befehlszeile neben einem Ergebnis schreibt. Neue Werkzeuge:

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: kshana example
# c4: scenarios/
# c5: lunar-llr-datum
seg-d9df5ab8817a = <c1/> und <c2/> liefern die mitgelieferten Referenzszenarien (die Tabelle von <c3/>), jeweils mit ihrer Art und dem ersten Satz ihres eigenen Kopfes, Byte für Byte die Datei unter <c4/>. Ein Szenario, das im Repository liegt, aber nicht mitgeliefert wird, wird mit Begründung abgelehnt. Jede Art außer <c5/> (deren Datenausschnitt nur mit dem Repository ausgeliefert wird) hat mindestens ein Beispiel.

# text
# c1: report_scenario
# c2: docs/REPORTS.md
seg-cb24ad7147ef = <c1/> liefert den Bericht des Laufs als JSON (JavaScript Object Notation) oder als druckbare HTML-Seite (HyperText Markup Language) (<c2/>).

# text
# c1: animate_scenario
# c2: docs/ANIMATION.md
seg-9264b2f20e15 = <c1/> liefert die Zeitreihen des Laufs als animierte SVG-Zeichnung (Scalable Vector Graphics), als HTML-Player oder als nummerierte Einzelbilder, nach einer JSON-Zusammenfassung dessen, was gezeichnet wurde (<c2/>). Eine Antwort enthält höchstens { "120" } Einzelbilder; die Befehlszeile schreibt jede Länge.

# text
# c1: list_export_formats
# c2: export_interop
# c3: import_route
# c4: docs/INTEROP.md
# c5: .e
seg-959f23871238 = <c1/>, <c2/> und <c3/> liefern die Interoperabilitätsexporte und den GeoJSON-Routenimport (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, die STK-Ephemeride (Systems Tool Kit) <c5/> und SigMF (Signal Metadata Format), mit einem JSON-Index der Dateien (Endung, Größe und SHA-256, der 256-Bit-Digest des Secure Hash Algorithm) und der binären SigMF-Abtastdatei als Base64.

# text
# c1: bundled-scenarios
# c2: kshana::bundled_scenarios
# c3: --study
# c4: web/
seg-9ec3f9639b8c = Die Bibliothek erhält ein standardmäßig ausgeschaltetes Feature <c1/>, das die Tabelle der Referenzszenarien als <c2/> bereitstellt; nur der MCP-Server schaltet es ein, sodass das Python-Wheel und das WebAssembly-Modul den Szenariotext weiterhin nicht enthalten. Studiensuiten (<c3/>) bleiben nur der Befehlszeile vorbehalten, weil eine Suite Dateien auf der Festplatte benennt und der Server keine liest. Die Round-Trip-Tests führen jedes neue Werkzeug gegen mitgelieferte Szenarien aus und prüfen die Zahlen der Engine: Spektrum, das Sonnensystem, Konstellationen um Mond und Europa, einen Kampagnen-Sweep sowie die Arten für LEO-Signal (niedriger Erdorbit), Überflug, Navigationsnachricht, fusionierte Positionierung, Precise Point Positioning, Nicht-Terrestrische Netze und Ende zu Ende. Jede Oberfläche, die die Anzahl der MCP-Werkzeuge nennt oder die Werkzeuge auflistet, sagt jetzt vierzehn, außer der Playground-Seite unter <c4/>, die durch die Website ersetzt wird.

# text
seg-c11823028688 = kshana.dev, Kshana Studio und die README

# text
# c1: docs/
# c2: /#playground
# c3: /#ledger
# c4: /#s=<scenario>
# c5: /?embed=1&…
seg-fb584cf84218 = <b>Ein neu gestaltetes kshana.dev.</b> Die einzelne Playground-Seite wird durch eine mehrseitige Website ersetzt: Home, Missions, Capabilities, Evidence, Developers, Editions und Docs, mit Kshana Studio einen Klick entfernt. Jedes Diagramm, jede Karte und jede Zahl darauf ist ein aufgezeichneter Lauf der Engine dieser Version, mit dem Szenario und einem Link, der denselben Lauf im Studio wieder öffnet; der Build der Website lehnt eine Aufzeichnung ab, die mit einem anderen Engine-Commit gemacht wurde. Die Dokumentationsseiten werden aus <c1/> des Repositorys erzeugt, die Installationsoptionen aus seinen Kanälen. Schriften und Skriptbibliotheken werden von kshana.dev selbst ausgeliefert, sodass keine Seite etwas bei einem Drittanbieter-Host anfordert. Alte Adressen (<c2/>, <c3/>, Share-Links <c4/>, Embed-Links <c5/> und die übrigen) leiten an ihren neuen Ort weiter, und eine unbekannte Adresse erhält eine { "404" }-Seite.

# text
seg-dcf2788bb430 = <b>Forschung und Zitierung.</b> Die Seite Evidence listet die fünf Kshana-Veröffentlichungen auf arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } und { "2607.06212" }), jede mit einer Zusammenfassung, einer von dieser Engine berechneten Abbildung, dem Befehl, der sie reproduziert, einem Studio-Link und BibTeX, neben dem Hinweis, wie die Software zu zitieren ist. Die README erhält denselben Abschnitt Research.

# text
seg-fab395bab130 = Eine öffentliche Seite für Kshana Pro.

# text
# c1: docs/PRO.md
seg-167a59e94101 = <c1/> und die Seite Editions der Website sagen, was die proprietäre Pro-Überlagerung über derselben Engine hinzufügt (Designoptimierer, Unsicherheit und Sensitivität, Missionsdossier, Kampagnenüberwachung, Spektrumkoexistenz, lokaler Auftragsdienst, Anforderungsrückverfolgbarkeit), was jedes erzeugt und was nicht. Jede Pro-Zahl, die die Website zeigt, ist auf dieser öffentlichen Seite angegeben. Pro fügt kein physikalisches Modell hinzu, und die offene Engine bleibt vollständig und frei.

# text
# c1: tools/gen_readme_assets.py
# c2: tools/capture_studio_shots.mjs
# c3: docs/
seg-f57f0a610943 = <b>Eine neu geschriebene README.</b> Kurze Abschnitte, ein Bild je Abschnitt, das Kshana-Zeichen, zwei Badge-Reihen, erzeugte Bilder zu Architektur, Szenarioablauf, Kette im niedrigen Erdorbit und Verifikation (<c1/>, das bei einem veralteten Bild fehlschlägt) sowie Studio-Screenshots, die <c2/> aus dem laufenden Studio aufnimmt. Die READMEs von crates.io, PyPI, npm und MCP-Server folgen demselben Design. Langes Referenzmaterial wird eingeklappt oder nach <c3/> verlegt.

# text
# c1: result.json
# c2: report.json
seg-77a6f35c5c9a = <b>Die README sagt, worauf Kshana Pro aufbaut.</b> Der Abschnitt Editions und die Zeile zu Kshana Pro unter "Support & professional services" sagen jetzt, was die modellbasierten Systems-Engineering-Werkzeuge (MBSE) und Programmwerkzeuge von Pro tun und welche veröffentlichten Ausgaben der offenen Engine sie lesen (<c1/> und <c2/> jedes Laufs, die Szenariodatei, das Einheitenschema der Felder und die Bezeichnungen der Verifikationsmatrix) und worauf die Uhren-Digitalzwillinge, Trade-Studien und Nachweispakete in der offenen Engine beruhen. Nur der Wortlaut: keine Ausgabe der Engine und keine veröffentlichte Zahl ändert sich.

# text
# c1: navsignal::Modulation
# c2: Mboc
# c3: ephemeris
# c4: gcrs_r_m
# c5: gcrs_v_m_s
seg-1a19675ffa3b = <b>Kompatibilität.</b> Das öffentliche Enum <c1/> erhält eine Variante <c2/>, was für einen Aufrufer, der es erschöpfend abgleicht, eine inkompatible Änderung ist. Die Spalten <c4/> und <c5/> der Art <c3/> ändern sich (siehe "Revisions to published numbers"). Ein Lauf wird weiterhin von der Version der Engine reproduziert, die ihn erzeugt hat.

# text
# c1: export_table_csv
# c2: telecom-timing
# c3: leo-navmsg
# c4: encode-decode
# c5: kepler16
# c6: kepler-rac
seg-e7c5f77a6602 = <b><c1/> auf dem MCP-Server nannte vier Arten als einzige mit einer CSV-Tabelle (kommagetrennte Werte); sechs veröffentlichen eine.</b> Das Werkzeug lieferte die Tabelle immer für <c2/> und für <c3/> (seine Analyse <c4/> bei einem Nachrichtenmodell <c5/> oder <c6/>), aber seine Beschreibung, seine Ablehnungsmeldung und die Dokumente, die die Arten auflisten, ließen beide aus, sodass ein Agent erfuhr, er solle nicht danach fragen. Sie sind jetzt genannt, und ein Round-Trip-Test ruft beide Tabellen ab.

# text
seg-4094f58a5f4b = Der Frame der Navigationsnachricht im niedrigen Erdorbit (LEO) hatte nicht auf jeder Plattform dieselben Bytes, auch nicht in jedem Build einer Plattform.

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
# c2: 0x110315
# c3: 0x898BD8
# c4: 0x6A82D9
# c5: leo-navmsg-celeste-iod.toml
# c6: 0x6EDB2D
# c7: 0xC6E4F0
seg-5191262de022 = <c1/> kodierte einen Frame mit zyklischer Redundanzprüfung <c2/> im Release-Build auf aarch64 macOS, <c3/> in einem Debug-Build desselben Quelltexts auf derselben Maschine und <c4/> im WebAssembly-Build (WASM); <c5/> ergab nativ <c6/> gegenüber <c7/> im Browser. Drei Ursachen, jede bis zum ersten abweichenden Wert zurückverfolgt:

# text
# c1: truth::state_to_elements
# c2: acos
# c3: atan2
seg-f6501c3cd89d = <em>Zwischen Plattformen.</em> Die Wahrheitsbahn war auf beiden bitidentisch; der Startpunkt des Fits nicht. <c1/> nimmt die oskulierende Inklination aus einem <c2/> und das Argument des Perigäums aus einem <c3/>, und die beiden Mathematikbibliotheken runden diese in der letzten Stelle unterschiedlich (bei { "20 000" } Argumenten weichen sie bei { "781" } Sinuswerten, { "858" } Kosinuswerten, { "1 931" } Exponentialfunktionen und { "1 899" } Arkustangens mit zwei Argumenten ab).

# text
# c1: sin
seg-cd6f05096b8b = <em>Zwischen Build-Profilen.</em> Ein optimierter Build auf macOS fasst einen Sinus und einen Kosinus eines Arguments zu einem einzigen Aufruf der kombinierten Routine des Systems zusammen, und sein Sinus ist bei { "379" } von { "200 000" } Argumenten nicht der des einzelnen <c1/>; ein nicht optimierter Build führt die beiden Aufrufe aus. Die Art nimmt an dreizehn Stellen einen Sinus und einen Kosinus zusammen.

# text
# c1: rand_distr
# c2: exp
# c3: ln
seg-91b0700dcb30 = <em>In der Uhr.</em> Der Normalverteilungs-Sampler von <c1/> ruft in seinen zwei seltenen Zweigen die <c2/> und <c3/> des Hosts auf: von vier Millionen gesäten Ziehungen unterschieden sich drei im letzten Bit zwischen dem nativen und dem WASM-Build.

# text
# c1: src/portable_math.rs
# c2: libm
# c3: Cargo.toml
# c4: leo_navmsg::{truth, fit, elements, codec, sisre, services}
# c5: f64::powi
# c6: portable_math::standard_normal
# c7: _portable
# c8: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c9: the_kind_never_calls_the_host_mathematics_library
# c10: rand_distr
# c11: leo-navmsg
# c12: leo-navmsg
# c13: leo-navmsg
# c14: navmsg
# c15: leo-pnt-chain
# c16: docs/LEO-NAVMSG.md
# c17: 0x110315
# c18: 0x19105F
seg-0a4724333429 = Der Levenberg–Marquardt-Fit, der auf diesem Bogen an seiner Grenze von 80 Iterationen stoppt und nicht an einem Minimum, trägt eine Einheit in der letzten Stelle in andere quantisierte Felder. Die Art berechnet jetzt jede transzendente Funktion über das neue <c1/>, das das reine Rust-Crate <c2/> aufruft (bereits im Abhängigkeitsbaum, jetzt in <c3/> benannt), aus einem Quelltext für jedes Ziel kompiliert und kein Bibliotheksaufruf, den der Optimierer umschreibt: <c4/> und der Szenariocode. Ganzzahlige Potenzen auf diesem Pfad sind als Square-and-Multiply ausgeschrieben, weil <c5/> eine nicht spezifizierte Genauigkeit hat, und die Wahrheitsuhr zieht ihre normalverteilten Abweichungen aus <c6/> (Marsaglias Polarmethode auf der Rohausgabe des Generators). Die gemeinsamen Routinen, über die die Wahrheitsbahn integriert, sind einmal geschrieben, generisch über die Mathematikbibliothek, mit einem Crate-internen Einstiegspunkt <c7/> neben dem bestehenden: die Beschleunigung aus Kugelfunktionen, die zonalen Beschleunigungen und der Luftwiderstand, die säkularen J2-Raten und die Klobuchar-Laufzeit. Die bestehenden Einstiegspunkte sind bis auf das letzte Bit unverändert, sodass sich keine Zahl einer anderen Art verschiebt. <c8/> legt den ganzen 171-Byte-Frame und einen Prüfwert je Ephemeridenmodell fest, im gewöhnlichen (nicht optimierten) Testprofil, auf jeder Plattform und ohne Baseline-Host-Gate; <c9/> liest die Quelltexte der Art von der Festplatte und schlägt bei einem inhärenten transzendenten Aufruf fehl, bei einem Sampler <c10/> oder bei einem Aufruf in ein Modul, das nicht geprüft wurde. Nach der Änderung erzeugen ein Debug-Build, ein Release-Build und der WASM-Build bytegleiche Ergebnisdokumente für alle fünf Szenarien <c11/>. <b>Das verschiebt Zahlen und wird hier als Revision festgehalten.</b> Die Art <c12/> ist in dieser Version neu, sodass sich nichts verschiebt, was in einer früheren Version veröffentlicht wurde, aber jede Zahl von <c13/> verschiebt sich, nativ und im WASM-Build, und die Stufe <c14/> von <c15/> mit ihr: die Bahnzahlen, weil der Fit jetzt von den portablen Elementen ausgeht, die Uhrenzahlen, weil die Wahrheitsuhr eine andere Realisierung desselben Prozesses ist. <c16/> wird aus den neuen Ergebnissen neu erzeugt; ihr veröffentlichter Prüfwert für das Szenario Kodieren und Dekodieren war <c17/> und ist <c18/> (Position innerhalb von { "1.126" } mm der exakten Nachricht, wo sie { "0.665" } mm war, Uhr innerhalb von { "0.185" } mm, wo sie { "0.451" } mm war). Die Größe der Änderungen bei den Zahlen im Submillimeterbereich ist die Sensitivität des Fits, kein Fehler in einem der beiden Sätze: der Fit ist unverändert und stoppt weiterhin an seiner Iterationsgrenze.

# text
seg-c30f4cef4797 = Gesätes Resampling zog auf einem 32-Bit-Ziel andere Indizes.

# text
# c1: Rng::gen_range
# c2: usize
# c3: eval_stats
# c4: bootstrap_ci
# c5: bootstrap_auc_ci
# c6: impairment_ml
# c7: impairment_study
# c8: portable_math::uniform_index
# c9: u64
# c10: quantum-anomaly-detect
# c11: quantum_auc_ci
# c12: trade.foms[0].ci95
# c13: [0.9901265, 0.9938305]
# c14: [0.99035875, 0.993861]
seg-2bf668e23ec1 = <c1/> über <c2/> nimmt auf einem 64-Bit-Host { "64" } Bit vom Generator und auf einem 32-Bit-Host { "32" } Bit, sodass derselbe Seed andere Indizes lieferte und den Strom im WASM-Build anders hinterließ. Drei Stellen zogen so: die Perzentil-Bootstraps in <c3/> (<c4/>, <c5/>), das Mischen vor jedem Trainingsdurchlauf in <c6/> und der Permutationstest in <c7/>. Sie ziehen jetzt über <c8/>, das immer als <c9/> abtastet: genau das, was ein 64-Bit-Host tat, sodass sich keine native Zahl verschiebt. <b>Das verschiebt veröffentlichte Zahlen des WASM-Pakets und wird hier als Revision festgehalten:</b> das Bootstrap-Intervall der Fläche unter der Kurve für <c10/> (<c11/>, <c12/>) war <c13/> im Browser und ist jetzt das native <c14/>.

# text
# c1: /
# c2: Pulsar inclined/S1-0163
# c3: --export stk
# c4: -
# c5: _
seg-80f783da1d4f = <b>Dateinamen der STK-Ephemeriden aus Mover-IDs.</b> Eine Mover-ID mit einem <c1/> oder einem Leerzeichen (eine Konstellationsschale und ein Satellit, <c2/>) ließ die CLI bei <c3/> in Panik geraten; jede ID läuft jetzt durch einen sicheren Dateinamensteil (Buchstaben, Ziffern, <c4/>, <c5/>).

# text
seg-a0dc5729d5e9 = <b>Das Vorzeichen der TEME→GCRS-Nutation</b>, oben unter "Revisions to published numbers" beschrieben, weil es veröffentlichte Ausgaben verschiebt.

# text
# c1: slot-timing
# c2: src/slot_timing.rs
# c3: slot-timing-ocxo-leo
# c4: docs/SLOT-TIMING.md
seg-5ecbf0787f39 = <b>Szenarioart <c1/></b> (<c2/>): Sekunden, bis eine freilaufende Uhr die Schutzzeit eines zeitindizierten Routing- oder Tasking-Slots verlässt, jeder beitragende Term in diesem Moment mit Nennung des dominierenden, die seit dem letzten Fix verbleibende Zeit und das größte Fix-Intervall, das die Uhr drinnen hält, abzüglich der Fix-Latenz. Die Uhr stammt aus einem Klassenstandard, einer Voreinstellung aus dem Datenblatt für Telekom-Zeitgebung, einem Inline-Datenblatt (Maxima der Allan-Abweichung, Alterung, Temperaturkoeffizient) oder einer gemessenen Phasenaufzeichnung. Eine Verletzung jenseits der längsten Mittelungszeit, die die Quelle unterstützt, wird als extrapoliert gekennzeichnet. Mitgeliefertes Beispiel: <c3/>. Siehe <c4/>.

# text
# c1: slot_timing::fit_weighted
seg-40dd4c16b760 = <b>Gemessene Untergrenze des roten Rauschens.</b> Die überlappende Allan-Abweichung einer Phasenaufzeichnung wird mit gewichteten kleinsten Quadraten in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } angepasst (<c1/>), jeder Punkt gewichtet mit seinen äquivalenten Freiheitsgraden, sodass eine Holdover-Antwort auf der eigenen Untergrenze der Uhr beruhen kann statt auf der Klassenannahme. Ein ungewichteter Fit setzte eine falsche Flicker-Untergrenze auf eine Testaufzeichnung mit weißem Rauschen und verkürzte eine Verletzung bei { "2 000" } s um { "30" } %.

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: scripts/fetch_ocxo.sh
# c3: fix_frequency_sigma
seg-cd73dc87a22f = <b>Dieselbe Vorhersage an einem realen Quarzoszillator</b> (<c1/>, <c2/>): bei einem gemessenen ofengesteuerten Quarzoszillator ist die Vorhersage auf zurückgehaltenen Daten konservativ, bei { "0.59" } bis { "0.70" } der gemessenen Verletzung und nie später, und größtenteils außerhalb des Zielwerts { "1.5" }, weil sich die Rauschuntergrenze dieses Oszillators während der Aufzeichnung von 5.5 Stunden halbierte; in der Stichprobe angepasst liegt sie bei { "0.98" } bis { "1.17" }. Der Quarzfall ist nicht validiert und bleibt MODELLED. Der Lauf deckte außerdem einen fehlenden Term auf: die Frequenz eines Quarzes wandert, daher trägt das Modell jetzt die Unsicherheit der beim Fix bekannten Frequenz (<c3/>); ohne sie war die Vorhersage um bis zu { "2.5" }× zu optimistisch.

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-8519979d184c = <b>Dieselbe Vorhersage an Atomuhren im Orbit</b> (<c1/>, <c2/>): { "14" } Tage endgültige Uhren des International GNSS Service für die GPS-Block-IIF-Satelliten, mit dem Protokoll, das vor dem Herunterladen der Daten niedergeschrieben wurde. Acht von zehn Satelliten liegen innerhalb des Zielwerts { "1.5" }; G25 und G30 sagen Verletzungen voraus, die bis zu etwa doppelt so spät liegen wie gemessen. Das Protokoll verlangt, dass jeder Satellit besteht, daher ist der Orbitfall nicht validiert und bleibt MODELLED; das Ergebnis ist festgeschrieben.

# text
# c1: ClockClass::Tcxo
# c2: Ocxo
# c3: Rafs
# c4: ClockClass::source
# c5: ClockClass::ALL
# c6: id
# c7: from_id
# c8: quantum-trade
# c9: baseline_clock_class
seg-0d666a725b77 = <b>Uhrenklassen temperaturkompensierter Quarz (TCXO), ofengesteuerter Quarz (OCXO) und Rubidium-Atomfrequenznormal (RAFS)</b> (<c1/>, <c2/>, <c3/>), die Teile, die ein kommerzieller Smallsat-Bus oder ein Bodengateway fliegt, jede mit Verweis auf ein öffentliches Datenblatt (<c4/>). <c5/>, <c6/> und <c7/> hinzugefügt. <c9/> von <c8/> akzeptiert die drei neuen IDs. Das Hinzufügen von Varianten zu einem öffentlichen Enum ist für einen Aufrufer, der es erschöpfend abgleicht, eine inkompatible Änderung.

# text
# c1: src/orbital_timing.rs
# c2: slot-timing
# c3: spoofing
# c4: tpl::timing_protection_level_ns
seg-24ae82b115f5 = <b>Zeitgebungs-Schutzniveau für einen Empfänger im Orbit</b> (<c1/>, der optionale Abschnitt <c3/> der Art <c2/>): wie lange ein Bodenspoofer einen Satelliten im niedrigen Erdorbit je Überflug erreichen kann, den Versatz, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seine Reichweite verlässt oder eine unabhängige Prüfung läuft, und ob jede Bodenkontakt- oder Crosslink-Prüfung von diesem Spoofer unabhängig ist. Reduziert sich exakt auf <c4/> bei einer Uhr ohne Flicker-, Weißphasen- oder Random-Run-Rauschen. MODELLED.

# text
# c1: docs/SLOT-TIMING.md
# c2: docs/DECEIVED-TIME.md
# c3: docs/DEPLOYMENT-TARGETS.md
# c4: no_std
seg-4032bc03fad5 = <b>Drei Hinweise</b>: <c1/> (einschließlich der Frage, an welcher Wander-Metrik ein Slot akzeptiert werden sollte: maximaler absoluter Zeitfehler, nicht maximaler Zeitintervallfehler oder Zeitabweichung, und warum), <c2/> (ein signierter Befehl, der zu einer getäuschten Zeit angewandt wird, leitet trotzdem falsch) und <c3/> (wo Kshana läuft; es wird kein Flugkern <c4/> angeboten).

# text
# c1: kshana
# c2: kshana-mcp
seg-712035e19515 = Die Version { "v0.27.3" } erreichte crates.io (<c1/> und <c2/>) und PyPI und blieb dann bei npm stehen, sodass npm, das ghcr.io-MCP-Image, die MCP-Registry, der JetBrains Marketplace und kshana.dev sie nie erhielten. { "0.27.4" } trägt dieselbe Engine, mit der unten genannten Korrektur der Veröffentlichung, in jeden Kanal.

# text
# c1: npm-dist/kshana-0.27.3.tgz
# c2: owner/repo
# c3: github.com/npm-dist/kshana-0.27.3.tgz
# c4: ./npm-dist/*.tgz
seg-bab8d4d1bc54 = <b>Der npm-Veröffentlichungsschritt benennt das Tarball über einen expliziten Pfad.</b> npm liest ein nacktes <c1/> als die GitHub-Kurzform <c2/>, sodass der npm-Job von { "v0.27.3" } versuchte, <c3/> zu klonen, und mit "Permission denied (publickey)" scheiterte. Das Tarball selbst war gebaut und attestiert worden. Der Schritt veröffentlicht jetzt <c4/>. Alles nach npm in der Reihenfolge der Veröffentlichung (das MCP-Image, das JetBrains-Plugin, die Prüfung der Kanalparität und die Website) wurde wie vorgesehen übersprungen.

# text
# c1: gnss-ins
seg-f9a112755eb1 = <b>Die Einheitenkataloge für Telekom-Zeitgebung und <c1/> sind von der Copy-Paste-Erkennung ausgenommen</b>, nach derselben Richtlinie und demselben Begründungstest wie die anderen Kataloge. Das Quality Gate von SonarCloud war wegen Duplikation im neuen Code rot geworden ({ "4.0" } % gegenüber { "3" } %), und jeder duplizierte Block war eine Einheitenzeile oder ein ITU-T-Maskeneintrag.

# text
# c1: scenarios/small-uas-jammed-nav.toml
# c2: jamming-demo.toml
# c3: kshana example small-uas-jammed-nav
seg-3c3dacae06d6 = <b><c1/>: wie lange die Navigation einer kleinen Drohne nach einer GNSS-Störung hält.</b> Es lässt eine mikroelektromechanische (MEMS) Inertialeinheit der Klasse eines Flugreglers, einen Bosch BMI088, gegen eine Einheit der taktischen Klasse laufen. Das GNSS-Signal (Global Navigation Satellite System) ist { "100" } s lang nominal, dann { "60" } s lang verweigert (<c2/> zeigt, warum ein naher Störer das tut). Die Bias-Werte des BMI088 sind die Residuen, die nach der Kalibrierung beim Start bleiben, entnommen den Temperaturkoeffizienten in seinem Datenblatt (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s je K für das Gyroskop und < { "0.2" } mg je K für den Beschleunigungsmesser. Zwei Annahmen sind in der Datei gekennzeichnet: eine Erwärmung um { "10" } K nach der Kalibrierung und eine fortgesetzte Erwärmung um { "1" } K pro Minute im Flug. Die Drift im Flug ist der Fehler, den das Filter vor Beginn der Störung nicht lernen kann, und sie beendet das Koppeln. Jede Zahl ist modelliert; sie zu validieren erfordert Flugprotokolle aus einer gestörten Umgebung. <c3/> gibt es aus.

# text
# c1: gnss-ins
# c2: [imu_quantum.filter_prior]
# c3: [imu_classical.filter_prior]
# c4: sigma_accel_bias
# c5: sigma_gyro_bias
seg-7154f69a2b8a = <b>Jeder Sensor von <c1/> kann sein eigenes Filter-Prior setzen</b> (<c2/> oder <c3/>, mit <c4/> und <c5/>). Der Standard ist unverändert, sodass jedes bestehende Szenario dasselbe Ergebnis liefert. Der Rest-Gyroskop-Bias einer Einheit der Verbraucherklasse liegt etwa { "26" } Sigma außerhalb des Standards der taktischen Klasse, wo das Filter ihn nie lernen würde. Ein Prior, der nicht endlich und positiv ist, wird abgelehnt, und das Ergebnis gibt den Prior wieder, wenn einer gesetzt ist.

# text
# c1: kshana example [<name>]
# c2: cargo install kshana
# c3: scenarios/
# c4: scenarios/
# c5: src/bundled_scenarios.rs
# c6: kshana example
# c7: kshana example clock-holdover > clock-holdover.toml
# c8: lunar-llr-datum
# c9: quantum-pnt-demonstrator.suite
# c10: --study
# c11: tests/cli_first_run.rs
seg-2b54735b19aa = <b><c1/> gibt einem Registry-Nutzer ein Szenario zum Ausführen.</b> Ein Nutzer von <c2/> hat die ausführbare Datei und kein Verzeichnis <c3/>, sodass der erste Befehl jeder Kurzanleitung bei ihm fehlschlug. Die Befehlszeilenschnittstelle (CLI) trägt jetzt die { "75" } Referenzszenarien, die für sich laufen, Byte für Byte aus <c4/> einkompiliert (<c5/>; die Tabelle liegt in der CLI-Binärdatei, sodass das Python-Wheel und das WebAssembly-Modul nicht wachsen). <c6/> listet sie auf; <c7/> schreibt eines. Die anderen zwei Dateien gibt es nur im Repository: <c8/> liest archivierte Daten der Laserentfernungsmessung zum Mond, die nur mit dem Repository ausgeliefert werden, und <c9/> ist ein Studienmanifest, das drei Schwesterdateien mit <c10/> ausführt. Wer eine davon anfordert, erhält den Grund und Exit-Code { "2" }, statt dass etwas ausgegeben wird, das nicht für sich laufen kann. <c11/> hält die Tabelle in beide Richtungen am Verzeichnis fest, sodass eine neue Szenariodatei, die weder mitgeliefert noch als nur im Repository benannt ist, fehlschlägt.

# text
# c1: figure_tiers
# c2: quantum.fom.timing_p95_ns
# c3: src/verification.rs
# c4: src/fom_label.rs
# c5: hybrid
# c6: fusion
# c7: untiered
# c8: tests/registry_golden.rs
# c9: tests/cross_platform_golden.rs
seg-43249b6a1f3c = <b>Jede Kennzahl in einem Uhren-, Orbit-, Hybrid- oder Fusionsergebnis sagt jetzt im Ergebnis selbst, ob sie VALIDATED oder MODELLED ist.</b> Das Ergebnisdokument erhält einen Block <c1/>, immer sein letzter Schlüssel. Er listet jede gemeldete Zahl (zum Beispiel <c2/>) mit ihrer Stufe auf — VALIDATED bedeutet gegen eine unabhängige externe Referenz geprüft, MODELLED bedeutet ein Modell aus ersten Prinzipien, das intern getestet wird — und der Zeile der Verifikationsmatrix, aus der die Stufe gelesen wird. Die Stufe kommt aus <c3/> über <c4/>, sodass es keine zweite Tabelle gibt, die auseinanderlaufen kann. Zuvor kamen die Wörter "validiert" und "modelliert" in einem Ergebnis zum Uhren-Holdover null Mal vor, und ein Leser des rohen JSON (JavaScript Object Notation) konnte die beiden nicht unterscheiden. Die Positionszahlen von <c5/> und <c6/> haben keine zugehörige Matrixzeile, daher sind sie unter <c7/> aufgeführt, statt eine Stufe zu erhalten. Der Block enthält keine Zahlen. Es ist als additiv bewiesen, nicht angenommen: sein Entfernen liefert das Dokument vor der Änderung Byte für Byte zurück, für alle fünf Arten (ein Engine-Test), und beide Golden-Harnesses (<c8/>, <c9/>) entfernen jetzt genau diesen Schlüssel, und nur, wenn er der letzte ist, und bilden dann den Hash des Rests gegen ihre <b>unveränderten</b> eingefrorenen Konstanten. Eine Liste in jedem Harness legt fest, welche Szenarien den Block tragen müssen, sodass sich der Ausschluss nicht unbemerkt ausweiten kann.

# text
# c1: telecom-timing
# c2: docs/TELECOM-TIMING.md
seg-8faf1981d797 = <b>Eine Art <c1/> antwortet in den Einheiten eines Zeitgebungsingenieurs: Zeitfehler, maximaler Zeitintervallfehler (MTIE) und Zeitabweichung (TDEV), jeweils mit PASS oder FAIL und einer Marge gegenüber den Masken des Sektors Telekommunikationsstandardisierung der Internationalen Fernmeldeunion (ITU-T).</b> Die Masken sind aus den geltenden Ausgaben übernommen: G.8272 (07/2025) für die Klassen A und B der primären Referenzzeituhr (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) für die erweiterte PRTC im verriegelten Modus und im Holdover (einschließlich ihrer Zeitfehlerhüllkurve, die über eine Holdover-Periode, die davon abhängt, wie lange die Uhr verriegelt war, von { "30" } ns auf { "100" } ns ansteigt), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) für Telekom-Grenzuhren und -Zeitslaveuhren der Klassen A bis D und G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) für die Netzgrenzen am Referenzpunkt C. Jeder Eintrag, den diese Empfehlungen "für weitere Studien" lassen, fehlt, wird nicht geschätzt, und <c2/> listet jede Zahl mit ihrer Tabelle oder Klausel und jedes ausgelassene Element auf. Der Bericht gibt außerdem die Zeit bis zur Überschreitung jedes Zeitfehlerbudgets an: standardmäßig die Holdover-Voreinstellung der ePRTC von { "100" } ns, eine Netz-Holdover-Zuteilung von { "400" } ns, die Grenze am Punkt C von { "1 100" } ns und die Ende-zu-Ende-Anforderung von { "1.5" } Mikrosekunden der Klasse { "4" }.

# text
# c1: [time_s, time_error_ns]
seg-9e5325e1b0ca = Die Eingabe ist entweder ein synthetischer Holdover oder eine eigene Reihe. Der synthetische nutzt eine von vier Oszillator-Voreinstellungen (ein ofengesteuerter Quarzoszillator, ein Rubidiumnormal, ein Caesiumnormal und eine Atomuhr im Chip-Maßstab), jede mit den Stabilitäts-, Alterungs- und Temperaturwerten eines benannten Microchip-Datenblatts. Wie diese Werte zu weißem, Flicker- und Random-Walk-Frequenzrauschen, zu Alterung und zu einem Temperaturterm werden, ist in jedem Bericht angegeben und mit MODELLED gekennzeichnet. Eine eigene Reihe sind Paare <c1/>, inline (so läuft es im Browser) oder, bei nativen Builds, aus einer Datei mit kommagetrennten Werten. Die MTIE/TDEV-Tabelle, mit der Grenze jeder gewählten Maske daneben, wird als CSV-Artefakt des Laufs geschrieben.

# text
seg-5bb1ad9a34ec = Der Playground führt die Engine in einem Web Worker im Hintergrund aus, sodass ein langsames Szenario die Seite nicht mehr einfriert.

# text
# c1: web/engine-worker.mjs
# c2: web/engine.mjs
# c3: cislunar-arc-recovery
seg-b1ab3546f131 = <c1/> hostet die WebAssembly-Engine, und <c2/> leitet jede Szenarioausführung an sie weiter — Läufe, Parameter-Sweeps und die Exporte SP3 / OMM / OEM / CSV. Ein Lauf, der länger als { "150" } ms dauert, zeigt einen Zustand "beschäftigt" (Run deaktiviert, "Running… N s") und eine Schaltfläche Cancel, die den Worker beendet und neu startet; ein Browser, der keinen Modul-Worker starten kann, fällt auf den alten Pfad im Hauptthread zurück. <c3/>, das aus dem Katalog genommen worden war, weil es die Seite einfror, ist wieder darin, als langsam gekennzeichnet: es braucht in Chrome etwa { "13" } s (vier Engine-Aufrufe zu je etwa { "3" } s), währenddessen die Seite ansprechbar bleibt.

# text
# c1: cislunar-observability
seg-146200dfac7e = <b>Jede gemeldete Größe von <c1/> trägt jetzt eine Einheit, eine Herkunftsklasse und eine Definition — die vorletzte Art auf der crateweiten Ausnahmeliste.</b> Alle { "41" } numerischen Felder des RELEASED-Dokuments sind beschrieben, sodass die Abdeckung der Felder-Einheiten von { "59" } von { "61" } Arten auf { "60" } von { "61" } steigt und von { "1,698" } auf { "1,742" } beschriebene Felder, wobei der Rückstand ohne Definition unverändert bei { "239" } bleibt.

# text
# c1: units
# c2: units
# c3: expect_summary
seg-61b1219ae0e3 = Das war durch die Festschreibung blockiert, die das veröffentlichte Dokument einfriert und <c1/> als Schlüssel nannte, den das Dokument nie erhalten darf. Einen hinzuzufügen hätte bedeutet, diese Zusicherung zu löschen und drei Hashes in drei Dateien neu zu basieren — eine Form, die sich vom Vertuschen einer Regression nicht unterscheiden lässt. Stattdessen <em>beweisen</em> die zwei Festschreibungen, die dieses Dokument messen, jetzt, dass die Ergänzung additiv ist: jede entfernt den Block <c2/> wieder und bildet den Hash neu gegen die Konstante, die eingefroren wurde, bevor es den Block gab, und <b>beide Konstanten sind unverändert</b>. Eine Mutation bestätigt, dass die Garantie echt ist — einen veröffentlichten Wert verschieben und den Hash des ganzen Dokuments so neu basieren, wie es eine nachlässige Korrektur täte, und das Entfernen mit neuem Hash scheitert trotzdem. Die dritte Festschreibung im generischen Registry-Golden-Harness wird im Einklang mit den sechs Geschwistern neu basiert, die genau aus diesem Grund neu basiert wurden, und ihr wertetragendes Literal <c3/> verschiebt sich nicht.

# text
# c1: realtime-frame-eop
seg-a73409e0b664 = <c1/> meldet, an welcher Wahrheit jede Zeile zur Erdorientierung bewertet wurde und wie oft der Rückgriff griff.

# text
# c1: table3_joint_eop[].{ut1, polar_motion,combined}
# c2: truth_source
# c3: truth_fallback_rows
# c4: final
# c5: dN
# c6: truth_pm()
# c7: truth_ut1()
seg-6e0493a39f1a = <c1/> erhalten <c2/> und <c3/>. Die Untergrenze <c4/> wird gegen das endgültige Bulletin B bewertet und kann nur Epochen verwenden, die eines veröffentlichen; jede Zeile <c5/> wird gegen <c6/>/<c7/> bewertet, die auf den schnellen Wert aus Bulletin A zurückgreifen. Beim mitgelieferten Auszug von { "2026" } sind das { "12" } von { "31" } Stichproben bei einem Tag, gegenüber { "0" } bei der Untergrenze — die Zeile der Untergrenze und die Vorhersagezeilen daneben beruhen also auf messbar unterschiedlicher Wahrheit, was der Bericht jetzt angibt, statt es aus einer Stichprobenzahl erschließen zu lassen, die dort steigt, wo verschachtelte Horizonte es nicht zulassen.

# text
# c1: moonlight-service-volume
seg-7ba5be07fa8c = <c1/> gibt eine größengleiche Kepler-Basislinie aus.

# text
# c1: ephemeris_comparison.keplerian_matched
# c2: 360k/n
seg-f9dc8fae6452 = <c1/> führt die illustrative Konstellation erneut mit der eigenen Satellitenzahl des ABGERUFENEN Satzes aus, nur vorhanden, wenn die Zahlen abweichen. Die Zahl ist Teil der Geometrie dieses Designs — RAAN und mittlere Anomalie werden beide als <c2/> verteilt —, sodass ohne sie ein abgerufener Satz mit fünf Satelliten gegen einen illustrativen mit acht bewertet wurde und Design und Größe vermengt wurden. Für den Referenzsatz LANS mit fünf Satelliten erweisen sich { "8.68" } der 14.24 Punkte Abdeckungslücke als die drei fehlenden Satelliten und nur { "5.56" } Punkte als das Design; für die vier Raumfahrzeuge, die wirklich im Mondorbit sind, erreicht ein eigens gebauter Satz mit vier Satelliten { "4.86" } %, wo sie { "0" } % erreichen. Ein Test legt fest, dass die abgeglichene Zeile eine neu aufgebaute Konstellation ist und nicht die konfigurierte, umbenannt, so wie sie zuerst geschrieben war und was der Lauf dann meldete.

# text
seg-2e7e4dbbb7f6 = <b>Neun Fähigkeitskarten auf der öffentlichen Website, die { "22" } Zeilen der Verifikationsmatrix abdecken, die ohne Karte auf Produktebene ausgeliefert wurden.</b> Die Engine hatte eine Familie von Fähigkeiten hervorgebracht — die ARAIM-Prüfung gegen veröffentlichte Referenzvektoren der Working Group C, reale abgerufene lunare Konstellationsgeometrie, die lunare Verweigerungskontur mit einem gemessenen C/N₀-Band, der Schritt vom VLBI-Zeitplan zur Stationskovarianz, optische und HF-Übergabe mit Fehlerinjektion über Modalitäten hinweg, Echtzeit-Vorhersage der Erdorientierung gegenüber archiviertem Bulletin A, gemeinsame Nutzung der Apertur für Navigation gegenüber Kommunikation, INS/TRN-Koppelnavigation und die Abdeckung von Einheiten und Herkunft — jede mit einer Matrixzeile und einem mitgelieferten Szenario, und keine davon auf kshana.dev genannt. Die Abdeckung von Karten zu Zeilen steigt von { "72" } von { "168" } Zeilen auf { "94" }.

# text
# c1: web/app.js
# c2: tests/scenario_examples_doc_sync.rs
# c3: run
# c4: scenarios/
seg-3dc189224fe8 = <b>Acht Szenarien zum Katalog des Playgrounds hinzugefügt.</b> Die Schaltfläche Run einer Fähigkeitskarte erscheint nur, wenn auch <c1/> die Datei enthält; sechs Karten nannten ein Szenario, das sie nicht enthielt, sodass sie ohne Möglichkeit zum Ausführen dargestellt wurden — eine davon, das Datum aus realer Laserentfernungsmessung, war seit ihrer Auslieferung in diesem Zustand. <c2/> sichert die Invariante jetzt in beiden Hälften: das Ziel <c3/> einer Karte muss unter <c4/> mitgeliefert <em>und</em> vom Katalog angeboten sein. Gegen beide Fehlerarten per Mutation getestet.

# text
# c1: moonlight-service-volume
# c2: <scenario>.table.csv
seg-2d69334516e9 = <b><c1/> gibt seine Geometrie je Satellit als <c2/> aus</b>, wenn ein Exportstandort konfiguriert ist (G11). Es ist das größte Array, das das Crate veröffentlicht — { "2304" } Zeilen in der veröffentlichten gemeinsamen Tabelle für Kommunikation und Navigation — und es erreichte Verbraucher nur innerhalb von JSON, der Form, die die Kurve mit 57 Punkten eines Schwesterszenarios unter einer Spalte, die alle beanspruchte, auf { "23" } Punkte gekürzt hat. Eine Zeile je Link, die Zeilenzahl in der Kopfzeile, die Antennenspalten nur vorhanden, wenn eine Antenne konfiguriert war. Ein Lauf ohne Exportstandort ist bytegleich unverändert und schreibt keine Datei.

# text
seg-7958d26072f7 = Die SBOM beschreibt jetzt, was ausgeliefert wird: aus { "60" } Komponenten wurden { "66" }.

# text
# c1: scripts/gen-sbom.sh
# c2: sgp4
# c3: chrono
# c4: --features python
# c5: pyo3
# c6: pyo3-ffi
# c7: pyo3-macros
# c8: pyo3-macros-backend
# c9: pyo3-build-config
# c10: portable-atomic
# c11: target-lexicon
# c12: heck
# c13: python
# c14: wasm
# c15: expression
seg-219cd333b000 = <c1/> listete jedes Paket der Auflösung mit Standard-Features auf, einschließlich Dev-Abhängigkeiten. Das setzte <c2/> und <c3/> — Crates nur für Tests, in keinem Artefakt kompiliert — in die Stückliste und ließ die Kette <c4/> aus, die das PyPI-Wheel einbindet (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), die die Fremdfunktionsgrenze dieses Wheels ist. Das Skript durchläuft den Auflösungsgraphen jetzt vom Paket kshana aus nur über normale und Build-Kanten, über die Vereinigung der Feature-Mengen Default, <c13/> und <c14/> (das npm-Paket trägt dieselbe SBOM), für jede Zielplattform. Das festgeschriebene CycloneDX-Prüfurteil zur Schemaübereinstimmung wird über seinen festgeschriebenen Generator neu basiert: { "60" } → { "66" } Komponenten, { "53" } → { "60" } zusammengesetzte Lizenzausdrücke, und weiterhin null Schemafehler, sobald diese in die Standardform <c15/> gebracht sind.

# text
# c1: export_table_csv
# c2: <scenario>.table.csv
# c3: realtime-frame-eop
# c4: lunar-time-budget
# c5: lunar-jamming
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: table_csv
# c10: undefined
# c11: tests/golden/realtime-frame-eop.csv
# c12: RunOutput.write_csv
seg-23c98d31f749 = <b>Die CSV-Reproduzierbarkeitstabelle erreicht jede Eingangstür, nicht nur die CLI und das Python-Wheel.</b> Der MCP-Server erhält ein siebtes Werkzeug, <c1/>, das ein Szenario ausführt und die byte-stabile Tabelle liefert, die die CLI als <c2/> schreibt — oder einen Fehler, der die Arten nennt, die eine veröffentlichen (<c3/>, <c4/>, <c5/> und <c6/> nur, wenn <c7/> + <c8/> gesetzt sind). Das WebAssembly-Modul erhält <c9/>, das denselben Text oder <c10/> liefert. Der MCP-Round-Trip-Test und die Tests der Python-Bindung legen das gelieferte CSV jetzt Byte für Byte gegen <c11/> fest und legen fest, dass <c12/> die geschriebenen Bytes liefert und { "0" } ohne erzeugte Datei für eine Art ohne Tabelle. Jede Oberfläche, die die Anzahl der MCP-Werkzeuge nennt oder die Werkzeuge auflistet, sagt jetzt sieben.

# text
# c1: run_all
seg-86c3fed5e23a = <c1/> im WebAssembly-Modul: ein Engine-Lauf für jede Ausgabe.

# text
# c1: run
# c2: chart_svg
# c3: summary
# c4: table_csv
# c5: cislunar-arc-recovery
# c6: run_all
# c7: {json, svg, summary, csv}
seg-3f2677cd280b = <c1/>, <c2/>, <c3/> und <c4/> führen das Szenario jeweils von Grund auf aus, sodass der Playground pro Klick vier vollständige Läufe bezahlte — etwa { "12" } s statt { "3" } s für <c5/> in einem Browser. <c6/> liefert <c7/> aus einem Lauf, und der Playground verwendet es jetzt. Es stimmt Byte für Byte mit den vier einzelnen Aufrufen überein.

# text
# c1: gnss-ins
# c2: +C_b^n b_a
# c3: −C_b^n b_g
# c4: +C_b^n b_g
# c5: scenarios/gnss-ins.toml
seg-fa05c9ee0c6a = <b>REVISION: die Gyroskop-Bias-Kopplung des GNSS/INS-Filters hatte das falsche Vorzeichen, und die Ausfallzahlen von <c1/> ändern sich.</b> Das Extended-Kalman-Filter (EKF) im Fehlerzustand hält beide Trägheits-Bias als Residuen (wahr minus laufende Schätzung, durch Addition zurückgeführt). Die Beschleunigungsmesser-Spalte trieb den Geschwindigkeitsfehler mit <c2/>, aber die Gyroskop-Spalte trieb den Lagefehler mit <c3/>. Ein Rest-Gyroskop-Bias dreht die berechnete Lage tatsächlich um <c4/>, sodass jede Schätzung des Gyroskop-Bias in die falsche Richtung schob. Das Paket blieb nur stabil, weil sein Standard-Prior für den Gyroskop-Bias ({ "1e-4" } rad/s, 1-Sigma) eng genug war, um diese Zustände festzuhalten. Mit einem weiteren Prior divergierte das Filter, selbst wenn der wahre Gyroskop-Bias null war: aus { "93" } m fusioniertem Ausfallfehler wurden { "4.3" } km. Die veröffentlichten Zahlen für <c5/> ändern sich wie folgt:

# text
seg-47e22e713df6 = vorher (≤ { "0.27.2" })

# text
seg-5215a0a41b89 = nachher

# text
seg-f58aecc6864c = Kaltatom-IMU, fusionierter Ausfall-RMS

# text
seg-c4fbd933ddb2 = { "96.1" } m

# text
seg-002d765fca02 = { "1.9" } m

# text
seg-d14616d4ea1b = Kaltatom-IMU, Koppeln innerhalb der Spezifikation ({ "50" } m)

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-91645c14401b = { "60" } s (der ganze Ausfall)

# text
seg-f297a2652cf8 = taktische IMU, fusionierter Ausfall-RMS

# text
seg-0ac27c6d4206 = { "62.5" } m

# text
seg-eda895cc3b86 = { "3.1" } m

# text
seg-e0ab83f1d8d7 = taktische IMU, Koppeln innerhalb der Spezifikation ({ "50" } m)

# text
seg-5c526991a521 = { "37" } s

# text
# c1: tests/gnss_ins_sensor_fusion_reference.rs
# c2: closed_loop.rs
# c3: gnss-ins
seg-743060da5543 = Die Zahlen im freien Lauf ({ "130.7" } m und { "314.3" } m) ändern sich nicht; sie nutzten das Filter nie. Die frühere Lesart des Pakets, dass das fusionierte Koppeln durch eine Lageuntergrenze bei der Übergabe begrenzt ist und sich daher mit einem besseren Sensor nicht verbessert, war ein Artefakt dieses Fehlers und wird zurückgezogen. Bei konstanten, rauschfreien Bias lernt das Filter sie jetzt, solange GNSS verfügbar ist, sodass das fusionierte Koppeln ein bester Fall ist. Die externe Referenz filterpy (<c1/>) prüft nur die Messaktualisierungen, weshalb sie die Propagation nie sah. Zwei Tests prüfen das Vorzeichen jetzt direkt, und beide scheitern am alten. Der erste in <c2/> speist einen bekannten Rest-Gyroskop-Bias durch das Strapdown ein und verlangt, dass das Filter den resultierenden Lagefehler auf { "2" } % genau vorhersagt. Der zweite verlangt, dass ein weiter Prior einen Gyroskop-Bias von { "1e-3" } rad/s lernt und innerhalb von { "6" } m bleibt. Der plattformübergreifende Golden-Wert von <c3/> wird aus diesem Grund und keinem anderen neu festgeschrieben.

# text
# c1: scenarios/clock-holdover.toml
# c2: TypeError: fetch failed
# c3: init()
# c4: fetch
seg-f764678e3376 = <b>Jede Kurzanleitung der Registries läuft jetzt wie geschrieben auf einer sauberen Maschine.</b> Vor dieser Änderung gemessen, lasen die Beispiele für crates.io und PyPI (Python Package Index) <c1/>, das eine Registry-Installation nicht hat, und das npm-Beispiel stürzte unter Node.js mit <c2/> ab, weil das <c3/> des Pakets seine WebAssembly-Binärdatei per Abruf lädt und das <c4/> von Node keine lokale Datei lesen kann. Jetzt:

# text
# c1: README.crates.md
# c2: README.pypi.md
# c3: README.npm.md
# c4: main
# c5: # Ok::<…>
# c6: tests/readme_code_fences_doc_sync.rs
seg-e77a540d2f90 = <c1/> und <c2/> tragen dieses Szenario inline, wie es <c3/> schon tat. Der Rust-Codeblock ist ein ganzes Programm mit eigenem <c4/>, weil die von rustdoc verborgene Zeile <c5/>, mit der er endete, auf crates.io angezeigt wird und beim Einfügen nicht kompiliert. <c6/> kompiliert ihn weiterhin Byte für Byte und lehnt jetzt außerdem eine verborgene Zeile im Codeblock ab.

# text
# c1: README.npm.md
# c2: initSync
# c3: initSync
seg-ea5204ced0d2 = <c1/> trennt den Browser von Node.js und gibt ein Node-Rezept, das die Binärdatei von der Festplatte liest und an <c2/> übergibt. Der Doc-Sync-Test akzeptiert <c3/> als den Loader, den wasm-bindgen erzeugt.

# text
# c1: 5ba83a232b94
seg-ebb763695c59 = Alle drei betten das Szenario mit ungekürzten Herkunftszeichenfolgen ein, sodass der Szenario-Hash auf jeder Oberfläche <c1/> ist. Das npm-Beispiel kürzte sie früher, was ihm einen anderen Hash als der CLI gab.

# text
# c1: cargo new
# c2: wasm-pack --target web
seg-dc52363432f8 = Aus lokalen Builds dieses Baums reproduziert: ein frisches Projekt mit <c1/> und einer Pfadabhängigkeit auf das gepackte Crate baute und führte das Rust-Beispiel aus; ein mit maturin aus den gepackten Quellen gebautes Wheel, in eine neue virtuelle Umgebung installiert, führte das Python-Beispiel aus; und das Paket <c2/>, gepackt und mit npm installiert, führte das Node-Rezept aus. Alle drei gaben dieselbe Zusammenfassungszeile aus.

# text
# c1: cargo run -- <scenario.toml>
seg-07e465a602f1 = <c1/> funktioniert aus einem Clone.

# text
# c1: Cargo.toml
# c2: default-run = "kshana"
# c3: cargo run --
seg-77ce31300b69 = <c1/> setzt <c2/>. Ohne das lehnte cargo mit "could not determine which binary to run" ab, was jede Zeile <c3/> in der Dokumentation traf.

# text
# c1: kshana example
# c2: --help
# c3: --version
# c4: --validate
# c5: ok:
# c6: tests/cli_first_run.rs
seg-2d516597b5f5 = <b>Die Fehlermeldungen der CLI in der ersten Minute sagen, was als Nächstes zu tun ist.</b> Ein nicht vorhandener Szenariopfad fügt jetzt einen Hinweis auf <c1/> hinzu, und ein zweites Positionsargument gibt auch den Verwendungstext aus, statt nur das Argument zu nennen. <c2/>, <c3/>, der Fehler bei einer unbekannten Option (Exit-Code { "2" }) und die einzeilige Meldung <c5/> von <c4/> bei Erfolg waren bereits in main. <c6/> deckt jetzt alle ab, da zuvor kein Test die Binärdatei für eines davon ausführte.

# text
# c1: list_kinds()
# c2: scenario_kinds()
# c3: kshana.pyi
# c4: docs/PYTHON_API.md
# c5: README.pypi.md
# c6: scenario_kinds()
seg-fdd9a27ccfc4 = <b><c1/> in Python ist als Rückgabe einer JSON-Zeichenfolge dokumentiert, nicht einer Liste.</b> Es liefert dieselben Metadaten wie <c2/>, serialisiert, sodass das Iterieren Zeichen durchläuft. Es behält seine Rückgabe als Zeichenfolge, damit bestehende Aufrufer nicht brechen. <c3/>, der Doc-Kommentar der Bindung, <c4/> und <c5/> sagen das jetzt und verweisen auf <c6/>.

# text
seg-f0e0c8c12f8a = <b>Die drei Registry-READMEs schreiben jede Abkürzung bei der ersten Verwendung aus.</b> PNT ist jetzt im Slogan ausgeschrieben, wo es zuerst vorkommt, und CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL und API sind in den Dateien ausgeschrieben, die sie verwenden. Die Überschrift der Tabelle zur unabhängigen Referenz sagt nicht mehr "CI-gated", bevor CI definiert ist.

# text
seg-554c5b0c9c60 = Eine veröffentlichte Zahl korrigiert: die ARAIM-Verfügbarkeit mit zwei Konstellationen auf den mitgelieferten GPS- + Galileo-TLEs von Celestrak.

# text
# c1: docs/CAPABILITY.md
# c2: tests/araim_dual_real_data.rs
# c3: parse_propagators
# c4: parse_tle
# c5: araim_dual_constellation_availability
# c6: docs/CAPABILITY.md
# c7: docs/REAL_TLE_GUIDE.md
seg-1f023a822c91 = <c1/> gab an, dass das Hinzunehmen von Galileo die Verfügbarkeit bei einem VAL von { "12" } m von { "0.21" } auf { "0.67" } hebt und dass der gegen Konstellationsfehler robuste Modus mit nur zwei Konstellationen begrenzt ist. Das kam daher, dass <c2/> jeden Satelliten von seiner eigenen TLE-Epoche aus propagierte (<c3/> lässt die Epoche weg) und die Epochen in diesen Dateien { "70.6" } h (GPS) und { "335.7" } h (Galileo) überspannen, sodass die Satelliten zu untereinander unstimmigen Zeiten standen. Der Test behält jetzt jede Epoche (<c4/>) und wertet jeden Satelliten zu einem gemeinsamen UTC-Zeitpunkt aus, der letzten TLE-Epoche im Satz (2026-06-07T07:{ "21" }:{ "04" }). Die gemessene Verfügbarkeit über dasselbe Gitter von { "24" } h mit 289 Stichproben wird zu nur GPS { "0.993" } (war { "0.208" }), gepoolt { "1.000" } (war { "0.671" }) und gegen Konstellationsfehler robust mit zwei Konstellationen { "0.990" } (war { "0.031" }); an der Grenze APV-I geht der Modus mit zwei Konstellationen von { "0.180" } auf { "1.000" }. Die Schlussfolgerung kehrt sich um: an einem konsistenten Himmel tragen zwei Konstellationen die Konstellationsfehler-Hypothese bei einem VAL von { "12" } m. Dieselben Zahlen ergeben sich mit der frühesten TLE-Epoche als Referenz. Eine Selbstprüfung im Test legt seine Verfügbarkeitsschleife Stichprobe für Stichprobe auf <c5/> fest, sodass der einzige Unterschied die Zeitausrichtung ist. <c6/> und <c7/> §{ "3" } tragen die neuen Zahlen; der Eintrag { "0.13.0" } unten bleibt wie veröffentlicht.

# text
# c1: docs/CAPABILITY.md
# c2: docs/STANDARDS.md
# c3: ROADMAP.md
seg-3173a2e03521 = <b>Die öffentlichen Oberflächen bewerben RINEX { "4" } nicht mehr als validiert.</b> Die Engine lehnt eine RINEX-{ "4" }-Navigationsdatei jetzt namentlich ab, statt sie falsch zu dekodieren, aber das Standardsraster zeigte weiterhin eine Karte "RINEX { "3" } / { "4" }" mit einem Etikett <em>validiert</em>, gebunden an die RINEX-3-Belege des Navigationsparsers. Die Karte heißt jetzt "RINEX { "3" }", und die README, <c1/>, <c2/>, <c3/> und die Zusammenfassung der Fähigkeiten sagen, was zutrifft: RINEX-3.0x-Beobachtungsdateien werden geparst, das Beobachtungslayout { "4.00" } soll es ebenfalls, aber es wurde noch keine Datei { "4.00" } durch den Code gelesen, und RINEX-{ "4" }-Navigationsdateien werden abgelehnt.

# text
# c1: --validate
seg-c9bb514acb7a = <b><c1/> sagt, wann "ok" bedeutet, dass nichts zu prüfen war.</b> Etwa zwei Drittel des Katalogs veröffentlichen kein Pflichtfeld — diese Pakete führen ihre Referenzkonfiguration aus einem leeren Rumpf aus —, sodass die Prüfung für sie nur "ok" ausgeben konnte, mit denselben Worten wie nach der Prüfung von sechs Feldern. Die Erfolgszeile nennt jetzt die Zahl der als vorhanden gefundenen Pflichtfelder oder dass die Art keine verlangt.

# text
# c1: scripts/gate.sh
# c2: REPEAT
# c3: TEST_THREADS
# c4: REPEAT=no
seg-06b324d00285 = <b><c1/> lehnt ein nichtnumerisches <c2/> oder <c3/> ab.</b> Unter bash { "3.2" } ließ <c4/> den numerischen Vergleich mit einem Fehler enden und falsch auswerten, sodass das Gate "repeatability loop SKIPPED (REPEAT={ "0" })" für einen Wert meldete, der nicht { "0" } war, und trotzdem eine Quittung schrieb. Beide Stellschrauben beenden jetzt mit Exit-Code { "2" }, sofern sie keine einfachen ganzen Zahlen sind.

# text
seg-09d04ffdd9ac = Die MSRV wird überall, wo ein Mensch sie liest, als { "1.85" } angegeben.

# text
# c1: Cargo.toml
# c2: codemeta.json
seg-dafc23725315 = <c1/> wechselte in der letzten Version auf { "1.85" }; das README-Badge, der Installations- und Fehlerbehebungstext, <c2/> und die eigene Begründung des MCP-Crates sagten noch { "1.75" }.

# text
# c1: RunOutput.__repr__
# c2: len()
seg-c2fa8a31058c = <b><c1/> in der Python-Bindung meldet Bytes, nicht "chars".</b> Es gab <c2/> von UTF-8-Zeichenfolgen aus, was eine Bytezahl ist: { "710" } "chars" für eine Tabelle mit 708 Zeichen.

# text
# c1: --study --study-name
seg-6b4452a4e340 = Die README dokumentiert <c1/> nicht mehr zusammen.

# text
# c1: --study-name
# c2: --study
seg-47d83e4d847b = <c1/> ist ein Schalter für ein einzelnes Szenario und wird mit <c2/> ignoriert (die Binärdatei warnt). Die zwei Copy-Paste-Beispiele in README.md und README.crates.md zeigen jetzt den Studienbefehl allein.

# text
seg-5ed7f8330b2d = <b>Der Evidenzabschnitt der Website zur Uhrenstabilität nennt beide beobachteten Toleranzen.</b> Die Serie 5071A Caesium wird bis ≤ { "3e-5" } reproduziert und PHASE.DAT bis ≤ { "5e-5" }; der Absatz nannte { "3e-5" } für beide.

# text
seg-8bba7f1171f3 = Zwei Ausgabedateien der Engine werden nicht mehr nachverfolgt.

# text
# c1: scenarios/quantum-pnt-demonstrator.study.{json,html}
# c2: *.study.json
# c3: *.study.html
seg-ea9bf1d14371 = <c1/> wurden von Engine { "0.20.0" } mit jeder leeren Kennzahl erzeugt, und der eigene Studienbefehl der README überschrieb sie, was den Baum verschmutzte und das Push-Gate blockierte. <c2/> / <c3/> werden jetzt wie die anderen vier Engine-Ausgaben ignoriert.

# text
# c1: seed
# c2: u64
seg-77ce9b90859d = <b>Ein Seed-Sweep im Playground scheitert nicht mehr bei jedem Lauf.</b> Der Sweep durchlief den ganzzahligen Regler <c1/> linear ({ "1" }, { "10.9" }, { "20.8" }, …), und die Engine, die ihn als <c2/> las, lehnte jeden gebrochenen Wert ab. Ganzzahlige Regler durchlaufen jetzt verschiedene ganze Zahlen.

# text
# c1: realtime-frame-eop
# c2: engine_version
# c3: scenario_hash
# c4: kshana-csv.csv
seg-e1b1e1360eb9 = <b>Jeder Download aus dem Playground nennt, welche Engine und welche Eingabe ihn erzeugt hat.</b> Einige Arten (z. B. <c1/>) geben weder <c2/> noch <c3/> aus, sodass ihre Downloads schlicht <c4/> hießen. Der Name greift jetzt auf die Version der geladenen Engine und einen 12-stelligen hexadezimalen FNV-1a-64-Fingerabdruck des Szenariotexts zurück.

# text
# c1: cargo install kshana
# c2: docs/
# c3: src/bin/
# c4: crossover_study
# c5: gen_validation_artifacts
# c6: validation_report
# c7: kshana
# c8: cargo run --bin <name>
# c9: validation_report
# c10: cargo package
# c11: cargo install --path
# c12: kshana
seg-0181e86b576a = <b>Das veröffentlichte Crate ist weniger als halb so groß wie zuvor, und <c1/> baut nur die CLI.</b> Das Paket enthielt früher die Veröffentlichungen, ihre Einreichungspakete, die Artefakte der Abbildungen, die Notebooks, <c2/>, die Wartungsskripte und die Beispielprogramme. Nichts davon wird von der Bibliothek oder der CLI kompiliert. Es enthielt auch die drei internen Generatoren unter <c3/> (<c4/>, <c5/>, <c6/>), sodass eine Registry-Installation vier ausführbare Dateien kompilierte und installierte, von denen drei nur innerhalb eines Checkouts nützlich sind. Diese Bäume und die drei Generatorquellen sind jetzt ausgeschlossen. Cargo listet die Binärdateien eines Pakets aus den Dateien auf, die es enthält, sodass das veröffentlichte Manifest nur <c7/> nennt. In einem Clone werden die Generatoren weiterhin automatisch gefunden, sodass <c8/> und der Release-Job, der <c9/> ausführt, unverändert sind. Gemessen mit <c10/>: { "763" } Dateien, { "16.7" } MiB, { "6.8" } MiB komprimiert vorher; { "591" } Dateien, { "10.5" } MiB, { "3.0" } MiB komprimiert nachher. Sein Verifikations-Build, der nur die gepackten Dateien kompiliert, besteht. <c11/> auf dem gepackten Crate installierte eine ausführbare Datei, <c12/>.

# text
# c1: p95 0.0ns
# c2: security 0.000
seg-567c7059286f = <b>Ausgabe, die ein Zeitgebungsingenieur lesen kann: kein <c1/> mehr, kein <c2/> mehr ohne Angriff und Zahlen der Standorte, die zu den READMEs passen.</b> Das ist eine Revision der Anzeige. Keine veröffentlichte Zahl ändert sich; die JSON-Werte sind identisch, was die Golden-Hashes oben belegen.

# text
# c1: 0.0ns
# c2: p95 1.20e-4ns
# c3: 0.0
# c4: 0.000
seg-849fa9a29f07 = Die einzeilige Zusammenfassung gab den Zeitfehler im 95. Perzentil (p95) der optischen Uhr als <c1/> aus, während die Tabelle daneben { "1.20e-4" } ns zeigte. Eine Zeitzahl ungleich null, die für eine Dezimalstelle zu klein ist, wird jetzt mit drei signifikanten Stellen ausgegeben (<c2/>); eine exakte Null wird weiterhin als <c3/> ausgegeben. Der HTML-Bericht (HyperText Markup Language), die Vergleichstabelle der Studie und der herunterladbare Bericht des Playgrounds verwenden dieselbe Regel, sodass auch keine Zahl ungleich null als <c4/> ausgegeben wird.

# text
# c1: security
# c2: clock
# c3: orbit
# c4: hybrid
# c5: fusion
# c6: security n/a (no attack)
# c7: 0.000
# c8: fom.security
# c9: applicable: false
# c10: figure_tiers
# c11: spoof
seg-c44323babd1e = <c1/> ist eine analytische Schranke der Erkennbarkeit von Spoofing, die nur gegenüber einem konfigurierten Angriff etwas bedeutet. Die Arten <c2/>, <c3/>, <c4/> und <c5/> konfigurieren keinen, sodass ihre Zusammenfassung jetzt <c6/> ausgibt statt einer Zahl wie <c7/>, die wie eine verfehlte Erkennung gelesen wird. Der Wert bleibt in <c8/>, gekennzeichnet mit <c9/> und dem Grund in <c10/>, und die Berichtstabellen zeigen "not applicable". Die Art <c11/> bewertet die Erkennung weiterhin.

# text
# c1: tests/registry_golden.rs
# c2: golden_clock
# c3: security
# c4: golden_orbit
# c5: security
# c6: tests/tutorials.rs
seg-f54d5ffb7dff = Zwei Festschreibungen der Zusammenfassung in <c1/> verschoben sich aus genau diesen zwei Gründen und keinem anderen: <c2/> (das Quanten-p95 und beide Werte <c3/>) und <c4/> (beide Werte <c5/>; seine p95-Werte sind genau null). Ihre Hashes des ganzen Dokuments verschoben sich nicht. Die erwarteten Zusammenfassungen in der README, den drei Tutorials und ihren Lehrszenarien sind entsprechend aktualisiert, und <c6/> prüft die Lehrkopien gegen die Engine.

# text
seg-e8e012376fa3 = Die geführte Tour des Playgrounds öffnet sich beim ersten Laden nicht mehr. Ihr Modal fing die ersten Klicks ab, und ihr Spotlight scrollte die Seite von dort weg, wo der Besucher gelandet war. Sie startet über die Schaltfläche "Take the 60-second tour" oder die schwebende Schaltfläche Tour.

# text
seg-4d60d4ea4d7d = Die Seite scrollt auf einem Telefon nicht mehr seitwärts. Bei { "390" } px kamen die Markenzeile und die GitHub-Schaltfläche auf etwa { "410" } px Inhalt, ein Überlauf von { "4" } px; die Kopfzeile passt jetzt ab { "320" } px aufwärts, und die Tabelle der Kennzahlen scrollt in ihrem eigenen Feld, statt die Seite zu verbreitern.

# text
# c1: web/data/verification-matrix.json
# c2: web/counts.test.mjs
# c3: tests/web_validation_counts_doc_sync.rs
seg-f6ec6a64071d = Der Fähigkeitsexplorer führte mit seiner eigenen Kartenzahl ("{ "46" } capability cards … { "17" } backed by an external oracle") neben READMEs, die { "64" } von { "168" } sagen. Er führt jetzt mit der Verifikationsmatrix, gelesen aus der erzeugten <c1/> (derselben Matrix, an die die Zahlen der README festgeschrieben sind), und nennt die Karten danach als die Zusammenfassungsschicht, die sie sind. <c2/>, ein neuer Schritt im Workflow der kontinuierlichen Integration (CI), prüft die Arithmetik und gleicht README.md und die Beschreibungen der Seite gegeneinander ab; <c3/> legt die Verdrahtung von der Rust-Seite fest.

# text
# c1: docs/CAPABILITY.md
# c2: src/verification.rs
# c3: oem
seg-7bc48692be0b = <b><c1/> untertreibt nicht mehr.</b> Die Zeile zu erdfesten Bezugssystemen sagte "none", während die Matrix GCRS→ITRS mit VALIDATED einstuft; sie sagt jetzt "full", und die Zeile zu den Kernbezugssystemen verzeichnet die Gegenprüfung mit ANISE als geliefert. Der geführte Modus war als Fahrplan aufgeführt; der Playground hat geführte Schieberegler und eine geführte Tour ausgeliefert. Ein Abgleich mit <c2/> korrigierte fünf weitere Zeilen, die ihren Validierungen vorausgingen: das Cowell-Kräftemodell und die Batch-/sequentielle Bahnbestimmung gegenüber Orekit { "12.2" }, Bodenstationsüberflüge gegenüber dem Elevationsdetektor von Orekit, den DOP-Kern gegenüber gnss_lib_py und den OEM-Import gegenüber dem unabhängigen Parser <c3/>; die Zeile zu Verifikation und Validierung nennt jetzt die Schutzvorrichtungen, die prüfen, dass jeder zitierte Test existiert.

# text
seg-9d144df304ca = Das Glossar erklärt, was eine Ergebnisdatei sagt.

# text
# c1: docs/GLOSSARY.md
# c2: sigma_y
# c3: q_wf
seg-eed672b2f8fd = <c1/> erhält Einträge in einfacher Sprache für die Ausgabebegriffe (Holdover, p95, Integrität, den Sicherheitswert, PDOP, <c2/>, <c3/>), die Begriffe der Telekom-Zeitgebung (Zeitfehler, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) und die drei Evidenzstufen (VALIDATED, MODELLED, PARTNER).

# text
# c1: docs/
# c2: docs/VERIFICATION-MATRIX.md
# c3: docs/MODELLED-RATIONALE.md
# c4: docs/SCENARIOS.md
# c5: src/verification.rs
# c6: api::list_scenario_kinds()
seg-1a4f9d5eef96 = <b>Abkürzungen werden bei der ersten Verwendung in jedem von Hand geschriebenen öffentlichen Dokument ausgeschrieben.</b> Die README und { "24" } Dateien unter <c1/> hatten mehrere hundert Abkürzungen, die vor oder ohne ihre Erläuterung verwendet wurden; jede ist jetzt dort ausgeschrieben, wo sie in der Datei zuerst erscheint. Die drei erzeugten Dateien (<c2/>, <c3/>, <c4/>) bleiben unberührt: sie werden aus <c5/> und <c6/> geschrieben, ihr Wortlaut muss sich also an der Quelle ändern.

# text
seg-2889ce118381 = Die Zeilenabdeckung hat eine maßgebliche Messung.

# text
# c1: docs/COVERAGE.md
# c2: coverage
# c3: b1d350d
# c4: tests/coverage_figure_doc_sync.rs
seg-9c4684c0a4ef = <c1/> verzeichnet { "95.63" } % ({ "37,697" } von { "39,419" } Zeilen) aus dem CI-Job <c2/> bei <c3/>, und <c4/> legt die fünf öffentlichen Oberflächen mit "~{ "96" }%" darauf fest — die eine Schlagzeilenzahl, die von Hand gepflegt wurde und sich schon einmal unbemerkt verschoben hatte.

# text
seg-ebd36b7291df = Neue Doc-Sync-Gates für Oberflächen, die niemand las.

# text
# c1: tests/readme_code_fences_doc_sync.rs
# c2: import { … } from "kshana"
# c3: tests/security_md_doc_sync.rs
# c4: src/lib.rs
# c5: #![forbid(unsafe_code)]
# c6: tests/no_overclaims.rs
# c7: web/README.md
# c8: proof
seg-3dd44fc69a28 = <c1/> prüft jedes <c2/> in einem JavaScript-Codeblock gegen die WebAssembly-Exporte und legt das Rust-Beispiel in README.crates.md Byte für Byte auf eine Kopie fest, die die Testbinärdatei kompiliert. <c3/> schlägt fehl, wenn <c4/> das <c5/> verliert oder SECURITY.md es nicht mehr nennt. <c6/> durchsucht jetzt auch <c7/> und die drei Registry-READMEs, und jeder Standard auf der Website muss sein <c8/> ausdrücklich angeben.

# text
seg-a506d14f3447 = Die zwei Uhrenprüfungen an realer Hardware laufen auf einem Runner.

# text
# c1: realdata-clock.yml
# c2: KSHANA_REQUIRE_REALDATA=1
seg-c7f8b8627137 = <c1/> (monatlich und auf Anforderung) ruft die Serien 5071A und PHASE.DAT ab und führt beide Tests mit <c2/> aus, sodass eine fehlende Eingabe scheitert, statt übersprungen zu werden. Beide Abrufskripte sind auf einen allantools-Commit festgelegt und prüfen SHA-256.

# text
# c1: mypy.stubtest
# c2: csv
# c3: write_csv
seg-3b4a7fee3cd0 = <b>Der Python-Typ-Stub wird gegen das gebaute Wheel geprüft</b> (<c1/> im Bindungs-Job), wodurch <c2/>/<c3/> ohne Stub ausgeliefert wurde.

# text
seg-24c2ccf3634a = <b>Das Glossar definiert URE, EOP, FoM, CTI und TIB</b>, die die README und das Register nackt verwendeten.

# text
# c1: required_fields
# c2: ephemeris
# c3: tle|orbit+epoch
# c4: kind = "ephemeris"
# c5: --validate
# c6: quantum-trade
# c7: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c8: |
# c9: +
# c10: --validate
# c11: lunar-joint-od-clock
# c12: pvt
# c13: earth-gnss-lunar
# c14: docs/SCENARIOS.md
# c15: kind
# c16: clock
# c17: tests/required_fields_are_true.rs
seg-ae044195cd47 = <b>Der veröffentlichte Feldvertrag jeder Art ist jetzt wahr, und ein Test hält ihn dort.</b> Fünf der { "61" } Arten änderten sich. Arten mit nicht leerem <c1/> gehen von { "21" } auf { "22" }: <c2/> verlangt jetzt <c3/> (ein nacktes <c4/> bestand früher <c5/> und ließ dann den Lauf scheitern), und <c6/> fügt <c7/> hinzu, was sein Lauf bereits verlangte. Ein verlangter Eintrag darf <c8/> (eines davon) und <c9/> (alle zusammen) verwenden; <c10/> versteht beides. <c11/>, <c12/> und <c13/> veröffentlichen { "9" } echte optionale Felder, die sie ausgelassen hatten. <c14/> sagt jetzt, dass <c15/> für jede Art außer <c16/> verlangt wird. <c17/> prüft jede Art gegen ihr ausgeliefertes Szenario: das Entfernen jedes verlangten Eintrags muss den Lauf scheitern lassen, und ein Dokument, das nur die verlangten Felder enthält, muss laufen.

# text
seg-09ba716f3e97 = Die Hinweise im JetBrains Marketplace sind abgesichert.

# text
# c1: scripts/check-version-sync.sh
# c2: <change-notes>
# c3: plugin.xml
seg-938ff48e7a2d = <c1/> scheitert jetzt, sofern nicht der neueste Eintrag <c2/> in <c3/> die auszuliefernde Version nennt; sieben veröffentlichte Versionen hatten die Hinweise von { "0.22.0" } unverändert ausgeliefert.

# text
seg-3d38550854e0 = Die Abdeckungszahl des technischen Berichts ist die gemessene.

# text
# c1: paper/kshana-technical-report.md
# c2: docs/COVERAGE.md
seg-bd312cd26746 = <c1/> sagte "near { "97" } %"; er sagt jetzt nahe { "96" } % ({ "95.63" } % gemessen, <c2/>) und ist die sechste Oberfläche, die der Abdeckungstest festlegt.

# text
# c1: web/engine.test.mjs
seg-934680d402da = <b>Der Engine-Client außerhalb des Hauptthreads wird getestet</b> (<c1/>, in CI): Dispatch-Allowlist, Abbruch und Neustart, die drei Ausweichrouten im Hauptthread und Absturzwiederherstellung, gegen einen falschen Worker.

# text
# c1: release.yml
# c2: docs/RELEASING.md
seg-fd5f9a8a4f43 = <b>Nichts wird veröffentlicht, bis der getaggte Commit seine Tests bestanden hat, und eine Version ist nicht fertig, bis jede Registry sie ausliefert.</b> Die Reihenfolge ist jetzt Tag, Verifikation, Veröffentlichung, Parität, Website, in einem Lauf von <c1/> (<a1><c2/></a1>).

# text
seg-745b11c8ed74 = Die Veröffentlichung wartet auf das Urteil.

# text
# c1: publish.yml
# c2: mcp-publish.yml
# c3: jetbrains-plugin.yml
# c4: release.yml
# c5: needs: verify
# c6: verify
# c7: scripts/check-release-verdict.sh
# c8: verify
seg-e66c890cf6c0 = <c1/>, <c2/> und <c3/> starten nicht mehr beim Push des Tags; <c4/> ruft sie aus Jobs auf, die <c5/> haben. Zuvor liefen sie ihm davon: bei { "v0.27.2" } hatten crates.io, npm und der Python Package Index (PyPI) alle innerhalb von { "4.5" } Minuten nach dem Tag veröffentlicht, und <c6/> kam { "84" } Minuten danach zurück; bei { "v0.27.0" } veröffentlichten npm und PyPI, während der Job für crates.io scheiterte. Ein manueller Wiederholungsversuch auf einem Tag wird vom neuen <c7/> angehalten, das ein grünes <c8/> für genau diesen Commit aus der Actions-Oberfläche verlangt und bei allem anderen geschlossen scheitert.

# text
seg-3800247c81f2 = <em>Alles wird gebaut, bevor irgendetwas hochgeladen wird</em>, und crates.io, dessen Paketierungsschritt der war, der mitten in der Veröffentlichung scheiterte, veröffentlicht zuerst.

# text
seg-6929a7608da7 = <em>Ein fehlendes Registry-Token lässt den Job scheitern</em>, statt den Upload zu überspringen und Erfolg zu melden.

# text
seg-460811602293 = Eine Paritätsprüfung nach der Veröffentlichung.

# text
# c1: scripts/check_channel_parity.py
# c2: kshana
# c3: kshana-mcp
seg-86eb0fab2f7c = <c1/> fragt crates.io (<c2/> und <c3/>), npm, PyPI (die Quelldistribution und alle sechs Plattform-Wheels) und ghcr.io ab, bis jede die Version ausliefert, oder lässt den Lauf scheitern; docs.rs und die Registry des Model Context Protocol (MCP) werden gemeldet, sind aber nicht erforderlich. Auf vergangene Versionen angewandt, findet es { "0.22.0" } bei npm und PyPI fehlend, { "0.23.0" } bei PyPI und { "0.27.0" } bei crates.io.

# text
# c1: kshana-aarch64-apple-darwin
# c2: kshana
# c3: SHA256SUMS
# c4: verify-release
seg-79578a00fd78 = <em>Vorgebaute Befehlszeilen-Binärdateien für macOS (Apple Silicon und Intel) und Windows x86-64</em>, benannt nach Ziel (<c1/> und so weiter), neben dem Linux-<c2/>, dessen Name unverändert ist. Eine Datei <c3/> deckt jedes Asset ab, und <c4/> prüft sie und führt die macOS- und Windows-Binärdateien auf ihren eigenen Systemen aus.

# text
# c1: main
# c2: main
# c3: pages.yml
seg-3e1f5afa9f2a = <em>kshana.dev zeigt eine Version, nicht <c1/>.</em> Es wurde früher bei jedem Push auf <c2/> neu bereitgestellt, während seine Seiten die letzte Version nannten. <c3/> baut jetzt nur einen Release-Tag: die Version stößt es an, sobald jeder Kanal die Version ausliefert, und ein manueller Aufruf stellt die neueste Version (oder eine benannte) neu bereit.

# text
seg-43da8f3f171e = Eine Quelle für Wheels.

# text
# c1: publish.yml
# c2: wheels.yml
seg-b911ac65e231 = Die von Hand kopierte Matrix mit sechs Zielen in <c1/> ist weg; es ruft <c2/> auf, sodass das Tag-Gate von auditwheel und die Prüfung der Byte-Reproduzierbarkeit jetzt die Wheels bewerten, die PyPI erhält, und ein Fehler in einem von beiden die Version stoppt.

# text
# c1: publish.yml
# c2: pages.yml
# c3: @stable
# c4: rust-toolchain.toml
# c5: scripts/check-toolchain.sh
seg-194c4b019a4c = <em>Festgelegte Build-Werkzeuge.</em> Jeder Workflow fordert Rust { "1.93.0" } an (der Job msrv seine eigene Version); <c1/> und <c2/> hatten <c3/> angefordert, und das Protokoll von { "v0.27.2" } zeigt, dass rustup { "1.98.1" } installierte und dann nur deshalb mit { "1.93.0" } kompilierte, weil <c4/> Vorrang hat. wasm-pack ist auf { "0.13.1" } festgelegt (die Version, die { "v0.27.2" } baute und die das nicht festgelegte Installationsskript wählte), mit einer Prüfsummenprüfung, und mcp-publisher auf { "1.8.1" } mit seinem veröffentlichten SHA-256. <c5/> scheitert jetzt, wenn ein Workflow einen anderen Compiler anfordert oder ein heruntergeladenes Skript in eine Shell leitet. Kein Verifikationsjob, keine Golden-Festschreibung und kein lokales Gate-Skript wurde entfernt oder gelockert.

# text
# c1: dtolnay/rust-toolchain
seg-9e2a7376367e = <b>Jede GitHub Action eines Drittanbieters ist per Commit-SHA festgelegt</b> — { "93" } Verweise in { "15" } Workflows, { "92" } davon neu —, wobei der Tag als nachgestellter Kommentar bleibt, damit Dependabot ihn aktualisiert. Die Ausnahme ist <c1/>, dessen Tag der Toolchain-Wähler ist.

# text
# c1: mcp/kshana-mcp
seg-6afb4a8770b0 = <b>Die Basisschichten des Images des MCP-Servers sind per Multi-Arch-Digest festgelegt</b>, und Dependabot beobachtet jetzt das Dockerfile von <c1/>, sodass die OS-Schichten weiterhin Sicherheitsupdates erhalten — über einen geprüften PR.

# text
seg-4ea8b158b408 = Die Prüfung Tag gegen Manifest läuft in den zwei Veröffentlichungs-Workflows, die die Version des Tags ausliefern.

# text
# c1: mcp-publish.yml
# c2: jetbrains-plugin.yml
# c3: publish.yml
# c4: scripts/check-version-sync.sh
seg-4b77764e955d = <c1/> (ghcr-Image, MCP-Registry) und <c2/> (Marketplace) laufen <c3/> davon, statt auf es zu warten, sodass ein falsch geschnittener Tag nur in einem Geschwister abgesichert war. Beide führen jetzt vor dem Bauen <c4/> aus.

# text
# c1: rmcp
# c2: rmcp
# c3: rmcp
# c4: kshana-mcp
# c5: rust-version = "1.88"
# c6: kshana
# c7: Content
# c8: ContentBlock
seg-bf90c4063843 = <b>Vier Advisories, die Dependabot an dem Tag meldete, an dem seine Alarme eingeschaltet wurden, sind behoben.</b> Der MCP-Server wechselt von <c1/> { "1.7" } auf { "2.2" }: drei Advisories gegen <c2/> < { "2.1" } (ein Leck in der Sitzungstabelle bei Streamable HTTP, fehlende OAuth-Validierung geschützter Ressourcen, benutzerdefinierte Header, die einer herkunftsübergreifenden Weiterleitung folgen) — hier keines erreichbar, da der Server nur stdio spricht, aber ein veröffentlichtes Crate sollte kein verwundbares SDK festlegen. Die Makros von <c3/> { "2" } brauchen Rust { "1.88" }, daher deklariert jetzt <c4/> allein <c5/>; die Bibliothek <c6/> bleibt bei { "1.85" }. Die eine API-Änderung (<c7/> → <c8/>) ist angewandt, und die Round-Trip-Tests bestehen. Die SonarQube-Scan-Action wechselt von v5 auf v6, was ein Advisory zur Argument-Injektion behebt (≥ { "4.0" }, < { "6.0" }).

# text
# c1: navsignal::code_tests
# c2: integrity::tpl_scalar::tests
# c3: api::tests::tracking_loop_kind_round_trips_through_the_dispatch
# c4: .rs
seg-2652aaad177e = <b>Jedes Rust-Element, das eine Zeile der Verifikationsmatrix zitiert, wird jetzt gegen das Crate aufgelöst.</b> Die bestehende Schutzvorrichtung prüfte die Zitate in Form von Dateipfaden; { "63" } der { "164" } Nicht-Partner-Zeilen nennen ihre Evidenz stattdessen als Element im Crate — <c1/>, <c2/>, <c3/> — und ein Token ohne Endung <c4/> war für einen Pfad-Scanner unsichtbar. Diese Zeilen hätten ein umbenanntes Modul, ein geleertes Testmodul oder eine nie existierende Funktion nennen können, und jedes Gate wäre grün geblieben.

# text
# c1: tests/verification_rows_name_a_test_that_exists.rs
# c2: #[test]
# c3: mod tests
# c4: #[test]
seg-01eee5115e3f = <c1/> löst alle { "339" } solchen Zitate durch den Modulbaum auf, verlangt, dass jede Nicht-Partner-Zeile mindestens einen Test nennt, der tatsächlich <c2/> trägt, und verlangt, dass Partner-Zeilen keinen nennen. Vier Mutationen dienten zu seiner Bewertung: ein zitiertes Modul umbenennen, das einzige Testzitat einer Zeile auf eine Nicht-Test-Funktion richten, das echte <c3/> umbenennen und die Attribute <c4/> davon entfernen — jede färbt die Zusicherung rot, die dafür zuständig ist.

# text
# c1: tests/*
# c2: tests/alternative_complementary_pnt_reference.rs
seg-7731d549c739 = Eine Zeile war bereits falsch: <em>Alternative / complementary PNT</em> zitierte <c1/>, ein Glob, was kein Zitat ist. Sie nennt jetzt <c2/> und die drei Testmodule im Crate dahinter.

# text
# c1: tests/published_figures_still_reproduce.rs
# c2: chart.svg
# c3: scenario-fom.png
seg-cf6fd64368de = <b>Die veröffentlichten Abbildungen werden bei jedem Build gegen die Engine neu geprüft</b> (<c1/>). Die drei Demo-Diagramme der README sind die eigene Ausgabe <c2/> der Engine, und nichts führte das Szenario erneut aus; die zwei Crossover-Studien der Veröffentlichung wurden einmal erzeugt und festgeschrieben; und die README nennt vier Kennzahlen in Prosa neben <c3/>. Alle drei sind jetzt auf die Live-Ausgabe der Engine festgelegt.

# text
seg-276b65a8f76a = Der Abgleich brachte das nützliche Ergebnis hervor: die Demo-Diagramme waren bei Engine { "0.22.0" } gezeichnet worden und das Crossover-JSON der Veröffentlichung bei { "0.20.0" }, und bei { "0.27.1" } <b>ist jeder gezeichnete Wert in allen fünf Artefakten identisch</b> — die drei Diagramm-SVGs unterscheiden sich von einem frischen Lauf um genau zwei Zeichen je Datei, den Versionsstempel in der Fußzeile. Die Diagramme wurden neu gerendert, damit die Fußzeile stimmt. Das JSON der Veröffentlichung bleibt absichtlich mit { "0.20.0" } gestempelt: es ist die Aufzeichnung des Laufs, dessen Abbildung eine veröffentlichte Arbeit einbettet, und ein neuer Stempel würde eine Herkunft behaupten, die das PDF nicht hat. Die Schutzvorrichtung prüft stattdessen die stärkere Eigenschaft — dass die aktuelle Engine jeden veröffentlichten Wert weiterhin reproduziert.

# text
# c1: VERSION=not provided
# c2: previous_version
# c3: FieldUnit
# c4: ensemble
# c5: hybrid
# c6: fusion
# c7: inertial
# c8: report
seg-c88647c5f2fc = SonarCloud-Analysen wurden als <c1/> aufgezeichnet, sodass der Zeitraum <c2/> für neuen Code nie voranschritt: er war weiterhin an der Analyse vom 2026-07-02 verankert, bewertete zweiundachtzig Tage Arbeit als einzelnes Delta und maß { "7877" } "neue" duplizierte Zeilen gegen eine Schwelle von { "3" } %. Der Scan übergibt jetzt die Version des Crates. Die zugrunde liegende Duplikation ist real und wird dadurch nicht verborgen: sie konzentriert sich in den deklarativen Registries <c3/>, die über <c4/>, <c5/>, <c6/>, <c7/> und <c8/> wiederholt werden, und in der Verifikationstabelle mit 168 Zeilen, und sie wird hier als Arbeit benannt, statt von der Messung ausgeschlossen zu werden.

# text
# c1: scripts/gate.sh
# c2: integration_binaries
# c3: tests_passed
# c4: tests_ignored
# c5: target/gate-run.log
seg-f2a0960a6f11 = <b><c1/> hatte keine Sperre für einen einzigen Schreiber, und jeder Lauf schrieb dasselbe Protokoll.</b> Das ist keine Ordnungsfrage: <c2/>, <c3/> und <c4/> der Quittung werden AUS diesem Protokoll zurückgelesen, und der Pre-Push-Hook vertraut der Quittung. Ein Gate, das beendet wurde, dessen Testbinärdatei aber noch lebte, schrieb weiter in die Datei, die der nächste Lauf gerade gekürzt hatte — sodass die Zahlen eines Laufs als die eines anderen bescheinigt werden konnten und einen Push auf Grundlage einer Suite genehmigten, die auf dem gepushten Baum nie lief. Es gibt jetzt ein Gate je Checkout (es lehnt mit Exit-Code { "75" } neben einem lebenden ab und räumt eine veraltete Sperre, deren pid verschwunden ist) und ein Protokoll je Lauf, wobei <c5/> beim Beenden vom abschließenden Lauf aufgefrischt wird. Beide Richtungen sind getestet: eine lebende pid lehnt ab, eine tote wird geräumt.

# text
# c1: src/verification.rs
# c2: verification::gen
# c3: artifacts
seg-687d6fe87221 = <c1/> behauptete, seine Tests bewiesen "do <b>not</b> prove the named test/oracle strings resolve to live code". Zwei Schutzvorrichtungen tun jetzt genau das, sodass die Moduldokumentation das Gegenteil der Wahrheit sagte; sie sagt jetzt, was maschinell geprüft wird und was dem menschlichen Urteil überlassen bleibt. Ein veralteter Verweis auf <c2/> — das Modul heißt <c3/> — wird in der eigenen Dokumentation der Geschwister-Schutzvorrichtung korrigiert.

# text
# c1: main
# c2: main
seg-014070f0873c = <b><c1/> wurde am 2026-09-22 neu geschrieben und per Force-Push übertragen.</b> Aus zehn Commits wurden vier. Das Umschreiben faltete jeden Commit, der ein Gate rot zurückließ, in den Commit, der es klärte, sodass jeder Commit auf <c2/> jetzt einen Baum hat, der besteht, und entfernte die abgebrochenen Läufe, die eine branchweite Concurrency-Gruppe auf jedem überholten Commit hinterlassen hatte.

# text
# c1: git diff
seg-b48d6cfc3b42 = Nichts wurde verworfen. Die Commits vor dem Umschreiben bleiben über die Tags erreichbar, die auf sie zeigen, und der endgültige Baum ist bytegleich mit dem Baum, von dem das Umschreiben ausging — <c1/> zwischen der alten und der neuen Spitze ist leer bis auf die drei Workflow-Dateien, die diese Version ändert.

# text
seg-0549cfdc6d69 = Die abgelösten SHAs, für alle, die einen Verweis auf einen halten:

# text
seg-14812deb1b6b = alt

# text
seg-c63f549e6a1d = Betreff

# text
seg-57bfbb773299 = docs(changelog): die Umschreibung der Autorenschaft und die zwei hängenden crate-sha1 offenlegen

# text
seg-02aa1be872d2 = fix(docs): das Diagramm des Engine-Ablaufs nannte { "6" } Kennzahlen; die Engine bewertet { "7" }

# text
seg-f3a598ff3349 = fix(test): zwei weitere plattformübergreifende Festschreibungen und zwei falsche Annahmen von mir

# text
seg-e9054c4801ff = feat(web): den lunaren Cluster auf der Website sichtbar machen — sieben Fähigkeitskarten

# text
seg-3f1f16502fdf = docs(lunar): { "42" } öffentliche Felder dokumentieren und die Obergrenze auf { "985" } senken

# text
seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

# text
seg-cbe63ab92c6a = test(docs): das Verteilungsdiagramm absichern, das letzte ungesicherte

# text
seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

# text
# c1: 7bba514
# c2: 7864142
# c3: .cargo_vcs_info.json
# c4: main
# c5: main
seg-9c220336c895 = <b>Die Tags { "v0.27.0" } und { "v0.27.1" } wurden absichtlich NICHT verschoben.</b> Sie zeigen weiterhin auf <c1/> und <c2/>, die genauen Commits, deren Bäume die Artefakte erzeugten, die jetzt auf crates.io, npm, PyPI, ghcr.io und in der MCP-Registry liegen. Die <c3/> eines Crates verzeichnet das sha1, aus dem es gepackt wurde, Registries sind unveränderlich, und die SLSA-Build-Provenance-Attestierung auf den Release-Assets von { "v0.27.1" } ist an diesen Commit gebunden. Ein Verschieben der Tags hätte jedes dieser veröffentlichten Artefakte auf einen Commit zeigen lassen, der nicht mehr existiert. Sie zu belassen hält die alten Commits erreichbar und jede veröffentlichte Herkunftskette auflösbar, auf Kosten von zwei Tags, die keine Vorfahren von <c4/> mehr sind — weshalb es diese Version gibt: { "v0.27.2" } gibt <c5/> einen eigenen Tag, gepackt aus einem Commit, der darauf liegt.

# text
seg-3c644384256f = Dies ist das zweite offengelegte Umschreiben dieser Historie; das erste, am 2026-09-21, kanonisierte die Autorenschaft und ist in den Hinweisen zu { "0.27.0" } mit seinen eigenen zwei hängenden crate-sha1 verzeichnet. Ein Umschreiben wird hier jedes Mal offengelegt, weil ein Repository, das nachprüfbare Herkunft verkauft, den Boden unter einem veröffentlichten Artefakt nicht stillschweigend verschieben kann.

# text
seg-d82d7a3c9054 = Das veröffentlichte Crate kompilierte nicht.

# text
# c1: src/lunar_orientation.rs
# c2: include_str!
# c3: tests/fixtures/llr_geometry/de440_moon_pa.csv
# c4: /tests/fixtures
seg-ebc99c9df1ef = <c1/> enthält ein <c2/> auf oberster Ebene von <c3/>, und das Manifest schließt <c4/> aus dem Paket aus, sodass dem Tarball, den crates.io erhält, eine Datei fehlte, die die Bibliothek selbst einbettet. Die Veröffentlichung von { "v0.27.0" } scheiterte aus diesem Grund an ihrem Verifikations-Build, und kein { "0.27.0" } erreichte crates.io; npm und PyPI, deren Jobs nicht davon abhängen, veröffentlichten normal. Der Ausschluss trägt jetzt eine Ausnahme für diesen einen Katalog.

# text
# c1: include_str!
# c2: src/
# c3: #[cfg(test)]
seg-6ff9cdb976e8 = Jedes andere <c1/> eines Fixtures in <c2/> liegt in einem Modul <c3/> und erreicht daher nie die gepackte Bibliothek. Nur eines auf oberster Ebene tut das.

# text
# c1: cargo package
# c2: package
seg-7f0975453b8f = <b>Nichts in CI führte <c1/> aus,</b> weshalb ein Tarball, der nicht kompiliert, erst vom Veröffentlichungsjob entdeckt wurde, nachdem zwei andere Registries bereits ausgeliefert hatten. Ein Job <c2/> baut und kompiliert jetzt bei jedem Push genau den Tarball.

# text
seg-1f2df48821fc = Die Festschreibungen der Ausgabe zur Mond-Bezugssystemrealisierung verschieben sich bei einem Versionssprung nicht mehr. Die SVG-Fußzeile trägt die Version der Engine, sodass jede Version drei Hashes neu basierte — zweimal an einem Tag — und eine routinemäßig neu genommene Festschreibung nicht mehr gelesen wird. Die Versionszeichenfolge wird vor dem Hashen auf einen Platzhalter normalisiert, und die Ausgabe wird getrennt zugesichert, die laufende Version zu nennen, sodass diese Tatsache genauer geprüft wird, als der Hash sie je prüfte.

# text
# c1: lunar-llr-datum
seg-56309487ea7e = <c1/> — das Mond-Bezugssystemdatum aus einer realen Beobachtungskampagne.

# text
# c1: lunar-frame-campaign
# c2: bin_rms / sqrt(n_raw)
# c3: realdata::llr_crd
# c4: lunar_llr
seg-966a2cc4e40d = <c1/> ersetzte eine injizierte Helmert-Transformation durch eine <em>simulierte</em> Kampagne und sagte das: ihr Stationsnetz, ihr Zeitplan und ihr Sigma je Beobachtung sind illustrative Eingaben. Dieses Szenario entfernt die Simulation aus den zwei Stellen, an denen ein Zeitplan und ein Fehlermodell in die Antwort eingehen. Die Epochen sind die Sendezeiten von { "337" } archivierten Normalpunkten der ILRS-Laserentfernungsmessung zum Mond (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } und Matera MLRO { "7941" }, alle fünf Retroreflektor-Arrays), und jedes Beobachtungsgewicht ist die eigene archivierte Präzision dieses Normalpunkts, <c2/> — ein Median von { "5.13" } mm Einweg-Entfernung, aus der Datei, nicht hier gewählt. Stationskoordinaten stammen aus IERS ITRF2020 und die Reflektorkoordinaten aus JPL DE430 Tabelle { "7" }; jedes Fixture verzeichnet eine URL, ein Abrufdatum und ein SHA-256 und wird von einem festgeschriebenen Generator aus seiner Quelle neu erzeugt, der die Quelle prüft und abbricht, statt eine Zahl auszugeben. Der Bericht nennt, welche Links gemessen sind und welche modelliert bleiben, und die modellierten werden <em>gemessen</em>: die beobachtete minus berechnete Einweg-Entfernung über die realen Daten beträgt { "156 494" } m RMS, was derselbe Testsatz gegenüber JPL Horizons über denselben Zeitraum bestätigt ({ "195 655" } m RMS-Vektor, schlechteste Epoche { "0.054" }° — innerhalb der ~{ "0.3" }°, die die eingebaute analytische Mondreihe für sich beansprucht). Additiv: eine neue Art, ein neuer Leser (<c3/>) und ein neues Modul (<c4/>); die bestehenden Pakete zum Mond-Bezugssystem sind bitgenau festgelegt.

# text
# c1: sigma_ure_m
# c2: lunar-integrity
# c3: moonlight-service-volume
# c4: LUNAR_SIGMA_URE_M
seg-7fcd2af0a688 = <b><c1/> als Szenarioparameter</b> bei <c2/> und <c3/>. Die Genauigkeit der Entfernungsmessung im Signal im Raum war eine Konstante zur Übersetzungszeit (<c4/>), sodass ein Sweep des Dienstvolumens immer nur Bestanden/Nicht bestanden bei einem festen Wert beantworten konnte. Die Schutzniveaus sind exakt linear darin, sodass seine Bereitstellung den Sweep in eine <b>Anforderung</b> an die Entfernungsgenauigkeit über das ganze Volumen verwandelt. Der Standardwert reproduziert das frühere Verhalten bitgenau.

# text
# c1: moonlight-service-volume
# c2: export_site_lat_deg
# c3: export_site_lon_deg
# c4: per_sat_geometry
seg-c3ccc1e89a2d = <b>Export der Geometrie je Satellit</b> bei <c1/>: <c2/> + <c3/> fügen ein Array <c4/> hinzu, das Azimut, Elevation und Schrägentfernung zu jedem Satelliten zu jeder Epoche für einen benannten selenographischen Standort angibt, plus das Sichtbarkeitskennzeichen. Die aggregierte Abdeckungszusammenfassung fasst die Geometrie je Satellit absichtlich zusammen, aber die Schrägentfernung ist genau das, was ein Link-Budget verbraucht, sodass eine gemeinsame Analyse von Kommunikation und Navigation nicht allein aus der Zusammenfassung möglich war. Aus, sofern nicht beide Koordinaten angegeben sind; rein additiv.

# text
# c1: lunar_service::topocentric
seg-ae7886fbca9d = <c1/>, der öffentliche Hilfsbaustein für Blickwinkel hinter dem Export.

# text
seg-b187bade5f04 = Eine Zeile der Verifikationsmatrix für die neue Geometriefähigkeit.

# text
# c1: antenna::pattern_gain_dbi
# c2: [2·J₁(x)/x]²
# c3: antenna.rs
# c4: export_antenna
# c5: moonlight-service-volume
# c6: antenna_pattern
# c7: θ₃dB[deg] = √(31000/G_lin)
# c8: 70·λ/D
seg-14ef785b6c12 = <b>Das reale Antennenmuster im Geometrieexport.</b> Die Engine führt seit P1 ein Muster einer gleichmäßig ausgeleuchteten kreisförmigen Apertur (<c1/>, die Form <c2/> nach Airy), und <b>nichts außerhalb von <c3/> verwendete es</b> — stattdessen leistete eine Boresight-Verstärkung, gepaart mit einer Faustregel von Verstärkung zu Strahlbreite, die Arbeit. Eine optionale Tabelle <c4/> bei <c5/> (nur gelesen, wenn der Exportstandort gesetzt ist) gibt jeder exportierten Zeile jetzt den <b>Off-Boresight-Winkel am Satelliten</b> und die <b>Sendeverstärkung in Richtung des Standorts aus diesem Muster</b> und fügt einen Block <c6/> hinzu, der die <b>Anzahl im Strahl beim realen Muster neben der Anzahl im Strahl bei der symmetrischen Näherung</b> (<c7/>) meldet, mit der Differenz als benannte Korrektur. Beide Zahlen werden ausgegeben; keine ersetzt die andere. Gemessen an der eigenen repräsentativen lunaren Apertur der Engine (Schüssel von { "1" } m, { "2.4" } GHz, η = { "0.60" }) über einem südpolaren Standort und der illustrativen Schale der Klasse LCNS <b>weichen die beiden um mehr als einen Satelliten ab</b>: das reale Muster legt { "0" } von { "76" } sichtbaren Links in den Halbleistungsstrahl, die Näherung behauptet { "28" } — eine Korrektur von −{ "2.33" } Satelliten je Epoche, schlechteste einzelne Epoche { "3" }. Die Näherung trägt eine eigene Aperturausbeute ({ "0.641" } gegenüber der Regel <c8/> Grad, mit der sie üblicherweise angegeben wird, { "0.920" } gegenüber einer gleichmäßigen kreisförmigen Apertur), sodass sie bei einer Schüssel mit η = { "0.60" } einen Strahl liefert, der { "1.238" }× zu breit ist; der Block gibt beide implizierten Ausbeuten aus, statt sie erschließen zu lassen. Rein additiv: gemessen über den dokumentierten Arbeitspunkt, { "597" } bereits vorhandene Blätter, <b>{ "0" } geändert, { "0" } entfernt, { "494" } hinzugefügt</b>.

# text
# c1: antenna::symmetric_beamwidth_rad
# c2: antenna::symmetric_relation_implied_efficiency
# c3: antenna::within_half_power_beam
# c4: antenna::HALF_POWER_DROP_DB
# c5: antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2
# c6: antenna::UNIFORM_APERTURE_HPBW_COEFF
# c7: lunar_service::nadir_off_boresight_rad
# c8: x = 1.61634
# c9: 1.02899·λ/D
# c10: 1.02
# c11: pattern_gain_dbi
seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> und <c7/>, die öffentlichen Bausteine dahinter. Das Muster ist jetzt außerdem an den veröffentlichten Airy-Konstanten verankert statt nur an sich selbst: der Halbleistungsdurchgang wird per Bisektion gefunden und mit <c8/> verglichen, was die exakte Halbleistungsbreite <c9/> ergibt und ehrlich festhält, dass der übliche Koeffizient <c10/> <c11/> auf <b>−{ "2.955" } dB</b> legt, nicht auf −{ "3.010" } dB.

# text
# c1: lunar-time-budget
# c2: x(τ)
# c3: <scenario>.table.csv
# c4: τ
# c5: x
seg-bac7217bb128 = <b>Eine Langformtabelle zur Reproduzierbarkeit für <c1/>.</b> Die arraywertigen Ausgaben des Szenarios — das Gitter der Mittelungszeiten, die sieben Kurven <c2/> je Term und ihre Gesamtsumme als Wurzel der Quadratsumme — erreichten Verbraucher nur als JSON-Arrays. Eine veröffentlichte Tabelle wurde bei { "400" } Zeichen gekürzt und veröffentlichte { "23" } ihrer { "57" } Mittelungszeiten unter einer Spalte, die alle beanspruchte, und das Manuskript baute die Kurven je Term aus geschlossenen Formen neu auf, weil die Engine sie nie ausgab. Ein gewöhnlicher Lauf schreibt jetzt außerdem <c3/> mit einer Zeile je (Gitterindex, Mittelungszeit, Term), die nicht zu etwas gekürzt werden kann, das noch vollständig aussieht. Der Gitterindex ist ein exakter Verbindungsschlüssel; <c4/> wird mit { "13" } signifikanten Stellen geschrieben und jedes <c5/> mit { "7" }, sodass sich die Bytes zwischen Builds desselben Quelltexts nicht aufspalten. Rein additiv: das JSON des Berichts ist bytegleich.

# text
# c1: hybrid-optical-rf
# c2: link_configuration
# c3: units
# c4: variance
seg-ab9209297ec2 = <b>Der Bericht zu <c1/> beschreibt sich nun selbst.</b> Ein Block <c2/> gibt die aufgelösten Eingaben der Strecke wieder — Trägerwellenlänge, Sende- und Empfangsapertur, Entfernung, Pulsbreite, Integrationszeit, Wirkungsgrade und Verluste — mit angewendeten Standardwerten, sodass eine Veröffentlichung die Konfiguration angibt, mit der gerechnet wurde, statt einen aus dem Quelltext abgelesenen Standardwert zu zitieren. Ein Block <c3/> nennt für jede Größe, die eine Veröffentlichung voraussichtlich zitiert, die Einheit und die Herkunftsklasse. Der Anlass sind die Spuren der Übergabe-Kovarianz: Sie wurden als nacktes <c4/> ausgegeben, und ein Manuskript schloss aus einer internen Konsistenzprüfung auf Quadratmeter. Der Schluss war richtig, und genau deshalb war es ein Mangel — nichts hätte aufgedeckt, wenn er falsch gewesen wäre. Rein additiv: gemessen über vier Konfigurationen, { "456" } bereits vorhandene Felder, <b>{ "0" } geändert, { "0" } entfernt, { "196" } hinzugefügt</b>.

# text
# c1: InternalConsistency
seg-5c810155300c = Eine Zeile der Verifikationsmatrix für die Reproduzierbarkeitstabelle des Zeitbudgets, ehrlich als <c1/> / <b>MODELLED</b> eingestuft — die Summe wird gegen die Wurzel aus der Quadratsumme der Terme in derselben Datei geprüft, die dieselben Termdefinitionen wie die Engine selbst verwendet und daher keine unabhängige Referenz ist. Zusammen kommen damit drei Zeilen hinzu. Die laufende Summe für diesen unveröffentlichten Abschnitt beträgt <b>{ "168" } Zeilen — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

# text
# c1: ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>
# c2: ashfordeOU <contact@ashforde.org>
# c3: Chakshu Baweja <contact@ashforde.org>
# c4: dependabot[bot]
seg-ed290a85ab0e = <b>Die Commit-Urheberschaft in der gesamten Historie ist nun eine einzige Identität, und zwei veröffentlichte Crates verweisen auf einen Commit, der nicht mehr existiert.</b> Am 2026-09-21 wurde die Git-Historie so umgeschrieben, dass jeder menschliche Commit von <c1/> verfasst und committet ist. Zuvor gab es drei Schreibweisen einer einzigen Person — { "688" } Commits als <c2/>, { "34" } als <c3/> und { "94" } bereits in der kanonischen Form. Der eine Commit von <c4/> wurde bewusst als eigener Autor belassen: Den Abhängigkeits-Bump eines Bots umzubenennen, würde die Urheberschaft einer Arbeit beanspruchen, die hier niemand geleistet hat.

# text
# c1: v0.26.0
# c2: 92284e9420605568f1bfabb78cd95d383b40f3e2
seg-ec4e75f94462 = <b>Kein Inhalt hat sich geändert.</b> Das Umschreiben betraf nur die Header von Autor und Committer, und das ist überprüfbar statt bloß behauptet: Der Baum jedes Tags und jedes Branches ist bitgleich mit dem von zuvor. <c1/> löst weiterhin auf den Baum <c2/> auf, genau wie bisher.

# text
# c1: v0.26.0
# c2: dce2dbf7700788cf6de46260c14673c0e5347360
# c3: d4921f3025569e00e425e1747d0acfc261e96e18
seg-bc0f4fa0a009 = <b>Was es gekostet hat.</b> Der Name eines Commits ist ein Hash über seinen Baum, seine Eltern und seine Autoren-Header; wird also ein Vorfahr geändert, erhält jeder Nachfahr einen neuen Namen. Der Release-Commit von <c1/> hieß <c2/> und heißt jetzt <c3/>. Zwei Artefakte haben den alten Namen zum Zeitpunkt der Veröffentlichung festgehalten und lassen sich nicht korrigieren, weil eine veröffentlichte Registry-Version von Grund auf unveränderlich ist:

# text
# c1: kshana
# c2: .cargo_vcs_info.json
# c3: dce2dbf…
seg-52e096332738 = <c1/> { "0.26.0" } auf crates.io — <c2/> hält <c3/> fest

# text
# c1: kshana-mcp
# c2: path_in_vcs: mcp/kshana-mcp
seg-8ec39d2f136c = <c1/> { "0.26.0" } auf crates.io — dasselbe sha1, <c2/>

# text
# c1: gitHead
seg-9a21b7c7b41c = Nichts anderes ist betroffen. Das npm-Paket hält kein <c1/> fest, und die PyPI-Distribution hält überhaupt keinen Commit fest; beides wurde geprüft statt angenommen.

# text
# c1: dce2dbf…
seg-9c51c5fb0d80 = Es gibt keine Reparatur, die <c1/> auf den umgeschriebenen Commit verweisen lässt: Diese Zeichenfolge <em>ist</em> die alte Vorgeschichte, und sie lässt sich nur auflösen, indem die Historie vor dem Umschreiben veröffentlicht bleibt, was die durch das Umschreiben entfernte Urheberschaft wiederherstellen würde. Die Herkunft von { "0.26.0" } läuft daher über das Tag und nicht über das festgehaltene sha1 — und das Tag liefert exakt dieselben Bytes, aus denen das Crate gebaut wurde. Das nächste Release hält einen gültigen Commit fest, ohne dass etwas zu tun ist.

# text
# c1: realtime-frame-eop
# c2: finals2000A
# c3: predicted_rows.n = 0
# c4: tools/finals2000A_2026.txt
# c5: predicted_rows.n = 12
# c6: predicted_rows.n
# c7: p4_frame_eop.csv
# c8: tests/golden/realtime-frame-eop.csv
# c9: docs/revisions/G12-default-eop-cell-changes.md
seg-30ecea86118a = <b><c1/> verwendete standardmäßig eine EOP-Datei ohne Vorhersagezeilen (G12).</b> Das Szenario bettete als Offline-Standard einen fünfzeiligen Auszug aus <c2/> ein, der <em>nur Endwerte</em> enthielt, sodass ein einfacher Lauf <c3/> meldete und die Tabelle je Vorhersagehorizont auf { "5" }, { "4" }, { "3" } und { "2" } Paaren beruhte. Die Engine konnte stets eine Vorhersagezeile lesen — die Eingabe enthielt schlicht keine. Der Standard ist nun der unveränderte IERS-Auszug von { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } endgültige Werte aus Bulletin B und <b>{ "12" } reine Vorhersagezeilen aus Bulletin A</b>, sodass ein einfacher Lauf ohne Dateiargument und ohne Netzwerk <c5/> meldet und eine Tabelle je Vorhersagehorizont mit n = { "20" } / { "31" } / { "30" } / { "29" } liefert; auch der Vergleich mit dem operationellen Prädiktor und die Übereinstimmung mit den vom Produkt selbst veröffentlichten Vorhersagen werden befüllt. Der lange 45-Zeilen-Auszug wurde als Alternative gemessen und verworfen: Er enthält ebenfalls nur Endwerte und hätte <c6/> bei { "0" } belassen. <b>Dies verändert veröffentlichte Zahlen</b>, nach Regel R4 und mit Autorisierung durch den Gründer: zehn der { "22" } Zellen der veröffentlichten <c7/> und { "24" } der { "42" } befüllten Zellen von <c8/>. Der gemessene Polbodenwert aus Rapid minus Final wird { "0.0678" } mas (zuvor { "0.0769" } mas), und das ist der Wert, den die eigene Polbewegungstabelle von Paper P4 bei n = { "20" } bereits veröffentlicht — beide stimmen nun überein, statt um { "13.5" } % abzuweichen. Jede andere Zahl, die P4 aus dieser Tabelle ausgibt, ist in der ausgegebenen Genauigkeit unverändert. Die vollständige Aufstellung alt → neu, einschließlich der Felder, die sich <em>nicht</em> bewegt haben, steht in <a1><c9/></a1>. Der Auszug mit nur Endwerten wird weiterhin ausgeliefert, bytegenau festgelegt und ausgeführt: Eine Anzahl von null Vorhersagezeilen bei ihm ist eine Eigenschaft der Datei, und ein Test belegt das weiterhin.

# text
# c1: api::list_scenario_kinds().len()
# c2: scenario_count_doc_sync
seg-62c3efb54991 = <b>Genauigkeit von Dokumentation und Anzahlen.</b> Die Anzahlen der Szenariotypen im README sind nun durch einen Test <c2/> an <c1/> gebunden, sodass die dokumentierte Anzahl nicht mehr vom Dispatcher abweichen kann.

# text
# c1: Body{mu, re, zonals, gravity, rotation, IAU-pole}
# c2: EphemerisProvider
# c3: mars-pnt
# c4: xval/anise-mars-od
# c5: cargo deny
seg-5f0f497aa643 = <b>PNT im tiefen Weltraum und auf dem Mars — offene radiometrische Navigations-Engine + GSE-Simulation.</b> Eine neue, vollständig additive Fähigkeitsachse auf dem für die Erde validierten Kern (jedes bestehende Erd-Szenario ist <b>byteidentisch</b> — die Reproduzierbarkeits-Goldens bestehen unverändert ohne Neuerzeugung). Hinzu kommen: ein Mehrkörper-Dynamikkern (<c1/> mit tesseraler Schwerefeldbeschreibung nach Mars GMM-3, einem IAU-körperfesten Marsrahmen, einer austauschbaren Schnittstelle <c2/>, Julianischen Daten in zwei Teilen mit Submikrosekunden-Auflösung und TT↔TDB); radiometrische Observablen (iterative Lichtlaufzeit + Shapiro-Verzögerung, Zwei-/Ein-/Dreiweg-Doppler und -Entfernung über die Moyer-Zweistrecken-Lösung, kohärente Transponder-Umkehr, regenerative/PN-Entfernungsmessung nach CCSDS { "414" }, Δ-DOR nach CCSDS { "506" }, Medien aus Solarplasma/Tropo-/Ionosphäre); Einlesen und Ausgeben von CCSDS-TDM ({ "503" }); ein reduziert-dynamischer Square-Root-Information-Filter mit empirischen RTN-Beschleunigungen, einer Bordzeituhr mit drei Zuständen und einem Mars-Widerstandsmodell; ein gemeinsamer Schätzer für Ein- und Zweiweg-Fusion; die Szenariooberfläche <c3/> (Relais-Konstellation + LMO/Transfer/Oberfläche) über CLI, Python, WASM, MCP und den Playground; und ein durchgängiger GSE-Leistungssimulator (Geometrie → Link-Budget → Observablen → SRIF → Kovarianz). <b>Validierungsstufe — simulationsvalidiert:</b> synthetische Closed-Loop-Bahnbestimmung (Mars-LMO ≈ { "0.2" } m) und analytische Selbstkonsistenz, wobei die sonnenzentrische Marsdynamik unabhängig gegen JPL <b>DE440</b> gegengeprüft wurde (<c4/>, kernel-gesteuert: { "137" } m bei 1-Tages-Bogen, das ehrliche Residuum der nicht modellierten n Körper). Die berichteten Genauigkeiten im tiefen Weltraum sind <b>Simulations- bzw. Kovarianz-Gütemaße</b>, keine Ergebnisse realer Missionen; die Validierung mit realen DSN/ESTRACK-Tracking-Daten bleibt auf der Roadmap. ANISE (MPL-2.0, edition-2024) ist auf ein vom Workspace ausgeschlossenes Crate für die Gegenprüfung beschränkt, sodass die Lizenzprüfung <c5/> und der MSRV-1.75-Job unberührt bleiben.

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: EopSeries
# c5: precise_od
# c6: dut1_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: kshana --eop <finals2000A>
# c10: precise_od
seg-2ab34100a2d7 = <b>Agenturgenaue Bodenspuren aus realer IERS-Erdorientierung.</b> Das Szenario <c1/> nimmt ein optionales Feld <c2/> entgegen — den eingebetteten Inhalt einer realen IERS-Datei <c3/> — und reduziert die Bodenspur über UT1−UTC und Polbewegung je Epoche, die daraus interpoliert werden (dieselbe <c4/>, die <c5/> verwendet), und überschreibt damit die nominalen Skalare <c6/>/<c7/>/<c8/>. Die Daten reisen im Szenario mit, sodass der Lauf reproduzierbar bleibt und kein Dateisystem braucht (er funktioniert im WASM-Playground). Ein Flag <c9/> faltet eine reale Datei von der CLI aus in das Szenario ein. Damit wird die Asymmetrie geschlossen, dass nur <c10/> reale Erdorientierungsdaten verarbeitete.

# text
# c1: frames::itrf_to_teme
seg-e778245e7d8f = <b>Konsistenz des Bezugssystems bei der Entfernungsrate.</b> Die Bodenstation wird nun über die exakte Umkehrung der Reduktion des Satelliten (<c1/>, die Polbewegung <em>und</em> die siderische Rotation rückgängig macht) in das Inertialsystem abgebildet, statt über eine für Polbewegung blinde GMST-Rotation, sodass beide Endpunkte dasselbe Bezugssystem teilen. Die Wirkung auf den berichteten Doppler liegt unter der Validierungsschwelle, doch sie beseitigt eine echte Unstimmigkeit des Bezugssystems und eine Übertreibung mit „exakt“ im Quelltext.

# text
# c1: carrier_hz
# c2: step_s
seg-3b912d8a819d = <b><c1/> wird geprüft.</b> Eine Trägerfrequenz von null oder eine nicht endliche liefert nun einen Fehler, statt stillschweigend einen Doppler von null zu erzeugen (λ = c/Träger war dadurch unendlich geworden), passend zur bestehenden Absicherung von <c2/>.

# text
# c1: src/precise_od.rs
# c2: PreciseForceModel
# c3: finals2000A
seg-7d70317ca717 = <b>Validierung des Kraftmodells durch Ephemeridenanpassung, gegen reale Agenturprodukte gegengeprüft.</b> Ein neuer Batch-Kleinste-Quadrate-Schätzer (<c1/>) mit variationeller Zustandsübergangsmatrix und Ausreißerbearbeitung, angetrieben von einem vollständigen Kraftmodell (<c2/>: EGM2008-Geopotential, dritte Körper, feste + ozeanische + atmosphärische Gezeiten sowie empirische CPR-/2-per-rev-Beschleunigungen), gespeist von einem Parser für reale IERS-Erdorientierung <c3/>. Validiert gegen veröffentlichte Referenzbahnen: <b>Galileo-MEO bis auf { "13" } cm nach der Anpassung</b>, ESA <b>Swarm-A LEO</b> und <b>LRO lunar</b> (selenozentrisch, GRAIL-Schwerefeld, IAU-2015-Körperrahmen — reduziert-dynamisch { "6.6" } m, ehrlich über dem Zielwert von { "5" } m auf dem offenen Pfad; der Pfad ANISE/DE440 in DE-Güte, der ihn erreicht, ist ein vom Workspace ausgeschlossenes Crate).

# text
# c1: spoof-detect
seg-bf88a3eb4733 = <b>Szenario <c1/></b> — ein integrierter mehrschichtiger Spoofing-Detektor, der RAIM-Parität je Epoche, AGC- und Signalqualitäts-Monitore (SQM) und eine fusionierte Entscheidung kombiniert und gegen die veröffentlichten Szenarioparameter von <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }) validiert ist, einschließlich des trägerausgerichteten schwierigen Falls.

# text
# c1: ephemeris
seg-976036ba124b = <b>Szenario <c1/> — Zustand, Bezugssysteme, Bodenspur und Doppler.</b> Einen Satelliten propagieren (TLE→SGP4 oder eine analytische Bahn) und je Schritt den inertialen TEME- und GCRS-Zustand (<b>Position <em>und</em> Geschwindigkeit</b>), die erdfeste ITRF/ECEF-Position, die WGS-84-<b>Bodenspur</b> des Subsatellitenpunkts (Breite / Länge / Höhe) sowie Azimut / Elevation / Entfernung topozentrisch mit Entfernungsrate und <b>Doppler</b> von einer Bodenstation ausgeben. Erreichbar über CLI, Python, WASM und den MCP-Server und ausgeliefert als <b>Voreinstellung „Ground track“</b> im Web-Playground, in dem die Spur <b>über einer realen Weltkarte</b> gezeichnet wird (Natural-Earth-Küstenlinien { "1" }:110m, eingebettet — kein Netzwerk und keine externe Abhängigkeit).

# text
# c1: --export-oem
# c2: export_oem = true
seg-761c95f2ede5 = <b>CCSDS-OEM-Export</b> (<c1/> / <c2/>) — die geschwindigkeitstragende Orbit Ephemeris Message, die von GMAT / Orekit / STK verarbeitet wird, gleichwertig mit den bestehenden Exportern für SP3 und OMM.

# text
seg-111b0896fdd4 = <b>Feste, ozeanische (FES2004) und atmosphärische (Ray { "2001" } S2) Erdgezeiten</b> auf dem Geopotential (IERS Conventions Kap. { "6" }), eingebunden in das Kraftmodell.

# text
seg-7e392131261a = <b>ARM64-Wheels</b> — der PyPI-Build erzeugt nun auch Wheels für Linux aarch64 (manylinux_2_28), macOS arm64 und Windows arm64.

# text
seg-7cc04ea3362b = <b>Erweiterter technischer Bericht (Preprint)</b>, aus dem README verlinkt, und das JOSS-Paper einreichbar gemacht (Autoren-ORCID, bei jeder Änderung in der CI zu PDF kompiliert).

# text
seg-3b1e95acc728 = <b>Bezugssysteme auf den Millimeter gegen veröffentlichte Vallado-Vektoren validiert.</b> Die Reduktion TEME→PEF/ITRF, die vollständige CIO-Kette IAU 2006/2000A GCRS→ITRS und die Umrechnung ECEF→geodätisch WGS-84 sind nun am durchgerechneten Beispiel in Vallado et al. (AIAA 2006-6753) mit dessen IERS-EOP festgelegt, nicht mehr nur an interner Selbstkonsistenz.

# text
# c1: hifitime
seg-fd9818877a6c = <b>Unabhängige Gegenprüfungen der Zeitskalen.</b> ERA und die Skalen UTC/TAI/TT stimmen mit <c1/> auf < { "1" } µs überein, und die Planetenephemeride DE440 stimmt mit JPL Horizons überein (geozentrische Positionen von Mond/Sonne), beides als stets aktive CI-Gates.

# text
seg-75aeec4cd6d0 = Der Web-Playground blendet den Tab der Gütemaße aus, wenn ein Ergebnis keine Zeilen mit Gütemaßen enthält, sodass reine Diagramm-Pakete (Ephemeride, RAIM, Spoof) mit ihrem Diagramm öffnen — bei der Ephemeride mit der Bodenspur — statt mit einer leeren Tabelle.

# text
seg-b8ab0cc3ce7f = Die geführten Schieberegler des Playgrounds <b>und der Parameter-Sweep funktionieren nun für das Szenario Ephemeride / Bodenspur</b>: Seine Stellgrößen (Breite / Länge der Station, Zeitschritt, Dauer, UT1−UTC) sind einstellbar, und ein Sweep kann die Überflug-Geometrie (maximale Elevation, maximaler Doppler, Höhe, Geschwindigkeit) über jede davon auftragen — z. B. maximale Elevation über der Breite der Station. Der Tab Sweep wird nun nur noch angezeigt, wenn ein Szenario tatsächlich durchgesweept werden kann, sodass kein Paket ein Bedienelement anbietet, das nichts darstellt.

# text
# c1: DUT1 ≈ 0
# c2: CAPABILITY.md
seg-9e7a37e51940 = Die Näherung <c1/> von SGP4 an der GMST-Aufrufstelle dokumentiert (ein Rotationsfehler von ≤ ~{ "13" }″, deutlich innerhalb des eigenen Modellfehlers von SGP4) und <c2/> aktualisiert.

# text
# c1: kshana.dev
seg-174a75e840b0 = Das JetBrains-Plugin <b>Kshana — PNT simulator</b> ist nun veröffentlicht und im <a1>JetBrains Marketplace</a1> akzeptiert. README, <c1/> und die Distributionsdokumentation verlinken direkt darauf.

# text
# c1: server.json
# c2: description
# c3: io.github.ashfordeOU/kshana-mcp
seg-4deaf7918fff = Die <b>Veröffentlichung in der MCP-Registry</b> gelingt nun: Das Feld <c2/> in <c1/> lag über dem Limit der Registry von 100 Zeichen (HTTP { "422" }). Es wurde gekürzt, und der Servername (sowie das Eigentümer-Label des Images) wurde an den kanonischen Namensraum <c3/> angeglichen.

# text
# c1: 0.1.1
seg-1408961042a1 = Die <b>Veröffentlichung im JetBrains Marketplace</b> gelingt nun: Die CI hatte dieselbe Plugin-Version erneut hochgeladen, die bereits manuell gelistet worden war, was der Marketplace ablehnt. Die Plugin-Version wird auf <c1/> angehoben, und die Idempotenz-Absicherung behandelt nun auch die Antwort „already contains version“ als erfolgreichen No-op.

# text
# c1: kshana.dev
# c2: style.css
# c3: app.js
seg-74e8cab2f10e = <b>Cache-Busting für <c1/></b>: Die versionsgestempelten Query-Strings von <c2/>/<c3/> folgen dem Release, sodass wiederkehrende Besucher stets den aktuellen Build erhalten.

# text
# c1: kshana-mcp
# c2: mcp/kshana-mcp/
# c3: rmcp
# c4: run_scenario
# c5: list_scenario_kinds
# c6: validate_scenario
# c7: export_sp3
# c8: export_omm
# c9: kshana::api
seg-65949229eed7 = <b><c1/> — Kshana als Server für das Model Context Protocol (MCP)</b> (<c2/>). Ein eigenständiges, vom Workspace ausgeschlossenes Crate (das SDK <c3/> ist edition { "2024" }), das die validierte Engine KI-Agenten und -Assistenten — Cursor, JetBrains AI Assistant / Junie und jedem MCP-Client — über stdio zugänglich macht. Werkzeuge: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, jedes ein dünner Wrapper um <c9/>.

# text
# c1: ide/jetbrains/
# c2: .toml
seg-bd792f66363c = <b>JetBrains-IDE-Plugin</b> (<c1/>). Rechtsklick auf ein Szenario <c2/> → <b>Run Kshana Scenario</b>; Gütemaße und Ergebnis-JSON werden in ein Kshana-Werkzeugfenster gestreamt. Reines Plattform-Plugin in Kotlin, kompatibel mit jeder JetBrains-IDE { "2024.3" }+.

# text
seg-755358390517 = <b>Öffentliche Distribution + automatische Veröffentlichung je Release</b> für beide:

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
# c3: publish.yml
seg-14fc2fd73553 = <c1/> auf <b>crates.io</b> (<c2/>) über <c3/>.

# text
# c1: kshana-mcp
# c2: ghcr.io
# c3: docker run ghcr.io/ashfordeou/kshana-mcp
# c4: mcp-publish.yml
seg-2b39bbfc0581 = <c1/> als <b>OCI-Image</b> für mehrere Architekturen auf <c2/> (<c3/>) über eine neue <c4/>.

# text
# c1: kshana-mcp
# c2: server.json
seg-c824d1532eb6 = <c1/> in die <b>offizielle MCP-Registry</b> über GitHub OIDC (ohne Secrets); der Registry-Eintrag (<c2/>) verwendet den OCI-Pakettyp mit einem per Label verifizierten Eigentümer.

# text
# c1: publishPlugin
seg-f90da0c61aac = das IDE-Plugin in den <b>JetBrains Marketplace</b> über <c1/> (token-gesteuert, optionale Entwicklersignatur) bei jedem Release-Tag.

# text
# c1: xval/anise-frames/
# c2: kshana
# c3: kshana::cio::gcrs_to_itrs_matrix
# c4: earth_latest_high_prec.bpc
# c5: finals2000A
# c6: anise
# c7: hifitime
# c8: kshana
# c9: Cargo.lock
# c10: cargo deny
# c11: default-features = false
# c12: frame-xval
# c13: report.{json,md}
# c14: workflow_dispatch
# c15: main
# c16: docs/VALIDATION.md
# c17: ROADMAP.md
seg-21d7457dad23 = <b>Unabhängige Gegenvalidierung der Bezugssysteme mit ANISE/SPICE</b> (<c1/>). Ein eigenständiges, vom Workspace ausgeschlossenes Crate prüft die CIO-Reduktion IAU 2006/2000A von <c2/> (<c3/>, GCRS→ITRS) gegen <b>ANISE</b> (die in reinem Rust gehaltene Neuimplementierung von NAIF/SPICE), das GCRF→ITRF93 aus <c4/> von JPL rotiert, wobei <b>dieselben IERS-Erdorientierungsparameter <c5/> beiden Seiten zugeführt werden</b>, über acht vierteljährliche Epochen { "2020" }–{ "2023" }. Die beiden unabhängigen Realisierungen des Bezugssystems stimmen bis auf eine <b>maximale relative Rotation von { "0.028" }″ überein — ≤ { "0.86" } m am Boden, ≤ { "0.93" } m im LEO, ≤ { "3.6" } m in der GNSS-Bahn</b>, womit die seit Langem bestehende ROADMAP-Gegenprüfung der Bezugssysteme mit „< { "10" } m“ mit großem Abstand erfüllt wird (sie ergänzt die bestehenden bitgenauen SOFA/ERFA-Anker, ersetzt sie aber nicht). Das Crate ist isoliert, weil <c6/> + <c7/> unter MPL-2.0 stehen bzw. edition-2024 sind und nie in den Abhängigkeitsgraphen des veröffentlichten Crates <c8/>, dessen <c9/>, die Lizenzprüfung <c10/> oder den MSRV-Build gelangen dürfen; ANISE ist mit <c11/> festgelegt. Enthalten sind ein Binary <c12/> (lädt die ~{ "5" } MB große BPC herunter, gibt eine Tabelle aus, schreibt <c13/>), ein Test-Gate, das sich bei fehlendem Kernel oder Netzwerk selbst überspringt, und ein optionaler CI-Job nur für <c14/> (blockiert nie <c15/>). Dokumentiert in <c16/> (CIO-Zeile) und <c17/>.

# text
# c1: .panel
# c2: min-width: auto
# c3: min-width: 0
seg-eb45b43dacc2 = <b>Für Mobilgeräte geeigneter Playground.</b> Horizontalen Überlauf von <c1/> des Playgrounds auf Smartphones behoben (ein CSS-Grid-Element mit dem Standardwert <c2/> wurde ~{ "100" } px breiter als der Viewport dargestellt), über <c3/> und breitengesicherte Bedienelemente; sauber verifiziert bei { "360" } / { "390" } / { "414" } / { "768" } px. Die Aktionsschaltflächen „Pin to compare“ / „Download report“ ausgerichtet (gleiche Margin-Boxen in der Flex-Zeile). Ausführen-Schaltflächen, Schieberegler, Auswahlfelder und Navigationslinks auf dem Smartphone und auf Touch-Geräten auf das Touch-Target-Minimum von ~{ "44" } px nach WCAG { "2.5.5" } / Apple-HIG vergrößert, bei unveränderter Desktop-Größe.

# text
# c1: sbas_protection_level
# c2: Some
# c3: propagate
# c4: propagate_dopri
# c5: lunar_look_angle
# c6: [0, 360)
# c7: SphericalHarmonicField::from_gfc
# c8: GM
seg-fe5095d5e61f = <b>Robustheitshärtung aus einem adversarialen Battle-Test-Durchlauf.</b> ({ "1" }) <c1/> weist nun nicht endliche Elevation/Azimut/Varianz sowie negative oder nicht endliche Kovarianzdiagonalen zurück (eine fast singuläre Geometrie, durch kleines σ hochskaliert, konnte zuvor das Absolut-Pivot-Gate passieren und ein NaN-VPL / ein absurdes HPL als <em>gültiges</em> <c2/> zurückgeben — ein stiller Integritätsfehler). ({ "2" }) Der numerische Propagator (<c3/>/<c4/>) bricht bei einem nicht endlichen Anfangszustand sicher ab, statt den adaptiven Regler endlos kreisen zu lassen. ({ "3" }) Der Hilfsbaustein für DEM-Zellen löst bei einem Gitter mit einer einzigen Stichprobe ({ "1" }×N) keine Panik mehr aus. ({ "4" }) Der Azimut von <c5/> wird strikt in <c6/> gehalten. ({ "5" }) <c7/> weist nicht physikalische (NaN / nicht positive) Werte für <c8/>/Radius zurück.

# text
# c1: validation_report
# c2: kshana-validation-summary.html
seg-9ca339d8977a = <b>Binary <c1/> + Release-Artefakt</b>: ein abhängigkeitsfreier Generator, der eine einseitige, druckfertige HTML-Validierungszusammenfassung erzeugt, die jede in der CI erzwungene Validierung (SGP4 666/666, EGM2008, bitgenaue Bezugssysteme, NIST Allan, IMU-Datenblätter, ARAIM/SBAS, Reproduzierbarkeit auf 3 Betriebssystemen, Abdeckung) ihrem Test und ihrer externen unabhängigen Referenz zuordnet. Der Release-Workflow erzeugt <c2/> und hängt sie (mit SLSA-Provenienz) an jedes getaggte Release an.

# text
# c1: tests/python/test_numpy_interop.py
# c2: auditwheel show
seg-bd231d07658f = <b>numpy-Interop-pytest + Härtung der Wheels</b>: <c1/> (in der CI ausgeführt) sowie ein festgelegter manylinux-Container und ein Verifikationsschritt <c2/> im Wheel-Build.

# text
# c1: docs/tutorials/
# c2: tests/tutorials.rs
seg-5427cae6fc39 = <b>Tutorials & Lehre</b>: <c1/> (drei durchgerechnete Tutorials, kommentierte Szenarien je Fachgebiet, Übungen der Stufen 1/2/3) mit <c2/>, der jede zitierte Zahl an die tatsächliche Ausgabe der Engine bindet.

# text
# c1: paper/
# c2: notebooks/
# c3: submissions/
# c4: FUNDING.yml
seg-2fad9124c5a6 = <b>Artefakte für externe Einreichungen</b> (<c1/>, <c2/>, <c3/>): ein Entwurf für ein JOSS-Paper, ein Notebook Quanten vs. klassisch und einreichfertige Kits für awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC sowie <c4/> — die externen Schritte der Einreichung vorbereitet.

# text
# c1: altpnt
# c2: .hgt
# c3: terrain-nav
# c4: combined-altpnt
seg-0f88f8bccbc1 = <b>Geländereferenzierte und kombinierte Alt-PNT-Navigation</b> (Modul <c1/>): ein TERCOM/SITAN-Geländeabgleich-Navigator über einem DEM (Loader für <c2/> + Generator für synthetische Fixtures) und ein kombinierter GPS-verweigerter Navigator aus Schwere + Magnetfeld (IGRF) + Gelände, bereitgestellt als Szenariotypen <c3/> und <c4/>. Validiert durch die Konvergenz des Geländeabgleichs (ein bekannter eingebrachter Versatz wird zurückgewonnen) und einen beschränkten Fehler des kombinierten Filters über ein GPS-verweigertes Fenster.

# text
# c1: lunar
seg-bd01ec72fa2a = <b>LunaNet-LANS-Geometrie</b> (<c1/>): benannte Standorte auf der Mondoberfläche (Apollo 11/15/16, Shackleton-Rand) mit maßgeblichen selenographischen Koordinaten, Blickwinkel von der Oberfläche (Az/El/Entfernung), Sichtbarkeit/Abdeckung und DOP des Standorts, validiert gegen den Mondradius, die veröffentlichten Standortkoordinaten und die Identität der radialen Elevation von { "90" }° im Zenit.

# text
# c1: eci_track
seg-2dad9cf59ea9 = <b>Geführter Browser-Playground</b>: Schieberegler im geführten Modus, ein Ausgabebereich mit Tabs, ein Rundgang-Overlay beim ersten Start, Modi für Parameter-Sweep und Überlagerung mehrerer Läufe, eine abhängigkeitsfreie 3D-Bahnansicht per Canvas/SVG (das Orbit-Paket gibt nun additiv <c1/> aus), ein Embed-/iframe-Modus und Download als HTML-Bericht — jeweils mit Node-Unit-Tests in der CI.

# text
# c1: tests/imu_allan_spec.rs
seg-261604603d67 = <b>Anhand von Datenblättern validiertes IMU-Fehlermodell</b> (<c1/>): ARW/VRW/Bias-Instabilität von ADIS16465/16488/16460 werden aus der synthetisierten Allan-Abweichung zurückgewonnen und gegen die Herstellerangaben geprüft (Identifikation nach NIST SP1065 / IEEE { "952" }).

# text
# c1: tests/allan_nist_sp1065_1000point.rs
seg-dc7b9bdb3076 = <b>Validierung der Allan-Schätzer nach NIST SP1065</b> (<c1/>): Die vier Schätzer reproduzieren die veröffentlichten Referenzabweichungen für 1000 Punkte und die Konfidenzgrenzen aus Tabelle 32.

# text
# c1: sbas
# c2: sbas_protection_level
# c3: orbit::invert4
# c4: iono_free_l1l5
# c5: γ₁₅ = 1.79327
# c6: do316_compliance_map
# c7: inv(GᵀG)
# c8: docs/COMPLIANCE.md
seg-5d50be22aacd = <b>SBAS / DO-229E-Schutzniveaus, ionosphärenfrei L1/L5 und eine DO-316-compliance-Zuordnung</b> (Modul <c1/>). <c2/> bildet die gewichtete Geometriematrix aus Elevation/Azimut jedes Satelliten und dem Fehlerbudget aus UDRE/GIVE/Flugzeug/Tropo, invertiert die Normalmatrix (gemeinsam genutztes <c3/>) und projiziert die Varianzen über die K-Faktoren aus DO-229E (PA 6.0/5.33, NPA { "6.18" }) auf HPL/VPL. <c4/> ergänzt die ionosphärenfreie GPS-L1/L5-Pseudostrecke (IS-GPS-705, <c5/>), validiert dafür, die unabhängige Ionosphärenverzögerung erster Ordnung der Engine aufzuheben. <c6/> ordnet Anforderungen aus DO-316/DO-229E den umsetzenden Funktionen zu. Validiert gegen die geschlossenen Definitionen der K-Faktoren, die numpy-Referenzgeometrie <c7/> und die Kovarianzidentität über zwei Wege; der Gegenabgleich der veröffentlichten PL mit RTKLIB/gLAB ist als in Prüfung ausstehend in <c8/> dokumentiert.

# text
# c1: gravity_sh::SphericalHarmonicField
# c2: C̄_nm, S̄_nm
# c3: egm2008_data.rs
# c4: tools/gen_egm2008.py
# c5: tools/egm2008_to70.gfc
# c6: .gfc
# c7: from_gfc
# c8: C̄00
# c9: −μr/|r|³
# c10: forces::zonal_accel
seg-e9e60b40e42a = <b>Vollständige tesserale Kugelflächenfunktions-Schwerefeld — das Feld EGM2008 bis Grad/Ordnung { "70" }.</b> Ein neues <c1/> wertet das Geopotential und seine Beschleunigung im erdfesten Bezugssystem aus vollständig normierten Koeffizienten <c2/> aus und nutzt die stabile normierte Legendre-Rekursion nach Holmes–Featherstone (eine Denormierung würde bei diesem Grad überlaufen). Die ausgelieferten Koeffizienten sind das NGA-Produkt EGM2008 (gemeinfrei, über ICGEM), gebündelt in <c3/> und bitgenau von <c4/> aus der eingecheckten <c5/> reproduziert; jedes ICGEM-Modell <c6/> lässt sich über <c7/> laden. Validiert gegen drei unabhängige Referenzen: Kollaps zur Punktmasse (nur <c8/> = <c9/>), ein reines Zonalfeld, das das bestehende <c10/> auf ~{ "1e-9" } reproduziert, und die analytische Beschleunigung, die dem Differenzengradienten des direkt aufsummierten Potentials auf <{ "1e-6" } entspricht.

# text
# c1: forces::lense_thirring_accel
# c2: ForceModel::lense_thirring()
seg-c33a2dbf851d = <b>Allgemein-relativistische Lense–Thirring-Beschleunigung (Rahmenmitführung)</b> (<c1/>, IERS { "2010" } Gl. { "10.12" }), der gravitomagnetische Term über die bestehende Schwarzschild-Korrektur hinaus, über ein neues Flag <c2/> in den numerischen Propagator eingebunden. Validiert als linear im Drehimpuls der Erde und um { "1" }–{ "2" } Größenordnungen unterhalb des Schwarzschild-Terms, dem Bereich der Messungen von LAGEOS / Gravity Probe B.

# text
# c1: Propagator
# c2: NumericalPropagator
# c3: ForceModel
# c4: Tolerance
# c5: Integrator
# c6: Sgp4
# c7: propagator::Propagator
# c8: state_at(t_seconds) -> StateVector
# c9: Box<dyn Propagator>
# c10: PropagatorError
seg-909562023109 = <b>Ein Trait <c1/>, der die analytischen und numerischen Bahnpropagatoren vereint.</b> Der numerische Cowell-Propagator mit Kraftmodell ist nun ein gleichrangiger Partner von SGP4: Ein neuer Typ <c2/> (Anfangszustand + <c3/> + <c4/> + Wahl zwischen Schrittverdopplung oder Dormand–Prince <c5/>) und <c6/> implementieren beide <c7/>, dessen <c8/> den inertialen TEME-Zustand in SI-Einheiten (m, m/s) zurückgibt, sodass beide hinter einer <c9/> austauschbar sind. Die SGP4-Implementierung ist die exakte Umrechnung km/min→SI der inhärenten Methode (durch einen Gleichheitstest verifiziert); die numerische Implementierung besteht über den Trait dasselbe Submeter-Gate mit exaktem Kepler, die beiden adaptiven Treiber stimmen überein, und ein <c10/> macht den zugrunde liegenden SGP4-Code sichtbar.

# text
seg-d094880df57b = Dieses Release schließt die größte Korrektheitslücke der Engine: Erdorientierung und Reduktion der Bezugssysteme erfolgen nun in Güte einer Referenzimplementierung (<b>bitgenau gegen ERFA/SOFA</b> validiert), der Integritätsstapel erhält <b>ARAIM mit zwei Konstellationen</b> auf realen GPS+Galileo-TLEs, und die Schichten für Propagation, Quantensensorik, Mond/cislunar und Geomagnetik werden alle vertieft — dazu eine typisierte Python-API, ein reichhaltigerer Browser-Playground und eine Reproduzierbarkeitsmatrix auf drei Betriebssystemen. Höhepunkte:

# text
seg-bfe1d4a7cabd = <b>Bezugssysteme, bitgenau.</b> Vollständige Nutation IAU 2000A und 2000B, Präzession IAU { "2006" }, die CIO-basierte Reduktion (X, Y, s) IAU 2006/2000A GCRS↔ITRS, Polbewegung nach IERS und Ausgabesysteme TEME→GCRS/ITRS — jeweils bitgenau gegen die Referenzroutinen von ERFA/SOFA validiert.

# text
# c1: docs/ARAIM_REFERENCE.md
seg-bb5705347a24 = <b>ARAIM mit zwei Konstellationen</b> (GPS + Galileo) auf realen TLEs, mit HPL/VPL, Ausgabe als Stanford-Diagramm und einer offenen <c1/>.

# text
seg-2865dadcd4c8 = <b>Cislunares PNT</b>: ein CR3BP-Propagator für Erde–Mond, die Bezugssysteme MCI↔MCMF, selenographische Koordinaten und ein lauffähiges Szenario zur LunaNet-Mondintegrität.

# text
seg-3b636707a158 = <b>Quantensensorik</b>: Coriolis- und AC-Stark-Systematiken für das Kaltatom-Interferometer, ein Drift-Sweep und Validierung gegen das Budget von Freier ({ "2016" }).

# text
seg-10bc94801a6a = <b>IGRF-14</b>, Hauptfeldmodell des Erdmagnetfelds, in sich geschlossen und validiert.

# text
# c1: RunOutput
# c2: ScenarioMeta
# c3: .data()
# c4: scenario_kinds
# c5: validate_toml
seg-6485f627d793 = <b>Typisierte Python-API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, Typ-Stubs) mit einem Wheel-Build in der CI sowie gleichrangiger GCRS/ITRS-Propagatorausgabe und CCSDS-OMM-Export.

# text
# c1: sgp4
# c2: src/
# c3: ubuntu
# c4: macos
# c5: windows
seg-2b7693641333 = <b>Glaubwürdigkeit & Reproduzierbarkeit</b>: ein direkter Genauigkeitsvergleich von SGP4 mit dem unabhängigen Crate <c1/>, ein Abdeckungs-Gate in der CI (~{ "97" } % der Zeilen in <c2/>) und eine Reproduzierbarkeitsmatrix auf drei Betriebssystemen (<c3/>/<c4/>/<c5/>).

# text
# c1: src/report.rs
# c2: src/chart.rs
# c3: web/app.js
# c4: src/hybrid.rs
# c5: jamming.rs
# c6: timetransfer.rs
# c7: spoof.rs
# c8: raim.rs
# c9: lunar.rs
# c10: ensemble.rs
# c11: sweep.rs
# c12: gnss_sim.rs
# c13: fusion/pack.rs
# c14: inertial/mod.rs
# c15: #0e131b
# c16: --bg
# c17: --line
# c18: --fg
# c19: --accent-bright
# c20: --partial
# c21: --crit
seg-32e53ac66056 = <b>Jedes Diagramm im Playground passt nun zum Design der Website.</b> Alle zwölf SVG-Diagrammgeneratoren — das Ergebnis-/Holdover-Diagramm (<c1/> + <c2/>), das Allan-Abweichungs-Diagramm (<c3/>) und jedes Szenariodiagramm (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + Verfügbarkeit, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — verwendeten kühle marineblaue Flächen (<c15/>), kühlgraue Achsen/Texte und eine unpassende Serienpalette aus Rot/Blau/Violett. Sie verwenden nun durchgehend die warme Graphitpalette: Flächen in <c16/>, warmes Raster in <c17/>, Beschriftungen in <c18/>, mit einheitlicher Zuordnung der Serien — Quanten = Honiggold (<c19/>), klassisch = warmes Bernstein (<c20/>), Spezifikation/Grenzwert = <c21/>. Sicherheitskodierte Ansichten behalten ihre Bedeutung: Das RAIM-Stanford-Diagramm bleibt grün (verfügbar) / bernsteinfarben (irreführend) / rot (gefährlich) / gedämpftes Stahlgrau (nicht verfügbar), und HPL/VPL erscheinen als Gold/Bronze.

# text
# c1: Kshana v<version> · <scenario-hash> · kshana.dev
seg-2bb31dfc7756 = <b>Diagramme beschreiben sich beim Speichern/Herunterladen nun selbst.</b> Beide Diagramme tragen ihren Titel im SVG (der Titel des Allan-Diagramms + der Untertitel „lower is better“ standen zuvor nur als HTML um das Bild herum, sodass ein gespeichertes Bild keine Beschriftung hatte), und beide tragen eine Herkunftsfußzeile — <c1/> —, sodass ein heruntergeladenes Diagramm für sich allein steht und reproduzierbar bleibt.

# text
# c1: Kshana v<version> · scenario <hash> · kshana.dev
# c2: api::run_toml
# c3: .chart.svg
# c4: scenario
# c5: scenario_hash
# c6: docs/PROVENANCE.md
seg-9f528e334cd8 = <b>Jedes Diagramm trägt nun die Herkunftsfußzeile.</b> Die Fußzeile — <c1/> — wird zentral für alle Szenariotypen in <c2/> aufgebracht (zuvor nur bei den Diagrammen für Holdover und Allan), sodass jedes gespeicherte oder heruntergeladene Bild — aus dem Playground, aus dem Export <c3/> der CLI oder aus der HTML-Scorecard — seine Version, den Fingerabdruck des Szenarios und die Quelle erkennen lässt. Der Hash ist zur Klarheit mit <c4/> beschriftet und stammt, wo vorhanden, aus <c5/> des Ergebnisses, mit einem Rückgriff auf den Quell-Hash bei den Integritäts-/Mondberichten. Was der Fingerabdruck ist und warum er da ist, steht im Abschnitt „Output“ des README und in <a1><c6/></a1>.

# text
# c1: raim::chi2_quantile
# c2: read_dir
# c3: chi2_quantile
# c4: p
# c5: k
# c6: normal_quantile
# c7: assert!
# c8: Normal
seg-635697ed3fb1 = <b><c1/> und der Stanford-Rauschsampler von RAIM sind bei Eingaben außerhalb des Bereichs oder nicht endlichen Eingaben nun panikfrei</b> (ein von der Reihenfolge von <c2/> abhängiger Fuzz-Befund aus den neuen ARAIM-Szenarien). <c3/> sichert nun <c4/>/<c5/> wie <c6/> ab (gibt einen Randwert zurück, statt mit <c7/> abzustürzen), und das <c8/> des Stanford-Rauschens der Verfügbarkeit begrenzt auf ein streng positives σ — sodass der Integritäts-/ARAIM-Stapel bei mutierten oder falsch konfigurierten Szenarien nie in Panik gerät.

# text
# c1: reproducibility-matrix
# c2: tests/golden/
# c3: tests/cross_platform_golden.rs
# c4: golden.rs
# c5: sgp4_verification.rs
# c6: determinism.rs
# c7: docs/REPRODUCIBILITY.md
seg-b36a0c42845e = <b>CI-Matrix für plattformübergreifende Reproduzierbarkeit.</b> Ein neuer Job <c1/> führt die Reproduzierbarkeitstests bei jedem Push auf <b>ubuntu-latest, macos-latest und windows-latest</b> aus. Da das vollständige Ergebnis-JSON zwischen Betriebssystemen nicht bytegleich ist (Abweichung der libm in der letzten ULP), prüft er die plattforminvariante Projektion exakt — den Eingabe-Fingerabdruck plus die Form der Ausgabe, je Szenario als SHA-256-Goldens in <c2/> durch das neue <c3/> festgelegt — neben den numerischen Festlegungen (<c4/>, auf { "1e-6" }), den SGP4-Zuständen (<c5/>, auf { "2e-5" } km) und der Determinismus im selben Prozess (<c6/>). Zusammen belegen sie plattformübergreifende Reproduzierbarkeit auf drei Betriebssystemen, ohne die Brüchigkeit exakter Byte-Hashes der gesamten Ausgabe. <c7/> dokumentiert die Aufteilung.

# text
# c1: coverage
# c2: cargo-tarpaulin
# c3: src/
# c4: src/
seg-9b8c0a407387 = <b>Gate für die Code-Abdeckung in der CI.</b> Ein neuer Job <c1/> führt <c2/> mit der LLVM-quellbasierten Engine aus, veröffentlicht einen lcov-Bericht als Build-Artefakt und erzwingt eine Untergrenze der Zeilenabdeckung für <c3/> (generierte Datentabellen, der CLI-Einstiegspunkt, die Tests und Web-Assets ausgenommen). Die gemessene Zeilenabdeckung beträgt ~{ "97" } % in <c4/> (SGP4 und die Uhrenmodule ≥{ "95" } %); das Gate ist auf { "85" } % gesetzt — über dem Ziel von ≥{ "80" } % und deutlich vom gemessenen Wert entfernt, sodass es Regressionen erfasst, ohne instabil zu werden. Ein Abdeckungs-Badge wird im README veröffentlicht.

# text
# c1: sgp4
# c2: tests/sgp4_crate_comparison.rs
# c3: tcppver.out
# c4: tests/fixtures/sgp4_comparison.md
# c5: KSHANA_REGEN_FIXTURES=1
# c6: from_elements
seg-1dfc4beb239a = <b>SGP4/SDP4 im direkten Vergleich mit dem unabhängigen Crate <c1/>.</b> Ein neuer Test (<c2/>) validiert den Propagator von Kshana gegenüber der am weitesten verbreiteten SGP4-Bibliothek in Rust (neuromorphicsystems/sgp4, als reine Test-Dev-Abhängigkeit hinzugefügt) anhand derselben { "666" } Vektoren aus AIAA 2006-6753. Wenn beide mit dem Schwerefeldmodell WGS72 betrieben werden, das die Vektoren verwenden, stimmen die beiden unabhängigen Implementierungen bei erdnahen und resonanten Bahnen im <b>Submikrometerbereich</b> und über alle Regime im <b>ungünstigsten Fall auf { "4.12" } mm</b> überein; beide reproduzieren die Referenztabelle <c3/>. Die eingecheckte Vergleichstabelle (<c4/>, neu erzeugt über <c5/>) schlüsselt das Ergebnis nach Regime auf (LEO/MEO, Deep Space, ½-Tages- und 1-Tages-Resonanz) und vermerkt die vier bewusst pathologischen Fälle, die das Crate bei der Konstruktion zurückweist. Die Live-Assertions halten beide innerhalb von { "2e-5" } km der Referenz und lassen sie innerhalb von { "4e-5" } km übereinstimmen — eine Regressionssicherung, keine einmalige Prüfung. Das ist wettbewerbsfähige Herkunft: Korrektheit gegenüber einer unabhängigen Codebasis, nicht bloß gegenüber einer statischen Tabelle. (Das Standard-<c6/> des Crates verwendet WGS84 und weicht daher um ~km von der Referenz WGS72 ab — im Text der Tabelle ehrlich benannt.)

# text
# c1: src/omm.rs
# c2: orbit
# c3: kshana <orbit.toml> --export-omm out.omm
# c4: export_omm = true
# c5: <scenario>.omm
# c6: --export-sp3
# c7: YYYY-NNNP
# c8: tle::parse_tle_identity
# c9: OBJECT_NAME
# c10: OBJECT <id>
# c11: CREATION_DATE
# c12: api::export_omm
# c13: api::auto_export_omm
# c14: OmmFile::from_tle_block
# c15: OrbitClockScenario::to_omm_string
# c16: gps-ops
# c17: tests/sp3_export_roundtrip.rs
seg-dc75162ecd64 = <b>Der CCSDS-OMM-Export ist nun durchgängig erreichbar.</b> Der OMM-Writer (<c1/>) hatte zuvor keinen Pfad über CLI/API; die mittleren Elemente eines Szenarios <c2/> lassen sich nun als OMM-Katalog nach CCSDS 502.0-B-2 veröffentlichen — eine OMM-KVN-Nachricht je TLE-definiertem Satelliten — über <c3/>, oder <c4/> im Szenario schreibt <c5/> automatisch (analog zum bestehenden <c6/>). Jede Nachricht trägt die <b>reale</b> NORAD-Katalognummer des Satelliten, die internationale COSPAR-Bezeichnung (<c7/>) und die Epoche (CCSDS-Form Tag des Jahres), aus der TLE-Zeile { "1" } durch das neue <c8/> geparst; die Namenszeile wird zu <c9/> (sonst <c10/>). <c11/> ist die Epoche des Szenarios, nicht die Uhrzeit der Wanduhr, sodass die Ausgabe reproduzierbar ist. Neue API: <c12/> / <c13/>, <c14/>, <c15/>. Ein synthetisches Walker- oder RINEX-Szenario (ohne mittlere TLE-Elemente) liefert einen Fehler, statt eine leere Datei auszugeben. Validiert gegen den mitgelieferten Snapshot <c16/> mit 30 Satelliten (<c17/>).

# text
# c1: web/hover.mjs
# c2: web/app.js
# c3: <img>
# c4: web/hover.test.mjs
seg-036782a2b65e = <b>Interaktive Hover-Anzeigen auf den Diagrammen des Playgrounds.</b> Bewegt man den Cursor über ein Diagramm, rastet ein Fadenkreuz am nächsten Messwert ein und zeigt einen Wert-Tooltip (<c1/>, in <c2/> eingebunden). Beim Allan-Diagramm zeigt er τ und das σ_y(τ) jeder Uhr; bei den Zeitreihen-Szenariodiagrammen (Uhren-Holdover, Koppelnavigation, Zeitübertragung, hybrides PNT, GNSS/INS) zeigt er die Zeit und den Wert jeder Suite in den eigenen Einheiten des Diagramms (ns / m / ps / Auslastung), aus dem Ergebnis geparst, sodass die Anzeige zur Kurve passt. Spezialisierte Diagramme (RAIM, Spoof, Sweep) erhalten kein Overlay. Die Diagramme bleiben sich selbst beschreibende Blob-<c3/>s — das Overlay ist ein transparentes Fadenkreuz + Tooltip darüber, sodass Download/Vergleich/Export unberührt bleiben. Die Koordinatenmathematik (nächster Messwert, Cursor→Anteil im Plot, Parsen der Polylinie) ist per Unit-Test geprüft (<c4/>, in der CI ausgeführt).

# text
# c1: web/compare.mjs
# c2: web/app.js
# c3: web/compare.test.mjs
# c4: <img>
seg-1588ae024e5d = <b>A/B-Vergleichsmodus im Playground.</b> Man kann jeden Lauf als Basislinie A anheften, ein zweites Szenario ausführen, und beide werden nebeneinander mit einer Delta-Tabelle der Gütemaße (Holdover, Zeitgebung RMS/p95, Verfügbarkeit) angezeigt, die je Kennzahl den Gewinner einfärbt (<c1/>, in <c2/> eingebunden; Delta-Logik per Unit-Test in <c3/> geprüft, in der CI ausgeführt). Alle Werte werden als Text eingefügt und alle Diagramme über Blob-<c4/>, sodass nie etwas aus einer Szenario-Zeichenfolge als Markup eingeschleust wird.

# text
# c1: web/chartdl.mjs
# c2: web/app.js
# c3: kshana-<chart>-v<version>-<scenario-hash>.<ext>
# c4: web/chartdl.test.mjs
seg-6e7a99f8f275 = <b>Download-Schaltflächen für Diagramme (SVG + PNG).</b> Jedes Diagramm im Playground hat nun eine zum Design passende Leiste „Download SVG / PNG“ (<c1/>, in <c2/> eingebunden). SVG liefert das getreue, skalierbare Original; PNG rastert dasselbe sich selbst beschreibende Bild in 2x für Folien und Dokumente. Die Dateien werden mit ihrer Herkunft benannt — <c3/> — und die Logik für Dateiname/Größe ist per Unit-Test geprüft (<c4/>, in der CI ausgeführt).

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: src/igrf_data.rs
seg-4cb87e7dc892 = <b>IGRF-14, Hauptfeldmodell des Erdmagnetfelds (<c1/>).</b> Das Standard-Kugelfunktionsfeld der IAGA (Grad/Ordnung { "13" }, Epoche { "2025.0" } + säkulare Variation { "2025" }–{ "2030" }; Koeffizienten maschinell aus der offiziellen <c2/> durch <c3/> nach <c4/> erzeugt, bitgenau reproduzierbar). Eine Schmidt-normierte Synthese liefert den Feldvektor (Nord/Ost/Unten) und abgeleitete Elemente (Deklination, Inklination, horizontale/gesamte Intensität) an jedem geodätischen Ort zu jedem Datum, dazu den geomagnetischen Pol und die Dipolstärke — das magnetische Gegenstück zum Abgleich mit der Schwerekarte für die alternative PNT-Navigation. In sich geschlossen validiert: Die Synthese entspricht dem exakten geschlossenen Ausdruck des geneigten Dipols, das vollständige analytische Feld bis Grad 13 entspricht einer Differenzenbildung des skalaren Potentials, die Dipolachse reproduziert den bekannten geomagnetischen Pol (~{ "80.7" }°N, −{ "72.7" }°E) und eine Stärke von ~{ "29.7" } µT, und das globale Feld ist physikalisch.

# text
# c1: src/python.rs
# c2: run
# c3: run_full
# c4: RunOutput
# c5: .json
# c6: .svg
# c7: .summary
# c8: .data()
# c9: run_typed
# c10: scenario_kinds()
# c11: validate_toml()
# c12: kshana.pyi
# c13: py.typed
# c14: docs/PYTHON_API.md
seg-c69d50031da4 = <b>Typisierte Python-Bindings (<c1/>).</b> Über das Muster String-hinein/String-heraus von <c2/>/<c3/> hinaus stellt das Modul nun eine typisierte Klasse <c4/> bereit (<c5/>, <c6/>, <c7/> und ein Accessor <c8/>, der das Ergebnis geparst als natives Python-Dict zurückgibt — ohne erneutes JSON-Parsen, mit NumPy umhüllbar), dazu <c9/>, <c10/> (geparste Liste von Metadaten-Dicts) und <c11/> (eine Liste von Fehlermeldungen ohne Exception). Es liefert einen Typ-Stub nach PEP { "561" } (<c12/> + <c13/>) für mypy/pyright/Editoren und eine Kurzanleitung <c14/> mit. Die bestehenden Funktionen sind unverändert.

# text
# c1: src/orbit.rs
# c2: Frame
# c3: position_in_frame
# c4: state_gcrs
# c5: Propagator
# c6: gcrs_to_itrs
# c7: state_gcrs
seg-fb65ac14344c = <b>Gleichrangige Ausgabesysteme für Propagatoren (<c1/> Enum <c2/> + <c3/> + <c4/>).</b> Jeder <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) kann seine Position nun in TEME, <b>GCRS</b> (≈ J2000) oder <b>ITRS</b> (erdfest) ausgeben — TEME nativ, GCRS über die validierte Reduktion TEME→GCRS, ITRS durch Verkettung mit der CIO-Rotation <c6/> nach IAU 2006/2000A — und seinen vollständigen GCRS-Zustand (Position + Geschwindigkeit) über <c7/>. Die inertiale Ausgabe zur jeweiligen Epoche ist nicht mehr auf TEME beschränkt.

# text
# c1: src/cio.rs
# c2: X, Y
# c3: eraNut06a
# c4: s
# c5: eraS06
# c6: tools/gen_s06.py
# c7: src/cio_s06_data.rs
# c8: eraC2ixys
# c9: eraEra00
# c10: eraC2tcio
# c11: eraXys06a
# c12: eraC2ixys
# c13: eraEra00
seg-8f596733c439 = <b>CIO-basierte Reduktion von himmelsfest zu erdfest nach IAU 2006/2000A (<c1/>).</b> Die moderne, äquinoktiumsfreie Kette GCRS↔CIRS↔ITRS: CIP-Koordinaten <c2/>, aus der Matrix für Bias-Präzession-Nutation nach IAU 2006/2000A abgelesen (unter Wiederverwendung der validierten FW-Präzession + Nutation 2000A mit der Anpassung <c3/> P03), die 66-Term-Reihe des CIO-Locators <c4/> (<c5/>, maschinell aus der ERFA-Referenz durch <c6/> nach <c7/> erzeugt, bitgenau reproduzierbar), die Matrix GCRS→CIRS (<c8/>), der Erdrotationswinkel (<c9/>) und die vollständige Rotation GCRS→ITRS (<c10/>, zusammengesetzt mit der bestehenden Polbewegung nach IERS). <b>Bitgenau</b> validiert gegen die veröffentlichten Testvektoren <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 bei JD_TT { "2453736.5" }), <c12/> und <c13/>. Die CIO-Kette und die ältere Reduktion TEME nach Äquinoktium/GMST-1982 stimmen nachweislich überein, bis auf ihren dokumentierten Konventionsunterschied der Sternzeit von ≈{ "2" }·(Äquinoktien-Gleichung). Dies ist die strenge Reduktion, die der Pfad über Äquinoktium/GMST angenähert hat.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_matrix_2000a
# c4: nut00a
# c5: tools/gen_nut00a.py
# c6: src/nutation_iau2000a_data.rs
# c7: eraNut00a
# c8: nutation_matrix_2000a
seg-32e6d8dfcebc = <b>Vollständige Nutationsreihe IAU 2000A (<c1/> <c2/>, <c3/>).</b> Das vollständige Modell MHB2000 — { "678" } lunisolare + { "687" } planetare Terme — auf < { "0.1" } mas genau, neben der bestehenden Kürzung 2000B mit 77 Termen. Die Tabellen werden maschinell aus der Referenz <c4/> von IAU SOFA / ERFA durch <c5/> nach <c6/> erzeugt (der Generator reproduziert die eingecheckte Datei bitgenau), und die gesamte Reihe — sowohl die Sätze fundamentaler Argumente nach IERS-2003 und MHB2000 als auch die planetaren Längen — ist <b>bitgenau</b> gegen den veröffentlichten Testvektor <c7/> validiert (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } bei JD_TT { "2453736.5" }, auf { "1e-13" } rad). Die Standardreduktion TEME→GCRS behält die Reihe 2000B (~{ "1" } mas, unterhalb der Vereinfachung der Geschwindigkeits-Bezugssystemrotation der Kette); <c8/> stellt die Matrix zur jeweiligen Epoche mit < { "0.1" } mas für Aufrufer bereit, die sie brauchen.

# text
# c1: kind = "lunar-integrity"
# c2: scenarios/lunanet-araim.toml
# c3: src/lunar.rs
# c4: LunarScenario
# c5: south_pole_hpl_pass
# c6: LunarReport
seg-35e9e419d2ae = <b>Lauffähiges Szenario zur Mondintegrität (<c1/>, <c2/>).</b> Bindet den Durchgang mit Schutzniveau am Mondsüdpol (<c3/> <c4/> → <c5/>) mit einem JSON-<c6/> und einem SVG-Diagramm HPL über Zeit in den Szenario-Runner ein, sodass der cislunare Integritätsfall direkt aus der CLI erreichbar ist. Es macht die Lücke ehrlich sichtbar: Mit dem LANS-σ_URE von { "30" } m überschreitet das HPL am Südpol (≈ { "260" }–{ "450" } m) einen Alarmgrenzwert von { "50" } m ({ "0" } % verfügbar) — die Integrität des Mond-PNT ist noch nicht erreicht.

# text
# c1: src/raim.rs
# c2: src/orbit.rs
# c3: scenarios/araim-gps-galileo.toml
# c4: araim_dual_constellation_availability
# c5: visible_positions_labeled
# c6: IntegrityScenario
# c7: araim_dual
# c8: tests/araim_dual_real_data.rs
seg-1910e8110b43 = <b>Verfügbarkeit von ARAIM mit zwei Konstellationen auf realen GPS+Galileo-TLEs und Anbindung an den Szenario-Runner (<c1/>, <c2/>, <c3/>).</b> Fügt <c4/> hinzu (die fortgeschrittene ARAIM-Engine — Fehler einzelner Satelliten <em>und</em> konstellationsweite Fehler — über ein Zeitraster ausgeführt) und <c5/>, und bindet sie über ein Flag <c7/> in den Runner <c6/> ein, sodass eine ARAIM-Studie mit mehreren GNSS direkt aus TOML erreichbar ist. Ein Test mit realen Daten (<c8/>) auf mitgelieferten Celestrak-Snapshots von GPS+Galileo vom 2026-06-07 zeigt, dass das Zusammenlegen mit Galileo die Verfügbarkeit von ARAIM bei einem anspruchsvollen VAL von { "12" } m von { "0.21" } auf { "0.67" } hebt ({ "10.5" }→{ "21.8" } Satelliten in Sicht), während der gegen Konstellationsfehler robuste Modus mit nur zwei Konstellationen grundsätzlich begrenzt ist — der quantitative Grund, warum robuste Integrität mit zwei Konstellationen auf eine dritte Konstellation oder SBAS hinausläuft. Ehrlicher Restpunkt: die numerisch exakte Reproduktion von Tabelle A-3 der EU-ARAIM-TN gegen eine einzelne versionsgebundene Epoche und ein Zenodo-Fixture-Eintrag.

# text
# c1: src/cr3bp.rs
# c2: cr3bp_accel
# c3: propagate_cr3bp
# c4: jacobi_constant
# c5: lagrange_points
# c6: src/lunar.rs
seg-78ab887a4543 = <b>Eingeschränktes Dreikörperproblem auf Kreisbahnen (CR3BP) für das System Erde–Mond (<c1/>).</b> Ein neuer Kern für die cislunare Dynamik, den die Zweikörper-/SGP4-Propagatoren nicht bieten können: Bewegungsgleichungen im rotierenden System (<c2/>), ein RK4-Propagator (<c3/>), das Integral der Jacobi-Konstante (<c4/>) und die fünf Lagrange-Punkte (<c5/>). Validiert gegen geschlossene bzw. veröffentlichte Anker: die kollinearen Punkte von Erde–Mond (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), die exakten gleichseitigen L4/L5 = (½−μ, ±√3/2, { "0" }), alle fünf als Gleichgewichte des Feldes bestätigt, Jacobi-Konstante unter Propagation bis auf die Integratorgenauigkeit erhalten, und die aus der Ebene herausführende Rückstellkraft, die Halo-/NRHO-Bahnen möglich macht. Dies ist die Grundlage, um eine reale NRHO darzustellen. Ehrlicher Restpunkt: differentiell korrigierte periodische Anfangsbedingungen der NRHO { "9" }:{ "2" }, das exzentrische/Ephemeriden-Modell (DE) und die denormierte Transformation in die selenozentrischen Bezugssysteme von <c6/>.

# text
# c1: src/frames.rs
# c2: polar_motion_matrix
# c3: iauPom00
# c4: W = Rx(−y_p)·Ry(−x_p)·Rz(s′)
# c5: s′
# c6: pef_to_itrf
# c7: itrf_to_pef
# c8: teme_to_itrf
# c9: teme_to_ecef
# c10: x_p
# c11: y_p
seg-14f4572144f3 = <b>Polbewegung nach IERS und die Reduktion TEME→ITRF (<c1/>).</b> Fügt <c2/> hinzu (SOFA <c3/>: <c4/> mit dem TIO-Locator <c5/>), <c6/> / <c7/> und <c8/> — die GMST-basierte Rotation TEME→PEF gefolgt von der Polbewegung —, womit eine ITRF-genaue erdfeste Position auf dem rein GMST-basierten <c9/> vervollständigt wird (die Polbewegung ist beim Bahnradius ein Effekt von mehreren zehn Metern). <c10/>/<c11/> sind beobachtete IERS-Größen, die der Aufrufer liefert. Ehrlicher Restpunkt: eine vollständig CIO-basierte Kette (X, Y, s) und eine numerische Gegenprüfung mit ANISE/SPICE auf <{ "10" } m bleiben Folgearbeiten.

# text
# c1: src/inertial/quantum_imu.rs
# c2: docs/QUANTUM.md
# c3: Φ_cor = 2·k_eff·v_⊥·Ω·T²
# c4: coriolis_phase
# c5: 2·Ω×v
# c6: coriolis_accel_bias
# c7: Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: docs/QUANTUM.md
seg-b5e84faf880c = <b>Systematiken des Kaltatom-Interferometers, Drift-Sweep und Validierung an einem veröffentlichten Gerät (<c1/>, <c2/>).</b> Erweitert den CAI-Beschleunigungsmesser aus ersten Prinzipien um die zwei führenden deterministischen Systematiken: die <b>Coriolis-/Rotations</b>-Phase <c3/> (<c4/>, mit dem äquivalenten Beschleunigungs-Bias <c5/> über <c6/>) und die Phase der <b>AC-Stark-Lichtverschiebung</b> <c7/> (<c8/>, die sich bei konstanter Verschiebung durch die Symmetrie π/2–π–π/2 aufhebt). Fügt <c9/> hinzu (Drift der Koppelnavigationsposition über die Zykluszeit — der Kern eines Vergleichs Quanten vs. klassisch) und einen Validierungstest gegen das mobile Gravimeter von Freier et al. { "2016" } (arXiv:{ "1512.05660" }): Der modellierte Boden des Quantenprojektionsrauschens liegt unterhalb des veröffentlichten kurzzeitigen Rauschens von { "96" } nm/s²/√Hz und innerhalb von ~{ "2" } Größenordnungen davon. <c10/> aktualisiert. Ehrlicher Restpunkt: Systematiken von Wellenfront/Strahlausrichtung, Auflösung der Streifenmehrdeutigkeit, die exakte Reproduktion der Flugtests CARIOQA-PMP / Boeing-AOSense (erfordert veröffentlichte PSDs der Plattform) und eine JS-Playground-Voreinstellung.

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: selenographic_to_mcmf
# c6: south_pole_hpl_pass
seg-f32829ed9cf1 = <b>Reduktion cislunarer Bezugssysteme und ein Integritätsdurchgang am Mondsüdpol (<c1/>).</b> Erweitert die ARAIM-Engine für den Mond um die Rotation MCI↔MCMF (Moon-centered inertial ↔ Moon-fixed) (<c2/> / <c3/>, ein vereinfachtes Modell der mittleren Rotation mit der siderischen Rate des Mondes), selenographische Breite/Länge/Höhe (<c4/> / <c5/>) und <c6/> — ein gelandeter Empfänger in der Artemis-Region gegenüber einem repräsentativen LunaNet-Relais-Satz über einen Durchgang von { "24" } h, der die Integritätslücke ehrlich beziffert: Mit dem nominalen LANS-σ_URE von { "30" } m ist das Schutzniveau endlich, überschreitet aber einen Alarmgrenzwert für Oberflächeneinsätze von { "50" } m. Ehrlicher Restpunkt: die präzise LANS-NRHO-Ephemeride (eine cislunare Bahn mit 3 Körpern), die physikalische Libration / der präzedierende Mondpol (DE421/SPICE) und ein LunaNet-TOML-Szenario bleiben Folgearbeiten.

# text
# c1: src/raim.rs
# c2: docs/ARAIM_REFERENCE.md
# c3: IntegritySupportMessage
# c4: .fault_priors()
# c5: .dual_fault_priors()
# c6: araim_raim
# c7: araim_dual_raim
# c8: stanford_svg
# c9: PL = error
# c10: docs/ARAIM_REFERENCE.md
# c11: araim_dual_raim
seg-5ef720855cc4 = <b>ARAIM-Integritätsunterstützungsnachricht, Stanford-Diagramm als SVG und die offene ARAIM-Referenz (<c1/>, <c2/>).</b> Fügt eine explizite <c3/> hinzu (σ_URA / σ_URE / b_nom / P_sat / P_const, mit den Referenzwerten der WG-C für GPS+Galileo und Konvertern <c4/> / <c5/> in die Engines <c6/> für Einzelfehler und <c7/> für konstellationsweite Fehler), einen eigenständigen Renderer <c8/> des Stanford-Integritätsdiagramms (die vier Zonen, die Grenze <c9/>, die Hilfslinien des Alarmgrenzwerts, eine farbkodierte Markierung je Epoche) und <c10/>, das den Algorithmus, die ISM, die Fehlerhypothesen, den Vertrag des Schutzniveaus und den Nutzen von zwei Konstellationen dokumentiert. Tests belegen den Gewinn an Geometrie/Redundanz (das Zusammenlegen einer zweiten Konstellation verengt das HPL bei Einzelfehlern) und die Toleranz gegenüber Konstellationsfehlern (der Nutzer mit zwei Konstellationen übersteht den Verlust einer ganzen Konstellation; ein Nutzer mit einer einzigen Konstellation nicht). Ehrlicher Restpunkt: die numerische Reproduktion von Tabelle A-3 der EU-ARAIM-TN / der Verfügbarkeitszahl von { "15" }–{ "25" } % gegen einen versionsgebundenen realen TLE-Snapshot, ein Zenodo-Fixture-Eintrag und die Anbindung von <c11/> an den Runner für Szenariodateien.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000b
# c3: iauNumat
# c4: teme_to_gcrs(r, v, jd_tt)
# c5: gcrs_to_teme
# c6: nut00b
# c7: eraNut00b
# c8: ROADMAP.md
seg-3607eb34acd9 = <b>Nutation IAU 2000B und die vollständige inertiale Reduktion TEME→GCRS/J2000 (<c1/>).</b> Fügt das zweite und dritte Stück einer echten inertialen Reduktion der Bezugssysteme zur ausgelieferten Präzession IAU { "2006" } hinzu: die lunisolare Nutationsreihe MHB2000 mit 77 Termen (<c2/>, die übliche Kürzung IAU 2000B, auf ~{ "1" } mas genau) mit den fundamentalen Argumenten nach Delaunay und der Nutationsmatrix <c3/> von SOFA, sowie die Kette nach Vallado AIAA-2006-6980 TEME→TOD (Gleichung der Äquinoktien) → TOD→MOD (Nutation) → MOD→GCRS (Bias-Präzession), bereitgestellt als <c4/> / <c5/>. Die Reihe, die Argumente und die Einheitenkonstanten sind aus der Referenz <c6/> von IAU SOFA / ERFA übertragen und <b>bitgenau</b> gegen den veröffentlichten Testvektor <c7/> validiert (Δψ, Δε auf { "1e-13" } rad). Ehrlicher Restpunkt: die vollständige Reihe IAU 2000A mit 678 Termen (<{ "0.1" } mas), eine numerische Gegenprüfung mit ANISE/SPICE auf <{ "10" } m und die Polbewegung bleiben Folgearbeiten (siehe <c8/>).

# text
seg-d9b5e459f6eb = Dieses Release bringt Kshanas ersten <b>nicht analytischen Bahnpropagator</b> — einen Cowell-Integrator mit einem hierarchischen Kraftmodell aus sechs Störungen (Zweikörper + zonale Terme J2–J6 + von der Epoche abhängiger dritter Körper Sonne/Mond + Strahlungsdruck der Sonne mit konischem Umbra-/Penumbra-Schatten + atmosphärischer Widerstand + die post-newtonsche relativistische Schwarzschild-Korrektur), angetrieben von der Wahl zwischen zwei adaptiven Integratoren (RK4 mit Schrittverdopplung und das eingebettete Paar Dormand–Prince RK5({ "4" })) — zusammen mit einer Schicht für Manöver / Trajektorienentwurf (impulsive und endliche Brennphasen, ein Lambert-Löser nach Izzo und ein Porkchop-Sweep), einer Alt-PNT-Schicht mit Schwerekartenabgleich, die eine 60-minütige GPS-verweigerte Spur auf unter { "500" } m zurückgewinnt, einer Pipeline zur Bahnbestimmung im Batch- und sequenziellen Verfahren und einem vollständigen eng gekoppelten GNSS/INS-UKF mit 17 Zuständen und Quanten-CAI-Koppelnavigation. Jede numerische Fähigkeit ist an analytische Wahrheit oder einen von Hand hergeleiteten geschlossenen Ausdruck gebunden; die standardmäßig abgeschalteten Störungen lassen die veröffentlichten Goldens unberührt.

# text
# c1: forces::relativistic_accel
# c2: propagator::ForceModel::relativity
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: (r, v)
# c6: accel_rv
# c7: 3μ²/(c²r³)·r̂
# c8: ≈1.9·10⁻⁹
# c9: μ/(c²r)
# c10: μ(4μ + 3v²r)/(c²r³)
# c11: β
# c12: γ
seg-aa8d478f5c10 = <b>Post-newtonsche relativistische Korrektur (Schwarzschild) (<c1/> + <c2/>).</b> Fügt die dominante allgemein-relativistische Störung auf einer erdnahen Bahn hinzu — den führenden Treiber der relativistischen Perigäumsdrehung — in der Form <c3/> nach IERS / Montenbruck–Gill: <c4/>. Wie der atmosphärische Widerstand ist sie <b>geschwindigkeitsabhängig</b> und wird daher über [<c6/>] in die rechte Seite des Integrators <c5/> eingebracht, optional und standardmäßig abgeschaltet. In sich geschlossen validiert: Auf einer Kreisbahn fällt sie auf den geschlossenen Ausdruck <c7/> zusammen (rein radial und <b>nach außen</b> gerichtet, Komponenten abseits der Achse exakt null); ihr <b>Verhältnis zum Zweikörperterm ist im LEO der Lehrbuchwert <c8/></b> (die Signatur von <c9/>); ein Fall mit radialer Geschwindigkeit entspricht dem von Hand vereinfachten <c10/>; und im Propagator <b>stört sie die Bahn, ohne sie zu dissipieren</b> — die große Halbachse bleibt auf deutlich unter einen Meter pro Tag erhalten, strukturell das Gegenteil des monotonen Zerfalls durch Widerstand. Weil sie standardmäßig abgeschaltet ist, bleiben die Goldens für Zweikörper/J2/zonal unberührt. Das Abstimmen der PPN-Parameter (<c11/>,<c12/>) und der Term der Lense–Thirring-Rahmenmitführung bleiben Folgearbeiten.

# text
# c1: forces::conical_shadow
# c2: ν ∈ [0,1]
# c3: a = asin(R☉/d☉)
# c4: b = asin(Rₑ/|r|)
# c5: c
# c6: ν
# c7: c ≥ a+b
# c8: c ≤ b−a
# c9: c ≤ a−b
# c10: srp_accel
# c11: forces::SOLAR_RADIUS
# c12: ν = 1
# c13: ν = 0
# c14: ν
# c15: c = b
# c16: [b−a, b+a]
# c17: 0 < ν < 1
# c18: cylindrical_shadow
seg-043e831224ab = <b>Konisches Schattenmodell aus Umbra+Penumbra (<c1/>), nun vom Strahlungsdruck der Sonne verwendet.</b> Rüstet die binäre Finsternis mit Umbra-Zylinder auf einen glatten Faktor <c2/> auf: Sonne und Erde werden als Scheiben mit scheinbaren Winkelradien <c3/>, <c4/> und scheinbarem Mittelpunktabstand <c5/> modelliert, und <c6/> ist eins minus der Anteil der Sonnenscheibe, der von der Erdscheibe verdeckt wird (die Überlappungsfläche zweier Kreise, die Linse) — volle Sonne für <c7/>, totale Umbra für <c8/>, ringförmig für <c9/> und dazwischen eine kontinuierliche Penumbra. <c10/> verwendet ihn nun, sodass die Kraft des Strahlungsdrucks durch die Finsternis hindurch glatt abklingt, statt ein- und auszuschalten. Fügt den nominalen IAU-Wert <c11/> hinzu. In sich geschlossen validiert: <c12/> in voller Sonne und <c13/> tief in der Umbra (exakt), eine <b>glatte monotone Penumbra</b> (<c14/> steigt über das Band <c16/> von { "0" } → ~½ bei <c15/> → { "1" }) und die konische Penumbra <b>reicht über den Umbra-Zylinder hinaus</b> (ein Punkt, den der binäre Zylinder als voll beleuchtet bezeichnet, ist für den Kegel <c17/>). Der einfachere <c18/> bleibt verfügbar; Randverdunkelung der Sonne und der Schatten der abgeplatteten Erde bleiben Folgearbeiten.

# text
# c1: integrator::dopri54_step
# c2: integrator::integrate_dopri
# c3: propagator::propagate_dopri
# c4: 0.9·(1/err)^(1/5)
# c5: propagator::propagate_dopri
# c6: y' = y
# c7: e
# c8: propagate_dopri
seg-8d1c16019f3c = <b>Eingebetteter Integrator Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Fügt das standardmäßige eingebettete Butcher-Tableau-Paar von Dormand–Prince ({ "1980" }) neben dem bestehenden RK4-Treiber mit Schrittverdopplung hinzu: Sieben FSAL-Stufen liefern aus einem Satz von Auswertungen eine Lösung 5. Ordnung und eine Fehlerschätzung 4. Ordnung ({ "7" } gegenüber { "11" } Funktionsaufrufen je Schritt), eine günstigere Schätzung des lokalen Fehlers. Der adaptive Treiber verwendet dieselbe RMS-Fehlernorm und denselben Schrittregler <c4/>, ist also eine direkt austauschbare Alternative; <c5/> stellt ihn für das Kraftmodell der Bahn bereit. In sich geschlossen validiert: Die eingebettete Fehlerschätzung ist <b>O(h⁵)</b> (Halbieren des Schritts senkt sie um ~{ "32" }×); DP5({ "4" }) integriert <c6/> bis <c7/> und den harmonischen Oszillator über { "50" } Perioden bei Energieerhaltung auf <{ "1e-6" }; er erreicht denselben Endpunkt bei gleicher Toleranz mit <b>weniger Funktionsauswertungen</b> als die Schrittverdopplung (ohne Genauigkeit zu opfern); und <c8/> besteht dasselbe Gate gegen die analytische Wahrheit wie der RK4-Pfad — <b>unter einem Meter gegenüber der exakten Kepler-Lösung in universellen Variablen über eine LEO-Bahn von { "24" } h</b> — während die beiden Treiber auf einer J2..J6-Bahn (ohne geschlossenen Ausdruck) auf <{ "1" } m übereinstimmen. Höhere eingebettete Paare (RKF7({ "8" }) / DOP853) bleiben Folgearbeiten.

# text
# c1: forces::atmospheric_density
# c2: forces::drag_accel
# c3: propagator::ForceModel::drag
# c4: ρ = ρ0·exp(−(h−h0)/H)
# c5: a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel
# c6: v_rel = v − ωₑ ẑ × r
# c7: forces::EARTH_ROTATION_RATE = 7.2921151467e-5
# c8: ForceModel
# c9: accel_rv(t, r, v)
# c10: f(t,[r;v]) = [v; a(t,r,v)]
# c11: accel_at
# c12: C_D·A/m = 0.02 m²/kg
seg-cca3c00757d6 = <b>Atmosphärischer Widerstand als erste geschwindigkeitsabhängige Kraft in den Propagator eingebunden (<c1/> + <c2/> + <c3/>).</b> Fügt die <b>stückweise exponentielle Atmosphäre nach Vallado Tabelle 8-4</b> <c4/> hinzu ({ "28" } Bänder vom Meeresspiegel bis über { "1000" } km, unterhalb der Oberfläche begrenzt) und den quadratischen Widerstand <c5/> gegenüber der <b>mitrotierenden Atmosphäre</b> <c6/> (<c7/>). Da der Widerstand von der Geschwindigkeit abhängt, erhält <c8/> ein neues <c9/>, und die rechte Seite des Integrators übergibt nun die Geschwindigkeit (<c10/>); das rein positionsabhängige <c11/> ist unverändert, sodass die konservativen Terme und Goldens unberührt bleiben. In sich geschlossen validiert: Die Dichte <b>ist am Wert { "1.225" } kg/m³ auf Meereshöhe verankert</b>, wird unterhalb der Oberfläche begrenzt, <b>nimmt durch das LEO hindurch monoton ab</b>, liegt bei { "400" } km im sonnenmittleren Band von ~{ "1e-12" } kg/m³, und ihre <b>zurückgewonnene lokale Skalenhöhe (≈ { "58" } km bei { "400" } km)</b> ist physikalisch; der Widerstand <b>wirkt der mitrotierenden Relativgeschwindigkeit entgegen</b> mit der Größenordnung von ~{ "2e-6" } m/s² im LEO für <c12/>; und — das entscheidende Merkmal — der Widerstand ist <b>dissipativ</b>: Eine Bahn auf { "300" } km verliert spezifische Energie <b>monoton</b>, und ihre große Halbachse <b>nimmt mit einer beschränkten Rate von ~km/Tag ab</b>, während die Basislinie im Vakuum die Energie auf <{ "1e-9" } erhält. Die thermosphärische Dichte NRLMSISE-00 (die Klausel < { "5" } % für die Widerstandsdichte) bleibt eine Folgearbeit.

# text
# c1: forces::srp_accel
# c2: propagator::ForceModel::solar_radiation
# c3: a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂
# c4: forces::cylindrical_shadow
# c5: P☉ = Φ☉/c
# c6: (AU/d)²
# c7: ephem
# c8: epoch_jd_tt + t/86400
# c9: with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)
seg-0d20f02ef85f = <b>Strahlungsdruck der Sonne, epochengesteuert in das Kraftmodell des Propagators eingebunden (<c1/> + <c2/>).</b> Fügt das <b>Kanonenkugel-Modell für den Strahlungsdruck</b> <c3/> mit einem <b>Finsternisfaktor durch zylindrischen Schatten</b> hinzu (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): den Strahlungsdruck <c5/> aus der modernen Gesamtbestrahlungsstärke der Sonne von { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), den Abfall des Flusses mit dem Abstandsquadrat <c6/> und den radialen Stoß <b>von der Sonne weg</b>. Er läuft über die <b>selbe epochengesteuerte rechte Seite</b> wie der dritte Körper und tastet die Sonne <c7/> einmal zur fortgeschriebenen Epoche <c8/> ab, die sich Sonne als dritter Körper und Strahlungsdruck teilen. Kombinierbar: <c9/>. In sich geschlossen gegen von Hand hergeleitete Signaturen validiert: Der <b>Strahlungsdruck bei 1 AU entspricht dem Lehrbuchwert ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; der Strahlungsdruck eines voll beleuchteten LEO-Satelliten ist <b>bitgleich</b> mit der Kanonenkugel-Formel, zeigt <b>von der Sonne weg</b> und liegt im <b>Band von ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> für cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>eine Verdopplung des Sonnenabstands viertelt den Betrag</b> (Abstandsquadrat); der <b>zylindrische Schatten verfinstert nur den Umbra-Zylinder</b> (sonnenabgewandt <em>und</em> innerhalb eines Erdradius der Linie Erde–Sonne) und ergibt in der Finsternis <b>exakt null</b> Strahlungsdruck; und im Propagator <b>stört der Strahlungsdruck eine LEO-Bahn um einen kleinen beschränkten Betrag, der ~linear mit A/m skaliert</b> — während ein Modell ohne Störungen bitgenau zeitunabhängig bleibt und die Goldens für Zweikörper/J2/zonal unberührt lässt. Die konische Umbra/Penumbra (glattes ν ∈ [{ "0,1" }]), der atmosphärische Widerstand und eine externe Gegenvalidierung mit GMAT/Orekit bleiben Folgearbeiten.

# text
# c1: propagator::ForceModel::third_body
# c2: accel_at
# c3: ephem
# c4: epoch_jd_tt + t/86400
# c5: precession::julian_centuries_tt
# c6: ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)
# c7: third_body_accel
# c8: t = 0
# c9: t = 1 day
seg-d3f819c21660 = <b>Epochengesteuerter dritter Körper Sonne/Mond in die zeitveränderliche rechte Seite des Propagators eingebunden (<c1/> / <c2/>).</b> Die Störung durch den dritten Körper ist kein eigenständiger Kraftterm mehr — sie wird nun vom Cowell-Propagator als wirklich <em>zeitveränderliche</em> Kraft integriert: Jede Auswertung der rechten Seite tastet die Positionen von Sonne/Mond aus <c3/> zur <b>fortgeschriebenen Epoche <c4/></b> ab (wobei <c5/> für die Umrechnung Tag↔Jahrhundert wiederverwendet wird), sodass die störenden Körper sich während der Integration auf ihren Bahnen bewegen, statt zu Beginn eingefroren zu sein. Kombinierbar mit jedem Schwerefeldmodell (<c6/>). In sich geschlossen validiert: Der Sonnenterm der rechten Seite ist <b>bitgleich</b> mit <c7/>, ausgewertet an der Ephemeridenposition für jenen Zeitpunkt, sowohl bei <c8/> als auch bei <c9/> (was die Verdrahtung { "86400" } s ↔ { "1" } Tag ↔ 1/36525 Jahrhundert exakt belegt), der störende Körper <b>rückt zwischen den Abtastungen um ~{ "2.6" }·10⁹ m/Tag vor</b> (nicht eingefroren), die <b>momentanen Gezeitenbeträge im LEO</b> erreichen die Lehrbuch-Bänder von ~{ "5" }·{ "10" }⁻⁷ m/s² (Sonne) und ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Mond, ≈ { "2" }× die Sonne), jeder Körper <b>stört die eintägige Trajektorie messbar und bleibt dabei beschränkt</b>, und derselbe Anfangszustand, <b>zu Epochen mit einem Vierteljahr Abstand propagiert, ergibt eine andere Trajektorie</b> (die Gezeitenachse dreht sich um { "90" }°) — während ein Modell ohne aktivierten Körper bitgenau zeitunabhängig ist und die Goldens für Zweikörper/J2/zonal unberührt lässt. Ephemeridengenauigkeit in DE-Güte und eine externe Gegenvalidierung mit GMAT/Orekit bleiben Folgearbeiten.

# text
# c1: ephem::moon_position
# c2: §3.3.2
# c3: forces::third_body_accel
seg-0a517f6c4b1b = <b>Mondephemeride geringer Genauigkeit (<c1/>), die das Paar Sonne/Mond als dritter Körper vervollständigt.</b> Fügt die niedrigpräzise Mondreihe von Montenbruck & Gill (<c2/>) neben dem Sonnenmodell hinzu, sodass das körperunabhängige <c3/> nun von beiden Gestirnen gespeist werden kann, <b>ohne externen DE/SPK-Kernel</b>. In sich geschlossen gegen von Hand hergeleitete Mondsignaturen validiert: Die geozentrische Entfernung bleibt über einen Monat innerhalb der realen <b>Hülle aus Perigäum/Apogäum (~{ "356 500" }–{ "406 700" } km)</b>, und ihr <b>Monatsmittel gibt die große Halbachse von ~{ "384 400" } km zurück</b>; die <b>ekliptikale Breite überschreitet nie die Bahnneigung des Mondes von ~{ "5.3" }°</b> (geprüft durch Projektion auf den Ekliptikpol in äquatorialen Koordinaten, wodurch die Breitenreihe und die Rotation um die Schiefe der Ekliptik gemeinsam validiert werden); die <b>Richtung des Mondes kehrt nach einem siderischen Monat ({ "27.3217" } d) auf { "1" }° zurück</b>, und seine <b>tägliche Bewegung bleibt im physikalischen Band von { "12" }–{ "15" }°/Tag</b>; und die Störung durch den Mond als dritter Körper auf einen LEO-Satelliten hat den <b>Lehrbuchbetrag von ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ das Doppelte der Sonne). Positionsgenauigkeit in DE-Güte, atmosphärischer Widerstand und Strahlungsdruck bleiben Folgearbeiten.

# text
# c1: forces::third_body_accel
# c2: ephem::sun_position
# c3: a = GM₃·((s−r)/|s−r|³ − s/|s|³)
# c4: ephem
# c5: third_body_potential
seg-8b7025e00dd1 = <b>Gravitation des dritten Körpers (Sonne) mit eingebauter Ephemeride geringer Genauigkeit (<c1/>, <c2/>).</b> Fügt dem Kraftmodell die Störung durch den dritten Körper hinzu: <c3/> (direkte Anziehung minus den indirekten Term, den das geozentrische System abziehen muss), mit der Sonnenposition aus der niedrigpräzisen analytischen Reihe von Montenbruck & Gill im neuen Modul <c4/> — <b>kein externer DE/SPK-Kernel nötig</b> für einen Lauf mit geringer Genauigkeit. In sich geschlossen validiert: Die Beschleunigung <b>entspricht dem exakten Gradienten ihres eigenen Störpotentials</b> (<c5/>), die Störung <b>verschwindet im Geozentrum</b> und hat auf einem LEO-Satelliten den <b>Lehrbuchbetrag von ~{ "5" }·{ "10" }⁻⁷ m/s²</b>, und die Sonnenephemeride trifft von Hand hergeleitete J2000-Anker — <b>Perihelabstand ≈ { "1.471" }·10¹¹ m</b>, <b>Deklination ≈ −{ "23" }° nahe der Dezember-Sonnenwende</b>, eine scheinbare Bewegung von <b>≈ { "1" }°/Tag</b> (≈ { "90" }° je Vierteljahr) und ein Abstand, der über ein volles Jahr innerhalb der Hülle der Erdbahn von { "0.983" }–{ "1.017" } AU bleibt. Liefert die Hälfte des dritten Körpers für den Kraftmodell-Schritt des Meilensteins zum numerischen Propagator (der Mond wird in einem begleitenden Eintrag weiter oben geliefert); Positionsgenauigkeit in DE-Güte, atmosphärischer Widerstand und Strahlungsdruck bleiben Folgearbeiten.

# text
# c1: forces::zonal_accel
# c2: zonal_potential
# c3: J2..J6
# c4: ForceModel::with_zonals_j2_j6()
# c5: R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)
# c6: j2_accel
# c7: [J2]
# c8: J3
# c9: J2
# c10: J4..J6
# c11: z → −z
seg-99fd6ae1ea09 = <b>Kraftmodell der zonalen Harmonischen J2–J6 (<c1/> / <c2/>).</b> Erweitert das Kraftmodell des Cowell-Propagators über J2 hinaus auf das vollständige zonale Erdfeld bis Grad { "6" } (die standardmäßig veröffentlichten nicht normierten Werte <c3/> aus EGM-96), als <c4/> in den Propagator eingebunden. Die Beschleunigung ist der <b>exakte analytische Gradient</b> des zonalen Störpotentials <c5/> (Legendre-Polynome durch aufsteigende Rekursion), auf drei unabhängige Weisen validiert: Sie <b>reduziert sich bis auf Maschinengenauigkeit auf das an 666 Vektoren validierte <c6/></b>, wenn sie auf <c7/> beschränkt wird; sie <b>entspricht dem numerischen Gradienten ihres eigenen Potentials</b> über das gesamte Feld J2..J6 (die Goldstandard-Prüfung für konservative Felder); und die ungeraden Terme <c8/> gegenüber den geraden Termen <c9/>/<c10/> zeigen unter <c11/> ihre <b>charakteristische (Anti-)Symmetrie zwischen Nord und Süd</b> — die Asymmetrie der Birnenform. Eine propagierte J2..J6-Bahn erhält die Gesamtenergie (kinetisch + zentral + zonales Potential) über einen Tag auf ~{ "1e-8" } und stört die reine J2-Bahn um einen kleinen, von null verschiedenen Betrag. Das liefert Schritt 2 („zonale Harmonische J2–J6“) des Meilensteins zum numerischen Propagator; das tesserale EGM-Feld hohen Grades, Widerstand, Strahlungsdruck, dritter Körper und eine externe Gegenvalidierung mit GMAT/Orekit bleiben Folgearbeiten.

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: f(t,[r;v]) = [v; a(r)]
# c5: ForceModel
# c6: j2_secular_rates
# c7: solve_kepler_checked
# c8: Err
# c9: e = 0.999
seg-59f0ba5a6269 = <b>Numerischer Bahnpropagator (Cowell) (<c1/>).</b> Der erste <b>nicht analytische</b> Propagator von Kshana (der Rest des Bahnstapels ist analytisches SGP4/SDP4): Er verbindet das Kraftmodell aus Zweikörper + J2 (<c2/>) mit dem adaptiven RK4-Treiber mit Schrittverdopplung (<c3/>) als <c4/>, mit einem Schalter <c5/>. Validiert gegen eine <b>analytische Wahrheit, die stärker ist, als es eine numerische Gegenprüfung mit einem anderen Werkzeug wäre</b>: Die ungestörte Bahn reproduziert die <b>exakte Kepler-Lösung in universellen Variablen auf unter einen Meter über eine 24-Stunden-LEO-Bahn</b> (ein engeres Gate als das „gegenüber einer numerischen Referenz < { "10" } m“, das der Meilenstein formuliert), spezifische Energie und Drehimpuls bleiben auf ~{ "1e-9" } relativ erhalten, und die nodale Regression durch J2 reproduziert die geschlossenen Raten <c6/> nach Theorie erster Ordnung (innerhalb von { "2" } %, dem Residuum O(J2²)). Fügt außerdem <c7/> hinzu, einen Newton-Löser für die Kepler-Gleichung, der <b><c8/> zurückgibt, statt einer stillschweigend falschen Antwort</b>, wenn er innerhalb eines beschränkten Iterationsbudgets nicht konvergiert (der Fall <c9/> nahe dem Perigäum). Ehrlicher Umfang: Das Kraftmodell ist nur Zweikörper + J2 — das tesserale EGM-Feld hohen Grades ({ "200" }×{ "200" } + Loader), Widerstand (NRLMSISE-00), Strahlungsdruck, Kräfte dritter Körper und eine externe Gegenvalidierung mit GMAT/Orekit bleiben Folgearbeiten.

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
# c3: docs/CAPABILITY.md
seg-d4c7c29f09d1 = <b>60-minütiger Schwerekartenabgleich ohne GPS auf < { "500" } m (<c1/>).</b> Vertieft die Alt-PNT-Schicht bis zum Validierungsziel <em>Quantum Wayfarer</em> von ESA NAVISP: Ein Fahrzeug fliegt eine Spur von ~{ "700" } km bei einem vollen einstündigen GNSS-Ausfall — seine Inertiallösung driftet auf <b>≈ { "70" } km</b> — und ein Kaltatom-Gravimeter plus ein <b>hierarchischer grob-zu-fein</b> arbeitender Partikel-/Gitter-Abgleicher gewinnt die konstante INS-Drift auf <b>≈ { "145" } m</b> (< { "500" } m) zurück, eine Verringerung um mehr als { "480" }×. Der reale Weißrauschboden des Gravimeters wird als <b>deterministische, mit Seed erzeugte</b> Folge eingespeist, sodass dem Abgleicher nie rauschfreie Wahrheit gegeben wird, der Lauf aber exakt reproduzierbar ist (bitgleich verifiziert und über Rauschrealisierungen hinweg auf wenige Meter stabil). Ein Test in Regressionsgüte zeigt, dass die Verfeinerung <em>notwendig</em> ist — ein einzelnes grobes Gitter bleibt bei ~{ "2" } km stehen, erst die dreistufige Verfeinerung durchbricht die Grenze von { "500" } m. Neues eingechecktes Szenario <c2/>. Die Zeile <c3/> bleibt ehrlich <b>teilweise</b> (weiterhin keine mitgelieferte EGM2008-Karte), ihr Beleg ist auf das Ergebnis < { "500" } m über 60 min aktualisiert. Der ehrliche Umfang bleibt unverändert: Feld aus Kugelflächenfunktionen niedrigen Grades + synthetische Mascons; eine Monte-Carlo-Studie über Realisierungen des Darstellungsfehlers der Karte ist eine Folgearbeit.

# text
# c1: docs/CLAIMS-VS-REALITY.md
# c2: tests/no_overclaims.rs
# c3: OC-0
# c4: OC-13
# c5: OC-0
# c6: OC-2
# c7: OC-7
# c8: OC-8
# c9: README
# c10: CAPABILITY
# c11: GLOSSARY
# c12: web/
seg-4262a99328bb = <b>Register der Übertreibungen + Regressionssicherung (<c1/>, <c2/>).</b> Schließt den Strang zur Ehrlichkeit/Zurücknahme von Behauptungen ab: Die vierzehn Übertreibungen, die ein früheres Audit katalogisiert hat (<c3/>…<c4/>), sind nun alle GREEN — die starken Behauptungen (<c5/> gekoppeltes Kalman-Filter für Uhr + Position, <c6/> Jamming J/S→C/N₀→Signalverlust, <c7/> Physik des Mach–Zehnder-CAI, <c8/> ARAIM HPL/VPL) sind <b>durch ausgelieferte, getestete Fähigkeiten abgelöst</b>, statt abgeschwächt formuliert zu werden, und die übrigen Zeilen sind passend zum Code zurückgenommen. Ein neuer CI-Test durchsucht die aktuellen öffentlichen Oberflächen (<c9/>, <c10/>, <c11/>, <c12/>) und schlägt fehl, wenn eine ausgemusterte nackte Übertreibung ohne Einschränkung wieder auftaucht, sodass eine Zeile GREEN nicht unbemerkt zurückfallen kann. Das Gütemaß „Integrität“ je Lauf bleibt ehrlich mit <em>Selbstkonsistenz des Filters</em> beschriftet (nicht Integrität der Luftfahrt); das echte ARAIM HPL/VPL wird getrennt ausgewiesen, sodass beide nie vermischt werden.

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: P̄₁₁=√3·cosφ
# c4: P̄₂₀=(√5/2)(3sin²φ−1)
# c5: P̄₂₂=(√15/2)cos²φ
# c6: mapmatch
# c7: particle_filter
# c8: scenarios/gravity-map-nav.toml
# c9: kind=
# c10: docs/CAPABILITY.md
seg-27da62a7ff63 = <b>Navigation mit Schwerekartenabgleich (Alt-PNT ohne GPS).</b> Neues <c1/> fügt die Alt-PNT-Fähigkeitsschicht hinzu, die die Studien zum Schwerekartenabgleich von ESA NAVISP (<em>Quantum Wayfarer</em> / QT-CCI) fordern: ein <b>Messmodell für das Kaltatom-Gravimeter</b>, dessen Weißrauschboden aus der ASD des CAI-Beschleunigungsmessers abgeleitet ist (<c2/>); ein <b>Schwereanomalie-Feld aus Kugelflächenfunktionen</b> niedrigen Grades, vollständig normiert (validiert gegen die geschlossenen Legendre-Funktionen <c3/>, <c4/>, <c5/> und eine von Hand hergeleitete Anomalie eines einzelnen Terms von { "1.897" } mGal), plus synthetische <b>Mascons</b> für die lokalen Merkmale hohen Grades; und ein <b>Partikelfilter für den Schwerekartenabgleich</b> (aus <c6/> + <c7/> zusammengesetzt), das eine Spur ohne GPS aus der Anomaliefolge zurückgewinnt, die es durchfliegt. Ein eingechecktes NAVISP-Benchmark (<c8/>) senkt eine freie Inertialdrift von ~{ "73" } km auf wenige km. Ehrlicher Umfang: Kshana liefert den vollständigen Koeffizientensatz EGM2008 mit { "2190" }° <b>nicht</b> mit — das Feld hat niedrigen Grad + Mascons, ist keine reale hochaufgelöste Karte; der EGM/EIGEN-Loader, eine Magnetkarte, geländegestütztes SLAM und die Einbindung von <c9/> in die Szenario-Engine mit einem SVG-Driftdiagramm bleiben Folgearbeiten. <c10/> „Gravity-map / alt-PNT navigation“ → <b>teilweise</b>.

# text
# c1: src/maneuver.rs
# c2: r1
# c3: r2
# c4: v1
# c5: v2
# c6: r2
seg-d028a2db7837 = <b>Manövermodellierung und Brückenkopf für den Trajektorienentwurf.</b> Neues <c1/> fügt die erste Schicht für den Trajektorienentwurf oberhalb von SGP4 hinzu: impulsive ΔV-Knoten, die eine Geschwindigkeitsunstetigkeit anwenden und eine Kovarianz { "6" }×{ "6" } fortschreiben (deterministischer Brennvorgang ⇒ Identität als Zustandsübergang; die Kovarianz des Ausführungsfehlers wird aus dem Brennsystem — ECI oder LVLH — in den Geschwindigkeitsblock gedreht), eine Integration endlicher Brennphasen (konstanter Schub über einen Brennbogen mit der Masse als Zustand), deren erreichtes ΔV gegen die geschlossene <b>Tsiolkovsky</b>-Raketengleichung auf besser als { "0.01" } % geprüft wird, ein <b>Lambert</b>-Löser nach <b>Izzo-2015</b> für einen einzelnen Umlauf (<c2/>, <c3/>, Flugzeit ⇒ <c4/>, <c5/>), ein exakter <b>Kepler-Propagator</b> in universellen Variablen (Zweikörper-Wahrheit) und ein <b>Porkchop</b>-Sweep, der ein Raster aus Startepoche × Ankunftsepoche auf das Abflug-C3 und das Ankunfts-V∞ abbildet, als 2D-JSON-Array für die Konturdarstellung im Browser ausgegeben. Die Validierung ist in sich geschlossen und stärker als die Ausgabe eines Tutorials: Jede Ausgabe von Lambert wird durch den Kepler-Propagator hin und zurück geführt (sie muss wieder auf <c6/> landen), und das Minimum des Porkchop wird gegen die analytische C3-Untergrenze des Hohmann-Transfers für zwei komplanare Kreisbahnen geprüft. Kshana versteht dies als Schicht zur Leistungssimulation oberhalb von GMAT/Orekit, nicht als Ersatz (Zweige mit mehreren Umläufen und eine reale Planetenephemeride bleiben außerhalb des Umfangs). Zehn Tests.

# text
# c1: src/fusion/tightly_coupled17.rs
# c2: [position, velocity, attitude-error, accelerometer bias, gyro bias, clock bias, clock drift]
# c3: C ≈ I + [ψ×]
# c4: q_va
# c5: crate::inertial::quantum_imu
seg-cbdd0e56d89f = <b>Vollständiger eng gekoppelter GNSS/INS-UKF mit 17 Zuständen und Quanten-CAI-Koppelnavigation.</b> Neues <c1/> trägt den vollständigen Inertialnavigationszustand, den ein eng gekoppeltes Filter schätzt — <c2/> ({ "17" } Zustände) —, durch die Strapdown-Mechanisierung fortgeschrieben, angetrieben von der gemessenen spezifischen Kraft und Drehrate, mit der Kleinwinkel-Rotation Körper→Inertial <c3/>, sodass der Lagefehler in die horizontale Beschleunigung einkoppelt (die übliche Neigungskopplung der INS). Bei einem GNSS-Ausfall läuft es allein auf der IMU weiter; das Prozessrauschen der Geschwindigkeits-Zufallsbewegung ist das abgeleitete <c4/> des Kaltatom-Interferometer-Beschleunigungsmessers (<c5/>), sodass die Drift der Koppelnavigation die durch den Quantensensor begrenzte ist — ein Ausfall von 120 Sekunden bleibt auf wenige hundert Meter beschränkt, gegenüber den Kilometern, die eine freie INS in Navigationsgüte erreichen würde. Das Update für Pseudostrecke/Entfernungsrate läuft über den gemeinsamen Unscented-Filter (mit α = { "1" } für gut konditionierte Gewichte bei dieser Zustandsgröße). Fünf Tests: Identität des Messmodells, Integration mit konstanter Geschwindigkeit bei perfekter IMU, GNSS-Stützung, Schätzung des Beschleunigungsmesser-Bias und der durch CAI begrenzte Benchmark mit 120 s Ausfall.

# text
# c1: CITATION.cff
# c2: ROADMAP.md
seg-087521bb32b7 = <b>Ehrliche Darstellung der Quantenpositionierung.</b> Die Kernbezeichnung lautet nun einheitlich <b>„PNT-resilience simulator with quantum-sensor performance models“</b> im Slogan des README, in der Zitatzeile, in <c1/> (Titel + Abstract) und im Bannerbild — und ersetzt die lockerere Marketingformulierung „hybrid quantum/classical PNT simulator“. Der Abschnitt <em>What it is / is not</em> des README erhält eine ausdrückliche Umfangsaussage <b>„It is not (yet)“</b> (keine Physik-Engine für Atominterferometrie aus ersten Prinzipien, kein GNSS-Empfänger/PVT-Löser, kein Werkzeug für den Missionsentwurf), und eine neue <c2/> auf oberster Ebene führt die <b>Quantenphysik-Schicht als Punkt P2</b> (Phase des Mach–Zehnder-CAI, Projektionsrauschen, Vibrationstensor), damit Leser wissen, dass die Physik aus ersten Prinzipien eingegrenzt ist und folgt, nicht aufgegeben wurde. Keine Änderung von Verhalten oder API.

# text
seg-f8fa36190ec7 = Trade-Studie zum Konstellationsentwurf: Walker-Entwurfs-Sweep mit Pareto-Front, JSON zur Wiederkehrzeit und eine Validierung der Walker-Formel unter einem Kilometer.

# text
# c1: src/walker.rs
# c2: walker_design_sweep
# c3: planes × sats_per_plane
# c4: pareto_front
# c5: WalkerDesignReport::to_json
# c6: i:T/P/F
# c7: R_z(2π/P)
# c8: 2π/S
# c9: gps-ops
# c10: scenarios/orbit-sgp4-gps.toml
seg-31518e92d8cf = <c1/> erhält <c2/>, das ein Raster <c3/> (z. B. eine Trade-Studie { "3" }×{ "3" }) bei fester Inklination ausführt und je Entwurf den Abdeckungsanteil, den ungünstigsten PDOP und die maximale/mittlere Lücke der Wiederkehrzeit tabelliert; <c4/> markiert die nicht dominierten Entwürfe (weniger Satelliten, mehr Abdeckung, niedrigerer PDOP, kürzere Wiederkehrzeit), und <c5/> serialisiert die Zellen und die Pareto-Front — einschließlich der Felder zur Wiederkehrzeit — als JSON. Eine neue Validierung legt den Generator auf die Walker-Formel <c6/> fest: Satelliten desselben Slots in benachbarten Ebenen lassen sich nachweislich durch eine exakte Rotation <c7/> aufeinander abbilden, auf <b>unter { "1" } km über volle { "24" } h</b> SGP4-Propagation (das kurzperiodische „Atmen“ durch J2 ist gleichphasig und hebt sich auf), und die Slots innerhalb der Ebene sind im Mittel mit Abstand <c8/> bestätigt. Baut auf dem eingecheckten realen Celestrak-Snapshot <c9/> vom 2021-07-28 auf (<c10/>, von den Tests zur Szenarioabdeckung und zum SP3-Roundtrip genutzt).

# text
# c1: src/timetransfer_adv.rs
# c2: twstft_sagnac
# c3: Δt = 2·A·ω_E/c²
# c4: twstft_sagnac_bipm
# c5: run_twstft
# c6: T_A − T_B
# c7: gnss_common_view_series
# c8: iono_free_combination
# c9: ppp_receiver_clock
# c10: rytov_variance
# c11: fried_parameter
# c12: lognormal_fading
# c13: fit_power_law_psd
# c14: h_α
# c15: ensemble_timescale
seg-71d257587c28 = <b>Fortgeschrittene Zeit- und Frequenzübertragung: TWSTFT, GNSS Common-View, PPP, optisch, Potenzgesetz-Anpassung nach IEEE-1139 und ein Uhrenensemble.</b> Neues <c1/> baut die operativen Übertragungsverfahren auf den ausgelieferten geschlossenen Ausdrücken für Sagnac/Common-View und den Werkzeugen zur Allan-Stabilität auf. <c2/> liefert die Sagnac-Korrektur der Two-Way Satellite Time and Frequency Transfer als Schleifensumme über drei Hops, exakt gleich dem geschlossenen Ausdruck des BIPM <c3/> (durch das unabhängige <c4/> gegengeprüft); <c5/> gibt eine eintägige Reihe <c6/> und ihre TDEV aus. <c7/> bildet Einzeldifferenzen zweier synthetischer Bodenstationen, sodass sich die Satellitenuhr aufhebt. <c8/> + <c9/> sind die ionosphärenfreie PPP-Kombination und die Lösung der Empfängeruhr gegen eine (synthetische) Wahrheit in SP3-Güte, die die Ionosphäre erster Ordnung exakt aufhebt. <c10/>, <c11/> und das mittelwerteinheitliche <c12/> modellieren die durch Turbulenz bedingte Szintillation einer optischen Freiraumstrecke. <c13/> ist eine vollständige Kleinste-Quadrate-Anpassung der Allan-Varianzkurve mit fünf Koeffizienten <c14/> nach IEEE-1139 (alle fünf kanonischen Rauschprozesse zugleich), wobei der dominante Prozess je τ-Dekade ausgewiesen wird. <c15/> bildet eine mit der inversen Varianz gewichtete Papier-Zeitskala, deren Allan-Abweichung streng unter der der besten beitragenden Uhr liegt. { "31" } Unit-Tests; die Validierungsziele sind geschlossene Ausdrücke und synthetische Wahrheit — das Einlesen echter Daten aus BIPM Circular-T / IGS SP3 steht noch aus.

# text
seg-c3ab93e7324f = IONEX-Ionosphärenkarten: Dateiparser, zeitliche Interpolation und Abbildung über die Schrägneigung.

# text
# c1: src/ionex.rs
# c2: parse_ionex
# c3: START/END OF TEC MAP
# c4: IonexMap
# c5: TecGrid
# c6: 10^EXPONENT
# c7: interpolate_tec_in_time
# c8: obliquity_factor
# c9: slant_tec
# c10: M(z) = 1/cos z′
# c11: sin z′ = (Rₑ/(Rₑ+H))·sin z
seg-7b94a515ce2b = <c1/> erhält <c2/>, das das Dateiformat IONEX (Kopfzeile mit Gitterdefinition + Blöcke <c3/>) in eine Folge von <c4/> einliest — dabei wird die Breitenordnung der Datei von Nord nach Süd in ein <c5/> mit positiver Schrittweite normiert und die Werte werden mit <c6/> skaliert. <c7/> mischt zwei aufeinanderfolgende Karten auf eine Abfrageepoche, und <c8/> / <c9/> bilden das vertikale TEC über den Faktor der dünnen Einzelschicht <c10/> (<c11/>) auf einen schrägen Strahl ab. Zusammen mit dem ausgelieferten Gittermodell machen sie aus einer gemessenen globalen IGS-Ionosphärenkarte eine brauchbare Schrägverzögerung.

# text
seg-2ed90763cf11 = Konstellationsentwurf: Dimensionierung nach Streets-of-Coverage + Vergleich mehrerer Konstellationen.

# text
# c1: src/walker.rs
# c2: min_satellites_streets_of_coverage
# c3: λ
# c4: c
# c5: p = ⌈π/(2c)⌉
# c6: None
# c7: compare_constellations
# c8: pdop_sweep
seg-326e8957bb10 = <c1/> erhält <c2/>, einen idealisierten Löser für die Mindestzahl von Satelliten nach Streets-of-Coverage — aus dem ausgelieferten Abdeckungs-Halbwinkel <c3/> und der Halbbreite der Straße <c4/> dimensioniert er die fast polare Konstellation für kontinuierliche einfache globale Abdeckung zu <c5/> Ebenen (z. B. braucht eine Ebene mit 4 Satelliten in GPS-Höhe { "2" } Ebenen, { "8" } Satelliten) und meldet <c6/>, wenn die Satelliten zu dünn verteilt sind, um eine kontinuierliche Straße zu bilden. <c7/> ist das Werkzeug zum Vergleich mehrerer Konstellationen: Es bewertet jeden benannten Walker-Entwurf an derselben Station/im selben Fenster über <c8/> und gibt Abdeckung / PDOP / Größe nebeneinander zurück. Ehrlicher Umfang: Die nahtgenaue Rider-Korrektur an der Grenze gegenläufiger Ebenen und ein 3D-Abdeckungsglobus sind Folgearbeiten.

# text
seg-90f5ec9ff4ae = Mehrschichtige Spoofing-Erkennung: Paritätsdetektor zur RAIM-Konsistenz + Schichtfusion.

# text
# c1: src/spoof_monitors.rs
# c2: parity_raim_test
# c3: (m−4)
# c4: fuse_spoof_layers
seg-a0e4878bea45 = <c1/> erhält die dritte und letzte Erkennungsschicht und die Fusionsstufe: <c2/> passt die Lösung aus Position/Uhr per kleinsten Quadraten an einen redundanten Satz von Pseudostrecken an und prüft die verbleibende gewichtete Residuenquadratsumme gegen ihre Schwelle χ²<c3/> — dabei wird eine verzerrte <em>Teilmenge</em> der Satelliten markiert, während ein <em>gleichphasiger</em> Bias (von der Empfängeruhr absorbiert) korrekt für RAIM unsichtbar bleibt und nicht überdeckt wird. <c4/> kombiniert die Schichten Parität, AGC und SQM zu einer gewichteten Entscheidung, die festhält, welche Schichten ausgelöst haben. Eine Monte-Carlo-Studie charakterisiert den Detektor: empirisches <b>P_fa ≈ { "0.068" }</b> gegenüber einem Entwurfspunkt von { "0.05" }, mit einer <b>Fehlerkennungsrate, die von { "0.885" } bei einem Spoofing-Bias von 2σ auf { "0.16" } bei 8σ sinkt</b>. Ehrlicher Umfang: Die Gegenvalidierung gegen bestimmte veröffentlichte Spoofing-Testvektoren (Spirent / ION GNSS+) erfordert diese externen Datensätze und bleibt eine Folgearbeit.

# text
# c1: src/fusion/coupled.rs
# c2: CoupledPntFilter
seg-2413b3d10f5b = <b>Validierungsensemble gekoppeltes vs. entkoppeltes Kalman-Filter.</b> Eine Monte-Carlo-Studie mit 100 Läufen in <c1/> beziffert den Nutzen, die Kreuzkovarianz Position↔Uhr mitzuführen: Eine getreue entkoppelte Basislinie im Code (bitgenau gegen das ausgelieferte <c2/> validiert) verarbeitet dieselben Daten mit auf null gesetzten Kreuzblöcken, und nach fast entarteten Pseudostrecken plus einer reinen Uhrenkorrektur gewinnt das gekoppelte Filter die Position auf <b>{ "2.97" } m RMS gegenüber { "48.8" } m beim entkoppelten Filter zurück und gewinnt { "97" } von { "100" } Läufen</b> — die Uhrenkorrektur schärft die Position nur durch die Korrelation, die das entkoppelte Paket verwirft. Damit ist die Validierungssuite zur Korrektheit des Kalman-Filters vollständig (Joseph-Form, PSD-Sicherheit, Konsistenz NEES/NIS und nun das Ensemble des gekoppelten Filters).

# text
# c1: src/orbit_determination.rs
# c2: [r, v]
# c3: src/forces.rs
# c4: src/integrator.rs
# c5: src/batch_ls.rs
# c6: determine_orbit_batch
# c7: determine_orbit_sequential
seg-804f35695553 = <b>Pipeline zur Bahnbestimmung (Batch + sequenziell).</b> Ein neues <c1/> gewinnt den Bahnzustand <c2/> eines Satelliten aus der Entfernungsverfolgung von Bodenstationen zurück und setzt dazu drei ausgelieferte Bausteine zusammen: Das Kraftmodell aus Zweikörper + J2 (<c3/>) und der RK4-Integrator (<c4/>) propagieren einen Kandidatenzustand über den Bogen, ein Entfernungsmessmodell sagt jede Stationsentfernung voraus, und der Gauss–Newton-Batch-Korrektor (<c5/>) führt den Kandidaten auf den am besten passenden Zustand (<c6/>). Dieselbe Dynamik und dasselbe Entfernungsmodell treiben auch eine <b>sequenzielle</b> rekursive Bestimmung mit dem ausgelieferten Unscented-Filter (<c7/>). Vier Tests validieren es: Entfernungsvorhersage über den Bogen; <b>Batch-Rückgewinnung auf unter einen Meter / mm·s⁻¹ aus rauschfreien Entfernungen</b>; Batch-Rückgewinnung auf <b>~{ "2" } m mit einem Residuum nach der Anpassung am Rauschboden von { "5" } m</b> (das Merkmal einer konsistenten Anpassung nach kleinsten Quadraten); und sequenzielle Rückgewinnung auf einige zehn Meter. Ehrlicher Umfang: Entfernungsrate/Doppler und Winkelmessungen, eine analytische Zustandsübergangsmatrix für J2 und die Sichtbarkeitsmaskierung von Stationen sind Folgearbeiten.

# text
# c1: src/fusion/tightly_coupled.rs
# c2: src/fusion/ukf.rs
# c3: [px,py,pz,vx,vy,vz,b,d]
# c4: pseudorange
# c5: ρ = |p − sᵢ| + b
# c6: range_rate
# c7: ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d
# c8: TightlyCoupled
# c9: propagate
# c10: propagate_orbital
# c11: update_gnss
# c12: src/forces.rs
# c13: src/integrator.rs
# c14: propagate_orbital
seg-0a81039e510c = <b>Eng gekoppelter GNSS/INS-UKF-Navigator.</b> Ein neues <c1/> bindet den ausgelieferten Unscented-Kalman-Kern (<c2/>) in einen funktionierenden eng gekoppelten Navigator über den achtdimensionalen Zustand <c3/> ein (ECEF-Position/-Geschwindigkeit sowie Bias und Drift der Empfängeruhr in Entfernungseinheiten). Er verarbeitet die <b>rohen Satellitenmessungen</b> — <c4/> (<c5/>) und <c6/>/Doppler (<c7/>) — statt einer vorab gebildeten Positionslösung, sodass <c8/> (mit <c9/>/<c10/>/ <c11/>) auch <b>mit weniger als vier Satelliten</b> weiter korrigiert und GNSS-Ausfälle über seine propagierte Dynamik überbrückt. Fünf Tests validieren es durchgängig, einschließlich der Abnahmeszenarien des Meilensteins: die Geometrie von Pseudostrecke/Doppler gegen Handwerte; rauschfreie Konvergenz auf <b>unter einen Meter</b> mit fünf Satelliten; ein Fall mit <b>drei Satelliten</b>, der von ~{ "212" } m auf ~{ "13" } m konvergiert, wo sich eine PVT-Momentaufnahme gar nicht bilden lässt; ein <b>Ausfall von 120 Sekunden</b> bei konstanter Geschwindigkeit innerhalb von { "50" } m; und — die entscheidende Abnahme — ein <b>30-minütiger gekrümmter LEO-Durchgang</b> (reale Bahn aus Zweikörper + J2) mit einem <b>GNSS-Ausfall von 120 Sekunden</b>, gehalten auf <b>{ "0.77" } m RMS über den Durchgang</b> und <b>{ "2.9" } m im ungünstigsten Fall während des Ausfalls</b>. Dieses Überbrücken auf der Bahn setzt das ausgelieferte Schwerefeld-Kraftmodell (<c12/>) und den RK4-Integrator (<c13/>) zum Prozessmodell des UKF (<c14/>) zusammen, sodass das Filter der Krümmung der Bahn folgt — was ein Überbrücken mit konstanter Geschwindigkeit nicht kann (die Krümmung allein beträgt im LEO ~{ "58" } km über { "120" } s). Ehrlicher Umfang: Das Überbrücken auf der Bahn verwendet das Kraftmodell aus Zweikörper + J2 statt der rohen spezifischen Kraft der IMU (für eine antriebslose Bahnplattform fallen beide zusammen); die Aufnahme eines Fehlerzustands der Strapdown-IMU und von Iono-/Tropo-Korrekturen in der Schleife bleiben Folgearbeiten.

# text
# c1: src/mapmatch.rs
# c2: src/particle_filter.rs
# c3: field_likelihood
# c4: map_match_likelihood
# c5: Fn(lat, lon) -> value
# c6: src/ionex.rs
# c7: e^(−½)
seg-792f25a4a1da = <b>Messmodell für den Kartenabgleich (gelände-/schwerereferenzierte Navigation).</b> Ein neues <c1/> liefert das Messmodell, das das ausgelieferte Partikelfilter mit sequenziellem Importance-Resampling (<c2/>) zu einem funktionierenden Navigator ohne GPS macht: <c3/> (eine gaußsche Likelihood für den Feldabgleich) und <c4/>, das ein beliebiges georeferenziertes Referenzfeld — Geländehöhe (TRN) oder eine Schwereanomalie — an der Position eines Partikels abtastet und es nach der Übereinstimmung mit dem gemessenen Wert des Fahrzeugs gewichtet. Das Feld ist ein beliebiger Sampler <c5/>, sodass es sich mit dem bilinearen Gitter in <c6/> oder einem Closure kombinieren lässt. Zwei Tests verankern es — die Likelihood hat bei perfekter Übereinstimmung ihr Maximum (={ "1" }) und fällt bei einer Sigma auf <c7/>, und ein Partikelfilter über einem markanten synthetischen Geländeausschnitt gewinnt die wahre Position auf { "0.1" } genau zurück. Ehrlicher Umfang: Die realen Referenzkarten (SRTM-Höhe, EGM/EIGEN-Schwereanomalie) und ihre Loader sind Folgearbeiten.

# text
# c1: src/lunar.rs
# c2: σ_URE ≈ 30 m
# c3: P_sat ≈ 1e-4
# c4: lunar_araim
# c5: σ_URE
seg-9240e95a5058 = <b>Integrität von cislunarem PNT (ARAIM für den Mond).</b> Ein neues <c1/> wendet die Erd-seitige MHSS-ARAIM-Engine auf einen Mondnavigationsdienst im Stil von LunaNet an, mit den Mondparametern (<c2/> gegenüber { "0.6" } m bei GPS, <c3/>): Mondkonstanten, eine selenozentrische Basis Ost/Nord/Oben samt Hilfsfunktion für die Himmelsgeometrie und <c4/> (HPL/VPL). Drei Tests verankern es — die orthonormale selenozentrische Basis, die Geometrie der Schrägentfernung und die exakte lineare Skalierung des Schutzniveaus mit <c5/> (beim Mond ergeben { "30" } m ein { "50" }× größeres Schutzniveau als dieselbe Geometrie bei { "0.6" } m wie bei GPS — der quantitative Grund, warum die Integrität von Mond-PNT schwierig ist). Ehrlicher Umfang: Die präzise LANS-NRHO-Ephemeride, das Fehlerbudget des Signals im Raum und die Reduktion der Bezugssysteme MCI↔MCMF sind Folgearbeiten.

# text
# c1: src/jd2.rs
# c2: Jd2
# c3: day
# c4: frac
# c5: [0,1)
# c6: new
# c7: from_parts
# c8: add_seconds
# c9: diff_seconds
# c10: total
# c11: f64
# c12: f64
# c13: f64
seg-4a43e2ff83d7 = <b>Julianische Daten in zwei Teilen (hohe Genauigkeit).</b> Ein neues <c1/> fügt <c2/> hinzu, ein Julianisches Datum, aufgeteilt in einen ganzzahligen Anteil <c3/> und einen gebrochenen Anteil <c4/> in <c5/> (die Konvention von SOFA/hifitime), mit <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Differenzen naher Epochen bleiben bis zur Grenze von <c11/> exakt, wo ein JD mit einem einzigen <c12/> nahe J2000 etwa { "50" } µs verliert. Vier Tests verankern es: den Hin-und-zurück-Durchlauf, die Normierung des Bruchteils, die exakte Rückgewinnung von Mikrosekunden (mit dem daneben gezeigten Versagen des einzelnen <c13/>) und additive/umkehrbare Sekundenarithmetik.

# text
# c1: src/omm.rs
# c2: oem
# c3: OmmFile::from_tle
# c4: BSTAR
# c5: to_omm_kvn
# c6: ndm/omm
seg-8eef92a85711 = <b>Writer für CCSDS OMM (Orbit Mean-Elements Message).</b> Ein neues <c1/> ergänzt den Ephemeriden-Writer <c2/> um die Nachricht mit mittleren Elementen: <c3/> bildet mittlere Elemente von SGP4/TLE auf die Einheiten der OMM ab (mittlere Bewegung in Umläufen/Tag, Winkel in Grad, plus <c4/>), und <c5/> serialisiert die Standards-Track-Form KVN nach CCSDS 502.0-B-2 — sodass eine Bahn von Kshana von jedem OMM-fähigen Werkzeug verarbeitet werden kann statt als eigens gebaute TLE. Zwei Tests verankern die Einheitenumrechnung TLE→OMM (≈ { "15.5" } Umläufe/Tag, { "51.6" }° Inklination usw.) und das Vorhandensein der erforderlichen KVN-Schlüsselwörter. Ehrlicher Umfang: Die Form KVN und die Abbildung der TLE werden hier ausgeliefert; die XML-Darstellung (<c6/>) und ein Roundtrip mit einem Referenzparser sind Folgearbeiten.

# text
# c1: src/particle_filter.rs
# c2: predict
# c3: update
# c4: resample
# c5: effective_sample_size
# c6: ionex
seg-ca2b730b5cc3 = <b>Partikelfilter mit sequenziellem Importance-Resampling.</b> Ein neues <c1/> fügt den nichtlinearen, nicht gaußschen Schätzer hinter der kartengestützten Navigation ohne GPS hinzu (geländereferenziert oder durch Abgleich mit der Schwerekarte): <c2/> (Partikel durch die Dynamik + gaußsches Prozessrauschen propagieren), <c3/> (Neugewichtung mit einer Likelihood der Messung je Partikel), systematisches <c4/>, den Entartungsmonitor <c5/> und den gewichteten Mittelwert als Schätzung. Sechs Tests verankern den deterministischen Kern exakt — ESS über { "1" }…N, systematisches Resampling, das Indizes proportional zum Gewicht wählt, die konvexe Kombination des gewichteten Mittelwerts, eine gaußsche Likelihood, die die Schätzung auf die Messung zieht, das Verhalten beim Resampling auf Gleichverteilung und deterministisches predict mit Seed. Ehrlicher Umfang: Die Engine wird hier ausgeliefert; die Referenzkarten (SRTM-Höhe, EGM-Schwereanomalie) und das Messmodell der Karte sind Folgearbeiten (der Sampler aus Gitter + bilinear in <c6/> würde eine Schwere- oder Geländekarte gleichermaßen bedienen).

# text
# c1: src/ionex.rs
# c2: TecGrid
# c3: vtec_at
# c4: Δ = 40.3·TEC/f²
# c5: vtec_to_delay_m
# c6: delay_at
# c7: 1 TECU ≈ 0.162 m
# c8: 1/f²
seg-564ad319685e = <b>TEC-Ionosphärenkarten im Stil von IONEX.</b> Ein neues <c1/> fügt die gemessene Ionosphäre als Alternative zum ausgesendeten Klobuchar-Modell hinzu: ein <c2/> (ein regelmäßiges Breiten-/Längengitter des vertikalen TEC, eine globale IGS-Ionosphärenkarte) mit bilinearer Interpolation an einem Durchstoßpunkt (<c3/>, außerhalb des Gitters begrenzt) und der Verzögerung erster Ordnung <c4/> (<c5/>, <c6/>). Vier Tests verankern es: <c7/> bei L1 mit der Skalierung <c8/>, knotengenaue Interpolation, bilineare Mittelpunkte, die die Ecken mitteln, und am Rand begrenzte Abfragen außerhalb des Gitters. Ehrlicher Umfang: Das Gitter und die Interpolation werden hier ausgeliefert; das Parsen des Dateiformats IONEX, die zeitliche Interpolation zwischen Karten und die Abbildungsfunktion für die Schrägstrecke sind Folgearbeiten.

# text
# c1: src/timegeo.rs
# c2: timetransfer
# c3: sagnac_correction
# c4: Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)
# c5: common_view_offset
seg-26c7b53cbc8c = <b>Geometrische Korrekturen der Zeitübertragung (Sagnac + GNSS Common-View).</b> Ein neues <c1/> fügt die zwei deterministischen Effekte hinzu, die ein realer Uhrenvergleich berücksichtigen muss, und ergänzt damit das stochastische Zwei-Wege-Modell in <c2/>: <c3/> (<c4/>, die Verzögerung durch die rotierende Erde — einige zehn ns bei kontinentalen Basislinien) und <c5/>, die Einzeldifferenz GNSS Common-View, die den Fehler der Satellitenuhr exakt aufhebt und den Versatz zwischen den Stationen zurückgewinnt. Drei Tests verankern sie an exakten Referenzen: das ≈ { "33" } ns große Sagnac einer äquatorialen Vierteldrehung, Antisymmetrie und die Fälle radial/polar mit null sowie die exakte Aufhebung der Satellitenuhr. Ehrlicher Umfang: Ein vollständiges Budget für Transponder-/Hardwareverzögerungen bei TWSTFT und eine ionosphärenfreie PPP-Zeitübertragungslösung sind Folgearbeiten.

# text
# c1: src/forces.rs
# c2: two_body_accel
# c3: −μ·r/|r|³
# c4: j2_accel
# c5: gravity_accel
# c6: src/integrator.rs
# c7: f(t,[r;v]) = [v; a(r)]
# c8: j2_secular_rates
# c9: Ω̇
# c10: ω̇
# c11: Ṁ
# c12: μ/r²
# c13: ω̇ = 0
# c14: Ω̇ ≈ −5°/day
seg-098e7ea0ee13 = <b>Bahnkraftmodell (Zweikörper + J2).</b> Ein neues <c1/> fügt das Beschleunigungsmodell hinzu, das ein numerischer Propagator integriert: <c2/> (<c3/>), die Störung durch die Abplattung <c4/> (der geschlossene ECI-Ausdruck) und <c5/>, das beide summiert — in Kombination mit <c6/> als <c7/>. Es stellt außerdem die analytischen <b>säkularen Raten</b> von J2 bereit (<c8/>): die Knotenregression <c9/>, die Apsidendrehung <c10/> und die Drift der mittleren Anomalie <c11/>. Sechs Tests verankern die Physik an exakten Referenzen: <c12/> für den Zweikörperterm, der geschlossene Ausdruck von J2 am Äquator (~{ "10" }⁻³ des Betrags des Zweikörperterms), die <b>kritische Inklination</b> ({ "63.4349" }°), die das Perigäum festhält (<c13/>), die Knotenregression der ISS (<c14/>) und die ostwärts gerichtete Drift einer rückläufigen sonnensynchronen Bahn. Ehrlicher Umfang: nur Zweikörper + J2; J3–J6, Widerstand, Strahlungsdruck und dritter Körper sind Folgearbeiten.

# text
# c1: src/permalink.rs
# c2: +/
# c3: -_
# c4: encode_scenario
# c5: decode_scenario
# c6: ?s=
# c7: encode_permalink
# c8: decode_permalink
# c9: "foobar"
# c10: "Zm9vYmFy"
# c11: +
# c12: /
# c13: =
seg-d5c03ebc5707 = <b>Teilbare Permalinks für Szenarien.</b> Ein neues <c1/> fügt einen abhängigkeitsfreien Base64-Codec nach RFC { "4648" } hinzu (das Standard-Alphabet <c2/> mit Padding und ein URL-sicheres Alphabet <c3/> ohne Padding) sowie die Wrapper <c4/> / <c5/>, sodass ein TOML des Playgrounds in einen Query-Parameter <c6/> kodiert und als URL geteilt werden kann. Dem Browser als WASM-Bindings <c7/> / <c8/> bereitgestellt. Vier Tests verankern es an den kanonischen Vektoren aus RFC { "4648" } (<c9/> → <c10/> usw.), einem URL-sicheren Roundtrip eines Szenarios (kein <c11/>/<c12/>/<c13/> zu maskieren), der Zurückweisung ungültiger Symbole und einem Roundtrip über alle 256 Bytes. Ehrlicher Umfang: Der Codec und die Bindings werden hier ausgeliefert; die Oberfläche der Share-Schaltfläche im Playground, das Mehrserien-Diagramm mit Plotly/D3 und der A/B-Vergleichsmodus sind Folgearbeiten.

# text
# c1: src/batch_ls.rs
# c2: gauss_newton
# c3: h(x)
# c4: (HᵀWH)·Δx = HᵀW·(z − h(x))
# c5: a·exp(b·t)
seg-b615fb16d547 = <b>Batch-Kleinste-Quadrate nach Gauss–Newton (der differentielle Batch-Korrektor).</b> Ein neues <c1/> fügt den Schätzkern hinzu, auf dem eine <em>Bahnbestimmung</em> im Batch-Verfahren (oder jede Parameteranpassung) beruht: <c2/> linearisiert ein vom Nutzer geliefertes Modell <c3/> mit einer Jacobi-Matrix aus zentralen finiten Differenzen, bildet und löst die gewichteten Normalgleichungen <c4/> (unter Wiederverwendung der getesteten Matrixinversion) und iteriert bis zur Konvergenz mit Gewichten je Messung. Vier Tests verankern es: eine lineare Geradenanpassung, die die exakte Lösung der gewichteten kleinsten Quadrate erreicht, eine nichtlineare Anpassung <c5/>, die die wahren Parameter zurückgewinnt, eine 3D-Entfernungs-Multilateration, die aus rauschfreien Entfernungen eine bekannte Position zurückgewinnt (der Geschmack der Bahnbestimmung), und die Zurückweisung unterbestimmter/nicht passender Eingaben. Ehrlicher Umfang: Dies ist die generische Korrektor-Engine; das bahnspezifische Messmodell für Entfernung/Entfernungsrate/Azimut-Elevation, die analytische Zustandsübergangsmatrix für J2 und die Validierung an veröffentlichten Fällen sind Folgearbeiten.

# text
# c1: src/spoof_monitors.rs
# c2: spoof
# c3: combine_power_dbm
# c4: AgcMonitor
# c5: bpsk_autocorr
# c6: SqmMonitor
# c7: 10·log10(N)
# c8: R(τ)=1−|τ|
seg-0ada87934135 = <b>Spoofing-Monitore auf HF-Ebene (AGC-Leistung und SQM).</b> Ein neues <c1/> fügt zwei unabhängige Spoofing-Detektoren am Empfänger-Frontend hinzu, die den uhrgestützten Monitor für Zeit-Spoofing in <c2/> ergänzen: einen <b>AGC-Leistungsmonitor</b> (inkohärente Leistungssumme <c3/> + <c4/>), der die über einen konfigurierbaren dB-Spielraum hinausgehende zusätzliche Empfangsleistung markiert, die ein Spoofing-Sender hinzufügt, und einen <b>Signalqualitätsmonitor</b> (dreieckige Code-Autokorrelation <c5/> + <c6/>), der das Ungleichgewicht der Korrelatoren Early minus Late markiert, das Mehrwegeausbreitung/Meaconing/Replay hervorrufen. Vier Tests verankern die exakten geschlossenen Ausdrücke ({ "3.01" } dB bei einer Verdopplung der Leistung, die Summe <c7/>, das dreieckige <c8/> und die Alarmschwelle Early/Late von { "10" } %). Ehrlicher Umfang: Der vollständige Paritätsdetektor für Spoofing nach RAIM-Konsistenz, die Mehrschicht-Fusion der Ausgaben der Monitore und die Validierung gegen veröffentlichte Spoofing-Vektoren von Spirent/ION GNSS+ sind Folgearbeiten.

# text
# c1: src/integrator.rs
# c2: rk4_step
# c3: y' = f(t, y)
# c4: integrate
# c5: 0.9·(tol/err)^(1/5)
# c6: y' = y → e
# c7: < 1e-9
# c8: NumericalPropagator
seg-b1ff62d88cd2 = <b>Adaptiver numerischer ODE-Integrator.</b> Ein neues <c1/> fügt das erste Stück eines <em>numerischen</em> Propagators hinzu (die Bahnpropagation von Kshana ist sonst analytisches SGP4/SDP4): einen generischen Runge-Kutta-Schritt vierter Ordnung (<c2/>) über jedes System erster Ordnung <c3/> und einen adaptiven Treiber (<c4/>), der den lokalen Fehler durch <b>Schrittverdopplung</b> (Richardson-Extrapolation) mit dem üblichen Schrittregler <c5/> und der Logik für Annahme/Ablehnung steuert. Sechs Tests verankern ihn an exakten Lösungen: die Exponentialfunktion <c6/> auf <c7/>, die Fehlerreduktion um ~{ "16" }× je halbiertem Schritt, die die Konvergenz vierter Ordnung belegt, die Erhaltung von Energie/Rückkehr des harmonischen Oszillators über eine volle Periode und der adaptive Treiber, der mit variablen Schritten eine enge Toleranz einhält. Ehrlicher Umfang: Dies ist der Integratorkern mit seiner Fehlersteuerung; die eingebetteten Tableaus Dormand–Prince RK5({ "4" })/RKF7({ "8" }) und das hierarchische Bahnkraftmodell (Zweikörper + J2–J6 + Widerstand + Strahlungsdruck + dritter Körper), die ihn zu einem <c8/> machen, sind Folgearbeiten.

# text
# c1: src/fusion/ukf.rs
# c2: n
# c3: P⁺ = P⁻ − K S Kᵀ
seg-ca53c62839d8 = <b>Unscented-Kalman-Filter (Sigma-Punkte).</b> Ein neues <c1/> fügt das skalierte Unscented-Kalman-Filter (Julier & Uhlmann; Wan & van der Merwe) als allgemeinen Schätzer mit <c2/> Zuständen über vom Nutzer gelieferte Prozess- und Messfunktionen hinzu — den Sigma-Punkt-Schätzer, den ein eng gekoppelter GNSS/INS-Navigator verwendet, wenn das Modell für Pseudostrecke/Doppler stark nichtlinear ist und die Jacobi-Matrix eines EKF schlechter wird. Es enthält die zugehörige dichte lineare Algebra (Cholesky-Faktor für die Streuung der Sigma-Punkte, Gauss–Jordan-Inverse für die Innovationskovarianz) und ein Joseph-freies Update <c3/>. Sechs Tests legen es fest, die wichtigsten nutzen die exakte Eigenschaft, dass die Unscented-Transformation für ein <em>lineares</em> Modell das Kalman-Filter bis auf numerische Genauigkeit reproduziert (predict, update und ein vollständiger Zyklus aus predict+update jeweils gegen ein von Hand gerechnetes lineares KF abgeglichen, dazu eine 1D-analytische Prüfung der bayesschen Posteriori und die Identitäten von Cholesky/Inverse). Ehrlicher Umfang: Dies ist die Schätzer-Engine; der eng gekoppelte GNSS/INS-Navigator mit 17 Zuständen, das Messmodell für Pseudostrecke/Doppler und das Szenario zur Validierung des Ausfalls bleiben Folgearbeiten.

# text
# c1: araim_dual_raim
# c2: araim_raim
# c3: P_const
# c4: DualFaultPriors { p_sat, p_const }
# c5: P_HMI
# c6: N + C
# c7: P_const = 0
# c8: araim_raim
# c9: None
seg-da92d32b5715 = <b>Schutzniveaus für ARAIM mit zwei Konstellationen.</b> Ein neues <c1/> erweitert das Advanced RAIM für Einzelfehler (<c2/>) um den <b>konstellationsweiten Fehlermodus</b> von EU-ARAIM / DO-316: Neben den Hypothesen fehlerfrei und je Satellit liefert jede Konstellation (je Satellit gekennzeichnet) eine Hypothese, die alle ihre Satelliten auf einmal entfernt, mit der A-priori-Wahrscheinlichkeit <c3/> (ein neues <c4/>). Jede Hypothese fügt der Integritätssumme von MHSS einen Term hinzu, sodass VPL/HPL die kleinsten Schranken sind, deren Summe <c5/> das Budget über fehlerfrei + einzelner SV + Fehler je Konstellation einhält (die Aufteilung der Bonferroni-Fehlalarme erfolgt über alle <c6/> Hypothesen). Mit <c7/> ist das Ergebnis bitgleich mit <c8/>; ein Nutzer mit einer einzigen Konstellation erhält gegenüber dem Fehler seiner eigenen Konstellation <c9/> zurück (sie lässt sich nicht ausschließen) — genau deshalb ist die Abdeckung mit zwei Konstellationen wichtig. Vier Tests decken die Äquivalenz, die Aufweitung des Schutzniveaus, die Nichtverfügbarkeit bei einer einzigen Konstellation und die Eingabevalidierung ab und verwenden dabei die bestehende Maschinerie der Teillösungen mit Lösungstrennung wieder.

# text
# c1: src/precession.rs
# c2: (γ̄, φ̄, ψ̄, ε̄_A)
# c3: fw_angles
# c4: iauFw2m
# c5: precession_matrix
# c6: gcrs_to_mod
# c7: mod_to_gcrs
# c8: frames
# c9: ε̄ = 84381.406″ = 23.4392794°
# c10: ψ̄ ≈ 5039.998″
# c11: det = +1
# c12: ≈ 1.40°
# c13: ROADMAP.md
seg-d06c5f88282b = <b>Präzession nach IAU { "2006" } (Winkel nach Fukushima–Williams und Matrix für Bias-Präzession).</b> Ein neues <c1/> implementiert die Präzession nach IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }): die vier Winkel nach Fukushima–Williams <c2/> als Polynome in Julianischen Jahrhunderten der TT (<c3/>) und die Rotationsmatrix für Bias-Präzession von GCRS nach mittlerem Datum, über die SOFA-Konstruktion <c4/> daraus aufgebaut (<c5/>, mit den Hilfsfunktionen <c6/> / <c7/>). Dies ist das erste Stück eines inertialen Bezugssystems über der bestehenden GMST-basierten Reduktion <c8/>. Acht Tests validieren gegen geschlossene Anker — die mittlere Schiefe der Ekliptik für J2000 <c9/>, die veröffentlichten konstanten Terme der Winkel, die Akkumulation der allgemeinen Präzession <c10/> über ein Jahrhundert, Orthonormalität der Matrix und <c11/>, den Wert nahe der Identität (nur Bezugssystem-Bias) bei J2000 und den Nettodrehwinkel <c12/>/Jahrhundert. Ehrlicher Umfang (<c13/>): nur Präzession — die Nutation IAU 2000A mit 678 Termen, die vollständige Kette TEME→GCRS und eine numerische Gegenprüfung mit SOFA/ANISE auf µas/<{ "10" } m sind Folgearbeiten.

# text
seg-14c0a863eef1 = Physik des Beschleunigungsmessers mit Kaltatom-Interferometer (CAI) aus ersten Prinzipien.

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4π/λ
# c3: Φ = k_eff·a·T²
# c4: σ_Φ = 1/(C·√N)
# c5: C(t) = C₀·e^(−t/τ)
# c6: CaiAccelerometer::q_va()
# c7: AccelModel
# c8: |H(ω)| = (4/ω²)sin²(ωT/2)
# c9: accel_transfer_function
# c10: σ_Φ² = k_eff²·S_a·T³/3
# c11: vibration_phase_variance_white
# c12: vibration_phase_variance_band
# c13: beam_axis_projection
# c14: CaiAccelerometer::vibration_phase_noise
# c15: vibration_limited_accel
# c16: k_eff
# c17: √(S_a/(3T))
# c18: k_eff ≈ 1.61×10⁷
# c19: Φ(1 g) ≈ 1.58×10⁴ rad
# c20: σ_a ≈ 0.13 µg
# c21: 1/T²
# c22: 1/√N
# c23: T³
# c24: docs/QUANTUM.md
seg-408fc6feb284 = <c1/> modelliert ein Atominterferometer nach Mach–Zehnder mit drei Pulsen aus ersten Prinzipien statt aus einem Datenblatt: effektiver Wellenvektor <c2/>, Interferometerphase <c3/>, Quantenprojektionsrauschen (Schrotrauschen) <c4/>, Beschleunigungsempfindlichkeit je Schuss, Kontrastabfall <c5/> und — darauf kommt es an — <c6/>, das die weiße Beschleunigungs-PSD, die das klassische <c7/> bereits verarbeitet, aus Atomzahl, Abfragezeit und Kontrast <b>ableitet</b>. Das Modell deckt nun auch die <b>Kopplung von Vibrationen</b> ab — den dominanten Term realer Geräte: die Übertragungsfunktion Beschleunigung→Phase des Interferometers <c8/> (<c9/>), die Phasenvarianz bei weißer PSD <c10/> (<c11/>, mit einer numerischen Gegenprüfung durch ein Bandintegral <c12/>), die Rang-1-Größe <c13/> entlang des Strahls sowie <c14/> / <c15/> (letzteres reduziert sich auf den von <c16/> unabhängigen Boden <c17/>). Elf Tests prüfen die Physik von Hand nach (Rb-87 <c18/>, <c19/>, <c20/>/Schuss als Boden des Schrotrauschens gegenüber einem Vibrationsboden von ≈ { "5.9" } µg, die Skalierungsgesetze <c21/>, <c22/> und <c23/>). Ehrlicher Umfang in <c24/>: Dies umfasst den Boden des Projektionsrauschens und das darüber liegende vibrationsbegrenzte Regime; Laserphasenrauschen, Systematiken von Coriolis und Lichtverschiebung sowie die Validierungsszenarien PHARAO/CARIOQA bleiben Folgearbeiten.

# text
# c1: ImuKind
# c2: Classical
# c3: QuantumCai
# c4: [cai]
# c5: CaiCfg
# c6: vibration_psd
# c7: quantum_cai
# c8: q_va
# c9: cai
# c10: skip_serializing_if = "Option::is_none"
# c11: Classical
# c12: QuantumCai
seg-ed668459d019 = <b>Quanten-CAI-Beschleunigungsmesser in das Inertialszenario eingebunden.</b> Ein Beschleunigungsmesser in einem Szenario der inertialen Koppelnavigation wird nun zu einem neuen <c1/> aufgelöst — <c2/> (der bestehende Sensor mit Datenblattkoeffizienten) oder <c3/>, wenn er einen optionalen Block <c4/> trägt (<c5/>: Wellenlänge, Pulsabstand, Atomzahl, Kontrast, Zykluszeit und eine optionale <c6/> der Plattform). Die PSD der Geschwindigkeits-Zufallsbewegung <c8/> eines Sensors <c7/> wird aus der Physik des Interferometers <b>abgeleitet</b> — dem Boden des Schrotrauschens plus, wenn eine Vibrations-PSD angegeben ist, dem vibrationsbegrenzten Beitrag quadratisch addiert — statt aus einem gelieferten Koeffizienten, und die Herkunft des Laufs hält fest, dass das Rauschen physikalisch abgeleitet ist. Das Feld <c9/> ist <c10/>, sodass bestehende Szenarien es auslassen und bytegleich serialisiert werden (der Hash des Szenarios ist unverändert). Fünf Tests decken die Ableitung, die quadratische Summe der Vibration, die Auswahl <c11/>/<c12/>, die hashstabile Serialisierung und einen durchgängigen Lauf mit CAI-Antrieb ab.

# text
seg-c3978a122010 = Optimierer für den Konstellationsentwurf und Geometrie nach Streets-of-Coverage.

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: MinSatellitesForCoverage
# c6: MaxCoverage
# c7: MinWorstPdop
# c8: coverage_half_angle_rad
# c9: λ = arccos(Re/r·cos ε) − ε
# c10: street_half_width_rad
# c11: cos c = cos λ / cos(π/s)
seg-aae519e71c00 = <c1/> erhält <c2/>, einen gradientenfreien Gitteroptimierer, der den Entwurfsraum <c3/> durchsucht und den besten Walker-Entwurf unter einem gewählten <c4/> — <c5/>, <c6/> oder <c7/> — über den bereits validierten PDOP-Sweep zurückgibt (ein Test bestätigt, dass er den Gewinner der Brute-Force-Suche liefert). Dazu kommen die analytischen geschlossenen Ausdrücke nach <b>Streets-of-Coverage</b> <c8/> (<c9/>) und <c10/> (<c11/>, Rider/Beste), von Hand gegen die Geometrie aus Lehrbüchern geprüft und mit Erkennung der Lücke bei zu dünner Besetzung. Der vollständige Löser nach Rider für die Mindestzahl von Satelliten bei globaler Abdeckung, ein 3D-Globus im Playground und eine DOP-Gegenprüfung mit einem externen Werkzeug bleiben Folgearbeiten.

# text
# c1: kshana <orbit.toml> --export-sp3 out.sp3
# c2: export_sp3 = true
# c3: <scenario>.sp3
# c4: api::export_sp3
# c5: auto_export_sp3
# c6: OrbitClockScenario::to_sp3_string
# c7: epoch
# c8: tests/sp3_export_roundtrip.rs
# c9: gps-ops
seg-7b8468636dea = <b>Export der präzisen Ephemeride als SP3 aus der CLI.</b> Ein propagiertes Szenario für Bahn/Konstellation lässt sich nun in eine SP3-c-Datei schreiben: <c1/>, oder <c2/> im Szenario schreibt <c3/> automatisch (<c4/> / <c5/>, <c6/>, optional <c7/>). Ein Roundtrip-Test (<c8/>) propagiert den realen Celestrak-Snapshot <c9/>, exportiert ihn, parst ihn erneut und bestätigt, dass die zurückgewonnenen ECEF-Positionen über { "24" } h mit der Wahrheit von SGP4 auf <b>< { "0.5" } m</b> übereinstimmen (deutlich innerhalb der Toleranz von { "10" } m in TLE-Güte). Das README dokumentiert die Rolle für die Interoperabilität (RINEX → RTKLIB/gLAB, SP3 → Ginan/Produkte für präzise Bahnen).

# text
seg-56c729ba110f = Gekoppeltes Kalman-Filter für Uhr+Position (Kovarianz mit Kreuzblock).

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-0a424875131d = <c1/> ist ein einziges gestapeltes Filter <c2/> (Updates in Joseph-Form), dessen Messung der <b>Pseudostrecke</b> <c3/> die Blöcke von Position und Uhr tatsächlich koppelt — anders als die zwei unabhängigen Filter mit je zwei Zuständen im älteren Fusionspaket, die die Kovarianz des Kreuzblocks exakt bei null halten. Validiert: Eine gemeinsame Pseudostrecke treibt <c4/> auf einen Wert ungleich null; zwei verschiedene Geometrien lösen gemeinsam eingebrachte Versätze von Position+Uhr auf, die eine einzelne Entfernung nicht trennen kann; eine <b>reine Uhrenkorrektur schärft die Position</b> über die Kreuzkovarianz (der Gewinn, den entkoppelte Filter nicht liefern können); und das Monte-Carlo-NEES ist <b>mit χ²({ "4" }) konsistent</b>. Dies ist die Realisierung mit 1 Freiheitsgrad (die Dimensionalität des Fusionspakets); die 3D-Erweiterung auf 8 Zustände und die Einbindung in das lauffähige Paket sind als Folgearbeiten verfolgt.

# text
seg-3983794a9584 = <b>Überwachung der Konsistenz des Kalman-Filters (NIS/NEES).</b> Die Kovarianzaktualisierung des Uhrenfilters mit zwei Zuständen liegt nun in der <b>stabilisierten Joseph-Form</b> `P⁺ = (I−KH)P(I−KH)ᵀ

# text
# c1: , which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked in CI at
# c2: ). A new
# c3: runs a Monte-Carlo consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation², target 1) and **NEES** (normalised estimation error², target 2) against 95% χ² bands, surfaced as a
# c4: block in the clock result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test proves the monitor flips to inconsistent when the process noise is mistuned by ×0.1–×10. Adds a general χ² quantile (
seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, tabellengeprüft).

# text
# c1: docs/PROVENANCE.md
# c2: gps-ops
# c3: provenance
seg-f9689061a1d2 = <b><c1/> — eine einzige zitierbare Herkunftstabelle.</b> Fasst jeden Sensorparameter (Uhren, Inertial, Zeitübertragung), jedes physikalische/algorithmische Modell (Bahn, Zeitsysteme, Bezugssysteme, Iono/Tropo, Integrität, Erkennung, Jamming, Allan) und jeden Validierungsdatensatz (AIAA 2006-6753, Celestrak <c2/>) mit seiner veröffentlichten Quelle zusammen — Datenblatt, Paper, ICD oder Norm — und einer ehrlichen Reifebezeichnung (flugqualifiziert / Bodenlabor / Weltraumziel auf Bodenhardware). Aus der Einleitung des README und der Dokumentationstabelle verlinkt; ergänzt die Zeichenfolgen <c3/> je Lauf, die bereits im Ergebnis-JSON mitreisen.

# text
# c1: ScenarioKind
# c2: kind
# c3: ScenarioKind::classify
# c4: run_toml
# c5: run_scenario(src) -> Result<RunOutput, KshanaError>
# c6: InvalidInput
# c7: NonConvergence
# c8: Unsupported
# c9: IoError
# c10: kind_tag()
# c11: Scenario
# c12: ExternalPack
# c13: jamming
# c14: list_scenario_kinds()
# c15: list_kinds()
# c16: error_kind()
# c17: docs/ARCHITECTURE.md
seg-55c7b52b5fdb = <b>Typisierte Szenario-API.</b> Der Dispatch erfolgt nun über ein typisiertes Enum <c1/> statt über einen rohen Vergleich der Zeichenfolge <c2/> (<c3/> + erschöpfender Dispatch), sodass das Hinzufügen eines Pakets vom Compiler geprüft wird. Neue typisierte Oberflächen neben dem unveränderten, eine Zeichenfolge zurückgebenden <c4/>: <c5/> mit einer strukturierten Fehlertaxonomie (<c6/> / <c7/> / <c8/> / <c9/>, jeweils mit einem stabilen <c10/>); ein Trait <c11/> und ein Erweiterungspunkt <c12/> (das Paket <c13/> ist als durchgerechnetes Beispiel darüber verdrahtet); und eine Introspektion über <c14/> (Name, Beschreibung, erforderliche/optionale Felder je Typ). Die Bindings für Python und WebAssembly erhalten <c15/> und <c16/>. Dokumentiert in <c17/>.

# text
seg-2b86391b753e = Reale GPS-Konstellation + Abdeckung des Betriebsbereichs.

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: scripts/fetch_tles.sh
# c5: tests/scenario_coverage.rs
# c6: docs/VALIDATION.md
seg-288f2b1872c8 = <c1/> liefert nun einen <b>realen Celestrak-Snapshot <c2/></b> (2021-07-28, { "30" } Satelliten) statt synthetischer Walker-TLEs, mit <c3/>, sodass er nur geladen wird, wenn jede TLE-Prüfsumme gültig ist; <c4/> dokumentiert die reproduzierbare Aktualisierung, und das README nennt die offene Datenquelle. Der neue <c5/> übt jedes Paket über ≥{ "5" } Varianten des Betriebsbereichs und stellt dabei endliche/beschränkte Ausgaben fest, bestätigt, dass der <b>Flicker-FM-Boden das Überbrücken einer Uhr messbar verschlechtert</b>, wenn er aktiviert ist (nun in drei ausgelieferten Szenarien gesetzt), und bestätigt, dass das <b>Fusionsfilter mit einem realistischen Bias des Beschleunigungsmessers ungleich null konvergiert</b> (innerhalb des { "3" }-Fachen des Falls mit auf null gesetzten Biases), womit die Realismuslücke „Fusion funktioniert nur mit auf null gesetzten Biases“ geschlossen wird. <c6/> erhält eine Tabelle zum Betriebsbereich.

# text
# c1: gnss-sim
# c2: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c3: [iono]
# c4: [tropo]
# c5: gnss_measurements[]
# c6: src/gnss_sim.rs
# c7: scenarios/gnss-sim-raim.toml
seg-f78d7dce7bfa = <b>GNSS-Simulation im Messraum (Typ <c1/>).</b> Ein Vorwärtsmodell auf Pseudostreckenebene: Je sichtbarem Satelliten synthetisiert es <c2/> und den L1-Doppler, mit der Einzelfrequenz-Ionosphäre nach <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) und der Zenit-Troposphäre nach <b>Saastamoinen</b>, mit der Abbildungsfunktion nach <b>Niell ({ "1996" })</b> projiziert — bereitgestellt als TOML-Blöcke <c3/> und <c4/>. Die Residuen speisen ein Snapshot-RAIM für HPL/VPL je Epoche, und ein JSON-Array <c5/> trägt je SV die Pseudostrecke, den Doppler, C/N₀ und die Korrekturen für Iono/Tropo. Ein Lauf ohne Rauschen reproduziert Geometrie + Korrekturen auf unter einen Millimeter (CI-Test). Neu: <c6/> und <c7/>.

# text
# c1: spoof
# c2: linear_ramp
# c3: step_jump
# c4: meaconing
# c5: replay
# c6: target_pfa
# c7: P_md
# c8: mc_runs
# c9: 1 − P_md
# c10: src/detection.rs
# c11: scenarios/spoof-meaconing.toml
# c12: [attack] rate_ns_per_s
seg-833249802c56 = <b>Stochastischer Detektor für Zeit-Spoofing (Typ <c1/>).</b> Das Paket Spoof führt nun einen echten Detektor aus statt eines deterministischen Vergleichs von Rampe und Schranke: vier Einspeiseformen (<c2/>, <c3/>, <c4/>, <c5/>), einen zweiseitigen Energietest χ²₁ / nach Neyman–Pearson auf der Monitorstatistik mit Uhrenstützung, wobei die Schwelle aus einem Zielbudget für Fehlalarme <c6/> festgelegt wird, und die Wahrscheinlichkeit der Fehlerkennung <c7/>, sowohl als geschlossener Ausdruck als auch per Monte-Carlo ausgewiesen (<c8/> Läufe je Hypothese — beide stimmen bis auf einige ×1/√N überein). Das Gütemaß Security ist nun <c9/> bei der operativ schädlichen Größe (Spezifikation). Neu: <c10/> (gaußsche Schwanzfunktionen, NP-/Energietest, Monte-Carlo P_fa/P_md) und <c11/>. Abwärtskompatibel: Ein einfaches <c12/> wird weiterhin als lineare Rampe akzeptiert.

# text
# c1: spoof
# c2: 1 − min_detectable/threshold
# c3: 1 − P_md
# c4: security
seg-b3f3d2ca8a3d = <b>Definition des Gütemaßes Security (Typ <c1/>):</b> von der analytischen Erkennbarkeitsschranke <c2/> zu <c3/> des stochastischen Detektors. Das Feld <c4/> des Uhrenpakets bleibt der schnellere analytische Stellvertreter.

# text
seg-ee1268975b2c = Hinzugefügt (Fortsetzung)

# text
# c1: jamming
# c2: Q
# c3: availability_under_jamming
# c4: src/jamming.rs
# c5: scenarios/jamming-demo.toml
# c6: docs/CAPABILITY.md
# c7: docs/VALIDATION.md
seg-f71696b7fa20 = <b>HF-Jamming-Modell (Typ <c1/>).</b> Ein Störungsmodell auf Basis des Link-Budgets, das Leistung und Geometrie eines Jammers in den Verlust der Verfolgung je Satellit übersetzt: das Verhältnis von Jammer zu Signal aus der Freiraumdämpfung und dem Gewinn der Empfangsantenne je Richtung, das effektive C/N₀ über die Standardgleichung für Anti-Jam (Spreizgewinn der Entspreizung × der Faktor der spektralen Trennung <c2/>; Kaplan & Hegarty §{ "9.4" }) und eine konfigurierbare Verfolgungsschwelle, über eine Walker-Konstellation als Gütemaß <c3/> bewertet. Neu: <c4/> und <c5/>. Der ehrliche Umfang (keine Mehrwegeausbreitung, keine Geländeabschattung, kein AGC, kein adaptives Nullen) ist in <c6/> / <c7/> dokumentiert.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: [base]
# c4: scenarios/sweep-nd-inertial.toml
seg-d4dc36011ea1 = <b>Generischer N-D-Parameter-Sweep über jeden Szenariotyp (<c1/>).</b> Der bisherige N-D-Sweep galt nur für das Uhrenpaket. <c2/> variiert gepunktete TOML-Schlüssel eines Szenarios <c3/> über das kartesische Produkt seiner Achsen, schickt jeden Gitterknoten erneut über den normalen Laufpfad und liest eine oder mehrere Kennzahlen über einen gepunkteten JSON-Pfad aus dem Ergebnis aus — sodass er für jedes Paket funktioniert (inertial, gnss-ins, integrity, spoof, …), ohne an den Rust-Typ des jeweiligen Pakets gebunden zu sein. Auf nativen Zielplattformen werden die Gitterknoten parallel über Betriebssystem-Threads ausgewertet (ohne zusätzliche Abhängigkeit); wasm fällt auf sequenzielle Ausführung zurück. Deterministisch und zeilenweise unabhängig von der Zahl der Threads. Neues Beispiel <c4/>.

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
# c3: gnss-ins
seg-1c42e15d65a9 = <b>Per TOML konfigurierbares deterministisches IMU-Fehlermodell im Paket <c1/>.</b> Die dreiachsige Strapdown-Fehlerkette (Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Ratenrampe; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) ist nun je Sensor über einen optionalen Block <c2/> aus einer Szenariodatei erreichbar und legt sich über die konstanten Einschaltbiases. Wird der Block weggelassen, bleibt jeder Sensor eine reine Quelle mit konstantem Bias, sodass bestehende Läufe von <c3/> unverändert sind. Damit wird das zuvor nur in der Bibliothek vorhandene Fehlermodell in ein lauffähiges Paket und ein Gütemaß eingebunden.

# text
# c1: tests/fixtures/igs/NOTICE
seg-e035371fbe58 = <b>Validierung mit realen Daten.</b> Der Parser für RINEX-Navigationsdateien mit mehreren GNSS, der RK4-Propagator für GLONASS und der SP3-Reader werden nun gegen echte Dateien von IGS/DLR geübt (eine reale gemischte RINEX-{ "3" }-Broadcast-Navigationsdatei und ein SP3-c-Bahnprodukt des IGS), nicht nur gegen selbst verfasste Beispiele — wobei nicht leere Satellitenmengen und endliche, physikalisch plausibel große ECEF-Positionen festgestellt werden. Die Fixtures dienen nur Tests (vom veröffentlichten Crate ausgenommen); siehe <c1/>.

# text
# c1: P_HMI
seg-2a807ae8e194 = <b>RAIM auf der Geometrie realer Referenzbahnen.</b> Die Kerne für Snapshot, Lösungstrennung (MHSS) und das Schutzniveau von ARAIM sind nun gegen die reale Geometrie der präzisen IGS-Bahnen (SP3) validiert, nicht allein gegen synthetische Konstellationen: Die Geometrie der Sichtlinien wird aus der ersten SP3-Epoche an einer realen Bodenstation aufgebaut, und die Tests stellen Schutzniveaus im Meterbereich mit Verfügbarkeit nach APV-I fest, dass ein Bias der Pseudostrecke von { "60" } m den χ²-Monitor auslöst, dass die Lösungstrennung den fehlerhaften Satelliten <b>identifiziert</b> und dass die Niveaus von ARAIM das zugewiesene <c1/> einhalten. Damit wird die Lücke geschlossen, nur auf synthetischer Geometrie validiert zu sein (die Parität mit gLAB im Empfängerbereich über einen vollständigen RINEX-Bogen bleibt ein Punkt der Roadmap — sie braucht eine Lösung der Pseudostrecke).

# text
# c1: sweep::nd_sweep_ensemble
# c2: metric_stat
# c3: runs = 1
# c4: nd_sweep
seg-651cc4af4872 = <b>Konfidenzintervalle je Knoten für den N-D-Parameter-Sweep</b> (<c1/>). Jeder Gitterknoten des N-dimensionalen Sweeps über das kartesische Produkt kann nun als Monte-Carlo-Ensemble von Seeds ausgewertet werden und weist je Knoten den Mittelwert, die Perzentile und ein Perzentil-Bootstrap-KI von { "95" } % der Kennzahl aus (für beide Uhren) — ein statistisch ehrlicher Sweep statt einer einzelnen Ziehung je Knoten. Verwendet die Maschinerie für Ensemble/Bootstrap wieder (<c2/>); deterministisch; <c3/> reduziert sich exakt auf den <c4/> mit einem Seed. (Die Verallgemeinerung des Sweeps auf alle Pakete, verflochten mit dem Refactoring des typisierten Szenarios, und die parallele Ausführung stehen noch aus.)

# text
# c1: src/inertial/imu_errors.rs
seg-5be84079b8b6 = Deterministisches IMU-Fehlermodell für den 3-Achsen-Strapdown-Navigator (<c1/>).

# text
# c1: ImuErrorModel
# c2: (ω, f)
# c3: ImuErrorModel::ideal()
# c4: inertial
seg-492e670736b2 = <c1/> verzerrt ein wahres Paar <c2/> im körperfesten System in ein gemessenes, über fünf systematische Kategorien (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabelle { "4.1" }): <b>Skalenfaktor</b> (Verstärkungsfehler je Achse in ppm), <b>Fehlausrichtung / Kreuzkopplung</b> (Nichtorthogonalität des Triaden außerhalb der Diagonale), <b>g-Empfindlichkeit</b> (ein Bias der Drehrate des Gyros proportional zur spezifischen Kraft), <b>Quantisierung</b> (Runden auf das LSB der Ausgabe) und <b>Ratenrampe</b> (eine in der Zeit lineare Drift — die dritte Allan-Region), dazu ein konstanter Einschaltbias. Jeder Term ist standardmäßig null, sodass <c3/> ein transparenter Durchgriff ist und bestehende Szenarien unberührt bleiben. Jede Fehlerquelle hat einen Isolationstest (Skala linear auf <{ "0.01" } %, Kreuzachsen-Fehlausrichtung über dem Boden des VRW, Bias durch g-Empfindlichkeit, LSB-Raster, lineare Rampe), und ein durchgängiger Test treibt einen Navigationsfehler aus einer verzerrten IMU durch die Mechanisierung. Nicht modelliert: Fehler durch Vibrationsgleichrichtung, Temperaturgradienten-Drift. (Das ausgelieferte Szenariopaket <c4/> rechnet weiterhin mit dem älteren skalaren Budget mit 1 Freiheitsgrad; dieses Modell speist die 3-Achsen-Bibliothek.)

# text
# c1: src/inertial/attitude.rs
# c2: Quaternion
# c3: to_dcm
# c4: from_dcm
# c5: q̇ = ½ q ⊗ ω
# c6: coning_increment
# c7: ½ Δθ_prev × Δθ_cur
# c8: src/inertial.rs
# c9: src/inertial/
# c10: crate::inertial
seg-290b08199bfb = <b>Dreiachsige Darstellung der Lage für Strapdown-INS (<c1/>).</b> Ein Typ <c2/> für Einheitsquaternionen (Skalar zuerst, Konvention nach Hamilton), der die Rotation Körper→Nav trägt, mit einer DCM-Sicht (<c3/>/<c4/> nach dem Verfahren von Shepperd), dem Hamilton-Produkt, Konstruktoren aus Achse-Winkel und Rotationsvektor (exakte Exponentialabbildung) sowie der Kinematik der Quaternionen — sowohl ein Update der Rate mit RK erster Ordnung (<c5/>) als auch ein Update des Rotationsvektors mit Coning-Korrektur. Das Zwei-Abtastwert-<c6/> (Savage / Bryan–Lewantowski, <c7/>) liefert den Kreuzkopplungsterm der Drehrate, den die skalare Koppelnavigation auslässt. Dies ist die Grundlage der Lage für die vollständige 3-Achsen-Mechanisierung, die den älteren Pfad mit Fehlerbudget für 1 Freiheitsgrad ersetzt. Gegen geschlossene Rotationen verifiziert: Die Propagation mit konstanter Rate entspricht dem Quaternion aus Achse-Winkel auf { "1e-6" }, DCMs sind orthonormal mit Determinante eins, und Coning verschwindet bei Bewegung um eine einzelne Achse. (<c8/> ist nun das Modulverzeichnis <c9/>; der öffentliche Pfad <c10/> ist unverändert.)

# text
# c1: runs = N
# c2: ensemble
# c3: monte_carlo
seg-3225674ce4ea = <c1/> bei einem Inertialszenario führt N Seeds aus und weist je Kennzahl den Mittelwert, die Standardabweichung, die Perzentile und ein Perzentil-Bootstrap-Konfidenzintervall von { "95" } % aus (<c2/>). Jeder Inertiallauf trägt nun ein Flag <c3/>, sodass ein Gütemaß aus einer einzelnen Realisierung nicht mehr mit einer Verteilung verwechselt wird. (CEP/2DRMS werden bewusst nicht ausgewiesen — sie erfordern das 3-Achsen-Modell der Roadmap.)

# text
# c1: cargo-deny
seg-ecafa9d44810 = <c1/> <b>lehnt</b> zurückgezogene (yanked) Abhängigkeiten nun ab (statt nur davor zu warnen).

# text
seg-b49bbb60c2cd = <b>Uhren-Holdover</b> — weißes FM, Random-Walk-FM und lineare Alterung; validiert durch die überlappende Allan-Abweichung (Riley, NIST SP { "1065" }). Chip-Scale-Atomuhr gegenüber optischer Gitteruhr mit Strontium.

# text
seg-be2c5f28b256 = <b>Inertiale Koppelnavigation</b> — Restbias + Zufallsbewegung der Geschwindigkeit, doppelt zum Positionsfehler integriert; validiert gegen die Beziehungen zum Fehlerwachstum nach Groves. Kaltatom-Beschleunigungsmesser gegenüber einem Beschleunigungsmesser in Navigationsgüte.

# text
seg-fcb0f72db736 = <b>Zeitübertragung</b> — Timing-Jitter einer optischen gegenüber einer HF-Strecke → Synchronisationsgenauigkeit → Einweg-Entfernungsmessung.

# text
seg-93e5f2f70b58 = <b>Hybride Fusion (Abschluss)</b> — eine kombinierte PNT-Suite, die sowohl Zeit als auch Position halten muss, mit optionaler Uhrenstützung durch optische Zeitübertragung zwischen Satelliten.

# text
# c1: scenarios/
# c2: provenance
seg-e0a8cbe0c105 = <b>Ein zitiertes Referenzszenario je Paket</b> unter <c1/>, wobei jeder numerische Parameter ein begutachtetes <c2/> trägt.

# text
seg-8f1cc09b2513 = <b>Schutzvorkehrungen für Reproduzierbarkeit und Hygiene des Repositorys</b>; CI (Format, clippy, Tests, Schutzvorkehrungen, MSRV) und eine an Tags gebundene Release-Pipeline, die alle Prüfungen erneut ausführt.

# text
seg-8b4e21f56334 = <b>Dokumentation</b>: README mit Architekturdiagrammen, Bericht zum Validierungsstatus, Leitfaden zum Mitwirken, Sicherheitsrichtlinie und Verhaltenskodex; Lizenz Apache-2.0; Vorlagen für Issues/PRs und Konfiguration von Dependabot.

# text
seg-e26d94f06ead = Durchgehend herstellerneutral; begutachtete wissenschaftliche und metrologische Zitate bleiben erhalten.

# text
# c1: NOTICE
# c2: cargo-deny
seg-84cb67686edf = Lizenzhygiene nach Apache-2.0: SPDX-Header in allen Quellen, eine <c1/> mit Markenhinweis, Sign-off nach dem Developer Certificate of Origin (DCO) für Beiträge und Durchsetzung der Lizenzen/Hinweise der Abhängigkeiten durch <c2/> in der CI.

# text
seg-a0f14bea7532 = Open-Core-Positionierung (README): eine freie Engine unter Apache-2.0 plus verfügbarer kommerzieller Support, Integration und proprietäre Erweiterungen von Ashforde OÜ — getragen von Dienstleistungen, nicht von Lizenzgebühren.

# text
# c1: CITATION.cff
seg-899815063eb1 = <c1/>, damit die Software zitiert werden kann.

# text
seg-15f45d8ccb0f = <s1>Zurück</s1>Wo Kshana steht

# text
seg-cd8a14a9e8ec = <s1>Weiter</s1>Lizenzierung

# text
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = Dieses Release fügt der offenen Engine zwei Anwendungssuiten der Stufe MODELLED hinzu: einen <b>Demonstrator für quantengestützte PNT</b> (vertrauenswürdige Quanten-Zeitübertragung, GNSS-freie Quantennavigation, Quanten-Fehler-/Anomalieerkennung) und eine <b>PNT-Suite für Mond / cislunaren Raum</b> (Mond-Koordinatenzeit, Mond-VLBI, gemeinsame OD+Uhr, Frame-Realisierung, Service-Volume, differenzielle PNT, Interoperabilitätsexport), jede aus einem einzigen <c1/> ausführbar und jede mit einem ehrlichen <c2/>-Datensatz sowie einem Register zu Repräsentativität / Lücken bis zum Flug. Es bringt außerdem <b>sechs neue Validierungen gegen externe unabhängige Referenzen</b> und erhöht damit die maschinengeprüfte Validierungsmatrix auf <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> in ihren { "61" } Zeilen. Die neuen Anwendungszahlen sind MODELLED und stammen aus illustrativen Parametern öffentlicher Quellen, ohne TRL, Flugerfahrung, Zertifizierung oder Billigung durch eine Agentur; die validierten Kerne, die sie wiederverwenden, sind als solche gekennzeichnet.

# text
seg-065c4431197e = Lab-Replay: eine Tracking-Engine, Erkennungsmonitore und ein Kampagnenläufer für GNSS-IQ-Aufzeichnungen, mit den dazugehörigen Schleifenentwürfen, C/N0-Schätzern und Bewertungen. Evidenzklasse: Alles Folgende ist <b>MODELLED</b> oder auf interne Konsistenz gegen geschlossene Formen und gesäte Simulation geprüft; nichts davon fügt eine Zeile der Stufe VALIDATED hinzu, und das Verifikationsregister ist unverändert ({ "251" } Zeilen: { "124" } validiert, { "123" } modelliert, { "4" } Partner). Es ist eine Software-Analyseschicht: Nichts hier synthetisiert eine Wellenform eines Störsenders oder Spoofers, und nichts sendet.

# text
seg-07edced2764a = Neue Zeile der Stufe VALIDATED "LunaNet AFS frame channel coding, FID { "0" }": die Frames mit 6000 Symbolen sind Symbol für Symbol gleich denen von LANS-AFS-SIM (vorregistriert 986ac280); der Subframe-1-Code reproduziert das Rechenbeispiel in Abbildung { "8" } des LSIS, und der CRC-24 den Prüfwert aus dem Katalog CRC-24/LTE-A.

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Gemessene Gerätekarten mit Vorhersage auf zurückgehaltenen Daten</b>, neue Zeile der Stufe MODELLED (ein Befund): Fit auf einem Drittel, Vorhersage der Allan-Abweichung der anderen zwei Drittel innerhalb eines Faktors von { "1.5" } (vorregistriert 2ec76864). GPS Block IIF auf einem frischen IGS-Fenster (2026-03-01 bis { "14" }): { "10" } von { "11" }; G27 ist auf der Zwei-Stunden-Skala optimistisch (schlechtester Faktor { "1.510" }). Caesium (innerhalb, { "1.070" }), OCXO (außerhalb, { "2.348" }) und Strontium (innerhalb) werden berichtet, nicht blind. Die Empfängerkarte des JammerTest sowie die Karten für den Galileo-Maser und die Deep Space Atomic Clock sind blockiert. Eine Modellklasse für den TCXO des Empfängers ZED-F9P an { "12" } statischen Stationen in Wroclaw (Zenodo { "6488497" }) scheitert: { "1" } von { "11" } blinden Stationen in einem offengelegten, korrigierten erneuten Lauf (<c1/>, <c2/>).

# text
# c1: tests/leo_resilience_verticals.rs
seg-222ad0b777f8 = Drei Matrixzeilen der Stufe MODELLED: der Spoofing-Monitor für Doppler und Überflug-Geometrie, der Spoofing-Monitor zwischen den Bändern und die Ionosphärensondierung. <c1/> prüft die Monitore (still vor dem Einsatz, die Doppler-Statistik quadratisch im Sprung, der ionosphärische Sprung eines Bodenspoofers und keiner bei einem ionosphärenbewussten), die Sondierungsidentität, die Zeitgebungsspur gegenüber den Zeilenstatistiken und dass der Export einer Kampagne dem jedes Mitglieds entspricht.

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: realdata-clock
seg-22c09748488b = <b>Validierung der Holdover-Inversion auf zurückgehaltenen Daten an einer realen Uhr</b> (<c1/>): angepasst auf dem ersten Drittel der Aufzeichnung Caesium 5071A gegen Wasserstoffmaser liegen die vorhergesagten Ein-Sigma-Verletzungen bei sechs Schwellen von { "0.5" } bis { "2.5" } ns bei { "0.84" } bis { "1.03" } der Verletzungen, die an den anderen zwei Dritteln gemessen wurden, gegenüber einem Zielwert von { "1.5" }, der vor dem ersten Lauf des Tests festgelegt wurde. Eine Kontrolle (die Allan-Abweichung bei einer Sekunde als weißes Rauschen gelesen) verfehlt ihn um einen Faktor von etwa { "1 000" } und scheitert am Zielwert. Neue Registerzeile der Stufe VALIDATED; der Workflow <c2/> führt sie jetzt aus.

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>GPS-Block-IIF-Karten mit Termen pro Umlauf</b>, neue Zeile der Stufe MODELLED (ein Befund): auf einem zweiten frischen Fenster (2026-04-01 bis { "14" }) liegen { "9" } von { "11" } innerhalb des Zielwerts; G03 ({ "1.947" }) und G25 ({ "1.581" }) sind optimistisch, weil ihre zurückgehaltenen Aufzeichnungen verrauschter sind als ihre Fit-Drittel; ohne die periodischen Terme scheitern alle { "11" } (vorregistriert fb475550; <c1/>).

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = Verifikationstabelle <c1/>: die Zeile zu Liu und ATOMIC aufgeteilt in eine Zeile mit 22 Parametern der Stufe VALIDATED und eine Zeile zu ATOMIC und der Fünf-Höhen-Tabelle der Stufe MODELLED.

# text
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Register zu Repräsentativität & Lücken bis zum Flug</b> (<c1/>). Ein strukturierter Datensatz, den jeder Demonstrator ausgibt: was repräsentativ ist, was vereinfacht ist und was zwischen dem Modell und dem Flug steht, der ehrliche Begleiter jedes Trades der Stufe MODELLED.

# text
# c1: jamming
seg-411431a9b26b = Zwei neue Zeilen (MODELLED): der Wasserfall und die C/N0-Zeitleiste, die sich genau auf die Kette der Art <c1/> reduzieren (in jedem Bericht gegengeprüft), sowie der SigMF-Codec und der Welch-Schätzer. Im Repository liegt keine Aufnahme von Dritten.

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Neuer optional zuschaltbarer Löser mit Quadratwurzel-Information (<c1/>; <c2/> im Szenario lunar-frame-campaign): Householder-QR, Marginalisierung über den Dreiecksfaktor, eine Jacobi-SVD für das Spektrum und kompensierte Produkte allein aus korrekt gerundeten Operationen. Gegenüber der unabhängigen Referenz mit 50 Stellen (vorregistriert b41908c9) stimmen seine Datums-Sigmas an einem neuen Datum (2026-06-09) bis { "3e-13" } überein; bei den Eingaben vom 2026-03-18 und 2024-01-01 weicht der Standardlöser um bis zu { "1e-5" } ab. Neue Zeile VALIDATED unter P2. Der Standardlöser und seine Ausgabe bleiben unverändert. Die vorregistrierten Zielwerte bescheinigen Fehler nur oberhalb von etwa { "2e-7" } relativ: Sie weisen den Standardlöser zurück, nicht aber ein umgekehrtes Householder-Vorzeichen, ein unkompensiertes Skalarprodukt oder eine spektrale Endinverse, und die Zeile sagt das.

# text
seg-4ec44f8a5f8e = D12, erweiterte Genauigkeit und ein Quadratwurzel-Löser (zwei neue Zeilen VALIDATED: { "226" } -> { "228" } Zeilen, { "110" } -> { "112" } validiert).

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Mond-Bezugssystemdatum aus einer realen Kampagne, Kernel-Mondmittelpunkt</b> (neue Zeile VALIDATED): auf { "447" } ungesehenen Normalpunkten aus dem 2. Quartal 2019, vorregistriert 830d945a, bevor einer abgerufen wurde, stimmt die Datumskovarianz auf dem Kernel-Pfad mit der unveränderten SPICE- und NumPy-Referenz innerhalb von { "7.6e-5" } gegenüber Zielwerten von { "1" } % und { "2" } % überein (<c1/>). Der Gründer entschied, dass diese Zeile nur an frischen Punkten hochgestuft wird; die Diagnose mit bereits gesehenen Daten (c51f8b2) ist ein Befund, kein Beleg. Der Zielwert unterscheidet Mondmodelle nicht: Auch der analytische Mond besteht auf demselben Ausschnitt (schlechtester Wert { "3.8e-3" }), die geplante Mutation (der Kernel-Mond eine Stunde zu spät) wurde nicht erkannt, und bei der Faltung bestand auch ein um etwa { "4,650" } km falscher Mondmittelpunkt (der Mond um den Erde-Mond-Schwerpunkt genommen). Die Zeile beansprucht die Kovarianz auf diesem Pfad, nicht den Mondmittelpunkt, und sagt das.

# text
# c1: leo-ppp
seg-57afa384aabd = <c1/>: ein Extended-Kalman-Filter für Float-Precise-Point-Positioning (PPP) auf ionosphärenfreiem Code und ionosphärenfreier Phase, nur GNSS und mit LEO-Unterstützung, mit seiner Konvergenzzeit und einem Monte-Carlo-NEES-Konsistenztest (normalisiertes quadratisches Schätzfehlermaß). Das mitgelieferte Szenario ergibt { "7.4" } min mit vier MEO-Systemen und { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten, neben den { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min von Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) als Vergleich MODELLED des Trends.

# text
# c1: docs/POSITIONING.md
# c2: telecom-timing
# c3: docs/TELECOM-TIMING.md
# c4: ROADMAP.md
seg-606098743e57 = <b>Die öffentliche Beschreibung führt jetzt mit Zeitgebung und Holdover, der am besten validierten Domäne.</b> Der Anfang der README und <c1/> stellen Kshana als offene, reproduzierbare, nach Herkunft gekennzeichnete Evidenz-Engine für PNT-Resilienz dar: Zeitgebung und Holdover kritischer Infrastruktur zuerst (die Schätzer für Allan, modifizierte Allan, Zeitabweichung und maximalen Zeitintervallfehler sowie die Inversion der Koppelvarianz im Holdover sind die Zeilen VALIDATED dahinter), Quanten als neutrale Methode zum Abwägen Quanten gegenüber klassisch, deren Ergebnisse MODELLED gekennzeichnet sind, und lunare / cislunare sowie Deep-Space-Navigation als gepflegte Fähigkeiten statt als Schlagzeile. Beide Seiten sagen jetzt, was Kshana nicht ist -- kein Hochfrequenz-Signalsimulator und kein Hardware-in-the-Loop-Aufbau, kein Ersatz für MATLAB/Simulink, STK oder Orekit -- und verweisen auf die neue Art <c2/> und auf <c3/>. Die alte Zeile "Es gibt kein gutes offenes Werkzeug" ist entfernt: Eine Suche, die nichts findet, ist kein Beleg dafür, dass nichts existiert. <c4/> erhält eine undatierte Prioritätsreihenfolge (zuerst Zeitgebung, an zweiter Stelle die Quantenabwägung, Mond gepflegt) und verliert drei veraltete Punkte (Coriolis- und Lichtverschiebungs-Systematiken, die NRHO-Anfangsbedingungen und das Mondszenario, alle ausgeliefert); die Zeile der README "Coriolis und Lichtverschiebung bleiben Roadmap" wird auf dieselbe Weise korrigiert.

# text
seg-627d3357d620 = D4, Rückgrat der JPL-Kernel-Ephemeriden, Phase { "1" } (vier neue Zeilen VALIDATED: { "228" } -> { "232" } Zeilen, { "112" } -> { "116" } validiert).

# text
seg-665d0dde637b = <b>Neue Fähigkeiten MODELLED</b>, jede intern gegen eine geschlossene Form oder einen Schwesterpfad im Code gegengeprüft: Relativbewegungsdynamik nach Clohessy–Wiltshire / Hill, passive Emitterlokalisierung per TDOA/FDOA, Lagebestimmung nach Wahba/TRIAD/QUEST, Auflösung ganzzahliger Mehrdeutigkeiten der GNSS-Trägerphase (LAMBDA), B-Plane-Targeting & Gravity-Assist nach Patched-Conic, CRPA-Anti-Jam-Array-Beamforming, GNSS-Square-Law-Akquisitionsstatistik, Fringe-Mehrdeutigkeit / Dynamikbereich quanteninertialer Sensoren, IEEE-1139-Potenzgesetz-Uhrenrauschen + Flicker-FM-Untergrenze und Austausch von CCSDS-OEM-Kovarianzblöcken.

# text
seg-6ba057fab559 = <b>Zwei Zeilen VALIDATED für Codes der IQ-Schicht</b> (DS-GIQ-06b, PRO-39).

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Kovarianz eines Punkts auf der Mondoberfläche auf dem Kernel-Pfad</b> (neue Zeile VALIDATED): bei festen Stationen und der Bake auf dem DE440-Mond stimmt die Kovarianz der Bake mit einer SPICE-Lichtlaufzeit-Jacobi-Matrix (schlechtester Wert { "1.7e-3" } gegenüber einem Zielwert von { "1" } %) und einer NumPy-Inversion ({ "4e-14" } gegenüber { "1e-9" }) überein, vorregistriert 4a51256 (<c1/>). Die Zeile des analytischen Pfads bleibt MODELLED: beim analytischen Mond liegt ihr kleinstes Bake-Sigma { "3.9" } % unter der unabhängigen Referenz.

# text
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>PNT-Suite für Mond / cislunaren Raum.</b> Sieben lauffähige <c1/>s (MODELLED), aufgesetzt auf den CR3BP-Kern: <b>Mond-Koordinatenzeit</b> (säkulare Rate LTC/TCL − TT, <c2/>), geodätische <b>Mond-VLBI</b>-Verzögerungsobservable (<c3/>), <b>gemeinsamer Batch-Estimator für Multitechnik-OD + Uhr</b> (<c4/>), <b>Realisierung des Bezugssystems</b> (7-Parameter-Helmert + IAU-{ "2015" }-WGCCRE-Anbindung, <c5/>), Analyse des <b>Service-Volume der Klasse Moonlight / LCNS</b> (<c6/>), <b>differenzielle PNT auf dem Mond</b> (<c7/>) und ein <b>an LunaNet / IOAG ausgerichteter Interoperabilitätsexport</b> (CCSDS-OEM + lunare Zeitskala im KIF-Umschlag, <c8/>). Alle MODELLED aus illustrativen Parametern öffentlicher Quellen; nicht gegen reale VLBI- / Gateway-Verfolgung validiert; keine Zugehörigkeit zu und keine Bestätigung durch eine Behörde.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Demonstrator-Suite für quantengestützte PNT</b> (<c1/>, <c2/>, <c3/>). Drei lauffähige Anwendungsbereiche (MODELLED) hinter der Engine, jeder mit Ausgabe von <c4/> plus einem Datensatz zu Repräsentativität / Lücken bis zum Flug:

# text
seg-89a4bc4a766e = Befund (neue Zeile MODELLED), "LunaNet AFS spreading-code generation": von { "2 937 232" } erzeugten Chips und Bits, die mit den Tabellen des Standards und den Dateien von Annex { "3" } verglichen wurden, weicht einer ab, die "last { "24" } chips" aus Tabelle E-5 für den tertiären PRN { "147" }, die die Zelle von PRN { "151" } dupliziert, während die eigene Datei von Annex { "3" } des Standards mit dem Generator übereinstimmt. Das Kriterium null Abweichungen wird verfehlt.

# text
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Elf neue lauffähige Szenarioarten: Demonstratoren mit zwei Ausschreibungen, eine CCSDS-Interop-Brücke und eine Suite für Missionsanalyse / Umgebung in erster Ordnung (alle MODELLED, additiv; bestehende Reproduzierbarkeits-Goldens unverändert).</b> Jede ist per CLI / Python / WASM / MCP aufrufbar, liefert ein <c1/> mit und trägt ein ausdrückliches Label MODELLED in ihrem Ergebnis-JSON und in der einzeiligen Zusammenfassung (ein Test je Art in <c2/> prüft, dass das Label vorhanden ist und dass die Ausgabe nie den String <c3/> enthält):

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Rauschidentifikation per Autokorrelation bei Lag 1</b> (<c1/>, Riley und Greenhall { "2004" }), neue Zeile VALIDATED (Bibliothek): stimmt mit allantools { "2024.6" } <c2/> auf { "140" } Fällen überein, ganze Zahlen identisch, schlechteste Differenz { "9.6e-13" } gegenüber einem Zielwert von { "1e-9" } (vorregistriert 2ec76864; <c3/>).

# text
seg-986f4075210b = D8, ein validierter Propagations-, Bezugssystem- und Zeitpfad (drei neue Zeilen VALIDATED und M131 hochgestuft: { "235" } -> { "238" } Zeilen, validiert { "117" } -> { "121" }).

# text
seg-9a5f94973450 = Mond-Bezugssystemdatum bei geschätzten Stationen: eine unabhängige Referenz mit erweiterter Genauigkeit aus 50-stelligem mpmath (vorregistriert 804662d5, konditionsskalierte Zielwerte aus einer a-priori-Rückwärtsfehlerformel) stimmt an einem neuen Kampagnendatum (2026-03-18) und am ursprünglichen Szenario vom 2024-01-01 überein; neue Zeile VALIDATED unter P2. Sie entscheidet den früheren Streit um doppelte Genauigkeit: die Datums-Sigmas der Engine weichen um bis zu { "9.7e-6" } ab, die Inversions- und Eigenwertwege von NumPy um bis zu { "6.2e-6" } und seine Cholesky- und QR-Wege um etwa { "1e-8" }. Die Engine liegt innerhalb ihrer Fehlerschranke, ist aber etwa tausendmal weniger genau als ein Faktorisierungsweg.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Cislunare Beobachtbarkeit</b> (<c1/>, <c2/>): ein Eigenspektrum der Beobachtbarkeits-Gramian über einen Bogen, ein durch Differentialkorrektur gewonnener Seeder für retrograde Fernbahnen (DRO) und eine unabhängige Gegenprüfung mit einem Square-Root-Information-Filter, dessen A-posteriori-Kovarianz genau bei vollem Beobachtbarkeitsrang endlich wird. Konstellation MODELLED; die Invarianten von Rang/Gramian/STM/SRIF sind der validierte Kern.

# text
# c1: ?scenario=…&tab=…
seg-9fa1c542332b = <b>Kshana Studio, ein Dashboard für jede Fähigkeit.</b> Das Studio öffnet mit einem Startbildschirm mit Domänenkacheln und guten ersten Läufen und führt einen Lauf dann durch fünf nummerierte Schritte: Szenario wählen, Parameter setzen, die Engine lokal im Browser ausführen, die Ergebnisse lesen (zuerst die Kennzahlen, jede mit einem Chip PASS oder FAIL, wo der Lauf eine Schwelle nennt, dann die Panels) und teilen oder exportieren. Ein Suchfeld findet Szenarien, Domänen und die Felder darin und springt zum Bedienelement; Läufe können angeheftet und verglichen werden; eine Pfadanzeige zeigt, wo Sie sich befinden; auf dem Smartphone werden die Schritte zu einer Schrittleiste. Jede Szenarioart hat ihre Ansicht, darunter den Spektrum-Wasserfall, das Sonnensystem, die Konstellationsabdeckung, Kampagnen, die Animation, den Laufbericht, die Interoperabilitätsexporte und die Kette für niedrige Erdumlaufbahnen. Ein Deep-Link (<c1/>) öffnet denselben Lauf im genannten Panel.

# text
# c1: scenarios/telecom-prtc-holdover-24h.toml
# c2: scenarios/telecom-tie-ingest.toml
seg-a23a96819dee = <c1/> ist ein Rubidium-Holdover über 24 Stunden mit Alterung, Flicker und einem täglichen Temperaturzyklus: sein größter Zeitfehler beträgt { "603.2" } ns, er überschreitet { "100" } ns { "8 206" } s nach dem Verlust und bleibt den ganzen Tag innerhalb von { "1.5" } Mikrosekunden, und er besteht die Holdover-Hüllkurve der erweiterten PRTC nicht, wie es eine Uhr tun sollte, die nicht der Caesium-Klasse angehört. <c2/> zeigt die Inline-Eingabe. MTIE und TDEV, die die Art meldet, werden gegenüber dem Paket allantools an einer festgeschriebenen Holdover-Reihe mit { "2" } 048 Abtastwerten geprüft, exakt für MTIE und auf { "1.1e-15" } für TDEV, sodass die Matrix eine Zeile VALIDATED und zwei Zeilen MODELLED hinzugewinnt (die Transkription der Masken und die Voreinstellungen) und nun bei <b>{ "171" } Zeilen steht — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Die Abdeckung der Feldeinheiten geht von { "60" } von { "61" } Arten auf { "61" } von { "62" } und von { "1,742" } auf { "1,788" } beschriebene Felder. Die Art ist neu und additiv: Kein bestehendes Szenario, keine Festschreibung und keine veröffentlichte Zahl verschiebt sich.

# text
seg-a9465820a1fc = Neue Zeile VALIDATED "LunaNet AFS baseband rendering against an independent generator, given its channel state": gegenüber LANS-AFS-SIM (BSD-2-Clause, Commit 480c6bf3, S-Band-Build) null Chip-Abweichungen über die Codes der PRNs { "1" } bis { "210" }, null Symbolabweichungen über die drei Frames des Laufs und eine normierte komplexe Korrelation von { "0.999990" } über { "23.9" } s seiner eigenen Abtastwerte (schlechtester Block von { "2" } ms { "0.999948" }), innerhalb von Zielwerten, die vor dem Vergleich festgelegt wurden (vorregistriert 986ac280). Sie steuert den Renderer mit dem eigenen Kanalzustand des Simulators an und deckt weder die Leistungsaufteilung aus der Trägerrauschdichte noch das Schreiben von SigMF und 8 Bit ab.

# text
seg-b49f96eb52ad = Bestehende Zeilen VALIDATED neu abgestützt (keine Änderung der Anzahl).

# text
seg-b96d34bb1d36 = Es wurde kein Zielwert geändert, und keine Zeile VALIDATED, keine Abbildung und keine Zahl im Web hat sich verschoben.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Neue Zeile VALIDATED "One Earth-orbit path": TEME-Positionen von { "232" } Elementsätzen gegenüber python-sgp4 { "2.24" } (Vallados Referenz-SGP4) innerhalb von { "6.1e-8" } m (Zielwert { "1" } cm), und die Rotationen GCRS -> ITRS und TEME -> ITRS gegenüber ERFA <c1/>, <c2/> und <c3/> innerhalb von { "2.9e-6" } mas und { "0.41" } mas (Zielwerte { "0.1" } und { "2" } mas), mit Erdorientierungsparametern (vorregistriert 72ea9eb0). Offengelegt: der erste Lauf scheiterte bei 2016-12-31T23:{ "59" }:{ "59.5" } um eine Sekunde Rotation; UT1 wurde an einem Schaltsekundentag aus dem quasi-julianischen Datum von UTC genommen, die Engine geht nun über TAI, und der zweite Lauf stimmt bei unveränderten Zielwerten überein.

# text
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Konfliktresilienz geschichteter PNT</b> (<c1/>, <c2/>) — eine Monte-Carlo-Resilienz-Engine mit festem Seed für eine mehrschichtige PNT-Architektur, mit einem Modell des <b>Überlebens bei graceful degradation je Vektor</b> nach §{ "4.2" } (vier benannte Bedrohungsvektoren, die geschlossene Form des Überlebens nutzbarer PNT, gegen die die Monte-Carlo-Läufe je Schicht konvergieren, im Ergebnis-JSON ausgegeben) und dokumentierter, gegen Abweichung abgesicherter Herkunft der Bedrohungsparameter (<c3/>). Die Architekturen sind MODELLED; die Konvergenz des Überlebens-Monte-Carlo → geschlossene Form ist der validierte Kern.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Neue VALIDATED Zeile "Two-part Julian dates and leap seconds on the Earth-orbit time path": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> auf { "224" } Zeitpunkten rund um alle { "27" } Schaltsekunden innerhalb von { "1e-6" } s (vorregistriert e947e69d); schlechtester Wert { "1.9e-11" } s.

# text
seg-d4e76301323f = Befund (neue MODELLED Zeile), "LunaNet AFS closed-loop decodability": drei vorregistrierte Läufe gegen PocketSDR-AFS; der dritte erfüllte seine Zielwerte für Tracking und Dekodierung vollständig, nicht aber seine Absicherung, dass ein Empfänger-Build mit reiner Druckausgabe das Protokoll des festgelegten Builds reproduziert, weil sich schon zwei Läufe des unveränderten Empfängers in ihren Akquisitionsaufzeichnungen unterscheiden.

# text
seg-db498ac8e135 = Neue VALIDATED Zeile "Apparent ground-station pass prediction with refraction and light time": Orekit { "13.1.8" } propagiert dieselben Elementsätze in einem TEME, das es nach der angegebenen Definition aufbaut, mit ITU-R-P.834-Refraktion und seinem Lichtlaufzeit-Messmodell, über { "60" } Fälle an Stationen auf Meereshöhe: { "1210" } Überflüge, Durchgänge innerhalb von { "3.4e-6" } s (Zielwert { "5" } ms), maximale Elevation innerhalb von { "5.5e-7" } Grad, scheinbare Richtung innerhalb von { "8.8e-7" } Grad (Zielwert { "1e-4" } Grad).

# text
# c1: <scenario>.report.html
# c2: wrote …
# c3: <scenario>.report.json
# c4: RunOutput::html_report()
# c5: OracleKind::modelled_reason()
# c6: docs/MODELLED-RATIONALE.md
seg-e06522ca762e = <b><c1/> ist jetzt der erweiterte Laufbericht</b>, der unter Added beschrieben ist, und die Zeile <c2/> der CLI nennt auch <c3/>. Die einseitige Auswertung, die er ersetzt hat, ist als <c4/> unverändert, den die Python- und WebAssembly-Bindungen weiterhin liefern. <c5/> stellt den Satz bereit, den <c6/> für jede Zeile mit MODELLED ausgibt; dieses Dokument ist unverändert.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Betroffene Verbraucher:</b> die Arten <c1/>, <c2/>, <c3/> und <c4/>, der <c5/> der Spektrum-Arten, die Referenzkurve der IQ-Kampagne, die MODELLED ist, und das labfit-Standard-Q sowie der Interop-Szenenexport.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Positionen von Sonne, Mond, Merkur und Venus aus DE440 bei UTC-Epochen</b> (neue VALIDATED Zeile): <c1/> stimmt mit Skyfield { "1.54" } auf { "600" } Positionen zwischen { "1973" } und { "2026" } überein, schlechtester Wert { "2.96" } m, innerhalb eines vorregistrierten Zielwerts (0bfafe6d), der durch die zweitermige Reihe TDB − TT festgelegt ist (<c2/>). Planetenpositionen erhalten jetzt diese neue Kernel-Zeile; die Standish-Zeile und die Zeile der Planetenmonde sind unverändert, und die Monde warten auf ein Szenario, das sie braucht (Entscheidung des Gründers).

# text
seg-f1cb2c2881c9 = Sieben MODELLED Registerzeilen zu dem Obigen. Nichts davon ist VALIDATED: Es wurde keine Aufzeichnung eines realen Empfängers, einer Basisstation, einer IMU, eines GNSS-SDR-Laufs, eines ROS-Graphen oder eines MQTT-Brokers gelesen.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Siebenundzwanzig Zeilen der Verifikationsmatrix werden VALIDATED, nachdem eine unabhängige Referenz innerhalb einer vor dem ersten Vergleich festgelegten Toleranz übereinstimmte (die Beförderungsregel in <c1/>): zehn in einer ersten Validierungsrunde und siebzehn in einer zweiten. Einundfünfzig MODELLED Zeilen wurden in der ersten Runde einer externen unabhängigen Referenz unterzogen und die übrigen zuordenbaren Zeilen in der zweiten; jede Abweichung ist unten als Befund festgehalten, statt weggestimmt zu werden. Drei Zeilen wurden aufgeteilt, damit ein validierter Teil keinen nicht validierten Rest mitträgt, wodurch die Matrix von { "223" } auf { "226" } Zeilen wächst; die seither eingearbeiteten Validierungspakete bringen sie auf { "249" }. Die Zahlen werden aus der erzeugten <c2/> gelesen.

# text
seg-fa9976349886 = Neue VALIDATED Zeile: die Signal-PSDs und SSCs, gegen die Hauptkeule von BPSK(n) mit 2n x { "1.023" } MHz, die um +/-1.023 MHz zentrierten Keulen von BOC({ "1,1" }), die geschlossenen Parseval-Formen hinter den veröffentlichten SSCs von -61.8 / -64.8 / -67.8 dB/Hz und das Lehrbuch-Q = { "1" } (CW) und { "1.5" } (Matched). Das PSD-Maximum von BOC({ "1,1" }) liegt bei +/-0.759 MHz, nicht in der Keulenmitte; der Test legt beides fest.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Korrekturen aus der Prüfung: Die systemd-Units starten immer neu und laufen in einer Sandbox (keine Shell, kein Netzwerk, wo keines gebraucht wird), ein logrotate-Schnipsel, <c1/> schlägt bei jedem Befund fehl; der Container führt das Gate mit Umgebungsvariablen aus, mit Health-Check und per Digest festgelegten Basis-Images; Signal-K-Wert-Metadaten, die veraltete Benachrichtigung wird ersetzt, wenn wieder Daten eintreffen, Fehler von Kindprozessen bleiben erhalten und Kills eskalieren, unsichere <c2/> werden abgelehnt, und die Benachrichtigung liegt unter <c3/>; das Relay begrenzt eine zurückgehaltene Teilzeile; die Parser von <c4/> weisen Werte außerhalb von { "0" } bis { "100" } zurück; eine Prüfung der Dokumentationslinks; ein CI-Workflow (<c5/>), der all das ausführt, einschließlich der echten Binärdatei von Anfang bis Ende.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Paritätsdurchgang.</b> JetBrains-Aktionen Validate Scenario, List Scenario Kinds und Assess Receiver Stream; <c1/> listet jetzt <c2/>, <c3/>, <c4/> und <c5/>; das Notebook <c6/> (compliance-Zuordnung und test-bench-Export); und jede verbleibende JetBrains-Zelle „CLI only“ in <c7/> ist jetzt ein ausdrückliches N/A mit Begründung.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>Der MCP-Server lehnt <c1/> ab</b> (Nachfolgearbeit zu CAP-06b). Der Pfad der Geländekachel der Szenarioart jamming steht jetzt in <c2/>. Eine Inline-Oberfläche lehnt ein Szenario ab, das einen solchen Pfad nennt, mit einer Meldung, die weder den Pfad noch einen Betriebssystemfehler enthält. Der Wächtertest für Dateiquellen kennzeichnet nun auch Felder, die auf <c3/> enden.

seg-1200856c90da = [{ $version }] - 2026-10-28

seg-05d0c798a196 = { "0.40" } fügt den Missionsstrang im Stil von Artemis und sein Mondsegment hinzu, eine Nachweiskennzeichnung an jeder Zahl und Tabelle, die ein Lauf schreibt, das Einlesen und Anpassen gemessener Uhren, eine Prüfung für Einreichungen von Datenpartnern, eine geschätzte Senderregion aus ADS-B- oder AIS-Meldungen, die Benchmark-Neukampagne { "0.40" } sowie die Befehlszeile, Berichte und Studio in siebzehn Sprachen neben Englisch (maschinenlesbare Dokumente bleiben Englisch). Die Verifikationsmatrix wächst von { "388" } auf { "401" } Zeilen: { "176" } VALIDATED (unverändert), { "221" } MODELLED (vorher { "208" }) und { "4" } PARTNER. Keine Zeile wurde zu VALIDATED befördert. Die Szenarioarten wachsen von { "87" } auf { "92" }. Jeder Zielwert, den ein vorab festgelegter Vergleich verfehlt hat, ist unten genannt und bleibt festgeschrieben; keiner wurde gelockert. Die Hinweisaussage ist unverändert: Kshana ist beratende Software, keine typzugelassene Navigationsausrüstung und keine Zertifizierung; der Betreiber bleibt verantwortlich.

seg-738f33f0ae8a = Bekannte Grenzen

seg-d4062fab7ae1 = Läufe in anderen Sprachen dauern etwa doppelt so lange, weil das Szenario zweimal läuft (einmal auf Englisch für die maschinenlesbaren Dateien, einmal in der gewählten Sprache für die Person).

seg-8db6dedc627a = Einige Sätze im Studio werden aus Fragmenten zusammengesetzt und können in Sprachen mit grammatischem Geschlecht Artikel vermissen lassen.

seg-86e6e35ac846 = Die Übersetzungen sind maschinelle Übersetzungen, die kein Muttersprachler geprüft hat; Englisch ist die Referenz.

seg-dd7ee240b467 = <b>Siebzehn Sprachen neben Englisch</b> für den menschenlesbaren Text der Engine und für die Website und das Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, die Locale-Variablen; <c3/> bei den Aufrufen der Bibliothek, von Python, WebAssembly und MCP). Meldungen und Fehler der Befehlszeile, Laufzusammenfassungen, Diagrammtext, <c4/>, Beschreibungen der Arten und die Hinweise sind übersetzt; maschinenlesbare Dokumente (JSON, CSV, Fehlercodes, die Verifikationsmatrix) bleiben Englisch, und ein Lauf in einer anderen Sprache führt das Szenario einmal auf Englisch für die maschinenlesbaren Dateien und einmal in der gewählten Sprache für die Person aus (<a1><c5/></a1>). <b>Die Übersetzungen sind maschinelle Übersetzungen, nicht von Muttersprachlern geprüft; Englisch ist die Referenz</b>; die <c6/> jeder Sprache listet auf, was ein Prüfer zuerst kontrollieren sollte, und die Seiten der Website tragen einen entsprechenden Hinweis. Urteilswörter, Evidenzstufen und der Geltungsbereich des Hinweises („nicht typzugelassen“, „keine Zertifizierung“, „der Betreiber bleibt verantwortlich“) bleiben in jeder Sprache erhalten.

seg-7a95c263ecec = <c1/>: eine <b>geschätzte Senderregion</b> aus ADS-B- oder AIS-Meldungen. Eine Posterior darüber, wo sich eine Quelle gestörter Positionsmeldungen befinden kann (Funksicht bei einem 4/3-Erdradius, Höhe der Senderantenne und Leistung marginalisiert, betroffene Flugzeuge ziehen und unbetroffene Flugzeuge mit Funksicht drücken dagegen), geschrieben als Regionen zu { "50" }, { "90" } und { "95" } %, ein Schwerpunkt mit seiner Unsicherheitsellipse (nie ein bloßer Punkt), Sitzungen in der Zeit (Beginn, Ende, Dauer, betroffene Fläche, unterschiedliche Flugzeuge über dem Veröffentlichungsminimum), ein Tagesgangprofil und Stunden pro Tag, mit optionaler Fusion einer TDOA-Lösung aus <c2/>. Ausgaben: GeoJSON, JSON-Zusammenfassung, Sitzungs-CSV und eine SVG-Grafik, jeweils mit Lizenz, Quellenangabe, Methodenkennung, Annahmen, Grenzen und ihrer Nachweiskennzeichnung. Bibliothek <c3/>, Python und WebAssembly <c4/>. MODELLED (Registerzeile <c5/>; die Matrix hat nun { "401" } Zeilen, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); nur an synthetischen Daten kalibriert, wobei der Vergleich mit den Senderstandorten des Jammertests { "2025" } vorab festgelegt und einmal ausgeführt wurde: ADS-B und AIS beide NOT ASSESSABLE (zu wenige geplante Sitzungen in den offenen Daten), sodass die Zeile MODELLED bleibt (<c6/>). Neutrale Formulierung, nur aggregiert; das Veröffentlichen von Senderregionen im öffentlichen Observatorium bleibt ausgeschaltet. Ein synthetisches Beispiel liegt in <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Gemessene Uhrenlogs.

seg-59b240848747 = <c1/> liest ein gemessenes Uhrenlog in eine Phasenreihe ein: acht Formate (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> und <c4/>, chrony-Tracking und -Statistik), jedes eine dokumentierte Teilmenge; alles außerhalb davon wird mit einem Fehler abgelehnt, der nennt, was gefunden wurde. Es wird von <c5/> (<c6/>) und der Uhrenart (<c7/>, die einen Block <c8/> mit dem SHA-256 des Logs und den überlappenden ADEV, TDEV und MTIE ergänzt) mit dem mitgelieferten Szenario <c9/> verwendet (<a1><c10/></a1>). Verglichen mit allantools an realen öffentlichen Daten gegen vorab festgelegte Zielwerte: Der erste Lauf <b>verfehlte</b> B1 ({ "5" } von { "11" } Fällen, alle TICC-Zeitstempel als <c11/> gehalten), B2, B3 ({ "7" } von { "24" } Fällen) und B4 (die Versionskennung im Kopf wurde nicht geprüft); nach den Korrekturen sind B1, B3 und B4 erreicht, und B2 ist erreicht bis auf ein MTIE-Paar, das festgeschrieben ist und kein Fehler der Engine ist (allantools { "2024.6" } entfernt die mittlere Frequenz, bevor es integriert; gegenüber seinem MTIE im Phasenmodus stimmt die Engine bis auf { "1e-10" } überein). Die Zeile bleibt MODELLED (<c12/>).

seg-400a39dbf3dd = <b>Ein holdover, der von einer angepassten gemessenen Reihe angetrieben wird</b>: das <c1/> der Uhrenart passt das Rauschen einer gemessenen Reihe an und treibt daraus den holdover an (<c2/>, mitgeliefertes Szenario <c3/>). Vorab festgelegter Vergleich: F1(b), F3 und F4 erreicht; F1(a) (die Wiedergewinnung des registrierten Random-Walk-FM) <b>NOT MET</b> bei den C3-Aufzeichnungen (konstruktionsbedingt nicht identifizierbar) und bei zwei von drei C4-Aufzeichnungen (Random-Walk-FM von Flicker-FM und Drift aufgenommen); F2 (Rauschidentifikation gegen allantools) erreicht bei elf von zwölf Aufzeichnungen und bei D3 und <b>NOT MET</b> bei D2 wie registriert (bei gleichem Vergleich erreicht). Alle Verfehlungen sind festgeschrieben (<c4/>); der Block <c5/> und der damit angetriebene holdover bleiben MODELLED (<c6/>).

seg-f1f15e102774 = <b>Die Benchmark-Neukampagne { "0.40" }</b>, mit Freigabe des Eigentümers vor jedem Lauf vorab festgelegt: A3 (EXPLORATORY, die ordnerweise geclusterte Bootstrap-AUC von <c1/>, { "2.5" } %-Quantil { "0.8502" } gegenüber { "0.80" }), D3 (EXPLORATORY, drei von fünf Detektoren überschreiten bei Skalierung { "0.25" } eine Optimismuslücke von { "0.05" }), R3 (AUC { "1.0" }) und R4 (P_fa { "0.0" }, P_d { "1.0" }): alle MET, alle MODELLED. A2, D1 und R1 sind unberührt und bleiben <b>NOT MET</b>; nichts hier schließt sie (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: prüft Format und Metadaten einer Einreichung eines Datenpartners (<c2/>: Gerät, Datendatei und SHA-256, wie sie aufgenommen wurde, die MODELLED-Zeilen, gegen die sie angeboten wird, Lizenz, Erklärungen) und liest die Daten mit den eigenen Uhrenlog- oder IMU-Readern der Engine. Sie bewertet nichts und validiert nichts. Ein synthetisches Beispiel liegt in <c3/>.

seg-823e1abc7f92 = <c1/>: welche MODELLED-Registerzeilen gemessene Daten befördern könnten, die akzeptierten Formate, wie eine Einreichung geprüft, an einem vorab festgelegten Zielwert bewertet und angerechnet wird und was PARTNER und VALIDATED jeweils bedeuten; ein Entwurf eines Ansprachetexts für den Eigentümer in <c2/> (es wird nichts versendet).

seg-34bdcfd66ded = Im Repository-Zweig, aus dem diese Dokumente stammen; noch nicht auf GitHub

seg-ddd45d39e8a9 = <b>Zweite Kampagnen für die nicht erreichten Zielwerte von <c1/> und <c2/></b>, wie vorab festgelegt ausgeführt (<s1><c3/></s1>, <s2><c4/></s2>; vor jedem Lauf freigegeben). Jede ursprüngliche Verfehlung bleibt NOT MET und festgeschrieben. <c5/>: Die Kontrolle reproduziert Lauf { "1" } Zelle für Zelle; fünf Ablationen mit je einer Lesart bringen { "2" } der { "78" } verfehlten Zellen in die Toleranz (EXPLORATORY, kein Zielwert); der neue Zielwert S7b (eine auf Classic-IIR-Panels angepasste Sendeform aus Abfall und Untergrenze) ist bei den IIR-M-Panels mit { "3.83" } bis { "3.95" } dB gegenüber { "3" } dB NOT MET; die Kampagne mit zurückgehaltenen veröffentlichten Empfangsdaten wurde nicht ausgeführt (keine Quelle festgelegt) (<s3><c6/></s3>). <c7/>: Die neuen Zielwerte C3a, C3b (eine Nachweisgrenze von etwa { "3e-9" } m/s2), Q3a, Q3b (eine genaue Normalverteilungsfunktion beseitigt die Differenz von { "1.7e-6" }) und G3'' sind als eigene Zielwerte erreicht, und G3' mit illustrativen Priors ist erreicht und als EXPLORATORY gekennzeichnet (<s4><c8/></s4>). Alles bleibt MODELLED. Neue öffentliche Elemente: <c9/>.

seg-bc89e70f4d36 = <b>Eine Nachweiskennzeichnung an jeder Zahl und Tabelle, die ein Lauf schreibt.</b> Das Ergebnis-JSON hat einen Schlüssel <c1/>, die Diagramm-SVG ein Metadatenelement und eine Zeile unter der Grafik, und die CSV-Tabelle <c2/> Kommentarzeilen: die Stufe (<c3/>, <c4/> oder <c5/>, die schwächste der Zeilen) und die Kennungen der Zeilen der Verifikationsmatrix, auf denen der Lauf beruht. Zeilen und Status werden aus der Matrix gelesen, nicht getippt; die Kennungen sind stabil (<c6/> und acht Hexadezimalziffern, eine neue Spalte <c7/> in <c8/>, eine eingefrorene Liste in <c9/>). Auch bei receiver-trust, <c10/>, <c11/>, dem Bericht zur Routenexposition und, innerhalb der signierten <c12/>, bei jedem Nachweispaket (<c13/> { "1.1" }; <c14/> meldet die Stufe; vor { "0.40" } erstellte Pakete werden unverändert verifiziert). <c15/> schlägt fehl, wenn eine Grafik keine Kennzeichnung hat, eine Kennzeichnung der Matrix widerspricht oder ein neuer Dateischreiber weder gekennzeichnet noch mit einem Grund aufgelistet ist. Ausgaben, die keine tragen, sind in <c16/> aufgelistet. Die drei Demo-Diagramme der README wurden mit der Kennzeichnung neu gerendert (ohne sie ergeben sich wieder die alten Bytes; <c17/>). Keine Aussage hat sich geändert.

seg-8abd87414bc4 = Die Szenarioart <c1/> (<c2/>, <c3/>): das Fehlerbudget für Navigation und Zeitgebung einer Kette von Phasen vom Start bis zum Wiedereintritt, jede Zahl MODELLED und jede Eingabe genannt. Acht Phasenarten: <c4/>, <c5/> (Clohessy-Wiltshire-Relativkovarianz über Sensorabschnitte, Andockfenster), <c6/> (Cowell-Fortschreibung mit einer Zustandsübergangsmatrix aus finiten Differenzen, Manöverfehler, <c7/>- und Bodenverfolgungsaktualisierungen, der Mond aus einem optionalen DE440-Kernel-Ausschnitt), <c8/> (Sigma des Bahnneigungswinkels, Korridorwahrscheinlichkeit, Spitzenverzögerung an den Korridorrändern, Landeellipse) und die vier Mondarten. Übergaberegeln (<c9/>, <c10/>, <c11/>), Umrechnungen von Bezugssystem und Zeitskala als eigene Budgetzeilen, eine optionale Bodennetz-Überlagerung, die den Verfolgungseinsatz jeder Phase festlegt, die Marge gegenüber genannten Anforderungen und das schwächste Glied. Das Beispiel folgt der Abfolge einer öffentlichen NASA-Foliensammlung zum Einsatzkonzept mit ILLUSTRATIVE Zahlen: ein durchgängiges Beispiel im Stil von Artemis über { "11" } Phasen, Erd- und Mondsegmente. Die cislunare Fortschreibung wurde mit der öffentlichen Trajektorie von Artemis I über einen Bogen von { "72" } h gegen einen Zielwert verglichen, der vor dem Lauf in <c12/> festgelegt wurde: <b>NOT MET</b> ({ "45.3" } km und { "0.25" } m/s gegenüber { "5" } km und { "0.05" } m/s). Die Diagnose verortet die Verfehlung in fünf kleinen impulsiven Ereignissen in der Referenz; zwischen ihnen gibt das Kraftmodell die Stundenzustände mit einem Median von { "0.4" } m wieder. Die Zeile bleibt MODELLED (<c13/>).

seg-67cad0a9c0c4 = Das Mondsegment des Missionsstrangs im Stil von Artemis: vier Szenarioarten, jede zugleich eine Phasenart der Schnittstelle <c1/> (<c2/>), alle MODELLED.

seg-63066076a0a8 = <c1/>: Relativnavigation bis zum Andocken in einer kreisförmigen Polarbahn in { "100" } km oder einer elliptischen Polarbahn von { "100" } km mal { "3000" } km (<c2/>, <c3/>). Eine Gauß-Newton-Batchschätzung über den Bogen fusioniert je Fahrzeug eine absolute Lösung aus einer illustrativen Relaisgruppe der LCNS-Klasse, einen beständigen Fehler im Signalraum (beiden Fahrzeugen gemeinsam und unabhängig) und eine Querverbindungsentfernung, unter dem Mondkraftmodell des Crates. Sie gibt die Relativposition und -geschwindigkeit in den lokalen Achsen des Ziels an, die Verfügbarkeit der Lösung, den mittleren normierten quadrierten Schätzfehler gegenüber seinem Erwartungswert, die Kosten der Vernachlässigung der Gravitationsharmonischen, die Modelle der Relativsensoren in der Endphase neben dem Wert nur aus Signalen und die weitergegebene 6x6-Kovarianz.

seg-a2d67bb5cfb3 = <c1/>: das Landestreuungsbudget an einem Standort am Südpol (<c2/>; <c3/> liest das LOLA-DEM aus einem Checkout): ein inertiales Fehlermodell mit fünf Zuständen je Achse, eine AFS-Lösung (eigenständig oder differenziell, mit dem Residuum der Korrekturverbindung aus <c4/>), eine geländerelative Lösung (der Abgleicher <c5/> auf seinem synthetischen Relief oder die Cramer-Rao-Schranke des Abgleichs mit dem LOLA-DEM) und Mondzeit über die Fahrzeuguhr (<c6/>). Sie gibt die 3-Sigma-Landeellipse an, jede Kombination von Stützungen und eine Monte-Carlo-Kalibrierung der Ellipse.

seg-1babf99e8d56 = <c1/>: Verfügbarkeit von Positionierung und Zeitgebung nach Standort und Jahreszeit (<c2/>; <c3/> ergänzt den per Strahlverfolgung berechneten LOLA-Horizont): Der Positionierungswert für einen einzelnen Standort ist bitgenau gleich dem von <c4/>; die Sichtbarkeit von Erde und Sonne aus den analytischen Ephemeriden ist das, was sich mit der Jahreszeit verändert.

seg-bae659d0ff4d = <c1/>: der Aufstieg in die Rendezvous-Umlaufbahn und die in die Umlaufbahn zurückgetragene Positions-Geschwindigkeits-Kovarianz (<c2/>), mit der daneben angegebenen Streuung beim Triebwerksabschalten.

seg-106be12d960f = <c1/>; die Vorregistrierung, ihre Änderungen und jedes Ergebnis, Verfehlungen eingeschlossen, in <c2/>.

seg-5e8880c28a67 = Vor jedem Lauf in <c1/> vorab festgelegt, mit sechs datierten Änderungen (jede vor dem Abruf der Daten vorgenommen, außer Änderung { "6" }, die nach dem Abruf und vor jedem A2-Ergebnis einen Rechenfehler in einer Zustandszahl korrigiert; jede Änderung ist in der Datei offengelegt). Kein Zielwert wurde gelockert.

seg-90adc3a3c58b = A1 (der Propagator gegen die rekonstruierte LRO-Trajektorie aus JPL Horizons, { "24" } h): <b>MET</b>, eine größte 3D-Differenz von { "33" } m gegenüber einem Zielwert von { "500" } m und eine radiale RMS-Differenz von { "2.4" } m gegenüber { "60" } m.

seg-69f903a278eb = A2 (derselbe Propagator gegen den CAPSTONE-NRHO über einen Umlauf von 6.5 Tagen): <b>NOT MET</b>, eine Differenz der Endposition von { "136.8" } km gegenüber einem Zielwert von { "25" } km und eine Differenz des oskulierenden Perilunradius von { "28.4" } km gegenüber { "10" } km. Die Zeile bleibt MODELLED, und die Verfehlung ist durch <c1/> festgeschrieben.

seg-32fcafe8fa07 = B1 (die Konsistenz der Rendezvous-Schätzung mit ihrem eigenen Modell) ist beim vierten Schätzerentwurf MET, mittlerer NEES { "5.85" } bis { "5.93" } gegenüber einem Band von [{ "5.2" }, { "6.8" }]; die drei früheren Entwürfe, ein erweiterter Kalman-Filter in drei Varianten, haben es verfehlt. Eine fünfte Änderung, vorgenommen, nachdem sich zeigte, dass das ausgelieferte Szenario von { "2" } h { "4" } von { "50" } Versuchen in ein lokales Minimum führte (mittlerer NEES { "1e9" }), lässt die Gauß-Newton-Anpassung über einen wachsenden Bogen mit Schrittweitenhalbierung laufen; B1 bleibt davon unverändert, und die ausgelieferten Szenarien ergeben { "6.51" } und { "6.33" }. Die Geschichte steht in <c1/>.

seg-a4b6bfcb9984 = Nichts hiervon ist VALIDATED: Die Zeilen mit unabhängiger Referenz prüfen den gemeinsam genutzten Propagator, nicht einen Navigationsfilter, ein Signal oder ein Budget.

seg-29d014d29790 = Eine Abhängigkeitsaktualisierung in der ausgelieferten Bibliothek (der erste Eintrag), die übrigen in den Werkzeugen zur Kreuzvalidierung (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> und <c3/> { "0.13" } auf { "0.14" } (mit <c4/> { "0.14.3" }, <c5/> { "0.17.0" } und <c6/> { "0.5.5" } auf { "0.7.10" }; ebenso die direkte Abhängigkeit <c7/>, jetzt { "0.7" }) beheben RUSTSEC-2026-0387, eine Zeitvariabilität in <c8/> { "0.5.5" }. Kshana verwendet diese Crates nur zur Prüfung öffentlicher Signaturen (der Galileo-OSNMA-Wurzelschlüssel und RFC-{ "3161" }-Zeitstempeltoken) und signiert nur in Tests mit Wegwerfschlüsseln, daher war die praktische Gefährdung null; das Upgrade beseitigt die Warnung ohne Ignore-Eintrag. Die Lock-Dateien der Bibliothek und des MCP ändern sich beide; kein Verifikationsergebnis ändert sich (die Vektortests für OSNMA und Zeitstempel bestehen unverändert).

seg-1a4cda9d1486 = Die minimal unterstützte Rust-Version ist jetzt { "1.88" } (erforderlich durch die Behebung von RUSTSEC-2026-0387).
