# docs--kind-gnss-sim: translations (de)

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
# c1: docs/kinds/by-kind/gnss-sim.md
seg-d5f4762f8455 = Quelle: <c1/>

# text
# c1: gnss-sim
seg-b634bbba2197 = <c1/> (Szenarioart)

# text
seg-2ffccc9c1eff = Pseudoentfernungssimulation im Messraum (Klobuchar-Ionosphäre, Saastamoinen/Niell-Troposphäre) + RAIM.

# text
# c1: scenarios/gnss-sim-raim.toml
seg-db93cbad6c6d = Ein Lauf von <c1/> fasst sich so zusammen: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: iono
# c2: tropo
# c3: mask_deg
# c4: noise_sigma_m
# c5: multipath_m
# c6: sat_clock_rms_m
# c7: uere_m
# c8: p_fa
# c9: p_md
# c10: alert_limit_h_m
# c11: alert_limit_v_m
# c12: skyline
seg-ee0d38971d08 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/gnss-sim-raim.toml
seg-c7b57e696bc3 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

# attr:alt
seg-47ee40d4eb73 = Das Diagramm, das die Engine für scenarios/gnss-sim-raim.toml schreibt, Art gnss-sim

# text
seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchar-L1-Einfrequenz-Gruppenlaufzeitverzögerung der Ionosphäre entlang des Schrägwegs aus den acht ausgesendeten α/β-Koeffizienten Tests: <a1>klobuchar_reference.rs</a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-Mehrfachhypothesen-Lösungstrennung nach dem ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels und add_v42_protecti. Unabhängige Referenz (ExternalDataset): Drei unabhängige Werkzeuge, vorab registriert (0123cee1), bevor irgendeine Fixture oder Ausgabe der Referenz existierte, Toleranzen damals festgelegt. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (Commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als getrenntes Programm unter GNU Octave { "8.4" } mit einem treiberseitigen unique()-Kompatibilitäts-Shim ausgeführt (offengelegt, keine Algorithmusänderung), beim TOL_PL des ADD von { "0.05" } m: Das Rust reproduziert die ADD-Referenzimplementierung auf

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtliniengeometrie über Q=(HᵀH)⁻¹ mit einer lokalen ENU-Aufteilung. Unabhängige Referenz (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — unabhängige Bibliothek, auf { "1e-6" } relativ getroffen

# text
seg-752829346523 = <b>VALIDATED</b> Klobuchar-L1-Einfrequenz-Gruppenlaufzeitverzögerung der Ionosphäre entlang des Schrägwegs aus den acht ausgesendeten α/β-Koeffizienten. Unabhängige Referenz (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — unabhängige Referenzimplementierung, aus dem Quelltext kompiliert; auf < { "1e-4" } m getroffen

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Der Verteilungskern, auf dem jedes Schutzniveau ruht: die Fehlererkennungsschwelle des Schnappschusses χ²₁₋ₚfₐ(dof), die Nichtzentralität bei verpasster Erkennung pbias=√λ und. Unabhängige Referenz (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — unabhängige Bibliothek (Cephes/Boost), ein anderer Algorithmus als die Reihe der unvollständigen Gammafunktion von Kshana; auf ≤{ "1e-6" } rel. getroffen. Nur der Kern. Die <em>Zuteilung</em> des ARAIM-MHSS-P_HMI-Budgets ist nicht mehr ohne eine veröffentlichte numerische unabhängige Referenz — das durchgerechnete Beispiel der WG-C ARAIM Technical Subgroup selbst stützt jetzt die separate Zeile „ARAIM MHSS protection levels against published referen

# text
seg-cc7018560c2c = Themenseite: <a1>REAL_TLE_GUIDE.md</a1>

# text
seg-53a78e98af12 = Themenseite: <a1>SKYLINE.md</a1>

# text
seg-659e6288ad72 = <s1>Zurück</s1>gnss-ins

# text
seg-7d677a362edd = <s1>Weiter</s1>gnss-ssv
