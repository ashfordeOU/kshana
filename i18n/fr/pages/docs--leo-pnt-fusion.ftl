# docs--leo-pnt-fusion: translations (fr)

# text
seg-cae10fb9bff8 = Scénario

# text
seg-f63dd3d7aad4 = Source

# text
seg-587beeccaa11 = Préréglage

# text
seg-a6c63abeb7e6 = Scénarios fournis

# text
seg-354b42e3a5d0 = RNTF

# text
seg-c5ce76c91ff7 = Étiquette

# text
# c1: docs/LEO-PNT-FUSION.md
seg-9673ca8c2705 = Source : <c1/>

# text
seg-989faf40651b = Positionnement, navigation et synchronisation temporelle fusionnés MEO et LEO

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
seg-c14c586a29e7 = Trois types de scénario fournissent le positionnement, la navigation et la synchronisation temporelle (PNT) avec des satellites en orbite terrestre basse (LEO), seuls ou fusionnés avec les systèmes mondiaux de navigation par satellite (GNSS) en orbite terrestre moyenne (MEO) : <c1/> (position, vitesse et temps), <c2/> (positionnement précis par point) et <c3/> (un réseau 5G non terrestre). Source : <c4/>.

# text
# c1: constellation-design
seg-351652fa0e42 = Le moteur est <b>indépendant du système</b>. Chaque constellation est faite de couches de Walker, d'éléments orbitaux explicites ou d'un préréglage GNSS du type de scénario <c1/> ; chaque signal est une porteuse, une cadence de chips et une enveloppe de densité porteuse sur bruit (C/N0) ; chaque budget d'erreur est un écart-type à un sigma explicite. Les systèmes nommés sont des <b>préréglages</b> facultatifs, un fichier chacun, et chaque fonctionnalité, test et scénario fourni s'exécute sans aucun d'eux en particulier.

# text
seg-3e7c6608d5c4 = Systèmes et préréglages

# text
# c1: [[system]]
# c2: kshana <file>.toml
seg-1031746214ab = Un scénario énumère ses systèmes sous forme de tables <c1/>. Ce scénario complet associe la constellation de référence GPS à une couche LEO générique et s'exécute tel quel (<c2/> ; le moteur { $version } donne une dilution de précision de position médiane de { "2.43" } pour GPS seul et de { "1.17" } en fusion, et une erreur 3D quadratique moyenne de { "2.06" } m et de { "0.47" } m) :

# text
# c1: preset = "gps-baseline"
# c2: galileo
# c3: beidou-meo
# c4: glonass
# c5: leo_preset = "..."
# c6: navsignal::dll_code_jitter_chips
# c7: sigma_pr_m
# c8: sigma_doppler_hz
seg-6168fdca9b54 = <c1/> (le Global Positioning System, GPS ; ou <c2/>, <c3/>, <c4/>) prend une constellation GNSS publiée ; <c5/> complète tout ce que la table laisse de côté à partir d'un préréglage LEO. Le C/N0 varie linéairement avec le sinus de l'élévation, du masque au zénith (un choix de modélisation : l'enveloppe d'un passage réel dépend du diagramme de l'antenne d'émission). L'écart-type à un sigma de la pseudodistance est le bruit thermique de la boucle à verrouillage de délai (DLL) du moteur (<c6/>) à ce C/N0, combiné à l'erreur de distance du signal dans l'espace (SISRE), sauf si <c7/> le fixe ; l'écart-type à un sigma de la vitesse de distance est la longueur d'onde multipliée par <c8/>. Comme le sigma est une entrée, un modèle de signal distinct peut l'alimenter sans que le code de positionnement sache d'où il vient.

# text
seg-a3f63252bd1b = Ce qu'il transporte

# text
seg-9872e31ebd72 = Sources

# text
seg-e20c823f36f3 = X1 à { "1593.3225" } MHz, { "1.023" } Mchip/s, puissance reçue de −{ "148.2" } à −{ "139.1" } dBW ; X5 à { "1190.51625" } MHz, { "10.23" } Mchip/s, de −{ "144.9" } à −{ "136.2" } dBW ; { "258" } satellites sur { "18" } plans à { "1080" } km, { "53" } et { "97" } deg

# text
seg-57b56c874c9b = PUBLIC : <a1>arXiv:{ "2509.19551" }</a1>. Représentatif : la répartition entre les deux inclinaisons, le phasage, l'erreur de distance

