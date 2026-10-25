# docs--kind-lunar-joint-od-clock: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
# c1: docs/kinds/by-kind/lunar-joint-od-clock.md
seg-593938ee5995 = Quelle: <c1/>

# text
# c1: lunar-joint-od-clock
seg-d54a85227f43 = <c1/> (Szenario-Kind)

# text
seg-200e58e189c2 = Modellierter gemeinsamer Batch-Schätzer für lunare Bahnbestimmung (OD) + Uhren mit mehreren Techniken auf einem SIMULIERTEN Netz: eine Gauss-Newton-Momentaufnahmeanpassung, die geodätische VLBI-Verzögerungen auf Erdbasislinien, lunar-lokale Entfernungen zwischen Station und Satellit und Entfernungen zwischen Satelliten fusioniert, um gemeinsam die 3D-Position einer lunaren Oberflächenstation, die Positionen einer kleinen Konstellation und den Uhrenversatz jedes Assets aus einer eingespeisten Wahrheit zurückzugewinnen. Das ehrliche Hauptergebnis — VLBI macht die volle 3D-Position der Station beobachtbar, wo die lunar-lokale Entfernungsmessung allein eine schwach beobachtete Richtung lässt — wird als Kontrast des Stationsfehlers mit gegenüber ohne VLBI ausgegeben. MODELLED simulierte Wiedergewinnung im geschlossenen Regelkreis (die Wahrheit teilt das Beobachtungsmodell), deterministisch (mit Seed), NICHT mit realen Daten validiert; keine Kraftmodell-Propagation im Löser; kein TRL/Flugerbe/keine Billigung durch eine Agentur.

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-6419390eeae4 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-joint-od-clock | { "3" } sats, { "6" } Earth stations | station 3-D err with VLBI { "3.54" } m vs range-only { "2184.02" } m ({ "617.5" }× sharper) | sat pos RMS { "2.20" } m | station clk err { "2.87e-10" } s | obs 40/16 params

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-be3bcad756cc = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-joint-od-clock.toml
seg-ef164af52468 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

# attr:alt
seg-cfa051b87e59 = Das Diagramm, das die Engine für scenarios/lunar-joint-od-clock.toml schreibt, Kind lunar-joint-od-clock

# text
seg-4c6914c162d1 = <b>VALIDATED</b> Batch-Fusion von VLBI + lunar-lokaler Entfernung + Entfernung zwischen Satelliten, um Positionen und Uhren von Station und Konstellation zurückzugewinnen. Orakel (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq mit LAPACK gelsd, numpy.linalg.inv; BSD-3) berechnet jeden Gauss-Newton-Schritt, die konvergierte Lösung nach gewichteten kleinsten Quadraten, die formalen Sigmas und den Stationsfehler auf den eingecheckten Jacobi-Matrizen und Beobachtungen von sechs simulierten Netzen neu, vorab registriert (5094bc31) bei relativ max({ "1e-8" }, { "100" } kappa eps). Der erste Lauf scheiterte am Netz ohne VLBI ({ "6.1e-7" } gegen { "1e-8" }, eine Normalgleichung

# text
seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher-Information M=HᵀWH, Cramér-Rao-Untergrenze, Beobachtbarkeitsrang / Nullraum des Datumsdefekts (Moore-Penrose-Pseudoinverse) und D/A/E/T-optimaler Versuchsentwurf. Orakel (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-gestützt) — eine unabhängige Instanz eines Drittanbieters, die dieselben eindeutig definierten Eigenwerte, die Cramér-Rao-Kovarianz σ²(XᵀX)⁻¹ und die GNSS-Faktoren der Präzisionsverdünnung mit einem anderen Algorithmus (LAPACK Divide-and-Conquer + LU) berechnet als der zyklische Jacobi-Sweep und die spektrale Pseudoinverse von Kshana; abgeglichen auf { "1e-9" }. Dieselbe Klasse externer Bibliotheken validiert bereits die D

# text
seg-af12da412a10 = <b>MODELLED</b> Beobachtbarkeit der gemeinsamen lunaren Lösung über die Fisher-Information: Ohne Erdbasislinien liegt das Datum des absoluten Bezugssystems im Nullraum von HᵀWH (Stationsposition uno. Orakel (InternalConsistency): Analytische Struktur des Datumsdefekts — der nicht beobachtbare Modus des absoluten Bezugssystems liegt im Nullraum der Fisher-Information (geschlossene Form), die Rangschwelle entspricht der veröffentlichten Begründung des Designs mit 3 Stationen, und der Schätzer erreicht die daraus folgende CRLB in der Monte-Carlo-Simulation. Die lunare Geometrie selbst ist ein repräsentatives Netz (keine geflogene Ephemeride), daher bleibt die Zeile MODELLED; die zugrunde liegende FIM/CRLB-Engine wird gegen

# text
# c1: kshana kinds --json
seg-865ba2668582 = MODELLED simulierte Wiedergewinnung im geschlossenen Regelkreis (die Wahrheit teilt das Beobachtungsmodell), deterministisch (mit Seed), NICHT mit realen Daten validiert; keine Kraftmodell-Propagation im Löser; kein TRL/Flugerbe/keine Billigung durch eine Agentur. (Kind-Katalog (<c1/>))

# text
seg-a0d4350a1c66 = Ehrlichkeit: MODELLED simulierte Wiedergewinnung im geschlossenen Regelkreis. Eine eingespeiste Wahrheit wird durch DASSELBE Geometriemodell, das der Löser invertiert, auf synthetische Observablen abgebildet, Gaußsches Rauschen mit Seed wird hinzugefügt, und der Schätzer gewinnt die eingespeiste Wahrheit im Rahmen des Rauschens zurück. Die unabhängige Referenz ist die interne Konsistenz (Wiedergewinnung der Wahrheit + Realismus der NEES-Kovarianz), KEINE Validierung mit realen Daten. Im Löser gibt es keine Kraftmodell-Propagation — der Sate (Kommentar in der Szenariodatei, Zeilen { "24" } bis { "29" })

# text
seg-1465694e7e4f = Die lunare Beobachtbarkeit der absoluten Station (Datumsdefekt) ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e6962535ee72 = <s1>Zurück</s1>lunar-jamming

# text
seg-2ef5c8112d1b = <s1>Weiter</s1>lunar-llr-datum
