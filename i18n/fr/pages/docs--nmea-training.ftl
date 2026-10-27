# docs--nmea-training: translations (fr)

# text
seg-2247a2344710 = Signification

# text
seg-45425f378b61 = signification

# text
seg-6940543aa3c0 = chaîne

# text
seg-f5e7215e6835 = objet

# text
seg-c5fb6b91dc68 = degrés

# text
seg-99427ab75a03 = champ

# text
seg-bbcdd898d24d = entier

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Source : <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = Flux d'entraînement NMEA : <c1/>

# text
seg-3663955f80c7 = Les académies maritimes et les centres de simulation peuvent alimenter un simulateur de passerelle ou un traceur de cartes avec du NMEA { "0183" } généré par Kshana pour entraîner les équipages à reconnaître le brouillage et le leurrage GNSS.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Entraînement et essai uniquement.</b> Les flux générés sont synthétiques. Ils ne doivent jamais être envoyés aux systèmes de navigation actifs d'un navire. Kshana est à titre consultatif, et non un équipement de navigation homologué. Chaque flux commence par une phrase de marqueur propriétaire, <c1/>, et la répète toutes les dix secondes ; les récepteurs l'ignorent ; <c2/> la supprime pour un simulateur qui rejette les phrases inconnues. Cela n'écrit que du <b>texte</b> NMEA : il n'y a aucune sortie RF, IQ ou de forme d'onde, et rien n'est transmis, sauf le texte vers l'adresse que vous indiquez.

# attr:alt
seg-b66ff9ca2ff4 = Flux d'entraînement du scénario coastal-drag-off (moteur v{ $version }, graine { "22" }, { "25" } minutes à une position par { "10" } s du journal de l'instructeur). Une carte montre la trajectoire réelle du navire et la trajectoire que rapporte le récepteur : elles concordent jusqu'au début d'une dérive de position scénarisée à { "421" } s, la trajectoire rapportée s'éloigne alors de la trajectoire réelle tandis que le récepteur conserve une position valide, et elle revient d'un saut à la fin de l'événement à { "1140" } s. À côté, la distance entre les deux trajectoires au fil du temps, et la densité moyenne de porteuse sur bruit que rapporte le récepteur, qui monte à un niveau relevé tant que l'événement dure. Données d'entraînement synthétiques générées par Kshana. Pour l'entraînement et l'essai uniquement : ne jamais envoyer ce flux aux systèmes de navigation actifs d'un navire. À titre consultatif, et non un équipement de navigation homologué. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire. Les positions, dates et trajectoires sont inventées.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = La figure est tracée à partir du journal de l'instructeur de <c1/>.

# text
seg-32b620b3574e = Utilisation

# text
seg-9cbd24964be4 = Option

# text
# c1: <name>.nmea
seg-aadcf289aed2 = écrit le flux dans un fichier ; sans sortie réseau, la valeur par défaut est <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = écrit <c1/> et <c2/> (par défaut : à côté du fichier)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> ou <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = serveur TCP ; l'exécution démarre lorsqu'un client s'est connecté (<c1/>). Un port seul écoute sur <c2/> uniquement

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> ou <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, une phrase par datagramme ; <c1/> autorise une adresse de diffusion. Un port seul envoie vers <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = cadence le flux ; <c1/> signifie aussi vite que possible. La sortie réseau est par défaut en temps réel, les fichiers aussi vite que possible

# text
seg-97b82dfe97a7 = remplace la graine du scénario

# text
seg-86ac66fd2771 = omet la phrase de marqueur

# text
seg-f6cc05a6d39a = <b>Il n'y a aucune authentification.</b> Un serveur TCP auquel on donne une adresse non locale sert le flux à quiconque peut l'atteindre, et UDP envoie à l'adresse que vous indiquez. Un client TCP qui ne prend pas ses données en deux secondes est déconnecté, de sorte qu'un consommateur bloqué ne peut pas retenir les autres.

