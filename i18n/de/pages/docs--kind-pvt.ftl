# docs--kind-pvt: translations (de)

# text
seg-debc2f07db78 = true

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry und check: eine Monte-Carlo-Simulation mit Seed (N = { "20,000" } Epochen pro Geometrie, sigma = { "1.5" } m, ChaCha8-Seed { "36" } + i) des iterierten Kleinste-Quadrate-Fixes der Engine (pvt::solve_spp, Einheitsgewichte, aus der wahren Position gelöst) auf Tests: <a1>uere_dop_monte_carlo.rs</a1>.

# text
# c1: docs/kinds/by-kind/pvt.md
seg-aab2f85048b7 = Quelle: <c1/>

# text
seg-b7b67e03f125 = Einzelpunkt-Positionierung aus realen Beobachtungen: die Position eines Empfängers aus einer RINEX-{ "3" }-Beobachtungsdatei und einer Broadcast-Navigationsdatei lösen (Code-Pseudoentfernungen, Broadcast-Ephemeride, Klobuchar-Ionosphäre, Saastamoinen/Niell-Troposphäre), optional gegen eine vermessene Koordinate validiert.

# text
# c1: scenarios/pvt-abmf.toml
seg-79d2a463393d = Ein Lauf von <c1/> fasst sich zusammen als: pvt 55bdd18628e1 | { "11" } Sat nav | 2/3 Epochen gelöst | im Mittel { "9.0" } Satelliten, PDOP { "1.8" } | 3D-Fehler RMS { "5.74" } m (max { "7.12" } m)

# text
# c1: obs_rinex
# c2: nav_rinex
seg-fd22bc5c2b67 = Erforderliche Felder: <c1/>, <c2/>

# text
# c1: truth_ecef
# c2: apriori_ecef
# c3: mask_deg
# c4: dual_frequency
seg-4b39ee73d65d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/pvt-abmf.toml
seg-4f02bdcbc7c7 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

# text
seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

# text
seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

# text
seg-e6f678eeb384 = <b>MODELLED</b> Divergenzfreier Hatch-Filter (ionosphärenfreier Code, getragen von der ionosphärenfreien Trägerphase, Fenster N Epochen, Neustart bei Lock-Verlust, geometriefreiem Sprung oder Lücke) in der Anordnung der präzisen Einzelpunkt-Positionierung

# text
seg-5a42823318a8 = <b>VALIDATED</b> Kepler-Broadcast-Ephemeride nach IS-GPS-200 / Galileo-OS / BeiDou-OS → ECEF-Satellitenposition aus einem geparsten RINEX-3-Navigationsdatensatz. Unabhängige Referenz (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos(), aus C-Quellcode kompiliert (T. Takasu, BSD-2-Clause) — eine unabhängige Implementierung von IS-GPS-200/SIS-ICD, gespeist mit denselben RINEX-3-Navigationsdatensätzen; die ECEF-Satellitenposition stimmt auf ~{ "62" } nm überein. (Die Interpolation präziser SP3-Ephemeriden ist gesondert validiert — siehe 'SP3 precise-ephemeris interpolation')

# text
seg-51cac2f918e0 = Themenseite: <a1>POSITIONING.md</a1>

# text
seg-8ea056f1d7e0 = <s1>Zurück</s1>passes

# text
seg-d1dc82bbfb73 = <s1>Weiter</s1>quantum-anomaly-detect

# text
# c1: pvt
seg-56f864d32367 = <c1/> (Szenarioart)

# attr:alt
seg-d76d59644d84 = Das Diagramm, das die Engine für scenarios/pvt-abmf.toml schreibt, Art pvt
