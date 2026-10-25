# docs--kinds-inertial-fusion-and-quantum-sensors: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# text
seg-ec26df467b88 = Gemeinsame Kalman-Sensorfusion für PNT über dieselben Hybrid-Eingaben.

# attr:alt
seg-c8a1c797f4b1 = Das Diagramm, das die Engine für scenarios/fusion-pnt.toml schreibt, Art fusion

# text
seg-38df285a3f25 = Lose und eng gekoppeltes GNSS/INS-Fehlerzustands-EKF.

# attr:alt
seg-7d993b676006 = Das Diagramm, das die Engine für scenarios/gnss-ins.toml schreibt, Art gnss-ins

# text
seg-c6edf89eb8d4 = Hybrider eng gekoppelter 17-Zustands-GNSS/INS-UKF aus Quanten- und klassischer Technik (MODELLED): { "15" } INS-Fehlerzustände + eine aus CAI abgeleitete Beschleunigungs-Bias-Korrektur + eine 2-Zustands-Uhr (Phase + Frequenz) aus der Uhren-Engine mit q-Parametern, angetrieben vom eingegrenzten CAI-Fehlermodell. Die Gütezahl ist die Selbstkonsistenz des Filters (NEES + Innovationsweißheit gegen χ²-Grenzen) — eine Aussage zur Selbstkonsistenz, KEINE Genauigkeitsgarantie für die reale Welt. Nur Simulation; kein TRL>{ "3" }, kein Flugerbe, keine externe Validierung.

# text
seg-22cd963c7042 = Hybrid-PNT-Abschlussszenario: Uhr + IMU + Zeitübertragungsstützung.

# text
seg-bdedf28adc48 = Inertiale 1-DOF-Koppelnavigation während eines GNSS-Ausfalls.

# text
seg-5b9a6efe6337 = INS/TRN-Auslauffehlermodell: Positionsfehler gegen Auslaufdauer, aufgebaut aus IMU-Koeffizienten statt als angenommene Driftrate durchgefahren. Fünf Wachstumsbeiträge — Beschleunigungsmesser-Bias, Kreisel-Bias-Neigung über die Schwerkraft, Geschwindigkeits-Random-Walk, Winkel-Random-Walk und Skalenfaktor gegen die zurückgelegte Strecke — jeweils fortgeschrieben durch ein inertiales Fehlermodell mit neun Zuständen in lokaler Horizontebene mit Schuler-Rückkopplung bei einer angegebenen Breite und Höhe (die führenden Gesetze für kurzes Auslaufen t², t³, t^{ "1.5" }, t^{ "2.5" } und t¹/t² werden daneben ausgegeben) und kombiniert nach einer ANGEGEBENEN Regel (standardmäßig Wurzel aus der Quadratsumme, oder lineare Summe, oder deterministische Summe mit stochastischer Quadratsummenwurzel; alle drei werden bei jedem Lauf berechnet, sodass die Wahl sichtbar ist statt vergraben). Die Auslaufdauern, die vom Aufrufer vorgegebene Positionsschwellen erreichen (standardmäßig { "10" } m und { "50" } m), werden durch die vorhandene Bisektion der Engine gefunden, jeweils mit einer Aufschlüsselung je Beitrag, die die dominante Quelle nennt, und das Überschreiten jedes einzelnen Beitrags wird zusätzlich algebraisch invertiert, sodass beide übereinstimmen. Ein Modus der geländebezogenen Navigation begrenzt das Auslaufen mit periodischen Positionsfixes und gibt das größte Fixintervall aus, das jede Schwelle hält; ein reiner Positionsfix lässt Geschwindigkeitsfehler und Neigung über den Fix hinweg bestehen, sodass er das Auslaufen nicht bei jeder Fixrate begrenzt, und der Bericht sagt das, statt eine Null auszugeben. MODELLED: Die Koeffizienten der IMU-Klasse sind repräsentative Bandwerte, kein Datenblatt, und das Residuum des Geländefixes ist eine Eingabe. Eine nicht erreichte Schwelle wird als null mit einem Status ausgegeben, nie als Null. Kein zertifiziertes Leistungsprodukt für Trägheitsnavigation.

