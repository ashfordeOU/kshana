# docs--mcp: translations (de)

# text
seg-261c059bec54 = Beratend, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt für die Navigation verantwortlich. Der Server läuft auf Ihrem Computer; es wird nichts an Ashforde OÜ gesendet.

# text
seg-13641146503d = Cursor (ein Klick)

# text
seg-3bd13fe295f4 = VS Code (ein Klick)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Vorkompilierte Binärdatei

# text
seg-d107bc8e1950 = MCP-Register

# text
seg-842b77a21c5f = Kanal

# text
seg-d6476863f862 = Fähigkeit

# text
seg-fdbb9db68f1d = keine

# text
seg-1759a8cce7d6 = Arten

# text
seg-564133d6a0c4 = Konstellationen um jeden Körper

# text
seg-b88a2a9497c2 = Werkzeug

# text
seg-a683980168f7 = Docker

# text
seg-f3a2279d6df7 = Befehl oder Schaltfläche

# text
seg-20c5ae650eb7 = Voraussetzung

# text
seg-af4d3ce85e11 = Festgelegte Form

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node oder Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ mit uv oder pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = Formel für v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/>, dann <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = Manifest für v{ $version }

# text
seg-f7c0a2fbb0b5 = winget

# text
seg-9e599ab3c0a3 = winget (Windows)

# text
seg-091d1404bb8a = cargo

# text
seg-145ddf98e77f = Rust { "1.88" }+

# text
# c1: kshana-mcp
# c2: kshana-mcp-<target>[.exe]
# c3: SHA256SUMS
# c4: gh attestation verify
seg-b308519d4c8d = <a1>die Release-Seite</a1>: <c1/> (Linux x86-64), <c2/>, geprüft mit <c3/> und <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (von registrierungsfähigen Clients gefunden)

# text
seg-b1a6e807f06f = ein registrierungsfähiger Client

# text
seg-d5a3818ac3b6 = Remote (Streamable HTTP)

# text
seg-5f1397b1ea30 = Ihr eigener Host

# text
# c1: mcp/kshana-mcp/README.md
seg-e7acd0ff4c84 = Quelle: <c1/>

# attr:alt
seg-81a87d14efda = Kshana: die Marke, ein Kompass-Fadenkreuz, das den genauen Augenblick markiert, neben dem Wortzeichen kshana

# text
seg-3d5232472e42 = kshana-mcp: Fragen Sie Ihren KI-Assistenten, und die Engine antwortet

# text
# c1: kshana-mcp
seg-ef90bf1e0b51 = <c1/> ist ein <a1>Model-Context-Protocol</a1>-Server (MCP) für <b>Kshana</b>, den quelloffenen Simulator für die Resilienz von PNT (Positionierung, Navigation und Zeitgebung). Er lässt einen KI-Assistenten (künstliche Intelligenz) die echte Engine ausführen und deren JSON (JavaScript Object Notation) zurücklesen, statt die Mathematik zu raten. Er spricht über stdio (Standardeingabe und -ausgabe) mit jedem MCP-kompatiblen Client, darunter Cursor und JetBrains AI Assistant / Junie.

# text
seg-1fddef4e9a49 = Die Mathematik, für die Kshana validiert ist, ist genau dort, wo ein Sprachmodell schlecht rät: SGP4 (Simplified General Perturbations { "4" }) Bahnpropagation, Bezugssysteme der IAU (Internationale Astronomische Union), Allan-Abweichungen, GNSS-Verfügbarkeit (Global Navigation Satellite System) und DOP (Dilution of Precision), ARAIM-Schutzgrenzen (advanced receiver autonomous integrity monitoring), GNSS- und INS-Fusion (inertial navigation system) und Quantensensor-Modelle. Stellen Sie eine Frage; der Assistent führt ein echtes Szenario aus und erhält Gütemaße mit ihrer Herkunft und ihrer Kennzeichnung VALIDATED oder MODELLED.

# attr:alt
seg-d51681f30e8f = Eine offene Engine in der Mitte, mit dem MCP-Server als einer ihrer Oberflächen neben der Befehlszeile, der Rust-Bibliothek, Python, WebAssembly und Kshana Studio, dem Docker-Image und dem JetBrains-Plugin; jede Oberfläche führt dieselbe Engine aus, und Kshana Pro hängt von ihr ab, ohne sie zu forken

# text
seg-2a56e1f52830 = Werkzeuge

