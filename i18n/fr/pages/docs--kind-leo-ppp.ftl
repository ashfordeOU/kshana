# docs--kind-leo-ppp: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Page thématique : <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Page thématique : <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Type de scénario du moteur v{ $version }, famille <a1>Navigation en orbite basse</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-c5478f572d21 = Page de famille : <a1>Navigation en orbite basse</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Source : <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (type de scénario)

# text
seg-32a570f1a4fa = Convergence du positionnement ponctuel précis (PPP) avec le GNSS seul et avec augmentation LEO : un filtre de Kalman étendu flottant sur le code et la phase de la porteuse sans ionosphère avec les coordonnées de station statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation) et une ambiguïté flottante par arc de satellite ; l'erreur d'orbite et d'horloge précises est blanche et commune au code et à la phase d'un satellite, de sorte que chaque satellite est une mise à jour corrélée à deux lignes sous forme stabilisée de Joseph. Les mesures sont simulées à partir du même modèle avec un bruit à graine fixe sur plusieurs sites et plusieurs graines, et chaque cas (GNSS seul d'abord, puis chaque [[case]] de systèmes LEO, toute constellation ou tout préréglage) rapporte le temps de convergence médian (la première époque après laquelle les erreurs horizontale et verticale restent sous les seuils, { "10" } cm par défaut), la fraction convergée, les courbes d'erreur médianes et la cohérence du filtre (le NEES de position moyenné sur les exécutions par rapport à la bande bilatérale du khi-deux à { "95" } %). Facultativement à côté des chiffres de latitude moyenne publiés de Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) : { "9.6" } min pour le multi-GNSS, ramenées à { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO. MODELLED : une comparaison de cohérence de la tendance, et non une reproduction des constellations, du bruit ou des stations de cette étude ; ni résolution d'ambiguïté, ni sauts de cycle, ni enroulement de phase, ni marées, ni erreurs de produits corrélées dans le temps.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Une exécution de <c1/> se résume ainsi : PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-aee2e93b2c20 = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-3589a089c89d = L'exemple <c1/> définit, entre autres :

# text
seg-4dbe1423bb57 = { "60" } LEO

# text
seg-85b65d194f0d = { "96" } LEO

# text
seg-2750ec8c218f = Étiquette du résultat (celle du moteur) : PPP flottant MODELLED (code et phase sans ionosphère, horloge blanche, retard humide en marche aléatoire, ambiguïtés flottantes par arc) sur des mesures simulées à partir du même modèle ; les chiffres de Li et al. ({ "2019" }) sont une comparaison de tendance, et non une reproduction

# attr:alt
seg-225ef04c64af = Le graphique que le moteur écrit pour scenarios/leo-ppp-convergence.toml, type de scénario leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Un filtre de Kalman étendu PPP flottant sur le code et la phase sans ionosphère : coordonnées statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation), une ambiguïté flottante par satel Tests : <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Un filtre de Kalman étendu PPP flottant sur le code et la phase sans ionosphère : coordonnées statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, une mar. Référence indépendante (ExternalDataset) : le test du khi-deux sur le NEES est un contrôle de cohérence interne (la vérité et le filtre partagent le modèle). La tendance est comparée à Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 : le multi-GNSS à { "9.6" } min raccourci à { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO. Le scénario fourni donne { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } et { "2.3" } min avec i

# text
# c1: label
seg-302365809dbf = PPP flottant MODELLED (code et phase sans ionosphère, horloge blanche, retard humide en marche aléatoire, ambiguïtés flottantes par arc) sur des mesures simulées à partir du même modèle ; les chiffres de Li et al. ({ "2019" }) sont une comparaison de tendance, et non une reproduction (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED : une comparaison de cohérence de la tendance, et non une reproduction des constellations, du bruit ou des stations de cette étude ; ni résolution d'ambiguïté, ni sauts de cycle, ni enroulement de phase, ni marées, ni erreurs de produits corrélées dans le temps. (catalogue des types de scénario (<c1/>))

# text
seg-ba2fd25fdcff = Les quatre constellations LEO ici sont des coquilles delta de Walker représentatives à { "1000" } km et { "60" } deg avec { "60" }, { "96" }, { "192" } et { "288" } satellites ; ce ne sont PAS les conceptions de l'article, et le bruit, les stations et la définition de la convergence (erreurs horizontale et verticale sous { "10" } cm jusqu'à la fin de l'exécution) sont ceux de ce modèle. La comparaison est donc un contrôle de cohérence MODELLED sur la tendance : la convergence doit se raccourcir de façon monotone avec t (commentaire du fichier de scénario, lignes { "10" } à { "14" })

# text
seg-b641b835570c = La convergence du positionnement ponctuel précis avec le GNSS seul et avec augmentation LEO est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Précédent</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Suivant</s1>leo-pvt
