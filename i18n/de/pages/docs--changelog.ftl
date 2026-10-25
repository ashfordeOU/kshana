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
seg-66749e5be121 = [{ $version }] - 2026-10-22

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
seg-f1cb2c2881c9 = Sieben MODELLED-Registerzeilen zu dem Obigen. Nichts davon ist VALIDATED: Es wurde keine Aufzeichnung eines realen Empfängers, einer Basisstation, einer IMU, eines GNSS-SDR-Laufs, eines ROS-Graphen oder eines MQTT-Brokers gelesen.

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
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Betroffene Verbraucher:</b> die Kinds <c1/>, <c2/>, <c3/> und <c4/>, der <c5/> der Spektrum-Kinds, die MODELLED-Referenzkurve der IQ-Kampagne und das labfit-Standard-Q sowie der Interop-Szenenexport.

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
seg-b96d34bb1d36 = Es wurde kein Zielwert geändert, und keine VALIDATED-Zeile, keine Abbildung und keine Zahl im Web hat sich verschoben.

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
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>Der MCP-Server lehnt <c1/> ab</b> (Nachfolgearbeit zu CAP-06b). Der Pfad der Geländekachel des Kinds jamming steht jetzt in <c2/>. Eine Inline-Oberfläche lehnt ein Szenario ab, das einen solchen Pfad nennt, mit einer Meldung, die weder den Pfad noch einen Betriebssystemfehler enthält. Der Wächtertest für Dateiquellen kennzeichnet nun auch Felder, die auf <c3/> enden.

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
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Paritätsdurchgang.</b> JetBrains-Aktionen Validate Scenario, List Scenario Kinds und Assess Receiver Stream; <c1/> listet jetzt <c2/>, <c3/>, <c4/> und <c5/>; das Notebook <c6/> (compliance-Zuordnung und test-bench-Export); und jede verbleibende JetBrains-Zelle „CLI only“ in <c7/> ist jetzt ein ausdrückliches N/A mit Begründung.

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
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Korrekturen aus der Prüfung: Die systemd-Units starten immer neu und laufen in einer Sandbox (keine Shell, kein Netzwerk, wo keines gebraucht wird), ein logrotate-Schnipsel, <c1/> schlägt bei jedem Befund fehl; der Container führt das Gate mit Umgebungsvariablen aus, mit Health-Check und per Digest festgelegten Basis-Images; Signal-K-Wert-Metadaten, die veraltete Benachrichtigung wird ersetzt, wenn wieder Daten eintreffen, Fehler von Kindprozessen bleiben erhalten und Kills eskalieren, unsichere <c2/> werden abgelehnt, und die Benachrichtigung liegt unter <c3/>; das Relay begrenzt eine zurückgehaltene Teilzeile; die Parser von <c4/> weisen Werte außerhalb von { "0" } bis { "100" } zurück; eine Prüfung der Dokumentationslinks; ein CI-Workflow (<c5/>), der all das ausführt, einschließlich der echten Binärdatei von Anfang bis Ende.

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
seg-065c4431197e = Lab-Replay: eine Tracking-Engine, Erkennungsmonitore und ein Kampagnenläufer für GNSS-IQ-Aufzeichnungen, mit den dazugehörigen Schleifenentwürfen, C/N0-Schätzern und Bewertungen. Evidenzklasse: Alles Folgende ist <b>MODELLED</b> oder auf interne Konsistenz gegen geschlossene Formen und gesäte Simulation geprüft; nichts davon fügt eine VALIDATED-Zeile hinzu, und das Verifikationsregister ist unverändert ({ "251" } Zeilen: { "124" } validiert, { "123" } modelliert, { "4" } Partner). Es ist eine Software-Analyseschicht: Nichts hier synthetisiert eine Wellenform eines Störsenders oder Spoofers, und nichts sendet.

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
seg-fa9976349886 = Neue VALIDATED-Zeile: die Signal-PSDs und SSCs, gegen die Hauptkeule von BPSK(n) mit 2n x { "1.023" } MHz, die um +/-1.023 MHz zentrierten Keulen von BOC({ "1,1" }), die geschlossenen Parseval-Formen hinter den veröffentlichten SSCs von -61.8 / -64.8 / -67.8 dB/Hz und das Lehrbuch-Q = { "1" } (CW) und { "1.5" } (Matched). Das PSD-Maximum von BOC({ "1,1" }) liegt bei +/-0.759 MHz, nicht in der Keulenmitte; der Test legt beides fest.

