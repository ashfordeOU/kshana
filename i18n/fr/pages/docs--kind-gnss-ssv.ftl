# docs--kind-gnss-ssv: translations (fr)

# text
seg-37d29d8303fe = km

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/gnss-ssv.md
seg-1b94e5a24a2d = Source : <c1/>

# text
# c1: gnss-ssv
seg-ee3ecc6e0330 = <c1/> (type de scénario)

# text
seg-d07af7221334 = Type de scénario du moteur v{ $version }, famille <a1>Navigation des utilisateurs spatiaux</a1>. À titre consultatif : résultat d'analyse issu d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf indication contraire de la matrice (comment une étiquette s'obtient : section Evidence du README).

# text
seg-d6d7bca305dc = Disponibilité du GNSS et force de la liaison MODELLED dans le volume de service spatial et au-delà : pour un utilisateur sur une sphère (la coquille globale du livret de l'ICG) ou sur une trajectoire képlérienne (de l'orbite basse au transfert lunaire), il compte, par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et pour toutes ensemble, les signaux utilisables au-dessus d'un seuil de C/N0 - disponibilité d'au moins un et de quatre signaux, durée maximale d'interruption, C/N0 reçu, dilution de précision, liaisons par lobe principal contre lobes secondaires - avec un diagramme d'émission du livret, paramétrique ou fourni par l'utilisateur, des effets facultatifs d'ionosphère, de plasmasphère et d'atmosphère sur le rayon rasant le limbe, et une conception facultative de récepteur à signal faible ; ainsi qu'un filtre de Kalman étendu GNSS embarqué pour les engins en HEO et en transfert lunaire (dynamique orbitale, pression de radiation solaire, troisièmes corps, horloge) et la navigation relative d'une formation de plusieurs engins par pseudodistances en différences simples. Vérifié par rapport aux tableaux du livret SSV de l'ICG dans le cadre d'un préenregistrement (xval/gnss-ssv)

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-d739ae994bf0 = Une exécution de <c1/> se résume ainsi : gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

# text
# c1: shell|trajectory|navigation
seg-79d2e350ed73 = Champs obligatoires : <c1/>

# text
# c1: name
# c2: constellations
# c3: transmit
# c4: receiver
# c5: atmosphere
# c6: formation
seg-7fc75803140d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-cebc76420d69 = L'exemple <c1/> définit, entre autres :

# text
seg-ce3b64e8c1f4 = [l1, l5]

# text
seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

# text
seg-b02a3ef32d54 = HEO, high-gain nadir and patch zenith antennas, parametric s

# text
seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

# text
seg-3421a66993bd = heo

# text
seg-8974ff39f695 = parametric

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } scénarios fournis utilisent ce type ; les autres se trouvent dans <a1><c1/></a1>.

# text
seg-8ac8f00f6c77 = 1/m^{ "3" }

# text
seg-15ca016a7a4f = Étiquette du résultat (celle du moteur) : MODELLED : un balayage géométrique et de bilan de liaison. Le diagramme du livret est un lobe principal à puissance constante, le diagramme paramétrique un substitut représentatif, et le milieu du rayon rasant le limbe un modèle simple déclaré ; rien ici n'est une mesure d'un signal dans l'espace. Les chiffres de disponibilité et d'interruption suivent la méthode du

# attr:alt
seg-7dae5e291c8b = Le graphique que le moteur écrit pour scenarios/gnss-ssv-heo.toml, type de scénario gnss-ssv

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Les balayages de disponibilité du type de scénario <c1/> : par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et combinées, la part des paires (utilisateur, époque) avec au moins un et au moins quatre signaux et l'interruption la plus longue, pour un utilisateur sur une sphère

# text
# c1: gnss-ssv
# c2: [navigation]
seg-07c94d5ad15c = <b>MODELLED</b> Le mode <c2/> du type de scénario <c1/> : un filtre de Kalman étendu à neuf états (position, vitesse, biais et dérive de l'horloge du récepteur, un facteur d'échelle de pression de radiation solaire) sur des pseudodistances dont la disponibilité, le bruit et le C/N0 proviennent du même lien

# text
# c1: gnss-ssv
# c2: [formation]
seg-41bfe74c6f6f = <b>MODELLED</b> Le mode <c2/> du type de scénario <c1/> : un chef et des adjoints exécutent chacun le filtre absolu ; la position de l'adjoint par rapport au chef est estimée en soustrayant les estimations absolues et par un filtre relatif sur des pseudodistances en différences simples

# text
# c1: gnss-ssv
seg-de9a2a5b5f04 = <b>MODELLED</b> Les balayages de disponibilité du type de scénario <c1/> : par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et combinées, la part des paires (utilisateur, époque) avec au m. Référence indépendante (ExternalDataset) : le livret du volume de service spatial de l'ICG (UN OOSA ST/SPACE/75, { "2018" }), lui-même une simulation, comparé dans le cadre d'un préenregistrement déposé avant l'exécution (xval/gnss-ssv/PREREGISTRATION.md ; résultats dans xval/gnss-ssv/RESULTS.md, figés par tests/ssv_booklet_results.rs, échecs compris). Exécution { "1" } sur la lecture préenregistrée : les constantes de puissance rayonnée minimale et le seuil lunaire concordent (S0, S6 atteints) ; les SSV supérieur et inférieur, seuil RF

