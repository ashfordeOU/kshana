# docs--kinds-low-earth-orbit-navigation: translations (fr)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Type

# text
seg-867f3e41b5ab = Message de navigation LEO : l'éphéméride et l'horloge diffusées d'un satellite de positionnement, de navigation et de synchronisation temporelle en orbite terrestre basse (LEO), pour toute orbite, porteuse et tout modèle, avec des préréglages nommés facultatifs (Xona Pulsar, Iridium, Starlink, CentiSpace, un système représentatif en bande C, le modèle d'horloge nulle ATOMIC, Celeste IOD). CONTENU : données auxiliaires (SVID, numéro de version des données, bande, état de santé du signal), synchronisation (semaine, temps de la semaine, un polynôme d'horloge du second ordre af0-af2 autour de toc), éphéméride selon l'un de quatre modèles -- l'ensemble képlérien à 16 paramètres de l'ICD SIS de Galileo OS ; cet ensemble plus des polynômes de correction le long de la trace, transversale et radiale ; le modèle à 22 paramètres de Liu et al. { "2025" } ; un polynôme ECEF sans terme d'horloge (horloge nulle ATOMIC) -- et d'autres services (un ensemble diffusé de Klobuchar, NeQuick-G ai0-ai2 avec le niveau d'ionisation effectif, et des paramètres de temps système vers UTC avec la logique de secondes intercalaires de l'ICD). AJUSTEUR : une orbite de référence intégrée avec la gravité zonale J2-J6 ou EGM2008 jusqu'au degré choisi et la traînée, et une horloge libre ou pilotée à graine fixe ; ajustement de Levenberg-Marquardt de l'ensemble képlérien sur des éléments non singuliers, puis polynômes de correction par moindres carrés linéaires ; horloge ajustée déduction faite du terme relativiste que l'utilisateur ajoute. ANALYSES : fit-interval-trade (erreur de distance du signal dans l'espace, SISRE, avec des poids moyennés globalement pour l'altitude d'orbite, en fonction de l'intervalle d'ajustement et de la période de mise à jour, orbite seule et avec horloge), model-comparison (quatre modèles, nombre de paramètres, bits codés, et l'ajustement de Kshana aux altitudes de Liu et al. à côté des chiffres publiés), midpass-update (le passage le plus haut au-dessus d'un utilisateur, la position, l'horloge et le saut de distance utilisateur à chaque changement de message, le saut en pire géométrie, PASS/FAIL par rapport à un seuil de continuité), encode-decode (la trame binaire documentée propre à Kshana avec CRC-24Q, un budget de quantification en demi-pas par champ, un contrôle de trame corrompue, un export et un import d'enregistrement de style RINEX-4 étiquetés extension de Kshana, et une table CSV). VALIDATED : les poids SISRE par rapport au tableau publié MEO/GEO (Montenbruck et al. { "2018" }) ; l'algorithme utilisateur de Galileo par rapport à RTKLIB sur des éphémérides diffusées réelles de Galileo ; le CRC-24Q par rapport à sa valeur de contrôle du catalogue et à la trame d'exemple RTCM { "1005" }. MODELLED : chaque chiffre d'ajustement et de SISRE est une erreur de représentation par rapport à une vérité intégrée par Kshana (sans erreur de détermination ou de prédiction d'orbite) ; la comparaison avec Liu et al. utilise des orbites différentes ; les formats d'encodage et de texte sont ceux propres à Kshana.

# attr:alt
seg-35e92abc6a23 = Le graphique que le moteur écrit pour scenarios/leo-navmsg-celeste-iod.toml, type de scénario leo-navmsg

