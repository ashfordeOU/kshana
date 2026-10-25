# docs--kind-lunar-infrastructure: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/lunar-infrastructure.md
seg-e821670a8b55 = Quelle: <c1/>

# text
# c1: lunar-infrastructure
seg-56953faa67ae = <c1/> (Szenario-Kind)

# text
# c1: study
seg-d0fb90f506c9 = MODELLED Studien zu Umlaufbahn und Oberfläche des Mondes als Navigations- und Geodäsie-Infrastruktur, fünf Studien hinter einem Kind, ausgewählt durch <c1/>: od-consistency (Bahnbestimmung an Bord mit Erd-GNSS in einer NRHO oder ELFO gegen eine unabhängige radiometrische Bahnbestimmung vom Boden, beurteilt an ihren eigenen Kovarianzen über eine Monte-Carlo-Simulation mit Seed), carrier-phase (gemeinsame doppeltdifferenzierte Trägerphase von Oberfläche und Orbiter und Auflösung der ganzzahligen Mehrdeutigkeit mit LAMBDA), frame-coestimation (eine Oberflächenstation und Orbiter, die der Entfernungsmessung von Erdstationen für das Helmert-Bezugssystemdatum des Mondes mit sieben Parametern hinzugefügt werden), space-tie (GNSS, VLBI und Laserentfernungsmessung auf einem Raumfahrzeug, Präzision der Bezugssystemanbindung gegen den Fehler der lokalen Anbindung) und geodesy-sensitivity (Fisher-Information der Love-Zahlen h2, k2, l2 des Mondes und der physikalischen Libration aus Laserentfernungsmessung, Orbiter-Verfolgung, einem Oberflächengravimeter und einer Oberflächenuhr). Ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen; die Numerik wird gegen unabhängige Programme geprüft, und nichts wird mit einer Messung einer lunaren Größe verglichen.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-infrastructure space-tie: { "4" } sweep points on { "1" } arcs; laser-vs-GNSS x translation sigma { "1.0363" } m at the registered local tie

# text
# c1: study
seg-f2594b18e718 = Pflichtfelder: <c1/>

# text
# c1: seed
# c2: orbit
# c3: gnss
# c4: ground
# c5: monte_carlo
# c6: surface
# c7: llr
# c8: orbiter
# c9: gravimeter
# c10: clock
# c11: techniques
# c12: nominal
seg-4875c29c517c = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-7b33bdb70a30 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-5fad84cbb2be = nrho

# text
seg-def582a1f2ca = Ergebnisbezeichnung (der Engine): MODELLED — ein eingeschränktes Dreikörpermodell (Erde und Mond als Punktmassen, keine Sonne, keine Schwerefeld-Harmonischen des Mondes) mit angegebenen Vereinfachungen und ILLUSTRATIVEN Eingaben, die mit ihren öffentlichen Quellen bezeichnet sind. Die Numerik wird gegen unabhängige Programme geprüft; nichts wird mit einer Messung einer lunaren Grö

# text
seg-f3b4a80a739b = kein Plot: Das Beispiel schreibt kein Diagramm

# text
seg-35a4a7a25561 = <b>MODELLED</b> Bahnbestimmung in einem nahezu geradlinigen Halo-Orbit (oder einem elliptischen eingefrorenen Orbit) aus zwei unabhängigen Datentypen: Erd-GNSS-Pseudoranges, die an Bord empfangen werden. Orakel (ReferenceImpl): Ein unabhängiges scipy/numpy-Programm integriert dieselben Variationsgleichungen (Zielwert O1). Nichts wird mit einer Messung einer lunaren Bahn verglichen. Die Referenz prüft die Numerik angegebener Formeln, nicht die Physik, daher bleibt die Zeile MODELLED. Eingeschränktes Dreikörpermodell: keine Sonne, keine lunaren Harmonischen, die Erdrotationsachse entlang der Bahnnormalen, ILLUSTRATIVE Eingaben für Empfänger und Station.

