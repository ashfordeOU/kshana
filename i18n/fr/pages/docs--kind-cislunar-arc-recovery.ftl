# docs--kind-cislunar-arc-recovery: translations (fr)

# text
seg-debc2f07db78 = true

# text
seg-330cbcd04718 = fraction (sans dimension)

# text
# c1: docs/kinds/by-kind/cislunar-arc-recovery.md
seg-8f21a5462b09 = Source : <c1/>

# text
# c1: cislunar-arc-recovery
seg-e4858b0a33c9 = <c1/> (type de scénario)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
# c1: independence
seg-f994c81583bf = Test d'estimateur indépendant MODELLED du seuil d'observabilité de longueur d'arc cislunaire. Ce seuil est une lecture de RANG de la matrice d'observabilité assemblée à partir des lignes ANALYTIQUES du jacobien de distance et de la matrice de transition d'état variationnelle ANALYTIQUE, et son contrôle croisé par filtre d'information en racine carrée replie ces mêmes lignes — un contrôle de cohérence entre deux machines numériques, et non une corroboration. Ce type de scénario fournit l'arbitre manquant : un estimateur par moindres carrés par lot qui RETROUVE réellement l'état initial du chef à partir de mesures simulées, avec les dérivées partielles de mesure prises comme DIFFÉRENCES FINIES CENTRÉES du modèle direct composé. Il n'appelle aucune ligne de jacobien analytique, aucune STM variationnelle, aucune décomposition en valeurs singulières ou en valeurs propres, aucune tolérance de rang et aucun filtre d'information en racine carrée — une garde sur le texte source dans tests/cislunar_arc_recovery_reference.rs le rend vérifiable — tandis que la dynamique (le même flot RK4 du CR3BP), les conditions initiales (la même constellation corrigée différentiellement), l'observable scalaire et la grille d'époques sont partagés délibérément et nommés dans le bloc <c1/> émis, car deux analyses d'un même problème physique doivent s'accorder sur la physique pour être comparables. Deux critères, chacun balayé sur cinq décades de sa propre borne : RÉCUPÉRATION SANS BRUIT (l'erreur d'état finale de chaque essai initialisé au plus égale à recovery_factor fois son déplacement a priori — l'analogue du rang, sans tolérance de valeur singulière) et ESTIMABILITÉ MONTE-CARLO (l'erreur de position efficace mesurée sur un ensemble de bruit initialisé en dessous d'une borne indiquée — l'analogue de l'estimabilité, mesurée plutôt que prédite). Prend en charge le quatre-états plan et le six-états spatial, les familles DRO / halo L2 / NRHO L2, les observables de distance et de vitesse de distance, et une paramétrisation polaire centrée sur la Lune dans laquelle la transformation est appliquée à l'ÉTAT et le modèle direct re-différencié à cet endroit. MEASURED sur la grille DRO plane publiée : l'estimateur retrouve le quatre-états à partir de { "0.782609" } h contre { "2.086957" } h pour le critère de rang à rel_tol { "1e-6" } (rapport { "0.375" }) — le seuil de rang n'est PAS corroboré comme frontière de récupérabilité — tandis que la frontière d'estimabilité mesurée tombe dans la même cellule de grille que la formelle, { "5.739130" } h, et la courbe d'erreur mesurée reproduit le 1-sigma formel sur { "21" } longueurs d'arc avec un rapport moyen géométrique de { "0.98" }. MODELLED : la conception de la constellation, la grille d'époques, l'unique liaison suivie, l'amplitude du déplacement, le sigma de mesure et les deux bornes indiquées. Ce n'est pas un produit de performance de navigation certifié.

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-ada71f37b21b = Une exécution de <c1/> se résume ainsi : cislunar-arc-recovery | dro family, 4-state, { "4" } s/c, range observable, cartesian parameterisation | { "6.0" } h arc, { "24" } epochs (grid { "0.260870" } h), { "32" } trials, seed { "20260920" } | finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free recovery from { "0.782609" } h (factor { "1e-2" }) vs Gramian rank threshold { "2.086957" } h | Monte-Carlo estimability from { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) vs Gramian estimability { "5.739130" } h | end-of-arc RMS pos { "0.6026" } km

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-3d4a2773c32f = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-eb621f41dfbb = L'exemple <c1/> définit, entre autres :

# text
seg-6d584e86deba = rapport (sans dimension)

# text
seg-f7f4d06e661f = cislunar-observability sur l'identique

# text
seg-a6cb7ed2ff6d = Étiquette du résultat (celle du moteur) : test de récupération de longueur d'arc cislunaire MODELLED (corroboration par estimateur indépendant du seuil d'observabilité P6). Cœur VALIDATED : l'estimateur est le correcteur par lot de Gauss-Newton pondéré préexistant de la crate (crate::batch_ls), dont la matrice de conception est une DIFFÉRENCE FINIE CENTRÉE du fo

