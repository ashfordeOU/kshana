# docs--kind-hybrid-ukf: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-debc2f07db78 = true

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
seg-ea4498cc0324 = <b>VALIDATED</b> Fehlerzustands-EKF mit 15 Zuständen, lose gekoppelt (auf einer realen IMU/GNSS-Fahrt gegen NaveGo validiert); ein eng gekoppeltes Pseudoentfernungs-/Doppler-UKF und eine gekoppelte Uhr+Pos. Unabhängige Referenz (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als Werkzeug unter GNU Octave ausgeführt, nie gelinkt): sein lose gekoppeltes ins_gnss auf seiner eigenen realen Ekinox-IMU/GNSS-Landfahrzeugfahrt, beide Lösungen gegen die Ekinox-Referenztrajektorie bewertet. Beide Filter lesen dieselbe { "20" }-Hz-Float32-Eingabe, und die Konfiguration von Kshana wird mechanisch aus den veröffentlichten Parametern des Datensatzes abgebildet. Der horizontale und vertikale Positions-RMS von Kshana und sein

# text
# c1: docs/kinds/by-kind/hybrid-ukf.md
seg-4b84d9846715 = Quelle: <c1/>

# text
seg-c6edf89eb8d4 = Hybrider eng gekoppelter 17-Zustands-GNSS/INS-UKF aus Quanten- und klassischer Technik (MODELLED): { "15" } INS-Fehlerzustände + eine aus CAI abgeleitete Beschleunigungs-Bias-Korrektur + eine 2-Zustands-Uhr (Phase + Frequenz) aus der Uhren-Engine mit q-Parametern, angetrieben vom eingegrenzten CAI-Fehlermodell. Die Gütezahl ist die Selbstkonsistenz des Filters (NEES + Innovationsweißheit gegen χ²-Grenzen) — eine Aussage zur Selbstkonsistenz, KEINE Genauigkeitsgarantie für die reale Welt. Nur Simulation; kein TRL>{ "3" }, kein Flugerbe, keine externe Validierung.

# text
# c1: scenarios/hybrid-ukf.toml
seg-d43a562eb9c2 = Ein Lauf von <c1/> fasst sich so zusammen: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
seg-be1b25b8551d = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: residual_accel_bias_m_s2
# c2: speed_m_s
# c3: sigma_pr_m
# c4: sigma_rr_mps
# c5: consistency_seeds
# c6: q_factor
# c7: r_factor
seg-139800576fb7 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/hybrid-ukf.toml
seg-40773fa1ab5f = Das Beispiel <c1/> setzt unter anderem:

# text
seg-5e9c8b22ed24 = Interferometrischer Kaltatom-Beschleunigungsmesser (Rb-87 D2); eingegrenzt

# text
seg-4c8e2caeba5b = Ultrastabile/optische Oszillatorklasse an Bord, White-FM-Sigm

# text
seg-5719161d0b2a = <b>MODELLED</b> Eingegrenzte (beste/nominelle/konservative) Leistung eines Kaltatom-Interferometers — Bias-Instabilität, Geschwindigkeits-/Winkel-Random-Walk, Skalenfaktor-Stabilität, Interrogation. Orakel (InternalConsistency): Interne Konsistenz: die zitierte VRW-Eingrenzung, gegengeprüft mit der Physik von CaiAccelerometer::accel_asd + dem rohen Dynamikbereich, berechnet aus der Streifen-Mehrdeutigkeitsgrenze; die Zahlen sind MODELLED Eingrenzungen aus der Literaturübersicht (needs_source_confirmation), kein Gerät validiert, kein Validierungs-Halo

# text
seg-b06538ca3a8c = Hybrider eng gekoppelter 17-Zustands-GNSS/INS-UKF aus Quanten- und klassischer Technik (MODELLED). (Kommentar in der Szenariodatei, Zeile { "1" })

# text
seg-b5fc96916b4e = GÜTEZAHL — Selbstkonsistenz des Filters (NEES + Innovationsweißheit), das Einzige, was eine Simulation über einen Schätzer ehrlich behaupten kann. Über ein Monte-Carlo-Ensemble, dessen Wahrheit aus genau dem Rauschen erzeugt wird, das das Filter annimmt, müssen die gepoolten Mittelwerte von NIS (Weißheit) und NEES in ihren { "95" }-%-Chi-Quadrat-Bändern liegen. Dies ist eine Aussage zur SELBSTKONSISTENZ, KEINE Genauigkeitsgarantie für die reale Welt. (Kommentar in der Szenariodatei, Zeilen { "21" } bis { "25" })

# text
seg-91afdc2d3ee2 = EHRLICHKEIT: Alles hier ist MODELLED / SIMULATION. Die CAI- und Uhreneingaben sind eingegrenzte, für die Literatur repräsentative Werte, keine gemessene Hardware; die CAI-Hardware und ihr Key-Person bleiben im Besitz des Partners. Kein TRL>{ "3" }, kein Flugerbe, keine externe Validierung. (Kommentar in der Szenariodatei, Zeilen { "27" } bis { "29" })

# text
seg-9b94bd3ce7df = Monte-Carlo-Seeds, über die die Konsistenzreferenz poolt, und die Multiplikatoren zur Fehlabstimmung des Filters. { "24" } Seeds ergeben laufbasierte Chi-Quadrat-NEES-Bänder ({ "8" }*{ "24" } DOF), die eng genug sind, um ein abgestimmtes von einem fehlabgestimmten Filter zu unterscheiden, und dabei den Lauf günstig halten. Setzen Sie q_factor / r_factor von { "1.0" } weg, um das Filter fehlabzustimmen und zu beobachten, wie das Konsistenztor es verwirft (q_factor skaliert das angenommene Prozessrauschen, r_factor das angenommene Messrausch (Kommentar in der Szenariodatei, Zeilen { "44" } bis { "48" })

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Themenseite: <a1>QUANTUM.md</a1>

# text
seg-963425965e64 = <s1>Zurück</s1>hybrid-optical-rf

# text
seg-437eb2e463b3 = <s1>Weiter</s1>hybrid

# text
# c1: modelled_note
seg-8632967dc5f8 = MODELLED SIMULATION. Selbstkonsistenz des Filters (NEES + Innovationsweißheit) unter eingegrenzten CAI- und Uhrenrauscheingaben — eine Aussage zur Selbstkonsistenz, KEINE Genauigkeitsgarantie für die reale Welt. Keine Feld-/Flugergebnisse; kein TRL>{ "3" }, kein Flugerbe, keine externe Validierung. Die CAI-Hardware ist im Besitz des Partners. (Ergebnis <c1/>)

# attr:alt
seg-2968660fa880 = Das Diagramm, das die Engine für scenarios/hybrid-ukf.toml schreibt, Szenarioart hybrid-ukf

# text
# c1: hybrid-ukf
seg-d8da1a3f1798 = <c1/> (Szenarioart)

# text
# c1: kshana kinds --json
seg-e55c8e2bc619 = Hybrider eng gekoppelter 17-Zustands-GNSS/INS-UKF aus Quanten- und klassischer Technik (MODELLED): { "15" } INS-Fehlerzustände + eine aus CAI abgeleitete Beschleunigungs-Bias-Korrektur + eine 2-Zustands-Uhr (Phase + Frequenz) aus der Uhren-Engine mit q-Parametern, angetrieben vom eingegrenzten CAI-Fehlermodell. (Szenarioarten-Katalog (<c1/>))
