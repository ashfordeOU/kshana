# docs--kind-lunar-infrastructure: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-619127334cf3 = Aucune ligne de la matrice ne nomme ce type de scénario ; l'étiquette de son résultat est celle du moteur lui-même, ci-dessus.

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/lunar-infrastructure.md
seg-e821670a8b55 = Source : <c1/>

# text
# c1: lunar-infrastructure
seg-56953faa67ae = <c1/> (type de scénario)

# text
# c1: study
seg-d0fb90f506c9 = Études MODELLED de l'orbite et de la surface de la Lune comme infrastructure de navigation et de géodésie, cinq études derrière un seul type de scénario choisi par <c1/> : od-consistency (détermination d'orbite embarquée par GNSS terrestre en NRHO ou ELFO par rapport à une détermination d'orbite radiométrique au sol indépendante, jugées par leurs propres covariances sur une simulation de Monte-Carlo initialisée par une graine), carrier-phase (phase de la porteuse en double différence conjointe surface-orbiteur et résolution de l'ambiguïté entière avec LAMBDA), frame-coestimation (une station de surface et des orbiteurs ajoutés à la télémétrie de stations terrestres pour le datum de référentiel lunaire à sept paramètres), space-tie (GNSS, VLBI et télémétrie laser sur un même engin spatial, précision du rattachement de référentiel par rapport à l'erreur de rattachement local) et geodesy-sensitivity (information de Fisher des nombres de Love lunaires h2, k2, l2 et de la libration physique à partir de la télémétrie laser, du suivi d'orbiteur, d'un gravimètre de surface et d'une horloge de surface). Un modèle restreint à trois corps avec des simplifications énoncées ; les calculs numériques sont vérifiés par rapport à des programmes indépendants et rien n'est comparé à une mesure d'une grandeur lunaire.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Une exécution de <c1/> se résume ainsi : lunar-infrastructure space-tie: { "4" } sweep points on { "1" } arcs; laser-vs-GNSS x translation sigma { "1.0363" } m at the registered local tie

# text
# c1: study
seg-f2594b18e718 = Champs obligatoires : <c1/>

# text
# c1: seed
# c2: orbit
# c3: gnss
# c4: ground
# c5: monte_carlo
# c6: surface
# c7: llr
# c8: orbiter
# c9: gravimeter
# c10: clock
# c11: techniques
# c12: nominal
seg-4875c29c517c = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-7b33bdb70a30 = L'exemple <c1/> définit, entre autres :

# text
seg-5fad84cbb2be = nrho

# text
seg-def582a1f2ca = Libellé du résultat (celui du moteur) : MODELLED — un modèle restreint à trois corps (Terre et Lune en masses ponctuelles, sans Soleil, sans harmoniques du champ de gravité lunaire) avec des simplifications énoncées et des entrées ILLUSTRATIVES étiquetées avec leurs sources publiques. Les calculs numériques sont vérifiés par rapport à des programmes indépendants ; rien n'est comparé à une mesure d'une grandeur lunai

# text
seg-f3b4a80a739b = pas de tracé : l'exemple n'écrit aucun graphique

# text
seg-35a4a7a25561 = <b>MODELLED</b> Détermination d'orbite sur une orbite de halo quasi rectiligne (ou une orbite gelée elliptique) à partir de deux types de données indépendants : pseudodistances GNSS terrestres reçues à bord . Référence indépendante (ReferenceImpl) : un programme scipy/numpy indépendant intègre les mêmes équations variationnelles (seuil O1). Rien n'est comparé à une mesure d'une orbite lunaire. La référence indépendante vérifie les calculs numériques de formules énoncées, et non la physique, de sorte que la ligne reste MODELLED. Modèle restreint à trois corps : pas de Soleil, pas d'harmoniques lunaires, l'axe de rotation de la Terre le long de la normale à l'orbite, entrées ILLUSTRATIVES de récepteur et de station.

# text
seg-32455bf5f804 = <b>MODELLED</b> Phase de la porteuse et code GNSS terrestres en simple différence entre récepteurs à une station de surface lunaire et à un orbiteur, avec la différence d'horloge par époque éliminée par profilage ou. Référence indépendante (ReferenceImpl) : une résolution numpy indépendante des mêmes équations normales à partir des lignes exportées (Q3) et une énumération entière par force brute (Q4). Aucune mesure de phase de la porteuse GNSS ou lunaire n'est comparée. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Information de Fisher du datum de référentiel lunaire à sept paramètres à partir de la télémétrie laser de stations terrestres vers les cinq réflecteurs seuls et avec la télémétrie orbiteur-vers-station de surface. Référence indépendante (ReferenceImpl) : une différence finie numpy indépendante du modèle direct (F2). Rien n'est comparé à de vraies solutions de référentiel lunaire. Le facteur est conditionnel à l'orbite supposée connue et au sigma de distance de { "1" } m. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Précision de Cramer-Rao des décalages inter-techniques de translation, d'échelle et de rotation entre les référentiels GNSS, VLBI et de télémétrie laser lorsqu'un seul engin spatial porte tous . Référence indépendante (ReferenceImpl) : un système empilé numpy indépendant dont les inconnues de position sont éliminées par compléments de Schur explicites (T3). Aucune donnée de GRASP, de Genesis ou d'une autre mission n'est comparée. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED — un modèle restreint à trois corps (Terre et Lune en masses ponctuelles, sans Soleil, sans harmoniques du champ de gravité lunaire) avec des simplifications énoncées et des entrées ILLUSTRATIVES étiquetées avec leurs sources publiques. Les calculs numériques sont vérifiés par rapport à des programmes indépendants ; rien n'est comparé à une mesure d'une grandeur lunaire, et rien ici n'est une déclaration sur une mission ou un système quelconque. Sans affiliation ni aval d'aucune agence. Indicatif (résultat <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = Études MODELLED de l'orbite et de la surface de la Lune comme infrastructure de navigation et de géodésie, cinq études derrière un seul type de scénario choisi par <c1/> : od-consistency (détermination d'orbite embarquée par GNSS terrestre en NRHO ou ELFO par rapport à une détermination d'orbite radiométrique au sol indépendante, jugées par leurs propres covariances sur une simulation de Monte-Carlo initialisée par une graine), carrier-phase (phase de la porteuse en double différence conjointe surface-orbiteur et ambiguïté entière (catalogue des types de scénario (<c2/>))

# text
seg-4658f67623b5 = Scénario lunar-infrastructure de Kshana : space-tie. MODELLED ; la conception, les entrées et les seuils sont fixés dans xval/lunar-infra/PREREGISTRATION.md (consignés dans le dépôt avant toute exécution). Les entrées ILLUSTRATIVES y sont étiquetées avec leurs sources publiques. (commentaire du fichier de scénario, lignes { "1" } à { "3" })

# text
seg-f7257c25f137 = La détermination d'orbite lunaire : GNSS terrestre par rapport à la radiométrie au sol est MODELLED, et non vérifiée : elle est contrôlée par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = La résolution d'ambiguïté de la phase de la porteuse lunaire : surface et orbiteur est MODELLED, et non vérifiée : elle est contrôlée par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = La co-estimation du référentiel lunaire : stations de surface et orbiteurs est MODELLED, et non vérifiée : elle est contrôlée par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = La précision du rattachement de référentiel space-tie : GNSS, VLBI et télémétrie laser colocalisés est MODELLED, et non vérifiée : elle est contrôlée par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Page de sujet : <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Précédent</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Suivant</s1>lunar-integrity
