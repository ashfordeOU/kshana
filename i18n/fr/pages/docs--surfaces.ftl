# docs--surfaces: translations (fr)

# text
seg-f917e7fcac09 = Ce que c'est

# text
seg-76dc5d9ec114 = JetBrains

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Surface

# text
seg-d6476863f862 = Capacité

# text
seg-e0426ffe2628 = Note

# text
seg-de6c33774c9c = CLI

# text
seg-98f4f946a7ac = WASM

# text
seg-206c78a69ded = Exposition d'itinéraire

# text
seg-4dbf41c0ec3b = Fonction

# text
seg-d5b5bdf6081c = Rust

# text
seg-40a7552d2ba9 = MCP

# text
# c1: docs/SURFACES.md
seg-1194bde1c9df = Source : <c1/>

# text
# c1: kshana::surface
seg-4d8a164605fb = Chaque capacité est disponible sur les surfaces où cela a un sens ; là où une surface ne peut pas porter une capacité, la cellule indique <b>N/A</b> et pourquoi. Le même moteur tourne derrière chaque surface : les points d'entrée Python, WebAssembly et MCP pour les capacités de la { "0.35" } sont de fines enveloppes autour de <c1/>, qui appelle le code qu'exécute la ligne de commande.

# text
seg-8a7389e86887 = Un passage nommant des clients d'IA tiers est omis ici ; il se trouve dans <a1>docs/SURFACES.md</a1> sur GitHub.

# text
seg-d18c05fd2838 = Extension

# text
seg-d78822583c64 = Notebook

# text
seg-334caeae9fba = Studio

# text
seg-00c6ee5bf2ea = Confiance du récepteur d'un navire, journal par lots (score de 0 à 100, raisons)

# text
# c1: /kshana-assess-receiver
# c2: vessel-receiver-trust
seg-b43593b3ede8 = <c1/>, skill <c2/>

# text
seg-6f33cfd0477e = Assess Receiver Trust

# text
seg-3d7149c8caba = Page de confiance maritime

# text
seg-892f8b2c1dc9 = Confiance du récepteur sur un extrait borné de flux (scores, états, raisons ; sans barrière)

# text
seg-e9f5fc58fe12 = idem

# text
seg-b3ff5c36ef39 = Assess Receiver Stream (un journal stocké)

