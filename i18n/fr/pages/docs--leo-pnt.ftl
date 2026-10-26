# docs--leo-pnt: translations (fr)

# text
seg-46c7e6f003dd = Système

# text
seg-cae10fb9bff8 = Scénario

# text
seg-f1f903f1b9ff = Résilience

# text
seg-1759a8cce7d6 = Types

# text
seg-71aee5eb55c5 = UHF

# text
seg-f63dd3d7aad4 = Source

# text
seg-587beeccaa11 = Préréglage

# text
seg-e305279d5b11 = Contenu

# text
seg-b03d56f501c3 = Type

# text
seg-6752521002b2 = Partie

# text
seg-cf6ae60eea4f = Auxiliaire

# text
seg-0bdbdd2c923b = Synchronisation

# text
seg-b09dc4b322d3 = Éphéméride

# text
seg-3a835a49b43f = Autres services

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
seg-c5ce76c91ff7 = Étiquette

# text
seg-c1020ac47091 = Ce que calcule une exécution

# text
seg-f708914fed48 = Bandes

# text
seg-486f17197d4d = REPRESENTATIVE, pour les systèmes en bande C dont les paramètres ne sont pas publics (par exemple TrustPoint)

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (facultatif)

# text
seg-fde146239f5d = Résultat d'une exécution

# text
seg-a3f63252bd1b = Ce qu'il transporte

# text
# c1: docs/LEO-PNT.md
seg-7d2c6fbf95b7 = Source : <c1/>

# text
seg-6f1f29597f4b = LEO-PNT dans Kshana

# text
seg-2a3a1f19005a = LEO-PNT désigne le positionnement, la navigation et la synchronisation temporelle (PNT) à partir de satellites en orbite terrestre basse (LEO), en complément ou à la place des systèmes mondiaux de navigation par satellite (GNSS) en orbite terrestre moyenne (MEO) tels que le Global Positioning System (GPS) et Galileo. Cette page relie chaque type de scénario et chaque scénario LEO-PNT du moteur : ce que chacun calcule, les bandes et les préréglages de signal et l'origine de leurs nombres, ce que porte le message de navigation, ce qui est VALIDATED et ce qui est MODELLED, et comment exécuter chaque scénario. Les pages des types de scénario vont plus loin :

# text
seg-8e3556046e63 = Page

# text
# c1: leo-signal
# c2: spectrum
seg-cdb06a47be0a = <c1/> (conceptions de signaux) et les panneaux multibandes <c2/>

