# docs--kind-fusion: translations (de)

# text
seg-03442e4be82d = Datenblatt Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifizierte/Hadamard-Abweichung + Potenzgesetz-Rauschidentifikation mit χ²-Konfidenzintervallen. Unabhängige Referenz (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-Referenzabweichungen auf NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Geschlossene Formel für das Wachstum des Auslauffehlers + Holdover bis zum Schwellenwert; Quantenuhr-Klassen. Unabhängige Referenz (ReferenceImpl): Mehrschritt-Kovarianzrekursion von clock_state (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Inversion ist extern gegen scipy validiert (siehe „Clock-holdover coast-variance & threshold inversion“). Die Holdover-Werte je Klasse mit Rotrauschboden bleiben MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-Zustands-Van-Loan-Kalman-Uhr (Phase/Frequenz/Drift), Joseph-stabilisiert. Unabhängige Referenz (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Van-Loan-{ "1978" }-Blockmatrix – eine unabhängige Referenzimplementierung, die die vollständige Filtertrajektorie von kshana reproduziert. Konsistenz über Implementierungen hinweg: Die Uhrenphysik / Allan-Kalibrierung ist nicht extern validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf IGS-Final-{ "30" }-s-Uhren von { "11" } GPS Blo

# text
seg-e12f672ae71d = GNSS-gesperrter Uhren-Holdover ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Die Zustandsschätzung der Bordzeit-Uhr ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spoofing-Erkennung ist MODELLED, nicht validiert: eine Teilaussage ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = und { "4" } weitere in der Matrix.

# text
# c1: docs/kinds/by-kind/fusion.md
seg-4de09fe367df = Quelle: <c1/>

# text
# c1: fusion
seg-53e498cffeba = <c1/> (Szenarioart)

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-ec26df467b88 = Gemeinsame Kalman-Sensorfusion für PNT über dieselben Hybrid-Eingaben.

# text
# c1: scenarios/fusion-pnt.toml
seg-25708bf88728 = Ein Lauf von <c1/> fasst sich so zusammen: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: coupled
seg-3d5cae65f093 = Optionale Felder: <c1/>

# text
# c1: scenarios/fusion-pnt.toml
seg-56bca36cabba = Das Beispiel <c1/> setzt unter anderem:

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-5d3f15c0688a = Quarzbeschleunigungsmesser in Navigationsqualität; anschauliche Rauschdr

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-6ddd8a067e26 = Kaltatom-Beschleunigungsmesser, geringes Geschwindigkeits-Random-Walk bei großem tau;

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e79eecc14bea = Quarzbeschleunigungsmesser in Navigationsqualität; a

# attr:alt
seg-c8a1c797f4b1 = Das Diagramm, das die Engine für scenarios/fusion-pnt.toml schreibt, Art fusion

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-46c0903ff7b5 = <b>VALIDATED</b> Einen Epochenzustand [r,v] aus Bodenstationsentfernungen durch einen Gauß-Newton-Batch-Differenzialkorrektor und ein sequenzielles Filter wiederherstellen, über ein Kraftmodell Zweikörper+J2 Tests: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

# text
seg-44f77aaf9d7e = <b>MODELLED</b> Fehlerzustands-EKF über { "15" } INS-Zustände, eine Empfängeruhr mit zwei Zuständen und eine Float-Trägermehrdeutigkeit je verfolgtem Satelliten; Pseudoentfernung, Trägerphase und optionale Entfernungsrate aus einer SGP4-Walker-Konstellation (Lichtlaufzeit und Sagnac), Klobuchar un Tests: <a1>fusion_carrier_tc.rs</a1>.

# text
seg-509f93c7e9ce = <b>MODELLED</b> Drei Szenarien gnss-ins auf der Trajektorienbibliothek (ein Schiff, das mit { "8" } m/s zickzackt, mit einem Fünf-Minuten-Ausfall; ein Zug durch einen Zwei-Satelliten-Einschnitt und einen Tunnel; ein Flugzeug, dessen Ausfall eine Kurve mit 25 Grad Querneigung abdeckt) und das optionale des Pakets Tests: <a1>gnss_ins_packs.rs</a1>.

# text
seg-e0633b308e4e = <b>MODELLED</b> Ein gestapeltes Kalman-Filter über Position, Geschwindigkeit, Uhrenphase und -frequenz, gespeist mit Pseudoentfernungen, die Position und Uhr koppeln (Joseph-Form-Updates mit Kreuzkovarianz); eine 1-DOF-Variante, erweitert um einen konstanten Beschleunigungsmesser-Bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über das Holdover. Unabhängige Referenz (ReferenceImpl): Unabhängige numpy-Monte-Carlo-SDE-Integration des doppelt integrierten weißen Beschleunigungsrauschens (validiert die analytische VRW-Varianz durch einen wirklich unabhängigen Algorithmus) + ein Anker mit veröffentlichtem Wert von Groves { "2013" } für die Bias-/Skalenfaktor-Terme; die CAI-Gerätezahlen quantifizieren Partner-Hardware und bleiben MODELLED

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Die Resilienz der Quanten-Inertial-Koppelnavigation ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
seg-a849735fcc6e = Themenseite: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c894aa7d9585 = <s1>Zurück</s1>ephemeris

# text
seg-d14a7850df1c = <s1>Weiter</s1>gnss-ins
