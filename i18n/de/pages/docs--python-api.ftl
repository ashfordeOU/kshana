# docs--python-api: translations (de)

# text
seg-5ad814c7ef9e = Hinweise

# text
seg-2bd2101ce454 = Oberfläche

# text
seg-fffbeccd4266 = Symbol

# text
seg-a129b9e613d0 = Typ

# text
# c1: docs/PYTHON_API.md
seg-ce0b6a889a87 = Quelle: <c1/>

# text
# c1: abi3
# c2: kshana.pyi
# c3: py.typed
# c4: mypy
# c5: pyright
seg-aea4d3625c20 = Kshana liefert eine erstklassige Python-Programmierschnittstelle (API, application programming interface), gebaut mit <a1>PyO3</a1> und <a2>maturin</a2>. Ihre <c1/>-Wheels werden gegen die stabile Python-Binärschnittstelle (ABI, application binary interface) gebaut, sodass ein Wheel je Plattform über CPython ≥ { "3.9" } hinweg funktioniert; die Wheels decken Linux, macOS und Windows ab, jeweils auf x86-64 und 64-Bit-ARM (siehe <a3>WHEEL_TAGS.md</a3>). Ein mitgeliefertes Typ-Stub (<c2/> + <c3/>) gibt Editoren und <c4/>/<c5/> vollständige Typinformationen.

# text
seg-8b0ad6639bd5 = Schnellstart

# text
# c1: scenarios/
# c2: pip install numpy
seg-28e092a5a781 = Führen Sie diese Snippets aus dem Wurzelverzeichnis eines Repository-Checkouts aus: Sie lesen Szenariodateien unter <c1/>. Die NumPy-Zeile braucht <c2/>.

# text
seg-8c83544270b5 = Signatur

# text
seg-fa90b5cd182b = Rückgabe

