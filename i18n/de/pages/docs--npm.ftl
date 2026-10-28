# docs--npm: translations (de)

# text
seg-d4a762001549 = Lizenz

# text
seg-3d770dd786e4 = Verwendung

# attr:alt
seg-81a87d14efda = Kshana: die Marke, ein Kompass-Fadenkreuz, das den genauen Augenblick markiert, neben dem Wortzeichen kshana

# text
# c1: README.npm.md
seg-0ddcab84868f = Quelle: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>der präzise Augenblick</em></b><br/> Ein quelloffener Simulator für die Resilienz von PNT (Positionierung, Navigation und Zeitgebung).

# text
seg-3b861b2f08b8 = Version v{ $version }

# text
seg-6a1906d8d4ad = Etwa { "95" } % Zeilenabdeckung, in der kontinuierlichen Integration mit { "85" } % als Schwelle

# text
seg-a9f4f2795fb5 = Lizenz: AGPL-3.0-only oder eine kommerzielle Lizenz

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Proben Sie die Minute, in der GNSS ausfällt: die Missionskonsole von Kshana, gezeichnet aus einem echten Lauf der Engine, einer verketteten Kampagne aus jamming, spoofing, holdover und Integrität über die { "102" } Satelliten von GPS, Galileo, BeiDou und GLONASS

# text
seg-d1153c5e9112 = Proben Sie die Minute, in der GNSS ausfällt

# text
seg-d284448743af = Kshana spielt jamming, spoofing und Uhren-holdover ab, wenn GNSS-Signale (Global Navigation Satellite System) ausfallen, und sagt Ihnen, wie lange ein System Zeit und Position innerhalb seines Budgets hält und welche Uhr oder welcher Sensor den größten Spielraum bringt. Dies ist das WebAssembly-Paket: die gesamte Engine in JavaScript, im Browser oder in Node.js. Jeder Lauf ist aus dem Szenario, dem Seed und der Version der Engine bitgenau reproduzierbar.

# text
seg-d1a3f78ad8e0 = Probieren Sie es zuerst aus, ohne etwas zu installieren: <a1>Kshana Studio</a1> führt die gesamte Engine in Ihrem Browser aus, zu WebAssembly kompiliert, und lädt nichts hoch.

# text
seg-d662055d817f = Das Paket ist ein ES-Modul (ECMAScript, Standard-JavaScript) mit einer WebAssembly-Nutzlast, für den Browser gebaut. Initialisieren Sie es einmal und rufen Sie die Engine dann synchron auf. Der einzige Unterschied zwischen dem Browser und Node.js besteht darin, wie die WebAssembly-Binärdatei geladen wird.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>Im Browser</b> (über einen Bundler oder eine Seite, die <c1/> ausliefert) holt <c2/> <c3/> von neben dem Modul:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>In Node.js</b> scheitert <c1/> mit <c2/> (das <c3/> von Node kann keine lokale Datei lesen), also lesen Sie die Binärdatei von der Festplatte und übergeben sie an <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Speichern Sie die Node.js-Version als <c1/>-Datei (oder setzen Sie <c2/> in Ihrer <c3/>), damit <c4/> funktioniert. Von da an sind beide gleich:

# text
# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = TypeScript sieht typisierte Ergebnisse: <c1/> gibt ein <c2/> zurück (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> ein <c9/>, dessen <c10/> die Union <c11/> jeder Art ist, und <c12/> ein <c13/> (oder <c14/> bei Erfolg). Die eigenen Felder jedes Ergebnisdokuments variieren je nach Art; <c15/> typisiert den gemeinsamen Umschlag (<c16/>, <c17/> und den Block <c18/> aus <c19/>s).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Vier weitere Funktionen beschreiben die Engine für ein Frontend. <c1/> gibt ein JSON-Objekt von Art zu den Modulen zurück, die ihre Zeilen der Verifikationsmatrix nennen, <c2/> eines von Art zu den Ergebnisfeldern, die ihre Frage beantworten (Anzeige-Metadaten; die Engine liest sie nie), <c3/> die Signalnamen, die <c4/> akzeptiert, und <c5/> eine kurze synthetische IQ-Szene, im Speicher erfasst und verfolgt (höchstens { "0.25" } s, { "1,000,000" } Abtastwerte und { "8" } Satelliten), mit derselben Antwort wie der native Build.

