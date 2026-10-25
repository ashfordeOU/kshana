# docs--kind-leo-pvt: translations (de)

# text
# c1: label
seg-df745ccdaceb = MODELLED gemeinsame gewichtete Positionsbestimmung nach der Methode der kleinsten Quadrate aus Pseudoentfernungen mit einer Uhr je System oder einem bekannten Versatz; Rauschen aus dem Delay-Lock-Loop-Modell an der C/N0-Hüllkurve plus dem Entfernungsfehler des Signals im Raum (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-c988291eb41d = MODELLED: alles Übrige; der DOP wird gegen einen von Hand abgeleiteten Fall geprüft, die Lösungen gegen ihre Kovarianz und das Doppler-Modell gegen die Identität der Entfernungsbeschleunigung. (Katalog der Arten (<c1/>))

# text
# c1: kshana skyline --preset fjord
seg-be908356ad19 = Das Skyline-Preset ist REPRESENTATIVE (Herkunft in docs/SKYLINE.md und <c1/>): Es hat die Größenordnung von Breite und Relief der tiefen westnorwegischen Fjorde, ist aber keine Vermessung eines bestimmten Fjords. Nur Sichtlinie: keine Beugung, Reflexion oder Nicht-Sichtlinien-Empfang. Entfernen Sie den Abschnitt [skyline], um mit offenem Himmel zu vergleichen. MODELLED. (Kommentar der Szenariodatei, Zeilen { "15" } bis { "18" })

# text
seg-1d0ab26930e1 = Die gemeinsame Pseudoentfernungs-Positionsbestimmung aus GNSS und LEO mit Zwischensystem-Biases und Fehlermodellen je Signal ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft – das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-35916a8ac93e = Benannte LEO-PNT-Systeme als optionale Datenvorgaben, jeweils mit ihrer Quelle, sind MODELLED, nicht validiert: Sie werden gegen ihre eigene geschlossene bzw. analytische Identität geprüft – das findet Übertragungs- und Koeffizientenfehler, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-6ac7dcc57b2a = <s1>Zurück</s1>leo-ppp

# text
seg-458b3eda3250 = <s1>Weiter</s1>leo-signal

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-b054c73f22e5 = kein Wert

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Themenseite: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
seg-be21370c2446 = joint

# text
# c1: docs/kinds/by-kind/leo-pvt.md
seg-dfe64e82e4e9 = Quelle: <c1/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f34d4bbcac4d = Ein Lauf von <c1/> fasst sich so zusammen: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-e271a69236bf = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/leo-pvt-fjord-skyline.toml
seg-f850cba7d96e = Das Beispiel <c1/> setzt unter anderem:

# text
seg-bb3b3e8be839 = fjord

# text
seg-b43a7ee40372 = Ergebnisbezeichnung (der Engine): MODELLED gemeinsame Pseudorange-Positionierung nach gewichteten kleinsten Quadraten mit einer Uhr je System oder einem bekannten Versatz; Rauschen aus dem Delay-Lock-Loop-Modell an der C/N0-Hüllkurve plus dem Signal-in-Space-Entfernungsfehler

# text
seg-68aa305e05a4 = <b>VALIDATED</b> Exakte Entfernungsrate eines Satelliten, dessen erdfeste Position und Geschwindigkeit aus einer Zweikörperbahn mit der säkularen J2-Drift und der Erdrotation stammen (leo_fusion::geom::EarthOrbit::state, die Geschwindigkeit ist die exakte zeitliche Ableitung der Position), Tests: <a1>leo_doppler_reference.rs</a1>.

# text
seg-c3ef3e0163f2 = <b>MODELLED</b> Batch-Gauss-Newton-Positionierung aus der Entfernungsrate mit analytischen Partiellen (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), eine konstante Nutzergeschwindigkeit als Option, eine Höhen-Pseudomessung für einen Oberflächennutzer, gedämpft s Tests: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-a4e0166269ea = <b>MODELLED</b> Gauss-Newton-Fixes nach gewichteten kleinsten Quadraten über eine beliebige Mischung von Systemen, eine Empfängeruhr je System (der Inter-System-Bias wird mit der Position geschätzt) oder ein bekannter ausgesendeter Versatz auf der Referenzzeitskala; Sigmas je Messung geliefert von Tests: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-5c9f826efbc8 = <b>MODELLED</b> Uhrenmessungen von jedem sichtbaren LEO-Satelliten an einer bekannten Position, kombiniert durch inverse Varianz aus dem Pseudorange-Rauschmodell, gefiltert durch ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz), dessen Prozessrauschen das der Oszillatorklasse ist w Tests: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-3319b18ac61f = und { "1" } weitere in der Matrix.