# text
seg-b4abb5a132ba = La même graine donne les mêmes octets sur une plateforme, et la cadence ne change jamais les octets. D'une plateforme à l'autre, l'arithmétique propre du générateur est identique bit à bit (il utilise la couche de mathématiques portable), mais les positions des satellites et les angles de visée proviennent de fonctions du moteur qui appellent la bibliothèque mathématique de l'hôte ; dans un rare cas limite, un chiffre arrondi d'élévation, d'azimut ou de C/N0 dans GSV peut donc différer d'une plateforme à l'autre.

# text
seg-97e31fc7f0d1 = Ce qui est écrit

# text
# c1: GN
seg-632a4ca26567 = Chaque époque ({ "1" }, { "2" }, { "5" } ou { "10" } par seconde) comporte : <b>RMC, GGA, GNS</b> (position calculée, position, heure), <b>GSA</b> (satellites utilisés et DOP, un par constellation), <b>GSV</b> (satellites en vue avec élévation, azimut et SNR en dB-Hz, un jeu par constellation, identifiant de signal NMEA { "4.10" }), <b>VTG</b> (route et vitesse sur le fond), <b>ZDA</b> (heure et date), <b>HDT</b> (cap gyroscopique) et <b>VBW</b> (vitesse sur l'eau et sur le fond issue du loch). L'émetteur est <c1/> avec plusieurs constellations, sinon celui de la constellation. Les lignes se terminent par CRLF et ont une somme de contrôle valide.

# text
seg-942803ad8c49 = HDT et VBW tiennent lieu de capteurs indépendants (un compas gyroscopique et un loch Doppler). <b>Aucun événement ne les touche</b>, ce qui est voulu : l'écart entre ce que rapporte le GNSS et ce que disent le gyroscope et le loch est un indice pour le débriefing.

# text
# c1: V
seg-2d9a9ea38dde = Lorsque la position est perdue, la qualité GGA est { "0" }, l'état RMC est <c1/>, les champs de position sont vides et les champs d'heure continuent (l'horloge du récepteur continue de tourner), comme le font les récepteurs réels.

# text
seg-c1c51ff381e7 = Le navire

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> et <c2/> donnent une position de départ, une vitesse et les points par lesquels gouverner. Le navire est gouverné vers le point de cheminement suivant sous une <b>limite de vitesse de giration</b> (<c3/>, par défaut { "30" }), une limite sur la rapidité avec laquelle la vitesse de giration s'établit (<c4/>) et une <b>limite de changement de vitesse</b> (<c5/>). La vitesse d'un tronçon est le <c6/> du point de cheminement. <c7/> ajoute un courant, de sorte que la vitesse sur le fond diffère de la vitesse dans l'eau et que le cap diffère de la route sur le fond, et une variation magnétique. <c8/> amène le navire au repos au dernier point de cheminement.

# text
seg-4fc2cb8a1388 = Géométrie des satellites

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Les satellites proviennent des constellations nominales propres au moteur (table de créneaux GPS, motifs de Walker MEO de Galileo et BeiDou, ICD GLONASS), propagées par <c1/> (deux corps plus J2 séculaire, rotation de la Terre) et vues depuis le navire avec les angles de visée WGS-84 du moteur. Le nombre de satellites visibles, les élévations et les azimuts dans GSV sont plausibles pour le lieu et l'heure du jour. <b>Il s'agit d'un ciel nominal, et non d'une éphéméride pour la date du flux</b> : les PRN sont attribués dans l'ordre des créneaux et chaque constellation conserve sa disposition de créneaux publiée, propagée en continu depuis l'époque de la table de créneaux GPS (2016-12-31) sous J2, de sorte que la disposition est intacte mais que son orientation n'est pas celle du ciel réel à la date du flux. Le C/N0 suit l'élévation (un niveau nominal au zénith, fixé dans <c2/>), avec un décalage fixe par satellite, un évanouissement lent et du bruit. Un satellite sous <c3/> a un champ SNR vide ; un satellite sous <c4/> est poursuivi mais non utilisé. Jusqu'à <c5/> (par défaut { "12" }, le plafond NMEA GGA) satellites utilisables sont utilisés, choisis pour la géométrie (le satellite le plus haut de chaque secteur d'azimut de { "30" } degrés en premier). Moins de quatre satellites utilisables font perdre la position, qui revient après <c6/> de signal utilisable.

# text
seg-f2be7442bdf2 = Événements

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Chaque <c1/> a un <c2/>, un début <c3/>, une <c4/> (du début au commencement du relâchement), une rampe de début <c5/> et une rampe de relâchement <c6/>. L'intensité monte linéairement sur <c7/>, se maintient, puis retombe sur <c8/> ; <c9/> est un échelon. Tous les effets sont proportionnels à cette intensité. Les paramètres qui n'appartiennent pas au type sont refusés.

# text
seg-3255e99c7265 = type

# text
seg-9285a9d699c0 = paramètres

# text
seg-e83c9db4f9c7 = effet

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (par défaut { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = le C/N0 de chaque satellite chute jusqu'à <c1/> (dispersion par satellite), les satellites décrochent en commençant par les plus faibles, la position est perdue lorsque moins de quatre sont utilisables, et revient après le relâchement et <c2/>

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, l'un de <c2/> (vrai) ou <c3/> (par rapport à la route <b>au début</b>, puis maintenu), <c4/> facultatif, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = le récepteur conserve une <b>position valide</b> dont la position s'éloigne de la vérité ; SOG et COG incluent la dérive. La dérive suit une fonction smoothstep sur les rampes, de sorte que la fausse trajectoire démarre et s'arrête sans échelon de vitesse ; ses pics sont <c1/> m/s et <c2/> m/s au carré pour une rampe de <c3/> s sur <c4/> m (les deux journalisés), et un scénario qui dépasserait <c5/> est refusé. Un échelon (<c6/>) déplace la position sans toucher à la vitesse

# text
seg-7da039c3262e = l'heure de RMC, GGA, GNS et ZDA est décalée par rapport au véritable UTC ; la position reste exacte

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (par défaut true), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = la position, la vitesse (et l'heure) sont celles du navire d'il y a <c1/>, le retard suivant smoothstep sur ses rampes et la vitesse rapportée étant multipliée par <c2/> pendant qu'il change : une abstraction simplifiée, de type meaconing, et non un modèle de propagation

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/> : tant qu'une dérive, un leurrage de l'heure ou un retard de rejeu est actif, chaque satellite poursuivi affiche ce même niveau relevé unique, signe classique. Omettez-le pour un événement subtil dans lequel le profil de C/N0 authentique est conservé. Tant qu'un événement de contrefaçon est actif, le récepteur suit le signal contrefait, de sorte que le brouillage ne le fait pas décrocher ; une position perdue à cause d'un brouillage antérieur revient après <c2/> sur le signal contrefait (voir <c3/>). Un changement d'heure qui ferait s'arrêter ou reculer l'heure rapportée (vitesse de { "1" } s par seconde ou plus) est refusé, sauf s'il s'agit d'un échelon (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Les événements peuvent se chevaucher ; leurs effets s'additionnent (décalages, changements d'heure, retards) ou retiennent le plus fort (brouillage). Le <c1/> de la chronologie est la première époque où l'événement a un effet, une époque après le <c2/> scénarisé lorsque l'événement monte en rampe.

# text
seg-09e311ade9e6 = Le journal de l'instructeur

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Avec le flux, <c1/> et <c2/> donnent :

# text
seg-51930977a6fe = les événements tels qu'injectés, en langage courant avec chaque paramètre, et leur début en UTC ;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = une chronologie : début, plein effet, début de récupération, récupéré, et les propres <c1/> et <c2/> du récepteur ;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = la trajectoire réelle comparée à la trajectoire rapportée à intervalle <c1/> : position réelle et rapportée, vitesse et route, erreur de position en mètres, décalage d'heure, satellites utilisés et poursuivis, C/N0 moyen, et quels événements étaient actifs ;

# text
seg-303f5fbe0351 = la vitesse et l'accélération maximales de la trajectoire réelle et de la trajectoire rapportée ;

# text
# c1: trainer_note
seg-593a4a1ef296 = le <c1/> du scénario.

# text
seg-8c4aebcd0eff = N'afficher le journal qu'au débriefing.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = Champs JSON (schéma <c1/>)

# text
seg-60b5b11cdc0b = type, unité

# text
seg-f4963d090155 = la mention réservée à l'entraînement

# text
seg-7ad14e03d9e4 = issu du scénario

# text
seg-fac0fb50b31b = graine utilisée

# text
seg-f05d18516bd8 = UTC ISO { "8601" }

# text
seg-8752c09baa6a = début de l'exécution

# text
seg-f0d8bb5aafef = durée de l'exécution

# text
seg-0989e14f1e51 = nœuds

# text
seg-b657b979a455 = vitesse sur le fond maximale, réelle et rapportée

# text
seg-24e947df31ae = m/s au carré

# text
seg-a1ca3847c8d8 = plus grand changement de vitesse par seconde, réel et entre positions rapportées consécutives

# text
seg-e1daadeb7d48 = un par événement scénarisé

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = base 1 ; utilisé par <c1/> et <c2/>

# text
seg-6bbb9db14f7b = description en langage courant avec les paramètres

# text
seg-2f3eac27a997 = début scénarisé

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = l'événement exactement tel qu'écrit (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, et les paramètres propres au type ; les absents sont omis)

# text
seg-88db26711d77 = degrés vrais ou null

# text
seg-2f30c3d8b17b = dérive : la direction appliquée (un relèvement relatif est résolu au début)

# text
seg-55d6dd667365 = m/s, m/s au carré ou null

# text
seg-021df000164f = dérive : les pics que la dérive ajoute à la fausse trajectoire

# text
seg-d3a2c65ebcd4 = moments pour le débriefing, dans l'ordre chronologique

# text
seg-b2b72301c1c9 = s depuis le début, UTC ISO { "8601" }

# text
seg-34e24e21ac7e = quand (heure réelle)

# text
seg-cf29ba5ed968 = entier ou null

# text
seg-8dbc5e7239be = l'identifiant de l'événement ; null pour les changements d'état du récepteur

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (événements) ; <c5/>, <c6/> (récepteur)

# text
seg-cd7c4057601b = explication

# text
# c1: log_interval_s
seg-90e65cbe1a59 = une ligne par <c1/>

# text
seg-a57e27a3c470 = s, UTC ISO { "8601" }

# text
seg-24376fe24496 = position réelle

# text
seg-f23b251a0e33 = nœuds, degrés vrais

# text
seg-242c1f2ccbd3 = vitesse et route réelles sur le fond, et cap gyroscopique

# text
seg-696dd61f8bbb = booléen

# text
seg-ea264ef0395c = le récepteur a rapporté une position

# text
seg-b073b87a813e = degrés, nœuds, degrés vrais, ou null

# text
seg-b56345697092 = ce que le récepteur a rapporté ; null tant que la position est perdue

# text
seg-c4a33c03d9da = m ou null

# text
seg-463f6fc42ae5 = distance horizontale de la position réelle à la position rapportée

# text
seg-b68dfce8d81d = UTC rapporté moins UTC réel

# text
seg-ec28faa1efcc = entiers

# text
seg-2bf397f77392 = satellites utilisés dans la position calculée, et poursuivis

# text
seg-96b87348e90e = dB-Hz ou null

# text
seg-40f30b4a88cf = C/N0 moyen des satellites poursuivis

# text
seg-3671c8aa3c1a = identifiants des événements ayant un effet à cet instant

# text
# c1: /2
seg-8401fa92aae1 = L'ajout d'un champ ne change pas l'étiquette du schéma. Renommer ou supprimer un champ, ou changer le sens ou l'unité d'un champ, fait passer le numéro au suivant (<c1/>).

# text
seg-656ee92a3130 = La bibliothèque de scénarios

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, chacun de quelques minutes de traversée avec une note du formateur dans son TOML :

# text
seg-665b9b46b49b = fichier

# text
seg-11ed1f85d4be = ce qu'il montre

# text
seg-50ffa85a1128 = le C/N0 chute partout, les satellites décrochent, la position est perdue puis revient

# text
seg-10bc30b9c57b = une position valide, d'apparence saine, dérive de { "1.4" } km vers le rivage ; C/N0 uniformément relevé

# text
seg-f141692988e4 = position correcte, l'UTC dérive de { "45" } s en avance pendant une lente approche du port

# text
seg-ce06a5ebdd42 = brouillage, puis prise de contrôle contrefaite avec dérive et décalage d'heure, puis un retard de rejeu

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = un ciel obstrué, et non une interférence : les parois d'un fjord (le préréglage de ligne d'horizon REPRESENTATIVE <c1/>) masquent les satellites à l'est et à l'ouest, puis le chenal se dégage de nouveau (événement <c2/>, avec une table <c3/>)

# text
seg-5462f6b21fae = Les positions, dates et trajectoires sont inventées ; la bibliothèque ne contient aucun navire, opérateur ni enregistrement réel. Elle ne dit rien de la façon dont un récepteur ou un système se comporterait face à une interférence.

# text
seg-9831ab537b36 = Choix de modélisation

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = Le générateur est un outil d'entraînement sans référence indépendante, et ses nombres sont des choix de modélisation, et non des mesures d'un récepteur quelconque. Ils sont choisis pour ressembler à un journal de récepteur ordinaire : la pente de C/N0 de { "14" } dB du zénith à l'horizon sous le niveau au zénith (par défaut { "47" } dB-Hz) et le décalage par satellite de +/-1.5 dB, un évanouissement lent de { "0.8" } dB sur { "97" } s et de { "0.5" } dB sur { "31" } s, une gigue de { "0.3" } dB ; les seuils de poursuite ({ "20" } dB-Hz) et d'utilisation ({ "28" } dB-Hz) ; le bruit de position ({ "1.5" } m à HDOP { "1" }, corrélé sur { "30" } s, le double à la verticale) ; un bruit de gyroscope de { "0.05" } degré et un bruit de dérive de { "0.03" } kn ; la constante de temps de gouverne de { "20" } s et les rayons d'arrivée aux points de cheminement du modèle de navire ; et le choix des satellites par secteur d'azimut. Les valeurs par défaut se trouvent dans <c1/> et <c2/> et peuvent toutes être modifiées dans le scénario.

# text
seg-84913be532a0 = Relecture

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> peut ingérer ces fichiers (<c2/>). Les tests vérifient chaque phrase de chaque scénario de la bibliothèque par rapport à ses propres règles de nombre de champs et de somme de contrôle, et font passer les fichiers par ce lecteur, qui interprète GGA, RMC et GSV et laisse passer les autres types sans en sauter aucun. Les tests figent un extrait de référence par scénario (<c3/>) ; régénérez avec <c4/> après un changement voulu.

# text
seg-b94fbc3b1dd3 = <s1>Précédent</s1>Confiance maritime

# text
seg-ecdf748cb63d = <s1>Suivant</s1>Carte des interférences et exposition d'un itinéraire

# text
seg-24ad8471ff2a = Champs JSON (schéma kshana-nmea-training/1)