# text
# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = Auf der WebAssembly-Seite ist jeder Einstiegspunkt ein eigener Aufruf: <c1/> (das Ergebnisdokument als JSON-Zeichenkette), <c2/>, <c3/>, <c4/> (die CSV-Tabelle (kommagetrennte Werte) des Szenarios als Zeichenkette oder <c5/> für Arten, die keine Tabelle veröffentlichen; bei einem ungültigen Szenario wirft er eine Ausnahme), <c6/> (ein Lauf der Engine, der <c7/> als JSON-Zeichenkette zurückgibt — verwenden Sie ihn, wenn Sie mehr als eine Ausgabe wollen, da jeder andere Aufruf das Szenario neu ausführt), <c8/> (dieselben Ausgaben als ein typisiertes Objekt, mit dem bereits als <c9/> geparsten Dokument), <c10/>, <c11/> / <c12/> / <c13/> (Introspektion; <c14/> gibt die geparste Liste zurück), <c15/> / <c16/> — der Codec für teilbare Links (URL, Uniform Resource Locator), mit dem <a1>Kshana Studio</a1> ein ganzes Szenario durch das Fragment der Adressleiste hin und zurück führt — und <c17/> / <c18/> / <c19/>, die Ephemeridenartefakte SP3-c (Revision c des Formats Standard Product { "3" }) und CCSDS (Consultative Committee for Space Data Systems) — OMM, die Orbit Mean-elements Message, und OEM, die Orbit Ephemeris Message —, die das CLI schreibt — und <c20/>, das ein reales Empfängerlog bewertet, das durch ein Szenario <c21/> beschrieben wird, und <c22/> als JSON-Zeichenkette zurückgibt (der Browser hat kein Dateisystem, daher müssen das Log und jede Navigationsdatei als <c23/> oder <c24/> inline im Szenario stehen; eine Tabelle <c25/> fügt die maritimen Monitore und den Vertrauenswert von 0-100 hinzu, nur beratend), <c26/> / <c27/> (welche Interoperabilitätsformate ein Szenario unterstützt, ohne es auszuführen, und ein Export im Speicher: <c28/>, <c29/>, <c30/>, <c31/> oder <c32/> als JSON <c33/>, byteidentisch für dasselbe Szenario, nichts wird hochgeladen), <c34/> (eine GeoJSON-Route, in ein Szenario mit Wegpunktspur geschrieben, das <c35/> der Kommandozeile), <c36/> (die Zeitreihen des Laufs als animiertes SVG, einen einzelnen HTML-Player oder SVG-Frames), <c37/> / <c38/> (die mitgelieferten Referenzszenarien und ihre TOML), <c39/> (ein Token nach RFC { "3161" } im Speicher an ein Nachweispaket binden; das Paket muss weiterhin verifizieren, und die Signatur der Zeitstempelautorität wird nicht geprüft), <c40/> (welche Galileo-Navigationsdaten welcher Satelliten eine I/NAV-Seitendatei oder ein UBX-Strom authentifiziert, mit dem vertrauenswürdigen Merkle-Root oder öffentlichen Schlüsseln und einer optionalen unabhängigen Referenzzeit; er authentifiziert Daten und macht keine Aussage über die Leistung gegen spoofing; nichts wird hochgeladen), <c41/> (ein begrenzter NMEA-Ausschnitt, so bewertet, wie der Live-Modus bewertet; kein Gate), <c42/> (das NMEA-Log eines Schiffes als Stapellauf), <c43/> (ein Vertrauensstrom oder -ergebnis als Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen oder eine OTLP-Nutzlast; nichts wird gesendet), <c44/> (ein signiertes Nachweispaket prüfen; nichts wird hochgeladen; Pakete werden mit dem CLI, Python oder MCP erstellt), <c45/> (die Bewegung und die Ereignisse eines Szenarios als Text für einen Laborsimulator; es wird kein Signal geschrieben), <c46/> und <c47/> (für welche Anforderungszeilen öffentlicher Rahmenwerke Ergebnisdokumente Belege liefern, mit der Lücke jeder Zeile; kein Befund, dass ein Rahmenwerk erreicht ist) und <c48/> (ADS-B- oder AIS-CSV-Text zu einem GeoJSON <c49/> je UTC-Tag; nur aggregiert), <c50/> (der Anteil einer Route durch beeinträchtigte Zellen dieser Karten; keine Prognose), <c51/> (synthetisches Brücken-NMEA und ein Ausbilderlog für das Training von Besatzungen; nur Text, niemals für die laufenden Navigationssysteme eines Schiffes) und die Funktionen zur Himmelsgeometrie <c52/>, <c53/>, <c54/>, <c55/> und <c56/> (welche Satelliten ein Standort sieht, wenn Gebäude, Kaimauern oder Gelände einen Teil des Himmels verdecken, mit der Dilution of Precision, der horizontalen Fehlerellipse, einer Monte-Carlo-Wolke mit Seed und einem Skyplot als SVG-Text; die Sichtbarkeitsentscheidung und die Ellipse werden gegen unabhängige Bibliotheken geprüft, die Presets sind repräsentative Geometrien und keine Vermessungen, und eine Skyline entfernt Satelliten in Sichtlinie und nichts weiter). Nicht im Browser-Build: <c57/> mit seinem Gate und TCP-Listener, gestreamtes Training-NMEA und die Telemetrie-Exporter (Prometheus, OpenTelemetry, Syslog) sind lang laufende Netzwerkprozesse und bleiben im Kommandozeilenwerkzeug; das Erstellen eines Nachweispakets braucht einen Signierschlüssel, der zum CLI oder zu Python gehört. Hier gibt es kein <c58/> mit einem Aufruf; diese Anbindung existiert nur im Python-Wheel.

