# docs--optical-atmosphere: translations (fr)

# text
seg-6cb7a787ac67 = Références

# text
seg-1c6199627b90 = Données

# text
seg-ad856ad710eb = État

# text
seg-53a7343c076e = Affirmation

# text
# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Source : <c1/>

# text
seg-333a1114746a = PNT optique à travers l'atmosphère

# text
# c1: optical-atmosphere
seg-47118f54f060 = Le type de scénario <c1/> répond à la question de savoir à quelle fréquence une liaison optique vers le sol fonctionne, pourquoi elle échoue, quelle marge ou quelle technique aiderait, et ce que fait une horloge pendant qu'elle est coupée.

# text
seg-06db0ea8f428 = Kshana n'est que le côté analyse. Il n'exécute aucune expérience de station sol optique, et ne nomme aucun partenaire de mesure. Le type de scénario est <b>MODELLED</b> : ses calculs numériques sont vérifiés par rapport à un programme indépendant, mais aucun enregistrement de disponibilité mesurée n'a été comparé, et chaque entrée de météo, de technique et d'horloge est une hypothèse. C'est une analyse à titre consultatif, et non un produit de disponibilité, d'intégrité ou de navigation certifié.

# text
seg-83c16fd89005 = Les deux scénarios fournis portent des climats nuageux ILLUSTRATIVE. Ce sont des entrées, et non des mesures ni les valeurs d'un jeu de données.

# attr:alt
seg-e9dbbd9cfa32 = Une réalisation générée avec une graine de la marge de liaison du site 'northern' sur { "336" } h, issue d'une exécution réelle du moteur v{ $version } sur scenarios/optical-atmosphere-network.toml (graine { "37" }, un pas de { "600" } s). La marge passe sous zéro pendant les épisodes nuageux ; dans ce tirage, la liaison est active { "40.5" } % du temps, avec { "27" } pannes et une panne la plus longue de { "30.7" } h. Les entrées sont illustratives, la série est un tirage du modèle et non le climat, et elle diffère de la disponibilité statistique ({ "37.8" } %) de l'erreur d'échantillonnage du tirage. Analyse à titre consultatif seulement : ni un produit de disponibilité, d'intégrité ou de navigation certifié, ni une prédiction pour un site réel, sauf si ses entrées climatiques proviennent d'un jeu de données indiqué.

# text
seg-13a52dfbd8d1 = Ce qui est calculé

# text
# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Perte par ciel clair</b> à la longueur d'onde et à l'élévation : extinction par les aérosols selon la loi de visibilité de Kim, McArthur et Korevaar, exponentielle en fonction de la hauteur, plus la diffusion de Rayleigh et une entrée d'absorption gazeuse indiquée. Cela remplace le <c1/> global unique de <c2/> lorsqu'une atmosphère est fournie. Sans atmosphère, le bilan de liaison est identique bit à bit à { "0.36" } (seuil préenregistré A5).

# text
# c1: Cn²
seg-929c80326b41 = <b>Turbulence.</b> Un profil <c1/> de Hufnagel–Valley (HV 5/7 par défaut) intégré le long du trajet oblique donne la variance de Rytov en onde plane ou sphérique, en liaison montante ou descendante. On en tire l'indice de scintillation d'Andrews–Phillips, les paramètres gamma-gamma, le facteur de moyennage d'ouverture en turbulence faible (Churnside) et la probabilité d'évanouissement et la marge d'évanouissement gamma-gamma. Le moyennage d'ouverture est appliqué par ajustement de moments : l'indice de scintillation est mis à l'échelle par le facteur de moyennage et les deux variances logarithmiques sont rééchelonnées pour le donner exactement.

