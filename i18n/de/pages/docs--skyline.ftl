# docs--skyline: translations (de)

# text
seg-f917e7fcac09 = Was es ist

# text
seg-6c6e7248496f = Himmelsgeometrie

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Oberfläche

# text
seg-ad856ad710eb = Status

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-de6c33774c9c = CLI

# text
seg-b03d56f501c3 = Typ

# text
seg-c14b8fe46517 = Azimutabhängige Horizontmaske: sichtbare Menge, Azimut und Elevation sowie DOP unter der Maske

# text
seg-bbb1828b3db1 = Reduktionen von Straßenschlucht, Sektor und Gelände auf eine Tabelle

# text
seg-2c53381d48ae = Horizontale Fehlerellipse und Kofaktor je System aus der Geometriekovarianz

# text
seg-d1e9715513b4 = Beispiel

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-98f4f946a7ac = WASM

# text
seg-4dbf41c0ec3b = Funktion

# text
seg-2b0d77219437 = Voreinstellungen

# text
seg-7338b6210228 = Zeile

# text
seg-6317db731879 = Beschreibung

# text
# c1: docs/SKYLINE.md
seg-be2f66de7d07 = Quelle: <c1/>

# text
seg-3cb660ef6b03 = Horizontmasken und Himmelsgeometrie

# text
# c1: mask_deg
# c2: docs/design/2026-10-12-geometry-and-skyline-design.md
seg-724f72bdfa36 = Bis { "0.36" } war jeder Sichtbarkeitstest zur Erde in der Engine ein einziger Elevationsgrenzwert, <c1/>: Ein Satellit zählte, wenn er auf oder über einer Zahl lag, gleich in welcher Richtung. Eine Straße, ein Kai, ein Fjord oder ein Kran verdeckt einen Teil des Himmels und lässt den Rest offen. Ein <b>Skyline</b> ist ein vom Azimut abhängiger Elevationsschnitt; die <b>Himmelsgeometrie-Funktionen</b> machen aus einem Standort, einer Zeit, Konstellationen und einer Skyline die sichtbare Menge, die Dilution of Precision (DOP), die Geometriekovarianz, die horizontale Fehlerellipse, eine Monte-Carlo-Wolke und ein Skyplot. Der Entwurf ist <c2/> (Punkte { "1" } und { "2" }).

# text
seg-4c1bc0b37f54 = Evidenz: Die maskierte Sichtbarkeitsentscheidung (geodätische Blickwinkel, die Tabellenmaske, die sichtbare Menge und deren DOP) ist gegen Orekit { "12.2" } und gnss_lib_py { "1.0.4" } in einem vorab registrierten Vergleich <b>VALIDATED</b>, ebenso die Fehlerellipse und der Kofaktor je System (numpy, vorab registriert); die Reduktionen für Schlucht, Sektor und Gelände, die Voreinstellungen und die übrigen Himmelsgeometrie-Funktionen sind <b>MODELLED</b> (<a1>Evidenz</a1>). Eine Skyline entfernt Satelliten in Sichtlinie und nichts weiter. Die Voreinstellungen sind REPRÄSENTATIVE Geometrien, keine Vermessungen.

# text
seg-6fa3291b70e3 = Die Skyline

# text
# c1: [0, 90)
seg-08585dd55bb5 = Eine Skyline ist das punktweise Maximum aus vier Beschreibungen. Der Azimut ist in Grad im Uhrzeigersinn von geografisch Nord im lokalen Ost-Nord-Oben-System des Standorts angegeben; Elevationen liegen in <c1/>.

# text
seg-9d0e2b0a469f = TOML

# text
seg-3dbc7ff9f5ab = Tabelle

# text
# c1: [0, 360)
seg-a67486e7d10e = Elevationen, linear im Azimut interpoliert und bei { "360" }° umgebrochen. Azimute streng aufsteigend in <c1/>; höchstens { "3600" } Zeilen.

# text
seg-bc12ba94381f = Straßenschlucht

