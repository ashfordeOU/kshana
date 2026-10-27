# docs--kind-acm-link: translations (fr)

# text
# c1: docs/kinds/by-kind/acm-link.md
seg-a686bcdc6cc9 = Source : <c1/>

# text
# c1: acm-link
seg-a53e57719a74 = <c1/> (type de scénario)

# text
seg-99ef7c1d552c = Type de scénario du moteur v{ $version }, famille <a1>Analyse de mission, liaisons et opérations spatiales</a1>. À titre consultatif : résultat d'analyse d'un outil de recherche et d'ingénierie, et non un équipement de navigation homologué ni un service de sauvegarde de la vie humaine. Chaque étiquette ici est celle du moteur ou de la matrice de vérification ; un type de scénario est MODELLED sauf si la matrice dit le contraire (comment une étiquette s'acquiert : la section Evidence du README).

# text
seg-cb9447893c7f = Un satellite au-dessus d'une station : la distance oblique, l'élévation et le Es/N0 de chaque passage le long du passage, le MODCOD DVB-S2 choisi à chaque pas (seuils du Tableau { "13" } de l'ETSI EN { "302" } 307-1 plus une marge d'implémentation) et le volume de données que l'ACM transfère par rapport à la référence de base à codage constant qui boucle au masque. MODELLED.

# text
# c1: scenarios/acm-link.toml
seg-1ab30ff9616a = Une exécution de <c1/> se résume ainsi : acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellite
# c8: station
seg-54e2159e532d = Champs facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/acm-link.toml
seg-c7d1b4b1f247 = L'exemple <c1/> définit, entre autres :

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-b77b8420b4f5 = Mbit

# text
seg-37d29d8303fe = km

# text
seg-eeaa777e4301 = 8PSK 3/4

# text
seg-d62795b9fdc0 = Étiquette du résultat (celle du moteur) : MODELLED — codage et modulation adaptatifs DVB-S2 sur les passages d'un satellite à une station : Es/N0 par ciel dégagé le long de chaque passage apparent, le MODCOD le plus efficace franchissant son seuil du Tableau { "13" } de l'ETSI EN { "302" } 307-1 plus une marge, par rapport au MODCOD à codage constant qui boucle au masque ; pas de pluie f

# attr:alt
seg-046f69293874 = Le graphique que le moteur écrit pour scenarios/acm-link.toml, type de scénario acm-link

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (PIRE, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann, débit de symboles), le MODCOD DVB-S2 le plus efficace qui franchit son seuil de l'ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> Passages de visibilité (AOS, TCA, LOS, élévation apparente maximale, durée) d'un ensemble d'éléments SGP4 au-dessus d'une station WGS-84 sur le chemin d'orbite terrestre validé (IAU { "2006" }. Référence indépendante (ExternalDataset) : Orekit { "13.1.8" } (CS GROUP, Apache-2.0) avec Hipparchus { "4.0.3" } : TLEPropagator sur les mêmes ensembles d'éléments dans un TEME qu'Orekit construit selon la définition indiquée (sa rotation TOD IERS { "2010" } par GAST - GMST), ElevationDetector et ElevationExtremumDetector avec et sans ITURP834AtmosphericRefraction, et AngularAzEl avec AngularRadioRefractionModifier pour le cas du temps de lumière, franchissements et maximum résolus par Hipparchus ; { "60" } cas (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 de liaison descendante le long de chaque passage d'un satellite au-dessus d'une station (PIRE, perte en espace libre, perte atmosphérique en loi de cosécante, autres pertes, G/T, constante de Boltzmann,. Référence indépendante (InternalConsistency) : Cohérence interne : l'efficacité spectrale calculée sous forme fermée à partir du K_bch du Tableau 5a et des longueurs de trame concorde avec les efficacités que le Tableau { "13" } imprime (un contrôle de transcription du tableau de seuils) ; les éléments du bilan de liaison concordent avec leurs formes fermées ; la sélection est monotone en Es/N0 et respecte la marge ; l'ACM transfère au moins le volume à codage constant. La géométrie des passages provient du VALIDATED distinct a

# text
# c1: label
seg-02e9f2e87410 = MODELLED — codage et modulation adaptatifs DVB-S2 sur les passages d'un satellite à une station : Es/N0 par ciel dégagé le long de chaque passage apparent, le MODCOD le plus efficace franchissant son seuil du Tableau { "13" } de l'ETSI EN { "302" } 307-1 plus une marge, par rapport au MODCOD à codage constant qui boucle au masque ; pas d'évanouissement par la pluie ni de perte de pointage le long du passage (résultat <c1/>)

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catalogue des types de scénario (<c1/>))

# text
seg-a2cdc7dff1e3 = Chaque nombre ci-dessous est ILLUSTRATIVE : ni orbite, ni station, ni bilan de liaison d'aucun opérateur. MODELLED. (commentaire du fichier de scénario, ligne { "8" })

# text
seg-7f8667e8d8fe = Le codage et la modulation adaptatifs DVB-S2 le long d'un passage de liaison descendante LEO sont MODELLED, et non validés : vérifiés par rapport à leur propre identité analytique en forme fermée — détecte les erreurs de transcription et de coefficients, mais n'est pas une référence indépendante externe. (matrice de vérification (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Page de famille : <a1>Analyse de mission, liaisons et opérations spatiales</a1>

# text
seg-72fd0321e4af = Page thématique : <a1>CONTACT-SCHEDULING.md</a1>

# text
seg-1f67ae89028b = <s1>Suivant</s1>aocs
