# docs--kind-inertial: translations (de)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-b054c73f22e5 = kein Wert

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = und { "4" } weitere in der Matrix.

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

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
seg-ca448daf5ec7 = nominal

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Themenseite: <a1>QUANTUM.md</a1>

# text
seg-7bebd09c614b = Quarz-Beschleunigungsmesser der Navigationsklasse (Honeywell QA-2000 / G

# text
# c1: docs/kinds/by-kind/inertial.md
seg-cead54058894 = Quelle: <c1/>

# text
# c1: inertial
seg-783be547f01e = <c1/> (Szenario-Kind)

# text
seg-bdedf28adc48 = Inertiale 1-DOF-Koppelnavigation während eines GNSS-Ausfalls.

# text
# c1: scenarios/imu-deadreckoning.toml
seg-55b5599ef867 = Ein Lauf von <c1/> fasst sich so zusammen: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
seg-b05c3cb45c0d = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
seg-94fd9afe6f30 = Optionale Felder: <c1/>

# text
# c1: scenarios/imu-deadreckoning.toml
seg-bd021b5dff80 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-8a9e52e38b05 = Hybrider Quanten-Beschleunigungsmesser-Triade von Exail: Bias-Stabilität 6e-

# attr:alt
seg-873c402bb724 = Das Diagramm, das die Engine für scenarios/imu-deadreckoning.toml schreibt, Kind inertial

# text
seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die dieses Kind nennen.

# text
seg-41f3a20fadfb = <b>VALIDATED</b> Strapdown-Inertialmechanisierung mit Quaternionen-Lage im WGS-84-NED-System (Coning/Sculling-kompensiert), die einen Navigationszustand aus (Δθ, Δv)-Inkrementen fortschreibt Tests: <a1>classical_strapdown_ins_reference.rs</a1>.

# text
seg-102d2e51460e = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN) Tests: <a1>quantum_inertial_sensor_reference.rs</a1>.

# text
seg-83fa50d4859a = <b>MODELLED</b> Dynamikbereich der Mach-Zehnder-Streifenmehrdeutigkeit: Die 2π-periodische Streifenauslesung legt eine maximale eindeutige spezifische Kraft a_max=π/(k_eff·T²) fest, und der eindeutige Bereich in Auflösungszellen a_max/σ_a=π/σ_Φ ist unabhängig vom optischen Skalenfakt

# text
seg-89ec2e65cf4f = <b>MODELLED</b> Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über den Holdover Tests: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
seg-fab4c926e628 = <s1>Zurück</s1>impairment-eval

# text
seg-aa783749183d = <s1>Weiter</s1>ins-trn-coast