# text
seg-b0c5e502c21b = Iridium Satellite Time and Location (STL) : { "66" } satellites, six plans quasi polaires à { "780" } km et { "86.4" } deg ; salves de { "1616" } à { "1626" } MHz, modulation par déplacement de phase en quadrature (QPSK) à { "25 000" } symboles/s ; puissance reçue de { "300" } à { "2400" } fois le minimum GPS

# text
seg-d65ae64607c1 = PUBLIC : <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>constellation</a3>. DERIVED : la puissance en dBW. Représentatif : porteuse au centre de la bande, erreur de distance

# text
seg-36771f73c21f = Doppler seul : { "11.325" } GHz, balise à multiplexage par répartition orthogonale de la fréquence (OFDM) de { "240" } MHz, C/N0 jusqu'à { "57.07" } dB-Hz, erreur Doppler de { "30" } Hz ; première couche de { "1584" } satellites à { "550" } km et { "53" } deg

# text
seg-44d4dd41848a = PUBLIC : <a1>Kozhaya, Saroufim et Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Représentatif : phasage, C/N0 à l'horizon

# text
seg-2e13de07f9e9 = Modulation par déplacement de phase binaire (BPSK) à { "2.046" } Mchip/s près de L1 et L5 ; détermination d'orbite centimétrique

# text
seg-dd94a3839cb3 = PUBLIC : <a1>évaluation initiale</a1>, <a2>GPS Solutions</a2>. Représentatif : porteuses, puissance, toute la constellation opérationnelle

# text
seg-a34d6a186a36 = Un système en bande C dans l'attribution de { "5010" } à { "5030" } MHz du service de radionavigation par satellite (RNSS), pour des systèmes dont les paramètres ne sont pas publics

# text
seg-7712896ff69a = PUBLIC : l'attribution du <a1>Règlement des radiocommunications de l'Union internationale des télécommunications (UIT)</a1>. Tout le reste est <b>représentatif</b>

# text
seg-89ebc32469d9 = Un modèle d'éphéméride et d'horloge : éphéméride polynomiale d'ordre six, rafraîchissement de { "30" } s, horloge pilotée sur le temps GNSS ; SISRE { "0.26" } m

# text
# c1: ephemeris_preset
seg-ddbefb8a6723 = PUBLIC : <a1>InsideGNSS</a1>. DERIVED : le SISRE. À combiner avec n'importe quelle constellation par <c1/>

# text
seg-6389c92e07d4 = Démonstration en orbite (IOD) Celeste de l'Agence spatiale européenne (ESA), une configuration d'une conception de signal paramétrée