# text
# c1: jamming
seg-411431a9b26b = Zwei neue MODELLED-Zeilen: der Wasserfall und die C/N0-Zeitleiste, die sich genau auf die Kette der Art <c1/> reduzieren (in jedem Bericht gegengeprüft), sowie der SigMF-Codec und der Welch-Schätzer. Im Repository liegt keine Aufnahme von Dritten.

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
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Konfliktresilienz geschichteter PNT</b> (<c1/>, <c2/>): eine Monte-Carlo-Resilienz-Engine mit festem Seed für eine mehrschichtige PNT-Architektur, mit einem Modell des <b>Überlebens bei graceful degradation je Vektor</b> nach §{ "4.2" } (vier benannte Bedrohungsvektoren, die geschlossene Form des Überlebens nutzbarer PNT, gegen die die Monte-Carlo-Läufe je Schicht konvergieren, im Ergebnis-JSON ausgegeben) und dokumentierter, gegen Abweichung abgesicherter Herkunft der Bedrohungsparameter (<c3/>). MODELLED-Architekturen; die Konvergenz der Überlebens-Monte-Carlo → geschlossene Form ist der validierte Kern.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Cislunare Beobachtbarkeit</b> (<c1/>, <c2/>): ein Eigenspektrum der Beobachtbarkeits-Gramian über einen Bogen, ein durch Differentialkorrektur gewonnener Seeder für retrograde Fernbahnen (DRO) und eine unabhängige Gegenprüfung mit einem Square-Root-Information-Filter, dessen A-posteriori-Kovarianz genau bei vollem Beobachtbarkeitsrang endlich wird. MODELLED-Konstellation; die Invarianten von Rang/Gramian/STM/SRIF sind der validierte Kern.

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
seg-665d0dde637b = <b>Neue MODELLED-Fähigkeiten</b>, jede intern gegen eine geschlossene Form oder einen Schwesterpfad im Code gegengeprüft: Relativbewegungsdynamik nach Clohessy–Wiltshire / Hill, passive Emitterlokalisierung per TDOA/FDOA, Lagebestimmung nach Wahba/TRIAD/QUEST, Auflösung ganzzahliger Mehrdeutigkeiten der GNSS-Trägerphase (LAMBDA), B-Plane-Targeting & Gravity-Assist nach Patched-Conic, CRPA-Anti-Jam-Array-Beamforming, GNSS-Square-Law-Akquisitionsstatistik, Fringe-Mehrdeutigkeit / Dynamikbereich quanteninertialer Sensoren, IEEE-1139-Potenzgesetz-Uhrenrauschen + Flicker-FM-Untergrenze und CCSDS-OEM-Austausch von Kovarianzblöcken.

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
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = Dieses Release fügt der offenen Engine zwei MODELLED-Anwendungssuiten hinzu: einen <b>Demonstrator für quantengestützte PNT</b> (vertrauenswürdige Quanten-Zeitübertragung, GNSS-freie Quantennavigation, Quanten-Fehler-/Anomalieerkennung) und eine <b>PNT-Suite für Mond / cislunaren Raum</b> (Mond-Koordinatenzeit, Mond-VLBI, gemeinsame OD+Uhr, Frame-Realisierung, Service-Volume, differenzielle PNT, Interoperabilitätsexport), jede aus einem einzigen <c1/> ausführbar und jede mit einem ehrlichen <c2/>-Datensatz sowie einem Register zu Repräsentativität / Lücken bis zum Flug. Es bringt außerdem <b>sechs neue Validierungen gegen externe unabhängige Referenzen</b>, womit die maschinell geprüfte Validierungsmatrix auf <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> über ihre { "61" } Zeilen kommt. Die neuen Anwendungszahlen sind MODELLED aus illustrativen Parametern öffentlicher Quellen, ohne TRL, Flugerfahrung, Zertifizierung oder Billigung durch eine Agentur, und die wiederverwendeten validierten Kerne sind als solche gekennzeichnet.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Demonstrator-Suite für quantengestützte PNT</b> (<c1/>, <c2/>, <c3/>). Drei lauffähige MODELLED-Anwendungsbereiche hinter der Engine, jeder mit Ausgabe von <c4/> plus einem Datensatz zu Repräsentativität / Lücken bis zum Flug:

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
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>PNT-Suite für Mond / cislunaren Raum.</b> Sieben lauffähige MODELLED-<c1/>s, aufgesetzt auf den CR3BP-Kern: <b>Mond-Koordinatenzeit</b> (säkulare Rate LTC/TCL − TT, <c2/>), geodätische <b>Mond-VLBI</b>-Verzögerungsobservable (<c3/>), <b>gemeinsamer Batch-Estimator für Multitechnik-OD + Uhr</b> (<c4/>), <b>Realisierung des Bezugssystems</b> (7-Parameter-Helmert + IAU-{ "2015" }-WGCCRE-Anbindung, <c5/>), Analyse des <b>Service-Volume der Klasse Moonlight / LCNS</b> (<c6/>), <b>differenzielle PNT auf dem Mond</b> (<c7/>) und ein <b>an LunaNet / IOAG ausgerichteter Interoperabilitätsexport</b> (CCSDS-OEM + Mondzeitskala im KIF-Umschlag, <c8/>). Alle MODELLED aus illustrativen Parametern öffentlicher Quellen; nicht gegen reale VLBI-/Gateway-Bahnverfolgung validiert; keine Zugehörigkeit zu einer Agentur und keine Billigung durch eine solche.

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
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Register zu Repräsentativität & Lücken bis zum Flug</b> (<c1/>). Ein strukturierter Datensatz, den jeder Demonstrator ausgibt: was repräsentativ ist, was vereinfacht ist und was zwischen dem Modell und dem Flug steht, der ehrliche Begleiter jedes MODELLED-Trades.

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
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Elf neue lauffähige Szenarioarten: Demonstratoren mit zwei Ausschreibungen, eine CCSDS-Interop-Brücke und eine Suite für Missionsanalyse / Umgebung in erster Ordnung (alle MODELLED, additiv; bestehende Reproduzierbarkeits-Goldens unverändert).</b> Jede ist per CLI / Python / WASM / MCP aufrufbar, liefert ein <c1/> mit und trägt ein ausdrückliches MODELLED-Label in ihrem Ergebnis-JSON und in der einzeiligen Zusammenfassung (ein Test je Art in <c2/> prüft, dass das Label vorhanden ist und dass die Ausgabe nie den String <c3/> enthält):

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
