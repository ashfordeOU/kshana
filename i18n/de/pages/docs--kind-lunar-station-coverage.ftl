# docs--kind-lunar-station-coverage: translations (de)

# text
seg-9feefecdcf67 = rafs

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Differentielle Referenzstation der Klasse NovaMoon: Aufhebung des Gleichtakts + mit der Basislinie wachsender Restfehler + DGNSS-Schutzniveaus. Orakel (InternalConsistency): Identität der differentiellen Fehleraufhebung + Wiederverwendung der PL-Maschinerie von SBAS nach DO-229E; die Einfachdifferenz + WLS-Lösung wird zusätzlich gegen lsq()/matinv() von RTKLIB gegengeprüft (Takasu, BSD-2-Clause, kompiliertes C) — unabhängiger Löser-Code, aber dieselbe Algebra der Sichtliniendifferenz erster Ordnung, daher weiterhin InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Die drei Terme, die eine differentielle Korrektur zwischen der Epoche, in der sie berechnet wird, und der Epoche, in der sie verwendet wird, aufnimmt, jeder zuvor als nicht modellierter Spielraum belassen:. Orakel (InternalConsistency): Identitäten in geschlossener Form und Selbstkonsistenz: die Varianz step²/12 des gleichförmigen Quantisierers, die exakte Kovarianzfortpflanzung (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, die für gleiche σ auf σ·PDOP zusammenfällt, die { "1" }:{ "1" }-Übertragung des Vermessungsterms als Folge von û_user ≈ û_ref und der Abschluss der Quadratur beim Abschalten. Die PDOP-Gegenprüfung gegen orbit::dop teilt sich die Normalmatrix [−û, { "1" }], ist also eine Konsistenzprüfung und wird als solche bezeichnet, statt als

# text
seg-7171b2e3f29d = Das lunare differentielle PNT ist MODELLED, nicht validiert: Es wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Das lunare differentielle PNT — Restfehlerbudget der Korrekturstrecke ist MODELLED, nicht validiert: Es wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Themenseite: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Quelle: <c1/>

# text
seg-f7ea776e70c9 = Modellierte Abdeckung einer lunaren Referenzstation: ein Monte-Carlo-Durchlauf des Modells für lunares differentielles PNT über ein Nutzergitter am Südpol und einen Tag an Epochen. Eine differentielle Referenzstation an einem bekannten Standort am Südpol korrigiert eine angegebene Konstellation (illustrativ keplersch oder eine tabellierte Ephemeride) mit einem angegebenen Signal-in-Space-Fehler, Vermessungsfehler, einer Korrekturlatenz und Quantisierung der Verbindung; je Punkt und über die Region gibt es den Perzentilwert des korrigierten und des unkorrigierten Positionsfehlers (3D, horizontal, vertikal), die Verfügbarkeit, die Abdeckung gegen eine angegebene Schwelle, Schutzniveaus nach DO-229E, den Abdeckungsradius je Azimut und das Link-Budget der Korrekturstrecke an der Station und am ungünstigsten Punkt an. Keine Aussage über die Leistung irgendeines realen Systems; nicht mit einer Agentur verbunden oder von ihr gebilligt. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-station-coverage | { "346" } points x { "144" } epochs x { "200" } trials | availability { "92.2" } % | coverage { "76.5" } % (p95 <= { "20" } m) | corrected p95 3-D { "15.592" } m (uncorrected { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; not a statement about any real system

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-cb73ac0d57de = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

# text
# c1: scenarios/lunar-station-coverage.toml
seg-0c3460704315 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-2d84b341a41f = Ergebnisbezeichnung (der Engine): MODELLED

# text
# c1: label
seg-626ab55f0424 = MODELLED (Ergebnis <c1/>)

# text
seg-6f09def22469 = EHRLICHKEIT: MODELLED. Unter den unten angegebenen Annahmen liefert das Modell diese Zahlen. Keine Aussage über die Leistung irgendeines realen Systems; nicht mit einer Agentur verbunden oder von ihr gebilligt; kein Anspruch auf TRL oder Flugerbe. Weggelassen: Gelände- und Horizontabschattung am Pol (die erste Einschränkung), Mehrwegeausbreitung, Empfängerhardware. (Kommentar in der Szenariodatei, Zeilen { "15" } bis { "18" })

# text
seg-db27cc015952 = Die Abdeckungs- und Genauigkeitskarte der lunaren Referenzstation ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Zurück</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Weiter</s1>lunar-time-budget

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (Szenarioart)

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Monte-Carlo-Durchlauf des Modells für lunares differentielles PNT über ein Nutzergitter am Südpol und einen Tag an Epochen (die Szenarioart <c1/>): für eine differentielle Referenzstation an einem bekannten Standort am Südpol, je Punkt und über die Region, die Tests: <a1>lunar_station_coverage_reference.rs</a1>.

# attr:alt
seg-922b8656fcae = Das Diagramm, das die Engine für scenarios/lunar-station-coverage.toml schreibt, Szenarioart lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Monte-Carlo-Durchlauf des Modells für lunares differentielles PNT über ein Nutzergitter am Südpol und einen Tag an Epochen (die Szenarioart <c1/>): für eine differentielle R. Orakel (InternalConsistency): Arithmetik, von einem unabhängigen numpy-Skript an exportierten Fällen neu berechnet (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; vorab registriert in tests/fixtures/lunar_station/PREREGISTRATION.md, allein eingecheckt in 9caedf97 vor dem ersten Lauf): bei { "20" } Fällen mit allen eingeschalteten Fehlertermen sind die sichtbaren Mengen und der Status identisch, die rohen Entfernungsfehler stimmen auf { "1.4e-14" } m überein, die Positionsfehlervektoren und -beträge auf { "1.4e-9" } m gegen