# text
# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Nuage.</b> Le climat nuageux d'un site suit la forme de l'UIT-R P.840 : une probabilité de nuage et, en présence de nuage, une colonne d'eau liquide log-normale. P.840 fournit la quantité de nuage. L'atténuation est l'épaisseur optique en optique géométrique <c1/>, car la loi d'atténuation propre à P.840 est une loi hyperfréquence et ne s'applique pas de { "0.85" } à { "1.55" } µm, où les gouttelettes sont bien plus grandes que la longueur d'onde.

# text
# c1: null
seg-18311430b2a3 = <b>Disponibilité</b> d'un site : la liaison est active tant que les évanouissements dus au nuage et à la turbulence restent ensemble dans la marge laissée après la perte par ciel clair. Le nuage et la turbulence sont pris comme indépendants. Le rapport donne la disponibilité, la disponibilité par ciel clair, le <b>plafond</b> qu'aucune marge ne peut relever (une liaison optique ne traverse pas un nuage épais), et la marge supplémentaire nécessaire pour chaque disponibilité cible, ou <c1/> si la cible est au-dessus du plafond.

# text
seg-885e06050a9a = <b>Pannes.</b> Les durées sont log-normales avec une moyenne et une dispersion indiquées. Le rapport donne les pannes par an, la durée à la médiane, au 90e et au 99e centile, et la probabilité et la part du temps de panne au-delà de { "1" }, { "6" }, { "24" } et { "72" } heures.

# text
# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Diversité de sites.</b> Les <c1/> meilleurs sites combinés avec une météo indépendante (<c2/>) et avec une météo corrélée avec la distance : corrélation par paire <c3/>, combinée dans une copule gaussienne à un facteur. À <c4/>, c'est l'union indépendante, et à corrélation totale, le meilleur site seul.

# text
# c1: [[technique]]
seg-b85681b9fd93 = <b>Techniques.</b> Chaque <c1/> est un scénario hypothétique : une nouvelle longueur d'onde (le bilan par ciel clair, la perte par ciel clair et le moyennage d'ouverture sont réévalués), une nouvelle ouverture de réception, une réduction fractionnaire de scintillation indiquée (optique adaptative) et une marge supplémentaire. Le résultat est le gain de disponibilité par rapport à la référence de base au même site. Kshana ne modélise pas de boucle d'optique adaptative ; les gains sont donc des entrées.

# text
# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Synchronisation temporelle et mesure de distance pendant une panne.</b> Chaque durée de panne est transposée par la variance de dérive en forme close du modèle de holdover d'horloge, pour les horloges listées dans <c1/>. Le rapport donne l'erreur de synchronisation temporelle et de mesure de distance à des durées de panne indiquées, le holdover jusqu'au seuil de synchronisation temporelle, la part des pannes qui y tiennent, et la disponibilité de synchronisation temporelle <c2/>. Les planchers en loi de puissance des classes sont ceux synthétisés par le module de holdover ; un seuil serré est donc gouverné par ce plancher supposé, comme l'indique <c3/>.

# text
seg-59774a9e8685 = Marge de liaison en fonction du temps ({ "0.38" })

# text
# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Une table <c1/> (<c2/> jusqu'à { "8760" }, <c3/>, <c4/>) ajoute à chaque site une <b>réalisation générée avec une graine</b> du modèle ci-dessus : la ligne de visée alterne entre des périodes dégagées (exponentielles, de moyenne fixée de sorte que la part du temps sous nuage soit le <c5/> indiqué) et des pannes dues aux nuages (log-normales, de moyenne et de dispersion indiquées) ; chaque panne tire une colonne d'eau liquide du climat indiqué et la conserve ; chaque pas tire un échantillon de scintillation gamma-gamma (indépendant d'un pas à l'autre, une simplification indiquée) et le terminal est pointé sur la cible avec la disponibilité de pointage indiquée. La marge du pas est le budget d'évanouissement moins les évanouissements dus au nuage et à la scintillation, et la liaison est active lorsque la marge n'est pas négative et que le terminal est pointé sur la cible, la condition qu'utilise l'intégrale de disponibilité.

