# docs--standards: translations (de)

# text
seg-4a2ce9f33ab2 = Schreiben

# text
seg-9120d3e96e5e = Lesen

# text
seg-5ad814c7ef9e = Hinweise

# text
seg-aab745a65e76 = Modul

# text
seg-bf09433a7342 = GeoJSON

# text
seg-906440b861cd = Rahmen

# text
seg-32b620b3574e = Verwendung

# text
seg-8ba331635865 = Standards & Interoperabilität

# text
# c1: docs/STANDARDS.md
seg-96a449a63d11 = Quelle: <c1/>

# text
seg-3ed65a16e7d0 = Kshana spricht die standardisierten Austauschformate der Communities für GNSS (Globales Satellitennavigationssystem), Flugdynamik und Zeitgebung, damit es neben RTKLIB (eine quelloffene Bibliothek für kinematische Echtzeit-Positionierung), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit und den Werkzeugen der Analysezentren des IGS (International GNSS Service) stehen kann statt auf einer privaten Insel. Diese Seite ordnet die <b>Austauschformate</b>, die die Engine liest oder ausgibt, dem Modul zu, das jedes davon implementiert, und der maßgeblichen Spezifikation.

# text
# c1: VERIFICATION-MATRIX.md
seg-d1aa512ad4ee = Sie beschränkt sich auf Formate – Dinge mit einer Lese-/Schreibrichtung. Die Signal- und Algorithmusstandards, die die Engine <em>implementiert</em> statt liest (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (früher Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), die ARAIM-Referenz (Advanced Receiver Autonomous Integrity Monitoring) WG-C (WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) werden stattdessen Zeile für Zeile in <a1><c1/></a1> belegt.

# text
seg-656920618fb7 = Formate, die die Engine spricht

# text
seg-4fe4920a3fa1 = Standard

# text
seg-d08f1943c53b = Richtung

# text
seg-968a1d48364c = Spezifikation / Autorität

# text
seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

# text
seg-68d762928f76 = lesen <b>und</b> schreiben

# text
seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN-Form (Schlüssel-Wert-Notation)

# text
# c1: parse_oem
# c2: tests/ccsds_reference.rs
# c3: COVARIANCE_START … COVARIANCE_STOP
# c4: COV_REF_FRAME
# c5: covariance_block_kvn
# c6: parse_covariance_block
# c7: src/oem.rs
seg-be700901c03e = Tabellierte Zustandsvektor-Ephemeride, die von GMAT, Orekit und STK (Systems Tool Kit) eingelesen wird. <c1/> liest sie zurück; <b>validiert durch die Rückgewinnung des wörtlichen Blue-Book-Beispiels Abbildung G-11 aus CCSDS 502.0-B-3</b> (<a1><c2/></a1>). Der optionale { "6" }×{ "6" }-<b>Kovarianzblock</b> für Position/Geschwindigkeit (<c3/>, die KVN-Serialisierung des unteren Dreiecks mit 21 Elementen mit einem optionalen <c4/>) wird sowohl geschrieben (<c5/>) als auch gelesen (<c6/>), im Rundlauf symmetrisch (Tests in <a2><c7/></a2>).

# text
seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

# text
seg-8e9f975d443b = CCSDS 502.0-B-2, KVN-Form

# text
# c1: orbit
# c2: --export-omm <out.omm>
# c3: export_omm = true
# c4: tests/sp3_export_roundtrip.rs
seg-fb5218415d68 = Veröffentlichung auf dem Standardisierungsweg der mittleren Elemente von SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: Two-Line-Element-Satz) (mittlere Bewegung, e, i, Ω, ω, M, BSTAR (der Widerstandsterm des Bahnpropagators)). Über die CLI (CLI: Kommandozeilenschnittstelle) erreichbar bei einem Szenario <c1/> über <c2/> oder <c3/> (eine OMM je durch TLE definiertem Satelliten, mit seiner echten NORAD-Kennung (North American Aerospace Defense Command), COSPAR-Bezeichnung (Committee on Space Research) und Epoche; <a1><c4/></a1>). Eine XML-Form (Extensible Markup Language) und ein Leser sind Folgearbeiten.

