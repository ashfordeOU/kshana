# docs--surfaces: translations (de)

# text
seg-f917e7fcac09 = Was es ist

# text
seg-76dc5d9ec114 = JetBrains

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Oberfläche

# text
seg-d6476863f862 = Fähigkeit

# text
seg-e0426ffe2628 = Anmerkung

# text
seg-de6c33774c9c = CLI

# text
seg-98f4f946a7ac = WASM

# text
seg-206c78a69ded = Routenexposition

# text
seg-4dbf41c0ec3b = Funktion

# text
seg-d5b5bdf6081c = Rust

# text
seg-40a7552d2ba9 = MCP

# text
# c1: docs/SURFACES.md
seg-1194bde1c9df = Quelle: <c1/>

# text
# c1: kshana::surface
seg-4d8a164605fb = Jede Fähigkeit steht auf den Oberflächen zur Verfügung, auf denen sie sinnvoll ist; wo eine Oberfläche eine Fähigkeit nicht tragen kann, steht in der Zelle <b>N/A</b> und der Grund. Hinter jeder Oberfläche läuft dieselbe Engine: Die Einstiegspunkte für Python, WebAssembly und MCP für die Fähigkeiten von { "0.35" } sind dünne Wrapper über <c1/>, das den Code aufruft, den die Kommandozeile ausführt.

# text
seg-8a7389e86887 = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier ausgelassen; sie steht in <a1>docs/SURFACES.md</a1> auf GitHub.

# text
seg-d18c05fd2838 = Plugin

# text
seg-d78822583c64 = Notebook

# text
seg-334caeae9fba = Studio

# text
seg-00c6ee5bf2ea = Empfänger-Vertrauen für Schiffe, Stapel-Log (Wert 0-100, Gründe)

# text
# c1: /kshana-assess-receiver
# c2: vessel-receiver-trust
seg-b43593b3ede8 = <c1/>, Skill <c2/>

# text
seg-6f33cfd0477e = Assess Receiver Trust

# text
seg-3d7149c8caba = Seite für maritimes Vertrauen

# text
seg-892f8b2c1dc9 = Empfänger-Vertrauen an einem begrenzten Stromausschnitt (Werte, Zustände, Gründe; kein Gate)

# text
seg-e9f5fc58fe12 = gleich

# text
seg-b3ff5c36ef39 = Assess Receiver Stream (ein gespeichertes Log)