# text
# c1: .json
# c2: .svg
# c3: .summary
# c4: .csv
# c5: .data()
# c6: .array()
# c7: .columns()
# c8: .series()
# c9: .write_csv()
seg-6f62744a47df = typisiertes Ergebnis (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

# text
seg-67cd4e7f6ad0 = Ergebnisdokument als JSON-String (JavaScript Object Notation)

# text
seg-8246b2be7aaf = verfügbare Szenarioarten + Metadaten (geparst)

# text
# c1: scenario_kinds
seg-b5ad97d3ec18 = dieselben Metadaten als EIN JSON-Array-String, keine Liste (für bestehende Aufrufer beibehalten; verwenden Sie <c1/> für die geparste Liste)

# text
seg-8ce669f8e1d0 = Fehlermeldungen (leer, wenn gültig)

# text
# c1: invalid_input
# c2: non_convergence
# c3: unsupported
# c4: io_error
# c5: None
seg-6017d21f52dd = Tag der Fehlerkategorie (<c1/>, <c2/>, <c3/> oder <c4/>), oder <c5/> bei Erfolg

# text
seg-c62c5ab99132 = Engine-Version

# text
# c1: receiver-trust
# c2: [platform] kind = "vessel"
seg-fdaaf33250d1 = ein reales Empfänger-Log bewerten, das durch ein Szenario <c1/> beschrieben wird: Ergebnisdokument, CSV mit Vertrauenswert je Epoche, Diagramm und Zusammenfassung; eine Tabelle <c2/> fügt die maritimen Monitore und den Vertrauenswert von 0 bis 100 mit Gründen hinzu (beratend)

# text
seg-0fb76af3d043 = ein begrenzter NMEA-Auszug, so bewertet, wie der Live-Modus bewertet: Zustand je Epoche, Wert von 0 bis 100 und Gründe, eine Zusammenfassung (kein Socket, kein Gate; beratend)

# text
seg-6ecd9bb3a1cd = das NMEA-Log eines Schiffes als Batch-Lauf: das Bewertungsmodell und der Wert jeder Epoche mit ihren Abzügen (beratend)

# text
# c1: events_toml
# c2: events
seg-7cd62f15bc3c = der veröffentlichte Jammertest-Katalog und -Plan als Ereignisse der geplanten Wahrheit (<c1/>, <c2/>); geplante Slots, keine aufgezeichneten Sendezeiten

# text
seg-1e2faf2894e3 = ein Empfänger-Log, bewertet gegen diesen Zeitplan: Latenz je Test, verpasst, Zeit bis zur Erholung, Fehlalarme (MODELLED; ein signiertes Paket braucht die Kommandozeile)

# text
# c1: files
# c2: public_key
# c3: seed_hex
seg-f94eaef45f04 = ein signiertes Nachweispaket für ein Fenster des Logs, im Speicher: <c1/>, <c2/>, <c3/> (privat halten); eine technische Aufzeichnung, keine Rechtsauffassung

# text
# c1: verdict
# c2: verified
# c3: intact-signer-not-pinned
# c4: failed
seg-ebd10aea2f6f = ein Paket verifizieren: Hashes, Kette, Signatur, optional den vertrauenswürdigen Unterzeichner, das vollständige Log und einen Zeitstempel; <c1/> ist <c2/>, <c3/> (kein öffentlicher Schlüssel angegeben: intakt, Unterzeichner nicht festgestellt) oder <c4/>

# text
# c1: --export-sp3/-omm/-oem
seg-bf13e70f1d5c = die Artefakte <c1/> der CLI als Text

# text
seg-1e5eb44bec6f = welche Interoperabilitätsformate für ein Szenario gelten, ohne es auszuführen

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
# c6: {format, spec_url, files}
# c7: {suffix, bytes, sha256, encoding, content}
# c8: utf-8
# c9: base64
seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> oder <c5/> im Speicher: <c6/>, jede Datei <c7/> (<c8/>-Text oder <c9/>)

# text
# c1: --import-route
seg-bef8250e8453 = eine in ein Wegpunktkurs-Szenario geschriebene GeoJSON-Route (<c1/>)

# text
# c1: {summary, files}
seg-e25bcb6342db = die Zeitreihe des Laufs als animiertes SVG, HTML-Player oder bis zu { "120" } SVG-Bilder: <c1/>

# text
seg-9b24b9cf0510 = die mitgelieferten Referenzszenarien und ihr TOML

# text
# c1: {files, notes}
seg-f62c11fe1e7d = ein RFC-{ "3161" }-Token (Bytes oder Base64) im Speicher an ein Paket binden: <c1/>; das Paket muss weiterhin verifizieren; die Signatur der Autorität wird nicht geprüft

# text
# c1: seed_hex
# c2: public_key
# c3: fingerprint
# c4: warning
seg-95fe54b500a7 = ein neuer Signaturschlüssel im Speicher: <c1/> (PRIVAT), <c2/>, <c3/>, <c4/>; nur Python

# text
# c1: iq sweep
seg-646e6aba13db = eine Aufzeichnung über mehrere Schleifenentwürfe abspielen (<c1/>): je Entwurf und PRN Jitter im eingeschwungenen Zustand, Lock-Anteile und C/N0; eine Akquisition je PRN, jeder Kanal auf denselben Samples

# text
# c1: hash
seg-08d46de5e7cd = eine Aufzeichnung oder jede Aufzeichnung in einem Ordner beschreiben (liest Dateien; <c1/> liest sie vollständig)

# text
# c1: {files: {suffix: text}, notes, notice}
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: notice
seg-7d9cc8394e65 = die Fahrzeugbewegung und die Ereignisse eines Szenarios für einen GNSS-Laborsimulator, im Speicher: <c1/>; Arten <c2/>, <c3/>, <c4/>; es wird kein Signal geschrieben, behalten Sie <c5/> bei den Dateien

# text
# c1: runs
# c2: {label, result, scenario?}
# c3: {report, markdown}
# c4: status
# c5: report["statement"]
seg-e215c7242eb2 = die Zuordnung zum öffentlichen Rahmenwerk, ausgefüllt aus Ergebnistexten: <c1/> ist eine Liste von <c2/>-Dicts (Text, höchstens { "64" }); gibt <c3/> zurück; der <c4/> jeder Zeile besagt, dass die Läufe Belege für ihre Fähigkeiten liefern, nicht dass ein Rahmenwerk erfüllt ist; führen Sie <c5/> bei jeder Anzeige mit

# text
seg-18d57e4920dd = die statischen Zuordnungstabellen (oder die Quelldokumente) als Markdown, angeführt von der Aussage

# text
seg-8284e10dce6a = die Standards-Packs (ID, Titel, Rahmenwerk, Testanzahlen) und ein Hinweis; ein Pack misst modellierte Szenarien an vor dem Lauf festgelegten Zielwerten

# text
# c1: MET
# c2: NOT MET
# c3: NEEDS INPUT
# c4: markdown
# c5: ValueError
seg-ce6b819604a9 = ein Pack-Lauf: jeder Test <c1/>, <c2/> oder <c3/> mit gemessenen und erwarteten Werten, plus der Bericht als Markdown unter <c4/>; löst <c5/> bei einer unbekannten ID aus

# text
seg-0f701bc523c6 = die LunaNet-AFS-Implementierung, geprüft gegen die gedruckten Tabellen und durchgerechneten Beispiele von LSIS-AFS V1.0 (Zielwerte B1 bis B10; B4 meldet eine festgehaltene Verfehlung)

# text
seg-82aecf261c46 = ein AFS-Symbolstrom (Text aus { "0" } und { "1" }), geprüft auf Synchronisationsmuster, SB1-Dekodierung, FID, TOI-Kontinuität und -Abstand; LDPC und CRC-24Q der Unterrahmen { "2" } bis { "4" } sind nicht verifiziert

# text
seg-f72ab45ae10b = ein Test-Symbolstrom mit Platzhalter-Unterrahmen (keine Wellenform)

# text
# c1: docs/spec/TEST-CONDITIONS.md
# c2: evidence_create
seg-1da34527bb64 = das signierte Labor-Round-Trip-Paket, das Szenario, Testbedingungen (<c1/>), Empfänger-Log und Bewertung per Hash verknüpft; als <c2/>

# text
seg-dd3726fec672 = eine Ergebnisdatei von kshana-bench (JSON-Text) aus einer Wahrheitsdatei und einer Vorhersagedatei; MODELLED

# text
seg-b82a110c324c = Ergebnisdateien von kshana-bench, dargestellt als statische Bestenlisten-Seite (HTML)

# text
# c1: kshana osnma verify --json
# c2: advisory
seg-58b8aa919eaf = Galileo-OSNMA-Authentifizierung von I/NAV-Seiten oder eines UBX-Streams im Speicher: das Dict, das <c1/> ausgibt, mit dem Hinweis in seinem Feld <c2/>; nur beratend, kein Dienst für Navigationsintegrität

# text
# c1: visible
# c2: masked
# c3: request
# c4: site
# c5: time_s
# c6: systems
# c7: tle
# c8: satellites
# c9: mask_deg
# c10: skyline
# c11: clock
# c12: sigma_uere_m
# c13: confidence
# c14: sky_source
# c15: sky_statement
seg-15e4601cd88c = die Satelliten, die ein Standort unter einer azimutabhängigen Horizontlinie sieht: je Satellit <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, der Ost-Nord-Oben-Kofaktor und die Kovarianz sowie die horizontalen Fehlerellipsen; <c3/> ist JSON- oder TOML-Text oder ein Dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); die Sichtbarkeitsentscheidung und die Ellipse sind gegen unabhängige Bibliotheken geprüft, der Rest ist MODELLED, und das Ergebnis trägt den Hinweis (<c14/>, <c15/> sagen, ob der Himmel repräsentativ ist oder aus Elementesätzen stammt)

