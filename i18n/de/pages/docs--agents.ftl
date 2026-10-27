# docs--agents: translations (de)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Quelle: <c1/>

# text
seg-d0e198572cfe = Kshana aus einem KI-Agenten nutzen

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Für einen Agenten (oder die Person, die ihn anleitet): welches Werkzeug für welche Frage aufzurufen ist, was die Werkzeuge tun und nicht tun und was bei jeder Antwort mitzuführen ist. Oberflächen und die Zellen, die auf einer bestimmten Oberfläche nicht verfügbar sind: <a1><c1/></a1>.

# text
seg-a0354cacda4c = Verbinden

# text
seg-337d23a873f5 = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier ausgelassen; sie steht in <a1>docs/AGENTS.md</a1> auf GitHub.

# text
seg-01a862ed86e6 = Die Regel für jede Antwort

# text
seg-0adf5e5ad79a = Führen Sie die Engine aus; raten Sie die Zahlen nicht. Geben Sie wieder, was ein Werkzeug zurückgab, mit seiner Einheit und seiner Evidenzstufe (VALIDATED gegen eine unabhängige externe Referenz, oder MODELLED), dem Szenario, dem Seed und der Engine-Version, damit der Lauf wiederholt werden kann. Behalten Sie die eigenen Vorbehalte jedes Ergebnisses bei ihm.

# text
seg-f67845b891c5 = Welches Werkzeug für welche Frage

# text
seg-6f4bb4962340 = Die Frage

# text
seg-8efda304925b = Werkzeug (MCP)

# text
seg-83d609ff5cc7 = Slash-Befehl

# text
seg-9b937d3cbf88 = Ein PNT-Szenario ausführen oder erklären (Orbits, GNSS, Zeitgebung, Fusion, Mond, optische Verbindungen, ...)

# text
seg-ba8b3824bba2 = War dieses Empfängerprotokoll oder das NMEA dieses Schiffes vertrauenswürdig, und wann hörte es auf, es zu sein?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (jedes Protokollformat), <c2/> (NMEA eines Schiffes, Stapellauf), <c3/> (begrenzter Ausschnitt)

# text
seg-aa194fda4300 = Ich brauche synthetisches NMEA mit einem jamming-, Drag-off-, Zeit-spoofing- oder Replay-Ereignis für die Ausbildung

# text
seg-0211b49536df = Den Vertrauenswert eines Schiffes in Monitoring- oder SIEM-Formaten zeigen (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Ein Empfängerprotokoll gegen den veröffentlichten Jammertest-Zeitplan bewerten (Erkennungslatenz, verpasste Alarme, Fehlalarme, Zeit bis zur Erholung) oder diesen Plan in Ereignisse umwandeln

# text
seg-d1c81008d5f8 = Einen manipulationssicheren Nachweis darüber erstellen, was die Engine zu einem Zeitfenster des Protokolls eines Schiffes gesagt hat, oder einen prüfen

# text
seg-b7892674ac60 = Für welche Galileo-Satelliten authentifiziert dieser Empfängerdatenstrom die Navigationsdaten (OSNMA)?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>keines: nicht auf MCP.</b> Verwenden Sie <c1/> (CLI), <c2/> (Python) oder <c3/> (WASM, die OSNMA-Karte im Studio)

# text
seg-4fc021a0a145 = kein Slash-Befehl

# text
seg-0f5db62071e9 = Ich brauche die Fahrzeugbewegung und die Ereigniszeiten eines Szenarios, um sie über einen GNSS-Simulator im Labor abzuspielen

# text
seg-919946a95002 = Für welche Anforderungszeilen öffentlicher Rahmenwerke liefern diese Läufe Belege, und wie groß ist die Lücke?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (aus Ergebnistext), <c2/> (die Tabellen, keine Läufe)

# text
seg-ff6556a46025 = Ein bewertetes Normenpaket (DHS-RPCF-Testprofile, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Anhang F) gegen Zielwerte ausführen, die vor dem Lauf festgelegt wurden?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (den Bericht für die Zeilen an <c3/> übergeben)

# text
seg-1745cce01677 = Das LunaNet Augmented Forward Signal (Codes, SB1, Rahmenformat) gegen LNIS V5 / LSIS-AFS V1.0 prüfen oder einen Symbolstrom prüfen?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols oder generate); LDPC und CRC-24Q der Subframes { "2" } bis { "4" } sind nicht verifiziert