# text
seg-32455bf5f804 = <b>MODELLED</b> Einfachdifferenzierte Erd-GNSS-Trägerphase und -Code zwischen Empfängern an einer Mondoberflächenstation und einem Orbiter, wobei die Uhrendifferenz je Epoche herausprofiliert wird. Orakel (ReferenceImpl): Eine unabhängige numpy-Lösung derselben Normalgleichungen aus den exportierten Zeilen (Q3) und eine Brute-Force-Aufzählung der ganzen Zahlen (Q4). Keine GNSS- oder lunare Trägerphasenmessung wird verglichen mit. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Fisher-Information des Helmert-Bezugssystemdatums des Mondes mit sieben Parametern aus der Laserentfernungsmessung von Erdstationen zu den fünf Reflektoren allein und mit Entfernungsmessung von Orbiter zu Oberflächenstation. Orakel (ReferenceImpl): Eine unabhängige finite Differenz des Vorwärtsmodells in numpy (F2). Nichts wird mit echten Lösungen des Mondbezugssystems verglichen. Der Faktor gilt unter der Bedingung der angenommenen bekannten Bahn und des Entfernungs-Sigmas von { "1" } m. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Cramér-Rao-Präzision der Translations-, Maßstabs- und Rotationsversätze zwischen den Techniken GNSS, VLBI und Laserentfernungsmessung, wenn ein Raumfahrzeug alle trägt. Orakel (ReferenceImpl): Ein unabhängiges gestapeltes System in numpy, bei dem die Positionsunbekannten durch explizite Schur-Komplemente eliminiert werden (T3). Keine Daten von GRASP, Genesis oder einer anderen Mission werden verglichen mit. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED — ein eingeschränktes Dreikörpermodell (Erde und Mond als Punktmassen, keine Sonne, keine Schwerefeld-Harmonischen des Mondes) mit angegebenen Vereinfachungen und ILLUSTRATIVEN Eingaben, die mit ihren öffentlichen Quellen bezeichnet sind. Die Numerik wird gegen unabhängige Programme geprüft; nichts wird mit einer Messung einer lunaren Größe verglichen, und nichts hier ist eine Aussage über irgendeine Mission oder ein System. Nicht verbunden mit oder gebilligt von einer Agentur. Beratend (Ergebnis <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = MODELLED Studien zu Umlaufbahn und Oberfläche des Mondes als Navigations- und Geodäsie-Infrastruktur, fünf Studien hinter einem Kind, ausgewählt durch <c1/>: od-consistency (Bahnbestimmung an Bord mit Erd-GNSS in einer NRHO oder ELFO gegen eine unabhängige radiometrische Bahnbestimmung vom Boden, beurteilt an ihren eigenen Kovarianzen über eine Monte-Carlo-Simulation mit Seed), carrier-phase (gemeinsame doppeltdifferenzierte Trägerphase von Oberfläche und Orbiter und ganzzahlige Mehr (Kind-Katalog (<c2/>))

# text
seg-4658f67623b5 = Kshana-Szenario lunar-infrastructure: space-tie. MODELLED; das Design, die Eingaben und die Zielwerte sind in xval/lunar-infra/PREREGISTRATION.md festgelegt (eingecheckt vor jedem Lauf). ILLUSTRATIVE Eingaben sind dort mit ihren öffentlichen Quellen bezeichnet. (Kommentar in der Szenariodatei, Zeilen { "1" } bis { "3" })

# text
seg-f7257c25f137 = Die lunare Bahnbestimmung: Erd-GNSS gegen radiometrisch vom Boden ist MODELLED, nicht validiert: Sie wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = Die lunare Auflösung der Trägerphasen-Mehrdeutigkeit: Oberfläche und Orbiter ist MODELLED, nicht validiert: Sie wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = Die lunare Mitschätzung des Bezugssystems: Oberflächenstationen und Orbiter ist MODELLED, nicht validiert: Sie wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = Die Präzision der Space-Tie-Bezugssystemanbindung: kolokalisierte GNSS, VLBI und Laserentfernungsmessung ist MODELLED, nicht validiert: Sie wird gegen eine getrennte Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Themenseite: <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Zurück</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Weiter</s1>lunar-integrity