# text
# c1: n
# c2: request
seg-51ac7cd68154 = <c1/> ({ "1" } bis { "5000" }) Kleinste-Quadrate-Fehler mit Seed auf der sichtbaren Menge von <c2/>, mit ihrer empirischen Kovarianz, ihrem RMS und dem Anteil innerhalb der { "95" }-%-Ellipse

# text
# c1: city-street
# c2: harbour-approach
# c3: fjord
# c4: container-terminal
seg-8bba3099379a = die Horizontlinien-Presets (<c1/>, <c2/>, <c3/>, <c4/>) mit ihrem Label REPRESENTATIVE, ihrer Herkunft und dem Schnitt für jedes Grad Azimut; repräsentative Geometrien, keine Vermessungen

# text
seg-f900de61f6e9 = ein Horizontlinien-Abschnitt (Tabelle, Straßenschlucht, Sektoren, Gelände), reduziert auf die normalisierte Tabelle mit 360 Einträgen, die die Engine verwendet

# text
# c1: request
seg-824f3c5951fa = der Skyplot von <c1/> als statischer SVG-Text

# text
# c1: jsonl
# c2: receiver-trust
# c3: kshana trust-telemetry
seg-0ffb65c8f5f3 = ein Vertrauens-Stream (<c1/>) oder ein Ergebnis <c2/> als Prometheus-Text, CEF- oder LEEF-Syslog-Zeilen oder OTLP-JSON-Nutzlast, mit den <c3/>-Encodern; es wird nichts gesendet und keine Uhr gelesen (Syslog-Zeilen tragen keinen Zeitstempel)

