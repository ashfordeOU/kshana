# docs--lunar-reference-station: translations (fr)

# text
seg-f37311ad7ef0 = Sorties

# text
seg-f63dd3d7aad4 = Source

# text
seg-9872e31ebd72 = Sources

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
seg-38afa54b0306 = Source : <c1/>

# text
seg-e8ee3794bac6 = <b>MODELLED.</b> Sous les hypothèses indiquées (la constellation, son erreur de signal dans l'espace, la précision de relevé de la station, la latence des corrections et la quantification de la liaison, chacune une entrée étiquetée avec sa source publique ou comme ILLUSTRATIVE), le modèle donne les chiffres ci-dessous. Ils ne sont <b>pas</b> une affirmation sur les performances d'un système réel. Kshana n'est <b>pas</b> affilié à une agence ni soutenu par elle, et ne revendique aucun TRL ni héritage de vol. À titre consultatif seulement.

# text
seg-22eb5bd00092 = Objet

# text
seg-25678ae41147 = Des documents publics décrivent une station de référence au pôle Sud lunaire qui surveille un service de navigation lunaire, calcule des corrections différentielles locales, tient une référence de temps lunaire sur une horloge atomique, et porte un rétroréflecteur laser et un émetteur VLBI pour le référentiel lunaire (la classe décrite publiquement pour le concept NovaMoon de l'ESA ; sources ci-dessous). Kshana modélise déjà chaque élément séparément. Cette étude les compose en une seule analyse ouverte et reproductible de ce qu'une telle station pourrait faire sous des hypothèses publiques, et la préenregistre afin qu'elle puisse être notée par rapport aux résultats publiés et, à terme, aux résultats en vol.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = ou <c1/> depuis Python, WebAssembly ou <c2/> du serveur MCP avec <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Carte de couverture et de précision (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Pour une station de référence différentielle en un site polaire sud connu : à chaque point utilisateur d'une grille en anneaux de { "80" }° S jusqu'au pôle et sur la région, sur une journée d'époques et des essais de Monte-Carlo, les percentiles de l'erreur de position corrigée et non corrigée (3-D, horizontale, verticale), la disponibilité avec une raison pour chaque époque indisponible, la couverture par rapport à un seuil énoncé avant l'exécution, les niveaux de protection DO-229E, le rayon de couverture par secteur d'azimut, et le bilan de la liaison de corrections à la station et au pire point. Aucune physique nouvelle : il balaie les fonctions testées de <c1/> et se réduit exactement à ce type de scénario en un point, une époque et un essai.

# text
seg-94058315dfe4 = Entrée

# text
seg-7670cf4ceda3 = Valeur par défaut

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Constellation (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) ou <c6/>

# text
seg-bfdd053b2611 = l'ensemble de classe LCNS intégré à l'arbre

# text
seg-389db26524b4 = ILLUSTRATIVE dans la valeur par défaut fournie ; l'exemple à sources publiques fixe quatre satellites et la période de { "24" } h d'après S2 et S4, le jeu d'éléments restant ILLUSTRATIVE (aucune source ne l'indique)

# text
seg-91231bdcc599 = ILLUSTRATIVE

# text
# c1: station_lat_deg
# c2: station_lon_deg
# c3: station_height_m
seg-6b9d48431e4b = Station (<c1/>, <c2/>, <c3/>)

# text
seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

# text
seg-f32dcb376b51 = { "0.30" } m

# text
seg-93d78578585f = ILLUSTRATIVE (l'allocation de réalisation du référentiel intégrée à l'arbre, elle-même MODELLED)

# text
# c1: orbit_err_m
# c2: clock_err_m
# c3: sise_sigma_m
# c4: sise_orbit_variance_fraction
seg-59286c0377ce = <c1/>, <c2/>, ou <c3/> avec <c4/>

# text
seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE sur la ligne de visée { "65" } m)