# text
seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

# text
seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN-Form

# text
# c1: tests/ccsds_reference.rs
seg-cd96db42ab43 = Entfernungs-/Doppler-/Winkel-Verfolgungsdatensätze, die ein Überflug bei DSN/ESTRACK (ESTRACK: European Space Tracking network) an ein OD-System (Bahnbestimmung) liefert. <b>Validiert durch die Rückgewinnung des wörtlichen Blue-Book-Beispiels Abbildung E-9 aus CCSDS 503.0-B-2</b> (<a1><c1/></a1>).

# text
seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

# text
seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

# text
# c1: spacepackets-py
# c2: src/space_packet.rs
seg-ed9c8bdddd6d = Die Rahmung des 6-Oktett-Primär-Headers für TM/TC (TM: Telemetrie; TC: Telekommando), die Bodensysteme austauschen. <b>Der Encoder reproduziert die veröffentlichten Testvektoren auf Byte-Ebene der unabhängigen Bibliothek <c1/></b> (Tests in <a1><c2/></a1>).

# text
seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, das Format für präzise Bahnen) / SP3-d</b> (präzise Ephemeride)

# text
seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

# text
# c1: gps-ops
# c2: tests/sp3_export_roundtrip.rs
seg-8d1089fbd59d = Zeitreihe aus erdfester (ECEF) Position und Uhrzeit. Im Rundlauf auf < { "0.5" } m an einem realen Snapshot von <c1/> validiert (<a1><c2/></a1>).

# text
seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (Broadcast-Navigation)

# text
seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (Interface Control Document), BeiDou ICD, GLONASS ICD (Globales Satellitennavigationssystem Russlands))

# text
# c1: Propagator
seg-1b7710db3abf = Multi-GNSS-NAV-Einlesung (GPS LNAV (Legacy-Navigationsnachricht), Galileo F/NAV, QZSS (Quasi-Zenith-Satellitensystem Japans), BeiDou MEO/IGSO (MEO: mittlere Erdumlaufbahn; IGSO: geneigte geosynchrone Bahn), GLONASS-Zustandsvektor); als vollwertige Quelle für <c1/> verwendbar.

# text
seg-44991b52d1ff = <b>TLE / 3LE</b> (Zwei-/Drei-Zeilen-Elemente)

# text
seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

# text
seg-8d4dd42edc89 = Propagiert vom validierten SGP4/SDP4-Kern (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm gegenüber den { "666" } offiziellen AIAA-Vektoren).

# text
seg-498aac915067 = <b>RINEX 3.0x</b> (Beobachtung)

# text
seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } wird voraussichtlich gelesen, nie an einer Datei { "4.00" } erprobt)

# text
# c1: parse_obs
# c2: pvt
# c3: tests/pvt_abmf.rs
seg-ac97f77f142c = Die andere Hälfte von RINEX: die eigenen Code-/Träger-/Doppler-/SNR-Datensätze (SNR: Signal-Rausch-Verhältnis) des Empfängers (<c1/>). Das ist die Eingabe, die der Einzelpunktpositionierungs-Löser <c2/> neben der Broadcast-Navigationsdatei verarbeitet (<a1><c3/></a1>, reale IGS-Station ABMF).

# text
seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globale TEC-Karten (Gesamtelektronengehalt))

# text
seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS-Ionosphärenprodukt)

# text
# c1: parse_ionex
seg-af9efa0df270 = <c1/> liest die globalen Gesamtelektronengehalt-Gitter des IGS – die <em>gemessene</em> Alternative zur Klobuchar-Korrektur aus dem Broadcast – mit bilinearer räumlicher und zeitlicher Interpolation und der Schrägheitsabbildung auf die Schrägverzögerung.

# text
# c1: finals2000A
seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (Erdorientierung)