# text
# c1: kshana-interference-map/v1
seg-c1ab3dbbe2f2 = eine GNSS-Störungskarte aus ADS-B- oder AIS-CSV-Text: ein Dict je UTC-Tag mit <c1/>-GeoJSON (nur aggregiert; eine degradierte Zelle nennt keine Störung als Ursache)

# text
seg-ff4bc7fdbce7 = Anteil einer Route durch degradierte Zellen dieser Karten, als JSON-Text (keine Vorhersage; nicht beobachtete Zellen sind kein Beleg für eine freie Route)

# text
# c1: nmea
# c2: log_json
# c3: log_text
seg-d70bccba0e03 = synthetisches Brücken-NMEA für die Besatzungsausbildung plus das Ausbilder-Log (<c1/>, <c2/>, <c3/>); nur Text, nie für die Live-Navigationssysteme eines Schiffes

# text
# c1: iq_scene
# c2: iq_acquire
# c3: iq_track
# c4: gps-l1ca
# c5: galileo-e1b
# c6: glonass-l1of
seg-3fe13851ac82 = die GNSS-IQ-Signalnamen, die <c1/>, <c2/> und <c3/> akzeptieren (<c4/>, <c5/>, <c6/>, ...)

# text
# c1: samples_i
# c2: samples_q
# c3: truth
seg-50bf4ad4e23a = eine GNSS-IQ-Szene mit mehreren Satelliten im Speicher: <c1/> / <c2/> und <c3/> je Epoche

# text
seg-b3199839a37c = dasselbe, mit jedem GPS-Satelliten in der Geometrie seiner Broadcast-Ephemeride aus einer RINEX-Navigationsnachricht (Receiver Independent Exchange Format)

# text
seg-8f0f9efea46b = FFT-Akquisition (fast Fourier transform) jedes PRN (pseudorandom noise code): Doppler, Codephase, Statistik, Schwelle

# text
# c1: kshana.acq-surface/1
# c2: rows[doppler][lag]
# c3: parabolic
# c4: fine_search
seg-3bf994f3f1bf = die gesamte Akquisitionsfläche eines PRN (<c1/>): Korrelationsleistung <c2/>, der Peak und zwei Feinverfeinerungen des Dopplers (<c3/>, <c4/>)

# text
seg-393572e31421 = akquirieren, dann jeden PRN nachführen: Doppler je Epoche, Codephase, Lock-Indikatoren, C/N0, Prompt-Korrelator

# text
seg-bc39efdb015a = die Front-End-Kette des Empfängers (Bandpass, Notch, Blanking, Excision, AGC (automatic gain control), Quantisierer) über komplexe Samples

# text
# c1: iq-labfit
seg-ead1b81c712f = das Verlust-der-Nachführung-Modell der Nachführschleife an eine Zeitleiste des Empfängervertrauens anpassen (ein Szenario <c1/>)

# text
# c1: kshana.loop-design/1
# c2: name
# c3: hash
# c4: ValueError
seg-0ab8531d0465 = eine Datei <c1/> (einen Pfad oder TOML-Text) in ihre aufgelösten Entwürfe parsen, jeder mit seinem <c2/> und <c3/>; <c4/> bei einer ungültigen Datei

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: header
# c4: records
seg-9c3467d4451e = eine binäre Nachführ-Epochendatei lesen (<c1/>, wie <c2/> sie schreibt): den <c3/> und ein Dict je Epoche in <c4/>

# text
# c1: iq monitor
# c2: series
# c3: events
# c4: spectra
# c5: notes
seg-469303e33d2a = die IQ-Detektionsmonitore über eine Aufzeichnung in einem Streaming-Durchlauf (<c1/>): <c2/>, <c3/>, <c4/> und <c5/>; liest eine Datei

# text
# c1: kshana.test-conditions/1
# c2: hash
seg-bb5c5008f1a8 = eine Labor-Testbedingungsdatei validieren (<c1/>, TOML oder JSON, ein Pfad oder Text) und sie aufgelöst zurückgeben, mit ihrem <c2/>

# text
# c1: kshana.campaign/1
# c2: out_dir
# c3: kshana iq campaign
# c4: digest
seg-d2441bf762b4 = eine Lab-Replay-Kampagne (<c1/>) nach <c2/> ausführen, wie es <c3/> tut; abgeschlossene Zellen werden übersprungen; gibt die Zellanzahlen, Fehler und den <c4/> zurück, sobald jede Zelle fertig ist

# text
# c1: digest
seg-7b6d264d9c7f = die Scorecards, den HTML-Bericht und den Digest einer Kampagne aus ihren Zellen neu aufbauen: die Zell- und Zeilenanzahlen, die Zeilen, die einen Zielwert verfehlen, und den <c1/>