# text
seg-b8bd6e76aeb2 = orbite PUBLIC (<a1>ESA</a1>, <a2>résumé { "16907" } de l'Institute of Navigation (ION)</a2>) ; paramètres de signal WORKSHOP, présentés à l'atelier LEO-PNT du programme d'innovation et de soutien à la navigation (NAVISP) de l'ESA, { "2026" }

# text
# c1: fusion
# c2: src/celeste_iod.rs
# c3: scenarios/celeste-iod-fused-pvt.toml
# c4: tests/workshop_preset_isolation.rs
# c5: src/celeste_iod.rs
# c6: build.rs
# c7: scenarios/*celeste-iod*.toml
seg-bd7fb6eb444a = Chaque nombre issu de l'atelier se trouve dans le module <c1/> de <c2/>, utilisé par <c3/> (<c4/> impose où ils peuvent apparaître). Comment le préréglage est tenu à l'écart : chaque nombre issu de l'atelier figure dans un seul fichier du moteur, <c5/>, que <c6/> ne compile que s'il existe, et dans les scénarios réservés au dépôt <c7/>. Supprimer ce fichier et ces scénarios retire le préréglage sans modification de source ; tous les autres tests, références indépendantes et scénarios s'exécutent sans lui, et le décompte des fichiers de scénario du README compte toujours les fichiers retirés.

# text
# c1: mode = "doppler" | "joint" | "polar" | "timing"
seg-12cdcc633ae0 = Un type de scénario, quatre modes (<c1/>).

# text
# c1: f_D
# c2: λ
# c3: ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ
# c4: u
# c5: ḋ
# c6: ∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ
# c7: doppler_only = true
# c8: starlink-sop
seg-72b5d8cc82ea = <b>Doppler.</b> Un récepteur qui mesure le Doppler <c1/> à la longueur d'onde <c2/> observe la vitesse de distance <c3/>, avec <c4/> la ligne de visée et <c5/> la dérive d'horloge du récepteur. Un ajustement par lots de Gauss-Newton résout la position, la dérive et, facultativement, une vitesse constante, avec les dérivées partielles analytiques <c6/> : seule la vitesse du satellite perpendiculaire à la ligne de visée porte de l'information de position, de sorte que la géométrie tient à la façon dont les lignes de visée tournent pendant la fenêtre. Le rapport donne l'erreur en fonction de la durée de la fenêtre, l'enveloppe du Doppler, du taux de Doppler et de la secousse de chaque système, et une table pour un seul passage. Un passage localise l'utilisateur le long de la trace (l'instant de Doppler nul) et en travers de celle-ci (la raideur de la courbe de Doppler) ; l'erreur transversale croît sans borne quand le passage se rapproche du zénith, et l'image miroir de l'autre côté de la trace au sol s'ajuste presque aussi bien (seule la rotation de la Terre les distingue). Un système à Doppler seul (<c7/>, le préréglage <c8/>) s'exécute dans ce mode.

# text
seg-007d143c7fb4 = <b>Conjoint.</b> À chaque époque, moindres carrés pondérés sur les pseudodistances des systèmes GNSS seuls, des systèmes LEO seuls et de tous, avec une horloge de récepteur par système (le biais inter-systèmes, ISB, est estimé) ou un décalage diffusé connu sur l'échelle de temps de référence. Il indique la dilution de précision géométrique, de position, horizontale, verticale et temporelle (GDOP, PDOP, HDOP, VDOP, TDOP), les erreurs, les biais estimés, et le DOP en fonction du nombre de satellites LEO ajoutés à la géométrie GNSS.

# text
seg-22f136a0c96f = <b>Polaire.</b> Satellites en vue, DOP médian et disponibilité en fonction de la latitude pour le GNSS MEO, le LEO et les deux.

# text
# c1: slot-timing
# c2: Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))
seg-1034557258d1 = <b>Synchronisation temporelle.</b> À une position connue, chaque pseudodistance LEO est une mesure d'horloge. Le récepteur exécute un filtre de Kalman à deux états (phase, fréquence) dont le bruit de processus est le bruit blanc de fréquence et le bruit de fréquence à marche aléatoire de la classe d'oscillateur (les modèles <c1/> et d'horloge), conserve le temps entre les passages et convertit le temps système en temps universel coordonné (UTC) avec l'expression d'IS-GPS-200 <c2/> ; l'incertitude du décalage diffusé est un biais propre à chaque exécution.

# text
seg-0d76fcc05e7d = Un filtre de Kalman étendu (EKF) de positionnement précis par point (PPP) à ambiguïtés flottantes sur code et phase sans ionosphère : coordonnées statiques, horloge de récepteur blanche, un biais inter-systèmes par système supplémentaire, un retard humide zénithal à marche aléatoire, et une ambiguïté flottante par arc de satellite. L'erreur d'orbite et d'horloge précises est commune au code et à la phase d'un satellite, de sorte que chaque satellite est une mise à jour corrélée à deux lignes, sous une forme stabilisée de Joseph qui maintient la covariance définie positive sur des milliers de mises à jour de phase de niveau millimétrique. Les mesures sont simulées à partir du même modèle, de sorte que l'erreur d'estimation normalisée au carré (NEES) de la position doit suivre une loi du khi-deux à trois degrés de liberté ; le test le vérifie sur des graines de Monte-Carlo. La convergence est la première époque après laquelle les erreurs horizontale et verticale restent sous les seuils ({ "10" } cm) jusqu'à la fin de l'exécution.

# text
seg-630384148ec7 = Un satellite LEO traverse le ciel en une dizaine de minutes, un satellite MEO se déplace de quelques degrés, de sorte que les arcs LEO séparent beaucoup plus tôt les ambiguïtés de la position.

# text
# c1: c / (2π β sqrt(2 (C/N0) T))
# c2: β
# c3: B/√12
# c4: sqrt(3 / (2π² (C/N0) T³))
seg-17f9cf9cc24d = Une liaison descendante de réseau 5G non terrestre (NTN) dans la bande S du service mobile par satellite (MSS), bande n256 du 3rd Generation Partnership Project (3GPP) ({ "2170" } à { "2200" } MHz). La borne de Cramér-Rao (CRB) sur le temps d'arrivée est <c1/>, avec <c2/> la largeur de bande quadratique moyenne (de Gabor) (<c3/> pour un spectre OFDM plat), et sur la fréquence d'une tonalité <c4/>. Le type de scénario compare des canaux (par défaut un canal New Radio de { "5" } MHz et un canal à bande étroite de { "200" } kHz) au moyen de positions par temps d'arrivée en liaison descendante avec une horloge de récepteur inconnue et d'une position Doppler à un seul satellite sur un passage.

# text
seg-516afd013d38 = Type de scénario, mode

# text
seg-529a5aeea10a = Ce qu'il montre (à graine fixe, déterministe)

# text
# c1: leo-pvt
seg-6cd0b721006a = <c1/>, doppler

# text
seg-c3c51264f12a = Couche Xona Pulsar X1 ({ "258" } satellites), bruit Doppler de { "1" } Hz : erreur 3D de { "7.5" } m après dix minutes ({ "26" } satellites) ; sur un seul passage, le un sigma transversal est de { "303" } m quand le passage est presque au zénith ({ "25" } km hors trace), contre { "43" } m à { "250" } km hors trace

# text
seg-da85037a6691 = Signaux d'opportunité à Doppler seul, erreur Doppler de { "30" } Hz à { "10" } Hz : un sigma horizontal formel d'environ { "10" } m après { "20" } s avec { "12" } satellites et de { "6" } m après { "60" } s

# text
# c1: leo-pvt
seg-4dbb00da5310 = <c1/>, joint

# text
seg-553e8f4df276 = PDOP médian de GPS et Galileo de { "1.47" } et erreur 3D quadratique moyenne (RMS) de { "1.06" } m ; Xona X5 seul { "1.73" } et { "0.49" } m ; fusionné { "1.06" } et { "0.41" } m ; le biais LEO de { "40" } ns ({ "11.99" } m) estimé à { "12.06" } m

# text
seg-83378a120e0d = Convergence de { "7.4" } min (GNSS MEO seul), { "4.8" }, { "3.2" }, { "2.7" } et { "2.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO

# text
seg-4aadc3b41822 = Borne de distance de { "0.26" } à { "1.03" } m pour { "4.5" } MHz et de { "6.5" } à { "26" } m pour { "180" } kHz ; positions proches de { "2" } m contre { "26" } m

# text
# c1: leo-pvt
seg-5b1019210ca7 = <c1/>, polar

# text
seg-108488f6cc6c = VDOP de GPS et Galileo de { "1.20" } à l'équateur, de { "1.51" } à { "89.9" } deg ; avec Iridium { "1.14" } au pôle

# text
# c1: leo-pvt
seg-bcdbe0796127 = <c1/>, timing

# text
seg-94ab83c05f50 = Transfert de temps Iridium sur { "6" } heures à Boulder : de { "9.9" } à { "11.4" } ns RMS au C/N0 nominal pour quatre classes d'oscillateur, de { "15.1" } à { "25.0" } ns avec { "30" } dB de moins

# text
# c1: celeste-iod-fused-pvt
seg-3007f5930dfd = <c1/> (facultatif)

# text
seg-f6ff187a00aa = GNSS rejoint par les deux satellites IOD sur l'échelle de temps de référence (réservé au dépôt, retiré avec le préréglage)

# text
# c1: leo-pvt
# c2: leo-focus-fused-pnt-sisre
# c3: leo-vertical-autonomous-vehicle
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-critical-infrastructure-timing
# c6: leo-vertical-5g-network-timing
# c7: leo-ppp
# c8: leo-focus-ppp-altitude
# c9: ntn-positioning
# c10: leo-focus-ntn-bandwidth
# c11: leo-pvt
# c12: leo-ppp
# c13: leo-pnt-chain
seg-98710204278b = Ces types de scénario s'exécutent aussi à l'intérieur d'autres scénarios : <c1/> est membre du balayage <c2/> et des campagnes <c3/>, <c4/>, <c5/> et <c6/> ; <c7/> du balayage <c8/> ; <c9/> du balayage <c10/> ; et <c11/> et <c12/> sont les étapes de position fusionnée et de PPP du type de scénario <c13/>. Leurs résultats sont sur <a1>LEO-PNT.md</a1>.

# text
seg-2f3086178d0b = Chiffres publiés et étiquettes

# text
seg-8980b5ae869b = Chiffre

# text
seg-0be9b5747c00 = Kshana

# text
seg-3d2d01038419 = Doppler d'Iridium jusqu'à ±{ "36" } kHz

# text
seg-a88258961299 = { "35.9" } kHz, le maximum sur une journée de passages, à { "5" } % près

# text
# c1: tests/leo_doppler_reference.rs
seg-5bc3150b53f6 = VALIDATED (<c1/>)

# text
seg-35a3ec8ee073 = Doppler maximal de Xona Pulsar X1 de { "32" } à { "34" } kHz

# text
seg-499acd31a8f8 = arXiv:{ "2509.19551" }

# text
seg-e8c9c880a3eb = { "33.6" } kHz pour un satellite de chaque couche publiée ({ "1080" } km, { "53" } et { "97" } deg), dans l'intervalle sans élargissement ; la couche à { "53" } deg seule culmine à { "31.8" } kHz, puisque la rotation de la Terre ralentit une orbite prograde par rapport au sol

# text
seg-e12713d5019f = VALIDATED (même test)

# text
seg-370ca62e7fc7 = Secousse de Xona Pulsar X1 de ±{ "1.26" } Hz/s²

# text
seg-4de9b0895288 = environ { "1.0" } Hz/s² sur un passage au zénith

# text
seg-5019322f4669 = indiqué, non validé

# text
seg-7fcb83027ff4 = Convergence PPP { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min avec 60/96/192/288 LEO

# text
seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

# text
seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotone

# text
seg-0a1133c16dce = cohérence MODELLED de la tendance (constellations, bruit et stations non reproduits)

# text
seg-7c5292729f36 = Starlink environ { "2" } m en { "20" } s avec trois satellites

# text
seg-6a54a7c58ade = Kozhaya, Saroufim et Kassas { "2025" }

# text
seg-13fc5fc4f69f = un sigma horizontal formel d'environ { "10" } m après { "20" } s avec { "12" } satellites, avec une éphéméride parfaite et toute l'erreur dans un sigma Doppler de { "30" } Hz à { "10" } Hz

# text
seg-4fc80a02ed6c = comparaison MODELLED (récepteur et cadence de mesure non reproduits)

# text
seg-5d0ae24eb74c = Synchronisation temporelle d'Iridium à moins de { "40" } ns de UTC(NIST)

# text
seg-fa4467605bc4 = NIST

# text
seg-b910bf5135dd = environ { "10" } ns RMS modélisé

# text
seg-9025f3c376c5 = comparaison MODELLED

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-4434b0ff1caa = Tout le reste est MODELLED, avec sa justification dans la matrice de vérification (<c1/>) : le DOP est vérifié par rapport à un cas à quatre satellites dérivé à la main, les positions par rapport à leur covariance, le modèle Doppler par rapport à l'identité de l'accélération de distance, le filtre PPP par rapport à la bande de khi-deux de la NEES, et les bornes par rapport à une quadrature.

# text
seg-aa5482ac34ff = Limites, énoncées sans détour

# text
seg-0b4564367dcd = Orbites à deux corps avec la dérive séculaire due à J2, le deuxième harmonique zonal de la Terre ; aucune erreur d'ajustement d'éphéméride diffusée au-delà du un sigma du SISRE, aucun diagramme d'antenne de satellite.

# text
# c1: leo-pvt
seg-b51ccfee4ab8 = Aucun retard ionosphérique ou troposphérique dans <c1/> (le filtre PPP porte un état de retard humide ; sa combinaison sans ionosphère supprime l'ionosphère du premier ordre), aucune scintillation, aucun trajet multiple, aucun saut de cycle ni aucune résolution d'ambiguïté entière.

# text
seg-a719ccac19c0 = La précision NTN est une borne, non un résultat obtenu.

# text
seg-19ba6cc0ca75 = Les valeurs de préréglage marquées représentatives sont illustratives et ne décrivent la conception d'aucun opérateur.

# text
seg-f9f335d67ff8 = <s1>Précédent</s1>Message de navigation LEO

# text
seg-062138bbb73c = <s1>Suivant</s1>Conception de constellations