# text
seg-04310cd6cbec = MODELLED Fehler-/Anomalieerkennung für Quanten-PNT-Systeme: ein gekennzeichneter Fehlerkatalog (Uhr: Frequenzsprung/Drift/Lock-Verlust; Sensor: Bias-Sprung/Ausfall), eine ROC-AUC der Erkennungsstatistik (mit einem Bootstrap-Konfidenzintervall aus der extern validierten eval_stats) und ein minimal erkennbarer Fehler bei fester Fehlalarmrate, wobei der quantenuhrgestützte Monitor (geringeres Rauschen) kleinere Fehler erkennt — als ehrliche TradeEvidence + Repräsentativität. Gaußsches Modell der Erkennungsstatistik (AUC = Phi(mu/(sigma*sqrt2))); modelliert die Klasse, illustrative Parameter aus öffentlichen Quellen, kein TRL/Flug/Zertifizierung.

# text
seg-790fbfdd80f0 = MODELLED GNSS-freie Quantennavigation: während eines GNSS-Ausfalls ein inertiales Budget mit Quanten-(Kaltatom-Interferometer) gegen ein klassisches INS der Navigationsklasse — Positionsfehlerwachstum über den Auslauf, Holdover bis zu einer Positionsschwelle und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit Repräsentativität. Ehrlicher Beobachtbarkeitshinweis: Ohne externen Fix ist der Beschleunigungsmesser-Bias unbeobachtbar, sodass der Fehler wächst; der Quantensensor verlangsamt, aber schließt diese Lücke nicht. Illustrative Gerätparameter aus öffentlichen Quellen; modelliert die Klasse, kein TRL/Flug/Zertifizierung.

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Quanten-gegen-klassisch-PNT-Trade ({ "13503" }): Nutzen einer Kandidatenuhr bei Zeitgebungs-Holdover + inertialem Holdover (eine gemessene ADEV-Kurve — der Angelpunkt der Verteidigbarkeit — oder eine Quantenuhrklasse) gegen eine klassische Basislinienklasse, mit dem am Artefakt mitgeführten Vorbehalt zur Annahme einer Langzeit-Untergrenze, plus eine Hüllkurve der GNSS-verweigerten Resilienz über die Zeit. MODELLED; quantifiziert (validiert nie) ein Partnergerät. Die Kandidatenuhr ist eine gemessene Kurve (<c1/> + <c2/>, gleich lang, mindestens { "2" } Punkte; sie gewinnt, wenn beide Formen angegeben sind) oder eine <c3/>.

# text
seg-4e31c8daf798 = Register

# text
seg-efd15cff3d32 = MODELLED (Ergebnisbezeichnung)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Quelle: <c1/>

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Themenseiten: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Einen ausführen: <c1/>. Alle Familien: <a4>KINDS.md</a4>.

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = Hybrides Quanten+klassisches eng gekoppeltes GNSS/INS-UKF mit 17 Zuständen (MODELLED): { "15" } INS-Fehlerzustände + CAI-abgeleitete Beschleunigungs-Bias-Korrektur + eine Uhr mit 2 Zuständen (Phase+Frequenz) aus der q-Parameter-Uhren-Engine

# text
seg-a7d3c32b29b3 = INS/TRN-Auslauf-Fehlermodell: Positionsfehler gegen Auslaufdauer, aus IMU-Koeffizienten aufgebaut, statt als angenommene Driftrate durchgefahren.

# text
seg-beb568dec44f = MODELLED GNSS-freie Quantennavigation: während eines GNSS-Ausfalls ein inertiales Budget mit Quanten-(Kaltatom-Interferometer) gegen ein klassisches INS der Navigationsklasse — Positionsfehlerwachstum über den Auslauf, Holdover bis