# text
seg-e3956268cf1c = Signaturen für GNSS-IQ und Empfängervertrauen

# text
# c1: kshana.pyi
# c2: samples_i
# c3: samples_q
# c4: i
# c5: q
# c6: numpy.asarray(...)
seg-817bd0898d46 = Die vollständigen Signaturen, wie <c1/> sie angibt (jedes Schlüsselwort nach den erforderlichen Argumenten hat einen Standardwert; die Docstrings im Stub geben jeweils die Bedeutung an). Umhüllen Sie die Listen <c2/> / <c3/> und die Eingaben <c4/> / <c5/> für Arrays mit <c6/>.

# text
# c1: iq_read_epochs
# c2: kshana iq track --epochs
seg-2dd9323829ce = Eine Lab-Replay-Kampagne aus Python, dann ihr Bericht (die Kampagnendatei und ihre Aufzeichnungen sind Ihre; eine abgeschlossene Zelle wird beim nächsten Aufruf übersprungen; <c1/> liest eine Nachführ-Epochendatei, die ein Lauf von <c2/> geschrieben hat):

# text
# c1: iq_track
# c2: acq_coherent
# c3: None
# c4: acq_coherent=1
seg-5f48b88438df = <c2/> von <c1/> legt fest, über wie viele Codeperioden die Übergabe-Akquisition kohärent integriert. Ab { "0.33.0" } ist der Standardwert <c3/>, also automatisch: etwa { "4" } ms ({ "4" } Perioden bei einem Code von { "1" } ms wie GPS L1 C/A, { "1" } bei einem Code von { "4" } ms oder länger), sodass der Kanal nahe genug startet, damit die Frequenzschleife einrasten kann; <c4/> behält die Ein-Perioden-Suche von { "0.32" } bei.

# text
seg-012a83181bd3 = Typen

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: Literal
# c4: ErrorKind
# c5: error_kind
# c6: ProvenanceClass
# c7: TypedDict
# c8: KindMeta
# c9: scenario_kinds()
# c10: FieldUnit
# c11: units
# c12: _FieldUnitBase
# c13: tests/typed_api_sync.rs
seg-0b4f4c6c6014 = <c1/> typisiert die geschlossenen Vokabulare für Prüfprogramme (mypy, pyright): <c2/> (jeder Artname, ein <c3/>), <c4/> (die vier Tags, die <c5/> zurückgibt), <c6/> und die <c7/>s <c8/> (wovon <c9/> eine Liste zurückgibt) und <c10/> (ein Eintrag im Block <c11/> eines Ergebnisses, der die Basis <c12/> mit den Pflichtschlüsseln erweitert). Sie existieren nur für Typprüfer und sind zur Laufzeit nicht importierbar; <c13/> hält sie gleich mit den Listen der Engine.

# text
seg-b5ad0d8e1456 = Mitglied

# text
seg-2698ab8436e6 = vollständiges Ergebnisdokument (JSON)

# text
seg-7eccc8361120 = eigenständiges Diagramm-SVG (Scalable Vector Graphics)

# text
seg-38c8d20ca07a = einzeilige Zusammenfassung für Menschen

# text
seg-e21e82ad3fe8 = die Reproduzierbarkeitstabelle, für die Arten, die eine ausgeben (siehe unten)

# text
seg-aadcc1cc4c79 = das in ein Python-Dict geparste Ergebnis (siehe den Hinweis zur Form unten)

# text
# c1: path
# c2: "points.0.coords"
# c3: "/points/0/coords"
seg-409504363c4c = die numerische Liste bei <c1/> (gepunktet, <c2/>, oder ein JSON-Pointer, <c3/>): 1D für Zahlen, 2D für numerische Listen gleicher Länge

# text
# c1: path
seg-b6d5d7e5271a = die Liste von Datensätzen bei <c1/> (eine Zeitreihe), ein Array je Feld, das in jedem Datensatz eine Zahl ist

# text
# c1: .columns
seg-adb2d15f9f74 = jede Liste von Datensätzen mit einem numerischen Feld, nach gepunktetem Pfad geschlüsselt, jede als <c1/>

# text
# c1: path
seg-7f053ad96880 = diese Tabelle nach <c1/> schreiben; gibt die geschriebenen Bytes zurück, oder { "0" } (und schreibt nichts), wenn die Art keine Tabelle ausgibt