# text
seg-23066e2eb509 = Zwei gerade, parallele Wände (unten).

# attr:aria-label, text
seg-821762272e2f = Sektoren

# text
# c1: az_from
# c2: az_to
seg-7387a718a7c3 = Scharfkantige Intervalle, im Uhrzeigersinn von <c1/> (eingeschlossen) bis <c2/> (ausgeschlossen), die durch Nord laufen dürfen; höchstens { "360" }.

# text
seg-2768e3772b56 = Gelände

# text
# c1: atan((height_m − d²/(2 R_eff)) / d)
# c2: R_eff = 4/3 × 6371 km
# c3: height_m
seg-5a5c08a77b86 = Auf eine Tabelle reduzierte Punkte: Elevation <c1/>, mit dem Krümmungsabfall für <c2/> (eine gewählte, angegebene Konstante). <c3/> liegt über der Antenne.

# text
# c1: preset = "<name>"
# c2: table
# c3: sectors
# c4: terrain
seg-fb86c0db0c90 = <c1/> geht von einer benannten Geometrie aus; die Schluchtfelder überschreiben dann die Schlucht der Voreinstellung Feld für Feld, und <c2/>, <c3/> und <c4/> kommen hinzu.

# text
# c1: mask_deg
# c2: az
# c3: max(mask_deg, skyline(az))
# c4: >=
# c5: mask_deg
seg-0d76504a1d74 = Das <c1/> des Empfängers behält seine Bedeutung: Es ist eine flache Skyline. Der wirksame Schnitt beim Azimut <c2/> ist <c3/>, und ein Satellit ist sichtbar, wenn seine Elevation <b>auf oder über</b> diesem Wert liegt: dasselbe <c4/>, das die flache Maske immer verwendet hat. Ein Satellit über <c5/>, aber unter der Skyline, ist <b>durch die Skyline maskiert</b>.

# text
seg-f7fd13e569e3 = Die Straßenschlucht

# text
# c1: s
# c2: w
# c3: a
# c4: az
# c5: θ = az − s
# c6: d(az) = (w/2) / |sin θ|
# c7: h
seg-290f563c1ff7 = Eine Straße verläuft entlang des Azimuts <c1/>, <c2/> Meter zwischen den Wänden, die Antenne befindet sich <c3/> Meter hoch auf der Mittellinie. Entlang des Azimuts <c4/>, mit <c5/>, erreicht der Strahl nach <c6/> eine Wand, sodass eine Wand der Höhe <c7/> bei folgendem Wert schneidet

# text
# c1: length_m = L
# c2: d(az) · |cos θ| > L/2
# c3: antenna_m
# c4: width_m
seg-8662708f4f32 = Der offene Streifen liegt entlang der Straße. Bei <c1/> (Antenne in der Mitte) verlässt ein Strahl die Schlucht durch ein offenes Ende, und die Wand schneidet nichts, wenn <c2/>. Eine Wand, die nicht höher als die Antenne ist, schneidet nichts. <c3/> beträgt standardmäßig { "1.5" } m (ein Autodach oder ein Handempfänger, eine angegebene Wahl); eine neue Schlucht braucht <c4/>.

# text
# c1: kshana skyline --preset <name>
seg-1eeff52ea5a5 = Gewählte und angegebene Abmessungen (die der Entwurfsnotiz), keine Vermessungen eines realen Ortes. <c1/> gibt eine mit ihrer Herkunft und ihrem Schnitt für jedes Grad aus.

# text
seg-13e8e5460280 = Geometrie

# text
seg-6d71c5cbe104 = Schlucht: Straße { "0" }°, Breite { "20" } m, Wände { "30" } m und { "30" } m, Antenne { "1.5" } m. { "70.7" }° quer zur Straße, entlang dieser offen.

# text
seg-ab3415ff8811 = Verhältnis von Höhe zu Breite { "1.5" }, innerhalb des Bandes von { "0.5" }–{ "2" } für Seitenverhältnisse von Straßenschluchten bei Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

