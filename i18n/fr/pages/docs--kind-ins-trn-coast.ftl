# docs--kind-ins-trn-coast: translations (fr)

# text
seg-bf51947657c0 = navigation

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-c4ed27a559df = Page thématique : <a1>RESILIENCE-CROSSWALK.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
# c1: docs/kinds/by-kind/ins-trn-coast.md
seg-f7305f3a0b5a = Source : <c1/>

# text
# c1: ins-trn-coast
seg-92b90cb4a839 = <c1/> (type de scénario)

# text
seg-5b9a6efe6337 = Modèle d'erreur d'inertie INS/TRN : erreur de position en fonction de la durée d'inertie, construit à partir de coefficients d'IMU plutôt que balayé comme un taux de dérive supposé. Cinq contributions de croissance — biais d'accéléromètre, inclinaison due au biais de gyroscope par la gravité, marche aléatoire de vitesse, marche aléatoire d'angle et facteur d'échelle par rapport à la distance parcourue — chacune propagée dans un modèle d'erreur inertielle à neuf états en repère local avec rétroaction de Schuler à une latitude et une hauteur indiquées (les lois d'ordre dominant à inertie courte t², t³, t^{ "1.5" }, t^{ "2.5" } et t¹/t² sont rapportées à côté) et combinées selon une règle INDIQUÉE (racine de la somme des carrés par défaut, ou somme linéaire, ou somme déterministe avec rss stochastique ; les trois sont calculées à chaque exécution afin que le choix soit visible plutôt qu'enfoui). Les durées d'inertie atteignant des seuils de position fournis par l'appelant ({ "10" } m et { "50" } m par défaut) sont localisées par la bissection déjà présente dans le moteur, chacune avec une ventilation par contribution nommant la source dominante, et le franchissement de chaque contribution prise isolément est en outre inversé algébriquement de sorte que les deux concordent. Un mode de navigation par référence au relief borne l'inertie par des recalages périodiques de position et rapporte le plus grand intervalle de recalage qui tient chaque seuil ; un recalage de position seule laisse subsister l'erreur de vitesse et l'inclinaison au travers du recalage, de sorte qu'il ne borne pas toujours l'inertie quelle que soit la cadence de recalage, et le rapport l'indique plutôt que de renvoyer un zéro. MODELLED : les coefficients de classe d'IMU sont des valeurs représentatives de plages, et non une fiche technique, et le résidu de recalage sur le relief est une entrée. Un seuil non atteint est rapporté comme null avec un statut, jamais comme un zéro. Ce n'est pas un produit de performance de navigation inertielle certifié.

# text
# c1: scenarios/ins-trn-coast.toml
seg-bbd497aa3ba6 = Une exécution de <c1/> se résume ainsi : ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

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
seg-e0555ca683b1 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/ins-trn-coast.toml
seg-95887c4551c7 = L'exemple <c1/> définit, entre autres :

# text
seg-4db5a594afc1 = rss

# text
seg-5868f641c089 = ug

# text
seg-1918189ac2bf = ppm

# text
seg-7eba4c5ee1e4 = Étiquette du résultat (celle du moteur) : budget d'erreur d'inertie INS/TRN MODELLED. Chaque contribution est propagée dans un modèle d'erreur inertielle à neuf états en repère local avec rétroaction de Schuler (plate-forme horizontale cap au nord sur un site indiqué, inertie libre y compris la voie verticale instable) ; ses lois d'ordre dominant à inertie courte (biais t^{ "2" }, gy

# attr:alt
seg-134a4c91da3a = Le graphique que le moteur écrit pour scenarios/ins-trn-coast.toml, type de scénario ins-trn-coast

# text
seg-7bb77ec86a0a = <b>VALIDATED</b> Budget d'erreur de position en fonction de la durée d'inertie construit à partir de coefficients d'IMU, chaque source d'erreur (biais d'accéléromètre, biais de gyroscope, marche aléatoire de vitesse, marche aléatoire d'angle, facteur d'échelle en croisière et sous force spécifique soutenue) propagée dans un n

# text
seg-d69247df315f = <b>VALIDATED</b> Budget d'erreur de position en fonction de la durée d'inertie construit à partir de coefficients d'IMU, chaque source d'erreur (biais d'accéléromètre, biais de gyroscope, marche aléatoire de vitesse, marche aléatoire d'angle, . Référence indépendante (ExternalDataset) : NaveGo v1.4 (commit 24d9488, LGPL-3.0), exécuté comme programme séparé sous GNU Octave { "8.4.0" } : exécutions d'inertie libre avec le même profil d'erreur d'IMU, avec une zone morte numérique corrigée dans sa mise à jour de quaternion (qua_update.m : la garde sur un taux inférieur à { "1e-8" } rad/s remplacée par wnorm == { "0" }, appliquée à une copie à l'exécution et vérifiée une fois comme concordante ; avec la garde en place, une attitude de plate-forme dérivant lentement se figeait et coupait le

# text
# c1: label
seg-498cb2f96fa7 = Budget d'erreur d'inertie INS/TRN MODELLED. Chaque contribution est propagée dans un modèle d'erreur inertielle à neuf états en repère local avec rétroaction de Schuler (plate-forme horizontale cap au nord sur un site indiqué, inertie libre y compris la voie verticale instable) ; ses lois d'ordre dominant à inertie courte (biais t^{ "2" }, inclinaison due au biais de gyroscope t^{ "3" }, marche aléatoire de vitesse t^{ "1.5" }, marche aléatoire d'angle t^{ "2.5" }, facteur d'échelle x distance parcourue) sont recoupées (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-63c221a546f7 = Modèle d'erreur d'inertie INS/TRN : erreur de position en fonction de la durée d'inertie, construit à partir de coefficients d'IMU plutôt que balayé comme un taux de dérive supposé. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-164504645f4a = MODELLED : les coefficients de classe d'IMU sont des valeurs représentatives de plages, et non une fiche technique, et le résidu de recalage sur le relief est une entrée. (catalogue des types de scénario (<c1/>))

# text
seg-ee0281a1f401 = La question à laquelle cela répond : lorsqu'une étude GNSS (ou à cycle de service d'ouverture) dit « supposer une dérive d'estime de { "0.001" }–{ "0.050" } m/s », d'où vient ce nombre ? Il vient de l'IMU, et ce scénario le calcule au lieu de le balayer. Cinq termes de croissance — biais d'accéléromètre (t^{ "2" }), inclinaison due au biais de gyroscope par la gravité (t^{ "3" }), marche aléatoire de vitesse (t^{ "1.5" }), marche aléatoire d'angle (t^{ "2.5" }) et facteur d'échelle multiplié par la dist (commentaire du fichier de scénario, lignes { "4" } à { "11" })

# text
seg-32d4adcfe249 = <s1>Précédent</s1>inertial

# text
seg-47366ab55be3 = <s1>Suivant</s1>integrity