# text
# c1: finals2000A.all
seg-197dfa18ca19 = IERS Conventions; IERS EOP (Erdorientierungsparameter) { "14" } C04 / <c1/>

# text
# c1: tests/operational_eop_predictor_reference.rs
seg-0d102d904cfe = UT1 (Universal Time { "1" }, Erdrotationszeit)−UTC (Koordinierte Weltzeit) und Polbewegung aus dem offiziellen Produkt, einschließlich der <b>vorhergesagten</b> Zeilen, sodass die Rahmenreduktion in Echtzeit laufen kann und das Wachstum ihres Vorhersagefehlers veranschlagt werden kann (<a1><c1/></a1>).

# text
seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

# text
# c1: SCHEMA.md
seg-193b33461507 = dieses Repository – siehe <a1><c1/></a1>

# text
# c1: format
# c2: schema_version
# c3: kind
# c4: engine_version
# c5: payload
seg-33ef8d792a90 = Die neutrale, versionierte Hülle, in die sich jedes Artefakt verpacken lässt: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, mit einem ausdrücklichen Urteil über die Major-Minor-Kompatibilität für einen Konsumenten. Kein externer Standard; hier dokumentiert, weil ein fremdes Werkzeug ihn erkennen muss.

# text
seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) Austausch für den Mond

# text
seg-b19cf72da934 = schreiben (Zeitmetadaten auch lesen)

# text
seg-d641c72a6449 = LunaNet-Interoperabilitätsspezifikation / IOAG-Architektur für Mondkommunikation, über CCSDS { "502.0" }

# text
# c1: export_lunar_oem
# c2: export_kif_lunar
# c3: export_lunar_time_metadata
# c4: tests/lunar_interoperability_export_reference.rs
seg-cc796afe7a72 = Das lunare Bezugssystem, die lunare Zeitskala und die lunare Ephemeride, ausgegeben in an LunaNet/IOAG angelehnten CCSDS-Formen (<c1/>, <c2/>, <c3/>), mit einer Feldprüfung der ausgegebenen OEM (<a1><c4/></a1>).

# text
seg-5abc05382382 = <b>CZML</b> (Cesium Language)

# text
seg-da7e20d3786b = CZML-Paketformat von CesiumJS

# text
# c1: INERTIAL
# c2: --export czml
seg-8d3a73646be3 = Ein JSON-Strom (JavaScript Object Notation) zeitmarkierter Pakete für den CesiumJS-Globus; bewegte Objekte in GCRS geschrieben (<c1/>). <c2/> bei jeder Art, die Objekte auf der Erde platziert.

# text
seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

# text
seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

# text
# c1: --export kml
seg-57468e6d97f2 = Erdfeste Länge, Breite und Höhe für Google Earth und GIS-Werkzeuge (Geoinformationssystem). <c1/>.

# text
seg-46d977015b07 = schreiben <b>und</b> lesen (Route)

# text
seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

# text
# c1: --export geojson
# c2: LineString
# c3: --import-route <route.geojson>
seg-425a83b44545 = Erdfeste Geometrie für Webkarten und GIS-Werkzeuge (<c1/>); ein <c2/> wird als geradlinige Spureingabe der Arten zurückgelesen, die eine solche fliegen (<c3/>).

# text
# c1: .e
# c2: EphemerisTimePosVel
seg-d9b137e11514 = <b>STK-Ephemeride</b> (<c1/>, <c2/>)

# text
seg-347ee6f6c1df = Ephemeriden-Dateiformat von Ansys STK

# text
# c1: ICRF
# c2: --export stk
seg-45576578d357 = Inertiale Position und Geschwindigkeit (<c1/>) für STK und Werkzeuge, die dessen Ephemeridenformat lesen. <c2/>.

# text
seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

# text
seg-42272f73f456 = SigMF-Spezifikation

# text
# c1: spectrum
# c2: --export sigmf
# c3: [recording]
seg-202b559c30a6 = Komplexe Basisbandaufzeichnungen plus JSON-Metadaten: Die Art <c1/> schreibt ihre synthetisierten Gleichanteil-/Quadratur-Abtastwerte (IQ) (<c2/>) und liest eine Aufzeichnung über ihren Block <c3/>.

