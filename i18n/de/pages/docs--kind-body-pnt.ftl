# docs--kind-body-pnt: translations (de)

# text
seg-5b561b4fd201 = Mars

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
# c1: docs/kinds/by-kind/body-pnt.md
seg-02b8d1f1b7df = Quelle: <c1/>

# text
# c1: body-pnt
seg-e28ba749a2a1 = <c1/> (Szenarioart)

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-e7dad1a1ecba = Positionierung um einen beliebigen Körper des Sonnensystems: ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Zentralkörper (Mars, der Mond, Europa, Ganymed, Titan und der Rest des Katalogs des Sonnensystems), der mit Einweg-Pseudoentfernungen von einer kleinen Walker-Navigationskonstellation um den Körper navigiert (Zweikörperbahnen mit der eigenen säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr) und optional mit einer uhrenfreien Zweiweg-Entfernungsmessung im Weltraum von der Erde, deren Richtung und Entfernung zu jeder Epoche aus der analytischen Ephemeride des Sonnensystems stammen. Sichtlinien werden von der mittleren Kugel des Körpers blockiert, und ein Nutzer auf der Oberfläche braucht außerdem die Elevationsmaske. Je Epoche: Relais in Sicht, ob die Erde über dem Limb steht, das GDOP und PDOP der reinen Konstellation (geometrische und Positions-Verdünnung der Genauigkeit), die formale Ein-Sigma-Positionsunsicherheit mit und ohne die Erdzeile und der Fehler einer mit Seed erzeugten Gauß-Newton-Kleinste-Quadrate-Lösung in beiden Fällen; über den Lauf: Verfügbarkeit, Erdsichtbarkeit, medianes PDOP, RMS-Fehler und medianes formales Sigma, dazu Lichtlaufzeit von der Erde zum Körper, Hin- und Rückweg, Shapiro-Verzögerung und Sonnenabstand zur Epoche. MODELLED: Die Relaisbahnen, die Rauschpegel und das momentane Messmodell sind Modellierungsentscheidungen, nicht gegen Navigationsdaten einer Mission validiert; die Körperkonstanten sind die in body.rs genannten veröffentlichten Werte, und die Erdgeometrie erbt die Bezeichnungen der Ephemeride des Sonnensystems.

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-c90c1a79f88b = Ein Lauf von <c1/> fasst sich so zusammen: Positioning around Mars — orbiter user, { "12" } relays at { "10000" } km, { "296" } epochs Earth light time { "338.3" } s one-way, { "676.6" } s round trip; Sun-Earth-body angle { "175.4" } deg availability: { "1.000" } constellation only, { "1.000" } with the Earth range (Earth in view { "0.811" }) median PDOP { "1.375" } ; RMS error { "1.883" } m constellation only, { "1.629" } m with the Earth range median formal sigma { "1.375" } m constellation only, { "1.304" } m with the Earth range

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-31bacf177d9c = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-3f1989254167 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

# text
seg-753b1683fb7b = m^3/s^{ "2" }

# text
seg-81d4cd54bd62 = Ergebnisbezeichnung (die der Engine): MODELLED: Zweikörper-Relaisbahnen mit säkularer J2-Drift, geometrische Sichtbarkeit, gaußsches Entfernungsrauschen und ein momentanes Messmodell um einen Körper aus den veröffentlichten Konstanten; nicht gegen Navigationsdaten einer Mission validiert. Die Geometrie von der Erde zum Körper erbt die Bezeichnung der Ephemeride des Sonnensystems

# attr:alt
seg-6f341acbe994 = Das Diagramm, das die Engine für scenarios/mars-orbit-pnt.toml schreibt, Art body-pnt

# text
seg-dae4184bb004 = <b>VALIDATED</b> Die newtonsche Einweg-Lichtlaufzeit von einem beliebigen Körper zu einem beliebigen anderen, empfangen zu einer Epoche, gelöst vom radiometrischen Fixpunkt-Lichtlaufzeitlöser (radiometric::light_time_solution, Sender an seiner retardierten Position) über solar_system::link_o Tests: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Körper navigiert mit Einweg-Pseudoentfernungen von einer Walker-Navigationskonstellation um den Körper (Zweikörperbahnen mit der säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr

# text
# c1: body-pnt
seg-5c3f8ac041d3 = <b>MODELLED</b> Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen namentlich gewählten Körper navigiert mit Einweg-Pseudoentfernungen von einer Walker-Navigationskonstellation um. Unabhängige Referenz (InternalConsistency): Geschlossene Formen und Selbstkonsistenz: das dritte Keplersche Gesetz für die Relaisperiode, der über den Lauf gehaltene Bahnradius und Oberflächenradius, die Tatsache, dass eine zusätzliche Messung die formale Unsicherheit nie erhöht, und die mit Seed erzeugten Fehler, die mit der Kovarianz übereinstimmen. Die Relaisbahnen ignorieren Drittkörper (der Zug Jupiters an Relais um Europa wird nicht modelliert), das Rauschen ist gaußsch auf den genannten Pegeln, und das Messmodell ist momen

# text
# c1: label
seg-64920deda9cd = MODELLED: Zweikörper-Relaisbahnen mit säkularer J2-Drift, geometrische Sichtbarkeit, gaußsches Entfernungsrauschen und ein momentanes Messmodell um einen Körper aus den veröffentlichten Konstanten; nicht gegen Navigationsdaten einer Mission validiert. Die Geometrie von der Erde zum Körper erbt die Bezeichnungen der Ephemeride des Sonnensystems. (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-bcb5cbf9cbe3 = MODELLED: Die Relaisbahnen, die Rauschpegel und das momentane Messmodell sind Modellierungsentscheidungen, nicht gegen Navigationsdaten einer Mission validiert; die Körperkonstanten sind die in body.rs genannten veröffentlichten Werte, und die Erdgeometrie erbt die Bezeichnungen der Ephemeride des Sonnensystems. (Artenkatalog (<c1/>))

# text
seg-04cd882741e2 = MODELLED. Die Relaisbahnen, das Entfernungsrauschen von { "1" } m und das momentane Messmodell sind Modellierungsentscheidungen; nichts hiervon ist gegen Navigationsdaten einer Mission validiert. Die Mars-Konstanten sind die in src/body.rs genannten veröffentlichten Werte. (Kommentar der Szenariodatei, Zeilen { "20" } bis { "22" })

# text
seg-df6bae4c422e = Positionierung um einen beliebigen Körper des Sonnensystems mit einer lokalen Konstellation und einer Weltraumverbindung von der Erde ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-670191cf797f = Themenseite: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Themenseite: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-a4c650a0eb7a = <s1>Zurück</s1>attitude-budget

# text
seg-96170e5c8e3f = <s1>Weiter</s1>campaign
