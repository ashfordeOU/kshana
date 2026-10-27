# docs--concepts: translations (fr)

# text
seg-501402fc366f = Holdover d'horloge

# text
seg-9c0eb89a2fbe = Paquet

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Source : <c1/>

# text
seg-8ab3fd09812d = Concepts : une introduction en langage clair

# text
seg-0f86d0a815d2 = Cette page explique <em>ce que fait Kshana et pourquoi</em>, en partant de zéro et en montant jusqu'à la physique. Aucune connaissance préalable n'est supposée pour la première partie ; les sections suivantes ajoutent les relations précises pour les spécialistes. Pour des définitions mot à mot, voir le <a1>Glossaire</a1>.

# text
seg-34f76bad58cb = { "1" }. Le problème, en un paragraphe

# text
seg-45c0199e2224 = Presque tout ce qui a besoin de savoir <em>où il se trouve</em> ou <em>quelle heure il est</em> (téléphones, aéronefs, navires, satellites, réseaux électriques, systèmes financiers) s'appuie sur des signaux de satellites de navigation (le GPS (Global Positioning System) et ses semblables, collectivement le <b>GNSS</b> (système mondial de navigation par satellite)). Ces signaux sont faibles et facilement perdus : brouillés, bloqués, ou simplement hors de vue dans l'espace. Lorsque cela arrive, un système doit <b>continuer par ses propres moyens</b> avec des capteurs embarqués : une horloge pour tenir le temps et des capteurs inertiels pour suivre le mouvement. La question à laquelle répond Kshana est simple à énoncer et difficile à mesurer : <b>combien de temps, et dans quelle mesure, peut-il continuer ?</b>

# text
seg-ea1895772e76 = { "2" }. Pourquoi « quantique » ?

# text
seg-dd6871645f37 = Les capteurs embarqués dérivent. Une horloge perd lentement le temps ; un capteur inertiel perd lentement la trace de la position. Les horloges et capteurs inertiels <b>quantiques</b> dérivent <em>bien plus lentement</em> que les composants classiques utilisés aujourd'hui, de sorte qu'un véhicule pourrait traverser une interruption GNSS bien plus longue tout en restant dans ses limites de précision. Cet avantage est toute la promesse du PNT (positionnement, navigation et synchronisation temporelle) quantique. Mais « bien plus lentement » doit être converti en <b>chiffres</b> : combien de minutes de holdover en plus ? combien de mètres de dérive en moins ? Ces chiffres déterminent si une charge utile quantique vaut son coût, sa masse et sa puissance.

# text
seg-a5d9dc0fb159 = { "3" }. Ce que fait réellement Kshana

# text
seg-cb3a35ba696f = Kshana est un <b>simulateur</b>, pas du matériel et pas une conception matérielle. Il :

# text
seg-cb7fdaf6738b = Prend un <b>scénario</b> : une chronologie avec une période d'interruption du GNSS, et les chiffres de performance publiés d'un capteur.

# text
seg-701c8c6d0e55 = Fait parcourir à un <b>modèle d'erreur de capteur</b> cette chronologie : tant que le GNSS est disponible, le modèle est asservi à la vérité terrain ; pendant l'interruption, il évolue librement, en accumulant l'erreur exactement comme la physique le prévoit.

