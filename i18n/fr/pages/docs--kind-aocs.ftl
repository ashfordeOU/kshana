# docs--kind-aocs: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Source : <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (type de scénario)

# text
seg-7eff466eb018 = Contrôle d'attitude d'un engin spatial : une manœuvre de pointage inertiel d'un corps rigide avec trois roues de réaction équilibrées ou plus sous rétroaction MRP (L = -K sigma - P omega), couples de roue de norme minimale écrêtés à la limite de chaque moteur, RK4 avec maintien d'ordre zéro ; éventuellement bouclé sur un EKF multiplicatif à partir d'un gyroscope simulé (marche aléatoire d'angle et de vitesse) et d'un viseur d'étoiles. Rapporte le temps d'établissement, l'erreur de pointage finale et de crête, la vitesse et le couple de roue de crête, la fraction saturée, la dérive du moment cinétique et, avec l'estimateur, son erreur d'attitude et son NEES. La boucle d'état vrai est VALIDATED par rapport à Basilisk { "2.9.1" } ; l'estimateur est MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Une exécution de <c1/> se résume ainsi : aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
seg-2ad4d3f07a6a = Champs requis : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: duration_s
# c2: dt_s
# c3: sample_s
# c4: omega0_rad_s
# c5: pointing_threshold_deg
# c6: estimator
seg-ed0c5c6266d9 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/aocs-slew.toml
seg-a09eb69b36d7 = L'exemple <c1/> définit, entre autres :

# text
seg-8b51cfcf5bd5 = N m

# text
seg-6876b0214e4c = N m s

# text
seg-8e4dea0df19e = kg m^{ "2" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-6e22c97374b0 = Étiquette du résultat (celle du moteur) : loi de commande et dynamique des roues VALIDATED (par rapport à Basilisk { "2.9.1" } sur la boucle d'état vrai) ; les entrées de cette exécution sont celles du scénario — contrôle d'attitude par roues de réaction sous rétroaction MRP, pointage inertiel, sans bruit de capteur, sans frottement

# attr:alt
seg-08c624d5324d = Le graphique que le moteur écrit pour scenarios/aocs-slew.toml, type de scénario aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Contrôle d'attitude à pointage inertiel d'un corps rigide avec trois roues de réaction équilibrées ou plus : la loi de rétroaction MRP L_r = -K sigma_BR - P omega_BR (Schaub et Junkins), couples de moteur de roue de norme minimale G_s u = -L_r écrêtés à la l Tests : <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> L'EKF multiplicatif de Lefferts-Markley-Shuster : états d'erreur d'attitude dans le repère du corps et de biais du gyroscope, propagation avec la vitesse du gyroscope moins l'estimation du biais et le bruit de processus discret de Farrenkopf (marche aléatoire d'angle et de vitesse), mise à jour du viseur d'étoiles

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Contrôle d'attitude à pointage inertiel d'un corps rigide avec trois roues de réaction équilibrées ou plus : la loi de rétroaction MRP L_r = -K sigma_BR - P omega_BR (Schaub et J. Référence indépendante (ExternalDataset) : Basilisk { "2.9.1" } (AVSLab, ISC ; l'exécution des roues bsk comme outil distinct, jamais lié ni intégré au dépôt) : hub de l'engin, reactionWheelStateEffector (BalancedWheels, limite de couple activée), simpleNav, inertial3D, attTrackingError, mrpFeedback (sans terme intégral) et rwMotorTorque à dt = { "0.1" } s avec son RK4, par rapport à l'implémentation propre de Kshana sur trois cas (trois roues orthogonales ; une pyramide de quatre roues ; un cas saturant à quatre roues),

# text
seg-d7889856073b = <b>MODELLED</b> L'EKF multiplicatif de Lefferts-Markley-Shuster : états d'erreur d'attitude dans le repère du corps et de biais du gyroscope, propagation avec la vitesse du gyroscope moins l'estimation du biais et Farre. Référence indépendante (InternalConsistency) : Cohérence interne : l'erreur d'estimation normalisée au carré du filtre par rapport à une vérité simulée à partir des mêmes modèles de capteurs sur des graines Monte Carlo, et la convergence des estimations d'attitude et de biais. CE QUI NE L'EST PAS : aucun estimateur externe ni donnée de vol n'a été comparé (Basilisk { "2.9.1" } n'a pas de module MEKF) ; les modèles de capteurs sont ceux des manuels, sans désalignement, facteur d'échelle ni effets de champ de vue du viseur d'étoiles.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = La boucle d'état vrai est VALIDATED par rapport à Basilisk { "2.9.1" } ; l'estimateur est MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-c7ff0ddbd040 = L'estimation d'attitude par EKF multiplicatif à partir d'un gyroscope et d'un viseur d'étoiles est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Page thématique : <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Précédent</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Suivant</s1>aperture-duty-cycle
