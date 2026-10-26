# docs--kind-lunar-frame-campaign: translations (fr)

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
seg-3319b18ac61f = et { "1" } autre dans la matrice.

# text
# c1: docs/kinds/by-kind/lunar-frame-campaign.md
seg-dd57b833cb20 = Source : <c1/>

# text
# c1: lunar-frame-campaign
seg-120769aba2cc = <c1/> (type de scénario)

# text
seg-55679aff66db = Datum de référentiel de Helmert (similitude) à sept paramètres piloté par une CAMPAGNE D'OBSERVATION SIMULÉE plutôt que par une transformation injectée. Un réseau de stations terrestres observe un catalogue de balises de surface lunaire selon un calendrier explicite ; les dérivées partielles du retard VLBI lunaire sont accumulées sur ce calendrier en une matrice d'information de Fisher des coordonnées des balises exactement comme le fait lunar-vlbi-fim ; et cette information est propagée par la matrice de conception de Helmert A = [I3 | [p]_x | p] aux points du catalogue jusqu'à la covariance du datum H = A^T M_b A, diagnostiquée par crate::fim::crlb. AUCUNE transformation n'est injectée et rien n'est retrouvé à partir d'une réponse plantée, de sorte que la précision du datum rapportée découle du programme d'observation : diviser par deux le sigma du retard la divise exactement par deux, et allonger l'arc l'améliore parce que la libration que le rapport MESURE (sub_earth_direction_sweep_deg) est ce qui sépare la coordonnée de balise selon la ligne de visée de celles dans le plan du ciel. Le rang, le défaut de datum, le conditionnement, le spectre complet, les directions inobservables DANS LA BASE À SEPT PARAMÈTRES, la direction la plus faible même à plein rang et la part de chaque paramètre dans celle-ci sont émis à chaque exécution ; un paramètre que la campagne ne contraint pas est publié comme NULL avec un statut, jamais lu dans une inverse quasi singulière. La corrélation des erreurs de balises est mesurée, non supposée : avec les stations maintenues fixes, aucune observation ne touche deux balises, de sorte que la matrice d'information est exactement bloc-diagonale (offblock_fraction { "0" }), et avec les stations estimées, le bloc marginalisé par Schur est couplé, la corrélation induite étant imprimée et toute la propagation étant relancée sans elle, de sorte que le prix d'une hypothèse d'indépendance est un nombre. La même propagation sous un sigma isotrope par coordonnée, et l'erreur de récupération que rapporte le scénario lunar-frame-realisation, sont toutes deux exécutées ici et imprimées à côté de la valeur de la campagne avec leurs rapports. MODELLED : le catalogue de balises est sourcé mais la CAMPAGNE est simulée — le réseau de stations et le sigma du retard sont des entrées illustratives, les observations de retard individuelles sont traitées comme indépendantes, et l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES, de sorte que la covariance du datum est une borne de Cramer-Rao pour un jeu de paramètres réduit. Pas un produit géodésique.

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-2e02c1ff8f48 = Une exécution de <c1/> se résume ainsi : lunar-frame-campaign | { "4" } beacons x { "3" } baselines x { "49" } epochs = { "64" } obs (delay sigma { "1.000e-11" } s) | station datum fixed | Helmert rank 7/7 cond { "3.798e5" } | datum translation sigma { "6.397500" } m vs injected-transform recovery error { "0.3125" } m (ratio { "0.049" })

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-9c5feacf15ce = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

# text
# c1: scenarios/lunar-frame-campaign.toml
seg-1d70a5b4a197 = L'exemple <c1/> définit, entre autres :

# text
seg-df90e5910fb4 = h

# text
seg-d9523213de9f = Libellé du résultat (celui du moteur) : datum de référentiel lunaire MODELLED piloté par une campagne. La covariance de Helmert à sept paramètres est propagée à partir d'une matrice d'information des coordonnées des balises accumulée à partir des propres dérivées partielles du retard VLBI lunaire du moteur sur un calendrier explicite de balises, de lignes de base et d'époques ; AUCUNE transformation de similitude n'est injectée et

# attr:alt
seg-883d94b321b4 = Le graphique que le moteur écrit pour scenarios/lunar-frame-campaign.toml, type de scénario lunar-frame-campaign

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" } : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-2595bd629ffb = <b>MODELLED</b> Le datum de Helmert à sept paramètres propagé à partir d'une CAMPAGNE D'OBSERVATION SIMULÉE au lieu d'être retrouvé à partir d'une transformation injectée.

