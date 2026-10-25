# docs--agents: translations (fr)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Source : <c1/>

# text
seg-d0e198572cfe = Utiliser Kshana depuis un agent IA

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Pour un agent (ou la personne qui le dirige) : quel outil appeler pour quelle question, ce que les outils feront et ne feront pas, et ce qu'il faut conserver avec chaque réponse. Les surfaces et les cellules qui ne sont pas disponibles sur une surface donnée : <a1><c1/></a1>.

# text
seg-a0354cacda4c = Connecter

# text
seg-337d23a873f5 = Un passage nommant des clients IA tiers est omis ici ; il se trouve dans <a1>docs/AGENTS.md</a1> sur GitHub.

# text
seg-01a862ed86e6 = La règle pour chaque réponse

# text
seg-0adf5e5ad79a = Exécutez le moteur ; ne devinez pas les chiffres. Rapportez ce qu'un outil a renvoyé avec son unité et son niveau de preuve (VALIDATED par rapport à une référence indépendante externe, ou MODELLED), le scénario, la graine et la version du moteur, afin que l'exécution puisse être répétée. Conservez avec chaque résultat ses propres réserves.

# text
seg-f67845b891c5 = Quel outil pour quelle question

# text
seg-6f4bb4962340 = La question

# text
seg-8efda304925b = Outil (MCP)

# text
seg-83d609ff5cc7 = Commande slash

# text
seg-9b937d3cbf88 = Exécuter ou expliquer un scénario PNT (orbites, GNSS, synchronisation temporelle, fusion, lunaire, liaisons optiques, ...)

# text
seg-ba8b3824bba2 = Ce journal de récepteur, ou le NMEA de ce navire, était-il digne de confiance, et quand a-t-il cessé de l'être ?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (tout format de journal), <c2/> (NMEA de navire, par lot), <c3/> (extrait borné)

# text
seg-aa194fda4300 = Il me faut du NMEA synthétique avec un événement de brouillage, de dérive de position, de leurrage temporel ou de rejeu pour la formation

# text
seg-0211b49536df = Afficher le score de confiance d'un navire dans des formats de supervision ou de SIEM (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Noter un journal de récepteur par rapport au calendrier Jammertest publié (latence de détection, alarmes manquées, fausses alarmes, temps de rétablissement), ou transformer ce plan en événements

# text
seg-d1c81008d5f8 = Produire un enregistrement inviolable de ce que le moteur a dit sur une fenêtre du journal d'un navire, ou en vérifier un

# text
seg-b7892674ac60 = Les données de navigation de quels satellites Galileo ce flux de récepteur authentifie-t-il (OSNMA) ?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>aucun : pas sur MCP.</b> Utilisez <c1/> (CLI), <c2/> (Python) ou <c3/> (WASM, la carte OSNMA du Studio)

# text
seg-4fc021a0a145 = pas une commande slash

# text
seg-0f5db62071e9 = Il me faut le mouvement du véhicule et les instants d'événements d'un scénario à rejouer dans un simulateur GNSS de laboratoire

# text
seg-919946a95002 = En faveur de quelles lignes d'exigences de cadres publics ces exécutions apportent-elles des éléments de preuve, et quel est l'écart ?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (à partir du texte des résultats), <c2/> (les tableaux, sans exécution)

# text
seg-ff6556a46025 = Exécuter un paquet de normes noté (profils d'essai DHS RPCF, OMI MSC.1/Circ.1575, ICAO Doc { "9849" } Appendice F) par rapport à des seuils énoncés avant l'exécution ?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (donnez le rapport à <c3/> pour obtenir les lignes)

# text
seg-1745cce01677 = Vérifier le LunaNet Augmented Forward Signal (codes, SB1, format de trame) par rapport à LNIS V5 / LSIS-AFS V1.0, ou vérifier un flux de symboles ?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols ou generate) ; le LDPC et le CRC-24Q des sous-trames { "2" } à { "4" } ne sont pas vérifiés