# text
seg-86c207c3996e = Einen Laborlauf (Szenario, angegebene Testbedingungen, Empfängerprotokoll, Bewertung) in einem signierten Paket verknüpfen?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> nach <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = Eine Erkennungs- oder holdover-Einreichung gegen eine kshana-bench-Wahrheitsdatei bewerten oder Ergebnisdateien als Bestenlistenseite darstellen?

# text
seg-87e686c064ce = Ich brauche ein Szenario, das eine GeoJSON-Route abfliegt (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = Welche Satelliten sieht ein Nutzer in einer Straße, einem Hafen, einem Fjord oder einem Containerterminal, und wie groß sind DOP und Fehlerellipse?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (eine Anfrage oder ein <c2/>); der Abschnitt <c3/> eines Szenarios über <c4/> (<c5/> und <c6/> brauchen <c7/>)

# text
seg-bd7f9d7e8e27 = Wo sah GNSS gestört aus, und wie viel dieser Route liegt darin?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, dann <c2/>

# text
seg-1f715d5e0c4f = GNSS-IQ-Aufzeichnungen (Szene, Akquisition, Verfolgung, Front-End, Kampagnen)

# text
# c1: iq_signals
# c2: iq_*
seg-5569efd18c6b = zuerst <c1/>, dann die <c2/>-Werkzeuge

# text
# c1: vessel-receiver-trust
# c2: training-nmea-scenario
# c3: trust-telemetry
# c4: compliance-mapping
# c5: test-bench-export
# c6: gnss-iq
# c7: interference-map-route-exposure
seg-d44650438742 = Die Skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> und <c7/> tragen die folgenden Regeln für Agenten, die Skills laden.

# text
seg-a4de5a40b743 = Was jedes Werkzeug nicht tut

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Dateien lesen oder schreiben.</b> Der Inhalt ist inline: Eingaben sind Text in der Anfrage, auf { "4" } MiB begrenzt, und ein Szenariofeld, das eine Datei benennt, wird abgelehnt. Nur die <c1/>-Werkzeuge berühren einen Ordner, und zwar nur den, den <c2/> benennt, wobei jeder Pfad darauf beschränkt ist.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>OSNMA verifizieren.</b> Es gibt kein MCP-Werkzeug: Die Eingabe ist ein langer roher Empfängerdatenstrom (I/NAV-Seiten oder eine UBX-Aufzeichnung), was zur CLI und zu Python passt, und ein Werkzeug, das einen solchen annähme, würde eine große Eingabefläche ohne Nutzen hinzufügen. Verweisen Sie den Benutzer auf <c1/> (oder Python <c2/>). Was auch immer seine Ausgabe sagt, geben Sie den Hinweis wörtlich weiter: nur Authentifizierungsstatus, kein Navigationsintegritätsdienst, keine typzugelassene Navigationsausrüstung und keine Aussage zur spoofing-Abwehrleistung; ein Ergebnis ist nur mit einer Merkle-Wurzel oder einem öffentlichen Schlüssel aussagekräftig, den der Benutzer auf anderem Weg erhalten hat.

# text
seg-b13a75d08152 = Einen Prozess ausführen.

# text
# c1: receiver-trust live
# c2: --listen
# c3: trust-telemetry
# c4: assess_vessel_stream
# c5: advisory
# c6: geometry
# c7: class
# c8: #
# c9: --udp
# c10: --listen tcp:
seg-9dfcbee6fdb8 = <c1/> als laufender Datenstrom (mit einem Gate und <c2/>), die Telemetrie-Exporter (<c3/>: Prometheus, syslog, OTLP) und das Streamen von Trainings-NMEA an eine Adresse gibt es nur auf der Befehlszeile. <c4/> bewertet einen Ausschnitt mit derselben Engine und schreibt an keinen Port. Die Ausschnittswerkzeuge geben das Live-JSON-Lines-Schema { "1.3" } zurück (eine <c5/>-Aussage und die Satelliten-<c6/> in jeder Epoche, eine <c7/> bei jedem Abzug); die CSV eines Schiffslaufs beginnt mit einer <c8/>-Kommentarzeile, die dieselbe Aussage trägt, lesen Sie sie also mit einer Kommentaroption. <c9/> und <c10/> binden an die Loopback-Adresse, sofern nichts anderes vorgegeben ist.

# text
seg-ac51aad84893 = Ein Signal schreiben.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> gibt Fahrzeugbewegung und benannte Ereignisintervalle als Text zurück; nichts davon ist ein Hochfrequenz- oder Basisbandsignal, modelliert eines oder steuert eines, und ein Ereignis ist keine Anleitung zur Erzeugung von Störungen. Geben Sie seinen <c2/> mit den Dateien weiter; der Simulator und sein Betreiber sind dafür verantwortlich, sie nur dort auszuführen, wo es erlaubt ist.

# text
seg-39f3aae1143a = Mehr sagen, als die Zuordnung sagt.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> gibt an, für welche Rahmenwerkzeilen eine Reihe von Läufen Belege liefert, mit der Lücke jeder Zeile. Es sagt nie, dass ein Rahmenwerk erfüllt ist oder ein Produkt bewertet oder genehmigt wurde; geben Sie seine <c2/> wörtlich weiter und sagen Sie „liefert Belege für“, nichts Stärkeres. Es liest Ergebnis- und Szenariotext, den Sie übergeben, nie einen Pfad.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Daten abrufen.</b> Der Download der Landpolygone gibt es nur auf der Befehlszeile, und er braucht <c1/>. Übergeben Sie die Landdatei, falls gewünscht, als Text. Verwenden Sie nur Daten, die der Benutzer nutzen darf.

# text
seg-d513f734248e = <b>Irgendetwas senden oder HF synthetisieren.</b> Der Trainingsgenerator schreibt NMEA-Text; die IQ-Schicht schreibt Abtastdateien für Software-Empfänger.

# text
seg-63eb4c5b4a17 = Was bei der Antwort mitzuführen ist

# attr:aria-label, text
seg-6555ff9a6d8e = Ausgabe

# text
seg-a056a59fb678 = Mitführen

# text
seg-c01c0fedd895 = Satellitengeometrie und Abzugsklassen ({ "0.36" })

# text
# c1: geometry
# c2: environment
# c3: inconsistency
# c4: unknown
seg-3723ec5a3f8c = Geben Sie die Geometrie neben der Bewertung und die Klasse jedes Abzugs so wieder, wie sie zurückgegeben wurden: <c1/> bedeutet den Himmel (eine Aussage über den Himmel, kein Befund, dass kein Angriff stattfand), <c2/> die Signalumgebung, <c3/> angriffsartige Belege. Sagen Sie „Geometrie unbekannt“, wenn der Status <c4/> ist (kein GSV oder GSA im Protokoll); leiten Sie keine ab. Die Schwellen sind <b>MODELLED</b> mit angegebener Herkunft.

# text
seg-0938dfb71d72 = Vertrauenswert des Empfängers

# text
seg-8e3a7376cd6b = <b>Beratend</b>: keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }); der Betreiber bleibt verantwortlich. <b>MODELLED</b>. Geben Sie die Grenzen des Schiffes vor dem Lauf an und stimmen Sie keine Schwelle auf ein Ergebnis ab. Ein hoher Wert ist kein Beweis für eine echte Positionslösung; die Prüfungen können einen Spoofer nicht sehen, der mit jedem anderen Sensor konsistent ist.