# text
# c1: include_chart
seg-b847694d91b5 = Führt ein Szenario aus einer TOML-Definition (Tom's Obvious, Minimal Language) aus; gibt die Zusammenfassung + das vollständige Ergebnis-JSON zurück (JavaScript Object Notation: Gütemaße, Kurven). Optional gibt <c1/> das Diagramm als SVG (Scalable Vector Graphics) zurück.

# text
seg-3c00da00ec30 = Vorabprüfung: das TOML parsen und seine Art erkennen, ohne es auszuführen.

# text
# c1: name
# c2: kind
# c3: kind
seg-4516fd1e665c = Die mitgelieferten Referenzszenarien als JSON: jeweils <c1/>, ihre <c2/> und ein Satz dazu, was sie zeigen. Optionaler Filter <c3/>. Jedes Beispiel läuft so, wie es ist, daher ist dies der schnellste Weg zu einem gültigen TOML für eine Art.

# text
# c1: scenarios/
seg-61db4a94ad72 = Der TOML-Text eines mitgelieferten Referenzszenarios, Byte für Byte die Datei unter <c1/>.

# text
# c1: format
# c2: json
# c3: html
seg-306f7a835bb9 = Führt ein Szenario aus und gibt seinen Bericht zurück: Kurzfassung, Eingaben, jeder Wert mit seiner Einheit und seiner Kennzeichnung VALIDATED oder MODELLED, Ereignisse, die genutzten Fähigkeiten und ein Reproduzierbarkeitsprotokoll. <c1/> ist <c2/> (Standard) oder <c3/> (die druckbare Einzeldatei-Seite).

# text
# c1: svg
# c2: html
# c3: frames
seg-bdacef6d5133 = Führt ein Szenario aus und gibt seine Zeitreihen als Animation zurück: <c1/> (Standard), <c2/> (ein in sich geschlossener Player) oder <c3/> (höchstens { "120" } in einer Antwort). Das erste Inhaltselement ist eine JSON-Zusammenfassung dessen, was gezeichnet wurde; die Dateien folgen. Eine Art ohne abgetastete Zeitachse wird mit Angabe des Grundes abgelehnt.

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
seg-313f7594bd81 = Welche Interoperabilitätsformate für ein Szenario gelten (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), der Grund, wenn eines nicht gilt, und die Spezifikation, der jeder Writer folgt. Führt das Szenario nicht aus.

# text
# c1: .e
# c2: spectrum
# c3: [iq]
seg-e63b7853bb96 = Exportiert ein Szenario als CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-Ephemeride (Systems Tool Kit) <c1/> oder SigMF (Signal Metadata Format, für ein Szenario <c2/> mit einem Block <c3/>). Das erste Inhaltselement ist ein JSON-Index der Dateien (Suffix, Größe, Kodierung und der SHA-256-Digest, der 256-Bit-Secure-Hash-Algorithm); die Dateien folgen, die binäre SigMF-Sampledatei als Base64.

# text
# c1: LineString
# c2: terrain-nav
# c3: terrain-slam
# c4: gravity-map
# c5: combined-altpnt
seg-074e914789c5 = Schreibt eine GeoJSON-Route <c1/> in ein Szenario, das einer Wegpunktspur folgt (<c2/>, <c3/>, <c4/>, <c5/>), und gibt das neue TOML zurück.

# text
# c1: orbit
seg-ae58a8577aa7 = Exportiert die Konstellation eines Szenarios <c1/> als präzise SP3-c-Ephemeride (Standard Product { "3" }, Revision c).

# text
# c1: orbit
seg-6a59aacf26bb = Exportiert die Elemente eines Szenarios <c1/> als CCSDS-502.0-B-2-OMM-Katalog (Consultative Committee for Space Data Systems; Orbit Mean-elements Message).

# text
# c1: orbit
# c2: export_sp3
seg-5562b319968b = Exportiert die Zustandsreihe eines Szenarios <c1/> als CCSDS-OEM-Ephemeride (Orbit Ephemeris Message) { "2.0" } — die TEME-Positions- (true equator, mean equinox) <em>und</em> Geschwindigkeitsreihe, die Flugdynamik-Werkzeuge (GMAT, das General Mission Analysis Tool; Orekit; STK, das Systems Tool Kit) lesen; das geschwindigkeitstragende Gegenstück zum nur positionsbezogenen <c2/>.

# text
# c1: <scenario>.table.csv
# c2: realtime-frame-eop
# c3: lunar-time-budget
# c4: lunar-jamming
# c5: telecom-timing
# c6: leo-navmsg
# c7: encode-decode
# c8: kepler16
# c9: kepler-rac
# c10: moonlight-service-volume
# c11: export_site_lat_deg
# c12: export_site_lon_deg
seg-b0cf13e530b7 = Führt ein Szenario aus und gibt seine Reproduzierbarkeitstabelle als CSV (comma-separated values) zurück — die bytestabile Tabelle, die die CLI (Befehlszeilenschnittstelle) als <c1/> schreibt. Nur <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (seine Analyse <c7/> an einem Nachrichtenmodell <c8/> oder <c9/>) und <c10/> mit gesetztem <c11/> + <c12/> geben eine aus; jede andere Art liefert einen Fehler, der diese nennt.

# text
# c1: tle
# c2: epoch
# c3: skyline_preset
# c4: request
# c5: docs/SKYLINE.md
seg-ab242cd0259c = Himmelsgeometrie unter einer azimutabhängigen Skyline: von einem Standort, einer Zeit und Konstellations-Voreinstellungen, Two-Line-Element-Sätzen (<c1/>, per SGP4 auf eine UTC-<c2/> propagiert) oder Satelliten als Azimut/Elevation oder ECEF, die sichtbaren Satelliten und die von der Skyline verdeckten, GDOP/PDOP/HDOP/VDOP/TDOP aus dem durch gnss_lib_py geprüften DOP-Kernel, der Ost-Nord-Oben-Kofaktor und die Kovarianz (eine Uhr je System oder eine gemeinsame) und die horizontale Fehlerellipse; mit <c3/> statt <c4/> eine REPRESENTATIVE-Voreinstellung mit ihrer Herkunft und ihrem Schnitt jedes Grad. MODELLED; trägt den Hinweis; keine Monte-Carlo-Simulation über MCP. Siehe <a1><c5/></a1>.

# text
# c1: format
# c2: ubx
# c3: rinex
# c4: android
# c5: nmea
# c6: sbf
# c7: text
# c8: base64
# c9: [[events]]
# c10: [compare]
# c11: [platform] kind = "vessel"
# c12: text
# c13: base64
# c14: docs/RECEIVER-TRUST.md
seg-d6ed4e8d56e5 = Bewertet ein echtes GNSS-Empfänger-Log (Global Navigation Satellite System) auf Vertrauen. Das TOML nennt das <c1/> des Logs (<c2/>, <c3/>, <c4/>, <c5/> oder <c6/>) und gibt dessen Bytes inline als <c7/> oder <c8/> an; das Werkzeug führt die Vertrauensmonitore aus (Abfall der Träger-Rausch-Dichte, Verlust der Verriegelung, AGC (automatic gain control), Jamming-Indikator, Positionssprung und, mit RINEX plus Rundsende-Navigation, RAIM (receiver autonomous integrity monitoring) und ein uhrgestützter Monitor) und gibt zurück, wann und warum die Lösung aufhörte, vertrauenswürdig zu sein. Optionale Abschnitte <c9/> und <c10/> bewerten angegebene Ereignisse und vorhergesagte C/N0-Abfälle gegen angegebene Toleranzen. Eine Tabelle <c11/> wählt die maritimen Monitore aus und fügt je Epoche einen Vertrauenswert von 0-100 hinzu, mit den Monitoren, die abgezogen haben (beratend; MODELLED). Das Log kommt inline als <c12/> oder <c13/> (höchstens { "4" } MiB). Diagramm und CSV je Epoche auf Anfrage. Siehe <a1><c14/></a1>.

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: --listen
# c4: docs/MARITIME-TRUST.md
seg-d1a967a443ea = Bewertet einen begrenzten NMEA-{ "0183" }-Auszug (höchstens { "2" } MiB und { "20,000" } Epochen; er muss das Kalibrierungsfenster enthalten) so, wie <c1/> ihn bewertet: Vertrauenszustand und Wert von 0-100 je Epoche mit den Monitoren, die abgezogen haben, eine Zusammenfassung und das letzte <c2/>. Die begrenzte Form des Live-Befehls: Es wird kein Socket geöffnet und nichts auf einen Port geschrieben; das Gate, <c3/> und die Telemetrie-Exporter (Prometheus, OTLP, syslog) gibt es nur in der Befehlszeile. Nur beratend; MODELLED. Siehe <a1><c4/></a1>.

# text
seg-89e894d4b416 = Das NMEA-{ "0183" }-Log eines Schiffes (höchstens { "4" } MiB) als Batch-Lauf, mit dem Sitzungs-TOML, das die Grenzen des Schiffes angibt: das Wertmodell und der Wert von 0-100 jeder Epoche mit ihren Abzügen (die Antwort behält Zählungen nach Zustand und die ersten { "200" } Epochen mit degraded oder untrusted). Nur beratend; MODELLED.

# text
# c1: kshana jammertest import
# c2: docs/JAMMERTEST.md
seg-27698c80b7f1 = Liest den veröffentlichten Jammertest-Testkatalog und Sendeplan (NPRA/jammertest-plan, MIT) als geplante Wahrheit (<c1/>): Die Slots eines Testgebiets werden zu Empfängervertrauens-Ereignissen mit der Katalogkennung und dem Jahr in jeder Bezeichnung. Geplante Slots, keine aufgezeichneten Sendezeiten; kein Kontaktfeld des Plans wird gelesen. MODELLED. Siehe <a1><c2/></a1>.

# text
# c1: kshana jammertest score
# c2: log
# c3: ubx
# c4: sbf
# c5: log_base64
seg-23daf6121ca0 = Bewertet ein Empfänger-Log gegen diesen Zeitplan (<c1/>): je Test die Erkennungslatenz, verpasste Alarme und die Zeit bis zur Erholung sowie die Fehlalarme außerhalb jedes Slots. Textlogs als <c2/>, binäre (<c3/>, <c4/>) als <c5/>. Ein signiertes Paket braucht einen Schlüssel: Befehlszeile. Nur beratend; MODELLED.

# text
# c1: kshana receiver-trust evidence
# c2: docs/EVIDENCE-PACKS.md
seg-0ca5b319e850 = Ein signiertes Nachweispaket für ein Fenster des Logs eines Schiffes (<c1/>): die rohen Log-Bytes für das Fenster, Konfiguration, Ergebnisse und Gründe je Epoche, eine Zusammenfassungsseite und ein Manifest mit jedem SHA-256 und einer Hash-Kette, signiert mit Ed25519. Der Signatur-Seed wird nie zurückgegeben oder protokolliert; ohne einen wird ein Einmalschlüssel verwendet, sodass das Paket Integrität beweist, nicht Identität. Eine technische Aufzeichnung, keine Rechtsauskunft. Siehe <a1><c2/></a1>.

# text
# c1: .tsr
# c2: kshana evidence attach-timestamp
# c3: openssl ts -verify
seg-8df4c6fb851d = Bindet ein RFC-{ "3161" }-Zeitstempel-Token (Base64 der <c1/>-Bytes) im Speicher an ein Paket (<c2/>); das Paket mit dem Token muss weiterhin verifizieren. Die Signatur der Zeitstempelautorität wird nicht geprüft: Verwenden Sie <c3/>.

# text
# c1: kshana evidence verify
# c2: verdict
# c3: verified
# c4: intact-signer-not-pinned
# c5: failed
# c6: require_timestamp
seg-1f7a6f7f005a = Verifiziert ein Paket (<c1/>): jeden Hash, die Kette, die Signatur und, mit dem öffentlichen Schlüssel des Signierers und dem vollständigen Log, wer es signiert hat und dass der Ausschnitt aus diesem Log stammt. Nennt jeden Fehler und jede Datei. Das <c2/> ist <c3/> (Signierer festgelegt), <c4/> (alles stimmt, aber es wurde kein öffentlicher Schlüssel angegeben, sodass der Signierer nicht festgestellt ist) oder <c5/>; <c6/> lässt ein Paket ohne Zeitstempel-Token durchfallen.

# text
# c1: nmea-scenario
# c2: kshana-nmea-training/1
seg-c43761e01f63 = Synthetisches Brücken-NMEA { "0183" } für die Crew-Ausbildung aus einem TOML <c1/> (Jamming, Wegziehen der Position, Zeit-Spoofing, Replay-Verzögerung) mit dem Ausbilder-Log (<c2/>); deterministisch je Seed. Nur Text: Nichts wird auf HF- oder IQ-Ebene synthetisiert, und nichts wird gesendet; nie für die Live-Navigationssysteme eines Schiffes. Die Antwort trägt die ersten { "2000" } Zeilen.

# text
# c1: kshana-interference-map/v1
# c2: docs/INTERFERENCE-MAP.md
seg-8aec8f61dab2 = Eine GNSS-Störungskarte aus ADS-B- oder AIS-Positionsmeldungen als CSV-Text (höchstens { "4" } MiB): ein GeoJSON <c1/> je UTC-Tag, nur aggregiert (keine Kennungen, Zellen mit unter { "5" } verschiedenen Luftfahrzeugen oder Schiffen zurückgehalten), mit eingebetteter Lizenz des Datensatzes. Eine degraded-Zelle identifiziert Störung nicht als Ursache; keine Vorhersage. MODELLED. Siehe <a1><c2/></a1>.

# text
# c1: kshana bench-export
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: docs/TEST-BENCH.md
seg-d5959e4f1c96 = Die Fahrzeugbewegung und Ereignisse eines Szenarios für einen GNSS-Simulator im Labor (<c1/>): Bewegungs-CSV und -JSON, NMEA, Wegpunkte und Ereignisse als Text, nichts wird auf die Platte geschrieben. Arten <c2/>, <c3/>, <c4/>. Kein Signal: Nichts Exportiertes ist ein Hochfrequenz- oder Basisbandsignal, modelliert eines oder steuert eines; der Simulator und sein Betreiber liefern die Signale. Siehe <a1><c5/></a1>.

# text
# c1: kshana evidence round-trip
# c2: kshana.test-conditions/1
seg-1076916237f0 = Das signierte Labor-Rundlauf-Paket (<c1/>): das Szenario, das Dokument <a1><c2/></a1> des Labors, das Empfänger-Log und seine Bewertung gegen die angegebenen Ereignisse, per Hash verknüpft. Lehnt Bedingungen und Bewertungsereignisse ab, die einander widersprechen. Kein Signal; eine technische Aufzeichnung, keine Zertifizierung.

# text
# c1: kshana iq sweep
seg-9e1df2016cd7 = Spielt eine IQ-Aufzeichnung im Arbeitsverzeichnis über mehrere Tracking-Schleifen-Entwürfe ab (<c1/>): je Entwurf und PRN den eingeschwungenen Phasen- und Codejitter, Verriegelungsanteile und mittleres C/N0. Höchstens { "256" } Kanäle (Entwurf, PRN) je Aufruf; die Zeitspanne muss in das Sample-Budget passen.

# text
# c1: kshana iq monitor
seg-a5af1743f993 = Führt die Störungs- und Spoofing-Erkennungsmonitore über eine IQ-Aufzeichnung im Arbeitsverzeichnis aus (<c1/>): Breitband-Leistungs- und Spektralmonitore sowie C/N0- und Signalqualitätsmonitore je Satellit gegen eine gelernte Basislinie. Reihennamen und -längen und bis zu { "200" } Ereignisse in der Antwort; der ganze Bericht auf Anfrage als Dateien. Ein Ereignis sagt, dass eine gemessene Größe ihre Basislinie verlassen hat, nicht warum. MODELLED.

# text
# c1: kshana iq labfit
# c2: iq-labfit
# c3: text
# c4: base64
# c5: path
seg-c9c9c909c621 = Passt das Verlust-der-Verriegelung-Modell der Tracking-Schleife an Laborläufe an (<c1/>), aus einem Szenario <c2/>, dessen Logs inline vorliegen (<c3/> oder <c4/>; ein <c5/> wird abgelehnt). Liest und schreibt keine Datei. MODELLED.

# text
# c1: kshana.test-conditions/1
seg-4f231cd18d37 = Validiert eine als Text gegebene Datei <c1/> und gibt die aufgelösten Bedingungen mit ihrem Hash zurück. Nur inline.

# text
# c1: kshana compliance-report
# c2: runs
# c3: {label, result, scenario?}
# c4: statement
# c5: docs/compliance/
seg-2851f2858910 = Die Zuordnung zu öffentlichen Rahmenwerken, aus als Text gegebenen Ergebnisdokumenten befüllt (<c1/>): für welche Zeilen von sechs Resilienz-Rahmenwerken und -Standards (US DHS Resilient PNT framework v2.0, IMO ships, EASA aviation, NIS2 Article { "21" }, EN { "16803" }, NIST IR 8323r1) die Läufe Belege liefern, für welche nicht, und die Lücke jeder Zeile. Nimmt <c2/> von <c3/> (höchstens { "64" }, insgesamt { "4" } MiB). Ein Status besagt, dass die Läufe Belege für die Fähigkeiten der Zeile liefern; er ist keine Feststellung, dass ein Rahmenwerk erfüllt ist, und keine Bewertung oder Zulassung eines Produkts. Die <c4/> wird mit jedem Bericht zurückgegeben; zeigen Sie sie wörtlich. MODELLED. Siehe <a1><c5/></a1>.

# text
# c1: sources
seg-0a5161ddea94 = Die statischen Zuordnungstabellen (oder, mit <c1/>, die Quelldokumente, die sie zitieren, mit Versionen und URLs) als Markdown, angeführt von derselben Aussage. Braucht keine Läufe.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-ffcc6c72dc1e = Ein Vertrauensstrom (JSON-Zeilen) oder ein Ergebnis <c1/>, dargestellt als Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen, eine OTLP-JSON-Nutzlast oder Home-Assistant-MQTT-Discovery- und -Zustandszeilen, mit den Encodern <c2/>. Text in der Antwort: Nichts wird gesendet oder bereitgestellt, und keine Uhr wird gelesen. Nur beratend.

# text
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
# c4: kshana imu-fit
seg-2b82a8a22298 = Beschleunigungsmesser- und Gyroskop-Parameter der Szenarien <c1/> und <c2/>, aus einem Log einer ruhenden IMU (CSV oder EuRoC) per Allan-Abweichung angepasst, mit einer zum Einfügen fertigen Tabelle <c3/> und dem SHA-256 des Logs (<c4/>). Text hinein, JSON heraus; MODELLED.

# text
# c1: kshana standards-pack list
seg-30d5bb6b34cb = Die Standards-Pakete (<c1/>): bewertete Szenariosätze für die Testprofile des DHS Resilient PNT framework (Stufen { "1" } bis { "4" }), IMO MSC.1/Circ.1575 und ICAO Doc { "9849" } Appendix F.

# text
# c1: kshana standards-pack run
# c2: MET
# c3: NOT MET
# c4: NEEDS INPUT
# c5: compliance_report
seg-767a05e5df9f = Ein Paketlauf gegen seine vor dem Lauf angegebenen Zielwerte (<c1/>): jeder Test <c2/>, <c3/> oder <c4/>, mit gemessenen und erwarteten Werten; geben Sie den Bericht an <c5/>, um die Zeilen zu sehen. MODELLED; bewertet kein Produkt.

# text
# c1: spec
# c2: symbols
# c3: generate
seg-74110e6b530f = Das LunaNet Augmented Forward Signal, geprüft gegen LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" }. Januar { "2025" }): <c1/> (die Implementierung gegen die gedruckten Codetabellen und Rechenbeispiele des Dokuments), <c2/> (ein Symbolstrom: Sync-Muster, SB1, FID, TOI-Kontinuität) oder <c3/> (ein Teststrom). LDPC und CRC-24Q der Unterrahmen { "2" } bis { "4" } werden nicht verifiziert; es wird kein Signal geschrieben.

# text
# c1: kshana bench score
# c2: bench/SPEC.md
seg-b6abad1f2c9d = Eine Einreichung für kshana-bench, gegen eine Wahrheitsdatei bewertet, beide als JSON-Text (<c1/>, <c2/>): die Ergebnisdatei mit der Spezifikationsversion, Aufteilung, Eingabe-Hashes und den Kennzahlen der Aufgabe. MODELLED; beschreibt ein Log oder einen Korpus, nie ein Produkt.

# text
seg-c7a0d7981bfd = kshana-bench-Ergebnisdateien, als statische Bestenlisten-Seite (HTML-Text) dargestellt, jede zuvor validiert.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-1ec7117c7825 = Ein Vertrauensstrom (JSON-Zeilen) oder ein Ergebnis <c1/>, dargestellt als Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen oder eine OTLP-JSON-Nutzlast, mit den Encodern <c2/>. Text in der Antwort: Nichts wird gesendet oder bereitgestellt, und keine Uhr wird gelesen. Nur beratend.

# text
seg-0fc2e3928768 = Der Anteil der Länge einer Route in degraded-, nicht-degraded-, nicht bewerteten und nicht beobachteten Zellen einer oder mehrerer Störungskarten, optional innerhalb eines Datumsbereichs. Unbeobachtete Zellen sind kein Beleg für eine freie Route.

# text
seg-62756ba18cf5 = Die Einrichtung der GNSS-IQ-Schicht: die Signalnamen, die die IQ-Werkzeuge akzeptieren, ob die IQ-Dateiwerkzeuge aktiv sind, das Arbeitsverzeichnis und das Sample-Budget je Aufruf. Rufen Sie es zuerst auf.

# text
# c1: kshana iq info
seg-98939638409f = Beschreibt eine IQ-Aufzeichnung (In-Phase und Quadratur) im Arbeitsverzeichnis, ohne sie zu verarbeiten: Format, Abtastrate, Mittenfrequenz, Samples, Dauer, Datendateien und Größen (<c1/>).

# text
# c1: kshana iq scene
seg-c529b1a7ee53 = Erzeugt eine GNSS-IQ-Szene mit mehreren Satelliten im Arbeitsverzeichnis (<c1/>): angegebene Doppler/C/N0-Profile oder echte Rundsende-Ephemeriden-Geometrie aus einer RINEX-Navigationsdatei, mit einem optionalen Ausbreitungskanal auf Signalebene. Antwortet mit den geschriebenen Dateien und ihren Byte-Zahlen und der ersten Epoche der Wahrheit je Satellit.

# text
# c1: kshana iq acquire
# c2: surface_out
seg-0c6f5e26367f = FFT-Erfassung (schnelle Fourier-Transformation) eines oder mehrerer PRNs (Pseudozufallsrauschen-Codes) über eine Aufzeichnung (<c1/>), optional hinter Front-End-Stufen: je PRN erfasst oder nicht, Doppler, Codephase, Spitzenstatistik und Schwellenwert; <c2/> (ein PRN) behält die gesamte Korrelationsfläche aus Doppler × Codephase mit Fein-Doppler-Verfeinerungen.

# text
# c1: kshana iq track
# c2: kshana.loop-design/1
# c3: design
# c4: reacquire
# c5: epochs_out
# c6: events_out
seg-1da73ad326de = Erfassen, dann mit der DLL/PLL/FLL-Bank (delay-, phase- und frequency-locked loop) verfolgen (<c1/>), mit den Schleifen aus einer TOML-Datei <c2/> im Arbeitsverzeichnis (<c3/>) oder dem eingebauten Entwurf und optionaler Wiedererfassung (<c4/>): je Kanal Epochen, finaler Doppler, finales und mittleres C/N0, Phasen- und Code-Verriegelungsanteile, am Ende verriegelt, der finale Verriegelungszustand, Falschverriegelungen und Wiedererfassungen, dazu Name und Hash des Entwurfs. Das Tracking streamt in begrenztem Speicher; die Ausgabe je Epoche geht nur in Dateien (<c5/>: E/P/L, Diskriminatoren, Schleifenzustände, C/N0, Verriegelungszustand als .csv/.jsonl/.bin; <c6/>).

# text
# c1: kshana iq frontend
seg-262bb9c592c0 = Wendet Empfänger-Front-End- und Störminderungs-DSP (digitale Signalverarbeitung: Bandpass, Notch, Blanking, Excision, AGC, Quantisierer) auf eine Aufzeichnung an und schreibt eine neue (<c1/>).

# text
# c1: kshana iq campaign
# c2: max_cells
seg-cf33e101b144 = Führt eine Laborwiedergabe-Kampagne aus (<c1/>): Aufzeichnungen, jeweils mit einer Testbedingungsdatei, die die bekannte Wahrheit des Labors angibt, × Front-End-Ketten × Schleifenentwürfe. Jede Zelle wird bewertet nach Zeit bis zum Verlust der Verriegelung, Wiedererfassungszeit, C/N0-Verschlechterung gegenüber dem angegebenen J/S (neben einer analytischen Referenz, gekennzeichnet MODELLED), Falschverriegelungsrate, PLL/DLL-Jitter und Verfügbarkeit. Inkrementell und fortsetzbar: Jeder Aufruf führt die ausstehenden Zellen aus, die in das Sample-Budget passen (oder <c2/>).

# text
seg-8112428c6226 = Der Fortschritt eines Kampagnen-Ausgabeordners: erledigte und ausstehende Zellen und der Digest, sobald vollständig. Liest nur Dateien.

# text
# c1: kshana
seg-8bd76f017ae4 = Jedes Werkzeug ist ein dünner, getreuer Wrapper um eine öffentliche Funktion der Bibliothek <c1/> — hier lebt keine neue Simulationslogik, sodass ein Agent genau die validierte Engine ausführt.

# text
seg-b37bbaf38900 = Die GNSS-IQ-Werkzeuge: Dateien hinein, kompaktes JSON heraus

# text
# c1: iq_*
seg-ecf2ec0eb66d = IQ-Aufzeichnungen reichen bis in Gigabyte, daher leiten die Werkzeuge <c1/> Samples nie durch das Protokoll. Sie folgen einem Vertrag:

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: overwrite: true
seg-31a173dfe40d = <b>Ein Arbeitsverzeichnis.</b> Der Server liest und schreibt IQ-Dateien nur innerhalb des Ordners, den <c1/> nennt. Jedes Pfadargument ist relativ dazu (ein absoluter Pfad muss innerhalb davon auflösen); Eingaben werden vor der Prüfung über Symlinks aufgelöst, der Ordner einer Ausgabe muss darin bereits existieren, und eine vorhandene Ausgabe wird nur mit <c2/> ersetzt. Ist es nicht gesetzt, sind die IQ-Dateiwerkzeuge aus und sagen, wie man sie aktiviert; jedes andere Werkzeug ist unberührt.

# text
# c1: KSHANA_MCP_IQ_MAX_SAMPLES
# c2: cf32_le
# c3: ci16_le
# c4: ci8
# c5: cf32_le
# c6: format
# c7: max_seconds
seg-4f734b84a91a = <b>Ein Sample-Budget.</b> Ein Aufruf erzeugt oder verarbeitet höchstens <c1/> komplexe Samples (Standard { "50 000 000" }). In Bytes sind das { "400" } MB als <c2/> ({ "8" } Bytes je komplexem Sample), { "200" } MB als <c3/> ({ "4" } Bytes) und { "100" } MB als <c4/> ({ "2" } Bytes); eine Szene wird als <c5/> geschrieben, sofern <c6/> nichts anderes sagt. Die Prüfung läuft vor jeder Arbeit, und die Ablehnung nennt die Dauer oder <c7/>, die passt.

# text
# c1: json_out
# c2: csv_out
seg-178284ddfee0 = <b>Kompakte Antworten.</b> Jedes Werkzeug antwortet mit einer JSON-Zusammenfassung: Erfassungsspitzen, C/N0, Verriegelungszustand und jede geschriebene Datei mit Pfad und Byte-Zahl. Tabellen je Epoche gehen in die Dateien <c1/> / <c2/>, die Sie benennen.

# text
seg-f375643798e9 = <b>Unbekannte Argumente werden abgelehnt</b>, nicht ignoriert, sodass eine falsch geschriebene Option ein Fehler ist.

# text
# c1: kshana iq
# c2: spectrum
seg-41040247770d = Jedes Werkzeug läuft über denselben Codepfad wie <c1/> in der Befehlszeile, im selben Prozess. Die Schicht ist reine Software: Sie schreibt Dateien für Software-Empfänger und steuert keine Funkhardware. Die IQ-Schicht fügt keine Störungs- oder Spoofer-Synthese hinzu, und nichts wird je gesendet. (Die separate Szenarioart <c2/> kann analytische Störsender-IQ-Schnappschüsse in eine Datei schreiben.)

# text
# c1: docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp
seg-f02d2f6bac7c = Mit dem Docker-Image binden Sie den Ordner ein und lassen die Variable darauf zeigen: <c1/>.

# text
seg-721079aa25e7 = Jede Art ist erreichbar

# text
# c1: run_scenario
# c2: kind
# c3: list_scenario_kinds
seg-116ada4f4498 = <c1/> verteilt nach der <c2/> des Szenarios, sodass jede Art, die <c3/> nennt, darüber läuft. Das schließt die neueren Familien ein, jeweils mit mitgelieferten Beispielen, die ein Agent abrufen kann:

# text
seg-c7047f5750a9 = Ein Beispiel als Ausgangspunkt

# text
seg-b45752760eca = Das Sonnensystem

# text
seg-1ccf38ab6e24 = Kampagnen: verkettete Phasen, Sweeps, Monte Carlo (gesetzte zufällige Ensembles), Komposition

# text
seg-67fe14962e1c = Navigation im niedrigen Erdorbit (LEO): Signalentwurf

# text
seg-c555e5b73203 = LEO-Navigation: Link-Budget je Überflug

# text
seg-67de12cac6f0 = LEO-Navigation: Navigationsnachricht

# text
seg-b8badd962245 = LEO-Navigation: fusionierte Positionierung und Zeitgebung

# text
# c1: list_example_scenarios
# c2: kind
# c3: animate_scenario
# c4: report_scenario
# c5: export_interop
seg-0561cfd970d8 = <c1/> mit einer <c2/> nennt jedes mitgelieferte Beispiel dieser Art. Animationen, Berichte und Interoperabilitäts-Exporte sind keine Arten: Sie sind Ansichten eines Laufs, und <c3/>, <c4/> und <c5/> liefern sie für jedes Szenario, auf das sie zutreffen.

# text
# c1: kshana --study <suite.toml>
# c2: run_scenario
seg-62d106ca4a89 = Nicht bereitgestellt: Studiensuiten (<c1/>), weil eine Suite benachbarte Szenariodateien auf der Platte benennt und die Szenariowerkzeuge keine Datei lesen. Führen Sie jedes Mitglied mit <c2/> aus. (Die IQ-Werkzeuge lesen und schreiben Dateien, nur innerhalb ihres Arbeitsverzeichnisses.)

# text
seg-57f592bb676b = Den MCP-Server installieren

# text
seg-77fc92e21295 = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier weggelassen; sie steht in <a1>mcp/kshana-mcp/README.md</a1> auf GitHub.

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-9ec78559983f = <c1/>, selbst gehostet: siehe <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

# text
seg-b32b9d4e0f8b = Aus einem Checkout oder git (Entwicklung):

# text
seg-73a73af88f08 = HTTP-Modus (selbst gehostet)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
# c2: /mcp
# c3: --allow-remote
# c4: KSHANA_MCP_HTTP_TOKEN
seg-4f248ed3e597 = <c1/> stellt dieselben Werkzeuge über Streamable HTTP unter <c2/> bereit. Es bindet nur an Loopback; eine Nicht-Loopback-Adresse braucht <c3/> und ein Bearer-Token in <c4/>; die IQ-Dateiwerkzeuge sind aus; Anfragegröße, Zeit und Nebenläufigkeit sind begrenzt; es wird kein CORS-Header gesendet. Kshana hostet keinen Endpunkt: Sie hosten ihn selbst. Siehe <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: cargo install
# c2: kshana-mcp
# c3: PATH
# c4: ~/.cargo/bin/kshana-mcp
# c5: rmcp
# c6: kshana
seg-60f55b197ac2 = <c1/> legt <c2/> in Ihren <c3/> (typischerweise <c4/>). Der Server spricht JSON-RPC (JSON remote procedure call) über stdio; Logs gehen nach stderr. Das Bauen aus dem Quelltext braucht eine Rust-Toolchain ≥ { "1.88" } (das gepatchte SDK <c5/> { "2" }.x braucht sie; die Bibliothek <c6/> selbst braucht nur { "1.85" }); das Docker-Image braucht keine.

# text
seg-2f3216082425 = Bei einem Client registrieren

# text
# c1: mcpServers
# c2: kshana-mcp
seg-1090ae3f689c = Praktisch jeder MCP-Client verwendet denselben Konfigurationsblock <c1/> — registrieren Sie die Binärdatei <c2/> über den absoluten Pfad:

# text
# c1: PATH
seg-2da393482666 = Oder, mit dem Docker-Image statt einer lokalen Binärdatei (kein <c1/> nötig):

# text
seg-a4f1295bb27a = Wo dieser Block liegt, hängt vom Client ab:

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-154c7e09063d = <b>Cursor</b> — <c1/> (global) oder <c2/> (je Projekt).

# text
seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, den Block einfügen, dann die IDE (integrierte Entwicklungsumgebung) vollständig neu starten.

# text
# c1: …_config.json
# c2: mcpServers
seg-daf0ea451b11 = <b>Desktop-Assistenten</b> — die meisten verwenden eine <c1/> mit derselben Form <c2/>; prüfen Sie die Dokumentation Ihres Clients für den Speicherort der Datei.

# text
# c1: mcp add
# c2: mcp.json
seg-fc80286aa9bf = <b>CLI-Agenten</b> — viele akzeptieren dasselbe JSON über einen Mechanismus <c1/> / <c2/>.

# text
# c1: RUST_LOG=debug
# c2: env
seg-9f3ef8d76e05 = Verwenden Sie immer einen absoluten Pfad zur Binärdatei. Setzen Sie <c1/> in <c2/>, um Probleme zu untersuchen (Diagnosen gehen nach stderr; stdout ist dem JSON-RPC-Protokoll vorbehalten).

# text
seg-283d1eba838a = Ausprobieren

# text
seg-61739e9b6515 = Sobald registriert, fragen Sie Ihren Assistenten Dinge wie:

# text
# c1: list_scenario_kinds
seg-256276ac933d = <em>"Liste die Szenarioarten von Kshana auf."</em> → <c1/>

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: run_scenario
seg-2a8e3c76b939 = <em>"Zeige mir ein Kshana-Beispiel für spectrum und führe es aus."</em> → <c1/>, <c2/>, <c3/>

# text
# c1: run_scenario
seg-d2e1e4148589 = <em>"Führe das Kshana-Szenario für Uhren-Holdover mit einem Schwellenwert von { "20" } ns und einem GNSS-Ausfall von 2 Stunden aus; wie groß ist das Holdover von Quantenuhr gegenüber klassischer Uhr?"</em> → <c1/>

# text
# c1: export_sp3
seg-f4b83873e280 = <em>"Exportiere diese GPS-Konstellation (Global Positioning System) als SP3."</em> → <c1/>

# text
# c1: export_table_csv
seg-54e01c1af45f = <em>"Gib mir die Tabelle realtime-frame-eop als CSV."</em> → <c1/>

# text
# c1: list_export_formats
# c2: export_interop
seg-478e6fa0e8d8 = <em>"Zeige diesen Iridium-Überflug auf einem Cesium-Globus."</em> → <c1/>, <c2/>

# text
# c1: animate_scenario
seg-90829388d5d9 = <em>"Animiere die Jamming-Kampagne."</em> → <c1/>

# text
# c1: report_scenario
seg-9eb1b97ad2fd = <em>"Gib mir den Bericht zu diesem Lauf, mit seinem Reproduzierbarkeitsprotokoll."</em> → <c1/>

# text
# c1: iq_signals
# c2: iq_scene
# c3: iq_acquire
# c4: iq_track
seg-dc60d64a3bb8 = <em>"Erzeuge eine GPS-L1-Szene von einer Sekunde mit den PRNs { "3" } und { "17" }, dann erfasse und verfolge sie."</em> → <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-942dc8abe0ec = Entwurfsnotiz — warum ein eigenes Crate

# text
# c1: Cargo.lock
# c2: rmcp
# c3: kshana
# c4: rmcp
# c5: rmcp
# c6: cargo deny
# c7: xval/anise-frames
seg-ce6d0ecab448 = Der Server ist ein <b>eigenständiges, vom Workspace ausgeschlossenes Crate</b> mit eigener <c1/>, sodass das offizielle Rust-MCP-SDK (Software Development Kit) <c2/> und seine asynchrone Laufzeit nie in den Abhängigkeitsgraphen des veröffentlichten Crates <c3/> gelangen: Ein Bibliotheks- oder Python-Nutzer kompiliert keinen Server, den er nicht betreibt. (Es wurde zuerst abgetrennt, weil <c4/> <b>Edition { "2024" }</b> ist und rustc ≥ { "1.85" } braucht, während das Haupt-Crate damals { "1.75" } zusagte. Die Bibliothek erklärt jetzt { "1.85" }; dieser Server erklärt { "1.88" }, die Untergrenze des sicherheitsgepatchten <c5/> { "2" }.x.) Die kontinuierliche Integration (CI) sichert dieses Crate für sich allein ab — Tests und <c6/> gegen seine Lockfile. Der Lizenzbaum von rmcp ist unbedenklich (Apache-2.0/MIT/BSD), sodass die Abtrennung, anders als beim Kreuzvalidierungs-Crate <c7/>, dem es sonst gleicht, keine Frage der Lizenzierung ist.

# text
seg-75bf2d74642d = Lizenz: AGPL-3.0-only, die GNU Affero General Public License Version { "3" } ausschließlich (oder eine kommerzielle Lizenz von Ashforde OÜ; siehe <a1>LICENSING.md</a1> des Repositorys).

# text
seg-490ebbefb561 = <s1>Zurück</s1>Rust-Crate

# text
seg-350b6b914734 = <s1>Weiter</s1>MCP-Server: jeder Installationskanal

seg-492888115662 = Die { "92" } eingebauten Szenarioarten mit Beschreibungen + Pflicht- und optionalen Feldern, damit der Agent ein gültiges Szenario aufbauen kann.
