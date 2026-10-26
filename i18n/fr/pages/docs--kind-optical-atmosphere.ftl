# docs--kind-optical-atmosphere: translations (fr)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } scénarios fournis utilisent ce type de scénario ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-72ad48275ebe = Type de scénario du moteur v{ $version }, famille <a1>PNT optique</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-a97755cb13eb = Page de famille : <a1>PNT optique</a1>

# text
seg-9fd02351d844 = ms

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Source : <c1/>

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (type de scénario)

# text
seg-a878d9be65b7 = PNT optique MODELLED à travers l'atmosphère : pour une liaison optique et un ensemble de sites au sol avec des climats nuageux donnés, rapporte la perte en air clair dépendant de la longueur d'onde et de l'élévation (loi de visibilité de Kim plus Rayleigh), l'état de turbulence de Hufnagel-Valley (variance de Rytov, indice de scintillation, paramètres gamma-gamma, moyennage d'ouverture), la disponibilité pilotée par la météo par rapport à la marge de liaison (épaisseur optique des nuages issue d'un climat log-normal d'eau liquide, extinction en optique géométrique, évanouissement de turbulence indépendant), la marge de liaison nécessaire pour des disponibilités cibles, la distribution des durées d'interruption, la croissance de l'erreur de synchronisation temporelle et de mesure de distance par interruption via le modèle de holdover d'horloge, la disponibilité de diversité de sites corrélée avec la distance, et des gains hypothétiques pour des techniques d'amélioration (longueur d'onde, ouverture de réception, réduction de la scintillation par optique adaptative, marge supplémentaire). VALIDATED comme implémentation des formules énoncées par rapport à une référence mpmath indépendante : variance de Rytov, indice de scintillation, probabilité d'évanouissement gamma-gamma, facteur de moyennage d'ouverture, épaisseur optique des nuages et de l'air clair. MODELLED : chaque entrée de météo, de technique et d'horloge ainsi que les hypothèses d'indépendance et de copule ; aucun enregistrement de disponibilité mesurée n'a été comparé. Analyse à titre consultatif, et non un produit certifié de disponibilité ou de navigation.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Une exécution de <c1/> se résume ainsi : optical-atmosphere: { "1550" } nm at { "30" } deg elevation, margin { "19.2" } dB before the atmosphere; best site southern { "74.66" } %; 3-site network { "92.72" } % independent / { "91.62" } % correlated weather (MODELLED, advisory)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-e466ecbd4e6d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-8adae3ea6e60 = L'exemple <c1/> définit, entre autres :

# text
seg-687f2930a40d = downlink

# text
seg-e794d481aed4 = plane

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Libellé du résultat (celui du moteur) : MODELLED — PNT optique à travers l'atmosphère : extinction en air clair (loi de visibilité de Kim + Rayleigh), épaisseur optique des nuages issue d'un climat d'eau liquide donné (quantité P.840, extinction en optique géométrique), turbulence de Hufnagel-Valley avec évanouissements gamma-gamma et moyennage d'ouverture, disponibilité par rapport à la

# attr:alt
seg-4e2b759aff17 = Le graphique que le moteur écrit pour scenarios/optical-atmosphere-network.toml, type de scénario optical-atmosphere

