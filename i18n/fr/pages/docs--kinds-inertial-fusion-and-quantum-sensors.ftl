# docs--kinds-inertial-fusion-and-quantum-sensors: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
seg-ec26df467b88 = PNT par fusion de capteurs à filtre de Kalman conjoint sur les mêmes entrées hybrides.

# attr:alt
seg-c8a1c797f4b1 = Le graphique que le moteur écrit pour scenarios/fusion-pnt.toml, type de scénario fusion

# text
seg-38df285a3f25 = EKF à état d'erreur GNSS/INS à couplage lâche et serré.

# attr:alt
seg-7d993b676006 = Le graphique que le moteur écrit pour scenarios/gnss-ins.toml, type de scénario gnss-ins

# text
seg-c6edf89eb8d4 = UKF GNSS/INS hybride quantique+classique à couplage serré à 17 états (MODELLED) : { "15" } états d'erreur INS + correction du biais d'accéléromètre issue du CAI + une horloge à 2 états (phase+fréquence) issue du moteur d'horloge à paramètres q, pilotée par le modèle d'erreur encadré du CAI. L'indice de mérite est l'autocohérence du filtre (NEES + blancheur de l'innovation par rapport aux bornes du χ²) — un énoncé d'autocohérence, et NON une garantie de précision en conditions réelles. Simulation seulement ; pas de TRL>{ "3" }, pas d'héritage de vol, pas de validation externe.

# attr:alt
seg-2968660fa880 = Le graphique que le moteur écrit pour scenarios/hybrid-ukf.toml, type de scénario hybrid-ukf

# text
seg-22cd963c7042 = Pierre angulaire du PNT hybride : horloge + IMU + aide par transfert de temps.

# attr:alt
seg-52378a7b074c = Le graphique que le moteur écrit pour scenarios/hybrid-pnt.toml, type de scénario hybrid

# text
seg-bdedf28adc48 = Estime inertielle à 1 degré de liberté pendant une interruption du GNSS.

# attr:alt
seg-873c402bb724 = Le graphique que le moteur écrit pour scenarios/imu-deadreckoning.toml, type de scénario inertial

# text
seg-5b9a6efe6337 = Modèle d'erreur d'inertie INS/TRN : erreur de position en fonction de la durée d'inertie, construit à partir de coefficients d'IMU plutôt que balayé comme un taux de dérive supposé. Cinq contributions de croissance — biais d'accéléromètre, inclinaison due au biais de gyroscope par la gravité, marche aléatoire de vitesse, marche aléatoire d'angle et facteur d'échelle par rapport à la distance parcourue — chacune propagée dans un modèle d'erreur inertielle à neuf états en repère local avec rétroaction de Schuler à une latitude et une hauteur indiquées (les lois d'ordre dominant à inertie courte t², t³, t^{ "1.5" }, t^{ "2.5" } et t¹/t² sont rapportées à côté) et combinées selon une règle INDIQUÉE (racine de la somme des carrés par défaut, ou somme linéaire, ou somme déterministe avec rss stochastique ; les trois sont calculées à chaque exécution afin que le choix soit visible plutôt qu'enfoui). Les durées d'inertie atteignant des seuils de position fournis par l'appelant ({ "10" } m et { "50" } m par défaut) sont localisées par la bissection déjà présente dans le moteur, chacune avec une ventilation par contribution nommant la source dominante, et le franchissement de chaque contribution prise isolément est en outre inversé algébriquement de sorte que les deux concordent. Un mode de navigation par référence au relief borne l'inertie par des recalages périodiques de position et rapporte le plus grand intervalle de recalage qui tient chaque seuil ; un recalage de position seule laisse subsister l'erreur de vitesse et l'inclinaison au travers du recalage, de sorte qu'il ne borne pas toujours l'inertie quelle que soit la cadence de recalage, et le rapport l'indique plutôt que de renvoyer un zéro. MODELLED : les coefficients de classe d'IMU sont des valeurs représentatives de plages, et non une fiche technique, et le résidu de recalage sur le relief est une entrée. Un seuil non atteint est rapporté comme null avec un statut, jamais comme un zéro. Ce n'est pas un produit de performance de navigation inertielle certifié.

# attr:alt
seg-134a4c91da3a = Le graphique que le moteur écrit pour scenarios/ins-trn-coast.toml, type de scénario ins-trn-coast

# text
seg-04310cd6cbec = Détection de défauts/anomalies MODELLED pour les systèmes PNT quantiques : un catalogue de défauts étiquetés (saut de fréquence/dérive/perte d'accrochage d'horloge ; échelon de biais/perte de signal d'un capteur), une AUC de ROC de la statistique de détection (avec un intervalle de confiance par bootstrap issu de eval_stats vérifié de façon externe) et un défaut minimal détectable à un taux de fausses alarmes fixé, le moniteur assisté par horloge quantique (bruit plus faible) détectant des défauts plus petits — sous forme de TradeEvidence honnête + représentativité. Modèle gaussien de la statistique de détection (AUC = Phi(mu/(sigma*sqrt2))) ; modélise la classe, paramètres illustratifs à sources publiques, aucun TRL, vol ni certification.

# attr:alt
seg-2f1d14239d1a = Le graphique que le moteur écrit pour scenarios/quantum-anomaly-detect.toml, type de scénario quantum-anomaly-detect

# text
seg-790fbfdd80f0 = Navigation quantique sans GNSS MODELLED : lors d'une interruption du GNSS, un budget inertiel quantique (interféromètre à atomes froids) par rapport à une centrale inertielle (INS) classique de qualité navigation — croissance de l'erreur de position pendant la dérive libre, holdover jusqu'à un seuil de position, et compromis quantique contre classique sous forme de TradeEvidence honnête avec représentativité. Note honnête d'observabilité : sans mesure externe, le biais de l'accéléromètre est inobservable, de sorte que l'erreur croît ; le capteur quantique ralentit cet écart sans le combler. Paramètres de dispositif illustratifs à sources publiques ; modélise la classe, aucun TRL, vol ni certification.

# attr:alt
seg-1bdbf1a737b2 = Le graphique que le moteur écrit pour scenarios/quantum-gnss-free-nav.toml, type de scénario quantum-gnss-free-nav

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Compromis PNT quantique contre classique ({ "13503" }) : bénéfice en holdover de synchronisation temporelle + holdover inertiel d'une horloge candidate (une courbe d'ADEV mesurée — le pivot de défendabilité — ou une classe d'horloge quantique) par rapport à une classe de référence de base classique, avec la réserve sur l'hypothèse de plancher à long tau portée sur l'artefact, plus une enveloppe de résilience en fonction du temps en l'absence de GNSS. MODELLED ; quantifie (ne valide jamais) un dispositif partenaire. L'horloge candidate est une courbe mesurée (<c1/> + <c2/>, de même longueur, d'au moins { "2" } points ; elle l'emporte lorsque les deux formes sont données) ou un <c3/>.

# attr:alt
seg-c74c63ffd859 = Le graphique que le moteur écrit pour scenarios/quantum-trade.toml, type de scénario quantum-trade

# text
seg-4e31c8daf798 = Registre

# text
seg-9095869ec445 = { "9" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
seg-efd15cff3d32 = MODELLED (libellé du résultat)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Source : <c1/>

# text
seg-23762f3a250b = Inertiel, fusion et capteurs quantiques (famille de types de scénario)

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Pages thématiques : <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. En exécuter une : <c1/>. Toutes les familles : <a4>KINDS.md</a4>.

# attr:alt
seg-0e73a37b716b = Planche-contact des graphiques que le moteur écrit pour les types de la famille Inertiel, fusion et capteurs quantiques

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = Filtre de Kalman sans parfum (UKF) GNSS/INS hybride quantique+classique à couplage serré à 17 états (MODELLED) : { "15" } états d'erreur INS + correction du biais d'accéléromètre dérivée du CAI + une horloge à 2 états (phase+fréquence) issue du moteur d'horloge à paramètres q

# text
seg-a7d3c32b29b3 = Modèle d'erreur de l'INS/TRN en navigation à l'estime : erreur de position en fonction de la durée à l'estime, construite à partir de coefficients d'IMU plutôt que balayée comme un taux de dérive supposé.

# text
seg-beb568dec44f = Navigation quantique sans GNSS MODELLED : pendant une coupure du GNSS, un bilan inertiel quantique (interféromètre à atomes froids) par rapport à un INS classique de qualité navigation — croissance de l'erreur de position pendant la navigation à l'estime, holdover t

# text
seg-d948ea4d1f33 = Détection de défauts/anomalies MODELLED pour les systèmes PNT quantiques : un catalogue de défauts étiquetés (saut de fréquence/dérive/perte d'accrochage de l'horloge ; saut de biais/perte du capteur), une AUC ROC de la statistique de détection (avec un IC bootstrap

# text
seg-48e72d451a50 = Compromis PNT quantique contre classique ({ "13503" }) : bénéfice en holdover de synchronisation temporelle et en holdover inertiel d'une horloge candidate (une courbe d'ADEV mesurée — le point d'appui de la défendabilité — ou une classe d'horloge quantique) par rapport à une référence classique

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Facultatif : <c7/>.

# text
seg-75867e8b4b4f = <b>Registre :</b> MODELLED { "6" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>inertial</a1>.

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
seg-fdf140d4ce68 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>hybrid</a1>.

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
seg-3246c9e1e0cb = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Facultatif : <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Registre :</b> MODELLED { "4" } · VALIDATED { "4" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>fusion</a1>.

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
seg-d0790a2643ae = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Facultatifs : <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-85ab600e3050 = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>hybrid-ukf</a1>.

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
seg-3bbd5ce09bee = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Facultatifs : <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-08ad3969f65b = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>gnss-ins</a1>.

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
seg-1703619ca20e = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-b05e96ce392d = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>quantum-gnss-free-nav</a1>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-cbefb1538dec = <b>Registre :</b> aucune ligne de la matrice ne nomme ce type ; le moteur étiquette lui-même son résultat. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>quantum-anomaly-detect</a1>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>. Facultatifs : <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Registre :</b> MODELLED { "1" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Précédent</s1>PNT alternatif sans GPS

# text
seg-0585e4ae329e = <s1>Suivant</s1>Brouillage, leurrage et spectre