# text
# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = C'est un tirage, et non le climat : sa disponibilité diffère de la disponibilité statistique de l'erreur d'échantillonnage du tirage, et le premier épisode est tiré en entier. Le résultat porte <c1/>, <c2/>, <c3/> et <c4/> par pas et un bloc <c5/> (disponibilité, fraction de nuage, nombre de pannes, panne la plus longue). <b>MODELLED</b> ; les vérifications (<c6/>, seuils fixés dans <c7/> avant la première exécution) sont le déterminisme et la cohérence avec les valeurs indiquées, et non une référence externe indépendante. Sans la table, rien n'est écrit et le résultat est le document { "0.37" }.

# text
seg-4a9b065bdb28 = Champs du scénario

# text
# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Tous les champs de premier niveau sont facultatifs. Un simple <c1/> exécute trois sites illustratifs. Voir les deux fichiers fournis pour chaque clé : <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-b7619573e112 = État de vérification

# text
seg-6598ced4218b = La variance de Rytov, l'indice de scintillation, la probabilité d'évanouissement gamma-gamma, le facteur de moyennage d'ouverture, l'épaisseur optique des nuages et par ciel clair sont calculés comme l'énoncent les formules indiquées

# text
seg-2442f7529fbb = ligne MODELLED ; calculs numériques vérifiés par rapport à un programme mpmath indépendant

# text
# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = seuils A1 à A3, tous atteints (<c1/>)

# text
seg-b91d83aea0e8 = Bilan de liaison et disponibilité existante inchangés sans atmosphère

# text
seg-2192262e26c1 = atteint

# text
seg-a71527a271df = seuil A5, identique bit à bit sur { "1,000" } jeux de paramètres

# text
seg-0db8cf4c2ee0 = Limites de diversité et monotonie ; couplage de holdover exact au bit près

# text
seg-2a5c5967540c = atteint (identités)

# text
seg-4b0e5e3ac558 = seuils A4, A6

# text
seg-f842c688e29a = Disponibilité d'un site réel, scintillation réelle, statistiques nuageuses réelles

# text
seg-9a0ead7b1670 = non revendiqué

# text
seg-9cc220190772 = aucune référence externe indépendante n'a été comparée

# text
seg-7c5050135e2b = La référence indépendante vérifie l'implémentation des formules indiquées, et non l'atmosphère ; aucune ligne n'est donc VALIDATED. Les valeurs de validation de l'UIT-R ne sont pas utilisées et sont tenues hors du dépôt.

# text
# c1: optical_availability
seg-73dcf0f31fe9 = Aucun jeu de données météorologiques n'est fourni. Les entrées de climat nuageux pour un site réel proviendraient d'un jeu de données public (Copernicus ERA5, NASA MODIS ou ISCCP) ; la licence de chaque jeu de données doit être lue et consignée avant usage, et les données brutes récupérées au moment du test avec un SHA-256 figé. La seule climatologie déjà présente dans le dépôt est la table de nuits claires de Cavazzani et al. utilisée par <c1/>.

# text
seg-44d197f3209c = Andrews et Phillips, <em>Laser Beam Propagation through Random Media</em>, 2e éd. (variance de Rytov, indice de scintillation, paramètres gamma-gamma).

# text
seg-9e9a33d44013 = Kim, McArthur et Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (loi de visibilité).

# text
seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (facteur de moyennage d'ouverture).

# text
seg-309c70f2f4f8 = UIT-R P.840 (statistiques d'eau liquide des nuages), P.1814 et P.1817 (méthodes d'optique en espace libre).

# text
seg-83b30e1ca261 = <s1>Précédent</s1>Paquets de preuves

# text
seg-1474b58fb35a = <s1>Suivant</s1>Synchronisation des créneaux

seg-50f25bceca3c = <s1>Précédent</s1>Partenaires de données et lignes à promouvoir