# text
# c1: geometry
# c2: label
# c3: geometry
# c4: monitors_run
# c5: class
# c6: geometry_model
# c7: geometry_summary
seg-0b94fa406ab3 = Géométrie des satellites et classes de déduction ({ "0.36" } : <c1/> bonne/dégradée/inconnue avec raisons et DOP, un <c2/> bon/moyen/mauvais toujours rapporté, le moniteur <c3/> (rien à moins que la géométrie soit mauvaise, puis jusqu'à { "15" } points ; listé en dernier dans <c4/> lorsqu'il a décidé, de sorte que le nombre de moniteurs du verdict inclut la géométrie), un <c5/> sur chaque déduction, <c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: receiver-trust live
# c3: $PKSHT
seg-611550e6f227 = <c1/>, <c2/> (dans le JSON de résultats et dans chaque ligne JSON ; le CSV, le SVG, le verdict d'une ligne et <c3/> portent une déduction de géométrie comme toute autre et sont par ailleurs inchangés)

# text
# c1: receiver_trust::geometry
# c2: EpochTrust
# c3: Deduction
# c4: EpochReport
seg-863e12c6ef61 = <c1/>, sur <c2/>, <c3/> et <c4/>

# text
# c1: receiver_trust
# c2: assess_vessel_log
# c3: receiver_trust_replay
seg-4d764d29cebe = <c1/>, <c2/>, <c3/> (dans les dictionnaires renvoyés)

# text
seg-3e381a941742 = les trois mêmes (dans le JSON renvoyé)

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
# c4: geometry_model
# c5: geometry_summary
# c6: trust_telemetry
seg-8411558f9852 = <c1/>, <c2/>, <c3/> (dans la réponse ; la réponse d'un journal de navire conserve <c4/> et <c5/>) ; <c6/> l'affiche

# text
# c1: vessel-receiver-trust
# c2: trust-telemetry
seg-d397f9a330d2 = idem, skills <c1/>, <c2/>

# text
seg-95093013d169 = les actions ci-dessus affichent la sortie de la CLI, qui le porte

# text
# c1: vessel-trust-and-training
seg-f0bc22ec95d3 = <c1/> (dans le résultat qu'il charge)

# text
# c1: docs/MARITIME-TRUST.md
seg-86c0548edb03 = <b>en attente</b> : la page de confiance maritime ne l'affiche pas encore (champs listés dans <c1/>, point { "6" } de la vue Studio)

# text
# c1: receiver-trust live
# c2: --gate
# c3: --listen
seg-dffdbf379423 = <c1/> en tant que processus en cours d'exécution (stdin, fichier suivi, TCP, UDP, <c2/>, <c3/>)

# text
seg-bb4f68155884 = Outils : carte Ligne de commande (la commande à exécuter ; un navigateur n'est pas un processus du chemin de données)

# text
# c1: lab-attestation
seg-a783976420e6 = Paquet de preuves : création (signé, fenêtre d'un journal ; { "0.38" } : un <c1/> facultatif, la déclaration de l'opérateur sur une installation de laboratoire, consignée dans le manifeste signé, jamais vérifiée)

# text
seg-65826be9b437 = <b>N/A</b> (clé de signature)

# text
# c1: /kshana-evidence-pack
# c2: evidence-pack
seg-95395e63565d = <c1/>, skill <c2/>

# text
seg-cc9b1d83ed15 = Create Evidence Pack (pas de champ d'attestation dans la boîte de dialogue en { "0.38" } : <b>en attente</b> ; la ligne de commande l'accepte)

# text
seg-70534bdc6c87 = <b>N/A</b> (une clé de signature n'a pas sa place dans une page) ; Outils : carte Ligne de commande

# text
# c1: import
# c2: score
seg-83d9a9e9603a = Jammertest comme arbitre ({ "0.38" }) : le catalogue NPRA publié et le plan de transmission lus comme vérité programmée (<c1/>), un journal de récepteur noté par rapport à celle-ci pour chaque essai (<c2/> : latence de détection, manqués, fausses alarmes, temps de récupération ; MODELLED)

# text
# c1: /kshana-jammertest
# c2: jammertest
seg-38dcbafd214a = <c1/>, skill <c2/>

# text
seg-c61ff1d0f579 = <b>N/A</b> (exige les fichiers du plan et un journal sur disque ; à exécuter depuis un terminal)

# text
seg-5a9087e23823 = <b>N/A</b> (pas encore de notebook)

# text
seg-c92ea39fb2d1 = <b>en attente</b> : une carte Outils pour la ligne de commande (le bandeau et les vues du Studio relèvent de WS-A)

# text
# c1: jammertest score --key
# c2: config.json
seg-3eae6f848b58 = Paquet de note Jammertest signé (<c1/> : le paquet de preuves de confiance du récepteur avec la fiche de résultats et le calendrier à l'intérieur de <c2/>)

# text
# c1: create_evidence_pack
seg-f1695a89c33b = <b>N/A</b> (clé de signature : utilisez <c1/> sur une fenêtre, ou la ligne de commande)

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
seg-a3655f428a0c = Auto-déclaration du récepteur ({ "0.38" }) : UBX-NAV-STATUS <c1/> et UBX-SEC-SIG lus dans <c2/> à chaque époque, et la comparaison <c3/> (les deux / récepteur seul / Kshana seul / aucun) dans le résultat ; ne déclenche aucune alarme et ne change aucun score

# text
# c1: receiver-trust
# c2: jammertest score
seg-b0190b99d9fd = <c1/> (dans le JSON de résultats ; <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-70c1a825afa5 = <c1/>, <c2/> (dans les dictionnaires renvoyés)

# text
# c1: receiver_trust
seg-0cd306174106 = <c1/> (dans le JSON renvoyé)

# text
# c1: assess_receiver_log
seg-0b7d16c95d12 = <c1/> (dans la réponse)

# text
# c1: epochs[].self_report
seg-833ac4d6bded = <b>en attente</b> : le bandeau de la page Trust (WS-A ; le champ est <c1/>)

# text
seg-c56746c298f2 = Format de journal Septentrio SBF ({ "0.38" }, lecture seule : PVTGeodetic, MeasEpoch, RFStatus)

# text
# c1: receiver-trust
# c2: [log] format = "sbf"
seg-1f4c22e8bf78 = <c1/> avec <c2/>

# text
# c1: receiver_trust
# c2: assess_receiver_log
# c3: format = "sbf"
# c4: base64
seg-741ee07949d0 = <c1/>, <c2/> (<c3/>, journal en <c4/>)

# text
seg-003608556fc0 = idem

# text
seg-ae8bf32d890b = les actions ci-dessus

# text
seg-20f086cdea29 = <b>N/A</b> (le téléversement d'un journal binaire n'est pas proposé sur la page Trust en { "0.38" })

# text
# c1: receiver-trust live --serial <device> [--baud n]
# c2: --configure
seg-1303f81c2407 = <c1/> : un flux NMEA série ou USB, en lecture seule (ouvre le périphérique en lecture, n'écrit jamais dans le récepteur ; <c2/> est refusé)

# text
seg-59610023b124 = <b>N/A</b> (un périphérique et un processus)

# text
seg-1fcba825118e = Paquet de preuves : création (signé, fenêtre d'un journal)

# text
seg-fa4022137830 = Create Evidence Pack

# text
seg-e6b694a68935 = Paquet d'aller-retour de laboratoire (scénario, conditions d'essai, journal du récepteur et note liés par un hachage)

# text
seg-bfcfc5d28be8 = <b>N/A</b> (les actions JetBrains sont liées à un seul fichier sélectionné ; le paquet exige un scénario, des conditions, un journal et une clé : exécutez-le depuis le terminal de l'IDE)

# text
seg-7942dacc8476 = Paquet de preuves : vérification

# text
seg-93a0c989870b = Verify Evidence Pack (clé épinglée seulement)

# text
seg-bf617fa341c8 = Outils : paquets de preuves (vérifier, joindre un horodatage)

# text
# c1: format = "mqtt"
# c2: --mqtt-tcp
seg-49df5efbbd2b = Télémétrie de confiance (Prometheus, syslog CEF/LEEF, OTLP ; { "0.38" } : <c1/>, découverte Home Assistant et lignes d'état ; <c2/> publie depuis la CLI)

# text
# c1: trust_telemetry
seg-60d46f0e3ead = <c1/> (sortie texte ; pas de socket)

# text
# c1: /kshana-trust-telemetry
# c2: trust-telemetry
seg-45ee1c8b6f70 = <c1/>, skill <c2/>

# text
seg-9eff7c00723a = Render Trust Telemetry (un résultat stocké)

# text
seg-1b60ff4652cd = Outils : carte Télémétrie (onglet Ligne de commande ; formats seulement, pas de sockets)

# text
# c1: receiver-trust
# c2: rtklib-pos
# c3: novatel
# c4: gnss-sdr
# c5: [log.imu]
# c6: csv
# c7: euroc
seg-3e332170d963 = Entrées machine et capteur ({ "0.38" }) : <c1/> formats <c2/>, <c3/>, <c4/>, et <c5/> (<c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: [log] format
seg-060e5931ac62 = <c1/> (scénario <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-9dad5918cbf9 = <c1/>, <c2/> (en ligne)

# text
# c1: receiver_trust
seg-de4cb342c417 = <c1/> (en ligne)

# text
# c1: assess_receiver_log
# c2: path
seg-4b6a73f5dc13 = <c1/> (texte/base64 en ligne ; un <c2/> est refusé)

# text
seg-4c6056fb8884 = <b>N/A</b> (la page Trust du Studio lit les formats qu'elle liste ; les nouveaux formats suivront avec son prochain portage)

# text
# c1: [accel_classical]
seg-5d69867fc6f8 = Journal IMU vers paramètres de capteurs hybride/fusion (table <c1/> à partir d'un journal à l'arrêt, ajustement d'Allan)

# text
seg-426814dbf8dd = <b>N/A</b> (pas encore d'action d'IDE)

# text
seg-e8477119c213 = <b>N/A</b> (l'éditeur de scénarios du Studio accepte la table collée)

# text
# c1: trust-telemetry --mqtt-tcp
# c2: integrations/ros2
# c3: integrations/gnss-sdr
seg-7cacfab5931c = nœud ROS { "2" }, relais UDP GNSS-SDR, <c1/> (<c2/>, <c3/>)

# text
seg-70e2e895a01f = processus

# text
# c1: trust_telemetry
# c2: mqtt
seg-c1ad125a051e = <b>N/A</b> (processus de longue durée et sockets ; formes textuelles : <c1/> avec <c2/>)

# text
# c1: docs/OSNMA.md
seg-7527df567fc3 = Vérification Galileo OSNMA de pages I/NAV ou d'un flux UBX (<c1/>)

# text
seg-e5295f10cf3f = <b>N/A</b> (un long flux brut de récepteur convient à la CLI et à Python ; un outil d'agent ajouterait une surface d'entrée volumineuse sans bénéfice)

# text
# c1: kshana osnma verify
seg-32560c9024ff = <b>N/A</b> (les commandes de l'extension passent par le serveur MCP, qui n'a pas d'outil OSNMA pour la raison donnée dans la cellule MCP ; exécutez <c1/>)

# text
# c1: kshana osnma verify
seg-e4b399062eca = <b>N/A</b> (le résultat ne veut rien dire sans une racine de Merkle ou une clé publique de confiance obtenue de l'ICD par une autre voie et, pour la fraîcheur, un temps de référence indépendant ; une action du clic droit n'a nulle part où les prendre, et une valeur par défaut non épinglée se lirait comme une vérification ; exécutez <c1/>)

# text
seg-dac011642033 = <b>N/A</b> (un flux en entrée, un rapport JSON en sortie ; pas de notebook)

# text
seg-dbe4907cd74c = Outils : OSNMA

# text
seg-5ee6c4f68127 = NMEA d'entraînement avec un journal d'instructeur

# text
# c1: /kshana-training-scenario
# c2: training-nmea-scenario
seg-e321d52ad21d = <c1/>, skill <c2/>

# text
seg-79776273210a = Generate Training NMEA

# text
seg-899995619176 = Page de débriefing d'entraînement

# text
seg-9cb27f0adfb3 = NMEA d'entraînement diffusé vers une adresse TCP ou UDP

# text
seg-71e498158f5d = Outils : carte Ligne de commande (diffusion vers une adresse)

# text
seg-6a3b4cf33177 = Carte des interférences (ADS-B, AIS)

# text
# c1: /kshana-interference-map
# c2: interference-map-route-exposure
seg-3d7c2700cf7d = <c1/>, skill <c2/>

# text
seg-3740aafd1749 = Build Interference Map

# text
seg-b164d99daf08 = Page de la carte des interférences

# text
seg-81d53d4f3a11 = Route Exposure

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-c73605fe5e59 = Extension Signal K et flux de barrière pour OpenCPN (<c1/>)

# text
seg-10037d51a377 = <b>N/A</b> (processus)

# text
# c1: /kshana-marine-integrations
# c2: marine-integrations
seg-0360c13bb637 = guide pratique seulement : <c1/>, skill <c2/>

# text
seg-e3acebdb4cd0 = Outils : carte Ligne de commande (guide pratique ; un déploiement)

# text
seg-38fafad3482b = Export test bench (CSV de mouvement, NMEA, points de passage, événements pour un simulateur de laboratoire)

# text
# c1: /kshana-bench-export
# c2: test-bench-export
seg-ffe594484ff8 = <c1/>, skill <c2/>

# text
seg-af0be6bf84c7 = Export Test-Bench Files

# text
seg-e676bae4b98d = Outils : export test bench

# text
seg-394eee3f0c0f = Cartographie compliance à partir des exécutions (les lignes de cadres publics en faveur desquelles les exécutions apportent des éléments de preuve)

# text
# c1: /kshana-compliance-report
# c2: compliance-mapping
seg-c7782a49a50e = <c1/>, skill <c2/>

# text
seg-a97d66893e2c = Build Compliance Report

# text
seg-314d03d7d075 = Outils : cartographie compliance

# text
seg-02601f519c92 = Tables et sources de la cartographie compliance

# text
seg-31d29baca4c2 = Show Compliance Mapping

# text
seg-01418b04e9bf = Paquets de normes (ensembles de scénarios notés, avec des seuils fixés avant l'exécution : profils d'essai DHS RPCF, IMO MSC.1/Circ.1575, OACI Doc { "9849" } Appendice F)

# text
# c1: kshana standards-pack
seg-72ea3b5bf39d = <b>N/A</b> (les actions JetBrains sont liées à un fichier sélectionné ; les paquets sont intégrés et n'en demandent aucun : exécutez <c1/> depuis le terminal de l'IDE)

# text
seg-731504a1218f = <b>N/A</b> (les cartes Outils du Studio pour les paquets relèvent du chantier Studio ; la CLI ou la sortie de toute surface alimente la carte Cartographie compliance)

# text
# c1: docs/LUNANET-AFS.md
seg-ffab4fc439d9 = LunaNet Augmented Forward Signal : codes, SB1/CRC/entrelaceur, et une vérification par rapport à LSIS-AFS V1.0 (<c1/>)

# text
# c1: lunanet-afs-check
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: iq scene/acquire/track/sweep
seg-c348615fae6f = <c1/> ; signaux <c2/>, <c3/> dans <c4/>

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-a4f461bbd9fa = <c1/>, <c2/>, <c3/> ; <c4/> etc. avec les noms des deux signaux

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-3fddaefc42f4 = <c1/>, <c2/>, <c3/> ; <c4/> etc. par de courtes exécutions en mémoire

# text
# c1: kshana lunanet-afs-check
seg-338350a8097c = <b>N/A</b> (les actions JetBrains sont liées à un fichier sélectionné ; exécutez <c1/> depuis le terminal de l'IDE)

# text
seg-01a840e0bdc8 = <b>N/A</b> (une carte du Studio relève du chantier Studio ; la CLI et toutes les autres surfaces la portent)

# text
# c1: docs/SKYLINE.md
seg-d04d7f608263 = Géométrie du ciel sous une ligne d'horizon : satellites visibles et masqués, DOP, covariance ENU, ellipse d'erreur (<c1/>)

# text
# c1: /kshana-run
seg-9dfe4289533b = <c1/> (renvoie à l'outil)

# text
# c1: kshana sky
seg-f21f2810b363 = <b>N/A</b> (un diagramme du ciel interactif est une vue de navigateur ; <c1/> couvre les chiffres)

# text
seg-f923796dab30 = — (la vue Géométrie du Studio est ajoutée séparément dans la { "0.36" })

# text
seg-26c89146e670 = Nuage Monte Carlo du ciel (erreurs des moindres carrés avec graine, RMS, confinement à { "95" } %)

# text
seg-3627b76a3778 = <b>N/A</b> (des échantillons en masse qu'un agent devrait résumer, non transporter)

# text
seg-4ebfbca0614e = <b>N/A</b> (pas d'outil MCP)

# text
seg-8b6155019a17 = <b>N/A</b> (comme ci-dessus)

# text
seg-586e8d98ecd9 = — (comme ci-dessus)

# text
# c1: docs/SKYLINE.md
seg-ae43880fd2cc = Préréglages et profils de ligne d'horizon (<c1/>)

# text
seg-ad514737bf83 = Diagramme du ciel en SVG

# text
# c1: sky_geometry
seg-9a6087f458bc = <b>N/A</b> (un agent lit les chiffres dans <c1/>)

# text
# c1: [skyline]
# c2: user_site
seg-6de10d28a5fc = Section de ligne d'horizon dans un scénario (<c1/> : orbit et integrity avec <c2/>, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario)

# text
seg-65ffc53b15fa = le fichier de scénario

# text
seg-74fac0bacb76 = Run Kshana Scenario

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
seg-f71e5e2eb4f3 = Liaison optique de synchronisation temporelle à travers l'atmosphère : disponibilité par site, diversité de sites, techniques d'amélioration, couplage entre coupure et holdover (type de scénario <c1/> ; <c2/> ; MODELLED, sites ILLUSTRATIVE, à titre consultatif)

# text
seg-490147c5e7ec = <b>en attente</b> : pas encore de vue Studio ; le scénario s'exécute dans l'exécuteur de scénarios du Studio et dans la carte Outils Ligne de commande

# text
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-de2c788670aa = Essai de holdover noté à partir d'un enregistrement d'erreur de temps fourni par l'opérateur : référence de base, GNSS retiré par l'opérateur, holdover, récupération, mesurés par rapport aux gabarits de l'UIT-T (type de scénario <c1/> ; <c2/> ; MODELLED, à titre consultatif ; Kshana n'émet et ne pilote rien)

# text
# c1: run
# c2: samples
# c3: clock_log.text
seg-3fdb9a269cd0 = <c1/> (<c2/> ou <c3/> en ligne ; les clés de fichier sont refusées)

# text
# c1: run_scenario
seg-d946c75f821a = <c1/> (en ligne seulement)

# text
# c1: run
seg-b91e77ef7186 = <b>N/A</b> (pas de notebook en { "0.38" } ; les scénarios d'exemple s'exécutent dans n'importe quel notebook via <c1/>)

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-5041a1d6272f = Le GNSS au-delà de la constellation : disponibilité des signaux GPS, GLONASS, Galileo, BDS, QZSS et NavIC pour un utilisateur sur une coquille ou sur une trajectoire LEO vers transfert lunaire (livret, diagramme d'émission paramétrique ou mesuré, milieu à rayon rasant, conception de récepteur pour signaux faibles), un EKF GNSS embarqué pour les engins en orbite haute et en transfert lunaire, et navigation relative en formation (type de scénario <c1/> ; <c2/> ; MODELLED, à titre consultatif ; comparé au livret SSV de l'ICG sous un préenregistrement, <c3/>)

# text
# c1: run
# c2: transmit.pattern_text
seg-3e16823c1c90 = <c1/> (en ligne ; <c2/> porte un diagramme mesuré en ligne)

# text
# c1: run_scenario
# c2: transmit.pattern_csv
seg-126a59c992d9 = <c1/> (en ligne seulement ; <c2/> est refusé)

# text
# c1: run
seg-2010eb196565 = <b>N/A</b> (pas de notebook en { "0.38" } ; les scénarios s'exécutent dans n'importe quel notebook via <c1/>)

# text
# c1: lunar-infrastructure
# c2: study = ...
# c3: docs/LUNAR-INFRASTRUCTURE.md
seg-593b7761803d = Orbite et surface lunaires comme infrastructure de navigation et géodésique : cohérence de la détermination d'orbite, résolution de l'ambiguïté de phase de la porteuse, co-estimation du référentiel, liaison spatiale et sensibilité au nombre de Love (type de scénario <c1/>, <c2/> ; <c3/> ; MODELLED, entrées ILLUSTRATIVE, à titre consultatif)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-34ed7b4d59e4 = <c1/> (et les cinq exemples frères)

# text
# c1: run
seg-ba584b2da776 = <b>N/A</b> (pas de notebook ; les exemples s'exécutent dans n'importe quel notebook via <c1/>)

# text
seg-b5ae9f9fd5df = <b>en attente</b> : pas encore de vue Studio ; les scénarios s'exécutent dans l'exécuteur de scénarios du Studio et dans la carte Outils Ligne de commande

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
# c4: tracking
# c5: statistics
# c6: [clock_log]
# c7: [series.clock_log]
# c8: docs/CLOCK-LOG-FORMATS.md
seg-3103be5ffa0a = Journaux d'horloge mesurés lus sous forme de série de phase : linuxptp <c1/>, <c2/>, <c3/>, chrony <c4/> et <c5/>, à côté de RINEX clock, TimeLab et TICC (<c6/> / <c7/> ; <c8/> ; MODELLED, aucune référence indépendante ne compare une analyse à celle d'un autre lecteur)

# text
# c1: [clock_log]
seg-5b9d4cfbbbf7 = un scénario avec <c1/>

# text
# c1: run
# c2: text
seg-f0ac32797edb = <c1/> (<c2/> en ligne seulement ; pas de lecture de fichiers dans un navigateur)

# text
# c1: run_scenario
# c2: text
# c3: path
seg-bf0495255831 = <c1/> (<c2/> en ligne seulement ; <c3/> est refusé)

# text
seg-aa26d73d9b79 = <b>N/A</b> (pas de notebook ; un journal est un fichier fourni par l'utilisateur)

# text
seg-d1ebbe70e454 = <b>en attente</b> : pas de vue Studio ; l'exécuteur de scénarios du Studio accepte le texte du scénario

# text
# c1: /studio/optical/
seg-04edbdcaf5c7 = la vue PNT optique du Studio (<c1/>, { "0.38" }) trace les résultats enregistrés des deux scénarios fournis, y compris la série temporelle avec graine ; le scénario s'exécute aussi dans l'exécuteur de scénarios du Studio et dans la carte Outils Ligne de commande

# text
# c1: interference-map fetch-land
seg-dbe94c1cb4b0 = Téléchargement de polygones de terres (<c1/>)

# text
seg-d61b28df9367 = Code CLI

# text
# c1: --allow-network
seg-3c816222df90 = Outils : carte Ligne de commande (exige <c1/>)

# text
# c1: docs/BENCH.md
seg-858b2c4a1451 = Benchmark (kshana-bench v1 : noter une soumission par rapport à un fichier de vérité, page de classement ; <c1/>, MODELLED, à titre consultatif)

# text
seg-f6e2271206a6 = <b>N/A</b> (les deux outils MCP le portent ; une commande slash sur deux fichiers JSON n'apporte rien)

# text
seg-4edd4fe793f1 = <b>N/A</b> (pas une action d'IDE)

# text
seg-15ffa4639a46 = <b>N/A</b> (les notebooks pédagogiques relèvent d'un chantier distinct)

# text
# c1: bench/site/
seg-5d48d48ae295 = <b>N/A</b> (le classement est la page statique <c1/>, portée telle quelle sur le site ; le Studio ne calcule rien)

# text
# c1: bench truth|cases|baseline|seal|reveal-check|manifest|verify-manifest|validate
seg-f730ab44ca82 = Outils de données et de jeu réservé du benchmark (<c1/>)

# text
# c1: seal
seg-efdc66eff3d8 = <b>N/A</b> (la CLI lit des répertoires de jeux de données et des fichiers d'horloge et, pour <c1/>, un fichier de graine secret ; une graine ne doit pas transiter par un agent ou une page)

# text
# c1: interference-map daily|sensitivity
# c2: docs/observatory/METHOD.md
seg-2146297abaf0 = Produit quotidien de l'observatoire et étude de sensibilité (<c1/> ; <c2/>)

# text
seg-f359f5223666 = <b>N/A</b> (les commandes lisent un répertoire d'archives de centaines de milliers de fichiers, écrivent quatre fichiers dont un PNG, et imposent le délai de publication de { "24" } h par rapport à l'horloge de la machine qui publie ; la carte CSV figure sur toutes les surfaces à la ligne ci-dessus)

# text
# c1: trust/
# c2: training/
# c3: interference/
# c4: geometry/
# c5: lunar/
# c6: lunar-station-coverage
# c7: #osnma
# c8: #evidence
# c9: #bench
# c10: #compliance
# c11: #ai
# c12: —
seg-55cf42830155 = Kshana Studio est l'application web construite sur la version WebAssembly ; une vue du Studio existe donc là où la colonne WASM a un point d'entrée, et là où il n'y en a pas, la cellule renvoie à une <b>carte Ligne de commande</b> (la commande à exécuter, avec ses arguments), jamais à un résultat calculé par le Studio. Pages (kshana.dev/studio/, côté client) : <b>Confiance maritime</b> (<c1/>), <b>Débriefing d'entraînement</b> (<c2/>), <b>Carte des interférences</b> (<c3/>), <b>Géométrie</b> (<c4/> : un diagramme du ciel représentatif, une ligne d'horizon, le DOP, l'ellipse d'erreur et un nuage Monte Carlo issus du moteur ; { "0.36" }), <b>Station lunaire</b> (<c5/> : la couverture modélisée d'une station de référence lunaire issue du type de scénario <c6/> ; { "0.36" }) et la page <b>Outils</b>, dont les sections sont OSNMA (<c7/>), paquets de preuves (<c8/>), export test bench (<c9/>), cartographie compliance (<c10/>), l'onglet Ligne de commande (carte de télémétrie, IQ, intégrations marines : commandes à exécuter) et Utiliser depuis votre assistant IA (<c11/>). Un <c12/> dans la colonne Studio de la table des sous-commandes est une commande qui ne fait pas partie des capacités de la { "0.35" } que présente le Studio.

# text
seg-73006c42aef2 = Pourquoi les cellules N/A sont N/A

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-6d586f5fbaa3 = <b>Signal K et OpenCPN.</b> Ce sont des consommateurs du processus en direct en cours d'exécution et de sa barrière TCP ; ce sont donc des déploiements en ligne de commande ; l'extension apporte une commande de guide pratique et un skill qui renvoient à <c1/> et n'appellent aucun outil.

# text
seg-79ec7e7307da = Un processus en cours d'exécution.

# text
# c1: receiver-trust live
# c2: position
# c3: advisory
# c4: geometry
# c5: class
# c6: receiver-trust live
# c7: --replay
# c8: --udp <port>
# c9: --listen tcp:<port>
seg-17fcf959153f = <c1/> maintient un flux ouvert, peut servir le flux filtré par la barrière à un nombre quelconque de clients TCP et s'exécute jusqu'à son arrêt. Un appel Python, un appel navigateur, un appel d'outil MCP et une action d'IDE rendent chacun la main lorsqu'ils ont fini et ne maintiennent pas de socket ouvert pour d'autres. Python, WASM et MCP portent plutôt la forme bornée : un extrait noté par le même moteur, dans le schéma en direct (lignes JSON { "1.3" } : <c2/>, une déclaration <c3/> et la <c4/> des satellites à chaque époque, un <c5/> sur chaque déduction), sans socket et sans barrière (la barrière marque une position calculée comme invalide sur un flux en direct, ce que seul un processus du chemin de données peut faire). Deux comportements appartiennent au processus et ne figurent pas dans les outils d'extrait : un flux rejoué plus vite que le temps réel via <c6/> sans <c7/> est noté non fiable (son temps ne concorde pas avec l'horloge de l'hôte ; un extrait est lu sans horloge d'hôte), et <c8/> et <c9/> se lient à l'adresse de bouclage sauf si une adresse est donnée.

# text
# c1: trust_telemetry(input, format, host, input_kind, options_json)
# c2: trust_telemetry
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: trust-telemetry
# c6: kshana trust-telemetry --result session.result.json --print-metrics
# c7: TRUST-TELEMETRY.md
seg-824d2bbbf280 = <b>Télémétrie de confiance.</b> WASM porte <c1/> : les mêmes encodeurs, qui renvoient du texte Prometheus, des lignes syslog CEF ou LEEF, ou la charge utile JSON OTLP pour un flux ou un résultat par lots, sans horloge (les lignes syslog portent l'horodatage nul de la RFC { "5424" }) et sans rien envoyer. Python (<c2/>) et MCP (<c3/>, avec la commande d'extension <c4/>) la portent aussi. Le reste de <c5/> sert des métriques Prometheus, envoie du syslog et exporte de l'OpenTelemetry à partir d'un flux en cours, c'est donc un processus par nature. Guide pratique : redirigez la commande en direct vers elle, ou rejouez un fichier de résultats (<c6/>) ; voir <a1><c7/></a1>. Un agent ou un notebook qui veut les scores de chaque époque appelle plutôt les fonctions par lots ou d'extrait.

# text
# c1: evidence_verify
seg-a5c2ef208191 = <b>Créer un paquet dans le navigateur.</b> La signature exige une clé privée, qui ne doit pas transiter par une page web ; la version navigateur vérifie les paquets (<c1/>) et les autres surfaces les créent. L'outil MCP ne renvoie ni ne consigne jamais la graine de signature, et sans elle il signe avec une clé à usage unique (intégrité, non identité) ; pour une clé qui compte, utilisez la CLI. Il en va de même pour la diffusion de NMEA d'entraînement vers une adresse : Python, WASM et MCP renvoient le texte généré, et la CLI l'envoie.

# text
seg-dea93c47b3b1 = Suites d'études.

# text
# c1: --study <suite.toml>
# c2: run
# c3: run_scenario
# c4: run_all
seg-2e88bb410874 = <c1/> exécute un manifeste qui nomme des fichiers de scénario frères sur disque. Les surfaces en mémoire prennent du texte de scénario, et non un dossier de fichiers ; elles exécutent donc chaque membre comme un scénario (<c2/>, <c3/>, <c4/>).

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: iq extract
# c3: convert
# c4: decimate
# c5: iq labfit
# c6: iq conditions
seg-d08f585c4f02 = <b>L'IQ GNSS dans le navigateur, et les enregistrements réécrits.</b> Un enregistrement représente des gigaoctets d'échantillons, qu'une page ne peut pas contenir et que le protocole MCP ne doit pas transporter ; WASM n'a donc aucune fonction IQ, et les outils MCP ne lisent et n'écrivent que dans un seul répertoire de travail (<c1/>, avec un budget d'échantillons par appel). <c2/>, <c3/> et <c4/> existent pour réécrire des enregistrements sur disque et restent en ligne de commande uniquement. <c5/> et <c6/> portent du texte ; MCP les prend donc en ligne (un journal qui nomme un fichier est refusé).

# text
# c1: curl
# c2: --allow-network
# c3: curl
# c4: land_geojson
seg-f571dc5c2330 = <b>Le téléchargement des terres.</b> C'est la seule commande qui ouvre une connexion réseau ; elle exige le <c1/> du système et un <c2/> explicite, et elle vérifie un SHA-256 épinglé. Le navigateur n'a pas de <c3/>, et un agent d'IA ne devrait pas aller chercher des données pour le compte d'un utilisateur ; les autres surfaces prennent plutôt le fichier de terres sous forme de texte (<c4/>).

# text
seg-f81f6b6a2e67 = Archives et répertoires de traces.

# text
# c1: interference-map adsb
seg-2f226f3955d9 = <c1/> sur un répertoire de traces readsb lit des fichiers sur disque et n'existe qu'en ligne de commande ; les surfaces en mémoire prennent du texte CSV.

# text
seg-6fb9f23090ca = Chaque sous-commande de la ligne de commande, et qui la couvre

# text
# c1: kshana --help
seg-4a225d5d59af = Une ligne par sous-commande ou mode de <c1/>. <b>yes</b> nomme le point d'entrée ; <b>no</b> est une lacune avec sa raison ; <b>N/A</b> est une surface qui ne peut pas la porter, pour la raison donnée plus haut ou dans la dernière colonne. Les actions JetBrains exécutent la ligne de commande ; un <b>N/A</b> à cet endroit indique donc pourquoi il n'existe pas d'action d'IDE.

# text
seg-35720f38b1a5 = Sous-commande

# text
# c1: kshana <scenario.toml>
seg-d46c11fa6dea = <c1/> (exécution, graphique, table)

# text
# c1: error_kind
seg-af645810cc0c = <c1/> (une exécution lève une erreur sur un scénario invalide)

# text
seg-7d6c8218a4a6 = Validate Scenario

# text
seg-d75a5f64c7cc = <b>N/A</b> (nomme des fichiers frères sur disque)

# text
seg-16775dd25139 = Une suite nomme des fichiers de scénario frères sur disque (N/A plus haut) ; exécutez chaque membre comme un scénario

# text
seg-1742459cb792 = Export Scenario

# text
# c1: utf-8
seg-2bc957bd567b = Les fichiers reviennent sous forme de texte (<c1/>) ou de base64 (les échantillons SigMF)

# text
seg-bf69da729efd = Import Route

# text
seg-6d762f20af07 = Animate Scenario

# text
seg-052c13118454 = { "120" } images au plus par appel ; les séquences plus longues utilisent la CLI

# text
# c1: sky <request>
# c2: --monte-carlo
# c3: --svg
seg-5580a1a89bcb = <c1/> (ou options), <c2/>, <c3/>

# text
# c1: sky_geometry
seg-b96c18c1f157 = <c1/> (ni Monte Carlo, ni SVG)

# text
seg-5b62ca019ebd = <b>N/A</b> (voir la ligne de capacité)

# text
seg-4f7453d89d9d = Géométrie MODELLED ; sortie JSON ou SVG

# text
seg-c853beadb55e = Préréglages REPRESENTATIVE avec provenance

# text
seg-52638393d72d = List Scenario Kinds

# text
seg-69bc0d382eb7 = Insert Example Scenario

# text
# c1: python
# c2: wasm
seg-611dbcb5a15c = Les fonctionnalités <c1/> et <c2/> compilent le texte des exemples (environ { "0.7" } Mo)

# text
# c1: receiver-trust <scenario.toml>
seg-51e0c2c100f8 = <c1/> (par lots)

# text
# c1: receiver_trust_replay
seg-c9421c4d744f = extrait : <c1/>

# text
# c1: assess_vessel_stream
seg-6a2439967519 = extrait : <c1/>

# text
seg-efe5e5dbe710 = extrait

# text
# c1: --file
seg-816f9bd210d5 = Assess Receiver Stream (un journal stocké, <c1/>)

# text
seg-d81457d8f038 = Page de confiance maritime (extrait) ; carte Ligne de commande pour le processus

# text
seg-9cf210dd2301 = Un processus en cours d'exécution ; l'extrait n'a ni socket ni barrière (N/A plus haut)

# text
seg-315d0dcd39fb = Texte seulement sur toutes les surfaces, sans socket ; les exportateurs en cours d'exécution sont un processus (voir plus haut)

# text
seg-5c93482c9ae4 = Texte en entrée, JSON en sortie ; MODELLED

# text
seg-3763f34af33d = N/A (voir plus haut)

# text
# c1: --json
# c2: advisory
seg-4110fadc04db = Même JSON que <c1/>, avec l'avis indicatif dans son champ <c2/> ; la lecture du fichier devient des octets en mémoire. État d'authentification seulement : pas un service d'intégrité de la navigation, et aucune revendication de performance anti-leurrage

# text
# c1: receiver-trust evidence
seg-399524b468f3 = <c1/> (créer un paquet)

# text
seg-6dfc4b352892 = Outils : carte Ligne de commande (pas de clé de signature dans une page)

# text
seg-69dadb564662 = Pas de clé de signature dans un navigateur

# text
seg-fd26107fa3cd = <b>N/A</b> (terminal ; exige des fichiers)

# text
seg-38dc9c30191a = <b>en attente</b> : Outils : carte Ligne de commande

# text
# c1: --key
seg-57257e80468f = Le plan et le catalogue sont fournis sous forme de texte ; le paquet signé (<c1/>) n'existe qu'en ligne de commande (clé de signature)

# text
seg-3ea5db063974 = Pas de clé de signature dans un navigateur ; aucun signal n'est écrit ni rejoué

# text
seg-8b27a6ca1aef = <b>N/A</b> (une clé privée n'est jamais créée ni lue par l'extension)

# text
seg-dda21be14d64 = Outils : carte Ligne de commande

# text
seg-03376576d0b6 = Python renvoie la clé en mémoire avec un avertissement ; une clé privée ne doit pas transiter par une conversation ou une page

# text
seg-cd21674be5d7 = Attach Timestamp

# text
# c1: openssl ts -verify
seg-6c0caa6e1be2 = Jeton en octets ou en base64, paquet mis à jour renvoyé en mémoire ; la signature de l'autorité n'est pas vérifiée (<c1/>)

# text
seg-907eedb51849 = <b>N/A</b> (voir la note)

# text
seg-f70892a9f007 = Envoie à une adresse (N/A plus haut)

# text
# c1: interference-map adsb|ais
seg-76bcb50897c6 = <c1/> (CSV)

# text
# c1: interference-map adsb
seg-79f851a94048 = <c1/> (répertoire de traces)

# text
seg-d2cc933b6894 = Lit un répertoire (N/A plus haut)

# text
seg-316b51d83726 = Accès réseau (N/A plus haut)

# text
seg-b611fd739914 = Lit un répertoire d'archives et écrit des fichiers ; le délai de publication est imposé sur la machine qui publie (N/A plus haut)

# text
seg-96b313373128 = N/A (l'outil MCP le porte)

# text
seg-cb1fc7c162e3 = Texte en entrée, texte en sortie ; rien n'est lu ni écrit

# text
# c1: bench/site/
seg-5292a4966861 = la page statique <c1/>

# text
seg-839999463148 = Texte HTML

# text
seg-bb10d5a1eb50 = Fichiers de jeux de données et une graine secrète (N/A plus haut)

# text
seg-45bbda779645 = Renvoie du texte, n'écrit rien ; aucun signal

# text
seg-0e64b97b025b = <b>N/A</b> (les enregistrements pèsent des gigaoctets de fichiers ; voir la note)

# text
# c1: --format sdrx[:ci16_le]
# c2: .sdrx
# c3: format: "sdrx"
seg-7c9273837b73 = Les échantillons sont des fichiers. <c1/> (ou un chemin de sortie se terminant par <c2/>) écrit les métadonnées ION GNSS SDR à côté des échantillons : la CLI et MCP (<c3/>) les écrivent ; Python renvoie les échantillons en mémoire et n'écrit aucun fichier, de sorte que les métadonnées n'ont pas de forme Python (<b>N/A</b>)

# text
# c1: rows
# c2: tests
seg-4f1cc14c9af4 = Les scénarios sont intégrés ; pas de système de fichiers ; <c1/> et <c2/> impriment les tables de documentation versionnées et n'existent qu'en CLI

# text
seg-5de02dcfb151 = Les flux de symboles sont du texte de { "0" } et de { "1" }, { "4" } MiB au plus (MCP) ou { "100" } trames générées par appel ; LDPC et CRC-24Q des sous-trames { "2" } à { "4" } ne sont pas vérifiés ; aucun signal n'est écrit

# text
seg-db29ea94222b = Les échantillons sont des fichiers

# text
# c1: iq_labfit
seg-9b7afa156e9a = <c1/> (journaux en ligne, pas de fichiers)

# text
# c1: --follow [--idle-timeout <s>]
# c2: iq::io::follow::open_sigmf_follow
# c3: receiver-trust live
# c4: iq_monitor
seg-295fe0c63fe2 = <c1/> lit un enregistrement SigMF encore en cours d'écriture, en réception seulement (<c2/> en Rust) : <b>N/A</b> pour Python et MCP, parce qu'un appel qui attend la croissance d'un fichier ne rend pas la main quand le travail est fait, raison pour laquelle <c3/> n'existe lui aussi qu'en ligne de commande ; l'enregistrement à sa longueur actuelle passe par <c4/>

# text
# c1: iq_test_conditions
seg-e651dceda9b2 = <c1/> (texte, en ligne)

# text
seg-237bb76fae50 = L'inventaire d'un dossier relève de Python et de la CLI ; le serveur MCP lit un seul répertoire de travail

# text
seg-654781b74f2a = Elles réécrivent des enregistrements sur disque (N/A plus haut)

# text
# c1: iq --help
seg-6a010403db35 = la liste des signaux (<c1/>)

# text
# c1: kshana iq --help
seg-1154d82301ca = <b>N/A</b> (une liste ; exécutez <c1/>)

# text
seg-8c90b8cb2e78 = Fonctions utilitaires

# text
seg-3d9ac26ec730 = De petits points d'entrée qui ne sont pas une ligne de capacité, et où chacun se trouve :

# text
# c1: kshana.version()
# c2: kshana.__version__
# c3: version
# c4: --version
seg-b8c43ffb2a13 = Python (<c1/>, <c2/>), WASM (<c3/>), CLI (<c4/>), MCP (les informations du serveur)

# text
seg-3f32bbece220 = La version du moteur

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: iq_*
seg-d5fb77719df2 = Lit un fichier binaire <c1/> qu'a écrit <c2/>. <b>N/A</b> ailleurs : il lit un fichier sur disque (WASM n'a pas de système de fichiers, MCP ne lit qu'un seul répertoire de travail, par les outils <c3/>)

# text
# c1: ?s=
seg-57ef8e3fe6bc = Le codec de lien de partage <c1/> du bac à sable du navigateur (TOML de scénario vers un jeton sûr pour les URL, et inversement). <b>N/A</b> ailleurs : un lien vers une page web n'a pas de sens pour une ligne de commande, un appel Python ou un agent

# text
seg-bd6e451f5cdf = Limites qui diffèrent selon la surface

# text
seg-8f3e8345d90d = Limite d'entrée

# text
seg-4b5abdf098e3 = Fichiers

# text
seg-1910f2cef7da = { "4" } MiB par entrée texte ({ "2" } MiB et { "20,000" } époques pour un extrait de flux) ; les réponses portent au plus { "2000" } lignes NMEA, { "200" } lignes d'époques non nominales et { "4" } MiB de fichiers GeoJSON ou de paquets

# text
# c1: iq_*
seg-116e2d0202f4 = contenu en ligne seulement : un champ de scénario qui nomme un fichier est refusé ; les outils <c1/> utilisent un unique répertoire de travail activé sur option, chaque chemin y étant confiné

# text
# c1: --http
seg-ee5e8de88144 = MCP sur HTTP (<c1/>, auto-hébergé)

# text
seg-f095909e9feb = comme MCP, avec un corps de requête de { "5" } MiB, { "120" } s par requête et { "8" } requêtes simultanées par défaut

# text
# c1: iq_*
seg-95d4ab7863e6 = aucun : les outils de fichiers <c1/> sont désactivés ; tout autre outil prend du contenu en ligne

# text
seg-a8b290453c39 = Python, Rust

# text
seg-3df89722db78 = { "64" } MiB par entrée texte

# text
# c1: receiver_trust
# c2: path
seg-00acf8b1ff29 = <c1/> peut nommer un <c2/> que le processus peut lire

# text
seg-cf23db887749 = { "64" } MiB par entrée texte, dans la mémoire propre du navigateur

# text
seg-e38059970288 = aucun : le navigateur n'a pas de système de fichiers, rien n'est téléversé

# text
seg-241399edb372 = Niveaux de preuve et réserves sur chaque surface

# text
seg-b3307ae773f7 = Un paquet de preuves est un <b>enregistrement technique</b> de ce que le moteur a calculé à partir d'un journal sous des réglages déclarés, avec chaque hachage et une signature par-dessus. Ce n'est ni un avis juridique, ni la constatation d'un fait sur un événement quelconque, ni une approbation. Un succès de la vérification dit que l'enregistrement est inchangé ; sans clé publique de confiance, il ne prouve que l'intégrité par rapport à la clé que le paquet nomme lui-même.

# text
seg-0d8ed8b92a00 = Les moniteurs de confiance du récepteur et le score de confiance sont <b>MODELLED</b> : les seuils sont des entrées déclarées et rien n'affirme comment ils se comportent face à de véritables interférences. La sortie est <b>indicative</b> ; Kshana n'est pas un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) et l'opérateur reste responsable. Un score élevé n'est pas la preuve d'une position calculée authentique.

# text
seg-606127880e96 = La carte des interférences est <b>MODELLED</b> (seuils préenregistrés, non validés par rapport à une mesure de vérité terrain). Une cellule dégradée n'identifie pas l'interférence comme cause ; une cellule non observée n'est pas la preuve d'un itinéraire dégagé ; elle décrit des signalements passés et n'est pas une prévision. Elle est agrégée seulement : aucun identifiant n'est renvoyé.

# text
seg-b2fd2a05842f = Le NMEA d'entraînement est <b>du texte seulement</b> : aucune RF, aucun IQ ni aucune forme d'onde n'est synthétisé, rien n'est transmis, et il n'est jamais destiné aux systèmes de navigation en service d'un navire.

# text
seg-4e3bbacda9ac = <s1>Précédent</s1>Utiliser Kshana depuis un agent

# text
seg-c5fbfab85e01 = <s1>Suivant</s1>Extension JetBrains