# text
seg-ae3f0548e93f = Nachweispaket

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = Ein <b>technischer Nachweis</b>, kein Rechtsgutachten, keine Tatsachenfeststellung und keine Genehmigung. Verifizieren Sie mit dem öffentlichen Schlüssel des Unterzeichners, den Sie auf anderem Weg erhalten haben; ohne ihn lautet das Urteil <c1/>, was nur die Integrität gegen den Schlüssel belegt, den das Paket selbst nennt: Sagen Sie „unversehrt, Unterzeichner nicht festgestellt“, nie „verifiziert“. Geben Sie in einer Unterhaltung nie einen Signatur-Seed zurück, protokollieren oder erfragen Sie ihn nicht, wenn der Schlüssel zählt: Verwenden Sie die CLI.

# text
seg-512e5ee42c1e = Trainings-NMEA

# text
seg-c59a76aefff5 = <b>Nur Text</b>, für Ausbildung und Test, <b>nie</b> für die Live-Navigationssysteme eines Schiffes. Geben Sie den Seed und das Ausbilderprotokoll zurück.

# text
seg-14781c19be62 = Störungskarte, Routenexposition

# text
seg-7135c6f44d49 = Wie die Genauigkeitscodes gelesen werden und die Raster- und Routengeometrie sind gegen unabhängige Bibliotheken an synthetischen Eingaben <b>VALIDATED</b>; die Schwellen der Methode bleiben <b>MODELLED</b>, und dass eine gestörte Zelle Störung ist, wird <b>nicht</b> geprüft: Eine gestörte Zelle benennt Störung <b>nicht</b> als Ursache. Eine nicht beobachtete Zelle ist <b>kein</b> Beleg für eine freie Route. Vergangene Meldungen, <b>keine Prognose</b>. Nur aggregiert: Versuchen Sie nicht, Kennungen wiederherzustellen. ADS-B- und AIS-Karten bleiben getrennt.