# text
seg-a18d144f149e = <b>MODELLED</b> Cn2 de Hufnagel-Valley intégré le long d'un trajet oblique pour la variance de Rytov en onde plane et en onde sphérique (liaison montante et descendante), l'indice de scintillation d'Andrews-Phillips et les paramètres gamma-gamma, la probabilité d'évanouissement gamma-gamma et la marge d'évanouissement, Tests : <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Disponibilité d'une liaison optique par rapport à une marge de liaison donnée, à partir d'un climat log-normal d'eau liquide des nuages (quantité UIT-R P.840, extinction en optique géométrique) et de l'évanouissement de turbulence gamma-gamma indépendant, la marge de liaison nécessaire pour des cibles a Tests : <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> La distribution des durées d'interruption d'un site optique couplée à la variance en forme close de la dérive libre du modèle de holdover d'horloge : erreur de synchronisation temporelle et de mesure de distance à des quantiles d'interruption donnés, le holdover jusqu'à un seuil de synchronisation temporelle, la fraction des interruptions et Tests : <a1>optical_atmosphere_identities.rs</a1>.

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Une table <c1/> facultative (durée, pas, graine) fait aussi écrire au type de scénario <c2/>, par site, une réalisation initialisée par une graine du modèle de site donné au fil du temps : épisodes nuageux (périodes dégagées exponentielles, interruptions nuageuses log-normales Tests : <a1>optical_atmosphere_timeseries.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Cn2 de Hufnagel-Valley intégré le long d'un trajet oblique pour la variance de Rytov en onde plane et en onde sphérique (liaison montante et descendante), l'indice de scintillation d'Andrews-Phillips et. Référence indépendante (ExternalDataset) : les calculs numériques sont comparés à un programme indépendant (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } à { "30" } chiffres, quadrature tanh-sinh sur la variable de hauteur d'origine et densités gamma-gamma de Bessel-K) qui ne partage aucun code avec Kshana, selon des seuils fixés avant qu'aucune implémentation n'existe (xval/optical-atmosphere/PREREGISTRATION.md). POURQUOI MODELLED : cette référence évalue les mêmes formules publiées, donc elle vérifie l'im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Disponibilité d'une liaison optique par rapport à une marge de liaison donnée, à partir d'un climat log-normal d'eau liquide des nuages (quantité UIT-R P.840, extinction en optique géométrique) et . Référence indépendante (InternalConsistency) : cohérence interne : limites en forme close et monotonie du modèle de diversité, forme close du plafond nuageux, et identités log-normales d'interruption. AUCUNE référence externe n'est revendiquée et aucune n'a été comparée : aucun enregistrement mesuré de disponibilité de station optique au sol ni de ligne de visée dégagée n'est utilisé. POURQUOI MODELLED : le climat nuageux (probabilité de nuages, médiane et dispersion de la colonne d'eau liquide, durées d'interruption),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> La distribution des durées d'interruption d'un site optique couplée à la variance en forme close de la dérive libre du modèle de holdover d'horloge : erreur de synchronisation temporelle et de mesure de distance à des quantiles d'interruption donnés. Référence indépendante (InternalConsistency) : cohérence interne avec le module de holdover, bit pour bit ; AUCUNE référence externe n'est revendiquée. Les DSP de classe sont les planchers synthétisés à long tau que le module de holdover porte déjà, de sorte que les chiffres héritent de sa réserve énoncée selon laquelle le holdover jusqu'à un seuil serré est gouverné par le plancher de bruit rouge supposé et non par l'écart d'Allan cité. Les durées d'interruption sont un modèle log-normal à paramètres donnés, et non un c mesuré

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — PNT optique à travers l'atmosphère : extinction en air clair (loi de visibilité de Kim + Rayleigh), épaisseur optique des nuages issue d'un climat d'eau liquide donné (quantité P.840, extinction en optique géométrique), turbulence de Hufnagel-Valley avec évanouissements gamma-gamma et moyennage d'ouverture, disponibilité par rapport à la marge de liaison, durées d'interruption couplées au holdover d'horloge, et diversité de sites corrélée avec la distance. Les calculs numériques sont vérifiés (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-32c6524b0baf = PNT optique MODELLED à travers l'atmosphère : pour une liaison optique et un ensemble de sites au sol avec des climats nuageux donnés, rapporte la perte en air clair dépendant de la longueur d'onde et de l'élévation (loi de visibilité de Kim plus Rayleigh), l'état de turbulence de Hufnagel-Valley (variance de Rytov, indice de scintillation, paramètres gamma-gamma, moyennage d'ouverture), la disponibilité pilotée par la météo par rapport à la marge de liaison (épaisseur optique des nuages issue d (catalogue des types de scénario (<c1/>))

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED : chaque entrée de météo, de technique et d'horloge ainsi que les hypothèses d'indépendance et de copule ; aucun enregistrement de disponibilité mesurée n'a été comparé. (catalogue des types de scénario (<c1/>))

# text
seg-384f5c73cdf9 = Une réalisation initialisée par une graine de la liaison de chaque site au fil du temps (MODELLED ; un tirage du modèle ci-dessus, et non le climat). En son absence, aucune série n'est écrite et le résultat est le document { "0.37" }. (commentaire du fichier de scénario, lignes { "78" } à { "79" })

# text
seg-c75fa5787bd4 = Les calculs numériques de l'atmosphère sur trajet oblique optique : variance de Rytov, scintillation, probabilité d'évanouissement gamma-gamma, moyennage d'ouverture, épaisseur optique des nuages et de l'air clair sont MODELLED, et non vérifiés : une sous-affirmation est vérifiée de façon externe, mais la capacité entière compose des éléments modélisés, de sorte qu'elle reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = La disponibilité d'un site optique au sol pilotée par la météo et la diversité de sites corrélée avec la distance sont MODELLED, et non vérifiées : elles sont contrôlées par rapport à leur propre identité analytique ou en forme close, ce qui détecte les erreurs de transcription et de coefficients, mais n'est pas une référence externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Page de sujet : <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Précédent</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Suivant</s1>orbit

# text
seg-b4402211e3fe = PNT optique à travers l'atmosphère : trois sites au sol ILLUSTRATIVE (un site nord plus nuageux, un site central intermédiaire et un site sud plus dégagé) observant un terminal optique LEO à { "30" } degrés d'élévation à { "1550" } nm. Les climats nuageux sont des entrées données, et non des mesures ni les valeurs d'un jeu de données quelconque, de sorte que chaque disponibilité ci-dessous est MODELLED. L'exécution rapporte par site la perte en air clair, l'état de turbulence de Hufnagel-Valley, t (commentaire du fichier de scénario, lignes { "1" } à { "8" })