# text
seg-f0b778c4922a = <b>MODELLED</b> Une ionosphère de Chapman, une plasmasphère de type Gallagher et une atmosphère neutre (courbure par réfractivité, absorption par l'oxygène, défocalisation) intégrées le long de la droite. Référence indépendante (InternalConsistency) : formes fermées et grandeurs publiées dans les tests (le pic d'une couche de Chapman et la courbure du limbe en surface, quelques TECU de plasmasphère sur un rayon GPS-vers-GEO) ; la conception du récepteur réutilise les modèles d'acquisition et de boucle de poursuite ainsi que leurs tests. Aucune donnée mesurée de sondage au limbe ni de réception de signal faible n'est comparée avec lui

# text
# c1: gnss-ssv
# c2: [navigation]
seg-77cef183420e = <b>MODELLED</b> Le mode <c2/> du type de scénario <c1/> : un filtre de Kalman étendu à neuf états (position, vitesse, biais et dérive de l'horloge du récepteur, un facteur d'échelle de pression de radiation sol. Référence indépendante (InternalConsistency) : vérité simulée par rapport à l'estimation propre du filtre (l'erreur d'estimation quadratique normalisée moyenne d'un filtre cohérent vaut environ { "3" } pour la position) et déterminisme pour une graine fixe. Aucune donnée GNSS en vol ou enregistrée en haute orbite n'est comparée ; le Soleil et la Lune sont des substituts circulaires de faible précision

# text
# c1: gnss-ssv
# c2: [formation]
seg-429e154cd691 = <b>MODELLED</b> Le mode <c2/> du type de scénario <c1/> : un chef et des adjoints exécutent chacun le filtre absolu ; la position de l'adjoint par rapport au chef est estimée en soustrayant. Référence indépendante (InternalConsistency) : la même vérité simulée que pour le filtre absolu : l'erreur du filtre relatif par rapport à l'état relatif réel, et le contrôle qu'il fait au moins aussi bien que la soustraction de deux points fixes absolus indépendants. Aucune donnée de formation en vol n'est comparée

# text
# c1: label
seg-1dd1beb01075 = MODELLED : un balayage géométrique et de bilan de liaison. Le diagramme du livret est un lobe principal à puissance constante, le diagramme paramétrique un substitut représentatif, et le milieu du rayon rasant le limbe un modèle simple déclaré ; rien ici n'est une mesure d'un signal dans l'espace. Les chiffres de disponibilité et d'interruption suivent la méthode du livret du volume de service spatial de l'ICG (UN ST/SPACE/75) et sont vérifiés par rapport à ses tableaux dans xval/gnss-ssv/. (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-e9c2dedbc971 = Disponibilité du GNSS et force de la liaison MODELLED dans le volume de service spatial et au-delà : pour un utilisateur sur une sphère (la coquille globale du livret de l'ICG) ou sur une trajectoire képlérienne (de l'orbite basse au transfert lunaire), il compte, par constellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) et pour toutes ensemble, les signaux utilisables au-dessus d'un seuil de C/N0 - disponibilité d'au moins un et de quatre signaux, durée maximale d'interruption, C/N0 reçu, (catalogue des types de scénario (<c1/>))

# text
seg-3add0e744c54 = MODELLED : le diagramme est représentatif, et non mesuré ; le milieu est un modèle simple déclaré (docs/SSV.md). (commentaire du fichier de scénario, ligne { "14" })

# text
seg-6b4655dd5270 = La disponibilité des signaux GNSS dans le volume de service spatial et au-delà, comparée au livret SSV de l'ICG, est MODELLED, et non validée : une sous-affirmation est vérifiée en externe, mais la capacité entière compose des éléments modélisés, de sorte que la capacité reste modélisée. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
# c1: gnss-ssv
seg-a9e1798308df = Les effets de l'ionosphère, de la plasmasphère et de l'atmosphère sur les rayons rasant le limbe pour les signaux GNSS en incidence rasante, ainsi que la conception du récepteur à signal faible, dans le type de scénario <c1/>, sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique / en forme fermée — ils détectent les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-132be2813c10 = Le filtre de navigation GNSS embarqué pour les engins spatiaux en haute orbite et en transfert lunaire est MODELLED, et non validé : vérifié par rapport à sa propre identité analytique / en forme fermée — il détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-f9405de9adb8 = La navigation relative par GNSS d'une formation de plusieurs engins spatiaux sur une orbite très elliptique est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-4881f925ea7f = Page de famille : <a1>Navigation des utilisateurs spatiaux</a1>

# text
seg-4b72df59b3f9 = Page thématique : <a1>SSV.md</a1>

# text
seg-c9ac9a99bcbb = <s1>Précédent</s1>gnss-sim

# text
seg-9df48482a140 = <s1>Suivant</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> La phase <c1/> : l'état moyen par le propagateur de Cowell du moteur (masse ponctuelle terrestre et J2, le Soleil et la Lune comme corps tiers, la Lune issue du noyau DE440 du fil là où il couvre le segment et le Soleil issu de la sér

seg-6a26b9ab59fe = Page thématique : <a1>MISSION-THREAD.md</a1>