# text
seg-60e7c8505cb5 = <b>Text der LEO-Navigationsnachricht</b> (im RINEX-4-Stil und CSV (kommagetrennte Werte))

# text
seg-f22442e0e8ea = RINEX-{ "4" }-Navigationslayout, angepasst

# text
# c1: leo-navmsg
seg-8338e445b3a5 = Die Broadcast-Ephemeride und -Uhr der Art <c1/> für einen Satelliten in der niedrigen Erdumlaufbahn (LEO), exportiert und wieder importiert; eine dokumentierte Anpassung, kein registrierter RINEX-Nachrichtentyp (MODELLED in der Verifikationsmatrix).

# text
seg-1b89ab4e93f7 = Bezugssysteme und Zeit

# text
# c1: src/cio.rs
# c2: src/frames.rs
# c3: src/nutation.rs
# c4: VALIDATION.md
seg-dbbd023631b6 = Das Bezugssystem, das die Engine ausgibt, ist ausdrücklich festgelegt, nicht implizit. Die CIO-basierte (CIO: Celestial Intermediate Origin) Reduktion nach IAU (International Astronomical Union) 2006/2000A (<a1><c1/></a1>) und die TEME-Reduktion (True Equator, Mean Equinox) über Äquinoktium/GMST (GMST: mittlere Greenwich-Sternzeit) (<a2><c2/></a2>, <a3><c3/></a3>) sind bitgenau gegen die Referenzvektoren von SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) validiert (siehe <a4><c4/></a4>).

# text
seg-819d28bd9361 = Realisierung

# text
seg-69aca96b7e42 = TEME

# text
seg-ec81608934a6 = SGP4 nativ

# text
seg-7631c594fd1a = True Equator, Mean Equinox – das Ausgabesystem von SGP4/SDP4.

# text
seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

# text
seg-745285e29202 = IAU-{ "2006" }-Präzession + IAU-2000A/2000B-Nutation

# text
# c1: teme_to_gcrs
seg-3747add299d5 = <c1/> (Äquinoktiumskette).

# text
seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

# text
seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

# text
seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

# text
seg-a28e26cd2481 = ERA (Erdrotationswinkel) + IERS-Polbewegung (CIO) oder GMST + Polbewegung (Äquinoktium)

# text
# c1: gcrs_to_itrs_matrix
# c2: eraC2tcio
# c3: teme_to_itrf
seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (Äquinoktium).

# text
seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodätisch

# text
seg-b58a44eaaa39 = exakte + iterative Inverse

# text
seg-4d9472dd73d3 = Zeitskala

# text
seg-cbe7a7ce7317 = <b>TT</b> (Terrestrische Zeit)

# text
# c1: jd_tt
seg-25191c1a4135 = Auswertung der Argumente für Präzession/Nutation/CIO (<c1/>).

# text
# c1: jd_ut1
seg-8c478d6b4786 = Erdrotationswinkel / GMST (<c1/>).

# text
seg-f7033ca0c13f = <b>Zweiteiliges JD</b> (Julianisches Datum)

# text
# c1: Jd2
seg-64a5adeacd5b = <c1/> für eine Epochenauflösung unter einer µs.

# text
seg-210f40885a8e = Zuordnung Ausgabefeld → Standard (CCSDS { "502.0" })

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: --export-oem
# c3: --export-omm
seg-e9dbc25a3ee9 = Was die beiden Bahnnachrichten-Schreiber in jedes Feld einer CCSDS-ODM (Orbit Data Messages, { "502.0" }) schreiben, gelesen aus einem Lauf von <c1/> mit <c2/> und <c3/>:

# text
seg-d2b91c300b82 = Ausgabe von Kshana

# text
seg-119884b009cc = CCSDS-ODM-Feld

# text
seg-8b0593f67c7f = Wert / Einheit

