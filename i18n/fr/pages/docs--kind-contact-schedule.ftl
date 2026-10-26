# docs--kind-contact-schedule: translations (fr)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (PIRE, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann, débit de symboles), le MODCOD DVB-S2 le plus efficace qui franchit son seuil de l'ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Passages de visibilité (AOS, TCA, LOS, élévation apparente maximale, durée) d'un ensemble d'éléments SGP4 au-dessus d'une station WGS-84 sur le chemin d'orbite terrestre validé (IAU { "2006" }. Référence indépendante (ExternalDataset) : Orekit { "13.1.8" } (CS GROUP, Apache-2.0) avec Hipparchus { "4.0.3" } : TLEPropagator sur les mêmes ensembles d'éléments dans un TEME qu'Orekit construit selon la définition indiquée (sa rotation TOD IERS { "2010" } par GAST - GMST), ElevationDetector et ElevationExtremumDetector avec et sans ITURP834AtmosphericRefraction, et AngularAzEl avec AngularRadioRefractionModifier pour le cas du temps de lumière, franchissements et maximum résolus par Hipparchus ; { "60" } cas (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (PIRE, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann,. Référence indépendante (InternalConsistency) : Cohérence interne : l'efficacité spectrale calculée sous forme fermée à partir du K_bch du Tableau 5a et des longueurs de trame concorde avec les efficacités que le Tableau { "13" } imprime (un contrôle de transcription du tableau de seuils) ; les éléments du bilan de liaison concordent avec leurs formes fermées ; la sélection est monotone en Es/N0 et respecte la marge ; l'ACM transfère au moins le volume à codage constant. La géométrie des passages provient du VALIDATED distinct a

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-7f8667e8d8fe = Le codage et la modulation adaptatifs DVB-S2 le long d'un passage de liaison descendante LEO sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-72fd0321e4af = Page thématique : <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: docs/kinds/by-kind/contact-schedule.md
seg-b79fcddea1d6 = Source : <c1/>

# text
# c1: contact-schedule
seg-040d160b3fdd = <c1/> (type de scénario)

# text
seg-be4e928a5865 = Planification des contacts sol pour plusieurs satellites au-dessus de plusieurs stations : fenêtres d'accès apparentes (SGP4, référentiel terrestre IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), volume de données ACM DVB-S2 de chaque passage (seuils du tableau { "13" } de ETSI EN { "302" } 307-1) et un planning sans conflit (un satellite par antenne avec un temps de retournement, une station par satellite, livraison pondérée par priorité plafonnée à chaque arriéré) obtenu par un algorithme glouton à valeur marginale, une référence de base du premier arrivé et un branch and bound exact sur de petits ensembles, avec l'écart d'optimalité du glouton. MODELLED.

# text
# c1: scenarios/contact-schedule.toml
seg-7a3fad06a9fc = Une exécution de <c1/> se résume ainsi : contact-schedule: { "3" } satellites x { "3" } stations over { "12" } h -> { "31" } candidate contacts, { "22" } scheduled; { "797266" } of { "860000" } Mbit delivered (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-a03d83f5866a = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/contact-schedule.toml
seg-5ba0968796ac = L'exemple <c1/> définit, entre autres :

# text
seg-cade59b5a371 = Étiquette du résultat (celle du moteur) : MODELLED — plan de contacts multisatellite et multistation : fenêtres d'accès apparentes (SGP4, IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), volume de données ACM DVB-S2 par passage à partir d'un bilan de liaison par ciel dégagé (seuils du tableau { "13" } de ETSI EN { "302" } 307-1), et résolution des conflits (un satellite par antenne avec tu

# attr:alt
seg-e26b549579e2 = Le graphique que le moteur écrit pour scenarios/contact-schedule.toml, type de scénario contact-schedule

# text
seg-036b708ed2b9 = <b>MODELLED</b> Contacts candidats issus de chaque passage satellite-station avec son volume de données ACM ; conflits lorsqu'une antenne devrait servir deux satellites pendant son temps de retournement ou qu'un satellite devrait émettre vers deux stations à la fois ; une livraison pondérée par priorité

# text
seg-60431931082a = <b>MODELLED</b> Contacts candidats issus de chaque passage satellite-station avec son volume de données ACM ; conflits lorsqu'une antenne devrait servir deux satellites pendant son temps de retournement ou. Référence indépendante (InternalConsistency) : cohérence interne : le branch and bound exact concorde avec l'énumération par force brute sur de petits ensembles aléatoires, chaque plan est vérifié comme réalisable au regard des règles de conflit, et le glouton ne bat jamais l'optimum exact. CE QUI NE L'EST PAS : aucun planificateur externe ni plan opérationnel n'a été comparé ; les contacts sont pris en entier (sans découpage), l'arriéré est fixé au début de la fenêtre, le temps de pointage au-delà du temps de retournement fixe et les s embarqués

# text
# c1: label
seg-9941b9f6d4a8 = MODELLED — plan de contacts multisatellite et multistation : fenêtres d'accès apparentes (SGP4, IAU 2006/2000A, réfraction ITU-R P.834, temps de lumière), volume de données ACM DVB-S2 par passage à partir d'un bilan de liaison par ciel dégagé (seuils du tableau { "13" } de ETSI EN { "302" } 307-1), et résolution des conflits (un satellite par antenne avec temps de retournement, une station par satellite) par un algorithme glouton à valeur marginale vérifié par rapport à un branch and bound exact ; pas d'affaiblissement par la pluie, (résultat <c1/>)

# text
seg-f8ef88bc82b5 = Chaque nombre ci-dessous est ILLUSTRATIF : ni orbites, ni stations, ni bilan de liaison d'un opérateur. MODELLED : le planificateur est vérifié par rapport à son propre solveur exact, et non à un outil externe. (commentaire du fichier de scénario, lignes { "11" } à { "12" })

# text
seg-fe2b4799b397 = La planification des contacts sol multisatellite et multistation avec résolution des conflits est MODELLED, et non validée : vérifiée par rapport à sa propre identité analytique / en forme fermée — elle détecte les erreurs de transcription et de coefficients, mais ce n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-be14d99cb86d = <s1>Précédent</s1>constellation-design

# text
seg-3784be57d6df = <s1>Suivant</s1>earth-gnss-lunar