# text
seg-86c207c3996e = Relier un essai de laboratoire (scénario, conditions d'essai déclarées, journal de récepteur, score) dans un seul paquet signé ?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> après <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = Noter une soumission de détection ou de holdover par rapport à un fichier de vérité kshana-bench, ou produire des fichiers de résultats sous forme de page de classement ?

# text
seg-87e686c064ce = Il me faut un scénario qui parcoure un itinéraire GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = Quels satellites un utilisateur voit-il dans une rue, un port, un fjord ou un terminal à conteneurs, et quels sont le DOP et l'ellipse d'erreur ?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (une requête, ou un <c2/>) ; la section <c3/> d'un scénario via <c4/> (<c5/> et <c6/> nécessitent <c7/>)

# text
seg-bd7f9d7e8e27 = Où le GNSS est-il apparu dégradé, et quelle part de cet itinéraire s'y trouve ?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, puis <c2/>

# text
seg-1f715d5e0c4f = Enregistrements IQ GNSS (scène, acquisition, poursuite, frontal, campagnes)

# text
# c1: iq_signals
# c2: iq_*
seg-5569efd18c6b = <c1/> d'abord, puis les outils <c2/>

# text
# c1: vessel-receiver-trust
# c2: training-nmea-scenario
# c3: trust-telemetry
# c4: compliance-mapping
# c5: test-bench-export
# c6: gnss-iq
# c7: interference-map-route-exposure
seg-d44650438742 = Les skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> et <c7/> portent les règles ci-dessous pour les agents qui chargent des skills.

# text
seg-a4de5a40b743 = Ce que chaque outil ne fera pas

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Lire ou écrire des fichiers.</b> Le contenu est en ligne : les entrées sont du texte dans la requête, plafonné à { "4" } MiB, et un champ de scénario qui nomme un fichier est refusé. Seuls les outils <c1/> touchent à un dossier, et seulement celui que nomme <c2/>, chaque chemin y étant confiné.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>Vérifier l'OSNMA.</b> Il n'existe aucun outil MCP : l'entrée est un long flux brut de récepteur (pages I/NAV ou capture UBX), ce qui convient à la CLI et à Python, et un outil qui en prendrait un ajouterait une grande surface d'entrée sans bénéfice. Renvoyez l'utilisateur à <c1/> (ou à <c2/> en Python). Quoi que dise sa sortie, reprenez la mention à titre consultatif telle quelle : état d'authentification seulement, pas un service d'intégrité de la navigation, pas un équipement de navigation homologué, et aucune affirmation de performance antileurrage ; un résultat n'a de sens qu'avec une racine de Merkle ou une clé publique que l'utilisateur a obtenue par une autre voie.

# text
seg-b13a75d08152 = Exécuter un processus.

# text
# c1: receiver-trust live
# c2: --listen
# c3: trust-telemetry
# c4: assess_vessel_stream
# c5: advisory
# c6: geometry
# c7: class
# c8: #
# c9: --udp
# c10: --listen tcp:
seg-9dfcbee6fdb8 = <c1/> comme flux en cours d'exécution (avec une passerelle et <c2/>), les exportateurs de télémétrie (<c3/> : Prometheus, syslog, OTLP) et la diffusion de NMEA de formation vers une adresse relèvent uniquement de la ligne de commande. <c4/> note un extrait avec le même moteur et n'écrit sur aucun port. Les outils d'extrait renvoient le schéma JSON-lines live { "1.3" } (une déclaration <c5/> et la <c6/> satellitaire sur chaque époque, une <c7/> sur chaque déduction) ; le CSV d'une exécution de navire commence par une ligne de commentaire <c8/> portant la même déclaration, lisez-le donc avec une option de commentaire. <c9/> et <c10/> se lient à l'adresse de boucle locale sauf indication contraire.

# text
seg-ac51aad84893 = Écrire un signal.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> renvoie le mouvement du véhicule et des intervalles d'événements étiquetés sous forme de texte ; rien de ce qu'il renvoie n'est, ne modélise ni ne pilote un signal radiofréquence ou en bande de base, et un événement n'est pas une recette pour produire de l'interférence. Donnez son <c2/> avec les fichiers ; le simulateur et son opérateur sont responsables de ne les exécuter que là où c'est autorisé.

# text
seg-39f3aae1143a = En dire plus que ne dit la correspondance.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> indique en faveur de quelles lignes de cadres un ensemble d'exécutions apporte des éléments de preuve, avec l'écart de chaque ligne. Il ne dit jamais qu'un cadre est satisfait ni qu'un produit est évalué ou approuvé ; reprenez son <c2/> tel quel et dites « apporte des éléments de preuve en faveur de », rien de plus fort. Il lit le texte des résultats et des scénarios que vous lui passez, jamais un chemin.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Récupérer des données.</b> Le téléchargement des polygones de terre relève uniquement de la ligne de commande et nécessite <c1/>. Passez le fichier de terre, si on le souhaite, sous forme de texte. N'utilisez que des données que l'utilisateur est autorisé à utiliser.

# text
seg-d513f734248e = <b>Émettre quoi que ce soit ou synthétiser de la RF.</b> Le générateur de formation écrit du texte NMEA ; la couche IQ écrit des fichiers d'échantillons pour des récepteurs logiciels.

# text
seg-63eb4c5b4a17 = Ce qu'il faut conserver avec la réponse

# attr:aria-label, text
seg-6555ff9a6d8e = Sortie

# text
seg-a056a59fb678 = À conserver

# text
seg-c01c0fedd895 = Géométrie satellitaire et classes de déduction ({ "0.36" })

# text
# c1: geometry
# c2: environment
# c3: inconsistency
# c4: unknown
seg-3723ec5a3f8c = Rapportez la géométrie à côté du score et la classe de chaque déduction telle que renvoyée : <c1/> désigne le ciel (une déclaration sur le ciel, et non la constatation qu'aucune attaque n'a eu lieu), <c2/> l'environnement du signal, <c3/> des éléments semblables à une attaque. Dites « géométrie inconnue » lorsque l'état est <c4/> (ni GSV ni GSA dans le journal) ; n'en déduisez pas une. Les seuils sont <b>MODELLED</b> avec une provenance déclarée.

# text
seg-0938dfb71d72 = Score de confiance du récepteur

# text
seg-8e3a7376cd6b = <b>À titre consultatif</b> : pas un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) ; l'opérateur reste responsable. <b>MODELLED</b>. Énoncez les limites du navire avant l'exécution et n'ajustez pas un seuil à un résultat. Un score élevé n'est pas la preuve d'une position authentique ; les contrôles ne peuvent pas voir un leurre cohérent avec tous les autres capteurs.

