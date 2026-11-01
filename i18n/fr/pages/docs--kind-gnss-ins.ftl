# docs--kind-gnss-ins: translations (fr)

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
# c1: docs/kinds/by-kind/gnss-ins.md
seg-fd8fad481c81 = Source : <c1/>

# text
# c1: gnss-ins
seg-e726a6d74d81 = <c1/> (type de scénario)

# text
seg-38df285a3f25 = EKF à état d'erreur GNSS/INS à couplage lâche et serré.

# text
# c1: scenarios/gnss-ins.toml
seg-e1e235215947 = Une exécution de <c1/> se résume ainsi : scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
seg-e3112eac77af = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: fix_interval_s
# c2: sigma_pos_m
# c3: sigma_vel_mps
# c4: lat_deg
# c5: lon_deg
# c6: alt_m
# c7: trajectory
# c8: tight
seg-6c128eb60a91 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/gnss-ins.toml
seg-79c75d3e461d = L'exemple <c1/> définit, entre autres :

# text
seg-ca448daf5ec7 = nominal

# text
seg-49f2fa051719 = denied

# text
seg-327a2c4885bd = Tactical-grade MEMS/quartz inertial unit: larger residual bi

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# attr:alt
seg-7d993b676006 = Le graphique que le moteur écrit pour scenarios/gnss-ins.toml, type de scénario gnss-ins

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF à état d'erreur à 15 états, à couplage lâche (validé sur un trajet réel IMU/GNSS par rapport à NaveGo) ; un UKF pseudodistance/Doppler à couplage serré et une horloge couplée+pos. Référence indépendante (ExternalDataset) : NaveGo v1.4 (R. Gonzalez, LGPL-3.0, exécuté comme outil sous GNU Octave, jamais lié) : son ins_gnss à couplage lâche sur son propre trajet réel de véhicule terrestre Ekinox IMU/GNSS, les deux solutions étant notées par rapport à la trajectoire de référence Ekinox. Les deux filtres lisent la même entrée float32 à { "20" } Hz, et la configuration de Kshana est déduite mécaniquement des paramètres publiés du jeu de données. L'erreur quadratique moyenne de position horizontale et verticale de Kshana et son

# text
seg-742a29ca1fb7 = Page thématique : <a1>TEST-BENCH.md</a1>

# text
seg-f3cc3d82aba8 = <s1>Précédent</s1>fusion

# text
seg-af503aa1d900 = <s1>Suivant</s1>gnss-sim
