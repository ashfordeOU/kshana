# docs--kind-lunar-llr-datum: translations (fr)

# text
seg-3068552e4ab4 = VALIDATED : les lignes de la <a1>matrice de vérification</a1> qui nomment ce type de scénario.

# text
seg-1f17ef6a853e = Type de scénario du moteur v{ $version }, famille <a1>Lunaire et cislunaire</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-1c1eeb2dcaa0 = Page de famille : <a1>Lunaire et cislunaire</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-8f8871ac8a0f = Page de sujet : <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-fd34d760edb1 = <b>VALIDATED</b> La covariance du datum de Helmert à sept paramètres, dont les deux entrées simulées sont remplacées par des entrées mesurées : le calendrier est celui des époques d'émission depuis le sol de { "337" } points normaux archivés de télémétrie laser lunaire de l'ILRS (2015-04-08 à 2015-06-27, Grasse MeO { "7" } Tests : <a1>lunar_llr_real_data.rs</a1>.

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# text
# c1: docs/kinds/by-kind/lunar-llr-datum.md
seg-8db575fc6d82 = Source : <c1/>

# text
# c1: lunar-llr-datum
seg-5329c6c75887 = <c1/> (type de scénario)

# text
# c1: scenarios/lunar-llr-datum.toml
seg-f4359803d67a = Une exécution de <c1/> se résume ainsi : lunar-llr-datum: { "337" } archived normal points ({ "349" } parsed) from { "2" } station(s) to { "5" } retroreflector arrays over { "80.9" } d; median measured normal-point precision { "5.13" } mm one-way; reflector information rank 15/15; Helmert rank 7/7 cond { "2.399e4" }; datum translation sigma { "1.851746e-2" } m; observed-minus-computed one-way residual RMS { "156493.9" } m (the modelled links, chiefly the analytic lunar ephemeris)

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-7eda56c1285a = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-llr-datum.toml
seg-c95b4d285cbd = L'exemple <c1/> définit, entre autres :

# text
seg-37a77f49f048 = ps

# text
seg-b5c1e8681164 = Libellé du résultat (celui du moteur) : datum de référentiel lunaire issu d'une campagne d'observation RÉELLE. Le calendrier, le nombre d'observations et chaque poids d'observation proviennent de points normaux archivés de télémétrie laser lunaire de l'ILRS (mesurés) ; les coordonnées des stations proviennent de l'ITRF2020 de l'IERS et celles des rétroréflecteurs de la Table { "7" } de JPL DE430 (publié

# attr:alt
seg-e4da113cbe18 = Le graphique que le moteur écrit pour scenarios/lunar-llr-datum.toml, type de scénario lunar-llr-datum

# text
seg-764e54be97a0 = <b>VALIDATED</b> La covariance du datum de Helmert à sept paramètres de lunar-llr-datum à partir de points normaux archivés de l'ILRS et de leurs poids mesurés, sur le chemin par noyau : le centre géocentrique de la Lune est lu dans JPL DE440 par le propre lecteur de noyau du moteur (planetary_ker Tests : <a1>validate_llr_datum_kernel_moon.rs</a1>.

# text
seg-cae262db0e46 = <b>VALIDATED</b> La covariance du datum de Helmert à sept paramètres, dont les deux entrées simulées sont remplacées par des entrées mesurées : le calendrier est celui des époques d'émission depuis le sol de { "337" } archive. Référence indépendante (ExternalDataset) : identités en forme close, chemin indépendant dans le dépôt et, depuis { "0.36" }, une référence indépendante de bibliothèques SPICE et NumPy sur de nouvelles données mesurées (ci-dessous) ; il n'existe aucune paire publiée de covariance de datum LLR lunaire à laquelle se comparer, de sorte qu'aucune exactitude n'est revendiquée. La seule nouvelle dérivée — la dérivée partielle de la distance par rapport à la position de la base solidaire du réflecteur — est redérivée par différence finie centrée du temps de trajet lumineux aller-retour qu'elle diffe

# text
# c1: label
seg-61ac3609406a = Datum de référentiel lunaire issu d'une campagne d'observation RÉELLE. Le calendrier, le nombre d'observations et chaque poids d'observation proviennent de points normaux archivés de télémétrie laser lunaire de l'ILRS (mesurés) ; les coordonnées des stations proviennent de l'ITRF2020 de l'IERS et celles des rétroréflecteurs de la Table { "7" } de JPL DE430 (publié). L'éphéméride du centre de la Lune, l'orientation du corps WGCCRE de l'UAI { "2015" }, et l'absence de troposphère, de marées, d'excentricité de station (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-97610a2cca73 = La corrélation entre réseaux est MESURÉE à exactement zéro plutôt que supposée, parce qu'une mesure laser touche un seul réseau. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-64b1c08eeb11 = LES LIAISONS MESURÉES ET CELLES QUI SONT MODELLED, C'EST LE RAPPORT, PAS UNE NOTE DE BAS DE PAGE : l'éphéméride du centre de la Lune et l'orientation du corps de l'UAI restent modélisées et leur taille combinée est émise sous forme du résiduel de distance aller observé moins calculé sur chaque point utilisé ; la troposphère, les marées du corps solide, l'excentricité de la station, le mouvement du pôle, UT1-UTC, le retard relativiste et les horloges des stations sont absents et inclus dans ce résiduel. (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-d38710f3ce4a = MODELLED : les chiffres à sept paramètres sont une borne de Cramer-Rao pour un jeu de paramètres réduit sur un calendrier réel — pas un datum résolu, pas une analyse LLR et pas un produit géodésique. (catalogue des types de scénario (<c1/>))

# text
seg-a19e2b1fcaf1 = les époques sont les heures d'émission depuis le sol de points normaux archivés des données consolidées de télémétrie laser (CLRD) de l'ILRS ; * les observations sont les mesures laser réellement tirées vers les cinq réseaux de rétroréflecteurs sur la Lune ; * chaque poids d'observation est la PROPRE précision archivée de ce point normal, bin_rms/sqrt(n_raw), lue dans le fichier plutôt que supposée. (commentaire du fichier de scénario, lignes { "7" } à { "12" })

# text
seg-5ed6b83c01da = LES LIAISONS MESURÉES ET CELLES QUI SONT MODELLED, C'EST LE RAPPORT, PAS UNE NOTE DE BAS DE PAGE. L'éphéméride du centre de la Lune et l'orientation du corps de l'UAI restent modélisées, et leur taille combinée est émise sous forme du résiduel de distance aller observé moins calculé sur chaque point utilisé ; la troposphère, les marées du corps solide, l'excentricité de la station, le mouvement du pôle, UT1-UTC, le retard relativiste et les horloges des stations sont absents et se trouvent dans ce résiduel. Comme (commentaire du fichier de scénario, lignes { "18" } à { "26" })

# text
seg-7e7ff3ce4971 = La corrélation entre réseaux est MESURÉE à exactement zéro plutôt que supposée, parce qu'une mesure laser touche un seul réseau. Un enregistrement que les catalogues ne peuvent pas placer — une station sans position ITRF publiée — est IGNORÉ ET COMPTÉ, sans jamais recevoir de coordonnée de substitution. Les chiffres de la campagne simulée sont EXÉCUTÉS et imprimés à côté de ceux mesurés. (commentaire du fichier de scénario, lignes { "28" } à { "31" })

# text
seg-8bfe258bedf5 = MODELLED : les chiffres à sept paramètres sont une borne de Cramer-Rao pour un jeu de paramètres réduit sur un calendrier réel. Pas un datum résolu, pas une analyse LLR, pas un produit géodésique. (commentaire du fichier de scénario, lignes { "33" } à { "34" })

# text
seg-598a7d6ba1e7 = <s1>Précédent</s1>lunar-joint-od-clock

# text
seg-54b1c9200aae = <s1>Suivant</s1>lunar-station-coverage

# text
seg-25455a33523c = Datum de référentiel lunaire de Helmert à sept paramètres piloté par une campagne d'observation RÉELLE et ARCHIVÉE plutôt que simulée. Là où lunar-frame-campaign avait retiré la transformation injectée mais énonçait encore son réseau de stations, son calendrier et son sigma par observation comme des entrées ILLUSTRATIVE, ce type de scénario prend les trois à partir de mesures : les époques sont les heures d'émission depuis le sol de points normaux archivés des données consolidées de télémétrie laser (CLRD) de l'ILRS, les observations sont les mesures laser réellement tirées vers les cinq réseaux de rétroréflecteurs sur la Lune, et chaque poids d'observation est la propre précision archivée de ce point normal, bin_rms/sqrt(n_raw), lue dans le fichier. Les coordonnées des stations proviennent de la solution SLR ITRF2020 de l'IERS (propagées à l'époque par leurs vitesses publiées) et celles des réflecteurs de la Table { "7" } de JPL DE430 dans le référentiel Terre moyenne/rotation moyenne que réalise le modèle WGCCRE de l'UAI { "2015" }. Les dérivées partielles de distance s'accumulent dans la matrice d'information de Fisher conjointe des coordonnées des réflecteurs et se propagent par la même matrice de conception de Helmert jusqu'à la covariance du datum, diagnostiquée par crate::fim::crlb. Le rang, le défaut, le conditionnement, le spectre, les directions inobservables dans la base à sept paramètres, la direction la plus faible à plein rang et la part de chaque paramètre dans celle-ci sont émis à chaque exécution, et un paramètre non contraint est publié comme NULL avec un statut. La corrélation entre réseaux est MESURÉE à exactement zéro plutôt que supposée, parce qu'une mesure laser touche un seul réseau. Un enregistrement que les catalogues ne peuvent pas placer — une station sans position ITRF publiée — est IGNORÉ ET COMPTÉ, sans jamais recevoir de coordonnée de substitution. LES LIAISONS MESURÉES ET CELLES QUI SONT MODELLED, C'EST LE RAPPORT, PAS UNE NOTE DE BAS DE PAGE : l'éphéméride du centre de la Lune et l'orientation du corps de l'UAI restent modélisées et leur taille combinée est émise sous forme du résiduel de distance aller observé moins calculé sur chaque point utilisé ; la troposphère, les marées du corps solide, l'excentricité de la station, le mouvement du pôle, UT1-UTC, le retard relativiste et les horloges des stations sont absents et inclus dans ce résiduel. Comme une erreur d'éphéméride n'atteint une covariance que par la direction de chaque ligne de visée, chaque exécution résout aussi à nouveau tout le datum avec toutes les dérivées partielles inclinées de sensitivity_tilt_deg (signe alterné) et émet le rapport, de sorte que l'insensibilité de la covariance à l'éphéméride modélisée est un nombre plutôt qu'un argument. Les chiffres de la campagne simulée sont EXÉCUTÉS et imprimés à côté de ceux mesurés, et non transcrits. MODELLED : les chiffres à sept paramètres sont une borne de Cramer-Rao pour un jeu de paramètres réduit sur un calendrier réel — pas un datum résolu, pas une analyse LLR et pas un produit géodésique. La tranche de données réelles consignée est livrée avec le dépôt mais pas avec le crate publié ; faites pointer data_dir vers une copie de celle-ci.