# text
# c1: leo-pass
seg-09894e033033 = <c1/> (géométrie du passage et bilan de liaison par bande, positions à faible énergie, sondage de l'ionosphère, moniteurs de leurrage)

# text
# c1: leo-navmsg
seg-f19c0bfe2996 = <c1/> (le message diffusé : ajusteur, algorithme utilisateur, formats binaire et texte)

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (positionnement fusionné, positionnement précis par point, positionnement par réseau 5G non terrestre (NTN), synchronisation temporelle, couverture polaire)

# text
# c1: spectrum
seg-29013ad5656c = <c1/> (cascades de brouillage et rapport brouilleur sur signal (J/S) par bande)

# text
# c1: campaign
seg-d291250b5d01 = <c1/> (chaînes, balayages, Monte-Carlo et compositions de types de scénario quelconques)

# text
seg-8d2de8f77619 = D'abord indépendant du système

# text
seg-f3750a8f2863 = Le moteur est un simulateur LEO-PNT générique. N'importe quelle constellation (un motif de Walker, des éléments orbitaux explicites, un jeu d'éléments à deux lignes (TLE) passé dans le propagateur Simplified General Perturbations { "4" } (SGP4), ou un passage unique conçu), n'importe quelle conception de signal (n'importe quelle bande, n'importe quel mélange de composantes à modulation par déplacement de phase binaire (BPSK), à porteuse à décalage binaire (BOC) et à accès multiple par répartition en fréquence (FDMA)), n'importe quel modèle de message de navigation. Les systèmes nommés sont des préréglages facultatifs : des fichiers de données, chacun avec sa source, qui ne complètent que ce qu'un scénario laisse de côté. Chaque fonctionnalité, test, référence indépendante et scénario fourni s'exécute sans aucune donnée Celeste.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: scenarios/*celeste-iod*.toml
# c4: tests/workshop_preset_isolation.rs
seg-4d3bd0301e59 = Le préréglage Celeste IOD (démonstration en orbite) est l'un de ces préréglages facultatifs. Ses paramètres de signal ont été présentés à l'atelier LEO-PNT du NAVISP de l'ESA (programme d'innovation et de soutien à la navigation de l'Agence spatiale européenne), { "2026" }, et n'ont pas encore de source publique. Chaque nombre issu de l'atelier figure dans un seul fichier du moteur, <a1><c1/></a1>, que <c2/> ne compile que s'il existe, et dans les scénarios réservés au dépôt <c3/>. Supprimer ce fichier et ces scénarios retire le préréglage sans modification de source ; tous les autres tests, références indépendantes et scénarios s'exécutent sans lui (<c4/> contrôle quels fichiers peuvent le nommer). Cette page n'en donne aucun nombre.

# text
seg-5b348102cb63 = Les types de scénario et leur enchaînement

# text
seg-120b9be05fc3 = densité spectrale de puissance (PSD) à bande limitée d'une conception de signal, puissance dans la bande, largeur de bande quadratique moyenne (de Gabor), gigue de suivi de code en fonction de la densité porteuse sur bruit (C/N0), recherche d'acquisition et coefficients de séparation spectrale (SSC) par rapport aux signaux GNSS ; un arbitrage entre bandes (très haute fréquence (UHF), L, S, C)

# text
seg-d9febf3c74c8 = formes closes VALIDATED, conceptions et arbitrage MODELLED

# text
# c1: spectrum
seg-d0d8d1edd9ee = <c1/> (panneaux multibandes)

# text
seg-dc3ceb315e9a = cascades par bande avec des brouilleurs par bande (onde continue (CW), chirp, bande étroite, large bande, adapté), J/S et C/N0 effectif de chaque signal sur une chronologie

# text
seg-126a14392994 = spectres VALIDATED, brouilleurs MODELLED

# text
seg-e63f73ab5bca = géométrie du passage, Doppler et taux de Doppler, perte en espace libre, antennes du satellite et de l'utilisateur, pertes gazeuse, de pluie, de scintillation et de pénétration dans les bâtiments de l'UIT-R (Union internationale des télécommunications, secteur des radiocommunications), C/N0 par bande et par époque à côté des porteuses GNSS MEO ; ionosphère par bande et paires sans ionosphère ; positions à faible énergie ; sondage de l'ionosphère ; moniteurs de leurrage

# text
seg-a9fd4162604f = composantes VALIDATED, passage MODELLED

# text
seg-91304e663174 = le message d'éphéméride et d'horloge diffusé : ajusteur, erreur de distance du signal dans l'espace (SISRE) en fonction de l'intervalle d'ajustement et de la période de mise à jour, continuité de la mise à jour en milieu de passage, algorithme utilisateur, trame binaire avec un contrôle de redondance cyclique sur 24 bits (CRC-24Q), exports dans le style de RINEX { "4" } (Receiver Independent Exchange Format) et sous forme de valeurs séparées par des virgules (CSV)

# text
seg-cf93a9ba065c = algorithme utilisateur, pondérations et CRC VALIDATED, ajustements MODELLED

# text
seg-3084696ad387 = positionnement Doppler, positions conjointes GNSS + LEO par pseudodistances avec biais inter-systèmes, géométrie polaire et arctique, transfert de temps vers le temps universel coordonné (UTC), avec une trace facultative de l'erreur de temps à chaque époque

# text
seg-79117194e50b = Doppler maximal VALIDATED, le reste MODELLED

# text
seg-1de31fd3cf86 = convergence du positionnement précis par point (PPP) avec le GNSS seul et avec des couches LEO

# text
seg-525733c10d9b = précision du positionnement 5G NTN en fonction de la largeur de bande de la liaison descendante (borne de Cramér-Rao)

# text
seg-cb8eee06e664 = un système de bout en bout : conception de signal, passage, message, position fusionnée et PPP, chaque transmission étant listée

# text
seg-d28e18170f82 = n'importe lequel des éléments ci-dessus enchaîné sur une seule chronologie, balayé, exécuté comme un ensemble Monte-Carlo ou composé sous des conditions partagées

# text
seg-5479654fabfd = La chaîne transmet des valeurs dans le code (voir <a1>Chaîne LEO-PNT de bout en bout</a1> ci-dessous) : la conception de signal fixe la répartition de la PIRE (puissance isotrope rayonnée équivalente) de la bande du passage et la cadence de chips suivie ; le passage donne le C/N0 suivi et la gigue de code ; le SISRE du message de navigation et le C/N0 du passage pondèrent les mesures LEO de la position fusionnée.

# text
# c1: data/leo-signals/generic-bands.toml
# c2: generic-c-band.toml
seg-a0331a21413c = Les conceptions génériques utilisent des centres de bande publics ; chacune est REPRESENTATIVE, et non le signal d'un système (<c1/>, <c2/>).

# text
seg-a86ce24d81de = Bande

# text
seg-daf61ebdca17 = Attribution

# text
seg-ba6fbebc2a98 = Conception générique

# text
seg-3332ae549a90 = Centre

# text
seg-c7be6f6797a8 = Largeur de bande d'émission

# text
seg-74f4e80c65cb = Composantes

# text
seg-e95de3591152 = Retard ionosphérique du premier ordre par rapport à L

# attr:title
seg-e769f0411e64 = Retiré par son éditeur ; aucune copie archivée

# text
seg-8b04e51a023e = pas une attribution de radionavigation (représentative) ; porteuse issue de l'<s1>étude publique openRECEIVER</s1> (page retirée depuis ; voir <a1>LEO-SIGNAL.md</a1>)

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-8a3026904912 = { "10" } MHz

# text
seg-e1500e8695b9 = BPSK({ "5" }) pilote et données

# text
seg-ac33d89291ca = service de radionavigation par satellite (RNSS), le centre de Galileo E5

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-54e10c07ace3 = BPSK({ "10" }) pilote et données

# text
seg-5e28b8377751 = service de radiodétermination par satellite (RDSS), la porteuse S de NavIC (Navigation with Indian Constellation)

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-a573432714b8 = { "16.5" } MHz

# text
seg-6fe14d537f33 = RNSS, centre de l'attribution de { "5010" }–{ "5030" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-0b50907d3165 = { "20" } MHz

# text
seg-c43105d1c770 = C étendue

# text
seg-c05714081a0e = en dehors de l'attribution RNSS (représentative)

# text
seg-638ab0837b29 = { "5100" } MHz

# text
seg-4d3857271629 = { "120" } MHz

# text
seg-18bc5451fc46 = BPSK({ "50" }) pilote et données

# text
seg-3714e1c00ab8 = S (service mobile par satellite, MSS)

# text
seg-cc26934bac14 = liaison descendante MSS, bande n256 du 3GPP (Third Generation Partnership Project)

# text
# c1: ntn-positioning
seg-12ca7304ece7 = utilisée par <c1/>

# text
seg-896b6ee57728 = { "2172.5" } MHz

# text
seg-e6e1d955489a = de { "0.18" } à { "20" } MHz

# text
seg-50e44c7042c9 = signaux de positionnement 5G New Radio

# text
# c1: (f_L/f)²
# c2: f_L
# c3: 20·log10(f/f_L)
seg-e75e48eeeca1 = BPSK(n) est une modulation par déplacement de phase binaire à n × { "1.023" } Mchip/s. Le rapport de retard est <c1/> avec <c2/> = { "1191.795" } MHz. La perte en espace libre augmente de <c3/> à la même distance (−{ "8.2" } dB en UHF, +{ "6.4" } dB en S, +{ "12.5" } dB en C).

# text
seg-02f71b44edf5 = Préréglages de signaux et de systèmes

# text
seg-c60ce9c32b57 = REPRESENTATIVE, centres de bande tirés du Règlement des radiocommunications de l'UIT

# text
# c1: generic-bands
# c2: generic-leo
# c3: leo-pass
seg-58fae66f7c12 = <c1/> (conceptions de signaux) : la table des bandes ci-dessus ; <c2/> (valeur par défaut de <c3/>) : UHF à { "450" } MHz, L, S et C aux centres ci-dessus, { "0" } dBW de PIRE par bande, une couche Walker 240/12/1 héliosynchrone à { "550" } km

# text
seg-5d918965c00c = BPSK({ "10" }) à { "5020" } MHz, faisceau isoflux

# text
seg-dddb031a7e2e = PUBLIC : Leclère, Marathe et Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

# text
seg-67fc4039084d = X1 à { "1593.3225" } MHz ({ "1.023" } Mchip/s) et X5 à { "1190.51625" } MHz ({ "10.23" } Mchip/s), les puissances reçues minimale et maximale publiées, { "258" } satellites à environ { "1080" } km (couches à { "53" } et { "97" } deg)

# text
seg-f17f98d1ae0b = PUBLIC : <a1>note de la Resilient Navigation and Timing Foundation (RNTF)</a1>

# text
# c1: leo-pass
seg-c6694cdbb02b = salves dans { "1616" }–{ "1626" } MHz, Doppler jusqu'à ±{ "36" } kHz, { "66" } satellites à { "780" } km ({ "781" } km dans le préréglage <c1/>), puissance reçue « { "300" } à { "2400" } fois GPS »

# text
# c1: starlink-soo
# c2: starlink-soop
# c3: starlink-sop
seg-704ec002a889 = <c1/> / <c2/> / <c3/> (types de scénario de signal, de passage et de positionnement)

# text
seg-a4a3a7c7bc22 = chiffres de signal PUBLIC : Kozhaya, Saroufim et Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1> ; orbite REPRESENTATIVE

# text
seg-49985bf11216 = une balise en bande Ku de { "240" } MHz utilisée pour le Doppler seul, C/N0 d'environ { "57" } dB-Hz

# text
seg-84cb50b019e0 = structure de signal PUBLIC : <a1>PMC10301026</a1> ; orbite et puissance REPRESENTATIVE

# text
seg-1c50faed9f1e = BPSK à { "2.046" } Mchip/s près de L1 et L5

# text
# c1: atomic-zero-clock
# c2: atomic
seg-c72e9b87f116 = <c1/> (<c2/> dans le type de scénario de message)

# text
seg-3dd4136094c0 = PUBLIC : <a1>InsideGNSS, charge utile ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

# text
seg-4f0cff24b4fd = une éphéméride polynomiale du 6e ordre sans terme d'horloge (l'horloge est pilotée sur le temps GNSS)

# text
seg-9d1e7aebcd84 = WORKSHOP : présenté à l'atelier LEO-PNT du NAVISP de l'ESA, { "2026" }

# text
seg-28c2e7ae6065 = la configuration de signal n° 1 de la démonstration en orbite et la disposition du message, dans l'unique fichier pouvant être retiré

# text
seg-9f0d16f43993 = Chaque préréglage marque ses nombres PUBLIC (avec une URL), REPRESENTATIVE (un choix de conception documenté, jamais une affirmation sur un système réel) ou WORKSHOP, et le résultat de chaque exécution qui en utilise un indique lequel.

# text
seg-556fe9c6c3b1 = Le message de navigation

# text
seg-a220662ed8de = Un message de navigation LEO (<a1>LEO-NAVMSG.md</a1>) comporte quatre parties, la structure que partagent le Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) et les propositions LEO publiées :

# text
seg-5bda276f6e82 = l'ensemble képlérien à 16 paramètres de l'ICD Galileo (racine carrée du demi-grand axe, excentricité, inclinaison et sa variation, ascension droite du nœud et sa variation, argument du périgée, anomalie moyenne, correction du moyen mouvement, six corrections harmoniques, temps de référence), plus des polynômes de correction along-track, cross-track et radial ; ou le modèle à 22 paramètres de Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>) ; ou le polynôme à horloge nulle d'ATOMIC

# text
seg-8a7dabfece01 = numéro de semaine et temps de la semaine (TOW), et un polynôme d'horloge du second ordre (af0, af1, af2 autour de toc)

# text
seg-24eaf4ae7eb3 = identifiant du véhicule spatial (SVID), numéro de version des données (IOD), santé du signal

# text
seg-e7d819b7a724 = corrections ionosphériques pour les utilisateurs monofréquence (un jeu de style Klobuchar et NeQuick-G ai0–ai2) et décalage entre le temps système et l'UTC (A0, A1, secondes intercalaires et leur calendrier)

# text
seg-200e59d9279c = La trame binaire est l'encodage documenté propre à Kshana, modelé sur ces composantes, et non la disposition binaire d'un système. RINEX { "4.02" } ne définit aucun enregistrement de navigation LEO ; l'export de type RINEX est donc une extension de Kshana documentée (travaux antérieurs : <a1>arXiv { "2401.17767" }</a1>).

# text
# c1: campaign
# c2: spectrum
seg-aa18ab84599b = balayage <c1/> de <c2/>

# text
seg-70dc120ea19e = un brouillage à large bande de { "50" } MHz à { "1185" } MHz balayé de −{ "140" } à −{ "80" } dBW : GPS L5 est perdu à −{ "105" } dBW, Galileo E5a et le signal LEO en bande L à −{ "100" } dBW ; les signaux LEO en bande UHF, S et C conservent { "49.4" }, { "49.2" } et { "47.4" } dB-Hz à toute puissance

# text
seg-61f05d7e3a18 = un brouillage à large bande de { "40" } MHz à { "1185" } MHz qui monte de { "5" } dB toutes les { "10" } s à partir de −{ "125" } dBW : GPS L5 perdu à −{ "105" } dBW, Galileo E5a à −{ "100" } dBW, Xona X5 (à son minimum publié, −{ "144.9" } dBW) à −{ "95" } dBW ; un signal LEO générique à −{ "135" } dBW est encore suivi à −{ "90" } dBW ({ "28.9" } dB-Hz). La puissance reçue achète de la marge J/S dB pour dB

# text
seg-6a3a46be60a5 = un saut de position de { "30" } m sur un site relevé : le test Doppler GNSS seul ne le détecte jamais ; le test sur tous les canaux le détecte, { "105" } s après le déclenchement (voir <a1>LEO-PASS.md</a1>)

# text
# c1: campaign
# c2: leo-pass
seg-d0c4683d7c93 = composition <c1/> de <c2/>

# text
seg-bf0ec52f63ea = quatre leurreurs, les deux moniteurs : un leurreur en bande L seule et un leurreur sur toutes les bandes sans ionosphère sont pris par le moniteur inter-bandes dès le déclenchement ({ "300" } s) et par le moniteur Doppler à { "420" } s et { "395" } s ; un leurreur sur toutes les bandes qui tient compte de l'ionosphère, seulement par le moniteur Doppler ({ "395" } s) ; une poussée de { "30" } m sur le GNSS seul, par aucun des deux

# text
# c1: campaign
# c2: spectrum
# c3: integrity
seg-17bcc4ead2ee = chaîne <c1/> (<c2/>, <c3/>)

# text
seg-d9b6e6fe6807 = GNSS brouillé pendant { "15" } minutes (code d'acquisition grossière (C/A) de GPS L1 à environ { "10" } dB-Hz, E5a à { "17.4" } dB-Hz pour un plancher de { "25" } dB-Hz) tandis que les signaux LEO en bandes S et C tiennent { "49.2" } et { "47.4" } dB-Hz ; la surveillance autonome de l'intégrité par le récepteur (RAIM) sur la seule couche LEO forme un niveau de protection à chaque époque, sous la limite d'alerte verticale de { "50" } m à { "28" } des { "30" } instants de la grille, l'alarme étant levée aux deux autres ; phases nominale et de récupération de { "5.4" } à { "15.6" } m

# text
# c1: multi-band-jamming-waterfall
seg-42efdd12fc54 = Les moniteurs de leurrage, leurs statistiques et leurs limites sont sur <a1>LEO-PASS.md</a1>. La cascade multibande avec un brouilleur différent par bande est <c1/> (<a2>LEO-SIGNAL.md</a2>).

# text
seg-d9e58c4aa8d5 = Un scénario par domaine d'expérimentation

# text
seg-1ab626f27e9d = Les huit domaines d'expérimentation de l'appel Celeste IOD à l'expérimentation par des tiers (Open Space Innovation Platform de l'ESA, OSIP) sont des questions LEO-PNT génériques ; chacun a un scénario indépendant du système :

# text
seg-afc60ca3c9da = Domaine

# text
seg-8a8f40ce3e40 = Positionnement de haute précision (PPP)

# text
# c1: campaign
# c2: leo-ppp
seg-b5eb3448dbb1 = balayage <c1/> de <c2/>

# text
seg-5692301bc7cf = une couche de 192 satellites à { "500" }, { "1000" } et { "1500" } km réduit la convergence du PPP multi-GNSS à ambiguïtés flottantes à Munich de { "13.0" } min à { "3.25" }, { "3.25" } et { "3.5" } min (six réalisations, époques de { "30" } s)

# text
seg-3992215bc8c9 = Résilience PNT (L, S, C)

# text
seg-a2cc270b415c = voir Résilience

# text
seg-8a6381ff15ac = Compatibilité NTN 5G/6G

# text
# c1: campaign
# c2: ntn-positioning
seg-ae21ac79775f = balayage <c1/> de <c2/>

# text
seg-cb52e7eb3c36 = largeur de bande de référence de positionnement de { "180" } kHz à { "20" } MHz : sigma de distance au zénith de { "6.5" } m à { "5.8" } cm, erreur 3D par temps d'arrivée de { "30.1" } m à { "2.1" } m, plafonnée par l'erreur de synchronisation du réseau de { "1" } m

# text
seg-45985b521980 = PNT à faible énergie pour l'Internet des objets (IoT) et le mobile

# text
# c1: campaign
# c2: leo-pass
# c3: [iot]
seg-9afaaed509ef = balayage <c1/> de <c2/> <c3/>

# text
seg-3bb8cc776a28 = PIRE UHF de −{ "35" } à +{ "5" } dBW : en dessous d'un C/N0 médian d'environ { "35" } dB-Hz, l'énergie par position à chaud passe de { "18" } mJ à { "55" } J ; au-dessus, l'autonomie de la batterie à une position par heure est de { "8334" } jours, fixée par le courant de veille

# text
seg-4b0890bd9215 = Science LEO-PNT

# text
seg-a1ddeda103fa = contenu électronique total (TEC) oblique issu de chaque paire de bandes d'un passage à quatre bandes au-dessus de Tromsø : { "18.85" } unités TEC retrouvées par chaque paire, 1 sigma de { "0.017" } (UHF avec L) à { "2.9" } unités TEC (S avec C)

# text
seg-fc31db33e6fe = Services de données PNT supplémentaires

# text
# c1: campaign
# c2: leo-navmsg
seg-91db4e7b4d9c = composition <c1/> de <c2/>

# text
seg-aee8bb27a2fb = la trame de message de Kshana passe de { "146" } octets (éphéméride et horloge, { "1045" } bits) à { "154" } avec le jeu de Klobuchar, { "159" } avec NeQuick-G et { "171" } avec les paramètres UTC

# text
seg-bd6c76037986 = Navigation en intérieur (UHF)

# text
seg-0a274a3aeb86 = C/N0 maximal en intérieur dans un bâtiment traditionnel : UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz ; dans un bâtiment à efficacité thermique, UHF { "15.3" } dB-Hz et toutes les autres bandes plus bas

# text
seg-101de8218f35 = PNT fusionné MEO + LEO

# text
# c1: campaign
# c2: leo-pvt
seg-b4daa58a2fe7 = balayage <c1/> de <c2/>

# text
seg-903d8dcb96cc = Xona X5 fusionné avec GPS et Galileo au-dessus de Madrid : erreur 3D GNSS seul de { "1.06" } m en moyenne quadratique (RMS) ; fusionné { "0.08" } m avec un SISRE LEO de { "5" } cm, { "0.57" } m à { "0.5" } m et { "1.01" } m à { "5" } m

# text
seg-ebe7a27275cb = Un scénario par secteur d'utilisateurs finaux

# text
# c1: campaign
# c2: leo-pass
seg-7c21d067769a = Chaque secteur est une chaîne <c1/> sur une seule chronologie, donc elle s'anime, et chacun a un membre <c2/>, donc il exporte la géométrie (voir <a1>Exécution</a1>).

# text
seg-1d1135625500 = Secteur

# text
seg-f1a7e54ea7d0 = Véhicules autonomes

# text
seg-3610a5f7c352 = une voiture à Munich : route dégagée, erreur fusionnée moyenne de { "0.30" } m ; dans un canyon urbain à { "35" } deg, GPS et Galileo conservent { "8" } satellites et une erreur moyenne de { "5.8" } m, la couche LEO générique en ajoute { "4" } à { "5" } et la ramène à { "2.1" } m, ce qui reste au-dessus du seuil de { "1.5" } m au niveau de la voie pour environ la moitié des époques du canyon

# text
seg-6622d9c7366d = Ferroviaire et maritime

# text
# c1: maritime-strait-jamming
# c2: rail-tunnel-coast
seg-73ba745cb492 = le navire fourni <c1/> perd tous ses satellites GNSS ({ "12.1" } dB-Hz) tandis que son passage LEO en bandes S et C atteint { "44.2" } et { "38.1" } dB-Hz ; le train fourni <c2/> atteint { "2" } m d'erreur inertielle { "35.8" } s après son entrée dans le tunnel ; à ciel ouvert, son passage LEO donne de { "35" } à { "50" } dB-Hz en L

# text
seg-c87973b9139a = Infrastructures critiques

# text
seg-c16a4c99e132 = l'oscillateur de classe TCXO (oscillateur à quartz compensé en température) d'un serveur de temps de poste électrique, en marche libre pendant une journée sans GNSS, atteint { "29" } µs, dépassant la garde de { "1" } µs entre { "75" } et { "80" } minutes après la perte (sur la grille de 5 minutes) ; la même classe asservie sur Iridium reste entre −{ "40" } et +{ "11" } ns

# text
seg-1be8e11b2530 = Utilisateurs polaires et arctiques

# text
seg-660e450cb4ab = dilution de précision de position (PDOP) moyenne GPS + Galileo de { "1.38" }, { "1.57" } et { "1.62" } à Tromsø, au Svalbard et au pôle Nord ; avec Iridium { "1.29" }, { "1.34" } et { "1.26" }, à partir de { "3.0" }, { "5.5" } et { "6.8" } satellites Iridium en vue

# text
seg-22d99734acf1 = Réseaux sans fil 5G/6G

# text
# c1: telecom-timing
seg-abcc6337206f = l'oscillateur à quartz thermostaté (OCXO) d'une station de base en holdover franchit la limite réseau de { "1.1" } µs après { "8863" } s et la limite de l'application finale de { "1.5" } µs après { "10006" } s (l'analyse du type de scénario <c1/>) ; asservi sur Xona X5, son erreur de temps reste entre −{ "0.7" } et +{ "0.3" } ns toute la journée, avec un 1 sigma prédit de { "5" } ns, l'incertitude indiquée du décalage UTC diffusé

# text
seg-532d6814ab2d = Suivi d'actifs et IoT

# text
seg-b4d6d822e1d0 = la position UHF à chaud d'une étiquette de conteneur coûte { "18" } mJ à quai et en mer ({ "8334" } jours de batterie à une position par heure) et { "34" } mJ dans un entrepôt ({ "5770" } jours), où la bande L tombe à { "20" } à { "24" } dB-Hz

# text
seg-e54b0342fa79 = VALIDATED et MODELLED

# text
seg-dd808d1741f3 = Une ligne n'est VALIDATED que si un test reproduit une configuration publiée et fige le chiffre publié dans une tolérance indiquée ; tout le reste est MODELLED, avec sa justification (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

# text
seg-592a6cf625c5 = Lignes LEO-PNT VALIDATED :

# text
seg-344712930047 = puissance de signal à bande limitée en forme close et gigue de suivi de code early-late à des points de fonctionnement publiés (Betz et Kolodziejski { "2009" }), avec la largeur de bande de Gabor et les SSC recoupés ;

# text
seg-e93d5b5d3dda = le Doppler maximal d'un satellite de navigation LEO (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz), et l'enveloppe Doppler d'un utilisateur statique comparée au tableau { "1" } d'arXiv { "2509.19551" } ;

# text
seg-b02c1b42e509 = coefficients de pluie P.838-3 de l'UIT-R, affaiblissement par la pluie et scintillation troposphérique P.618-14, et perte de pénétration dans les bâtiments P.2109-2, comparés aux données de validation de la Commission d'études { "3" } de l'UIT-R ;

# text
seg-fc668542b66d = la mise à l'échelle du retard ionosphérique du premier ordre et la perte en espace libre (rapport de retard de groupe d'IS-GPS-200, forme de Friis) ;

# text
seg-59847c667c8b = les pondérations SISRE moyennes mondiales (Montenbruck et al. { "2018" }), l'algorithme utilisateur de l'ICD Galileo comparé à RTKLIB sur de véritables éphémérides diffusées, et le CRC-24Q comparé à sa valeur de contrôle du catalogue.

# text
seg-922761c46f8a = Lignes LEO-PNT MODELLED : chaque conception de signal et chaque arbitrage de bande, la cascade multibande, chaque passage et chaque bilan de liaison dans son ensemble, les préréglages, les positions à faible énergie, l'ajusteur et les formats du message, le positionnement Doppler et conjoint, la convergence du PPP, le positionnement NTN, le transfert de temps, la couverture polaire, la chaîne de bout en bout, les moniteurs de leurrage et le sondage de l'ionosphère, et chaque campagne (une campagne compose des types de scénario et n'ajoute aucune physique ; ses identités de composition sont testées, <a1>CAMPAIGNS.md</a1>). Aucun C/N0 LEO, aucune erreur de mesure de distance ni aucun chiffre de positionnement n'est comparé à une mesure d'un satellite quelconque.

# text
seg-3cc1d3f1c0f8 = Exécuter un scénario

# text
# c1: kshana example <name>
seg-00d5b60c0ebb = Chaque scénario ci-dessus est fourni : <c1/> l'affiche, et

# text
# c1: .result.json
# c2: .chart.svg
# c3: .report.html
# c4: .report.json
# c5: .animation.html
seg-e01ebe977e65 = écrit, à côté du fichier, le résultat (<c1/>), le graphique (<c2/>), le rapport avancé (<c3/> et <c4/>, avec une section qui intègre l'exécution animée et liste les exports), le lecteur interactif (<c5/>) et les exports. Ce qui s'applique dépend du type de scénario :

# text
# c1: leo-pass
# c2: spoof.series
# c3: spectrum
# c4: leo-pvt
# c5: leo-ppp
# c6: --animate
# c7: leo-resilience-multiband-diversity
# c8: leo-resilience-spoof-monitors
# c9: leo-focus-*
# c10: leo-focus-science-iono-sounding
# c11: --animate
seg-8a96eda978b4 = une exécution avec un axe temporel s'anime : époques de <c1/>, le <c2/> d'une exécution de leurrage, chronologies de <c3/>, époques conjointes et traces de synchronisation temporelle de <c4/>, courbes d'erreur de <c5/> et chaque chaîne de campagne. Un balayage ou une composition n'a pas d'axe temporel : <c6/> le refuse avec le code de sortie { "1" } et la commande n'écrit alors rien du tout ; exécutez donc les huit balayages et compositions ci-dessus (<c7/>, <c8/> et chaque scénario <c9/> sauf <c10/>) sans <c11/> ;

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: <name>.<member>.czml
seg-8d26148aeeff = <c1/> et <c2/> exportent des éphémérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON et STK (Systems Tool Kit) de la géométrie du passage ; une campagne exporte chaque membre qui a une géométrie comme son propre jeu de fichiers, l'étiquette du membre figurant dans le nom du fichier (<c3/>), de sorte que chaque secteur exporte ses passages LEO ; les autres types de scénario LEO indiquent pourquoi un format ne s'applique pas (<a1>INTEROP.md</a1>).

# text
seg-6f3ad057f914 = Les autres scénarios LEO, par type de scénario (détails sur la page de chaque type de scénario) :

# text
# c1: leo-band-trade
# c2: xona-pulsar-signals
# c3: celeste-iod-classical-pilot-signals
seg-73365a12bf64 = <c1/>, <c2/>, <c3/> facultatif

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-pass-xona-pulsar
# c3: leo-pass-iridium
# c4: leo-indoor-uhf
# c5: leo-iot-energy
# c6: leo-pass-celeste-iod-multiband
seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> facultatif

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
# c5: leo-navmsg-celeste-iod
seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/> facultatif

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: polar-arctic-leo-coverage
# c5: leo-timing-utc
# c6: celeste-iod-fused-pvt
seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> facultatif

# text
# c1: leo-pnt-end-to-end
# c2: xona-pulsar-end-to-end
# c3: celeste-iod-end-to-end
seg-e3017b224dfc = <c1/>, <c2/>, <c3/> facultatif

# text
seg-1ada84b384ee = Les scénarios facultatifs sont réservés au dépôt et sont retirés avec le fichier de préréglage Celeste.

# text
# c1: leo-pnt-mega-shell
# c2: constellation-design
# c3: slot-timing-ocxo-leo
# c4: slot-timing
seg-6305e46ec778 = Deux d'entre eux relèvent d'autres types de scénario. <c1/> (<c2/>) dimensionne une constellation LEO-PNT de 5000 satellites en quatre couches de Walker illustratives : disponibilité de { "99.22" } % pour un PDOP de { "3" } ou moins au-dessus d'un masque de { "20" }°, PDOP médian de { "1.11" } et { "39.4" } satellites en vue en moyenne sur { "648" } points de grille et { "12" } époques. <c3/> (<c4/>) demande combien de temps l'OCXO de la fiche technique d'un petit satellite LEO reste dans une garde de créneau de { "100" } ns à k = { "3" } après sa dernière position GNSS : la garde est rompue { "650.8" } s après une position, il faut donc une position au moins toutes les { "645.8" } s ({ "133.8" } par jour), le bruit de fréquence à marche aléatoire étant le terme dominant.

# text
seg-ee9f20a4485b = Chaîne LEO-PNT de bout en bout

# text
# c1: leo-pnt-chain
# c2: src/leo_pnt_chain.rs
seg-a6167db680ba = Le type de scénario <c1/> (<a1><c2/></a1>) suit un système LEO-PNT depuis sa conception de signal jusqu'à la position de l'utilisateur. Chaque étape est un type de scénario du moteur, exécuté sur sa propre table du scénario de chaîne, et la chaîne transmet des valeurs d'une étape à la suivante dans le code :

# text
seg-38ce4c90dd78 = De

# text
seg-2cbf005ed5cc = À

# text
seg-5d84d64174b6 = Ce qui est transmis

# text
seg-15372352ab42 = la part de puissance du composant suivi, la fraction dans la bande et la cadence de chips suivie (la répartition de la PIRE de la bande et son décalage de C/N0)

# text
# c1: [navmsg.orbit]
seg-0be525c6b695 = l'altitude et l'inclinaison du satellite de la chaîne (l'orbite de vérité du message), sauf si <c1/> les indique

# text
seg-d2306e118be7 = le C/N0 suivi au masque de positionnement et au zénith, d'après une droite des moindres carrés en sin(élévation) ajustée au passage

# text
# c1: od_sisre_m
seg-ee40b8cd109b = l'erreur de distance du signal dans l'espace (SISRE) : l'erreur de représentation du message (moyenne quadratique, orbite et horloge) avec le terme de détermination d'orbite <c1/> du scénario, en somme quadratique

# text
seg-b4b3dff58f3b = la fréquence porteuse et la cadence de chips suivie

# text
# c1: handoffs
# c2: [pass]
# c3: signal = "<design>"
# c4: leo-pass
# c5: leo-signal
seg-4def115dba1b = Une valeur n'est transmise que là où la table en aval ne la fixe pas, et chaque transmission est listée dans le tableau <c1/> du résultat avec sa valeur, son unité et sa cible. Une bande de <c2/> doit nommer la conception (<c3/>) ; c'est ainsi qu'une bande <c4/> porte aussi toute conception <c5/> de son propre chef : elle reprend la fréquence centrale de la conception, la largeur de bande d'émission et la cadence de chips suivie, répartit sa PIRE entre les composantes, et indique à chaque époque le C/N0 du composant suivi et la gigue de suivi de code early-late cohérente à bande limitée (Betz et Kolodziejski { "2009" } ; espacement d'un demi-chip, boucle de { "1" } Hz, { "20" } ms).

# text
# c1: generic-l
seg-2a2b15256cf4 = générique : la conception représentative <c1/>, un passage à { "53" }° à { "1080" } km au-dessus de Madrid, une couche de Walker de 240 satellites

# text
seg-bb05e8e505e3 = pic de C/N0 suivi de { "58.2" } dB-Hz, gigue de code médiane de { "0.050" } m ; SISRE de { "0.250" } m transmise ; erreur 3D quadratique moyenne (RMS) GNSS seul de { "1.60" } m, GNSS + LEO de { "0.43" } m ; convergence du positionnement précis par point (PPP) de { "11.5" } min GNSS seul, de { "7.5" } min avec la couche LEO

# text
seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), la couche inclinée pour le positionnement et les deux couches pour le PPP

# text
seg-a8fe501bf419 = pic de C/N0 suivi de { "66.3" } dB-Hz, gigue de code médiane de { "0.018" } m ; erreur 3D RMS GNSS seul de { "1.49" } m, GNSS + LEO de { "0.68" } m ; convergence du PPP de { "20.6" } min GNSS seul, de { "5.9" } min avec Pulsar

# text
# c1: celeste-iod-end-to-end
seg-002e4c918dda = <c1/> (facultatif)

# text
seg-a608af78a360 = configuration E5 n° 1 de Celeste IOD avec le préréglage de message Celeste (retiré avec le préréglage)

# text
seg-be428c21bd27 = le passage reproduit le pic de C/N0 total sur lequel le préréglage est étalonné (la valeur figure dans le fichier de préréglage) ; deux satellites ne déplacent presque pas une position fusionnée de 95 minutes (de { "1.50" } m à { "1.48" } m RMS 3D)

# text
seg-bf44ba47e48b = écrit le résultat, le graphique, le rapport avancé (qui intègre le passage animé et renvoie vers les exports), le lecteur interactif, et des fichiers d'éphéméride CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON et STK (Systems Tool Kit) de la géométrie du passage.

# text
# c1: od_sisre_m
seg-a08e67a32d60 = La chaîne est MODELLED : elle n'ajoute aucune physique, et chaque étape garde ses propres étiquettes. Le modèle de C/N0 de l'étape de positionnement est une droite en sin(élévation), de sorte qu'une forme propre à un passage est réduite à deux nombres ; l'étape de message ne modélise aucune détermination d'orbite, ce qui explique pourquoi <c1/> est une entrée indiquée ({ "0.25" } m dans les scénarios fournis, représentatif de la détermination d'orbite embarquée de niveau décimétrique et de l'horloge pilotée à l'échelle du chip que signale la charge utile ATOMIC : <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

# text
seg-ee3c5b58e6fa = <s1>Précédent</s1>Orbite et surface lunaires comme infrastructure

# text
seg-6b951d6413c8 = <s1>Suivant</s1>Conceptions de signaux LEO