# text
seg-bc68e3d54e4c = <b>Note</b> le résultat par rapport à des figures de mérite opérationnelles (l'ampleur de l'erreur, la durée pendant laquelle elle reste dans la spécification, la fiabilité de l'estimation).

# text
seg-32d31a9beb71 = Pour les paquets de capteurs, le fait <b>deux fois</b>, une fois pour un capteur quantique et une fois pour son équivalent classique, sur le <em>même</em> scénario, de sorte que la comparaison soit à armes égales.

# text
seg-07d8c6eb84e9 = Point essentiel : le moteur ne sait rien de « quantique » ou de « classique ». Ce ne sont que des modèles d'erreur avec des paramètres différents (publiés, cités). La différence que vous voyez en sortie est la différence de la physique publiée ; rien n'est réglé à la main pour favoriser un camp.

# text
seg-e20a7d3f32dc = { "4" }. Les quatre briques (« paquets »)

# text
seg-638b8d451550 = Capteur

# text
seg-f891ee876b96 = À quoi il répond

# text
seg-d1b122c389d4 = horloge atomique

# text
seg-768230c2eb02 = Combien de temps l'<em>heure</em> reste-t-elle exacte sans GNSS ?

# text
seg-029de6b99be0 = Navigation à l'estime inertielle

# text
seg-f66f2d7b1d6d = accéléromètre (+ gyroscope)

# text
seg-e067a035f656 = À quelle vitesse la <em>position</em> dérive-t-elle sans GNSS ?

# text
seg-9ef8f99ca6e4 = Transfert de temps

# text
seg-1267f82791f9 = liaison optique / RF (radiofréquence)

# text
seg-6f240700790d = Avec quelle précision deux engins peuvent-ils partager l'heure ?

# text
seg-90be2a6a29b1 = Fusion hybride

# text
seg-780cf1f1127e = tout ce qui précède

# text
seg-6080a05ace19 = La solution PNT <em>combinée</em> tient-elle ?

# text
seg-3f74a708a746 = Le paquet hybride est la chute : une solution de navigation a besoin <em>à la fois</em> d'une bonne heure <em>et</em> d'une bonne position. Il montre qu'une liaison de synchronisation temporelle optique peut garder verrouillée même une horloge modeste, ce qui signifie que le capteur <b>inertiel</b> devient le maillon le plus faible, et c'est précisément là qu'un accéléromètre quantique est rentable.

# text
seg-5f55bb0fd7c5 = Au-delà des quatre paquets

# text
# c1: kshana kinds
seg-60191a2cd150 = Le même moteur exécute bien d'autres <em>types</em> de scénario ; <c1/> les énumère tous. Ils vont au-delà des capteurs, jusqu'aux signaux et à la géométrie dont dépendent les capteurs :

# text
seg-995ed414d83d = <b>Où sont les satellites</b> : propagation d'orbite, conception de constellations autour de la Terre, de la Lune ou d'un autre corps, et positions des corps du système solaire.

# text
seg-bc8abce2a748 = <b>Ce que le récepteur peut voir</b> : un horizon dépendant de l'azimut (une rue, un quai, un fjord) au-dessus du masque d'élévation, et la géométrie du ciel qu'il laisse : les satellites en vue, leur dilution de précision et l'ellipse d'erreur.

# text
seg-b7a2c252c41c = <b>Ce que le récepteur entend</b> : le spectre en bande L sous un brouilleur, le brouillage et le leurrage, et la perte d'accrochage de la boucle de poursuite.

# text
seg-f354743045c4 = <b>Si l'on peut se fier à la réponse</b> : la surveillance de l'intégrité (RAIM, surveillance autonome de l'intégrité par le récepteur, et sa forme avancée ARAIM) avec niveaux de protection.

# text
seg-69aa01a29a49 = <b>Alternatives au GNSS</b> : l'appariement de cartes de gravité et de terrain, et le positionnement, la navigation et la synchronisation temporelle à partir de satellites en orbite terrestre basse (LEO), de la conception du signal au point de position, en passant par le bilan de liaison et le message de navigation.

# text
seg-297c98214b5b = <b>Synchronisation temporelle pour les réseaux</b> : holdover télécom vérifié par rapport aux gabarits internationaux, et synchronisation de créneaux pour des plannings indexés sur le temps.

# text
seg-7eba216a9bf2 = <b>Au-delà de la Terre</b> : temps et référentiels lunaires, volumes de service lunaires et navigation par relais martien.

# text
seg-b796f49570ed = <b>Beaucoup d'exécutions à la fois</b> : les campagnes enchaînent des types de scénario sur une même chronologie, balayent un paramètre ou exécutent un ensemble Monte-Carlo.

# text
seg-ef7f4e025018 = { "5" }. L'honnêteté par construction

# text
seg-65fb8703baf9 = Un simulateur n'est utile que si l'on peut s'y fier. Kshana est construit pour que vous le puissiez :

# text
# c1: provenance
seg-de8fd160db6d = <b>Chaque paramètre est cité.</b> Chaque chiffre de capteur porte une chaîne <c1/> nommant la fiche technique ou l'article dont il provient. Aucune constante anonyme.

# text
seg-09d5cd11b127 = <b>Chaque modèle est vérifié par rapport à une relation de manuel,</b> et pas seulement par rapport à lui-même : par exemple, l'écart-type d'Allan de l'horloge simulée doit correspondre au chiffre de stabilité publié, et la dérive inertielle doit correspondre à la loi standard de croissance d'erreur. Une capacité n'est dite <em>validée</em> que lorsqu'une référence externe indépendante (un jeu de données réel, une implémentation indépendante ou des vecteurs de référence publiés) concorde ; le reste est <em>modélisé</em>, et la <a1>matrice de vérification</a1> dit ce qui est quoi.

# text
seg-ccb5b2fe93c4 = La maturité est étiquetée.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> marque chaque effet <c1/>, <c2/> ou <c3/>, et indique sans détour que les chiffres des horloges optiques sont des valeurs <em>de laboratoire / d'objectif spatial</em> : aucune horloge optique au strontium n'a volé.

# text
seg-de463596fcdb = <b>Les résultats sont reproductibles au bit près :</b> le même scénario, la même graine et la même version donnent toujours la réponse identique sur la même plateforme ; d'un système d'exploitation à l'autre, les chiffres concordent à { "1e-6" } en relatif (voir <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. La physique, pour les spécialistes

# text
seg-8fc6db9faf83 = Les relations que Kshana met en œuvre et teste (détail complet et tolérances dans <a1>VALIDATION.md</a1>) :

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Holdover d'horloge.</b> Modèle phase/fréquence à deux états avec modulation de fréquence blanche (FM blanc, densité spectrale de puissance <c1/>), FM à marche aléatoire (<c2/>), FM flicker (une somme de processus d'Ornstein–Uhlenbeck à espacement logarithmique étalonnés sur un plancher d'Allan plat) et vieillissement déterministe. Validé par l'écart-type d'Allan à recouvrement par rapport au <c3/> publié (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Navigation à l'estime inertielle.</b> Biais résiduel de l'accéléromètre → <c1/> ; marche aléatoire de vitesse → <c2/> ; le biais gyroscopique et la marche aléatoire angulaire, facultatifs, produisent une erreur d'inclinaison qui couple la gravité (<c3/>) à l'accélération horizontale (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Transfert de temps.</b> Gigue de synchronisation temporelle blanche → précision de synchronisation → télémétrie à sens unique (<c1/>, { "1" } ps ≈ { "0.3" } mm) ; la moyenne des échantillons se moyenne en <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Fusion et intégrité.</b> Un filtre de Kalman à deux états dont le bruit de processus correspond au modèle de vérité ; en marche à l'inertie, la variance de son erreur de phase croît exactement jusqu'à <c1/>, la relation analytique du holdover, et sa borne à 1 σ alimente la figure de mérite d'intégrité.

# text
seg-80daa7cb8641 = <b>Géométrie.</b> La propagation képlérienne à deux corps (éventuellement avec J2 séculaire) ou SGP4 (Simplified General Perturbations { "4" }) à partir de vrais jeux d'éléments à deux lignes, les constellations Walker et la visibilité en ligne de visée (occultation par la Terre + masque d'élévation) déduisent la disponibilité GNSS de la géométrie orbitale plutôt que de fenêtres écrites à la main.

# text
seg-4ce4c6b79b93 = { "7" }. Pour aller plus loin

# text
seg-7c8344a26230 = Pratiquer : les <a1>tutoriels</a1>, trois exemples travaillés + des exercices progressifs.

# text
seg-277f1b435cf6 = L'exécuter : voir le démarrage rapide du <a1>README</a1>.

# text
seg-c349981bd4f1 = Comprendre la structure : <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Vérifier ce qui est validé et ce qui ne l'est pas : <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Rechercher un terme : <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Précédent</s1>Vue d'ensemble

# text
seg-2f14e84bfc99 = <s1>Suivant</s1>Glossaire