# text
seg-c3861f7d717c = Passage LEO et bilan de liaison, bande par bande, pour le LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse), indépendant du système : un utilisateur (au sol, maritime, aérien ou en intérieur, statique ou mobile) et un ou plusieurs satellites LEO à partir d'un PASS CONÇU (une orbite circulaire placée de sorte que l'utilisateur voie un passage d'une élévation maximale choisie à un instant choisi, héliosynchrone si demandé), d'ÉLÉMENTS explicites, d'un TLE (jeu d'éléments à deux lignes) via le SGP4 du moteur, ou d'une constellation WALKER construite par le code constellation-design (les passages les plus hauts rapportés). Les bandes proviennent d'un préréglage nommé (UHF/L/S/C multibande générique, bande C générique, Xona Pulsar X1/X5, Iridium STL, Starlink comme signal d'opportunité à Doppler seul, CentiSpace, et un préréglage Celeste IOD facultatif marqué WORKSHOP) ou sont écrites dans le scénario ; chaque préréglage indique si ses chiffres sont PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP. Par satellite, bande et époque : élévation, azimut, distance, taux de variation de distance et accélération de distance ; affaiblissement en espace libre ; PIRE et gain du diagramme du satellite (isoflux, faisceau gaussien ou plat) ; gain de l'antenne de l'utilisateur en fonction de l'élévation (patch, hémisphérique ou isotrope) ; atténuation gazeuse (ITU-R P.676-10 annexe { "2" }), atténuation par la pluie (coefficients ITU-R P.838-3 et procédure P.618-14, à partir d'un taux de pluie et d'une hauteur de pluie), scintillation troposphérique (ITU-R P.618-14 section { "2.4.1" }), perte de pénétration dans les bâtiments pour un utilisateur en intérieur (ITU-R P.2109-2), désadaptation de polarisation, température de bruit du système et C/N0 (densité porteuse/bruit) ; Doppler et taux de Doppler en forme fermée à partir du taux de variation de distance et de l'accélération de distance, chacun vérifié par différences centrales ; le retard ionosphérique au premier ordre { "40.3" } STEC/f^{ "2" } à partir d'un TEC oblique de Klobuchar ou de TEC vertical mis à l'échelle de la partie de l'ionosphère située sous le satellite. Les paires de bandes reçoivent les coefficients sans ionosphère, l'amplification du bruit et le bruit de code au pic du passage. Les satellites GNSS en MEO (préréglages Galileo ou GPS) sont évalués avec le même modèle d'antenne et de bruit à partir des puissances reçues de leurs documents d'interface, de sorte que le passage LEO en cloche et les porteuses GNSS plates partagent un même graphique. Une section [iot] facultative donne le temps jusqu'au premier point fixe, l'énergie par point fixe et l'autonomie de la batterie en fonction du cycle de service pour un budget de puissance de récepteur indiqué (MODELLED). Chaque paire de bandes donne aussi le TEC oblique que sa combinaison sans géométrie retrouve au pic et l'écart-type de bruit de code de cette estimation (sondage de l'ionosphère). Une section [spoofer] facultative contrefait les signaux d'une position annoncée qui saute ou est écartée de la position réelle après un début, et exécute deux moniteurs avec des probabilités de fausse alarme et de détection manquée indiquées : cohérence du Doppler et de la géométrie de passage (taux de variation de distance mesurés par rapport à ceux prédits à partir des orbites et d'une position et vitesse a priori indépendantes, un test du khi-deux par moindres carrés généralisés sur une fenêtre, sur les canaux GNSS, LEO et tous) et cohérence inter-bandes (le pas d'époque à époque de la combinaison sans géométrie corrigée du modèle de chaque paire de bandes LEO), rapportant les statistiques par époque et le moment où chaque moniteur détecte (MODELLED). Composants VALIDATED : l'affaiblissement en espace libre, les coefficients P.838-3 par rapport à son tableau { "5" }, les procédures de pluie et de scintillation P.618-14 et la perte de pénétration dans les bâtiments P.2109 par rapport aux exemples de validation du groupe d'études { "3" } de l'ITU-R, le rapport de retard de groupe L1/L2 de l'IS-GPS-200, et le Doppler maximal d'un utilisateur statique sur une orbite circulaire par rapport au tableau { "1" } de arXiv { "2509.19551" }. MODELLED : les PIRE, les diagrammes, la fraction de Chapman du TEC sous le satellite et l'ensemble du passage.

# attr:alt
seg-02ae51cfada6 = Le graphique que le moteur écrit pour scenarios/leo-pass-iridium.toml, type de scénario leo-pass

# text
seg-81d1604171a5 = Un système LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse) de bout en bout, pour toute constellation et tout signal : la conception leo-signal nommée par signal_design (un préréglage public ou une conception [signal] en ligne) fixe le centre, la largeur de bande, la cadence de chip et la répartition de PIRE d'une bande [pass], le bilan de liaison leo-pass donne le C/N0 suivi et la gigue de code limitée en bande sur le passage, une droite de C/N0 en sin(élévation) et le SISRE diffusé du message [navmsg] (ajusté à l'altitude du satellite du passage) alimentent chaque système LEO du point fixe conjoint leo-pvt de [fusion], et facultativement les cas leo-ppp de [ppp] ; chaque transmission est listée avec sa valeur et son unité. MODELLED.