# text
seg-e47db9be47ea = Himmelsgeometrie, Horizontlinie

# text
# c1: advisory
seg-839eb485b1d2 = <b>MODELLED</b>-Geometrie unter einem angegebenen Fehlermodell, nur Sichtverbindung: keine Beugung, Mehrwegeausbreitung oder Nicht-Sichtverbindungs-Empfang. Die Vorgaben sind <b>REPRESENTATIVE</b>, keine Vermessungen; geben Sie die Herkunft der Vorgabe mit. Konstellationsvorgaben sind ein repräsentativer Himmel, nicht der Himmel eines bestimmten Datums. Die Ellipse skaliert ein angegebenes UERE: keine gemessene Genauigkeit und keine Integritätsschranke. Behalten Sie den <c1/> bei.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Verfügbarkeit optischer Verbindungen (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, beratend. Die Wolkenklimate sind angegebene Eingaben, kein Datensatz, und es wurde kein gemessener Verfügbarkeitsnachweis verglichen: Sagen Sie „unter diesen Annahmen“, nie „die Verfügbarkeit an diesem Standort“. Behalten Sie die <b>Obergrenze</b> des Standorts (<c1/>: was keine Reserve anhebt) neben seiner Verfügbarkeit bei und sagen Sie, welche Technikgewinne Eingaben sind (Kshana modelliert keine adaptive Optikschleife). Die Numerik ist gegen ein unabhängiges Programm geprüft, das die Implementierung der Formeln prüft und nicht die Atmosphäre.

# text
# c1: holdover-test
seg-3324b2e2021e = Holdover-Test (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, beratend. Sagen Sie „gegen die Maske gemessen“, nie, dass eine Uhr oder ein System eine Empfehlung erfüllt oder gegen sie zugelassen ist. Die zwei Zeiten (GNSS entfernt, GNSS wiederhergestellt) sind die <b>Aussage des Betreibers</b>: Kshana hat nichts entfernt oder wiederhergestellt und kann sie nicht prüfen, zitieren Sie sie also wie angegeben. Eine Maske, für die der Nachweis zu kurz ist, ist <b>INCOMPLETE</b>, nie bestanden. Ein Servoprotokoll (linuxptp, chrony) ist der Fehler unter Servoregelung, keine unabhängige Messung gegen UTC; sagen Sie, aus welchem Nachweis die Zahlen stammen. Siehe <c1/>.

# text
seg-18d3f2b50d0a = Jedes Szenarioergebnis

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = Das <c1/> oder <c2/>, das es angibt, und die Herkunftszeile.

# text
seg-166f773b2804 = Grenzen

# text
seg-203a91deb52c = Verwenden Sie synthetische oder die eigenen Daten des Benutzers. Nennen Sie in Ausgaben keine Personen, Schiffe oder Organisationen, die nicht in der Eingabe des Benutzers standen. Kshana ist ein Analyse- und Ausbildungswerkzeug, kein Flug- oder Navigationsprodukt.

# text
seg-ec064f62f7dc = <s1>Zurück</s1>MCP-Server: selbst gehosteter HTTP-Modus

# text
seg-1f44dbd65ce3 = <s1>Weiter</s1>Wo jede Fähigkeit erreichbar ist
