# docs--kind-gnss-ins: translations (de)

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-b054c73f22e5 = kein Wert

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
# c1: docs/kinds/by-kind/gnss-ins.md
seg-fd8fad481c81 = Quelle: <c1/>

# text
# c1: gnss-ins
seg-e726a6d74d81 = <c1/> (Szenarioart)

# text
seg-38df285a3f25 = Lose und eng gekoppeltes GNSS/INS-Fehlerzustands-EKF.

# text
# c1: scenarios/gnss-ins.toml
seg-e1e235215947 = Ein Lauf von <c1/> fasst sich so zusammen: scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
seg-e3112eac77af = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: fix_interval_s
# c2: sigma_pos_m
# c3: sigma_vel_mps
# c4: lat_deg
# c5: lon_deg
# c6: alt_m
# c7: trajectory
# c8: tight
seg-6c128eb60a91 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/gnss-ins.toml
seg-79c75d3e461d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ca448daf5ec7 = nominal

# text
seg-49f2fa051719 = denied

# text
seg-327a2c4885bd = Inertialeinheit in taktischer Qualität (MEMS/Quarz): größeres Rest-Bi

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# attr:alt
seg-7d993b676006 = Das Diagramm, das die Engine für scenarios/gnss-ins.toml schreibt, Art gnss-ins

# text
seg-ea4498cc0324 = <b>VALIDATED</b> Fehlerzustands-EKF mit 15 Zuständen, lose gekoppelt (auf einer realen IMU/GNSS-Fahrt gegen NaveGo validiert); ein eng gekoppeltes Pseudoentfernungs-/Doppler-UKF und eine gekoppelte Uhr+Pos. Unabhängige Referenz (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als Werkzeug unter GNU Octave ausgeführt, nie gelinkt): sein lose gekoppeltes ins_gnss auf seiner eigenen realen Ekinox-IMU/GNSS-Landfahrzeugfahrt, beide Lösungen gegen die Ekinox-Referenztrajektorie bewertet. Beide Filter lesen dieselbe { "20" }-Hz-Float32-Eingabe, und die Konfiguration von Kshana wird mechanisch aus den veröffentlichten Parametern des Datensatzes abgebildet. Der horizontale und vertikale Positions-RMS von Kshana und sein

# text
seg-742a29ca1fb7 = Themenseite: <a1>TEST-BENCH.md</a1>

# text
seg-f3cc3d82aba8 = <s1>Zurück</s1>fusion

# text
seg-af503aa1d900 = <s1>Weiter</s1>gnss-sim
