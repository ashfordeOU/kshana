# docs--kind-integrity: translations (de)

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> Der optionale Abschnitt [integrity] des Typs clock (clock_integrity::run): aus einem festgelegten Standort und Konstellations-Voreinstellungen (geometry::sky_geometry), zu jeder Integritätsepoche, solange die GNSS-Zeitreihe nicht gesperrt ist, Snapshot-RAIM (raim::snapshot_ Tests: <a1>clock_integrity.rs</a1>.

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-Mehrfachhypothesen-Lösungstrennung nach dem ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels und add_v42_protecti. Unabhängige Referenz (ExternalDataset): Drei unabhängige Werkzeuge, vorab registriert (0123cee1), bevor irgendeine Fixture oder Ausgabe der Referenz existierte, Toleranzen damals festgelegt. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (Commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als getrenntes Programm unter GNU Octave { "8.4" } mit einem treiberseitigen unique()-Kompatibilitäts-Shim ausgeführt (offengelegt, keine Algorithmusänderung), beim TOL_PL des ADD von { "0.05" } m: Das Rust reproduziert die ADD-Referenzimplementierung auf

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtliniengeometrie über Q=(HᵀH)⁻¹ mit einer lokalen ENU-Aufteilung. Unabhängige Referenz (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — unabhängige Bibliothek, auf { "1e-6" } relativ getroffen

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Der Verteilungskern, auf dem jedes Schutzniveau ruht: die Fehlererkennungsschwelle des Schnappschusses χ²₁₋ₚfₐ(dof), die Nichtzentralität bei verpasster Erkennung pbias=√λ und. Unabhängige Referenz (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — unabhängige Bibliothek (Cephes/Boost), ein anderer Algorithmus als die Reihe der unvollständigen Gammafunktion von Kshana; auf ≤{ "1e-6" } rel. getroffen. Nur der Kern. Die <em>Zuteilung</em> des ARAIM-MHSS-P_HMI-Budgets ist nicht mehr ohne eine veröffentlichte numerische unabhängige Referenz — das durchgerechnete Beispiel der WG-C ARAIM Technical Subgroup selbst stützt jetzt die separate Zeile „ARAIM MHSS protection levels against published referen

# text
# c1: docs/kinds/by-kind/integrity.md
seg-4bec24cd43f6 = Quelle: <c1/>

# text
# c1: integrity
seg-dd304550e695 = <c1/> (Szenario-Kind)

# text
seg-eb7e0c2feb2b = Snapshot-/Lösungstrennungs-/ARAIM-RAIM mit HPL/VPL und einem Stanford-Diagramm.

# text
# c1: scenarios/integrity-raim.toml
seg-706887c285d8 = Ein Lauf von <c1/> fasst sich so zusammen: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
seg-c3f7debf260a = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: sigma_ura_m
# c2: b_nom_m
# c3: constellations
# c4: seed
# c5: araim_dual
# c6: p_hmi
# c7: skyline
seg-7b28ab6567df = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/integrity-raim.toml
seg-581a5231b230 = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-ce7f6130ddee = Das Diagramm, das die Engine für scenarios/integrity-raim.toml schreibt, Kind integrity

# text
seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die dieses Kind nennen.

# text
seg-dff469738ec3 = <b>VALIDATED</b> TPL durch Lösungstrennung für skalare Zeit über heterogene Quellen; PL getrieben vom Rauschen der Teilmenge mit dem schlechtesten Ausschluss + UTC(k)-Bias

# text
seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); unterhalbstetiges PL({ "0" }+)≥PL({ "0" }−); K(IR/2) laufendes Maximum; τ/τ³/τ⁵-Phasenexponenten

# text
seg-4787b0b565df = <b>VALIDATED</b> Die Hüllkurve des laufenden Maximums überdeckt (ohne Durchstoßen) eine reale metrologische Reihe bei jeder getesteten Verzögerung tau>=90d auf einem disjunkten Segment; kurzes tau (<=30d) ist eine offengelegte modellierte Grenze Tests: <a1>cti_holdover_coverage_reference.rs</a1>.

# text
seg-090415eca3b7 = und { "6" } weitere in der Matrix.

# text
seg-b4bc9ccbcee2 = <s1>Zurück</s1>ins-trn-coast

# text
seg-f1ba804baade = <s1>Weiter</s1>jamming