# text
seg-e331f02251f8 = Sektoren: zur Seeseite offen über { "090" }–{ "270" } ({ "180" }°); Kaigebäude { "8" }° über { "315" }–{ "045" } ({ "90" }°); der Wellenbrecher und sein Leuchtfeuer { "3" }° über { "045" }–{ "090" } und { "270" }–{ "315" }.

# text
seg-6926e1bfc55d = Gewählte Annahmen (zum Beispiel { "40" }-m-Lagerhallen in etwa { "285" } m Entfernung).

# text
# c1: 1500/|sin az|
seg-f13d4df9a42c = Gelände: Wände { "600" } m über der Antenne in { "1500" } m Abstand beiderseits einer Nord-Süd-Rinne, ein Punkt je Grad (bei <c1/> m), Krümmungsabfall angewendet. { "21.8" }° quer dazu, unter { "1" }° entlang der Achse.

# text
seg-4d3dedbe4491 = Von der Größenordnung her entsprechen Breite und Relief der tiefen westnorwegischen Fjorde (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

# text
seg-51f5219cb050 = Sektoren: Containerstapel { "12" }° über der landseitigen Hälfte { "000" }–{ "180" }; Kranausleger { "35" }° über { "245" }–{ "255" } und { "25" }° über { "285" }–{ "295" }; sonst zum Wasser offen.

# text
seg-a568ae949c3b = Fünf ISO-{ "668" }-High-Cube-Container ({ "14.5" } m) in etwa { "60" } m Entfernung von einer Antenne in { "2" } m Höhe; ein Ausleger etwa { "50" } m über dem Kai bei { "70" } m und { "100" } m, in der Größenordnung eines Post-Panamax-Krans. Ein Kransektor ist undurchsichtig.

# text
seg-65b1b45c787f = In einem Szenario

# text
# c1: [skyline]
seg-e489759bbd65 = Ein optionaler Abschnitt <c1/>, über dem eigenen Grenzwert der Art:

# text
seg-f98345079e70 = Was die Skyline ändert

# text
seg-cbe2f5ae721f = Je Stichprobe

# text
# c1: orbit
# c2: user_site
seg-7368ea5c4b79 = <c1/> (mit <c2/>)

# text
seg-fde216d940fb = Die Sichtbarkeitszeitreihe (GNSS-Verfügbarkeit) und die DOP-Zusammenfassung.

# text
# c1: integrity
# c2: user_site
seg-7f6b2fcda681 = <c1/> (mit <c2/>)

# text
# c1: araim_dual
seg-8fafdb892253 = Die Satelliten, die RAIM und ARAIM (<c1/>) verwenden.

# text
seg-c0156fd1c895 = Die Satelliten, deren Pseudoentfernungen simuliert und von RAIM verwendet werden.

# text
seg-d7fa5e5cf33d = Die Satelliten, die der Empfänger verfolgen kann, vor dem Störsender.

# text
seg-86caf3ae19ad = Die Menge der sichtbaren Satelliten jedes Modus über der Maske des jeweiligen Systems, einschließlich des Polarsweeps (dieselbe Skyline an jedem Standort). Die Hüllkurve des Doppler-Modus und der entworfene einzelne Überflug sind Grenzen dessen, was ein Empfänger bewältigen muss, und behalten die Maske jedes Systems.

# text
seg-20d2e86d17bc = Welche Epochen als über der Maske gelten, die Zeit darüber, die Satelliten des GNSS-Vergleichs.

# text
# c1: nmea-scenario
seg-ed5bbd6b2c46 = <c1/> (Trainings-NMEA)

# text
seg-d0eb9fd84d24 = Die Satelliten in GSV und in der Lösung. Azimute sind am Boden festgelegte wahre Peilungen, nicht der Kurs des Schiffes.

# text
# c1: orbit
# c2: integrity
# c3: user_site = { lat_deg, lon_deg, height_m }
# c4: user
# c5: epoch + t
# c6: t
# c7: epoch
# c8: epoch
# c9: integrity
# c10: user_site
# c11: user
seg-56cc8ae30218 = <b>Der Bodenstandort von <c1/> und <c2/>.</b> Beide Arten modellieren einen umlaufenden Nutzer mit geozentrischer Elevation und ohne erdfesten Azimut, sodass sie eine Skyline nur mit dem Bodenstandort-Modus der Entwurfsnotiz annehmen: <c3/> anstelle von <c4/> (genau eines von beiden). Jede Stichprobe ist ein absoluter Zeitpunkt, <c5/>: Jeder Satellit wird dorthin propagiert (ein Elementsatz, eine Broadcast-Ephemeride oder eine SP3-Datei wird von der eigenen Epoche aus fortgeschrieben, ein Walker-Satellit zählt <c6/> ab <c7/>) und dort in erdfeste Koordinaten gedreht, sodass der Standort einen einheitlichen Himmel sieht. <c8/> ist die des Bahnszenarios selbst; ohne eine (und immer bei <c9/>, das keine hat) ist es die neueste Epoche unter den Satelliten, die eine tragen, oder J2000 nur für Walker-Muster. Elevation und Azimut sind geodätisch (WGS-84). Die Aufteilung der ARAIM-Schutzniveaus und des Stanford-Vertikalfehlers der Integritätsart in horizontal und vertikal verwendet dasselbe geodätische Oben (die Normale des WGS-84-Ellipsoids, bei { "45" }° Breite etwa { "0.19" }° von der geozentrischen Radialen entfernt); Snapshot-RAIM verwendete es bereits. Ein <c10/> ohne Skyline ist ein gewöhnlicher Bodennutzer; der Pfad des umlaufenden <c11/> bleibt unverändert.

# text
# c1: [skyline]
# c2: tests/skyline_scenarios.rs
# c3: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c4: [skyline]
# c5: skyline
# c6: masked_by_skyline
seg-fae979b3b96f = <b>Rückwärtskompatibilität.</b> Ohne einen Abschnitt <c1/> ist ein Szenario byteidentisch mit dem, was dieselbe Engine vor dem Skyline-Code lieferte: <c2/> prüft JSON, Diagramm und Zusammenfassung jedes mitgelieferten Szenarios, das eine dieser Arten ausführt, und den NMEA-Text jedes Trainingsszenarios gegen SHA-256-Digests der Basislinie „{ "0.36" } portable“ (die Digests des Release-Commits { "0.35.0" }, neu festgelegt, als die Engine auf portable Mathematik umgestellt wurde, und im Test als Aufzeichnung festgehalten: <c3/>). Ein leerer Abschnitt <c4/> schneidet nichts; das Ergebnis entspricht dann dem Lauf ohne ihn, bis auf den hinzugefügten Block <c5/> und die Nullwerte bei <c6/>.

# text
# c1: user
# c2: user
# c3: user_site
# c4: width_m
# c5: [0, 360)
# c6: [0, 90)
seg-fe88e0ad01e9 = <b>Was zurückgewiesen wird</b>, mit dem Grund in der Meldung: eine Skyline an einem umlaufenden <c1/>; <c2/> und <c3/> zusammen; eine unbekannte Voreinstellung; eine Schlucht ohne <c4/>; eine Tabelle, die in <c5/> nicht streng aufsteigend ist; eine Elevation außerhalb von <c6/>; ein leerer Sektor; ein nicht positiver Geländeabstand; Eingaben über den Obergrenzen; jeder unbekannte Schlüssel.

# text
# c1: skyline: { source, open_fraction, provenance }
# c2: source
# c3: preset:<name>
# c4: preset:<name>+overrides
# c5: custom
# c6: open_fraction
# c7: max(mask_deg, skyline)
# c8: 1 − sin(cut)
# c9: provenance
# c10: units
seg-d1b10a0c833f = <b>Das Ergebnis</b> erhält <c1/>, wenn der Abschnitt vorhanden ist: <c2/> ist <c3/>, <c4/> oder <c5/>; <c6/> ist der Anteil des Raumwinkels der oberen Hemisphäre über <c7/> (der Mittelwert von <c8/> über den Azimut: { "1" } bei einer Maske von null, { "0.5" } bei einem flachen Schnitt von { "30" }°); <c9/> ist die Zeile der Voreinstellung oder die des Szenarios selbst. Einheiten und Herkunftsklassen stehen im Block <c10/>.

# text
# c1: kshana example <name>
seg-0842c1133eb5 = Mitgelieferte Beispiele (<c1/>):

# text
# c1: [skyline]
seg-5f77a52314c7 = Was es zeigt (zum Vergleich den Abschnitt <c1/> entfernen)

# text
# c1: city-street
seg-523f8c1a7912 = GPS + Galileo am Grund von <c1/>: { "17" } von { "289" } Stichproben behalten eine Lösung, medianer PDOP { "70.5" } ({ "1.14" } bei offenem Himmel).

# text
seg-6c5618dce8ab = ARAIM mit zwei Konstellationen bei der Einfahrt in einen Hafen: { "70" } Satelliten-Epochen verdeckt, Verfügbarkeit unverändert ({ "145" } von { "145" }).

# text
seg-36254db521fd = Pseudoentfernungen und RAIM an einem Kai: { "44" } Satelliten-Epochen verdeckt; RAIM-Verfügbarkeit { "0.59" } ({ "0.85" } bei offenem Himmel).

# text
seg-6b0f8b4c700f = Ein Störsender mit { "2" } W in einem Hafen: { "83" } Satelliten-Epochen verdeckt, Verfolgung unverändert (der Störsender hatte sie übernommen).

# text
seg-22ceab915271 = GPS + Galileo + eine LEO-Schicht in einem Fjord: medianer fusionierter PDOP { "1.14" } ({ "0.93" } bei offenem Himmel).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: city-street
seg-f940e764e244 = Die Schlucht von <c1/> als flacher Schnitt von { "35" }° und als <c2/>, entlang der Fahrtrichtung des Autos gedreht: { "8" } gegenüber { "4" } bis { "5" } GPS- und Galileo-Satelliten; fusionierter mittlerer Fehler { "2.1" } m in beiden; der Alarm bei { "1.5" } m bei { "51" } % und { "59" } % der Epochen.

# text
# c1: src/geometry.rs
seg-6aa4ec7e4058 = Fünf Engine-Funktionen (<c1/>), auf jeder Oberfläche dieselben:

# text
seg-4d6a793b2794 = Eingabe → Ausgabe

# text
# c1: id
# c2: system
# c3: az_deg
# c4: el_deg
# c5: cut_deg
# c6: visible
# c7: masked
# c8: n_visible
# c9: n_masked
# c10: open_fraction
# c11: dop
# c12: tdop_by_clock
# c13: states
# c14: cofactor_enu
# c15: covariance_enu_m2
# c16: ellipse_1sigma
# c17: ellipse
# c18: label
# c19: statement
# c20: advisory
seg-c99f58f1ccd2 = je Satellit <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (Einheitsvarianz), <c15/>; <c16/> und <c17/> beim geforderten Konfidenzniveau; <c18/>, <c19/>, <c20/>

# text
# c1: n
# c2: σ_UERE
# c3: seed
# c4: samples_enu_m
# c5: σ_UERE × HDOP
# c6: σ_UERE × PDOP
seg-a5b914aac404 = <c1/> (höchstens { "5000" }, eine Eingabeobergrenze) Kleinste-Quadrate-Fehler bei unabhängigen gaußschen Entfernungsfehlern von <c2/> aus einem mit <c3/> initialisierten ChaCha8-Strom: <c4/>, die empirische Kovarianz, horizontaler und 3-D-RMS neben <c5/> und <c6/>, der Anteil innerhalb der { "95" }-%-Ellipse

# text
# c1: open_fraction
seg-f435ee3b8709 = die Voreinstellungen mit Bezeichnung, Beschreibung, Herkunft, dem Schnitt für jedes Grad und <c1/>

# text
# c1: source
# c2: provenance
# c3: open_fraction
seg-1937af5fa347 = ein Skyline-Abschnitt, reduziert auf die Tabelle mit 360 Einträgen, die die Engine verwendet, mit <c1/>, <c2/>, <c3/>

# text
seg-f16a1f2de329 = der Skyplot als statisches SVG (ohne Skript, ohne externe Referenz, jede Eingabezeichenfolge maskiert)

# text
seg-c802cf2a2e30 = Eine Anfrage:

# text
# c1: systems
# c2: constellation-design
# c3: gps-baseline
# c4: galileo
# c5: beidou-meo
# c6: glonass
# c7: xona-pulsar
# c8: iridium-stl
# c9: leo-pvt
# c10: [[system]]
# c11: time_s
# c12: leo-pvt
# c13: "satellites": [{"id": "G05", "system": "GPS", "az_deg": 120, "el_deg": 35}, ...]
# c14: "ecef_m": [x, y, z]
# c15: site
# c16: user_ecef_m
# c17: "common"
# c18: σ_UERE
seg-c3c44c1967ba = <c1/> sind die Konstellations-Voreinstellungen der Engine (<c3/>, <c4/>, <c5/>, <c6/>, ... von <c2/>; die LEO-Voreinstellungen <c7/>, <c8/>, ...) oder eine vollständige <c9/>-Tabelle <c10/>, propagiert zu <c11/> (keplersch mit säkularem J2, die Bahnen des Verbundmodus <c12/>). Ihre relativen Phasen stammen aus unterschiedlichen Referenzepochen, der Himmel ist also <b>eine repräsentative Geometrie, nicht der Himmel dieses Datums an diesem Ort</b>. Satelliten können stattdessen (oder zusätzlich) direkt angegeben werden: <c13/>, oder mit <c14/> und einem <c15/> oder <c16/>. Standardwerte: die Maske jedes Systems ({ "5" }° GNSS, { "10" }° LEO; { "5" }° für direkt angegebene Satelliten), eine Empfängeruhr je System (<c17/> für eine gemeinsame Uhr), <c18/> { "1" } m (eine repräsentative Zeile eines Zweifrequenz-Budgets), Konfidenz { "0.95" }. Eingabeobergrenzen: höchstens { "2000" } Satelliten über dem Horizont (eine Systemtabelle, die mehr verlangt, wird vor dem Aufbau zurückgewiesen) und { "16" } Empfängeruhren.

# text
seg-6408f9b02ccb = Ein datierter Himmel aus Elementsätzen.

# text
# c1: "tle"
# c2: orbit-real-tle
# c3: "epoch"
# c4: time_s
# c5: site
# c6: "epoch"
# c7: 2026-06-07T12:00:00Z
# c8: epoch
# c9: tle
# c10: "tle_system"
# c11: TLE
# c12: sky_source
# c13: sky_statement
seg-7724e4ecafee = <c1/> nimmt Text von Two-Line-Element-Sätzen entgegen (eine Namenszeile vor jedem Satz ist optional; höchstens { "4" } MiB, eine Eingabeobergrenze), propagiert vom SGP4 der Engine (WGS-72, der Propagator, den <c2/> verwendet) zu <c3/> plus <c4/>, mit UT1 gleich UTC und ohne Polbewegung in erdfeste Koordinaten gedreht und von <c5/> aus gesehen. <c6/> ist UTC nach ISO { "8601" } (<c7/>) und datiert nur die Elementsätze (die Voreinstellungen tragen kein Datum, daher wird ein <c8/> ohne <c9/> zurückgewiesen); <c10/> bezeichnet sie für die Uhr je System (Standard <c11/>). Jedes Ergebnis gibt in <c12/> und <c13/> an, um welchen Himmel es sich handelt:

# text
seg-13a8b4ac40f9 = Der Himmel

# text
seg-c0bde35f9442 = die Konstellations-Voreinstellungen der Engine: eine repräsentative Geometrie

# text
seg-d368b50280cc = die zur angegebenen Epoche propagierten Elementsätze: der Himmel, den diese Elementsätze zu dieser Epoche ergeben, keine Messung davon (ihre eigene Genauigkeit ist die von SGP4 und das Alter der Sätze)

# text
# c1: epoch
# c2: time_s
seg-0bc07825a9b5 = kein <c1/>: die Elementsätze, propagiert zur eigenen Epoche des neuesten Satzes plus <c2/>, ein repräsentativer Himmel

# text
seg-1230388da233 = direkt angegebene Satelliten, wie angegeben

# text
# c1: +
# c2: epoch_utc
# c3: tle_skipped
# c4: systems
seg-1a30004a7f9e = Eine Mischung verbindet sie mit <c1/>. <c2/> ist der Zeitpunkt, zu dem die Elementsätze propagiert wurden, und <c3/> nennt, was vom Text nicht verwendet wurde, mit dem Grund: fehlerhafte oder verwaiste Zeilen von Elementsätzen (mit ihren Zeilennummern), Sätze, die der Parser zurückgewiesen hat, und Sätze, die SGP4 nicht zu diesem Zeitpunkt propagieren konnte (zerfallen oder jenseits seiner Grenzen); insgesamt höchstens { "100" } Einträge, dann ein letzter Eintrag, der den Rest zählt. Eine leere <c4/>-Liste fügt keine Voreinstellungen hinzu. Der Skyplot nennt die Grundlage in seiner Fußzeile.

# text
# c1: orbit::cofactor_from_los
# c2: orbit::dop
# c3: orbit::dop_cov
# c4: orbit::dop
# c5: tests/dop_reference.rs
seg-8560c13c7ea3 = <b>Ein Kern.</b> Die Kofaktormatrix ist <c1/>, der Aufbau der Entwurfsmatrix und die Gauß-Jordan-Inverse hinter <c2/>. <c3/> stellt die Kovarianz bereit und <c4/> ist deren Reduktion, sodass die VALIDATED-Skalare unverändert sind und weiterhin durch <c5/> festgeschrieben werden. Es gibt keine zweite DOP-Implementierung.

# text
# c1: k σ √λ
# c2: λ
# c3: k = √(−2 ln(1 − p))
# c4: √5.991 = 2.448
# c5: ½ atan2(2 Q_EN, Q_NN − Q_EE)
# c6: [0, 180)
seg-cb1be3e04419 = <b>Die Ellipse.</b> Halbachsen <c1/> für die Eigenwerte <c2/> des Ost-Nord-Blocks, mit <c3/> (<c4/> bei { "95" } %, { "1" } bei { "39.35" } %), und der Azimut der Hauptachse <c5/> in <c6/> von Nord.

# text
seg-96062e2cfed1 = Einstiegspunkte

# text
# c1: kshana sky <request.json|toml>
# c2: kshana sky --site <lat,lon[,h]> (--systems <a,b> | --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]
# c3: --monte-carlo <n> --seed <s>
# c4: --svg
# c5: kshana skyline --preset <name> | --presets | --profile <file>
seg-f8dc86bd9da2 = <c1/> oder <c2/>, mit <c3/> oder <c4/>; <c5/>

# text
seg-d5b5bdf6081c = Rust

# text
# c1: kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}
# c2: kshana::surface::*
seg-8d0f99ed4837 = <c1/>, <c2/> mit denselben Namen

# text
seg-40a7552d2ba9 = MCP

# text
# c1: sky_geometry
# c2: request
# c3: skyline_preset
seg-42f0fe3b42ab = <c1/> (<c2/> oder <c3/>); kein Monte Carlo über MCP (Massenstichproben, die ein Agent zusammenfassen und nicht mitführen sollte)

# text
# c1: label
# c2: statement
seg-9d04c658b37a = Jedes Ergebnis trägt <c1/> (MODELLED), die <c2/> (Geometrie unter einem angegebenen Fehlermodell: unabhängige, gleiche, mittelwertfreie gaußsche Entfernungsfehler; keine Vorhersage des realen Fehlers eines Empfängers, der außerdem Biase, Mehrwegeausbreitung und Fehler ohne Sichtverbindung hat; keine Integritätsgrenze) und den Hinweis: <em>Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.</em>

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-0e1285fdfe52 = Fünf Registerzeilen (<c1/>), wie die Entwurfsnotiz sie abgrenzt:

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/PREREGISTRATION.md
seg-1aa76286f152 = Orekit { "12.2" } (<c1/>-Blickwinkel, <c2/>) mit gnss_lib_py { "1.0.4" } (<c3/> und die DOP-Matrix), vorab registriert in <c4/> (Commit e4b9d912), bevor eines von beiden ausgeführt wurde: { "1173" } Blickwinkel an sechs Standorten und vier Epochen, sechs Tabellen, { "142" } sichtbare Mengen; schlechteste Elevation { "1.3e-13" }°, Azimut { "2.3e-13" }°, Maske { "1.1e-12" }° gegenüber { "1e-9" }°; identische sichtbare Mengen, keine im Grenzband; DOP { "3.3e-13" } relativ und Kofaktor { "6.6e-13" } der Matrixskala gegenüber { "1e-9" }. Umfang: Tabellenmasken, geodätische Blickwinkel, die maskierte Menge und ihr DOP und Kofaktor bei gemeinsamer Uhr.

# text
seg-b33828edbe2f = von Hand berechnete Werte; der obige Vergleich liest deren Tabellen als Eingaben und prüft sie nicht

# text
seg-ca950752be62 = Skyline-Voreinstellungen

# text
seg-83946f66ca78 = keine: gewählte, angegebene Abmessungen (nur gegen sich selbst geprüft)

# text
# c1: linalg.inv
# c2: linalg.eigh
# c3: xval/numpy-ellipse/PREREGISTRATION.md
seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> und <c2/> (Standard P2) auf den { "142" } eingecheckten sichtbaren Mengen, gemeinsame Uhr und eine Uhr je System, vorab registriert in <c3/> (Commit 0bbeeaee): { "270" } Fälle, Achsen { "5.1e-13" } relativ, Orientierung { "5.3e-12" }°, Kofaktor { "1.0e-12" } der Matrixskala, gegenüber { "1e-9" } und { "1e-6" }°

# text
seg-44e5f9ca28f7 = Himmelsgeometrie-Funktionen

# text
seg-8e3953481bbf = die Komposition: Propagation der Voreinstellung zu einem repräsentativen Himmel, die Monte-Carlo-Wolke (gegen die Geometrie geprüft, die sie abtastet), die Oberflächen

# text
# c1: [skyline]
seg-e8eec007c6b9 = Das Fehlen eines Abschnitts <c1/> wird Byte für Byte gegen die Ausgaben von { "0.35.0" } geprüft, was Rückwärtskompatibilität zeigt und nichts validiert. gnss_lib_py wendet nur eine einzige Elevationsmaske an und ist hier daher die Referenz für DOP, nicht für die Maske.

# text
seg-d5894e54715b = Was eine Skyline nicht modelliert: Beugung über einer Wandkante, Reflexionen und Signale ohne Sichtverbindung, die ein realer Empfänger womöglich dennoch verfolgt (sie werden verworfen, nicht verschlechtert), teilweise Durchlässigkeit (ein Gitterkran ist über seinen Sektor hinweg undurchsichtig), Gelände jenseits der angegebenen Punkte und die Erdkrümmung innerhalb der Schlucht- und Sektorformen.

# text
seg-745d19d6b35d = <s1>Zurück</s1>Maritime Integrationen

# text
seg-bbe8dd07d33b = <s1>Weiter</s1>Vertrauen als Sicherheitstelemetrie
