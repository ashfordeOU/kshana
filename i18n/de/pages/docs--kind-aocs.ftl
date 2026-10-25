# docs--kind-aocs: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Quelle: <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (Szenarioart)

# text
seg-7eff466eb018 = Lageregelung von Raumfahrzeugen: ein Schwenk zur inertialen Ausrichtung eines starren Körpers mit drei oder mehr ausgewuchteten Reaktionsrädern unter MRP-Rückführung (L = -K sigma - P omega), Radmomente mit minimaler Norm, begrenzt auf die Grenze jedes Motors, RK4 mit Halteglied nullter Ordnung; optional geschlossen auf einem multiplikativen EKF aus einem simulierten Gyro (Winkel- und Raten-Random-Walk) und Sternsensor. Es meldet Einschwingzeit, End- und Spitzenzeigefehler, Spitzenraddrehzahl und -moment, den Sättigungsanteil, die Drehimpulsdrift und, mit dem Schätzer, dessen Lagefehler und NEES. Die Schleife des wahren Zustands ist gegen Basilisk { "2.9.1" } VALIDATED; der Schätzer ist MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Ein Lauf von <c1/> fasst sich so zusammen: aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
seg-2ad4d3f07a6a = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: duration_s
# c2: dt_s
# c3: sample_s
# c4: omega0_rad_s
# c5: pointing_threshold_deg
# c6: estimator
seg-ed0c5c6266d9 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/aocs-slew.toml
seg-a09eb69b36d7 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-8b51cfcf5bd5 = N m

# text
seg-6876b0214e4c = N m s

# text
seg-8e4dea0df19e = kg m^{ "2" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-b054c73f22e5 = kein Wert

# text
seg-6e22c97374b0 = Ergebnisbezeichnung (die der Engine): VALIDATED Regelgesetz und Raddynamik (gegen Basilisk { "2.9.1" } auf der Schleife des wahren Zustands); die Eingaben dieses Laufs sind die des Szenarios selbst — Reaktionsradlageregelung unter MRP-Rückführung, inertiale Ausrichtung, kein Sensorrauschen, keine Reibung

# attr:alt
seg-08c624d5324d = Das Diagramm, das die Engine für scenarios/aocs-slew.toml schreibt, Art aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Lageregelung zur inertialen Ausrichtung eines starren Körpers mit drei oder mehr ausgewuchteten Reaktionsrädern: das MRP-Rückführgesetz L_r = -K sigma_BR - P omega_BR (Schaub und Junkins), Radmotormomente mit minimaler Norm G_s u = -L_r, begrenzt auf die jedes Rades l Tests: <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> Der multiplikative EKF nach Lefferts, Markley und Shuster: Lagefehler im Körpersystem und Gyro-Bias-Zustände, Propagation mit der Gyrorate abzüglich der Bias-Schätzung und dem diskreten Prozessrauschen nach Farrenkopf (Winkel- und Raten-Random-Walk), Sternsensor-Update

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Lageregelung zur inertialen Ausrichtung eines starren Körpers mit drei oder mehr ausgewuchteten Reaktionsrädern: das MRP-Rückführgesetz L_r = -K sigma_BR - P omega_BR (Schaub und J. Unabhängige Referenz (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; der bsk-Radlauf als separates Werkzeug, nie gelinkt oder mitgeliefert): Raumfahrzeugkörper, reactionWheelStateEffector (BalancedWheels, Momentgrenze an), simpleNav, inertial3D, attTrackingError, mrpFeedback (ohne Integralterm) und rwMotorTorque bei dt = { "0.1" } s mit seinem RK4, gegen die eigene Implementierung von Kshana in drei Fällen (drei orthogonale Räder; eine Vierrad-Pyramide; ein sättigender Vierradfall),

# text
seg-d7889856073b = <b>MODELLED</b> Der multiplikative EKF nach Lefferts, Markley und Shuster: Lagefehler im Körpersystem und Gyro-Bias-Zustände, Propagation mit der Gyrorate abzüglich der Bias-Schätzung und Farre. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: der normierte quadrierte Schätzfehler des Filters gegen eine Wahrheit, simuliert aus denselben Sensormodellen über Monte-Carlo-Seeds, und die Konvergenz der Lage- und Bias-Schätzungen. WAS NICHT: Es wurde kein externer Schätzer und keine Flugdaten verglichen (Basilisk { "2.9.1" } hat kein MEKF-Modul); die Sensormodelle sind die aus dem Lehrbuch, ohne Fehlausrichtung, Skalenfaktor oder Gesichtsfeldeffekte des Sternsensors.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = Die Schleife des wahren Zustands ist gegen Basilisk { "2.9.1" } VALIDATED; der Schätzer ist MODELLED. (Artenkatalog (<c1/>))

# text
seg-c7ff0ddbd040 = Multiplikative EKF-Lageschätzung aus einem Gyro und einem Sternsensor ist MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Themenseite: <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Zurück</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Weiter</s1>aperture-duty-cycle
