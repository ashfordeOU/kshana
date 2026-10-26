# docs--kind-inertial: translations (fr)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-b054c73f22e5 = aucune valeur

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = et { "4" } autres dans la matrice.

# text
seg-7b2721b7588d = Type de scénario du moteur v{ $version }, famille <a1>Capteurs inertiels, de fusion et quantiques</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover. Référence indépendante (ReferenceImpl) : intégration SDE Monte-Carlo numpy indépendante d'un bruit d'accélération blanc doublement intégré (valide la variance VRW analytique par un algorithme réellement indépendant) + un point d'ancrage de valeur publiée de Groves { "2013" } pour les termes de biais/facteur d'échelle ; les chiffres du dispositif CAI quantifient du matériel partenaire et restent MODELLED

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La résilience de l'estime inertielle quantique est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Page de famille : <a1>Capteurs inertiels, de fusion et quantiques</a1>

# text
seg-ca448daf5ec7 = nominal

# text
seg-496b17a8d3b9 = Page thématique : <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Page thématique : <a1>QUANTUM.md</a1>

# text
seg-7bebd09c614b = Navigation-grade quartz accelerometer (Honeywell QA-2000 / G

# text
# c1: docs/kinds/by-kind/inertial.md
seg-cead54058894 = Source : <c1/>

# text
# c1: inertial
seg-783be547f01e = <c1/> (type de scénario)

# text
seg-bdedf28adc48 = Estime inertielle à 1 degré de liberté pendant une interruption du GNSS.

# text
# c1: scenarios/imu-deadreckoning.toml
seg-55b5599ef867 = Une exécution de <c1/> se résume ainsi : scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
seg-b05c3cb45c0d = Champs obligatoires : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
seg-94fd9afe6f30 = Champs facultatifs : <c1/>

# text
# c1: scenarios/imu-deadreckoning.toml
seg-bd021b5dff80 = L'exemple <c1/> définit, entre autres :

# text
seg-8a9e52e38b05 = Exail hybrid quantum accelerometer triad: bias stability 6e-

# attr:alt
seg-873c402bb724 = Le graphique que le moteur écrit pour scenarios/imu-deadreckoning.toml, type de scénario inertial

# text
seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-41f3a20fadfb = <b>VALIDATED</b> Mécanisation inertielle strapdown NED WGS-84 à attitude par quaternions (avec compensation du coning/sculling) propageant un état de navigation à partir d'incréments (Δθ, Δv) Tests : <a1>classical_strapdown_ins_reference.rs</a1>.

# text
seg-102d2e51460e = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN) Tests : <a1>quantum_inertial_sensor_reference.rs</a1>.

# text
seg-83fa50d4859a = <b>MODELLED</b> Plage dynamique d'ambiguïté de frange de Mach–Zehnder : la lecture de frange de période 2π fixe une force spécifique maximale sans ambiguïté a_max=π/(k_eff·T²), et la plage sans ambiguïté en cellules de résolution a_max/σ_a=π/σ_Φ est indépendante du facteur d'échelle optique

# text
seg-89ec2e65cf4f = <b>MODELLED</b> Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover Tests : <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
seg-fab4c926e628 = <s1>Précédent</s1>impairment-eval

# text
seg-aa783749183d = <s1>Suivant</s1>ins-trn-coast