# attr:alt
seg-abe0599498c9 = Le graphique que le moteur écrit pour scenarios/leo-pnt-end-to-end.toml, type de scénario leo-pnt-chain

# text
seg-32a570f1a4fa = Convergence du positionnement ponctuel précis (PPP) avec le GNSS seul et avec augmentation LEO : un filtre de Kalman étendu flottant sur le code et la phase de la porteuse sans ionosphère avec les coordonnées de station statiques, une horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal en marche aléatoire projeté par 1/sin(élévation) et une ambiguïté flottante par arc de satellite ; l'erreur d'orbite et d'horloge précises est blanche et commune au code et à la phase d'un satellite, de sorte que chaque satellite est une mise à jour corrélée à deux lignes sous forme stabilisée de Joseph. Les mesures sont simulées à partir du même modèle avec un bruit à graine fixe sur plusieurs sites et plusieurs graines, et chaque cas (GNSS seul d'abord, puis chaque [[case]] de systèmes LEO, toute constellation ou tout préréglage) rapporte le temps de convergence médian (la première époque après laquelle les erreurs horizontale et verticale restent sous les seuils, { "10" } cm par défaut), la fraction convergée, les courbes d'erreur médianes et la cohérence du filtre (le NEES de position moyenné sur les exécutions par rapport à la bande bilatérale du khi-deux à { "95" } %). Facultativement à côté des chiffres de latitude moyenne publiés de Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) : { "9.6" } min pour le multi-GNSS, ramenées à { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO. MODELLED : une comparaison de cohérence de la tendance, et non une reproduction des constellations, du bruit ou des stations de cette étude ; ni résolution d'ambiguïté, ni sauts de cycle, ni enroulement de phase, ni marées, ni erreurs de produits corrélées dans le temps.

# attr:alt
seg-225ef04c64af = Le graphique que le moteur écrit pour scenarios/leo-ppp-convergence.toml, type de scénario leo-ppp

# text
seg-093aac4b5ff1 = Positionnement, navigation et synchronisation temporelle (PNT) fusionnés en orbite terrestre moyenne (MEO) et basse (LEO) sur N'IMPORTE QUELLES constellations : chaque [[system]] est un préréglage GNSS du type de scénario constellation-design, un préréglage LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, le modèle d'éphéméride atomic-zero-clock, ou un autre fichier de préréglage, chacun dans son propre fichier avec ses sources marquées PUBLIC, WORKSHOP ou DERIVED), des coquilles de Walker ou des jeux d'éléments explicites, avec une porteuse, une cadence de chip, une enveloppe de densité porteuse/bruit (C/N0) du masque d'élévation au zénith, une erreur de distance du signal dans l'espace (SISRE), un sigma Doppler et un modèle d'horloge (sa propre horloge de récepteur, de sorte que le biais inter-systèmes est estimé, ou un décalage diffusé connu). Quatre modes. DOPPLER : positionnement par lots de Gauss-Newton à partir du taux de variation de distance avec dérivées partielles analytiques, états de dérive d'horloge et de vitesse facultatifs et contrainte de hauteur facultative, à un ou plusieurs satellites, l'erreur en fonction de la longueur de la fenêtre, l'enveloppe de Doppler, de taux de Doppler et de saccade de chaque système LEO, et la précision le long de la trace et transversale d'un passage unique en fonction du décalage transversal (l'erreur transversale croît sans borne à mesure que le passage survole l'utilisateur ; un passage unique a aussi une solution miroir de l'autre côté de la trace au sol). Un signal d'opportunité à Doppler seul (starlink-sop) s'exécute ici. JOINT : points fixes de pseudodistance par moindres carrés pondérés à chaque époque à partir du GNSS seul, du LEO seul et des deux, écarts-types par mesure issus d'un modèle de bruit thermique de boucle à verrouillage de retard au C/N0 plus le SISRE (ou un sigma fixe, de sorte qu'un modèle de signal puisse les alimenter), les biais inter-systèmes estimés, et PDOP/HDOP/VDOP en fonction du nombre de satellites LEO ajoutés. POLAR : satellites en vue et DOP en fonction de la latitude pour le GNSS, le LEO et les deux. TIMING : transfert de temps vers le Temps universel coordonné (UTC) à partir de satellites LEO à position connue avec un filtre d'horloge à deux états dont le bruit de processus provient des classes d'oscillateurs du moteur, en fonction du C/N0 et de l'oscillateur, et l'expression temps système vers UTC de l'IS-GPS-200 ; avec [timing] trace = true chaque ligne rapporte aussi son erreur de temps et son sigma prédit à chaque époque. VALIDATED : le plus grand Doppler d'un passage de l'aplomb à l'horizon par rapport aux chiffres publiés d'Iridium (jusqu'à { "36" } kHz) et de Xona Pulsar X1 ({ "32" } à { "34" } kHz). MODELLED : tout le reste ; le DOP est vérifié par rapport à un cas dérivé à la main, les points fixes par rapport à leur covariance, et le modèle Doppler par rapport à l'identité d'accélération de distance.

# attr:alt
seg-90361a6f4e3c = Le graphique que le moteur écrit pour scenarios/leo-pvt-fjord-skyline.toml, type de scénario leo-pvt

# text
seg-97b8d07150d4 = Conceptions de signaux LEO-PNT : signaux paramétrés de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO), pour tout système, toute bande et toute structure. Un SIGNAL est une bande (fréquence centrale, largeur de bande d'émission, attribution UIT RNSS/RDSS/MSS/EESS/non-RNSS/autre) et des composantes (acquisition, données, pilote ; tout sous-ensemble), chacune avec une modulation (BPSK(n) avec n fractionnaire, BOC(m,n), MBOC({ "6,1" },p) ou une bande plate de type OFDM), une part de puissance, des décalages de sous-porteuses FDMA facultatifs, une longueur de code et un débit de données. Les signaux proviennent de fichiers de préréglages publics compilés dans le logiciel (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands ; chacun avec l'URL de sa source et chaque valeur non publiée étiquetée REPRESENTATIVE) ou sont écrits en ligne. PAR SIGNAL : la densité spectrale de puissance limitée en bande et la fraction de la puissance de chaque composante que la bande d'émission laisse passer (forme close BPSK à côté de la valeur numérique), la largeur de bande efficace (de Gabor), la gigue thermique de suivi de code de la boucle à verrouillage de retard en fonction du C/N0 et de l'espacement avance-retard, d'après la formule avance-retard cohérente (ou non cohérente) limitée en bande de Betz & Kolodziejski { "2009" }, avec sa forme de manuel en bande illimitée et sa borne de Gabor à espacement tendant vers zéro, la précision de mesure de distance en mètres, l'espace de recherche d'acquisition (cases Doppler issues du Doppler maximal de l'orbite plus les termes d'oscillateur et d'utilisateur, multipliées par les cases de code), la probabilité de détection à loi quadratique et le temps moyen d'acquisition série et parallèle sur le code, le coefficient de séparation spectrale du signal vers le GPS L1 C/A, le Galileo E1, le GPS L5, le Galileo E5a, E5b et E5 AltBOC et de chacun vers le signal, avec la dégradation du C/N0, ainsi que les J/S en onde continue, large bande et adapté que la composante suivie tolère, d'après le mécanisme SSC propre au type de scénario spectrum. UN ÉCHANGE DE BANDE : retard ionosphérique du premier ordre ({ "40.3" } TEC/f^{ "2" }), affaiblissement en espace libre, précision de mesure de distance à C/N0 égal et à PIRE égale, et tolérance au brouilleur. Des CONTRÔLES DE FORME facultatifs confrontent le spectre d'une conception à une mesure décrite (cohérence MODELLED). VALIDATED : les formes closes de la puissance dans la bande BPSK ({ "90.3" } % dans le lobe principal) et de la largeur de bande de Gabor, la gigue limitée en bande qui se réduit à la forme de manuel avance-retard cohérente et à sa borne de Gabor, le coefficient de séparation spectrale BPSK décalé par rapport à sa forme close de Parseval, l'aire unité du spectre AltBOC, et le Doppler maximal en LEO par rapport aux valeurs publiées de Xona Pulsar (32-34 kHz) et d'Iridium ({ "36" } kHz). MODELLED : chaque conception, répartition de puissance, C/N0 et niveau de brouilleur ; les spectres EFQPSK, CSK et OFDM sont approchés.

# attr:alt
seg-8bf45b6989d1 = Le graphique que le moteur écrit pour scenarios/leo-band-trade.toml, type de scénario leo-signal

# text
seg-4f0edb786a35 = Positionnement à partir d'une liaison descendante de réseau non terrestre (NTN) 5G dans la bande S du service mobile par satellite (MSS) (bande 3GPP n256, liaison descendante de { "2170" } à { "2200" } MHz ; porteuse par défaut { "2172.5" } MHz) : la borne de Cramér-Rao (CRB) sur le temps d'arrivée, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) avec beta la largeur de bande efficace (de Gabor) du spectre OFDM plat (B/sqrt({ "12" })), et sur le Doppler d'un ton complexe, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), pour chaque signal (par défaut un canal New Radio de { "5" } MHz avec { "4.5" } MHz occupés et un canal à bande étroite de { "200" } kHz avec { "180" } kHz occupés) ; puis, sur toute constellation LEO, des positions calculées par temps d'arrivée en liaison descendante avec une horloge de récepteur inconnue (initialisées par une graine, avec la borne plus une erreur de synchronisation du réseau comme sigma), leur PDOP et leur sigma 3D formel, et une position calculée par Doppler à un seul satellite sur le passage le plus long avec la hauteur maintenue. MODELLED : le passage de la largeur de bande à la borne est la forme close de manuel, contrôlée par rapport à l'intégration numérique des spectres BPSK plat et limité en bande (cohérence interne, aucune valeur publiée de calcul détaillé n'est figée), et la précision de positionnement est une borne sur un canal sans multitrajet avec une erreur de synchronisation donnée, et non un résultat atteint.