# text
# c1: geometry
# c2: label
# c3: geometry
# c4: monitors_run
# c5: class
# c6: geometry_model
# c7: geometry_summary
seg-0b94fa406ab3 = Satellitengeometrie und Abzugsklassen ({ "0.36" }: <c1/> gut/herabgesetzt/unbekannt mit Gründen und DOP, ein immer gemeldetes <c2/> gut/mittel/schlecht, der Monitor <c3/> (nichts, solange die Geometrie nicht schlecht ist, dann bis zu { "15" } Punkte; in <c4/> zuletzt aufgeführt, wenn er entschieden hat, sodass die Monitorzahl des Urteils die Geometrie einschließt), eine <c5/> bei jedem Abzug, <c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: receiver-trust live
# c3: $PKSHT
seg-611550e6f227 = <c1/>, <c2/> (im Ergebnis-JSON und in jeder JSON-Zeile; CSV, SVG, Ein-Zeilen-Urteil und <c3/> tragen einen Geometrie-Abzug wie jeden anderen und sind sonst unverändert)

# text
# c1: receiver_trust::geometry
# c2: EpochTrust
# c3: Deduction
# c4: EpochReport
seg-863e12c6ef61 = <c1/>, auf <c2/>, <c3/> und <c4/>

# text
# c1: receiver_trust
# c2: assess_vessel_log
# c3: receiver_trust_replay
seg-4d764d29cebe = <c1/>, <c2/>, <c3/> (in den zurückgegebenen Dicts)

# text
seg-3e381a941742 = dieselben drei (im zurückgegebenen JSON)

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
# c4: geometry_model
# c5: geometry_summary
# c6: trust_telemetry
seg-8411558f9852 = <c1/>, <c2/>, <c3/> (in der Antwort; die Antwort eines Schiffs-Logs behält <c4/> und <c5/>); <c6/> stellt es dar

# text
# c1: vessel-receiver-trust
# c2: trust-telemetry
seg-d397f9a330d2 = gleich, Skills <c1/>, <c2/>

# text
seg-95093013d169 = die obigen Aktionen geben die CLI-Ausgabe aus, die es enthält

# text
# c1: vessel-trust-and-training
seg-f0bc22ec95d3 = <c1/> (im Ergebnis, das es lädt)

# text
# c1: docs/MARITIME-TRUST.md
seg-86c0548edb03 = <b>ausstehend</b>: Die Seite für maritimes Vertrauen zeigt es noch nicht (Felder aufgeführt in <c1/>, Studio-Ansicht Punkt { "6" })

# text
# c1: receiver-trust live
# c2: --gate
# c3: --listen
seg-dffdbf379423 = <c1/> als laufender Prozess (stdin, verfolgte Datei, TCP, UDP, <c2/>, <c3/>)

# text
seg-bb4f68155884 = Tools: Karte Kommandozeile (der auszuführende Befehl; ein Browser ist kein Prozess im Datenpfad)

# text
# c1: lab-attestation
seg-a783976420e6 = Nachweispaket: erstellen (signiert, Fenster eines Logs; { "0.38" }: ein optionales <c1/>, die Erklärung des Betreibers zu einem Laboraufbau, im signierten Manifest festgehalten, nie verifiziert)

# text
seg-65826be9b437 = <b>N/A</b> (Signaturschlüssel)

# text
# c1: /kshana-evidence-pack
# c2: evidence-pack
seg-95395e63565d = <c1/>, Skill <c2/>

# text
seg-cc9b1d83ed15 = Create Evidence Pack (kein Attestierungsfeld im Dialog in { "0.38" }: <b>ausstehend</b>; die Kommandozeile nimmt es entgegen)

# text
seg-70534bdc6c87 = <b>N/A</b> (ein Signaturschlüssel gehört nicht auf eine Seite); Tools: Karte Kommandozeile

# text
# c1: import
# c2: score
seg-83d9a9e9603a = Jammertest als Schiedsrichter ({ "0.38" }): der veröffentlichte NPRA-Katalog und Sendeplan, gelesen als geplante Wahrheit (<c1/>), ein Empfänger-Log, je Test dagegen bewertet (<c2/>: Erkennungslatenz, verpasst, Fehlalarme, Zeit bis zur Erholung; MODELLED)

# text
# c1: /kshana-jammertest
# c2: jammertest
seg-38dcbafd214a = <c1/>, Skill <c2/>

# text
seg-c61ff1d0f579 = <b>N/A</b> (braucht die Plandateien und ein Log auf der Platte; von einem Terminal ausführen)

# text
seg-5a9087e23823 = <b>N/A</b> (noch kein Notebook)

# text
seg-c92ea39fb2d1 = <b>ausstehend</b>: eine Tools-Karte für die Kommandozeile (der Studio-Streifen und die Ansichten gehören zu WS-A)

# text
# c1: jammertest score --key
# c2: config.json
seg-3eae6f848b58 = Signiertes Jammertest-Bewertungspaket (<c1/>: das Nachweispaket zum Empfänger-Vertrauen mit dem Bewertungsbogen und dem Zeitplan in <c2/>)

# text
# c1: create_evidence_pack
seg-f1695a89c33b = <b>N/A</b> (Signaturschlüssel: <c1/> auf einem Fenster verwenden oder die Kommandozeile)

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
seg-a3655f428a0c = Selbstauskunft des Empfängers ({ "0.38" }): UBX-NAV-STATUS <c1/> und UBX-SEC-SIG, bei jeder Epoche in <c2/> gelesen, und der Vergleich <c3/> (beide / nur Empfänger / nur Kshana / keiner) im Ergebnis; löst keinen Alarm aus und ändert keinen Wert

# text
# c1: receiver-trust
# c2: jammertest score
seg-b0190b99d9fd = <c1/> (im Ergebnis-JSON; <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-70c1a825afa5 = <c1/>, <c2/> (in den zurückgegebenen Dicts)

# text
# c1: receiver_trust
seg-0cd306174106 = <c1/> (im zurückgegebenen JSON)

# text
# c1: assess_receiver_log
seg-0b7d16c95d12 = <c1/> (in der Antwort)

# text
# c1: epochs[].self_report
seg-833ac4d6bded = <b>ausstehend</b>: der Streifen der Vertrauensseite (WS-A; das Feld ist <c1/>)

# text
seg-c56746c298f2 = Septentrio-SBF-Logformat ({ "0.38" }, nur lesen: PVTGeodetic, MeasEpoch, RFStatus)

# text
# c1: receiver-trust
# c2: [log] format = "sbf"
seg-1f4c22e8bf78 = <c1/> mit <c2/>

# text
# c1: receiver_trust
# c2: assess_receiver_log
# c3: format = "sbf"
# c4: base64
seg-741ee07949d0 = <c1/>, <c2/> (<c3/>, Log als <c4/>)

# text
seg-003608556fc0 = dasselbe

# text
seg-ae8bf32d890b = die obigen Aktionen

# text
seg-20f086cdea29 = <b>N/A</b> (das Hochladen binärer Logs wird auf der Vertrauensseite in { "0.38" } nicht angeboten)

# text
# c1: receiver-trust live --serial <device> [--baud n]
# c2: --configure
seg-1303f81c2407 = <c1/>: ein serieller oder USB-NMEA-Feed, nur lesend (öffnet das Gerät zum Lesen, schreibt nie auf den Empfänger; <c2/> wird zurückgewiesen)

# text
seg-59610023b124 = <b>N/A</b> (ein Gerät und ein Prozess)

# text
seg-1fcba825118e = Nachweispaket: erstellen (signiert, Fenster eines Logs)

# text
seg-fa4022137830 = Create Evidence Pack

# text
seg-e6b694a68935 = Labor-Rundlaufpaket (Szenario, Testbedingungen, Empfänger-Log und Bewertung, per Hash verknüpft)

# text
seg-bfcfc5d28be8 = <b>N/A</b> (JetBrains-Aktionen sind an eine ausgewählte Datei gebunden; das Paket braucht ein Szenario, Bedingungen, ein Log und einen Schlüssel: im IDE-Terminal ausführen)

# text
seg-7942dacc8476 = Nachweispaket: verifizieren

# text
seg-93a0c989870b = Verify Evidence Pack (nur festgelegter Schlüssel)

# text
seg-bf617fa341c8 = Tools: Nachweispakete (verifizieren, Zeitstempel anhängen)

# text
# c1: format = "mqtt"
# c2: --mqtt-tcp
seg-49df5efbbd2b = Vertrauens-Telemetrie (Prometheus, Syslog CEF/LEEF, OTLP; { "0.38" }: <c1/>, Home-Assistant-Erkennung und Zustandszeilen; <c2/> veröffentlicht aus der CLI)

# text
# c1: trust_telemetry
seg-60d46f0e3ead = <c1/> (Textausgabe; kein Socket)

# text
# c1: /kshana-trust-telemetry
# c2: trust-telemetry
seg-45ee1c8b6f70 = <c1/>, Skill <c2/>

# text
seg-9eff7c00723a = Render Trust Telemetry (ein gespeichertes Ergebnis)

# text
seg-1b60ff4652cd = Tools: Telemetrie-Karte (Tab Kommandozeile; nur Formate, keine Sockets)

# text
# c1: receiver-trust
# c2: rtklib-pos
# c3: novatel
# c4: gnss-sdr
# c5: [log.imu]
# c6: csv
# c7: euroc
seg-3e332170d963 = Maschinen- und Sensoreingaben ({ "0.38" }): <c1/>-Formate <c2/>, <c3/>, <c4/> und <c5/> (<c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: [log] format
seg-060e5931ac62 = <c1/> (Szenario <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-9dad5918cbf9 = <c1/>, <c2/> (inline)

# text
# c1: receiver_trust
seg-de4cb342c417 = <c1/> (inline)

# text
# c1: assess_receiver_log
# c2: path
seg-4b6a73f5dc13 = <c1/> (Inline-Text/base64; ein <c2/> wird zurückgewiesen)

# text
seg-4c6056fb8884 = <b>N/A</b> (die Vertrauensseite des Studios liest die Formate, die sie auflistet; neue Formate folgen mit ihrer nächsten Portierung)

# text
# c1: [accel_classical]
seg-5d69867fc6f8 = IMU-Log zu Hybrid-/Fusions-Sensorparametern (Tabelle <c1/> aus einem Log im Stillstand, Allan-Anpassung)

# text
seg-426814dbf8dd = <b>N/A</b> (noch keine IDE-Aktion)

# text
seg-e8477119c213 = <b>N/A</b> (der Szenario-Editor des Studios nimmt die eingefügte Tabelle entgegen)

# text
# c1: trust-telemetry --mqtt-tcp
# c2: integrations/ros2
# c3: integrations/gnss-sdr
seg-7cacfab5931c = ROS-{ "2" }-Knoten, GNSS-SDR-UDP-Relay, <c1/> (<c2/>, <c3/>)

# text
seg-70e2e895a01f = Prozesse

# text
# c1: trust_telemetry
# c2: mqtt
seg-c1ad125a051e = <b>N/A</b> (langlaufende Prozesse und Sockets; Textformen: <c1/> mit <c2/>)

# text
# c1: docs/OSNMA.md
seg-7527df567fc3 = Galileo-OSNMA-Verifikation von I/NAV-Seiten oder eines UBX-Stroms (<c1/>)

# text
seg-e5295f10cf3f = <b>N/A</b> (ein langer roher Empfängerstrom passt zur CLI und zu Python; ein Agentenwerkzeug würde eine Oberfläche für große Eingaben ohne Nutzen hinzufügen)

# text
# c1: kshana osnma verify
seg-32560c9024ff = <b>N/A</b> (Plugin-Befehle laufen über den MCP-Server, der aus dem Grund in der MCP-Zelle kein OSNMA-Werkzeug hat; <c1/> ausführen)

# text
# c1: kshana osnma verify
seg-e4b399062eca = <b>N/A</b> (das Ergebnis bedeutet nichts ohne eine vertrauenswürdige Merkle-Wurzel oder einen öffentlichen Schlüssel, die auf anderem Weg aus dem ICD bezogen wurden, und, für die Aktualität, eine unabhängige Referenzzeit; eine Rechtsklick-Aktion hat keinen Ort, sie aufzunehmen, und ein nicht festgelegter Standard würde als Verifikation gelesen; <c1/> ausführen)

# text
seg-dac011642033 = <b>N/A</b> (ein Strom hinein, ein JSON-Bericht heraus; kein Notebook)

# text
seg-dbe4907cd74c = Tools: OSNMA

# text
seg-5ee6c4f68127 = Trainings-NMEA mit einem Ausbilder-Log

# text
# c1: /kshana-training-scenario
# c2: training-nmea-scenario
seg-e321d52ad21d = <c1/>, Skill <c2/>

# text
seg-79776273210a = Generate Training NMEA

# text
seg-899995619176 = Seite für die Nachbesprechung des Trainings

# text
seg-9cb27f0adfb3 = Trainings-NMEA, gestreamt an eine TCP- oder UDP-Adresse

# text
seg-71e498158f5d = Tools: Karte Kommandozeile (streamt an eine Adresse)

# text
seg-6a3b4cf33177 = Störungskarte (ADS-B, AIS)

# text
# c1: /kshana-interference-map
# c2: interference-map-route-exposure
seg-3d7c2700cf7d = <c1/>, Skill <c2/>

# text
seg-3740aafd1749 = Build Interference Map

# text
seg-b164d99daf08 = Seite der Störungskarte

# text
seg-81d53d4f3a11 = Route Exposure

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-c73605fe5e59 = Signal-K-Plugin und OpenCPN-Gate-Feed (<c1/>)

# text
seg-10037d51a377 = <b>N/A</b> (Prozesse)

# text
# c1: /kshana-marine-integrations
# c2: marine-integrations
seg-0360c13bb637 = nur Anleitung: <c1/>, Skill <c2/>

# text
seg-e3acebdb4cd0 = Tools: Karte Kommandozeile (Anleitung; eine Bereitstellung)

# text
seg-38fafad3482b = Test-bench-Export (Bewegungs-CSV, NMEA, Wegpunkte, Ereignisse für einen Laborsimulator)

# text
# c1: /kshana-bench-export
# c2: test-bench-export
seg-ffe594484ff8 = <c1/>, Skill <c2/>

# text
seg-af0be6bf84c7 = Export Test-Bench Files

# text
seg-e676bae4b98d = Tools: Test-bench-Export

# text
seg-394eee3f0c0f = Compliance-Mapping aus Läufen (für welche Zeilen öffentlicher Frameworks die Läufe Belege liefern)

# text
# c1: /kshana-compliance-report
# c2: compliance-mapping
seg-c7782a49a50e = <c1/>, Skill <c2/>

# text
seg-a97d66893e2c = Build Compliance Report

# text
seg-314d03d7d075 = Tools: Compliance-Mapping

# text
seg-02601f519c92 = Tabellen und Quellen des Compliance-Mappings

# text
seg-31d29baca4c2 = Show Compliance Mapping

# text
seg-01418b04e9bf = Standardpakete (bewertete Szenariosätze mit vor dem Lauf festgelegten Zielwerten: DHS-RPCF-Testprofile, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Anhang F)

# text
# c1: kshana standards-pack
seg-72ea3b5bf39d = <b>N/A</b> (JetBrains-Aktionen sind an eine ausgewählte Datei gebunden; Pakete sind eingebettet und brauchen keine: <c1/> im IDE-Terminal ausführen)

# text
seg-731504a1218f = <b>N/A</b> (Tools-Karten des Studios für Pakete gehören zum Studio-Arbeitsstrang; die CLI oder die Ausgabe jeder Oberfläche speist die Karte Compliance-Mapping)

# text
# c1: docs/LUNANET-AFS.md
seg-ffab4fc439d9 = LunaNet Augmented Forward Signal: Codes, SB1/CRC/Interleaver und eine Prüfung gegen LSIS-AFS V1.0 (<c1/>)

# text
# c1: lunanet-afs-check
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: iq scene/acquire/track/sweep
seg-c348615fae6f = <c1/>; Signale <c2/>, <c3/> in <c4/>

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-a4f461bbd9fa = <c1/>, <c2/>, <c3/>; <c4/> usw. mit den beiden Signalnamen

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-3fddaefc42f4 = <c1/>, <c2/>, <c3/>; <c4/> usw. über die kurzen Läufe im Arbeitsspeicher

# text
# c1: kshana lunanet-afs-check
seg-338350a8097c = <b>N/A</b> (JetBrains-Aktionen sind an eine ausgewählte Datei gebunden; <c1/> im IDE-Terminal ausführen)

# text
seg-01a840e0bdc8 = <b>N/A</b> (eine Studio-Karte ist ein Punkt des Studio-Arbeitsstrangs; die CLI und jede andere Oberfläche tragen es)

# text
# c1: docs/SKYLINE.md
seg-d04d7f608263 = Himmelsgeometrie unter einer Skyline: sichtbare und maskierte Satelliten, DOP, ENU-Kovarianz, Fehlerellipse (<c1/>)

# text
# c1: /kshana-run
seg-9dfe4289533b = <c1/> (verweist auf das Werkzeug)

# text
# c1: kshana sky
seg-f21f2810b363 = <b>N/A</b> (ein interaktiver Skyplot ist eine Browseransicht; <c1/> deckt die Zahlen ab)

# text
seg-f923796dab30 = – (die Geometrieansicht des Studios wird in { "0.36" } gesondert hinzugefügt)

# text
seg-26c89146e670 = Monte-Carlo-Wolke des Himmels (geseedete Kleinste-Quadrate-Fehler, RMS, { "95" } % Einschluss)

# text
seg-3627b76a3778 = <b>N/A</b> (Massenstichproben, die ein Agent zusammenfassen und nicht mitführen sollte)

# text
seg-4ebfbca0614e = <b>N/A</b> (kein MCP-Werkzeug)

# text
seg-8b6155019a17 = <b>N/A</b> (siehe oben)

# text
seg-586e8d98ecd9 = – (siehe oben)

# text
# c1: docs/SKYLINE.md
seg-ae43880fd2cc = Skyline-Voreinstellungen und -Profile (<c1/>)

# text
seg-ad514737bf83 = Skyplot als SVG

# text
# c1: sky_geometry
seg-9a6087f458bc = <b>N/A</b> (ein Agent liest die Zahlen aus <c1/>)

# text
# c1: [skyline]
# c2: user_site
seg-6de10d28a5fc = Skyline-Abschnitt in einem Szenario (<c1/>: orbit und integrity mit <c2/>, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario)

# text
seg-65ffc53b15fa = die Szenariodatei

# text
seg-74fac0bacb76 = Run Kshana Scenario

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
seg-f71e5e2eb4f3 = Optische Zeitverbindung durch die Atmosphäre: Verfügbarkeit je Standort, Standortdiversität, Verbesserungstechniken, Kopplung von Ausfall und Holdover (Szenarioart <c1/>; <c2/>; MODELLED, ILLUSTRATIVE Standorte, beratend)

# text
seg-490147c5e7ec = <b>ausstehend</b>: noch keine Studio-Ansicht; das Szenario läuft im Szenario-Runner des Studios und auf der Tools-Karte Kommandozeile

# text
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-de2c788670aa = Holdover-Test, bewertet an einer vom Betreiber gelieferten Zeitfehler-Aufzeichnung: Basislinie, vom Betreiber entferntes GNSS, Holdover, Erholung, gemessen an ITU-T-Masken (Szenarioart <c1/>; <c2/>; MODELLED, beratend; Kshana sendet und steuert nichts)

# text
# c1: run
# c2: samples
# c3: clock_log.text
seg-3fdb9a269cd0 = <c1/> (inline <c2/> oder <c3/>; die Dateischlüssel werden zurückgewiesen)

# text
# c1: run_scenario
seg-d946c75f821a = <c1/> (nur inline)

# text
# c1: run
seg-b91e77ef7186 = <b>N/A</b> (kein Notebook in { "0.38" }; die Beispielszenarien laufen in jedem Notebook über <c1/>)

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-5041a1d6272f = GNSS jenseits der Konstellation: Verfügbarkeit von Signalen von GPS, GLONASS, Galileo, BDS, QZSS und NavIC für einen Nutzer auf einer Kugelschale oder auf einer Trajektorie von LEO bis zum Mondtransfer (Booklet-, parametrisches oder gemessenes Sendediagramm, Medium des Randstrahls, Entwurf eines Empfängers für schwache Signale), ein GNSS-EKF an Bord für Fahrzeuge auf hoher Bahn und im Mondtransfer sowie relative Formationsnavigation (Szenarioart <c1/>; <c2/>; MODELLED, beratend; unter einer Vorregistrierung mit dem ICG-SSV-Booklet verglichen, <c3/>)

# text
# c1: run
# c2: transmit.pattern_text
seg-3e16823c1c90 = <c1/> (inline; <c2/> trägt ein gemessenes Diagramm inline)

# text
# c1: run_scenario
# c2: transmit.pattern_csv
seg-126a59c992d9 = <c1/> (nur inline; <c2/> wird zurückgewiesen)

# text
# c1: run
seg-2010eb196565 = <b>N/A</b> (kein Notebook in { "0.38" }; die Szenarien laufen in jedem Notebook über <c1/>)

# text
# c1: lunar-infrastructure
# c2: study = ...
# c3: docs/LUNAR-INFRASTRUCTURE.md
seg-593b7761803d = Mondbahn und Mondoberfläche als Navigations- und geodätische Infrastruktur: Konsistenz der Bahnbestimmung, Auflösung der Trägerphasen-Mehrdeutigkeit, gemeinsame Schätzung des Bezugssystems, Sensitivität von Space-Tie und Love-Zahl (Szenarioart <c1/>, <c2/>; <c3/>; MODELLED, ILLUSTRATIVE Eingaben, beratend)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-34ed7b4d59e4 = <c1/> (und die fünf Geschwisterbeispiele)

# text
# c1: run
seg-ba584b2da776 = <b>N/A</b> (kein Notebook; die Beispiele laufen in jedem Notebook über <c1/>)

# text
seg-b5ae9f9fd5df = <b>ausstehend</b>: noch keine Studio-Ansicht; die Szenarien laufen im Szenario-Runner des Studios und auf der Tools-Karte Kommandozeile

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
# c4: tracking
# c5: statistics
# c6: [clock_log]
# c7: [series.clock_log]
# c8: docs/CLOCK-LOG-FORMATS.md
seg-3103be5ffa0a = Gemessene Uhren-Logs, gelesen zu einer Phasenreihe: linuxptp <c1/>, <c2/>, <c3/>, chrony <c4/> und <c5/>, neben RINEX-Uhr, TimeLab und TICC (<c6/> / <c7/>; <c8/>; MODELLED, keine unabhängige Referenz vergleicht eine Auswertung mit einem anderen Leser)

# text
# c1: [clock_log]
seg-5b9d4cfbbbf7 = ein Szenario mit <c1/>

# text
# c1: run
# c2: text
seg-f0ac32797edb = <c1/> (<c2/> nur inline; keine Dateizugriffe in einem Browser)

# text
# c1: run_scenario
# c2: text
# c3: path
seg-bf0495255831 = <c1/> (<c2/> nur inline; <c3/> wird zurückgewiesen)

# text
seg-aa26d73d9b79 = <b>N/A</b> (kein Notebook; ein Log ist eine Datei, die der Nutzer liefert)

# text
seg-d1ebbe70e454 = <b>ausstehend</b>: keine Studio-Ansicht; der Szenario-Runner des Studios nimmt den Szenariotext entgegen

# text
# c1: /studio/optical/
seg-04edbdcaf5c7 = die Ansicht Optical PNT des Studios (<c1/>, { "0.38" }) stellt die aufgezeichneten Ergebnisse der beiden mitgelieferten Szenarien dar, einschließlich der geseedeten Zeitreihe; das Szenario läuft außerdem im Szenario-Runner des Studios und auf der Tools-Karte Kommandozeile

# text
# c1: interference-map fetch-land
seg-dbe94c1cb4b0 = Download der Landpolygone (<c1/>)

# text
seg-d61b28df9367 = CLI-Code

# text
# c1: --allow-network
seg-3c816222df90 = Tools: Karte Kommandozeile (braucht <c1/>)

# text
# c1: docs/BENCH.md
seg-858b2c4a1451 = Benchmark (kshana-bench v1: eine Einreichung gegen eine Wahrheitsdatei bewerten, Bestenlisten-Seite; <c1/>, MODELLED, beratend)

# text
seg-f6e2271206a6 = <b>N/A</b> (die beiden MCP-Werkzeuge tragen es; ein Slash-Befehl über zwei JSON-Dateien fügt nichts hinzu)

# text
seg-4edd4fe793f1 = <b>N/A</b> (keine IDE-Aktion)

# text
seg-15ffa4639a46 = <b>N/A</b> (Lehr-Notebooks sind ein eigener Arbeitsstrang)

# text
# c1: bench/site/
seg-5d48d48ae295 = <b>N/A</b> (die Bestenliste ist die statische Seite <c1/>, unverändert auf die Website portiert; das Studio berechnet nichts)

# text
# c1: bench truth|cases|baseline|seal|reveal-check|manifest|verify-manifest|validate
seg-f730ab44ca82 = Benchmark-Daten und Werkzeuge für zurückgehaltene Datensätze (<c1/>)

# text
# c1: seal
seg-efdc66eff3d8 = <b>N/A</b> (die CLI liest Datensatzverzeichnisse und Uhrendateien und, für <c1/>, eine geheime Seed-Datei; ein Seed darf weder durch einen Agenten noch durch eine Seite laufen)

# text
# c1: interference-map daily|sensitivity
# c2: docs/observatory/METHOD.md
seg-2146297abaf0 = Tagesprodukt des Observatoriums und Sensitivitätsstudie (<c1/>; <c2/>)

# text
seg-f359f5223666 = <b>N/A</b> (die Befehle lesen ein Archivverzeichnis mit Hunderttausenden Dateien, schreiben vier Dateien, darunter ein PNG, und setzen die Veröffentlichungsverzögerung von { "24" } h gegen die Uhr des Rechners durch, der veröffentlicht; die CSV-Karte steht auf jeder Oberfläche in der Zeile oben)

# text
# c1: trust/
# c2: training/
# c3: interference/
# c4: geometry/
# c5: lunar/
# c6: lunar-station-coverage
# c7: #osnma
# c8: #evidence
# c9: #bench
# c10: #compliance
# c11: #ai
# c12: —
seg-55cf42830155 = Kshana Studio ist die Web-App, die auf dem WebAssembly-Build aufbaut, daher gibt es eine Studio-Ansicht dort, wo die WASM-Spalte einen Einstiegspunkt hat, und wo nicht, verweist die Zelle auf eine <b>Karte Kommandozeile</b> (den auszuführenden Befehl mit seinen Argumenten), nie auf ein vom Studio berechnetes Ergebnis. Seiten (kshana.dev/studio/, clientseitig): <b>Maritimes Vertrauen</b> (<c1/>), <b>Nachbesprechung des Trainings</b> (<c2/>), <b>Störungskarte</b> (<c3/>), <b>Geometrie</b> (<c4/>: ein repräsentativer Skyplot, eine Skyline, DOP, Fehlerellipse und Monte-Carlo-Wolke aus der Engine; { "0.36" }), <b>Mondstation</b> (<c5/>: die modellierte Abdeckung einer lunaren Referenzstation aus der Art <c6/>; { "0.36" }) und die Seite <b>Tools</b>, deren Abschnitte OSNMA (<c7/>), Nachweispakete (<c8/>), Test-bench-Export (<c9/>), Compliance-Mapping (<c10/>), der Tab Kommandozeile (Telemetrie-Karte, IQ, maritime Integrationen: auszuführende Befehle) und Aus Ihrem KI-Assistenten nutzen (<c11/>) sind. Ein <c12/> in der Studio-Spalte der Unterbefehlstabelle ist ein Befehl, der nicht zu den Fähigkeiten von { "0.35" } gehört, die das Studio darstellt.

# text
seg-73006c42aef2 = Warum die N/A-Zellen N/A sind

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-6d586f5fbaa3 = <b>Signal K und OpenCPN.</b> Sie sind Konsumenten des laufenden Live-Prozesses und seines TCP-Gates, also Kommandozeilen-Bereitstellungen; das Plugin bringt einen Anleitungsbefehl und einen Skill mit, die auf <c1/> verweisen und kein Werkzeug aufrufen.

# text
seg-79ec7e7307da = Ein laufender Prozess.

# text
# c1: receiver-trust live
# c2: position
# c3: advisory
# c4: geometry
# c5: class
# c6: receiver-trust live
# c7: --replay
# c8: --udp <port>
# c9: --listen tcp:<port>
seg-17fcf959153f = <c1/> hält einen Strom offen, kann den gegateten Strom an beliebig viele TCP-Clients ausliefern und läuft, bis er beendet wird. Ein Python-Aufruf, ein Browser-Aufruf, ein MCP-Werkzeugaufruf und eine IDE-Aktion kehren jeweils zurück, wenn sie fertig sind, und halten keinen Socket für andere offen. Python, WASM und MCP tragen stattdessen die begrenzte Form: einen Ausschnitt, bewertet von derselben Engine, im Live-Schema (JSON-Zeilen { "1.3" }: <c2/>, eine Aussage <c3/> und die Satelliten-<c4/> bei jeder Epoche, eine <c5/> bei jedem Abzug), ohne Socket und ohne Gate (das Gate markiert bei einem Live-Strom eine Lösung als ungültig, was nur ein Prozess im Datenpfad tun kann). Zwei Verhaltensweisen gehören zum Prozess und stehen nicht in den Ausschnitt-Werkzeugen: Ein Strom, der über <c6/> ohne <c7/> schneller als in Echtzeit wiedergegeben wird, wird als nicht vertrauenswürdig bewertet (seine Zeit weicht von der Hostuhr ab; ein Ausschnitt wird ohne Hostuhr gelesen), und <c8/> und <c9/> binden die Loopback-Adresse, sofern keine Adresse angegeben ist.

# text
# c1: trust_telemetry(input, format, host, input_kind, options_json)
# c2: trust_telemetry
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: trust-telemetry
# c6: kshana trust-telemetry --result session.result.json --print-metrics
# c7: TRUST-TELEMETRY.md
seg-824d2bbbf280 = <b>Vertrauens-Telemetrie.</b> WASM trägt <c1/>: dieselben Encoder, die Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen oder die OTLP-JSON-Nutzlast für einen Strom oder ein Stapelergebnis zurückgeben, ohne Uhr (Syslog-Zeilen tragen den Nil-Zeitstempel nach RFC { "5424" }) und ohne dass etwas gesendet wird. Python (<c2/>) und MCP (<c3/>, mit dem Plugin-Befehl <c4/>) tragen sie ebenfalls. Der Rest von <c5/> liefert Prometheus-Metriken aus, sendet Syslog und exportiert OpenTelemetry aus einem laufenden Strom und ist daher von Natur aus ein Prozess. Anleitung: den Live-Befehl hineinleiten oder eine Ergebnisdatei wiedergeben (<c6/>); siehe <a1><c7/></a1>. Ein Agent oder ein Notebook, das die Werte je Epoche will, ruft stattdessen die Stapel- oder Ausschnittsfunktionen auf.

# text
# c1: evidence_verify
seg-a5c2ef208191 = <b>Ein Paket im Browser erstellen.</b> Das Signieren braucht einen privaten Schlüssel, der nicht durch eine Webseite laufen sollte; der Browser-Build verifiziert Pakete (<c1/>), und die anderen Oberflächen erstellen sie. Das MCP-Werkzeug gibt den Signatur-Seed nie zurück und protokolliert ihn nie, und ohne einen signiert es mit einem Einmalschlüssel (Integrität, nicht Identität); verwenden Sie für einen Schlüssel, auf den es ankommt, die CLI. Dasselbe gilt für das Streamen von Trainings-NMEA an eine Adresse: Python, WASM und MCP geben den erzeugten Text zurück, und die CLI sendet ihn.

# text
seg-dea93c47b3b1 = Studien-Suiten.

# text
# c1: --study <suite.toml>
# c2: run
# c3: run_scenario
# c4: run_all
seg-2e88bb410874 = <c1/> führt ein Manifest aus, das Geschwister-Szenariodateien auf der Platte benennt. Die Oberflächen im Arbeitsspeicher nehmen Szenariotext entgegen, keinen Ordner mit Dateien, und führen daher jedes Mitglied stattdessen als Szenario aus (<c2/>, <c3/>, <c4/>).

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: iq extract
# c3: convert
# c4: decimate
# c5: iq labfit
# c6: iq conditions
seg-d08f585c4f02 = <b>GNSS-IQ im Browser und Aufzeichnungen, die umgeschrieben werden.</b> Eine Aufzeichnung besteht aus Gigabyte an Abtastwerten, die eine Seite nicht halten und das MCP-Protokoll nicht tragen darf, daher hat WASM keine IQ-Funktionen, und die MCP-Werkzeuge lesen und schreiben nur ein Arbeitsverzeichnis (<c1/>, mit einem Abtastbudget je Aufruf). <c2/>, <c3/> und <c4/> dienen dazu, Aufzeichnungen auf der Platte umzuschreiben, und bleiben auf die Kommandozeile beschränkt. <c5/> und <c6/> tragen Text, daher nimmt MCP sie inline entgegen (ein Log, das eine Datei benennt, wird zurückgewiesen).

# text
# c1: curl
# c2: --allow-network
# c3: curl
# c4: land_geojson
seg-f571dc5c2330 = <b>Der Land-Download.</b> Er ist der einzige Befehl, der eine Netzwerkverbindung öffnet, er braucht das System-<c1/> und ein ausdrückliches <c2/>, und er prüft ein festgelegtes SHA-256. Der Browser hat kein <c3/>, und ein KI-Agent sollte nicht im Auftrag eines Nutzers Daten holen; die anderen Oberflächen nehmen die Landdatei stattdessen als Text entgegen (<c4/>).

# text
seg-f81f6b6a2e67 = Trace-Archive und -Verzeichnisse.

# text
# c1: interference-map adsb
seg-2f226f3955d9 = <c1/> auf einem readsb-Trace-Verzeichnis liest Dateien von der Platte und ist auf die Kommandozeile beschränkt; die Oberflächen im Arbeitsspeicher nehmen CSV-Text entgegen.

# text
seg-6fb9f23090ca = Jeder Unterbefehl der Kommandozeile und wer ihn abdeckt

# text
# c1: kshana --help
seg-4a225d5d59af = Eine Zeile je Unterbefehl oder Modus von <c1/>. <b>yes</b> nennt den Einstiegspunkt; <b>no</b> ist eine Lücke mit ihrem Grund; <b>N/A</b> ist eine Oberfläche, die ihn aus dem oben oder in der letzten Spalte genannten Grund nicht tragen kann. JetBrains-Aktionen führen die Kommandozeile aus, daher gibt ein <b>N/A</b> dort an, warum es keine IDE-Aktion gibt.

# text
seg-35720f38b1a5 = Unterbefehl

# text
# c1: kshana <scenario.toml>
seg-d46c11fa6dea = <c1/> (ausführen, Diagramm, Tabelle)

# text
# c1: error_kind
seg-af645810cc0c = <c1/> (ein Lauf wirft bei einem ungültigen Szenario)

# text
seg-7d6c8218a4a6 = Validate Scenario

# text
seg-d75a5f64c7cc = <b>N/A</b> (benennt Geschwisterdateien auf der Platte)

# text
seg-16775dd25139 = Eine Suite benennt Geschwister-Szenariodateien auf der Platte (N/A oben); jedes Mitglied als Szenario ausführen

# text
seg-1742459cb792 = Export Scenario

# text
# c1: utf-8
seg-2bc957bd567b = Dateien kommen als Text (<c1/>) oder base64 zurück (die SigMF-Abtastwerte)

# text
seg-bf69da729efd = Import Route

# text
seg-6d762f20af07 = Animate Scenario

# text
seg-052c13118454 = Höchstens { "120" } Bilder je Aufruf; längere Sequenzen verwenden die CLI

# text
# c1: sky <request>
# c2: --monte-carlo
# c3: --svg
seg-5580a1a89bcb = <c1/> (oder Flags), <c2/>, <c3/>

# text
# c1: sky_geometry
seg-b96c18c1f157 = <c1/> (kein Monte Carlo, kein SVG)

# text
seg-5b62ca019ebd = <b>N/A</b> (siehe die Fähigkeitenzeile)

# text
seg-c853beadb55e = REPRÄSENTATIVE Voreinstellungen mit Herkunft

# text
seg-52638393d72d = List Scenario Kinds

# text
seg-69bc0d382eb7 = Insert Example Scenario

# text
# c1: python
# c2: wasm
seg-611dbcb5a15c = Die Features <c1/> und <c2/> kompilieren den Beispieltext ein (etwa { "0.7" } MB)

# text
# c1: receiver-trust <scenario.toml>
seg-51e0c2c100f8 = <c1/> (Stapel)

# text
# c1: receiver_trust_replay
seg-c9421c4d744f = Ausschnitt: <c1/>

# text
# c1: assess_vessel_stream
seg-6a2439967519 = Ausschnitt: <c1/>

# text
seg-efe5e5dbe710 = Ausschnitt

# text
# c1: --file
seg-816f9bd210d5 = Assess Receiver Stream (ein gespeichertes Log, <c1/>)

# text
seg-d81457d8f038 = Seite für maritimes Vertrauen (Ausschnitt); Karte Kommandozeile für den Prozess

# text
seg-9cf210dd2301 = Ein laufender Prozess; der Ausschnitt hat keinen Socket und kein Gate (N/A oben)

# text
seg-315d0dcd39fb = Nur Text auf jeder Oberfläche, kein Socket; die laufenden Exporter sind ein Prozess (siehe oben)

# text
seg-5c93482c9ae4 = Text hinein, JSON heraus; MODELLED

# text
seg-3763f34af33d = N/A (siehe oben)

# text
# c1: --json
# c2: advisory
seg-4110fadc04db = Dasselbe JSON wie <c1/>, mit dem Hinweis in seinem Feld <c2/>; die Dateilesung wird zu Bytes im Arbeitsspeicher. Nur Authentifizierungsstatus: kein Dienst für Navigationsintegrität und keine Aussage zur Leistung gegen Spoofing

# text
# c1: receiver-trust evidence
seg-399524b468f3 = <c1/> (ein Paket erstellen)

# text
seg-6dfc4b352892 = Tools: Karte Kommandozeile (kein Signaturschlüssel in einer Seite)

# text
seg-69dadb564662 = Kein Signaturschlüssel in einem Browser

# text
seg-fd26107fa3cd = <b>N/A</b> (Terminal; braucht Dateien)

# text
seg-38dc9c30191a = <b>ausstehend</b>: Tools: Karte Kommandozeile

# text
# c1: --key
seg-57257e80468f = Plan und Katalog werden als Text übergeben; das signierte Paket (<c1/>) gibt es nur auf der Kommandozeile (Signaturschlüssel)

# text
seg-3ea5db063974 = Kein Signaturschlüssel in einem Browser; es wird kein Signal geschrieben oder wiedergegeben

# text
seg-8b27a6ca1aef = <b>N/A</b> (ein privater Schlüssel wird vom Plugin nie erzeugt oder gelesen)

# text
seg-dda21be14d64 = Tools: Karte Kommandozeile

# text
seg-03376576d0b6 = Python gibt den Schlüssel mit einer Warnung im Arbeitsspeicher zurück; ein privater Schlüssel sollte nicht durch ein Gespräch oder eine Seite laufen

# text
seg-cd21674be5d7 = Attach Timestamp

# text
# c1: openssl ts -verify
seg-6c0caa6e1be2 = Token als Bytes oder base64, aktualisiertes Paket im Arbeitsspeicher zurückgegeben; die Signatur der Stelle wird nicht geprüft (<c1/>)

# text
seg-907eedb51849 = <b>N/A</b> (siehe Hinweis)

# text
seg-f70892a9f007 = Sendet an eine Adresse (N/A oben)

# text
# c1: interference-map adsb|ais
seg-76bcb50897c6 = <c1/> (CSV)

# text
# c1: interference-map adsb
seg-79f851a94048 = <c1/> (Trace-Verzeichnis)

# text
seg-d2cc933b6894 = Liest ein Verzeichnis (N/A oben)

# text
seg-316b51d83726 = Netzwerkzugriff (N/A oben)

# text
seg-b611fd739914 = Liest ein Archivverzeichnis und schreibt Dateien; die Veröffentlichungsverzögerung wird auf dem veröffentlichenden Rechner durchgesetzt (N/A oben)

# text
seg-96b313373128 = N/A (das MCP-Werkzeug trägt es)

# text
seg-cb1fc7c162e3 = Text hinein, Text heraus; nichts wird gelesen oder geschrieben

# text
# c1: bench/site/
seg-5292a4966861 = die statische Seite <c1/>

# text
seg-839999463148 = HTML-Text

# text
seg-bb10d5a1eb50 = Datensatzdateien und ein geheimer Seed (N/A oben)

# text
seg-45bbda779645 = Gibt Text zurück, schreibt nichts; kein Signal

# text
seg-0e64b97b025b = <b>N/A</b> (Aufzeichnungen sind Dateien von Gigabytes; siehe Hinweis)

# text
# c1: --format sdrx[:ci16_le]
# c2: .sdrx
# c3: format: "sdrx"
seg-7c9273837b73 = Abtastwerte sind Dateien. <c1/> (oder ein Ausgabepfad, der auf <c2/> endet) schreibt ION-GNSS-SDR-Metadaten neben die Abtastwerte: Die CLI und MCP (<c3/>) schreiben sie; Python gibt die Abtastwerte im Arbeitsspeicher zurück und schreibt keine Datei, daher haben die Metadaten keine Python-Form (<b>N/A</b>)

# text
# c1: rows
# c2: tests
seg-4f1cc14c9af4 = Szenarien sind eingebettet; kein Dateisystem; <c1/> und <c2/> geben die eingecheckten Dokumenttabellen aus und sind nur in der CLI verfügbar

# text
seg-5de02dcfb151 = Symbolströme sind Text aus { "0" } und { "1" }, höchstens { "4" } MiB (MCP) oder { "100" } erzeugte Rahmen je Aufruf; LDPC und CRC-24Q der Unterrahmen { "2" } bis { "4" } werden nicht verifiziert; es wird kein Signal geschrieben

# text
seg-db29ea94222b = Abtastwerte sind Dateien

# text
# c1: iq_labfit
seg-9b7afa156e9a = <c1/> (Logs inline, keine Dateien)

# text
# c1: --follow [--idle-timeout <s>]
# c2: iq::io::follow::open_sigmf_follow
# c3: receiver-trust live
# c4: iq_monitor
seg-295fe0c63fe2 = <c1/> liest eine SigMF-Aufzeichnung, die noch geschrieben wird, nur empfangend (<c2/> in Rust): <b>N/A</b> für Python und MCP, weil ein Aufruf, der darauf wartet, dass eine Datei wächst, nicht zurückkehrt, wenn die Arbeit erledigt ist, aus dem Grund, aus dem auch <c3/> nur auf der Kommandozeile läuft; die Aufzeichnung in ihrer aktuellen Länge läuft durch <c4/>

# text
# c1: iq_test_conditions
seg-e651dceda9b2 = <c1/> (Text, inline)

# text
seg-237bb76fae50 = Die Inventarisierung eines Ordners ist Python und CLI; der MCP-Server liest ein Arbeitsverzeichnis

# text
seg-654781b74f2a = Sie schreiben Aufzeichnungen auf der Platte um (N/A oben)

# text
# c1: iq --help
seg-6a010403db35 = die Signalliste (<c1/>)

# text
# c1: kshana iq --help
seg-1154d82301ca = <b>N/A</b> (eine Liste; <c1/> ausführen)

# text
seg-8c90b8cb2e78 = Hilfsfunktionen

# text
seg-3d9ac26ec730 = Kleine Einstiegspunkte, die keine Fähigkeitenzeile sind, und wo jeder liegt:

# text
# c1: kshana.version()
# c2: kshana.__version__
# c3: version
# c4: --version
seg-b8c43ffb2a13 = Python (<c1/>, <c2/>), WASM (<c3/>), CLI (<c4/>), MCP (die Serverinformation)

# text
seg-3f32bbece220 = Die Engine-Version

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: iq_*
seg-d5fb77719df2 = Liest eine Binärdatei <c1/>, die <c2/> geschrieben hat. <b>N/A</b> anderswo: Sie liest eine Datei von der Platte (WASM hat kein Dateisystem, MCP liest nur ein Arbeitsverzeichnis über die Werkzeuge <c3/>)

# text
# c1: ?s=
seg-57ef8e3fe6bc = Der Codec <c1/> für Teilen-Links des Browser-Playgrounds (Szenario-TOML zu einem URL-sicheren Token und zurück). <b>N/A</b> anderswo: Ein Link auf eine Webseite hat für eine Kommandozeile, einen Python-Aufruf oder einen Agenten keine Bedeutung

# text
seg-bd6e451f5cdf = Grenzen, die sich je Oberfläche unterscheiden

# text
seg-8f3e8345d90d = Eingabegrenze

# text
seg-4b5abdf098e3 = Dateien

# text
seg-1910f2cef7da = { "4" } MiB je Texteingabe ({ "2" } MiB und { "20,000" } Epochen für einen Stromausschnitt); Antworten tragen höchstens { "2000" } NMEA-Zeilen, { "200" } Zeilen nicht nominaler Epochen und { "4" } MiB an GeoJSON- oder Paketdateien

# text
# c1: iq_*
seg-116e2d0202f4 = nur Inline-Inhalt: Ein Szenariofeld, das eine Datei benennt, wird zurückgewiesen; die Werkzeuge <c1/> verwenden ein einziges per Opt-in aktiviertes Arbeitsverzeichnis, auf das jeder Pfad beschränkt ist

# text
# c1: --http
seg-ee5e8de88144 = MCP über HTTP (<c1/>, selbst gehostet)

# text
seg-f095909e9feb = wie MCP, mit einem Anfragekörper von { "5" } MiB, { "120" } s je Anfrage und standardmäßig { "8" } gleichzeitigen Anfragen

# text
# c1: iq_*
seg-95d4ab7863e6 = keine: Die Dateiwerkzeuge <c1/> sind aus; jedes andere Werkzeug nimmt Inline-Inhalt entgegen

# text
seg-a8b290453c39 = Python, Rust

# text
seg-3df89722db78 = { "64" } MiB je Texteingabe

# text
# c1: receiver_trust
# c2: path
seg-00acf8b1ff29 = <c1/> darf einen <c2/> benennen, den der Prozess lesen kann

# text
seg-cf23db887749 = { "64" } MiB je Texteingabe, innerhalb des eigenen Speichers des Browsers

# text
seg-e38059970288 = keine: Der Browser hat kein Dateisystem, nichts wird hochgeladen

# text
seg-241399edb372 = Evidenzstufen und Vorbehalte auf jeder Oberfläche

# text
seg-b3307ae773f7 = Ein Nachweispaket ist eine <b>technische Aufzeichnung</b> dessen, was die Engine unter angegebenen Einstellungen aus einem Log berechnet hat, mit jedem Hash und einer Signatur darüber. Es ist kein Rechtsgutachten, keine Tatsachenfeststellung zu irgendeinem Ereignis und keine Zulassung. Ein bestandenes Verify besagt, dass die Aufzeichnung unverändert ist; ohne einen vertrauenswürdigen öffentlichen Schlüssel belegt es nur die Integrität gegenüber dem Schlüssel, den das Paket selbst benennt.

# text
seg-0d8ed8b92a00 = Die Monitore des Empfänger-Vertrauens und der Vertrauenswert sind <b>MODELLED</b>: Schwellen sind angegebene Eingaben, und nichts behauptet, wie sie sich gegen reale Störungen verhalten. Die Ausgabe ist <b>beratend</b>; Kshana ist keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }), und der Betreiber bleibt verantwortlich. Ein hoher Wert ist kein Beweis für eine echte Lösung.

# text
seg-606127880e96 = Die Störungskarte ist <b>MODELLED</b> (vorab registrierte Schwellen, nicht gegen eine Bodenwahrheitsmessung validiert). Eine herabgesetzte Zelle weist Störung nicht als Ursache aus; eine nicht beobachtete Zelle ist kein Beleg für eine freie Route; sie beschreibt vergangene Meldungen und ist keine Vorhersage. Sie ist nur aggregiert: Es wird keine Kennung zurückgegeben.

# text
seg-b2fd2a05842f = Trainings-NMEA ist <b>nur Text</b>: Es wird kein HF-Signal, kein IQ und keine Wellenform synthetisiert, nichts wird gesendet, und es ist nie für die Live-Navigationssysteme eines Schiffes bestimmt.

# text
seg-4e3bbacda9ac = <s1>Zurück</s1>Kshana aus einem Agenten verwenden

# text
seg-c5fbfab85e01 = <s1>Weiter</s1>JetBrains-Plugin

# text
seg-4f7453d89d9d = Geometrie MODELLED; JSON oder SVG als Ausgabe