# text
seg-12a295fba8a5 = Jede Fähigkeit in der Verifikationsmatrix ist als <b>validiert</b> (gegen eine unabhängige externe Referenz geprüft), <b>modelliert</b> oder <b>vom Partner verantwortet</b> gekennzeichnet; Angaben zu optischen Uhren sind Weltraumziele auf Bodenhardware (noch keine optische Strontium-Uhr ist geflogen). Die Reife ist über die Bereiche hinweg <em>nicht</em> einheitlich: Erd-PNT ist gegen reale Daten validiert; die Navigation im tiefen Weltraum und zum Mars ist modelliert, wobei nur ihre Bausteine (Lichtlaufzeit, Planetenpositionen) gegen externe unabhängige Referenzen validiert sind; die Bahnbestimmung (OD, orbit determination) für reale Missionen im tiefen Weltraum steht auf der Roadmap.

# text
seg-68ed88ec0b32 = <b>Spektrum</b>: wie ein Jammer das GNSS-L-Band belegt, Band für Band.

# text
seg-f04a0aeeee33 = <b>Uhren und Zeitgebung</b>: Holdover gegen einen Schwellenwert, Zeitübertragung und Telekom-Holdover gegen die Masken des Standardisierungssektors der Internationalen Fernmeldeunion (ITU-T).

# text
seg-7e38ac603ef2 = <b>Konstellationen um jeden Körper</b>: Abdeckung, Dilution of Precision und Verfügbarkeit um die Erde, den Mond oder den Mars sowie das Sonnensystem zu einer Epoche.

# text
seg-82708b06dcc6 = <b>Navigation im niedrigen Erdorbit</b>: Signal, Überflug und Verbindung, Navigationsnachricht und eine fusionierte Lösung, Stufe für Stufe.

# text
seg-e21e9bb02d00 = <b>Kampagnen</b>: eine verkettete Mission, ein Sweep oder ein Monte-Carlo-Ensemble in einem Szenario.

# text
seg-ba5057da54e4 = <b>Berichte, Animation und Exporte</b>: jede Größe mit ihrer Einheit und Beschriftung; eine animierte Darstellung eines Laufs; SP3 (Standard Product { "3" }), CCSDS-Bahnnachrichten (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) und SigMF (Signal Metadata Format) als Dateien.

# attr:alt
seg-6b43a8c3031e = Eine offene Engine in der Mitte, kshana { $version }, mit einem typisierten Dispatch über { "75" } Typen; um sie herum die Kommandozeile, die Rust-Bibliothek, Python, WebAssembly und Kshana Studio, der MCP-Server, das Docker-Image und das JetBrains-Plugin; darunter Kshana Pro, ein proprietäres Overlay, das von der offenen Engine abhängt und sie nie forkt

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = Dieselbe Szenariodatei liefert auf jeder Oberfläche dieselben Bytes. MCP ist das Model Context Protocol: <a1><c1/></a1> lässt einen KI-Assistenten (künstliche Intelligenz) die Engine ausführen.