# attr:alt
seg-c200240dd65e = Le graphique que le moteur écrit pour scenarios/ntn-5g-positioning.toml, type de scénario ntn-positioning

# text
seg-4e31c8daf798 = Registre

# text
seg-6800289a282d = { "7" } types de scénario du moteur v{ $version }. À titre consultatif : sortie d'analyse d'un outil de recherche et d'ingénierie, pas un équipement de navigation homologué et pas un service de sauvegarde de la vie humaine. Chaque libellé ici est celui du moteur ou de la matrice de vérification ; un type est MODELLED sauf indication contraire de la matrice (comment un libellé s'obtient : la section Evidence du README).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Source : <c1/>

# text
seg-561a783e9516 = Navigation en orbite basse (famille de types de scénario)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Pages thématiques : <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. En exécuter une : <c1/>. Toutes les familles : <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Planche-contact des graphiques que le moteur écrit pour les types de la famille Navigation en orbite basse

# text
seg-1e724b481e67 = Conceptions de signaux LEO-PNT : signaux de positionnement, navigation et synchronisation temporelle (PNT) paramétrés en orbite terrestre basse (LEO), pour tout système, toute bande et toute structure.

# text
seg-82ad7da67939 = Passage LEO et bilan de liaison, bande par bande, pour le LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse), indépendant du système : un utilisateur (au sol, maritime, aérien ou en intérieur, statique ou mobile) et un ou plu

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = Message de navigation LEO : l'éphéméride et l'horloge diffusées d'un satellite de positionnement, navigation et synchronisation temporelle en orbite terrestre basse (LEO), pour toute orbite, porteuse et modèle, avec des préréglages nommés facultatifs (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Positionnement, navigation et synchronisation temporelle (PNT) fusionnés en orbite terrestre moyenne (MEO) et basse (LEO) sur N'IMPORTE QUELLES constellations : chaque [[system]] est un préréglage GNSS du type constellation-design, un préréglage LEO