# text
seg-f6bd93155e41 = <b>MODELLED</b> Gauss-Newton-Fixes nach gewichteten kleinsten Quadraten über eine beliebige Mischung von Systemen, eine Empfängeruhr je System (der Inter-System-Bias wird mit der Position geschätzt) oder ein bekannter. Orakel (InternalConsistency): Ein von Hand abgeleiteter DOP mit vier Satelliten (ein Satellit im Zenit und drei am Horizont im Abstand von { "120" } deg, deren Normalmatrix sich von Hand invertieren lässt), die strukturelle Identität, dass ein System mit eigener Uhr und einem Satelliten keine Geometrie hinzufügt, rauschfreie Wiedergewinnung von Position, Uhr und Bias sowie mit Seed erzeugte Fehler gegen die Kovarianz. Nur interne Prüfungen; nicht mit der Ausgabe eines Empfängers verglichen. { "0.30" } externer Vergleich, ein Befund

# text
seg-4056b0470099 = <b>MODELLED</b> Systemunabhängige Eingaben: Jedes System ist Walker-Schalen, explizite Elemente oder eine GNSS-Voreinstellung, ein Signal (Träger, Chiprate, Bandbreite, Empfangsleistung oder C/N0-Bereich. Orakel (InternalConsistency): Übertragung der zitierten öffentlichen Werte, auf Struktur geprüft (jede öffentliche Quelle hat eine URL, Walker-Muster teilen sich gleichmäßig, das C/N0 aus der Empfangsleistung über kT bei { "290" } K), nicht gegen eine externe unabhängige Referenz. Repräsentative Werte sind in jeder Voreinstellung benannt und illustrativ

# text
seg-093aac4b5ff1 = Fusionierte Positionierung, Navigation und Zeitgebung (PNT) aus dem mittleren Erdorbit (MEO) und dem niedrigen Erdorbit (LEO) über BELIEBIGE Konstellationen: Jedes [[system]] ist eine GNSS-Voreinstellung der Szenarioart constellation-design, eine LEO-Voreinstellung (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, das Ephemeridenmodell atomic-zero-clock oder eine andere Voreinstellungsdatei, jeweils in einer eigenen Datei mit ihren als PUBLIC, WORKSHOP oder DERIVED markierten Quellen), Walker-Schalen oder explizite Elementsätze, mit einem Träger, einer Chiprate, einer Hüllkurve der Träger-Rausch-Dichte (C/N0) von der Elevationsmaske bis zum Zenit, einem Signal-in-Space-Entfernungsfehler (SISRE), einem Doppler-Sigma und einem Uhrenmodell (die eigene Empfängeruhr, sodass der Inter-System-Bias geschätzt wird, oder ein bekannter ausgesendeter Versatz). Vier Modi. DOPPLER: Batch-Gauss-Newton-Positionierung aus der Entfernungsrate mit analytischen Partiellen, Uhrendrift und optionalen Geschwindigkeitszuständen und einer optionalen Höhenbedingung, mit einem oder mehreren Satelliten, der Fehler gegen die Fensterlänge, die Hüllkurve von Doppler, Dopplerrate und Ruck jedes LEO-Systems und die Genauigkeit in und quer zur Flugrichtung bei einem einzelnen Überflug gegen den Querversatz (der Querfehler wächst unbegrenzt, wenn der Überflug über den Zenit geht; ein einzelner Überflug hat außerdem eine Spiegellösung über der Bodenspur). Ein reines Doppler-Gelegenheitssignal (starlink-sop) läuft hier. GEMEINSAM: Pseudorange-Fixes je Epoche nach gewichteten kleinsten Quadraten aus GNSS allein, LEO allein und beiden, Sigmas je Messung aus einem Thermalrauschmodell der Delay-Lock-Loop bei C/N0 plus dem SISRE (oder einem festen Sigma, sodass ein Signalmodell sie speisen kann), die geschätzten Inter-System-Biases und PDOP/HDOP/VDOP gegen die Zahl der hinzugefügten LEO-Satelliten. POLAR: sichtbare Satelliten und DOP gegen die Breite für GNSS, LEO und beide. ZEITGEBUNG: Zeitübertragung auf die koordinierte Weltzeit (UTC) von LEO-Satelliten an bekannter Position mit einem Uhrenfilter mit zwei Zuständen, dessen Prozessrauschen aus den Oszillatorklassen der Engine stammt, gegen C/N0 und den Oszillator, und der Ausdruck von IS-GPS-200 für Systemzeit zu UTC; mit [timing] trace = true gibt jede Zeile außerdem ihren Zeitfehler und ihr vorhergesagtes Sigma in jeder Epoche an. VALIDATED: der größte Doppler eines Überflugs vom Zenit bis zum Horizont gegen die veröffentlichten Zahlen von Iridium (bis zu { "36" } kHz) und Xona Pulsar X1 ({ "32" } bis { "34" } kHz). MODELLED: alles andere; der DOP wird gegen einen von Hand abgeleiteten Fall geprüft, die Fixes gegen ihre Kovarianz und das Dopplermodell gegen die Identität der Entfernungsbeschleunigung.

# text
seg-49964654d5f4 = Szenarioart der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# attr:alt
seg-90361a6f4e3c = Das Diagramm, das die Engine für scenarios/leo-pvt-fjord-skyline.toml schreibt, Szenarioart leo-pvt

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } mitgelieferte Szenarien verwenden diese Szenarioart; die übrigen stehen in <a1><c1/></a1>.

# text
# c1: leo-pvt
seg-fdba999dab11 = <c1/> (Szenarioart)
