# docs--kind-sweep-nd: translations (fr)

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Le balayage du type de scénario <c1/> (une à trois clés pointées de n'importe quel type de scénario, sur les valeurs d'axe du balayage générique, avec facultativement un ensemble à chaque nœud) et la sec monte_carlo. Référence indépendante (InternalConsistency) : La forme fermée de la marche aléatoire de phase sous bruit blanc de fréquence, variance q_wf tau (NIST Technical Note { "1337" }), pour la machinerie statistique, et l'égalité à l'octet près avec les exécutions autonomes pour l'initialisation. Elle vérifie l'arithmétique d'ensemble sur le modèle d'horloge propre au moteur, et non un jeu de données externe

# text
seg-d1c11e493795 = Les balayages de paramètres et les ensembles Monte Carlo initialisés sur n'importe quel type de scénario sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-c61e88721556 = Type de scénario du moteur v{ $version }, famille <a1>Horloges, synchronisation temporelle et holdover</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-849c08d3ce70 = Page de famille : <a1>Horloges, synchronisation temporelle et holdover</a1>

# text
seg-ee7dd15019d0 = Page thématique : <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Accéléromètre à interféromètre à atomes froids à partir des premiers principes (k_eff·T², QPN). Référence indépendante (ExternalDataset) : vecteurs numériques publiés d'articles primaires sur le CAI (fonction de transfert de Cheinet { "2008" } ; sensibilité de Peters/Freier) : k_eff·T² concorde exactement, ASD du bruit de grenaille un plancher unilatéral à ~{ "2" }× de chaque instrument publié (les dispositifs réels portent un bruit technique au-dessus du plancher quantique). Un encadrement, et non une parité. { "0.30" } tour { "2" } (préenregistré fcb9ac64), un constat (reste MODELLED) : le bruit de rotation limité au seul QPN face au Gauguet et al. mesuré.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Budget de position composé biais + facteur d'échelle + VRW + décroissance de stabilité sur le holdover. Référence indépendante (ReferenceImpl) : intégration SDE Monte-Carlo numpy indépendante d'un bruit d'accélération blanc doublement intégré (valide la variance VRW analytique par un algorithme réellement indépendant) + un point d'ancrage de valeur publiée de Groves { "2013" } pour les termes de biais/facteur d'échelle ; les chiffres du dispositif CAI quantifient du matériel partenaire et restent MODELLED

# text
seg-9955b1b1c018 = La performance des capteurs inertiels quantiques est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La résilience de l'estime inertielle quantique est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte de cette même base de code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-5a70fcb097dc = Champs facultatifs : aucun

# text
seg-bb07c8ee153f = <b>PARTNER</b> Non fourni — modèles de performance seulement ; le matériel à atomes froids/horloge est celui d'un partenaire. Référence indépendante (NoneKind) : aucune : une discipline appartenant au partenaire, sans module et sans test par conception

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Source : <c1/>

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (type de scénario)

# text
seg-4f19d4fb1341 = Balayage N-D générique sur n'importe quel paquet via des clés TOML pointées / des chemins de métriques JSON.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Une exécution de <c1/> se résume ainsi : balayage générique de <c2/> sur [threshold_m, accel_classical.bias] | { "15" } nœuds (forme [{ "5" }, { "3" }]) | métriques [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Champs obligatoires : <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = L'exemple <c1/> définit, entre autres :

# attr:alt
seg-621a18c07044 = Le graphique que le moteur écrit pour scenarios/sweep-nd-inertial.toml, type sweep-nd

# text
seg-ce006a6715e9 = <s1>Précédent</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Suivant</s1>sweep