# text
seg-d33eb162d179 = Metadaten des OEM-Segments

# text
# c1: EARTH
# c2: TEME
# c3: GPS
seg-4b338284e56a = <c1/> / <c2/> / <c3/> – das System, in dem die Propagatoren integrieren, und die Zeitskala des Epochenrasters, nicht umbenannt

# text
seg-e0a44af9aaf8 = OEM-Zustandsepoche

# text
seg-b0623bab9fcc = erste Spalte jeder Datenzeile

# text
seg-410bd5a9ba14 = Kalenderzeit nach ISO-8601 (ISO: International Organization for Standardization), GPS-Zeitskala

# text
seg-a7c95802e01a = OEM-Position, -Geschwindigkeit

# text
# c1: X Y Z X_DOT Y_DOT Z_DOT
seg-0539cafabf60 = Datenspalten <c1/>

# text
seg-8add7e800e0e = km, km/s

# text
seg-8b386548c03c = OMM-Metadaten

# text
seg-e2c63414d7c2 = OMM-Epoche

# text
seg-5109e5948d2a = ISO-8601-Form mit Tag des Jahres (die TLE-Epoche)

# text
seg-b74289a29c24 = mittlere OMM-Elemente

# text
seg-f3492fa95178 = Uml./Tag, –, Grad, 1/Erdradien

# text
# c1: ephemeris
# c2: jd_utc
# c3: teme_r_m
# c4: teme_v_m_s
# c5: gcrs_r_m
# c6: gcrs_v_m_s
# c7: ecef_r_m
# c8: lat_deg
# c9: lon_deg
# c10: alt_km
seg-fc82185abe10 = Das Ergebnis-JSON (JavaScript Object Notation) der Art <c1/> enthält denselben Zustand je Stichprobe in SI-Einheiten (Internationales Einheitensystem): <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), dazu <c8/>, <c9/>, <c10/>.

# text
seg-014d1392018e = Ehrlicher Umfang

# text
# c1: INTEROP.md
seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF und der Text der LEO-Navigationsnachricht werden <b>gelesen und geschrieben</b>; OMM, CZML, KML und die STK-Ephemeride werden nur <b>geschrieben</b> (ein OMM-Leser und die XML-Serialisierung sind Folgearbeiten); GeoJSON wird geschrieben und als Route zurückgelesen; RINEX NAV, RINEX OBS, IONEX, die IERS-EOP-Produkte und TLE werden nur <b>gelesen</b>; der lunare Export nach LunaNet/IOAG ist ein Schreiber, dessen Zeitmetadaten im Rundlauf erhalten bleiben. <a1><c1/></a1> listet auf, welcher Export für jedes mitgelieferte Szenario gilt.

# text
seg-68b4f5116419 = Die obige Feldzuordnung zu CCSDS/IGS ist Dokumentation, keine Aussage, dass irgendein Standard eingehalten ist; eine formale Bewertung gegen diese Standards (und die Eintragung in den offenen Katalog der ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) wird gesondert verfolgt und steht noch zur Prüfung aus.

# text
# c1: xval/anise-frames/
# c2: gcrs_to_itrs_matrix
# c3: VALIDATION.md
seg-e461587ad2cf = Die unabhängige numerische Gegenprüfung der Rahmenreduktion mit SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris – ein reines Rust-Toolkit für Planetengeometrie) wird im eigenständigen, vom Workspace ausgeschlossenen Crate <c1/> geliefert: <c2/> stimmt gegen die Rotation GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) von ANISE über acht Epochen { "2020" }–{ "2023" } auf ≤ { "0.86" } m am Boden und ≤ { "3.6" } m in der GNSS-Bahn überein (siehe <a1><c3/></a1>). Sie braucht SPICE-Kernel und ist daher kein standardmäßiges Gate der kontinuierlichen Integration (CI).

# text
seg-f6d67027d669 = <s1>Zurück</s1>Fähigkeitenübersicht

# text
seg-01b6270b6c6a = <s1>Weiter</s1>Zeilenabdeckung