# text
seg-d9e5f4726bbb = Convergence du positionnement ponctuel précis (PPP) avec le GNSS seul et avec une augmentation LEO : un filtre de Kalman étendu à valeurs flottantes sur le code et la phase de la porteuse sans ionosphère avec les coordonnées de station statiques, un

# text
seg-44f4148f4a5f = Positionnement à partir d'une liaison descendante de réseau non terrestre (NTN) 5G dans la bande S du service mobile par satellite (MSS) (bande 3GPP n256, liaison descendante de { "2170" } à { "2200" } MHz ; porteuse par défaut { "2172.5" } MHz) : la borne de Cramér-Rao

# text
seg-1ee838a551ef = Un système LEO-PNT (positionnement, navigation et synchronisation temporelle depuis l'orbite terrestre basse) de bout en bout, pour toute constellation et tout signal : la conception leo-signal nommée par signal_design (un préréglage public ou un [s en ligne

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-70d1ac6ddc95 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-472d9e86ee20 = <b>Registre :</b> MODELLED { "2" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-signal</a1>.

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-17d1c06ba5c5 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-9a7671c30d7e = <b>Registre :</b> MODELLED { "7" } · VALIDATED { "5" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-pass</a1>.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-cba2c7f7050a = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-7ba3e667487d = <b>Registre :</b> MODELLED { "5" } · VALIDATED { "6" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-navmsg</a1>.

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-8ca53a87d092 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-389c67090de1 = <b>Registre :</b> MODELLED { "3" } · VALIDATED { "2" }. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-pvt</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-e004092d6056 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e485df9372e6 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-ppp</a1>.

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-089266c42199 = Champs obligatoires : aucun. Facultatifs : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e0a3133f468f = <b>Registre :</b> VALIDATED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>ntn-positioning</a1>.

# text
# c1: signal_design
# c2: pass
# c3: fusion
# c4: name
# c5: description
# c6: seed
# c7: signal
# c8: navmsg
# c9: od_sisre_m
# c10: ppp
seg-ea759d0040db = Champs obligatoires : <c1/>, <c2/>, <c3/>. Facultatifs : <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-db08b7916378 = <b>Registre :</b> MODELLED. Page complète, avec les entrées, les résultats, les preuves et les limites : <a1>leo-pnt-chain</a1>.

# text
seg-534d13455a76 = <s1>Précédent</s1>Brouillage, leurrage et spectre

# text
seg-ec3fb19fb5bd = <s1>Suivant</s1>Lunaire et cislunaire