# attr:alt
seg-2fe411ae2153 = Le graphique que le moteur écrit pour scenarios/cislunar-arc-recovery.toml, type de scénario cislunar-arc-recovery

# text
seg-99dd8cc0e3ef = <b>MODELLED</b> Un estimateur par moindres carrés par lot qui RETROUVE l'état initial du chef à partir de mesures inter-satellites simulées sur des préfixes croissants de la même grille d'époques que celle qu'utilise le tableau rang-contre-arc, avec les dérivées partielles de mesure prises comme différences fini Tests : <a1>cislunar_arc_recovery_reference.rs</a1>.

# text
seg-67aab2162719 = <b>MODELLED</b> Un estimateur par moindres carrés par lot qui RETROUVE l'état initial du chef à partir de mesures inter-satellites simulées sur des préfixes croissants de la même grille d'époques. Référence indépendante (ReferenceImpl) : Un estimateur distinct dans ce code, sur un algorithme différent et un chemin de code disjoint : Gauss-Newton pondéré non linéaire avec dérivées partielles par différences finies, son verdict lu comme une erreur de récupération d'état mesurée en km et mm/s. Il n'a aucune expression en commun avec la voie rang-et-covariance du Gramien, et la séparation est IMPOSÉE par une garde sur le texte source plutôt qu'affirmée. MEASURED sur la grille DRO plane publiée : th

# text
# c1: label
seg-7be582874f98 = Test de récupération de longueur d'arc cislunaire MODELLED (corroboration par estimateur indépendant du seuil d'observabilité P6). Cœur VALIDATED : l'estimateur est le correcteur par lot de Gauss-Newton pondéré préexistant de la crate (crate::batch_ls), dont la matrice de conception est une DIFFÉRENCE FINIE CENTRÉE du modèle direct composé - il n'appelle aucune ligne de jacobien de mesure analytique, aucune matrice de transition d'état variationnelle, aucune valeur singulière o (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-52fe686b1fdf = Test d'estimateur indépendant MODELLED du seuil d'observabilité de longueur d'arc cislunaire. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-48e6e57a0b40 = MODELLED : la conception de la constellation, la grille d'époques, l'unique liaison suivie, l'amplitude du déplacement, le sigma de mesure et les deux bornes indiquées. (catalogue des types de scénario (<c1/>))

# text
seg-75f275dcb2d2 = MODELLED : la conception de la constellation, la grille d'époques, l'unique liaison suivie, l'amplitude du déplacement, le sigma de mesure et les deux bornes indiquées. Ce n'est pas un produit de performance de navigation certifié. (commentaire du fichier de scénario, lignes { "33" } à { "35" })

# text
seg-ea82d9fd6506 = La corroboration par estimateur indépendant du seuil de longueur d'arc cislunaire est MODELLED, et non validée : vérifiée par rapport à une implémentation distincte dans ce même code — indépendante de l'unité testée, mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-53d57e6dafa6 = <s1>Précédent</s1>campaign

# text
seg-fe3ecf4b55fe = <s1>Suivant</s1>cislunar-observability