# text
seg-276104139e73 = Die Reproduzierbarkeitstabelle

# text
# c1: realtime-frame-eop
# c2: lunar-time-budget
# c3: lunar-jamming
# c4: telecom-timing
# c5: leo-navmsg
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: csv = None
# c10: <scenario>.table.csv
seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> und <c5/> veröffentlichen immer eine Tabelle; <c6/> veröffentlicht eine, wenn ein Exportstandort (<c7/> + <c8/>) konfiguriert ist. Jede andere Art gibt <c9/> zurück. Der Text hat dieselben Bytes, die die CLI (command-line interface) als <c10/> schreibt, sodass ein Prüfer, der eine veröffentlichte Tabelle aus dem Wheel reproduziert, nie auf die Kommandozeile wechseln muss:

# text
seg-3ad2987110ee = Form des Ergebnisses

# text
seg-57c7066d3522 = Die Gütemaße und die Zeitreihen liegen <b>je Lauf-Seite</b>, nicht auf oberster Ebene. Für einen Uhrenlauf lautet das Dokument:

# text
# c1: data["quantum"]["fom"]
# c2: data["figures_of_merit"]
# c3: field-units-schema.json
# c4: SCHEMA.md
seg-cb19f961de2b = die Gütemaße sind also <c1/>, nie <c2/>. Andere Arten geben ihre eigenen Packs aus; die vollständige Referenz je Feld, mit Einheiten und einem Quellverweis, ist <a1><c3/></a1>, und der Leitfaden für Leser ist <a2><c4/></a2>.

# text
# c1: validate_toml
# c2: error_kind
seg-bfd984e0407b = <c1/> und <c2/> <b>führen</b> das Szenario aus, sodass sie Parse-, Konfigurations- <em>und</em> Laufzeitfehler sichtbar machen. Sie lösen nie eine Ausnahme aus.

# text
# c1: run
# c2: run_typed
# c3: ValueError
seg-0ca0a1da8356 = <c1/> / <c2/> lösen bei einem ungültigen Szenario <c3/> aus.

# text
# c1: seed
# c2: scenario_hash
# c3: REPRODUCIBILITY.md
seg-901c2ede0cd0 = Ergebnisse sind reproduzierbar: Ein Szenario trägt seinen <c1/>, und die Engine erfasst einen <c2/>, sodass dieselbe Eingabe auf derselben Plattform byte-identische Ausgabe liefert (siehe <a1><c3/></a1>).

# text
# c1: .array
# c2: .columns
# c3: .series
# c4: numpy.asarray(...)
# c5: .data()
# c6: tests/python/test_numpy_runoutput.py
# c7: ImportError
# c8: KeyError
# c9: ValueError
# c10: notebooks/
seg-8c0c32fcba2b = <c1/>, <c2/> und <c3/> geben genau <c4/> derselben Werte zurück, die <c5/> liefert (gleicher dtype, bit-identisch; <c6/>). Sie importieren NumPy beim Aufruf und lösen ohne es <c7/> aus; NumPy bleibt aus den Laufzeitanforderungen des Pakets heraus. <c8/> bedeutet, dass der Pfad fehlt, <c9/>, dass der Wert dort kein numerisches Array ist (oder keine Liste von Datensätzen). Lauffähige Notebooks stehen in <a1><c10/></a1>.

# text
seg-00a3cf088cde = Nicht in Python: langlaufende Prozesse

# text
# c1: kshana receiver-trust live
# c2: --listen
# c3: docs/TRUST-TELEMETRY.md
# c4: kshana nmea-scenario --tcp/--udp
# c5: receiver_trust
# c6: receiver_trust_replay
# c7: nmea_training
seg-3780dd4973f0 = <c1/> (ein Stream-Prozess mit einem Gate und einem optionalen TCP-Server <c2/>) und die Telemetrie-Exporter (Prometheus, OTLP, Syslog; <c3/>) sowie das Streaming von <c4/> gibt es nur auf der Kommandozeile: Ein Binding kehrt zurück, wenn der Aufruf zurückkehrt, und hält keinen Socket offen. Python deckt die Batch-Form von jedem ab: <c5/> für ein Log, <c6/> für einen Stream-Auszug (Werte und Zustände; das Gate wird nicht angewendet), <c7/> für den erzeugten Text.

# text
seg-82379c29d438 = <s1>Zurück</s1>Kaltatom-Interferometer

# text
seg-4a457afc63fb = <s1>Weiter</s1>npm und WebAssembly

# text
seg-dbbce10a12d2 = RunOutput