# text
seg-d948ea4d1f33 = MODELLED Fehler-/Anomalieerkennung für Quanten-PNT-Systeme: ein gekennzeichneter Fehlerkatalog (Uhr: Frequenzsprung/Drift/Lock-Verlust; Sensor: Bias-Sprung/Ausfall), eine ROC-AUC der Erkennungsstatistik (mit einem Bootstrap-K

# text
seg-48e72d451a50 = Quanten-gegen-klassisch-PNT-Trade ({ "13503" }): Nutzen einer Kandidatenuhr bei Zeitgebungs-Holdover + inertialem Holdover (eine gemessene ADEV-Kurve — der Angelpunkt der Verteidigbarkeit — oder eine Quantenuhrklasse) gegen eine klassische Bas

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optional: <c7/>.

# text
seg-75867e8b4b4f = <b>Register:</b> MODELLED { "6" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>inertial</a1>.

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
seg-fdf140d4ce68 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>hybrid</a1>.

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
# c11: coupled
seg-3246c9e1e0cb = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Optional: <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>fusion</a1>.

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
# c6: residual_accel_bias_m_s2
# c7: speed_m_s
# c8: sigma_pr_m
# c9: sigma_rr_mps
# c10: consistency_seeds
# c11: q_factor
# c12: r_factor
seg-d0790a2643ae = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Optional: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
# c7: fix_interval_s
# c8: sigma_pos_m
# c9: sigma_vel_mps
# c10: lat_deg
# c11: lon_deg
# c12: alt_m
# c13: trajectory
# c14: tight
seg-3bbd5ce09bee = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optional: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
# c1: imu_grade
# c2: accel_bias_ug
# c3: accel_vrw_m_s_per_sqrt_hr
# c4: accel_scale_factor_ppm
# c5: gyro_bias_deg_per_hr
# c6: gyro_arw_deg_per_sqrt_hr
# c7: speed_m_s
# c8: ref_accel_m_s2
# c9: latitude_deg
# c10: height_m
# c11: combination
# c12: crossing_thresholds_m
# c13: grades
# c14: drift_band_lo_m_per_s
# c15: drift_band_hi_m_per_s
# c16: trn_fix_mode
# c17: trn_fix_interval_s
# c18: trn_fix_residual_m
# c19: mission_duration_s
seg-1703619ca20e = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>. Optional: <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Zurück</s1>GPS-verweigerte alternative PNT

# text
seg-0585e4ae329e = <s1>Weiter</s1>Jamming, Spoofing und das Spektrum

# text
seg-08ad3969f65b = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>gnss-ins</a1>.

# attr:alt
seg-0e73a37b716b = Kontaktbogen der Diagramme, die die Engine für die Szenarioarten der Familie Inertial-, Fusions- und Quantensensoren schreibt

# attr:alt
seg-134a4c91da3a = Das Diagramm, das die Engine für scenarios/ins-trn-coast.toml schreibt, Szenarioart ins-trn-coast

# attr:alt
seg-1bdbf1a737b2 = Das Diagramm, das die Engine für scenarios/quantum-gnss-free-nav.toml schreibt, Szenarioart quantum-gnss-free-nav

# text
seg-23762f3a250b = Inertial-, Fusions- und Quantensensoren (Szenarioart-Familie)

# attr:alt
seg-2968660fa880 = Das Diagramm, das die Engine für scenarios/hybrid-ukf.toml schreibt, Szenarioart hybrid-ukf

# attr:alt
seg-2f1d14239d1a = Das Diagramm, das die Engine für scenarios/quantum-anomaly-detect.toml schreibt, Szenarioart quantum-anomaly-detect

# attr:alt
seg-52378a7b074c = Das Diagramm, das die Engine für scenarios/hybrid-pnt.toml schreibt, Szenarioart hybrid

# text
seg-85ab600e3050 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>hybrid-ukf</a1>.

# attr:alt
seg-873c402bb724 = Das Diagramm, das die Engine für scenarios/imu-deadreckoning.toml schreibt, Szenarioart inertial

# text
seg-9095869ec445 = { "9" } Szenarioarten der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
seg-b05e96ce392d = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>quantum-gnss-free-nav</a1>.

# attr:alt
seg-c74c63ffd859 = Das Diagramm, das die Engine für scenarios/quantum-trade.toml schreibt, Art quantum-trade

# text
seg-cbefb1538dec = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>quantum-anomaly-detect</a1>.