# text
seg-fd34d760edb1 = <b>VALIDATED</b> La covariance du datum de Helmert à sept paramètres, dont les deux entrées simulées sont remplacées par des entrées mesurées : le calendrier est celui des époques d'émission depuis le sol de { "337" } points normaux archivés de télémétrie laser lunaire de l'ILRS (2015-04-08 à 2015-06-27, Grasse MeO { "7" } Tests : <a1>lunar_llr_real_data.rs</a1>.

# text
seg-055864084843 = <b>MODELLED</b> Les entrées facultatives extra_reflectors et extra_beacons du scénario lunar-llr-datum ajoutent un bloc station_geodesy : l'information de Helmert à cinq tableaux issue de la tranche archivée de télémétrie laser lunaire plus l'information qu'apporte un rétroréflecteur ajouté (ran Tests : <a1>lunar_station_geodesy.rs</a1>.

# text
seg-23bd763c32d8 = <b>VALIDATED</b> La covariance du datum de Helmert à sept paramètres du scénario lunar-frame-campaign avec les stations terrestres estimées (station { "1" } ancrée), telle que lunar_frame_campaign la calcule en binary64 : l'information de Fisher conjointe stations et balises accum Tests : <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajustement d'un datum de Helmert à 7 paramètres + rattachement d'orientation ICRF à partir d'un réseau de points. Référence indépendante (ExternalDataset) : résolveur indépendant de transformation de similitude d'Umeyama (Horn) pondérée en forme close (basé sur la SVD de numpy/scipy ; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — un algorithme différent de l'ajustement itératif de Gauss–Newton de kshana, atteignant le même optimum des moindres carrés pondérés défini de façon unique sur des réseaux de points identiques à l'octet près

# text
seg-d024abcfd87c = <b>MODELLED</b> Le datum de Helmert à sept paramètres propagé à partir d'une CAMPAGNE D'OBSERVATION SIMULÉE au lieu d'être retrouvé à partir d'une transformation injectée. Des stations terrestres observent un sourc. Référence indépendante (ReferenceImpl) : identités en forme close et chemin indépendant dans le dépôt, sans référence externe revendiquée. La matrice de conception de Helmert — la seule nouvelle dérivée du module — est redérivée par différence finie centrée de lunar_frame_realise::apply_helmert, un chemin ne partageant aucune expression avec la forme analytique. L'accumulation qu'il compose est celle de lunar-vlbi-fim, dont le jacobien est dérivé par différences finies par rapport à lunar_vlbi::vlbi_delay_s à cet endroit, et qui

# text
# c1: label
seg-0abd7b181f21 = Datum de référentiel lunaire MODELLED piloté par une campagne. La covariance de Helmert à sept paramètres est propagée à partir d'une matrice d'information des coordonnées des balises accumulée à partir des propres dérivées partielles du retard VLBI lunaire du moteur sur un calendrier explicite de balises, de lignes de base et d'époques ; AUCUNE transformation de similitude n'est injectée et rien n'est retrouvé à partir d'une réponse plantée. Le catalogue de balises est la table de sites nommés sourcée du crate, mais la CAMPA (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-f92d22c06cd5 = La corrélation des erreurs de balises est mesurée, non supposée : avec les stations maintenues fixes, aucune observation ne touche deux balises, de sorte que la matrice d'information est exactement bloc-diagonale (offblock_fraction { "0" }), et avec les stations estimées, le bloc marginalisé par Schur est couplé, la corrélation induite étant imprimée et toute la propagation étant relancée sans elle, de sorte que le prix d'une hypothèse d'indépendance est un nombre. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-534cea416496 = MODELLED : le catalogue de balises est sourcé mais la CAMPAGNE est simulée — le réseau de stations et le sigma du retard sont des entrées illustratives, les observations de retard individuelles sont traitées comme indépendantes, et l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES, de sorte que la covariance du datum est une borne de Cramer-Rao pour un jeu de paramètres réduit. (catalogue des types de scénario (<c1/>))

# text
seg-ec67b9d3adbb = La corrélation des erreurs de balises est MESURÉE, non supposée. Avec les stations maintenues fixes, aucune observation ne touche deux balises, de sorte que la matrice d'information est exactement bloc-diagonale (offblock_fraction { "0" }) ; avec les stations estimées, le bloc marginalisé par Schur est couplé, la corrélation induite est imprimée, et toute la propagation est relancée sans elle, de sorte que le prix d'une hypothèse d'indépendance est un nombre plutôt que c (commentaire du fichier de scénario, lignes { "17" } à { "21" })

# text
seg-a2bb557da7ba = MODELLED : le catalogue de balises est sourcé mais la CAMPAGNE est simulée — le réseau de stations et le sigma du retard sont des entrées illustratives, les observations de retard individuelles sont traitées comme indépendantes, et l'éphéméride du centre de la Lune, les horloges des stations, la troposphère et les paramètres d'orientation de la Terre sont maintenus FIXES. Pas un produit géodésique. (commentaire du fichier de scénario, lignes { "27" } à { "30" })

# text
seg-57a371bca2c7 = Le datum de référentiel lunaire issu d'une campagne d'observation est MODELLED, et non vérifié : il est contrôlé par rapport à une implémentation distincte dans ce même code source, indépendante de l'unité testée mais sans autorité externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-7b56c979b2c9 = <s1>Précédent</s1>lunar-differential-pnt

# text
seg-70072dbfa305 = <s1>Suivant</s1>lunar-frame-realisation