# text
seg-ae3f0548e93f = Paquet de preuves

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = Un <b>enregistrement technique</b>, et non un avis juridique, une constatation de fait ou une approbation. Vérifiez avec la clé publique du signataire obtenue par une autre voie ; sans elle, le verdict est <c1/>, ce qui ne prouve que l'intégrité par rapport à la clé que le paquet nomme lui-même : dites « intact, signataire non établi », jamais « vérifié ». Ne renvoyez, ne journalisez ni ne demandez jamais une graine de signature dans une conversation si la clé compte : utilisez la CLI.

# text
seg-512e5ee42c1e = NMEA de formation

# text
seg-c59a76aefff5 = <b>Texte uniquement</b>, pour la formation et l'essai, <b>jamais</b> pour les systèmes de navigation en service d'un navire. Renvoyez la graine et le journal de l'instructeur.

# text
seg-14781c19be62 = Carte d'interférence, exposition d'un itinéraire

# text
seg-7135c6f44d49 = La lecture des codes de précision ainsi que la géométrie de la grille et de l'itinéraire sont <b>VALIDATED</b> par rapport à des bibliothèques indépendantes sur des entrées synthétiques ; les seuils de la méthode restent <b>MODELLED</b>, et le fait qu'une cellule dégradée soit de l'interférence n'est <b>pas</b> vérifié : une cellule dégradée n'identifie <b>pas</b> l'interférence comme cause. Une cellule non observée n'est <b>pas</b> la preuve d'un itinéraire dégagé. Des rapports passés, <b>pas une prévision</b>. Agrégat uniquement : n'essayez pas de retrouver les identifiants. Les cartes ADS-B et AIS restent séparées.

# text
seg-e47db9be47ea = Géométrie du ciel, ligne d'horizon

# text
# c1: advisory
seg-839eb485b1d2 = Géométrie <b>MODELLED</b> sous un modèle d'erreur déclaré, en visibilité directe seulement : ni diffraction, ni trajets multiples, ni réception hors visibilité directe. Les préréglages sont <b>REPRESENTATIVE</b>, et non des relevés ; reprenez la provenance du préréglage. Les constellations prédéfinies sont un ciel représentatif, non le ciel d'une date. L'ellipse met à l'échelle une UERE déclarée : ce n'est pas une précision mesurée ni une borne d'intégrité. Conservez le <c1/>.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Disponibilité d'une liaison optique (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, à titre consultatif. Les climats nuageux sont des entrées déclarées, et non un jeu de données, et aucun enregistrement de disponibilité mesurée n'a été comparé : dites « sous ces hypothèses », jamais « la disponibilité à ce site ». Conservez le <b>plafond</b> du site (<c1/> : ce qu'aucune marge ne relève) à côté de sa disponibilité, et dites quels gains de technique sont des entrées (Kshana ne modélise pas de boucle d'optique adaptative). Les calculs numériques sont vérifiés par rapport à un programme indépendant, ce qui vérifie l'implémentation des formules et non l'atmosphère.

# text
# c1: holdover-test
seg-3324b2e2021e = Essai de holdover (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, à titre consultatif. Dites « mesuré par rapport au gabarit », jamais qu'une horloge ou un système satisfait à une Recommandation ou est approuvé par rapport à elle. Les deux instants (GNSS retiré, GNSS rétabli) sont la <b>déclaration de l'opérateur</b> : Kshana n'a rien retiré ni rétabli et ne peut pas les vérifier, citez-les donc tels que déclarés. Un gabarit pour lequel l'enregistrement est trop court est <b>INCOMPLETE</b>, jamais une réussite. Un journal d'asservissement (linuxptp, chrony) est l'erreur sous asservissement, et non une mesure indépendante par rapport à l'UTC ; dites de quel enregistrement proviennent les chiffres. Voir <c1/>.

# text
seg-18d3f2b50d0a = Tout résultat de scénario

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = Le <c1/> ou le <c2/> qu'il énonce, et la ligne de provenance.

# text
seg-166f773b2804 = Limites

# text
seg-203a91deb52c = Utilisez des données synthétiques ou celles de l'utilisateur. Ne nommez dans les sorties ni personnes, ni navires, ni organisations qui ne figuraient pas dans l'entrée de l'utilisateur. Kshana est un outil d'analyse et de formation, et non un produit de vol ou de navigation.

# text
seg-ec064f62f7dc = <s1>Précédent</s1>Serveur MCP : mode HTTP auto-hébergé

# text
seg-1f44dbd65ce3 = <s1>Suivant</s1>Où chaque capacité est accessible
