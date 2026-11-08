# docs--kind-hybrid-ukf: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF à état d'erreur à 15 états, à couplage lâche (validé sur un trajet réel IMU/GNSS par rapport à NaveGo) ; un UKF pseudodistance/Doppler à couplage serré et une horloge couplée+pos. Référence indépendante (ExternalDataset) : NaveGo v1.4 (R. Gonzalez, LGPL-3.0, exécuté comme outil sous GNU Octave, jamais lié) : son ins_gnss à couplage lâche sur son propre trajet réel de véhicule terrestre Ekinox IMU/GNSS, les deux solutions étant notées par rapport à la trajectoire de référence Ekinox. Les deux filtres lisent la même entrée float32 à { "20" } Hz, et la configuration de Kshana est déduite mécaniquement des paramètres publiés du jeu de données. L'erreur quadratique moyenne de position horizontale et verticale de Kshana et son

# text
# c1: docs/kinds/by-kind/hybrid-ukf.md
seg-4b84d9846715 = Source : <c1/>

# text
# c1: hybrid-ukf
seg-d8da1a3f1798 = <c1/> (type de scénario)

# text
seg-c6edf89eb8d4 = UKF GNSS/INS hybride quantique+classique à couplage serré à 17 états (MODELLED) : { "15" } états d'erreur INS + correction du biais d'accéléromètre issue du CAI + une horloge à 2 états (phase+fréquence) issue du moteur d'horloge à paramètres q, pilotée par le modèle d'erreur encadré du CAI. L'indice de mérite est l'autocohérence du filtre (NEES + blancheur de l'innovation par rapport aux bornes du χ²) — un énoncé d'autocohérence, et NON une garantie de précision en conditions réelles. Simulation seulement ; pas de TRL>{ "3" }, pas d'héritage de vol, pas de validation externe.

# text
# c1: scenarios/hybrid-ukf.toml
seg-d43a562eb9c2 = Une exécution de <c1/> se résume ainsi : scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
seg-be1b25b8551d = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: residual_accel_bias_m_s2
# c2: speed_m_s
# c3: sigma_pr_m
# c4: sigma_rr_mps
# c5: consistency_seeds
# c6: q_factor
# c7: r_factor
seg-139800576fb7 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/hybrid-ukf.toml
seg-40773fa1ab5f = L'exemple <c1/> définit, entre autres :

# text
seg-5e9c8b22ed24 = Cold-atom (Rb-87 D2) interferometric accelerometer; brackete

# text
seg-4c8e2caeba5b = Ultra-stable/optical onboard oscillator class, white-FM sigm

# attr:alt
seg-2968660fa880 = Le graphique que le moteur écrit pour scenarios/hybrid-ukf.toml, type de scénario hybrid-ukf

# text
seg-5719161d0b2a = <b>MODELLED</b> Performances encadrées (meilleur/nominal/prudent) d'un interféromètre à atomes froids — instabilité de biais, marche aléatoire de vitesse/d'angle, stabilité du facteur d'échelle, interrogation. Référence indépendante (InternalConsistency) : cohérence interne : l'encadrement VRW cité recoupé avec la physique de CaiAccelerometer::accel_asd + la plage dynamique brute calculée à partir de la limite d'ambiguïté de frange ; les chiffres sont des encadrements MODELLED issus d'une revue de la littérature (needs_source_confirmation), aucun dispositif n'est validé, aucun halo de validation

# text
# c1: modelled_note
seg-8632967dc5f8 = SIMULATION MODELLED. Autocohérence du filtre (NEES + blancheur de l'innovation) sous des entrées de bruit encadrées du CAI et de l'horloge — un énoncé d'autocohérence, et NON une garantie de précision en conditions réelles. Pas des résultats sur le terrain/en vol ; pas de TRL>{ "3" }, pas d'héritage de vol, pas de validation externe. Le matériel CAI appartient au partenaire. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-e55c8e2bc619 = UKF GNSS/INS hybride quantique+classique à couplage serré à 17 états (MODELLED) : { "15" } états d'erreur INS + correction du biais d'accéléromètre issue du CAI + une horloge à 2 états (phase+fréquence) issue du moteur d'horloge à paramètres q, pilotée par le modèle d'erreur encadré du CAI. (catalogue des types de scénario (<c1/>))

# text
seg-b06538ca3a8c = UKF GNSS/INS hybride quantique + classique à couplage serré à 17 états (MODELLED). (commentaire du fichier de scénario, ligne { "1" })

# text
seg-b5fc96916b4e = INDICE DE MÉRITE — autocohérence du filtre (NEES + blancheur de l'innovation), la seule chose qu'une simulation puisse affirmer honnêtement d'un estimateur. Sur un ensemble Monte-Carlo dont la vérité est générée exactement à partir du bruit que suppose le filtre, les moyennes agrégées de NIS (blancheur) et de NEES doivent tomber dans leurs bandes du khi-deux à { "95" } %. C'est un énoncé d'AUTOCOHÉRENCE, et NON une garantie de précision en conditions réelles. (commentaire du fichier de scénario, lignes { "21" } à { "25" })

# text
seg-91afdc2d3ee2 = FRANCHISE : tout ce qui figure ici est MODELLED / SIMULATION. Les entrées du CAI et de l'horloge sont des valeurs encadrées, représentatives de la littérature, et non du matériel mesuré ; le matériel CAI et sa personne clé restent la propriété du partenaire. Pas de TRL>{ "3" }, pas d'héritage de vol, pas de validation externe. (commentaire du fichier de scénario, lignes { "27" } à { "29" })

# text
seg-9b94bd3ce7df = Graines Monte-Carlo sur lesquelles l'oracle de cohérence agrège, et multiplicateurs de désaccord du filtre. { "24" } graines donnent des bandes de NEES du khi-deux fondées sur les exécutions ({ "8" }*{ "24" } DOF) assez serrées pour distinguer un filtre accordé d'un filtre désaccordé tout en gardant l'exécution peu coûteuse. Éloignez q_factor / r_factor de { "1.0" } pour désaccorder le filtre et observer le contrôle de cohérence le rejeter (q_factor met à l'échelle le bruit de processus supposé, r_factor le bruit de mesure supposé (commentaire du fichier de scénario, lignes { "44" } à { "48" })

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Page thématique : <a1>QUANTUM.md</a1>

# text
seg-963425965e64 = <s1>Précédent</s1>hybrid-optical-rf

# text
seg-437eb2e463b3 = <s1>Suivant</s1>hybrid