# text
seg-f51b0a8cd30e = Sechs Arbeiten auf arXiv bauen auf der offenen Engine auf, jeweils mit dem zugehörigen Befehl: <a1>arXiv:{ "2606.22054" }</a1> (die Optimismuslücke von Störungsdetektoren), <a2>arXiv:{ "2606.24210" }</a2> (ein bedingtes Schutzniveau für die Zeitgebung), <a3>arXiv:{ "2607.05415" }</a3> (wie stabil ein PNT-Resilienzwert ist), <a4>arXiv:{ "2607.02566" }</a4> (Beobachtbarkeit von Mondoberflächenstationen mit Very-Long-Baseline-Interferometrie), <a5>arXiv:{ "2607.06212" }</a5> (Geometrie am Mond-Südpol und Oberflächenbaken) und <a6>arXiv:{ "2610.23871" }</a6> (cislunare Navigation als Beobachtbarkeitsproblem: Bogenlänge, Gramian-Konditionierung und der Doppler-Hebel). Siehe <a7>Forschung</a7>.

# text
seg-dad7832bf2d2 = Die gesamte Engine ist unter der AGPL-3.0 frei. Kshana Pro, ein proprietäres Overlay, das von der offenen Engine abhängt und sie nie forkt, sowie individuelle Studien sind per Vertrag von Ashforde® OÜ erhältlich: <a1>contact@ashforde.org</a1>. Es gibt keine Preise; siehe <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Mehr erfahren

# text
seg-0e8320f8ea91 = <b>Die vollständige README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (die Engine in Ihrem Browser, als WebAssembly) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Fähigkeiten</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validierung und Herkunft</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Verifikationsmatrix</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Zitieren</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Frei und quelloffen unter der <b>GNU AGPL-3.0-only</b> (der GNU Affero General Public License, nur Version { "3" }). Eine <b>kommerzielle Lizenz</b> ist für geschlossene Integration von <a1>Ashforde® OÜ</a1> (einer estnischen Gesellschaft mit beschränkter Haftung; OÜ = osaühing) erhältlich; siehe <a2>LICENSING.md</a2>. Professionell entwickelt und gepflegt von Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Zurück</s1>Python-API

# text
seg-8af548581ae9 = <s1>Weiter</s1>Rust-Crate

seg-c9a297cc51e9 = { "176" } von { "401" } Fähigkeiten gegen unabhängige externe Referenzen validiert

seg-7b53ee712a36 = <b>{ "176" } von { "401" }</b> Fähigkeiten gegen unabhängige externe Referenzen validiert; { "221" } ehrlich als modelliert gekennzeichnet, { "4" } im Besitz von Partnern. Jede Fähigkeit trägt in einem maschinengeprüften Register genau eine Kennzeichnung: VALIDATED (eine unabhängige externe Referenz stimmt überein: reale Daten, eine unabhängige Implementierung oder veröffentlichte Referenzvektoren), MODELLED (in sich konsistent, und das wird offen gesagt) oder PARTNER (ein Hardware-Partner besitzt sie). Zu den Prüfungen gehören: alle { "666" } SGP4-Vektoren (Simplified General Perturbations { "4" }) von AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 bis auf { "4.12" } mm und das Cowell-Kraftmodell bis auf { "0.08" } m gegen Orekit { "12.2" }.

seg-b59781ecf257 = Wie eine Fähigkeit ihre Kennzeichnung erwirbt: Fähigkeit, unabhängige Referenz, Test, Registerkennzeichnung. Der Verifikationsstatus über alle { "401" } Fähigkeiten: { "176" } validiert, { "221" } modelliert, { "4" } im Besitz von Partnern

seg-d0b2811a3d3c = Die Engine hat { "92" } Szenarioarten; <c1/> listet sie mit ihren Feldern auf. Neu in { "0.38.0" }: <c2/> (GNSS-Signale für Raumfahrzeuge oberhalb, um und jenseits der GNSS-Umlaufbahnen) und <c3/> (Mondumlaufbahn und Mondoberfläche als Navigations- und Geodäsie-Infrastruktur), beide MODELLED, und <c4/> (eine Zeitfehleraufzeichnung gegen die ITU-T-Masken).