# text
# c1: sise_sigma_m
seg-9a432ef35cac = ILLUSTRATIVE dans la valeur par défaut fournie ; l'exemple à sources publiques fixe <c1/> = { "10" } / { "1.96" } m d'après S4 p8

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bits

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Grille (<c1/>, <c2/>) ou <c3/>

# text
seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } points)

# text
seg-e945f5407b12 = la région étudiée

# text
# c1: t_start_s
# c2: t_span_s
# c3: t_step_s
# c4: n_trials
seg-fed48a6c31be = Temps (<c1/>, <c2/>, <c3/>), <c4/>

# text
seg-0fec404c8c7c = { "0" } s, un jour, { "600" } s, { "200" }

# text
seg-d35d88b0753b = { "20" } m au p95 dans la valeur par défaut fournie ({ "1" } m dans l'exemple à sources publiques)

# text
seg-fa7858b14f89 = énoncé avant l'exécution ; { "20" } m est ILLUSTRATIVE, dimensionné d'après les erreurs illustratives de la valeur par défaut

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-329ad585cd9b = ILLUSTRATIVE : aucune valeur publique n'existe

# text
seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

# text
# c1: units
# c2: tests/field_units_global.rs
# c3: availability
# c4: coverage_fraction
# c5: corrected_p_3d_m
# c6: corrected_p_h_m
# c7: corrected_p_v_m
# c8: uncorrected_p_3d_m
# c9: improvement_factor
# c10: hpl_max_m
# c11: vpl_max_m
# c12: hpl_below_alert_fraction
# c13: worst_point
# c14: coverage_radius_km
# c15: points[]
# c16: budget_at_station_and_at_edge
seg-c530b459b0ef = Chaque champ numérique porte une unité et une classe de provenance dans le bloc <c1/> du résultat (vérifié par <c2/>). Le bloc de région : <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/> ; <c14/> par secteur d'azimut de { "30" }° ; <c15/> par point ; et <c16/>.

# text
seg-4aa380258574 = Ce que les contrôles peuvent et ne peuvent pas dire

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/> : la réduction à <c2/>, les planchers de ligne de base nulle et de relevé, la monotonie, les raisons d'indisponibilité, le déterminisme, la garde de charge de travail. Ils montrent que le balayage est bien le modèle qu'il prétend balayer.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/> : un nouveau calcul numpy indépendant de l'arithmétique sur des cas exportés, préenregistré avant son exécution. Les positions et les percentiles ont atteint leurs seuils ; les corrections de la station ont manqué les leurs à cause de l'arrondi en double précision (consigné, avec ses chiffres, dans <c2/>).

# text
seg-be6ecf79d22c = Aucun des deux ne contrôle le modèle. Le modèle d'erreur, la décorrélation du premier ordre, les modèles de relevé, de vieillissement et de quantification et chaque seuil sont propres à ce projet ou ILLUSTRATIVE.

# text
seg-d6f194e28401 = Masques d'horizon du terrain

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Une section <c1/> facultative (<c2/>) donne à la station et à chaque point utilisateur son propre horizon dépendant de l'azimut, au format de table de ligne d'horizon de { "0.36" } (lignes <c3/>, linéaire en azimut avec rebouclage à { "360" }°). Un satellite compte en un site lorsqu'il dépasse à la fois <c4/> et l'horizon à son azimut ; une époque que l'horizon laisse avec moins de quatre satellites en un point, là où le masque plat en donne quatre, est signalée comme <c5/> (<c6/> garde son sens plat). Deux sources, combinées par leur maximum point à point lorsque les deux sont données :

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = un profil indiqué, <c1/> ou <c2/> (appliqué à chaque point utilisateur), chacun avec une étiquette <c3/> obligatoire ;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = un horizon obtenu par lancer de rayon sur un MNT polaire (<c1/>) : grands cercles de la sphère lunaire avec courbure exacte, depuis une hauteur de mât indiquée (par défaut { "2" } m), tous les <c2/> (par défaut { "1" }°), jusqu'à <c3/> (par défaut { "150" } km) ou le bord de la grille. Le dépôt intègre un extrait du produit polaire LRO LOLA du domaine public <c4/>, rééchantillonné par moyenne de blocs { "5" } × { "5" } à { "1200" } m et à environ ±{ "420" } km du pôle (<c5/> : URL source, SHA-256, licence, étapes d'extraction et de rééchantillonnage) ;

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = ou, à la place de <c1/>, une tuile de MNT en latitude/longitude (<c2/>) au format texte <c3/> (un en-tête <c4/>, puis les hauteurs en mètres au-dessus de la sphère moyenne, en ordre ligne par ligne), parcourue par lancer de rayon de la même façon, l'espacement en latitude fixant le pas par défaut. Le rapport reprend le chemin, le SHA-256 et l'étendue de la tuile (<c5/>). Une tuile rééchantillonnée à partir de l'extrait intégré donne à la station l'horizon propre de l'extrait à { "0.22" }° près (<c6/>). Aucune tuile n'est intégrée.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = Les mêmes masques s'appliquent à la grille <c1/> (<c2/>, <c3/> et <c4/> ; un point de grille hors du MNT garde le masque plat et est compté). Sans la section, chaque document est identique octet pour octet à une exécution sans elle.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Contrôles : le lancer de rayon reproduit des horizons en forme close (l'abaissement de la sphère nue, un cratère dans un plateau depuis son centre et hors de celui-ci, un cône rastérisé comparé au cône analytique) ; l'extrait intégré est orienté comme la source (les fonds de Shackleton et de Haworth bas, le massif de Malapert haut) ; un lancer de rayon numpy indépendant sur l'extrait, préenregistré (<c1/>), concorde à { "5.5e-10" } deg près en cinq sites, ce qui contrôle l'arithmétique, non le terrain. Aucun chiffre publié d'horizon ou d'illumination polaire n'a été reproduit, de sorte que la ligne reste MODELLED (ligne du registre « Masques d'horizon du terrain lunaire à partir d'un profil indiqué ou d'un MNT polaire »).

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> exécute les entrées fournies sur une grille de { "2" }° avec { "100" } essais et l'horizon du MNT en chaque site. Le site de la station ({ "89" }° S, { "0" }° E) a un horizon le plus haut d'environ { "4.0" }°, sous le masque de { "5" }°, de sorte qu'à la station le terrain ne contraint pas ; aux points utilisateur, la moyenne pondérée par la surface de l'horizon le plus haut de chaque point est de { "9.7" }° et le plus grand de { "26.3" }°. Par rapport aux mêmes entrées avec le masque plat, l'erreur 3-D corrigée au p95 de la région passe de { "16.3" } m à { "18.6" } m et le plus grand HPL de { "480" } m à { "62" } km. La disponibilité de la région passe de { "91.9" } % à { "93.0" } % : une époque est indisponible quand un point utilise un satellite que la station ne voit pas, et un horizon qui cache ce satellite au point peut rendre l'époque disponible.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Terrain et masquage de l'horizon : traités dans { "0.36" }, avec des limites.</b> Des masques d'horizon par site issus d'un profil indiqué ou de l'extrait de MNT LOLA intégré sont modélisés (ci-dessus). Ce qui reste : l'extrait intégré fait { "1200" } m par pixel, de sorte que le relief inférieur à environ un kilomètre est lissé et que les moyennes de blocs abaissent les pics aigus ; un rayon qui quitte l'extrait (à environ { "420" } km du pôle) s'y arrête ; il n'y a ni diffraction, ni trajets multiples du terrain, ni obstruction partielle ; les positions des sites pour la mesure de distance restent sur la sphère moyenne aux hauteurs indiquées (le MNT ne fixe que l'horizon) ; l'horizon n'est pas validé par rapport à un chiffre externe. Le site d'export par satellite de <c1/> est masqué comme un point de grille : avec une section <c2/>, chaque ligne d'export porte <c3/> et le rapport l'horizon du site (<c4/>) ; les décomptes dans le faisceau de l'antenne comptent toujours chaque liaison qui dépasse le masque plat.

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Trajets multiples et matériel du récepteur : traités dans { "0.36" } sur option, avec des limites.</b> Une section <c1/> (<c2/>) ajoute un trajet multiple dépendant de l'élévation <c3/> chez l'utilisateur et à la station (la forme fonctionnelle de DO-229 ; sur la Lune, chaque valeur est ILLUSTRATIVE), le trajet multiple de la station étant facultativement un processus de Gauss-Markov du premier ordre sur les époques, un bruit de code DLL early-minus-late issu du C/N0, et des biais inter-canaux par canal. Ce qui reste : les variations du centre de phase et du délai de groupe de l'antenne ne sont pas modélisées ; aucune mesure lunaire ne fixe les valeurs de trajet multiple ; le bloc du bilan de la liaison de corrections n'inclut pas les termes du récepteur.

# text
seg-677252c2d3e5 = Croissance de l'erreur d'éphéméride sur la latence : traitée dans { "0.36" } sur option, avec des limites.

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> ajoute une croissance linéaire de l'erreur d'orbite diffusée avec l'âge (1 sigma de distance <c2/>), en plus de la reprojection à erreur figée ; la croissance linéaire est le terme du premier ordre d'une erreur d'état propagée (vérifiée à { "1" } % près à { "600" } s par rapport à la propagation à deux corps intégrée à l'arbre). Ce qui reste : aucune source publique ne donne de taux de croissance lunaire (ILLUSTRATIVE) ; aucune structure along-track/radiale ; le bloc du bilan de la liaison de corrections utilise le modèle figé. L'addendum K5 (<c3/>, préenregistré seul) exécute K5 à { "0.001" }, { "0.01" } et { "0.1" } m/s : il échoue dans chaque cas ({ "369.8" } m, { "2315" } m, { "22797" } m pour un seuil de { "1.5" } m), comme énoncé avant l'exécution.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Style de solution (filtre, contrainte de hauteur, trois satellites) : sur option dans { "0.36" }, avec des limites.</b> Une section <c1/> (<c2/>) ajoute une pseudo-mesure de hauteur, un minimum de trois satellites avec elle, et une fenêtre de moindres carrés pondérés pour utilisateur statique sur les époques (une position partagée, une horloge par époque), qui tient lieu de filtre. Ce qui reste : elle traite les erreurs des époques comme indépendantes, de sorte qu'elle se moyenne à la baisse plus vite que ne le feraient des erreurs corrélées dans le temps ; elle ne vaut que pour l'utilisateur statique ; il n'y a ni filtre dynamique, ni phase de la porteuse, ni résolution d'ambiguïté ; la trace du cas (<c3/>) montre l'arithmétique de l'instantané. L'addendum des affirmations publiées avec ce mode est <c4/> (préenregistré seul). Avec une contrainte de hauteur de { "1" } m, trois satellites et une fenêtre de 6 époques (réglages ILLUSTRATIVE), l'erreur 3-D corrigée au p95 de R300 passe de { "280.6" } m à { "2.11" } m (horizontale { "0.90" } m, non notée) ; K1 à K5 échouent toujours et K6 réussit, { "1" } sur { "6" } comme dans l'exécution consignée. L'hypothèse d'indépendance de la fenêtre lui est favorable.

# text
seg-4f8274f839a7 = Comparaison avec les affirmations publiées

# text
seg-82391b00e1bc = MODELLED. Une comparaison de ce modèle, exécuté sous les hypothèses publiques, avec les affirmations que font les sources. Ce n'est pas une affirmation sur les performances d'un système réel.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Sources S1 à S5 (titre, URL, date de consultation, SHA-256, licence) : <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Chaque affirmation numérique, citée avec sa page et ses hypothèses indiquées et classée comme comparable, partiellement comparable ou non comparable : <c1/>. Aucune affirmation n'est entièrement comparable, parce qu'aucune source n'indique un percentile ni les éléments orbitaux des satellites.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Seuils, cas et entrées, enregistrés seuls avant l'exécution (révision { "2" }, 05bf9a19), et l'exécution consignée : <c1/>. Le constat est figé dans <c2/>.

# text
seg-069a652c402e = seuil

# text
seg-d6120708c062 = affirmation (sources)

# text
seg-5b480535b54b = ce modèle

# text
seg-6231a005ccc9 = verdict

# text
seg-45dc6ff5d546 = une station donne une précision submétrique sur tout le cercle de { "300" } km du pôle Sud (S1, S2, S3)

# text
seg-4da98cf6180b = couverture { "0.00" }

# text
seg-70a79ec95bf4 = échec

# text
seg-cd0e9021aaa3 = la même, cercle de { "600" } km (S2 p10, S3 p23)

# text
seg-ef9f2ee31c52 = submétrique avec des corrections de code (S1, S2)

# text
seg-9f4e2b6991e8 = p95 3-D corrigé { "280.6" } m

# text
seg-ac3c99ec0d15 = <= { "1.5" } m

# text
seg-1b720f1677cc = « niveau décimétrique » à partir de corrections de pseudodistance (S3 p22, S5 p5)

# text
seg-ffa1c831a14f = { "280.6" } m

# text
seg-70368d910820 = <= { "0.15" } m

# text
seg-786f940b345e = échec (ne pouvait pas réussir au bruit de code de { "0.30" } m des sources)

# text
seg-da761dde1cae = submétrique conservé à { "600" } s de latence (S2 p16)

# text
seg-2a9db96bd87f = { "293.0" } m

# text
seg-021336eb5623 = la même précision de { "10" } km à { "500" } km de ligne de base (S2 p17)

# text
seg-62190343777c = rapport { "1.39" }

# text
seg-7a33a168b020 = réussite

# text
seg-e666f1eb7a59 = { "1" } seuil sur { "6" } est réussi. La cause est la géométrie. Aucune source ne publie les éléments orbitaux de la constellation. Avec les éléments ILLUSTRATIVE intégrés à l'arbre, un utilisateur et la station ne partagent quatre satellites au-dessus de { "5" } deg que dans { "8" } % ({ "300" } km) et { "6" } % ({ "600" } km) des époques, avec une géométrie quasi singulière : le p95 non corrigé est de { "3.8" } km, là où les sources citent < { "10" } m. Les propres simulations des sources utilisaient un filtre, une contrainte de hauteur et trois satellites en vue commune, ce que ce modèle d'instantané n'a pas. L'exécution ne reproduit donc pas les affirmations sur ces éléments, et ce n'est pas une preuve que les affirmations sont fausses. La réussite de K6 est un rapport de deux chiffres dominés par la géométrie et ne dit rien de la décorrélation. Un jeu publié d'éléments de la constellation serait noté selon les mêmes seuils, comme seconde exécution datée.

# text
seg-1da5fcf7bbf5 = Prédiction préenregistrée

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Une prédiction préenregistrée, figée au commit <c1/> sur les entrées à sources publiques, avec son protocole de notation : <a1><c2/></a1>. C'est une prédiction, non une validation, et chaque chiffre qu'elle contient est dominé par le jeu d'éléments non publié de la constellation de quatre satellites (les éléments utilisés sont ILLUSTRATIVE) : sur la région au-delà de { "80" } deg S, disponibilité { "8.2" } %, p95 3-D corrigé { "280" } m, non corrigé { "3.8" } km. MODELLED ; <c3/> échoue si le moindre octet figé change.

# text
seg-e6aef34d5023 = Laboratoire de temps de la station

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Si le miniRAFS de la station, piloté sur le LTC puis en marche libre ou repiloté, reste dans { "1" }, { "10" } et { "100" } ns : le bloc facultatif <c1/> de <c2/> (<c3/>). Le miniRAFS atteint { "1" } ns après { "2.8" } s, { "10" } ns après { "377" } s et { "100" } ns après { "10.5" } h ; l'objectif de niveau nanoseconde de la source est cité, non adopté. MODELLED. Modèle, sorties, table du temps jusqu'au seuil pour quatre classes d'horloge et comparaison avec les sources : <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Géodésie de la station

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = De combien un rétroréflecteur et une balise VLBI au site de la station resserrent le datum du référentiel lunaire au-delà des cinq réseaux de rétroréflecteurs archivés : les entrées facultatives <c1/> et <c2/> de <c3/> (<c4/> et <c5/>). Bornes de Cramér-Rao pour un jeu de paramètres réduit sur un calendrier et un site ILLUSTRATIVE : le 1 sigma de la norme de translation passe de { "0.0185" } m à { "0.0102" } m (rapport { "0.551" }), l'échelle de { "0.00178" } à { "0.00063" } ppm. MODELLED. Méthode, réserves (un site polaire sud voit la Terre bas ou pas du tout) et table de Helmert complète : <a1><c6/></a1>.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Chaque source par titre, identifiant et éditeur, avec sa date de consultation et sa licence. Les URL, les empreintes SHA-256 et les notes sur les points où les sources divergent figurent dans le registre, <a1><c1/></a1>. Aucun fichier source n'est redistribué. Les noms de personnes sont omis à dessein.

# text
seg-b1f1e1efa042 = id

# text
seg-02071a726f21 = titre

# text
seg-0634af374469 = identifiant

# text
seg-fd875b5fb817 = éditeur

# text
seg-a6f8ef268fcc = consulté le

# text
seg-d04709ddc97d = licence

# text
seg-1d4174e911c1 = livre blanc sur une station de référence lunaire pour le positionnement, la synchronisation temporelle et la science, version { "3" }

# text
seg-e09e1cc11921 = arXiv (livre blanc des auteurs)

# text
seg-c91720d34bd3 = licence non exclusive de distribution d'arXiv { "1.0" } (n'accorde de droits qu'à arXiv)

# text
seg-df12c861db1e = « Lunar local Differential PNT and Selenodetic Reference Station » ({ "27" } diapositives)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, section { "6" }, point { "07" }

# text
seg-406990fe43a8 = Atelier ICG-IOAG sur le PNT cislunaire, février { "2025" } ; diapositives de l'Agence spatiale européenne

# text
seg-58579c3faf2f = aucune indiquée ; marqué diffusable au public à partir de la diapositive { "3" }

# text
seg-57df0ef791e6 = « Moonlight: LCNS, and Lunar Pathfinder » ({ "28" } diapositives)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, session du groupe de travail conjoint de l'ICG sur le PNT lunaire, juin { "2024" } ; diapositives de l'Agence spatiale européenne

# text
seg-f4e53e44f0b5 = aucune indiquée ; marqué diffusable au public

# text
seg-b22a694c481d = « Moonlight Programme Development Status » ({ "16" } diapositives)

# text
seg-3fd0ab93507d = 2e atelier ICG-IOAG sur le PNT cislunaire, février { "2026" } ; diapositives de l'Agence spatiale européenne et de Telespazio

# text
seg-472771298df7 = « Lunar Reference Time: ESA's Views » ({ "9" } diapositives)

# text
seg-6229db9cb23d = Atelier sur le PNT cislunaire, février { "2026" } ; diapositives de l'Agence spatiale européenne

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, et le <c1/> intégré à l'arbre

# text
# c1: lunar_afs
seg-4e07c500e353 = tel que consigné avec <c1/>

# text
seg-28f8d886c4e5 = déjà dans l'arbre

# text
seg-2006c194fef6 = tel que consigné là

# text
seg-68db6a17b4e7 = <s1>Précédent</s1>Système solaire et autres corps

# text
seg-79d53edd2374 = <s1>Suivant</s1>Navigation des utilisateurs de l'espace (gnss-ssv)

# text
seg-9c59637f0666 = Carte de couverture et de précision (lunar-station-coverage)
