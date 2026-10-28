# docs--changelog: translations (fr)

# text
seg-9a2a5f0a8a02 = Système solaire

# text
seg-20db2c79b998 = Validé

# text
seg-a20b4a6e8f53 = horloge atomique à l'échelle de la puce

# text
seg-49a994d77d2f = oscillateur à quartz compensé en température

# text
seg-2247a2344710 = Signification

# text
seg-5770537524d3 = Domaine

# text
# c1: CHANGELOG.md
seg-40d4fc0d3922 = Source : <c1/>

# text
seg-7333b85d448f = Toutes les modifications notables de Kshana sont documentées ici.

# text
seg-bbc8f38627f1 = Le format s'appuie sur <a1>Keep a Changelog</a1>, et ce projet adhère à <a2>Semantic Versioning</a2>. Tant que le projet est en version antérieure à 1.0, le schéma public des scénarios et des résultats peut encore changer ; les ruptures de compatibilité sont signalées explicitement.

# text
seg-985f7b4c001a = Non publié

# text
seg-a2f583aadd0b = Aucune nouvelle fonctionnalité : une correction de ligne de commande, des mises à jour de dépendances dans l'outillage de validation croisée, et de la documentation. Les résultats du moteur sont inchangés par rapport à { "0.38.0" }.

# text
seg-c9a8a5898ced = Corrigé

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = La ligne de commande se termine silencieusement avec le statut { "141" } lorsque sa sortie standard se ferme (<c1/>), au lieu de paniquer avec « failed printing to stdout: Broken pipe ». { "141" } vaut { "128" } plus SIGPIPE, le statut qu'un shell rapporte pour <c2/>. Seul un tube fermé est géré : un disque plein ou toute autre erreur d'écriture se signale toujours, et un flux en direct écrivant dans un socket fermé reçoit toujours son erreur d'écriture. <c3/> ferme le lecteur avant le démarrage du programme, de sorte que la première écriture échoue à chaque exécution.

# text
# c1: xval/
seg-2a47e785cc1d = Mises à jour de dépendances dans l'outillage de validation croisée (<c1/>) ; aucun changement de crate, de wheel ou de paquet livré.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } vers { "0.9.11" } (RUSTSEC-2026-0186) dans les verrous de vérification croisée ANISE (<c2/>, <c3/>) ; les verrous resynchronisent aussi la dépendance de chemin <c4/> du dépôt.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } vers { "13.0.0" } et <c2/> { "2026.7.22" } vers { "2026.10.19" } dans les épinglages de l'environnement des références indépendantes (<c3/>, <c4/>) : les versions corrigées pour huit avis de sécurité de pillow et un avis de certifi.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, le README et ce fichier listent chaque seuil de kshana-bench qui est NOT MET, tel qu'enregistré dans <c2/> : <b>A2</b> (AUC de <c3/> { "0.766" } contre au moins { "0.80" } sur la partition de test), <b>D1</b> (plus grand écart { "0.0301" }) et <b>tâche (b) R1</b> (reporté, non ré-exécuté). Aucun seuil n'est assoupli.

# text
# c1: docs/kinds/by-kind/
# c2: docs/KINDS.md
# c3: docs/COMMANDS.md
# c4: docs/ALL-SURFACES.md
# c5: docs/CAPABILITY-DOMAINS.md
# c6: tools/gen_kinds_index.py
# c7: tools/gen_readme_blocks.py
# c8: tools/gen_figures_038.py
# c9: tools/readme_audit.py
# c10: tests/readme_completeness_doc_sync.rs
seg-44d9c9622c24 = Passe de complétude du README : une table des matières ; les types de scénario classés par familles, chacun avec une page sous <c1/> (la description et les champs du moteur, les entrées et résultats d'une exécution d'exemple, les lignes du registre et les références indépendantes, les limites que le rapport de l'exécution énonce, et le graphique que le moteur écrit), une planche-contact par famille, le tout indexé par <c2/> ; chaque commande dans <c3/> ; chaque surface, commande de greffon, compétence et page Studio dans <c4/> ; chaque domaine de capacité dans <c5/> ; des diagrammes Mermaid intégrés (vue d'ensemble du système, surfaces, boucle interne, confiance du récepteur, aller-retour de laboratoire, Studio, flux de test et de publication, carte des modules, distribution). Écrit par <c6/>, <c7/> et <c8/> ; audité par <c9/> ; protégé par <c10/>, qui épingle aussi la description et les champs de chaque entrée au moteur.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/> : rend un diagramme Mermaid en SVG et en PNG sous Linux et met à jour l'enregistrement de rendu.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README : les figures de l'utilisateur de l'espace et de la Lune utilisaient des chemins relatifs à <c1/>, de sorte qu'elles ne se chargeaient pas depuis le README ; un lien pointait vers <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Suppression de deux fichiers de graphiques périmés copiés à la main (<c1/>, <c2/>) qu'aucune page n'utilisait et qui ne correspondaient plus au moteur ; <c3/> porte les graphiques à jour.

# text
seg-033d52126d8a = Ajouté

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>Le GNSS au-delà de la constellation (<c1/>).</b> Un nouveau type de scénario pour les engins spatiaux au-dessus, autour et au-delà des orbites GNSS (<a1><c2/></a1>) : disponibilité d'un et de quatre signaux, durées d'interruption, C/N0, DOP et liaisons par lobe principal par rapport aux lobes secondaires pour GPS, GLONASS, Galileo, BDS, QZSS et NavIC sur une coquille ou le long de trajectoires LEO, MEO, GEO, HEO et de transfert lunaire ; diagrammes d'émission du livret, paramétriques ou fournis par l'utilisateur ; un modèle d'ionosphère, de plasmasphère et d'atmosphère par rayon rasant ; une conception de récepteur pour signaux faibles ; un filtre de Kalman étendu GNSS embarqué pour l'HEO et le transfert lunaire ; et la navigation relative en formation. Comparé au livret du volume de service spatial de l'ICG sous un préenregistrement commité avant l'exécution : les constantes de puissance rayonnée minimale et le seuil lunaire concordent, les autres seuils ne sont pas atteints selon la lecture préenregistrée (presque tous à cause de l'angle de faisceau GLONASS incohérent du livret), et le substitut paramétrique des lobes secondaires ne reproduit pas les diagrammes mesurés des panneaux GPS. Tout reste MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Orbite et surface lunaires comme infrastructure de navigation et de géodésie (<c1/>).</b> Un nouveau type de scénario avec cinq études sélectionnées par <c2/> (<a1><c3/></a1>) : cohérence d'une détermination d'orbite embarquée par GNSS terrestre sur une orbite de halo quasi rectiligne par rapport à une détermination indépendante au sol de distance et de vitesse radiale ; phase de la porteuse en double différence conjointe d'une station de surface et d'un orbiteur avec fixation des ambiguïtés entières par LAMBDA ; information de Fisher du datum lunaire à sept paramètres avec et sans mesures de distance orbiteur-surface ; décalages inter-techniques GNSS, VLBI et télémétrie laser par rapport au lien local ; et sensibilité à h2, k2, l2 et à la libration physique. MODELLED, avec des entrées ILLUSTRATIVE : les calculs sont vérifiés par rapport à des programmes numpy et scipy indépendants, et rien n'est comparé à une mesure d'une grandeur lunaire. Les seuils ont été fixés dans <c4/> et deux amendements divulgués. Trois sont NOT MET et chacun est épinglé par un test qui affirme l'écart : C3 (une erreur de force injectée n'est pas détectée au taux préenregistré), Q3 (le taux de réussite par rééchantillonnage diffère de la référence numpy de { "1.7e-6" } pour un seuil de { "1e-9" }, du fait de l'approximation de la fonction de répartition normale de LAMBDA), et la moitié trace de G3 (ajouter une famille de mesures de distance ne diminue pas toujours la trace de la pseudo-inverse). Les autres sont atteints (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Un sixième article dans le tableau Recherche.</b> « Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever » (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) montre que la dilution de précision n'est pas définie pour un suivi cislunaire par mesures de distance seules et utilise à la place le gramien d'observabilité sur quatre orbites rétrogrades distantes planes : les mesures de distance seules donnent un rang { "2" } sur { "4" } à un instant donné et exigent un arc d'environ { "2.09" } h, la vitesse radiale (Doppler) donne le rang { "4" } instantanément, et l'estimation conjointe d'une station avec les états des satellites et les horloges reste déficiente en rang d'une unité sans observable interférométrique externe. Ses nombres sont régénérés par le type de scénario <c1/> (<c2/>) ; <c3/> teste le seuil avec un estimateur indépendant. La carte de recherche du README, les README des crates, de npm et de PyPI, ainsi que le générateur la portent.

# text
seg-d74a1b2dcb38 = L'arbitre neutre, rendu mesurable.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> lit le catalogue d'essais et le plan de transmission NPRA Jammertest publiés comme vérité planifiée (identifiants du catalogue conservés) et <c2/> note un journal de récepteur par rapport à celui-ci, par essai (latence de détection, alarmes manquées, fausses alarmes, délai de rétablissement), éventuellement sous forme de paquet de preuves signé (<a1><c3/></a1>). Les seuils de notation ont été préenregistrés avant toute exécution notée (<c4/>). Sur le jeu de données JammerTest { "2024" } (récupéré, jamais intégré au dépôt), la règle préenregistrée de quantité minimale de données a échoué à la fois lors de la première exécution et lors de la révision du traitement des données, de sorte qu'aucun seuil n'est évaluable et que rien n'est revendiqué ; les deux exécutions sont consignées et épinglées. MODELLED : le calendrier est constitué des fenêtres journalisées du jeu de données, et non d'heures d'émission enregistrées. Le jeu NMEA SimulaMet de { "2025" } n'est pas adapté (aucune licence indiquée sur sa page).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Les propres indicateurs du récepteur, à côté de ceux de Kshana.</b> UBX-NAV-STATUS <c1/> et UBX-SEC-SIG sont lus dans <c2/> à chaque époque, et la comparaison <c3/> dans le résultat les met en regard des moniteurs de Kshana (les deux, récepteur seul, Kshana seul, aucun) ; elle ne déclenche aucune alarme et ne modifie aucun score. Un lecteur SBF Septentrio (PVTGeodetic, MeasEpoch, RFStatus, en lecture seule, sur la crate <c4/> sous licence MIT) et <c5/> (un flux NMEA série ou USB, en lecture seule ; il n'écrit jamais dans un récepteur) s'y ajoutent.

# text
# c1: docs/TIMING-HIL.md
# c2: docs/HARDWARE-SAFETY.md
# c3: holdover-test
# c4: clock_log
# c5: ptp4l
# c6: phc2sys
# c7: ts2phc
# c8: tracking
# c9: statistics
# c10: iq scene --format sdrx
# c11: iq monitor --follow
# c12: compliance-report
# c13: lab-attestation
# c14: HARDWARE-SAFETY.md
seg-90d9927fe3e2 = <b>Synchronisation temporelle et sécurité du matériel</b> (<a1><c1/></a1>, <a2><c2/></a2>). Le type de scénario <c3/> note un essai de holdover d'un système de synchronisation temporelle (GNSS retiré par l'opérateur, holdover, rétablissement) à partir d'un enregistrement mesuré de l'erreur de temps, mesuré par rapport aux gabarits de l'ITU-T issus de tables publiques. <c4/> lit les journaux de linuxptp (<c5/>, <c6/>, <c7/>) et de chrony (<c8/>, <c9/>). <c10/> écrit des métadonnées ION GNSS SDR et <c11/> surveille un enregistrement SigMF pendant qu'il s'allonge (réception seule). <c12/> gagne le profil PNT fondamental NIST IR 8323r1 ({ "15" } lignes paraphrasées, apporte des éléments de preuve en faveur de). Un paquet de preuves peut consigner la <c13/> de l'opérateur dans son manifeste signé, jamais vérifiée ; les étapes matérielles { "0" } à { "4" } et les notes juridiques figurent dans <c14/> (en attente de relecture juridique). Il n'existe aucun chemin d'émission d'aucune sorte.

# text
# c1: kshana bench
# c2: bench/SPEC.md
# c3: docs/BENCH.md
# c4: xval/bench/PREREGISTRATION.md
# c5: agc_k_sigma
# c6: xval/bench/RESULTS-v2.md
# c7: bench_score
# c8: bench_leaderboard
# c9: score_benchmark
# c10: render_leaderboard
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>) : tâches, partitions et métriques fixes pour la détection d'interférences GNSS sur des journaux de récepteur (JammerTest { "2024" }) et en IQ, la prédiction du holdover de synchronisation temporelle (horloges IGS) et l'écart d'optimisme hors distribution ; manifestes de partitions avec hachages épinglés et scripts de récupération (aucune donnée intégrée au dépôt), un jeu réservé scellé par engagement puis révélation, un schéma de fichier de résultats et une page de classement statique. Références de base sous des seuils préenregistrés dans <c4/> : seuils du calcul de score atteints, C1 à C3 atteints, D2 atteint ; <b>A2 NOT MET</b> (AUC de <c5/> { "0.766" } contre au moins { "0.80" } sur la partition de test), <b>D1 NOT MET</b> (plus grand écart { "0.0301" }) et <b>tâche (b) R1 NOT MET</b> (reporté, non ré-exécuté), chacun épinglé (<c6/>). Chaque score est MODELLED. Python <c7/>, <c8/> ; WebAssembly de même ; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Observatoire des interférences</b> (<c1/>, <c2/>, <a1><c3/></a1>) : un GeoJSON quotidien reproductible, un PNG et un JSON de rapport d'incident avec trois états (dégradé, non dégradé, non observé), un délai minimum de { "24" } h, des cellules de { "0.5" } degré ou plus grossières, aucune cause attribuée et des données OpenSky refusées ; une étude de sensibilité des paramètres préenregistrés ; un catalogue rétrospectif de 30 jours sur la Baltique issu d'adsb.lol.

# text
# c1: receiver-trust
# c2: docs/MACHINE-INPUTS.md
# c3: [log] format
# c4: rtklib-pos
# c5: .pos
# c6: novatel
# c7: BESTPOS
# c8: RANGE
# c9: RXSTATUS
# c10: self_report
# c11: receiver-self-report
# c12: rtcm3
# c13: NOTICE
# c14: gnss-sdr
# c15: integrations/gnss-sdr/relay.py
seg-497ae18bfb03 = <b>Entrées de machines et de capteurs pour <c1/></b> (<a1><c2/></a1>). Nouvelles valeurs <c3/>, toutes en lecture seule, MODELLED, avec des fixtures écrites par nous et aucune donnée intégrée au dépôt : <c4/> (fichiers de solution RTKLIB <c5/>), <c6/> (<c7/> OEM7 ASCII et binaire, C/No <c8/> et <c9/> ; l'indicateur de brouilleur du récepteur devient le <c10/> de l'époque, mis en regard des alarmes de Kshana par la comparaison <c11/>), <c12/> (C/N0 MSM4 et MSM7 pour GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou et NavIC ; dispositions tirées des tables pyrtcm sous licence BSD, dont l'avis figure dans <c13/>, et non de la norme RTCM) et <c14/> (messages GNSS-SDR Monitor et PVT-monitor en lignes JSON, relayés par <c15/>).

# text
seg-22e8b434782f = Les journaux IMU comme second capteur.

# text
# c1: [log.imu]
# c2: csv
# c3: euroc
# c4: heading-course
# c5: kshana imu-fit
# c6: imu_fit
# c7: imu_fit
# c8: fit_imu_log
# c9: /kshana-fit-imu
# c10: hybrid
# c11: fusion
# c12: [accel_classical]
seg-5491196d6421 = <c1/> (<c2/> ou <c3/>) intègre la vitesse de lacet du gyromètre en le cap que lit le moniteur <c4/> ; en ligne sur chaque surface et transporté dans les paquets de preuves. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, greffon <c9/>, une action JetBrains) ajuste les paramètres de l'accéléromètre et du gyromètre des scénarios <c10/> et <c11/> à partir d'un journal à l'arrêt par déviation d'Allan et imprime une table <c12/> avec le SHA-256 du journal dans sa provenance.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Intégrations :</b> un paquet ROS { "2" } (<c1/> : NavSatFix et <c2/> en entrée, topics de confiance en sortie ; sa passerelle sans ROS est testée avec le vrai moteur, le nœud lui-même n'a pas été exécuté sur un graphe ROS en direct), une passerelle <c3/> (<c4/>, dépendance MIT, optionnelle), et un relais GNSS-SDR.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Exportateur MQTT Home Assistant</b> pour la télémétrie de confiance : <c1/> et <c2/> (messages de découverte et document d'état JSON ; publication seulement, sans identifiants ni TLS), et <c3/> en texte sous Python, WebAssembly et MCP.

# text
seg-f1cb2c2881c9 = Sept lignes MODELLED du registre pour ce qui précède. Rien ici n'est VALIDATED : aucune capture d'un vrai récepteur, d'une vraie station de base, d'une IMU, d'une exécution de GNSS-SDR, d'un graphe ROS ou d'un courtier MQTT n'a été lue.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Marge de liaison optique en fonction du temps.</b> Le type de scénario <c1/> accepte une table <c2/> optionnelle (<c3/>, <c4/>, <c5/>) et écrit alors aussi, par site, une réalisation à germe fixé du modèle de site énoncé dans le temps : épisodes nuageux, une colonne d'eau liquide par épisode, un échantillon de scintillation gamma-gamma par pas, et à partir de ceux-ci la marge de liaison, les évanouissements dus aux nuages et à la scintillation et l'indicateur de liaison active, avec la disponibilité réalisée, la fraction nuageuse, le nombre d'interruptions et la plus longue interruption. MODELLED (un tirage du modèle, et non le climat ; aucune référence externe indépendante). Sans la table, le résultat est le document { "0.37" }. Les deux scénarios optiques fournis portent la table ({ "336" } h, { "600" } s, germe { "37" }). Seuils préenregistrés dans <c6/> avant la première exécution.

# text
seg-78524dbb3bd2 = Spécification des conditions d'essai et aller-retour de laboratoire.

# text
# c1: kshana.test-conditions/1
# c2: docs/spec/TEST-CONDITIONS.md
# c3: recording.kind = "receiver-log"
# c4: kshana bench-export
# c5: <base>.conditions.json
# c6: kshana evidence round-trip
# c7: evidence_round_trip
# c8: create_round_trip_pack
# c9: /kshana-evidence-pack
seg-fbf034925641 = <c1/> est publié sous <a1><c2/></a1> avec un schéma JSON, et gagne <c3/>. <c4/> écrit aussi <c5/>. <c6/> construit un paquet signé reliant le hachage du scénario, le hachage des conditions énoncées, le hachage du journal du récepteur et le score par rapport aux événements énoncés, et refuse des conditions en désaccord avec les événements de notation. Exemple traité avec gps-sdr-sim écrivant seulement un fichier ; la relecture est de la responsabilité de l'opérateur et n'est jamais automatisée. Python <c7/>, MCP <c8/>, greffon <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Paquets de normes</b> (<c1/>, <c2/>) : les profils d'essai du cadre DHS Resilient PNT pour les niveaux { "1" } à { "4" }, les niveaux de précision et l'évaluation de l'intégrité de l'IMO MSC.1/Circ.1575, et surveiller, évaluer et atténuer de l'ICAO Doc { "9849" } Appendix F, chacun étant un ensemble de scénarios notés par rapport à des seuils énoncés avant l'exécution, avec les lignes compliance-report en faveur desquelles ils apportent des éléments de preuve. Les écarts sont consignés et épinglés : DHS L4-T1 et les quatre essais de précision de l'IMO. Le Doc { "9849" } lui-même n'a pas été lu (payant) ; le paquet ICAO suit la propre présentation du plan d'atténuation des RFI de l'ICAO. <c3/> gagne une section de paquets de normes. Tous MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>Signal avant augmenté LunaNet</b> (<c1/>) : codes de Gold AFS-I et de Weil AFS-Q pour les PRN { "1" } à { "210" }, signaux <c2/> et <c3/> dans <c4/>, le code SB1 BCH, le CRC-24Q et l'entrelaceur, et <c5/> (<c6/>, <c7/>, <c8/>), épinglé sur LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } janvier { "2025" }). Codes VALIDATED par rapport aux tables imprimées du document (qu'il marque TBC) ; une colonne tertiaire imprimée (PRN { "147" }) est probablement une coquille et l'écart est épinglé. Le codage LDPC des sous-trames { "2" } à { "4" } n'est pas implémenté.

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Carnets du cours</b> (<c1/>) : brouillage, leurrage, holdover, intégrité, OSNMA et carte d'interférence, chacun avec des exercices.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>Étude de l'URA maximale du jalon { "3" } ARAIM du WG-C UE-États-Unis</b> (<c1/>, <c2/>), remplaçant le plan retiré « Table A-3 » ; MODELLED avec des écarts déclarés.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Brouillons pour approbation du propriétaire</b> sous <c1/> : article JOSS, amendement de la charte du TSC, processus de registre des références indépendantes et une proposition de scission de <c2/>. Rien de cela n'est adopté.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Vues Studio pour les fonctionnalités de la { "0.38" }</b> (kshana.dev/studio/). Relecture de passerelle (deux exécutions synthétiques sur une même horloge : trace, score de confiance, les satellites que le journal entend et le verdict, avec les propres indicateurs du récepteur à côté des alarmes de Kshana) ; PNT optique (les deux scénarios <c1/>, avec une réalisation <c2/> à germe fixé optionnelle, MODELLED) ; essai de holdover (le résultat <c3/> mesuré par rapport aux gabarits de l'ITU-T, tracé à partir du propre <c4/> du résultat) ; une visionneuse de l'observatoire des interférences qui ouvre les fichiers que vous avez produits et n'en fournit aucun ; dans la page Outils, un calcul de score Jammertest, un ajustement IMU et MQTT comme format de télémétrie ; et dans Confiance un sélecteur de format de journal (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) avec un fichier IMU optionnel. Chaque vue lit des fichiers dans le navigateur et ne téléverse rien ; chaque chiffre conserve l'étiquette que le registre lui attribue, et chacune porte l'énoncé à titre consultatif. La page de site <c6/> affiche le fragment <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Issue #36 : couches d'épinglage exactes à l'octet.</b> Les couches d'épinglage exactes à l'octet ne s'exécutent que sur un hôte déclaré comme référence de base (<c1/>, défini par <c2/>), et non sur chaque Mac Apple silicon, parce que la bibliothèque mathématique d'Apple diffère d'une version de macOS à l'autre ; la couche portable s'exécute partout, et <c3/> empêche qu'une couche exacte à l'octet soit de nouveau conditionnée par la seule plateforme. Les comparaisons avec les références indépendantes elles-mêmes réussissent sur macOS. Aucune valeur littérale n'a été reprise et aucune tolérance n'a changé. <c4/> et <a1><c5/></a1> indiquent comment trier une différence ; <c6/> est un diagnostic manuel et hebdomadaire, et non une barrière.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL : un motif non ancré dans l'assistant d'ouverture de confiance du Studio</b> correspond désormais à l'en-tête entier (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI : disque du runner.</b> Le job <c1/> construit les profils de développement et de test sans informations de débogage, de sorte que l'édition de liens ne remplit plus le disque.

# text
seg-38c59868835e = <b>Garde-fous de sources.</b> Chaque fichier source qui contient des fixtures de test porteuses d'épinglages déclare sa portée d'épinglage, et les tests qui écrivent des fichiers temporaires utilisent un chemin unique par appel, de sorte que les exécutions parallèles ne peuvent pas entrer en collision.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> est régénéré pour le champ optionnel <c2/> d'optical-atmosphere.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>Greffon JetBrains : aucun usage d'API de plateforme obsolète ou prévue pour suppression.</b> L'IntelliJ Plugin Verifier (<c1/>) sur IntelliJ IDEA build { "263" } ({ "2026.3" } : { "263.6800.24" } et { "263.7031.23" }) a trouvé un appel obsolète, <c2/>, dans Insert Example ; il ouvre désormais le nouveau fichier avec <c3/>. Le greffon est compatible avec { "2024.3" } (le since-build, inchangé) et les deux builds { "263" }, et sans avertissement sur ceux-ci. La CI exécute désormais <c4/> et échoue sur les problèmes de compatibilité et sur tout usage d'une API prévue pour suppression.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>PNT optique à travers l'atmosphère</b> (type de scénario <c1/>, <a1><c2/></a1>, note de conception <c3/>). Pour une liaison optique et un ensemble de sites au sol, il rapporte la perte par ciel clair dépendant de la longueur d'onde et de l'élévation, l'état de turbulence de Hufnagel-Valley (variance de Rytov, indice de scintillation, évanouissements gamma-gamma, moyennage d'ouverture), la disponibilité par rapport à la marge de liaison à partir d'un climat nuageux énoncé, la marge nécessaire pour des disponibilités visées et le plafond qu'aucune marge ne relève, la distribution des durées d'interruption, l'erreur de synchronisation temporelle et de télémétrie par interruption à travers le modèle de holdover de l'horloge, la diversité de sites corrélée à la distance, et les gains hypothétiques d'un changement de longueur d'onde, d'une plus grande ouverture, d'une réduction de scintillation par optique adaptative et d'une marge supplémentaire. <c4/> gagne un bilan de liaison tenant compte de l'atmosphère ; sans lui, sa sortie est identique au bit près à { "0.36" } (seuil A5). Deux scénarios fournis portent des climats nuageux ILLUSTRATIVE. MODELLED : trois lignes du registre. Les calculs atteignent les seuils A1 à A6 préenregistrés dans <c5/> par rapport à un programme mpmath indépendant ; cela vérifie l'implémentation des formules énoncées, et non l'atmosphère, et aucun enregistrement de disponibilité mesurée n'a été comparé, de sorte qu'aucune ligne n'est VALIDATED. Le seuil A4 a d'abord été manqué de { "3e-9" } parce que la fonction de répartition normale utilisée était une approximation à { "1.5e-7" } ; la fonction de répartition a été remplacée et le seuil laissé tel qu'enregistré. Les builds natif et WebAssembly renvoient des documents identiques à l'octet près pour les deux scénarios fournis (A7, exécuté sur le commit d'intégration { "0.37.0" }).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>ROC de détection des moniteurs IQ</b> (PRO-32, <a1><c1/></a1>). Une campagne avec moniteurs conserve le maximum de la statistique de test de chacun sur les fenêtres d'événements énoncés (positif) et sur des fenêtres juxtaposées en dehors des événements (négatif, <c2/>). Le rapport les regroupe par type d'alarme en une ROC avec son AUC et le point de fonctionnement au seuil configuré, sous forme de <c3/> et d'une section de rapport. Sur des campagnes synthétiques, le contrôle du niveau de hasard est atteint. Le seuil d'AUC du C/N0 ({ "0.95" }) n'est pas atteint ({ "0.79" }), parce que les fenêtres négatives situées juste après un événement héritent de la décroissance du CUSUM issue de la détection ; cela est consigné. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>Moniteurs IQ dans la campagne de relecture en laboratoire</b> (PRO-31, <a1><c1/></a1>). Une table <c2/> optionnelle dans un fichier de campagne exécute les moniteurs IQ dans la passe unique de l'exécuteur : puissance et spectre après chaque chaîne d'entrée, et C/N0, SQM et verrouillage par canal suivi. Leurs alarmes sont notées par rapport aux événements énoncés : détecté ou manqué, délai de détection, et fausses alarmes par heure d'exposition. Le chiffre de fausse alarme en forme close de chaque test est énoncé, y compris un nouveau chiffre gaussien bilatéral pour les tests SQM (<c3/>). Sans la table, rien ne change. Sur des campagnes synthétiques, les seuils de fausse alarme de puissance et de SQM et le seuil de fausse alarme du C/N0 sont atteints ; { "18" } atténuations sur { "18" } sont détectées, mais la borne du délai de détection, inférieure à un échantillon de détecteur par construction, n'est pas atteinte et est consignée. MODELLED ; ligne du registre « Moniteurs IQ notés dans des campagnes de relecture en laboratoire ».

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Ajustement de laboratoire à partir de campagnes IQ, suite</b> (<c1/>, job CI <c2/>). Il teste les deux hypothèses que le §{ "13.6" } de <c3/> a laissées ouvertes, par rapport à des seuils préenregistrés à 1e532f84. Il ajoute deux campagnes synthétiques : S, avec un J/S en escalier (germe 2026_1014), et R, une nouvelle rampe (germe 2026_1015). Les résultats sont dans <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 atteint : avec chaque niveau de J/S maintenu, <c1/> est retrouvé à +{ "0.185" } dB près. L'erreur de −{ "1.1" } dB des campagnes en rampe est un retard de l'estimateur.

# text
seg-ea9f206c2999 = S2 non atteint, épinglé par un test qui affirme l'écart : (d) tel qu'écrit sur la campagne en escalier tient pour le modèle de boucle de poursuite ({ "0.45" } dB) mais pas pour le modèle empirique ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 atteint : sur la nouvelle campagne en rampe, (d) avec les temps de maintien de chute ajustés, auxquels s'ajoute la vitesse de rampe de chaque événement, est à moins de { "1" } dB pour les deux modèles.

# text
seg-24c6725c2c7d = Les écarts (a′) et (d) se reproduisent sur R.

# text
# c1: step
seg-7cbbce356973 = Une campagne peut désormais énoncer son J/S sous forme de profil <c1/> dans le banc de test.

# text
seg-34007ba58a9f = Aucun verdict du §{ "13" } ne change, et la ligne du registre reste MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Accrochage FLL plafonné, optionnel</b> (DS-LOOP-05) : une nouvelle clé de conception de boucle <c1/> (s), Rust <c2/>. Avec <c3/>, elle force la passation de la FLL à la PLL après cette durée, quel que soit le PLI. Non définie par défaut, et alors hors du hachage de conception ; la conception par défaut et son hachage sont inchangés.

# text
seg-ae2794b2d3d5 = Vérifié par rapport à des seuils préenregistrés à 58789af0, sur une vérité injectée. Le témoin est atteint : la valeur par défaut ne passe jamais la main dans { "9" } germes sur { "10" } à { "33" } dB-Hz.

# text
seg-6d9483874b35 = Non atteint : avec un plafond de { "1.0" } s, { "16" } exécutions sur { "20" } conservent le verrouillage à { "33" } dB-Hz et { "8" } sur { "20" } à { "31" } dB-Hz ; les autres alternent entre des passations forcées et le retour de la FLL. La gigue de phase vaut { "1.8" }× celle de la PLL seule à { "33" } dB-Hz.

# text
seg-deeefaf50e3e = Le plancher d'accrochage d'environ { "35" } dB-Hz reste la limite documentée de la valeur par défaut.

# text
seg-780de73c01e1 = MODELLED ; ligne du registre « Accrochage FLL plafonné en dessous du plancher de passation FLL vers PLL de la conception par défaut (optionnel) ».

# text
# c1: jamming
seg-ace6b53749bd = <b>Hystérésis d'acquisition et quantificateur de la chaîne d'entrée dans le type de scénario jamming</b> (CAP-06c) : deux sections optionnelles pour un scénario <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/> : <c2/> (dB-Hz, au seuil de poursuite ou au-delà) et <c3/> (s, { "0" } par défaut). Un satellite est acquis au seuil d'acquisition ou au-delà, une fois qu'il est resté non acquis pendant le délai. Il est conservé tant qu'il est au seuil de poursuite ou au-delà. Sorties : <c4/> (vrai/faux), <c5/> (décompte) et <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/> : <c2/> (de { "1" } à { "16" }) et <c3/> (MHz, deux fois le débit de chips par défaut). Produit un bloc <c4/> : <c5/> (dB, <c6/>), <c7/> (dB, retirée du C/N0 effectif de chaque liaison) et <c8/>. La perte est celle pour une entrée gaussienne, signalée comme non valide pour les brouilleurs CW, à bande étroite et à balayage.

# text
seg-0dad81736863 = Sans les sections, toutes les sorties sont identiques à l'octet près.

# text
seg-92007bfb6680 = Vérifié par rapport à des seuils préenregistrés à 70c72fcc. La perte du quantificateur est à moins de { "0.0007" } dB d'un Monte Carlo indépendant, et la lecture AGC à moins de { "0.012" } dB de la boucle AGC de la couche IQ.

# text
seg-973e451df99d = Les exécutions d'hystérésis enregistrées n'étaient pas informatives (toutes les liaisons perdues), de sorte que ce seuil est NOT MET. Un jeu d'exécutions supplémentaire enregistré à { "37793290" } l'atteint : chaque indicateur égale un recalcul indépendant, et { "732" } liaisons sur { "1824" } montrent l'hystérésis.

# text
seg-912e9f1a4d5b = Constat : avec un brouilleur CW, un CAN à 1 bit perd environ { "5" } dB de plus que le chiffre gaussien.

# text
seg-a19aee81b581 = MODELLED ; ligne du registre « Hystérésis d'acquisition et quantificateur de la chaîne d'entrée dans le type de scénario jamming par rapport à des recalculs indépendants ».

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Masquage du brouilleur par le relief dans le type de scénario jamming</b> (CAP-06b) : une section <c1/> optionnelle dans un scénario <c2/> avec un brouilleur. Champs :

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/> : une tuile SRTM <c2/>, relative au répertoire de travail ;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> et <c3/> (deg) : la taille et le coin de la tuile ;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, { "0" } par défaut), <c2/> (4/3 par défaut) et <c3/> (m, { "30" } par défaut).

# text
seg-ad58fe7ff627 = Le moteur échantillonne le profil de terrain le long du grand cercle entre le brouilleur et le récepteur et trouve l'arête en lame de couteau dominante. La puissance reçue du brouilleur, et donc chaque J/S, est abaissée de la perte d'une seule arête en lame de couteau de l'ITU-R P.526-15 §{ "4.1" }.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = Le résultat gagne un bloc <c1/> : <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) et <c7/> (décompte).

# text
seg-b9696f5eda4b = Sans la section, toutes les sorties sont identiques à l'octet près.

# text
# c1: ν
seg-593b6a5b4480 = Vérifié par rapport à des seuils et à dix emplacements préenregistrés à 92cd2bfd, sur la vraie tuile SRTM versée de la Vallée de la Mort, par rapport à un recalcul numpy indépendant. Tous atteints : pire différence { "1.6e-10" } sur <c1/> et sur la perte (seuil { "1e-9" }), la perte monotone selon la hauteur du brouilleur, et la perte abaissant le J/S exactement d'elle-même.

# text
seg-62e07defd715 = MODELLED ; ligne du registre « Masquage du brouilleur par le relief dans le type de scénario jamming par rapport à un recalcul numpy indépendant sur une vraie tuile SRTM ».

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>Gains d'antenne CRPA dans le type de scénario jamming</b> (CAP-06a) : une section <c1/> optionnelle dans un scénario <c2/>. Champs : <c3/> (positions des éléments en est-nord-haut local, m), <c4/> (<c5/> ou <c6/>), et <c7/> (largeur de bande de bruit MVDR, MHz, deux fois le débit de chips par défaut).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Chaque canal forme un faisceau sans distorsion vers son satellite. Le bruit de la liaison est mis à l'échelle par <c1/> et le brouilleur par <c2/> avant l'équation C/N0 anti-brouillage existante.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Chaque liaison gagne un bloc <c1/> : <c2/> (dB) et <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Une section invalide (une liste d'éléments vide, une pondération inconnue, une largeur de bande non positive) est une erreur, par <c1/> et <c2/> aussi bien que par <c3/>.

# text
seg-2464d9dde85f = Vérifié par rapport à des seuils préenregistrés à 08d83b4d. Atteints : additivité (après une correction : la première construction avait ajouté les nouvelles unités à la table d'unités de chaque exécution de brouillage) ; un élément n'est pas un réseau ; gain de bruit et C/N0 effectif par rapport à un recalcul numpy indépendant à moins de { "1e-9" } dB ; le MVDR tend vers l'annulation à JNR élevé.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = Non atteint : le gain du brouilleur en MVDR sur { "194" } liaisons sur { "456" } avec les mathématiques portables de la { "0.36" } ({ "202" } avec les mathématiques de l'hôte ; <c1/>) (pire { "1.7e-6" } dB). Les résidus de −{ "100" } à −{ "188" } dB sont sous la résolution du float64 à ce seuil, et numpy est en désaccord avec lui-même du même ordre.

# text
seg-c10e1c72eb15 = MODELLED ; ligne du registre « Gains d'antenne CRPA dans le type de scénario jamming par rapport à un recalcul numpy indépendant ».

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>Moteur de suivi IQ par rapport à GNSS-SDR { "0.0.19" }</b> (PRO-33) : <c1/> et GNSS-SDR suivent les mêmes enregistrements numpy indépendants de GPS L1 C/A de { "30" } à { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Seuils préenregistrés à 48edd4a5. L'étalonnage enregistré a échoué sur une passation GNSS-SDR erronée (F3), de sorte que l'amendement { "1" } (1e4288c4) ajoute aux deux récepteurs une FLL limitée à l'accrochage, commité avant tout enregistrement de test.

# text
seg-1d651ff134f9 = Atteints : la gigue de porteuse et de code et le Doppler concordent à { "5" } % près à chaque C/N0.

# text
seg-bc9c9a0247d1 = Non atteints : le C/N0 NWPR du moteur lit { "2.3" }–{ "7.1" } dB sous le SNV de GNSS-SDR (F4, une limite connue de l'estimateur ; le M2M4 est à moins de { "0.06" } dB de la vérité) ; les indicateurs de verrouillage diffèrent par définition (F5) ; un désaccord sur un décrochage à { "30" } dB-Hz (F6).

# text
seg-7c32867b5c27 = MODELLED ; ligne du registre « Moteur de suivi IQ par rapport à GNSS-SDR { "0.0.19" } sur des enregistrements indépendants ».

# text
seg-6ba057fab559 = <b>Deux lignes VALIDATED pour des codes de la couche IQ</b> (DS-GIQ-06b, PRO-39).

# text
seg-55524624777b = <b>BeiDou B1I.</b> Les { "63" } codes primaires B1I concordent avec le générateur indépendant de GNSS-SDR { "v0.0.19" } chip pour chip (seuil préenregistré à 911106d1). Seule la sortie de ce programme est versée : les codes PRN B1I que définit l'ICD public, sous forme de préfixe et de hachage.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Les { "126" } codes L1CP/L1CD et les { "63" } recouvrements L1CO concordent avec les colonnes de contrôle qu'imprime l'IS-GPS-800J, et la séquence de Legendre calculée concorde avec sa Table 6.2-1 (seuils préenregistrés à fe372e26).

# text
seg-f445784a7f2d = Lignes : « Codes de télémétrie primaires BeiDou B1I par rapport à un générateur indépendant » et « Codes de télémétrie et de recouvrement GPS L1C par rapport aux colonnes de contrôle imprimées de l'IS-GPS-800J ».

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>Bandes GLONASS, BeiDou et Galileo E6 dans le modèle de spectre</b> (CAP-12, signaux) : nouveaux noms de bandes <c1/> et <c2/> (tout canal FDMA sous la forme <c3/>, K = −{ "7" } à { "6" }), <c4/>, <c5/>, <c6/>, <c7/> et <c8/>. Chacune porte la porteuse, la modulation et la puissance reçue minimale de son ICD. Elles sont optionnelles, par le nom : l'ensemble de bandes par défaut et toutes les sorties existantes sont inchangés.

# text
seg-158a6ec19d6b = Vérifié par rapport à des seuils préenregistrés à 5806f28b : les valeurs de l'ICD, les zéros, le composite B1C et le chemin C/N0 sont atteints.

# text
seg-805092ae8ca2 = Deux seuils n'ont pas été atteints. Le seuil d'aire unitaire était inatteignable tel qu'écrit (F1). Les formes d'onde B1I et B1C de la couche IQ ne concordent avec le modèle que moyennées sur la bande, à cause des spectres de raies inégaux de leurs codes (F2).

# text
seg-db88f07d97bb = MODELLED ; ligne du registre « Modèle de spectre : bandes GLONASS, BeiDou et Galileo E6 (optionnel) ».

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Option CFAR à moyennage de cellules dans l'acquisition IQ</b> (PRO-37) : <c1/> et <c2/> décident sur une grille d'acquisition en comparant chaque cellule à la moyenne de cellules de référence de sa rangée Doppler. Le seuil provient de la probabilité de fausse alarme CA-CFAR en forme close pour <c3/> blocs non cohérents (<c4/>, <c5/>), de sorte que la décision ne dépend pas de la normalisation de la puissance d'échantillon. Elle est optionnelle ; le détecteur par défaut et toutes les sorties existantes sont inchangés.

# text
seg-a56e74b1e091 = Vérifié par rapport à des seuils préenregistrés à 3724aefa : la forme close par rapport au Monte Carlo ({ "18" } cas sur { "18" }), et un taux de conception de { "1" } % mesuré à { "0.97" }–{ "1.01" } % sur bruit gaussien et sur bruit quantifié sur 2 bits.

# text
seg-f88fe97e0ee6 = Un seuil n'a pas été atteint : sur un signal sur 2 bits sans bruit, { "1.28" } % des cellules hors pic dépassent le seuil, aux lobes secondaires de corrélation du code (constat F1).

# text
seg-8d88b626c31e = MODELLED ; ligne du registre « Option CFAR à moyennage de cellules dans l'acquisition IQ ».

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Modèle de scintillation par rapport à des données mesurées</b> (PRO-34) : le modèle de scintillation de Cornell du canal IQ a été comparé à l'intensité et à la phase GPS L1 mesurées à { "50" } Hz lors d'une nuit de scintillation équatoriale (enregistrement Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), sous des seuils préenregistrés à b6ccb499. Atteints : la distribution de l'intensité et la scintillation de phase liée à S4. Non atteint : le modèle s'évanouit { "2.4" } fois plus souvent sous −{ "10" } dB et { "3.5" } fois plus longtemps (constat F1). Le traitement enregistré lit la phase repliée du modèle (constat F2) ; le résultat de phase tient une fois celle-ci dépliée. <c1/> récupère les données. La ligne reste MODELLED : « Canal de scintillation ionosphérique IQ (modèle de Cornell) par rapport à une scintillation GPS L1 mesurée à { "50" } Hz ».

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Lecteur d'échantillons LuGRE corrigé</b> (MR-09) : <c1/> lit un lot IQ LuGRE avec I dans le quartet de poids fort et les niveaux à pas médian <c2/> (<c3/>), qui retirent la moyenne de −½ que portent sur I et Q les entiers bruts en complément à deux. <c4/> donne à GNSS-SDR la même lecture. Le lecteur ION générique et toutes les sorties existantes sont inchangés : { "149" } résultats de scénario et une étude sont identiques à l'octet près avant et après, et les constats LuGRE épinglés se lisent comme enregistrés (<c5/>). Aucune ligne du registre ne change.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Suivi BOC({ "1,1" }) optionnel</b> (CAP-07 (a)) : <c1/> remet à l'échelle les discriminateurs du DLL pour le pic principal du BOC({ "1,1" }) en sinus et ajoute un moniteur de saut de bosse (corrélateurs très en avance et très en retard à ±{ "0.5" } chip, compteurs haut/bas, <c2/>) qui écarte le NCO de code d'un pic latéral ; <c3/> liste les sauts. Désactivé par défaut, et toutes les sorties existantes sont inchangées. Vérifié par rapport à des seuils préenregistrés à 6b68f6cc sur un signal BeiDou B1C synthétique : un départ sur pic latéral qui reste à { "0.55" } chip sans l'option est ramené sur le pic principal par un saut à { "0.08" } s avec elle, et aucun faux saut n'a été observé depuis le pic principal. Un seuil n'a pas été atteint : la grille de tests unitaires pour la mise à l'échelle sort de la plage linéaire des discriminateurs (constat F1 dans <c4/>). MODELLED ; ligne du registre « Suivi BOC({ "1,1" }) : mise à l'échelle du DLL et résolution d'ambiguïté par saut de bosse (optionnel) ».

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Ajustement de laboratoire à partir de campagnes IQ</b> (B7.1, <a1><c1/></a1>). Le <c2/> d'un scénario labfit ajuste un dossier de sortie <c3/> en CLI (<c4/>), en Python (<c5/>) et dans l'outil labfit du MCP (dossiers situés uniquement dans son répertoire de travail). Il ajuste une unité par signal, conception de boucle, chaîne d'entrée et type de brouilleur :

# text
seg-1726361b81c4 = le modèle de C/N0 par rapport à un J/S énoncé, avec censure ;

# text
seg-e1b8a27b06fd = le seuil de poursuite, directement et en forme close ;

# text
seg-8dce89923619 = les modèles de verrouillage de boucle de poursuite et empirique, couplés par le modèle de C/N0, avec leurs temps de maintien ;

# text
seg-108646713c97 = un bootstrap par grappes à germe fixé sur les enregistrements, des intervalles de prédiction à { "90" } %, et des jeux réservés par exclusion d'un enregistrement à la fois ;

# text
# c1: [validation]
seg-ee5deb4d5d4b = une table <c1/> préenregistrée, hachée, avec PASS/FAIL par seuil.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = Le rapport est <c1/> en JSON, CSV et Markdown, avec un bloc d'unités. <b><c2/> n'est pas identifiable à partir des données de C/N0</b> sans mesure de puissance indépendante. Il est énoncé, jamais ajusté, et le paramètre ajusté est <c3/> (amendement de conception du 2026-10-12). Un type de brouilleur inconnu prend le <c4/> énoncé le plus dommageable (cw, { "1" }). Sur des campagnes synthétiques issues des propres scènes de Kshana, le seuil de couverture sur jeu réservé (c) est franchi. Les seuils <c5/> (a') et (b') ({ "0" } campagnes couvertes sur { "50" }) et le seuil (d) portant sur le seuil de poursuite en forme close ne sont pas atteints : ils sont consignés avec leurs valeurs. MODELLED ; ligne du registre « Étalonnage des modèles de C/N0 et de verrouillage du récepteur ouvert sur les résultats de campagnes IQ, avec une erreur de prédiction énoncée ». Le chemin labfit à partir de journaux de récepteur et ses sorties sont inchangés.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> sur un noyau JPL</b> (CAP-31) : <c2/> prend chaque corps que contient le SPK (avec de440s : Mercure, Vénus, la Terre, la Lune) dans le noyau, étiquette <c3/>, et ajoute un bloc <c4/> uniquement lorsqu'il est défini. Nouvelle ligne, VALIDATED par rapport à SPICE (préenregistré f8e946ea ; pire { "3.3e-5" } m, { "1.0e-11" } m/s). Le rapport par défaut est inchangé.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop sur l'éphéméride DE440</b> (CAP-20b) : <c1/> balaie C3 et le V∞ d'arrivée sur des états héliocentriques issus d'un SPK DE440. Nouvelle ligne, VALIDATED par rapport à des états SPICE

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (préenregistré 2d857fb1 ; Terre vers Mars 2026-2028, { "304" } cellules, pire { "2.6e-14" }, la même cellule de C3 minimal).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>Macro-modèle non gravitationnel de LRO : NOT MET</b> (DS-LRO-10, préenregistré e82047e2). <c1/> (optionnel via <c2/>) : rayonnement solaire direct sur plaques planes avec l'ombre de la Lune, un panneau suivant le Soleil, et albédo lunaire et infrarouge thermique ; <c3/> est une approximation générique étiquetée de LRO à partir de faits publiés (sans plaques du bus : la table des plaques n'a pas pu être obtenue). Sur l'arc LRO de { "4" } h, il laisse la RMS en dynamique réduite à { "6.668" } m et la RMS dynamique à { "11.94" } m, avec un facteur de rayonnement invraisemblable (environ +{ "21" } / −{ "22" }), de sorte que les trois seuils sont manqués. Le constat est épinglé par un test, et aucune sortie par défaut ne change (<c4/>). Le SRP lunaire en boulet de canon optionnel utilise désormais le cône d'ombre de la Lune au lieu de celui de la Terre (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>OD lunaire : marée solide k2 et relativité sélénocentrique optionnelles</b> (DS-LRO-11), désactivées par défaut (<c1/>, <c2/>) ; un commutateur <c3/> pour la validation croisée ANISE (DS-LRO-04) ; une fixture d'arc LRO de { "24" } h et un ajustement d'arc long à titre d'information seulement (DS-LRO-09). Les exécutions d'information sont consignées dans <c4/> ; aucun nombre publié ne change.

# text
seg-b065138adba8 = <b>NRHO { "9" }:{ "2" } CR3BP par rapport à CAPSTONE</b> (CAP-29d) : nouvelle ligne MODELLED mesurant la NRHO circulaire restreinte du moteur par rapport à l'orbite volée de CAPSTONE (JPL Horizons, mars { "2023" } ; préenregistré { "4e868170" }) : période { "1.07" } %, apolune { "0.05" } %, périlune { "4.1" } % par rapport aux moyennes de CAPSTONE, à l'intérieur des seuils enregistrés de { "3" } / { "5" } / { "20" } %. Une mesure, et non une validation.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>États tournants CR3BP vers l'ICRF centré sur la Lune</b> (RM-34, FUT-06) : <c1/> / <c2/> / <c3/> projettent un état tournant adimensionné Terre-Lune sur la ligne Terre-Lune instantanée de DE440, y compris la vitesse hors plan du référentiel. Nouvelle ligne, VALIDATED par rapport à un référentiel SPICE à deux vecteurs (préenregistré 2313eb1b, amendé avant toute exécution d5ef79b3 ; { "72" } cas, pire { "1.8e-7" } m et { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>Membres de familles CR3BP par rapport à l'API Three-Body Periodic Orbits du JPL : NOT MET</b> (RM-35, préenregistré a9074f65). <c1/> (correction de halo, de NRHO et de DRO, indice de stabilité de la monodromie, continuation par pseudo-longueur d'arc) concorde avec { "54" } membres de l'API sur { "58" } sur chaque seuil (état, période et Jacobi à moins de { "1e-10" } partout). Un indice de stabilité de halo L1 ({ "9.5e-2" }) et trois fermetures de petites DRO ({ "1.5e-8" } à { "3.3e-8" } contre { "1e-8" }) échouent, de sorte que le module est <c2/> et qu'aucune ligne ne le revendique. Résultats : <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Orientation et environnement lunaires DE440 optionnels</b> (FUT-05, DS-LRO-08 ; valeurs par défaut inchangées) : <c1/>, <c2/> / <c3/> (ancrés sur l'époque, axes principaux DE440) et <c4/> (orientation PA DE440 intégrée plus le Soleil et la Lune géocentriques à partir d'un SPK DE440 fourni par l'utilisateur). Par rapport à ANISE (préenregistré ea537710) : orientation à moins de { "3.5e-7" } rad et ajustements LRO à moins de { "1" } mm, mais le volet éphéméride a manqué son seuil (Soleil { "30.7" } m, Lune { "1.1" } m, un décalage temporel d'environ { "1" } ms du côté d'ANISE), ce n'est donc pas une ligne validée. Résultats : <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Datum de la campagne du référentiel lunaire, seuil NumPy mis à l'échelle du conditionnement : NOT MET</b> (préenregistré b887eb05 ; reste MODELLED). L'étape { "0" } écarte le repli par pseudo-inverse comme cause de l'écart de { "0.30" } des stations estimées ; NumPy concorde dans le seuil sur six scénarios sur huit, mais stations_estimated le manque ({ "6.8e-6" } contre { "5.9e-7" }), et à la date nouvelle 2026-12-01 une balise non observée du pôle sud rend l'information des balises déficiente en rang, ce que la référence indépendante inchangée ne peut pas évaluer. Résultats : <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Datum du référentiel lunaire à partir d'une vraie campagne d'observation (Lune analytique) VALIDATED</b> sur des points normaux EDC de { "2025" } nouveaux (préenregistré 31f5283 avant qu'aucun ne soit récupéré) : la référence indépendante SPICE et NumPy inchangée concorde sur la comptabilité, les rangs et le couplage nul, et à moins de { "1.11e-3" } sur les sigmas (seuil { "1e-2" }), { "8.95e-4" } sur le conditionnement et { "1.79e-3" } sur les rapports transversal/longitudinal (seuil { "2e-2" }). Un contrôle de bibliothèque du seul calcul de covariance ; les seuils ne discriminent pas les modèles de Lune. Résultats : <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>Orientation IAU et GM des quatorze corps du système solaire ajoutés</b>, séparés de la ligne « Constantes physiques de chaque corps du système solaire » en une ligne VALIDATED (préenregistré 154bc54) : <c1/> concorde avec <c2/> de SPICE sur pck00011 à moins de { "1e-9" } rad sur { "574" } matrices aux époques d'origine et sur { "574" } à { "41" } époques nouvelles jamais comparées auparavant (pire Phobos { "1.38e-10" } rad), et <c3/> égale gm_de440 pour les quatorze corps. Le reste de la ligne d'origine (J2, rayon moyen, le rapport) reste MODELLED. Résultats : <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Lambert multi-révolutions</b> (<c1/>) : toutes les solutions jusqu'à trois révolutions, les deux branches. Nouvelle ligne du registre, VALIDATED par rapport à pykep { "3.0.1" } (préenregistré a75de851 ; { "382" } cas, { "1058" } solutions, pire différence de vitesse { "1.6e-13" } contre { "1e-8" }). Le garde-fou interne d'atterrissage de Kepler a trouvé une limite de <c2/> sur un arc à e = { "0.994" } ; elle est consignée dans <c3/>.

# text
seg-b62dc38b09e9 = Pression de radiation solaire en boîte et ailes et ECOM2 (DS-PA-14), optionnelle.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/> : un modèle boîte et ailes à plaques planes avec les tables Galileo FOC/IOV issues des métadonnées de satellites du GSC, en pilotage de lacet GNSS nominal, avec facteur de radiation et dérivées partielles par panneau, et le modèle empirique ECOM2 avec ses dérivées partielles. Sélectionné avec <c2/> / <c3/> (champs <c4/>, <c5/> par défaut : le chemin du boulet de canon et toutes les valeurs de référence sont inchangés) ; avec un jeu boîte et ailes, <c6/> est son facteur de radiation. Comparé à Orekit { "12.2" } sous un préenregistrement (<c7/>) : tous les seuils atteints, environ { "1e-15" } en relatif ; VALIDATED comme évaluation de modèle, la prédiction de la SRP de Galileo reste MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>Ombre de SRP pour Terre aplatie et assombrissement centre-bord solaire (FUT-09, RM-11).</b> Nouveau module <c1/> : <c2/> (ellipsoïde occultant WGS-84), <c3/> (loi d'Eddington) et <c4/>, sélectionnés avec <c5/> (par défaut : l'ombre conique sphérique existante, inchangée) ; <c6/>. L'ombre aplatie concorde avec le rapport d'éclairement d'Orekit { "12.2" } à moins de { "7.4e-9" } sur { "2400" } géométries (VALIDATED, <c7/>) ; l'assombrissement centre-bord n'a aucune référence externe indépendante (MODELLED).

# text
seg-f09d4b831dfe = Thermosphère NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/> : un portage de <c2/> et <c3/> (commutateurs, modes Ap journalier et tableau ap toutes les 3 heures) à partir de la version C du domaine public du Fortran du NRL. Il est identique au bit près à ce portage C et à moins de { "1.9e-6" } en relatif de pymsis { "0.13.0" } (Fortran du NRL, simple précision) sur une grille de 720 points, et il reproduit les { "17" } cas de test publiés (VALIDATED ; <c4/>). Cela valide le portage, et non la précision du modèle par rapport à une densité mesurée.

# text
seg-9e8e9018dbaf = Niveau de densité de traînée NRLMSISE-00 optionnel.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> et <c4/>. Le modèle exponentiel statique reste le choix par défaut, bit pour bit. La météorologie spatiale est constante par modèle. VALIDATED au niveau de l'orbite par rapport à la propre traînée NRLMSISE-00 d'Orekit { "12.2" } sur { "24" } h (pire { "0.03" } m pour un déplacement dû à la traînée allant jusqu'à { "142" } km ; <c5/>).

# text
seg-b1b2ac9ac91e = Soleil et Lune DE440 optionnels dans le propagateur de Cowell (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> accepte tout <c2/> (par exemple un <c3/> DE440) pour les termes de troisième corps et de SRP ; il refuse un fournisseur qui ne peut pas servir l'époque, compte les replis sur la série analytique, et est désactivé par défaut. <c4/> conserve la précision en deux parties. Par rapport à Orekit { "12.2" } sur son propre lecteur DE440, les orbites de { "24" } h concordent à { "0.017" } m ; le seuil préenregistré de position du Soleil et de la Lune a été manqué ({ "6.4" } m / { "0.24" } m ; SPICE montre le même écart), donc MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Marée atmosphérique S1 optionnelle (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> et <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Table { "1" } modèle N1, degrés { "2" }–{ "6" }), activés avec <c3/> sur <c4/> et <c5/> ; désactivés par défaut. MODELLED (coefficients revérifiés par rapport à la table publiée ; aucune référence externe indépendante pour l'effet de la force).

# text
seg-c62d816a93cf = Détermination d'orbite par lot en vitesse radiale et azimut/élévation avec masque d'élévation (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (STM variationnelle avec dérivées partielles analytiques à deux corps + J2), <c5/>, <c6/> ; <c7/>. Le chemin par mesures de distance seules est inchangé. Comparé aux moindres carrés par lot d'Orekit { "12.2" } sur { "8" } scénarios préenregistrés : tous les seuils atteints sauf la concordance d'état sans bruit (≤ { "1" } cm), manquée sur { "2" } scénarios sur { "4" } à { "1.46" } et { "1.74" } cm avec kshana à moins de { "1e-8" } m de la vérité ; consigné, MODELLED.

# text
seg-223f1e39669f = Pondération de précision SP3 (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> et <c2/> associent les codes de précision de l'en-tête et de chaque enregistrement à des sigmas d'observation ; une variante d'ajustement Galileo pondérée par SP3 (RMS 3D de niveau 2 de { "0.035" } m contre { "0.070" } m sans pondération) est ajoutée à côté des exécutions enregistrées inchangées. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Job de déclenchement de l'arc complet Swarm-A (DS-PA-08)</b> dans <c1/>.

# text
seg-cc5e8af7cb0d = Gravité planétaire à partir des tables PDS SHADR (CAP-30, partie de CAP-31).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) lit Mars GMM-3 (d/o { "120" }) et GRAIL GL0660B (d/o { "660" }) ; <c3/> attache tout champ chargé (valeurs par défaut inchangées). Des extraits de degré 20 sont fournis (NASA PDS, domaine public ; <c4/>) ; les fichiers complets sont récupérés par <c5/>. VALIDATED par rapport à pyshtools { "4.14.1" } (à moins de { "4e-15" } de la gravité totale à d/o { "120" } sur toute la sphère, { "5e-14" } à d/o { "660" } pour |lat| ≤ { "60" }°) ; le câblage dans le référentiel du corps reste MODELLED (le référentiel natif de chaque champ n'est pas le référentiel IAU utilisé).

# text
seg-afb5fbf86ffc = Gravité de haut degré jusqu'au degré { "2190" } (RM-14, FUT-07).

# text
# c1: SphericalHarmonicField::acceleration_hf
# c2: potential_hf
# c3: prepare_high_degree
# c4: from_gfc_file
# c5: from_gfc_reader
# c6: scripts/fetch_egm2008.sh
# c7: KSHANA_EGM2008_GFC
# c8: propagator::FieldEvaluator
# c9: Geopotential
# c10: xval/
seg-28bc597b06b2 = <c1/> / <c2/> (colonne avant modifiée de Holmes–Featherstone, sans sous-dépassement, sans singularité polaire), <c3/>, un chargeur ICGEM en flux <c4/> / <c5/> (contrôles de norme et de degré maximal, système de marée consigné, termes variables dans le temps rejetés), et <c6/> (EGM2008 complet, SHA-256 épinglé, non fourni ; tests conditionnés par <c7/>). <c8/> le sélectionne sur le <c9/> optionnel. Concorde avec Orekit { "12.2" } à { "7.3e-17" } m/s² jusqu'au degré { "2190" }, et une orbite { "200" }×{ "200" } de { "24" } h concorde à { "0.13" } m. MODELLED : pyshtools a manqué le seuil préenregistré près du pôle (attribué à pyshtools) et le contrôle de sensibilité au degré 70 de l'orbite a été manqué ({ "0.73" } m < { "1" } m) ; les deux sont consignés dans <c10/>.

# text
seg-4ef4f74f21c1 = Intégrateur DOP853 (FUT-11).

# text
# c1: integrator::integrate_dop853
# c2: integrate_dop853_checked
# c3: integrate_dop853_dense
# c4: dop853_step
# c5: dop853_initial_step
# c6: propagator::Integrator::Dop853
# c7: propagate_dop853
# c8: propagate_dop853_checked
# c9: solve_ivp(method="DOP853")
# c10: xval/dop853-scipy/
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (sortie dense d'ordre 7), <c4/>, <c5/>, avec un garde-fou de pas à échec fermé ; <c6/>, <c7/>, <c8/>. Le pilote par défaut est inchangé. VALIDATED par rapport à SciPy { "1.18.1" } <c9/> : pas isolés à moins de { "5.6e-15" }, séquences de pas identiques, états finaux à moins de { "1.6e-12" } (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Résolveur de Kepler robuste (FUT-12).</b> Nouveau module <c1/> : <c2/> (point de départ de Markley { "1995" }, résidu sans annulation) pour tout { "0" } ≤ e < { "1" }, enveloppé par <c3/>. VALIDATED par rapport à des racines mpmath à 50 chiffres à { "0.9" } ε·|E| jusqu'à e = { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Gravité terrestre tessérale optionnelle dans le propagateur de Cowell (RM-09).

# text
# c1: propagator::ForceModel
# c2: geopotential: Option<Geopotential>
# c3: with_geopotential
# c4: with_egm2008(nmax)
# c5: SphericalHarmonicField
# c6: .gfc
# c7: EarthFixedFrame::Era
# c8: EarthFixedFrame::Cio
# c9: None
# c10: xval/cowell-tesseral-orekit/PREREGISTRATION.md
seg-e1a7ad42211e = <c1/> gagne <c2/> (<c3/>, <c4/>). Il évalue un <c5/> (EGM2008 fourni jusqu'au degré/ordre { "70" }, ou tout <c6/> ICGEM) dans un référentiel terrestre fixe atteint par l'angle de rotation de la Terre (<c7/>) ou par la chaîne CIO GCRS vers ITRS (<c8/>). <c9/> par défaut : aucune sortie existante ne change. VALIDATED par rapport à Holmes–Featherstone d'Orekit { "12.2" } sur { "24" } h ({ "6" } cas, pire { "0.036" } m), avec les seuils préenregistrés dans <c10/>.

# text
# c1: jd2::gmst82
# c2: cio::gcrs_to_itrs_matrix_jd2
# c3: frames::teme_to_itrf_jd2
# c4: itrf_to_teme_jd2
# c5: orbit::Propagator::position_in_frame_jd2
# c6: own_jd2_utc
# c7: From
# c8: jd2::Jd2
# c9: timescales::TwoPartJd
# c10: two_part_jd = true
# c11: ephemeris
# c12: gmst82
# c13: c2t06a
# c14: f64
# c15: f64
seg-957686bb351e = <b>Dates juliennes en deux parties à travers la rotation de la Terre sur le chemin orbital</b> : <c1/>, <c2/>, <c3/> / <c4/>, <c5/> et <c6/>, conversions <c7/> entre <c8/> et <c9/>, et un <c10/> optionnel pour le scénario <c11/> (ECEF, trace au sol et vue de station ; désactivé et inchangé par défaut, et la clé est omise du hachage du scénario lorsqu'elle est désactivée). Nouvelle ligne du registre, VALIDATED par rapport à pyerfa <c12/>/<c13/> (préenregistré b10475ee ; { "40" } dates : GMST identique au bit près, matrice à moins de { "2.7e-14" }, rotation sur des pas de { "1" } µs à moins de { "1.1e-14" } rad, là où le chemin à un seul <c14/> les manque). L'époque du modèle de force de Cowell reste à un seul <c15/> ; la raison figure dans sa documentation.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>Prédiction des EOP au-delà de la table</b> (<c1/>, <c2/>) : une extension optionnelle d'une série IERS d'orientation de la Terre par le prédicteur LS+AR émis à sa dernière ligne, de sorte que les arguments de référentiel d'une époque ultérieure suivent la prévision au lieu de se figer sur la dernière ligne. Les réponses dans la table sont identiques au bit près (testé) ; la série se fige toujours sur la dernière ligne sauf si cela est appelé. La précision de la prévision reste le constat LS+AR existant par rapport au Bulletin A (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Décalages du pôle céleste dX, dY sur la chaîne CIO</b> (<c1/>), et contrôles vectoriels ERFA directs de <c2/>, <c3/> et de la nouvelle fonction. Nouvelle ligne du registre, VALIDATED par rapport à pyerfa (préenregistré 979c1e39 ; { "40" } époques { "1950" }–{ "2100" } : précession et CIO identiques au bit près, TEME→GCRS à moins de { "1.1e-10" } rad, l'effet prévu de la série à deux termes de l'équation des équinoxes). Les fonctions existantes sont inchangées.

# text
# c1: timescales::tai_minus_utc_on_date
# c2: Jd2::from_utc_calendar
# c3: jd2::utc_to_tai
# c4: jd2::tai_to_utc
# c5: dtf2d
# c6: utctai
# c7: taiutc
# c8: f64
# c9: timescales::tai_minus_utc
seg-20d19a2d65ec = <b>UTC antérieur à 1972 sur le chemin temporel en deux parties</b> (<c1/>, et <c2/>, <c3/> et <c4/> à partir de 1960-01-01) : l'ère à taux dérivant (« seconde élastique »), avec la table de dérive de SOFA, des sauts fractionnaires de fin de journée, et la mise à l'échelle UTC vers SI de la fraction de jour. Nouvelle ligne du registre, VALIDATED par rapport à pyerfa <c5/>/<c6/>/<c7/> (préenregistré 23c40661 ; { "117" } instants { "1960" }–{ "1971" }, pire { "2.9e-11" } s contre un seuil de { "1" } µs). Tout résultat de { "1972" } et au-delà est identique au bit près (somme de contrôle épinglée avant la modification). Avant { "1960" }, TAI − UTC vaut { "0" }, comme dans SOFA. Le <c9/> à un seul <c8/> est inchangé.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>Horloge de satellite diffusée GLONASS</b> (<c1/>) : <c2/> à partir de l'enregistrement RINEX, à un instant lu sur l'horloge du satellite (deux itérations en virgule fixe, la convention de RTKLIB). Les <c3/> et <c4/> analysés étaient auparavant inutilisés. Nouvelle ligne du registre « Horloge de satellite diffusée GLONASS et propagation de l'orbite diffusée », VALIDATED par rapport à RTKLIB 2.4.2-p13 <c5/>/<c6/> (préenregistré e099c42a ; { "292" } cas sur un vrai fichier de diffusion de { "2013" } : différence d'horloge { "0" } s, pire position { "1.1" } mm contre un seuil de { "1" } cm). Fonction de bibliothèque ; aucune sortie de scénario ne change. Aucune transformation PZ-90.11 → ITRF n'est appliquée, et le module le dit.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>Solution de temps PPP par rapport à l'horloge de station de l'IGS</b> ({ "0.36" }, FUT-19) : l'horloge du récepteur du filtre PPP flottant sur WTZR concorde avec l'horloge combinée finale de l'IGS pour la station à { "0.075" } ns (écart type) avec un décalage constant de −{ "0.66" } ns sur les deux heures convergées. Les seuils ont été préenregistrés dans <c1/>. VALIDATED (nouvelle ligne du registre). Nouvelle fixture <c2/>, les enregistrements d'horloge de station du fichier d'horloge final de l'IGS déjà utilisé pour les horloges de satellites.

# text
seg-463ac67600b1 = <b>Parité du PPP avec gLAB</b> ({ "0.36" }, WP-07, RM-31) : gLAB { "6.0.0" } a été exécuté sur les mêmes entrées WTZR comme outil séparé (cœur Apache-2.0 ; somme de contrôle du téléchargement vérifiée par rapport à la liste publiée), avec la ligne de commande d'un amendement de procédure commité avant l'exécution. Lors de sa première exécution enregistrée, le PPP flottant de Kshana et celui de gLAB concordent à moins de { "0.05" } m à { "240" } époques sur { "240" } et à { "5.0" } mm à la dernière. Le seuil du SPP a été manqué (médiane { "1.187" } m contre { "0.50" } m) et est consigné comme constat : les solutions SPP propres de gLAB et de RTKLIB diffèrent l'une de l'autre de { "0.852" } m. La règle enregistrée laisse donc les volets des deux outils non atteints dans leur ensemble, alors que la parité du PPP tient.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>Lecture de navigation RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41) : <c1/> lit des fichiers de navigation RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV et F/NAV, BeiDou D1/D2, QZSS LNAV ; les autres enregistrements sont ignorés jusqu'à l'en-tête d'enregistrement suivant), et <c3/> accepte des options. VALIDATED par rapport au fichier fusionné RINEX { "3" } de l'IGS du même jour : chaque champ décodé identique et { "0" } m en position. La lecture RINEX 2/3 est inchangée.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>Positions diffusées BeiDou GEO</b> (optionnel) : <c1/> et <c2/> (ICD BDS, inclinaison de −{ "5" } deg). <c3/> ignore toujours les GEO. MODELLED : la comparaison préenregistrée avec une orbite précise est conditionnée par les données et pas encore exécutée.

# text
seg-416f58111d1f = <b>Fichiers d'observation RINEX { "4" }</b> : un vrai fichier d'observation MGEX RINEX { "4.00" } est lu dans les tests (MODELLED, respect du format).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK avec LAMBDA sur du vrai RINEX</b> ({ "0.36" }, WP-07 ★) : <c1/>, doubles différences à courte ligne de base de code et de phase GPS bifréquence avec un filtre de Kalman flottant et une fixation entière LAMBDA (test de ratio). VALIDATED sur les stations IGS WTZR et WTZZ (à { "1.4" } m l'une de l'autre) par rapport à leur ligne de base ITRF2020 sous des seuils préenregistrés : fixé à chaque époque après les dix premières minutes, erreur de ligne de base médiane de { "4.5" } mm et 95e centile de { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>Parité du PPP sur données réelles avec RTKLIB</b> (RM-31) : <c1/> et <c2/> avec des seuils préenregistrés. Le PPP de RTKLIB v2.4.2-p13 sur les mêmes entrées WTZR concorde avec Kshana à moins de { "5" } cm à chaque époque des deux dernières heures ({ "9.7" } mm à la fin) lors du troisième enregistrement ; les deux premières exécutions, consignées comme constats, avaient la marée solide désactivée et l'antenne du récepteur sur l'emplacement de base de RTKLIB. Le seuil de parité en point unique a été manqué ({ "1.09" } m médian contre { "0.5" } m). Le volet gLAB n'a pas été exécuté (conditionné par les données).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Encodeurs de message de navigation au-delà de LNAV</b> ({ "0.36" }, WP-07, PRO-40) : <c1/> encode le CNAV GPS (types de message { "10" }, { "11" }, { "30" } ; CRC-24Q ; codage continu de rendement 1/2 K={ "7" }), le I/NAV Galileo (types de mot 1-5 dans des pages nominales paires/impaires ; entrelaceur 30x8 ; synchronisation <c2/>) et le F/NAV Galileo (types de page 1-4 ; entrelaceur 61x8 ; synchronisation <c3/>), avec des décodeurs de test. MODELLED : allers-retours et réponses connues de l'ICD ; une vérification préenregistrée que les éphémérides Galileo diffusées se situent sur la grille de LSB de l'encodeur a tenu (pire { "3.6e-3" } LSB) mais a manqué son seuil de nombre de satellites ({ "15" } sur { "20" }), consigné. Les encodeurs sont des fonctions de bibliothèque ; le câblage dans la scène ne fait pas partie de cette modification.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>Lecteur de fichiers IONEX</b> ({ "0.36" }, WP-07) : <c1/> avec <c2/>, <c3/>, <c4/>, <c5/> et <c6/> : un lecteur IONEX { "1.0" } strict à colonnes fixes avec des époques comptées à partir du jour de la première carte, <c7/> lu comme manquant, des cartes RMS, et les interpolations temporelles du format par carte la plus proche, consécutive et tournée ; TEC oblique à la hauteur de coque de l'en-tête. Vérifié sur une carte synthétique versée et, conditionné par les données (récupéré au moment du test avec un SHA-256 épinglé, non intégré au dépôt), sur un extrait d'un vrai GIM du CODE : chaque nœud exact ; l'interpolation concorde avec une référence par formule à { "4e-13" } TECU. <c8/> de RTKLIB concorde à { "3.6e-13" } TECU en { "6885" } points (B6 préenregistré). VALIDATED sur une preuve conditionnée par les données (décision du propriétaire, 2026-10-13) : le test échoue sur toute carte autre que celle au SHA épinglé.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Lissage de porteuse de Hatch</b> ({ "0.36" }, WP-07) : <c1/> et <c2/>, la forme sans divergence (sans ionosphère) dans l'assemblage de point unique précis. MODELLED avec un constat consigné : sur la station IGS WTZR, il abaisse l'erreur médiane en point unique de { "1.55" } m à { "1.12" } m et le 95e centile de { "3.47" } m à { "3.21" } m, en deçà de la réduction préenregistrée de { "40" } % (l'erreur restante est de type biais, et non du bruit).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>PPP flottant sur du vrai RINEX</b> ({ "0.36" }, WP-07) : <c1/>, un filtre de positionnement ponctuel précis flottant statique sur du vrai code et de la vraie phase GPS bifréquence avec les produits finaux de l'IGS (décalages et variations d'antenne, marée terrestre solide, enroulement de phase, retard de Shapiro, retard humide estimé, détection de sauts de cycle), avec <c2/>. VALIDATED sur la station IGS réservée WTZR par rapport à sa coordonnée ITRF2020 sous des seuils préenregistrés : après { "6" } h, l'erreur est de { "1.5" } mm en horizontal et de { "2.9" } cm en vertical, et chaque époque des deux dernières heures est à moins de { "10" } cm.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>Interpolation d'horloge précise SP3</b> ({ "0.36" }, WP-07) : <c1/> et <c2/> interpolent linéairement les horloges de satellites tabulées SP3 entre les deux nœuds valides qui les encadrent (valeur sentinelle d'horloge défectueuse ignorée), et <c3/> les fournit à <c4/>, de sorte que la chaîne précise fonctionne à partir d'un SP3 seul. VALIDATED par rapport aux horloges finales de l'IGS à { "30" } s du 2025-02-24 sous des seuils préenregistrés : { "32" } satellites GPS, RMS au point médian { "0.121" } ns (seuil { "0.15" } ns), 95e centile { "0.265" } ns (seuil { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM à côté des chiffres de mérite de holdover d'horloge</b> (CAP-05b) : une section <c1/> optionnelle sur le type de scénario clock rapporte un bloc <c2/> séparé (RAIM instantané sur un ciel prédéfini depuis un site énoncé : verdict par époque et niveaux de protection, disponibilité ; indisponible tant que le GNSS est refusé, jamais extrapolé). Les chiffres de holdover sont inchangés ; sans la section, la sortie est identique à l'octet près. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>Seuils de confiance du récepteur étalonnés sur JammerTest { "2024" }</b> (CAP-13) : un étalonnage préenregistré des moniteurs de chute de C/N0, d'AGC et d'indicateur de brouillage sur le jeu de données public JammerTest { "2024" } (récupéré à l'exécution, jamais intégré au dépôt ; <c1/>), livré uniquement comme <c2/> optionnel ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Sur jeu réservé : les seuils AGC, indicateur de brouillage et union sont franchis ; le seuil de fausses alarmes du C/N0 échoue ({ "0.023" } contre { "0.02" }), de sorte que la ligne est MODELLED (<c3/>). Les valeurs par défaut et les sorties sans le profil sont inchangées.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>Hypothèses de défaut ARAIM à plusieurs satellites</b> (CAP-05a) : la règle de sous-ensembles ADD v4.2 généralisée au-delà des paires (<c1/>, <c2/> ; l'ordre { "2" } est exactement le chemin existant vérifié par MAAST) et un RAIM avancé optionnel sur ces hypothèses (<c3/>), qui rapporte le sous-ensemble de plus grande séparation lorsqu'un défaut est détecté. Les a priori exigeant des sous-ensembles plus profonds sont refusés, jamais tronqués. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Ligne d'horizon dans la confiance du récepteur</b> (FUT-01) : une session receiver-trust peut énoncer un <c1/> ; les satellites situés derrière sont perdus pour le ciel (<c2/>, <c3/>, <c4/>) et leurs pertes sont classées <c5/>, jamais <c6/> ; sans cela, le repli sur l'intervalle d'azimut et toutes les sorties sont comme avant. Le générateur d'entraînement d'équipage gagne un événement <c7/> (un ciel bloqué, et non une interférence) et le scénario <c8/>. Le Monte Carlo UERE x DOP gagne les deux géométries de ligne d'horizon masquée de la note de conception, préenregistrées seules : les { "26" } vérifications réussissent.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>Vérification d'horodatage RFC { "3161" }</b> (CAP-14) : <c1/> vérifie la signature d'un jeton d'horodatage (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 et P-384), sa liaison au certificat de signature ESS, l'usage timeStamping du signataire et sa chaîne jusqu'à une ancre de confiance à l'instant genTime du jeton, hors ligne ; <c2/> l'applique au <c3/> d'un paquet (optionnel ; sans lui le rapport est inchangé). VALIDATED, de façon restreinte : les { "27" } cas auto-générés concordent tous avec OpenSSL { "3.0.13" } sur le verdict et le genTime, selon une comparaison préenregistrée avant que le vérificateur ne soit écrit. La révocation n'est pas vérifiée.

# text
# c1: figure_tiers
# c2: api::without_figure_tiers
# c3: lunar-station-coverage
# c4: figure_tiers
# c5: leo-ppp
# c6: solar-system
# c7: sweep
# c8: sweep-nd
# c9: lunar-attack-surface
seg-1b7777e600a8 = <b>Niveaux de vérification par chiffre pour chaque type de scénario</b> (RM-04) : le résultat de chaque type de scénario se termine désormais par un bloc <c1/> nommant ses chiffres principaux, la ligne de la matrice de vérification qui possède chacun d'eux et le niveau lu sur cette ligne (les chiffres qu'aucune ligne ne possède sont listés comme sans niveau). Le bloc est ajouté après l'exécution et se retire pour redonner le document précédent octet pour octet (<c2/>). <c3/> n'a pas de <c4/> tant qu'une nouvelle prédiction datée ne remplace pas sa prédiction figée ; <c5/>, <c6/>, <c7/> et <c8/> n'ont aucun chiffre principal scalaire, et <c9/> écrit du JSON compact. Les membres de campagne conservent leurs documents sans niveau.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Préréglage quantique <c1/></b> (CAP-08c) : un scénario inertiel fourni dans lequel un accéléromètre à interféromètre d'atomes froids, spécifié par la physique de son interféromètre (<c2/> avec un niveau de vibration de plateforme énoncé), file en inertie contre un accéléromètre à quartz de qualité navigation pendant une interruption GNSS de 110 minutes. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Degrés de liberté équivalents exacts de Greenhall</b> (CAP-03) : <c1/>, l'algorithme complet de Greenhall et Riley ({ "2003" }) (ordres de différence { "1" } à { "3" }, exposants de bruit +{ "2" } à -4, avec et sans recouvrement, modifié et non modifié, avec les tables des grands J), avec des enveloppes ADEV, MDEV et HDEV. VALIDATED sous une comparaison préenregistrée avec allantools { "2024.6" } : { "4 876" } points de grille à moins de { "6.0e-13" } en relatif ; allantools échoue en { "32" } points supplémentaires, qui sont consignés sans valeur de référence indépendante. Les intervalles de confiance de <c2/> sont inchangés bit pour bit.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Termes d'erreur de l'interféromètre à atomes froids</b> (RM-26/27/28) : bruit de phase du laser Raman (avec le terme de retard de rétroréflexion), biais de courbure de front d'onde d'un nuage thermique (défocalisation pure, avec un rayon de détection) et résolution de l'ambiguïté de franges (assistée par le classique et à deux temps d'interrogation), comme fonctions de bibliothèque dans <c1/>, chaque forme close étant vérifiée par quadrature ou par Monte Carlo. MODELLED ; pas encore accessible depuis un type de scénario (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Formats de journaux d'horloge</b> (RM-03) : <c1/> lit des fichiers d'horloge RINEX, des journaux ASCII de phase ou de fréquence de style TimeLab et des journaux de compteur TAPR TICC dans une série de phase normalisée unique (tau0 énoncé ou trouvé, lacunes comptées, une politique de lacunes). Optionnel : une série de synchronisation de télécommunications peut nommer un journal (<c2/>), et la table <c3/> d'un scénario d'horloge ajoute un bloc <c4/> (ADEV, TDEV, MTIE). Sans la table, les deux types de scénario sont identiques à l'octet près (<a1><c5/></a1>). Une comparaison préenregistrée sur trois journaux synthétiques a atteint ses seuils de phase et de câblage ; les estimateurs concordent avec allantools à moins de { "2.5e-14" } partout où il évalue, et il n'évalue pas le point MTIE sur l'enregistrement entier (consigné). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Gabarits de dérive de synchronisation en fréquence</b> (RM-01) : le type de scénario <c1/> gagne sept gabarits de génération de dérive MTIE et TDEV à température constante, ITU-T G.811 PRC, G.812 Types I à III, G.8262 EEC Options { "1" } et { "2" } et G.8262.1 eEEC, avec les morceaux en loi de puissance que les tables écrivent, et le scénario de référence <c2/> (un OCXO en roue libre contre les gabarits EEC : il échoue à { "1 000" } s, là où une boucle doit faire le travail). Chaque ligne a été relue par rapport au texte de itu.int ; la G.812 (06/2004) est remplacée par une édition préparée 08/2026 qui n'a pas pu être lue. MODELLED (une transcription) ; les gabarits et sorties existants sont inchangés.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Conseils sur l'a priori de filtre pour le type de scénario <c1/></b> ({ "0.36" }, WP-09, constat RM-21) : l'a priori de filtre par défaut du paquet convient à une IMU de qualité tactique. Avec une IMU de qualité navigation, la valeur par défaut peut rendre l'inertie fusionnée pire qu'un INS libre : { "52" } m contre { "11" } m sur un profil d'aéronef à { "70" } m/s. Réglez <c2/> pour correspondre à la qualité du capteur, comme le font les nouveaux paquets maritime, ferroviaire et aviation. Aucun scénario fourni n'associe une IMU de qualité navigation à l'a priori par défaut : chacun de ceux qui utilisent la valeur par défaut a des biais d'accéléromètre résiduels d'au moins { "0.015" } m/s². Documentation seulement ; aucune sortie ne change.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Export pour banc d'essai vérifié avec les propres lecteurs d'un simulateur</b> ({ "0.36" }, WP-09, CAP-16) : les fichiers de mouvement <c1/> de { "8" } scénarios fournis ont été relus par les lecteurs NMEA, latitude/longitude/hauteur et mouvement terrestre fixe de gps-sdr-sim (MIT, commit 28ca29a6, utilisé comme outil séparé via <c2/> ; aucune fonction de signal n'est appelée). Ils restituent la trajectoire exportée à { "1.2" } mm, { "0.15" } mm et exactement. CONSTAT : le lecteur terrestre fixe de ce simulateur ne peut pas lire le CSV pleine largeur, parce que son tampon de ligne de 100 caractères coupe chaque ligne. <c3/> donne désormais les coupes de colonnes à utiliser et le plafond de { "300" } s du simulateur. VALIDATED (nouvelle ligne du registre) ; les octets de l'export sont inchangés.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS sur le jeu de données KF-GINS</b> ({ "0.36" }, WP-09, FUT-17) : chargeurs et exécuteur <c1/> et modèle de mesure de bras de levier dans l'EKF en boucle fermée. Sur le jeu de données de démonstration de KF-GINS (récupéré au moment du test, non intégré au dépôt), la RMS horizontale de Kshana par rapport à la trajectoire de référence est de { "1.09" } cm contre { "1.11" } cm pour KF-GINS lui-même, et chaque seuil préenregistré a tenu. VALIDATED sur une preuve conditionnée par les données (décision du propriétaire, 2026-10-13) : le jeu de données est récupéré avec des SHA-256 épinglés et le chemin de reproduction se trouve dans <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Filtre PNT couplé dans le paquet de fusion</b> ({ "0.36" }, WP-09, FUT-16) : le type de scénario <c1/> accepte une table <c2/> optionnelle qui exécute un filtre empilé sur des pseudodistances avec un état de biais d'accéléromètre (<c3/>), et <c4/> est la version 3D à 8 états. Nouveau scénario fourni <c5/> : avec des accéléromètres biaisés, le mode couplé maintient la position de la suite quantique à { "18.7" } m (95e centile) avec une intégrité complète, là où les filtres découplés atteignent { "430" } m. Sans la table, <c6/> et <c7/> sont tous deux inchangés (épinglé) ; <c8/> refuse la table. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>Paquets GNSS/INS maritime, ferroviaire et aviation</b> ({ "0.36" }, WP-09, RM-21) : scénarios fournis <c1/>, <c2/> et <c3/> sur la bibliothèque de trajectoires, et une table <c4/> optionnelle pour le type de scénario <c5/> qui fusionne les pseudodistances d'une constellation Walker SGP4 (tous les satellites en nominal, les quelques plus hauts en dégradé). Sur le paquet ferroviaire, le couplage serré maintient la solution de qualité navigation à { "5.3" } m à travers une tranchée et un tunnel, contre { "12.9" } m en couplage lâche. Sans <c6/>, le paquet est inchangé (épinglé). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Couplage serré sur phase de la porteuse</b> ({ "0.36" }, WP-09, RM-25 / FUT-17) : <c1/>, un EKF à état d'erreur avec une horloge de récepteur explicite à deux états et des ambiguïtés de porteuse flottantes, piloté par une constellation Walker SGP4 avec des corrections de Klobuchar et de Saastamoinen dans la boucle de mesure, une détection de sauts par porteuse différenciée dans le temps et une réinitialisation des ambiguïtés, et une exécution sur le seul code avec les mêmes mesures pour comparaison. MODELLED : sur un parcours en 8, la solution sur porteuse est de { "2.5" } cm contre { "47" } cm sur le seul code, et NIS/NEES sont cohérents selon les germes.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>Bibliothèque de trajectoires GNSS/INS</b> ({ "0.36" }, WP-09, RM-24) : le type de scénario <c1/> accepte une table <c2/> optionnelle avec <c3/>. Les profils commandent des vitesses d'Euler et une accélération le long de la trajectoire à partir de l'état de vérité et en déduisent l'IMU vraie par la cinématique du corps rigide (virages coordonnés, montées, Coriolis) ; <c4/> importe une trajectoire de vérité (<c5/>) et résout l'IMU qui la reproduit. Sans la table, le paquet vole son parcours historique, bit pour bit (épinglé). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>Tuiles MNT latitude/longitude pour l'horizon lunaire</b> : <c1/> lit une tuile texte <c2/> (hauteurs au-dessus de la sphère moyenne sur une grille latitude/longitude) à la place du <c3/> en projection stéréographique polaire, pour <c4/> comme pour <c5/> ; le rapport reprend la tuile (<c6/>, avec son SHA-256). <c7/> est désormais câblé dans le lancer de rayon d'horizon. Une tuile rééchantillonnée à partir de l'extrait fourni donne à la station l'horizon de l'extrait à { "0.22" } deg. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Relief au site d'export du volume de service</b> : avec une section <c1/>, chaque ligne de l'export de géométrie par satellite de <c2/> porte <c3/> (le satellite dépasse le masque plat et l'horizon du site d'export à son azimut), le rapport porte l'horizon du site (<c4/>), et le CSV d'exécution gagne la colonne. Sans relief, l'export est inchangé. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Champs principaux issus du moteur</b> ({ "0.36" }, STUDIO-06) : <c1/>, <c2/> et le <c3/> WebAssembly indiquent, pour douze types de scénario, quels champs d'un scénario répondent à sa question, du meilleur au moins bon, sous forme de chemins pointés (<c4/>). Le Studio les lit avant son propre classement. Métadonnées d'affichage seulement : le moteur ne les lit jamais, aucun fichier de scénario n'en a besoin, aucun résultat n'en dépend. <c5/> échoue si un type de scénario n'est pas répartissable ou si un chemin ne se trouve dans aucun des scénarios fournis du type (il a détecté deux chemins que les identifiants aplatis du Studio avaient écrits sans les crochets de tableau).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Table type de scénario vers module issue du moteur</b> ({ "0.36" }, STUDIO-05) : <c1/>, <c2/> et le <c3/> WebAssembly donnent, pour chaque type de scénario dont les lignes de la matrice de vérification nomment un autre module que le sien, les noms de modules. La carte des capacités du Studio utilisait sa propre copie écrite à la main ; <c4/> échoue si un type de scénario de la table n'est pas répartissable ou si un module n'apparaît dans aucune ligne de la matrice. Aucune sortie n'a changé.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Courte exécution IQ dans la version navigateur</b> ({ "0.36" }) : <c1/> et <c2/> dans le module WebAssembly construisent une scène synthétique, acquièrent chaque satellite et suivent ceux qui ont été acquis, le tout en mémoire, limité à { "0.25" } s, { "1 000 000" } d'échantillons et { "8" } satellites. Le constructeur de scène et la recherche de signal par nom ont été déplacés hors de <c3/> réservé au natif (vers <c4/> et <c5/>) afin que les deux versions les partagent ; la sortie de la ligne de commande est inchangée. Le test natif et <c6/> comparent la même requête à une seule référence (<c7/>), octet pour octet : depuis le changement de mathématiques portables (STUDIO-15, ci-dessous), la version navigateur et la version native donnent les mêmes bits.

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: ErrorKind
# c4: ProvenanceClass
# c5: KindMeta
# c6: FieldUnit
# c7: scenario_kinds()
# c8: error_kind()
# c9: run_typed
# c10: RunOutput
# c11: data
# c12: scenario_kinds
# c13: KindMeta[]
# c14: kshana.d.ts
# c15: error_kind
# c16: ErrorKind | ""
# c17: tests/typed_api_sync.rs
seg-c0eab9b97b7d = <b>API Python et TypeScript typées</b> (CAP-34) : <c1/> type les vocabulaires fermés (<c2/>, chaque nom de type de scénario ; <c3/> ; <c4/>) et les dictionnaires <c5/> et <c6/> ; <c7/> et <c8/> les renvoient. Le paquet WebAssembly ajoute <c9/> (une exécution sous forme d'objet <c10/> typé avec le document analysé comme <c11/>) et <c12/> (les <c13/> analysés), et son <c14/> porte le même vocabulaire ; <c15/> est typé <c16/>. <c17/> maintient les deux listes égales à celles du moteur.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Unités pour chaque colonne <c1/></b> (FUT-28) : un résultat <c2/> porte désormais <c3/> et <c4/>, l'unité de chaque clé balayée et de chaque métrique enregistrée, lues dans la propre table d'unités du paquet balayé. Un axe peut déclarer <c5/> pour une clé que le paquet ne reprend pas ; une unité déclarée qui contredit celle du paquet est refusée, et une unité qu'aucun des deux ne donne vaut <c6/>, jamais devinée. <c7/> et <c8/> sont décrits, de sorte que chacun des { "76" } types de scénario est désormais entièrement couvert par la barrière des unités de champs (plafond de types de scénario non couverts { "1" } -> { "0" }).

# text
# c1: RunOutput
# c2: RunOutput
# c3: array(path)
# c4: columns(path)
# c5: series()
# c6: numpy.ndarray
# c7: numpy.asarray
# c8: data()
# c9: kshana.pyi
seg-3a83af8daa43 = <b>Tableaux NumPy à partir de <c1/></b> (FUT-26) : le <c2/> Python gagne <c3/>, <c4/> et <c5/>, qui renvoient des <c6/> pour une liste numérique, les colonnes numériques d'une liste d'enregistrements, ou chaque série d'enregistrements du document. Chaque tableau égale <c7/> des mêmes valeurs issues de <c8/> (dtype et bits). NumPy n'est importé que lorsque l'une d'elles est appelée et reste hors des exigences d'exécution. Typé dans <c9/> et vérifié par stubtest.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Optimiseur de campagne</b> (CAP-32) : la nouvelle section <c2/> optionnelle du type de scénario <c1/> cherche, parmi une à trois clés de scénario dans des bornes énoncées, la meilleure valeur d'une métrique : la minimiser, la maximiser ou atteindre une cible. Elle cherche de façon exhaustive sur une grille, ou avec un simplexe de Nelder–Mead déterministe et borné. Chaque évaluation est une vraie exécution du type de scénario nommé et est listée dans le <c3/> du résultat. Exemple : <c4/>. Les seuils ont été préenregistrés (<c5/>) :

# text
seg-f4e79236b6bf = la fonction de Rosenbrock est atteinte (f* = { "1.7e-20" }) ;

# text
seg-3dbe3fdfebcf = une résolution de cible 1D en forme close est atteinte ({ "6e-15" } en relatif) ;

# text
seg-5ab478e03354 = la grille est égale au bit près à une force brute indépendante ;

# text
seg-ea0a04c6e713 = le simplexe fait au moins aussi bien qu'une grille de { "41" } × { "41" } en { "177" } exécutions.

# text
seg-161d8c5b55e8 = Le seuil 1D du tour { "1" } est consigné NOT MET, parce que la boîte préenregistrée excluait la solution. MODELLED ; ligne du registre « Optimisation bornée d'une métrique sur des paramètres de campagne ». Additif : les campagnes sans la section sont inchangées.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Ensembles d'étalonnage</b> (CAP-10) : trois vérifications à germe unique ré-exécutées sur { "200" } germes indépendants par rapport à des seuils préenregistrés, dans <a1><c1/></a1> (générées par <c2/> ; valeurs par germe dans <c3/>).

# text
seg-b163e53e06e9 = L'intervalle à { "95" } % du bootstrap Monte Carlo de campagne couvre la vraie moyenne sur { "192" } ensembles sur { "200" }, et son contrôle du khi-deux est franchi sur { "196" }.

# text
seg-022a7fbee13a = La tolérance de centile à germe unique n'est franchie que sur { "183" } sur { "200" } : NOT MET, comme prévu. C'est un seuil d'environ 2 sigma, consigné et non assoupli.

# text
seg-096f36d21b02 = Les étalonnages ADEV en FM blanche sont franchis sur chaque germe, avec leur pire erreur très en deçà de la tolérance.

# text
# c1: Scenario
# c2: BuiltinKind
# c3: api::BuiltinKind
# c4: append_figure_tiers
# c5: inertial
# c6: spoof
# c7: passes
# c8: link-budget
# c9: jamming
# c10: tests/scenario_output_manifest.rs
seg-369c7f2a115c = <b>Types de scénario intégrés via le trait <c1/></b> (FUT-27, en cours) : le trait <c2/> (<c3/>, avec un crochet de niveau par chiffre et <c4/>), et les premiers types de scénario déplacés vers lui (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). La sortie est inchangée : un manifeste du catalogue entier des SHA-256 de chaque sortie est identique avant et après (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>Contrôle d'absence de récupération du terrain de jeu</b> (RM-07) : <c1/> vérifie trois choses :

# text
seg-3e424188f6e1 = chaque scénario de la bibliothèque du Studio est dans le paquet du navigateur ;

# text
# c1: scenarios/
seg-2803ccf8b9ae = le paquet est identique à l'octet près à <c1/> ;

# text
seg-b98016a4a844 = chaque scénario du navigateur s'exécute depuis un répertoire de travail vide.

# text
# c1: gravity-map
# c2: [reference]
# c3: .gfc
# c4: gfc_path
# c5: gps-denied-gravity-nav-egm2008
# c6: [map_error_mc]
# c7: gravity-map-error-mc
# c8: combined-altpnt
# c9: [magnetic_grid]
# c10: csv_path
# c11: column
# c12: tools/fetch_emag2_tile.py
# c13: altpnt::sequential::run_sequential_trn_on_map
# c14: xval/terrain-slam-rbpf/
# c15: terrain-slam
# c16: xval/srtm-ungate/
seg-efc143b4f2a9 = <b>Cartes Alt-PNT : champ de gravité réel, Monte Carlo d'erreur de carte, SRTM pleine résolution</b> ({ "0.36" }, WP-10). Le type de scénario <c1/> accepte un <c2/> optionnel : une anomalie de gravité synthétisée à partir des coefficients EGM2008 fournis (ou d'un fichier ICGEM <c3/> via <c4/>, versions natives seulement). Cette synthèse concorde avec l'ICGEM Calculation Service à environ { "1e-8" } mGal sur { "794" } nœuds dans deux régions, par rapport à des seuils préenregistrés de { "0.005" } mGal en RMS et { "0.02" } mGal en maximum (VALIDATED ; ligne du registre « Synthèse d'anomalie de gravité à partir d'un modèle d'harmoniques sphériques »). Le nouveau scénario fourni <c5/> exécute le banc d'essai de 60 minutes sur ce vrai champ de degré 70. Résultat préenregistré : erreur d'appariement de { "3106" } m, de sorte que le seuil < { "500" } m est NOT MET, comme prévu (le degré { "70" } est trop lisse), et la réduction par dix de la dérive est MET (MODELLED). Un <c6/> optionnel ré-exécute le banc d'essai sur des erreurs de carte gaussiennes corrélées, à germe fixé, et rapporte la distribution de l'erreur d'appariement (scénario fourni <c7/>). Exploratoire et non préenregistré : avec une erreur de carte de { "2" } mGal corrélée sur { "0.2" } deg (la taille que budgète le propre sigma de l'apparieur), { "1" } réalisation sur { "20" } reste à moins de { "500" } m (médiane { "2.9" } km, p95 { "14.7" } km), contre { "144" } m avec une carte parfaite. Le positionnement synthétique du banc d'essai en deçà de 500 m suppose que la carte est exacte. Sans l'une ou l'autre option, le document est identique à l'octet près à celui des versions antérieures. <c8/> accepte un <c9/> optionnel (<c10/>, <c11/>) qui lit le canal magnétique à partir d'un CSV au format EMAG2v3. EMAG2 n'est pas intégré au dépôt parce que ses conditions ne sont pas explicites : <c12/> le récupère avec un SHA-256 épinglé et en découpe un rectangle. Aucun résultat de navigation n'est revendiqué sur la vraie grille EMAG2. Estimation conjointe de la carte (SLAM de terrain, RM-18) : <c13/> fait voler le navigateur séquentiel de terrain sur une carte stockée qui diffère de la vérité, soit en lui faisant confiance, soit en estimant une correction de carte par cellule avec un filtre Rao-Blackwellisé de type FastSLAM. Préenregistré par rapport au SITAN à carte connue avec une erreur de carte corrélée de { "15" } m sur { "20" } germes : un gain moyen de { "1.5" } %, meilleur dans { "10" } cas sur { "20" }, de sorte que les deux seuils d'amélioration sont NOT MET ({ "10" } % et { "12" } sur { "20" }), sans dommage sur une carte parfaite (MET). Un seul passage sans revisites ne permet pas d'apprendre la carte (<c14/>, MODELLED). Les documents <c15/> sont identiques à l'octet près. Les tests SRTM réels s'exécutent désormais en CI sur deux extraits pleine résolution versés ; tous les seuils préenregistrés sont atteints, le nœud le plus proche égalant GDAL { "3.8.4" } en { "8" } points sur { "8" } (<c16/>).

# text
seg-aa7ac7a47111 = <b>Interopérabilité, WP-08</b> ({ "0.36" } ; chaque élément préenregistré et commité seul avant son exécution de référence indépendante, chacun une nouvelle ligne VALIDATED du registre sauf l'élément de télémétrie, qui élargit une ligne existante) :

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>Messages de données d'orbite CCSDS</b> (<c1/>) : OPM 3.0/2.0, OMM 3.0/2.0 et OCM { "3.0" } (blocs TRAJ, PHYS, COV, MAN, USER) écrits et lus en KVN et NDM/XML, et un OMM en pleine précision à partir d'un jeu d'éléments SGP4 (<c2/>) ; la sortie de <c3/> est inchangée. Par rapport à Orekit { "13.1.8" } dans les deux sens : { "27" } messages Kshana sur { "30" } sont analysés par Orekit et Kshana lit chaque message écrit par Orekit, valeurs à moins de { "1e-14" } en relatif et époques à moins de { "1e-9" } s ; quatre constats épinglés (Orekit exige <c4/>, refuse <c5/> dans les paramètres XML définis par l'utilisateur, n'écrit pas <c6/> sans <c7/>, et lit les époques relatives de l'OCM en TDB en secondes SI). Le <c8/> de l'ancien écrivain OMM est refusé par Orekit (consigné). Ligne « Messages de données d'orbite CCSDS (OPM, OMM, OCM) ».

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>Messages de données d'attitude CCSDS</b> (<c1/>, <c2/>) : AEM 2.0/1.0 et APM { "2.0" } en KVN et XML par rapport à Orekit { "13.1.8" }, tous les seuils atteints ; l'écrivain APM d'Orekit refuse une manœuvre sans <c3/> (épinglé). Ligne « Messages de données d'attitude CCSDS (AEM, APM) ».

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>Export SPICE SPK</b> (<c1/>) : écrivain et lecteur des types SPK { "9" } et { "13" } et export OEM vers SPK ; par rapport à CSPICE N0067, les noyaux sont identiques à l'octet près à ceux de SPICE et s'évaluent à l'identique au bit près. Ligne « Export SPICE SPK (types { "9" } et { "13" }) ».

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>Types SPICE SPK { "3" } et { "21" }</b> (<c1/>) : segments de type { "3" } (Tchebychev) et de type { "21" } (lignes de différences étendues) écrits à partir d'enregistrements donnés et évalués comme le fait SPICE ; par rapport à CSPICE N0067, les noyaux sont identiques à l'octet près à ceux de SPICE et chaque évaluation concorde bit pour bit dans les deux sens. Ligne « Types SPICE SPK { "3" } et { "21" } (Tchebychev, lignes de différences étendues) ».

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Extensions de Space Packet</b> (<c1/>) : en-tête secondaire avec codes de temps CUC/CDS, contrôle d'erreur de paquet, segmentation et contrôles de flux, par rapport à ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } et <c2/> de CPython, zéro écart. Ligne « En-tête secondaire, contrôle d'erreur de paquet et segmentation des CCSDS Space Packet ».

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Schéma de télémétrie { "1.3" } à travers de vrais consommateurs</b> : l'exposition Prometheus et le JSON OTLP/HTTP d'un flux synthétique de schéma 1.3, y compris la série de géométrie et l'étiquette <c1/>, lus exactement par prometheus_client et le proto OTLP, acceptés par promtool { "3.5.0" } <c2/> sans problème de lint, et transmis inchangés par l'OpenTelemetry Collector contrib { "0.135.0" } (conditionné par les données : outils récupérés avec des SHA-256 épinglés, sorties versées).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Détermination d'orbite de Mars, exécution { "2" }</b> ({ "0.36" }, WP-14, CAP-30) : <c1/> met la matrice normale à l'échelle de sa diagonale et amortit le pas (Levenberg-Marquardt), après l'échec de l'ajustement de Gauss-Newton enregistré sur une matrice dont la diagonale brute s'étend sur huit ordres de grandeur. Enregistré séparément (<c2/>, même arc, mêmes seuils et même édition). Sur les passages MRO notés, l'orbite est à moins de { "0.36" } km en RMS ({ "0.53" } km au maximum) de la reconstruction de navigation de MRO, seuils atteints. Le Doppler après ajustement est de { "48.6" } mHz contre le seuil de { "30" } mHz, non atteint (constat épinglé). Un amendement portant uniquement sur la notation, R2-A1, est divulgué dans <c3/>. La ligne reste MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Modèle Doppler à 2 voies à rampe de Mars et détermination d'orbite</b> ({ "0.36" }, WP-14, partie de CAP-30, étape { "2" }) : <c1/> prédit le Doppler à 2 voies en bande X à rampe du DSN à partir de tables de rampe ODF (temps de lumière, Shapiro, troposphère, temps de station, stations du DSN par la chaîne CIO et les EOP de l'IERS) et ajuste un orbiteur martien (GMM-3, troisièmes corps, SRP, traînée). <c2/> lit le SPK de type { "1" } (vérifié par rapport à CSPICE) et <c3/> lit les champs PDS SHADR. Préenregistré par rapport à la reconstruction de navigation de MRO sur de vrais passages MRO (conditionné par les données, <c4/>, CI mensuelle) : le Doppler prédit concorde avec les observations à { "12.5" } mHz (seuil { "30" } mHz, atteint) ; l'ajustement d'orbite enregistré a échoué sur l'arc noté et n'a produit aucune orbite (constat épinglé). La ligne reste MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>Lecteur de fichiers de données d'orbite du DSN</b> ({ "0.36" }, WP-14, partie de CAP-30) : <c1/> lit des ODF TRK-2-18. Sur un vrai ODF du Mars Reconnaissance Orbiter (NASA PDS, intégré au dépôt), le lecteur concorde avec le nombre d'enregistrements, les positions de groupes, les stations et les heures de l'étiquette PDS, et tous ses types de données sont connus. La table de fin de fichier de l'étiquette a une ligne de moins que le fichier, une incohérence de l'étiquette consignée comme constat. MODELLED. La détermination d'orbite sur ces données n'est pas encore faite.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>Bilan TWSTFT et stabilité du transfert de temps : le type de scénario <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Équation bidirectionnelle :

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> la résout pour T_A − T_B avec les retards d'équipement des stations, l'asymétrie ionosphérique montante/descendante en bande Ku, la différence de retard du transpondeur et les termes de Sagnac, et retrouve le modèle direct à { "1e-15" } s.

# text
seg-a5468765380d = <b>Bilan d'incertitude :</b> combiné en quadrature, avec le TDEV de la liaison comme terme de type A.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Bruit de liaison :</b> la série bidirectionnelle gagne un plancher de bruit de phase de scintillation, une non-réciprocité diurne et un résidu de réciprocité constant. Le paquet <c1/> à gigue blanche est inchangé.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Série réelle :</b> la stabilité d'une série fournie de la Circular T du BIPM, d'un CSV <c1/> ou d'horloges de station de l'IGS.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Nouveau scénario fourni <c1/>. La solution de temps PPP est VALIDATED séparément par rapport à l'horloge de station de l'IGS sur la branche de données réelles GNSS.

# text
seg-ae33b92da4a6 = <b>Échauffement d'entrée, radiométrie EO et pertes à l'ascension</b> ({ "0.36" }, WP-14, CAP-28) : trois nouveaux types de scénario.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/> : une entrée à 3 degrés de liberté en masse ponctuelle sur une Terre ou un Mars en rotation avec échauffement au point d'arrêt de Sutton-Graves.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/> : SNR de l'imageur, FTM à Nyquist, réponse relative de bord et NIIRS GIQE { "4" }.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/> : une ascension à virage gravitationnel à plusieurs étages avec pertes de gravité, de traînée, de pilotage et de contre-pression, vérifiée par l'identité exacte dv idéal moins pertes.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = La décélération maximale de l'entrée a été vérifiée par rapport au nominal publié de Stardust sous un seuil préenregistré : { "35.44" } g contre { "33.4" } g (+{ "6.1" } %, seuil { "10" } %). Cette ligne est VALIDATED. L'échauffement, la radiométrie et l'ascension sont MODELLED. Nouveaux également : <c1/>, les scénarios fournis <c2/>, <c3/> et <c4/>, et <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Contrôle d'attitude par roues de réaction : le type de scénario <c1/></b> ({ "0.36" }, WP-14, CAP-21). Une manœuvre de pointage inertiel d'un corps rigide avec trois roues de réaction équilibrées ou plus sous rétroaction MRP, avec des couples de roues de norme minimale écrêtés à la limite de chaque moteur (<c2/>). Il peut aussi boucler sur un EKF multiplicatif à partir d'un gyromètre et d'un viseur d'étoiles simulés (<c3/>). La boucle d'état vrai a été comparée à Basilisk { "2.9.1" } sur trois cas préenregistrés avant l'existence du code (trois roues orthogonales, une pyramide à quatre roues, un cas de saturation). Chaque composante MRP, vitesse du corps, vitesse de roue et couple de moteur concordait à chaque échantillon, pire { "2.4e-14" } en sigma et { "2.9e-11" } rad/s en vitesse de roue. Cette ligne est VALIDATED ; le MEKF est MODELLED (cohérence NEES). Nouveaux scénarios fournis <c4/> et <c5/>, et <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Planification des contacts sol et ACM DVB-S2</b> ({ "0.36" }, WP-14, CAP-22/23) : deux nouveaux types de scénario. <c1/> donne, pour un satellite au-dessus d'une station, l'Es/N0 de chaque passage et le MODCOD DVB-S2 choisi le long de celui-ci (seuils de la Table { "13" } de l'ETSI EN { "302" } 307-1 plus une marge). Il donne aussi le volume de données que l'ACM déplace par rapport à la référence de base à codage constant. <c2/> fait de même pour plusieurs satellites au-dessus de plusieurs stations et construit un plan de contacts sans conflit (retournement d'antenne, une station par satellite, livraison pondérée par priorité plafonnée à chaque arriéré). Il rapporte un plan glouton à valeur marginale, une référence de base au premier arrivé et l'optimum exact sur de petits ensembles, avec l'écart d'optimalité du glouton. Les fenêtres d'accès proviennent du prédicteur de passages apparents VALIDATED. Nouveaux scénarios fournis <c3/> et <c4/> (entrées à titre d'illustration) et <c5/>. MODELLED (deux nouvelles lignes du registre).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Positionnement Doppler Starlink par rapport à une expérience publiée</b> ({ "0.36" }, WP-14, partie de CAP-11, MODELLED). Il s'agit d'une comparaison par substitut préenregistrée du mode Doppler <c1/> avec le préréglage <c2/> par rapport aux centiles du jeu de données 3 de « Unveiling Starlink for PNT » (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Le modèle utilisait { "3" } satellites (un masque de { "47" } deg choisi par une règle fixe), aucune aide d'altitude et un sigma Doppler de { "30" } Hz, sur { "200" } germes. Son erreur 3D au 90e centile est de { "92.2" } m à { "20" } s et de { "870" } m à { "8" } s, contre { "2" } m et { "10" } m publiés, de sorte que les deux seuils d'un facteur deux sont NOT MET. Le modèle est pessimiste, et non optimiste comme prévu : trois satellites fixes donnent bien moins de diversité géométrique que les { "63" } satellites de l'expérience sur { "10" } minutes avec un changement de canal toutes les { "15" } s. Les deux écarts sont affirmés (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Optimiseur de transfert impulsionnel sur DE440</b> ({ "0.36" }, WP-14, CAP-20c/d) : <c1/> trouve les dates de départ et d'arrivée d'un transfert balistique à deux impulsions à une seule révolution qui minimisent le C3 au départ ou le V-infini à l'arrivée dans le Type I ou le Type II. Il cherche sur une grille de 2 jours, puis affine par Nelder-Mead 2D, sur des états héliocentriques issus du noyau DE440 ; il s'appuie sur <c2/>. La comparaison a été préenregistrée (bf0439e8) par rapport à un optimiseur indépendant SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } sur l'opportunité Terre vers Mars de { "2026" } : les quatre optimisations concordent à { "8.7e-13" } en relatif, avec des dates à moins de { "1e-5" } jour (VALIDATED, nouvelle ligne du registre). Comme référence publiée secondaire, NASA/TM-2010-216764 (le manuel Terre vers Mars 2026-2045) concorde pour le C3 minimal du Type II ({ "9.182" } contre { "9.144" }) et pour le V-infini minimal à l'arrivée du Type II ({ "2.564" } contre { "2.565" }). Son C3 minimal du Type I ne concorde pas : { "10.535" } contre { "11.11" } (-5.18 %), alors que la référence indépendante de bibliothèque concorde avec Kshana. Cet écart est consigné et affirmé.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Étude d'une station de référence lunaire</b> ({ "0.36" }, motivée par des documents publiés sur une station de référence lunaire prévue au pôle sud ; sources dans <a1><c1/></a1>) : le type de scénario <c2/>, un balayage Monte Carlo du modèle PNT différentiel lunaire sur une grille d'utilisateurs polaire sud et une journée d'époques, donnant par point et sur la région l'erreur corrigée et non corrigée en centiles, la disponibilité avec ses raisons, la couverture par rapport à un seuil énoncé, les niveaux de protection, le rayon de couverture par azimut et le bilan de la liaison de corrections. Il se réduit exactement à <c3/> en un point, une époque et un essai ; son arithmétique a été recalculée par numpy sous un seuil préenregistré (positions et centiles atteints ; les corrections de la station ont manqué les leurs à cause d'arrondis en double précision, consigné). MODELLED ; ligne du registre « Carte de couverture et de précision d'une station de référence lunaire ». Sans affiliation ni aval d'aucune agence ; aucune déclaration sur les performances d'un système réel.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Prédiction préenregistrée : couverture d'une station de référence lunaire</b> (pas une validation ; MODELLED). <a1><c1/></a1> fige, au commit c05dac1d, les résultats de <c2/> sous les hypothèses énoncées publiquement, avec des hachages SHA-256 des entrées et des résultats et un protocole de notation fixé dès maintenant (facteur { "2" } pour les précisions et les niveaux de protection, { "10" } points de pourcentage pour la disponibilité et la couverture ; une hypothèse modifiée donne une nouvelle prédiction datée, jamais une modification ; un échec est publié aussi visiblement qu'une réussite). Chaque chiffre est dominé par le jeu d'éléments non publié de la constellation de quatre satellites, qui est ILLUSTRATIVE, et le dit. <c3/> la protège ; <c4/> gagne une section « Prédictions préenregistrées ». Aucune ligne du registre.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Extensions de la station de référence lunaire</b> ({ "0.36" } ; les limites { "2" } et { "3" } de l'étude de la station et le style de solution des sources), chacune optionnelle sur <c1/> et absente par défaut, de sorte que chaque document existant, la prédiction figée comprise, est inchangé : <c2/> (trajets multiples <c3/> chez l'utilisateur et à la station, celui de la station éventuellement de Gauss-Markov sur les époques, bruit de code du DLL issu du C/N0, biais inter-canaux ; valeurs ILLUSTRATIVE sur la Lune) ; <c4/> (croissance linéaire de l'erreur d'orbite diffusée sur la latence de correction, ILLUSTRATIVE) ; <c5/> (contrainte de hauteur, minimum de trois satellites avec elle, une fenêtre d'utilisateur statique sur les époques). Deux addenda à la comparaison avec les affirmations publiées, chacun préenregistré seul avant son exécution, figurent à côté de l'exécution consignée non modifiée : K5 avec croissance échoue à chaque taux ; avec le style de solution des sources, K1 à K5 échouent et K6 est franchi ({ "1" } sur { "6" }), l'erreur 3D corrigée au p95 de R300 passant de { "280.6" } m à { "2.11" } m. MODELLED ; trois lignes du registre.

# text
# c1: [terrain]
# c2: lunar-station-coverage
# c3: moonlight-service-volume
# c4: station_horizon
# c5: user_horizon
# c6: dem_path
# c7: LDEM_75S_240M
# c8: data/lunar-dem/
# c9: scripts/make_lola_south_polar_crop.py
# c10: scenarios/lunar-station-coverage-terrain.toml
seg-1d0a0dcd42de = <b>Masques d'horizon de relief lunaire</b> ({ "0.36" } ; la première limite de l'étude de la station de référence lunaire) : une section <c1/> optionnelle sur <c2/> (la station et chaque point utilisateur) et <c3/> (chaque point de grille) donne à chaque site un horizon dépendant de l'azimut au format de la table de ligne d'horizon de la { "0.36" }, à partir d'un profil énoncé étiqueté avec sa source (<c4/>, <c5/>) et/ou d'un lancer de rayon sur un MNT polaire (<c6/>) le long de grands cercles de la sphère lunaire avec la courbure exacte. Intègre au dépôt un extrait de { "0.98" } Mo du MNT polaire sud LRO LOLA du domaine public <c7/>, rééchantillonné par moyenne de blocs { "5" } x { "5" } à { "1200" } m (<c8/>, avec son NOTICE, son SHA-256 et <c9/>), et le scénario réservé au dépôt <c10/>. Vérifié par rapport à des horizons en forme close (sphère nue, cratère dans un plateau, cône rastérisé) ; MODELLED, ligne du registre « Masques d'horizon de relief lunaire à partir d'un profil énoncé ou d'un MNT polaire ». Sans la section, chaque document, bloc d'unités compris, est identique à l'octet près.

# text
# c1: receiver-trust
# c2: good
# c3: degraded
# c4: few-satellites
# c5: high-pdop
# c6: high-hdop
# c7: sky-blocked
# c8: unknown
# c9: orbit::dop
# c10: good
# c11: fair
# c12: poor
# c13: geometry
# c14: geometry
# c15: environment
# c16: inconsistency
# c17: loss-of-lock
# c18: geometry
# c19: inconsistency
# c20: [geometry]
# c21: signal_loss
# c22: environment
# c23: cap_points
# c24: full_ratio
# c25: floor
# c26: degraded_min
# c27: [geometry]
# c28: min(cap_points, 100 - floor)
# c29: [score]
# c30: degraded_min
# c31: degraded_min
seg-ca0c6ca7396a = <b>Confiance tenant compte de la géométrie</b> (note de conception de la géométrie { "0.36" }, section { "4" }). Chaque époque <c1/>, statique ou navire, par lot ou en direct, porte sa géométrie de satellites : <c2/>, <c3/> (raisons <c4/>, <c5/>, <c6/>, et <c7/> à titre informatif) ou <c8/> lorsque le journal ne donne aucune géométrie de satellites, avec le HDOP, le PDOP, le VDOP et les satellites utilisés. Elle est dérivée des élévations et azimuts que rapporte le récepteur (NMEA GSV, UBX NAV-SAT) par le noyau existant <c9/>, ou prise dans NMEA GSA. Chaque époque porte aussi une étiquette, <c10/>, <c11/> ou <c12/>, toujours rapportée et jamais notée, et une note avec le HDOP, le PDOP, le VDOP, le nombre de satellites et la perte de signal en toutes lettres. Le score d'un navire gagne un moniteur <c13/> qui ne retranche rien sauf si la géométrie est mauvaise (HDOP supérieur à { "4" }, PDOP supérieur à { "6" } ou moins de { "5" } satellites utilisés), puis monte progressivement jusqu'à un plafond de { "15" } points ; la géométrie seule atteint au plus la bande dégradée, jamais la bande non fiable (aucune alarme). Chaque retrait reçoit une classe, <c14/>, <c15/> ou <c16/>, de sorte qu'un mauvais ciel ne se lit pas comme une attaque. <c17/> est <c18/> lorsque les satellites perdus étaient tous sous { "15" } degrés à leur dernier rapport ; un retrait pour mauvaise géométrie est <c19/> lorsque le HDOP que le récepteur énonce est en désaccord avec son ciel énoncé de plus de max({ "1.0" }, { "25" } % du HDOP dérivé), de sorte qu'un mauvais ciel falsifié ne peut pas acheter l'étiquette. Une nouvelle table <c20/> énonce chaque seuil avec sa provenance (HDOP { "4" }, PDOP { "6" }, au moins { "5" } utilisés, sigma_UERE { "1.5" } m, une tolérance de HDOP de max({ "1.0" }, { "25" } % du HDOP dérivé) avec les { "25" } % comme choix représentatif pour des récepteurs à horloges par constellation ou à solutions par sous-ensembles, { "15" } degrés ; les chiffres de l'IEC 61108-1 et du GPS SPS tels que cités, à vérifier par rapport au texte des normes). La perte totale de signal n'est pas étiquetée comme ciel : lorsque des satellites en vue ne sont pas suivis et que le DOP des satellites en vue est bon (et que ceux qui ne sont pas suivis ne sont pas confinés à une moitié de l'horizon), l'époque porte <c21/> et le retrait de géométrie est <c22/>. Un HDOP ou PDOP énoncé de { "99" } ou plus, une qualité GGA de { "0" } et un mode GSA de { "1" } sont lus comme une absence de point, et non comme un DOP. Le plafond (<c23/> { "15" }), la fin de la rampe (<c24/> { "1.5" }) et le plancher (<c25/>, par défaut le <c26/> du score) figurent dans <c27/>, de même que les bons niveaux de l'étiquette (HDOP { "2" }, PDOP { "3" }, { "6" } satellites, représentatifs) ; le plafond en vigueur est <c28/>, de sorte qu'une table <c29/> qui relève <c30/> (y compris une de { "0.35" }) abaisse le plafond au lieu d'être refusée, et un plancher sous <c31/> est refusé. MODELLED ; logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
# c1: epochs[].geometry
# c2: class
# c3: geometry_model
# c4: geometry_summary
# c5: receiver_trust
# c6: assess_vessel_log
# c7: receiver_trust_replay
# c8: assess_*
# c9: epochs.json
# c10: config.json
# c11: trust-telemetry
# c12: kshana_trust_geometry*
# c13: class
# c14: kshana_trust_reason_active
# c15: kshana.geometry.*
# c16: cs6
# c17: cfp3
# c18: cfp4
# c19: geoStatus
# c20: geoHdop
# c21: geoClass
# c22: kshana_trust_geometry_label{label}
# c23: kshana_trust_geometry_vdop
# c24: kshana.geometry.label
# c25: kshana.geometry.vdop
# c26: geoLabel
# c27: geoPdop
# c28: geoVdop
# c29: geoUsed
# c30: cs6
# c31: cn1
# c32: geometry_summary.hdop_mismatch
# c33: degraded
# c34: kshana_trust_geometry_signal_loss
# c35: kshana.geometry.signal_loss
# c36: geoSignalLoss=1
# c37: environment
# c38: cs6
seg-d976d3495695 = La géométrie atteint chaque surface : le JSON de résultat (<c1/>, <c2/> sur chaque retrait, <c3/>, <c4/>), les lignes JSON en direct (schéma { "1.3" }), les <c5/>, <c6/> et <c7/> Python et WebAssembly, les outils MCP <c8/>, les paquets de preuves (<c9/>, <c10/>, une voie de géométrie sur la page de synthèse) et <c11/> (Prometheus <c12/> et une étiquette <c13/> sur <c14/>, OTLP <c15/>, champs personnalisés CEF <c16/> (état et classes de géométrie), <c17/> (HDOP) et <c18/> (PDOP), vérifiés par rapport aux deux analyseurs de référence CEF, et LEEF <c19/>, <c20/>, <c21/>). L'étiquette de géométrie est exportée aussi, ajoutée après chaque série et chaque champ antérieurs et seulement pour les entrées qui la portent : Prometheus <c22/> et <c23/>, OTLP <c24/> et <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, et CEF un troisième champ <c30/> (l'étiquette) et <c31/> (satellites utilisés) ; le VDOP n'est pas dans CEF (les champs personnalisés à virgule flottante sont pris). Les deux analyseurs de référence CEF relisent les cas d'étiquette tels qu'écrits (amendement { "5" } : { "176" } lignes, { "172" } analysées par pycef, { "176" } par Logstash). Un HDOP énoncé que le ciel énoncé n'explique pas est signalé à chaque époque et compté (<c32/>, une ligne sur la page de synthèse des preuves), noté seulement lorsque la géométrie est mauvaise. La perte de signal est exportée séparément, puisque l'état de géométrie reste <c33/> tant qu'elle dure : Prometheus <c34/>, OTLP <c35/>, LEEF <c36/> ; en CEF elle apparaît comme la classe <c37/> dans <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/> : le facteur de covariance <c2/> derrière <c3/>, extrait de celui-ci avec la même arithmétique.

# text
seg-c6cc061a3ed6 = Ligne du registre « Erreur de position due à la géométrie : erreur RMS = sigma_UERE x DOP » (<b>MODELLED</b>, cohérence interne) : un Monte Carlo à germe fixé de la solution par moindres carrés du moteur sur les { "8" } géométries DOP appariées à gnss_lib_py par rapport au facteur de covariance du noyau DOP validé, avec des tolérances préenregistrées avant la première exécution et deux contrôles négatifs qui échouent comme requis ; à côté, un contrôle antérieur sur quatre ciels choisis à la main avec des intervalles de confiance du khi-deux, rapporté comme exécuté avant le préenregistrement.

# text
# c1: src/skyline.rs
# c2: docs/SKYLINE.md
# c3: max(mask_deg, skyline)
# c4: city-street
# c5: harbour-approach
# c6: fjord
# c7: container-terminal
# c8: [skyline]
# c9: gnss-sim
# c10: jamming
# c11: leo-pvt
# c12: leo-pass
# c13: nmea-scenario
# c14: orbit
# c15: integrity
# c16: user_site = { lat_deg, lon_deg, height_m }
# c17: epoch + t
# c18: epoch
# c19: user
# c20: skyline { source, open_fraction, provenance }
# c21: masked_by_skyline
# c22: orbit-urban-canyon-skyline
# c23: integrity-harbour-approach
# c24: gnss-sim-container-terminal-skyline
# c25: jamming-harbour-approach-skyline
# c26: leo-pvt-fjord-skyline
# c27: leo-vertical-autonomous-vehicle-skyline
seg-b87b6eafd465 = <b>Masques de ligne d'horizon dépendant de l'azimut</b> (<c1/>, <a1><c2/></a1>, élément { "1" } de la note de conception) : une coupure d'élévation qui dépend de l'azimut, le maximum point à point de tables (chacune interpolée séparément, rebouclée à { "360" }°), un canyon de rue en forme close (avec extrémités ouvertes optionnelles), des secteurs à bords nets et un profil de relief avec la courbure de la Terre ; la coupure effective est <c3/>. Quatre préréglages REPRESENTATIVE avec une provenance énoncée (<c4/>, <c5/>, <c6/>, <c7/>), modifiables champ par champ. Une section <c8/> optionnelle dans les fichiers d'entraînement <c9/>, <c10/>, <c11/> (chaque mode, balayage polaire compris), <c12/> et <c13/>, et dans <c14/> et <c15/> par un nouvel utilisateur au sol, <c16/> (angles de vue géodésiques sur la Terre en rotation, avec le haut géodésique pour la séparation horizontale et verticale de l'ARAIM ; chaque échantillon est un instant absolu, <c17/>, auquel les jeux d'éléments, les éphémérides diffusées et les fichiers SP3 sont avancés à partir de leurs propres époques, datés à partir de l'époque de satellite la plus récente lorsqu'aucun <c18/> n'est énoncé ; un <c19/> en orbite refuse une ligne d'horizon). Les résultats gagnent <c20/> et, par échantillon, <c21/>. Sans la section, chaque scénario est identique à l'octet près à la { "0.35.0" }, vérifié par rapport à des empreintes du commit de version. Six exemples fournis : <c22/>, <c23/>, <c24/>, <c25/>, <c26/> et la campagne <c27/> (le canyon du véhicule autonome comme coupure plate et comme rue ; la campagne existante est inchangée). MODELLED.

# text
# c1: src/geometry.rs
# c2: sky_geometry
# c3: tle
# c4: epoch
# c5: sky_source
# c6: sky_statement
# c7: tle_skipped
# c8: sky_monte_carlo
# c9: skyline_presets
# c10: skyline_profile
# c11: skyplot_svg
# c12: orbit::dop_cov
# c13: orbit::dop
# c14: kshana sky
# c15: kshana skyline
# c16: sky_geometry
# c17: notebooks/geometry.ipynb
# c18: .md
# c19: tests/python/test_notebooks.py
seg-95cdecf341d6 = <b>Fonctions de géométrie du ciel</b> (<c1/>, élément { "2" } de la note de conception) : <c2/> (satellites visibles et masqués depuis un site, à un instant donné et avec des préréglages de constellations, des jeux d'éléments à deux lignes (<c3/>, au plus { "4" } MiB, propagés par le SGP4 du moteur jusqu'à une <c4/> UTC) ou des satellites donnés ; <c5/> et <c6/> disent si le ciel est représentatif ou bien le ciel que donnent les jeux d'éléments à cette époque, et non une mesure ; <c7/> liste chaque ligne inutilisée avec sa raison ; plafonds d'entrée de { "2000" } satellites au-dessus de l'horizon, vérifiés avant qu'une table de système soit construite, et de { "16" } horloges de récepteur ; les cinq DOP ; le cofacteur et la covariance ENU avec une horloge par système ou une horloge commune ; l'ellipse d'erreur horizontale à un sigma et à une confiance énoncée), <c8/> (erreurs par moindres carrés à germe fixé, au plus { "5000" }), <c9/>, <c10/> et <c11/>. <c12/> expose la covariance derrière <c13/>, qui en est désormais la réduction (les scalaires validés sont inchangés). Surfaces : <c14/> et <c15/>, fonctions Python et WASM de mêmes noms, et l'outil MCP <c16/> ({ "40" } outils), et le carnet <c17/> (avec son miroir <c18/> ; exécuté par <c19/>). Chaque résultat porte l'étiquette MODELLED, l'énoncé du modèle d'erreur et la mention à titre consultatif.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Registre : cinq lignes de ligne d'horizon et de géométrie du ciel. <b>VALIDATED</b>, chacune dans une comparaison préenregistrée avant l'exécution de sa référence indépendante : <em>Masque de ligne d'horizon dépendant de l'azimut : ensemble visible, azimut et élévation, et DOP sous le masque</em> par rapport à Orekit { "12.2" } (<c1/>, <c2/>) et gnss_lib_py { "1.0.4" } (<c3/>), pires différences d'angle de vue et de masque { "1.1e-12" }° contre { "1e-9" }°, ensembles visibles identiques, DOP { "3.3e-13" } en relatif (<c4/>) ; <em>Ellipse d'erreur horizontale et cofacteur par système à partir de la covariance de géométrie</em> par rapport à <c5/> et <c6/> de numpy (P2 standard), { "270" } cas, axes { "5.1e-13" } en relatif (<c7/>). <b>MODELLED</b> : les réductions de canyon, de secteur et de relief ; les préréglages ; la composition de la géométrie du ciel (ciel prédéfini, nuage Monte Carlo).

# text
seg-8f5ebce999fe = Avec les lignes de confiance de la géométrie, de ligne d'horizon et de station de référence lunaire, le registre compte { "274" } lignes : { "134" } validées, { "136" } modélisées, { "4" } partenaire.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Station de référence lunaire : laboratoire de temps de station</b> (<b>MODELLED</b>). Un bloc <c1/> optionnel sur <c2/> (<c3/>). Il modélise une horloge de station (par défaut la classe miniRAFS, toute classe nommée, ou une fiche d'appareil ajustée sur des points de stabilité énoncés) pilotée sur le LTC, puis en roue libre ou re-pilotée toutes les N secondes. Il émet la courbe d'erreur de temps x(t), le temps pour atteindre { "1" }, { "10" } et { "100" } ns (bissection à côté de la forme close) et le terme dominant par horizon, le tout avec des unités. Le résidu de pilotage est ILLUSTRATIVE. Le taux du LTC n'est pas redérivé et garde sa propre ligne VALIDATED. L'objectif au niveau de la nanoseconde du document public ICG WG-B Lunar PNT (juin { "2024" }) est cité comme énoncé de source, et non comme revendication. L'ordre des horloges optique < PHM < RAFS < miniRAFS tient de { "1" } s à { "7e5" } s, et le test épingle le croisement des courbes PHM et RAFS près de { "7.5e5" } s. Ce croisement est une propriété des modèles d'horloge à un seul type de bruit (FM de scintillation pure contre FM blanche pure), et non un résultat physique. Sans le bloc, le rapport, sa table et sa synthèse sont inchangés. Exemple : <c4/>. Ajoute une ligne du registre, étiquetée MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Station de référence lunaire : géodésie de la station</b> (<b>MODELLED</b>). Des entrées optionnelles <c1/> et <c2/> sur <c3/> ajoutent un bloc <c4/>. L'information de datum à cinq réseaux issue de la tranche archivée de télémétrie laser est combinée avec ce qu'apporteraient un rétroréflecteur ajouté et une balise VLBI ajoutée à des sites énoncés. Le réflecteur est visé aux époques archivées où il est visible, avec leurs poids archivés. La balise utilise le réseau et le calendrier de <c5/>, les stations étant fixées. Le bloc donne chaque 1-sigma de Helmert avant et après, et leur rapport. Ce sont des bornes de Cramer-Rao pour un jeu de paramètres réduit, sur un calendrier et un site ILLUSTRATIVE. Des entrées absentes ou vides laissent le rapport identique à l'octet près. Exemples : <c6/> et <c7/>. Ajoute une ligne du registre, étiquetée MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Station de référence lunaire : comparaison avec les affirmations publiées</b> (<b>MODELLED</b>). Chaque affirmation chiffrée de cinq sources publiques est listée avec sa formulation exacte, sa page et ses hypothèses énoncées, et classée comme comparable, partiellement comparable ou non comparable (<c1/> ; sources avec URL, date de récupération, SHA-256 et licence dans <c2/>). Les affirmations partiellement comparables ont été notées sous six seuils unilatéraux préenregistrés avant l'exécution (<c3/>, révision { "2" }, 05bf9a19) : { "1" } affirmation sur { "6" } dans le seuil préenregistré (préenregistré 05bf9a19). La couverture est de { "0.00" } contre >= { "0.95" } sur les deux cercles polaires sud, et le p95 corrigé est de { "280.6" } m contre <= { "1.5" } m. La cause tient aux éléments orbitaux des satellites, qu'aucune source ne publie : sur les éléments ILLUSTRATIVE du dépôt, quatre satellites sont en vue commune dans { "8" } % des époques, avec une géométrie quasi singulière. L'exécution ne reproduit pas les affirmations sur ces éléments et n'est pas une preuve que les affirmations sont fausses. Épinglé dans <c4/>. Une ligne du registre, étiquetée MODELLED avec le constat.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Station de référence lunaire : préparation des données de fichiers d'horloge</b>. <c1/> énonce désormais le système de temps de ses époques. C'est la valeur de <c2/> ou, lorsqu'elle n'est pas déclarée, la valeur par défaut du système de satellites de l'en-tête. Le résultat indique aussi si le système était déclaré. La fonction refuse un système de temps inconnu (une échelle de temps lunaire, par exemple), un fichier à systèmes mixtes non déclaré, et des fichiers en désaccord, au lieu de les lire comme du temps GPS. Elle fournit une fixture d'horloge de station synthétique. Aucun format de fichier de corrections n'est défini, parce qu'aucun format public n'existe.

# text
seg-0fb89eb36003 = Modifié

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = La documentation de module de <c1/>, <c2/> et <c3/> ne présente plus comme un travail futur le navigateur UKF à 17 états, le couplage serré à INS complet et l'état d'horloge explicite ; elle renvoie à <c4/>, <c5/> et <c6/>.

# text
seg-aedd06cf6127 = <b>RINEX { "4" } n'est plus refusé</b> ({ "0.36" }, WP-07) : un fichier de navigation RINEX { "4" } était rejeté volontairement ; il est désormais lu (voir Ajouté). Pour les fichiers d'observation de version { "4" } et ultérieure, les étiquettes d'en-tête ne sont appariées que dans les colonnes 61-80, de sorte que les nouveaux enregistrements de texte libre ne peuvent pas passer pour des étiquettes.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> lit de vrais fichiers IONEX</b> ({ "0.36" }, WP-07) : un enregistrement complet de 16 valeurs remplit les colonnes 61-80, que le lecteur prenait pour une étiquette, de sorte qu'il renvoyait <c2/> sur chaque vrai fichier IONEX. Il lit désormais comme des valeurs un enregistrement dont le champ d'étiquette est numérique. Aucune sortie livrée ne l'utilisait.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Puissances reçues Galileo E1 et E5a selon l'OS SIS ICD Issue { "2.1" }</b> (révision, 2026-10-14). Les bandes de spectre <c1/> et <c2/>, et les victimes GNSS du signal LEO qui en tirent leur puissance, utilisent désormais les puissances reçues minimales de la Table { "12" } de l'OS SIS ICD Issue { "2.1" } de Galileo : −{ "157.25" } dBW (auparavant −{ "157.0" }) et −{ "155.25" } dBW (auparavant −{ "155.0" }).

# text
seg-b0386f62923f = Neuf résultats de scénario changent : les exemples de spectre, la campagne de spectre, trois verticales de résilience LEO et trois conceptions de signal LEO. Le C/N0 effectif varie de −{ "0.25" } dB et le J/S de +{ "0.25" } dB sur ces bandes.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Chaque valeur modifiée ({ "1766" }, ancienne → nouvelle) est listée dans <c1/> et son CSV, avec les tables de documentation qui ont changé. Aucune ligne du registre ne change de statut.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Seconde partie, le même jour : les victimes du signal LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Table { "12" } E5b) et <c2/> (−{ "152.0" } → −{ "152.24" } dBW). L'ICD n'a aucune ligne E5 pleine bande, de sorte que la valeur AltBOC est la somme des puissances des totaux E5a et E5b de la Table { "12" }, construite comme l'ancienne valeur. Trois résultats de conception de signal LEO changent ({ "64" } valeurs : ces puissances reçues et la dégradation du C/N0 du LEO vers le GNSS sur les deux victimes), listés dans la même révision (§{ "5" }) et le même CSV. Rien d'autre ne change.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>Correction de la marée atmosphérique S2</b> (<c1/>). Les harmoniques S2 de pression de l'air de Ray ({ "2001" }) sont des coefficients de <c2/> non normalisés avec des retards de phase en cosinus ; elles étaient utilisées comme entièrement normalisées avec le retard pris comme l'avance en sinus de l'IERS. Elles entrent désormais divisées par <c3/> avec <c4/> ; le nouveau <c5/> reproduit le modèle A2 de la Table { "5" } de GFZ STR06/01 pour les { "21" } ondes (pire { "0.0005" } cm, { "0.05" }° ; VALIDATED). Seules les sorties avec marée activée changent : l'ajustement Galileo de CI { "0.132" } → { "0.133" } m, les composantes de Swarm-A de { "1" }–{ "2" } mm (préenregistré dans <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Documentation seulement : <c1/>, <c2/> et <c3/> sont documentés comme des résolveurs hérités, numériquement inchangés, renvoyant à <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>État du tour { "3" } de D9</b> (<c1/>). La Circular T { "465" } du BIPM est parue le 2026-10-12. Le score prospectif préenregistré n'est toujours pas exécuté : le numéro { "465" } contient environ { "285" } valeurs de test, et la règle d'arrêt en exige { "1000" }, soit environ les numéros { "465" }–{ "468" }. L'exécution exige aussi les fichiers archivés par laboratoire du 2026-09-30, parce que le BIPM a depuis réécrit { "87" } des { "113" }. La ligne du registre et l'en-tête du test le disent ; le test, ses seuils et sa partition sont inchangés.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Passe de vérité de la documentation ({ "0.36" }).</b> Feuille de route, lignes de capacités, lignes d'état des documents de conception et commentaires de modules mis en accord avec le code ; aucune sortie ne change. Les éléments déjà construits mais encore listés comme ouverts sont désormais marqués terminés : les contrôles de gabarits ITU-T, le scénario de holdover de { "24" } h et l'ingestion de journaux d'horloge (synchronisation de télécommunications), les démarrages rapides de la première minute, Lense–Thirring et la vérification croisée du propagateur avec Orekit, la chaîne GCRS précise ITRF, les hachages de référence et multiplateformes, la provenance, l'ARAIM multi-défauts (ADD v4.2), la FDE à un seul satellite, la bibliothèque CRPA, la limite d'ambiguïté de franges CAI, le dimensionnement par rues de couverture et la vue d'orbite 3D, la dynamique d'attitude du corps rigide, l'écrivain OMM et le lecteur de noyaux NAIF, la libration lunaire DE440, la phrase de sens de l'exécution dans le terrain de jeu, <c1/>, le navigateur à couplage serré à 17 états et le type de scénario gravity-map. Les lignes indiquent aussi précisément ce qui reste ouvert (par exemple la JD en deux parties dans <c2/>, le lecteur <c3/> par rapport à un vrai produit, et l'exclusion multi-satellites dans <c4/>). Le <c5/> manquant est écrit à partir d'une exécution récente de ses tests (M1–M4 réussis), et le brouillon de validation IQ destiné aux partenaires porte les décomptes actuels du registre.

# text
seg-e2290a640df7 = Les codes mémoire Galileo E1 ne sont plus fournis avec le logiciel.

# text
# c1: data/galileo-os-sis-icd/C7_E1B.txt
# c2: C8_E1C.txt
# c3: LICENSING.md
# c4: galileo::e1b_table
# c5: e1c_table
# c6: Result
# c7: KSHANA_GALILEO_E1B
# c8: KSHANA_GALILEO_E1C
# c9: data/galileo-os-sis-icd/
# c10: scripts/fetch_galileo_e1_codes.sh
# c11: galileo::E1B_TABLE_TEXT
# c12: E1C_TABLE_TEXT
# c13: galileo-e1b
# c14: galileo-e1c
# c15: tests/iq_signals.rs
seg-80f8ca869682 = <c1/> et <c2/> (annexe C.7/C.8 de l'ICD) sont retirés du dépôt et des paquets. Les conditions de l'ICD (citées dans <c3/>) permettent à un utilisateur de conserver les codes en mentionnant la source et de les utiliser dans un produit, mais n'autorisent la redistribution qu'à des fins non commerciales, et Kshana est aussi proposé sous licence commerciale. <c4/> / <c5/> renvoient désormais un <c6/> et lisent la copie propre à l'utilisateur depuis <c7/> / <c8/> ou, dans une copie source, depuis <c9/>, où le nouveau <c10/> les extrait du PDF de l'ICD (avec vérification de l'empreinte). <c11/> / <c12/> sont supprimés. Sans les tables, les signaux Galileo E1 (<c13/>, <c14/>) renvoient une erreur qui indique comment les fournir, et les tests E1 sont ignorés avec un message. Avec les tables en place, chaque sortie E1 est inchangée. Aucune sortie de scénario, de référence figée (golden) ou de spectre n'utilise les tables de codes. Les fichiers de test de l'annexe C.3/C.4 pour E5a (la référence indépendante LFSR dans <c15/>) sont traités de la même manière : récupérés par le même script, exclus de git, et le test est ignoré en leur absence.

# text
# c1: f64
# c2: rand_distr
# c3: libm
# c4: portable_math::PortableFloat
# c5: portable_distr
# c6: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c7: europa-surface-pnt
# c8: lunar-joint-od-clock
# c9: paper/crossover/inertial.json
# c10: vibration_psd
# c11: cislunar-observability
# c12: skyline_scenarios
# c13: geometry_corpus_identity
# c14: geometry_trust_no_change
# c15: docs/predictions/*.portable-0.36.json
# c16: tests/lunar_joint_od_numpy_oracle.rs
# c17: docs/revisions/STUDIO15-lunar-joint-od-oracle-rerecord.md
# c18: docs/revisions/STUDIO15-batch4-rebaseline.md
# c19: iq_campaign
# c20: gnss-ins
# c21: docs/revisions/STUDIO15-greenhall-edf-portable.md
# c22: docs/revisions/STUDIO15-testbench-gpssdrsim-rerun.md
seg-654d0358137b = <b>Mathématiques portables partout</b> ({ "0.36" }, STUDIO-15) : toutes les fonctions transcendantes <c1/> de la bibliothèque, ainsi que les échantillonneurs normal, gamma et exponentiel de <c2/>, calculent désormais via <c3/> en Rust pur (<c4/>, <c5/>), de sorte qu'une compilation native et la compilation WebAssembly renvoient un JSON de résultats identique à l'octet près pour les { "141" } scénarios fournis et pour la courte exécution IQ. Le coût est que les derniers bits des résultats calculés avec la bibliothèque mathématique de l'hôte ont bougé : { "98" } des { "141" } scénarios fournis ont changé, { "43" } non ; { "5" } ont changé de plus de { "1e-3" } dans leur plus grand champ, et les autres de moins. Chaque valeur modifiée est listée ancienne -> nouvelle dans <a1><c6/></a1> (avec un CSV de tous les { "136,127" } nombres modifiés) ; aucun seuil ni aucune tolérance n'a changé. Chiffres publiés qui ont changé : disponibilité de <c7/> avec la portée Terre { "0.719" } -> { "0.713" } et erreur RMS { "86.147" } -> { "86.499" } m (une époque en limite de disponibilité se résout désormais de la même façon partout ; elle affichait { "0.725" } / { "85.800" } m sur macOS arm64) ; erreur de station de <c8/> { "3.541350" } -> { "3.536885" } m avec VLBI et { "2183.558" } -> { "2184.021" } m sans ; <c9/>, huit valeurs de <c10/> de { "3" } unités sur le dernier chiffre (erratum dans le rapport technique) ; le document <c11/> publié, pour des grandeurs au plancher d'arrondi (huit valeurs au-delà de six chiffres significatifs, jusqu'à { "6.8e-5" } en relatif ; aucun rang ni seuil n'a bougé). Les empreintes figées des garde-fous d'identité à l'octet (<c12/>, <c13/>, <c14/>) sont rebasées sur une référence de base nommée « { "0.36" } portable », les valeurs { "0.35.0" } étant conservées comme trace historique ; la prédiction figée de la station de référence lunaire n'est pas touchée et sa réexécution portable est stockée à côté (<c15/>). <c16/> (la ligne validée de détermination d'orbite conjointe lunaire) : jeux de test réexportés et comparaison numpy relancée avec numpy { "2.4.6" }, la version enregistrée, le script et le seuil restant inchangés ; les six réseaux passent (<a2><c17/></a2>). Le travail des lots 2-3 fusionné après STUDIO-15 utilise lui aussi les mathématiques portables ({ "457" } points d'appel dans { "62" } fichiers) ; ce qu'il a modifié figure dans <a3><c18/></a3> : { "12" } scénarios fournis (plus grand changement relatif { "5.2e-8" }, aucun chiffre affiché ne bouge), { "28" } lignes de garde-fou skyline réétalonnées, le condensé M2M4 de <c19/>, les empreintes de vérité terrain de l'ancien <c20/>, le sigma de référence (datum) des balises non observées ({ "632.3769" } -> { "632.3772" } m), et deux constats consignés (fermetures DRO du CR3BP ; CRPA A3, { "194" } liaisons sur { "456" }). L'edf exact de Greenhall conserve son seuil validé grâce à un logarithme en double-double dans son noyau (<a4><c21/></a4>), et la référence indépendante du banc d'essai gps-sdr-sim a été relancée sur les exports NMEA modifiés, chaque seuil étant respecté (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README : la ligne de la suite lunaire indique le niveau de preuve de chaque élément (elle disait que tous étaient MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> renvoie <c2/> (série, journal de grille, système de temps, indication de sa déclaration, type d'enregistrement) au lieu d'un tuple <c3/>. Elle se rabat désormais des enregistrements de satellite (<c4/>) vers les enregistrements de récepteur/station (<c5/>) du nom demandé.

# text
# c1: tests/geometry_trust_no_change.rs
# c2: tests/geometry_corpus_identity.rs
# c3: score_model.weights
# c4: geometry
# c5: class
# c6: geometry
# c7: class
# c8: geometry
# c9: monitors_run
# c10: [score.weights]
# c11: [geometry]
seg-6777ca96624a = Aucun score ne change tant que la géométrie n'est pas mauvaise ; l'étiquette est toujours indiquée. Avec une géométrie bonne ou moyenne (y compris un ciel dégagé GPS seul de { "8" } satellites) ou une géométrie inconnue (le moniteur ne tourne pas), chaque score est identique à celui de { "0.35" } : <c1/> fige les sorties des deux sessions d'exemple et <c2/> chaque corpus NMEA de navire versionné dans le dépôt (y compris en ciel dégagé GPS seul) et les scénarios d'entraînement d'équipage aux octets de { "0.35.0" } une fois les clés ajoutées retirées ; dans les deux scénarios d'entraînement dont le brouillage rend la géométrie mauvaise, les époques mauvaises ne diffèrent que par la seule déduction liée à la géométrie. Un journal à mauvaise géométrie perd jusqu'à { "15" } points qu'il ne perdait pas en { "0.35" }. Changements voulus par ailleurs, tous des ajouts : les clés ci-dessus dans le JSON de résultats et les paquets de preuves (<c3/> est inchangé) ; le schéma JSON-lines en direct passe de { "1.2" } à { "1.3" } (<c4/> ajouté, <c5/> dans chaque déduction) ; le résumé d'extrait gagne <c6/> ; la télémétrie gagne des séries, des champs de géométrie et l'étiquette <c7/> uniquement pour les entrées qui en portent, de sorte qu'un flux ou un résultat { "0.35" } s'affiche octet pour octet comme avant. <c8/> est le 17e nom de moniteur ; il est listé en dernier dans <c9/> lorsqu'il a statué (un navire dont le journal fournit la géométrie ; une liste { "0.35" } garde son ordre et le nombre de moniteurs du résumé augmente d'une unité) et n'a pas d'entrée <c10/> (en définir une est refusé : sa déduction se règle dans <c11/>).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> indiquait que la licence de gnss_lib_py était Apache-2.0 ; la version { "1.0.4" } est sous licence MIT.

# text
seg-a1a670a9c63e = Le lecteur NMEA lit désormais GSA (un GSA court est ignoré, sans être compté comme sauté) et conserve les élévations et azimuts GSV, y compris pour les satellites listés sans signal ; le lecteur UBX conserve l'élévation et l'azimut de NAV-SAT. Le C/N0 est lu exactement comme avant.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Changement de résultat : les brouilleurs à large bande et à balayage utilisent désormais Q = { "2" }.</b> L'équation anti-brouillage utilise l'ajustement Q classique de l'étalement de spectre pour ces brouilleurs, là où elle utilisait { "1" }. Q = { "2" } correspond à un bruit blanc sur le lobe principal avec la puissance du signal dans la bande normalisée ; il est figé dans les tests sur la forme analytique issue de <c1/>.

# text
# c1: q_override
seg-21f31ec302de = <b>Inchangés :</b> les brouilleurs CW et à bande étroite (Q = { "1" }), un type de brouilleur non reconnu (Q = { "1" }, la valeur la plus pénalisante), et <c1/>.

# text
seg-f362499d2ed0 = <b>Effet :</b> là où un brouilleur à large bande ou à balayage agit, le C/N0 effectif augmente jusqu'à { "3.0103" } dB, les seuils J/S dérivés augmentent de { "3.0103" } dB, et les rayons de déni en espace libre diminuent d'un facteur { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Scénarios fournis modifiés :</b> { "12" } sur { "144" } changent, tous comme préenregistré (<c1/>, résultats dans <c2/>) :

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/> : C/N0 +{ "3.01" } dB ;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/> : satellites perdus { "26" } → { "0" }, distance de sécurité médiane de perte d'accrochage { "27.4" } → { "19.4" } km ;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/> : rayon de déni de la dynamique de boucle { "75.2" } → { "53.2" } km ;

# text
seg-096a24491872 = et les campagnes et vérifications croisées de spectre qui les contiennent.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Consommateurs concernés :</b> les types de scénario <c1/>, <c2/>, <c3/> et <c4/>, la <c5/> des types de scénario de spectre, la courbe de référence MODELLED de la campagne IQ et le Q par défaut de labfit, ainsi que l'export de scène d'interopérabilité.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = Greffon JetBrains : aucune API de plateforme obsolète ou dont le retrait est programmé. Les cinq boîtes de dialogue de choix utilisent un petit <c1/> avec une liste déroulante à la place de <c2/>, obsolète ; les sélecteurs de fichier unique utilisent le constructeur <c3/> à la place de <c4/>, obsolète ; l'animation s'ouvre avec <c5/> à la place de <c6/>, dont la plateforme { "2026.3" } programme le retrait. Since-build reste { "243" }. L'IntelliJ Plugin Verifier signale Compatible, sans usage obsolète ni programmé pour retrait, face à { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) et { "2026.3" } EAP (IU-263.6259.32) ; <c7/> vérifie { "2024.3" } par défaut et toute liste fournie dans <c8/>.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> et <c2/> renvoient <c3/> : une section <c4/> non valide est une erreur lorsqu'on appelle directement, comme c'était déjà le cas via <c5/>, plutôt qu'un repli silencieux sur le masque plat. <b>Changement incompatible</b> pour les appelants Rust de ces deux fonctions.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Évaluateur de campagne : un vrai faux accrochage du suiveur n'était jamais compté</b> (<c1/>). Le contrôle de faux accrochage du suiveur fait passer un canal de LOCKED à LOST au moment où il se déclenche. L'évaluateur marquait à la place la mise à jour suivante du canal, qui était alors déverrouillée et n'était donc jamais comptée. Un événement <c2/> signalé depuis LOCKED est désormais un épisode à son instant, dans l'exécution et dans chaque événement déclaré qui le contient. Un épisode trouvé pendant la phase d'acquisition, ou répété par un canal déjà LOST, n'est pas un nouvel épisode. Un nouveau test provoque un vrai faux accrochage : une porteuse GPS L1 C/A légitime qui fait un saut de 1/(2T) alors qu'elle est accrochée (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = Dans la campagne de référence de <c1/>, seul le PRN { "11" } de ramp/agc-3bit change (épisodes de faux accrochage { "0" } → { "1" }, { "426" } et { "437" } par heure d'accrochage).

# text
seg-cfc47d9d9237 = Ses DIGESTs de cellule sont de nouveau figés.

# text
seg-fcfa0de18b05 = Le point de contrôle préenregistré des résultats évalués reste actif et se reproduit toujours exactement : dans son empreinte, seuls ces six champs, modifiés par cette correction faite après l'enregistrement, sont ramenés à leurs valeurs d'avant la correction. Les valeurs corrigées sont figées séparément.

# text
seg-b96d34bb1d36 = Aucun seuil n'a été modifié, et aucune ligne VALIDATED, aucun chiffre ni aucun nombre du site web n'a bougé.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign : une balise sans observation est désormais signalée</b> (trouvé par MR-05). Le rapport gagne <c1/> et <c2/> uniquement lorsqu'une balise n'a aucune observation, et les sigmas des balises observées proviennent alors de leur propre information au lieu d'être tous nuls. Le datum est inchangé, et aucune sortie par défaut, fournie ou publiée ne bouge (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Référentiel lunaire des axes principaux</b> (<c1/>, utilisé par <c2/> et par l'ajustement LRO) : le décalage DE421 entre le référentiel moyen Terre et les axes principaux (PA), défini dans <c3/>, était appliqué dans le mauvais sens et avec le mauvais ordre d'angles d'Euler, de sorte que le référentiel PA analytique se trouvait à environ { "208" }″ du PA au lieu de coïncider avec lui. Il est maintenant transcrit comme le définit le Frames Required Reading de SPICE et s'accorde avec <c4/> de SPICE à { "2.6e-16" } rad près ; le référentiel PA analytique est à { "6" }″ à { "8" }″ du PA de DE440 (préenregistré e1ead19b, réenregistré be33382e après que la première modification proposée a manqué le seuil de { "1e-12" } ; <c5/>). Chiffres publiés qui bougent : l'ajustement LRO (<c6/>) recouvrement brut { "53.8" } → { "39.9" } m, dynamique { "12.6" } → { "12.05" } m, dynamique réduit { "6.65" } → { "6.67" } m (seuils inchangés). La pile analytique concorde maintenant avec la validation croisée ANISE de niveau DE ({ "12.0" } / { "6.67" } m) sur les deux niveaux ; l'écart antérieur du niveau dynamique venait de cette erreur.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>Le serveur MCP refuse <c1/></b> (suite de CAP-06b). Le chemin de la tuile de terrain du type de scénario de brouillage figure désormais dans <c2/>. Une surface en ligne refuse un scénario qui en nomme un, avec un message qui ne contient ni le chemin ni une erreur du système d'exploitation. Le test de garde des sources de fichier signale aussi désormais les champs se terminant par <c3/>.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> avec une partie de jour fractionnaire perdait la fraction dans les conversions UTC, TAI, UT1 et de rotation terrestre (une heure de partie de jour faisait dévier la Terre de { "15" }°) ; la partie de jour est maintenant normalisée en entier. Aucun appelant du moteur n'a été touché : tous passent un jour entier, et chaque sortie livrée est identique bit à bit.

# text
seg-144d90307ec6 = Prévu

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = La géométrie à partir d'un horizon (skyline) indiqué (élément { "1" } de { "0.36" }, désormais dans le moteur sous la forme <c1/>) : <c2/> et <c3/> issus de l'horizon lorsque l'entrée en fournit un (l'intervalle d'azimut en repli), un événement de dégradation naturelle (fjord ou terminal) dans <c4/>, et les deux géométries masquées de la note de conception dans la ligne sigma_UERE x DOP, préenregistrées sous forme d'addendum.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = La géométrie pour les journaux RINEX avec navigation (à partir du calcul de position propre au moteur) et les journaux Android (à partir des lignes <c1/>) ; les deux affichent <c2/> aujourd'hui. La géométrie dans <c3/> (version { "1" } inchangée en { "0.36" }) et les intégrations Signal K et OpenCPN.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Une lacune préexistante, non introduite en { "0.36" } : dès que le champ SNR de chaque satellite est vide, aucune déduction <c1/> ni C/N0 ne se déclenche ; la perte totale de signal n'est visible qu'à travers <c2/> du moniteur de géométrie (classé <c3/>). Une déduction pour ce cas est prévue.

# text
seg-a5a7a10ee11c = Un flux de schéma { "1.3" } dans les références indépendantes de télémétrie externes (l'analyseur de format texte Prometheus et le collecteur OTLP), qui ne couvrent aujourd'hui que les flux { "1.2" }.

# text
seg-caa1977b5b5e = Une obstruction des deux côtés (un canyon ou un fjord étroit) se lit comme une perte de signal plutôt que comme un ciel bloqué tant que l'horizon n'est pas intégré.

# text
seg-4bd0f178ca4e = Un passage nommant des clients d'IA tiers est omis ici ; il figure dans <a1>CHANGELOG.md</a1> sur GitHub.

# text
seg-b2689beaba9e = Vérificateur Galileo OSNMA

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Nouveau module <c1/> et <c2/> : un vérificateur ouvert, en Rust pur, côté récepteur pour Galileo OSNMA.</b> Il lit les pages I/NAV et indique, par satellite et par époque, si les données de navigation sont authentifiées, avec une raison pour chaque échec ou retard : analyse de HKROOT et MACK, réassemblage de DSM-KROOT et DSM-PKR, vérification de Merkle de la clé publique, vérification de la chaîne de clés TESLA, vérification de MACSEQ et des étiquettes pour ADKD { "0" }, { "4" } et { "12" } y compris l'authentification croisée, et un résultat de forme <c3/> pour le moniteur de confiance du récepteur. La sortie porte une mention indiquant que l'état n'est pas un service d'intégrité de la navigation. <c4/> indique ce qui est et n'est pas vérifié, l'exigence de temps, et que Kshana n'accorde aucun droit au titre des droits de propriété intellectuelle de l'UE sur l'ICD OSNMA (les utilisateurs s'appuient sur l'autorisation de l'annexe E de l'ICD). Implémenté d'après le SIS ICD Issue { "1.1" } et les Receiver Guidelines Issue { "1.3" }. Les pages sont contrôlées par CRC, et un flux d'octets UBX-RXM-SFRBX d'un u-blox peut être lu directement (<c5/>). Les tests par défaut utilisent des données synthétiques et des tests à réponses connues publiés pour les primitives ; un test facultatif lit une copie téléchargée localement des vecteurs officiels. Après relecture indépendante, le vérificateur ne tire son temps que de clés TESLA vérifiées (une sous-trame leurrée située très loin dans le futur ne peut plus effacer un échec), laisse une authentification expirer et suivre l'IODnav utilisé, tient compte des messages d'alerte vérifiés (dont la feuille de Merkle inclut désormais le champ aléatoire NPK) et de l'état NMA « don't use », garde les étiquettes factices hors de l'état du satellite, conserve les chaînes par CID avec révocation et renouvellement, vérifie l'empreinte de remplissage de KROOT, et plafonne les longueurs de trame UBX et le travail de vérification TESLA. Un satellite n'apparaît authentifié que tant que les données d'éphéméride et d'horloge les plus récentes qu'il envoie sont, bit pour bit, les données qui ont été authentifiées (et pas seulement sous le même IODnav), un état ou une révocation provenant de l'en-tête NMA non authentifié ne compte que lorsque deux satellites concordent ou qu'un KROOT vérifié le porte, un ancien KROOT rejoué ne peut pas remplacer une chaîne, et un flux de clés bloqué est signalé.

# text
seg-3e7df5c888ca = Ajouté (canaux du serveur MCP)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, HTTP en flux (streamable), auto-hébergé.</b> Bouclage local par défaut ; une adresse hors bouclage exige <c2/> et un jeton porteur dans <c3/> ; aucun outil ne lit ni n'écrit de chemin (les outils de fichiers IQ sont désactivés) ; limites de taille, de durée et de concurrence des requêtes ; pas d'en-tête CORS ; contrôles de Host et d'Origin. Kshana n'héberge aucun point d'accès (<c4/>, avec des modèles Docker, Fly.io et Cloud Run).

# text
seg-c392cde151c9 = Ajouté (surfaces)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> sur Python et WebAssembly.</b> Le vérificateur derrière <c2/> sur des octets en mémoire, renvoyant le JSON qu'affiche <c3/> (mention indicative dans son champ <c4/> ; état d'authentification seulement, et non un service d'intégrité de la navigation). Les mêmes refus que la ligne de commande. Pas sur MCP : l'entrée est un long flux brut de récepteur, mieux servi par la CLI et Python. <c5/> et <c6/> le précisent.

# text
# c1: trust_telemetry
# c2: receiver-trust
# c3: kshana trust-telemetry
# c4: kshana::surface::trust_telemetry
# c5: /kshana-trust-telemetry
# c6: trust-telemetry
# c7: wasm
# c8: python
# c9: otlp
seg-6128929994b4 = <b><c1/> sur WebAssembly, Python et MCP, avec une commande de greffon et une action JetBrains.</b> Rend un flux de confiance ou un résultat <c2/> sous forme de texte Prometheus, de lignes syslog CEF ou LEEF, ou de charge utile JSON OTLP, avec les encodeurs qu'utilise <c3/> (<c4/>) ; ni socket ni horloge. Greffon : <c5/> et la compétence <c6/>. JetBrains : Render Trust Telemetry. Les fonctionnalités <c7/> et <c8/> ainsi que le serveur MCP activent désormais aussi <c9/>, qui n'ajoute aucun crate.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Balayage de parité.</b> Actions JetBrains Validate Scenario, List Scenario Kinds et Assess Receiver Stream ; <c1/> liste désormais <c2/>, <c3/>, <c4/> et <c5/> ; le notebook <c6/> (correspondance compliance et export de banc d'essai) ; et chaque cellule JetBrains « CLI uniquement » restante dans <c7/> est maintenant un N/A explicite avec sa raison.

# text
seg-062ef0cf7ee7 = Ajouté (paquets de preuves)

# text
# c1: kshana receiver-trust evidence
# c2: kshana evidence verify
# c3: kshana evidence keygen
# c4: *.evidence-key
# c5: verify
# c6: --pubkey
# c7: openssl ts -verify
# c8: kshana::evidence
# c9: wasm32
# c10: ed25519-dalek
# c11: zeroize
# c12: docs/EVIDENCE-PACKS.md
seg-9889575c2df1 = <b><c1/> et <c2/> : des paquets de preuves signés et vérifiables pour un événement de confiance GNSS.</b> Un paquet regroupe l'extrait brut du journal et le SHA-256 du journal complet, la configuration avec chaque seuil, les résultats et raisons par époque, la version du moteur, un manifeste chaîné par empreintes et un résumé HTML autonome, signés en Ed25519 (une clé issue de <c3/> ou votre propre fichier ; les clés ne sont jamais stockées dans un paquet et <c4/> est exclu de git). <c5/> vérifie chaque empreinte, la chaîne et la signature et nomme exactement ce qui échoue ; avec <c6/> il épingle le signataire. Un jeton RFC { "3161" } peut être joint, et il est lu et lié au manifeste (la signature propre de l'autorité n'est pas vérifiée par cette version ; <c7/> la couvre). L'extrait du journal correspond aux octets exacts de la fenêtre lorsque le lecteur indique les plages de la source (NMEA, UBX, RINEX { "3" }, Android), sinon au journal entier, et le manifeste indique lequel. La création et la vérification sont de pures fonctions publiques (<c8/>) qui se compilent pour <c9/>. Les paquets précisent qu'ils sont un dossier technique, et non un avis juridique. Les nouvelles dépendances sont l'arbre <c10/> (BSD-3-Clause et Apache-2.0/MIT, fonctionnalités minimales) et un <c11/> direct (déjà dans cet arbre) pour effacer le matériel de clé. Voir <c12/>.

# text
seg-280fd37126c1 = Ajouté (télémétrie de confiance)

# text
# c1: kshana trust-telemetry
# c2: receiver-trust
# c3: /metrics
# c4: otlp
# c5: kshana_trust_syslog_send_failures_total
# c6: /metrics
# c7: deploy/grafana/
# c8: docs/TRUST-TELEMETRY.md
# c9: src/telemetry/sample.rs
seg-ebd269c618b0 = <b><c1/> : la confiance GNSS comme source de télémétrie de sécurité.</b> Lit le flux de confiance par époque (lignes JSON : score 0-100, bande, raisons) ou un résultat <c2/> par lots et alimente un point d'accès Prometheus <c3/> (localhost par défaut), des événements syslog en CEF ou LEEF dans une enveloppe RFC { "5424" } (UDP ou TCP) et, derrière la fonctionnalité <c4/> désactivée par défaut, un export JSON OTLP/HTTP. La livraison s'exécute sur des fils de travail avec des limites de temps de connexion et d'écriture, un recul de reconnexion plafonné et un compteur <c5/>, de sorte qu'un collecteur mort ou bloqué ne peut ni bloquer l'évaluation en direct ni geler <c6/> ; les étiquettes de raison sont plafonnées à { "64" } séries. Aucune nouvelle dépendance. Un exemple de tableau de bord Grafana se trouve dans <c7/>. Les noms de métriques, les étiquettes et la correspondance des champs CEF/LEEF sont dans <c8/>. Le format du flux est isolé dans <c9/>.

# text
seg-fa5e803edb44 = Confiance maritime : un score de confiance en direct de 0 à 100 pour la position d'un navire en mouvement, à partir du NMEA { "0183" } que le récepteur produit déjà, avec une barrière activable.

# text
# c1: kshana receiver-trust
# c2: [platform]
# c3: kind = "static"
# c4: "vessel"
# c5: [maritime]
# c6: [score]
# c7: kshana receiver-trust live <session.toml>
# c8: $PKSHT
# c9: --gate
# c10: V
# c11: N
# c12: --listen tcp:<port>
# c13: examples/maritime-trust/
# c14: docs/MARITIME-TRUST.md
seg-c5b3fcb9bba8 = <c1/> accepte une table <c2/> (<c3/> ou <c4/>, la vitesse, l'accélération et la vitesse de giration maximales du navire, la hauteur de l'antenne au-dessus de la ligne de flottaison et un capteur de cap facultatif ; chaque valeur par défaut est documentée avec sa raison). Pour un navire, le moniteur de saut de position statique, qui mesure la distance à la moyenne d'étalonnage et se trompe sur un navire en route, est remplacé par des moniteurs causaux de plateforme mobile : cohérence cinématique de la position avec la vitesse et la route signalées et avec les limites du navire, cap gyroscopique par rapport à la route fond, loch par rapport à la vitesse fond, altitude de l'antenne par rapport à la hauteur indiquée au-dessus de la ligne de flottaison, effondrement de la dispersion du C/N0 et hausse simultanée par rapport à la référence de base d'étalonnage, et cohérence temporelle (aussi avec l'horloge de cet ordinateur, en mode direct). Il lit aussi un état d'authentification signalé, global ou par satellite (un état signalé seulement : pas de cryptographie OSNMA). Chaque seuil est indiqué dans une table <c5/> avant l'exécution. Chaque époque reçoit ensuite un score de { "0" } à { "100" } par une correspondance déterministe et préenregistrée (sans apprentissage, rien d'ajusté sur des événements ; les poids, les bornes des bandes et la preuve se trouvent dans une table <c6/>), reportée sur les états de confiance existants, avec les moniteurs qui ont déduit et leurs points. Les scénarios statiques sont inchangés et ont la même empreinte qu'avant. <c7/> lit l'entrée standard, un fichier en cours d'ajout, TCP ou UDP et écrit une ligne JSON par époque et une phrase propriétaire <c8/> ; avec <c9/> il transmet le flux inchangé tant que la position est jugée fiable et marque la position comme invalide (qualité GGA { "0" }, état RMC et GLL <c10/>, mode GNS et VTG <c11/>) tant qu'elle ne l'est pas. La barrière est désactivée sauf demande ; <c12/> sert le flux filtré à un nombre quelconque de clients TCP (bouclage local par défaut, un client lent est déconnecté plutôt que de bloquer les autres). Il s'agit d'un logiciel à titre consultatif, et non d'un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) ; l'opérateur reste responsable. <c13/> est un journal synthétique de Tallinn à Helsinki, écrit en texte seulement, avec un décrochage de position en cours de route pendant lequel le récepteur continue d'indiquer une position valide ; sa sortie attendue est figée par un test. Guide : <c14/>. Les contrôles ne peuvent pas voir un leurre dont la position est cohérente avec tout ce qui circule sur le bus ; le guide le dit.

# text
seg-80f3f0aae42c = Carte des interférences

# text
# c1: kshana interference-map
# c2: kshana route-exposure
# c3: fetch-land --allow-network
# c4: flate2
# c5: null
# c6: <source>-<dataset>-<date>.geojson
# c7: docs/INTERFERENCE-MAP.md
# c8: docs/data/INTERFERENCE-DATA-SOURCES.md
seg-8539a42718cb = <b><c1/> et <c2/> : un tableau public des endroits où des aéronefs et des navires ont signalé des données de navigation dégradées, et de la part d'une route qu'elles touchent.</b> Les entrées sont des fichiers CSV locaux produits à partir de données ouvertes sous licence libre ADS-B (adsb.lol, ODbL { "1.0" }) et AIS (NOAA MarineCadastre, Kystverket sous NLOD { "2.0" }) ; chaque fichier de sortie correspond à une source et à un jour UTC de GeoJSON portant la méthode, ses seuils, la licence des données, l'attribution et le biais de couverture de la source. La méthode ADS-B agrège NIC et NACp sur une grille fixe et déclare une cellule dégradée d'après la part d'aéronefs distincts, avec des garde-fous pour les équipements qui ne signalent jamais la précision, la basse altitude et les causes à grande échelle. La méthode AIS exécute cinq détecteurs : positions sur terre (par rapport à un trait de côte fourni par l'utilisateur), trajectoires circulaires, sauts invraisemblables, vitesses invraisemblables, et nombreux navires à une même position. Les seuils sont des constantes préenregistrées d'une version de méthode nommée. Agrégats seulement : les identifiants sont hachés en mémoire et jamais écrits, et les cellules de moins de { "5" } aéronefs ou navires distincts ne sont pas publiées. Une cellule dégradée n'est pas un constat d'interférence. Les commandes par défaut n'utilisent aucun réseau ; un assistant facultatif <c3/> télécharge les polygones de terres de Natural Earth depuis une adresse figée sur un commit et ne garde le fichier que si son SHA-256 correspond. L'entrée ADS-B est un CSV ou directement les fichiers d'historique readsb d'adsb.lol (nouvelle dépendance : <c4/> avec son moteur en Rust pur, pour gzip). Les deux méthodes sont en version { "2" } : un appel dégradé ou anormal exige au moins { "5" } aéronefs ou navires (le minimum de publication), tout effectif par cellule inférieur à { "5" } est retenu sous la forme <c5/>, et un jour dont le bruit de fond ne peut pas être estimé retient ses appels. Les fichiers de sortie sont nommés <c6/> et ne sont jamais écrasés ; l'entrée est lue en flux ligne par ligne ; l'exposition de route gère l'antiméridien. Les tests n'utilisent que des données synthétiques. Voir <c7/> et l'examen des licences dans <c8/>.

# text
seg-7a54dfab93dc = Ajouté (flux d'entraînement)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/> : NMEA { "0183" } de passerelle synthétique pour l'entraînement des équipages à la reconnaissance du brouillage et du leurrage GNSS.</b> À partir d'un scénario TOML, il écrit un fichier ou diffuse sur TCP ou UDP (en monodiffusion ou en diffusion générale ; en temps réel, accéléré ou aussi vite que possible) l'ensemble complet de passerelle GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT et VBW pour la trajectoire d'un navire avec limites de vitesse de giration, d'accélération et de courant, avec une géométrie de satellites issue des constellations nominales propres au moteur. Événements scénarisés sur une ligne de temps : brouillage, décrochage de position (une position valide qui s'éloigne), leurrage du temps et retard de rejeu, chacun avec des rampes d'apparition et de retour. Un journal d'instructeur (JSON et texte) consigne ce qui a été injecté et quand, avec la vraie trajectoire face à celle qui est signalée. Une bibliothèque dans <c2/> (brouillage en haute mer, décrochage côtier, leurrage du temps à l'approche d'un port, combiné) comporte des notes pour le formateur. La sortie a des sommes de contrôle valides et est déterministe pour une graine donnée ; les tests figent un extrait de référence par scénario et relisent chaque phrase avec le lecteur NMEA de <c3/>. Texte seulement : aucune sortie RF, IQ ou de forme d'onde ; les flux servent à l'entraînement et aux essais et ne doivent jamais être envoyés aux systèmes de navigation en service d'un navire. Voir <c4/>.

# text
seg-bb8d508c92fa = Intégrations maritimes ({ "0.35.0" }, volet B)

# text
# c1: integrations/signalk/
# c2: kshana receiver-trust live
# c3: $PKSHT
# c4: navigation.gnss.kshana.*
# c5: navigation.position
# c6: warn
# c7: alarm
seg-538cdf145ac1 = <b>Greffon Signal K</b> (<c1/>, non publié sur npm) : exécute <c2/> ou s'y connecte (l'entrée NMEA propre au serveur, des arguments d'entrée personnalisés, un flux TCP JSON-lines, ou les phrases <c3/> d'un flux filtré), publie le score de confiance, la bande, les raisons, les alarmes et l'état de la barrière sous <c4/> (y compris la position signalée par le récepteur à titre de contexte, jamais <c5/>), et émet une notification Signal K (<c6/> si dégradé, <c7/> si non fiable, avec des seuils de maintien, d'effacement et de péremption, tous dans le schéma de configuration). Aucune dépendance npm. Testé sur une sortie synthétique enregistrée.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b> : le NMEA en mode barrière est servi directement par <c1/> (recommandé) ; un relais TCP sans dépendance (<c2/>) est l'alternative facultative. Dans les deux cas, OpenCPN voit une position invalide lorsque la confiance s'effondre et <c3/> dans sa fenêtre de débogage NMEA ; les tests rejouent le flux synthétique filtré à travers une vraie socket TCP et vérifient ce que reçoit un consommateur. Un greffon natif de panneau de score (<c4/>, API de greffon { "1.18" }, CMake) lit <c5/> dans le flux NMEA propre à OpenCPN et alerte sur la bande non fiable ; il se compile, sa logique est testée unitairement, et il a été exécuté dans OpenCPN { "5.8.4" } sous un affichage virtuel (preuves et script de reproduction dans <c6/>) ; il n'est pas empaqueté pour le gestionnaire de greffons.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Construction de référence</b> (<c1/>) : liste de pièces générique, configuration du système d'exploitation, unités systemd pour le moniteur indicatif et la barrière facultative (vérifiées avec <c2/> par <c3/>), une option de conteneur, câblage Signal K.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = Le greffon Signal K accepte le schéma JSON en direct { "1.2" } (une clé <c1/> puis une clé <c2/> ajoutées ; les clés ajoutées inconnues sont ignorées), vérifié sur une vraie sortie { "1.2" } et face à un vrai signalk-server.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Corrections issues de la relecture : les unités systemd redémarrent toujours et s'exécutent en bac à sable (pas de shell, pas de réseau là où il n'est pas nécessaire), un extrait logrotate, <c1/> échoue au moindre constat ; le conteneur exécute la barrière à partir de variables d'environnement avec un contrôle de santé et des images de base figées par empreinte ; métadonnées de score Signal K, la notification périmée est remplacée lorsque les données reprennent, les erreurs de processus enfants sont conservées et les arrêts forcés s'intensifient, les <c2/> dangereux sont refusés, et la notification se trouve à <c3/> ; le relais plafonne une ligne partielle retenue ; les analyseurs <c4/> rejettent les scores en dehors de { "0" } à { "100" } ; une vérification des liens de documentation ; un flux de travail CI (<c5/>) qui exécute tout cela, y compris le vrai binaire de bout en bout.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Logiciel à titre consultatif, et non un équipement homologué ; l'opérateur reste responsable. Logiciel seulement : rien n'émet, et aucun chiffre de détection ou de fausse alarme n'est revendiqué.

# text
seg-72cb9f45ce99 = Ajouté : correspondance compliance et export de banc d'essai

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> et <c2/>.</b> Une correspondance entre les sorties de Kshana et cinq cadres et normes de résilience (le Resilient PNT Conformance Framework v2.0 du DHS américain, les orientations de l'OMI pour les navires, les orientations de l'EASA pour l'aviation, l'article { "21" } de NIS2, l'EN { "16803" }, une norme payante citée par partie et par les quelques numéros de clauses visibles dans le texte du catalogue), un tableau par cadre : la référence, ce qu'elle demande selon notre paraphrase, les sorties qui apportent des éléments de preuve en faveur de celle-ci, et l'écart. Les versions des sources, les URL et ce qui a été lu ou non sont consignés. <c3/> remplit la correspondance à partir des exécutions données et marque chaque ligne <c4/>, <c5/>, <c6/> ou <c7/>, en Markdown et en JSON, avec l'écart conservé sur chaque ligne. La formulation est « apporte des éléments de preuve en faveur de » ; rien n'est évalué ni approuvé. Les tests utilisent des exécutions synthétiques et échouent lorsqu'un tableau versionné s'écarte du code.

# text
# c1: kshana bench-export <scenario.toml>
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: GGA
# c6: RMC
# c7: receiver-trust
# c8: [[events]]
# c9: src/interop/testbench.rs
# c10: tests/interop_testbench.rs
# c11: docs/TEST-BENCH.md
# c12: kshana receiver-trust
seg-ee9a0a43e4b0 = <b><c1/>.</b> Écrit le mouvement du véhicule et les événements d'un scénario <c2/>, <c3/> ou <c4/> pour un simulateur GNSS de laboratoire : un CSV de mouvement utilisateur avec des référentiels documentés et un fichier de métadonnées associé, du NMEA { "0183" } <c5/>/<c6/>, du texte de points de passage, et les événements en CSV et sous forme de blocs <c7/> <c8/> (<c9/>). Mouvement et événements seulement : aucun signal n'est écrit. Chaque fichier est relu dans <c10/> et comparé dans la tolérance qu'il indique. <a1><c11/></a1> donne la méthode pour rejouer l'export à travers un simulateur et évaluer le journal du récepteur avec <c12/>.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>Ce qui compte comme preuve.</b> Un résultat ne compte pour une capacité que s'il porte les champs que son type de scénario écrit ; une étiquette de type de scénario seule ne compte pour rien. Les types de scénario inconnus, un résultat qui contredit son scénario frère, les empreintes non hexadécimales et les décomptes receiver-trust mal formés sont listés comme non utilisés, avec la raison. Le rapport échappe les cellules Markdown et ne peut pas paniquer sur une empreinte non ASCII. <c1/> et <c2/> prennent des textes, pas des chemins.

# text
seg-6b46de1164d8 = Export vers banc d'essai.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> est contrôlé en plage (<c2/>) ; le fichier de points de passage vérifie chaque intervalle et la commande indique pourquoi lorsqu'il est omis ; la documentation précise que le cap de <c3/> est le lacet du corps et non la route, les champs de substitution de <c4/>, et le changement de hauteur propre au scénario. <c5/> et <c6/> figurent dans le texte d'usage.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> expose l'historique d'état vrai du profil de conduite <c2/> (le même pas que celui qu'utilise la vérité propre au type de scénario), et <c3/> gagne des champs de date et d'heure NMEA.

# text
seg-fbfc1a59e99b = Validation de la carte des interférences

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>La sémantique de décodage et la géométrie de la carte des interférences sont vérifiées face à des implémentations indépendantes sur des entrées synthétiques.</b> Les significations des codes NIC et NACp face au décodage pyModeS de trames ADS-B synthétiques, les valeurs « non disponible » de l'AIS face au décodage pyais de phrases AIVDM synthétiques, l'affectation des cellules de grille face à shapely, la longueur de route par état de cellule face à shapely et GeographicLib, et le masquage des terres face à shapely et pyproj, chacun avec une tolérance fixée avant la première comparaison (<c1/>). Cela valide la façon dont les codes et les valeurs de champs sont lus et la géométrie, et non qu'une cellule signalée soit une interférence. Le lecteur de polygones de terres referme désormais un anneau qui ne répète pas son premier sommet, qu'il lisait auparavant sans sa dernière arête. La documentation indique les seuils de faible précision NACp et NIC comme la borne que représente chaque code (NACp { "6" } est une borne d'EPU de { "556" } m, NIC { "5" } une borne de confinement de { "1" } NM).

# text
seg-cf4ffdbba1a6 = Ajouté (validation des formats de télémétrie et des paquets de preuves)

# text
# c1: docs/EVIDENCE-PACKS.md
# c2: cryptography
# c3: opentelemetry-proto
# c4: docs/EVIDENCE-PACKS.md
# c5: VerifyReport
# c6: signature_valid
# c7: scripts/gen_ed25519_rfc8032_ref.py
# c8: scripts/gen_evidence_pack_ref.py
# c9: scripts/evidence_verify_cleanroom.py
# c10: scripts/gen_telemetry_formats_ref.py
# c11: evidence_crypto_reference
# c12: evidence_pack_reference
# c13: telemetry_formats_reference
seg-ad6730e0e891 = <b>Vérifications externes de la cryptographie des paquets de preuves, du vérificateur de paquets et des formats de transmission de la télémétrie.</b> Les vecteurs de test Ed25519 de la RFC { "8032" } section { "7.1" } ({ "1" }, { "2" }, { "3" } et { "1024" }) et les exemples SHA-256 de FIPS 180-4 passent dans les propres fonctions de signature, de vérification et de hachage du paquet, jusqu'à l'égalité exacte. Un vérificateur écrit en Python à partir de la seule section normative de <c1/> (hashlib et <c2/>) concorde avec le vérificateur Rust sur { "71" } paquets intacts et altérés : verdict, ensemble des échecs, verdict de signature et les deux têtes de chaîne. Notre exposition Prometheus est lue par l'analyseur du client Python officiel et notre JSON OTLP par le message <c3/> officiel, strictement, et les deux concordent avec l'état dont ils sont issus. CEF et LEEF n'ont pas de validateur ouvert indépendant et restent modélisés. <c4/> a gagné le format normatif de paquet et la procédure de vérification à partir desquels le vérificateur en salle blanche a été écrit ; <c5/> a gagné <c6/>. Références indépendantes et jeux de test : <c7/>, <c8/> avec <c9/>, <c10/> ; tests <c11/>, <c12/> et <c13/>. La CI n'a pas besoin de Python.

# text
seg-20d1b02bfda4 = Ajouté (validation des événements CEF)

# text
seg-8c464e43e43d = Les événements CEF de télémétrie sont relus correctement par deux analyseurs open source indépendants.

# text
# c1: pycef
# c2: logstash-codec-cef
# c3: =
# c4: pycef
# c5: tests/cef_reference.rs
# c6: tests/fixtures/cef/
# c7: scripts/gen_cef_ref.py
# c8: scripts/gen_cef_logstash_ref.py
# c9: cfp1
# c10: cfp2
# c11: cn1
# c12: cn2
seg-a6321d13b0ab = <c1/> { "1.11" } et le codec CEF de Logstash (<c2/> { "6.2.7" } dans Logstash { "8.15.3" }) analysent { "157" } lignes CEF (chaque changement de bande et chaque époque du flux de télémétrie versionné, plus du texte adverse contenant <c3/>, des barres obliques inverses, des barres verticales, des sauts de ligne, des tabulations et du texte multi-octets) et retrouvent chaque champ d'en-tête, la gravité, l'ensemble exact des clés d'extension et chaque valeur exactement. Le codec Logstash lit aussi quatre lignes dont le texte d'en-tête nécessite un échappement, ce que <c4/> ne sait pas faire. Le seuil a été enregistré avant l'exécution de l'un ou l'autre analyseur (<c5/>) ; jeux de test dans <c6/>, scripts de référence indépendante <c7/> et <c8/> ; la CI n'a besoin ni de Python ni de Logstash. LEEF n'a pas d'analyseur ouvert maintenu et reste modélisé. Les événements CEF portent désormais le score de confiance et le décalage d'époque dans les champs personnalisés à virgule flottante du dictionnaire CEF (<c9/>, <c10/>) au lieu des champs entiers <c11/> et <c12/>, qui ne convenaient à aucune des deux valeurs ; CEF est nouveau dans cette version, donc rien de ce qui a été livré ne change.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP : <c1/> accepte le journal sous forme de <c2/> ou de <c3/> ; l'entrée de l'outil est plafonnée à { "4" } MiB.

# text
seg-8999974aa1fa = Le graphique de brouillage tire lui aussi ses couleurs de la palette.

# text
# c1: src/jamming.rs
# c2: *.chart.svg
# c3: jamming
# c4: maritime-strait-jamming
# c5: jamming
# c6: src/palette.rs
# c7: tests/palette_sync.rs
# c8: jamming-demo
# c9: maritime-strait-jamming
# c10: font-family
# c11: web/studio/recorded/
seg-8c8ff384dbf6 = <c1/> était le seul module que la révision de la palette de l'Observatory avait laissé avec ses propres couleurs pendant l'arrivée des travaux sur le Q des brouilleurs ; son <c2/> (les scénarios <c3/>, <c4/> et autres du type de scénario <c5/>) lit désormais <c6/>, et la liste d'autorisation dans <c7/> est vide. Couleurs et police seulement : les graphiques <c8/> et <c9/> sont égaux à leurs rendus précédemment enregistrés une fois la couleur, <c10/> et le pied de page de version normalisés. Aucune valeur tracée n'a bougé. Les copies Studio enregistrées sous <c11/> ont été réenregistrées lors des re-portages { "0.33.0" } et { "0.34.0" } (marque de version seulement) : elles portent encore l'ancienne peinture du graphique de brouillage, et prendront la peinture de la palette au prochain re-portage.

# text
# c1: flicker_floor
# c2: clock-ensemble
# c3: consistent = false
# c4: flicker_floor
# c5: integrity
# c6: clock-ensemble
# c7: filter_health
# c8: holdover_s
# c9: timing_p95_ns
# c10: scenarios/orbit-gnss-challenged.toml
# c11: fom.integrity
# c12: filter_health
# c13: filter_health.consistent
# c14: true
# c15: false
seg-a059d10c5330 = <b>La borne à 3 sigma de l'ensemble d'horloges couvre désormais le plancher de scintillation, et le contrôle de santé du filtre le voit.</b> Avec un <c1/>, l'horloge vraie portait du bruit de scintillation de fréquence (flicker FM), mais le filtre à deux états qui fournit la borne d'intégrité n'en portait pas, de sorte que la couverture à 3 sigma du scénario <c2/> livré était de { "0.41" } (classique) et { "0.33" } (quantique), et le contrôle NIS/NEES, qui tirait sa propre vérité à partir du modèle du filtre, indiquait des valeurs identiques avec et sans le plancher. La borne est maintenant la variance à deux états plus la variance exacte de la phase de scintillation accumulée depuis la dernière synchronisation, calculée à partir du même banc que celui qu'utilise l'horloge vraie ; le contrôle NIS/NEES tire sa vérité du modèle étendu avec ce banc et exécute le filtre étendu correspondant (et le filtre à deux états face à une vérité de scintillation indique <c3/>). Changement de sortie, seulement pour les horloges dont <c4/> est non nul : <c5/> sur <c6/> passe de { "0.40866" } / { "0.33026" } à { "0.99970" } / { "1.0" } (classique / quantique) et les NIS/NEES de <c7/> incluent désormais le scintillement ; l'erreur de synchronisation, <c8/> et <c9/> sont inchangés, et les scénarios sans plancher sont identiques à l'octet près. <c10/> (type de scénario orbit, graine { "7" }, planchers { "1e-16" } / { "2e-11" }) bouge aussi : <c11/> classique { "0.7734" } à { "1.0" } et quantique { "0.9796" } à { "1.0" }, et les NIS/NEES de <c12/> et leurs bandes changent. Son <c13/> quantique passe de <c14/> à <c15/> : un événement d'échantillonnage de l'ensemble de scintillation de 16 graines par 60 pas (NIS { "0.8815" } face à une bande de [{ "0.9125" }, { "1.0914" }]), et non un défaut. La bande est une bande à { "95" } %, donc environ { "5" } % des graines signalent un filtre adapté par construction ({ "40" } graines nouvelles de ce scénario : quantique { "1" } et classique { "2" } signalés) ; à { "64" } par { "200" }, la même graine est dans la bande pour les deux horloges (NIS { "0.990" } et { "1.001" }). Suite connue : le type de scénario fusion présente la même lacune (intégrité classique { "0.80" } avec un plancher) ; le type de scénario hybrid reste au-dessus de { "0.99" }.

# text
seg-c7308350b6d4 = <b>Durcissement de l'entrée du serveur MCP.</b> Les outils de scénario du serveur MCP n'acceptent désormais que du contenu en ligne et refusent les champs de source de fichier ; la taille de l'entrée est plafonnée. Avis : <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-065c4431197e = Rejeu en laboratoire : un moteur de suivi, des moniteurs de détection et un exécuteur de campagnes pour les enregistrements IQ GNSS, avec les conceptions de boucle, les estimateurs de C/N0 et les scores qui les accompagnent. Classe de preuve : tout ce qui suit est <b>MODELLED</b> ou vérifié pour sa cohérence interne face à des formes analytiques et à une simulation à graine fixe ; rien de cela n'ajoute de ligne VALIDATED, et le registre de vérification est inchangé ({ "251" } lignes : { "124" } validées, { "123" } modélisées, { "4" } partenaire). C'est une couche logicielle d'analyse : rien ici ne synthétise une forme d'onde de brouilleur ou de leurreur, et rien n'émet.

# text
seg-912ecb44cee4 = Rejeu en laboratoire : conditions d'essai, exécuteur de campagnes et évaluation ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> rejoue des enregistrements × des chaînes de front-end × des conceptions de boucle (<c2/>) et évalue chaque cellule par rapport à un fichier de conditions d'essai propre à chaque enregistrement (<c3/>, TOML ou JSON). Ce fichier indique ce qu'un laboratoire sait de l'enregistrement : les satellites attendus et, pour chaque événement, son étiquette de type, son début et sa fin, les satellites touchés et le profil de J/S ou de puissance de brouilleur indiqué. Ce ne sont que des métadonnées. Les scores par satellite, pour toute l'exécution et par événement, sont :

# text
seg-180447aaf31e = disponibilité, temps jusqu'à la perte d'accrochage et J/S indiqué à la perte ;

# text
seg-1ababddb0d87 = temps de réacquisition, depuis la fin de l'événement et depuis la perte ;

# text
seg-a6468323c971 = dégradation mesurée du C/N0 par classe de J/S indiqué ;

# text
seg-4cb6f510e159 = épisodes de faux accrochage par heure d'accrochage (l'indicateur du suiveur, ou le Doppler face à un fichier associé de vérité) ;

# text
seg-97c6243bac2e = gigue des discriminateurs PLL et DLL.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = À côté de chaque courbe de dégradation mesurée, une référence analytique de séparation spectrale (<c1/> avec le <c2/> du type) est tracée et étiquetée MODELLED partout où elle apparaît.

# text
# c1: data_class
# c2: synthetic
# c3: client-confidential
# c4: run.epochs
# c5: kshana.track-epoch/1
# c6: cell_key
# c7: report::digest
# c8: scorecard.csv
# c9: .json
# c10: report.html
# c11: DIGEST
# c12: [scoring.bars]
seg-eb5c38197dab = Les cellules s'exécutent en parallèle dans la machine à états de verrouillage de la session de suivi, et chacune est écrite de façon atomique sous une clé de hachage du contenu. La clé couvre le SHA-256 de l'enregistrement, les empreintes de la condition, du front-end, de la conception, de l'exécution et de l'évaluation, le <c1/> requis (<c2/> | <c3/>) et la version du moteur. Avec <c4/> défini, le flux <c5/> et les événements d'accrochage de chaque cellule sont aussi conservés, nommés par clé de cellule et intégrés par hachage à la cellule. <c6/> et <c7/> sont publics, de sorte qu'un consommateur peut redériver chaque clé et le condensé. Une réexécution saute donc les cellules terminées, et les sorties ne dépendent jamais du nombre de processus de travail. L'exécution écrit <c8/>/<c9/>, un <c10/> autonome et un <c11/>. Les seuils de réussite/échec (<c12/>, modifiables par enregistrement) sont appliqués à la construction du rapport.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (par défaut <c2/>, intégré à l'empreinte d'évaluation) choisit le C/N0 qui sous-tend le C/N0 indiqué et la courbe de dégradation. Les deux estimations sont toujours évaluées et indiquées (médianes sur l'ensemble de l'exécution et de la référence de base, et par classe de J/S), et la cellule et la fiche d'évaluation consignent l'estimateur. NWPR lit trop bas d'environ { "8" } dB × Bn·T sous la gigue propre de la boucle ; M2M4 non.

# text
seg-baf1a2422a66 = Également nouveau :

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> reconstruit les fiches d'évaluation, le rapport et le condensé à partir des cellules ;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> vérifie un fichier de conditions d'essai par rapport à son schéma ;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> importe comme événements les annotations <c2/> d'un enregistrement SigMF ;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = Python gagne <c1/>, <c2/> et <c3/> ;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> gagne <c2/>, qui est incrémental et reprenable sous le budget d'échantillons par appel, avec chaque fichier confiné au répertoire de travail, et <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Tests : <c1/> exécute une campagne synthétique de { "3" } enregistrements × { "2" } front-ends × { "2" } conceptions. Ses scènes portent des profils de C/N0 indiqués, et il couvre :

# text
seg-3f2fbdecb101 = chaque métrique vérifiée face à la vérité injectée ;

# text
seg-e103a30260db = la reprise après une exécution partielle à un seul processus avec une cellule corrompue, identique à l'octet près à une exécution ininterrompue à quatre processus ;

# text
seg-79164d8b0b22 = les fichiers d'époques par cellule ;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = une régression de réacquisition de trois satellites sur { "20" } s : avec <c1/> activé, chaque canal est de retour dans les { "2" } s suivant une interruption de { "2" } s ; le résultat avec <c2/> désactivé est figé ;

# text
seg-1deb4ab83054 = les seuils rejugés sans nouvelle exécution ;

# text
seg-351f9cdcbcd6 = la CLI ;

# text
seg-2c35af369a36 = des contrôles de débit et de mémoire en mode release, ignorés par défaut, y compris un enregistrement de { "4" } Go ({ "5.45" }× le temps réel, mémoire de pointe de { "2" } Mo au-dessus du RSS de départ ; mesures sur une seule machine, pas des seuils).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Logiciel seulement : rien n'émet, et aucune forme d'onde d'interférence ou de leurrage n'est synthétisée. Notes de conception et de réalisation : <c1/>.

# text
seg-c9871226c82f = Moteur de suivi pour le rejeu en laboratoire ({ "0.34.0" } : B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Fichiers de conception de boucle</em> : TOML <c1/> (<c2/> ; analyseur <c3/>). Une ou plusieurs conceptions nommées fixent chaque champ de la boucle :

# text
seg-0437148324ca = type de porteuse (PLL, FLL ou PLL assistée par FLL), ordres et largeurs de bande ;

# text
seg-4e722960f8c6 = discriminateurs PLL/FLL/DLL et aide de porteuse ;

# text
seg-44976e3ad4e7 = espacement et intégration ;

# text
seg-5c06173036d6 = seuils de verrouillage et fenêtres de C/N0, et synchronisation de bit ;

# text
seg-405e693dd757 = la machine à états de verrouillage ;

# text
# c1: "auto"
seg-e6908584e2f4 = l'acquisition de passage de relais (<c1/> ou explicite).

# text
# c1: extends
seg-8844cc963705 = Les conceptions peuvent s'<c1/> les unes les autres. Les clés inconnues sont refusées. Chaque conception résolue a une empreinte SHA-256 sur une forme JSON canonique (clés triées à chaque niveau, formatage numérique fixe), de sorte que l'empreinte ne dépend pas de l'ordre des champs ; chaque sortie la consigne. Surfaces :

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, où les indicateurs explicites l'emportent sur la conception et sont consignés ;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, qui exécute chaque conception du fichier ;

# text
# c1: iq_track(design=, design_name=, reacquire=)
# c2: iq_loop_designs
seg-6815ec9b33c6 = Python <c1/>, <c2/> ;

# text
# c1: iq_track
# c2: design
# c3: design_name
seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

# text
# c1: EpochOutput.cn0_m2m4_dbhz
# c2: cn0_m2m4_dbhz
# c3: cn0_beaulieu_dbhz
seg-70d3b295bea0 = <em>C/N0 M2M4</em> (<c1/>, la colonne <c2/> de track-epoch après <c3/> ; dictionnaires d'époque Python). L'estimation par moments d'ordre deux et quatre sur les mêmes fenêtres que NWPR, à partir de la seule puissance du canal prompt : NWPR lit trop bas sous la gigue de porteuse propre à la boucle (environ { "8" } dB × Bn_PLL·T) et M2M4 non. Sur GPS L2C CM ({ "20" } ms, { "40" } dB-Hz nominal, PLL { "1" } à { "10" } Hz), il lit { "39.93" } dB-Hz à chaque largeur de bande alors que NWPR passe de { "39.55" } à { "38.22" } ; sur L1 C/A à { "45" } dB-Hz, il lit { "45.34" }. NWPR et toutes les autres sorties sont inchangés (un contrôle bit à bit). L'enregistrement binaire reste de { "184" } octets (la valeur prend le flottant réservé et le bit d'indicateur { "6" }).

# text
seg-c02d07475717 = Prises de corrélateur supplémentaires (multi-corrélateur / SQM).

# text
# c1: [design.integration] extra_taps_chips = [..]
# c2: EpochOutput.extra
# c3: (offset, value)
# c4: kshana.track-epoch/1
# c5: 184 + 16 × taps
# c6: extra_taps_chips
# c7: --extra-taps
# c8: extra_taps
# c9: extra_taps_chips
# c10: iq_track
seg-70fcdc903413 = <c1/> (décalages en chips par rapport au prompt, positifs en avance ; au plus { "16" }, chacun dans ±{ "2" }) corrèle des répliques supplémentaires en plus de E/P/L et les renvoie sous la forme <c2/> (<c3/> dans l'ordre de la conception). Les boucles ne les utilisent jamais. La clé est omise du JSON canonique lorsqu'elle est vide, de sorte que l'empreinte de la conception par défaut et chaque sortie sans prises sont inchangées (<c4/> reste ; les CSV/JSONL/binaire sans prises sont identiques bit à bit). Avec des prises : colonnes CSV/JSONL, et un enregistrement binaire de <c5/> octets dont l'en-tête porte <c6/>, de sorte qu'un ancien lecteur refuse le fichier plutôt que de le mal interpréter. <c7/> (CLI), <c8/> (Python) et <c9/> (MCP <c10/>). Les conceptions d'une même exécution doivent s'accorder sur les prises.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Canaux parallèles</em> (<c1/> / <c2/> ; <c3/> en Rust). Les canaux de chaque tronçon s'exécutent sur jusqu'à N fils (<c4/> ; <c5/> reste en série). La corrélation et la machine à états de verrouillage d'un canal ne touchent que ce canal ; ses époques et événements sont mis en tampon et écrits vers les puits dans l'ordre des canaux, de sorte que la sortie (CSV, JSONL, binaire, événements, résumé) est identique à l'octet près à l'exécution en série pour tout N. Le défaut reste { "1" } fil. Mesuré sur un enregistrement de 12 canaux, { "4" } s, { "4.092" } MHz sur { "4" } cœurs : { "19.5" } s en série, { "11.5" } s avec { "2" } fils, { "6.3" } s avec { "4" } ({ "3.1" }× ; l'acquisition initiale est en série).

# text
# c1: kshana.acq-surface/1
# c2: iq::acq_surface
# c3: docs/design/ACQ-SURFACE.md
# c4: iq acquire --surface <path>
# c5: iq_acq_surface
# c6: iq_acquire
# c7: surface_out
# c8: acquire
# c9: acquire
seg-cf59911d458f = <em>Export de la surface d'acquisition</em> (<c1/> ; <c2/>, <c3/>). <c4/> (un PRN ; CSV, JSON ou binaire), <c5/> en Python et <c6/> <c7/> en MCP écrivent toute la surface de puissance de corrélation Doppler × phase de code que calcule la recherche (ses cellules sont celles de <c8/>, bit pour bit) avec le pic et deux affinages fin du Doppler : une estimation parabolique et une recherche fine au 1/16 de case (≈{ "5" } Hz à { "4" } ms de cohérence, contre des cases de { "167" } Hz). <c9/> lui-même et chaque valeur par défaut sont inchangés.

# text
seg-e3eff59db445 = La sortie en flux est identique bit à bit au rejeu en mémoire.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Machine à états de verrouillage</em> (<c1/>, <c2/>) : acquisition progressive (pull-in) → verrouillé → perdu → réacquisition → acquisition progressive, ou retiré dès qu'une perte dépasse <c3/> (par défaut { "30" } s). Les recherches échouées sont retentées toutes les <c4/> ({ "0.1" } s), à intervalles réguliers, de sorte que le calendrier de nouvelles tentatives ajoute au plus { "0.1" } s à un temps de réacquisition mesuré. Un recul facultatif (<c5/> au-dessus de <c6/>) est désactivé par défaut, et <c7/> est un plafond facultatif ({ "0" }, aucun, par défaut). Une coupure de { "2" } s sur trois PRN à { "4.092" } MS/s se termine désormais avec chaque canal réacquis et verrouillé. Avec un budget de 3 tentatives, chaque canal était retiré dans les { "0.2" } s suivant la perte.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Les seuils (<c1/>, <c2/>, la fenêtre Doppler de réacquisition) proviennent de la conception. Chaque transition est un événement avec sa raison.

# text
seg-b1c551e48389 = Le contrôle de faux accrochage recherche le Doppler suivi par rapport à son alias FLL/PLL de ±1/(2T). Il détecte le faux accrochage mesuré par la PR #38 (−{ "2400" } Hz suivis à { "500" } Hz d'écart). Avec la réacquisition activée, le canal finit verrouillé sur le Doppler injecté.

# text
seg-39409dd0b4bc = Une interruption de signal de { "0.8" } s est déclarée perte et réacquise dans les { "0.3" } s suivant le retour du signal.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (et la colonne du tableau) est l'état après la dernière transition, de sorte qu'un canal retiré après sa dernière mise à jour de boucle indique <c2/>.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>Assistance FLL seulement pendant l'acquisition progressive</b> (<c1/>, la valeur par défaut ; <c2/> conserve le comportement antérieur bit pour bit). La FLL passe la main à la PLL dès que le PLI lissé est resté au moins égal à <c3/> ({ "0.8" }) pendant <c4/> ({ "0.1" } s), et revient en dessous de <c5/> ({ "0.6" }). Laissé actif, le chemin FLL de { "10" } Hz rompait le verrouillage de phase en dessous d'environ { "38" } dB-Hz sur des signaux propres : à { "35" } dB-Hz, la fraction en verrouillage de phase était de { "10" }–{ "16" } %, avec une erreur de phase vraie de { "38" }–{ "41" }°. Avec la barrière, la valeur par défaut tient { "100" } % à { "35" } dB-Hz avec { "4.5" }°, comme une PLL seule. L'acquisition progressive à partir d'une erreur de passage de relais de { "100" } Hz est inchangée. Preuves avec seuils préenregistrés : <c6/>. <b>Les boucles par défaut ne sont donc pas identiques bit à bit aux exécutions antérieures de la conception par défaut.</b> Utilisez <c7/> pour les reproduire. Limite connue : à { "35" } dB-Hz, le passage de relais intervient { "1.9" }–{ "2.6" } s après le début du suivi, et à { "33" } dB-Hz la FLL de { "10" } Hz maintient le PLI sous le seuil de passage de relais, de sorte que l'acquisition progressive ne s'achève jamais.

# text
seg-1a911b958f8e = Nouvelles clés de conception de boucle et API, listées :

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/> : <c2/>, <c3/>, <c4/>, avec <c5/> passé d'une valeur par défaut de { "3" } à un plafond facultatif (par défaut { "0" }) ;

# text
# c1: LoopConfig.fll_assist
# c2: FllAssist
# c3: FllGate
# c4: LoopCore::set_fll_enabled
# c5: EpochOutput.fll_active
# c6: ChannelSummary.final_state
seg-d1dee2f32fc4 = Rust : <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

# text
# c1: 33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80
seg-eecacf54975b = L'empreinte de conception porte sur une forme JSON canonique, et l'empreinte de la conception intégrée par défaut est <c1/> (figée par un test).

# text
seg-2405be1bc0c6 = Notes de compatibilité des sorties :

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = le tableau de <c1/> a une colonne finale <c2/> ;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = le CSV de <c1/> a une colonne finale <c2/>, et son JSON a <c3/> et <c4/> ;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = le <c1/> du balayage est désormais la moyenne sur chaque mise à jour disposant d'une estimation NWPR (résumé à mémoire bornée), et non plus sur la seconde moitié de l'exécution.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = La réacquisition est <b>désactivée dans la conception intégrée par défaut</b>, où la machine à états ne fait qu'observer et où les boucles tournent bit pour bit comme sans elle. (Les boucles par défaut elles-mêmes ont toutefois changé : voir l'assistance FLL ci-dessus.) Activez-la par conception (<c1/>), avec <c2/>, ou avec <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = Un <b>avertissement <c1/></b> : lorsque fs est à { "1e-6" } près d'un multiple de la moitié du débit de chips (<c2/>), <c3/>/<c4/> (sortie, <c5/>, JSON de balayage), la réponse MCP <c6/> et le résultat Python <c7/> avertissent que la gigue et le biais de la boucle de code ne sont pas représentatifs. La cause racine est documentée avec des seuils préenregistrés dans <c8/>. À exactement { "2" } échantillons par chip avec un espacement de 0.5 chip, la courbe en S du DLL est une simple marche et la boucle oscille : ≈ { "0.09" } chip d'erreur de code efficace (≈ { "26" } m) à { "45" } dB-Hz, contre ≈ { "0.004" } chip à un débit incommensurable. Le C/N0 NWPR trop bas d'environ { "2" } dB à ce débit a la même cause. À exactement { "0" } Hz de Doppler de code et { "4" } échantillons par chip, le code ne franchit jamais la zone morte de ±0.21 chip, de sorte qu'un biais de phase de code allant jusqu'à environ { "0.2" } chip peut persister sans apparaître dans la gigue (mesuré : un espacement de 0.5 chip donne { "2.0" }× l'erreur de code du témoin avec une moyenne de +{ "0.011" } chip ; un espacement de 0.25 chip donne +{ "0.125" } chip) ; l'avertissement couvre ce débit.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Limite connue : la conception par défaut ne passe pas la main de la FLL à la PLL en dessous d'environ { "35" } dB-Hz</b> (un plancher d'acquisition progressive d'environ { "35" } dB-Hz ; voir l'assistance FLL ci-dessus et <c1/>).

# text
seg-43f02bc861be = Une recherche de faux accrochage ou de réacquisition qui ne peut pas s'exécuter (un débit sans nombre entier d'échantillons par période de code) n'arrête plus le suivi.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Tests : <c1/>, <c2/>, <c3/>, <c4/>, et l'aller-retour MCP IQ.

# text
seg-60141bb08f64 = Profils de C/N0 dans les scènes synthétiques ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> planifie un C/N0 variable dans le temps pour chaque satellite dans les propres scènes de Kshana, sous forme de décalages en dB par rapport au C/N0 de la scène. Formes : échelon, rampe, linéaire par morceaux, et évanouissements de Rice de type scintillation à graine fixe avec un S4 et un temps de décorrélation indiqués. Ils sont appliqués par le point d'accroche de canal de scène existant (<c2/>, en composition avec les effets d'ionosphère, de troposphère, de scintillation et de trajets multiples), sans modification du cœur de la scène. Le <c3/> du fichier associé de vérité suit le profil.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Surfaces : <c1/> et <c2/>.

# text
seg-a242e4d9f071 = À quoi cela sert : les boucles, les moniteurs et l'évaluation de campagnes peuvent être éprouvés face à une vérité connue. Cela ne modifie que la force des signaux légitimes.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Contrôles (<c1/>). Seuils : intensité moyenne des évanouissements à { "5" } % de { "1" }, S4 à { "8" } % de la cible (à S4 = { "0.3" }, { "0.7" } et { "1" }), corrélation d'intensité supérieure à { "0.9" } à { "0.05" } τ et inférieure à { "0.05" } à { "5" } τ ; vérité exactement égale au C/N0 indiqué plus le profil ; une baisse du C/N0 NWPR suivi à { "0.7" } dB près d'un échelon de { "6" } dB. Mesuré : S4 à { "1.3" } % de la cible, et une baisse suivie de { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>Moniteurs de détection sur le chemin IQ (« Rejeu en laboratoire » { "0.34.0" }).</b> Nouveau module <c1/>, commande <c2/> et liaison <c3/>. Ils observent un enregistrement et rapportent des séries temporelles ainsi que des événements signalés (instants de début, d'alarme et de fin, pic, seuil). Ils détectent et mesurent seulement ; rien ici ne génère de signal.

# text
seg-5b05b2a54fab = <b>Puissance totale / AGC</b> : puissance par bloc et gain qu'appliquerait une AGC idéale ; signale les hausses et les baisses.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Spectre avant corrélation</b> : DSP de Welch par bloc face à une référence de base apprise. Le seuil d'excès provient d'une cible de fausse alarme. Aussi le kurtosis complexe et un détecteur d'impulsions. Le détecteur d'impulsions compte les échantillons au-dessus d'un seuil dans chaque bloc et lève un événement lorsque la queue supérieure binomiale exacte de ce décompte est inférieure à <c1/> (par défaut { "1e-4" } par bloc), et non lorsqu'un score z dépasse une limite : aux faibles décomptes attendus des blocs courts, un seul échantillon représente déjà plusieurs sigmas.

# text
seg-7704ac807c38 = <b>C/N0 par canal</b> : deux détecteurs de changement CUSUM unilatéraux (baisse et hausse), alimentés par des estimations indépendantes (le pas est fixé à partir de la fenêtre de C/N0 de la boucle).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM à partir des corrélateurs</b> : delta <c1/> et rapport <c2/>, plus des tests d'asymétrie à partir de corrélateurs supplémentaires lorsqu'un canal les fournit.

# text
seg-a4006c2e8692 = <b>Séries d'indicateurs de verrouillage</b> : PLI et un indicateur de verrouillage de fréquence à partir de prompts successifs, comme signaux bruts. Les décisions de verrouillage et de perte d'accrochage restent à la machine à états de verrouillage du moteur de suivi.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Un seul passage en flux (<c1/>) exécute tout, avec un fichier de paramètres TOML/JSON (<c2/>) ; l'exécuteur de campagnes utilise le même point d'entrée. Tout est MODELLED. Chaque statistique est vérifiée face à sa forme analytique par simulation à graine fixe (<c3/>) :

# text
seg-0ff96e4c5a20 = dépassements de puissance par bloc face à la queue de la loi Gamma ;

# text
# c1: 2/√N
seg-97b559ea0897 = moyenne du kurtosis { "2" } et dispersion <c1/> ;

# text
# c1: e^{−t}
seg-2b941c702b7f = fraction d'impulsions <c1/> ;

# text
seg-e8f068c41f0c = longueurs de séquence du CUSUM face à l'approximation de Siegmund (mesuré { "330" } et { "8.46" } échantillons contre { "338" } et { "8.34" }) ;

# text
seg-e2cd6a55e49b = l'indicateur de verrouillage de phase face à la moyenne de la phase de Rice ;

# text
seg-06291b1c6274 = sur un signal C/A suivi, les dispersions du delta et du rapport SQM sont d'environ { "6" } % par rapport aux formes analytiques du premier ordre (mesuré { "5.97" } % ; seuil de test { "12" } %).

# text
seg-12deb36a2e3a = La formule de fausse alarme de l'excès spectral est une approximation ; le taux mesuré valait { "1.3" }× la formule. De bout en bout, les moniteurs signalent :

# text
seg-b002c66c7881 = un échelon de C/N0 de { "6" } dB (instant du changement à une estimation près) ;

# text
seg-2e828d106393 = un trajet réfléchi apparaissant au milieu de l'enregistrement (test de rapport) ;

# text
seg-68063f036e2c = une coupure de signal (le PLI passe de { "0.999" } à −{ "0.3" } et le FLI de { "0.93" } à { "0.03" } pendant celle-ci) ;

# text
seg-0cd95f0197ec = une tonalité à bande étroite et des échantillons épars de forte amplitude (tests spectral, d'impulsions et de kurtosis). Ce sont des entrées de test DSP génériques, et non des modèles d'interférence.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> passent en flux par la nouvelle session (voir Ajouté).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> garde ses colonnes de { "0.32" } mais est désormais diffusé en flux, de sorte que les lignes de plusieurs canaux s'entrelacent dans l'ordre du temps au lieu d'être regroupées par canal. <c2/> garde sa forme de { "0.32" } et conserve toujours chaque époque en mémoire : utilisez <c3/> pour les longs enregistrements.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> mesure la gigue sur les mises à jour de la seconde moitié de la durée de l'exécution (auparavant la seconde moitié du nombre de mises à jour), et son CSV/JSON gagne une colonne <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = Le tableau de suivi gagne une colonne <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = Le texte d'usage ne prétend plus que <c1/> accepte les indicateurs de front-end ; seul <c2/> les applique.

# text
# c1: iq_track
# c2: acq_noncoherent
# c3: doppler_max
# c4: None
# c5: carrier_phase_cycles
# c6: bit_edge
# c7: bit
# c8: state
# c9: design
# c10: events
seg-cf28fa21786a = En Python, <c2/> et <c3/> de <c1/> valent désormais par défaut <c4/> (les valeurs de la conception, { "1" } et { "5000" } Hz dans la conception intégrée). Ses époques gagnent les corrélateurs en avance/en retard, <c5/>, <c6/>, <c7/> et <c8/>, et le résultat gagne <c9/> et <c10/>.

# text
# c1: 2 / (3 · N · T_code)
# c2: 1 / (3 · N · T_code)
# c3: 1 / (4 T_track)
# c4: N = 1
# c5: 0.2 / T_track
# c6: kshana::iq::acq::default_step_hz
# c7: N = 4
# c8: "auto"
# c9: doppler_step_hz
# c10: --doppler-step
# c11: iq acquire
# c12: --summary
# c13: resolved
seg-666b9e3faa5d = <b>Le pas d'acquisition par défaut ne laisse plus au suivi de Galileo E1 un résidu que la FLL ne peut pas rattraper.</b> Le pas <c1/> laisse jusqu'à <c2/> d'erreur Doppler au passage de relais, mais la FLL à deux quadrants par défaut ne rattrape que <c3/>. Pour chaque code de { "4" } ms ou plus (<c4/>), y compris Galileo E1-B et E1-C, le résidu ({ "83.3" } Hz à { "4" } ms) était en dehors de la plage de rattrapage de { "62.5" } Hz et le suivi faisait un faux accrochage à +{ "125" } Hz, avec un indicateur de verrouillage de phase de { "0.97" } qui le masquait. Le pas par défaut est désormais aussi plafonné à <c5/> (<c6/>), soit { "0.8" } de la plage de rattrapage, de sorte que le passage de relais reste dans celle-ci même lorsque la case voisine l'emporte. ({ "0.4" } avait été essayé en premier : il faisait un faux accrochage { "1" } fois sur { "42" } sur E1-B, et une recherche GPS L1 C/A cohérente sur { "1" } ms choisissait une case à { "350" } Hz d'écart et s'accrochait à +{ "500" } Hz ; { "0.25" } et { "0.2" } n'en avaient aucun dans les mêmes exécutions.) Coût : Galileo E1-B/E1-C passent de cases de { "166.7" } Hz à { "50" } Hz, { "201" } cases sur ±{ "5" } kHz au lieu de { "61" } ; les codes de { "1" } ms ({ "166.7" } Hz, <c7/>) sont inchangés. <c8/> dans une conception de boucle signifie cela ; un <c9/> ou <c10/> explicite est utilisé tel quel, et <c11/> (sans passage de relais au suivi) garde le pas des manuels. L'en-tête d'époque et <c12/> consignent désormais le pas résolu et les largeurs de bande de boucle de chaque canal (<c13/>). L'empreinte de la conception par défaut est inchangée. Changement de sortie : les détections sur les codes de { "4" } ms et plus peuvent tomber sur d'autres cases Doppler.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>GPS L2C CM (mise à jour de boucle de { "20" } ms) garde le verrouillage avec la conception par défaut.</b> La PLL de { "15" } Hz et la FLL de { "10" } Hz par défaut ont un <c1/> de { "0.3" } et { "0.2" } à T = { "20" } ms, et la boucle perdait l'accrochage même à partir d'un départ parfait (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). La nouvelle clé de conception <c2/> (par défaut { "0.1" }) borne les largeurs de bande de bruit de la PLL et de la FLL à <c3/> lorsque le temps de mise à jour de la boucle dépasse { "4" } ms (<c4/>) : { "5" } Hz et { "5" } Hz à { "20" } ms, { "10" } Hz et { "10" } Hz à { "10" } ms pour BeiDou B1C ; les codes de { "1" } ms et { "4" } ms gardent { "15" } et { "10" } Hz. Elle s'applique aussi aux largeurs de bande explicites ; <c5/> la désactive. La clé est omise de la forme canonique à sa valeur par défaut, de sorte que l'empreinte par défaut est inchangée ; une conception qui fixe une autre valeur a une empreinte différente. À { "45" } dB-Hz, L2C CM donne désormais un PLI de { "0.996" }, une erreur Doppler de { "0.00" } Hz et un M2M4 de { "42.71" } dB-Hz. Point ouvert connu : le C/N0 NWPR lit { "1.76" } dB trop bas dans ce cas (et { "2.45" } dB trop bas sur B1C à { "10" } ms), de sorte que le T5 de la matrice pour L2C reste un constat ignoré.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> régénéré : la figure versionnée était périmée par rapport à son propre scénario (un changement de données, pas un simple repeint).</b> Le graphique avait été tracé le 2026-06-02 à partir de <c2/> ; deux jours plus tard, 67fed19e a fixé les planchers de bruit de scintillation de fréquence dans ce scénario (quantique <c3/>, CSAC <c4/>) et la figure n'a jamais été retracée. Elle montrait l'exécution d'avant les planchers : axe y de { "0" } à { "47" } ns, p95 de coupure par exécution du CSAC de { "10.5" } à { "47.6" } ns (moyenne { "25.2" } ns), holdover classique de { "4050" } s en moyenne. Le scénario tel que livré (et tel que l'indiquent déjà le tutoriel et le résumé de la CLI) donne un axe y de { "0" } à { "407" } ns, un p95 par exécution du CSAC de { "40.8" } à { "374.0" } ns (moyenne { "167.0" } ns), un holdover classique de { "844" } s [{ "220" } à { "2130" } s] ; la ligne de spécification de { "20" } ns se trouve au même { "20" } ns sur un axe environ neuf fois plus haut. Le moteur est inchangé : le moteur d'aujourd'hui sur le fichier de scénario de juin reproduit exactement l'axe de l'ancienne figure. La figure n'est référencée ni depuis le README ni depuis la documentation.

# text
seg-75636f9419b2 = Limites connues

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>Le C/N0 NWPR lit trop bas pour un C/N0·T par prompt élevé, et BOC({ "1,1" }) à { "5" } MS/s perd environ { "1" } dB.</b> NWPR est non biaisé sur des prompts idéaux, mais la gigue propre à la PLL de la boucle coûte environ { "8" } dB × Bn·T ajustés (une scène, quatre points : −0.24/−0.44/−0.77/−{ "1.58" } dB à 1/2.5/5/10 Hz et { "20" } ms ; environ −{ "1" } dB au <c1/> par défaut) ; M2M4 y est insensible. Les données BeiDou B1C à { "5" } MS/s perdent aussi environ { "1" } dB de puissance du prompt à cause de la limitation de bande (utilisez { "10" } MS/s ou plus). Aucun des deux n'est un défaut de l'estimateur ; les lignes T5 de la matrice des signaux pour GPS L2C et BeiDou B1C restent des constats ignorés avec ces causes.

# text
seg-ff195e575023 = <b>Texte des graphiques et adoption des graphiques par le Studio durcis.</b> Le texte qu'un scénario transporte dans un graphique généré est désormais échappé de façon cohérente par une routine commune, et le Studio n'adopte que le balisage de dessin d'un graphique. Les paramètres d'adresse du Studio, les recherches indexées par type de scénario et les récupérations de scénarios sont restreints à des valeurs connues. Les graphiques fournis, les résultats enregistrés et les chiffres publiés sont inchangés. La mise à jour est recommandée à quiconque ouvre dans le Studio des fichiers de scénario de sources non fiables ou intègre des graphiques générés dans des pages web. Avis : <a1>GHSA-h25h-cg9f-v2cg</a1>.

# text
# c1: iq::scene
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
# c5: sdr
# c6: iq::acq
# c7: iq::track
# c8: docs/POSITIONING.md
# c9: docs/SPECTRUM.md
seg-7f566858d036 = <b>La portée de la couche IQ en matière d'interférence et de leurrage, énoncée avec exactitude.</b> Les entrées { "0.31.0" } et { "0.32.0" } ci-dessous disent que la couche IQ n'ajoute « aucune synthèse de forme d'onde d'interférence ou de leurrage ». C'est vrai de la couche IQ elle-même (<c1/> ne génère que des signaux GNSS légitimes), mais cela se lisait comme un énoncé sur le moteur entier, et ce n'en est pas un : depuis { "0.29.0" }, la section <c3/> du type de scénario <c2/> écrit un instantané SigMF de son modèle analytique avec les brouilleurs configurés (brouilleurs de type bruit case par case, tonalités et chirps sous forme d'ondes), et <c4/> additionne en mémoire un signal authentique et une réplique de leurreur pour tester la capture de la boucle (le composite n'est jamais écrit). Le moteur embarque aussi un récepteur GNSS logiciel depuis { "0.20.0" } (<c5/> : acquisition et suivi ; depuis { "0.31.0" } aussi <c6/> et <c7/>). Rien dans Kshana n'émet ni ne pilote de matériel radio. La ligne d'état du README, <c8/>, <c9/> et les notes de conception IQ le disent désormais ; les entrées publiées sont laissées telles qu'elles ont été publiées. Aucun comportement ne change.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Limite connue : échantillonnage commensurable.</b> À un débit d'échantillonnage multiple entier ou demi-entier du débit de chips, les échantillons tombent sur les mêmes phases de chip dans chaque chip, et le discriminateur de code devient un escalier. Sur un signal GPS L1 C/A synthétique à { "45" } dB-Hz avec un espacement de 0.5 chip, { "2.046" } MHz ({ "2" } échantillons/chip) donne ≈ { "0.09" } chip (≈ { "26" } m) d'erreur de code efficace et un biais de −{ "0.09" } chip, contre ≈ { "0.003" } chip à un débit incommensurable. Le C/N0 NWPR lit ≈ { "2.4" } dB trop bas dans ce cas. À { "4.092" } MHz, cela dépend de l'espacement et du Doppler de code. À { "0.5" } chip, c'est sans conséquence à { "1500" } Hz de Doppler mais { "2" }× avec un biais de { "0.011" } chip à { "0" } Hz, et à { "0.25" } ou { "0.1" } chip, c'est { "8" }–{ "10" }× l'erreur de code. Le suivi de porteuse n'est pas affecté. <c1/> contient les mesures.

# text
seg-3a30bd47380a = Couche IQ GNSS sur le serveur MCP (phase B.1).

# text
# c1: kshana-mcp
# c2: kshana iq
# c3: iq_signals
# c4: iq_info
# c5: iq_scene
# c6: iq_acquire
# c7: iq_track
# c8: iq_frontend
# c9: KSHANA_MCP_IQ_DIR
# c10: overwrite
# c11: KSHANA_MCP_IQ_MAX_SAMPLES
# c12: kshana::iq::cli::execute
# c13: iq::cli::build_code
# c14: iq::cli::signal_names
# c15: server.json
# c16: mcp/kshana-mcp/tests/iq_round_trip.rs
seg-ef81eca03bca = <c1/> gagne six outils qui pilotent la couche <c2/> depuis un agent : <c3/> (les noms de signaux acceptés et la configuration IQ), <c4/> (décrire un enregistrement), <c5/> (générer une scène à profil indiqué ou à éphéméride diffusée, avec le canal facultatif au niveau du signal), <c6/> (acquisition par FFT, éventuellement derrière des étages de front-end), <c7/> (acquérir, puis le banc DLL/PLL/FLL) et <c8/> (passe-bande, filtre coupe-bande, blanking, excision, AGC, quantificateur). Les échantillons IQ ne traversent jamais le protocole : chaque outil prend des chemins de fichiers à l'intérieur d'un répertoire de travail défini par <c9/> (non défini, il laisse les outils de fichiers IQ désactivés sans affecter aucun autre outil), refuse les chemins qui se résolvent en dehors de celui-ci et les sorties qui existent déjà sauf si <c10/> est défini, applique un budget d'échantillons par appel (<c11/>, par défaut { "50 000 000" }) avant tout travail, refuse les arguments inconnus, et répond par un résumé JSON compact (détections, C/N0, état de verrouillage, et chaque fichier écrit avec son nombre d'octets). La sortie par époque va uniquement dans les fichiers que nomme l'appelant. Les outils exécutent le même chemin de code que la CLI par une nouvelle interface publique, <c12/>, qui renvoie le message de la CLI au lieu de l'afficher (stdout est le canal JSON-RPC de MCP) ; <c13/> et <c14/> sont désormais publics eux aussi. Logiciel seulement et additif : la couche IQ n'ajoute aucune synthèse d'interférence ni de leurreur, rien n'est jamais émis, et il n'y a aucune nouvelle dépendance. <c15/> déclare les deux variables d'environnement. Des tests d'aller-retour dans <c16/> génèrent une courte scène à deux satellites et vérifient l'acquisition face au propre fichier associé de vérité de la scène, le verrouillage du suivi et le C/N0, le front-end, la sortie SigMF, le budget, le confinement des chemins et l'état désactivé.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>La couche IQ GNSS dans le registre de validation.</b> Une vérification croisée préenregistrée face à gps-sdr-sim (un générateur indépendant de bande de base GPS L1 C/A, MIT, commit 28ca29a6) fait désormais partie de la suite de tests toujours active (<c1/>). Sa sortie de référence versionnée (<c2/> : { "20" } ms de l'I/Q 8 bits propre à gps-sdr-sim, sa liste de canaux, et l'état de canal qui la sous-tend, issu d'un banc de test lié à la même construction) est régénérée par <c3/>. Rien au moment du test n'a besoin du réseau ni de l'outil externe. Deux lignes sont ajoutées au registre ({ "251" } lignes : { "124" } validées, { "123" } modélisées, { "4" } partenaire) :

# text
seg-21d005e2ef0e = <em>Géométrie du signal d'une scène IQ GNSS face à un générateur de bande de base indépendant</em> : <b>validé</b>. La vérité de la scène (ensemble visible, pseudodistance, phase de code, Doppler, angles de visée) pour une scène à éphéméride diffusée correspond à l'état de canal de gps-sdr-sim sur les { "11" } canaux : pire cas { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } degré, contre des seuils de { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz et { "1e-4" } degré fixés avant l'exécution.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>Acquisition IQ GNSS sur des échantillons I/Q générés de façon indépendante</em> : <b>modélisé, avec un constat</b>. <c1/> trouve chaque satellite simulé dans les échantillons de gps-sdr-sim dans les seuils enregistrés (phase de code à { "0.195" } chip près, Doppler à { "72" } Hz près). Le seuil enregistré « aucun autre PRN détecté » échoue toutefois : sur la sortie sans bruit de gps-sdr-sim, le seuil de bruit gaussien est franchi par l'intercorrélation des autres satellites pour les { "21" } PRN absents. Le test strict est conservé, ignoré avec le constat, et un test figé l'enregistre. Aucun code du moteur ni aucune API publique ne change. Les échantillons I/Q ne sont pas comparés échantillon par échantillon : la table de sinus entière de gps-sdr-sim, les gains, la phase de porteuse initiale nulle et les champs LNAV tronqués ne sont pas des grandeurs sur lesquelles un récepteur doit s'accorder. La comparaison est faite sur les observables que mesure un récepteur.

# text
# c1: iq track
# c2: ceil(4 ms / T_code)
# c3: T_code
# c4: 2 / (3 · N · T_code)
# c5: docs/design/evidence/iq-track-acq-default/
# c6: kshana iq track
# c7: kshana iq sweep
# c8: --acq-coherent
# c9: kshana.iq_track
# c10: acq_coherent=None
# c11: iq_track
# c12: acq_coherent=1
# c13: --acq-coherent 1
# c14: kshana iq acquire
# c15: --coherent
# c16: iq::acq::auto_coherent_periods
# c17: iq::acq::AUTO_COHERENT_S
# c18: tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did
seg-a2be63287ce4 = <b><c1/> passe la main par défaut à partir d'une acquisition de ≈{ "4" } ms (changement de comportement).</b> L'acquisition qui initialise chaque canal de suivi intègre désormais <c2/> périodes de code de façon cohérente au lieu d'une seule, où <c3/> est la période complète du code (longueur primaire fois secondaire pour un code à niveaux, l'unité sur laquelle l'acquisition intègre). Les codes de { "1" } ms sans niveaux (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) recherchent désormais sur { "4" } périodes ({ "4" } ms), de sorte que le pas Doppler par défaut <c4/> vaut ~{ "167" } Hz au lieu de ~{ "667" } Hz. Chaque code dont la période complète est déjà de { "4" } ms ou plus garde { "1" } période : Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), et les codes à niveaux GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q et E1-C ({ "10" } à { "100" } ms avec leurs codes de recouvrement), ainsi que GPS L2C. Chaque signal intègre donc au moins ~{ "4" } ms. Une recherche sur une seule période pouvait passer la main à un canal avec un écart pouvant atteindre ~{ "333" } Hz, en dehors de la plage de rattrapage de la FLL, et celui-ci suivait alors un faux accrochage à ~{ "500" } Hz tout en indiquant un suivi propre. Sur un balayage à graine fixe de { "180" } canaux GPS L1 C/A (Doppler sur ±{ "5" } kHz, { "38" } à { "47" } dB-Hz, la moitié avec des données de navigation ; <c5/>, relançable), les faux accrochages passent de { "27" } sur { "180" } à { "1" } sur { "180" } et les acquisitions manquées de { "102" } à { "11" }, pour ~{ "40" } ms de recherche supplémentaires par PRN sur GPS L1 ({ "11" } → { "52" } ms). L'unique faux accrochage résiduel se produit à { "38" } dB-Hz, à { "36" } Hz d'écart. Toutes les surfaces concordent : <c6/> et <c7/> (<c8/>), Python <c9/> (<c10/> vaut désormais auto ; stub mis à jour) et l'outil MCP <c11/>. Les utilisateurs qui s'appuyaient sur l'ancien défaut peuvent passer <c12/> (<c13/>). Le défaut propre à <c15/> de <c14/> reste { "1" }. Nouveaux <c16/> et <c17/> publics ; test de régression <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Chaque graphique généré suit désormais le thème Observatory du site : les octets de chaque graphique changent.</b> Il s'agit d'une révision délibérée des figures publiées, des couleurs et des polices seulement ; aucune valeur tracée, aucune coordonnée ni aucune étiquette n'a bougé. Le <c1/> de chaque scénario (et donc les exports de graphiques du Studio et les graphiques de démonstration du README), le HTML du rapport d'exécution (<c2/>), l'animation de la chronologie (<c3/>), les pages HTML de résultat de scénario et d'étude, le résumé de validation et les figures et diagrammes de la documentation utilisaient la palette sombre chaude de juillet (fond <c4/>, or <c5/>) et un thème de rapport papier chaud. Ils prennent maintenant chaque couleur et chaque police d'un seul module, <c6/>, qui reflète <c7/> : les graphiques sont dessinés en sombre d'instrument sur le fond Observatory (<c8/>) avec la pile typographique Geist ; le rapport, le lecteur d'animation et les pages de résultat suivent la préférence clair/sombre du lecteur avec les jetons clair et sombre d'Observatory. Les six domaines de défaillance gardent chacun une couleur (interférence corail, leurrage magenta, synchronisation temporelle bleu, orbites cyan, intégrité citron vert, navigation ambre), et les niveaux de preuve se lisent validé citron vert, modélisé ambre, partenaire magenta. Les rampes de cascade gardent leur ordre perceptuel (inferno), réancrées sur le nouveau fond.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> aligne le module sur <c2/> dans les deux thèmes, vérifie que <c3/> et <c4/> (tous deux générés à partir du module, pour les outils de figures Python et mermaid-cli) sont à jour, et échoue si un littéral de couleur hexadécimal apparaît dans <c5/> en dehors de la palette.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> gagne un troisième diagnostic, « seuls les couleurs et les polices ont bougé », de sorte qu'une révision de palette se distingue d'une valeur tracée qui a bougé. Chaque graphique du README réexécuté a été vérifié égal à son prédécesseur sous ce normaliseur.

# text
# c1: tools/gen_validation_figures.py
# c2: domain-coverage-map
# c3: scenario-fom
# c4: sgp4-regime-bars
# c5: web/capabilities.json
# c6: clock-holdover
# c7: tests/fixtures/sgp4_comparison.md
# c8: tools/gen_readme_assets.py
# c9: sgp4-regime-bars
# c10: kshana↔ref
# c11: tests/figures_doc_sync.rs
seg-3bc4056fd57e = <c1/> lit la palette et génère désormais aussi les trois figures de résultats du README qui n'avaient aucun générateur versionné (<c2/>, <c3/>, <c4/>), avec de vrais éléments de texte, à partir de <c5/>, du résultat <c6/> et de <c7/>. <c8/> lit la même palette, ce qui corrige sa dérive du thème clair par rapport au site. Les valeurs de <c9/> sont la colonne du pire cas <c10/> de ce jeu de test ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } et { "4.12e-6" } km), inchangées par rapport à la figure Matplotlib, et <c11/> échoue désormais si la figure versionnée et le jeu de test divergent.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> actualisé avec les données courantes (un changement de données, pas un repeint).</b> La figure indiquait { "28" } capacités sur { "8" } domaines ({ "11" } validées, { "17" } modélisées), périmée par rapport à sa propre source indiquée ; tracée maintenant par son nouveau générateur à partir de <c2/>, elle indique { "46" } capacités sur { "8" } domaines ({ "17" } validées, { "29" } modélisées).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>Le Q d'un brouilleur CW/à bande étroite vaut désormais { "1.0" }, et non { "1.5" }.</b> La valeur des manuels pour une tonalité sur la porteuse est { "1" } (une tonalité conserve le pic spectral du signal, <c1/>, <c2/>) ; l'ancienne valeur de { "1.5" } rendait une tonalité moins pénalisante qu'un bruit à large bande à J/S égal. Changement de sortie : environ −{ "1.8" } dB de C/N0 effectif sous des brouilleurs CW/à bande étroite à fort J/S dans les types de scénario <c3/>, <c4/> et d'interopérabilité (la tonalité de l'exemple <c5/> fourni : { "17.98" } dB-Hz d'après le tableau, contre { "19.74" } auparavant). Le Q à large bande reste { "1.0" } (prudent, environ { "3" } dB sous la valeur des manuels d'environ { "2" }) dans l'attente de la revue de { "0.34" }. Définissez <c6/> pour conserver l'ancienne valeur de { "1.5" }.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b>La sortie entière de <c1/> utilise la plage entière.</b> Avec un bruit de puissance unitaire et une échelle d'écriture de { "1" }, les scènes <c2/>/<c3/> sortaient à environ { "{" }-1, { "0" }, { "1" }{ "}" } et les scènes sur 2 bits avaient leurs seuils à { "2.8" } sigma. Les formats entiers sont désormais mis à l'échelle de sorte que le RMS attendu par composante soit le quart de la pleine échelle ({ "31.75" } LSB en ci8, { "8191.75" } en ci16) ou { "2" } LSB sur 2 bits. L'échelle et le nombre d'éléments écrêtés sont affichés et écrits dans le fichier associé. La sortie en virgule flottante est inchangée.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Huit contrôles de jeux de test dans sept fichiers de test n'échouent plus sur macOS à cause d'écarts sur le dernier bit</b> (partie du ticket #36). Les contrôles qui vérifient que le moteur reconstruit encore les entrées versionnées d'une référence indépendante (jacobiennes, une table d'états, des azimuts de lancement) comparaient bit à bit et échouaient sur macOS arm64 de { "2" } à quelques milliers d'unités sur le dernier chiffre. Ils comparent désormais à { "1e-12" } près d'une échelle tirée du jeu de test ; les entiers, les clés et les longueurs se comparent toujours exactement, et un test de mutation montre qu'un changement relatif de { "1e-6" } échoue toujours. Le contrôle de l'azimut de lancement compare <c1/> et la branche ascendante/descendante plutôt que l'azimut lui-même, parce que <c2/> amplifie un ulp de son argument à environ { "3e-9" } rad lorsqu'une inclinaison est égale à la colatitude d'un site. Aucune tolérance de référence indépendante ni aucun seuil préenregistré n'a changé. Deux tests (détermination d'orbite conjointe lunaire, observabilité lunaire) ne sont pas couverts : sur macOS, leurs comparaisons préenregistrées elles-mêmes bougent, et cela est laissé à une suite.

# text
# c1: kshana iq track
# c2: kshana iq sweep
# c3: --bandpass
# c4: --notch
# c5: --blank
# c6: --excise
# c7: --agc
# c8: --bits
# c9: track
# c10: track
# c11: sweep
# c12: --notch
# c13: iq acquire
# c14: iq frontend
seg-b6c354fa0c28 = <b><c1/> et <c2/> appliquent les indicateurs de front-end.</b> Le texte d'usage annonçait <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> sur <c9/>, mais <c10/> et <c11/> ne construisaient jamais la chaîne : les indicateurs étaient ignorés silencieusement, et un indicateur sans valeur tel que <c12/> avalait l'indicateur suivant. Les deux commandes les analysent désormais comme le fait <c13/> et placent une nouvelle chaîne de front-end devant la passe d'acquisition et la passe de suivi. La sortie est égale à celle de la commande exécutée sur le fichier qu'écrit <c14/> pour les mêmes indicateurs.

# text
seg-d7238dab610e = Les données d'une scène IQ sont placées par signal.

# text
# c1: kshana iq scene --data
# c2: NavData::Seeded
# c3: SpreadingCode::data_modulation()
# c4: DataModulation
# c5: iq::signals
# c6: NavData::Lnav
# c7: Scene
# c8: NavData::Lnav
# c9: NavData::Seeded
seg-46ace9a3e008 = <c1/> (et <c2/>) plaçaient des bits à { "50" } bit/s sur chaque signal, pilotes compris, et au débit LNAV du GPS sur Galileo et BeiDou. Les données suivent désormais le propre rythme de symboles de chaque signal, indiqué par le nouveau <c3/> (<c4/>, défini par chaque constructeur dans <c5/>). Cela donne { "10" } ms sur L5-I5, { "4" } ms sur E1-B, { "2" } ms sur BeiDou B1I GEO (D2), et des bits de { "20" } ms avec un méandre de { "10" } ms sur GLONASS L1OF. Les données sont refusées sur les pilotes, sur GPS L2C en tant que flux unique CM/CL, et <c6/> sur tout autre que L1 C/A. Les codes personnalisés gardent par défaut le rythme précédent de { "20" } ms. Un <c7/> programmatique qui demandait <c8/> sur un code autre que L1 C/A, ou <c9/> sur un pilote, générait auparavant silencieusement et renvoie désormais une erreur à la première lecture.

# text
seg-9dd38fa39d14 = Les canaux GLONASS L1OF sont acquis et suivis sur leur propre porteuse FDMA.

# text
# c1: iq::acq::acquire
# c2: if_hz
# c3: SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)
# c4: carrier − center
# c5: if_hz
# c6: k
# c7: u32
# c8: k = -7
# c9: sat_id
# c10: k + 2^32
# c11: k
# c12: i32
seg-a775751ed6f6 = <c1/> et les canaux de suivi ramenaient chaque code en bande de base à partir de <c2/> seul. Dans un enregistrement GLONASS multicanal, une recherche du canal +{ "3" } trouvait donc le signal du canal { "0" } (tous les canaux partagent un même code de télémétrie) et ne regardait jamais { "1.6875" } MHz plus haut. Les deux utilisent désormais <c3/>. Le terme de porteuse est nul pour tout enregistrement centré sur la porteuse propre du signal et est omis lorsque le centre est inconnu, de sorte que le traitement CDMA est inchangé. Si vous aviez contourné l'ancien comportement en intégrant <c4/> dans le <c5/> du fichier associé, retirez ce terme : le décalage est maintenant appliqué à partir de la porteuse et du centre, de sorte que le laisser l'applique deux fois. Limite connue, inchangée ici : une scène GLONASS identifie chaque satellite par son canal de fréquence <c6/>, et l'identifiant de satellite <c7/> fait un repli modulo pour un canal négatif. Le fichier associé de vérité écrit <c8/> sous la forme <c9/> { "4294967289" } (<c10/>). Relisez-le comme <c11/> avec une conversion <c12/>.

# text
# c1: iq
# c2: kshana iq
# c3: scene
# c4: acquire
# c5: track
# c6: sweep
# c7: labfit
# c8: kshana.iq_scene
# c9: iq_acquire
# c10: iq_track
# c11: iq_labfit
# c12: iq_signals
# c13: iq::cli
# c14: tests/iq_cli.rs
seg-1c88bffc605b = <b>Couche IQ GNSS sur la CLI et Python ({ "0.32.0" } phase A).</b> Le module <c1/> existant est désormais utilisable sans écrire de Rust. Cinq nouvelles commandes <c2/> rejoignent le groupe de traitement de données : <c3/> génère dans un fichier une longue scène IQ multi-satellites avec un fichier associé de vérité ; <c4/> exécute l'acquisition par FFT d'un ou plusieurs PRN sur un enregistrement et rapporte chaque détection (PRN, Doppler, phase de code, statistique, seuil) ; <c5/> acquiert puis exécute le banc DLL/PLL/FLL sur un enregistrement et émet une sortie de suivi par époque (CSV/JSON) avec des largeurs de bande de boucle, un temps d'intégration et un espacement de corrélateurs configurables ; <c6/> rejoue un enregistrement à travers plusieurs conceptions de boucle et rapporte la gigue et les métriques de verrouillage obtenues pour chaque conception ; et <c7/> ajuste le modèle de perte d'accrochage de la boucle de suivi sur une chronologie receiver-trust. Le même cœur est exposé à Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), en renvoyant des listes et des dictionnaires compatibles NumPy. Logiciel seulement et additif : aucune nouvelle dépendance, aucune émission, aucune synthèse de forme d'onde d'interférence ou de leurrage ; le moteur, l'acquisition, le suivi et les conceptions de boucle sont ceux du crate lui-même, de sorte qu'un appelant CLI ou Python obtient les mêmes bits que les tests Rust. Nouveau module <c13/> ; le fichier associé de vérité de la scène est la référence indépendante dans <c14/> (l'acquisition retrouve chaque phase de code et chaque Doppler injectés, le suivi converge vers le Doppler injecté). Aucun nombre publié de types de scénario ni aucune ligne de la matrice de vérification ne change.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Capacités restantes de la bibliothèque IQ GNSS sur la CLI <c1/> et Python ({ "0.32.0" } phase A.2).</b> S'appuie sur la phase A en exposant le reste de la couche <c2/> sans écrire de Rust :

# text
# c1: iq scene
# c2: iq_scene
# c3: --iono-stec
# c4: --iono-vtec
# c5: --iono-klobuchar
# c6: --tropo
# c7: --s4
# c8: --scint-tau0
# c9: --sigma-phi
# c10: --multipath-height
# c11: --multipath-ground
# c12: --land-mobile
# c13: --nlos
# c14: iq::channel::SceneChannelAdapter
seg-67c485097357 = <b>Canal de propagation sur <c1/></b> (et le <c2/> Python) : une ionosphère du premier ordre (<c3/>/<c4/> ou <c5/>), la troposphère de Saastamoinen/Niell (<c6/>), le modèle de scintillation de Cornell (<c7/>, <c8/>, <c9/>), un multitrajet spéculaire sur le sol (<c10/>/<c11/>), le canal mobile terrestre à trois états (<c12/>) et un bloc hors ligne de vue (<c13/>) s'appliquent à chaque satellite par un nouveau pont interne au crate (<c14/>) qui convertit les trajets absolus des modèles de canal en la forme excès-sur-géométrie de la scène.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>Sortie SigMF sur <c1/></b> (<c2/>) : écrit les échantillons sous la forme d'une paire <c3/>/<c4/> avec une capture et des annotations par satellite ; <c5/>/<c6/> lisent déjà SigMF, de sorte qu'une scène fait l'aller-retour.

# text
# c1: iq frontend <in> <out>
# c2: acquire
# c3: track
# c4: --bandpass
# c5: --notch
# c6: --blank
# c7: --excise
# c8: --agc
# c9: --bits
# c10: iq::frontend
# c11: iq_frontend
seg-c59ae97779ae = <b>DSP de front-end</b> : une nouvelle commande <c1/> et les mêmes indicateurs sur <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) exécutent les étages de <c10/> (FIR passe-bande, filtre coupe-bande adaptatif, blanking d'impulsions, excision dans le domaine fréquentiel, AGC, quantificateur) ; reflétés en Python sous le nom <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Scènes à éphéméride diffusée</b> : <c1/> (avec <c2/>/<c3/>/<c4/>) place chaque satellite GPS sain à sa vraie géométrie diffusée en utilisant le lecteur RINEX du moteur, de sorte que le fichier associé de vérité porte la vraie distance, le vrai Doppler et la vraie phase de code de chaque satellite ; reflété en Python sous le nom <c5/>. Logiciel seulement et additif : aucune nouvelle dépendance, aucune émission, aucune synthèse de forme d'onde d'interférence ou de leurrage (les effets de propagation du canal n'agissent que sur le signal légitime). Chaque affirmation numérique est testée face à une référence indépendante (forme analytique ou vérité injectée) dans les tests unitaires du canal et du front-end et dans <c6/>.

# text
# c1: iq
# c2: kshana iq
# c3: iq::scene
# c4: iq::channel
# c5: iq::acq
# c6: iq::track
# c7: iq::frontend
# c8: iq::io
# c9: iq::signals
# c10: iq::labfit
# c11: docs/design/GNSS-IQ-PLAN.md
seg-1e71370d87d8 = <b>Couche IQ GNSS : simulation au niveau du signal et traitement de récepteur logiciel.</b> Un nouveau module <c1/> fait passer Kshana d'un front-end L1 C/A à satellite unique et à blocs courts à une couche complète au niveau du signal, accessible depuis le groupe de commandes <c2/>. Il génère de longues scènes IQ brutes multi-satellites avec un fichier associé de vérité par époque (<c3/>) ; applique la propagation au niveau du signal — ionosphère avec divergence code-porteuse, troposphère, scintillation d'amplitude et de phase (modèle de Cornell), multitrajet de Fresnel et canal mobile terrestre à trois états, avec hors ligne de vue (<c4/>) ; acquiert et suit avec une acquisition par FFT et un banc DLL/PLL/FLL multicanal, en rejouant un même enregistrement à travers de nombreuses conceptions de boucle (<c5/>, <c6/>) ; modélise le front-end — filtrage FIR/IIR, quantification de 1 à 14 bits, AGC, filtre coupe-bande, blanking d'impulsions et excision dans le domaine fréquentiel (<c7/>) ; traite en flux de grands jeux de données enregistrés à mémoire bornée — formats int8/int16/float32/2 bits compactés et FI réelle, SigMF multi-fichiers, rééchantillonnage, un inventaire de jeux de données avec SHA-256 par fichier et un exécuteur par lots (<c8/>) ; ajoute des codes d'étalement pour GPS L5/L2C, Galileo E1 (CBOC, vrais codes mémoire de l'ICD) et E5a, BeiDou B1C/B1I et GLONASS L1OF, chacun vérifié face à son document de contrôle d'interface (<c9/>) ; et ajuste le modèle de perte d'accrochage de la boucle de suivi sur le comportement observé d'un vrai récepteur lors d'essais en laboratoire, avec une erreur de jeu réservé en laissant une exécution de côté à chaque fois et une extrapolation étiquetée comme prédiction (<c10/>). Chaque affirmation numérique est testée face à une référence indépendante (une table de l'ICD, une forme analytique, ou un récepteur indépendant retrouvant la vérité injectée) ; les modèles physiques de canal et de boucle restent MODELLED. C'est une couche purement logicielle : elle écrit des fichiers IQ pour des récepteurs logiciels et ne synthétise ni forme d'onde d'interférence ou de leurrage ni ne pilote de matériel radio. Aucun nombre publié de types de scénario ni aucune ligne de la matrice de vérification ne change. Conception : <c11/>.

# text
seg-943e21ccb25f = Confiance du récepteur : évaluer un vrai journal de récepteur GNSS.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> lit un journal u-blox UBX, RINEX { "3" } (avec un fichier de navigation diffusé facultatif), Android GnssLogger ou NMEA { "0183" } dans une seule chronologie horodatée et exécute dessus des moniteurs de confiance : baisse de la densité porteuse sur bruit (C/N0), perte d'accrochage, commande automatique de gain (AGC), indicateur de brouillage u-blox, saut de position et, avec RINEX et navigation, le calcul de position à point unique propre au moteur avec surveillance autonome de l'intégrité par le récepteur (RAIM) en parité et le moniteur assisté par horloge. Chaque époque est nominale, dégradée ou non fiable, et le résultat dit quand et pourquoi. Les événements et les baisses de C/N0 prédites indiqués dans le scénario sont évalués par rapport à des tolérances indiquées dans le même fichier : détecté, tardif ou manqué, et concordant ou discordant. Les sorties sont le JSON de résultat, un CSV par époque et un graphique ; le résultat porte le SHA-256 du journal et chaque seuil. Également accessible depuis Python (<c2/>), le paquet WebAssembly (<c3/>, journaux en ligne) et le nouvel outil <c4/> du serveur Model Context Protocol (MCP). Sur les journaux de leurrage JammerTest { "2024" }, le chemin du moteur reproduit la première alarme de la chaîne de référence indépendante préenregistrée à chaque début publié (<c7/>). Guide : <c5/> ; exemple : <c6/>. Les moniteurs restent MODELLED ; aucune ligne de la matrice de vérification ne change.

# text
seg-55669fe92932 = Une version mineure. Les tours de validation { "2" } et les paquets de la vague 1 font passer la matrice de vérification de { "223" } lignes ({ "93" } VALIDATED) en { "0.29.3" } à { "249" } lignes ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER) ; chaque promotion a été vérifiée face à une référence indépendante avec une tolérance fixée avant l'exécution, et chaque désaccord est publié comme constat. Nouveautés : un lecteur natif de noyaux NAIF et un chemin DE440, un chemin de propagation et de temps SGP4 vers ITRS validé, une bibliothèque d'horloges mesurées, un générateur de référence LunaNet AFS, des solveurs en précision étendue et en information de racine carrée, et un vrai traitement IQ lunaire sur les données LuGRE. Les chiffres publiés qui ont bougé sont listés comme révisions ci-dessous.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Vingt-sept lignes de la matrice de vérification deviennent VALIDATED après qu'une référence indépendante a concordé dans une tolérance fixée avant la première comparaison (la règle de promotion de <c1/>) : dix lors d'un premier tour de validation et dix-sept lors d'un second. Cinquante et une lignes MODELLED ont été soumises à une référence externe au premier tour et les lignes routables restantes au second ; chaque désaccord est consigné ci-dessous comme constat plutôt que corrigé par réglage. Trois lignes ont été scindées pour qu'une partie validée ne porte pas un reste non validé, ce qui fait passer la matrice de { "223" } à { "226" } lignes ; les paquets de validation intégrés depuis la font passer à { "249" }. Les décomptes sont lus dans le <c2/> généré.

# text
seg-8d542741fa77 = après le tour { "1" }

# text
seg-ae3743f976c5 = Lignes de la matrice de vérification

# text
seg-6c4b1fd56a31 = dont VALIDATED face à une référence externe

# text
seg-90450fe87280 = dont MODELLED

# text
seg-86972e4c7f12 = dont PARTNER

# text
seg-61c5c5e308ed = Abréviations utilisées dans cette entrée

# text
seg-5907283b71da = Abréviation

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (de l'ARAIM) ; surveillance autonome avancée de l'intégrité par le récepteur ; Matlab Algorithm Availability Simulation Tool de l'université Stanford

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = écart-type d'Allan ; marche aléatoire de vitesse ; marche aléatoire d'angle

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = une boîte à outils open source d'astrodynamique (Nyx Space) ; la boîte à outils Spacecraft, Planet, Instrument, C-matrix, Events de la NASA, issue de son Navigation and Ancillary Information Facility ; noyau de constantes planétaires

# text
seg-0789b1b8dba2 = BCRS, TDB, TT

# text
seg-584e509c80a5 = Barycentric Celestial Reference System ; temps dynamique barycentrique ; temps terrestre

# text
seg-f03148ef3497 = BIPM, UTC(k)

# text
seg-d6e01fbf4f10 = Bureau international des poids et mesures ; la réalisation du temps universel coordonné par un laboratoire

# text
seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

# text
seg-77879f30c86d = Consultative Committee for Space Data Systems ; Orbit Ephemeris Message ; systèmes de temps lunaires écrits dans le champ TIME_SYSTEM du message

# text
seg-bed3cea7e74f = CRLB

# text
seg-525ebb08f4bc = borne inférieure de Cramér–Rao

# text
seg-a1fff77503b4 = CW

# text
seg-064470740a35 = mouvement relatif de Clohessy–Wiltshire

# text
seg-d70a9b3e92a7 = Éphéméride de développement { "440" } du Jet Propulsion Laboratory

# text
seg-6f6e14685742 = DOP, PDOP

# text
seg-08aad29b6845 = dilution de précision ; dilution de précision de position

# text
seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

# text
seg-e9ecdbb0f600 = filtre de Kalman étendu ; filtre de Kalman sans parfum ; système de navigation inertielle ; système mondial de navigation par satellite ; centrale inertielle

# text
seg-86765c7a6bbf = EMT, VPL, HPL

# text
seg-23029e0ceed2 = seuil effectif du moniteur ; niveau de protection vertical et horizontal

# text
seg-27786c406107 = EOP, IERS, PCC, MAE

# text
seg-9d0a1a9fdebc = paramètres d'orientation de la Terre ; International Earth Rotation and Reference Systems Service ; Prediction Comparison Campaign ; erreur absolue moyenne

# text
seg-1508f3d3a180 = ERFA, SOFA

# text
seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy ; Standards of Fundamental Astronomy

# text
seg-900c7c7e99cd = GMAT

# text
seg-0382d12eabc8 = General Mission Analysis Tool de la NASA

# text
seg-025aec0f5e29 = NTN, SSB

# text
seg-183dca4a747b = réseau non terrestre (3GPP) ; bloc de signal de synchronisation

# text
seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

# text
seg-9cebc1f9338d = International GNSS Service ; International Laser Ranging Service ; International Terrestrial Reference Frame { "2020" }

# text
seg-eaca07ff8609 = ILS, LAMBDA

# text
seg-b3cb3e6ea499 = moindres carrés entiers ; Least-squares AMBiguity Decorrelation Adjustment

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = biais inter-systèmes

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = orbite terrestre basse

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = séparation de solutions à hypothèses multiples ; niveau de protection ; niveau de protection de synchronisation temporelle

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = densité spectrale de puissance ; échantillons en phase et en quadrature ; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = bruit de projection quantique

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = surveillance autonome de l'intégrité par le récepteur

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = système de renforcement par satellite ; le Wide Area Augmentation System américain ; bifréquence multi-constellation ; un satellite SBAS géostationnaire

# text
seg-eabf9641678b = RMS, SISRE

# text
seg-50a677b8e972 = valeur quadratique moyenne ; erreur de distance du signal dans l'espace

# text
seg-430b3c681347 = RTKLIB

# text
seg-3e75054c0034 = une bibliothèque open source de positionnement GNSS

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-264e9e51b8f8 = interférométrie à très longue base

# text
seg-c3bc7d828ecc = Chaque ligne ci-dessous nomme son type de référence indépendante (Bibliothèque : une bibliothèque tierce indépendante calculant une grandeur uniquement définie ; Mesuré : données réelles mesurées ; P2 : une bibliothèque numérique indépendante recalculant une grandeur d'algèbre linéaire sur des entrées versionnées), la référence indépendante, la tolérance fixée avant l'exécution et le résultat. Chaque promotion a été réexécutée par un second relecteur, qui a régénéré le jeu de test octet pour octet et a montré qu'une mutation délibérée du moteur fait échouer le test.

# text
seg-be0a4e3ac81c = <b>Fusion de capteurs GNSS/INS</b> (Bibliothèque), limitée à l'EKF d'erreur à 15 états faiblement couplé : NaveGo v1.4 (LGPL-3.0, exécuté sous GNU Octave) sur son propre trajet réel IMU/GNSS Ekinox. Le RMS horizontal, vertical et d'innovation de position de Kshana valent { "0.912" }, { "0.940" } et { "0.861" } de ceux de NaveGo (seuil { "1.2" }) et son innovation normalisée moyenne vaut { "0.395" } (seuil { "1.5" }). Le GNSS est présent pendant tout le trajet, aucune coupure n'est donc testée. L'UKF fortement couplé et le filtre d'horloge couplé restent en dehors de l'affirmation.

# text
seg-0c82afd5ba30 = <b>Budget d'erreur d'attitude et de pointage à 3 degrés de liberté</b> (Bibliothèque), restreint au pic de couple de gradient de gravité : Basilisk { "2.9.1" } GravityGradientEffector, { "40" } cas, à { "1e-12" } près en relatif (pire cas { "2.1e-15" }). Le budget de pointage RSS est une somme de nombres fournis par l'appelant et reste en dehors.

# text
seg-71cf58e91a09 = <b>Géométrie conjointe lunaire de communications et de navigation</b> (Bibliothèque), restreinte au placement du site, à l'azimut, à l'élévation et à la distance : ANISE { "0.10.2" }, { "768" } échantillons, à { "1e-6" } deg et { "1" } mm près (pire cas { "2.2e-12" } deg et { "5.6e-9" } m). Le paramètre de précision de télémétrie est une entrée de conception en dehors de l'affirmation.

# text
seg-0687c757231b = <b>Dynamique d'attitude d'un corps rigide sans couple</b> (Bibliothèque) : le corps central de satellite Basilisk { "2.9.1" }, { "1e4" } s sur deux inerties générales, quaternion et vitesses angulaires à { "1e-9" } près (pire cas { "3.3e-11" } et { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>Résolution de l'ambiguïté entière de la phase de la porteuse GNSS (LAMBDA)</b> (Bibliothèque), restreinte à la solution ILS et à ses deux meilleures normes : RTKLIB v2.4.2-p13 <c1/>, { "300" } covariances, { "0" } désaccord d'entiers, normes à { "1e-9" } près en relatif (pire cas { "5.6e-13" }). Le taux de réussite par bootstrap reste vérifié en interne seulement.

# text
seg-c23196cbdc96 = <b>PL de synchronisation temporelle composé, MHSS scalaire</b> (P2) : numpy { "2.3.5" } et scipy { "1.18.1" } sur { "300" } entrées versionnées, PL à { "1e-9" } près en relatif (pire cas { "1.2e-10" }), sous-ensemble déterminant identique.

# text
seg-8f524d815949 = <b>Blanchiment en mode commun GLS et identité de Mahalanobis</b> (P2) : LAPACK de numpy { "2.3.5" } sur { "201" } covariances versionnées, à { "1e-12" } près en relatif (pire cas { "7.9e-16" }) ; nombres de conditionnement jusqu'à { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>Fournisseur d'orientation lunaire des axes principaux DE440</b> (Bibliothèque) : SPICE <c1/> sur le PCK binaire à { "2 000" } époques hors nœud, à { "1.7e-5" } rad près (pire cas { "1.7e-6" } rad, environ { "3" } m à la surface), après la correction listée sous « Corrigé ».

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>Entrée et sortie d'enregistrements SigMF, et spectres de Welch</b> (Bibliothèque), restreintes à la lecture et à l'écriture SigMF et à <c1/> : scipy { "1.18.1" } <c2/> à { "1e-12" } près en relatif par case (pire cas { "6.0e-14" }) ; enregistrements de sigmf-python { "1.13.0" } décodés à l'identique bit à bit ; métadonnées du crate valides face au schéma SigMF { "v1.2.6" }. La synthèse IQ et ses comparaisons de modèles restent en dehors.

# text
seg-a7756d2e124a = <b>Ajusteur d'éphéméride diffusée LEO et SISRE selon l'intervalle d'ajustement</b> (Mesuré), restreint à l'ajustement képlérien à 16 paramètres et à son SISRE d'orbite seule : orbites précises ITSG de TU Graz pour quatre satellites face aux statistiques de Liu et al. { "2025" }, composantes à moins de 1.5x ({ "0.804" } à { "1.087" }) et SISRE à moins de 1.5x ({ "0.716" } à { "0.809" }).

# text
seg-99debd58724a = Constats

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = La référence indépendante a contredit ces lignes, qui restent donc MODELLED. Chaque constat est aussi écrit dans le texte de référence indépendante de la ligne (et donc dans <c1/>), avec un test qui le fige.

# text
seg-e28fac875d8c = <b>Estimation de l'état d'horloge embarquée :</b> sur des horloges IGS mises de côté de { "11" } satellites GPS Block IIF, le filtre à trois états est cohérent à un pas mais trop confiant à une heure sur { "9" } sur { "11" } (les termes périodiques et de scintillation ne sont pas dans le modèle).

# text
seg-5900ce454dc7 = <b>Détection du leurrage :</b> sur JammerTest { "2024" }, aucun moniteur au niveau des observables n'a donné l'alarme dans les { "10" } s suivant l'un des { "8" } débuts publiés, et trois fenêtres antérieures aux débuts comportaient de fausses alarmes.

# text
seg-08b6e6aa7d08 = <b>Niveau de protection de synchronisation temporelle sous leurrage :</b> l'erreur de temps non détectée mesurée dépasse le TPL à { "3" } débuts détectés sur { "8" } (1.9x à 5.3x) ; une calibration d'horloge de { "60" } s ne couvre pas la dérive du TCXO du récepteur.

# text
seg-a2f4df11d9cc = <b>Fenêtre de lancement et géométrie d'ascension :</b> face à Orekit { "12.2" }, la géométrie concorde aux arrondis près, mais la vitesse du site due à la rotation terrestre dépasse { "1e-6" } en relatif à { "62.9" } deg de latitude ({ "1.12e-6" }, le mouvement du pôle que le modèle sphérique omet). Tour { "2" } : la vitesse au pôle vrai avec une époque concorde, la vitesse par défaut sans époque dépasse encore (voir ci-dessous).

# text
seg-f6b6c9251a17 = <b>Couloir de rentrée balistique (Allen–Eggers) :</b> la décélération maximale prédite pour la rentrée de Stardust est de { "61.8" } g contre { "32.89" } g reconstitués (+{ "88" } %, tolérance { "15" } %).

# text
seg-5d83648dd867 = <b>Erreur conjointe d'UT1 et de mouvement du pôle :</b> face à la formule de précision imprimée dans { "178" } numéros du Bulletin A de l'IERS, le pôle concorde à moins de 1.5x mais pas UT1 ({ "0.48" } à { "10" } jours, { "1.59" } à { "40" } jours). Remplacé au tour { "2" } : la ligne est désormais VALIDATED (voir ci-dessous).

# text
seg-98a99bcba894 = <b>Entrée d'orientation terrestre par défaut hors ligne :</b> astropy confirme le décompte des lignes, mais les { "12" } lignes que le crate appelle prédictions du Bulletin A sont signalées comme mesurées (I), et non comme prédites (P). Les chiffres de concordance de la ligne du prédicteur opérationnel portaient donc sur des lignes mesurées. Remplacé au tour { "2" } : le moteur classe les lignes d'après l'indicateur et la ligne est VALIDATED.

# text
seg-d96fbfa4be79 = <b>Erreur de prédiction d'orientation terrestre de style opérationnel :</b> l'erreur d'UT1 du prédicteur vaut 2.4x à 12.6x celle du Bulletin A à { "1" } à { "10" } jours et { "5.32" } ms à { "10" } jours, en dehors de la plage de { "0.36" } à { "3.13" } ms de la 2nd EOP PCC.

# text
seg-1833bf6e3b6f = <b>VLBI géodésique lunaire :</b> face aux temps de parcours de la lumière d'ANISE via DE440, aucun retard n'est à { "1" } ps près ; le plus grand écart est de { "24" } µs, essentiellement dû au centre analytique de la Lune (à environ { "200" } km de DE440). Tour { "2" } : le chemin par noyau est VALIDATED dans une ligne à part ; ce chemin analytique reste MODELLED.

# text
seg-0ec8a2a91702 = <b>Export d'interopérabilité lunaire :</b> Orekit { "12.2" } refuse les systèmes de temps LTC et TCL, de sorte que l'échange des fichiers OEM lunaires avec un second lecteur n'est pas établi.

# text
seg-09cfd4e61b7b = <b>Mouvement relatif de Clohessy–Wiltshire :</b> face au mouvement non linéaire d'Orekit à { "100" } m, l'écart est de { "1.2" } à { "6.3" } mm, au-dessus de { "1" } mm ; il évolue comme le terme du second ordre omis, de sorte que la tolérance préenregistrée se situait sous l'erreur de linéarisation. Remplacé au tour { "2" } : la correction du second ordre est VALIDATED face au même seuil.

# text
seg-af1bdd974ba5 = <b>Croissance de l'erreur en roue libre INS/TRN :</b> face à un Monte Carlo en inertiel libre de NaveGo, les lois de croissance tiennent à { "5" } % près jusqu'à { "600" } s et surestiment au-delà (2.2x à 8x à une heure), parce qu'elles omettent la rétroaction de Schuler. Remplacé au tour { "2" } : le modèle d'erreur de Schuler est VALIDATED.

# text
seg-8459bc50f8b4 = <b>Volume de service lunaire à partir de la vraie géométrie de constellation :</b> { "4" } des { "12" } statistiques de disponibilité publiées diffèrent de plus de { "2" } points de pourcentage (jusqu'à { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Surbornage hétérogène du biais de traçabilité UTC(k) :</b> sur { "105 024" } lignes du BIPM, le surbornage est dépassé sur { "50.8" } % des lignes ; l'incertitude publiée borne la mesure du décalage par le BIPM, et non le décalage lui-même.

# text
seg-814acf34cffd = <b>Classification de l'espace nul du datum lunaire :</b> sur la géométrie publiée à cinq réflecteurs, la corrélation est de -0.78 contre -0.97, et la CRLB de l'origine est inférieure de { "96" } à { "98" } % à celle de l'article.

# text
seg-da01b5e08a87 = <b>Substrat de géométrie du datum LLR lunaire :</b> face à { "192" } points normaux lunaires de l'ILRS de { "2024" }, le RMS des résidus aller simple était de { "96" } m avec l'ancienne interpolation d'orientation et est de { "22.7" } m après la correction ci-dessous, toujours au-dessus du seuil de { "10" } m (coordonnées de station arrondies, pas de mouvement du pôle). La série d'orientation se borne silencieusement en dehors de 2024-2025. Tour { "2" } : le modèle de distance mesurée est VALIDATED dans une ligne à part ({ "2.81" } m) ; la série couvre désormais 2014-2030 et signale une erreur en dehors.

# text
seg-fd9ad94680e9 = <b>Couplage du taux d'horloge relativiste au référentiel :</b> le terme de potentiel propre est supérieur de { "3.18e-4" } à la valeur publiée (tolérance { "1e-4" }) ; l'article évalue un potentiel différent, de sorte qu'aucune valeur publiée de cette forme analytique n'existe. Remplacé au tour { "2" } : le potentiel équatorial de degré 2 est VALIDATED face au même article.

# text
seg-e002819c1e2d = <b>Constantes physiques de chaque corps du système solaire :</b> { "12" } des { "84" } constantes des corps ajoutés diffèrent de NAIF pck00011 et gm_de440 (éléments plus anciens des satellites de Mars ; d'autres solutions de GM pour Uranus, Neptune et Pluton). Tour { "2" } : les constantes suivent désormais NAIF (une transcription, non comptée), et l'orientation calculée concorde avec SPICE ; la ligne reste MODELLED.

# text
seg-e722d242e78e = <b>Modèles d'éphéméride LEO sélectionnables :</b> l'ajustement à 22 paramètres laisse 1.71x et 1.86x l'erreur le long de la trace publiée sur des arcs de { "20" } min, au-dessus de 1.5x. Remplacé au tour { "2" } : le modèle à 22 paramètres et son ajustement sont VALIDATED dans une ligne à part.

# text
seg-c136023752df = <b>Positionnement conjoint GNSS et LEO :</b> le biais inter-systèmes concorde avec RTKLIB, mais { "93.2" } % des époques sont à { "3" } m de l'ITRF2020 contre { "95" } % ; RTKLIB lui-même atteint { "88.2" } % sur les données ({ "93.6" } % après la correction du délai de groupe du tour 2).

# text
seg-e5f0e3c21def = <b>Cécité d'intégrité en mode commun</b> et <b>cartes de couverture et de DOP :</b> les deux comparaisons ont réussi mais ont été écartées à la relecture parce qu'un moteur délibérément faux les réussit aussi (la première ne vérifie qu'une identité interne ; les planchers publiés de la seconde ne peuvent pas voir un PDOP doublé). Tour { "2" } : la cécité d'intégrité en mode commun est VALIDATED sur des entrées porteuses de parité ; les cartes de couverture restent un constat (voir ci-dessous).

# text
seg-688e1753cd53 = Tour de validation { "2" }

# text
seg-b320fbdb72c3 = Le second tour a repris chaque ligne que le premier avait laissée routable, avec de nouveaux préenregistrements versionnés avant que tout jeu de test soit récupéré ou toute référence indépendante exécutée, un second relecteur adverse qui a réexécuté chaque comparaison et une mutation délibérée du moteur qui doit faire échouer chaque test. Le propriétaire a accepté la formulation corrigée de la ligne de borne hors Omega le 2026-10-02 avant sa promotion (son ancien texte contredisait le code).

# text
seg-7b7c584caaaf = <b>Promues à VALIDATED ({ "17" }).</b> Type de référence indépendante entre parenthèses ; tolérance fixée avant l'exécution.

# text
seg-555e6ad454d2 = <b>Couplage du taux d'horloge relativiste au référentiel</b> (Référence) : L_m d'Ashby et Patla { "2024" } à { "2.8e-6" } près (seuil { "1e-4" }) à partir du potentiel équatorial de degré 2 des deux champs que cite l'article ; gravité de degré 350 de pyshtools pour l'entrée radiale ({ "8.3e-5" }) ; vitesse lunaire DE441 ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Entrée d'orientation terrestre par défaut hors ligne</b> (Bibliothèque) : astropy { "8.0.1" } et le Bulletin A de l'IERS n° { "039" } confirment les { "30" } lignes finales, { "54" } rapides et { "90" } prédites de l'extrait retaillé.

# text
seg-b77253dd26b5 = <b>Erreur conjointe d'UT1 et de mouvement du pôle</b> (Bibliothèque) : les rotations complètes d'astropy et de pyerfa reproduisent la table conjointe (UT1 et pôle à { "6e-16" } près, la combinaison à { "1.9e-7" } près) ; les erreurs réalisées du rapport annuel { "2019" } de l'IERS donnent des rapports de { "1.001" } à { "1.100" }.

# text
seg-378414f812c1 = <b>Empreinte et couverture d'une charge utile d'observation de la Terre</b> (Bibliothèque) : Orekit { "12.2" } et GeographicLib { "2.1" } à chaque seuil préenregistré, avec la régression nodale J2 désormais dans l'espacement des nœuds.

# text
seg-792bf58a1c1e = <b>Mouvement relatif de Clohessy–Wiltshire</b> (Bibliothèque) : avec une correction du second ordre sous forme analytique, à { "1.2e-7" } m du mouvement non linéaire d'Orekit contre { "1e-3" } m ; la matrice linéaire seule reste caractérisée ({ "1.2" } à { "6.3" } mm).

# text
seg-423437d90022 = <b>Ciblage dans le plan B et assistance gravitationnelle en coniques raccordées</b> (Bibliothèque) : plan B de GMAT R2026a, asymptotes, C3 et éléments héliocentriques ; sbpy { "0.6.0" } et Kasuga et Jewitt { "2019" } pour le paramètre de Tisserand.

# text
seg-b29b0dfcd3a4 = <b>Croissance de l'erreur en roue libre INS/TRN</b> (Bibliothèque) : un modèle d'erreur de Schuler à neuf états à { "5" } % près des exécutions en roue libre corrigées de NaveGo aux { "48" } points (pire cas { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Cécité d'intégrité en mode commun</b> (P2) : <c1/> de numpy sur { "1464" } entrées porteuses de parité à { "1e-12" } près (pire cas { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>OD et horloge lunaires conjointes multi-techniques</b> (P2) : numpy recalcule chaque pas de Gauss-Newton, sigma et erreur de station sur six réseaux (à { "2.4e-11" } près) après une correction de la résolution QR.

# text
seg-7ed9b059f888 = <b>Covariance des coordonnées de station du VLBI lunaire</b> (Bibliothèque) : une jacobienne construite avec SPICE reproduit le calendrier, le spectre, les sigmas et l'espace nul à { "1" } % et { "0.1" } deg près ; numpy à { "2e-13" }.

# text
seg-0e4e1c3fc899 = <b>Borne de mode commun indétectable avec résidu hors Omega</b> (P2, formulation corrigée par décision du propriétaire) : LAPACK de numpy sur { "256" } cas à { "1e-12" } près, six infinis exacts.

# text
seg-0fc8ce9cde6c = <b>Classification de l'espace nul invariante par changement de base</b> (P2) : intersection de sous-espaces SciPy et NumPy sur { "72" } matrices construites, entiers exacts, norme du projecteur à { "6.0e-15" } près.

# text
seg-4e5e7a6072bc = <b>Services ionosphérique monofréquence et UTC d'un message de navigation LEO</b> (Bibliothèque) : GNSSTk { "15.3.1" } pour Klobuchar, Az et la dérive UTC ; ERFA pour les trois cas de seconde intercalaire.

# text
seg-a644bf49c816 = <b>Borne de positionnement par réseau non terrestre 5G</b> (P1) : bornes à SSB unique de Bachl, Lei et Nabeel { "2026" } à moins d'un demi-chiffre imprimé ; numpy pour les covariances de position.

# text
seg-b326f6fc55ad = <b>Modèle de distance mesurée LLR</b> (Mesuré, nouvelle ligne scindée du substrat de datum LLR) : { "192" } points normaux lunaires de l'ILRS à { "2.81" } m de RMS contre un seuil de { "10" } m, avec le temps de parcours de la lumière barycentrique de l'IERS { "2010" } ; les composantes sous le seuil ne sont pas résolues une à une, et la ligne le dit.

# text
seg-82e9fba684dc = <b>VLBI géodésique lunaire, chemin par noyau</b> (Bibliothèque, nouvelle ligne scindée de la ligne VLBI lunaire) : temps de parcours convergés de SPICE à { "1" } ps près et dérivées partielles à { "1e-6" } près à des époques proches de J2000 ; le chemin analytique par défaut reste MODELLED.

# text
seg-03c47d262ff3 = <b>Modèle d'éphéméride LEO à 22 paramètres de Liu et al. { "2025" } et son ajustement</b> (Mesuré, nouvelle ligne scindée de la ligne des modèles sélectionnables) : de vraies orbites précises à moins de 1.5x des statistiques publiées sur les jours de l'article et les jours mis de côté ({ "0.683" } à { "1.186" }) ; la convention d'échelle de n_dot est transcrite et non validée par cette comparaison, et la règle d'arrêt est la règle de convergence des paramètres de Kshana, et non la règle de variation du RMS de l'article. Le polynôme ATOMIC et la table à cinq altitudes restent MODELLED.

# text
seg-b49f96eb52ad = Lignes VALIDATED existantes réétayées (aucun changement de nombre).

# text
seg-4e26bec3297c = <b>Positions des planètes d'après les éléments de Standish du JPL</b> et <b>temps de parcours de la lumière entre corps du système solaire</b> : les seuils a posteriori de deux fois le nominal sont remplacés par des comparaisons préenregistrées avec JPL Horizons DE441 (RMS au plus égal au chiffre du tableau { "8.10.1" } de l'Explanatory Supplement, pire cas { "0.778" }, la séparation de la Terre et la rotation ICRF comprises ; temps de parcours à { "1e-6" } s d'Horizons sur les positions DE441, pire cas { "6.7e-9" } s). Leurs indicateurs « limite fixée après la comparaison » sont retirés.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Intégrité (RAIM/ARAIM/SBAS)</b> : la ligne ne repose plus sur des contrôles de plausibilité. Elle dit désormais : la séparation de solutions à hypothèses multiples de l'ARAIM de l'ADD v4.2 concorde avec Stanford MAAST pour l'ARAIM { "2" } sur { "270" } cas réels (pire écart de VPL { "2.2e-3" } m contre { "0.05" } m) ; la détection et l'exclusion RAIM instantanées concordent avec <c1/> de RTKLIB sur { "2016" } décisions sur { "2016" }, avec le niveau de protection de pente à { "2.7e-12" } m près ; les niveaux de protection L1 SBAS DO-229E concordent avec Stanford MAAST sur de vraies diffusions WAAS ({ "2868" } paires à { "1.6e-5" } m près). Elle indique clairement que les fonctions à sigma uniforme <c2/> et <c3/> ne sont PAS conformes à l'ADD (écarts à entrées appariées de 0.75/4.04 m et 0.39/1.93 m en VPL/HPL, un constat), que la comparaison SBAS L5 DFMC est un constat ({ "308" } paires sans GEO en vue sont protégées par Kshana et non par MAAST) et que <c4/> n'a aucune comparaison externe. Son indicateur d'auto-évaluation est retiré.

# text
seg-d059b9953c3f = <b>Ajusteur d'éphéméride diffusée LEO</b> : l'orbite vraie intégrée est ajoutée à la partie validée (Orekit { "12.2" } à { "4.55" } mm près sur { "6" } h, seuil { "2" } cm) ; les polynômes de correction, l'ajustement d'horloge et le compromis sur la période de mise à jour restent modélisés.

# text
seg-166d511bbba3 = <b>Constats et lignes bloquées (restent MODELLED).</b> Le texte de référence indépendante de chaque ligne porte le constat et son test figé.

# text
seg-7f233dbdf110 = Modulation des signaux de navigation (Betz { "2001" }, Hein { "2006" }) : les spectres et les corrélations concordent ; les lobes latéraux de { "24" } MHz et chaque biais de multitrajet ({ "11" } à { "15" } % trop bas) non, cause non résolue.

# text
seg-4d5a6bb44d64 = Géolocalisation TDOA/FDOA : les bornes correspondent à Ho et Chan et à Ho et Xu, et au code des auteurs à { "3e-12" } près ; les facteurs d'Ottawa imprimés à partir d'un Monte Carlo diffèrent de { "1.3" } % et { "4.4" } %.

# text
seg-5fa189f788ca = GNSS terrestre à distance lunaire : les moyennes au zénith de GENESIS concordent avec Montenbruck et al. { "2023" } sur { "5" } sur { "6" } ; les moyennes au nadir sont de { "1.0" } à { "2.4" } satellites trop hautes.

# text
seg-d7e5b5a64f43 = Cartes de couverture et de DOP : les conceptions terrestres concordent avec Orekit, gnss_lib_py et numpy sur chaque seuil ; les conceptions Lune et Mars dépassent { "1e-9" } uniquement sur des cellules quasi singulières.

# text
seg-3c8fb07d83ec = Positionnement GNSS conjoint : bifréquence { "79.9" } % et produits précis { "94.2" } % à { "3" } m près contre { "95" } % (RTKLIB { "67.9" } % et { "94.1" } %) ; l'écart d'ISB avec produits précis vient de ce que RTKLIB ignore les décalages d'antenne.

# text
seg-5d3d4d99fbc4 = Boucles de suivi (GNSS-SDR { "0.0.19" }) : concordance de { "35" } à { "45" } dB-Hz ; à { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, seuils +{ "1.5" } dB ; temps de glissement plus courts de { "0.5" } à { "2" } décades.

# text
seg-0dd24947169c = Volume de service lunaire (Orekit et Hipparchus) : { "155" } valeurs sur { "160" } concordent ; l'exigence du pire échantillon échoue sur la géométrie quasi singulière LNCSS B.

# text
seg-74002245287f = Capteur inertiel quantique : le plancher QPN seul est inférieur de { "21" } à { "31" } % au bruit mesuré de Gauguet { "2009" } (seuil { "30" } %, manqué de { "0.5" } point).

# text
seg-ab8b17cf325e = Préréglages d'oscillateurs : les unités mesurées dépassent les préréglages de holdover du rubidium, de court terme du césium et de pire unité du CSAC ; le préréglage OCXO n'a aucun enregistrement mesuré.

# text
seg-81ad9b839a28 = Densité de météo spatiale : Jacchia { "1971" } est à un facteur { "2" } des densités d'accéléromètre au maximum solaire mais environ 1.7x trop dense au minimum de { "2008" }.

# text
seg-68e5d0942847 = TEC oblique sans géométrie : { "33" } arcs sur { "36" } à { "3" } TECU de la carte CODE (pire cas { "6.84" }).

# text
seg-f410ce9cf195 = Détection du leurrage et TPL face au journal officiel JammerTest { "2024" } : { "4" } débuts sur { "10" } détectés à temps ; le TPL est dépassé sur { "4" } sur { "10" }.

# text
seg-41eb2c318469 = Filtre d'horloge sur de nouvelles horloges IGS : deux satellites sur { "11" } échouent au critère de la somme des innovations.

# text
seg-064b623e918b = Prédicteur EOP par moindres carrés plus autorégressif : UT1 de { "1.73" } à 2.11x le Bulletin A à { "2" } à { "10" } jours.

# text
seg-d98571cc21f4 = Surbornage du décalage réalisé UTC(k) : dépassement cumulé de { "0.0333" } contre { "1e-2" }.

# text
seg-527aca91ec7c = Datum du référentiel lunaire à partir d'une campagne : la branche SPICE concorde ; la branche P2 à stations estimées manque { "1e-9" } sur un problème de conditionnement 2.1e8.

# text
seg-9805c4c821f9 = Datum du référentiel lunaire à partir de vrais LLR : { "15" } chiffres sur { "16" } concordent avec SPICE ; le sigma de la translation en z est trop haut de { "1.03" } % contre { "1" } %.

# text
seg-08e6c541b59e = Rentrée (Allen-Eggers) : la solution à masse ponctuelle concorde avec les reconstitutions d'agences (une simple vérification croisée) ; la comparaison avec l'accéléromètre est bloquée faute d'une source Hayabusa2 lisible.

# text
seg-0bb78ffbd915 = Masques ITU-T : les valeurs de l'exemple imprimé concordent ; les limites de classe G.8273.2 n'en ont pas (bloqué).

# text
seg-308c1bca3fd9 = Géométrie de la fenêtre de lancement : la vitesse du site au pôle vrai avec une époque concorde avec Orekit ({ "4.9e-8" }) ; la vitesse par défaut sans époque dépasse encore ({ "1.12e-6" }). Non promu ; suite en attente.

# text
seg-f0b7c3d60df8 = Constantes physiques de chaque corps : désormais { "0" } sur { "84" } diffèrent de NAIF (une transcription), et l'orientation calculée concorde avec SPICE à { "1.4e-10" } rad près. Non promu ; suite en attente.

# text
seg-a5a787c9a761 = Bloqué en attente d'une décision de périmètre du propriétaire, chacun avec sa comparaison concordante versionnée : observabilité absolue d'une station lunaire, DOP de balises de surface, l'export hors axe, puissance de détection intermodale, la statistique de cohérence en mode commun et couverture LEO polaire.

# text
seg-cf638ec9878b = Bloqué en attente de données : budget d'erreur du transfert de temps (nécessite une réduction de données réelles), C/N0 de JammerTest (position de l'antenne et répartition de puissance non documentées).

# text
seg-e8709509eef3 = Révisions (chiffres publiés qui ont bougé, ancien -> nouveau).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = Les niveaux de protection de <c1/> sont désormais dans le plan local géodésique au lieu du plan radial : jusqu'à { "0.31" } m de HPL et { "0.14" } m de VPL à ABMF ({ "16" } deg N) ; aucune référence figée (golden) n'a bougé, mais le résumé enregistré du tutoriel <c2/> passe d'un HPL moyen de { "22.1" } m / VPL de { "40.0" } m à { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Valeurs par défaut du couplage taux-référentiel lunaire : d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" } ; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } par mètre.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = Exécution EOP par défaut hors ligne (<c1/>, cellules listées dans <c2/>) : predicted_rows { "12" } -> { "90" } ; plancher du pôle { "0.06776" } -> { "0.05550" } mas ; eop_term_m { "14.01601" } -> { "14.01583" } ; total_m { "20.09759" } -> { "20.09746" } ; total_time_ns { "67.03834" } -> { "67.03790" } ; les lignes du tableau { "2" } de <c3/> ; concordance du prédicteur opérationnel 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> liu22 SISRE orbite/avec horloge : { "60" } s 0.011/0.046 -> 0.014/0.046 cm ; { "300" } s 0.068/0.139 -> 0.074/0.142 cm ; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Table d'altitudes de Liu, Kshana (rapport) : GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }) ; GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }) ; Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }) ; HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }) ; Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = Message de navigation LEO, échelle de <c1/> { "2" }^-60 -> { "2" }^-58 (non préenregistré, divulgué ; en dehors de la comparaison d'ajustement) ; le CRC de la trame d'exemple liu22 0x62373A -> 0xDED99C.

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = Tableau de vérification de <c1/> : la ligne Liu et ATOMIC est scindée en une ligne VALIDATED à 22 paramètres et une ligne MODELLED ATOMIC et à cinq altitudes.

# text
seg-537f5d80b66c = Texte de la ligne d'orientation lunaire des axes principaux DE440 : portée 2024-2025 / { "731" } lignes -> 2014-2030 / { "6 209" } lignes ; « se borne silencieusement » -> erreur en dehors de sa portée.

# text
# c1: eo-coverage
seg-17a5dd090566 = Scénario <c1/> : equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km ; nouveaux champs inclination_deg ({ "98.19" }) et nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (l'horloge de référence TDOP/GDOP est désormais la constellation de plus petit numéro en vue) : GDOP global max { "2.2236" } -> { "2.1205" }, moyenne { "1.122" } -> { "1.131" }, médiane { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, et la carte de GDOP par cellule ; mean_visible_by_constellation sommé en entiers (environ { "1e-12" } en relatif, invisible à { "4" } décimales).

# text
seg-e48b212c4881 = Position GNSS conjointe monofréquence après la correction du délai de groupe diffusé : { "93.2" } % -> { "93.6" } % à { "3" } m près ; médiane d'ISB -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (boucle de Costas SNR rho/4) : au seuil de { "25.47" } dB-Hz { "11.58" } -> { "2.10" } ; à { "25" } dB-Hz { "9.55" } -> { "1.60" } ; à { "22" } dB-Hz { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/> : chaque sortie bouge avec le modèle d'erreur de Schuler ; le pic TRN du scénario livré { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = Rapport de <c1/> : nouvelle clé geometry_path (« analytic » à l'exécution par défaut, aucune valeur numérique n'a changé) ; nouveaux champs facultatifs planetary_kernel_path, earth_orientation_kernel_path et moon_orientation_kernel_path, avec epoch_partials sur le chemin par noyau ; la description du type de scénario est réécrite. La référence indépendante de la ligne de vérification pour le chemin par noyau est SPICE ({ "0.06" } ps) ; ANISE ({ "0.12" } ps) devient une vérification croisée de l'évaluation du noyau.

# text
seg-3631a31e7b26 = Constantes des corps : GM de Phobos { "7.087e5" } -> { "7.087546066894452e5" } ; Deimos { "9.62e4" } -> { "9.615569648120313e4" } ; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" } ; Neptune { "6.83509997e15" } -> { "6.835103145462294e15" } ; Pluton { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }) ; rayon équatorial de Phobos { "13.1" } -> { "13.0" } km ; pôle et méridien origine de Phobos et Deimos d'après pck00011 ; le prime_meridian_deg du système solaire inclut désormais les termes quadratique et périodiques.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> sur Europe), à partir de l'orientation complète d'Europe de pck00011 (7cfd66b4 ; l'orientation concorde avec le pxform de SPICE à { "1.4e-10" } rad près), ce qui déplace l'atterrisseur dans l'espace inertiel : disponibilité relais seuls / avec la portée Terre { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } époques sur { "171" } avec relais seuls), PDOP médian { "5.266" } -> { "5.360" }, erreur RMS de position { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, sigma formel médian { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Le tableau de <c3/> et le contrôle figé de <c4/> suivent ; <c5/> est inchangé.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), le facteur calibré remplacé par Jacchia { "1971" } : activity_density_kg_m3 à 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" } ; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232 ; reference_exospheric_temperature_k retiré, mean_exospheric_temperature_k ajouté ({ "1186.7" } K) ; <c2/> : l'amplitude du cycle solaire à { "800" } km est désormais de 10.4x (NRLMSISE-00 13.6x) et l'assertion d'altitude suit la hausse de NRLMSISE jusqu'à { "500" } km et sa baisse à { "800" } km.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m : NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m ; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (texte du résumé inchangé à { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (résolution QR) : with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m ; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> réémis pour les champs nouveaux et supprimés ci-dessus.

# text
seg-717c51e1cca0 = Paquets de validation

# text
seg-4ec44f8a5f8e = D12, précision étendue et solveur en racine carrée (deux nouvelles lignes VALIDATED : { "226" } -> { "228" } lignes, { "110" } -> { "112" } validées).

# text
seg-d28005966948 = Partie { "1" }, référence indépendante en précision étendue :

# text
seg-9a5f94973450 = Datum du référentiel lunaire avec les stations estimées : une référence indépendante mpmath en précision étendue à 50 chiffres (préenregistrée 804662d5, seuils mis à l'échelle du conditionnement d'après une formule d'erreur inverse a priori) concorde sur une nouvelle date de campagne (2026-03-18) et sur le scénario d'origine du 2024-01-01 ; nouvelle ligne VALIDATED sous P2. Elle tranche le désaccord antérieur en double précision : les sigmas du datum du moteur sont erronés jusqu'à { "9.7e-6" }, les voies inverse et propres de NumPy jusqu'à { "6.2e-6" }, et ses voies Cholesky et QR d'environ { "1e-8" }. Le moteur est dans sa borne d'erreur mais environ mille fois moins précis qu'une voie par factorisation.

# text
seg-b055435a2138 = Environnement de la référence indépendante : mpmath { "1.3.0" } ajouté.

# text
seg-d0c2b2a8e635 = Révisions : aucune. Aucun fichier de référence figée (golden) ni chiffre publié ne change ; la ligne « Datum du référentiel lunaire à partir d'une campagne d'observation » reste MODELLED (décision du fondateur 2026-10-02, option A : elle n'emprunte pas le statut de la ligne distincte) ; le texte de ses tests cite le nouveau test et son constat.

# text
seg-50b53908fb7c = Partie { "2" }, solveur de datum en information de racine carrée :

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Nouveau solveur facultatif en information de racine carrée (<c1/> ; <c2/> dans le scénario lunar-frame-campaign) : QR de Householder, marginalisation par le facteur triangulaire, une SVD de Jacobi pour le spectre, et produits compensés à partir des seules opérations correctement arrondies. Face à la référence indépendante à 50 chiffres (préenregistrée b41908c9), ses sigmas du datum concordent à { "3e-13" } près sur une nouvelle date (2026-06-09) ; sur les entrées du 2026-03-18 et du 2024-01-01, le solveur par défaut est erroné jusqu'à { "1e-5" }. Nouvelle ligne VALIDATED sous P2. Le solveur par défaut et sa sortie sont inchangés. Les seuils préenregistrés n'établissent des erreurs qu'au-dessus d'environ { "2e-7" } en relatif : ils rejettent le solveur par défaut mais pas un signe de Householder inversé, un produit scalaire non compensé ou un inverse final spectral, et la ligne le dit.

# text
# c1: fim::crlb_srif
# c2: batch_ls::gauss_newton_srif
# c3: orbit_determination::determine_orbit_batch_srif
# c4: lunar_combination::formal_covariance_srif
# c5: precise_od::fit_srif
# c6: cislunar_srif::srif_cross_validation_sqrt
# c7: linalg_sr::weighted_lstsq
# c8: covariance_from_sqrt_information
# c9: precise_od::fit
seg-de9aeb2adde0 = Chemins facultatifs en racine carrée à côté des valeurs par défaut inchangées : <c1/>, <c2/>, <c3/>, <c4/>, <c5/> et <c6/>, sur les nouveaux <c7/> et <c8/>. Chacun concorde avec son défaut là où les deux sont précis (un contrôle interne, pas de ligne ; aucune validation n'est revendiquée pour eux). <c9/> délègue désormais à une routine partagée ; sa sortie et la sortie par défaut de chaque scénario sont inchangées.

# text
seg-87a632404f32 = Décisions de rang de la campagne de référentiel lunaire : un contrôle préenregistré en précision étendue sur { "40" } jours confirme chaque décision décidable de bloc de stations et de Helmert de rang plein. La borne a priori ne peut pas établir les { "20" } jours de Helmert à rang déficient ; en arithmétique exacte, leur défaut est géométrique, avec le seuil de { "1e-9" } à l'intérieur de la plage naturelle de la campagne pour les rapports de valeurs propres. Aucune ligne.

# text
seg-3b24e7fa36bf = L'affirmation de la ligne de la campagne en précision étendue est restreinte à « dans la borne du pire cas », et son contrôle de direction la plus faible à stations fixes mesure désormais un vrai angle ({ "6.6e-16" } rad ; le comparateur est passé d'acos à une corde, le seuil non).

# text
seg-4fad02ab4b6d = Révisions : aucune. Aucun fichier de référence figée (golden) ni chiffre publié ne change ; la ligne « Datum du référentiel lunaire à partir d'une campagne d'observation » est inchangée et reste MODELLED (décision du fondateur 2026-10-02, option A).

# text
seg-627d3357d620 = D4, colonne vertébrale des éphémérides par noyaux JPL, phase { "1" } (quatre nouvelles lignes VALIDATED : { "228" } -> { "232" } lignes, { "112" } -> { "116" } validées).

# text
seg-30e8a645191f = Le lecteur de noyaux NAIF a sa propre ligne.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (conteneur DAF, SPK de type { "2" }, PCK binaire de type { "2" }) concorde avec le SPICE Toolkit (CSPICE N0067 via spiceypy { "8.2.0" }) et avec ANISE { "0.10.6" } sur les { "600" } états DE440 et les { "200" } rotations d'orientation lunaire d'une grille aléatoire tirée du propre hachage du commit de préenregistrement (abcd9133), dans des seuils dérivés au préalable de l'évaluation de Tchebychev en double précision (pire cas { "0.6" } % du seuil, { "1.95e-3" } m). La ligne affirme que le moteur lit correctement les noyaux JPL, et non que DE440 ou la série analytique est exacte (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b> : positions DE440 (ou de tout SPK de type 2) par le lecteur propre au moteur, avec des époques TDB en deux parties et le SHA-256 du noyau conservé pour les rapports ; il ne substitue jamais un barycentre de système à une planète. <c2/> permet à un chemin de géométrie de choisir la série analytique (par défaut) ou un noyau.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Lune par noyau facultative pour <c1/> et <c2/></b> : une clé <c3/> lit le centre géocentrique de la Lune dans le noyau ; rien d'autre ne change, et le rapport gagne un bloc <c4/> nommant le noyau et son SHA-256. Sans la clé, les deux rapports sont identiques à l'octet près à ceux d'avant.

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Covariance d'un point de la surface lunaire sur le chemin par noyau</b> (nouvelle ligne VALIDATED) : avec toutes les stations fixées et la balise sur la Lune DE440, la covariance de la balise concorde avec une jacobienne de temps de parcours de la lumière de SPICE (pire cas { "1.7e-3" } face à un seuil de { "1" } %) et un inverse NumPy ({ "4e-14" } face à { "1e-9" }), préenregistré 4a51256 (<c1/>). La ligne du chemin analytique reste MODELLED : sur la Lune analytique, son plus petit sigma de balise est inférieur de { "3.9" } % à la référence indépendante.

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Datum du référentiel lunaire à partir d'une vraie campagne, centre de la Lune par noyau</b> (nouvelle ligne VALIDATED) : sur { "447" } points normaux inédits de 2019-Q2, préenregistrés 830d945a avant qu'aucun soit récupéré, la covariance du datum sur le chemin par noyau concorde avec la référence indépendante SPICE et NumPy inchangée à { "7.6e-5" } face à des seuils de { "1" } % et { "2" } % (<c1/>). Le fondateur a décidé que cette ligne n'est promue que sur des points inédits ; le diagnostic sur données déjà vues (c51f8b2) est un constat, pas une preuve. Le seuil ne discrimine pas les modèles de Lune : la Lune analytique le franchit aussi sur la même tranche (pire cas { "3.8e-3" }), la mutation prévue (la Lune par noyau en retard d'une heure) n'a pas été détectée, et au repli, un centre de la Lune erroné d'environ { "4,650" } km (la Lune prise autour du barycentre Terre-Lune) l'a aussi franchi. La ligne affirme la covariance sur ce chemin, et non le centre de la Lune, et le dit.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Positions du Soleil, de la Lune, de Mercure et de Vénus d'après DE440 à des époques UTC</b> (nouvelle ligne VALIDATED) : <c1/> concorde avec Skyfield { "1.54" } sur { "600" } positions entre { "1973" } et { "2026" }, pire cas { "2.96" } m, dans un seuil préenregistré (0bfafe6d) fixé par la série à deux termes TDB − TT (<c2/>). Les positions des planètes reçoivent maintenant cette nouvelle ligne par noyau ; la ligne de Standish et la ligne des lunes planétaires sont inchangées, et les lunes attendent un scénario qui en a besoin (décision du fondateur).

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Constats : le seul écart de la comparaison du datum LLR (sigma de la translation en z de { "1.025" } % contre { "1" } %) tombe à { "0.049" } % lorsque seul le centre de la Lune est lu dans DE440, sur des données déjà vues (<c1/>) ; sur la tranche inédite de { "2019" }, la Lune analytique la franchit aussi, de sorte que l'écart de { "2015" } était marginal par rapport à la géométrie de ce trimestre. Les lignes analytiques « Datum du référentiel lunaire à partir d'une campagne d'observation RÉELLE » et « Covariance des coordonnées d'un point de la surface lunaire … distincte de celle d'une station terrestre » restent MODELLED ; leurs textes de référence indépendante renvoient désormais aux lignes du chemin par noyau.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> ne dit plus que le moteur n'a pas de lecteur de noyaux binaires ; il renvoie à la ligne du lecteur et explique pourquoi les noyaux de véhicules spatiaux (types { "13" } et { "21" }) passent encore par Horizons.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Révisions : aucune. Aucun fichier de référence figée (golden), chiffre publié ni valeur de test existante ne change ; les rapports analytiques <c1/>, <c2/> et <c3/> à toutes stations fixées sont identiques à l'octet près à ceux d'avant (préfixes SHA-256 des résultats 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, bibliothèque d'horloges mesurées « Clock Atlas » (trois nouvelles lignes, dont une VALIDATED : { "232" } -> { "235" } lignes, { "116" } -> { "117" } validées).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Bibliothèque d'horloges mesurées (<c1/>).</b> Fiches d'appareils (bruit blanc de phase, bruits blanc, de scintillation et de marche aléatoire de modulation de fréquence, une dérive de fréquence linéaire et, facultativement, des termes de phase de une à quatre fois par révolution) ajustées sur un enregistrement d'horloge mesuré nommé et évaluées sur des données mises de côté ; variances d'Allan et d'Hadamard tenant compte des trous ; un détecteur de conditionnement qui consigne chaque trou, valeur aberrante de phase, saut de phase, rafale et saut de fréquence et ne connaît rien des limites de fichier ou de jour ; conversion d'une fiche en modèle de bruit de synchronisation de créneau, en modèle d'horloge de Kalman étendu et en niveaux de bruit du moniteur de leurrage. Lecteurs pour les fichiers d'horloge RINEX et IGS, les fichiers par laboratoire du BIPM et la section { "1" } de la Circular T (<c2/>) ; un surbornage de vieillissement hiérarchique et cumulé pour UTC(k) (<c3/>, pas encore évalué).

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Identification du bruit par autocorrélation de retard 1</b> (<c1/>, Riley et Greenhall { "2004" }), nouvelle ligne VALIDATED (Bibliothèque) : concorde avec <c2/> d'allantools { "2024.6" } sur { "140" } cas, entiers identiques, pire écart { "9.6e-13" } face à un seuil de { "1e-9" } (préenregistré 2ec76864 ; <c3/>).

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Fiches d'appareils mesurées avec prédiction sur données mises de côté</b>, nouvelle ligne MODELLED (un constat) : ajustement sur un tiers, prédiction de l'écart-type d'Allan des deux autres tiers à un facteur { "1.5" } près (préenregistré 2ec76864). GPS Block IIF sur une nouvelle fenêtre IGS (du 2026-03-01 au { "14" }) : { "10" } sur { "11" } ; G27 est optimiste à l'échelle de deux heures (pire facteur { "1.510" }). Césium (dedans, { "1.070" }), OCXO (dehors, { "2.348" }) et strontium (dedans) sont rapportés, non en aveugle. La fiche du récepteur JammerTest et celles du maser Galileo et de la Deep Space Atomic Clock sont bloquées. Une classe de modèles de TCXO de récepteur ZED-F9P sur { "12" } stations statiques de Wroclaw (Zenodo { "6488497" }) échoue : { "1" } station sur { "11" } en aveugle dans une réexécution corrigée divulguée (<c1/>, <c2/>).

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>Fiches GPS Block IIF avec termes par révolution</b>, nouvelle ligne MODELLED (un constat) : sur une seconde nouvelle fenêtre (du 2026-04-01 au { "14" }), { "9" } sur { "11" } dans le seuil ; G03 ({ "1.947" }) et G25 ({ "1.581" }) sont optimistes parce que leurs enregistrements mis de côté sont plus bruités que leurs tiers d'ajustement ; retirer les termes périodiques échoue pour les { "11" } (préenregistré fb475550 ; <c1/>).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, estimation de l'état d'horloge embarquée, tour { "3" }</b> (un constat, reste MODELLED) : après le détecteur de conditionnement figé, le filtre étendu du tour 2, le réglage et les critères inchangés satisfont (a) et (c) sur les { "11" } satellites pour la première fois ; (b) échoue sur G09 ({ "0.894" }) et G26 ({ "0.876" }) (préenregistré fb475550 ; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, détection du leurrage, tours { "3" } à 4b</b> (reste MODELLED) : tour { "3" } bloqué ({ "167" } époques d'apprentissage issues des autres sessions de l'unité JammerTest contre { "3600" }) ; avec une fiche de classe de modèle ZED-F9P (tours { "4" } et 4b), le moniteur d'horloge ne lève aucune fausse alarme avant le début aux { "10" } débuts consignés (tour { "2" } : { "86" }) et { "6" } débuts sur { "10" } sont détectés dans les { "10" } s (tour { "2" } : { "4" }) ; les quatre mêmes restent tardifs (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, surbornage UTC(k), tour { "3" }</b> : préenregistré de façon prospective (fb475550) sur les numéros de la Circular T à partir de { "465" }, pas encore exécuté (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Environnement de la référence indépendante : l'enregistrement ZED-F9P de Wroclaw est conditionné par les données sous <c1/> (CC BY { "4.0" }, environ { "1.5" } Go) ; les jeux de test d'horloges IGS sont intégrés (produits IGS, avec attribution).

# text
seg-b05fa0811a3e = Révisions : aucune. Aucun fichier de référence figée (golden), chiffre publié ni valeur de test existante ne change ; M001 (réancrage du holdover) n'est pas traité parce qu'aucune classe d'horloge n'a été promue.

# text
seg-986f4075210b = D8, un chemin validé de propagation, de référentiel et de temps (trois nouvelles lignes VALIDATED et M131 promue : { "235" } -> { "238" } lignes, validées { "117" } -> { "121" }).

# text
seg-d7a612528765 = Les types de scénario d'orbite terrestre qui portaient leurs propres modèles à deux corps, à J2 séculaire ou à temps sidéral seul partagent désormais un seul chemin : des jeux d'éléments SGP4/SDP4 avec des dates juliennes en deux parties, portés jusqu'au GCRS et à l'ITRS (International Terrestrial Reference System) par la chaîne IAU (Union astronomique internationale) 2006/2000A, avec des paramètres d'orientation de la Terre facultatifs.

# text
# c1: sgp4::MeanElementSet
# c2: sgp4::SgpOrbit
# c3: sgp4::Eop
# c4: sgp4::teme_to_itrs_matrix[_eop]
# c5: sgp4::gcrs_to_itrs_matrix[_eop]
# c6: Sgp4::new_at
# c7: Sgp4::propagate_at
# c8: jd2::Jd2::from_utc_calendar
# c9: dtf2d
# c10: jd2::utc_to_tai
# c11: tai_to_utc
# c12: utc_to_ut1
# c13: utcut1
# c14: tai_to_tt
# c15: jd2::earth_rotation_angle
seg-016507ccdb8f = Nouveaux <c1/>, <c2/>, <c3/>, <c4/> et <c5/> ; <c6/> et <c7/> prennent des époques en deux parties. Nouveaux <c8/> (convention <c9/> de SOFA pour les jours à seconde intercalaire), <c10/>, <c11/>, <c12/> (via TAI, comme <c13/> de SOFA), <c14/> et un <c15/> en deux parties.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = Le mode polaire de <c1/> propage par SGP4 au 2026-01-01T00:{ "00" }:{ "00" } UTC sur la chaîne IAU (<c2/> accepte toute époque) ; le générateur Walker SGP4 passe au référentiel terrestre par la chaîne IAU.

# text
# c1: passes
# c2: passes::predict_passes_apparent
# c3: apparent_look_angles
# c4: refraction
# c5: light_time
# c6: ut1_minus_utc_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: passes::predict_passes
seg-86ecad91a601 = Le type de scénario <c1/> exécute un nouveau prédicteur de passages apparents (<c2/>, <c3/>) : SGP4 sur la chaîne IAU, réfraction ITU-R P.834-9 et temps de parcours de la lumière en liaison descendante (nouveaux commutateurs <c4/> et <c5/>, activés par défaut), paramètres d'orientation de la Terre (<c6/>, <c7/>, <c8/>, par défaut { "0" }), franchissements résolus à { "1e-7" } s et culmination par recherche par section dorée. Le <c9/> géométrique est inchangé.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> empêche les noyaux de géométrie, de temps et de propagation du paquet de porter une propagation képlérienne privée, des taux de J2 séculaires ou une rotation à temps sidéral seul ; les niveaux rapides nommés et la physique qui fait l'objet d'une ligne sont des tolérances motivées.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Nouvelle ligne VALIDATED « Dates juliennes en deux parties et secondes intercalaires sur le chemin de temps des orbites terrestres » : <c1/>/<c2/>/<c3/> de pyerfa { "2.0.1.5" } sur { "224" } instants autour des { "27" } secondes intercalaires, à { "1e-6" } s près (préenregistré e947e69d) ; pire cas { "1.9e-11" } s.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Nouvelle ligne VALIDATED « Un seul chemin d'orbite terrestre » : positions TEME de { "232" } jeux d'éléments face à python-sgp4 { "2.24" } (le SGP4 de référence de Vallado) à { "6.1e-8" } m près (seuil { "1" } cm), et rotations GCRS -> ITRS et TEME -> ITRS face à <c1/>, <c2/> et <c3/> d'ERFA à { "2.9e-6" } mas et { "0.41" } mas près (seuils { "0.1" } et { "2" } mas), avec des paramètres d'orientation de la Terre (préenregistré 72ea9eb0). Divulgué : la première exécution a échoué au 2016-12-31T23:{ "59" }:{ "59.5" } d'une seconde de rotation ; UT1 avait été pris à partir de la date quasi julienne UTC un jour à seconde intercalaire, le moteur passe désormais par TAI, et la seconde exécution concorde aux mêmes seuils inchangés.

# text
seg-a72ccdc2516e = M131 « Couverture LEO et dilution de précision pour les utilisateurs polaires et arctiques face au GNSS MEO » devient VALIDATED : Orekit { "13.1.8" } prend les états GCRS du moteur, les fait tourner et calcule la visibilité et le DOP (NumPy pour les groupes multi-horloges) ; positions à { "6.8e-5" } m près (seuil { "0.2" } m), nombres de satellites en vue identiques sur 4040/4040 échantillons, DOP médian à { "2.3e-11" } près en relatif.

# text
seg-db498ac8e135 = Nouvelle ligne VALIDATED « Prédiction apparente des passages sur une station au sol avec réfraction et temps de parcours de la lumière » : Orekit { "13.1.8" } propageant les mêmes jeux d'éléments dans un TEME qu'il construit selon la définition indiquée, avec la réfraction ITU-R P.834 et son modèle de mesure du temps de parcours de la lumière, sur { "60" } cas de stations au niveau de la mer : { "1210" } passages, franchissements à { "3.4e-6" } s près (seuil { "5" } ms), élévation maximale à { "5.5e-7" } deg près, direction apparente à { "8.8e-7" } deg près (seuil { "1e-4" } deg).

# text
seg-ab87bb0ee63d = Constats, conservés figés : les premières comparaisons à affirmation complète avec Orekit de bout en bout ont manqué leurs seuils de position et de direction, non à cause du moteur mais parce que le SDP4 d'Orekit { "13.1.8" } s'écarte du SGP4 de référence pour les orbites d'espace lointain circulaires (e = { "0" }) (jusqu'à { "67" } m) et que son TEME par défaut repose sur la nutation de l'IERS { "1996" } (IAU { "1980" }), à environ { "72" } millisecondes d'arc de la chaîne IAU 2006/2000A ({ "2.7" } m en LEO). Le coefficient ITU-R P.834 d'Orekit pour h*theta0^{ "2" } est { "0.011380" } là où la Recommandation imprime { "0.01380" } ; la comparaison est au niveau de la mer, où ce terme s'annule, et l'écart au-dessus est figé.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = « Prédiction des passages sur une station au sol (segment sol) » reste VALIDATED, son affirmation étant restreinte au <c1/> géométrique ; le type de scénario <c2/> relève de la nouvelle ligne.

# text
# c1: xval/d8-orekit13/setup.sh
seg-60d6ac0011f1 = Environnement de la référence indépendante : Orekit { "13.1.8" } avec Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

# text
# c1: scenarios/passes.toml
# c2: passes
# c3: docs/examples/multi-tool-pipeline.md
# c4: passes
# c5: docs/CAPABILITY.md
# c6: polar-arctic-leo-coverage
seg-532e10ead5a2 = Révisions : <c1/> fourni, accès total { "1675" } s -> { "1659" } s (cinq passages comme avant ; meilleure élévation maximale { "73.25" } deg -> { "70.08" } deg), et chaque sortie de <c2/> bouge avec le nouveau chemin (la ligne imprimée dans <c3/> et l'entrée <c4/> de <c5/> le disent désormais) ; VDOP GNSS de <c6/> fourni à l'équateur { "1.19669" } -> { "1.19710" }, à { "89.9" } deg { "1.50645" } -> { "1.50590" }, VDOP fusionné à { "89.9" } deg { "1.14388" } -> { "1.14250" } (les chiffres publiés à deux décimales { "1.20" }, { "1.51" } et { "1.14" } sont inchangés). Aucun fichier de référence figée (golden) ne change.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Pas encore routés : <c1/>, les modes doppler, joint et timing de <c2/> et l'orbite de vérité de <c3/> (leurs modèles se trouvent dans <c4/> et <c5/>), et les conceptions terrestres dans <c6/> (un niveau rapide à deux corps nommé).

# text
seg-03f638f20376 = D6, générateur de référence LunaNet AFS, LSIS V1.0 (quatre nouvelles lignes, dont deux VALIDATED : { "238" } -> { "242" } lignes, validées { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>Générateur de référence LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), figé sur le LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 du { "29" } janvier { "2025" } et nommant cette version dans chaque sortie : la porteuse de { "2492.028" } MHz ; le canal de données BPSK({ "1" }) AFS-I à { "500" } symboles par seconde avec son code de Gold de 2046 chips ; le pilote BPSK({ "5" }) AFS-Q avec son code primaire de Weil de 10230 chips et ses codes secondaire de 4 chips et tertiaire de 1500 chips ; la trame d'identifiant { "0" } (motif de synchronisation, sous-trame { "1" } BCH ({ "51" }, { "8" }), CRC-24, sous-trames LDPC de rendement un demi { "2" } à { "4" }, entrelaceur par blocs de { "60" } par { "98" }) avec un décodeur exhaustif de sous-trame 1 et un décodeur LDPC min-sum écrit à partir de la seule matrice de contrôle de parité ; et une synthèse IQ en bande de base avec étiquettes de vérité écrite sous forme d'enregistrement SigMF. Les codes sont générés à partir des registres à décalage et des constructions de Legendre/Weil de la norme. Rien de ce qui est copié de la norme n'est redistribué (elle ne comporte aucune condition de réutilisation) : les indices primaires AFS-Q viennent de IS-GPS-800J, et ce que seules les pièces jointes de la norme définissent (retards G2 de l'AFS-I, codes tertiaires, sous-matrices LDPC) est lu à l'exécution depuis un cache local que <c2/> remplit à partir du PDF hébergé par la NASA, chaque fichier étant vérifié face à un SHA-256 figé (<c3/>). Le modèle est une référence de correspondance avec la norme, et non un modèle de canal, de propagation ou de bilan de liaison.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> et <c2/> : un enregistrement peut porter des champs d'extension à espace de noms déclarés dans <c3/>.

# text
seg-a9465820a1fc = Nouvelle ligne VALIDATED « Rendu en bande de base LunaNet AFS face à un générateur indépendant, son état de canal étant donné » : face à LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, version bande S), zéro écart de chips sur les codes des PRN { "1" } à { "210" }, zéro écart de symboles sur les trois trames de l'exécution, et une corrélation complexe normalisée de { "0.999990" } sur { "23.9" } s de ses propres échantillons (pire bloc de { "2" } ms { "0.999948" }), dans des seuils fixés avant la comparaison (préenregistré 986ac280). Elle pilote le moteur de rendu avec l'état de canal propre au simulateur et ne couvre ni la répartition de puissance à partir de la densité porteuse sur bruit, ni l'écriture SigMF et 8 bits.

# text
seg-07edced2764a = Nouvelle ligne VALIDATED « Codage de canal des trames LunaNet AFS, FID { "0" } » : les trames de 6000 symboles sont égales à celles de LANS-AFS-SIM symbole par symbole (préenregistré 986ac280) ; le code de la sous-trame 1 reproduit l'exemple traité de la figure { "8" } du LSIS et le CRC-24 la valeur de contrôle du catalogue CRC-24/LTE-A.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Les deux lignes promues sont conditionnées par les données du cache LSIS : leur test de référence indépendante est ignoré avec un avis tant que <c1/> n'a pas été exécuté.

# text
seg-89a4bc4a766e = Constat (nouvelle ligne MODELLED), « Génération des codes d'étalement LunaNet AFS » : sur { "2 937 232" } chips et bits générés comparés aux tables de la norme et aux fichiers de l'annexe { "3" }, un seul diffère, les « { "24" } derniers chips » que la table E-5 imprime pour le PRN tertiaire { "147" }, qui duplique la cellule du PRN { "151" } alors que le propre fichier de l'annexe { "3" } de la norme concorde avec le générateur. Le critère de zéro écart n'est pas atteint.

# text
seg-d4e76301323f = Constat (nouvelle ligne MODELLED), « Décodabilité en boucle fermée de LunaNet AFS » : trois exécutions préenregistrées face à PocketSDR-AFS ; la troisième a atteint ses seuils de suivi et de décodage en totalité mais pas sa garde selon laquelle une version du récepteur qui ne fait qu'imprimer reproduit le journal de la version figée, car deux exécutions du récepteur non modifié diffèrent déjà dans leurs enregistrements d'acquisition.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Corrigé : la porteuse par défaut de <c1/> (<c2/>), <c3/> et <c4/> était un { "2.4" } GHz arrondi ; c'est désormais la porteuse AFS du LSIS-020, { "2492.028" } MHz. Avec l'ancienne valeur par défaut, la perte en espace libre était sous-estimée de { "0.327" } dB.

# text
seg-ed7c170ccc2c = Révisions : aucune. Chaque scénario fourni nomme sa porteuse, et les résultats des { "138" } fichiers de scénario sont identiques à l'octet près à ceux de la branche principale précédente.

# text
seg-3ec7f5b17122 = D7, vrai IQ lunaire et LNAV GPS (sept nouvelles lignes, aucune VALIDATED : { "242" } -> { "249" } lignes, validées { "123" } inchangé).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/> : une transformée de Fourier rapide (FFT) à base mixte dont la sortie est la même, bit pour bit, sur toutes les plateformes ; un contrôle SHA-256 figé des transformées de 8000 et 24000 points passe sur x86_64 et sur wasm32-wasip1 (exécuteur dans <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/> : recherche parallèle de phase de code sur IQ échantillonné (<c2/>, <c3/>) avec repliement cohérent, accumulation non cohérente, un seuil du khi-deux pour une probabilité de fausse alarme sur toute la recherche et une statistique à moyenne par cellule pour un bruit à bande limitée ; <c4/>, <c5/> avec Doppler de code, et les estimateurs de densité porteuse sur bruit (C/N0) M2M4 et pic de grille.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/> : un encodeur du message de navigation historique (LNAV) d'IS-GPS-200 pour les sous-trames { "1" } à { "3" }, avec la parité du tableau 20-XIV et un décodeur de champs.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/> : un lecteur du ION GNSS SDR Metadata Standard (<c2/>) et de ses fichiers d'échantillons, avec <c3/> pour les niveaux en complément à deux.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/> : l'en-tête de lot IQS, la télémétrie RAW, ACQ et NAV et les fichiers CLK de LuGRE (Lunar GNSS Receiver Experiment), et un contrôle qui liste où les métadonnées <c2/> contredisent l'en-tête binaire.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> et, dans <c2/>, le référentiel du corps à pilotage en lacet, l'azimut d'émission et les angles hors nadir, et <c3/> pour le C/N0 relatif avec des diagrammes mesurés.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = Encodage du message de navigation GPS LNAV (nouvelle ligne, reste MODELLED après la vérification a posteriori de l'intégrateur) : sur le fichier de diffusion IGS du { "2" } mars { "2025" }, analysé et décodé par RTKLIB v2.4.2-p13, les { "960" } mots passent la parité, les { "96" } sous-trames se décodent et les { "608" } entiers diffusés sont égaux à ceux de Kshana (<c1/>), mais le préenregistrement (d4d9eb9d) a atteint la branche publique deux secondes après le commit contenant le résultat, de sorte que l'ordre « enregistré avant la récupération du fichier » ne peut pas être démontré et que la ligne n'est pas promue.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> remplit les mots à partir du bit de poids fort (I dans le quartet haut d'un octet LuGRE ; la lecture précédente produisait le signal conjugué), conserve l'ancienne lecture sous le nom <c2/>, et lit des échantillons plus larges qu'un mot.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/> : affinage Doppler cohérent en phase ({ "0.2" } Hz de RMS à { "30" } dB-Hz sur { "200" } ms en simulation).

# text
seg-b0f6a61acce0 = GPS L1 C/A face à gps-sdr-sim : chips et parité exacts au bit près ; { "230" } des { "1152" } champs LNAV diffèrent d'une unité parce que gps-sdr-sim tronque là où l'entier diffusé exige un arrondi.

# text
seg-1c525ca495c0 = LNAV décodé par RTKLIB : toute la parité et toutes les sous-trames passent et chaque paramètre est à moins d'un demi-quantum ; { "41" } valeurs mises à l'échelle diffèrent de quelques unités sur le dernier chiffre à cause de la constante décimale { "2" }^-43 de RTKLIB, au-dessus du seuil enregistré.

# text
seg-14e26e69777b = Acquisition LuGRE face à GNSS-SDR { "0.0.19" } : { "266" } décisions sur { "266" } concordent, { "250" } situées sur la même cellule ; la plupart des positifs sont des artefacts d'une moyenne de −{ "0.5" } dans les niveaux bruts sur 4 bits ; la branche du C/N0 n'avait pas de données de vol contemporaines. Deux lots (OP5, OP12) ont été exclus à tort : leurs métadonnées concordent avec leurs en-têtes, mais le lecteur ne pouvait alors pas lire un échantillon plus large qu'un mot.

# text
seg-3a32ff9d66fc = Acquisition LuGRE face au Doppler prédit par l'orbite : avec la décision sur la puissance des échantillons, chaque recherche franchit le seuil sur du bruit à bande limitée ; avec la décision à moyenne par cellule, les paires les plus fortes concordent en grandeur avec le signe inversé, ce qui montre que l'ordre I/Q enregistré est le conjugué de celui des données.

# text
seg-2bb618ba4059 = Acquisition à l'aveugle sur les lots de surface lunaire : quatre lots acquièrent chacun un satellite (prédit visible, aucune fausse alarme à { "1e-7" }), aucun deux, de sorte que le seuil sur la différence de Doppler n'a aucune paire à évaluer.

# text
seg-f95606e17fd1 = C/N0 relatif à distance lunaire (M039 reformulée) : { "15" } enregistrements de Block IIR/IIR-M et une paire, trop peu pour le seuil enregistré.

# text
seg-9306cf44fc44 = Révisions : aucune ; aucun chiffre publié, fichier de référence figée (golden) ni figure de la documentation n'a changé.

# text
seg-2a3cb68c94d6 = La ligne M039 « GNSS terrestre à distance lunaire » reformule son affirmation à distance lunaire comme le C/N0 relatif entre satellites à une même époque plus la visibilité (le C/N0 absolu n'est pas revendiqué) ; elle reste MODELLED. Le NOTICE de premier niveau porte l'attribution CC BY { "4.0" } de LuGRE.

# text
seg-e1e4094a186a = L'orientation lunaire des axes principaux DE440 est désormais interpolée le long de la géodésique entre nœuds quotidiens. L'ancienne interpolation élément par élément était erronée jusqu'à { "2.0e-4" } rad ({ "340" } m à la surface lunaire) près des quarts de chaque jour, et non « environ { "14" } m » comme l'indiquait la ligne. Ses utilisateurs (géométrie de télémétrie laser lunaire, datum lunaire, observabilité des failles lunaires) obtiennent l'orientation corrigée.

# text
# c1: snapshot_raim
seg-a2071d345923 = Corrections moteur du tour { "2" }, chacune réexécutée face à sa tolérance préenregistrée inchangée : le millésime IERS d'une ligne EOP est lu dans ses indicateurs I/P plutôt que dans un bloc Bulletin B vide ; <c1/> utilise le plan local géodésique ; le couplage taux-référentiel lunaire utilise le rayon équatorial, J2 et la rotation ; l'ajustement liu22 démarre à zéro correction sans a priori et utilise le taux de mouvement moyen de l'article ; l'espacement des nœuds EO porte la régression nodale J2 ; le temps de glissement de cycle de Costas utilise rho/4 ; la position conjointe applique le délai de groupe diffusé de la paire ; la résolution conjointe lunaire utilise un pas QR ; la borne NTN est évaluée à la vraie position ; l'horloge de référence de la conception de constellation est la plus petite constellation en vue ; la série d'orientation DE440 couvre 2014-2030 et signale une erreur en dehors au lieu de borner.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, une orbite de vérité construite à partir d'états tabulés dans le référentiel terrestre, utilisée par la comparaison d'ajusteur sur orbite réelle.

# text
# c1: NOTICE.md
seg-7293b717d978 = Les fichiers de test et jeux de test des comparaisons ci-dessus, chacun avec son générateur et un <c1/> indiquant la source, la licence, la date de récupération et le SHA-256.

# text
# c1: araim_reference::add_v42_protection_levels
# c2: _ecef
# c3: raim::snapshot_raim_fde
# c4: cw_dynamics::second_order_correction
# c5: propagate_second_order
# c6: inertial::coast::ErrorDynamics
# c7: lunar_vlbi::KernelGeometry
# c8: lunar-vlbi
# c9: naif_kernel
# c10: lunar_llr_geometry::llr_bcrs_one_way_m
# c11: solar_system::link_on
# c12: launch::site_rotation_speed_at
# c13: eo_payload::j2_nodal_period
# c14: ground_track_spacing_equator_j2
# c15: batch_ls::gauss_newton_qr
# c16: precise_products
seg-920fe965bda9 = Tour { "2" } : <c1/> et <c2/> (détection de défaut ADD v4.2, d'après Stanford MAAST pour l'ARAIM { "2" }, mention BSD-3 dans la source) ; <c3/> ; <c4/> et <c5/> ; le modèle d'erreur INS à neuf états <c6/> ; dérivées partielles de <c7/> et entrées <c8/> du chemin par noyau ; <c9/>, un lecteur de noyaux SPK de type { "2" } et PCK binaires ; <c10/> avec stations ITRF2020 ; densité de Jacchia { "1971" } ; <c11/> sur tout fournisseur d'éphémérides ; <c12/> ; <c13/> et <c14/> ; <c15/> ; <c16/> (lecteurs RINEX clock, ANTEX et DCB).

# text
seg-e3336e670d51 = Une version corrective sur { "0.29.2" }. Kshana Studio est reconstruit autour de deux vues : une vue Simple qui donne d'abord la réponse et l'explique en termes courants, et une vue Avancée avec le tableau de bord complet. Deux petites corrections sur kshana.dev l'accompagnent. Le moteur ne change pas : chaque scénario fourni donne un résultat identique octet pour octet à { "0.29.2" }, à la marque de version près.

# text
seg-c40ab967ace6 = <b>Kshana Studio a une vue Simple.</b> C'est celle sur laquelle le Studio s'ouvre.

# text
seg-6a5ae001d00e = La réponse vient d'abord : un scénario s'ouvre sur son résultat, énoncé en une phrase simple. Chaque scénario fourni a sa propre phrase, écrite pour ce que ce scénario mesure.

# text
seg-375421534e4c = Cinq réglages au plus sont affichés, ceux qui changent le plus la réponse. Les autres sont sous « Réglages avancés », repliés jusqu'à ce que vous les ouvriez.

# text
seg-d8650ae64549 = « Comment c'est calculé » explique la méthode en quelques lignes, et « Pour les chercheurs » donne les chiffres propres au moteur, le fichier du scénario et les preuves derrière le résultat.

# text
seg-36af7640e6ad = <b>Le tableau de bord complet est la vue Avancée.</b> Chaque panneau, graphique, export et rapport du Studio précédent s'y trouve.

# text
# c1: view=advanced
seg-0428d0a7921b = <b>Un commutateur passe d'une vue à l'autre et garde votre position.</b> Le scénario, la vue où vous étiez et les réglages que vous avez modifiés sont conservés. Le Studio se souvient de la dernière vue utilisée. Les liens du site et de la documentation ouvrent la vue Simple ; un lien avec <c1/> ouvre la vue Avancée, et chaque lien Studio antérieur ouvre toujours le même scénario et la même vue.

# text
seg-2c98ed084c10 = <b>Une première vue plus rapide sur les connexions lentes.</b> La réponse enregistrée d'un scénario est affichée avant le chargement du reste du Studio ; sur une connexion mobile lente, la réponse apparaît en environ deux secondes au lieu d'environ neuf.

# text
seg-2214d2dcfab4 = <b>Une meilleure recherche.</b> Une recherche liste désormais en premier les scénarios dont le domaine ou le titre correspond aux mots, avant les scénarios qui ne les mentionnent que dans le nom du fichier ou dans le texte.

# text
seg-aa8d43280c19 = <b>Le globe de la page d'accueil ne devient plus vide quand la réduction des animations est activée.</b> Lorsque le réglage système de réduction des animations était activé, le redimensionnement de la fenêtre pouvait laisser le globe principal vide jusqu'au défilement de la page. Le globe se redessine maintenant dans la même image que le redimensionnement.

# text
seg-da4b78816df1 = <b>La console en bande L de la page d'accueil explique sa bande vide.</b> Dans « Watch a jammer take the band », le panneau GPS L5 / Galileo E5a restait sombre pendant toute la minute, ce qui pouvait passer pour une panne. Aucun brouilleur n'émet dans cette bande dans ce scénario, et les signaux des satellites sont sous le plancher de bruit : rien n'y dépasse donc ce plancher. Une étiquette discrète l'indique maintenant dans tout tronçon de panneau où rien n'est au-dessus du plancher (le panneau L5 / E5a, et le panneau L2C avant le démarrage de son brouilleur de bruit), avec le C/N0 et l'état d'accrochage de chaque bande issus de la même exécution. Elle n'est placée que là où rien n'est au-dessus du plancher, si bien qu'elle ne recouvre jamais l'énergie d'un brouilleur.

# text
seg-e353fdee7033 = Une version corrective sur { "0.29.1" }. Elle supprime du code dupliqué dans les modules de message de navigation, de fusion et de spectre LEO, ajoute un thème clair à kshana.dev, déplace Kshana Studio à sa propre adresse, rend le site lisible par les moteurs de recherche et les assistants d'IA, corrige plusieurs petits défauts dans le Studio, et permet aux publications npm de se faire sans jeton stocké. Aucune sortie du moteur ne change : chaque scénario fourni donne un résultat identique octet pour octet à { "0.29.1" }, à la marque de version près.

# text
seg-e8bf0a4fdc35 = <b>Un thème clair pour kshana.dev.</b> Chaque page peut être lue en clair ou en sombre. Le site suit le réglage système du lecteur et propose un commutateur pour le changer.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: llms.txt
# c4: llms-full.txt
seg-8e7cabc14c40 = <b>Les moteurs de recherche et les assistants d'IA peuvent lire le site.</b> Chaque page a maintenant son propre titre, sa description, son adresse canonique, ses balises de carte sociale et des données structurées schema.org, ainsi qu'un texte brut pour les sections qu'un script dessine. Le site publie <c1/>, un <c2/> avec la date du dernier changement de chaque page, <c3/> et <c4/> (un guide en texte brut, court et complet, pour les assistants d'IA), et une clé IndexNow pour qu'un déploiement puisse indiquer aux moteurs de recherche ce qui a changé.

# text
# c1: NPM_TOKEN
# c2: docs/RELEASING.md
seg-804ba71be9ed = <b>Les publications npm peuvent se faire sans jeton stocké.</b> La tâche npm exécute maintenant Node { "24" } et npm { "11.5.1" } ou plus récent, qui prennent en charge la publication de confiance npm : npm échange l'identité GitHub de la tâche de publication contre un identifiant de courte durée. Le secret <c1/> fonctionne toujours et est utilisé tant qu'il est défini ; rien ne change donc tant que la publication de confiance n'est pas activée pour le paquet sur npmjs.com. <c2/> énumère les étapes.

# text
seg-81405e5a5e06 = <b>Le titre de la page d'accueil est lisible sur le globe.</b> Un voile doux se place maintenant derrière le titre et son texte, estompant les lignes d'orbite et les points de satellites du globe animé là où ils le croisent.

# text
# c1: /playground/
seg-24b8363acc14 = <b>Kshana Studio a sa propre adresse : <a1>https://kshana.dev/studio/</a1>.</b> Chaque lien du site et de la documentation y mène. L'ancienne adresse, <c1/>, fonctionne toujours et redirige vers la nouvelle en conservant le scénario, la vue et les autres réglages du lien.

# text
seg-12f223b986bd = <b>Corrections du Studio.</b> Le fichier du moteur est téléchargé une fois au lieu de deux. Pendant son téléchargement, le Studio affiche aussitôt le résultat enregistré du scénario, indiqué comme enregistré, au lieu d'un écran vide. Sur un téléphone, l'en-tête tient sur une seule rangée compacte. Les chiffres clés passent à la ligne deux par deux, de sorte qu'aucun n'est caché hors de l'écran. Les libellés de champs utilisent les mots propres du scénario, avec le nom du champ à côté, et la recherche trouve les champs par l'un ou l'autre.

# text
# c1: downsample_grid
# c2: navsignal::simpson
# c3: leo_link::geometry
# c4: leo_fusion::geom
# c5: scenarios/
seg-c130d8a4dc5e = <b>Moins de code dupliqué.</b> Le tableau des unités du message de navigation LEO écrivait les mêmes dix lignes de statistiques SISRE pour quatre synthèses d'ajustement. Une macro les écrit maintenant une seule fois. Les deux graphiques en cascade du spectre partagent un même axe du temps, une même barre de couleur et un même panneau de barre C/N0. Le sous-échantillonnage de la grille principale réutilise <c1/>, et l'intégrale de Simpson réutilise <c2/>. Les deux points d'entrée du type de scénario de passage LEO partagent une même étape de préparation. <c3/> importe les fonctions d'aide vectorielles de <c4/> au lieu de les copier. Le rapport avancé importe l'échappement HTML du rapport de l'API au lieu de le copier. Chacun des { "139" } fichiers de scénario de <c5/> a été exécuté sur { "0.29.1" } et sur ce code, et chaque fichier de sortie est identique octet pour octet.

# text
# c1: src/leo_navmsg/units.rs
# c2: src/leo_fusion/pvt_units.rs
# c3: PVT_UNITS
# c4: sonar-project.properties
# c5: tests/sonar_cpd_exclusions_are_justified.rs
seg-166b0435c96f = <b>Les tableaux d'unités de leo-navmsg et de leo-pvt ont leurs propres fichiers.</b> Ils sont sortis de modules qui contiennent aussi de la logique, vers <c1/> et <c2/>. <c3/> garde son chemin public. Seuls ces deux fichiers de tableaux rejoignent les exemptions de détection de copier-coller pour les catalogues déclaratifs dans <c4/>, que <c5/> vérifie.

# text
# c1: event=push
seg-f8b372e08ef9 = <b>Le badge CI du README montre le résultat des pushes sur main.</b> Le badge comptait les exécutions de tous les événements sur main, si bien qu'il pouvait afficher « failing » alors que chaque exécution de push était verte ; il ne demande maintenant que les exécutions de push (<c1/>).

# text
seg-7c41a482c7d8 = Une version corrective sur { "0.29.0" } : le chiffre de couverture mesuré, la ligne du nom du projet sur kshana.dev, une tâche de couverture plus rapide et un README remis à jour. Aucune sortie du moteur ne change : chaque scénario donne le même résultat que sur { "0.29.0" }.

# text
seg-997490bd1696 = Révisions de chiffres publiés

# text
# c1: db796dd
# c2: 95.35 %
# c3: src/
# c4: b1d350d
# c5: tests/coverage_figure_doc_sync.rs
# c6: docs/COVERAGE.md
seg-ed4b071e4bd9 = <b>Couverture de lignes : ~{ "96" } % → ~{ "95" } %.</b> La tâche de couverture a mesuré à nouveau le code publié { "0.29.0" } (commit <c1/>, exécution CI { "36809850252" }, 2026-10-01) : <c2/>, { "55,970" } lignes sur { "58,697" } dans <c3/>. Le chiffre publié était { "95.63" } % ({ "37,697" } lignes sur { "39,419" }), mesuré sur <c4/> avant { "0.28.0" } ; il s'arrondissait à ~{ "96" } %. Le nouveau chiffre s'arrondit à ~{ "95" } %, de sorte que chaque surface que <c5/> épingle bouge ensemble : <c6/>, le badge du README, la ligne Evidence et le tableau CI, les badges crates.io, PyPI et npm, le rapport technique et la page de couverture de kshana.dev. Le plancher de { "85" } % est inchangé.

# text
# c1: web/fonts/
# c2: web/fonts/FONTS.json
# c3: web/tools/fetch_third_party.py
# c4: text=
seg-577baa03af04 = <b>La ligne du nom sur kshana.dev.</b> « Kshana · क्षण · the precise instant » ouvre maintenant le bandeau d'accueil et figure sous la marque dans le pied de page de chaque page. kshana.dev ne fait toujours aucune requête vers un autre hôte : le devanagari est un sous-ensemble auto-hébergé de Noto Sans Devanagari pour les trois lettres de क्षण ({ "1,692" } octets, <c1/>, avec le texte de sa licence SIL Open Font License et son SHA-256 dans <c2/>). <c3/> a appris à enregistrer un sous-ensemble Google Fonts <c4/> sous un nom de fichier adressé par son contenu.

# text
# c1: /evidence#research
# c2: /docs/changelog
# c3: /
# c4: .html
# c5: ROADMAP.md
seg-35b5bc4ee466 = <b>Les liens du site arrivent là où ils pointent, à des adresses propres.</b> Un lien vers une section place maintenant cette section juste sous l'en-tête, sur un téléphone comme sur un ordinateur : un lien vers un secteur de Missions ouvre ce secteur avec son panneau en haut ; les liens de Capabilities et d'Editions gardent leur place pendant que les graphiques au-dessus se dessinent ; Editions n'ajoute plus un second décalage d'en-tête ; et un lien vers une partie repliée d'une page de documentation l'ouvre. Chaque page est liée par son adresse propre (<c1/>, <c2/>, <c3/> pour l'accueil), et les liens canoniques, le plan du site et les redirections des anciennes adresses nomment les mêmes ; les adresses <c4/> fonctionnent toujours. Research a son propre lien dans l'en-tête, entre Evidence et Developers, et dans le pied de page. La documentation ne montre plus la feuille de route (<c5/> reste dans le dépôt) : le groupe Project est Changelog, Licensing, Security, Contributing, Governance et Code of conduct, et le Glossary est passé dans Get started.

# text
seg-3da9f00f5ce6 = <b>La tâche de couverture est plus rapide.</b> Sur { "0.29.0" }, elle a pris { "143" } minutes contre des { "91" } normales, à

# text
# c1: tests/property.rs
# c2: determinism
# c3: advanced_report
# c4: animation
# c5: tests/support/corpus.rs
# c6: determinism
# c7: KSHANA_CORPUS_THREADS=1
seg-85d502773367 = Le fuzzer <c1/>, la cause la dernière fois, en a pris { "4" }. Le corpus fourni est passé de { "74" } à { "139" } scénarios, et trois binaires de test le parcouraient en entier, un fichier à la fois (<c2/> deux fois, <c3/> et <c4/> une fois) : { "37" } minutes ensemble sous instrumentation de couverture, contre { "3" } sur { "0.27.2" }. Ils partagent maintenant <c5/>, qui exécute le travail de chaque scénario sur tous les cœurs et rend les résultats dans l'ordre trié ; chaque scénario et chaque assertion subsistent. Sur un portable arm64, en build de débogage : <c6/> prend { "143" } s sur { "14" } cœurs contre { "612" } s avec <c7/> (l'ancien parcours en série).

# text
# c1: tools/capture_site_shots.mjs
# c2: tools/readme_shots.py
# c3: docs/assets/readme/site/SHOTS.json
seg-bb69dbadbc81 = <b>Le README, remis à jour.</b> Il s'ouvre sur la même ligne de nom que le site ; les captures d'écran du Studio sont refaites à partir du Studio { "0.29.1" }, avec une nouvelle du Studio sur un téléphone et de sa barre d'étapes du bas ; une nouvelle bande « The site » montre trois pages de kshana.dev issues du build { "0.29.1" } (<c1/>, composées par <c2/> et consignées dans <c3/>) ; le chiffre de couverture indique ~{ "95" } % ; et le texte alternatif de la figure de recherche, qui répétait celui de la figure d'architecture, décrit maintenant les articles. Les badges de l'en-tête sont plus petits et plus courts ({ "18" } px de haut ; « ~{ "95" }% », « 83/223 », « quality », « AGPL-3.0 », « zenodo.20528627 »), si bien que les onze tiennent sur deux lignes ; chaque lien et chaque texte alternatif gardent tout leur sens.

# text
# c1: kshana-mcp
seg-f61ef3e16884 = <b>La tâche de l'image de conteneur dispose de { "90" } minutes.</b> À { "v0.29.0" }, la construction linux/arm64 émulée de l'image <c1/> a atteint l'ancienne limite de 45 minutes pendant la compilation de son dernier crate, si bien que l'image, l'entrée du registre MCP et la vérification du canal n'ont pas été publiées. La limite est maintenant de { "90" } minutes ; l'image est inchangée.

# text
# c1: src/ephem.rs
# c2: src/sgp4.rs
# c3: 0.323_273_64
# c4: 0.323_273_640
# c5: _64
# c6: _32
# c7: f64
# c8: f32
seg-1688bf9f0fec = <b>Huit littéraux flottants regroupés autrement</b> dans <c1/> et <c2/> (<c3/> → <c4/>) : SonarQube Cloud lisait un dernier groupe de <c5/> ou <c6/> comme un suffixe <c7/> ou <c8/> manquant (règle S7454). Les valeurs sont les mêmes nombres, de sorte que chaque résultat est inchangé.

# text
seg-81fd160937db = Douze nouveaux types de scénario et trois nouvelles façons de lire une exécution. Le moteur couvre maintenant le spectre radioélectrique, tout le système solaire, des constellations autour de n'importe quel corps, des campagnes qui enchaînent des scénarios en une seule mission, et le positionnement, la navigation et synchronisation temporelle (PNT) depuis l'orbite terrestre basse (LEO), du signal jusqu'au point. Chaque exécution peut aussi être écrite sous forme d'animation, de rapport complet et d'un ensemble de fichiers d'interopérabilité pour d'autres outils.

# text
seg-118be64d7cb2 = Autour du moteur : un kshana.dev repensé (un site à plusieurs pages, et un nouveau tableau de bord Kshana Studio qui exécute chaque capacité dans le navigateur), un README réécrit, quatorze outils sur le serveur du Model Context Protocol (MCP), une version pour navigateur qui donne les mêmes nombres que la version native, et une page publique pour Kshana Pro.

# text
seg-ea31356bc17d = Fichiers de scénario (plus un manifeste de suite)

# text
# c1: kshana example
seg-26654cd81de1 = { "138" }, dont { "132" } sont fournis pour <c1/>

# text
seg-3d1a85e93e48 = dont MODELLED (modèle énoncé, vérifié pour sa cohérence interne)

# text
seg-e77f9d273ee1 = dont PARTNER (nécessite le matériel ou les données d'un partenaire)

# text
seg-e94cd6b3561a = D'où vient la croissance :

# text
seg-1759a8cce7d6 = Types

# text
seg-94de9433d99f = Fichiers de scénario

# text
seg-03d7aea335dc = Lignes de la matrice (vérifiées + modélisées)

# text
seg-fdd674722717 = Spectre

# text
seg-59583fa40da3 = Système solaire et positionnement autour de n'importe quel corps

# text
seg-fafa167623df = Scénarios maritimes, routiers et ferroviaires

# text
seg-fc571c46e522 = Animation, rapports, exports d'interopérabilité

# text
seg-2746e0d9f787 = Conceptions de signaux LEO et spectre multibande

# text
seg-d40ec114d1f9 = Positionnement, synchronisation temporelle et fusion LEO

# text
seg-0157f649e65b = Chaîne de bout en bout LEO

# text
seg-423283112128 = Scénarios LEO de résilience, de domaine ciblé et d'utilisateur final

# text
seg-395beca13299 = Total ajouté

# text
# c1: src/celeste_iod.rs
seg-ea9dc4093d8a = La capacité LEO est indépendante de tout système : elle s'exécute sur des paramètres génériques et énoncés et n'a besoin d'aucun système nommé. Les systèmes nommés sont des préréglages facultatifs, chacun dans son propre fichier avec sa source publique. Un préréglage, Celeste IOD (démonstration en orbite), utilise des chiffres présentés à l'atelier LEO-PNT de l'ESA NAVISP, { "2026" } (l'ESA est l'Agence spatiale européenne ; NAVISP est son Programme d'innovation et de soutien à la navigation) ; il se trouve dans un seul fichier, <c1/>, avec ses cinq scénarios réservés au dépôt, de sorte qu'il peut être retenu sans modification de source, et aucun de ses chiffres d'atelier n'est repris dans ce journal des modifications.

# text
# c1: ephemeris
seg-c36a5015c03c = <b>Lisez « Révisions de chiffres publiés » avant de mettre à jour.</b> Une sortie du moteur change (les colonnes du référentiel inertiel du type de scénario <c1/>, après une correction de signe dans la matrice de nutation), et l'audit de la documentation a corrigé des chiffres que des documents antérieurs avaient imprimés.

# text
seg-7fe505d3232b = Statuts : <b>VALIDATED</b> signifie vérifié par rapport à une référence externe indépendante (une table publiée, le logiciel d'un autre groupe ou des données mesurées) ; <b>MODELLED</b> signifie un modèle énoncé vérifié uniquement pour sa cohérence interne ; <b>PARTNER</b> signifie que la vérification nécessite le matériel ou les données d'un partenaire.

# text
seg-ec7abb62f217 = 3GPP, 5G, NTN

# text
seg-c5eb2d160429 = 3rd Generation Partnership Project ; réseau mobile de cinquième génération ; réseau non terrestre

# text
seg-9bb1a987fedc = AD, BC

# text
seg-bbe2b5aa0557 = ères du calendrier (anno Domini, avant Jésus-Christ)

# text
seg-05bbe79b1991 = AIAA

# text
seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

# text
seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

# text
seg-81799e2a0c43 = porteuse à décalage binaire alternative ; porteuse à décalage binaire ; modulation par déplacement de phase binaire ; porteuse à décalage binaire multiplexée (modulations de signal)

# text
seg-b2d165acb4e7 = ATOMIC

# text
seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (un modèle d'éphéméride LEO publié)

# text
seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

# text
seg-7f71a4795674 = code grossier/d'acquisition et noms des porteuses et des signaux civils du Global Positioning System

# text
seg-e464509f3abb = rapport densité de puissance de porteuse sur bruit

# text
seg-d8ba917c09b8 = CIO

# text
seg-4321532214e3 = Celestial Intermediate Origin (origine intermédiaire céleste)

# text
seg-de6c33774c9c = CLI

# text
seg-3096eb1d5a15 = interface en ligne de commande

# text
seg-9aa3c2e54398 = contrôle de redondance cyclique sur 24 bits (polynôme Qualcomm)

# text
seg-1e1009e225aa = CSAC

# text
seg-6ff440ff2c0c = CSS, HTML, SVG, XML

# text
seg-bbe86e85e897 = Cascading Style Sheets ; HyperText Markup Language ; Scalable Vector Graphics ; Extensible Markup Language

# text
seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

# text
seg-b4758ea40624 = valeurs séparées par des virgules ; JavaScript Object Notation ; Portable Document Format ; Tom's Obvious Minimal Language ; adresse web (uniform resource locator)

# text
seg-3ad592244ea8 = onde continue

# text
seg-287014fdc28d = CZML, KML, GeoJSON

# text
seg-469c9a50992d = Cesium Language ; Keyhole Markup Language ; Geographic JSON (formats de cartes et de globes)

# text
seg-3415aa029e39 = Development Ephemeris { "441" } du Jet Propulsion Laboratory

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = identifiant d'objet numérique

# text
seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

# text
seg-a149d6e76bcb = dilution de précision : géométrique, en position, horizontale, verticale

# text
seg-bc679de1b3a8 = E1, E5, E5a, E5b

# text
seg-bb2b62a48d99 = noms de signaux Galileo

# text
seg-544f4fcbd68f = un nom d'emplacement dans la table de constellation du Global Positioning System

# text
seg-dd9cfd581e5d = ECEF

# text
seg-1a59ad88eca9 = centré sur la Terre et fixe par rapport à elle

# text
seg-7cf8bec6418e = EE

# text
seg-ceacb6924d4d = équation des équinoxes

# text
seg-5d59005d9757 = Earth Gravitational Model { "2008" }

# text
seg-de3b39993e2a = EIRP

# text
seg-7f1b85286c96 = puissance isotrope rayonnée équivalente

# text
seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy ; Standards of Fundamental Astronomy (bibliothèques d'astronomie de référence)

# text
seg-51f1fda55cc7 = ESA, NAVISP

# text
seg-399a11a6e7c7 = Agence spatiale européenne ; son Programme d'innovation et de soutien à la navigation

# text
seg-01eb6fdcdb90 = FDMA

# text
seg-6723fd8624df = accès multiple par répartition en fréquence

# text
seg-6d5d27174fe9 = GCRF, GCRS

# text
seg-dd326440740d = Geocentric Celestial Reference Frame (référentiel céleste géocentrique) ; Geocentric Celestial Reference System (système de référence céleste géocentrique)

# text
seg-d41af8f18aed = GLONASS

# text
seg-81f742947af1 = le système mondial de navigation par satellite de la Russie

# text
seg-d2a107373b59 = GNSS, GPS

# text
seg-d703f29c82eb = système mondial de navigation par satellite ; Global Positioning System

# text
seg-1df73b95ae4d = IAU

# text
seg-0461e1933d23 = Union astronomique internationale

# text
seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

# text
seg-a54e0f483ad5 = document de contrôle d'interface ; Galileo Open Service Signal-In-Space Interface Control Document ; Galileo Open Service Service Definition Document

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame (référentiel céleste international)

# text
seg-aa7091bb80e6 = IMO

# text
seg-6a7c8caf2a55 = Organisation maritime internationale

# text
seg-dbcf65546abf = INS, MEMS

# text
seg-b767f348dab9 = système de navigation inertielle ; système micro-électromécanique

# text
seg-1be5a43002db = IOD

# text
seg-7eb2ca980e20 = démonstration en orbite

# text
seg-92cd0058a058 = IQ

# text
seg-c7fa50165400 = en phase et en quadrature

# text
seg-41471e51e661 = la spécification d'interface du Global Positioning System

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Station spatiale internationale

# text
seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

# text
seg-7d5656c0bdc7 = International Terrestrial Reference Frame (référentiel terrestre international) ; International Terrestrial Reference System (système de référence terrestre international) ; pseudo-fixe par rapport à la Terre ; équateur vrai, équinoxe moyen (référentiels)

# text
seg-8f1cbbae84aa = ITU, ITU-R

# text
seg-d1b7680b4762 = Union internationale des télécommunications ; son Secteur des radiocommunications

# text
seg-a524e4c4a670 = rapport brouilleur sur signal

# text
seg-5d93361e20d4 = J2 à J6, J2000

# text
seg-50255586b303 = harmoniques zonales du champ de gravité ; l'époque 2000-01-01 { "12" } :{ "00" }

# text
seg-368f7969b33a = JPL

# text
seg-44db8a7ae8f7 = Jet Propulsion Laboratory

# text
seg-e0e589aaa8fe = LEO, MEO

# text
seg-f4b580b88664 = orbite terrestre basse ; orbite terrestre moyenne

# text
seg-aad5b54bfffd = MBSE

# text
seg-800a5f6b96ad = ingénierie des systèmes fondée sur les modèles

# text
seg-535ba4896ba4 = NEES

# text
seg-a230ecd2fe39 = erreur d'estimation normalisée au carré

# text
seg-56d5135d987d = le modèle d'ionosphère de Galileo

# text
seg-408af08fe37b = OEM, SP3, TLE

# text
seg-caac315539e4 = Orbit Ephemeris Message ; Standard Product { "3" } (orbites précises) ; jeu d'éléments à deux lignes

# text
seg-ac4878697ee5 = PNT, PPP

# text
seg-c19b5f77acc5 = positionnement, navigation et synchronisation temporelle ; positionnement précis par point

# text
seg-dd94b086ed4b = PSD, SSC

# text
seg-6e937d7e984e = densité spectrale de puissance ; coefficient de séparation spectrale

# text
seg-e0421c657cc1 = RAIM, SQM

# text
seg-d6fee8d2ce49 = surveillance autonome de l'intégrité par le récepteur ; surveillance de la qualité du signal

# text
seg-dc53bead2cf5 = RINEX, RTCM

# text
seg-497d23725a56 = Receiver Independent Exchange Format ; Radio Technical Commission for Maritime Services

# text
seg-dcd6afa24ea6 = RMS

# text
seg-0b4fc648e96c = valeur efficace (racine de la moyenne des carrés)

# text
seg-e1c3c49833fc = une bibliothèque libre de positionnement GNSS, utilisée ici comme référence indépendante

# text
seg-9ead536db4aa = Simplified General Perturbations { "4" } (le modèle d'orbite des jeux d'éléments à deux lignes)

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

# text
seg-8c718f7f9f5d = SigMF

# text
seg-7830c93a5803 = Signal Metadata Format

# text
seg-d282e836d47b = SISRE

# text
seg-3c48d3ad7b43 = erreur de distance du signal dans l'espace

# text
seg-f045a03a5598 = SPS PS

# text
seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

# text
seg-758b51d8d5b6 = SRTM

# text
seg-7e45c32b04e4 = Shuttle Radar Topography Mission

# text
seg-8104773e1484 = STK

# text
# c1: .e
seg-f4fca0494aae = Systems Tool Kit (son format de fichier d'éphéméride <c1/>)

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-1043491566b5 = SVID

# text
seg-d67f9665f054 = identifiant de véhicule spatial

# text
seg-de4e841ce8a2 = le nombre total de satellites, de plans et le phasage d'une constellation Walker

# text
seg-4d6ebfefc096 = TEC

# text
seg-5149401781dd = contenu électronique total

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = ultra haute fréquence

# text
seg-3cd6018f5b78 = UTC

# text
seg-4d7d6ff2e8a5 = temps universel coordonné

# text
seg-41b9b462d434 = WGS { "84" }

# text
seg-ec04054b9f8e = World Geodetic System { "1984" }

# text
seg-613b7c13cd32 = X1, X5

# text
seg-349e041a5a90 = noms de signaux du système Xona Pulsar

# text
seg-d6a3f210958a = Un chiffre publié qui change est une révision et est consigné, jamais corrigé en silence. Cette version comporte une révision d'une sortie du moteur et plusieurs révisions de chiffres imprimés dans la documentation.

# text
seg-1669eb4224f1 = Sortie du moteur

# text
seg-185961ebab61 = La réduction TEME→GCRS tournait de { "2" }·Δψ : la matrice de nutation avait le signe de Δψ inversé.

# text
# c1: nutation::numat
# c2: Rx(−(ε̄+Δε))·Rz(Δψ)·Rx(ε̄)
# c3: iauNumat
# c4: Rx(−(ε̄+Δε))·Rz(−Δψ)·Rx(ε̄)
# c5: nutation_matrix
# c6: nutation_matrix_2000a
# c7: teme_to_gcrs
# c8: gcrs_to_teme
# c9: numat
# c10: tests/frame_reference_vectors.rs::teme_to_gcrs_matches_vallado_gcrf
# c11: nutation::tests::nutation_matrix_matches_erfa_numat
# c12: src/cio.rs
# c13: ephemeris
# c14: gcrs_r_m
# c15: gcrs_v_m_s
# c16: Propagator::position_in_frame
# c17: state_gcrs
# c18: orbit-sgp4-gps
# c19: sgp4
seg-504b78f30c54 = <c1/> construisait <c2/> là où le <c3/> de SOFA construit <c4/>, de sorte que <c5/>, <c6/>, <c7/> et <c8/> tournaient du double de la nutation en longitude, environ { "25" } secondes d'arc. Chaque vérification de la chaîne était un test de propriété (rotation propre, aller-retour, contribution de nutation non nulle) qu'une erreur de signe laisse passer ; le test de bout en bout de Vallado couvrait TEME→PEF, TEME→ITRF et GCRS→ITRS, mais pas TEME→GCRS. Sur l'exemple de Vallado (AIAA 2006-6753, 2004-04-06), la chaîne manquait le GCRF publié de { "1 145" } m ; elle tombe maintenant à { "0.11" } m de lui, et la matrice est égale au <c9/> d'ERFA à { "1e-14" } près. <c10/> et <c11/> échouent tous deux avec l'ancien signe. Le test de cohérence du CIO (Celestial Intermediate Origin) dans <c12/> avait attribué le désaccord résultant d'environ ~{ "130" } m à « ≈ { "2" }·EE » ; le résidu est maintenant de { "5" } cm et sa borne est resserrée de { "250" } m à { "1" } m. <b>Cela déplace des chiffres publiés, consignés ici comme une révision :</b> les colonnes <c14/> et <c15/> du type de scénario <c13/> (environ { "0.8" }–{ "1.0" } km pour le scénario ISS (Station spatiale internationale) fourni ; ses colonnes TEME, référentiel terrestre, trace au sol, angles de visée et Doppler ne changent pas), et <c16/> / <c17/> pour les référentiels GCRS et ITRS. Aucune ligne de synthèse, aucun graphique ni aucun hachage de référence d'un scénario fourni ne lit ces colonnes. Les nouveaux exports d'interopérabilité utilisent la chaîne corrigée : la position CZML du premier satellite <c18/> concorde avec une réduction ERFA du même TLE (propagé par le paquet Python <c19/>) à { "2.3" } cm près.

# text
# c1: leo-navmsg
# c2: leo-navmsg
# c3: navmsg
# c4: leo-pnt-chain
# c5: docs/LEO-NAVMSG.md
# c6: 0x110315
# c7: 0x19105F
# c8: leo-navmsg-fit-interval-trade
seg-a0a4026d22ed = <b>Le type de scénario <c1/>, en natif et dans la version pour navigateur.</b> Le type de scénario calcule désormais chaque fonction transcendante par une seule bibliothèque mathématique portable, de sorte que sa trame a les mêmes octets sur toutes les plateformes et dans toutes les versions (sous Fixed). Chaque chiffre de <c2/> bouge avec lui, ainsi que l'étape <c3/> de <c4/>. Le type de scénario est nouveau dans cette version, donc rien d'une version antérieure ne bouge, mais des chiffres imprimés avant la correction bougent : la valeur de contrôle de <c5/> pour le scénario d'encodage et de décodage était <c6/> et est <c7/>, et son SISRE du message décodé est de { "0.129" } cm. Sur kshana.dev, la carte Missions de <c8/> montrait une erreur de distance maximale de { "1.6" } mm avec un ajustement de { "60" } s et { "40.3" } mm avec un ajustement de { "900" } s ; le site est maintenant construit à partir du moteur de cette version et montre { "1.8" } mm et { "46.6" } mm.

# text
# c1: maritime-strait-jamming
seg-77f441bfc3c3 = <b>La carte de l'empreinte de brouillage sur kshana.dev (Missions).</b> Chacune de ses { "875" } cellules est une exécution de <c1/> où seule la position du récepteur change. Les cellules sont maintenant calculées à partir des mêmes coordonnées à trois décimales que le lien « open this run » de la cellule donne à Kshana Studio, de sorte qu'une cellule montre exactement ce que son lien reproduit. Le rapport brouilleur sur signal (J/S) moyen de { "30" } cellules bouge de { "0.1" } dB, à la hausse ou à la baisse ; la disponibilité de poursuite d'aucune cellule ne change. Le moteur donne des résultats identiques pour chaque cellule dans { "0.28.0" } et { "0.29.0" }.

# text
# c1: quantum-anomaly-detect
# c2: [0.9901265, 0.9938305]
# c3: [0.99035875, 0.993861]
seg-146588a39e7c = <b>Rééchantillonnage à graine fixe dans le paquet WebAssembly (WASM).</b> La version pour navigateur tirait d'autres indices de bootstrap et de brassage que la version native à partir de la même graine (sous Fixed). L'intervalle <c1/> de l'aire sous la courbe dans le navigateur était <c2/> et est maintenant l'intervalle natif <c3/>. Aucun nombre natif ne bouge.

# text
seg-017810049453 = Chiffres imprimés dans la documentation

# text
seg-85ab2a364a37 = La documentation a été auditée mot à mot par rapport à des exécutions du moteur de cette version. Lorsqu'un chiffre imprimé ne correspondait pas à l'exécution, le document a été corrigé, et chaque correction est listée ici, ancien → nouveau. Dans chacun des cas ci-dessous, la sortie du moteur n'a pas changé ; c'est le document qui l'avait mal lue, mal arrondie ou qui lui avait survécu.

# text
# c1: docs/SOLAR-SYSTEM.md
# c2: docs/CONSTELLATION-DESIGN.md
# c3: leo-pnt-mega-shell
seg-1eacdefbfda2 = <b>Audit de la documentation des pages sur le spectre, les constellations, les campagnes, l'animation, les rapports et l'interopérabilité, et un nouveau <c1/>.</b> Chaque chiffre a été réexécuté avec ce moteur. Deux nombres publiés bougent : <c2/> donnait le test de couverture à { "5" } 000 satellites comme « environ { "0.13" } s en build de débogage » ; cela ne s'est pas reproduit ({ "1.24" } s sur un portable chargé), de sorte que la page donne maintenant la part du préfiltre que le test affiche ({ "9.9" } % de { "19 440 000" } tests de paires) et les { "0.14" } s du binaire de publication pour le <c3/> fourni. La même page donnait le franchissement de E3F comme « décalé de { "0.050" } deg » ; aucun test n'affiche ce chiffre, de sorte que la page n'énonce plus que le seuil de { "0.06" } deg que le test impose et la dérivation { "7.30" } contre { "7.36" } deg qui le sous-tend. Aucune sortie du moteur ne change.

# text
seg-2ad182e2db15 = Documents LEO-PNT : chiffres publiés révisés (réexécutés sur le moteur de cette version).

# text
# c1: docs/LEO-SIGNAL.md
# c2: generic-s
# c3: generic-c-wide
# c4: docs/LEO-NAVMSG.md
# c5: docs/LEO-PASS.md
seg-6c2401365dd5 = Arbitrage de bandes dans <c1/> : le retard ionosphérique au premier ordre de <c2/> est de { "3.24" } m (imprimé { "3.25" } m) et celui de <c3/> de { "0.77" } m (imprimé { "0.78" } m). Encodage et décodage dans <c4/> : le SISRE du message décodé était imprimé à { "0.119" } cm alors que l'exécution donnait { "0.122" } cm ; la page imprime maintenant { "0.129" } cm, le chiffre après la correction d'indépendance de plateforme sous Fixed plus bas. Passage LEO contre GNSS dans <c5/> : { "32" } dB de perte en espace libre en moins au sommet du passage (imprimé « { "26" } à { "32" } dB »). Pour les chiffres de signal et de passage, la sortie du moteur n'a pas changé ; les documents l'avaient mal lue ou mal arrondie.

# text
# c1: /kshana-run
# c2: <scenario>.table.csv
# c3: leo-navmsg
# c4: telecom-timing
# c5: docs/tutorials/README.md
# c6: commands/kshana-run.md
# c7: oem-interop
# c8: docs/examples/multi-tool-pipeline.md
seg-fc3c8ba1b789 = <b>Les tutoriels, l'exemple de chaîne de traitement et la commande <c1/>, audités par rapport au moteur de cette version.</b> Révisions de chiffres publiés, ancien → nouveau : les types de scénario qui écrivent <c2/> sont six, et non quatre (<c3/> et <c4/> manquaient ; <c5/>, <c6/>) ; le franchissement ½bT² à atomes froids du tutoriel { "3" } est de { "18,443" } s, et non de { "18,440" } s ; l'erreur d'aller-retour de <c7/> dans <c8/> est de { "4.88e-7" } km mesurés, et non « ~{ "1e-7" } km » ; la plage de holdover de la CSAC du tutoriel { "2" } est celle de { "2000" }–{ "3200" } s que le test affirme, et non « ~{ "2600" }–{ "4400" } s » ; le tutoriel { "1" } cite les lignes SP3 et le bloc de géométrie à la précision où le moteur les écrit. Aucune sortie du moteur n'a changé.

# text
seg-4c613cabb87b = Pages de validation, quantique, SGP4, animation, affirmations et intégrité.

# text
# c1: docs/VALIDATION.md
# c2: orbit-gnss-challenged
# c3: docs/QUANTUM.md
# c4: docs/SGP4-VALIDATION.md
# c5: docs/ANIMATION.md
# c6: docs/CLAIMS-VS-REALITY.md
# c7: docs/INTEGRITY.md
seg-c49d5cdb36e1 = <c1/> : le seuil imposé sur l'écart-type d'Allan simulé à une seconde d'une horloge à bruit blanc de fréquence est de { "20" } % (imprimé { "25" } % ; le seuil de { "25" } % est celui de la courbe à { "1" }, { "10" } et { "100" } s) ; la ligne de la marche aléatoire de vitesse énonce maintenant son seuil imposé de { "20" } % à côté des environ { "12" } % observés ; et la disponibilité de l'horloge atomique à l'échelle d'une puce dans <c2/> est d'environ { "0.73" } (imprimée environ { "0.83" }). <c3/> : le bruit par tir limité par les vibrations dans l'exemple d'atomes froids de la page est d'environ { "46" } fois son plancher de bruit de grenaille (« ~{ "45" }× » ; { "46.49" } recalculé), et la plage « { "1" }–{ "50" } µg/√Hz » pour les dispositifs déployés, qui contredisait un dispositif que la page cite elle-même, est remplacée par les chiffres publiés des deux dispositifs cités. <c4/> : l'écart de position le plus grand est de { "4.12" } mm (imprimé « ≈ { "4" } mm »), avec le satellite nommé. <c5/> : l'exemple de l'encodeur vidéo lisait les images à { "24" } images par seconde à { "12" } ; il utilise maintenant { "24" }, la cadence que le manifeste des images indique. <c6/> : le modèle de brouillage a { "10" } tests (imprimé { "8" }), et le « { "2.97" } m contre { "48.8" } m » du filtre couplé est remplacé par ce que son test affirme (l'erreur de position couplée sous { "0.6" } fois la découplée, gagnante dans au moins { "90" } essais sur { "100" }). <c7/> : la marque « Today » indiquait { "v0.22.0" } ; elle nomme maintenant cette version, et deux capacités construites depuis (le mode de panne à l'échelle de la constellation et le message d'appui à l'intégrité) quittent sa liste de lacunes.

# text
# c1: spectrum
# c2: src/spectrum.rs
# c3: src/sigmf.rs
# c4: docs/SPECTRUM.md
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: [recording]
# c9: scenarios/l-band-waterfall-jamming.toml
seg-4fde8788f95f = <b>Type de scénario <c1/> : un modèle de spectre en bande L et une cascade</b> (<c2/>, <c3/>, <c4/>). Toute la bande L du GNSS comme une seule densité spectrale de puissance (PSD) : GPS L1 code grossier/d'acquisition (C/A) et L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (porteuse à décalage binaire multiplexée, MBOC(6,1,1/11), ou BOC({ "1,1" })), GPS L5 et Galileo E5a (BPSK({ "10" })), un plancher de bruit kT avec un facteur de bruit de récepteur, et des brouilleurs à onde continue (CW), à bande étroite, à balayage (chirp) et à bruit adapté sur une chronologie scriptée. Chaque brouilleur est évalué par bande selon son coefficient de séparation spectrale (SSC), ce qui donne le rapport brouilleur sur signal (J/S) et le rapport densité de puissance de porteuse sur bruit (C/N0) effectif par bande et par ligne. Le graphique est une cascade SVG avec des barres de C/N0 ; result.json porte la grille moyennée par blocs en puissance. L'option <c5/> dessine le modèle sous forme d'échantillons IQ, écrit et lit un enregistrement Signal Metadata Format (SigMF) (<c6/>, <c7/>) et compare une estimation de Welch au modèle ; l'option <c8/> estime un fichier SigMF réel. Exemple fourni <c9/> : un chirp prend L1 C/A et E1 à { "10" } s, un ton CW sur la porteuse L1 maintient C/A à { "17.98" } dB-Hz après l'arrêt du chirp tandis que E1, dont le spectre a un zéro à cet endroit, se rétablit ; L5 et E5a ne sont pas touchés.

# text
seg-fa9976349886 = Nouvelle ligne VALIDATED : les PSD et les SSC des signaux, par rapport au lobe principal de BPSK(n) de 2n x { "1.023" } MHz, aux lobes de BOC({ "1,1" }) centrés à +/-1.023 MHz, aux formes closes de Parseval derrière les SSC publiés de -61.8 / -64.8 / -67.8 dB/Hz, et aux Q = { "1" } (CW) et { "1.5" } (adapté) des manuels. Le maximum de la PSD de BOC({ "1,1" }) est à +/-0.759 MHz, et non au centre du lobe ; le test fixe les deux.

# text
# c1: jamming
seg-411431a9b26b = Deux nouvelles lignes MODELLED : la cascade et la chronologie de C/N0, qui se réduisent exactement à la chaîne du type de scénario <c1/> (recoupées dans chaque rapport), et le codec SigMF et l'estimateur de Welch. Aucun enregistrement de tiers n'est dans le dépôt.

# text
# c1: navsignal
# c2: spectral_separation_coeff_offset
seg-5c5c695e7c0a = <c1/> : une variante MBOC et <c2/>.

# text
# c1: jamming
seg-bb346f4942a9 = Le rapport imprime le C/N0 que donnerait la table Q représentative du type de scénario <c1/> à côté de celui dérivé du spectre ; pour un ton CW sur la porteuse C/A, ils diffèrent de { "1.8" } dB. Trois nouvelles lignes de la matrice : une vérifiée (spectres de signaux et coefficients de séparation spectrale) et deux modélisées.

# text
seg-673dfe048dad = <b>Éphéméride du système solaire et positionnement autour de n'importe quel corps.</b> Deux nouveaux types de scénario.

# text
# c1: solar-system
# c2: scenarios/solar-system-tour.toml
seg-3e1b0e8e99e9 = <c1/> : le Soleil, les huit planètes, Pluton, la Lune, Phobos, Deimos, Io, Europe, Ganymède, Callisto et Titan à une époque : position et vitesse héliocentriques dans l'International Celestial Reference Frame (ICRF), paramètre gravitationnel, rayons, J2 (le deuxième harmonique zonal) lorsqu'il est publié, rotation sidérale, le pôle et le méridien origine de l'Union astronomique internationale (IAU), une trace d'orbite sur une révolution, et le temps de lumière, la distance aller simple et aller-retour, le retard de Shapiro solaire et la séparation du Soleil depuis un corps observateur et pour toute liaison supplémentaire. Les planètes viennent des éléments képlériens du Jet Propulsion Laboratory (JPL) de Standish et Williams (tableau { "1" }, { "1800" } AD à { "2050" } AD ; tableaux 2a/2b, { "3000" } BC à { "3000" } AD) ; les lunes, des éléments moyens du JPL avec la vitesse de rotation synchrone de l'IAU, et Titan, du modèle de rotation de l'IAU. Exemple : <c2/>.

# text
# c1: body-pnt
# c2: scenarios/mars-orbit-pnt.toml
# c3: scenarios/europa-surface-pnt.toml
seg-6a094973208b = <c1/> : un orbiteur ou un atterrisseur de surface autour de l'un de ces corps, qui navigue avec des pseudodistances d'une constellation Walker autour du corps et une mesure de distance aller-retour sans horloge depuis la Terre ; dilution de précision, incertitude formelle et points par moindres carrés à graine fixe avec et sans la liaison avec la Terre. Exemples : <c2/>, <c3/>.

# text
# c1: Body
# c2: AnalyticSolarSystem
# c3: EphemerisProvider
seg-ed5063379a8b = <c1/> gagne Mercure, Vénus, Jupiter, Saturne, Uranus, Neptune, Pluton et les sept lunes, une recherche par nom et une fiche physique ; <c2/> donne n'importe quel corps par rapport à n'importe quel autre par la jointure <c3/> existante.

# text
# c1: tests/fixtures/solar_system/
# c2: body-pnt
seg-8b5c2fbe91f7 = VALIDATED par rapport à JPL Horizons (Development Ephemeris DE441 ; données de test et requêtes dans <c1/>) : Mercure à Saturne et la Terre d'après le tableau { "1" } à moins de deux fois l'erreur nominale indiquée (au pire { "1.87" } fois), les huit planètes d'après les tableaux 2a/2b (au pire { "1.71" } fois), et le temps de lumière de la Terre à Mars et à Jupiter. MODELLED : Uranus et Neptune d'après le tableau { "1" }, qui dépassent l'erreur indiquée par rapport à DE441 ({ "2.0" } et { "5.2" } fois), Pluton, les lunes, les constantes des corps et les résultats de <c2/>.

# text
# c1: src/ephem.rs
seg-a3c83f6d2078 = Constat : la série lunaire de Montenbruck & Gill dans <c1/> est déjà rapportée à l'équinoxe J2000 par son propre terme de précession ({ "0.05" } degré d'écart avec Horizons), elle est donc utilisée sans rotation de précession supplémentaire. Six nouvelles lignes de la matrice : deux vérifiées (positions des planètes, temps de lumière) et quatre modélisées.

# text
seg-564133d6a0c4 = Constellations autour de n'importe quel corps

# text
# c1: constellation-design
# c2: src/constellation.rs
# c3: solar-system
seg-d1ddb76d8bf3 = <b>Conception de constellations à grande échelle (type de scénario <c1/>, <c2/>).</b> Motifs Walker delta et Walker star (T/P/F), listes d'éléments explicites et conceptions à plusieurs couches, plusieurs constellations par exécution, autour de la Terre, de la Lune, de Mars ou de toute autre planète, de Pluton ou d'une lune majeure, à partir des constantes de corps ajoutées par le type de scénario <c3/>. Préréglages issus d'éléments nominaux publiés : la référence de base du Global Positioning System (GPS) et la constellation extensible à 24 emplacements (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, édition { "1.1" }), BeiDou en orbite terrestre moyenne Walker 24/3/1 plus des satellites géostationnaires et géosynchrones inclinés (Open Service Performance Standard { "3.0" }) et GLONASS 24/3/1 (Interface Control Document { "5.1" }). Couverture et dilution de précision (DOP) sur une grille de latitude/longitude : satellites en vue, GDOP, PDOP, HDOP et VDOP (géométrique, en position, horizontale, verticale) et disponibilité par cellule, globalement et au pire site, avec une horloge de récepteur par constellation. Un préfiltre de visibilité (demi-angle de couverture plus une bande de latitude du sous-satellite, exact sur un corps sphérique) traite { "5 000" } satellites sur une grille de { "10" } deg en environ { "0.13" } s en build de débogage.

# text
seg-8f4ebd177f3d = VALIDATED : le générateur Walker reproduit le tableau { "23" } du Galileo OS SDD et la formule d'emplacement du GLONASS ICD ; le préréglage GPS reproduit la colonne de franchissement de l'équateur du SPS PS ({ "35" } emplacements sur { "36" } à moins de { "0.0108" } deg ; E3F à moins de { "0.06" } deg, la ligne propre du tableau étant incohérente) ; la distribution mondiale du HDOP de la référence de base GPS concorde avec l'annexe B du SPS PS (médiane { "0.940" } contre { "0.94" }, { "95" } % { "1.255" } contre { "1.25" }, moyenne { "0.965" } contre { "0.96" } ; seuil { "0.03" }).

# text
seg-65658a896a73 = MODELLED : conceptions arbitraires, autres corps, phase BeiDou et nœuds géosynchrones inclinés, orbites à deux corps avec J2 facultatif, géométrie seulement.

# text
# c1: constellation-multi-gnss-coverage
# c2: leo-pnt-mega-shell
# c3: lunar-relay-constellation
# c4: kshana example
# c5: docs/CONSTELLATION-DESIGN.md
seg-3dfe470e8a5c = Scénarios : <c1/> ({ "102" } satellites, disponibilité { "100" } %, PDOP médian { "0.95" }, { "31.0" } en vue au-dessus de { "10" } deg), <c2/> ({ "5 000" } satellites, disponibilité { "99.22" } % à un PDOP de { "3" } ou moins au-dessus de { "20" } deg, { "0" } % aux calottes polaires, le préfiltre garde { "11.5" } % des tests de paires), <c3/> ({ "14" } satellites autour de la Lune, disponibilité { "21.33" } % au total et la plus élevée sur la région polaire sud). Les trois sont fournis pour <c4/>. Notes : <c5/>. Trois nouvelles lignes de la matrice : deux vérifiées (générateur Walker et préréglages GNSS, DOP mondial du GPS) et une modélisée.

# text
seg-79e2d2c42166 = Une campagne pilotée par le modèle de spectre, et des constellations autour de n'importe quel corps.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: tests/campaign_composition_reference.rs
# c4: constellation-design
# c5: Body::by_name
# c6: solar-system
seg-4ab5f6f6bbbb = <c1/> enchaîne le type de scénario <c2/> avec un holdover d'horloge et un moniteur d'intégrité (un chirp prend L1 C/A et E1 ; un ton CW maintient ensuite C/A à la baisse pendant que E1 se rétablit et que le récepteur se rabat sur un ciel Galileo seul), calé sur l'exemple de cascade autonome de <c3/>. <c4/> résout maintenant son corps central par <c5/>, de sorte qu'une constellation peut être posée autour de n'importe quelle planète, de Pluton ou d'une lune majeure avec les constantes qu'utilise le type de scénario <c6/>.

# text
# c1: campaign
# c2: src/campaign.rs
# c3: docs/CAMPAIGNS.md
seg-dc904f639fed = <b>Campagnes : de nombreux scénarios composés en une seule exécution.</b> Un nouveau type de scénario <c1/> (<c2/>, documenté dans <c3/>) exécute des membres de types de scénario existants par le même aiguillage que la ligne de commande et relit des nombres dans leurs résultats. Quatre sections, dans toute combinaison :

# text
# c1: [[phases]]
# c2: carry
# c3: handoff
# c4: end_at
seg-903ee141047a = <c1/> : une mission enchaînée sur une seule chronologie. Des préréglages par type de scénario lisent l'erreur de temps d'horloge par rapport à sa garde, le rapport densité de puissance de porteuse sur bruit (C/N0) effectif moyen par rapport au plancher de poursuite, le niveau de protection vertical par rapport à la limite d'alerte, l'erreur de position, les satellites en poursuite et les indicateurs d'alarme, ramenés sur une grille commune avec les frontières de phase et les événements. L'état est transmis par <c2/>, <c3/> et <c4/>.

# text
# c1: [sweep]
seg-4eeedde09a77 = <c1/> : une à trois clés pointées de n'importe quel type de scénario, éventuellement avec un ensemble à graine fixe à chaque nœud.

# text
# c1: [monte_carlo]
seg-4c113198cbb7 = <c1/> : réalisation k à la graine de base + k, avec moyenne, dispersion, percentiles et intervalle de confiance bootstrap à { "95" }% à graine fixe.

# text
# c1: [compose]
# c2: campaign-jam-spoof-holdover-integrity
# c3: campaign-sweep-jammer-power
# c4: campaign-shared-jammer-sea-road
# c5: campaign-monte-carlo-clock-holdover
# c6: tests/campaign_composition_reference.rs
seg-df107253752d = <c1/> : des valeurs partagées liées à plusieurs membres, avec une synthèse combinée du meilleur et du pire cas. Chaque résultat porte un hachage de campagne et une empreinte sur tous les résultats des membres. Quatre scénarios fournis : <c2/> (nominal, brouillage, leurrage terminé à la détection du moniteur d'horloge à { "370" } s, holdover portant le décalage leurré de { "37.0" } ns avec une centrale inertielle en roue libre, une alarme d'intégrité, rétablissement), <c3/>, <c4/> et <c5/>. <c6/> fixe les identités de composition : une campagne à une phase reproduit l'exécution autonome bit pour bit sur trois types de scénario, un ensemble à graine fixe est stable octet pour octet, et sur une horloge à bruit blanc de fréquence la moyenne de l'ensemble se situe dans l'intervalle rapporté, avec la dispersion dans l'intervalle du khi-deux de sqrt(q_wf * tau) = { "16.459" } ns. Trois nouvelles lignes de la matrice, modélisées.

# text
seg-c611ee59301a = Animation

# text
# c1: --animate svg|html|frames|all
# c2: src/animation.rs
# c3: docs/ANIMATION.md
# c4: manifest.json
# c5: prefers-color-scheme
# c6: prefers-reduced-motion
# c7: --animate-fps
# c8: --animate-duration
# c9: kshana::api::animate_toml
# c10: kshana::animation::animate_result
# c11: result.json
# c12: animation
# c13: --animate
# c14: tests/animation.rs
seg-14b2d3cc9e7c = <b>Export d'animation (<c1/>, <c2/>, <a1><c3/></a1>).</b> Toute exécution dont le résultat porte une série temporelle peut maintenant être écrite sous forme de fichier Scalable Vector Graphics (SVG) animé (images clés Cascading Style Sheets, sans script : les tracés se dessinent derrière un curseur de temps mobile), d'un lecteur HyperText Markup Language (HTML) unique et autonome (lecture et pause, défilement, vitesse, chaque panneau sur un même curseur synchronisé, repères d'événements qui se positionnent au clic ; aucune ressource externe), ou d'une séquence numérotée d'images SVG avec un <c4/> indiquant les images par seconde, la durée et les instants des images pour un encodeur vidéo. Une campagne se joue par ses phases avec ses alarmes marquées ; une exécution de spectre anime sa cascade ligne par ligne. Le lecteur suit <c5/>, et sous <c6/> le SVG comme le lecteur montrent l'image terminée au lieu de bouger. <c7/> et <c8/> règlent la lecture ; <c9/> et <c10/> sont les points d'entrée de la bibliothèque, et <c11/> gagne un bloc <c12/> seulement quand <c13/> s'exécute. La sortie est une fonction pure du résultat et des options, identique octet pour octet à la réexécution, sans horodatage. Un type de scénario sans axe du temps échantillonné est refusé avec « no time series to animate » et rien n'est écrit. L'exporteur dessine les propres échantillons de l'exécution et n'ajoute aucun nombre, il est donc MODELLED (cohérence interne) et ne porte aucune ligne de la matrice de vérification ; aucun nombre publié ne change. Tests : <c14/> (déterminisme, nombre d'images, aucune adresse externe, XML bien formé, le chemin de réduction des animations, et chaque scénario fourni avec une série temporelle s'animant).

# text
seg-c01b78b64065 = Rapports

# text
# c1: src/advanced_report.rs
# c2: <scenario>.report.html
# c3: <scenario>.report.json
# c4: units
# c5: sweep
# c6: sweep-nd
# c7: orbit
# c8: slot-timing
# c9: KSHANA_GIT_COMMIT
# c10: --study-name
# c11: --report pdf
# c12: tests/advanced_report.rs
# c13: tests/advanced_report_cli.rs
# c14: result.json
seg-2662fdb991f3 = <b>Rapports d'exécution avancés (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Chaque exécution en interface en ligne de commande (CLI) écrit maintenant <c2/>, un rapport HyperText Markup Language (HTML) imprimable, et <c3/>, le même contenu sous forme de document JavaScript Object Notation (JSON) lisible par machine. Sections : un résumé exécutif ; chaque entrée du scénario avec son unité, lue dans le schéma des unités de champ (le bloc <c4/> du résultat), sinon dans le suffixe du nom du champ, sinon indiquée comme non indiquée ; les résultats avec le graphique de l'exécution, chaque scalaire et une synthèse de chaque colonne numérique ; pour une campagne, le tableau des nœuds du balayage, la moyenne, l'écart-type, les 5e / 50e / 95e percentiles et l'intervalle de confiance bootstrap de Monte Carlo avec un histogramme par métrique, le tableau des phases de la chaîne, ou les membres et la synthèse combinée de la composition (et la grille d'une exécution <c5/> ou <c6/>) ; une chronologie des événements ; l'étiquette VALIDATED / MODELLED / PARTNER, la référence indépendante et les preuves de test de chaque ligne de la matrice de vérification que les types de scénario de l'exécution exercent, lues dans la matrice par une table de correspondance entre type de scénario et ligne (une ligne qui évalue un seul chemin d'entrée, comme le chemin Simplified General Perturbations { "4" } (SGP4) de <c7/> ou le chemin d'enregistrement mesuré de <c8/>, n'est listée que lorsque l'exécution a pris ce chemin, et la ligne du lecteur Shuttle Radar Topography Mission (SRTM) n'est listée pour aucun type de scénario, puisqu'aucun champ de scénario ne lit une tuile SRTM) ; les énoncés de ce qui n'est pas modélisé et les hypothèses, chacun cité avec sa source ; et un enregistrement de reproductibilité (version du moteur, le commit source lorsque le build définit <c9/>, empreintes Secure Hash Algorithm 256 bits (SHA-256) du fichier de scénario et du document de résultat, graine, plateforme et la commande exacte). Le rapport ne lit aucune horloge : le même scénario, la même graine et le même build du moteur donnent un rapport identique octet pour octet, et le seul horodatage qu'il peut montrer est celui que <c10/> écrit déjà. Une feuille de style d'impression s'adapte à l'A4 et au US Letter, répète les en-têtes de tableau et garde les lignes et les figures entières d'une page à l'autre ; un fichier Portable Document Format (PDF) s'obtient avec « Enregistrer au format PDF » du navigateur. Il n'y a pas d'option <c11/>, car le rendu des graphiques dans un PDF exigerait une nouvelle dépendance lourde. Tests : <c12/> rapporte chaque scénario fourni (aucune section vide, aucun texte de remplissage, étiquettes égales à la matrice, empreinte du scénario égale à celle du fichier, identique octet pour octet à la réexécution) et <c13/> réexécute la commande enregistrée dans un répertoire neuf et exige un <c14/> identique octet pour octet. Aucun nombre publié ne change, et les nombres de types de scénario, de fichiers de scénario et de lignes de la matrice sont inchangés.

# text
# c1: report.json
# c2: companions
seg-ce45e75c6d67 = <b>Le rapport, l'animation et les exports fonctionnent ensemble.</b> Le rapport avancé gagne une section « Animation and exports » : le dessin animé de l'exécution intégré comme image inerte (ou la raison pour laquelle il n'y en a pas), des liens vers les fichiers d'animation et d'export écrits à côté, et chaque format d'interopérabilité avec son applicabilité, la raison s'il ne s'applique pas, et sa spécification ; <c1/> porte le même bloc <c2/>. Le lecteur d'animation HTML liste les fichiers d'export écrits à côté. L'interface en ligne de commande (CLI) produit maintenant les exports avant d'écrire le rapport, de sorte que les deux peuvent nommer les fichiers.

# text
seg-c60dc5b92a60 = Exports d'interopérabilité

# text
# c1: --export
# c2: src/interop/
seg-5bfce52c5a13 = Exports et imports d'interopérabilité (<c1/>, <c2/>, docs/INTEROP.md).

# text
# c1: kshana <scenario.toml> --export <format>
# c2: gx:Track
# c3: .e
# c4: EphemerisTimePosVel
# c5: spectrum
# c6: src/sigmf.rs
# c7: --export all
# c8: --export list
# c9: INERTIAL
# c10: ICRF
# c11: FIXED
# c12: jamming
# c13: --import-route <file.geojson>
# c14: LineString
# c15: terrain-nav
# c16: terrain-slam
# c17: gravity-map
# c18: combined-altpnt
# c19: tests/interop_formats.rs
# c20: spectrum
# c21: PassesScenario
# c22: propagator()
# c23: epoch_calendar()
# c24: epoch
# c25: t = 0
# c26: Sgp4::epoch_jd_utc
# c27: Sp3Interpolator::jd_ut1
# c28: Propagator::own_jd_utc
seg-44e7c902490a = <c1/> écrit la géométrie du scénario en CZML (le Cesium Language), en KML (Keyhole Markup Language { "2.2" }, une norme de l'Open Geospatial Consortium, avec des pistes horodatées <c2/>), en GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) et en éphémérides Ansys STK (Systems Tool Kit) <c3/> (<c4/>, mètres, un fichier par objet mobile), et l'instantané IQ (en phase et en quadrature) synthétisé du type de scénario <c5/> sous forme de paire SigMF (Signal Metadata Format) par le <c6/> existant. <c7/> écrit tous les formats applicables et indique pourquoi les autres ne le sont pas ; <c8/> rend compte sans exécuter. Les objets mobiles sont écrits dans le Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) et en longitude, latitude et hauteur WGS { "84" } (World Geodetic System { "1984" }) fixes par rapport à la Terre (KML, GeoJSON) ; les sites fixes en CZML sont <c11/>. Le type de scénario <c12/> ajoute deux empreintes de brouilleur à partir de ses propres équations de liaison. <c13/> écrit un <c14/> GeoJSON dans les entrées de trace de <c15/>, <c16/>, <c17/> et <c18/>. Les exports sont déterministes à l'octet près et ne portent aucun horodatage. <c19/> valide chaque export par rapport à sa spécification publiée, compare les états de satellites exportés à ceux du moteur à { "1" } mm près, et fait passer chaque scénario fourni par chaque format, chacun s'exportant ou indiquant pourquoi il ne le fait pas (le tableau de docs/INTEROP.md). Aucun nombre publié ne change : la synthèse IQ du type de scénario <c20/> est passée dans une fonction partagée et son document de résultat est identique octet pour octet, et <c21/> gagne <c22/> et <c23/> utilisés par sa propre exécution. Les nombres de types de scénario, de fichiers de scénario et de lignes de la matrice de vérification sont inchangés. Un scénario d'orbite ou d'intégrité sans <c24/> est daté par les données propres de ses satellites : <c25/> est la plus ancienne époque de TLE (jeu d'éléments à deux lignes), d'éphéméride diffusée ou de SP3 (Standard Product { "3" }), et chacun de ces satellites est tourné dans les référentiels GCRS et fixe par rapport à la Terre à son propre instant ; 2000-01-01T00:{ "00" }:00Z n'est utilisé que lorsqu'aucun satellite ne porte d'époque. Les exports SP3 et OEM (Orbit Ephemeris Message) gardent leur étiquette 2000-01-01. Pour cela, <c26/>, <c27/> et <c28/> sont ajoutés ; rien de ce qui existait ne les lit.

# text
seg-12c151a800f9 = Navigation en orbite terrestre basse : signal

# text
# c1: leo-signal
# c2: spectrum
seg-9b665682695a = <b>Conceptions de signaux LEO-PNT et spectre multibande.</b> Un nouveau type de scénario <c1/> et un type de scénario <c2/> qui va au-delà de la bande L : un type de scénario, quatre fichiers de scénario (trois fournis ; le fichier Celeste IOD est réservé au dépôt) et quatre lignes de la matrice (deux VALIDATED, deux MODELLED).

# text
# c1: leo-signal
# c2: data/leo-signals/
# c3: scenarios/leo-band-trade.toml
# c4: scenarios/xona-pulsar-signals.toml
# c5: scenarios/celeste-iod-classical-pilot-signals.toml
# c6: docs/LEO-SIGNAL.md
seg-b355b28bfd1b = <c1/> : des conceptions paramétrées de signaux de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO) pour n'importe quel système (bande, largeur de bande d'émission, attribution UIT ; composantes d'acquisition, de données et pilote avec des spectres BPSK(n), BOC(m,n), MBOC ou plats, parts de puissance, sous-porteuses FDMA, longueurs de code et débits de données), à partir de fichiers de préréglages publics compilés sous <c2/> (Xona Pulsar X1/X5, Iridium STL, un signal d'opportunité Starlink, CentiSpace, une conception représentative en bande C et des conceptions représentatives UHF/L/S/C/C large, chacune citant l'URL de sa source) ou écrites en ligne. Par signal : la PSD limitée en bande et les fractions de puissance dans la bande, la largeur de bande de Gabor, la gigue de poursuite de code avance-retard limitée en bande en fonction du C/N0 et de l'espacement (Betz & Kolodziejski { "2009" }) et la précision de mesure de distance, l'espace de recherche d'acquisition, la probabilité de détection et le temps moyen d'acquisition série et parallèle sur le code, le SSC vers et depuis GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b et AltBOC avec la perte de C/N0, la tolérance J/S CW, à large bande et adaptée issue du code SSC du type de scénario de spectre, un arbitrage de bandes (retard ionosphérique, perte en espace libre, mesure de distance à C/N0 égal et à EIRP égale, tolérance au brouilleur), et des contrôles de forme facultatifs par rapport à une mesure décrite. Exemples : <c3/>, <c4/>, <c5/> (les bandes et la configuration de signal Celeste IOD présentées à l'atelier LEO-PNT de l'ESA NAVISP, { "2026" } ; retenues avec le préréglage Celeste IOD, voir « LEO-PNT end to end » plus bas). Notes dans <c6/>.

# text
# c1: spectrum
# c2: [[panels]]
# c3: wideband
# c4: bands[].tracked_power_dbw
# c5: bands[].design
# c6: panels
# c7: not_modelled
# c8: scenarios/multi-band-jamming-waterfall.toml
seg-8f58debf721f = <c1/> : les bandes peuvent maintenant être une conception de signal prédéfinie (chaque composante dessinée, limitée en bande, C/N0 et J/S rapportés à la composante poursuivie) ou une porteuse et une modulation personnalisées ; <c2/> ajoutent des cascades sur d'autres plages de fréquences sur une même chronologie ; un brouilleur <c3/> (barrage) rejoint les quatre formes d'onde. Le rapport ajoute <c4/>, <c5/> et <c6/>, et une entrée <c7/>. Les bandes simples donnent les mêmes nombres qu'avant. Exemple : <c8/>.

# text
# c1: navsignal
# c2: Modulation::label
seg-98f74d85c54b = <c1/> gagne l'intégrale du sinus, les formes closes de la puissance dans la bande de BPSK et de la largeur de bande de Gabor limitée en bande, la gigue avance-retard limitée en bande pour n'importe quel spectre et sa borne de Gabor, la forme close du SSC de BPSK décalé, le spectre AltBOC({ "15,10" }) de Galileo E5 et un analyseur d'étiquettes de modulation ; <c2/> imprime BPSK(1/3) sous forme de fraction.

# text
# c1: leo-signal
seg-78d9e5e2c615 = Quatre lignes de la matrice : formes closes limitées en bande VALIDATED ({ "90.3" } % de la puissance de BPSK dans le lobe principal, la gigue se réduisant à la forme cohérente de Kaplan & Hegarty, { "0.0039564" } chip à { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, et à sa borne de Gabor, et l'auto-SSC de BPSK 2/({ "3" } R_c) ; la forme close de Gabor et le SSC décalé par rapport à sa forme de Parseval sont indiqués comme des recoupements internes) ; Doppler LEO maximal VALIDATED (Xona X1 { "33.2" } kHz dans la plage publiée de { "32" } à { "34" } kHz, Iridium à { "0.5" } kHz de { "36" } kHz) ; MODELLED <c1/> ; spectre multibande MODELLED.

# text
seg-45d3d4a46d6b = Navigation en orbite terrestre basse : liaison

# text
# c1: leo-pass
# c2: constellation-design
# c3: [iot]
seg-1d120db87aae = <b>Passage LEO-PNT et bilan de liaison par bande : le type de scénario <c1/>.</b> Le LEO-PNT est le positionnement, la navigation et la synchronisation temporelle à partir de satellites en orbite terrestre basse (LEO). Un utilisateur (au sol, maritime, aérien ou en intérieur, statique ou mobile) et un ou plusieurs satellites LEO issus d'un passage conçu, d'éléments explicites, d'un jeu d'éléments à deux lignes (TLE) par SGP4, ou d'une constellation Walker du code <c2/>. Par satellite, bande et époque : angles de visée, distance, vitesse de distance et accélération de distance en forme close (vérifiées à chaque exécution par des différences centrales), Doppler et taux de Doppler, perte en espace libre, EIRP (puissance isotrope rayonnée équivalente) avec un diagramme de satellite isoflux, à faisceau gaussien ou plat, une antenne d'utilisateur patch, l'atténuation gazeuse UIT-R P.676, l'atténuation due à la pluie UIT-R P.838/P.618, la scintillation troposphérique P.618, la perte de pénétration dans les bâtiments UIT-R P.2109 pour un utilisateur en intérieur, le désaccord de polarisation, la température de bruit du système et le C/N0 (rapport densité de puissance de porteuse sur bruit) ; le retard ionosphérique au premier ordre par bande à partir d'un TEC oblique (contenu électronique total) de Klobuchar ou de TEC vertical sous le satellite, et des paires de bandes sans ionosphère avec leur amplification du bruit. Des satellites Galileo ou GPS sont évalués avec le même récepteur à partir des puissances reçues de leurs documents d'interface, de sorte que le passage LEO en cloche et les porteuses MEO (orbite terrestre moyenne) plates partagent un même graphique. Une section <c3/> donne le temps avant le premier point, l'énergie par point et l'autonomie de la batterie en fonction du rapport cyclique (MODELLED).

# text
# c1: src/celeste_iod.rs
seg-17f3503e1be3 = Indépendant de tout système : le moteur n'a besoin d'aucun préréglage. Des préréglages facultatifs, chacun dans son propre fichier et marqué PUBLIC (avec URL), REPRESENTATIVE ou WORKSHOP : multibande générique (UHF, L, S, C), bande C générique, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink comme signal d'opportunité à Doppler seul, CentiSpace, et Celeste IOD (démonstration en orbite), dont les paramètres de signal ont été présentés à l'atelier LEO-PNT de l'ESA NAVISP, { "2026" }, et se trouvent dans <c1/> pour pouvoir être retenus (voir « LEO-PNT end to end » plus bas).

# text
# c1: src/leo_link/
seg-a338cc46a1e0 = Des briques publiques dans <c1/> (geometry, antenna, itu, iono, energy, presets) que d'autres modules peuvent appeler.

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-pass-celeste-iod-multiband
seg-887ad03cb6f6 = Scénarios : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
# c1: docs/LEO-PASS.md
seg-a20f1602c236 = Neuf lignes de la matrice. VALIDATED ({ "6" }) : coefficients UIT-R P.838-3 par rapport à son tableau { "5" } ; atténuation due à la pluie et scintillation P.618-14 par rapport aux exemples de validation du groupe d'études { "3" } de l'UIT-R ; perte de pénétration dans les bâtiments P.2109 par rapport au classeur du groupe d'études { "3" } ; mise à l'échelle ionosphérique au premier ordre par rapport au rapport de retards de groupe de l'IS-GPS-200, avec la perte en espace libre ; le Doppler maximal d'un utilisateur statique sur une orbite circulaire par rapport au tableau { "1" } d'arXiv { "2509.19551" }. MODELLED ({ "3" }) : le passage et le bilan de liaison, les préréglages et le budget de point à basse énergie. Un type de scénario et six fichiers de scénario. Notes dans <c1/>.

# text
seg-ef74b0f08aa1 = Navigation en orbite terrestre basse : message de navigation

# text
# c1: leo-navmsg
# c2: src/leo_navmsg/
# c3: docs/LEO-NAVMSG.md
seg-866ff4ee8b19 = <b>Message de navigation LEO (type de scénario <c1/>, <c2/>).</b> Le message d'éphéméride et d'horloge diffusé d'un satellite de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO), pour n'importe quelle orbite, porteuse et modèle ; les préréglages nommés sont des données facultatives et chaque capacité fonctionne sans eux. Un type de scénario, cinq fichiers de scénario et neuf lignes de la matrice (trois VALIDATED, six MODELLED). Voir <c3/>.

# text
seg-c42821b6e855 = Contenu du message : SVID, âge des données, bande et état du signal ; semaine, temps de la semaine et polynôme d'horloge du second ordre ; l'éphéméride dans l'un de quatre modèles — le jeu képlérien à 16 paramètres du Galileo OS SIS ICD, ce jeu plus des polynômes de correction le long de la trace, transversale et radiale, le modèle à 22 paramètres de Liu et al. { "2025" } (doi 10.3390/rs17162894), ou le polynôme ECEF à horloge nulle d'ATOMIC — et un jeu de Klobuchar, des coefficients NeQuick-G avec le niveau d'ionisation effectif, et des paramètres du temps système vers l'UTC avec les cas de seconde intercalaire de l'ICD.

# text
seg-e4565696f162 = Ajusteur : une orbite de vérité intégrée avec la gravité zonale J2–J6 ou EGM2008 et la traînée, une horloge à graine fixe libre ou pilotée, un ajustement de Levenberg–Marquardt sur des éléments non singuliers, puis des polynômes de correction par moindres carrés linéaires et une horloge ajustée nette du terme relativiste de l'utilisateur.

# text
# c1: leo-navmsg-fit-interval-trade
# c2: leo-navmsg-model-comparison
# c3: leo-navmsg-midpass-update
# c4: leo-navmsg-encode-decode
seg-a7287b7b336c = Quatre analyses et scénarios : <c1/> (erreur de distance du signal dans l'espace (SISRE) en fonction de l'intervalle d'ajustement et de la période de mise à jour), <c2/> (quatre modèles, bits, et l'ajustement à 22 paramètres de Kshana aux altitudes de Liu et al. à côté des chiffres publiés, MODELLED), <c3/> (continuité à chaque changement de message dans un passage) et <c4/> (la propre trame binaire documentée de Kshana avec CRC-24Q et un budget de quantification, un bloc de style RINEX-4 indiqué comme extension de Kshana, et un tableau CSV).

# text
# c1: tests/leo_navmsg_reference.rs
seg-e272dce3d10f = VALIDATED : les poids du SISRE moyen global par rapport au tableau publié d'orbite moyenne et géostationnaire de Montenbruck et al. { "2018" } ; l'algorithme utilisateur de Galileo par rapport à RTKLIB sur quatre éphémérides diffusées réelles de Galileo (<c1/>) ; le CRC-24Q par rapport à la valeur de contrôle du catalogue et à la trame d'exemple RTCM { "10403" } { "1005" }.

# text
# c1: src/celeste_iod.rs
seg-5c8592195b0d = Préréglages, un fichier chacun avec ses sources : Xona Pulsar et Pulsar-0, Iridium, Starlink, CentiSpace, un système représentatif en bande C, ATOMIC, et Celeste IOD (le seul préréglage utilisant du matériel présenté à l'atelier LEO-PNT de l'ESA NAVISP, { "2026" }, conservé dans <c1/> avec ses scénarios pour pouvoir être retenu).

# text
seg-9fb0cbf29cef = Navigation en orbite terrestre basse : fusion

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
# c5: src/celeste_iod.rs
seg-071f4db017c5 = <b>Positionnement, navigation et synchronisation temporelle fusionnés MEO + LEO : <c1/>, <c2/> et <c3/>.</b> Trois nouveaux types de scénario dans <c4/>, indépendants de tout système : chaque constellation est faite de couches Walker, de jeux d'éléments ou d'un préréglage GNSS, chaque signal est une porteuse, une cadence de chips et une enveloppe de rapport densité de puissance de porteuse sur bruit (C/N0), chaque budget d'erreur est un écart-type explicite, et les systèmes nommés en orbite terrestre basse (LEO) sont des préréglages facultatifs, un fichier chacun avec leurs sources marquées publiques, d'atelier ou dérivées (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), signaux d'opportunité de Starlink, CentiSpace, un système représentatif en bande C, le modèle d'éphéméride à horloge nulle d'ATOMIC, et un préréglage de démonstration en orbite ESA Celeste dont les paramètres issus de l'atelier se trouvent dans <c5/> pour pouvoir être retenus).

# text
# c1: leo-pvt
seg-f28f7a441263 = <c1/> a quatre modes : positionnement Doppler (moindres carrés par lots sur la vitesse de distance avec des états de dérive d'horloge et de vitesse, un mode de signaux d'opportunité à Doppler seul, la précision d'un seul passage le long de la trace et transversale, et l'enveloppe du Doppler, du taux de Doppler et de la secousse) ; moindres carrés pondérés conjoints GNSS + LEO avec une horloge par système (le biais inter-systèmes) ou un décalage connu, des écarts-types par mesure comme entrées, et le DOP en fonction du nombre de satellites LEO ; couverture polaire et arctique en fonction de la latitude ; et transfert de temps LEO vers le temps universel coordonné (UTC) en fonction du C/N0 et de l'oscillateur du récepteur avec l'expression du temps système vers l'UTC de l'IS-GPS-200.

# text
# c1: leo-ppp
seg-57afa384aabd = <c1/> : un filtre de Kalman étendu de positionnement précis par point (PPP) flottant sur le code et la phase sans ionosphère, GNSS seul et avec augmentation LEO, avec son temps de convergence et un test de cohérence NEES (erreur d'estimation normalisée au carré) de Monte Carlo. Le scénario fourni donne { "7.4" } min avec quatre systèmes MEO et { "4.8" }, { "3.2" }, { "2.7" } et { "2.3" } min avec { "60" }, { "96" }, { "192" } et { "288" } satellites LEO, à côté des { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } et { "1.3" } min de Li et al. (J. Geod. { "93" } :{ "749" }, { "2019" }) comme comparaison MODELLED de la tendance.

# text
# c1: ntn-positioning
seg-3fa0556b3737 = <c1/> : positionnement par réseau non terrestre (NTN) 5G dans la bande S satellite mobile n256 du 3GPP à partir de la borne de Cramér-Rao sur le temps d'arrivée et le Doppler.

# text
# c1: leo-doppler-positioning
# c2: starlink-sop-doppler-positioning
# c3: meo-leo-fused-pvt
# c4: leo-ppp-convergence
# c5: ntn-5g-positioning
# c6: polar-arctic-leo-coverage
# c7: leo-timing-utc
# c8: celeste-iod-fused-pvt
seg-a0cc2699e276 = Scénarios : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (fournis) et <c8/> (réservé au dépôt, retenu avec le préréglage Celeste IOD).

# text
# c1: tests/leo_doppler_reference.rs
# c2: docs/LEO-PNT-FUSION.md
seg-c0b6b98eeac3 = Huit lignes de la matrice : l'enveloppe Doppler LEO VALIDATED par rapport aux chiffres publiés d'Iridium (±{ "36" } kHz : { "35.9" } kHz, à { "5" }% près) et de Xona Pulsar X1 ({ "32" } à { "34" } kHz : { "33.6" } kHz depuis la couche à { "97" } deg, sans élargissement) (<c1/>) ; le positionnement Doppler, le positionnement conjoint par pseudodistances, la convergence du PPP, les bornes NTN, la synchronisation temporelle LEO, la couverture polaire et les préréglages sont MODELLED. Trois types de scénario et huit fichiers de scénario. Documentation : <c2/>.

# text
# c1: leo-pnt-chain
# c2: docs/LEO-PNT.md
seg-173793480abc = <b>LEO-PNT de bout en bout : le type de scénario <c1/>, et les étapes LEO câblées ensemble.</b> Un système de positionnement, navigation et synchronisation temporelle (PNT) en orbite terrestre basse (LEO) suivi de sa conception de signal à la position de l'utilisateur, chaque étape étant le propre type de scénario du moteur sur sa propre table de scénario, avec des valeurs transmises dans le code (<a1><c2/></a1>) :

# text
# c1: leo-pass
# c2: leo-signal
# c3: signal = "xona-x5"
# c4: iono_free
seg-41a4a2183ba3 = Les bandes de <c1/> peuvent nommer une conception <c2/> (<c3/>) : la bande reprend le centre de la conception, sa largeur de bande d'émission et la cadence de chips de la composante poursuivie, répartit son EIRP (puissance isotrope rayonnée équivalente) entre les composantes de la conception, et rapporte à chaque époque le C/N0 (rapport densité de puissance de porteuse sur bruit) de la composante poursuivie et la gigue de poursuite de code limitée en bande (l'erreur de mesure de distance ; le bruit de la paire <c4/> l'utilise aussi). Une bande sans conception donne la même sortie qu'avant.

# text
# c1: leo-pnt-chain
# c2: leo-pvt
# c3: leo-ppp
# c4: od_sisre_m
# c5: tests/leo_pnt_chain.rs
# c6: LeoNavmsgScenario::broadcast_sisre
seg-a076a43a9d44 = <c1/> enchaîne signal -> passage -> message de navigation -> point conjoint fusionné <c2/> -> <c3/> facultatif. Chaque système LEO de l'étape de positionnement qui les laisse non définis prend une droite de C/N0 en sin(élévation) ajustée au passage, l'erreur de distance du signal dans l'espace du message (SISRE : son erreur de représentation à l'orbite du satellite du passage, avec un terme de détermination d'orbite <c4/> indiqué, en somme quadratique), ainsi que la porteuse et la cadence de chips de la conception ; les cas de positionnement précis par point (PPP) prennent le SISRE. Chaque transmission est listée avec sa valeur et son unité, et <c5/> vérifie que chacune est égale à la sortie en amont et que les changements en amont déplacent les chiffres en aval. <c6/> est le nouveau point d'entrée du message.

# text
# c1: leo-pnt-end-to-end
# c2: generic-l
# c3: xona-pulsar-end-to-end
# c4: celeste-iod-end-to-end
seg-8c256ed478e9 = Scénarios : <c1/> (une constellation générique à { "1080" } km et le signal représentatif <c2/>), <c3/> (le signal public X5), tous deux fournis, et le scénario facultatif <c4/>, réservé au dépôt.

# text
# c1: src/celeste_iod.rs
# c2: build.rs
# c3: kshana_celeste
# c4: scenarios/*celeste-iod*.toml
# c5: tests/workshop_preset_isolation.rs
seg-879259c7ff86 = Les préréglages Celeste IOD (démonstration en orbite) des domaines du passage, du message et du positionnement fusionné se trouvent maintenant dans un seul fichier, <c1/>, que <c2/> ne compile que s'il existe (l'indicateur de configuration <c3/>). Ses cinq scénarios (<c4/>) sont réservés au dépôt : supprimer ce fichier et ces scénarios retient donc chaque nombre présenté à l'atelier LEO-PNT de l'ESA NAVISP, { "2026" }, sans modification de source ; <c5/> vérifie quels fichiers peuvent nommer le préréglage ou porter les nombres de son plan de bandes.

# text
# c1: leo-pvt
# c2: t_s
# c3: leo-ppp
# c4: t_min
# c5: leo-pass
# c6: leo-pnt-chain
seg-110b1f7c7c63 = Chaque type de scénario LEO dans la table de correspondance du rapport avancé, avec ses lignes propres à un chemin listées seulement lorsque l'exécution a pris ce chemin (un taux de pluie, un bâtiment, une analyse ou un mode qui s'est exécuté). Les fenêtres Doppler de <c1/> gagnent <c2/> et les cas de <c3/> gagnent <c4/>, de sorte que les deux s'animent ; <c5/> et <c6/> exportent des éphémérides CZML, KML, GeoJSON et STK, et les autres types de scénario LEO indiquent pourquoi un format ne s'applique pas.

# text
seg-1419edea5329 = Navigation en orbite terrestre basse : résilience, domaines ciblés et scénarios d'utilisateurs finaux

# text
# c1: docs/LEO-PNT.md
seg-d084d86044b4 = <b>Résilience LEO-PNT, un scénario par domaine ciblé d'expérience et un par secteur d'utilisateur final, et <c1/> comme vue d'ensemble de chaque type de scénario et de chaque scénario LEO.</b> Chaque scénario s'exécute sans aucune donnée Celeste et est fourni.

# text
# c1: leo-pass
# c2: [spoofer]
# c3: leo_link::spoof
seg-07e91f076ab2 = <c1/> gagne une section <c2/> : un leurre contrefait, de façon cohérente en distance et en vitesse de distance, les signaux d'une position annoncée qui saute et/ou est écartée de la position réelle après un début (par bande LEO, et le signal GNSS MEO), avec ou sans l'ionosphère. Deux moniteurs fonctionnent à une probabilité de fausse alarme indiquée : cohérence du Doppler et de la géométrie du passage (vitesses de distance mesurées par rapport à celles prédites à partir des orbites et d'une position et d'une vitesse a priori indépendantes ; un khi-deux des moindres carrés généralisés sur une fenêtre, sur les canaux GNSS, LEO et tous les canaux, bruit de la boucle à verrouillage de fréquence issu du C/N0) et cohérence entre bandes (le saut de la combinaison sans géométrie, corrigée du modèle, de chaque paire de bandes LEO). Le résultat donne les statistiques par époque (il s'anime donc), chaque paire, et le moment où chaque moniteur détecte. Briques dans <c3/>. Section absente, sortie inchangée.

# text
# c1: leo-pass
# c2: leo-pass
seg-6a7852f1f053 = Chaque paire de bandes de <c1/> rapporte aussi le contenu électronique total (TEC) oblique que sa combinaison sans géométrie restitue au sommet du passage et l'écart-type de bruit de code de cette estimation (sondage de l'ionosphère). Cela ajoute deux champs à chaque résultat <c2/> multibande ; aucun nombre existant ne change.

# text
# c1: leo-pvt
# c2: trace = true
seg-bdf333f4c978 = Le mode de synchronisation temporelle de <c1/> accepte <c2/> : chaque ligne rapporte alors son erreur de temps et son écart-type prédit à chaque époque, avec les mêmes tirages, de sorte que les statistiques des lignes sont inchangées et que l'exécution s'anime et s'enchaîne dans une campagne.

# text
# c1: docs/INTEROP.md
seg-eb4461740dc5 = Une campagne exporte maintenant chaque scénario membre qui a une géométrie (exécutions de phases, scénarios de base du balayage et de Monte Carlo, membres composés avec leurs valeurs partagées liées) comme son propre jeu de fichiers, l'étiquette du membre figurant dans le nom du fichier ; auparavant, une campagne n'exportait rien. Le tableau d'interopérabilité de <c1/> change en conséquence.

# text
# c1: system.2.sisre_m
seg-c0b1f4d9fed0 = Une clé de balayage de campagne peut indexer un tableau de tables par position (<c1/>).

# text
# c1: leo-resilience-multiband-diversity
# c2: leo-resilience-js-margin
# c3: leo-resilience-spoof-doppler
# c4: leo-resilience-spoof-monitors
# c5: leo-resilience-gnss-jammed-leo-carries
seg-4c995017dd9c = Scénarios de résilience : <c1/> (un brouillage en barrage de { "50" } MHz en bande L5 balayé en puissance : tous les signaux de la bande L tombent, les signaux LEO UHF, en bande S et en bande C gardent leur C/N0), <c2/> (marge J/S à partir de la puissance reçue : GPS L5, Galileo E5a et Xona X5 perdus à -105, -100 et -95 dBW, un signal LEO générique à -135 dBW poursuivant encore à -90 dBW), <c3/> (un saut de { "30" } m manqué par le test Doppler GNSS seul et détecté par le test sur tous les canaux { "105" } s après le début), <c4/> (quatre leurres contre les deux moniteurs) et <c5/> (GNSS brouillé, couche LEO en bandes S et C poursuivie, la surveillance autonome de l'intégrité par le récepteur sur la seule couche LEO donnant l'alarme à { "2" } époques sur { "30" }).

# text
# c1: leo-focus-ppp-altitude
# c2: leo-focus-ntn-bandwidth
# c3: leo-focus-iot-eirp
# c4: leo-focus-science-iono-sounding
# c5: leo-focus-data-services
# c6: leo-focus-indoor-uhf
# c7: leo-focus-fused-pnt-sisre
# c8: leo-resilience-multiband-diversity
seg-bae66dac04cc = Scénarios de domaines ciblés : <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (la résilience en L, S et C est <c8/>).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: leo-vertical-rail-maritime
# c3: leo-vertical-critical-infrastructure-timing
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-5g-network-timing
# c6: leo-vertical-asset-tracking-iot
# c7: docs/LEO-PNT.md
seg-c7947d9cc592 = Campagnes sectorielles, chacune animée et exportant ses passages LEO : <c1/>, <c2/> (les scénarios maritime et ferroviaire fournis plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Résultats en une ligne dans <c7/>.

# text
# c1: tests/leo_resilience_verticals.rs
seg-222ad0b777f8 = Trois lignes MODELLED de la matrice : le moniteur de leurrage par le Doppler et la géométrie du passage, le moniteur de leurrage entre bandes et le sondage de l'ionosphère. <c1/> vérifie les moniteurs (silencieux avant le début, la statistique Doppler quadratique en fonction d'un saut, le saut ionosphérique d'un leurre au sol et aucun pour un leurre conscient de l'ionosphère), l'identité du sondage, la trace de synchronisation temporelle par rapport aux statistiques des lignes, et que l'export d'une campagne est égal à celui de chacun de ses membres.

# text
# c1: leo-pass
# c2: docs/LEO-PASS.md
# c3: docs/LEO-PNT.md
seg-f650b42bf210 = La page <c1/> passe à <c2/> ; <c3/> est la vue d'ensemble.

# text
seg-00a4ba834f37 = <b>Scénarios maritimes, routiers et ferroviaires.</b> Cinq exemples fournis sur des types de scénario existants, de sorte que les navires, les véhicules routiers et les trains ont chacun un cas travaillé. Chaque chiffre est MODELLED ; aucun n'est validé par rapport à des données mesurées.

# text
# c1: scenarios/maritime-strait-jamming.toml
# c2: jamming
seg-682414bbe0c6 = <c1/> (<c2/>) : un brouilleur à large bande de { "50" } W sur un mât de { "30" } m, à { "30" } km en eau libre d'un navire. Le rapport brouilleur sur signal (J/S) moyen est d'environ { "48" } dB, et la disponibilité chute de { "1.00" } à { "0.00" }.

# text
# c1: scenarios/maritime-port-approach-coast.toml
# c2: ins-trn-coast
seg-4666dcd72c24 = <c1/> (<c2/>) : un système de navigation inertielle (INS) de qualité navigation à { "12" } nœuds, avec le GNSS perdu et sans aide. Il franchit { "10" } m après { "281" } s et { "100" } m après { "833" } s, les chiffres d'approche de port et d'eaux océaniques de la résolution A.1046({ "27" }) de l'Organisation maritime internationale (OMI), utilisés ici comme budgets.

# text
# c1: scenarios/maritime-spoof-position-push.toml
# c2: spoof-detect
seg-7407bb97aedd = <c1/> (<c2/>) : un leurre de +{ "2" } dB, non aligné sur la porteuse, qui pousse quatre satellites pour écarter un navire de { "500" } m. Le moniteur fusionné le détecte (score { "0.70" } pour un seuil de { "0.50" }) par la surveillance autonome de l'intégrité par le récepteur (RAIM) et la surveillance de la qualité du signal (SQM) ; la seule surveillance de puissance le manque.

# text
# c1: scenarios/automotive-urban-canyon.toml
# c2: gnss-ins
seg-1edc0541930b = <c1/> (<c2/>) : une voiture traversant un passage inférieur de { "15" } s et une panne de { "60" } s due à un brouilleur en bord de route, face à un budget d'une demi-voie de { "1.5" } m. L'erreur quadratique moyenne (RMS) fusionnée pendant la panne est de { "1.9" } m pour une unité micro-électromécanique (MEMS) de classe automobile et de { "0.7" } m pour un comparateur de qualité tactique ; en roue libre, l'unité MEMS dérive jusqu'à { "850.8" } m.

# text
# c1: scenarios/rail-tunnel-coast.toml
# c2: ins-trn-coast
# c3: kshana example
seg-f9830a49659f = <c1/> (<c2/>) : un INS de qualité tactique sur un train à { "160" } km/h dans un tunnel. Il franchit { "2" } m (discrimination de voie) après { "35.8" } s, à environ { "1.6" } km, et { "20" } m après { "107.3" } s. C'est de l'INS seul : le moteur n'a pas de modèle d'odomètre, c'est donc la borne pessimiste. Le nombre de fichiers de scénario du README passe de { "77" } à { "82" }. Les cinq sont fournis pour <c3/> et listés dans le bac à sable du navigateur.

# text
seg-77c8c53126fd = Serveur du Model Context Protocol

# text
seg-2deb4b35b41a = Le serveur du Model Context Protocol (MCP) atteint chaque type de scénario et chaque vue d'une exécution : sept nouveaux outils, quatorze au total.

# text
# c1: run_scenario
seg-7f4035dfd9db = <c1/> aiguillait déjà chaque type de scénario ; ce qui manquait à un agent, c'était un moyen d'obtenir un scénario valide d'un type de scénario, et les trois sorties que la ligne de commande écrit à côté d'un résultat. Nouveaux outils :

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: kshana example
# c4: scenarios/
# c5: lunar-llr-datum
seg-d9df5ab8817a = <c1/> et <c2/> servent les scénarios de référence fournis (le tableau <c3/>), chacun avec son type de scénario et la première phrase de son propre en-tête, octet pour octet le fichier sous <c4/>. Un scénario qui est dans le dépôt mais n'est pas fourni est refusé avec la raison. Chaque type de scénario sauf <c5/> (dont la tranche de données n'est livrée qu'avec le dépôt) a au moins un exemple.

# text
# c1: report_scenario
# c2: docs/REPORTS.md
seg-cb24ad7147ef = <c1/> renvoie le rapport de l'exécution en JSON (JavaScript Object Notation) ou comme page HTML (HyperText Markup Language) imprimable (<c2/>).

# text
# c1: animate_scenario
# c2: docs/ANIMATION.md
seg-9264b2f20e15 = <c1/> renvoie la série temporelle de l'exécution sous forme de dessin SVG (Scalable Vector Graphics) animé, de lecteur HTML ou d'images numérotées, après un résumé JSON de ce qui a été dessiné (<c2/>). Une réponse porte { "120" } images au plus ; la ligne de commande en écrit de n'importe quelle longueur.

# text
# c1: list_export_formats
# c2: export_interop
# c3: import_route
# c4: docs/INTEROP.md
# c5: .e
seg-959f23871238 = <c1/>, <c2/> et <c3/> servent les exports d'interopérabilité et l'import de parcours GeoJSON (<c4/>) : CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, l'éphéméride STK (Systems Tool Kit) <c5/> et SigMF (Signal Metadata Format), avec un index JSON des fichiers (suffixe, taille et SHA-256, l'empreinte Secure Hash Algorithm sur 256 bits) et le fichier binaire d'échantillons SigMF en base64.

# text
# c1: bundled-scenarios
# c2: kshana::bundled_scenarios
# c3: --study
# c4: web/
seg-9ec3f9639b8c = La bibliothèque gagne une fonctionnalité <c1/> désactivée par défaut qui expose la table des scénarios de référence sous le nom <c2/> ; seul le serveur MCP l'active, de sorte que la roue Python et le module WebAssembly ne portent toujours pas le texte des scénarios. Les suites d'étude (<c3/>) restent réservées à la ligne de commande, parce qu'une suite nomme des fichiers sur disque et que le serveur n'en lit aucun. Les tests d'aller-retour exécutent chaque nouvel outil sur des scénarios fournis et vérifient les nombres du moteur : spectre, système solaire, constellations autour de la Lune et d'Europe, balayage de campagne, et les types de scénario de signal, de passage, de message de navigation, de positionnement fusionné, de positionnement précis par point, de réseau non terrestre et de bout en bout en orbite terrestre basse (LEO). Chaque surface qui indique le nombre d'outils MCP ou liste les outils dit maintenant quatorze, sauf la page du bac à sable sous <c4/>, qui est remplacée par le site.

# text
seg-c11823028688 = kshana.dev, Kshana Studio et le README

# text
# c1: docs/
# c2: /#playground
# c3: /#ledger
# c4: /#s=<scenario>
# c5: /?embed=1&…
seg-fb584cf84218 = <b>Un kshana.dev repensé.</b> La page unique du bac à sable est remplacée par un site à plusieurs pages : Home, Missions, Capabilities, Evidence, Developers, Editions et Docs, avec Kshana Studio à un clic. Chaque graphique, carte et nombre qui s'y trouve est une exécution enregistrée du moteur de cette version, avec le scénario et un lien qui rouvre la même exécution dans le Studio ; la construction du site refuse un enregistrement fait par un autre commit du moteur. Les pages de documentation sont générées à partir du <c1/> du dépôt, et les options d'installation à partir de ses canaux. Les polices et les bibliothèques de scripts sont servies par kshana.dev lui-même, de sorte qu'aucune page ne demande quoi que ce soit à un hôte tiers. Les anciennes adresses (<c2/>, <c3/>, liens de partage <c4/>, liens d'intégration <c5/> et le reste) redirigent vers leur nouvel emplacement, et une adresse inconnue obtient une page { "404" }.

# text
# c1: ?scenario=…&tab=…
seg-9fa1c542332b = <b>Kshana Studio, un tableau de bord pour chaque capacité.</b> Le Studio s'ouvre sur un écran de départ avec des tuiles de domaines et de bonnes premières exécutions, puis fait passer une exécution par cinq étapes numérotées : Choisir un scénario, Régler ses paramètres, Exécuter le moteur en local dans le navigateur, Lire les résultats (les chiffres clés d'abord, chacun avec une pastille PASS ou FAIL lorsque l'exécution énonce un seuil, puis les panneaux) et Partager ou exporter. Une seule zone de recherche trouve les scénarios, les domaines et les champs qu'ils contiennent et saute vers le contrôle ; les exécutions peuvent être épinglées et comparées ; un fil d'Ariane indique où vous êtes ; sur un téléphone, les étapes deviennent une barre d'étapes. Chaque type de scénario a sa vue, y compris la cascade du spectre, le système solaire, la couverture des constellations, les campagnes, l'animation, le rapport d'exécution, les exports d'interopérabilité et la chaîne en orbite terrestre basse. Un lien profond (<c1/>) ouvre la même exécution sur le panneau nommé.

# text
seg-dcf2788bb430 = <b>Recherche et citation.</b> La page Evidence liste les cinq articles Kshana sur arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } et { "2607.06212" }), chacun avec un résumé, une figure calculée par ce moteur, la commande qui la reproduit, un lien vers le Studio et le BibTeX, à côté de la manière de citer le logiciel. Le README gagne la même section Research.

# text
seg-fab395bab130 = Une page publique pour Kshana Pro.

# text
# c1: docs/PRO.md
seg-167a59e94101 = <c1/> et la page Editions du site disent ce que la surcouche propriétaire Pro ajoute au même moteur (optimiseur de conception, incertitude et sensibilité, dossier de mission, veille de campagne, coexistence de spectre, service de tâches sur site, traçabilité des exigences), ce que chacune produit et ce qu'elle ne fait pas. Chaque chiffre Pro que le site montre est énoncé dans cette page publique. Pro n'ajoute aucun modèle physique, et le moteur ouvert reste entier et gratuit.

# text
# c1: tools/gen_readme_assets.py
# c2: tools/capture_studio_shots.mjs
# c3: docs/
seg-f57f0a610943 = <b>Un README réécrit.</b> Des sections courtes, une image par section, la marque Kshana, deux rangées de badges, des images générées d'architecture, de flux de scénario, de chaîne en orbite terrestre basse et de vérification (<c1/>, qui échoue sur une image périmée), et des captures d'écran du Studio prises sur le Studio en cours d'exécution par <c2/>. Les README de crates.io, PyPI, npm et du serveur MCP suivent la même conception. Le matériel de référence long est replié ou déplacé vers <c3/>.

# text
# c1: <scenario>.report.html
# c2: wrote …
# c3: <scenario>.report.json
# c4: RunOutput::html_report()
# c5: OracleKind::modelled_reason()
# c6: docs/MODELLED-RATIONALE.md
seg-e06522ca762e = <b><c1/> est maintenant le rapport d'exécution avancé</b> décrit sous Added, et la ligne <c2/> de la CLI nomme aussi <c3/>. La fiche de synthèse d'une page qu'il a remplacée est inchangée sous le nom <c4/>, que les liaisons Python et WebAssembly renvoient toujours. <c5/> expose la phrase que <c6/> imprime pour chaque ligne MODELLED ; ce document est inchangé.

# text
# c1: result.json
# c2: report.json
seg-77a6f35c5c9a = <b>Le README dit sur quoi Kshana Pro s'appuie.</b> La section Editions et la ligne Kshana Pro sous « Support & professional services » indiquent maintenant ce que fait l'outillage d'ingénierie des systèmes fondée sur les modèles (MBSE) et de programme de Pro et lesquelles des sorties publiées du moteur ouvert il lit (le <c1/> et le <c2/> de chaque exécution, le fichier de scénario, le schéma des unités de champ et les étiquettes de la matrice de vérification), et sur quoi reposent dans le moteur ouvert les jumeaux numériques d'horloge, les études d'arbitrage et les paquets de preuves. Reformulation seulement : aucune sortie du moteur et aucun nombre publié ne change.

# text
# c1: navsignal::Modulation
# c2: Mboc
# c3: ephemeris
# c4: gcrs_r_m
# c5: gcrs_v_m_s
seg-1a19675ffa3b = <b>Compatibilité.</b> L'énumération publique <c1/> gagne une variante <c2/>, ce qui est un changement incompatible pour un appelant qui la traite de façon exhaustive. Les colonnes <c4/> et <c5/> du type de scénario <c3/> changent (voir « Révisions de chiffres publiés »). Une exécution est toujours reproduite par la version du moteur qui l'a faite.

# text
# c1: export_table_csv
# c2: telecom-timing
# c3: leo-navmsg
# c4: encode-decode
# c5: kepler16
# c6: kepler-rac
seg-e7c5f77a6602 = <b><c1/> sur le serveur MCP nommait quatre types de scénario comme les seuls ayant un tableau CSV (valeurs séparées par des virgules) ; six en publient un.</b> L'outil renvoyait toujours le tableau pour <c2/> et pour <c3/> (son analyse <c4/> sur un modèle de message <c5/> ou <c6/>), mais sa description, son message de refus et les documents qui listent les types de scénario omettaient les deux, de sorte qu'un agent apprenait à ne pas le demander. Ils sont nommés maintenant, et un test d'aller-retour récupère les deux tableaux.

# text
seg-4094f58a5f4b = La trame du message de navigation en orbite terrestre basse (LEO) n'avait pas les mêmes octets sur toutes les plateformes, ni dans tous les builds d'une même plateforme.

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
# c2: 0x110315
# c3: 0x898BD8
# c4: 0x6A82D9
# c5: leo-navmsg-celeste-iod.toml
# c6: 0x6EDB2D
# c7: 0xC6E4F0
seg-5191262de022 = <c1/> encodait une trame avec le contrôle de redondance cyclique <c2/> dans le build de publication sur aarch64 macOS, <c3/> dans un build de débogage de la même source sur la même machine, et <c4/> dans le build WebAssembly (WASM) ; <c5/> donnait <c6/> en natif contre <c7/> dans le navigateur. Trois causes, chacune remontée jusqu'à la première valeur divergente :

# text
# c1: truth::state_to_elements
# c2: acos
# c3: atan2
seg-f6501c3cd89d = <em>Entre plateformes.</em> L'orbite de vérité était identique au bit près sur les deux ; le point de départ de l'ajustement ne l'était pas. <c1/> prend l'inclinaison osculatrice d'un <c2/> et l'argument du périgée d'un <c3/>, et les deux bibliothèques mathématiques les arrondissent différemment à la dernière place (sur { "20 000" } arguments, elles diffèrent pour { "781" } sinus, { "858" } cosinus, { "1 931" } exponentielles et { "1 899" } arctangentes à deux arguments).

# text
# c1: sin
seg-cd6f05096b8b = <em>Entre profils de build.</em> Un build optimisé sur macOS fusionne un sinus et un cosinus d'un même argument en un seul appel à la routine combinée du système, et son sinus n'est pas celui du <c1/> isolé pour { "379" } arguments sur { "200 000" } ; un build non optimisé fait les deux appels. Le type de scénario prend un sinus et un cosinus ensemble à treize endroits.

# text
# c1: rand_distr
# c2: exp
# c3: ln
seg-91b0700dcb30 = <em>Dans l'horloge.</em> L'échantillonneur normal de <c1/> appelle les fonctions <c2/> et <c3/> de l'hôte dans ses deux branches rares : sur quatre millions de tirages à graine fixe, trois différaient au dernier bit entre le build natif et le build WASM.

# text
# c1: src/portable_math.rs
# c2: libm
# c3: Cargo.toml
# c4: leo_navmsg::{truth, fit, elements, codec, sisre, services}
# c5: f64::powi
# c6: portable_math::standard_normal
# c7: _portable
# c8: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c9: the_kind_never_calls_the_host_mathematics_library
# c10: rand_distr
# c11: leo-navmsg
# c12: leo-navmsg
# c13: leo-navmsg
# c14: navmsg
# c15: leo-pnt-chain
# c16: docs/LEO-NAVMSG.md
# c17: 0x110315
# c18: 0x19105F
seg-0a4724333429 = L'ajustement de Levenberg–Marquardt, qui sur cet arc s'arrête à sa limite de 80 itérations et non à un minimum, transporte une unité de dernière place dans des champs quantifiés différents. Le type de scénario calcule maintenant chaque fonction transcendante par le nouveau <c1/>, qui appelle le crate <c2/> en Rust pur (déjà dans l'arbre des dépendances, maintenant nommé dans <c3/>), compilé à partir d'une source unique pour chaque cible et non un appel de bibliothèque que l'optimiseur réécrit : <c4/> et le code du scénario. Les puissances entières sur ce chemin sont écrites en carré-et-multiplication, parce que <c5/> a une précision non spécifiée, et l'horloge de vérité tire ses écarts normaux de <c6/> (méthode polaire de Marsaglia sur la sortie brute du générateur). Les routines partagées que l'orbite de vérité intègre sont écrites une seule fois, génériques sur la bibliothèque mathématique, avec un point d'entrée <c7/> interne au crate à côté de l'existant : l'accélération en harmoniques sphériques, les accélérations zonales et de traînée, les taux séculaires de J2 et le retard de Klobuchar. Les points d'entrée existants sont inchangés jusqu'au dernier bit, de sorte que le nombre d'aucun autre type de scénario ne bouge. <c8/> fixe la trame entière de 171 octets et une valeur de contrôle par modèle d'éphéméride, dans le profil de test ordinaire (non optimisé), sur chaque plateforme et sans barrière d'hôte de référence ; <c9/> lit les sources du type de scénario sur disque et échoue sur un appel transcendant natif, sur un échantillonneur <c10/>, ou sur un appel dans un module qui n'a pas été relu. Après le changement, un build de débogage, un build de publication et le build WASM produisent des documents de résultat identiques octet pour octet pour les cinq scénarios <c11/>. <b>Cela déplace des nombres, consignés ici comme une révision.</b> Le type de scénario <c12/> est nouveau dans cette version, donc rien de ce qui a été publié dans une version antérieure ne bouge, mais chaque chiffre de <c13/> bouge, en natif et dans le build WASM, et l'étape <c14/> de <c15/> avec lui : les chiffres d'orbite parce que l'ajustement part maintenant des éléments portables, les chiffres d'horloge parce que l'horloge de vérité est une réalisation différente du même processus. <c16/> est régénéré à partir des nouveaux résultats ; sa valeur de contrôle publiée pour le scénario d'encodage et de décodage était <c17/> et est <c18/> (position à { "1.126" } mm du message exact là où elle était à { "0.665" } mm, horloge à { "0.185" } mm là où elle était à { "0.451" } mm). L'ampleur des changements dans les chiffres sous le millimètre est la sensibilité de l'ajustement, et non une erreur dans l'un ou l'autre jeu : l'ajustement est inchangé et s'arrête toujours à sa limite d'itérations.

# text
seg-c30f4cef4797 = Le rééchantillonnage à graine fixe tirait des indices différents sur une cible 32 bits.

# text
# c1: Rng::gen_range
# c2: usize
# c3: eval_stats
# c4: bootstrap_ci
# c5: bootstrap_auc_ci
# c6: impairment_ml
# c7: impairment_study
# c8: portable_math::uniform_index
# c9: u64
# c10: quantum-anomaly-detect
# c11: quantum_auc_ci
# c12: trade.foms[0].ci95
# c13: [0.9901265, 0.9938305]
# c14: [0.99035875, 0.993861]
seg-2bf668e23ec1 = <c1/> sur <c2/> prend { "64" } bits du générateur sur un hôte 64 bits et { "32" } bits sur un hôte 32 bits, de sorte que la même graine donnait d'autres indices, et laissait le flux ailleurs, dans le build WASM. Trois endroits tiraient ainsi : les bootstraps de percentiles dans <c3/> (<c4/>, <c5/>), le brassage avant chaque passe d'entraînement dans <c6/>, et le test de permutation dans <c7/>. Ils tirent maintenant par <c8/>, qui échantillonne toujours comme <c9/> : exactement ce que faisait un hôte 64 bits, de sorte qu'aucun nombre natif ne bouge. <b>Cela déplace des nombres publiés du paquet WASM, consignés ici comme une révision :</b> l'intervalle bootstrap <c10/> de l'aire sous la courbe (<c11/>, <c12/>) était <c13/> dans le navigateur et est maintenant l'intervalle natif <c14/>.

# text
# c1: /
# c2: Pulsar inclined/S1-0163
# c3: --export stk
# c4: -
# c5: _
seg-80f783da1d4f = <b>Noms de fichiers d'éphémérides STK à partir des identifiants de mobiles.</b> Un identifiant de mobile contenant un <c1/> ou une espace (une couche de constellation et un satellite, <c2/>) faisait paniquer la CLI sur <c3/> ; chaque identifiant passe maintenant par une partie de fichier sûre (lettres, chiffres, <c4/>, <c5/>).

# text
seg-a0dc5729d5e9 = <b>Le signe de la nutation TEME→GCRS</b>, décrit sous « Révisions de chiffres publiés » plus haut parce qu'il déplace une sortie publiée.

# text
# c1: slot-timing
# c2: src/slot_timing.rs
# c3: slot-timing-ocxo-leo
# c4: docs/SLOT-TIMING.md
seg-5ecbf0787f39 = <b>Type de scénario <c1/></b> (<c2/>) : le nombre de secondes avant qu'une horloge libre ne sorte de la garde d'un créneau de routage ou de tâche indexé sur le temps, chaque terme contributeur à ce moment avec le terme dominant nommé, le temps restant depuis le dernier point, et le plus grand intervalle entre points qui garde l'horloge à l'intérieur, net de la latence du point. L'horloge vient d'une valeur par défaut de classe, d'un préréglage de fiche technique telecom-timing, d'une fiche technique en ligne (maxima de l'écart-type d'Allan, vieillissement, coefficient de température) ou d'un enregistrement de phase mesuré. Un dépassement au-delà du plus long temps de moyennage que la source prend en charge est signalé comme extrapolé. Exemple fourni : <c3/>. Voir <c4/>.

# text
# c1: slot_timing::fit_weighted
seg-40dd4c16b760 = <b>Plancher de bruit rouge mesuré.</b> L'écart-type d'Allan chevauchant d'un enregistrement de phase est ajusté par moindres carrés pondérés dans la base de modulation de fréquence à phase blanche et IEEE Std { "1139" } (<c1/>), chaque point étant pondéré par ses degrés de liberté équivalents, de sorte qu'une réponse de holdover peut reposer sur le plancher propre de l'horloge plutôt que sur l'hypothèse de classe. Un ajustement non pondéré plaçait un faux plancher de scintillation sur un enregistrement de test à bruit blanc et raccourcissait de { "30" } % un dépassement à { "2 000" } s.

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: realdata-clock
seg-22c09748488b = <b>Validation sur jeu réservé de l'inversion du holdover sur une horloge réelle</b> (<c1/>) : ajustés sur le premier tiers de l'enregistrement césium 5071A contre maser à hydrogène, les dépassements prédits à un écart-type pour six seuils de { "0.5" } à { "2.5" } ns tombent entre { "0.84" } et { "1.03" } des dépassements mesurés sur les deux autres tiers, pour un seuil de { "1.5" } fixé avant la première exécution du test. Un témoin (l'écart-type d'Allan à une seconde lu comme du bruit blanc) manque d'un facteur d'environ { "1 000" } et échoue au seuil. Nouvelle ligne VALIDATED du registre ; le workflow <c2/> l'exécute maintenant.

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: scripts/fetch_ocxo.sh
# c3: fix_frequency_sigma
seg-cd73dc87a22f = <b>La même prédiction sur un oscillateur à quartz réel</b> (<c1/>, <c2/>) : sur un oscillateur à quartz thermostaté mesuré, la prédiction sur jeu réservé est prudente, à { "0.59" } à { "0.70" } du dépassement mesuré et jamais plus tard, et le plus souvent hors du seuil de { "1.5" }, parce que le plancher de bruit de cet oscillateur a diminué de moitié pendant l'enregistrement de 5,5 heures ; ajustée sur l'échantillon, elle tombe entre { "0.98" } et { "1.17" }. Le cas du quartz n'est pas validé et reste MODELLED. L'exécution a aussi mis au jour un terme manquant : la fréquence d'un quartz dérive, de sorte que le modèle porte maintenant l'incertitude de la fréquence connue au point (<c3/>) ; sans lui, la prédiction était optimiste jusqu'à { "2.5" }×.

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-8519979d184c = <b>La même prédiction sur des horloges atomiques en orbite</b> (<c1/>, <c2/>) : { "14" } jours d'horloges finales de l'International GNSS Service pour les satellites GPS Block IIF, avec le protocole écrit avant le téléchargement des données. Huit satellites sur dix tombent dans le seuil de { "1.5" } ; G25 et G30 prédisent des dépassements jusqu'à environ deux fois plus tardifs que mesurés. Le protocole exige que chaque satellite réussisse, de sorte que le cas orbital n'est pas validé et reste MODELLED ; le résultat est fixé.

# text
# c1: ClockClass::Tcxo
# c2: Ocxo
# c3: Rafs
# c4: ClockClass::source
# c5: ClockClass::ALL
# c6: id
# c7: from_id
# c8: quantum-trade
# c9: baseline_clock_class
seg-0d666a725b77 = <b>Classes d'horloge à quartz compensé en température (TCXO), à quartz thermostaté (OCXO) et à étalon de fréquence atomique au rubidium (RAFS)</b> (<c1/>, <c2/>, <c3/>), les composants qu'embarque un bus de petit satellite commercial ou une passerelle au sol, chacun citant une fiche technique publique (<c4/>). <c5/>, <c6/> et <c7/> ajoutés. Le <c9/> de <c8/> accepte les trois nouveaux identifiants. Ajouter des variantes à une énumération publique est un changement incompatible pour un appelant qui la traite de façon exhaustive.

# text
# c1: src/orbital_timing.rs
# c2: slot-timing
# c3: spoofing
# c4: tpl::timing_protection_level_ns
seg-24ae82b115f5 = <b>Niveau de protection de la synchronisation temporelle pour un récepteur en orbite</b> (<c1/>, la section <c3/> facultative du type de scénario <c2/>) : combien de temps un leurre au sol peut atteindre un satellite en orbite terrestre basse par passage, le déphasage qu'un leurre à une vitesse de rampe maximale indiquée accumule avant que le satellite ne quitte sa portée ou qu'un contrôle indépendant ne s'exécute, et si chaque contrôle de contact au sol ou de liaison croisée est indépendant de ce leurre. Se réduit exactement à <c4/> pour une horloge sans bruit de scintillation, de phase blanche ou de marche aléatoire. MODELLED.

# text
# c1: docs/SLOT-TIMING.md
# c2: docs/DECEIVED-TIME.md
# c3: docs/DEPLOYMENT-TARGETS.md
# c4: no_std
seg-4032bc03fad5 = <b>Trois notes</b> : <c1/> (y compris la mesure de dérive d'après laquelle un créneau devrait être accepté : l'erreur de temps absolue maximale, et non l'erreur d'intervalle de temps maximale ni la déviation temporelle, et pourquoi), <c2/> (une commande signée appliquée à un temps trompé s'aiguille quand même mal) et <c3/> (où Kshana s'exécute ; aucun cœur de vol <c4/> n'est proposé).

# text
# c1: kshana
# c2: kshana-mcp
seg-712035e19515 = La version { "v0.27.3" } a atteint crates.io (<c1/> et <c2/>) et PyPI, puis s'est arrêtée à npm, de sorte que npm, l'image MCP ghcr.io, le registre MCP, le JetBrains Marketplace et kshana.dev ne l'ont jamais reçue. { "0.27.4" } porte le même moteur, avec la correction de publication ci-dessous, vers tous les canaux.

# text
# c1: npm-dist/kshana-0.27.3.tgz
# c2: owner/repo
# c3: github.com/npm-dist/kshana-0.27.3.tgz
# c4: ./npm-dist/*.tgz
seg-bab8d4d1bc54 = <b>L'étape de publication npm nomme l'archive par un chemin explicite.</b> npm lit un <c1/> nu comme le raccourci GitHub <c2/>, de sorte que la tâche npm de { "v0.27.3" } a tenté de cloner <c3/> et a échoué avec « Permission denied (publickey) ». L'archive elle-même avait été construite et attestée. L'étape publie maintenant <c4/>. Tout ce qui suit npm dans l'ordre de publication (l'image MCP, le plugin JetBrains, la vérification de parité des canaux et le site) a été sauté, comme prévu.

# text
# c1: gnss-ins
seg-f9a112755eb1 = <b>Les catalogues d'unités de telecom-timing et de <c1/> sont exemptés de la détection de copier-coller</b>, selon la même politique et le même test de justification que les autres catalogues. Le portail de qualité SonarCloud était passé au rouge sur la duplication du nouveau code ({ "4.0" }% contre { "3" }%), et chaque bloc dupliqué était une ligne d'unités ou une entrée de masque ITU-T.

# text
# c1: scenarios/small-uas-jammed-nav.toml
# c2: jamming-demo.toml
# c3: kshana example small-uas-jammed-nav
seg-3c3dacae06d6 = <b><c1/> : combien de temps la navigation d'un petit drone tient après le brouillage du GNSS.</b> Il exécute une centrale inertielle micro-électromécanique (MEMS) de classe contrôleur de vol, une Bosch BMI088, face à une unité de qualité tactique. Le signal GNSS (Global Navigation Satellite System) est nominal pendant { "100" } s, puis refusé pendant { "60" } s (<c2/> montre pourquoi un brouilleur proche fait cela). Les biais de la BMI088 sont les résidus laissés après l'étalonnage de démarrage, tirés des coefficients de température de sa fiche technique (BST-BMI088-DS000-19 rév. { "1.9" }) : { "0.015" } °/s par K pour le gyroscope et < { "0.2" } mg par K pour l'accéléromètre. Deux hypothèses sont signalées dans le fichier : un échauffement de { "10" } K après l'étalonnage, et un réchauffement continu de { "1" } K par minute en vol. La dérive en vol est l'erreur que le filtre ne peut pas apprendre avant le début du brouillage, et c'est elle qui met fin à la navigation à l'estime. Chaque chiffre est modélisé ; le valider demanderait des journaux de vol dans un environnement brouillé. <c3/> l'imprime.

# text
# c1: gnss-ins
# c2: [imu_quantum.filter_prior]
# c3: [imu_classical.filter_prior]
# c4: sigma_accel_bias
# c5: sigma_gyro_bias
seg-7154f69a2b8a = <b>Chaque capteur <c1/> peut fixer sa propre loi a priori du filtre</b> (<c2/> ou <c3/>, avec <c4/> et <c5/>). La valeur par défaut est inchangée, de sorte que chaque scénario existant donne le même résultat. Le biais de gyroscope résiduel d'une unité grand public se situe à environ { "26" } écarts-types hors de la valeur par défaut de qualité tactique, où le filtre ne l'apprendrait jamais. Une loi a priori qui n'est pas finie et positive est rejetée, et le résultat reprend la loi a priori lorsqu'une est fixée.

# text
# c1: kshana example [<name>]
# c2: cargo install kshana
# c3: scenarios/
# c4: scenarios/
# c5: src/bundled_scenarios.rs
# c6: kshana example
# c7: kshana example clock-holdover > clock-holdover.toml
# c8: lunar-llr-datum
# c9: quantum-pnt-demonstrator.suite
# c10: --study
# c11: tests/cli_first_run.rs
seg-2b54735b19aa = <b><c1/> donne à un utilisateur du registre un scénario à exécuter.</b> Un utilisateur de <c2/> a l'exécutable et aucun répertoire <c3/>, de sorte que la première commande que donnait chaque guide de démarrage échouait. L'interface en ligne de commande (CLI) embarque maintenant les { "75" } scénarios de référence qui s'exécutent seuls, octet pour octet, compilés à partir de <c4/> (<c5/> ; la table se trouve dans le binaire de la CLI, de sorte que la roue Python et le module WebAssembly ne grossissent pas). <c6/> les liste ; <c7/> en écrit un. Les deux autres fichiers sont réservés au dépôt : <c8/> lit des données archivées de télémétrie laser lunaire qui ne sont livrées qu'avec le dépôt, et <c9/> est un manifeste d'étude qui exécute trois fichiers voisins avec <c10/>. En demander un dit pourquoi et sort avec { "2" } au lieu d'imprimer quelque chose qui ne peut pas s'exécuter seul. <c11/> tient la table alignée sur le répertoire dans les deux sens, de sorte qu'un nouveau fichier de scénario qui n'est ni fourni ni nommé réservé au dépôt échoue.

# text
# c1: figure_tiers
# c2: quantum.fom.timing_p95_ns
# c3: src/verification.rs
# c4: src/fom_label.rs
# c5: hybrid
# c6: fusion
# c7: untiered
# c8: tests/registry_golden.rs
# c9: tests/cross_platform_golden.rs
seg-43249b6a1f3c = <b>Chaque figure de mérite d'un résultat d'horloge, d'orbite, hybride ou de fusion dit maintenant si elle est VALIDATED ou MODELLED, dans le résultat lui-même.</b> Le document de résultat gagne un bloc <c1/>, toujours sa dernière clé. Il liste chaque chiffre rapporté (par exemple <c2/>) avec son niveau — VALIDATED signifie vérifié par rapport à une référence externe indépendante, MODELLED signifie un modèle issu des premiers principes qui est testé en interne — et la ligne de la matrice de vérification d'où le niveau est lu. Le niveau vient de <c3/> par <c4/>, de sorte qu'il n'y a pas de seconde table qui puisse diverger. Auparavant, les mots « validé » et « modélisé » apparaissaient zéro fois dans un résultat de holdover d'horloge, et un lecteur du JSON (JavaScript Object Notation) brut n'avait aucun moyen de distinguer les deux. Les chiffres de position <c5/> et <c6/> n'ont aucune ligne de matrice propriétaire, ils sont donc listés sous <c7/> au lieu de recevoir un niveau. Le bloc ne porte aucun nombre. Il est prouvé additif, et non supposé : le retirer redonne le document d'avant le changement octet pour octet, pour les cinq types de scénario (un test du moteur), et les deux bancs de référence (<c8/>, <c9/>) retirent maintenant exactement cette clé, et seulement lorsqu'elle est la dernière, puis hachent le reste par rapport à leurs constantes figées <b>inchangées</b>. Une liste dans chaque banc fixe quels scénarios doivent porter le bloc, de sorte que l'exclusion ne peut pas s'élargir discrètement.

# text
# c1: telecom-timing
# c2: docs/TELECOM-TIMING.md
seg-8faf1981d797 = <b>Un type de scénario <c1/> répond dans les unités d'un ingénieur de synchronisation : erreur de temps, erreur d'intervalle de temps maximale (MTIE) et déviation temporelle (TDEV), chacune avec un PASS ou un FAIL et une marge par rapport aux masques du Secteur de la normalisation des télécommunications de l'Union internationale des télécommunications (UIT-T).</b> Les masques sont transcrits des éditions en vigueur : G.8272 (07/2025) pour les classes A et B de l'horloge de référence de temps primaire (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) pour la PRTC améliorée en mode verrouillé et en holdover (y compris son enveloppe d'erreur de temps, qui monte de { "30" } ns à { "100" } ns sur une période de holdover fixée par la durée pendant laquelle l'horloge a été verrouillée), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) pour les horloges de frontière et d'esclave de temps de télécommunications, classes A à D, et G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) pour les limites du réseau au point de référence C. Chaque entrée que ces Recommandations laissent « à l'étude » est absente, non estimée, et <c2/> liste chaque nombre avec son tableau ou son paragraphe et chaque élément qui a été laissé de côté. Le rapport donne aussi le temps de dépassement de chaque budget d'erreur de temps : par défaut le holdover ePRTC par défaut de { "100" } ns, une allocation de holdover réseau de { "400" } ns, la limite du point C de { "1 100" } ns et l'exigence de bout en bout de classe { "4" } de { "1.5" } microseconde.

# text
# c1: [time_s, time_error_ns]
seg-9e5325e1b0ca = L'entrée est soit un holdover synthétique, soit une série qui vous appartient. Le holdover synthétique utilise l'un de quatre préréglages d'oscillateur (un oscillateur à quartz thermostaté, un étalon au rubidium, un étalon au césium et une horloge atomique à l'échelle d'une puce), chacun portant les chiffres de stabilité, de vieillissement et de température d'une fiche technique Microchip nommée. La façon dont ces chiffres deviennent un bruit de fréquence blanc, de scintillation et de marche aléatoire, un vieillissement et un terme de température est énoncée dans chaque rapport et étiquetée MODELLED. Une série qui vous appartient est faite de paires <c1/>, en ligne (c'est ainsi qu'elle s'exécute dans le navigateur) ou, sur les builds natifs, d'un fichier de valeurs séparées par des virgules. Le tableau MTIE/TDEV, avec la limite de chaque masque choisi à côté, est écrit comme artefact CSV de l'exécution.

# text
# c1: scenarios/telecom-prtc-holdover-24h.toml
# c2: scenarios/telecom-tie-ingest.toml
seg-a23a96819dee = <c1/> est un holdover au rubidium de 24 heures avec vieillissement, scintillation et un cycle de température quotidien : son erreur de temps la plus grande est de { "603.2" } ns, il franchit { "100" } ns { "8 206" } s après la perte et reste sous { "1.5" } microseconde toute la journée, et il échoue à l'enveloppe de holdover de la PRTC améliorée, comme le doit une horloge qui n'est pas de classe césium. <c2/> montre l'entrée en ligne. Le MTIE et le TDEV que le type de scénario rapporte sont vérifiés par rapport au paquet allantools sur une série de holdover de { "2" } 048 échantillons versionnée dans le dépôt, exactement pour le MTIE et à { "1.1e-15" } près pour le TDEV, de sorte que la matrice gagne une ligne VALIDATED et deux lignes MODELLED (la transcription des masques et les préréglages) et en compte maintenant <b>{ "171" } lignes — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. La couverture des unités de champ passe de { "60" } types de scénario sur { "61" } à { "61" } sur { "62" }, et de { "1,742" } à { "1,788" } champs décrits. Le type de scénario est nouveau et additif : aucun scénario, aucune épingle et aucun chiffre publié existants ne bouge.

# text
seg-5bb1ad9a34ec = Le bac à sable exécute le moteur dans un Web Worker en arrière-plan, de sorte qu'un scénario lent ne fige plus la page.

# text
# c1: web/engine-worker.mjs
# c2: web/engine.mjs
# c3: cislunar-arc-recovery
seg-b1ab3546f131 = <c1/> héberge le moteur WebAssembly et <c2/> lui transmet chaque exécution de scénario — exécutions, balayages de paramètres et exports SP3 / OMM / OEM / CSV. Une exécution qui dépasse { "150" } ms affiche un état occupé (Run désactivé, « Running… N s ») et un bouton Cancel qui termine et relance le worker ; un navigateur qui ne peut pas démarrer un worker de module se rabat sur l'ancien chemin du fil principal. <c3/>, retiré du catalogue parce qu'il figeait la page, y est de retour, étiqueté comme lent : il prend environ { "13" } s dans Chrome (quatre appels du moteur d'environ { "3" } s chacun), pendant lesquelles la page reste réactive.

# text
# c1: cislunar-observability
seg-146200dfac7e = <b>Chaque grandeur rapportée par <c1/> porte maintenant une unité, une classe de provenance et une définition — l'avant-dernier type de scénario de la liste d'exemption à l'échelle du crate.</b> Les { "41" } champs numériques du document RELEASED sont décrits, de sorte que la couverture des unités de champ passe de { "59" } types de scénario sur { "61" } à { "60" } sur { "61" } et de { "1,698" } à { "1,742" } champs décrits, l'arriéré sans définition restant inchangé à { "239" }.

# text
# c1: units
# c2: units
# c3: expect_summary
seg-61b1219ae0e3 = Cela était bloqué par l'épingle qui fige le document publié, laquelle nommait <c1/> comme une clé que le document ne devait jamais gagner. En ajouter une aurait supposé de supprimer cette assertion et de rebaser trois hachages dans trois fichiers — une forme indiscernable d'une dissimulation de régression. À la place, les deux épingles qui mesurent ce document <em>prouvent</em> maintenant que l'ajout est additif : chacune retire de nouveau le bloc <c2/> et re-hache par rapport à la constante figée avant l'existence du bloc, et <b>les deux constantes sont inchangées</b>. Une mutation confirme que la garantie est réelle — déplacez une valeur publiée et rebasez le hachage du document entier comme le ferait une correction négligente, et le retrait suivi du re-hachage échoue encore. La troisième épingle, dans le banc générique registry-golden, est rebasée au même titre que les six sœurs qui l'ont été exactement pour cette raison, et son littéral <c3/> porteur de valeurs ne bouge pas.

# text
# c1: realtime-frame-eop
seg-a73409e0b664 = <c1/> rapporte par rapport à quelle vérité chaque ligne d'orientation de la Terre a été évaluée, et à quelle fréquence le repli s'est déclenché.

# text
# c1: table3_joint_eop[].{ut1, polar_motion,combined}
# c2: truth_source
# c3: truth_fallback_rows
# c4: final
# c5: dN
# c6: truth_pm()
# c7: truth_ut1()
seg-6e0493a39f1a = <c1/> gagnent <c2/> et <c3/>. Le plancher <c4/> est évalué par rapport au Bulletin B final et ne peut utiliser que les époques qui en publient un ; chaque ligne <c5/> est évaluée par rapport à <c6/>/<c7/>, qui se replient sur la valeur rapide du Bulletin A. Sur l'extrait { "2026" } fourni, cela représente { "12" } échantillons sur { "31" } à un jour, contre { "0" } au plancher — de sorte que la ligne du plancher et les lignes de prédiction à côté reposent sur une vérité mesurablement différente, ce que le rapport énonce maintenant au lieu de le laisser se déduire d'un nombre d'échantillons qui monte là où des horizons emboîtés disent que cela ne se peut pas.

# text
# c1: moonlight-service-volume
seg-7ba5be07fa8c = <c1/> émet une référence de base képlérienne de même taille.

# text
# c1: ephemeris_comparison.keplerian_matched
# c2: 360k/n
seg-f9dc8fae6452 = <c1/> réexécute la constellation illustrative au nombre de satellites propre à l'ensemble RETRIEVED, présent seulement lorsque les nombres diffèrent. Le nombre fait partie de la géométrie de cette conception — l'AD du nœud ascendant (RAAN) et l'anomalie moyenne sont toutes deux réparties comme <c2/> — de sorte que sans lui, un ensemble récupéré de cinq satellites était évalué par rapport à un ensemble illustratif de huit et la conception était confondue avec la taille. Pour l'ensemble de référence LANS de cinq satellites, { "8.68" } des 14,24 points d'écart de couverture se révèlent être les trois satellites manquants et seulement { "5.56" } points la conception ; pour les quatre engins réellement en orbite lunaire, un ensemble de quatre satellites conçu à cet effet atteint { "4.86" } % là où ils atteignent { "0" } %. Un test fixe que la ligne appariée est une constellation reconstruite et non celle configurée rebaptisée, ce qui est la façon dont elle a d'abord été écrite et ce que l'exécution rapportait alors.

# text
seg-2e7e4dbbb7f6 = <b>Neuf cartes de capacités sur le site public, couvrant { "22" } lignes de la matrice de vérification livrées sans carte au niveau produit.</b> Le moteur avait vu grandir une famille de capacités — la vérification ARAIM par rapport aux vecteurs de référence publiés du Working Group C, la géométrie réelle de constellations lunaires récupérées, le contour de déni lunaire avec une bande de C/N₀ mesurée, l'étape de l'ordonnancement VLBI à la covariance de station, le transfert optique et RF avec injection de pannes inter-modalités, la prédiction en temps réel de l'orientation de la Terre par rapport au Bulletin A archivé, le partage d'ouverture entre navigation et communications, la navigation à l'estime INS/TRN, et la couverture des unités et de la provenance — chacune avec une ligne de matrice et un scénario fourni, et aucune nommée sur kshana.dev. La couverture carte-ligne passe de { "72" } lignes sur { "168" } à { "94" }.

# text
# c1: web/app.js
# c2: tests/scenario_examples_doc_sync.rs
# c3: run
# c4: scenarios/
seg-3dc189224fe8 = <b>Huit scénarios ajoutés au catalogue du bac à sable.</b> Le bouton Run d'une carte de capacité n'apparaît que si <c1/> porte aussi le fichier ; six cartes nommaient un scénario qu'il ne portait pas, de sorte qu'elles s'affichaient sans moyen de les exécuter — l'une d'elles, la donnée de télémétrie laser réelle, était dans cet état depuis sa livraison. <c2/> impose maintenant l'invariant dans les deux sens : la cible <c3/> d'une carte doit être fournie sous <c4/> <em>et</em> proposée par le catalogue. Testé par mutation sur les deux modes de défaillance.

# text
# c1: moonlight-service-volume
# c2: <scenario>.table.csv
seg-2d69334516e9 = <b><c1/> émet sa géométrie par satellite sous forme de <c2/></b> lorsqu'un site d'export est configuré (G11). C'est le plus grand tableau que le crate publie — { "2304" } lignes dans la table conjointe de communications et de navigation publiée — et il n'atteignait les consommateurs que dans du JSON, la forme qui a tronqué la courbe de 57 points d'un scénario voisin à { "23" } points sous une colonne qui les annonçait tous. Une ligne par liaison, le nombre de lignes sur la ligne d'en-tête, les colonnes d'antenne présentes seulement lorsqu'une antenne était configurée. Une exécution sans site d'export est inchangée octet pour octet et n'écrit aucun fichier.

# text
seg-7958d26072f7 = Le SBOM décrit maintenant ce qui est livré : { "60" } composants sont devenus { "66" }.

# text
# c1: scripts/gen-sbom.sh
# c2: sgp4
# c3: chrono
# c4: --features python
# c5: pyo3
# c6: pyo3-ffi
# c7: pyo3-macros
# c8: pyo3-macros-backend
# c9: pyo3-build-config
# c10: portable-atomic
# c11: target-lexicon
# c12: heck
# c13: python
# c14: wasm
# c15: expression
seg-219cd333b000 = <c1/> listait chaque paquet de la résolution des fonctionnalités par défaut, dépendances de développement comprises. Cela mettait <c2/> et <c3/> — des crates réservés aux tests, compilés dans aucun artefact — dans la nomenclature, et laissait de côté la chaîne <c4/> que lie la roue PyPI (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), qui est la frontière d'interface de fonctions étrangères de cette roue. Le script parcourt maintenant le graphe de résolution depuis le paquet kshana par les seules arêtes normales et de construction, sur l'union des jeux de fonctionnalités par défaut, <c13/> et <c14/> (le paquet npm porte ce même SBOM), pour chaque plateforme cible. Le verdict de conformance CycloneDX fixé est rebasé par son générateur versionné : { "60" } → { "66" } composants, { "53" } → { "60" } expressions de licence composées, et toujours zéro erreur de schéma une fois celles-ci placées dans la forme standard <c15/>.

# text
# c1: export_table_csv
# c2: <scenario>.table.csv
# c3: realtime-frame-eop
# c4: lunar-time-budget
# c5: lunar-jamming
# c6: moonlight-service-volume
# c7: export_site_lat_deg
# c8: export_site_lon_deg
# c9: table_csv
# c10: undefined
# c11: tests/golden/realtime-frame-eop.csv
# c12: RunOutput.write_csv
seg-23c98d31f749 = <b>Le tableau CSV de reproductibilité atteint chaque point d'entrée, pas seulement la CLI et la roue Python.</b> Le serveur MCP gagne un septième outil, <c1/>, qui exécute un scénario et renvoie le tableau stable à l'octet près que la CLI écrit sous le nom <c2/> — ou une erreur nommant les types de scénario qui en publient un (<c3/>, <c4/>, <c5/>, et <c6/> seulement lorsque <c7/> + <c8/> sont définis). Le module WebAssembly gagne <c9/>, qui renvoie le même texte ou <c10/>. Le test d'aller-retour MCP et les tests de la liaison Python fixent maintenant le CSV renvoyé octet pour octet par rapport à <c11/>, et fixent que <c12/> renvoie les octets écrits, et { "0" } sans fichier créé pour un type de scénario sans tableau. Chaque surface qui indique le nombre d'outils MCP ou liste les outils dit maintenant sept.

# text
# c1: run_all
seg-86c3fed5e23a = <c1/> dans le module WebAssembly : une seule exécution du moteur pour toutes les sorties.

# text
# c1: run
# c2: chart_svg
# c3: summary
# c4: table_csv
# c5: cislunar-arc-recovery
# c6: run_all
# c7: {json, svg, summary, csv}
seg-3f2677cd280b = <c1/>, <c2/>, <c3/> et <c4/> exécutent chacun le scénario de zéro, de sorte que le bac à sable payait quatre exécutions complètes par clic — environ { "12" } s au lieu de { "3" } s pour <c5/> dans un navigateur. <c6/> renvoie <c7/> à partir d'une seule exécution, et le bac à sable l'utilise maintenant. Il correspond aux quatre appels séparés octet pour octet.

# text
# c1: gnss-ins
# c2: +C_b^n b_a
# c3: −C_b^n b_g
# c4: +C_b^n b_g
# c5: scenarios/gnss-ins.toml
seg-fa05c9ee0c6a = <b>RÉVISION : le couplage du biais de gyroscope du filtre GNSS/INS avait le mauvais signe, et les chiffres de panne de <c1/> changent.</b> Le filtre de Kalman étendu (EKF) à état d'erreur garde les deux biais inertiels comme des résidus (vrai moins l'estimation courante, réinjecté par addition). La colonne de l'accéléromètre pilotait l'erreur de vitesse avec <c2/>, mais la colonne du gyroscope pilotait l'erreur d'attitude avec <c3/>. Un biais de gyroscope résiduel fait en réalité tourner l'attitude calculée de <c4/>, de sorte que chaque estimation du biais de gyroscope poussait dans le mauvais sens. Le paquet n'est resté stable que parce que sa loi a priori par défaut du biais de gyroscope ({ "1e-4" } rad/s, 1 écart-type) était assez serrée pour tenir ces états immobiles. Avec une loi a priori plus large, le filtre divergeait même lorsque le vrai biais de gyroscope était nul : { "93" } m d'erreur fusionnée pendant la panne devenaient { "4.3" } km. Les chiffres publiés pour <c5/> changent comme suit :

# text
seg-47e22e713df6 = avant (≤ { "0.27.2" })

# text
seg-5215a0a41b89 = après

# text
seg-f58aecc6864c = IMU à atomes froids, RMS fusionné pendant la panne

# text
seg-c4fbd933ddb2 = { "96.1" } m

# text
seg-002d765fca02 = { "1.9" } m

# text
seg-d14616d4ea1b = IMU à atomes froids, navigation à l'estime dans la spécification ({ "50" } m)

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-91645c14401b = { "60" } s (toute la panne)

# text
seg-f297a2652cf8 = IMU tactique, RMS fusionné pendant la panne

# text
seg-0ac27c6d4206 = { "62.5" } m

# text
seg-eda895cc3b86 = { "3.1" } m

# text
seg-e0ab83f1d8d7 = IMU tactique, navigation à l'estime dans la spécification ({ "50" } m)

# text
seg-5c526991a521 = { "37" } s

# text
# c1: tests/gnss_ins_sensor_fusion_reference.rs
# c2: closed_loop.rs
# c3: gnss-ins
seg-743060da5543 = Les chiffres en roue libre ({ "130.7" } m et { "314.3" } m) ne changent pas ; ils n'ont jamais utilisé le filtre. La lecture antérieure du paquet, selon laquelle la navigation à l'estime fusionnée est limitée par un plancher d'attitude de transmission et ne s'améliore donc pas avec un meilleur capteur, était un artefact de ce défaut et est retirée. Avec des biais constants et sans bruit, le filtre les apprend maintenant tant que le GNSS est disponible, de sorte que la navigation à l'estime fusionnée est un meilleur cas. La référence externe filterpy (<c1/>) ne vérifie que les mises à jour de mesure, ce qui explique qu'elle n'ait jamais vu la propagation. Deux tests vérifient maintenant directement le signe et échouent tous deux sur l'ancien. Le premier, dans <c2/>, injecte un biais de gyroscope résiduel connu dans le strapdown et exige que le filtre prédise l'erreur d'attitude qui en résulte à { "2" } % près. Le second exige qu'une loi a priori large apprenne un biais de gyroscope de { "1e-3" } rad/s et reste dans { "6" } m. La référence multiplateforme de <c3/> est refixée pour cette raison et aucune autre.

# text
# c1: scenarios/clock-holdover.toml
# c2: TypeError: fetch failed
# c3: init()
# c4: fetch
seg-f764678e3376 = <b>Chaque guide de démarrage du registre s'exécute maintenant tel qu'écrit sur une machine propre.</b> Mesurés avant ce changement, les exemples crates.io et PyPI (Python Package Index) lisaient <c1/>, que n'a pas une installation depuis le registre, et l'exemple npm plantait sous Node.js avec <c2/>, parce que le <c3/> du paquet récupère son binaire WebAssembly et que le <c4/> de Node ne peut pas lire un fichier local. Maintenant :

# text
# c1: README.crates.md
# c2: README.pypi.md
# c3: README.npm.md
# c4: main
# c5: # Ok::<…>
# c6: tests/readme_code_fences_doc_sync.rs
seg-e77a540d2f90 = <c1/> et <c2/> portent ce scénario en ligne, comme <c3/> le faisait déjà. Le bloc Rust est un programme entier avec son propre <c4/>, puisque la ligne <c5/> masquée par rustdoc qui le terminait est affichée sur crates.io et ne compile pas une fois collée. <c6/> le compile toujours octet pour octet, et refuse maintenant aussi une ligne masquée dans le bloc.

# text
# c1: README.npm.md
# c2: initSync
# c3: initSync
seg-ea5204ced0d2 = <c1/> sépare le navigateur de Node.js et donne une recette Node qui lit le binaire sur disque et le passe à <c2/>. Le test de synchronisation de la documentation accepte <c3/> comme le chargeur que génère wasm-bindgen.

# text
# c1: 5ba83a232b94
seg-ebb763695c59 = Tous trois intègrent le scénario avec ses chaînes de provenance non abrégées, de sorte que le hachage du scénario est <c1/> sur chaque surface. L'exemple npm les abrégeait, ce qui lui donnait un hachage différent de celui de la CLI.

# text
# c1: cargo new
# c2: wasm-pack --target web
seg-dc52363432f8 = Reproduit à partir de builds locaux de cet arbre : un nouveau projet <c1/> avec une dépendance par chemin vers le crate empaqueté a compilé et exécuté l'exemple Rust ; une roue construite avec maturin à partir des sources empaquetées, installée dans un nouvel environnement virtuel, a exécuté l'exemple Python ; et le paquet <c2/>, empaqueté et installé avec npm, a exécuté la recette Node. Les trois ont imprimé la même ligne de synthèse.

# text
# c1: cargo run -- <scenario.toml>
seg-07e465a602f1 = <c1/> fonctionne depuis un clone.

# text
# c1: Cargo.toml
# c2: default-run = "kshana"
# c3: cargo run --
seg-77ce31300b69 = <c1/> définit <c2/>. Sans cela, cargo refusait avec « could not determine which binary to run », que chaque ligne <c3/> de la documentation rencontrait.

# text
# c1: kshana example
# c2: --help
# c3: --version
# c4: --validate
# c5: ok:
# c6: tests/cli_first_run.rs
seg-2d516597b5f5 = <b>Les erreurs de la première minute de la CLI disent quoi faire ensuite.</b> Un chemin de scénario qui n'existe pas ajoute maintenant une indication pointant vers <c1/>, et un second argument positionnel imprime le texte d'usage en plus de nommer l'argument. <c2/>, <c3/>, l'erreur d'option inconnue (sortie { "2" }) et la ligne <c5/> unique de <c4/> en cas de succès étaient déjà sur main. <c6/> les couvre maintenant tous, puisqu'aucun test n'exécutait le binaire pour aucun d'eux auparavant.

# text
# c1: list_kinds()
# c2: scenario_kinds()
# c3: kshana.pyi
# c4: docs/PYTHON_API.md
# c5: README.pypi.md
# c6: scenario_kinds()
seg-fdd9a27ccfc4 = <b><c1/> en Python est documenté comme renvoyant une chaîne JSON unique, et non une liste.</b> Il renvoie les mêmes métadonnées que <c2/>, sérialisées, de sorte que l'itérer parcourt des caractères. Il garde son retour sous forme de chaîne pour que les appelants existants ne cassent pas. <c3/>, le commentaire de documentation de la liaison, <c4/> et <c5/> le disent maintenant et renvoient vers <c6/>.

# text
seg-f0e0c8c12f8a = <b>Les trois README de registre développent chaque abréviation à sa première utilisation.</b> PNT est maintenant développé dans le slogan, où il apparaît pour la première fois, et CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL et API sont développés dans les fichiers qui les utilisent. Le titre du tableau des références indépendantes ne dit plus « CI-gated » avant que CI soit défini.

# text
seg-554c5b0c9c60 = Correction d'un chiffre publié : la disponibilité ARAIM à deux constellations sur les TLE GPS + Galileo de Celestrak fournis dans le dépôt.

# text
# c1: docs/CAPABILITY.md
# c2: tests/araim_dual_real_data.rs
# c3: parse_propagators
# c4: parse_tle
# c5: araim_dual_constellation_availability
# c6: docs/CAPABILITY.md
# c7: docs/REAL_TLE_GUIDE.md
seg-1f023a822c91 = <c1/> affirmait que le regroupement de Galileo fait passer la disponibilité de { "0.21" } à { "0.67" } sous une VAL de { "12" } m et que le mode robuste aux pannes de constellation est limité avec seulement deux constellations. Cela venait de <c2/>, qui propageait chaque satellite depuis sa propre époque de TLE (<c3/> abandonne l'époque), et les époques de ces fichiers s'étendent sur { "70.6" } h (GPS) et { "335.7" } h (Galileo), de sorte que les satellites se trouvaient à des instants mutuellement incohérents. Le test garde maintenant chaque époque (<c4/>) et évalue chaque satellite à un même instant UTC commun, la plus récente époque de TLE de l'ensemble (2026-06-07T07:{ "21" }:{ "04" }). La disponibilité mesurée sur la même grille de { "24" } h, 289 échantillons devient, pour le GPS seul, { "0.993" } (elle était { "0.208" }), regroupée { "1.000" } (elle était { "0.671" }) et pour le mode double robuste aux pannes de constellation { "0.990" } (elle était { "0.031" }) ; à la limite APV-I, le mode double passe de { "0.180" } à { "1.000" }. La conclusion s'inverse : sur un ciel cohérent, deux constellations portent l'hypothèse de panne de constellation à une VAL de { "12" } m. Les mêmes chiffres résultent en prenant comme référence la plus ancienne époque de TLE. Un autocontrôle du test fixe sa boucle de disponibilité échantillon par échantillon sur <c5/>, de sorte que la seule différence est l'alignement temporel. <c6/> et <c7/> § { "3" } portent les nouveaux nombres ; l'entrée { "0.13.0" } ci-dessous est laissée telle que publiée.

# text
# c1: docs/CAPABILITY.md
# c2: docs/STANDARDS.md
# c3: ROADMAP.md
seg-3173a2e03521 = <b>Les surfaces publiques n'annoncent plus RINEX { "4" } comme validé.</b> Le moteur refuse maintenant un fichier de navigation RINEX { "4" } par son nom au lieu de le décoder de travers, mais la grille des normes montrait encore une carte « RINEX { "3" } / { "4" } » avec une pastille <em>validé</em>, liée aux preuves RINEX-3 de l'analyseur de navigation. La carte est maintenant « RINEX { "3" } », et le README, <c1/>, <c2/>, <c3/> et le résumé des capacités énoncent ce qui est vrai : les fichiers d'observation RINEX 3.0x sont analysés, la disposition d'observation { "4.00" } est censée l'être mais aucun fichier { "4.00" } n'a été lu par le code, et les fichiers de navigation RINEX { "4" } sont refusés.

# text
# c1: --validate
seg-c9bb514acb7a = <b><c1/> dit quand « ok » signifie qu'il n'y avait rien à vérifier.</b> Environ les deux tiers du catalogue ne publient aucun champ obligatoire — ces paquets exécutent leur configuration de référence à partir d'un corps vide — de sorte que le contrôle ne pouvait qu'imprimer « ok » pour eux, dans les mêmes mots qu'après avoir vérifié six champs. La ligne de succès indique maintenant le nombre de champs obligatoires qu'elle a trouvés présents, ou que le type de scénario n'en exige aucun.

# text
# c1: scripts/gate.sh
# c2: REPEAT
# c3: TEST_THREADS
# c4: REPEAT=no
seg-06b324d00285 = <b><c1/> refuse un <c2/> ou un <c3/> non numérique.</b> Sous bash { "3.2" }, <c4/> faisait échouer la comparaison numérique en erreur et l'évaluait à faux, de sorte que le portail annonçait « repeatability loop SKIPPED (REPEAT={ "0" }) » pour une valeur qui n'était pas { "0" } et écrivait quand même un reçu. Les deux réglages sortent maintenant avec { "2" } sauf s'ils sont de simples entiers.

# text
seg-09d04ffdd9ac = La MSRV est indiquée comme { "1.85" } partout où une personne la lit.

# text
# c1: Cargo.toml
# c2: codemeta.json
seg-dafc23725315 = <c1/> est passé à { "1.85" } à la dernière version ; le badge du README, le texte d'installation et de dépannage, <c2/> et la justification propre du crate MCP disaient encore { "1.75" }.

# text
# c1: RunOutput.__repr__
# c2: len()
seg-c2fa8a31058c = <b><c1/> dans la liaison Python rapporte des octets, et non des « chars ».</b> Il imprimait <c2/> de chaînes UTF-8, ce qui est un nombre d'octets : { "710" } « chars » pour un tableau de 708 caractères.

# text
# c1: --study --study-name
seg-6b4452a4e340 = Le README ne documente plus <c1/> ensemble.

# text
# c1: --study-name
# c2: --study
seg-47d83e4d847b = <c1/> est un indicateur à scénario unique, ignoré avec <c2/> (le binaire avertit). Les deux exemples à copier-coller de README.md et de README.crates.md montrent maintenant la commande d'étude seule.

# text
seg-5ed7f8330b2d = <b>Les preuves de stabilité d'horloge du site énoncent les deux tolérances observées.</b> La série césium 5071A est reproduite à ≤ { "3e-5" } et PHASE.DAT à ≤ { "5e-5" } ; le paragraphe donnait { "3e-5" } pour les deux.

# text
seg-8bba7f1171f3 = Deux fichiers de sortie du moteur ne sont plus suivis.

# text
# c1: scenarios/quantum-pnt-demonstrator.study.{json,html}
# c2: *.study.json
# c3: *.study.html
seg-ea9bf1d14371 = <c1/> avaient été estampillés par le moteur { "0.20.0" } avec chaque figure de mérite vide, et la propre commande d'étude du README les écrasait, salissant l'arbre et bloquant le portail de push. <c2/> / <c3/> sont maintenant ignorés comme les quatre autres sorties du moteur.

# text
# c1: seed
# c2: u64
seg-77ce9b90859d = <b>Un balayage de graine dans le bac à sable n'échoue plus à chaque exécution.</b> Le balayage faisait avancer le réglage entier <c1/> de façon linéaire ({ "1" }, { "10.9" }, { "20.8" }, …), et le moteur, le lisant comme <c2/>, rejetait chaque valeur fractionnaire. Les réglages entiers balaient maintenant des nombres entiers distincts.

# text
# c1: realtime-frame-eop
# c2: engine_version
# c3: scenario_hash
# c4: kshana-csv.csv
seg-e1b1e1360eb9 = <b>Chaque téléchargement du bac à sable dit quel moteur et quelle entrée l'ont produit.</b> Quelques types de scénario (par exemple <c1/>) n'émettent ni <c2/> ni <c3/>, de sorte que leurs téléchargements s'appelaient simplement <c4/>. Le nom se rabat maintenant sur la version du moteur chargé et une empreinte FNV-1a-64 de 12 chiffres hexadécimaux du texte du scénario.

# text
# c1: cargo install kshana
# c2: docs/
# c3: src/bin/
# c4: crossover_study
# c5: gen_validation_artifacts
# c6: validation_report
# c7: kshana
# c8: cargo run --bin <name>
# c9: validation_report
# c10: cargo package
# c11: cargo install --path
# c12: kshana
seg-0181e86b576a = <b>Le crate publié fait moins de la moitié de son ancienne taille, et <c1/> ne construit que la CLI.</b> Le paquet incluait les articles, leurs dossiers de soumission, les artefacts de figures d'articles, les carnets, <c2/>, les scripts de mainteneur et les programmes d'exemple. Aucun n'est compilé par la bibliothèque ou la CLI. Il incluait aussi les trois générateurs internes sous <c3/> (<c4/>, <c5/>, <c6/>), de sorte qu'une installation depuis le registre compilait et installait quatre exécutables, dont trois n'étaient utiles que dans une copie de travail. Ces arbres et les trois sources de générateurs sont maintenant exclus. Cargo liste les binaires d'un paquet à partir des fichiers qu'il contient, de sorte que le manifeste publié ne nomme que <c7/>. Dans un clone, les générateurs sont toujours trouvés automatiquement, de sorte que <c8/> et la tâche de publication qui exécute <c9/> sont inchangés. Mesuré avec <c10/> : { "763" } fichiers, { "16.7" } MiB, { "6.8" } MiB compressés avant ; { "591" } fichiers, { "10.5" } MiB, { "3.0" } MiB compressés après. Sa construction de vérification, qui ne compile que les fichiers empaquetés, réussit. <c11/> sur le crate empaqueté a installé un exécutable, <c12/>.

# text
# c1: p95 0.0ns
# c2: security 0.000
seg-567c7059286f = <b>Une sortie qu'un ingénieur de synchronisation peut lire : plus de <c1/>, plus de <c2/> sans attaque, et des nombres de sites qui correspondent aux README.</b> C'est une révision d'affichage. Aucun nombre publié ne change ; les valeurs JSON sont identiques, ce que prouvent les hachages de référence ci-dessus.

# text
# c1: 0.0ns
# c2: p95 1.20e-4ns
# c3: 0.0
# c4: 0.000
seg-849fa9a29f07 = La synthèse d'une ligne imprimait l'erreur de synchronisation temporelle au 95e percentile (p95) de l'horloge optique comme <c1/> alors que le tableau à côté montrait { "1.20e-4" } ns. Un chiffre de synchronisation non nul, trop petit pour une décimale, est maintenant imprimé avec trois chiffres significatifs (<c2/>) ; un zéro exact s'imprime toujours comme <c3/>. Le rapport HTML (HyperText Markup Language), le tableau de comparaison des études et le rapport téléchargeable du bac à sable utilisent la même règle, de sorte qu'aucun chiffre non nul ne s'imprime non plus comme <c4/>.

# text
# c1: security
# c2: clock
# c3: orbit
# c4: hybrid
# c5: fusion
# c6: security n/a (no attack)
# c7: 0.000
# c8: fom.security
# c9: applicable: false
# c10: figure_tiers
# c11: spoof
seg-c44323babd1e = <c1/> est une borne analytique de détectabilité du leurrage qui n'a de sens que face à une attaque configurée. Les types de scénario <c2/>, <c3/>, <c4/> et <c5/> n'en configurent aucune, de sorte que leur synthèse imprime maintenant <c6/> au lieu d'un nombre tel que <c7/> qui se lit comme une détection manquée. La valeur reste dans <c8/>, marquée <c9/> avec la raison dans <c10/>, et les tableaux du rapport montrent « not applicable ». Le type de scénario <c11/> évalue toujours la détection.

# text
# c1: tests/registry_golden.rs
# c2: golden_clock
# c3: security
# c4: golden_orbit
# c5: security
# c6: tests/tutorials.rs
seg-f54d5ffb7dff = Deux épingles de synthèse dans <c1/> ont bougé pour exactement ces deux raisons et aucune autre : <c2/> (le p95 quantique et les deux valeurs <c3/>) et <c4/> (les deux valeurs <c5/> ; ses valeurs p95 sont exactement nulles). Leurs hachages de document entier n'ont pas bougé. Les synthèses attendues du README, des trois tutoriels et de leurs scénarios pédagogiques sont mises à jour en conséquence, et <c6/> vérifie les copies pédagogiques par rapport au moteur.

# text
seg-e8e012376fa3 = La visite guidée du bac à sable ne s'ouvre plus au premier chargement. Sa fenêtre modale interceptait les premiers clics et son projecteur faisait défiler la page loin de l'endroit où le visiteur avait atterri. Elle démarre depuis le bouton « Take the 60-second tour » ou le bouton flottant Tour.

# text
seg-4d60d4ea4d7d = La page ne défile plus latéralement sur un téléphone. À { "390" } px, la rangée de la marque et le bouton GitHub représentaient environ { "410" } px de contenu, soit un débordement de { "4" } px ; l'en-tête tient maintenant à partir de { "320" } px, et le tableau des figures de mérite défile à l'intérieur de sa propre boîte au lieu d'élargir la page.

# text
# c1: web/data/verification-matrix.json
# c2: web/counts.test.mjs
# c3: tests/web_validation_counts_doc_sync.rs
seg-f6ec6a64071d = L'explorateur de capacités commençait par son propre nombre de cartes (« { "46" } capability cards … { "17" } backed by an external oracle ») à côté de README qui disent { "64" } sur { "168" }. Il commence maintenant par la matrice de vérification, lue dans le <c1/> généré (la même matrice sur laquelle sont fixés les nombres du README), et nomme ensuite les cartes pour la couche de synthèse qu'elles sont. <c2/>, une nouvelle étape du workflow d'intégration continue (CI), vérifie l'arithmétique et recoupe README.md et les descriptions de la page ; <c3/> fixe le câblage du côté Rust.

# text
# c1: docs/POSITIONING.md
# c2: telecom-timing
# c3: docs/TELECOM-TIMING.md
# c4: ROADMAP.md
seg-606098743e57 = <b>La description publique commence maintenant par la synchronisation temporelle et le holdover, le domaine le mieux vérifié.</b> L'ouverture du README et <c1/> présentent Kshana comme un moteur de preuves de résilience PNT ouvert, reproductible et étiqueté par provenance : d'abord la synchronisation temporelle et le holdover des infrastructures critiques (les estimateurs d'Allan, d'Allan modifié, de déviation temporelle et d'erreur d'intervalle de temps maximale et l'inversion de variance de la dérive en holdover sont les lignes VALIDATED qui la fondent), le quantique comme méthode neutre d'arbitrage quantique contre classique dont les résultats sont étiquetés MODELLED, et la navigation lunaire / cislunaire et en espace lointain comme capacités maintenues plutôt que comme thème principal. Les deux pages disent maintenant ce que Kshana n'est pas — pas un simulateur de signaux radiofréquence ni un banc matériel en boucle, pas un remplacement de MATLAB/Simulink, STK ou Orekit — et renvoient vers le nouveau type de scénario <c2/> et vers <c3/>. L'ancienne phrase « there is no good open tool » a disparu : une recherche qui ne trouve rien n'est pas une preuve que rien n'existe. <c4/> gagne un ordre de priorité sans date (d'abord la synchronisation temporelle, ensuite l'arbitrage quantique, le lunaire maintenu) et abandonne trois éléments périmés (les systématiques de Coriolis et de décalage lumineux, les conditions initiales NRHO et le scénario lunaire, tous livrés) ; la ligne du README « Coriolis and light-shift remain roadmap » est corrigée de la même façon.

# text
# c1: docs/CAPABILITY.md
# c2: src/verification.rs
# c3: oem
seg-7bc48692be0b = <b><c1/> a cessé de sous-déclarer.</b> La ligne des référentiels fixes par rapport à la Terre disait « none » alors que la matrice évalue GCRS→ITRS comme VALIDATED ; elle dit maintenant « full », et la ligne des référentiels de base consigne le recoupement ANISE comme livré. Le mode guidé était listé comme feuille de route ; le bac à sable a livré des curseurs guidés et une visite guidée. Un balayage par rapport à <c2/> a corrigé cinq autres lignes qui précédaient leurs validations : le modèle de forces de Cowell et la détermination d'orbite par lots/séquentielle par rapport à Orekit { "12.2" }, les passages de stations au sol par rapport au détecteur d'élévation d'Orekit, le noyau de dilution de précision par rapport à gnss_lib_py, et l'import OEM par rapport à l'analyseur indépendant <c3/> ; la ligne de vérification et validation nomme maintenant les garde-fous qui vérifient que chaque test cité existe.

# text
seg-9d144df304ca = Le glossaire explique ce que dit un fichier de résultat.

# text
# c1: docs/GLOSSARY.md
# c2: sigma_y
# c3: q_wf
seg-eed672b2f8fd = <c1/> gagne des entrées en langage courant pour les termes de sortie (holdover, p95, intégrité, le score de sécurité, PDOP, <c2/>, <c3/>), les termes de synchronisation des télécommunications (erreur de temps, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) et les trois niveaux de preuve (VALIDATED, MODELLED, PARTNER).

# text
# c1: docs/
# c2: docs/VERIFICATION-MATRIX.md
# c3: docs/MODELLED-RATIONALE.md
# c4: docs/SCENARIOS.md
# c5: src/verification.rs
# c6: api::list_scenario_kinds()
seg-1a4f9d5eef96 = <b>Les abréviations sont développées à la première utilisation dans chaque document public écrit à la main.</b> Le README et { "24" } fichiers sous <c1/> avaient plusieurs centaines d'abréviations utilisées avant leur développement, ou sans lui ; chacune est maintenant développée là où elle apparaît pour la première fois dans ce fichier. Les trois fichiers générés (<c2/>, <c3/>, <c4/>) sont laissés tels quels : ils sont écrits à partir de <c5/> et de <c6/>, de sorte que leur formulation doit changer à la source.

# text
seg-2889ce118381 = La couverture de lignes a une mesure de référence.

# text
# c1: docs/COVERAGE.md
# c2: coverage
# c3: b1d350d
# c4: tests/coverage_figure_doc_sync.rs
seg-9c4684c0a4ef = <c1/> consigne { "95.63" } % ({ "37,697" } lignes sur { "39,419" }) à partir de la tâche CI <c2/> sur <c3/>, et <c4/> y fixe les cinq surfaces publiques « ~{ "96" }% » — le seul chiffre phare qui était tenu à la main, et qui avait déjà bougé une fois sans que personne le remarque.

# text
seg-ebd36b7291df = De nouveaux portails de synchronisation de la documentation pour des surfaces que rien ne lisait.

# text
# c1: tests/readme_code_fences_doc_sync.rs
# c2: import { … } from "kshana"
# c3: tests/security_md_doc_sync.rs
# c4: src/lib.rs
# c5: #![forbid(unsafe_code)]
# c6: tests/no_overclaims.rs
# c7: web/README.md
# c8: proof
seg-3dd44fc69a28 = <c1/> vérifie chaque <c2/> d'un bloc JavaScript par rapport aux exports WebAssembly, et fixe l'exemple Rust de README.crates.md octet pour octet sur une copie que le binaire de test compile. <c3/> échoue si <c4/> perd <c5/> ou si SECURITY.md cesse de l'énoncer. <c6/> analyse maintenant aussi <c7/> et les trois README de registre, et chaque norme du site doit énoncer explicitement son <c8/>.

# text
seg-a506d14f3447 = Les deux vérifications d'horloges sur matériel réel s'exécutent sur un runner.

# text
# c1: realdata-clock.yml
# c2: KSHANA_REQUIRE_REALDATA=1
seg-c7f8b8627137 = <c1/> (mensuel et sur déclenchement manuel) récupère les séries 5071A et PHASE.DAT et exécute les deux tests avec <c2/>, de sorte qu'une entrée manquante échoue au lieu d'être sautée. Les deux scripts de récupération sont fixés sur un seul commit d'allantools et vérifient le SHA-256.

# text
# c1: mypy.stubtest
# c2: csv
# c3: write_csv
seg-3b4a7fee3cd0 = <b>Le stub de types Python est vérifié par rapport à la roue construite</b> (<c1/> dans la tâche des liaisons), ce qui explique que <c2/>/<c3/> aient été livrés sans stub.

# text
seg-24c2ccf3634a = <b>Le glossaire définit URE, EOP, FoM, CTI et TIB</b>, que le README et le registre utilisaient tels quels.

# text
# c1: required_fields
# c2: ephemeris
# c3: tle|orbit+epoch
# c4: kind = "ephemeris"
# c5: --validate
# c6: quantum-trade
# c7: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c8: |
# c9: +
# c10: --validate
# c11: lunar-joint-od-clock
# c12: pvt
# c13: earth-gnss-lunar
# c14: docs/SCENARIOS.md
# c15: kind
# c16: clock
# c17: tests/required_fields_are_true.rs
seg-ae044195cd47 = <b>Le contrat de champs publié de chaque type de scénario est maintenant vrai, et un test l'y maintient.</b> Cinq des { "61" } types de scénario ont changé. Les types de scénario dont <c1/> n'est pas vide passent de { "21" } à { "22" } : <c2/> exige maintenant <c3/> (un <c4/> nu passait <c5/> puis faisait échouer l'exécution), et <c6/> ajoute <c7/>, que son exécution exigeait déjà. Une entrée obligatoire peut utiliser <c8/> (l'un de ceux-ci) et <c9/> (tous ceux-ci ensemble) ; <c10/> comprend les deux. <c11/>, <c12/> et <c13/> publient { "9" } champs facultatifs réels qu'ils avaient omis. <c14/> dit maintenant que <c15/> est obligatoire pour chaque type de scénario sauf <c16/>. <c17/> vérifie chaque type de scénario par rapport à son scénario livré : retirer n'importe quelle entrée obligatoire doit faire échouer l'exécution, et un document ne contenant que les champs obligatoires doit s'exécuter.

# text
seg-09ba716f3e97 = Les notes du JetBrains Marketplace sont soumises à un portail.

# text
# c1: scripts/check-version-sync.sh
# c2: <change-notes>
# c3: plugin.xml
seg-938ff48e7a2d = <c1/> échoue maintenant à moins que l'entrée <c2/> la plus récente de <c3/> ne nomme la version livrée ; sept versions publiées avaient servi les notes de { "0.22.0" } sans changement.

# text
seg-3d38550854e0 = Le chiffre de couverture du rapport technique est le chiffre mesuré.

# text
# c1: paper/kshana-technical-report.md
# c2: docs/COVERAGE.md
seg-bd312cd26746 = <c1/> disait « near { "97" } % » ; il dit maintenant près de { "96" } % ({ "95.63" } % mesurés, <c2/>) et est la sixième surface que le test de couverture fixe.

# text
# c1: web/engine.test.mjs
seg-934680d402da = <b>Le client du moteur hors du fil principal est testé</b> (<c1/>, en CI) : liste d'autorisation de l'aiguillage, annulation et relance, les trois chemins de repli sur le fil principal, et reprise après plantage, face à un faux worker.

# text
# c1: release.yml
# c2: docs/RELEASING.md
seg-fd5f9a8a4f43 = <b>Rien n'est publié tant que le commit étiqueté n'a pas passé ses tests, et une publication n'est pas terminée tant que chaque registre ne la sert pas.</b> L'ordre est maintenant étiquette, vérification, publication, parité, site, en une seule exécution de <c1/> (<a1><c2/></a1>).

# text
seg-745b11c8ed74 = La publication attend le verdict.

# text
# c1: publish.yml
# c2: mcp-publish.yml
# c3: jetbrains-plugin.yml
# c4: release.yml
# c5: needs: verify
# c6: verify
# c7: scripts/check-release-verdict.sh
# c8: verify
seg-e66c890cf6c0 = <c1/>, <c2/> et <c3/> ne démarrent plus au push de l'étiquette ; <c4/> les appelle depuis des tâches qui ont <c5/>. Auparavant, ils lui faisaient concurrence : sur { "v0.27.2" }, crates.io, npm et le Python Package Index (PyPI) avaient tous publié dans les { "4.5" } minutes suivant l'étiquette, et <c6/> était revenu { "84" } minutes après elle ; sur { "v0.27.0" }, npm et PyPI ont publié alors que la tâche crates.io échouait. Une nouvelle tentative manuelle sur une étiquette est retenue par le nouveau <c7/>, qui exige un <c8/> au vert pour ce commit exact depuis l'interface Actions et échoue de façon fermée sur tout autre cas.

# text
seg-3800247c81f2 = <em>Tout est construit avant que quoi que ce soit ne soit téléversé</em>, et crates.io, dont l'étape d'empaquetage est celle qui a échoué en cours de publication, publie en premier.

# text
seg-6929a7608da7 = <em>Un jeton de registre manquant fait échouer la tâche</em> au lieu de sauter le téléversement et de rapporter un succès.

# text
seg-460811602293 = Une vérification de parité après la publication.

# text
# c1: scripts/check_channel_parity.py
# c2: kshana
# c3: kshana-mcp
seg-86eb0fab2f7c = <c1/> interroge crates.io (<c2/> et <c3/>), npm, PyPI (la distribution source et les six roues de plateforme) et ghcr.io jusqu'à ce que chacun serve la version, ou fait échouer l'exécution ; docs.rs et le registre du Model Context Protocol (MCP) sont rapportés, non exigés. Exécuté sur des versions passées, il trouve { "0.22.0" } absente de npm et de PyPI, { "0.23.0" } de PyPI et { "0.27.0" } de crates.io.

# text
# c1: kshana-aarch64-apple-darwin
# c2: kshana
# c3: SHA256SUMS
# c4: verify-release
seg-79578a00fd78 = <em>Des binaires de ligne de commande précompilés pour macOS (Apple silicon et Intel) et Windows x86-64</em>, nommés par cible (<c1/> et ainsi de suite), à côté du <c2/> Linux, dont le nom est inchangé. Un fichier <c3/> couvre chaque ressource, et <c4/> le vérifie et exécute les binaires macOS et Windows sur leurs propres systèmes.

# text
# c1: main
# c2: main
# c3: pages.yml
seg-3e1f5afa9f2a = <em>kshana.dev montre une version publiée, pas <c1/>.</em> Il se redéployait à chaque push sur <c2/> alors que ses pages nommaient la dernière version. <c3/> ne construit maintenant qu'une étiquette de publication : la publication le déclenche une fois que chaque canal sert la version, et un déclenchement manuel redéploie la dernière version (ou une version nommée).

# text
seg-43da8f3f171e = Une seule source de roues.

# text
# c1: publish.yml
# c2: wheels.yml
seg-b911ac65e231 = La matrice de six cibles copiée à la main de <c1/> a disparu ; il appelle <c2/>, de sorte que le portail d'étiquettes auditwheel et la vérification de reproductibilité à l'octet près évaluent maintenant les roues que PyPI reçoit, et qu'un échec de l'un ou de l'autre arrête la publication.

# text
# c1: publish.yml
# c2: pages.yml
# c3: @stable
# c4: rust-toolchain.toml
# c5: scripts/check-toolchain.sh
seg-194c4b019a4c = <em>Outils de construction fixés.</em> Chaque workflow demande Rust { "1.93.0" } (la tâche msrv sa propre version) ; <c1/> et <c2/> avaient demandé <c3/>, et le journal de { "v0.27.2" } montre rustup installant { "1.98.1" } puis compilant avec { "1.93.0" } seulement parce que <c4/> l'emporte sur lui. wasm-pack est fixé à { "0.13.1" } (la version qui a construit { "v0.27.2" }, que le script d'installation non fixé a choisie) avec une vérification de somme de contrôle, et mcp-publisher à { "1.8.1" } avec son SHA-256 publié. <c5/> échoue maintenant si un workflow demande un autre compilateur ou envoie un script téléchargé dans un shell. Aucune tâche de vérification, aucune épingle de référence ni aucun script de portail local n'a été retiré ou assoupli.

# text
# c1: dtolnay/rust-toolchain
seg-9e2a7376367e = <b>Chaque GitHub Action tierce est fixée par SHA de commit</b> — { "93" } références dans { "15" } workflows, dont { "92" } nouvellement — avec l'étiquette gardée en commentaire final pour que Dependabot la mette à jour. L'exception est <c1/>, dont l'étiquette est le sélecteur de chaîne d'outils.

# text
# c1: mcp/kshana-mcp
seg-6afb4a8770b0 = <b>Les couches de base de l'image du serveur MCP sont fixées par empreinte multi-architecture</b>, et Dependabot surveille maintenant le Dockerfile de <c1/>, de sorte que les couches de l'OS reçoivent toujours les mises à jour de sécurité — par une PR relue.

# text
seg-4ea8b158b408 = La vérification étiquette contre manifeste s'exécute dans les deux workflows de publication qui livrent la version de l'étiquette.

# text
# c1: mcp-publish.yml
# c2: jetbrains-plugin.yml
# c3: publish.yml
# c4: scripts/check-version-sync.sh
seg-4b77764e955d = <c1/> (image ghcr, registre MCP) et <c2/> (Marketplace) font concurrence à <c3/> au lieu de l'attendre, de sorte qu'une étiquette mal coupée n'était contrôlée que chez un voisin. Les deux exécutent maintenant <c4/> avant de construire.

# text
# c1: rmcp
# c2: rmcp
# c3: rmcp
# c4: kshana-mcp
# c5: rust-version = "1.88"
# c6: kshana
# c7: Content
# c8: ContentBlock
seg-bf90c4063843 = <b>Quatre avis de sécurité que Dependabot a levés le jour où ses alertes ont été activées sont corrigés.</b> Le serveur MCP passe de <c1/> { "1.7" } à { "2.2" } : trois avis contre <c2/> < { "2.1" } (une fuite de la table de sessions Streamable-HTTP, une validation manquante de la ressource protégée OAuth, des en-têtes personnalisés suivant une redirection inter-origines) — aucun atteignable ici, puisque le serveur ne parle que stdio, mais un crate publié ne devrait pas fixer un SDK vulnérable. Les macros de <c3/> { "2" } exigent Rust { "1.88" }, de sorte que <c4/> seul déclare maintenant <c5/> ; la bibliothèque <c6/> reste à { "1.85" }. Le seul changement d'API (<c7/> → <c8/>) est appliqué, et les tests d'aller-retour passent. L'action d'analyse SonarQube passe de v5 à v6, ce qui corrige un avis d'injection d'arguments (≥ { "4.0" }, < { "6.0" }).

# text
# c1: navsignal::code_tests
# c2: integrity::tpl_scalar::tests
# c3: api::tests::tracking_loop_kind_round_trips_through_the_dispatch
# c4: .rs
seg-2652aaad177e = <b>Chaque élément Rust que cite une ligne de la matrice de vérification est maintenant résolu par rapport au crate.</b> Le garde-fou existant vérifiait les citations en forme de chemins de fichiers ; { "63" } des { "164" } lignes hors partenaire nomment plutôt leur preuve comme un élément du crate — <c1/>, <c2/>, <c3/> — et un jeton sans suffixe <c4/> était invisible pour un analyseur de chemins. Ces lignes auraient pu nommer un module renommé, un module de test vidé ou une fonction qui n'a jamais existé, et chaque portail serait resté au vert.

# text
# c1: tests/verification_rows_name_a_test_that_exists.rs
# c2: #[test]
# c3: mod tests
# c4: #[test]
seg-01eee5115e3f = <c1/> résout les { "339" } citations de ce type par l'arbre des modules, exige que chaque ligne hors partenaire nomme au moins un test qui porte effectivement <c2/>, et exige que les lignes de partenaire n'en nomment aucun. Quatre mutations ont servi à l'évaluer : renommer un module cité, faire pointer l'unique citation de test d'une ligne vers une fonction qui n'est pas un test, renommer le vrai <c3/>, et en retirer les attributs <c4/> — chacune passe au rouge sur l'assertion qui lui correspond.

# text
# c1: tests/*
# c2: tests/alternative_complementary_pnt_reference.rs
seg-7731d549c739 = Une ligne était déjà fausse : <em>Alternative / complementary PNT</em> citait <c1/>, un motif glob, ce qui n'est pas une citation. Elle nomme maintenant <c2/> et les trois modules de test du crate qui la soutiennent.

# text
# c1: tests/published_figures_still_reproduce.rs
# c2: chart.svg
# c3: scenario-fom.png
seg-cf6fd64368de = <b>Les figures publiées sont revérifiées par rapport au moteur à chaque construction</b> (<c1/>). Les trois graphiques de démonstration du README sont la propre sortie <c2/> du moteur et rien ne réexécutait le scénario ; les deux études de croisement de l'article avaient été générées une fois et versionnées ; et le README énonce en prose quatre figures de mérite à côté de <c3/>. Les trois sont maintenant fixées sur la sortie du moteur en direct.

# text
seg-276b65a8f76a = Les réconcilier a donné le résultat utile : les graphiques de démonstration avaient été dessinés au moteur { "0.22.0" } et le JSON de croisement de l'article à { "0.20.0" }, et à { "0.27.1" } <b>chaque valeur tracée dans les cinq artefacts est identique</b> — les trois SVG de graphiques diffèrent d'une exécution neuve d'exactement deux caractères chacun, la marque de version dans le pied de page. Les graphiques ont été rendus de nouveau pour que le pied de page soit vrai. Le JSON de l'article est volontairement laissé estampillé { "0.20.0" } : c'est l'enregistrement de l'exécution dont un article publié intègre la figure, et le réestampiller prétendrait une provenance que le PDF n'a pas. Le garde-fou affirme à la place la propriété plus forte — que le moteur actuel reproduit toujours chaque valeur publiée.

# text
# c1: VERSION=not provided
# c2: previous_version
# c3: FieldUnit
# c4: ensemble
# c5: hybrid
# c6: fusion
# c7: inertial
# c8: report
seg-c88647c5f2fc = Les analyses SonarCloud étaient enregistrées comme <c1/>, de sorte que la période de nouveau code <c2/> n'avançait jamais : elle restait ancrée sur l'analyse du 2026-07-02, évaluant quatre-vingt-deux jours de travail comme un seul delta et mesurant { "7877" } lignes dupliquées « nouvelles » face à un seuil de { "3" } %. L'analyse transmet maintenant la version du crate. La duplication sous-jacente est réelle et n'est pas masquée par cela : elle est concentrée dans les registres déclaratifs <c3/> répétés dans <c4/>, <c5/>, <c6/>, <c7/> et <c8/>, et dans le tableau de vérification de 168 lignes, et elle est nommée ici comme du travail à faire plutôt qu'exclue de la mesure.

# text
# c1: scripts/gate.sh
# c2: integration_binaries
# c3: tests_passed
# c4: tests_ignored
# c5: target/gate-run.log
seg-f2a0960a6f11 = <b><c1/> n'avait pas de verrou à écrivain unique, et chaque exécution écrivait le même journal.</b> Ce n'est pas de la coquetterie : les <c2/>, <c3/> et <c4/> du reçu sont relus DANS ce journal, et le hook de pré-push fait confiance au reçu. Un portail qui avait été tué mais dont le binaire de test était encore vivant continuait d'écrire dans le fichier que l'exécution suivante venait de tronquer — de sorte que les comptes d'une exécution pouvaient être attestés comme ceux d'une autre, autorisant un push sur la foi d'une suite qui n'avait jamais été exécutée sur l'arbre poussé. Il y a maintenant un seul portail par copie de travail (refusant avec la sortie { "75" } à côté d'un portail vivant, effaçant un verrou périmé dont le pid a disparu) et un journal par exécution, avec <c5/> rafraîchi à partir de l'exécution qui se termine en sortant. Les deux sens sont testés : un pid vivant refuse, un pid mort est effacé.

# text
# c1: src/verification.rs
# c2: verification::gen
# c3: artifacts
seg-687d6fe87221 = <c1/> affirmait que ses tests ne prouvent « do <b>not</b> prove the named test/oracle strings resolve to live code ». Deux garde-fous le font maintenant exactement, de sorte que la documentation du module disait le contraire de la vérité ; elle énonce maintenant ce qui est vérifié par machine et ce qui est laissé au jugement humain. Une référence périmée à <c2/> — le module est <c3/> — est corrigée dans la propre documentation du garde-fou voisin.

# text
# c1: main
# c2: main
seg-014070f0873c = <b><c1/> a été réécrite le 2026-09-22 et poussée de force.</b> Dix commits sont devenus quatre. La réécriture a replié chaque commit qui avait laissé un portail au rouge dans le commit qui l'a rétabli, de sorte que chaque commit sur <c2/> a maintenant un arbre qui passe, et a retiré les exécutions annulées qu'un groupe de concurrence à l'échelle de la branche laissait sur chaque commit remplacé.

# text
# c1: git diff
seg-b48d6cfc3b42 = Rien n'a été jeté. Les commits d'avant la réécriture restent atteignables par les étiquettes qui les désignent, et l'arbre final est identique octet pour octet à l'arbre dont la réécriture est partie — <c1/> entre l'ancien sommet et le nouveau est vide, hormis les trois fichiers de workflow que cette version change.

# text
seg-0549cfdc6d69 = Les SHA remplacés, pour quiconque détient une référence vers l'un d'eux :

# text
seg-14812deb1b6b = ancien

# text
seg-c63f549e6a1d = sujet

# text
seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

# text
seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

# text
seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

# text
seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

# text
seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

# text
seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

# text
seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

# text
seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

# text
# c1: 7bba514
# c2: 7864142
# c3: .cargo_vcs_info.json
# c4: main
# c5: main
seg-9c220336c895 = <b>Les étiquettes { "v0.27.0" } et { "v0.27.1" } n'ont délibérément PAS été déplacées.</b> Elles pointent toujours vers <c1/> et <c2/>, les commits exacts dont les arbres ont produit les artefacts maintenant en ligne sur crates.io, npm, PyPI, ghcr.io et le registre MCP. Le <c3/> d'un crate consigne le sha1 à partir duquel il a été empaqueté, les registres sont immuables, et l'attestation de provenance de construction SLSA sur les ressources de la version { "v0.27.1" } est liée à ce commit. Déplacer les étiquettes aurait laissé chacun de ces artefacts publiés pointer vers un commit qui n'existe plus. Les laisser garde les anciens commits atteignables et chaque chaîne de provenance publiée résolue, au prix de deux étiquettes qui ne sont plus des ancêtres de <c4/> — ce qui est la raison d'être de cette version : { "v0.27.2" } donne à <c5/> une étiquette à elle, empaquetée à partir d'un commit qui s'y trouve.

# text
seg-3c644384256f = Ceci est la deuxième réécriture divulguée de cet historique ; la première, le 2026-09-21, a canonisé la paternité et est consignée dans les notes de { "0.27.0" } avec ses deux sha1 de crate orphelins. Une réécriture est divulguée ici chaque fois, parce qu'un dépôt qui vend une provenance vérifiable ne peut pas déplacer discrètement le sol sous un artefact publié.

# text
seg-d82d7a3c9054 = Le crate publié ne compilait pas.

# text
# c1: src/lunar_orientation.rs
# c2: include_str!
# c3: tests/fixtures/llr_geometry/de440_moon_pa.csv
# c4: /tests/fixtures
seg-ebc99c9df1ef = <c1/> contient un <c2/> de niveau supérieur de <c3/>, et le manifeste exclut <c4/> du paquet, de sorte que l'archive que reçoit crates.io manquait d'un fichier que la bibliothèque intègre elle-même. La publication de { "v0.27.0" } a échoué à sa construction de vérification pour cette raison et aucune { "0.27.0" } n'a atteint crates.io ; npm et PyPI, dont les tâches n'en dépendent pas, ont publié normalement. L'exclusion porte maintenant une exception pour ce seul catalogue.

# text
# c1: include_str!
# c2: src/
# c3: #[cfg(test)]
seg-6ff9cdb976e8 = Tout autre <c1/> d'une donnée de test dans <c2/> se trouve dans un module <c3/> et n'atteint donc jamais la bibliothèque empaquetée. Seul celui de niveau supérieur l'atteint.

# text
# c1: cargo package
# c2: package
seg-7f0975453b8f = <b>Rien dans la CI n'exécutait <c1/>,</b> ce qui explique qu'une archive qui ne peut pas compiler ait d'abord été découverte par la tâche de publication, après que deux autres registres avaient déjà livré. Une tâche <c2/> construit et compile maintenant l'archive exacte à chaque push.

# text
seg-1f2df48821fc = Les épingles d'émission de la réalisation du référentiel lunaire ne bougent plus à chaque changement de version. Le pied de page du SVG porte la version du moteur, de sorte que chaque version rebasait trois hachages — deux fois en un jour — et une épingle reprise par routine cesse d'être lue. La chaîne de version est normalisée en un substitut avant le hachage, et il est affirmé séparément que l'émission indique la version en cours d'exécution, de sorte que ce fait est vérifié plus précisément que le hachage ne l'a jamais vérifié.

# text
# c1: lunar-llr-datum
seg-56309487ea7e = <c1/> — la donnée de référentiel lunaire issue d'une vraie campagne d'observation.

# text
# c1: lunar-frame-campaign
# c2: bin_rms / sqrt(n_raw)
# c3: realdata::llr_crd
# c4: lunar_llr
seg-966a2cc4e40d = <c1/> remplaçait une transformation de Helmert injectée par une campagne <em>simulée</em> et le disait : son réseau de stations, son calendrier et son écart-type par observation sont des entrées illustratives. Ce scénario retire la simulation des deux endroits où un calendrier et un modèle d'erreur entrent dans la réponse. Les époques sont les instants d'émission de { "337" } points normaux archivés de télémétrie laser lunaire de l'ILRS (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } et Matera MLRO { "7941" }, les cinq réseaux de rétroréflecteurs), et chaque poids d'observation est la propre précision archivée de ce point normal, <c2/> — une médiane de { "5.13" } mm de distance aller simple, tirée du fichier plutôt que choisie ici. Les coordonnées des stations viennent de l'ITRF2020 de l'IERS et celles des réflecteurs du tableau { "7" } du JPL DE430 ; chaque jeu de données de test consigne une URL, une date de récupération et un SHA-256 et se régénère à partir de sa source par un générateur versionné qui vérifie la source et s'interrompt plutôt que d'émettre un nombre. Le rapport nomme quels liens sont mesurés et lesquels restent modélisés, et les modélisés sont <em>mesurés</em> : la distance aller simple observée moins calculée sur les données réelles est de { "156 494" } m RMS, ce que le même ensemble de tests confirme par rapport à JPL Horizons sur la même période ({ "195 655" } m RMS vectoriel, pire époque { "0.054" }° — dans les ~{ "0.3" }° que la série lunaire analytique intégrée revendique pour elle-même). Additif : un nouveau type de scénario, un nouveau lecteur (<c3/>) et un nouveau module (<c4/>) ; les paquets de référentiel lunaire existants sont fixés bit pour bit.

# text
# c1: sigma_ure_m
# c2: lunar-integrity
# c3: moonlight-service-volume
# c4: LUNAR_SIGMA_URE_M
seg-7fcd2af0a688 = <b><c1/> comme paramètre de scénario</b> sur <c2/> et <c3/>. La précision de mesure de distance du signal dans l'espace était une constante de compilation (<c4/>), de sorte qu'un balayage du volume de service ne pouvait répondre que par réussite ou échec à une valeur fixe. Les niveaux de protection y sont exactement linéaires, de sorte que l'exposer transforme le balayage en une <b>exigence</b> de précision de mesure de distance sur tout le volume. La valeur par défaut reproduit le comportement antérieur bit pour bit.

# text
# c1: moonlight-service-volume
# c2: export_site_lat_deg
# c3: export_site_lon_deg
# c4: per_sat_geometry
seg-c3ccc1e89a2d = <b>Export de la géométrie par satellite</b> sur <c1/> : <c2/> + <c3/> ajoutent un tableau <c4/> donnant l'azimut, l'élévation et la distance oblique vers chaque satellite à chaque époque pour un site sélénographique nommé, plus l'indicateur de visibilité. La synthèse agrégée de couverture écrase délibérément la géométrie par satellite, mais la distance oblique est exactement ce qu'un bilan de liaison consomme, de sorte qu'une analyse conjointe de communications et de navigation ne pouvait pas être faite à partir de la seule synthèse. Désactivé sauf si les deux coordonnées sont données ; purement additif.

# text
# c1: lunar_service::topocentric
seg-ae7886fbca9d = <c1/>, la fonction d'aide publique d'angles de visée derrière l'export.

# text
seg-b187bade5f04 = Une ligne de la matrice de vérification pour la nouvelle capacité de géométrie.

# text
# c1: antenna::pattern_gain_dbi
# c2: [2·J₁(x)/x]²
# c3: antenna.rs
# c4: export_antenna
# c5: moonlight-service-volume
# c6: antenna_pattern
# c7: θ₃dB[deg] = √(31000/G_lin)
# c8: 70·λ/D
seg-14ef785b6c12 = <b>Le diagramme d'antenne réel dans l'export de géométrie.</b> Le moteur porte un diagramme d'ouverture circulaire uniformément éclairée depuis P1 (<c1/>, la forme d'Airy <c2/>) et <b>rien en dehors de <c3/> ne l'utilisait</b> — un gain dans l'axe associé à une règle empirique gain-largeur de faisceau faisait le travail à la place. Un tableau <c4/> facultatif sur <c5/> (lu seulement lorsque le site d'export est défini) donne maintenant à chaque ligne exportée l'<b>angle hors de l'axe au satellite</b> et le <b>gain d'émission vers le site issu de ce diagramme</b>, et ajoute un bloc <c6/> qui rapporte le <b>nombre dans le faisceau selon le diagramme réel à côté du nombre dans le faisceau selon l'approximation symétrique</b> (<c7/>) avec la différence comme correction nommée. Les deux nombres sont émis ; aucun ne remplace l'autre. Mesurés à l'ouverture lunaire représentative du moteur lui-même (parabole de { "1" } m, { "2.4" } GHz, η = { "0.60" }) sur un site polaire sud et la couche illustrative de classe LCNS, les deux <b>divergent de plus d'un satellite</b> : le diagramme réel place { "0" } des { "76" } liaisons visibles dans le faisceau à mi-puissance, l'approximation en revendique { "28" } — une correction de −{ "2.33" } satellites par époque, pire époque isolée { "3" }. L'approximation porte une efficacité d'ouverture propre ({ "0.641" } contre la règle des <c8/> degrés avec laquelle elle est d'ordinaire citée, { "0.920" } contre une ouverture circulaire uniforme), de sorte que sur une parabole η = { "0.60" } elle renvoie un faisceau { "1.238" }× trop large ; le bloc émet les deux efficacités impliquées plutôt que de les laisser se déduire. Purement additif : mesuré sur le point de fonctionnement documenté, { "597" } feuilles préexistantes, <b>{ "0" } changée, { "0" } retirée, { "494" } ajoutées</b>.

# text
# c1: antenna::symmetric_beamwidth_rad
# c2: antenna::symmetric_relation_implied_efficiency
# c3: antenna::within_half_power_beam
# c4: antenna::HALF_POWER_DROP_DB
# c5: antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2
# c6: antenna::UNIFORM_APERTURE_HPBW_COEFF
# c7: lunar_service::nadir_off_boresight_rad
# c8: x = 1.61634
# c9: 1.02899·λ/D
# c10: 1.02
# c11: pattern_gain_dbi
seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> et <c7/>, les éléments publics qui la soutiennent. Le diagramme est aussi maintenant ancré sur les constantes d'Airy publiées plutôt que seulement sur lui-même : le franchissement à mi-puissance est localisé par bissection et comparé à <c8/>, ce qui donne la largeur exacte à mi-puissance <c9/> et consigne honnêtement que le coefficient conventionnel <c10/> place <c11/> à <b>−{ "2.955" } dB</b>, et non −{ "3.010" } dB.

# text
# c1: lunar-time-budget
# c2: x(τ)
# c3: <scenario>.table.csv
# c4: τ
# c5: x
seg-bac7217bb128 = <b>Un tableau de reproductibilité au format long pour <c1/>.</b> Les sorties à valeurs de tableau du scénario — la grille de temps de moyennage, les sept courbes <c2/> par terme et leur total en somme quadratique — n'atteignaient les consommateurs que sous forme de tableaux JSON. Un tableau publié avait été tronqué à { "400" } caractères et publiait { "23" } de ses { "57" } temps de moyennage sous une colonne qui les annonçait tous, et le manuscrit reconstruisait les courbes par terme à partir de formes closes parce que le moteur ne les avait jamais émises. Une exécution simple écrit maintenant aussi <c3/> avec une ligne par (indice de grille, temps de moyennage, terme), qui ne peut pas être tronqué en quelque chose qui a encore l'air complet. L'indice de grille est une clé de jointure exacte ; <c4/> est écrit sur { "13" } chiffres significatifs et chaque <c5/> sur { "7" }, de sorte que les octets ne divergent pas entre les constructions d'une même source. Purement additif : le JSON du rapport est identique octet pour octet.

# text
# c1: hybrid-optical-rf
# c2: link_configuration
# c3: units
# c4: variance
seg-ab9209297ec2 = <b>Le rapport <c1/> se décrit maintenant lui-même.</b> Un bloc <c2/> reprend les entrées de liaison résolues — longueur d'onde de la porteuse, ouverture d'émission et de réception, distance, largeur d'impulsion, temps d'intégration, rendements et pertes — avec les valeurs par défaut appliquées, de sorte qu'un article énonce la configuration avec laquelle il a tourné au lieu de citer une valeur par défaut lue dans la source. Un bloc <c3/> donne l'unité et la classe de provenance de chaque grandeur qu'un article est susceptible de citer. Les traces de covariance de transmission en sont la raison d'être : elles étaient émises sous un simple <c4/> et un manuscrit en déduisait des mètres carrés à partir d'un contrôle de cohérence interne. La déduction était juste, ce qui est précisément pourquoi c'était un défaut — rien n'aurait détecté qu'elle soit fausse. Purement additif : mesuré sur quatre configurations, { "456" } champs préexistants, <b>{ "0" } changé, { "0" } retiré, { "196" } ajoutés</b>.

# text
# c1: InternalConsistency
seg-5c810155300c = Une ligne de la matrice de vérification pour le tableau de reproductibilité du budget de temps, honnêtement <c1/> / <b>MODELLED</b> — le total est vérifié par rapport à la somme quadratique des termes du même fichier, qui partage les propres définitions de termes du moteur et n'est donc pas une référence indépendante. Ensemble, elles ajoutent trois lignes. Le total courant pour cette section non publiée est de <b>{ "168" } lignes — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

# text
# c1: ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>
# c2: ashfordeOU <contact@ashforde.org>
# c3: Chakshu Baweja <contact@ashforde.org>
# c4: dependabot[bot]
seg-ed290a85ab0e = <b>La paternité des commits sur tout l'historique est maintenant une identité unique, et deux crates publiés pointent vers un commit qui n'existe plus.</b> Le 2026-09-21, l'historique git a été réécrit de sorte que chaque commit humain soit écrit et validé par <c1/>. Il portait auparavant trois graphies d'une même personne — { "688" } commits sous <c2/>, { "34" } sous <c3/> et { "94" } déjà canoniques. L'unique commit de <c4/> a été délibérément laissé sous son propre auteur : rebaptiser la mise à jour de dépendance d'un robot reviendrait à revendiquer la paternité d'un travail que personne ici n'a fait.

# text
# c1: v0.26.0
# c2: 92284e9420605568f1bfabb78cd95d383b40f3e2
seg-ec4e75f94462 = <b>Aucun contenu n'a changé.</b> La réécriture n'a touché que les en-têtes d'auteur et de validateur, et cela se vérifie plutôt que d'être affirmé : l'arbre de chaque étiquette et de chaque branche est identique au bit près à ce qu'il était avant. <c1/> se résout toujours vers l'arbre <c2/>, exactement comme avant.

# text
# c1: v0.26.0
# c2: dce2dbf7700788cf6de46260c14673c0e5347360
# c3: d4921f3025569e00e425e1747d0acfc261e96e18
seg-bc0f4fa0a009 = <b>Ce que cela a coûté.</b> Le nom d'un commit est un hachage de son arbre, de ses parents et de ses en-têtes d'auteur, de sorte que changer un ancêtre renomme chaque descendant. Le commit de publication <c1/> était <c2/> et est maintenant <c3/>. Deux artefacts ont consigné l'ancien nom au moment de la publication et ne peuvent pas être corrigés, parce qu'une version publiée dans un registre est immuable par conception :

# text
# c1: kshana
# c2: .cargo_vcs_info.json
# c3: dce2dbf…
seg-52e096332738 = <c1/> { "0.26.0" } sur crates.io — <c2/> consigne <c3/>

# text
# c1: kshana-mcp
# c2: path_in_vcs: mcp/kshana-mcp
seg-8ec39d2f136c = <c1/> { "0.26.0" } sur crates.io — le même sha1, <c2/>

# text
# c1: gitHead
seg-9a21b7c7b41c = Rien d'autre n'est touché. Le paquet npm ne consigne aucun <c1/>, et la distribution PyPI ne consigne aucun commit du tout ; les deux ont été vérifiés plutôt que supposés.

# text
# c1: dce2dbf…
seg-9c51c5fb0d80 = Aucune réparation ne fait que <c1/> nomme le commit réécrit : cette chaîne <em>est</em> l'ancienne ascendance, et la seule façon de la résoudre est de garder publié l'historique d'avant la réécriture, ce qui rétablirait la paternité que la réécriture a retirée. La provenance de { "0.26.0" } passe donc par l'étiquette plutôt que par le sha1 consigné — et l'étiquette fournit les octets identiques à partir desquels le crate a été construit. La prochaine version consigne un commit valide sans qu'aucune action ne soit nécessaire.

# text
# c1: realtime-frame-eop
# c2: finals2000A
# c3: predicted_rows.n = 0
# c4: tools/finals2000A_2026.txt
# c5: predicted_rows.n = 12
# c6: predicted_rows.n
# c7: p4_frame_eop.csv
# c8: tests/golden/realtime-frame-eop.csv
# c9: docs/revisions/G12-default-eop-cell-changes.md
seg-30ecea86118a = <b><c1/> prenait par défaut un fichier EOP sans ligne de prédiction (G12).</b> Le scénario intégrait un extrait <c2/> de cinq lignes <em>finales seulement</em> comme valeur par défaut hors ligne, de sorte qu'une exécution nue rapportait <c3/> et que le tableau par horizon reposait sur { "5" }, { "4" }, { "3" } et { "2" } paires. Le moteur pouvait toujours lire une ligne de prédiction — l'entrée n'en avait simplement aucune. La valeur par défaut est maintenant l'extrait IERS { "2026" } textuel (<c4/>, MJD { "61173" }–{ "61204" }) : { "20" } finales du Bulletin B et <b>{ "12" } lignes de prédiction seule du Bulletin A</b>, de sorte qu'une exécution nue sans argument de fichier et sans réseau rapporte <c5/> et un tableau par horizon à n = { "20" } / { "31" } / { "30" } / { "29" }, et la comparaison avec le prédicteur opérationnel et l'accord avec les propres prédictions publiées du produit se remplissent aussi. L'extrait de 45 lignes sur longue période a été mesuré comme alternative et rejeté : il est lui aussi finales seulement, ce qui aurait laissé <c6/> à { "0" }. <b>Cela déplace des nombres publiés</b>, selon la règle R4 et avec l'autorisation du fondateur : dix des { "22" } cellules de <c7/> publié et { "24" } des { "42" } cellules remplies de <c8/>. Le plancher de pôle rapide moins final mesuré devient { "0.0678" } mas (contre { "0.0769" } mas), valeur que le propre tableau de mouvement du pôle de l'article P4 publie déjà à n = { "20" } — les deux concordent maintenant au lieu de différer de { "13.5" } %. Tout autre chiffre que P4 imprime à partir de ce tableau est inchangé à la précision imprimée. L'énumération complète ancien → nouveau, y compris les champs qui n'ont <em>pas</em> bougé, se trouve dans <a1><c9/></a1>. L'extrait finales seulement reste livré, fixé octet pour octet et exercé : un nombre nul de lignes de prédiction sur lui est la propriété du fichier, et un test le prouve toujours.

# text
# c1: moonlight-service-volume
# c2: n_sats
# c3: n_sats > 12
seg-17fbc566dc5b = <b>Un plafonnement obsolète du nombre de satellites dans <c1/>.</b> Le scénario plafonnait <c2/> à { "12" } alors que son propre constructeur de constellation en gère { "24" } et qu'un test affirme { "24" } : chaque nombre demandé au-dessus de { "12" } était donc réduit en silence, et un balayage du nombre de satellites renvoyait des valeurs identiques au-delà de { "12" } — impossible à distinguer d'une véritable saturation géométrique. Le plafond est désormais fixé à la limite du constructeur. Il s'agit d'un changement de comportement pour <c3/> uniquement.

# text
# c1: lunar-differential-pnt
seg-4df7d4d61b40 = Le même plafonnement obsolète dans <c1/>.

# text
# c1: lunar_dpnt
# c2: n_sats
# c3: dpnt_nsats_sweep.csv
# c4: n = 16
# c5: n = 12
# c6: n = 16
# c7: n_sats > 12
seg-8adfbd27c4f8 = <c1/> plafonnait <c2/> à { "12" } avec la même conséquence, et celle-ci a atteint un tableau publié : <c3/> contient une ligne <c4/> identique octet pour octet à sa ligne <c5/>, car le moteur renvoyait une réponse à douze satellites sous une étiquette à seize satellites. Le plafond est désormais fixé à la limite du constructeur, soit { "24" }, et un nouveau test la verrouille — chaque constellation plus grande doit à la fois indiquer son propre nombre et améliorer strictement le niveau de protection, de sorte que le plafonnement ne puisse pas revenir sans être remarqué. <b>Cela modifie des chiffres publiés</b> : le niveau de protection pour <c6/> passe de { "16.92" } m à { "14.57" } m. Balayée jusqu'à { "24" }, la courbe est strictement monotone ({ "11.94" } m à { "24" } satellites, soit { "29.5" } % de mieux qu'à { "12" }), il n'y a donc pas de saturation à { "12" } — le plateau apparent était le plafonnement. Changement de comportement pour <c7/> uniquement.

# text
seg-ebee158b73c8 = Une version de documentation, de transparence et de bac à sable. Aucun changement de comportement du moteur : la matrice de vérification s'établit à <b>{ "102" } lignes — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, sans changement par rapport à { "0.25.0" }.

# text
# c1: //!
# c2: lib.rs
seg-7af422ed6d89 = <b>Rustdoc au niveau de la crate</b> (<c1/> dans <c2/>) couvrant les points d'entrée, le modèle d'honnêteté et de niveaux de preuve, et la reproductibilité, de sorte que docs.rs s'ouvre sur une vraie page d'accueil plutôt que sur un simple mur de modules.

# text
# c1: docs/SCENARIOS.md
# c2: 50
# c3: api::list_scenario_kinds()
# c4: gen_validation_artifacts
# c5: tests/scenarios_reference_doc_sync.rs
seg-dd44c25f3af5 = <b><c1/></b> — une référence par type pour les <c2/> types de scénario, générée à partir de <c3/> (la source de vérité unique) par <c4/> et protégée par <c5/>, de sorte qu'elle ne peut pas diverger du répartiteur.

# text
# c1: allan
# c2: estimator
# c3: fom
# c4: hybrid
# c5: inertial
# c6: models
# c7: report
# c8: run
# c9: scenario
# c10: timetransfer
# c11: types
seg-e2cc77d3b413 = <b>Documentation des modules</b> pour les { "11" } modules publics jusque-là non documentés (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

# text
# c1: batch_ls
# c2: cr3bp
# c3: detection
# c4: attitude_budget
# c5: reentry
seg-8d156713799d = <b>Sources bibliographiques</b> pour cinq modules de formules qui énonçaient une équation sans nommer de référence : <c1/> (Tapley/Schutz/Born ; Bjorck), <c2/> (Szebehely ; Koon et al.), <c3/> (Kay), <c4/> (Wertz ; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

# text
# c1: security.txt
seg-832b4bfbc48a = <b>Un fichier <c1/> publié</b> sur kshana.dev pour la divulgation coordonnée.

# text
# c1: fomTier()
# c2: src/fom_label.rs
seg-30603f59e27d = <b>Niveau de validation par exécution dans le bac à sable.</b> Le tableau des figures de mérite d'une exécution unique comporte désormais une pastille VALIDATED/MODELLED par figure, lue à partir de la même recherche <c1/> que celle du rapport téléchargeable (qui reprend <c2/>, lui-même dérivé de la matrice de vérification), de sorte que le niveau affiché à côté d'une valeur en direct ne peut jamais contredire le registre.

# text
# c1: lunar-attack-surface
seg-93b203f3a1c0 = <b><c1/></b> dans le menu du bac à sable — les { "50" } types de scénario exécutables sont désormais accessibles en un clic (contre 49/50 auparavant).

# text
seg-1ec0830db404 = <b>Cinq autres cartes de capacité exécutables</b> (météorologie spatiale, évaluation des perturbations RF, résilience, interopérabilité CCSDS OEM, KIF), ce qui porte les cartes exécutables de { "11" } à { "16" }. Les cartes réservées à l'API et à la bibliothèque conservent un lien honnête vers la documentation plutôt qu'un faux bouton d'exécution.

# text
seg-977ea074dd9d = La couverture de la documentation est désormais verrouillée par cliquet dans la CI.

# text
# c1: check-doc-coverage.sh
# c2: missing_docs
# c3: #![warn(missing_docs)]
# c4: -D warnings
seg-beb308bcaafb = <c1/> compile la bibliothèque avec <c2/>, compte les avertissements, et n'échoue que si ce nombre dépasse un plafond fixé ({ "986" }). Un <c3/> strict sous <c4/> aurait transformé environ { "1000" } éléments publics actuellement non documentés en une rupture de compilation du jour au lendemain ; ainsi, les nouveaux éléments publics non documentés font échouer la compilation, tandis que l'arriéré existant est résorbé de façon délibérée.

# text
# c1: list_scenario_kinds
# c2: api::list_scenario_kinds()
seg-27668072a608 = <b>La ligne de l'outil MCP <c1/> annonçait «¤~{ "17" } types de scénario intégrés¤»</b> alors que <c2/> en exposait { "50" } depuis un certain temps — une documentation destinée aux agents qui sous-estimait d'un facteur trois la capacité réelle. Alignée sur le nombre exact.

# text
seg-1ffc9f9816e8 = Régénération de la référence indépendante de concordance du SBOM CycloneDX pour le graphe de dépendances mis à jour ({ "60" } composants). Le verdict de concordance est inchangé : zéro erreur de schéma normalisée, et chaque identifiant atomique de licence figure toujours dans l'énumération SPDX officielle.

# text
seg-a6db590bbcbe = <b>Cinq capacités promues au niveau VALIDATED externe</b>, chacune étant désormais recoupée avec une implémentation tierce indépendante de la même grandeur définie de façon unique (non circulaire, avec des jeux de test régénérables hors ligne) :

# text
# c1: allantools
# c2: tests/powerlaw_oadev_reference.rs
seg-98588143b4bb = <b>Conversion loi de puissance IEEE-1139 → écart-type d'Allan</b> par rapport aux formes closes de <c1/> pour les cinq types de bruit (<c2/>) ;

# text
# c1: tests/crpa_reference.rs
seg-ce37d70fa8bc = <b>Poids du formateur de faisceau CRPA MVDR / à annulation de norme minimale</b> par rapport à numpy/scipy LAPACK (<c1/>) ;

# text
# c1: Rotation.align_vectors
# c2: tests/wahba_reference.rs
seg-0f033d1027f8 = <b>Détermination d'attitude Wahba / TRIAD / QUEST</b> par rapport à la SVD <c1/> de SciPy sur des observations sans bruit (<c2/>) ;

# text
# c1: oem
# c2: tests/ccsds_oem_covariance_reference.rs
seg-e1e2283cb524 = <b>Échange de blocs de covariance OEM CCSDS { "502.0" }</b> avec un aller-retour via l'analyseur de la bibliothèque indépendante <c1/> (<c2/>) ;

# text
# c1: ncx2
# c2: chi2
# c3: tests/acquisition_reference.rs
seg-579eefbb646f = le <b>noyau des statistiques de détection d'acquisition à loi quadratique</b> (Marcum-Q généralisée / P_d / P_fa / seuil) par rapport à <c1/>/<c2/> de SciPy (<c3/>). La matrice de validation vérifiée par machine passe à <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> sur <b>{ "102" } lignes</b> (contre { "51" } · { "47" } · { "4" }). Les réserves honnêtes sur la portée sont conservées — par exemple, la promotion de l'acquisition ne couvre que le noyau des statistiques de détection ; le CFAR et la perte par chevauchement restent MODELLED.

# text
# c1: fom::positioning_performance
# c2: 0.589·(σ₁+σ₂)
# c3: scipy.stats
# c4: tests/positioning_fom_reference.rs
# c5: ()
# c6: (cov_enu, hpl_m)
# c7: PositioningFom
seg-b6a140d55580 = <b>Figures de mérite dans le domaine de la position</b> (<c1/>) : CEP, SEP et 2DRMS exacts à partir de la covariance de position ENU 3D d'une solution de navigation, plus un niveau de protection horizontal. Le CEP et le SEP sont les erreurs radiales médianes <em>exactes</em> (et non la règle linéaire <c2/>), recoupées avec les quantiles rayleigh/maxwell de <c3/> et avec une médiane Monte-Carlo NumPy indépendante (<c4/>). Remplace l'ancien module factice qui indiquait honnêtement ne pas être implémenté — <b>la signature de la fonction a changé</b> : de <c5/> renvoyant une erreur à <c6/> renvoyant un <c7/>.

# text
# c1: assurance::uncertainty::edf
# c2: allantools
# c3: edf_greenhall
# c4: edf_totdev
# c5: tests/uncertainty_edf_reference.rs
seg-1551afa17154 = <b>Degrés de liberté équivalents (EDF) des intervalles de confiance achevés pour tous les estimateurs de la famille d'Allan</b> (<c1/>) : les EDF de l'écart d'Allan modifié, de Hadamard et de la variance totale utilisent désormais l'algorithme d'EDF combiné de Greenhall et Riley et la forme TOTVAR du tableau 7 du NIST SP { "1065" } (auparavant, seul l'EDF de l'écart d'Allan à recouvrement était implémenté ; les autres le réutilisaient en silence), recoupés avec <c2/> <c3/>/<c4/> (<c5/>).

# text
# c1: tests/validate_p*.rs
# c2: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c3: scipy.special.j1
# c4: (HᵀH)⁻¹
# c5: finals2000A
# c6: src/verification.rs
seg-39753e7919cc = <b>Recoupements externes indépendants pour les capacités de géométrie PNT lunaire, de DOP, d'EOP, de DRO et de télémétrie RF</b> (<c1/>, avec des jeux de test et des générateurs de référence indépendante sous <c2/>). Chaque recoupement soumet une capacité <b>modélisée</b> déjà livrée à une référence indépendante produite par une implémentation <em>différente</em>, de sorte que l'accord est non circulaire : l'empreinte orbitale d'émission/de capture par rapport à <c3/> (Cephes — une fonction de Bessel J1 réellement différente) ; le DOP de la géométrie des balises de surface par rapport à une résolution NumPy indépendante de <c4/> ; la croissance de l'erreur de prédiction de la persistance UT1/EOP par rapport à une nouvelle analyse NumPy distincte des mêmes lignes IERS <c5/> textuelles ; la famille d'orbites rétrogrades distantes planes par rapport à la base de données NASA/JPL Three-Body Periodic Orbit Database ; et le budget de précision de la télémétrie RF par rapport à une référence issue des premiers principes. Ce sont des preuves de régression supplémentaires pour des modules existants ; l'ajout de ces tests de recoupement ne change à lui seul le statut d'aucune capacité (les cinq promotions ci-dessus sont des changements de statut distincts, adossés à une référence indépendante, dans <c6/>).

# text
# c1: lunar-attack-surface
# c2: src/attack_surface.rs
# c3: kind = "lunar-attack-surface"
# c4: run_toml
seg-662c04f0552f = <b>Scénario <c1/></b> (<c2/>, <c3/>) : une exécution P1 composée, accessible en binaire (CLI / Python / MCP / wasm via <c4/>), de sécurité des signaux lunaires, qui assemble le déficit de puissance du bilan de liaison et sa bande de sensibilité de { "12" } à { "18" } dB, la puissance d'émission de brouillage/leurrage requise en fonction de la distance de sécurité, l'empreinte orbitale de capture sous un diagramme d'antenne réel, le résultat de l'accrochage de capture par leurrage dans la boucle de poursuite, la portée d'horizon d'un corps sans atmosphère, et le budget d'authentification OSNMA/TESLA. Un corps vide reproduit la référence de base P1.

# text
# c1: linkbudget::deficit_sensitivity_band
# c2: deficit_power_factor
# c3: sweep::SweepAxis
# c4: received_signal_power_dbw
seg-a9b7ee942a23 = <b>Bande de sensibilité du déficit de puissance</b> (<c1/>, <c2/>) : un véritable balayage multi-axes (référence × PIRE × distance oblique) construit sur <c3/> et évalué via <c4/>, qui reproduit la bande P1 de { "12" } à { "18" } dB et réconcilie les facteurs linéaires de { "32" }× (arrondi) et de { "36" }× (non arrondi).

# text
# c1: spoof_capture::capture_cube
# c2: capture_map
seg-0734a4ca7535 = <b>Cube de capture par leurrage en trois dimensions</b> (<c1/>) : ajoute l'axe du décalage de porteuse/Doppler à la carte de capture (J/S × décalage de code × décalage de porteuse, temps d'accrochage par cellule) ; la tranche à porteuse nulle se réduit exactement à la <c2/> en 2D.

# text
# c1: monitor_network
# c2: spoof_monitors
# c3: lunar_service
# c4: detection
# c5: SurfaceMonitor
# c6: SpoofEvent
seg-3b9bbc25b114 = <b>La détection par réseau clairsemé de moniteurs</b> (<c1/>) compose désormais la statistique AGC physique de <c2/> et la grille de visibilité sélénographique de <c3/> pour dériver la statistique de détection et la géométrie de chaque station, au lieu de paramètres libres et d'un recouvrement ad hoc par grand cercle ; les probabilités de détection par moniteur et pour le réseau restent les formes closes du khi-deux/Marcum-Q de <c4/>. <b>Les champs <c5/> / <c6/> ont changé</b> pour devenir des grandeurs physiques (lat/lon/alt/puissance).

# text
# c1: nma_budget
# c2: auth_latency
seg-54c36267382c = <b>Dimensionnement de la surcharge d'authentification OSNMA/TESLA</b> (<c1/>) : les portions de champ OSNMA par page (HKROOT de 8 bits + MACK de 32 bits par page de { "2" } s) étaient étiquetées à tort comme des totaux par sous-trame, ce qui sous-estimait la surcharge d'un facteur { "15" } ({ "1.33" } bit/s). Corrigé selon les totaux publiés par sous-trame de 30 s dans le SIS-ICD (HKROOT { "120" } + MACK { "480" } bits ⇒ <b>{ "20" } bit/s</b>). La conséquence est désormais énoncée honnêtement : à un débit de message de navigation AFS de { "50" } bit/s, la surcharge d'authentification représente un coût <b>de premier ordre d'environ { "40" } %</b>, et non quelques points de pourcentage négligeables ; le champ <c2/> est documenté comme le délai de divulgation de la clé (une borne inférieure du délai de bout en bout avant la première position authentifiée).

# text
seg-0cf179a34252 = Une version à large portée en matière de capacités. Elle apporte deux suites d'analyse entièrement <b>validées en externe</b> — une famille complète d'<b>analyse de décision multicritère (MCDA)</b> et les estimateurs de <b>dérive d'Allan / stabilité d'horloge à long τ</b> — et ouvre, au-dessus du substrat, une nouvelle couche de scénarios exécutables : <b>budget temporel lunaire, référentiel/EOP en temps réel, hybride optique/RF, observabilité cislunaire et résilience aux conflits d'un PNT en couches</b>, ainsi qu'un substrat de capacités de <b>balise de surface lunaire</b> et de <b>sécurité des signaux</b>. La matrice de validation vérifiée par machine passe à <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> sur <b>{ "102" } lignes</b> (contre { "40" } · { "47" } · { "4" } sur { "91" }) : les onze nouvelles lignes sont toutes des validations par référence indépendante externe des estimateurs d'analyse de décision et de synchronisation temporelle, vérifiées avec une tolérance serrée par rapport à des bibliothèques indépendantes (SciPy, pymcdm, pyDecision, allantools), tandis que la nouvelle surface de capacités PNT est présentée honnêtement comme MODELLED. Comme toujours, aucune affirmation de modèle numérique n'est relevée de niveau sans un jeu de données externe pour l'étayer.

# text
# c1: kind
# c2: tests/determinism.rs
# c3: scenarios/*.toml
seg-267e50f8dd56 = <b>Scénarios exécutables</b> — chacun étant un <c1/> de scénario enregistré, acheminé par le moteur et prouvé de bout en bout par la CI grâce à <c2/> (qui exécute chaque <c3/> fourni et échoue systématiquement dès qu'une fixture est inexécutable) :

# text
# c1: conflict-resilience
# c2: src/conflict_resilience.rs
# c3: src/conflict_threat_params.rs
seg-c87fc11dd86b = <b>Résilience aux conflits d'un PNT en couches</b> (<c1/>, <c2/>) — un moteur de résilience Monte-Carlo à graine fixée pour une architecture PNT multicouche, avec un modèle de <b>survie par vecteur à dégradation progressive</b> du § { "4.2" } (quatre vecteurs de menace nommés, la forme close de survie du PNT utilisable vers laquelle converge chaque Monte-Carlo par couche, émise dans le JSON du résultat) et une provenance des paramètres de menace documentée et protégée contre la dérive (<c3/>). Architectures MODELLED ; la convergence du Monte-Carlo de survie vers la forme close est le noyau validé.

# text
# c1: cislunar-observability
# c2: src/cislunar_observability.rs
seg-9c69e4d8ade9 = <b>Observabilité cislunaire</b> (<c1/>, <c2/>) — un spectre propre du gramien d'observabilité sur un arc, un générateur de graines d'orbite rétrograde distante (DRO) à correction différentielle, et un recoupement indépendant par filtre d'information en racine carrée dont la covariance a posteriori devient finie exactement au rang d'observabilité complet. Constellation MODELLED ; les invariants de rang, de gramien, de STM et de SRIF sont le noyau validé.

# text
# c1: hybrid-optical-rf
# c2: src/hybrid_integrity.rs
# c3: src/optical_availability.rs
# c4: src/optical_linkbudget.rs
# c5: src/cross_raim.rs
seg-92fb333483e5 = <b>Continuité et intégrité d'un hybride optique/RF hétérogène</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — disponibilité et intégrité inter-domaines lorsque le PNT optique et le PNT RF sont combinés. MODELLED.

# text
# c1: lunar-time-budget
# c2: src/lunar_time_budget.rs
# c3: realtime-frame-eop
# c4: src/realtime_frame_eop.rs
# c5: src/frame_eop.rs
seg-08e2f640ae14 = <b>Budget temporel lunaire endogène</b> (<c1/>, <c2/>) et <b>budget référentiel / EOP en temps réel</b> (<c3/>, <c4/>, <c5/>) — les budgets P3/P4 de temps lunaire et d'orientation de la Terre, dérivés de manière endogène de la chaîne de synchronisation temporelle plutôt qu'affirmés. MODELLED.

# text
seg-52c2f9c2c9a7 = <b>Suites d'analyse validées en externe</b> — des capacités de bibliothèque, chacune entrant dans la matrice sous la forme de nouvelles lignes VALIDATED (vérifiées par rapport à une référence externe indépendante, et non par une auto-vérification) :

# text
# c1: src/mcda/
# c2: tests/mcda_*_reference.rs
seg-709789e8fb04 = <b>Suite complète d'analyse de décision multicritère (MCDA)</b> (<c1/>) — les quatre familles de méthodes : agrégation de valeurs (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), système de rapports (<b>MOORA</b>) et proportionnelle (<b>COPRAS</b>), distance à l'idéal (<b>TOPSIS</b>), programmation de compromis (<b>VIKOR</b>) et surclassement (<b>PROMETHEE II</b> avec six formes de critère généralisé, <b>ELECTRE I</b> concordance/discordance) — plus les poids de priorité par vecteur propre de Perron <b>AHP</b> avec le seuil du rapport de cohérence de Saaty (CR < { "0.10" }), l'utilité <b>MAUT</b>, l'extraction du front de Pareto et l'analyse de <b>sensibilité</b> aux poids. Les neuf agrégateurs reproduisent <b>pymcdm</b> / <b>pyDecision</b> et le vecteur propre AHP concorde avec SciPy/LAPACK, le tout à moins de { "1e-9" } (<c2/>). Le diagramme en tornade de sensibilité est également présenté dans le scénario de résilience aux conflits.

# text
# c1: src/allan.rs
seg-2ce49cbfd8bf = <b>Estimateurs de dérive d'Allan et de stabilité d'horloge à long τ</b> (<c1/>) — <b>MTIE</b> (la statistique de dérive d'erreur temporelle crête à crête d'après laquelle sont rédigés les gabarits de synchronisation ITU-T G.810/G.823/G.8261), la dérive en domaine temporel <b>MDEV</b> et <b>TDEV</b>, et les estimateurs à portée étendue <b>Theo1 / TOTVAR</b>. VALIDATED par rapport à <b>allantools</b> sur la série NIST SP { "1065" } ; l'hybride <b>ThéoH</b> à biais retiré, construit sur TOTVAR, reste honnêtement MODELLED.

# text
# c1: src/assurance/
seg-68bcdf8bd5de = <b>Banc d'assurance / de référence indépendante externe</b> (<c1/>) — un banc de références indépendantes relié directement à la barrière d'honnêteté de la CI, un enregistrement de provenance <b>W3C-PROV</b> avec une racine de Merkle déterministe, et des degrés de liberté équivalents de <b>Greenhall</b> ainsi que des intervalles de confiance du khi-deux sur les estimations de stabilité.

# text
# c1: src/registry.rs
# c2: src/api.rs
# c3: ExternalPack::register_into
seg-dcb91813b24c = <b>Point d'extension PackRegistry / ExternalPack</b> (<c1/>, <c2/>) — un point de répartition par lequel les paquets de capacités passent par un seul registre (la répartition intégrée se trouve sur le chemin critique de la CLI ; les paquets hors arbre se rattachent derrière un <c3/> par défaut), protégé par une suite de tests de référence d'identité octet pour octet et par des barrières de CI autonomes / wasm32.

# text
# c1: kind
seg-16b1f5d249ed = <b>Substrat de capacités modélisées</b> — de nouveaux modules de bibliothèque qui alimentent les scénarios ci-dessus et les suivants (pas encore un <c1/> de scénario autonome) :

# text
# c1: src/lunar_beacon.rs
# c2: src/lunar_perturbed.rs
# c3: src/jamming.rs
# c4: src/linkbudget.rs
seg-f8c9ffbc56cf = <b>DOP de balise de surface lunaire</b> (<c1/>) avec budget de précision réalisée, balayage à N satellites et carte du GDOP, plus une éphéméride lunaire perturbée (<c2/>) et la géométrie d'horizon sans atmosphère / l'inverse de la puissance de leurrage / la bande de déficit AFS (<c3/>, <c4/>). Réutilise le noyau de DOP validé par gnss_lib_py.

# text
# c1: src/realdata/lola_dem.rs
seg-28209a2747d5 = <b>Ingestion de MNT au format LOLA</b> + visibilité directe sur le relief (<c1/>).

# text
# c1: src/spoof_capture.rs
# c2: src/cross_sensor_integrity.rs
# c3: src/monitor_network.rs
# c4: src/antenna.rs
# c5: src/nma_budget.rs
seg-6e98ac90a0e2 = <b>Défense à trois couches de la sécurité des signaux</b> — capture par leurrage, intégrité inter-capteurs et dimensionnement du réseau de moniteurs (<c1/>, <c2/>, <c3/>) avec une empreinte d'antenne à faisceau orbital et un budget d'authentification OSNMA (<c4/>, <c5/>). MODELLED.

# text
# c1: src/verification.rs
seg-bd5b9511accb = La matrice de validation et chaque artefact dérivé ont été régénérés à partir de la source de vérité unique (<c1/>) : le registre du site, les diagrammes de la carte des modules et de la provenance de la validation, ainsi que les chaînes de décompte du README et de chaque surface indiquent désormais <b>{ "51" } / { "47" } / { "4" } sur { "102" }</b> (contre { "40" } / { "47" } / { "4" } sur { "91" }) ; la garde d'honnêteté des décomptes analyse désormais tout l'historique git, et les figures du README sont harmonisées sur la palette de marque sombre.

# text
# c1: integrate
# c2: integrate_dopri
# c3: src/integrator.rs
seg-c2ec7e2b6296 = Un seul pilote d'intégration adaptative partagé soutient désormais à la fois <c1/> et <c2/> (<c3/>), ce qui supprime le pas d'intégration dupliqué.

# text
seg-85cfb0f10268 = Ajout à la CI de l'analyse statique <b>SonarQube Cloud</b> (Rust + couverture importée), avec des badges de notation de sécurité / maintenabilité / fiabilité dans le README.

# text
seg-deeef8318367 = Discipline de publication et de conditionnement : la CI enregistre un environnement de déploiement pour chaque publication de paquet/registre, et la tâche ciblée de publication autonome est écartée des lents binaires de validation.

# text
seg-30181148b098 = La garde d'hygiène contre l'attribution est limitée aux seuls marqueurs de paternité, de sorte que nommer un hôte d'intégration ou un produit ne fait plus échouer la compilation.

# text
seg-6eb3868fdce0 = Documentation : la section <b>Citing</b> du README énumère désormais les quatre prépublications arXiv publiées, et la capacité de DOP de balise de surface est documentée dans la ligne lunaire.

# text
seg-d12533cbf1f2 = Compteurs de boucle entiers pour les boucles pilotées par des flottants (Sonar S2193).

# text
seg-3c213354187f = Inverse du khi-deux précis à faible nombre de degrés de liberté, grâce à un raffinement de Newton dans le chemin des intervalles de confiance de l'assurance.

# text
seg-386b7094d34d = kshana.dev : la section des normes s'ouvre désormais par défaut et le décompte de repli du registre est corrigé ; les chaînes obsolètes du README et du site autour de la couche d'observabilité sont synchronisées.

# text
seg-33448f46894f = Une version de capacités qui ajoute une <b>couche générale d'observabilité par information de Fisher / Cramér–Rao et de plan d'expériences optimal</b>, et la version sur laquelle repose l'article sur l'observabilité du PNT lunaire. La matrice de validation vérifiée par machine passe à <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> sur <b>{ "91" } lignes</b> (contre { "39" } · { "46" } · { "4" } sur { "89" }) : le nouveau moteur d'estimation est vérifié par rapport à une référence indépendante externe et est VALIDATED ; son application lunaire est honnêtement MODELLED. Comme toujours, aucune affirmation de modèle numérique n'est relevée de niveau sans un jeu de données externe pour l'étayer.

# text
# c1: src/fim.rs
# c2: M = HᵀWH
# c3: best_design
# c4: eigh
# c5: inv
# c6: tests/fim_observability_reference.rs
seg-c377207026f4 = <b><c1/> — information de Fisher, bornes de Cramér–Rao et plan d'expériences optimal.</b> Un moteur général et réutilisable de théorie de l'estimation : la matrice d'information de Fisher <c2/> à partir d'une jacobienne de mesure et de poids ; un solveur propre symétrique (Jacobi cyclique) ; la borne inférieure de Cramér–Rao par l'inverse, ou par la pseudo-inverse de Moore–Penrose plus une base de l'espace nul lorsque l'information est de rang déficient (le cas du réseau libre / du défaut de datum) ; et des métriques de plan d'expériences optimal D, A, E et T, avec un sélecteur <c3/> sur des géométries candidates. <b>VALIDATED</b> par rapport à NumPy (<c4/>/<c5/>) et aux bornes en forme close publiées de Kay ({ "1993" }) à { "1e-9" } près (<c6/>), de sorte qu'il entre dans la matrice comme une ligne à référence indépendante externe plutôt que comme une auto-vérification.

# text
# c1: lunar_observability
# c2: src/lunar_combination.rs
seg-91d09b4e737f = <b>Observabilité de la détermination d'orbite conjointe lunaire</b> (<c1/> dans <c2/>, présentée dans le rapport de combinaison lunaire) : applique le moteur FIM/CRLB à la résolution conjointe orbite-horloge pour mettre en évidence le défaut de datum de la station absolue, la restauration de son rang à mesure que des stations de base terrestres sont ajoutées, la CRLB atteinte sur la position de la station, et le conditionnement E-optimal. Honnêtement <b>MODELLED</b> — le moteur d'estimation est validé en externe, mais le réseau lunaire auquel il est appliqué est une simulation représentative, et aucun jeu de données actuel ne peut transformer cette géométrie en mesure.

# text
# c1: orbit_ecc
# c2: orbit_inc_deg
# c3: orbit_argp_deg
# c4: orbit_planes
# c5: elfo_geometry_confirms_the_observability_structure
seg-6b1cd00aca8c = <b>Géométrie représentative d'orbite lunaire elliptique gelée (ELFO)</b> pour le scénario de combinaison lunaire (<c1/>, <c2/>, <c3/>, <c4/> ; le placement circulaire reste la valeur par défaut) et un champ d'observabilité sans VLBI dans le rapport, afin de montrer que le résultat sur le défaut de datum est valable pour toute géométrie. La même échelle { "3" }→{ "1" }→{ "0" } et le même seuil de trois stations valent pour une ELFO de la famille Moonlight/LCNS, et avec trois lignes de base VLBI terrestres, la position absolue de la station est observable avec une borne sub-métrique — verrouillé par <c5/>. Toujours MODELLED.

# text
# c1: src/verification.rs
# c2: web/data/verification-matrix.json
# c3: docs/VERIFICATION-MATRIX.md
# c4: docs/MODELLED-RATIONALE.md
seg-9e6627c0c417 = La matrice de validation et chaque artefact de preuve généré ont été régénérés à partir de la source de vérité unique (<c1/>) : le registre (<c2/>), <c3/>, <c4/>, les figures de ventilation de la validation et de type de référence indépendante, ainsi que les chaînes de décompte du README sur toutes les surfaces de distribution indiquent désormais <b>{ "40" } / { "47" } / { "4" } sur { "91" }</b>.

# text
seg-6f90233290a2 = Une version corrective consacrée uniquement au conditionnement. Aucun changement de moteur, de scénario ou de résultat ; la matrice de validation reste inchangée à { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER sur { "89" } lignes.

# text
# c1: repository.url
# c2: AshfordeOU
# c3: repository
# c4: ashfordeOU
# c5: package.json
seg-9d41e1412d1f = Publication npm : le champ <c1/> du paquet, dérivé du manifeste de la crate, utilisait un propriétaire GitHub à la casse incorrecte (<c2/>), ce qui faisait échouer la vérification de provenance sigstore de npm (qui compare la casse du propriétaire de façon stricte). Le champ <c3/> du manifeste est désormais le <c4/> canonique en minuscules, de sorte que le <c5/> généré correspond au sujet de la provenance et que la version npm est publiée.

# text
# c1: codegen-units = 1
seg-fe1f8aae99f4 = La construction de la roue fixe <c1/> afin que la roue manylinux soit reproductible octet pour octet d'une reconstruction à l'autre (le contrôle de reproductibilité par reconstruction et comparaison).

# text
seg-b87075b47007 = Une version de consolidation centrée sur <b>la preuve, la provenance et la discipline de distribution</b>. La matrice de validation vérifiée par machine passe à <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> sur ses <b>{ "89" } lignes</b> (contre { "15" } · { "42" } · { "4" } sur { "61" }), grâce au recoupement de capacités modélisées avec des références externes indépendantes. Chaque artefact distribué porte désormais une attestation cryptographique de provenance de construction SLSA, est livré avec un SBOM CycloneDX, et est publié de façon synchrone sur toutes les surfaces. Aucune affirmation de modèle numérique n'est relevée de niveau sans un jeu de données externe pour l'étayer ; toute nouvelle capacité reste honnêtement MODELLED.

# text
# c1: src/attitude_dynamics.rs
seg-f6de783bfd29 = <b>Dynamique d'attitude</b> (<c1/>, MODELLED) — équations d'Euler du corps rigide sans couple + cinématique des quaternions (RK4), avec des autotests de lois de conservation (norme du quaternion, énergie cinétique, |Iω|, précession de la toupie symétrique).

# text
# c1: quantum_trade
# c2: tests/fixtures/optical_clock_adev/
# c3: src/sdr.rs
# c4: src/altpnt/terrain.rs
seg-339bc18b9fc4 = <b>Recoupement de capacités modélisées</b> avec des références externes indépendantes, ce qui porte la matrice de validation à { "39" } lignes VALIDATED, chacune adossée à un jeu de données externe (la barrière d'honnêteté de la CI interdit un statut VALIDATED sans un tel jeu). Les validations par référence indépendante externe les plus récentes : la <b>courbe de stabilité mesurée d'une horloge optique</b> (l'ajustement de la courbe d'ADEV de <c1/> reproduit le σ_y(τ) publié de l'horloge à réseau optique de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" } : { "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, intégré sous <c2/>) ; la <b>génération des codes d'étalement GPS L1 C/A</b> (le LFSR G1/G2 de <c3/> reproduit les octals de phase de code du tableau 3-Ia de l'IS-GPS-200 pour les PRN { "1" } à { "9" }) ; et le <b>lecteur de modèle numérique d'élévation SRTM sur un terrain réel</b> (<c4/> lit une tuile SRTM v3 NASA/USGS du domaine public, intégrée, N36W117 / Vallée de la Mort, et situe Badwater Basin dans sa bande de relevé documentée).

# text
seg-665d0dde637b = <b>Nouvelles capacités MODELLED</b>, chacune recoupée en interne avec une forme close ou avec un chemin de code voisin : dynamique de mouvement relatif de Clohessy–Wiltshire / Hill, géolocalisation passive d'émetteurs par TDOA/FDOA, détermination d'attitude de Wahba/TRIAD/QUEST, résolution d'ambiguïté entière de la phase de la porteuse GNSS (LAMBDA), ciblage dans le plan B et assistance gravitationnelle à coniques raccordées, formation de faisceau d'un réseau CRPA anti-brouillage, statistiques d'acquisition GNSS à loi quadratique, ambiguïté de franges / plage dynamique d'un capteur inertiel quantique, bruit d'horloge en loi de puissance IEEE-1139 + plancher de bruit de fréquence de scintillation, et échange de blocs de covariance CCSDS-OEM.

# text
seg-b3f53d5e3c3a = <b>Registre de preuves à source unique</b> avec une documentation de vérification générée et une garde contre la dérive ; un registre de validation consultable sur kshana.dev, avec des liens directs vers les preuves de chaque carte.

# text
# c1: codemeta.json
# c2: .zenodo.json
# c3: tests/citation_metadata_doc_sync.rs
seg-b3c0545157b3 = <b>Métadonnées de citation lisibles par machine</b> — <c1/> (CodeMeta { "2.0" }) et <c2/>, alignés sur le manifeste Cargo par <c3/>.

# text
seg-2ca8875da9de = <b>Provenance de la chaîne d'approvisionnement</b> — attestation de provenance de construction SLSA pour l'archive tar de la crate, les wheels, la sdist et l'archive tar npm ; publication de confiance PyPI par OIDC ; SBOM CycloneDX livré dans la wheel et dans le paquet npm ; comparaison de construction reproductible et vérification après publication.

# text
# c1: robots.txt
# c2: sitemap.xml
# c3: validation-breakdown
seg-18fdecf7f2fa = <b>Découvrabilité</b> — <c1/>, <c2/> et métadonnées Open Graph / JSON-LD sur kshana.dev ; une figure <c3/> générée, dérivée de la matrice.

# text
seg-f80db0b0f545 = <b>README par surface</b> pour crates.io / PyPI / npm, avec une garde d'honnêteté des décomptes.

# text
seg-bd33b21f8f91 = La référence du <b>transfert de temps par effet Sagnac</b> passe à ExternalDataset — la correction de Sagnac pour un tour équatorial complet est désormais vérifiée par rapport aux { "207.4" } ns publiés par Ashby (<em>Living Reviews in Relativity</em> { "6" } : { "1" }, { "2003" }, éq. { "1.29" } ; reproduit à moins de { "0.05" } ns). La capacité composite de transfert de temps reste honnêtement MODELLED.

# text
# c1: oracle-kind-stacked
seg-882133bf1fcc = <b>Documentation, diagrammes et figures actualisés</b> d'après la matrice en vigueur (39/46/4/89) : le diagramme de provenance de la validation, la figure <c1/> (désormais générée à partir de la matrice avec une garde de CI contre la dérive), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, la documentation d'architecture et les tutoriels, et le total du registre sur kshana.dev.

# text
seg-a9be3d71a52c = Reformatage de l'arborescence des sources avec le rustfmt épinglé (chaîne d'outils { "1.93.0" }) — purement stylistique, sans changement de comportement.

# text
# c1: scripts/check-version-sync.sh
seg-4542eb4fabfc = <b>Versionnage synchronisé.</b> Chaque surface de distribution (crate, PyPI, npm, crate MCP + image OCI, extension JetBrains) suit désormais le même numéro de version que le moteur, ce que <c1/> impose dans la CI.

# text
seg-792df0cdc8a7 = <b>Extension JetBrains</b> relicenciée sous <b>AGPL-3.0-only</b> (la version { "0.1.1" } publiée annonçait encore Apache-2.0) et qui tire désormais sa version pour la Marketplace de l'étiquette de version.

# text
# c1: unwrap
# c2: clippy::unwrap_used
seg-171f5649c90f = <b>Renforcement de la robustesse</b> — les <c1/> hors tests sont supprimés ou justifiés ; <c2/> s'applique au code hors tests.

# text
seg-0e5abb2fad02 = Refonte de <b>kshana.dev</b> centrée sur la preuve : bandeau d'accueil dominant, diagrammes d'architecture et figures de résultats, i18n, sections Registre et Normes repliables et adaptatives.

# text
seg-05ef9b9f3653 = <b>Éphéméride précise SP3</b> — application de la correction de nœud de rotation terrestre de l'IGS pendant l'interpolation.

# text
# c1: tests/surface_readme_image_urls_doc_sync.rs
seg-bbd0dc3dd9cb = <b>Images des registres</b> — les README de PyPI/crates.io/npm utilisent des URL d'images absolues ; les chemins d'images relatifs du README principal s'affichaient comme des images cassées sur la page PyPI de la version { "0.21.0" }. Une garde de CI (<c1/>) empêche la régression.

# text
# c1: fmt
# c2: clippy
seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> au vert ; fin de la compilation contre des données réelles ignorées par git.

# text
seg-c3c260b7063e = Tests

# text
# c1: tests/property.rs
seg-5dca3defcfe3 = La covariance d'horloge du filtre de Kalman reste semi-définie positive et symétrique (test de propriété, <c1/>).

# text
seg-c861779f04ca = Gardes de synchronisation de la documentation : chaque chaîne de décompte de validation publique, les métadonnées de citation, la figure générée et les URL d'images des README de surface sont toutes alignées sur leur source de vérité.

# text
# c1: kind
# c2: TradeEvidence
seg-0540044c92a6 = Cette version ajoute deux suites d'applications MODELLED au moteur ouvert — un <b>démonstrateur de PNT à technologies quantiques</b> (transfert de temps quantique de confiance, navigation quantique sans GNSS, détection quantique de défauts/anomalies) et une <b>suite de PNT lunaire / cislunaire</b> (temps-coordonnée lunaire, VLBI lunaire, détermination d'orbite et d'horloge conjointe, réalisation de référentiel, volume de service, PNT différentiel, export d'interopérabilité) — chacune exécutable à partir d'un seul <c1/>, chacune émettant un enregistrement <c2/> honnête ainsi qu'un registre de représentativité / d'écarts avant vol. Elle apporte aussi <b>six nouvelles validations par référence externe indépendante</b>, ce qui porte la matrice de validation vérifiée par machine à <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> sur ses { "61" } lignes. Les nouveaux chiffres d'application sont MODELLED à partir de paramètres illustratifs issus de sources publiques — sans TRL, sans antécédent de vol, sans certification ni aval d'une agence — et les noyaux validés qu'ils réutilisent sont étiquetés comme tels.

# text
# c1: quantum-time-transfer
# c2: quantum-gnss-free-nav
# c3: quantum-anomaly-detect
# c4: TradeEvidence
seg-82a1822f53e2 = <b>Suite de démonstrateurs de PNT à technologies quantiques</b> (<c1/>, <c2/>, <c3/>). Trois domaines d'application MODELLED exécutables derrière le moteur, chacun émettant <c4/> plus un enregistrement de représentativité / d'écarts avant vol :

# text
# c1: src/timetransfer_chain.rs
seg-07532f03a1f1 = <b>Transfert de temps quantique de confiance</b> (<c1/>) — un budget bidirectionnel horloge à réseau optique + liaison photonique contre CSAC + RF, réutilisant le niveau de protection de la synchronisation temporelle, avec une figure de mérite de sécurité face aux attaques par retard/rejeu ({ "1" } − P_md) et une détection d'anomalies d'horloge + latence CUSUM.

# text
# c1: src/quantum_nav_od.rs
seg-4c9036cffe1b = <b>Navigation quantique sans GNSS</b> (<c1/>) — une navigation inertielle à interféromètre à atomes froids contre un INS de qualité navigation pendant une coupure GNSS, en reconnaissant honnêtement que, sans position externe, le biais de l'accéléromètre reste inobservable et que l'erreur continue donc de croître.

# text
# c1: src/quantum_faults.rs
seg-6188f1c6893a = <b>Détection quantique de défauts / d'anomalies</b> (<c1/>) — un catalogue de défauts étiquetés avec une AUC ROC à intervalle de confiance par bootstrap et un défaut minimal détectable pour un taux de fausses alarmes fixé.

# text
# c1: src/quantum_devices.rs
# c2: src/qtrade.rs
seg-9e22314b1337 = Une bibliothèque partagée de modèles d'erreur de dispositifs quantiques (<c1/>) et un banc unifié de comparaison quantique/classique (<c2/>) sous-tendent les trois.

# text
# c1: kind
# c2: src/lunar_time.rs
# c3: src/lunar_vlbi.rs
# c4: src/lunar_combination.rs
# c5: src/lunar_frame_realise.rs
# c6: src/lunar_service.rs
# c7: src/lunar_dpnt.rs
# c8: src/lunar_interop.rs
seg-808e20f28556 = <b>Suite de PNT lunaire / cislunaire.</b> Sept types de scénario (<c1/>) MODELLED exécutables, superposés au noyau CR3BP : <b>temps-coordonnée lunaire</b> (taux séculaire LTC/TCL − TT, <c2/>), observable géodésique de retard <b>VLBI lunaire</b> (<c3/>), estimateur par lots <b>d'orbite et d'horloge conjointes multitechniques</b> (<c4/>), <b>réalisation de référentiel</b> (Helmert à 7 paramètres + raccord WGCCRE de l'IAU { "2015" }, <c5/>), analyse du <b>volume de service de classe Moonlight / LCNS</b> (<c6/>), <b>PNT différentiel lunaire</b> (<c7/>) et un <b>export d'interopérabilité aligné sur LunaNet / IOAG</b> (CCSDS-OEM + échelle de temps lunaire dans l'enveloppe KIF, <c8/>). Tout est MODELLED à partir de paramètres illustratifs issus de sources publiques ; non validé par rapport à un véritable suivi VLBI / Gateway ; aucune affiliation ni aval d'une agence.

# text
seg-a892ce052e3c = <b>Six nouvelles validations par référence externe indépendante</b> (la matrice de validation s'établit désormais à { "15" } validées) :

# text
# c1: tests/cs5071a_reference.rs
seg-c30ae6767c6c = <b>ADEV / HDEV sur une véritable horloge au césium 5071A</b> — validés par rapport aux références aux points décadiques de Stable32 (<c1/>).

# text
# c1: PHASE.DAT
# c2: tests/phasedat_reference.rs
seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV sur la référence <c1/> de Stable32</b> — validés par rapport aux tableaux publiés de Stable32 (<c2/>).

# text
# c1: tests/opssat_ad_reference.rs
seg-e8728f57effa = <b>AUC ROC de détection d'anomalies sur la télémétrie réelle d'ESA OPS-SAT</b> — validée par rapport à scikit-learn (<c1/>).

# text
# c1: tests/icgem_gravity_reference.rs
seg-5446957ac631 = <b>Synthèse de fonctionnelles de gravité ICGEM</b> — validée par rapport à la norme de gravité normale GRS80 (γ de Somigliana à { "3.5e-12" } près ; carte des perturbations EGM2008, <c1/>).

# text
# c1: tests/klobuchar_reference.rs
seg-751c5ac90229 = <b>Modèle ionosphérique diffusé de Klobuchar</b> — validé par rapport à RTKLIB (<c1/>).

# text
# c1: tests/raim_reference.rs
# c2: tests/sbas_reference.rs
seg-dcc6d4e04a5c = <b>Noyau de détection RAIM</b> ({ "171" } cas, <c1/>) et <b>niveau de protection SBAS DO-229E</b> sur des données EGNOS réelles (fork SBAS-PL de RTKLIB, <c2/>) — tous deux validés par rapport à leurs références externes indépendantes.

# text
# c1: src/representativeness.rs
seg-3f6c1ff0b3a4 = <b>Registre de représentativité et d'écarts avant vol</b> (<c1/>). Un enregistrement structuré que chaque démonstrateur émet — ce qui est représentatif, ce qui est simplifié et ce qui sépare le modèle du vol — le pendant honnête de chaque comparaison MODELLED.

# text
# c1: --study-name
# c2: --validate
seg-6b4c78bdaf35 = <b>Agrégation d'études et ergonomie de la CLI.</b> Un manifeste de suite de scénarios avec agrégation d'études en une seule commande, des métadonnées d'étude stables par hachage + <c1/>, une analyse statique des scénarios par <c2/>, et l'affichage du niveau de validation de chaque figure de mérite dans les rapports d'étude.

# text
seg-e24230b80a89 = <b>kshana.dev repensé autour d'un socle de domaine partagé</b> — capacités et validation réunies dans un seul explorateur de domaine avec un vocabulaire commun, les nouveaux îlots validés mis en évidence, un instrument Terre animé fidèle aux terres émergées et un appel à l'action pour demander une étude, ainsi que l'image de marque et les liens d'Ashforde OÜ.

# text
seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE vérifiés pour l'exhaustivité et l'honnêteté</b> — décomptes obsolètes de validés corrigés (désormais { "15" } références externes indépendantes), diagrammes étendus, et citation des prépublications sur le niveau de protection conditionnel de la synchronisation temporelle (arXiv:{ "2606.24210" }) et sur l'écart d'optimisme des perturbations RF (arXiv:{ "2606.22054" }).

# text
# c1: paper/
seg-42a317c6ce06 = Les sources de <c1/> et la chaîne de brouillon JOSS sont conservées dans le dépôt public.

# text
seg-8ed5cf845b00 = Cette version ajoute quatre capacités d'étude au moteur ouvert — un niveau de protection conditionnel de la synchronisation temporelle, une notation de résilience PNT alignée sur un cadre de référence, une évaluation de l'écart d'optimisme face aux perturbations RF, et un front-end de récepteur défini par logiciel / de données réelles — chacune reproductible à partir d'une seule commande et écrivant un artefact déterministe octet pour octet. Toutes les études sont MODELLED (étalonnage synthétique ou sur jeu de données public), portent leur provenance honnête (version du moteur, graines, hachage de configuration) et leurs étiquettes de validation, et ne sont pas des certifications.

# text
# c1: tpl
# c2: cargo run --release --example tpl_jammertest
seg-0c9f0c665491 = <b>Niveau de protection conditionnel de la synchronisation temporelle (<c1/>).</b> Une borne, limitée par le holdover, de l'erreur de temps non détectée en cas de leurrage GNSS, avec un plancher de moniteur à k sigma, une variance de marche libre de van Loan sur la latence de détection et un délai d'alarme CUSUM. Étalonné sur une véritable attaque enregistrée (JammerTest { "2024" }, scénario { "2.1.1" }) via <c2/>, qui reproduit son tableau de référence à partir de scalaires récupérés de l'enregistrement public (le jeu de données brut n'est pas redistribué).

# text
# c1: resilience
# c2: cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json
# c3: docs/RESILIENCE-CROSSWALK.md
seg-d874d7f13f28 = <b>Notation de résilience PNT alignée sur un cadre de référence + étude d'instabilité des décisions (<c1/>).</b> Modèle d'architecture, notation alignée sur RPCF, simplexe de pondération de Dirichlet, instabilité par tau de Kendall et taux d'inversion du top-1, et effondrement de la diversité de mode commun (Hill-N2), avec <c2/>. Table de correspondance dans <a1><c3/></a1>.

# text
# c1: impairment_study
# c2: impairment_ml
# c3: eval_stats
# c4: cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
seg-343f7af54503 = <b>Étude de l'écart d'optimisme face aux perturbations RF (<c1/>, <c2/>, <c3/>).</b> Un panel de 13 détecteurs sur un corpus synthétique fondé sur des paramètres, un écart d'optimisme entre dans la distribution et hors distribution, des tendances de loi d'échelle avec une hypothèse nulle par permutation, et un prédicteur de dégradation par exclusion d'un élément, via <c4/>.

# text
# c1: sdr
# c2: realdata/
seg-6eed55859bbf = <b>Front-end de récepteur défini par logiciel (<c1/>) et adaptateurs de données réelles (<c2/>).</b> De l'IQ/IF brut aux prises du corrélateur et au SQM, plus des adaptateurs d'ingestion (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) et des exemples de sondage. Ils lisent des enregistrements que l'utilisateur fournit localement ; aucun enregistrement n'est versé dans le dépôt.

# text
# c1: optimism-study.json
# c2: resilience-study.json
# c3: paper-artifacts/
# c4: /realdata-cache/
seg-afe2282fa771 = <b>Artefacts d'étude versionnés.</b> Les fichiers <c1/> et <c2/>, déterministes octet pour octet, sont désormais suivis sous <c3/>, de sorte que les chiffres des études peuvent être vérifiés sans reconstruction ; ils restent régénérables à partir des générateurs ci-dessus. Les jeux de données bruts restent hors du dépôt (<c4/>).

# text
# c1: Cargo.toml
# c2: CITATION.cff
# c3: README
seg-450d82cddc28 = Version portée à { "0.20.0" } dans <c1/>, <c2/> et <c3/> ; les artefacts de l'étude de croisement sont régénérés pour que leur estampille corresponde à la version publiée.

# text
# c1: LICENSE
# c2: LICENSING.md
seg-a0a66af8fd14 = <b>Relicencié d'Apache-2.0 vers la GNU AGPL-3.0-only, avec une licence commerciale disponible auprès d'Ashforde OÜ (double licence).</b> Le moteur ouvert reste entièrement ouvert et publiquement vérifiable ; le copyleft réseau de l'AGPL (§{ "13" }) signifie qu'un dérivé fermé ou hébergé doit revenir au logiciel libre — ou prendre une licence commerciale. Cela protège le noyau validé contre le fork suivi de fermeture, tout en conservant la crédibilité d'un moteur public, exécutable et auditable. Voir <a1><c1/></a1> (AGPL) et le nouveau <a2><c2/></a2> (ce que couvre chaque licence et quand elle s'applique).

# text
# c1: LICENSE
# c2: AGPL-3.0-only
# c3: NOTICE
# c4: README
# c5: GOVERNANCE
# c6: GLOSSARY
# c7: Cargo.toml
# c8: pyproject.toml
# c9: CITATION.cff
seg-ffa799fdb814 = <c1/> contient désormais le texte de l'AGPL-3.0 ; les en-têtes SPDX de toutes les sources sont mis à jour en <c2/> ; <c3/>, <c4/>, <c5/>, <c6/>, le site web et les métadonnées de la crate et des paquets (<c7/>, <c8/>, <c9/>, la crate MCP + l'image) sont mis à jour en conséquence.

# text
# c1: CONTRIBUTING.md
seg-8d67aba2af0b = Les <b>conditions pour les contributeurs</b> (<a1><c1/></a1>) concèdent désormais les contributions entrantes sous l'AGPL <b>et</b> accordent à Ashforde OÜ le droit d'inclure les contributions dans l'édition sous licence commerciale, afin que la double licence continue de fonctionner.

# text
# c1: deny.toml
# c2: GOVERNANCE
seg-93644d1c1420 = <b>Politique de dépendances inchangée mais justifiée à nouveau</b> (<a1><c1/></a1>, <c2/>) : les dépendances restent permissives (Apache/MIT/BSD/ISC). L'AGPL n'est autorisée que pour la propre crate de kshana — une <em>dépendance</em> sous copyleft contaminerait l'édition commerciale et briserait la double licence.

# text
# c1: v0.18.0
# c2: v0.19.0
seg-9b77c2d36241 = <b>Note pour l'aval :</b> il s'agit d'un changement de licence vers un copyleft. Les utilisateurs qui comptaient sur les conditions permissives d'Apache-2.0 peuvent continuer à utiliser la dernière version sous Apache-2.0 (<c1/> et antérieures, telles que publiées) ; à partir de <c2/>, c'est l'AGPL-3.0 / licence commerciale.

# text
# c1: pyo3
# c2: BoundList/TupleIterator::nth
# c3: nth_back
# c4: PyCFunction::new_closure
# c5: pyo3
# c6: python
# c7: src/python.rs
# c8: scenario_kinds
# c9: skip_from_py_object
# c10: RunOutput
seg-51e32f15b7ea = <b><c1/> mis à jour de { "0.24" } à { "0.29" }</b> pour éliminer RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) des analyses OSV/de dépendances externes. Ce sont deux avis <em>au niveau des fonctions</em> dont les fonctions concernées (<c2/>/<c3/>, <c4/>) ne sont jamais appelées par Kshana, et <c5/> est une dépendance optionnelle (fonctionnalité <c6/>) — l'exposition réelle était donc nulle — mais la mise à jour maintient une analyse propre pour les auditeurs en aval. Migration de <c7/> vers l'API de pyo3 { "0.29" } (type de retour Bound pour <c8/> ; <c9/> explicite sur la pyclass <c10/>). Les { "11" } tests de liaison Python réussissent avec l'extension reconstruite.

# text
# c1: scenarios/<kind>.toml
# c2: tests/dominance_demonstrators.rs
# c3: VALIDATED
seg-8d9332df5c74 = <b>Onze nouveaux types de scénario exécutables — démonstrateurs à deux appels d'offres, un pont d'interopérabilité CCSDS et une suite de premier ordre d'analyse de mission / d'environnement (tous MODELLED, additifs ; les références de reproductibilité existantes restent inchangées).</b> Chacun peut être lancé par la CLI / Python / WASM / MCP, est livré avec un <c1/> et porte une étiquette MODELLED explicite dans le JSON de son résultat et dans son résumé d'une ligne (un test par type dans <c2/> vérifie que l'étiquette est présente et que la sortie ne contient jamais la chaîne <c3/>) :

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-20b74caf58cc = <c1/> (<c2/>) — banc d'évaluation de la détection par apprentissage automatique des perturbations RF : un corpus <b>synthétique</b> étiqueté + un banc <b>ROC/AUC</b> indépendant du détecteur + un rapport d'<b>écart d'optimisme</b> dans la distribution / hors distribution (caractéristiques opérationnelles uniquement — jamais de données de terrain/IQ).

# text
# c1: quantum-trade
# c2: src/quantum_trade.rs
seg-0253656a0ecf = <c1/> (<c2/>) — comparaison PNT quantique/classique avec ingestion d'ADEV mesurées et une enveloppe de résilience en environnement privé de GNSS.

# text
# c1: space-weather
# c2: src/space_weather.rs
seg-901bd713bd62 = <c1/> (<c2/>) — indices solaires/géomagnétiques (table IAGA Kp↔ap, Ap journalier, F10.7a centré sur 81 jours), température exosphérique de <b>Jacchia-71</b> et couplage de la densité thermosphérique piloté par l'activité sur une atmosphère statique (PAS un modèle de densité absolue NRLMSISE).

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
seg-2323b43c0ffc = <c1/> (<c2/>) — pont d'import et d'aller-retour <b>OEM CCSDS { "502.0" }</b> pour les éphémérides GMAT / Orekit / STK (le lecteur <c3/>, inverse exact de l'écrivain).

# text
# c1: launch-window
# c2: src/launch.rs
# c3: sin Az = cos i/cos lat
seg-188aeb3e8219 = <c1/> (<c2/>) — <b>azimut de lancement</b> à deux corps (<c3/>), Δv de changement de plan, bonus de rotation du site et géométrie des opportunités quotidiennes.

# text
# c1: reentry
# c2: src/reentry.rs
seg-6200a47276e6 = <c1/> (<c2/>) — corridor de rentrée balistique d'<b>Allen-Eggers</b> : décélération maximale, vitesses de pic de g et de pic de chauffage, altitude du pic de g.

# text
# c1: eo-coverage
# c2: src/eo_payload.rs
seg-0874c2241748 = <c1/> (<c2/>) — géométrie d'<b>emprise / GSD / accès / revisite</b> en observation de la Terre (triangle spatial SMAD).

# text
# c1: space-packet
# c2: src/space_packet.rs
seg-83c7588ff074 = <c1/> (<c2/>) — encodage/décodage de l'en-tête primaire de <b>paquet spatial CCSDS 133.0-B</b> avec aller-retour exact au bit près.

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
seg-ae1bcad02880 = <c1/> (<c2/>) — <b>couple de gradient de gravité</b> à 3 degrés de liberté + <b>budget d'erreur de pointage RSS</b> (budget scalaire avant matériel, pas une boucle de commande).

# text
# c1: passes
# c2: src/passes.rs
seg-65f59cc12e02 = <c1/> (<c2/>) — <b>prédiction des passages lever/coucher</b> d'une station au sol (AOS/TCA/LOS, élévation maximale, accès).

# text
# c1: link-budget
# c2: src/linkbudget.rs
# c3: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-178776497627 = <c1/> (<c2/>) — équation de liaison unidirectionnelle <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / marge / fermeture).

# text
# c1: hybrid-ukf
# c2: src/fusion/hybrid_ukf.rs
# c3: scenarios/hybrid-ukf.toml
# c4: src/fusion/tightly_coupled17.rs
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: clock_state::q_from_allan
# c8: q_wf
# c9: q_rw
# c10: q_factor
# c11: r_factor
# c12: Ukf::update_stats
# c13: TightlyCoupled17::{update_gnss_nis, nees, nees_subset}
seg-e7fee32a00f5 = <b>UKF hybride quantique + classique à couplage serré à 17 états — présenté comme un scénario exécutable (MODELLED).</b> Un nouveau type de scénario <c1/> (<c2/>, <c3/>) qui transforme le filtre non parfumé GNSS/INS à couplage serré à 17 états, jusque-là réservé à l'API (<c4/>), en un scénario que les liaisons CLI/Python/WASM/MCP peuvent lancer. Le vecteur d'erreur à 17 états est constitué des <b>{ "15" } états d'erreur INS</b> (position, vitesse, désalignement d'attitude, biais d'accéléromètre + de gyroscope) augmentés de la <b>correction du biais d'accéléromètre issue du CAI</b> — l'interféromètre à atomes froids (<c5/>) fixe le plancher de marche aléatoire de vitesse <c6/>, de sorte que la dérive à long terme en marche libre est celle qu'impose le capteur quantique — et d'une <b>horloge à 2 états phase + fréquence</b> dont le bruit de processus provient du <b>moteur d'horloge à paramètres q</b> (<c7/>, qui met en correspondance le profil d'écart-type d'Allan d'une horloge avec les DSP <c8/>/<c9/>, mises à l'échelle en unités de distance). La plateforme est assistée par GNSS pendant une phase d'amorçage (le filtre apprend les biais, la vitesse et l'horloge), puis traverse en marche libre une coupure GNSS avec la seule IMU à CAI et l'horloge, de sorte que l'exécution démontre une hybridation <b>IMU classique à court terme + quantique à long terme</b>. La figure de mérite est <b>l'autocohérence du filtre</b> : le <b>NEES</b> agrégé (Normalised Estimation Error Squared, sur le sous-ensemble position/vitesse/horloge estimable) et le <b>NIS de blancheur de l'innovation</b> (Normalised Innovation Squared) sur un ensemble Monte-Carlo, vérifiés par rapport à leurs bandes de χ² à { "95" } % (Bar-Shalom §{ "5.4" }). Le filtre adapté tombe dans les bandes ; un filtre volontairement mal réglé (les paramètres <c10/> / <c11/>) est signalé — un critère objectivement vérifiable et discriminant, et non une simple validation de pure forme. <b>La vérification NEES / blancheur de l'innovation est la RÉFÉRENCE STATISTIQUE INDÉPENDANTE : un énoncé d'autocohérence (la covariance rapportée par le filtre correspond honnêtement à la dispersion de ses propres erreurs sous le bruit modélisé), PAS une garantie de précision en conditions réelles.</b> Portée honnête : tout est <b>modélisé / simulé</b> — les entrées du CAI et de l'horloge sont des valeurs encadrées, représentatives de la littérature, et non du matériel mesuré ; le matériel du CAI et sa personne clé restent la propriété du partenaire ; rien ici n'implique un TRL > { "3" }, un antécédent de vol ou une validation externe (le JSON du résultat et le résumé d'une ligne portent explicitement ces étiquettes). La trajectoire unique, à vitesse constante et à plat, ne rend les états d'attitude et de biais d'IMU qu'à peine observables ; le NEES est donc évalué sur les { "8" } états estimables ; une trajectoire avec manœuvres pour une observabilité complète des 17 états figure dans la feuille de route. Ajoute aussi l'instrumentation de cohérence <c12/> (qui renvoie le NIS de chaque mise à jour) et <c13/>. Tous les scénarios existants sont inchangés (additif ; références de reproductibilité inchangées).

# text
# c1: terrain-slam
# c2: src/altpnt/sequential.rs
# c3: scenarios/terrain-slam.toml
# c4: particle_filter
# c5: terrain-nav
seg-9b55f4ac5053 = <b>Navigation séquentielle (récursive) référencée au relief — SITAN comme filtre en continu.</b> Un nouveau type de scénario <c1/> (<c2/>, <c3/>) qui exécute le modèle de mesure existant altimètre contre MNT <b>époque par époque</b> à travers le moteur SIR <c4/>, plutôt que par la recherche grossière-à-fine par lots qu'utilise <c5/> pour retrouver un unique décalage <em>constant</em> de l'INS. À chaque point de passage, le nuage est propagé par l'incrément rapporté par l'INS (lui-même corrompu par la croissance de la dérive à chaque pas), repondéré par la correspondance au relief et rééchantillonné en cas de dégénérescence — de sorte qu'une dérive d'INS <b>variable dans le temps</b> est <em>suivie</em> le long de la trajectoire, ce qu'un ajustement à décalage constant ne peut structurellement pas faire. Sur le MNT synthétique, l'estimation récursive reste bornée et reconverge (final ≈ { "70" } m) alors que la solution inertielle sans aide diverge sans borne jusqu'à ≈ { "5" } km ; l'erreur à chaque époque suit le caractère distinctif du relief (le filtre dérive sur l'INS biaisé au-dessus des cols plats et se reverrouille au-dessus d'un relief marqué), et le moniteur de taille d'échantillon effective confirme un nuage sain. Portée honnête : la carte est <b>connue et fixe</b> — <em>localisation</em> récursive par rapport à un MNT stocké (la moitié localisation du SLAM sur relief), et non estimation conjointe de la carte ; non circulaire par construction (la rampe de dérive injectée est la vérité indépendante). Tous les scénarios existants sont inchangés (additif ; références de reproductibilité inchangées).

# text
# c1: src/holdover.rs
# c2: src/impairment_eval.rs
# c3: src/quantum_trade.rs
# c4: src/navsignal.rs
# c5: src/inertial/quantum_imu.rs
# c6: src/verification.rs
seg-87ba3bc926fa = <b>Socle de résilience sans GNSS + tranches de démonstrateur FutureNAV</b> (<c1/>, et fondations d'enveloppe de résilience sous <c2/>, <c3/>, <c4/>, <c5/>, avec des tranches de vérification FutureNAV dans <c6/>). Compose les briques de PNT alternatif — holdover d'horloge, poursuite du signal, marche libre inertielle, relief — en un seul récit de résilience à une coupure GNSS. MODELLED ; additif.

# text
# c1: src/interchange.rs
seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — une enveloppe d'artefact versionnée et autodescriptive</b> (<c1/>). Une enveloppe étiquetée par schéma autour des résultats de scénario, de sorte qu'un artefact stocké porte avec lui son type, sa version de schéma et ses étiquettes MODELLED/VALIDATED, et que les anciennes enveloppes restent lisibles avec compatibilité ascendante. Additif ; le JSON de résultat existant est inchangé.

# text
# c1: src/navsignal.rs
# c2: src/cr3bp.rs
seg-07147766ab22 = <b>Modulation / poursuite du signal de navigation + correcteur différentiel de halo/NRHO en CR3BP</b> (<c1/>, <c2/>). Un modèle de premier ordre de modulation et de poursuite du signal de navigation, et un correcteur différentiel du problème circulaire restreint à trois corps pour les orbites de halo / de halo quasi rectiligne, présentés sur l'axe existant des capacités d'espace lointain. MODELLED.

# text
# c1: impairment-eval
# c2: src/impairment_eval.rs
seg-d0d2366e3351 = <b>Mode d'évaluation du décalage de distribution + réglage de l'échelle de sévérité du corpus pour <c1/></b> (<c2/>). Ajoute une séparation explicite dans la distribution / hors distribution et une échelle de sévérité du corpus réglable au banc d'écart d'optimisme ROC/AUC (caractéristiques opérationnelles uniquement — jamais de données de terrain/IQ).

# text
# c1: src/frugal.rs
# c2: src/integrity_impact.rs
seg-9bb8ee93e70b = <b>ROI par couverture + mise en correspondance des détections manquées avec l'impact sur l'intégrité</b> (<c1/>, <c2/>). Un regard de ROI en ingénierie frugale (coût par unité de couverture) et une mise en correspondance entre le taux de détections manquées et l'impact sur l'intégrité. MODELLED ; additif.

# text
# c1: src/inertial/quantum_imu.rs
# c2: hybrid-ukf
seg-55f8ba5b52ee = <b>Fiche de paramètres citée du modèle d'erreur de l'interféromètre à atomes froids (CAI)</b> (<c1/>). Une fiche de paramètres encadrés, référencés dans la littérature, pour le modèle inertiel du CAI — les entrées sont <b>citées, et non issues de matériel mesuré</b> (aucune revendication de TRL ni de vol) ; elle alimente le plancher de marche aléatoire de vitesse de <c2/>.

# text
seg-cfbff4acc64c = Gouvernance du projet.

# text
# c1: GOVERNANCE.md
# c2: none → partial
seg-982f9ea3eee8 = <c1/> documentant le modèle de décision et la frontière entre ouvert et fermé ; la ligne communauté/gouvernance de la carte des capacités passe de <c2/> pour en rendre compte.

# text
# c1: b_nom
# c2: b_k = Σ_i |s_i|·b_nom
# c3: #[serde(default)]
# c4: sigma_ura_m
# c5: b_nom_m
# c6: docs/ARAIM_REFERENCE.md
# c7: b_k
seg-c9ff6a7183eb = <b>Niveau de protection d'intégrité ARAIM — biais nominal (<c1/>) et σ_URA désormais appliqués.</b> Le niveau de protection MHSS soustrait désormais la projection unilatérale du biais nominal <c2/> pour chaque mode de défaut, et utilise le sigma d'<b>intégrité</b> σ_URA (distinct du sigma de <b>précision</b> σ_URE) porté par l'Integrity Support Message. Cela rend le niveau de protection plus prudent et correct au regard des normes, et <b>modifie donc les valeurs de PL rapportées par les scénarios d'intégrité existants</b>. L'ISM/le scénario gagne les champs <c3/> <c4/> / <c5/>, de sorte que les entrées qui les laissent non définis conservent le comportement antérieur. Voir <c6/> pour la formule <c7/> rétablie et la note d'implémentation honnête.

# text
seg-c408f8944ac6 = Cohérence du khi-deux du moniteur de leurrage.

# text
# c1: parity_raim_test
# c2: raim::chi2_quantile
seg-92e2b5c5458c = <c1/> utilise désormais le chemin commun d'inverse du khi-deux <c2/>, ce qui supprime une seconde implémentation divergente du khi-deux, de sorte que le RAIM et le moniteur de leurrage par parité s'accordent sur leurs seuils.

# text
# c1: gravity-map-nav
# c2: kind=
seg-6d424034e500 = <b><c1/> raccordé au répartiteur de la CLI.</b> Le scénario n'était auparavant accessible que par l'API ; il est désormais lancé comme un <c2/> à l'instar de tous les autres scénarios.

# text
# c1: api::list_scenario_kinds().len()
# c2: scenario_count_doc_sync
seg-62c3efb54991 = <b>Exactitude de la documentation et des décomptes.</b> Les décomptes de types de scénario du README sont désormais alignés sur <c1/> par un test <c2/>, de sorte que le décompte documenté ne peut plus diverger du répartiteur.

# text
# c1: Body{mu, re, zonals, gravity, rotation, IAU-pole}
# c2: EphemerisProvider
# c3: mars-pnt
# c4: xval/anise-mars-od
# c5: cargo deny
seg-5f0f497aa643 = <b>PNT de l'espace lointain et de Mars — moteur ouvert de navigation radiométrique + simulation GSE.</b> Un nouvel axe de capacités, entièrement additif, au-dessus du noyau validé sur la Terre (chaque scénario terrestre existant est <b>identique octet pour octet</b> — les références de reproductibilité passent sans changement et sans régénération). Il ajoute : un noyau de dynamique multicorps (<c1/> avec la gravité tesséral GMM-3 de Mars, un référentiel martien lié au corps de l'IAU, un point d'extension <c2/> enfichable, des dates juliennes en deux parties inférieures à la microseconde et TT↔TDB) ; des observables radiométriques (temps de lumière itératif + délai de Shapiro, Doppler et distance à deux/une/trois voies par la résolution à deux trajets de Moyer, retournement cohérent du transpondeur, télémétrie régénérative/PN selon CCSDS { "414" }, Δ-DOR selon CCSDS { "506" }, milieux plasma solaire/troposphère/ionosphère) ; l'analyse et l'émission CCSDS-TDM ({ "503" }) ; un filtre d'information en racine carrée à dynamique réduite avec des accélérations empiriques RTN, une horloge embarquée à trois états et un modèle de traînée martienne ; un estimateur de fusion conjoint à une et deux voies ; la surface de scénarios <c3/> (constellation relais + LMO/transfert/surface) à travers la CLI, Python, WASM, MCP et le bac à sable ; et un simulateur de performance GSE de bout en bout (géométrie → bilan de liaison → observables → SRIF → covariance). <b>Niveau de validation — validé par simulation :</b> détermination d'orbite synthétique en boucle fermée (Mars-LMO ≈ { "0.2" } m) et autocohérence analytique, avec la dynamique martienne centrée sur le Soleil recoupée de façon indépendante avec JPL <b>DE440</b> (<c4/>, conditionné à la présence du noyau : { "137" } m sur un arc de 1 jour, le résidu honnête de n corps non modélisé). Les précisions d'espace lointain indiquées sont des <b>figures de mérite de simulation / de covariance</b>, et non des résultats de mission réelle ; la validation par des données de suivi réelles DSN/ESTRACK reste sur la feuille de route. ANISE (MPL-2.0, édition 2024) est confiné à une crate de recoupement exclue de l'espace de travail, de sorte que la barrière de licences <c5/> et la tâche MSRV-1.75 ne sont pas touchées.

# text
# c1: ephemeris
# c2: eop_finals2000a
# c3: finals2000A
# c4: EopSeries
# c5: precise_od
# c6: dut1_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: kshana --eop <finals2000A>
# c10: precise_od
seg-2ab34100a2d7 = <b>Traces au sol d'une exactitude de niveau agence à partir de la véritable orientation terrestre de l'IERS.</b> Le scénario <c1/> accepte un champ facultatif <c2/> — le corps intégré d'un véritable fichier IERS <c3/> — et réduit la trace au sol au moyen de l'UT1−UTC et du mouvement du pôle de chaque époque, interpolés à partir de ce fichier (la même <c4/> qu'utilise <c5/>), en remplaçant les scalaires nominaux <c6/>/<c7/>/<c8/>. Les données voyagent dans le scénario, de sorte que l'exécution reste reproductible et n'a besoin d'aucun système de fichiers (elle fonctionne dans le bac à sable WASM). Une option <c9/> intègre un fichier réel au scénario depuis la CLI. Cela supprime l'asymétrie selon laquelle seul <c10/> consommait de véritables données d'orientation terrestre.

# text
# c1: frames::itrf_to_teme
seg-e778245e7d8f = <b>Cohérence de référentiel pour la vitesse radiale.</b> La station au sol est désormais ramenée dans le référentiel inertiel par l'inverse exact de la réduction du satellite (<c1/>, qui annule le mouvement du pôle <em>et</em> la rotation sidérale) au lieu d'une rotation GMST aveugle au mouvement du pôle, de sorte que les deux extrémités partagent un même référentiel. L'effet sur le Doppler rapporté est inférieur au plancher de validation, mais cela supprime un véritable désaccord de référentiel et une affirmation excessive d'« exactitude » dans le code source.

# text
# c1: carrier_hz
# c2: step_s
seg-3b912d8a819d = <b><c1/> est validé.</b> Une fréquence porteuse nulle ou non finie renvoie désormais une erreur au lieu de produire en silence un Doppler nul (elle rendait λ = c/porteuse infini), comme la garde existante de <c2/>.

# text
# c1: src/precise_od.rs
# c2: PreciseForceModel
# c3: finals2000A
seg-7d70317ca717 = <b>Validation du modèle de forces par ajustement d'éphéméride, recoupée avec de véritables produits d'agences.</b> Un nouvel estimateur par moindres carrés par lots (<c1/>) avec une matrice de transition d'état variationnelle et une édition des valeurs aberrantes, piloté par un modèle de forces complet (<c2/> : géopotentiel EGM2008, corps tiers, marées solides + océaniques + atmosphériques, et accélérations empiriques CPR/2 par tour), alimenté par un véritable analyseur d'orientation terrestre IERS <c3/>. Validé par rapport à des orbites de référence publiées : <b>Galileo MEO à { "13" } cm après ajustement</b>, <b>Swarm-A LEO</b> de l'ESA et <b>LRO lunaire</b> (sélénocentrique, gravité GRAIL, référentiel du corps IAU-2015 — dynamique réduite { "6.6" } m, honnêtement au-dessus de l'objectif de { "5" } m sur le chemin ouvert ; le chemin ANISE/DE440 de niveau DE qui l'atteint est une crate exclue de l'espace de travail).

# text
# c1: spoof-detect
seg-bf88a3eb4733 = <b>Scénario <c1/></b> — un détecteur de leurrage multicouche intégré, combinant la parité RAIM de chaque époque, des moniteurs d'AGC et de qualité du signal (SQM) et une décision fusionnée, validé par rapport aux paramètres de scénario <b>TEXBAT</b> publiés (Humphreys et al., ION GNSS { "2012" }), y compris le cas difficile à porteuse alignée.

# text
# c1: ephemeris
seg-976036ba124b = <b>Scénario <c1/> — état, référentiels, trace au sol et Doppler.</b> Propage un satellite (TLE→SGP4 ou orbite analytique) et émet, à chaque pas, l'état inertiel TEME et GCRS (<b>position <em>et</em> vitesse</b>), la position ITRF/ECEF liée à la Terre, la <b>trace au sol</b> du point subsatellite WGS-84 (latitude / longitude / altitude), ainsi que l'azimut / l'élévation / la distance topocentriques avec la vitesse radiale et le <b>Doppler</b> depuis une station au sol. Accessible depuis la CLI, Python, WASM et le serveur MCP, et livré comme <b>préréglage « Trace au sol »</b> dans le bac à sable web, où la trace est dessinée <b>sur une véritable carte du monde</b> (côtes Natural Earth { "1" }:110m, intégrées — sans réseau ni dépendance externe).

# text
# c1: --export-oem
# c2: export_oem = true
seg-761c95f2ede5 = <b>Export CCSDS OEM</b> (<c1/> / <c2/>) — l'Orbit Ephemeris Message porteur de la vitesse, consommé par GMAT / Orekit / STK, à parité avec les exports SP3 et OMM existants.

# text
seg-111b0896fdd4 = <b>Marées terrestres solides, océaniques (FES2004) et atmosphériques (Ray { "2001" } S2)</b> sur le géopotentiel (Conventions de l'IERS, chap. { "6" }), intégrées au modèle de forces.

# text
seg-7e392131261a = <b>Wheels ARM64</b> — la construction PyPI produit désormais aussi des wheels Linux aarch64 (manylinux_2_28), macOS arm64 et Windows arm64.

# text
seg-7cc04ea3362b = <b>Rapport technique étendu (prépublication)</b> lié depuis le README, et article JOSS rendu soumissible (ORCID de l'auteur, compilé en PDF dans la CI à chaque modification).

# text
seg-3b1e95acc728 = <b>Référentiels validés au millimètre par rapport aux vecteurs publiés de Vallado.</b> La réduction TEME→PEF/ITRF, la chaîne complète CIO IAU 2006/2000A GCRS→ITRS et la conversion ECEF→géodésique WGS-84 sont désormais alignées sur l'exemple détaillé de Vallado et al. (AIAA 2006-6753) avec ses EOP de l'IERS, et non plus seulement sur l'autocohérence interne.

# text
# c1: hifitime
seg-fd9818877a6c = <b>Recoupements indépendants d'échelles de temps.</b> L'ERA et les échelles UTC/TAI/TT concordent avec <c1/> à moins de { "1" } µs, et l'éphéméride planétaire DE440 concorde avec JPL Horizons (positions géocentriques de la Lune et du Soleil), les deux comme barrières de CI toujours actives.

# text
seg-75aeec4cd6d0 = Le bac à sable web masque l'onglet des figures de mérite lorsqu'un résultat ne comporte aucune ligne de figure de mérite, de sorte que les paquets à graphique seul (éphéméride, RAIM, leurrage) s'ouvrent sur leur graphique — pour l'éphéméride, la trace au sol — plutôt que sur un tableau vide.

# text
seg-b8ab0cc3ce7f = Les curseurs guidés du bac à sable <b>et le balayage de paramètres fonctionnent désormais pour le scénario d'éphéméride / de trace au sol</b> : ses réglages (latitude / longitude de la station, pas de temps, durée, UT1−UTC) sont ajustables, et un balayage peut tracer la géométrie du passage (élévation maximale, Doppler maximal, altitude, vitesse) en fonction de n'importe lequel d'entre eux — par exemple l'élévation maximale en fonction de la latitude de la station. L'onglet Balayage n'est désormais affiché que lorsqu'un scénario est réellement balayable, de sorte qu'aucun paquet ne propose une commande qui ne trace rien.

# text
# c1: DUT1 ≈ 0
# c2: CAPABILITY.md
seg-9e7a37e51940 = Documentation de l'approximation SGP4 <c1/> à l'endroit de l'appel de GMST (une erreur de rotation ≤ ~{ "13" }″, bien en deçà de l'erreur propre au modèle de SGP4) et actualisation de <c2/>.

# text
# c1: kshana.dev
seg-174a75e840b0 = L'extension JetBrains <b>Kshana — PNT simulator</b> est désormais publiée et approuvée sur la <a1>JetBrains Marketplace</a1>. Le README, <c1/> et la documentation de distribution y renvoient directement.

# text
# c1: server.json
# c2: description
# c3: io.github.ashfordeOU/kshana-mcp
seg-4deaf7918fff = <b>La publication au registre MCP</b> réussit désormais : le champ <c2/> de <c1/> dépassait la limite de 100 caractères du registre (HTTP { "422" }). Il a été raccourci, et le nom du serveur (ainsi que l'étiquette de propriété de l'image) a été aligné sur l'espace de noms canonique <c3/>.

# text
# c1: 0.1.1
seg-1408961042a1 = <b>La publication à la JetBrains Marketplace</b> réussit désormais : la CI retéléversait la même version de l'extension que celle qui avait été listée manuellement, ce que la Marketplace refuse. La version de l'extension passe à <c1/>, et la garde d'idempotence traite maintenant aussi une réponse « already contains version » comme un succès sans effet.

# text
# c1: kshana.dev
# c2: style.css
# c3: app.js
seg-74e8cab2f10e = <b>Invalidation de cache pour <c1/></b> : les chaînes de requête <c2/>/<c3/> estampillées de la version suivent la publication, de sorte que les visiteurs qui reviennent obtiennent toujours la construction actuelle.

# text
# c1: kshana-mcp
# c2: mcp/kshana-mcp/
# c3: rmcp
# c4: run_scenario
# c5: list_scenario_kinds
# c6: validate_scenario
# c7: export_sp3
# c8: export_omm
# c9: kshana::api
seg-65949229eed7 = <b><c1/> — Kshana comme serveur Model Context Protocol (MCP)</b> (<c2/>). Une crate autonome, exclue de l'espace de travail (le SDK <c3/> est en édition { "2024" }), qui expose le moteur validé aux agents et assistants d'IA — Cursor, JetBrains AI Assistant / Junie et tout client MCP — via stdio. Outils : <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, chacun étant une fine enveloppe autour de <c9/>.

# text
# c1: ide/jetbrains/
# c2: .toml
seg-bd792f66363c = <b>Extension pour IDE JetBrains</b> (<c1/>). Clic droit sur un scénario <c2/> → <b>Run Kshana Scenario</b> ; les figures de mérite et le JSON du résultat arrivent en flux dans une fenêtre d'outils Kshana. Extension Kotlin de plateforme pure, compatible avec tous les IDE JetBrains { "2024.3" }+.

# text
seg-755358390517 = <b>Distribution publique + publication automatique à chaque version</b> pour les deux :

# text
# c1: kshana-mcp
# c2: cargo install kshana-mcp
# c3: publish.yml
seg-14fc2fd73553 = <c1/> sur <b>crates.io</b> (<c2/>) via <c3/>.

# text
# c1: kshana-mcp
# c2: ghcr.io
# c3: docker run ghcr.io/ashfordeou/kshana-mcp
# c4: mcp-publish.yml
seg-2b39bbfc0581 = <c1/> sous forme d'<b>image OCI</b> multi-architecture sur <c2/> (<c3/>) via un nouveau <c4/>.

# text
# c1: kshana-mcp
# c2: server.json
seg-c824d1532eb6 = <c1/> dans le <b>registre MCP officiel</b> via GitHub OIDC (aucun secret) ; l'entrée du registre (<c2/>) utilise le type de paquet OCI avec un propriétaire vérifié par étiquette.

# text
# c1: publishPlugin
seg-f90da0c61aac = l'extension pour IDE sur la <b>JetBrains Marketplace</b> via <c1/> (conditionné par un jeton, signature de développeur facultative) à chaque étiquette de version.

# text
# c1: xval/anise-frames/
# c2: kshana
# c3: kshana::cio::gcrs_to_itrs_matrix
# c4: earth_latest_high_prec.bpc
# c5: finals2000A
# c6: anise
# c7: hifitime
# c8: kshana
# c9: Cargo.lock
# c10: cargo deny
# c11: default-features = false
# c12: frame-xval
# c13: report.{json,md}
# c14: workflow_dispatch
# c15: main
# c16: docs/VALIDATION.md
# c17: ROADMAP.md
seg-21d7457dad23 = <b>Validation croisée indépendante de référentiels avec ANISE/SPICE</b> (<c1/>). Une crate autonome, exclue de l'espace de travail, recoupe la réduction CIO IAU 2006/2000A de <c2/> (<c3/>, GCRS→ITRS) avec la rotation GCRF→ITRF93 d'<b>ANISE</b> (la réimplémentation NAIF/SPICE en Rust pur) à partir du fichier <c4/> de JPL, avec les <b>mêmes paramètres d'orientation terrestre IERS <c5/> fournis aux deux côtés</b>, sur huit époques trimestrielles de { "2020" } à { "2023" }. Les deux réalisations indépendantes du référentiel concordent avec une <b>rotation relative maximale de { "0.028" }″ — ≤ { "0.86" } m au sol, ≤ { "0.93" } m en LEO, ≤ { "3.6" } m en orbite GNSS</b>, ce qui respecte avec une large marge le recoupement de référentiel « < { "10" } m » de longue date de la ROADMAP (il complète, sans la remplacer, les ancrages SOFA/ERFA existants identiques bit pour bit). La crate est isolée parce que <c6/> + <c7/> sont sous MPL-2.0 / édition 2024 et ne doivent jamais entrer dans le graphe de dépendances publié de <c8/>, son <c9/>, la barrière de licences <c10/> ni la construction MSRV ; ANISE est épinglé avec <c11/>. Comprend un binaire <c12/> (qui télécharge le BPC d'environ { "5" } Mo, affiche un tableau et écrit <c13/>), une barrière de test qui s'ignore elle-même en l'absence de noyau ou de réseau, et une tâche de CI facultative réservée à <c14/> (qui ne bloque jamais <c15/>). Documenté dans <c16/> (ligne CIO) et <c17/>.

# text
# c1: .panel
# c2: min-width: auto
# c3: min-width: 0
seg-eb45b43dacc2 = <b>Bac à sable adapté aux mobiles.</b> Correction du débordement horizontal du <c1/> du bac à sable sur téléphone (un élément de grille CSS dont la valeur par défaut <c2/> s'affichait environ { "100" } px plus large que la fenêtre d'affichage) via <c3/> et des commandes à largeur contrôlée ; vérifié sans défaut à { "360" } / { "390" } / { "414" } / { "768" } px. Alignement des boutons d'action « Épingler pour comparer » / « Télécharger le rapport » (boîtes de marge égales dans la ligne flex). Agrandissement des boutons d'exécution, curseurs, listes déroulantes et liens de navigation jusqu'au minimum d'environ { "44" } px pour les cibles tactiles WCAG { "2.5.5" } / Apple HIG sur téléphones et appareils tactiles, la taille sur ordinateur restant inchangée.

# text
# c1: sbas_protection_level
# c2: Some
# c3: propagate
# c4: propagate_dopri
# c5: lunar_look_angle
# c6: [0, 360)
# c7: SphericalHarmonicField::from_gfc
# c8: GM
seg-fe5095d5e61f = <b>Renforcement de la robustesse à l'issue d'une passe de test adverse.</b> ({ "1" }) <c1/> rejette désormais les élévations/azimuts/variances non finis et les diagonales de covariance négatives ou non finies (une géométrie quasi singulière amplifiée par un petit σ pouvait auparavant franchir la barrière du pivot absolu et renvoyer un VPL NaN / un HPL absurde sous la forme d'un <c2/> <em>valide</em> — une défaillance silencieuse de l'intégrité). ({ "2" }) Le propagateur numérique (<c3/>/<c4/>) échoue de façon sûre sur un état initial non fini au lieu de faire tourner indéfiniment le contrôleur adaptatif. ({ "3" }) L'assistant de cellule du MNT ne panique plus sur une grille à un seul échantillon ({ "1" }×N). ({ "4" }) L'azimut de <c5/> est maintenu strictement dans <c6/>. ({ "5" }) <c7/> rejette un <c8/>/rayon non physique (NaN / non positif).

# text
# c1: validation_report
# c2: kshana-validation-summary.html
seg-9ca339d8977a = <b>Binaire <c1/> + artefact de version</b> : un générateur sans dépendance qui émet un résumé de validation HTML d'une page, prêt à imprimer, qui indexe chaque validation imposée par la CI (SGP4 666/666, EGM2008, référentiels identiques bit pour bit, Allan du NIST, fiches techniques d'IMU, ARAIM/SBAS, reproductibilité sur 3 systèmes d'exploitation, couverture) avec son test et sa référence indépendante externe. Le workflow de publication génère <c2/> et le joint (avec la provenance SLSA) à chaque version étiquetée.

# text
# c1: tests/python/test_numpy_interop.py
# c2: auditwheel show
seg-bd231d07658f = <b>pytest d'interopérabilité numpy + durcissement des wheels</b> : <c1/> (exécuté dans la CI) plus un conteneur manylinux épinglé et une étape de vérification <c2/> dans la construction de la wheel.

# text
# c1: docs/tutorials/
# c2: tests/tutorials.rs
seg-5427cae6fc39 = <b>Tutoriels et formation</b> : <c1/> (trois tutoriels détaillés, des scénarios annotés par domaine, des exercices de niveau Tier-1/2/3) avec <c2/> qui aligne chaque nombre cité sur la sortie réelle du moteur.

# text
# c1: paper/
# c2: notebooks/
# c3: submissions/
# c4: FUNDING.yml
seg-2fad9124c5a6 = <b>Artefacts de soumission externe</b> (<c1/>, <c2/>, <c3/>) : un brouillon d'article JOSS, un notebook quantique contre classique, et des kits prêts à déposer pour awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, plus <c4/> — préparant les étapes externes de soumission.

# text
# c1: altpnt
# c2: .hgt
# c3: terrain-nav
# c4: combined-altpnt
seg-0f88f8bccbc1 = <b>Navigation PNT alternative référencée au relief et combinée</b> (module <c1/>) : un navigateur de correspondance de relief TERCOM/SITAN sur un MNT (chargeur <c2/> + générateur de fixtures synthétiques) et un navigateur combiné gravité + magnétisme (IGRF) + relief en environnement privé de GPS, exposés comme types de scénario <c3/> et <c4/>. Validé par la convergence de la correspondance au relief (un décalage injecté connu est retrouvé) et par une erreur bornée du filtre combiné sur une fenêtre privée de GPS.

# text
# c1: lunar
seg-bd01ec72fa2a = <b>Géométrie LunaNet LANS</b> (<c1/>) : sites nommés de la surface lunaire (Apollo 11/15/16, rebord de Shackleton) avec des coordonnées sélénographiques de référence, angles de visée depuis la surface (az/él/distance), visibilité/couverture et DOP du site, validés par rapport au rayon de la Lune, aux coordonnées publiées des sites et à l'identité d'élévation de { "90" }° pour une position radiale à la verticale.

# text
# c1: eci_track
seg-2dad9cf59ea9 = <b>Bac à sable guidé dans le navigateur</b> : curseurs en mode guidé, panneau de sortie à onglets, visite de première utilisation en superposition, modes de balayage de paramètres et de superposition de plusieurs exécutions, vue orbitale 3D sans dépendance en canvas/SVG (le paquet orbite émet désormais un <c1/> additif), mode intégrable/iframe, et téléchargement sous forme de rapport HTML — chacun avec des tests unitaires node dans la CI.

# text
# c1: tests/imu_allan_spec.rs
seg-261604603d67 = <b>Modèle d'erreur d'IMU validé par fiches techniques</b> (<c1/>) : l'ARW/VRW/instabilité de biais des ADIS16465/16488/16460 retrouvés à partir de l'écart-type d'Allan synthétisé et vérifiés par rapport aux spécifications du fabricant (identification NIST SP1065 / IEEE { "952" }).

# text
# c1: tests/allan_nist_sp1065_1000point.rs
seg-dc7b9bdb3076 = <b>Validation des estimateurs d'Allan du NIST SP1065</b> (<c1/>) : les quatre estimateurs reproduisent les écarts-types de référence publiés à 1000 points et les bornes de confiance du tableau 32.

# text
# c1: sbas
# c2: sbas_protection_level
# c3: orbit::invert4
# c4: iono_free_l1l5
# c5: γ₁₅ = 1.79327
# c6: do316_compliance_map
# c7: inv(GᵀG)
# c8: docs/COMPLIANCE.md
seg-5d50be22aacd = <b>Niveaux de protection SBAS / DO-229E, combinaison sans ionosphère L1/L5 et carte de compliance DO-316</b> (module <c1/>). <c2/> forme la matrice de géométrie pondérée à partir de l'élévation/azimut de chaque satellite et du budget d'erreur UDRE/GIVE/aéroporté/troposphère, inverse la matrice normale (<c3/> partagé) et projette les variances en HPL/VPL au moyen des facteurs K de DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> ajoute la pseudodistance GPS L1/L5 sans ionosphère (IS-GPS-705, <c5/>), validée pour annuler le retard ionosphérique indépendant du premier ordre du moteur. <c6/> relie les exigences DO-316/DO-229E aux fonctions qui les implémentent. Validé par rapport aux définitions en forme close des facteurs K, à la géométrie de référence numpy <c7/> et à l'identité de covariance par deux voies ; le recoupement de concordance RTKLIB/gLAB sur les PL publiés est documenté comme en attente de revue dans <c8/>.

# text
# c1: gravity_sh::SphericalHarmonicField
# c2: C̄_nm, S̄_nm
# c3: egm2008_data.rs
# c4: tools/gen_egm2008.py
# c5: tools/egm2008_to70.gfc
# c6: .gfc
# c7: from_gfc
# c8: C̄00
# c9: −μr/|r|³
# c10: forces::zonal_accel
seg-e9e60b40e42a = <b>Gravité complète en harmoniques sphériques tesséral — le champ EGM2008 jusqu'au degré/ordre { "70" }.</b> Un nouveau <c1/> évalue le géopotentiel et son accélération dans le référentiel lié à la Terre à partir de coefficients <c2/> entièrement normalisés, en utilisant la récurrence stable de Legendre normalisée de Holmes–Featherstone (la dénormalisation déborderait à ce degré). Les coefficients fournis sont le produit EGM2008 de la NGA (domaine public, via ICGEM), intégrés dans <c3/> et reproduits bit pour bit par <c4/> à partir du <c5/> versionné ; tout modèle ICGEM <c6/> se charge via <c7/>. Validé par rapport à trois références indépendantes : l'effondrement en masse ponctuelle (<c8/> seul = <c9/>), un champ purement zonal reproduisant le <c10/> existant à environ { "1e-9" } près, et l'accélération analytique concordant avec le gradient par différences finies du potentiel sommé directement à moins de { "1e-6" }.

# text
# c1: forces::lense_thirring_accel
# c2: ForceModel::lense_thirring()
seg-c33a2dbf851d = <b>Accélération de Lense–Thirring (entraînement des référentiels) en relativité générale</b> (<c1/>, IERS { "2010" } éq. { "10.12" }), le terme gravitomagnétique au-delà de la correction de Schwarzschild existante, intégré au propagateur numérique par un nouvel indicateur <c2/>. Validée comme linéaire en moment cinétique de la Terre et inférieure de { "1" } à { "2" } ordres de grandeur au terme de Schwarzschild, le régime des mesures de LAGEOS / Gravity Probe B.

# text
# c1: Propagator
# c2: NumericalPropagator
# c3: ForceModel
# c4: Tolerance
# c5: Integrator
# c6: Sgp4
# c7: propagator::Propagator
# c8: state_at(t_seconds) -> StateVector
# c9: Box<dyn Propagator>
# c10: PropagatorError
seg-909562023109 = <b>Un trait <c1/> qui unifie les propagateurs d'orbite analytique et numérique.</b> Le propagateur numérique de Cowell à modèle de forces est désormais un pair de premier rang de SGP4 : un nouveau type <c2/> (état initial + <c3/> + <c4/> + choix d'un <c5/> à doublement de pas ou de Dormand–Prince) et <c6/> implémentent tous deux <c7/>, dont <c8/> renvoie l'état inertiel TEME en unités SI (m, m/s), de sorte que les deux sont interchangeables derrière un <c9/>. L'implémentation SGP4 est la conversion exacte km/min→SI de la méthode intrinsèque (vérifiée par un test d'égalité) ; l'implémentation numérique franchit, via le trait, la même barrière sub-métrique de Kepler exact, les deux pilotes adaptatifs concordent, et une <c10/> fait remonter le code SGP4 sous-jacent.

# text
seg-d094880df57b = Cette version comble la plus grande lacune d'exactitude du moteur : l'orientation de la Terre et la réduction des référentiels sont désormais réalisées au niveau d'une implémentation de référence (validées <b>bit pour bit par rapport à ERFA/SOFA</b>), la pile d'intégrité gagne un <b>ARAIM bi-constellation</b> sur de véritables TLE GPS+Galileo, et les couches de propagation, de capteurs quantiques, lunaire/cislunaire et géomagnétique s'approfondissent toutes — avec une API Python typée, un bac à sable de navigateur plus riche et une matrice de reproductibilité sur trois systèmes d'exploitation. Points forts :

# text
seg-bfe1d4a7cabd = <b>Référentiels, bit pour bit.</b> Nutation complète IAU 2000A et 2000B, précession IAU { "2006" }, réduction GCRS↔ITRS IAU 2006/2000A fondée sur le CIO (X, Y, s), mouvement du pôle de l'IERS et référentiels de sortie TEME→GCRS/ITRS — chacun validé bit pour bit par rapport aux routines de référence ERFA/SOFA.

# text
# c1: docs/ARAIM_REFERENCE.md
seg-bb5705347a24 = <b>ARAIM bi-constellation</b> (GPS + Galileo) sur de véritables TLE, avec HPL/VPL, sortie en diagramme de Stanford et un <c1/> ouvert.

# text
seg-2865dadcd4c8 = <b>PNT cislunaire</b> : un propagateur CR3BP Terre–Lune, des référentiels MCI↔MCMF, des coordonnées sélénographiques et un scénario exécutable d'intégrité lunaire LunaNet.

# text
seg-3b636707a158 = <b>Capteurs quantiques</b> : systématiques de Coriolis et d'effet Stark alternatif pour l'interféromètre à atomes froids, un balayage de dérive et une validation par rapport au budget de Freier ({ "2016" }).

# text
seg-10bc94801a6a = Modèle de champ principal géomagnétique <b>IGRF-14</b>, autonome et validé.

# text
# c1: RunOutput
# c2: ScenarioMeta
# c3: .data()
# c4: scenario_kinds
# c5: validate_toml
seg-6485f627d793 = <b>API Python typée</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, stubs de types) avec une construction de wheel en CI, plus une sortie de propagateur GCRS/ITRS de premier rang et un export CCSDS OMM.

# text
# c1: sgp4
# c2: src/
# c3: ubuntu
# c4: macos
# c5: windows
seg-2b7693641333 = <b>Crédibilité et reproductibilité</b> : une comparaison directe de la précision de SGP4 avec la crate indépendante <c1/>, une barrière de couverture en CI (environ { "97" } % des lignes de <c2/>) et une matrice de reproductibilité sur trois systèmes d'exploitation (<c3/>/<c4/>/<c5/>).

# text
# c1: src/report.rs
# c2: src/chart.rs
# c3: web/app.js
# c4: src/hybrid.rs
# c5: jamming.rs
# c6: timetransfer.rs
# c7: spoof.rs
# c8: raim.rs
# c9: lunar.rs
# c10: ensemble.rs
# c11: sweep.rs
# c12: gnss_sim.rs
# c13: fusion/pack.rs
# c14: inertial/mod.rs
# c15: #0e131b
# c16: --bg
# c17: --line
# c18: --fg
# c19: --accent-bright
# c20: --partial
# c21: --crit
seg-32e53ac66056 = <b>Chaque graphique du bac à sable respecte désormais le thème du site.</b> Les douze générateurs de graphiques SVG — le graphique de résultat/holdover (<c1/> + <c2/>), le graphique d'écart-type d'Allan (<c3/>) et chaque graphique de scénario (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + disponibilité, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — utilisaient des panneaux bleu marine froids (<c15/>), des axes/textes gris froids et une palette de séries rouge/bleu/violet discordante. Ils utilisent désormais partout la palette graphite chaude : panneaux <c16/>, grille chaude <c17/>, libellés <c18/>, avec une attribution cohérente des séries — quantique = or miel (<c19/>), classique = ambre chaud (<c20/>), spécification/limite = <c21/>. Les vues à codage de sécurité conservent leur sens : le diagramme de Stanford du RAIM reste vert (disponible) / ambre (trompeur) / rouge (dangereux) / acier atténué (indisponible), et HPL/VPL se lisent en or/bronze.

# text
# c1: Kshana v<version> · <scenario-hash> · kshana.dev
seg-2bb31dfc7756 = <b>Les graphiques se décrivent désormais eux-mêmes lorsqu'ils sont enregistrés ou téléchargés.</b> Les deux graphiques intègrent leur titre dans le SVG (le titre du graphique d'Allan et son sous-titre « lower is better » ne figuraient auparavant que dans le HTML autour de l'image, de sorte qu'une image enregistrée n'avait pas de légende), et tous deux portent un pied de page de provenance — <c1/> — afin qu'un graphique téléchargé se suffise à lui-même et reste reproductible.

# text
# c1: Kshana v<version> · scenario <hash> · kshana.dev
# c2: api::run_toml
# c3: .chart.svg
# c4: scenario
# c5: scenario_hash
# c6: docs/PROVENANCE.md
seg-9f528e334cd8 = <b>Chaque graphique porte désormais le pied de page de provenance.</b> Le pied de page — <c1/> — est apposé de façon centralisée pour tous les types de scénario dans <c2/> (il n'était auparavant présent que sur les graphiques de holdover et d'Allan), de sorte que toute image enregistrée ou téléchargée — depuis le bac à sable, l'export <c3/> de la CLI ou la fiche de résultats HTML — identifie sa version, l'empreinte de son scénario et sa source. Le hachage est étiqueté <c4/> par souci de clarté et provient du <c5/> du résultat lorsqu'il est présent, avec un repli sur le hachage de la source pour les rapports d'intégrité/lunaires. Ce qu'est l'empreinte et pourquoi elle est là est documenté dans la section « Output » du README et dans <a1><c6/></a1>.

# text
# c1: raim::chi2_quantile
# c2: read_dir
# c3: chi2_quantile
# c4: p
# c5: k
# c6: normal_quantile
# c7: assert!
# c8: Normal
seg-635697ed3fb1 = <b><c1/> et l'échantillonneur de bruit de Stanford du RAIM ne paniquent plus sur des entrées hors plage / non finies</b> (un résultat de fuzzing dépendant de l'ordre de <c2/>, issu des nouveaux scénarios ARAIM). <c3/> protège désormais <c4/>/<c5/> comme <c6/> (en renvoyant une valeur limite au lieu de paniquer avec <c7/>), et le <c8/> du bruit de Stanford de disponibilité borne σ à une valeur strictement positive — de sorte que la pile d'intégrité/ARAIM ne panique jamais sur des scénarios mutés ou mal configurés.

# text
# c1: reproducibility-matrix
# c2: tests/golden/
# c3: tests/cross_platform_golden.rs
# c4: golden.rs
# c5: sgp4_verification.rs
# c6: determinism.rs
# c7: docs/REPRODUCIBILITY.md
seg-b36a0c42845e = <b>Matrice de CI de reproductibilité multiplateforme.</b> Une nouvelle tâche <c1/> exécute les tests de reproductibilité sur <b>ubuntu-latest, macos-latest et windows-latest</b> à chaque push. Comme le JSON de résultat complet n'est pas identique octet pour octet d'un système à l'autre (divergence de libm au dernier ULP), elle vérifie exactement la projection invariante par plateforme — l'empreinte d'entrée plus la forme de la sortie, épinglées par scénario sous forme de références SHA-256 dans <c2/> par le nouveau <c3/> — en plus des valeurs numériques épinglées (<c4/>, à { "1e-6" } près), des états SGP4 (<c5/>, à { "2e-5" } km près) et du déterminisme au sein d'un même processus (<c6/>). Ensemble, ils prouvent la reproductibilité multiplateforme sur trois systèmes d'exploitation sans la fragilité d'un hachage octet par octet de l'intégralité de la sortie. <c7/> documente cette séparation.

# text
# c1: coverage
# c2: cargo-tarpaulin
# c3: src/
# c4: src/
seg-9b8c0a407387 = <b>Barrière de couverture de code dans la CI.</b> Une nouvelle tâche <c1/> exécute <c2/> avec le moteur fondé sur les sources LLVM, publie un rapport lcov comme artefact de construction et impose un plancher de couverture de lignes sur <c3/> (tables de données générées, point d'entrée de la CLI, tests et ressources web exclus). La couverture de lignes mesurée est d'environ { "97" } % sur <c4/> (SGP4 et modules d'horloge ≥ { "95" } %) ; la barrière est fixée à { "85" } % — au-dessus de l'objectif de ≥ { "80" } % et à distance de la valeur mesurée, de sorte qu'elle détecte les régressions sans déclenchements intempestifs. Un badge de couverture est publié dans le README.

# text
# c1: sgp4
# c2: tests/sgp4_crate_comparison.rs
# c3: tcppver.out
# c4: tests/fixtures/sgp4_comparison.md
# c5: KSHANA_REGEN_FIXTURES=1
# c6: from_elements
seg-1dfc4beb239a = <b>SGP4/SDP4 comparé directement à la crate indépendante <c1/>.</b> Un nouveau test (<c2/>) recoupe le propagateur de Kshana avec la bibliothèque SGP4 en Rust la plus utilisée (neuromorphicsystems/sgp4, ajoutée comme dépendance de développement réservée aux tests) sur les mêmes { "666" } vecteurs AIAA 2006-6753. Les deux étant pilotées avec le modèle de gravité WGS72 qu'utilisent les vecteurs, les deux implémentations indépendantes concordent à <b>moins du micron</b> sur les orbites proches de la Terre et résonantes, et à <b>{ "4.12" } mm dans le pire des cas</b> sur tous les régimes, toutes deux reproduisant le tableau de référence <c3/>. Le tableau de comparaison versionné (<c4/>, régénéré via <c5/>) détaille le résultat par régime (LEO/MEO, espace lointain, résonance de ½ jour et de 1 jour) et note les quatre cas volontairement pathologiques que la crate rejette à la construction. Les assertions en direct maintiennent les deux à moins de { "2e-5" } km de la référence et en accord à moins de { "4e-5" } km — une garde contre les régressions, pas un résultat ponctuel. C'est un gage de qualité face à la concurrence : l'exactitude par rapport à une base de code indépendante, et pas seulement à un tableau statique. (Le <c6/> par défaut de la crate utilise WGS84 et diffère donc de la référence WGS72 d'environ un km — signalé honnêtement dans le texte du tableau.)

# text
# c1: src/omm.rs
# c2: orbit
# c3: kshana <orbit.toml> --export-omm out.omm
# c4: export_omm = true
# c5: <scenario>.omm
# c6: --export-sp3
# c7: YYYY-NNNP
# c8: tle::parse_tle_identity
# c9: OBJECT_NAME
# c10: OBJECT <id>
# c11: CREATION_DATE
# c12: api::export_omm
# c13: api::auto_export_omm
# c14: OmmFile::from_tle_block
# c15: OrbitClockScenario::to_omm_string
# c16: gps-ops
# c17: tests/sp3_export_roundtrip.rs
seg-dc75162ecd64 = <b>L'export CCSDS OMM est désormais accessible de bout en bout.</b> Le rédacteur OMM (<c1/>) n'avait auparavant aucun chemin CLI/API ; les éléments moyens d'un scénario <c2/> peuvent désormais être publiés sous forme de catalogue OMM CCSDS 502.0-B-2 — un message OMM KVN par satellite défini par TLE — via <c3/>, ou <c4/> dans le scénario écrit automatiquement <c5/> (à l'image de l'existant <c6/>). Chaque message porte le numéro de catalogue NORAD <b>réel</b> du satellite, sa désignation internationale COSPAR (<c7/>) et son époque (forme jour de l'année du CCSDS), analysés à partir de la ligne { "1" } du TLE par le nouveau <c8/> ; la ligne de nom devient <c9/> (sinon <c10/>). <c11/> est l'époque du scénario, et non l'heure réelle, de sorte que la sortie est reproductible. Nouvelle API : <c12/> / <c13/>, <c14/>, <c15/>. Un scénario Walker synthétique ou RINEX (sans éléments moyens TLE) renvoie une erreur au lieu d'émettre un fichier vide. Validé par rapport à l'instantané <c16/> de 30 satellites fourni (<c17/>).

# text
# c1: web/hover.mjs
# c2: web/app.js
# c3: <img>
# c4: web/hover.test.mjs
seg-036782a2b65e = <b>Info-bulles interactives de lecture sur les graphiques du bac à sable.</b> Déplacer le curseur sur un graphique aimante un réticule sur l'échantillon le plus proche et affiche une info-bulle de valeur (<c1/>, raccordée dans <c2/>). Sur le graphique d'Allan, elle indique τ et le σ_y(τ) de chaque horloge ; sur les graphiques de scénarios en série temporelle (holdover d'horloge, navigation à l'estime, transfert de temps, PNT hybride, GNSS/INS), elle indique le temps et la valeur de chaque suite dans les unités propres du graphique (ns / m / ps / utilisation), analysées à partir du résultat afin que la lecture corresponde à la courbe. Les diagrammes spécialisés (RAIM, leurrage, balayage) n'ont pas de superposition. Les graphiques restent des <c3/> blob autodescriptifs — la superposition est un réticule transparent + une info-bulle par-dessus, de sorte que le téléchargement, la comparaison et l'export ne sont pas touchés. Les calculs de coordonnées (échantillon le plus proche, curseur→fraction du tracé, analyse de polyligne) font l'objet de tests unitaires (<c4/>, exécutés dans la CI).

# text
# c1: web/compare.mjs
# c2: web/app.js
# c3: web/compare.test.mjs
# c4: <img>
seg-1588ae024e5d = <b>Mode de comparaison A/B dans le bac à sable.</b> Épinglez n'importe quelle exécution comme référence de base A, lancez un second scénario, et les deux s'affichent côte à côte avec un tableau d'écarts de figures de mérite (holdover, RMS/p95 de synchronisation temporelle, disponibilité) qui colore le gagnant pour chaque métrique (<c1/>, raccordé dans <c2/> ; logique d'écart testée unitairement dans <c3/>, exécutée dans la CI). Toutes les valeurs sont insérées sous forme de texte et tous les graphiques via des <c4/> blob, de sorte que rien provenant d'une chaîne de scénario n'est jamais injecté comme balisage.

# text
# c1: web/chartdl.mjs
# c2: web/app.js
# c3: kshana-<chart>-v<version>-<scenario-hash>.<ext>
# c4: web/chartdl.test.mjs
seg-6e7a99f8f275 = <b>Boutons de téléchargement des graphiques (SVG + PNG).</b> Chaque graphique du bac à sable dispose désormais d'une barre d'outils « Télécharger SVG / PNG » assortie au thème (<c1/>, raccordée dans <c2/>). Le SVG restitue l'original fidèle et redimensionnable ; le PNG rastérise cette même image autodescriptive à 2x pour les diapositives et les documents. Les fichiers sont nommés d'après leur provenance — <c3/> — et la logique de nom/taille de fichier fait l'objet de tests unitaires (<c4/>, exécutés dans la CI).

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: src/igrf_data.rs
seg-4cb87e7dc892 = <b>Modèle de champ principal géomagnétique IGRF-14 (<c1/>).</b> Le champ en harmoniques sphériques standard de l'IAGA (degré/ordre { "13" }, époque { "2025.0" } + variation séculaire { "2025" }–{ "2030" } ; coefficients générés par machine à partir du fichier officiel <c2/> par <c3/> dans <c4/>, reproductibles bit pour bit). Une synthèse normalisée de Schmidt renvoie le vecteur de champ (nord/est/bas) et les éléments dérivés (déclinaison, inclinaison, intensité horizontale/totale) en tout lieu/date géodésique, plus le pôle géomagnétique et l'intensité du dipôle — le pendant magnétique de l'apparieur de cartes de gravité pour la navigation PNT alternative. Validé de façon autonome : la synthèse concorde avec le dipôle incliné exact en forme close, le champ analytique complet de degré 13 concorde avec une différence finie du potentiel scalaire, l'axe du dipôle reproduit le pôle géomagnétique connu (~{ "80.7" }°N, −{ "72.7" }°E) et une intensité d'environ { "29.7" } µT, et le champ global est physique.

# text
# c1: src/python.rs
# c2: run
# c3: run_full
# c4: RunOutput
# c5: .json
# c6: .svg
# c7: .summary
# c8: .data()
# c9: run_typed
# c10: scenario_kinds()
# c11: validate_toml()
# c12: kshana.pyi
# c13: py.typed
# c14: docs/PYTHON_API.md
seg-c69d50031da4 = <b>Liaisons Python typées (<c1/>).</b> Au-delà des <c2/>/<c3/> à chaîne en entrée et chaîne en sortie, le module expose désormais une classe typée <c4/> (<c5/>, <c6/>, <c7/> et un accesseur <c8/> qui renvoie le résultat analysé dans un dict Python natif — sans nouvelle analyse JSON, enveloppable par NumPy), plus <c9/>, <c10/> (liste analysée de dicts de métadonnées) et <c11/> (une liste de messages d'erreur, sans levée d'exception). Fournit un stub de types PEP { "561" } (<c12/> + <c13/>) pour mypy/pyright/les éditeurs et un guide de démarrage <c14/>. Les fonctions existantes sont inchangées.

# text
# c1: src/orbit.rs
# c2: Frame
# c3: position_in_frame
# c4: state_gcrs
# c5: Propagator
# c6: gcrs_to_itrs
# c7: state_gcrs
seg-fb65ac14344c = <b>Référentiels de sortie de premier rang pour les propagateurs (énumération <c2/> de <c1/> + <c3/> + <c4/>).</b> Tout <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) peut désormais émettre sa position en TEME, <b>GCRS</b> (≈ J2000) ou <b>ITRS</b> (lié à la Terre) — TEME en natif, GCRS via la réduction TEME→GCRS validée, ITRS en enchaînant celle-ci avec la rotation <c6/> CIO IAU 2006/2000A — ainsi que son état GCRS complet (position + vitesse) via <c7/>. La sortie inertielle à la date n'est plus limitée à TEME.

# text
# c1: src/cio.rs
# c2: X, Y
# c3: eraNut06a
# c4: s
# c5: eraS06
# c6: tools/gen_s06.py
# c7: src/cio_s06_data.rs
# c8: eraC2ixys
# c9: eraEra00
# c10: eraC2tcio
# c11: eraXys06a
# c12: eraC2ixys
# c13: eraEra00
seg-8f596733c439 = <b>Réduction céleste-terrestre IAU 2006/2000A fondée sur le CIO (<c1/>).</b> La chaîne GCRS↔CIRS↔ITRS moderne, sans équinoxe : coordonnées du CIP <c2/> extraites de la matrice de biais-précession-nutation IAU 2006/2000A (réutilisant la précession FW validée + la nutation 2000A avec l'ajustement P03 de <c3/>), la série du localisateur du CIO <c4/> à 66 termes (<c5/>, générée par machine à partir de la référence ERFA par <c6/> dans <c7/>, reproductible bit pour bit), la matrice GCRS→CIRS (<c8/>), l'angle de rotation de la Terre (<c9/>) et la rotation complète GCRS→ITRS (<c10/>, composée avec le mouvement du pôle de l'IERS existant). Validé <b>bit pour bit</b> par rapport au vecteur de test publié <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 à JD_TT { "2453736.5" }), ainsi qu'aux vecteurs de test <c12/> et <c13/>. La chaîne CIO et l'ancienne réduction TEME à équinoxe/GMST-1982 s'accordent, à la différence près de leur convention de temps sidéral documentée d'environ { "2" }·(équation des équinoxes). C'est la réduction rigoureuse que le chemin équinoxe/GMST approximait.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_matrix_2000a
# c4: nut00a
# c5: tools/gen_nut00a.py
# c6: src/nutation_iau2000a_data.rs
# c7: eraNut00a
# c8: nutation_matrix_2000a
seg-32e6d8dfcebc = <b>Série complète de nutation IAU 2000A (<c1/> <c2/>, <c3/>).</b> Le modèle MHB2000 complet — { "678" } termes luni-solaires + { "687" } termes planétaires — précis à < { "0.1" } mas, en plus de la troncature 2000B à 77 termes existante. Les tables sont générées par machine à partir de la référence <c4/> de l'IAU SOFA / ERFA par <c5/> dans <c6/> (le générateur reproduit le fichier versionné bit pour bit), et toute la série — les deux jeux d'arguments fondamentaux IERS-2003 et MHB2000 ainsi que les longitudes planétaires — est validée <b>bit pour bit</b> par rapport au vecteur de test publié <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } à JD_TT { "2453736.5" }, à { "1e-13" } rad près). La réduction TEME→GCRS par défaut conserve la série 2000B (~{ "1" } mas, en deçà de la simplification de rotation du référentiel de vitesse de la chaîne) ; <c8/> expose la matrice à la date à < { "0.1" } mas pour les appelants qui en ont besoin.

# text
# c1: kind = "lunar-integrity"
# c2: scenarios/lunanet-araim.toml
# c3: src/lunar.rs
# c4: LunarScenario
# c5: south_pole_hpl_pass
# c6: LunarReport
seg-35e9e419d2ae = <b>Scénario exécutable d'intégrité lunaire (<c1/>, <c2/>).</b> Raccorde la passe de niveau de protection du pôle sud lunaire (<c3/> <c4/> → <c5/>) à l'exécuteur de scénarios avec un <c6/> JSON et un graphique SVG HPL en fonction du temps, de sorte que le cas d'intégrité cislunaire est accessible directement depuis la CLI. Il met honnêtement en évidence l'écart : avec le σ_URE de LANS de { "30" } m, le HPL du pôle sud (≈ { "260" }–{ "450" } m) dépasse une limite d'alerte de { "50" } m ({ "0" } % de disponibilité) — l'intégrité du PNT lunaire n'est pas encore atteinte.

# text
# c1: src/raim.rs
# c2: src/orbit.rs
# c3: scenarios/araim-gps-galileo.toml
# c4: araim_dual_constellation_availability
# c5: visible_positions_labeled
# c6: IntegrityScenario
# c7: araim_dual
# c8: tests/araim_dual_real_data.rs
seg-1910e8110b43 = <b>Disponibilité ARAIM bi-constellation sur de véritables TLE GPS+Galileo, et raccordement à l'exécuteur de scénarios (<c1/>, <c2/>, <c3/>).</b> Ajoute <c4/> (le moteur ARAIM avancé — pannes d'un seul satellite <em>et</em> de toute la constellation — exécuté sur une grille temporelle) et <c5/>, et le raccorde à l'exécuteur <c6/> via un indicateur <c7/>, de sorte qu'une étude ARAIM multi-GNSS est accessible directement depuis le TOML. Un test sur données réelles (<c8/>) sur des instantanés Celestrak GPS+Galileo du 2026-06-07 intégrés montre que la mise en commun de Galileo fait passer la disponibilité ARAIM de { "0.21" } à { "0.67" } sous un VAL exigeant de { "12" } m ({ "10.5" }→{ "21.8" } satellites en vue), tandis que le mode robuste aux pannes de constellation est fondamentalement limité avec seulement deux constellations — la raison quantitative pour laquelle une intégrité bi-constellation robuste pousse vers une troisième constellation ou le SBAS. Reste à faire, en toute honnêteté : la reproduction numériquement exacte du tableau A-3 de la TN ARAIM de l'UE par rapport à une seule époque verrouillée sur une version, et un enregistrement de fixture Zenodo.

# text
# c1: src/cr3bp.rs
# c2: cr3bp_accel
# c3: propagate_cr3bp
# c4: jacobi_constant
# c5: lagrange_points
# c6: src/lunar.rs
seg-78ab887a4543 = <b>Problème circulaire restreint à trois corps (CR3BP) pour le système Terre–Lune (<c1/>).</b> Un nouveau noyau de dynamique cislunaire que les propagateurs à deux corps/SGP4 ne peuvent pas fournir : équations du mouvement en référentiel tournant (<c2/>), un propagateur RK4 (<c3/>), l'intégrale de la constante de Jacobi (<c4/>) et les cinq points de Lagrange (<c5/>). Validé par rapport à des ancrages en forme close / publiés : les points colinéaires Terre–Lune (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), les points équilatéraux exacts L4/L5 = (½−μ, ±√3/2, { "0" }), les cinq confirmés comme équilibres du champ, la constante de Jacobi conservée à la précision de l'intégrateur lors de la propagation, et la force de rappel hors plan qui rend possibles les orbites de halo/NRHO. C'est la base pour représenter une véritable NRHO. Reste à faire, en toute honnêteté : les conditions initiales périodiques d'une NRHO { "9" }:{ "2" } corrigée différentiellement, le modèle excentrique/à éphéméride (DE), et la transformation dénormalisée vers les référentiels sélénocentriques de <c6/>.

# text
# c1: src/frames.rs
# c2: polar_motion_matrix
# c3: iauPom00
# c4: W = Rx(−y_p)·Ry(−x_p)·Rz(s′)
# c5: s′
# c6: pef_to_itrf
# c7: itrf_to_pef
# c8: teme_to_itrf
# c9: teme_to_ecef
# c10: x_p
# c11: y_p
seg-14f4572144f3 = <b>Mouvement du pôle de l'IERS et réduction TEME→ITRF (<c1/>).</b> Ajoute <c2/> (<c3/> de SOFA : <c4/> avec le localisateur du TIO <c5/>), <c6/> / <c7/> et <c8/> — la rotation TEME→PEF fondée sur GMST suivie du mouvement du pôle — pour obtenir une position liée à la Terre précise à l'ITRF, au-dessus du <c9/> limité à GMST (le mouvement du pôle est un effet de plusieurs dizaines de mètres au rayon orbital). <c10/>/<c11/> sont des grandeurs IERS observées que fournit l'appelant. Reste à faire, en toute honnêteté : une chaîne entièrement fondée sur le CIO (X, Y, s) et un recoupement numérique ANISE/SPICE à moins de { "10" } m restent à venir.

# text
# c1: src/inertial/quantum_imu.rs
# c2: docs/QUANTUM.md
# c3: Φ_cor = 2·k_eff·v_⊥·Ω·T²
# c4: coriolis_phase
# c5: 2·Ω×v
# c6: coriolis_accel_bias
# c7: Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: docs/QUANTUM.md
seg-b5e84faf880c = <b>Systématiques de l'interféromètre à atomes froids, balayage de dérive et validation par un dispositif publié (<c1/>, <c2/>).</b> Étend l'accéléromètre CAI issu des premiers principes avec les deux principales systématiques déterministes : la phase de <b>Coriolis/rotation</b> <c3/> (<c4/>, avec le biais d'accélération équivalent <c5/> via <c6/>) et la phase de <b>déplacement lumineux AC-Stark</b> <c7/> (<c8/>, qui s'annule par symétrie π/2–π–π/2 pour un déplacement constant). Ajoute <c9/> (dérive de position à l'estime en fonction du temps de cycle — le cœur d'une comparaison quantique/classique) et un test de validation par rapport au gravimètre mobile de Freier et al. { "2016" } (arXiv:{ "1512.05660" }) : le plancher de bruit de projection quantique modélisé se situe en dessous du bruit à court terme publié de { "96" } nm/s²/√Hz, à environ { "2" } ordres de grandeur. <c10/> est mis à jour. Reste à faire, en toute honnêteté : les systématiques de front d'onde et de pointage du faisceau, la résolution de l'ambiguïté de franges, la reproduction exacte de l'essai en vol CARIOQA-PMP / Boeing-AOSense (qui exige des DSP de plateforme publiées) et un préréglage du bac à sable JS.

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: selenographic_to_mcmf
# c6: south_pole_hpl_pass
seg-f32829ed9cf1 = <b>Réduction de référentiel cislunaire et passe d'intégrité au pôle sud lunaire (<c1/>).</b> Étend le moteur ARAIM lunaire avec la rotation MCI↔MCMF (inertiel centré sur la Lune ↔ lié à la Lune) (<c2/> / <c3/>, un modèle simplifié de rotation moyenne au taux sidéral lunaire), la latitude/longitude/altitude sélénographiques (<c4/> / <c5/>) et <c6/> — un récepteur posé dans la région d'Artemis face à un ensemble représentatif de relais LunaNet sur une passe de { "24" } h, qui quantifie honnêtement l'écart d'intégrité : avec le σ_URE de LANS nominal de { "30" } m, le niveau de protection est fini mais dépasse une limite d'alerte d'opérations de surface de { "50" } m. Reste à faire, en toute honnêteté : l'éphéméride précise de la NRHO de LANS (une orbite cislunaire à 3 corps), la libration physique / le pôle lunaire en précession (DE421/SPICE) et un scénario TOML LunaNet restent à venir.

# text
# c1: src/raim.rs
# c2: docs/ARAIM_REFERENCE.md
# c3: IntegritySupportMessage
# c4: .fault_priors()
# c5: .dual_fault_priors()
# c6: araim_raim
# c7: araim_dual_raim
# c8: stanford_svg
# c9: PL = error
# c10: docs/ARAIM_REFERENCE.md
# c11: araim_dual_raim
seg-5ef720855cc4 = <b>Message de support d'intégrité ARAIM, SVG du diagramme de Stanford et référence ARAIM ouverte (<c1/>, <c2/>).</b> Ajoute un <c3/> explicite (σ_URA / σ_URE / b_nom / P_sat / P_const, avec les valeurs de référence WG-C GPS+Galileo et des convertisseurs <c4/> / <c5/> vers les moteurs <c6/> à panne unique et <c7/> à l'échelle de la constellation), un moteur de rendu autonome <c8/> du diagramme d'intégrité de Stanford (les quatre zones, la frontière <c9/>, les guides de limite d'alerte, un marqueur codé par couleur par époque), et <c10/> documentant l'algorithme, l'ISM, les hypothèses de panne, le contrat de niveau de protection et l'avantage de la bi-constellation. Des tests démontrent le gain de géométrie/redondance (la mise en commun d'une seconde constellation resserre le HPL à panne unique) et la tolérance aux pannes de constellation (l'utilisateur bi-constellation survit à la perte d'une constellation entière ; un utilisateur mono-constellation ne le peut pas). Reste à faire, en toute honnêteté : reproduire numériquement le tableau A-3 de la TN ARAIM de l'UE / le chiffre de disponibilité de { "15" } à { "25" } % par rapport à un instantané TLE réel verrouillé sur une version, un enregistrement de fixture Zenodo, et le raccordement de <c11/> à l'exécuteur de fichiers de scénario.

# text
# c1: src/nutation.rs
# c2: nutation_iau2000b
# c3: iauNumat
# c4: teme_to_gcrs(r, v, jd_tt)
# c5: gcrs_to_teme
# c6: nut00b
# c7: eraNut00b
# c8: ROADMAP.md
seg-3607eb34acd9 = <b>Nutation IAU 2000B et réduction inertielle complète TEME→GCRS/J2000 (<c1/>).</b> Ajoute les deuxième et troisième pièces d'une véritable réduction de référentiel inertiel au-dessus de la précession IAU { "2006" } livrée : la série de nutation luni-solaire MHB2000 à 77 termes (<c2/>, la troncature standard IAU 2000B précise à ~{ "1" } mas) avec les arguments fondamentaux de Delaunay et la matrice de nutation <c3/> de SOFA, et la chaîne de Vallado AIAA-2006-6980 TEME→TOD (équation des équinoxes) → TOD→MOD (nutation) → MOD→GCRS (biais-précession) exposée sous la forme <c4/> / <c5/>. La série, les arguments et les constantes d'unité sont transcrits de la référence <c6/> de l'IAU SOFA / ERFA et validés <b>bit pour bit</b> par rapport au vecteur de test publié <c7/> (Δψ, Δε à { "1e-13" } rad près). Reste à faire, en toute honnêteté : la série complète IAU 2000A de 678 termes (à moins de { "0.1" } mas), un recoupement numérique ANISE/SPICE à moins de { "10" } m et le mouvement du pôle restent à venir (voir <c8/>).

# text
seg-d9b5e459f6eb = Cette version apporte le premier <b>propagateur d'orbite non analytique</b> de Kshana — un intégrateur de Cowell avec un modèle de forces hiérarchique à six perturbations (deux corps + zonaux J2–J6 + troisième corps Soleil/Lune piloté par l'époque + pression de rayonnement solaire avec ombre conique et pénombre + traînée atmosphérique + correction relativiste post-newtonienne de Schwarzschild) piloté au choix par deux intégrateurs adaptatifs (RK4 à doublement de pas et la paire emboîtée de Dormand–Prince RK5({ "4" })) — avec une couche de manœuvres / de conception de trajectoire (poussées impulsionnelles et finies, un solveur de Lambert d'Izzo et un balayage porkchop), une couche de PNT alternatif par appariement de cartes de gravité qui retrouve une trace privée de GPS de 60 minutes à moins de { "500" } m, une chaîne de détermination d'orbite par lots + séquentielle, et un UKF GNSS/INS à couplage serré à 17 états complet avec navigation à l'estime par CAI quantique. Chaque capacité numérique est alignée sur une vérité analytique ou une forme close dérivée à la main ; les perturbations désactivées par défaut laissent intacts les jeux de référence publiés.

# text
# c1: forces::relativistic_accel
# c2: propagator::ForceModel::relativity
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: (r, v)
# c6: accel_rv
# c7: 3μ²/(c²r³)·r̂
# c8: ≈1.9·10⁻⁹
# c9: μ/(c²r)
# c10: μ(4μ + 3v²r)/(c²r³)
# c11: β
# c12: γ
seg-aa8d478f5c10 = <b>Correction relativiste post-newtonienne (de Schwarzschild) (<c1/> + <c2/>).</b> Ajoute la perturbation de relativité générale dominante sur une orbite proche de la Terre — le principal moteur de l'avance relativiste du périgée — sous la forme <c3/> de l'IERS / Montenbruck–Gill <c4/>. Comme la traînée atmosphérique, elle est <b>dépendante de la vitesse</b> ; elle emprunte donc le second membre de l'intégrateur <c5/> via [<c6/>], en option et désactivée par défaut. Validée de façon autonome : sur une orbite circulaire, elle se réduit à la forme close <c7/> (purement radiale et <b>vers l'extérieur</b>, composantes hors axe exactement nulles) ; son <b>rapport à la force à deux corps est le <c8/> classique en LEO</b> (la signature de <c9/>) ; un cas à vitesse radiale concorde avec la forme simplifiée à la main <c10/> ; et dans le propagateur, elle <b>perturbe l'orbite sans la dissiper</b> — le demi-grand axe est conservé à bien moins d'un mètre par jour, l'opposé structurel de la décroissance monotone de la traînée. Comme elle est désactivée par défaut, les jeux de référence à deux corps/J2/zonaux restent intacts. Le réglage des paramètres PPN (<c11/>,<c12/>) et le terme d'entraînement des référentiels de Lense–Thirring restent à venir.

# text
# c1: forces::conical_shadow
# c2: ν ∈ [0,1]
# c3: a = asin(R☉/d☉)
# c4: b = asin(Rₑ/|r|)
# c5: c
# c6: ν
# c7: c ≥ a+b
# c8: c ≤ b−a
# c9: c ≤ a−b
# c10: srp_accel
# c11: forces::SOLAR_RADIUS
# c12: ν = 1
# c13: ν = 0
# c14: ν
# c15: c = b
# c16: [b−a, b+a]
# c17: 0 < ν < 1
# c18: cylindrical_shadow
seg-043e831224ab = <b>Modèle d'ombre conique à ombre + pénombre (<c1/>), désormais utilisé par la pression de rayonnement solaire.</b> Fait passer l'éclipse binaire à cylindre d'ombre à un facteur <c2/> lisse : le Soleil et la Terre sont modélisés comme des disques de rayons angulaires apparents <c3/>, <c4/> avec une séparation apparente des centres <c5/>, et <c6/> vaut un moins la fraction du disque du Soleil occultée par le disque de la Terre (l'aire de recouvrement lenticulaire de deux cercles) — plein soleil pour <c7/>, ombre totale pour <c8/>, annulaire pour <c9/>, et une pénombre continue entre les deux. <c10/> l'utilise désormais, de sorte que la force de pression de rayonnement diminue progressivement pendant l'éclipse au lieu de s'activer/se désactiver brutalement. Ajoute le <c11/> nominal de l'IAU. Validé de façon autonome : <c12/> en plein soleil et <c13/> au cœur de l'ombre (exact), une <b>pénombre lisse et monotone</b> (<c14/> passe de { "0" } à ~½ en <c15/> puis à { "1" } sur la bande <c16/>), et la pénombre conique <b>s'étend au-delà du cylindre d'ombre</b> (un point que le cylindre binaire considère comme pleinement éclairé vaut <c17/> pour le cône). Le <c18/> plus simple reste disponible ; l'assombrissement centre-bord solaire et l'ombre de la Terre aplatie restent à venir.

# text
# c1: integrator::dopri54_step
# c2: integrator::integrate_dopri
# c3: propagator::propagate_dopri
# c4: 0.9·(1/err)^(1/5)
# c5: propagator::propagate_dopri
# c6: y' = y
# c7: e
# c8: propagate_dopri
seg-8d1c16019f3c = <b>Intégrateur emboîté Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Ajoute la paire emboîtée standard de Dormand–Prince ({ "1980" }) à tableau de Butcher à côté du pilote existant RK4 à doublement de pas : sept étages FSAL fournissent une solution d'ordre 5 et une estimation d'erreur d'ordre 4 à partir d'un seul jeu d'évaluations ({ "7" } contre { "11" } appels de fonction par pas), une estimation d'erreur locale moins coûteuse. Le pilote adaptatif réutilise la même norme d'erreur quadratique moyenne et le même contrôleur de pas <c4/>, c'est donc une alternative directe ; <c5/> l'expose sur le modèle de forces orbital. Validé de façon autonome : l'estimation d'erreur emboîtée est en <b>O(h⁵)</b> (diviser le pas par deux la réduit d'un facteur ~{ "32" }) ; DP5({ "4" }) intègre <c6/> jusqu'à <c7/> et l'oscillateur harmonique sur { "50" } périodes en conservant l'énergie à moins de { "1e-6" } ; il atteint le même point d'arrivée à la même tolérance avec <b>moins d'évaluations de fonction</b> que le doublement de pas (sans sacrifier la précision) ; et <c8/> franchit la même barrière de vérité analytique que le chemin RK4 — <b>sub-métrique par rapport à la solution exacte de Kepler en variables universelles sur une orbite LEO de { "24" } h</b> — tandis que les deux pilotes concordent à moins de { "1" } m sur une orbite J2..J6 (sans forme close). Les paires emboîtées d'ordre supérieur (RKF7({ "8" }) / DOP853) restent à venir.

# text
# c1: forces::atmospheric_density
# c2: forces::drag_accel
# c3: propagator::ForceModel::drag
# c4: ρ = ρ0·exp(−(h−h0)/H)
# c5: a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel
# c6: v_rel = v − ωₑ ẑ × r
# c7: forces::EARTH_ROTATION_RATE = 7.2921151467e-5
# c8: ForceModel
# c9: accel_rv(t, r, v)
# c10: f(t,[r;v]) = [v; a(t,r,v)]
# c11: accel_at
# c12: C_D·A/m = 0.02 m²/kg
seg-cca3c00757d6 = <b>Traînée atmosphérique raccordée au propagateur comme première force dépendante de la vitesse (<c1/> + <c2/> + <c3/>).</b> Ajoute l'atmosphère <b>exponentielle par morceaux du tableau 8-4 de Vallado</b> <c4/> ({ "28" } bandes du niveau de la mer jusqu'au-delà de { "1000" } km, bornée sous la surface) et la traînée quadratique <c5/> par rapport à l'<b>atmosphère en corotation</b> <c6/> (<c7/>). Comme la traînée dépend de la vitesse, <c8/> gagne un nouveau <c9/> et le second membre de l'intégrateur transmet désormais la vitesse (<c10/>) ; le <c11/> dépendant de la seule position est inchangé, de sorte que les termes conservatifs et les jeux de référence restent intacts. Validé de façon autonome : la densité <b>s'ancre à la valeur de { "1.225" } kg/m³ au niveau de la mer</b>, est bornée sous la surface, <b>décroît de façon monotone</b> à travers la LEO, se situe dans la bande moyenne solaire d'environ { "1e-12" } kg/m³ à { "400" } km, et sa <b>hauteur d'échelle locale retrouvée (≈ { "58" } km à { "400" } km)</b> est physique ; la traînée <b>s'oppose à la vitesse relative de corotation</b> à la magnitude LEO d'environ { "2e-6" } m/s² pour <c12/> ; et — la signature essentielle — la traînée est <b>dissipative</b> : une orbite à { "300" } km perd de l'énergie spécifique <b>de façon monotone</b> et son demi-grand axe <b>décroît d'environ un km par jour, de façon bornée</b>, alors que la référence de base dans le vide conserve l'énergie à moins de { "1e-9" }. La densité thermosphérique NRLMSISE-00 (la clause de densité de traînée à moins de { "5" } %) reste à venir.

# text
# c1: forces::srp_accel
# c2: propagator::ForceModel::solar_radiation
# c3: a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂
# c4: forces::cylindrical_shadow
# c5: P☉ = Φ☉/c
# c6: (AU/d)²
# c7: ephem
# c8: epoch_jd_tt + t/86400
# c9: with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)
seg-0d20f02ef85f = <b>Pression de rayonnement solaire raccordée, pilotée par l'époque, au modèle de forces du propagateur (<c1/> + <c2/>).</b> Ajoute le <b>modèle SRP à boulet de canon</b> <c3/> avec un <b>facteur d'éclipse à ombre cylindrique</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }) : la pression de rayonnement <c5/> issue de l'irradiance solaire totale moderne de { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), la décroissance du flux en carré inverse <c6/> et la poussée radiale <b>à l'opposé du Soleil</b>. Elle emprunte le <b>même second membre piloté par l'époque</b> que le troisième corps, en échantillonnant l'éphéméride <c7/> du Soleil une seule fois à l'époque avancée <c8/> partagée entre le troisième corps Soleil et la SRP. Composable : <c9/>. Validé de façon autonome par rapport à des signatures dérivées à la main : la <b>pression de rayonnement à 1 UA s'établit à la valeur classique ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b> ; la SRP d'un satellite LEO pleinement éclairé est <b>identique bit pour bit</b> à la formule du boulet de canon, pointe <b>à l'opposé du Soleil</b> et se situe dans la <b>bande d'environ { "1.36" }·{ "10" }⁻⁷ m/s²</b> pour cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg ; <b>doubler la distance au Soleil divise la magnitude par quatre</b> (carré inverse) ; l'<b>ombre cylindrique n'éclipse que le cylindre d'ombre</b> (à l'opposé du Soleil <em>et</em> à moins d'un rayon terrestre de la ligne Terre–Soleil) et donne une SRP <b>exactement nulle</b> en éclipse ; et dans le propagateur, la SRP <b>perturbe une orbite LEO d'une faible quantité bornée qui varie à peu près linéairement avec A/m</b> — tandis qu'un modèle sans perturbations reste indépendant du temps bit pour bit, laissant intacts les jeux de référence à deux corps/J2/zonaux. L'ombre conique à pénombre (ν lisse dans [{ "0,1" }]), la traînée atmosphérique et la validation croisée externe avec GMAT/Orekit restent à venir.

# text
# c1: propagator::ForceModel::third_body
# c2: accel_at
# c3: ephem
# c4: epoch_jd_tt + t/86400
# c5: precession::julian_centuries_tt
# c6: ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)
# c7: third_body_accel
# c8: t = 0
# c9: t = 1 day
seg-d3f819c21660 = <b>Troisième corps Soleil/Lune piloté par l'époque, raccordé au second membre variable dans le temps du propagateur (<c1/> / <c2/>).</b> La perturbation du troisième corps n'est plus un terme de force autonome — elle est désormais intégrée par le propagateur de Cowell comme une force véritablement <em>variable dans le temps</em> : chaque évaluation du second membre échantillonne les positions du Soleil et de la Lune de <c3/> à l'<b>époque avancée <c4/></b> (en réutilisant <c5/> pour la conversion jour↔siècle), de sorte que les perturbateurs se déplacent le long de leurs orbites pendant l'intégration au lieu d'être figés au départ. Composable avec n'importe quel modèle de gravité (<c6/>). Validé de façon autonome : le terme Soleil du second membre est <b>identique bit pour bit</b> à <c7/> évalué à la position d'éphéméride de cet instant, à <c8/> comme à <c9/> (ce qui prouve exactement le câblage { "86400" } s ↔ { "1" } jour ↔ 1/36525 siècle), le perturbateur <b>avance d'environ { "2.6" }·10⁹ m/jour</b> entre les échantillons (il n'est pas figé), les <b>magnitudes de marée instantanées en LEO</b> atteignent les bandes classiques d'environ { "5" }·{ "10" }⁻⁷ m/s² (Soleil) et d'environ { "1.1" }·{ "10" }⁻⁶ m/s² (Lune, ≈ { "2" }× le Soleil), chaque corps <b>perturbe de façon mesurable la trajectoire d'une journée tout en restant borné</b>, et le même état initial propagé à des <b>époques espacées d'un quart d'année donne une trajectoire différente</b> (l'axe de marée tourne de { "90" }°) — tandis qu'un modèle sans aucun des deux corps activé est indépendant du temps bit pour bit, laissant intacts les jeux de référence à deux corps/J2/zonaux. La précision d'éphéméride de niveau DE et la validation croisée externe avec GMAT/Orekit restent à venir.

# text
# c1: ephem::moon_position
# c2: §3.3.2
# c3: forces::third_body_accel
seg-0a517f6c4b1b = <b>Éphéméride lunaire à basse précision (<c1/>), qui complète la paire de troisièmes corps Soleil/Lune.</b> Ajoute la série lunaire à basse précision de Montenbruck et Gill (<c2/>) à côté du modèle du Soleil, de sorte que le <c3/> indépendant du corps peut désormais être piloté par l'un ou l'autre des luminaires <b>sans noyau DE/SPK externe</b>. Validée de façon autonome par rapport à des signatures lunaires dérivées à la main : la distance géocentrique reste dans l'<b>enveloppe réelle périgée/apogée (~{ "356 500" }–{ "406 700" } km)</b> sur un mois et sa <b>moyenne mensuelle retrouve le demi-grand axe d'environ { "384 400" } km</b> ; la <b>latitude écliptique ne dépasse jamais l'inclinaison orbitale lunaire d'environ { "5.3" }°</b> (vérifié en projetant sur le pôle de l'écliptique en coordonnées équatoriales, ce qui valide ensemble la série de latitude et la rotation d'obliquité) ; la <b>direction de la Lune revient à moins de { "1" }° après un mois sidéral ({ "27.3217" } j)</b> et son <b>mouvement quotidien reste dans la bande physique de { "12" } à { "15" }°/jour</b> ; et la perturbation lunaire du troisième corps sur un satellite LEO a la <b>magnitude classique d'environ { "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ le double de celle du Soleil). La précision de position de niveau DE, la traînée atmosphérique et la SRP restent à venir.

# text
# c1: forces::third_body_accel
# c2: ephem::sun_position
# c3: a = GM₃·((s−r)/|s−r|³ − s/|s|³)
# c4: ephem
# c5: third_body_potential
seg-8b7025e00dd1 = <b>Gravité d'un troisième corps (le Soleil) avec une éphéméride intégrée à basse précision (<c1/>, <c2/>).</b> Ajoute la perturbation du troisième corps au modèle de forces : <c3/> (attraction directe moins le terme indirect que le référentiel géocentrique doit soustraire), avec la position du Soleil fournie par la série analytique à basse précision de Montenbruck et Gill du nouveau module <c4/> — <b>aucun noyau DE/SPK externe n'est nécessaire</b> pour une exécution de faible fidélité. Validé de façon autonome : l'accélération <b>concorde avec le gradient exact de son propre potentiel perturbateur</b> (<c5/>), la perturbation <b>s'annule au géocentre</b> et a la <b>magnitude classique d'environ { "5" }·{ "10" }⁻⁷ m/s² sur un satellite LEO</b>, et l'éphéméride du Soleil atteint des ancrages J2000 dérivés à la main — <b>distance au périhélie ≈ { "1.471" }·10¹¹ m</b>, <b>déclinaison ≈ −{ "23" }° près du solstice de décembre</b>, un mouvement apparent <b>≈ { "1" }°/jour</b> (≈ { "90" }° par quart d'année), et une distance qui reste dans l'enveloppe de { "0.983" } à { "1.017" } UA de l'orbite terrestre sur une année complète. Fournit la moitié « troisième corps » de l'étape du modèle de forces de l'étape clé du propagateur numérique (la Lune est fournie dans une entrée voisine ci-dessus) ; la précision de position de niveau DE, la traînée atmosphérique et la SRP restent à venir.

# text
# c1: forces::zonal_accel
# c2: zonal_potential
# c3: J2..J6
# c4: ForceModel::with_zonals_j2_j6()
# c5: R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)
# c6: j2_accel
# c7: [J2]
# c8: J3
# c9: J2
# c10: J4..J6
# c11: z → −z
seg-99fd6ae1ea09 = <b>Modèle de forces à harmoniques zonaux J2–J6 (<c1/> / <c2/>).</b> Étend le modèle de forces du propagateur de Cowell au-delà de J2 jusqu'au champ zonal terrestre complet jusqu'au degré { "6" } (les <c3/> EGM-96 non normalisés publiés standard), raccordé au propagateur sous la forme <c4/>. L'accélération est le <b>gradient analytique exact</b> du potentiel perturbateur zonal <c5/> (polynômes de Legendre par récurrence ascendante), validé de trois manières indépendantes : elle <b>se réduit au <c6/>, validé sur 666 vecteurs, à la précision machine</b> lorsqu'elle est restreinte à <c7/> ; elle <b>concorde avec le gradient numérique de son propre potentiel</b> sur tout le champ J2..J6 (le contrôle de référence des champs conservatifs) ; et les termes impairs <c8/> comparés aux termes pairs <c9/>/<c10/> présentent leur <b>(anti)symétrie nord–sud caractéristique</b> sous <c11/> — l'asymétrie en forme de poire. Une orbite J2..J6 propagée conserve l'énergie totale (cinétique + centrale + potentiel zonal) à ~{ "1e-8" } près sur une journée et perturbe l'orbite J2 seul d'une faible quantité non nulle. Cela réalise l'étape 2 (« harmoniques zonaux J2–J6 ») de l'étape clé du propagateur numérique ; le champ tesséral EGM de haut degré, la traînée, la SRP, le troisième corps et la validation croisée externe avec GMAT/Orekit restent à venir.

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: f(t,[r;v]) = [v; a(r)]
# c5: ForceModel
# c6: j2_secular_rates
# c7: solve_kepler_checked
# c8: Err
# c9: e = 0.999
seg-59f0ba5a6269 = <b>Propagateur d'orbite numérique (de Cowell) (<c1/>).</b> Le premier propagateur <b>non analytique</b> de Kshana (le reste de la pile orbitale est du SGP4/SDP4 analytique) : il raccorde le modèle de forces à deux corps + J2 (<c2/>) au pilote RK4 adaptatif à doublement de pas (<c3/>) sous la forme <c4/>, avec un commutateur <c5/>. Validé par rapport à une <b>vérité analytique plus exigeante qu'un recoupement numérique ne le serait</b> : l'orbite non perturbée reproduit la <b>solution exacte de Kepler en variables universelles à moins d'un mètre sur une orbite LEO de 24 heures</b> (une barrière plus stricte que le « par rapport à une référence numérique < { "10" } m » qu'énonce l'étape clé), l'énergie spécifique et le moment cinétique se conservent à ~{ "1e-9" } relatif, et la régression nodale de J2 reproduit la <c6/> en forme close à la théorie du premier ordre (à { "2" } % près, le résidu en O(J2²)). Ajoute aussi <c7/>, un solveur de Newton de l'équation de Kepler qui <b>renvoie <c8/> au lieu d'une réponse silencieusement fausse</b> lorsqu'il ne converge pas dans un budget d'itérations borné (le cas <c9/> proche du périgée). Portée honnête : le modèle de forces est uniquement à deux corps + J2 — le champ tesséral EGM de haut degré ({ "200" }×{ "200" } + chargeur), la traînée (NRLMSISE-00), la SRP, les forces de troisième corps et une validation croisée externe avec GMAT/Orekit restent à venir.

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
# c3: docs/CAPABILITY.md
seg-d4c7c29f09d1 = <b>Appariement de cartes de gravité de 60 minutes sans GPS à < { "500" } m (<c1/>).</b> Approfondit la couche de PNT alternatif jusqu'à la cible de validation <em>Quantum Wayfarer</em> d'ESA NAVISP : un véhicule parcourt une trace d'environ { "700" } km pendant une coupure GNSS d'une heure complète — sa solution inertielle dérivant jusqu'à <b>≈ { "70" } km</b> — et un gravimètre à atomes froids associé à un apparieur particulaire/en grille <b>hiérarchique de grossier à fin</b> retrouve la dérive constante de l'INS à <b>≈ { "145" } m</b> (< { "500" } m), soit une réduction de > { "480" }×. Le véritable plancher de bruit blanc du gravimètre est injecté sous la forme d'une séquence <b>déterministe à graine fixée</b>, de sorte que l'apparieur ne reçoit jamais une vérité sans bruit tout en gardant une exécution exactement reproductible (vérifiée identique bit pour bit, et stable à quelques mètres près d'une réalisation de bruit à l'autre). Un test de niveau régression montre que l'affinement est <em>nécessaire</em> — une seule grille grossière cale à ~{ "2" } km, et seul l'affinement en trois étapes franchit la barrière des { "500" } m. Nouveau scénario versionné <c2/>. La ligne <c3/> reste honnêtement <b>partielle</b> (toujours aucune carte EGM2008 fournie) avec ses preuves mises à jour avec le résultat de 60 min < { "500" } m. Portée honnête inchangée : champ en harmoniques sphériques de bas degré + masconcentrations synthétiques ; un Monte-Carlo sur des réalisations d'erreur de représentation de la carte reste à venir.

# text
# c1: docs/CLAIMS-VS-REALITY.md
# c2: tests/no_overclaims.rs
# c3: OC-0
# c4: OC-13
# c5: OC-0
# c6: OC-2
# c7: OC-7
# c8: OC-8
# c9: README
# c10: CAPABILITY
# c11: GLOSSARY
# c12: web/
seg-4262a99328bb = <b>Registre des affirmations excessives + garde contre les régressions (<c1/>, <c2/>).</b> Clôt la piste d'honnêteté et de retrait des affirmations : les quatorze affirmations excessives qu'un audit antérieur avait recensées (<c3/>…<c4/>) sont désormais toutes GREEN — les affirmations fortes (filtre de Kalman couplé horloge+position <c5/>, brouillage J/S→C/N₀→perte d'accrochage <c6/>, physique du CAI de Mach–Zehnder <c7/>, HPL/VPL ARAIM <c8/>) sont <b>remplacées par des capacités livrées et testées</b> plutôt que par une formulation adoucie, et les lignes restantes voient leurs affirmations retirées pour correspondre au code. Un nouveau test de CI analyse les surfaces publiques en vigueur (<c9/>, <c10/>, <c11/>, <c12/>) et échoue si une expression d'affirmation excessive brute retirée réapparaît sans réserve, de sorte qu'une ligne GREEN ne peut pas régresser en silence. La figure de mérite d'« intégrité » de chaque exécution reste honnêtement étiquetée <em>autocohérence du filtre</em> (et non intégrité aéronautique) ; les véritables HPL/VPL ARAIM sont présentés séparément afin que les deux ne soient jamais confondus.

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: P̄₁₁=√3·cosφ
# c4: P̄₂₀=(√5/2)(3sin²φ−1)
# c5: P̄₂₂=(√15/2)cos²φ
# c6: mapmatch
# c7: particle_filter
# c8: scenarios/gravity-map-nav.toml
# c9: kind=
# c10: docs/CAPABILITY.md
seg-27da62a7ff63 = <b>Navigation par appariement de cartes de gravité (PNT alternatif sans GPS).</b> Le nouveau <c1/> ajoute la couche de capacités de PNT alternatif que réclament les études d'appariement de cartes de gravité <em>Quantum Wayfarer</em> / QT-CCI d'ESA NAVISP : un <b>modèle de mesure de gravimètre</b> à atomes froids dont le plancher de bruit blanc est dérivé de l'ASD de l'accéléromètre CAI (<c2/>) ; un <b>champ d'anomalie de gravité en harmoniques sphériques</b> de bas degré, entièrement normalisé (validé par rapport aux fonctions de Legendre en forme close <c3/>, <c4/>, <c5/> et à une anomalie à un seul terme de { "1.897" } mGal dérivée à la main) plus des <b>masconcentrations</b> synthétiques pour les structures locales de haut degré ; et un <b>filtre particulaire d'appariement de cartes de gravité</b> (qui compose <c6/> + <c7/>) qui retrouve une trace privée de GPS à partir de la séquence d'anomalies qu'elle traverse. Un banc d'essai NAVISP versionné (<c8/>) ramène une dérive inertielle libre d'environ { "73" } km à quelques km. Portée honnête : Kshana ne fournit <b>pas</b> le jeu complet de coefficients EGM2008 de { "2190" }° — le champ est de bas degré + masconcentrations, et non une véritable carte à haute résolution ; le chargeur EGM/EIGEN, la carte magnétique, le SLAM assisté par relief et le raccordement de <c9/> au moteur de scénarios avec un graphique SVG de dérive restent à venir. <c10/> « Navigation par carte de gravité / PNT alternatif » → <b>partiel</b>.

# text
# c1: src/maneuver.rs
# c2: r1
# c3: r2
# c4: v1
# c5: v2
# c6: r2
seg-d028a2db7837 = <b>Modélisation des manœuvres et tête de pont de la conception de trajectoire.</b> Le nouveau <c1/> ajoute la première couche de conception de trajectoire au-dessus de SGP4 : des nœuds de ΔV impulsionnels qui appliquent une discontinuité de vitesse et reportent une covariance { "6" }×{ "6" } (poussée déterministe ⇒ transition d'état identité ; la covariance d'erreur d'exécution est tournée du référentiel de la poussée — ECI ou LVLH — vers le bloc de vitesse), une intégration de poussée finie (poussée constante sur un arc de poussée avec la masse comme état) dont le ΔV obtenu est vérifié par rapport à l'équation de fusée de <b>Tsiolkovski</b> en forme close à mieux que { "0.01" } %, un solveur de <b>Lambert</b> <b>d'Izzo-2015</b> à une seule révolution (<c2/>, <c3/>, temps de vol ⇒ <c4/>, <c5/>), un <b>propagateur de Kepler</b> exact en variables universelles (vérité à deux corps) et un balayage <b>porkchop</b> qui met en correspondance une grille époque de lancement × époque d'arrivée avec le C3 de départ et le V∞ d'arrivée, émis sous forme de tableau JSON 2-D pour un rendu de contours dans le navigateur. La validation est autonome et plus exigeante qu'une simple lecture de tutoriel : chaque sortie de Lambert est renvoyée en aller-retour dans le propagateur de Kepler (elle doit retomber sur <c6/>), et le minimum du porkchop est vérifié par rapport au plancher analytique de C3 d'un transfert de Hohmann entre deux orbites circulaires coplanaires. Kshana positionne ceci comme la couche de simulation de performance au-dessus de GMAT/Orekit, et non comme un remplacement (les branches à plusieurs révolutions et une véritable éphéméride planétaire restent hors périmètre). Dix tests.

# text
# c1: src/fusion/tightly_coupled17.rs
# c2: [position, velocity, attitude-error, accelerometer bias, gyro bias, clock bias, clock drift]
# c3: C ≈ I + [ψ×]
# c4: q_va
# c5: crate::inertial::quantum_imu
seg-cbdd0e56d89f = <b>UKF GNSS/INS à couplage serré à 17 états complet avec navigation à l'estime par CAI quantique.</b> Le nouveau <c1/> porte l'état complet de navigation inertielle qu'estime un filtre à couplage serré — <c2/> ({ "17" } états) — propagé à travers la mécanisation en repère lié (strapdown) pilotée par la force spécifique et la vitesse angulaire mesurées, avec la rotation corps→inertiel aux petits angles <c3/> afin que l'erreur d'attitude se couple à l'accélération horizontale (le couplage d'inclinaison standard de l'INS). Pendant une coupure GNSS, il navigue en marche libre sur l'IMU seule ; le bruit de processus de marche aléatoire de vitesse est le <c4/> dérivé de l'accéléromètre à interféromètre à atomes froids (<c5/>), de sorte que la dérive à l'estime est celle qui est limitée par le capteur quantique — une coupure de 120 secondes reste bornée à quelques centaines de mètres, contre les kilomètres qu'atteindrait un INS libre de qualité navigation. La mise à jour pseudodistance/vitesse radiale passe par le filtre non parfumé partagé (avec α = { "1" } pour des poids bien conditionnés à cette taille d'état). Cinq tests : identité du modèle de mesure, intégration à vitesse constante avec IMU parfaite, assistance GNSS, estimation du biais d'accéléromètre et banc d'essai de coupure de 120 s limitée par le CAI.

# text
# c1: CITATION.cff
# c2: ROADMAP.md
seg-087521bb32b7 = <b>Formulation honnête du positionnement quantique.</b> Le descripteur principal est désormais un <b>« simulateur de résilience PNT avec modèles de performance de capteurs quantiques »</b>, de façon cohérente dans l'accroche du README, la ligne de citation, <c1/> (titre + résumé) et l'illustration de la bannière — en remplacement de la formulation marketing plus vague « simulateur PNT hybride quantique/classique ». La section <em>Ce que c'est / ce que ce n'est pas</em> du README gagne un énoncé de portée explicite <b>« Ce n'est pas (encore) »</b> (pas un moteur de physique d'interférométrie atomique issu des premiers principes, pas un récepteur GNSS/solveur PVT, pas un outil de conception de mission), et un nouveau <c2/> de premier niveau fait de la <b>couche de physique quantique un élément P2</b> (phase CAI de Mach–Zehnder, bruit de projection, tenseur de vibration) afin que les lecteurs sachent que la physique issue des premiers principes est prévue et à venir, et non abandonnée. Aucun changement de comportement ni d'API.

# text
seg-f8fa36190ec7 = Étude de compromis de conception de constellation : balayage de conception Walker avec front de Pareto, JSON des temps de revisite et validation sub-kilométrique de la formule de Walker.

# text
# c1: src/walker.rs
# c2: walker_design_sweep
# c3: planes × sats_per_plane
# c4: pareto_front
# c5: WalkerDesignReport::to_json
# c6: i:T/P/F
# c7: R_z(2π/P)
# c8: 2π/S
# c9: gps-ops
# c10: scenarios/orbit-sgp4-gps.toml
seg-31518e92d8cf = <c1/> gagne <c2/>, qui exécute une grille <c3/> (par exemple un compromis { "3" }×{ "3" }) à inclinaison fixe et tabule, pour chaque conception, la fraction de couverture, le PDOP du pire cas et l'écart de revisite maximal/moyen ; <c4/> signale les conceptions non dominées (moins de satellites, plus de couverture, PDOP plus faible, revisite plus courte), et <c5/> sérialise les cellules et le front de Pareto — champs de temps de revisite inclus — en JSON. Une nouvelle validation aligne le générateur sur la formule de Walker <c6/> : les satellites de même emplacement dans des plans adjacents se révèlent se correspondre par une rotation <c7/> exacte à <b>moins de { "1" } km sur { "24" } h complètes</b> de propagation SGP4 (la respiration à courte période de J2 est de mode commun et s'annule), et les emplacements dans le plan sont confirmés espacés de <c8/> en moyenne. S'appuie sur l'instantané Celestrak réel <c9/> du 2021-07-28 versionné (<c10/>, exercé par les tests de couverture de scénarios et d'aller-retour SP3).

# text
# c1: src/timetransfer_adv.rs
# c2: twstft_sagnac
# c3: Δt = 2·A·ω_E/c²
# c4: twstft_sagnac_bipm
# c5: run_twstft
# c6: T_A − T_B
# c7: gnss_common_view_series
# c8: iono_free_combination
# c9: ppp_receiver_clock
# c10: rytov_variance
# c11: fried_parameter
# c12: lognormal_fading
# c13: fit_power_law_psd
# c14: h_α
# c15: ensemble_timescale
seg-71d257587c28 = <b>Transfert avancé de temps et de fréquence : TWSTFT, vue commune GNSS, PPP, optique, ajustement en loi de puissance IEEE-1139 et ensemble d'horloges.</b> Le nouveau <c1/> construit les méthodes de transfert opérationnelles sur les formes closes de Sagnac/vue commune livrées et sur les outils de stabilité d'Allan. <c2/> donne la correction de Sagnac du transfert de temps et de fréquence par satellite bidirectionnel (TWSTFT) comme la somme de la boucle à trois sauts, exactement égale à la forme close du BIPM <c3/> (recoupée par le <c4/> indépendant) ; <c5/> émet une série <c6/> d'un jour et son TDEV. <c7/> prend la différence simple de deux stations au sol synthétiques de sorte que l'horloge du satellite s'annule. <c8/> + <c9/> sont la combinaison sans ionosphère du PPP et la résolution de l'horloge du récepteur par rapport à une vérité (synthétique) de qualité SP3, qui annule exactement l'ionosphère du premier ordre. <c10/>, <c11/> et le modèle <c12/> à moyenne unitaire décrivent la scintillation due à la turbulence d'une liaison optique en espace libre. <c13/> est un ajustement complet par moindres carrés à cinq coefficients <c14/> selon l'IEEE-1139 de la courbe de variance d'Allan (les cinq processus de bruit canoniques à la fois), le processus dominant étant indiqué par décade de τ. <c15/> forme une échelle de temps papier pondérée par l'inverse de la variance, dont l'écart-type d'Allan tombe strictement sous celui de la meilleure horloge contributrice. { "31" } tests unitaires ; les cibles de validation sont des formes closes et une vérité synthétique — l'ingestion d'une véritable Circular-T du BIPM / d'un SP3 de l'IGS reste à faire.

# text
seg-c3ab93e7324f = Cartes d'ionosphère IONEX : analyseur de fichier, interpolation temporelle et correspondance d'obliquité oblique.

# text
# c1: src/ionex.rs
# c2: parse_ionex
# c3: START/END OF TEC MAP
# c4: IonexMap
# c5: TecGrid
# c6: 10^EXPONENT
# c7: interpolate_tec_in_time
# c8: obliquity_factor
# c9: slant_tec
# c10: M(z) = 1/cos z′
# c11: sin z′ = (Rₑ/(Rₑ+H))·sin z
seg-7b94a515ce2b = <c1/> gagne <c2/>, qui lit le format de fichier IONEX (définition de la grille d'en-tête + blocs <c3/>) pour en faire une séquence de <c4/> — en normalisant l'ordre des latitudes du fichier, du nord au sud, en une <c5/> à pas positif et en mettant les valeurs à l'échelle par <c6/>. <c7/> mélange deux cartes successives à une époque demandée, et <c8/> / <c9/> projettent le TEC vertical sur un rayon oblique par le facteur de coque mince à couche unique <c10/> (<c11/>). Avec le modèle de grille livré, cela transforme une carte mondiale d'ionosphère mesurée de l'IGS en un retard oblique utilisable.

# text
seg-2ed90763cf11 = Conception de constellation : dimensionnement en rues de couverture + comparaison de multiconstellations.

# text
# c1: src/walker.rs
# c2: min_satellites_streets_of_coverage
# c3: λ
# c4: c
# c5: p = ⌈π/(2c)⌉
# c6: None
# c7: compare_constellations
# c8: pdop_sweep
seg-326e8957bb10 = <c1/> gagne <c2/>, un solveur idéalisé du nombre minimal de satellites en rues de couverture — à partir du demi-angle de couverture <c3/> livré et de la demi-largeur de rue <c4/>, il dimensionne la constellation quasi polaire pour une couverture mondiale simple continue à <c5/> plans (par exemple, un plan de 4 satellites à l'altitude du GPS nécessite { "2" } plans, soit { "8" } satellites), et renvoie <c6/> lorsque les satellites sont trop épars pour former une rue continue. <c7/> est l'outil de comparaison de multiconstellations : il évalue chaque conception de Walker nommée sur la même station/fenêtre via <c8/> et renvoie côte à côte leur couverture / PDOP / taille. Portée honnête : la correction exacte de Rider à la couture, à la frontière entre plans à rotation inverse, et un globe de couverture 3D restent à venir.

# text
seg-90f5ec9ff4ae = Détection de leurrage multicouche : détecteur de parité de cohérence RAIM + fusion des couches.

# text
# c1: src/spoof_monitors.rs
# c2: parity_raim_test
# c3: (m−4)
# c4: fuse_spoof_layers
seg-a0e4878bea45 = <c1/> gagne la troisième et dernière couche de détection ainsi que l'étape de fusion : <c2/> ajuste par moindres carrés la solution de position/horloge à un jeu redondant de pseudodistances et compare la somme des carrés des résidus pondérés restante à son seuil du χ² à <c3/> degrés de liberté — en signalant un <em>sous-ensemble</em> biaisé de satellites tout en laissant correctement un biais de <em>mode commun</em> (absorbé par l'horloge du récepteur) invisible au RAIM, sans le masquer. <c4/> combine les couches de parité, d'AGC et de SQM en une seule décision pondérée qui consigne les couches qui se sont déclenchées. Un Monte-Carlo caractérise le détecteur : <b>P_fa ≈ { "0.068" }</b> empirique face à un point de conception de { "0.05" }, avec une <b>non-détection qui passe de { "0.885" } pour un biais de leurrage de 2σ à { "0.16" } à 8σ</b>. Portée honnête : la validation croisée avec des vecteurs de test de leurrage publiés spécifiques (Spirent / ION GNSS+) exige ces jeux de données externes et reste à venir.

# text
# c1: src/fusion/coupled.rs
# c2: CoupledPntFilter
seg-2413b3d10f5b = <b>Ensemble de validation de Kalman couplé contre découplé.</b> Un Monte-Carlo de 100 essais dans <c1/> quantifie la valeur du maintien de la covariance croisée position↔horloge : une référence de base découplée fidèle, intégrée (validée bit pour bit par rapport au <c2/> livré), traite les mêmes données avec les blocs croisés mis à zéro, et après des pseudodistances quasi dégénérées plus une correction d'horloge seule, le filtre couplé retrouve la position à <b>{ "2.97" } m RMS contre { "48.8" } m pour le filtre découplé, en gagnant { "97" } essais sur { "100" }</b> — la correction d'horloge n'affine la position que par la corrélation que le paquet découplé écarte. Cela achève la suite de validation de l'exactitude de Kalman (forme de Joseph, sûreté de semi-définition positive, cohérence NEES/NIS, et maintenant l'ensemble du filtre couplé).

# text
# c1: src/orbit_determination.rs
# c2: [r, v]
# c3: src/forces.rs
# c4: src/integrator.rs
# c5: src/batch_ls.rs
# c6: determine_orbit_batch
# c7: determine_orbit_sequential
seg-804f35695553 = <b>Chaîne de détermination d'orbite (par lots + séquentielle).</b> Le nouveau <c1/> retrouve l'état orbital <c2/> d'un satellite à partir du suivi en distance par une station au sol, en composant trois éléments livrés : le modèle de forces à deux corps + J2 (<c3/>) et l'intégrateur RK4 (<c4/>) propagent un état candidat sur l'arc, un modèle de mesure de distance prédit la distance de chaque station, et le correcteur par lots de Gauss–Newton (<c5/>) amène le candidat sur l'état d'ajustement optimal (<c6/>). La même dynamique et le même modèle de distance pilotent aussi une détermination récursive <b>séquentielle</b> sur le filtre non parfumé livré (<c7/>). Quatre tests la valident : la prédiction de distance sur l'arc ; la <b>récupération par lots à moins d'un mètre / mm·s⁻¹ à partir de distances sans bruit</b> ; la récupération par lots à <b>~{ "2" } m avec un résidu après ajustement au plancher de bruit de { "5" } m</b> (la signature d'un ajustement par moindres carrés cohérent) ; et la récupération séquentielle à quelques dizaines de mètres près. Portée honnête : les mesures de vitesse radiale/Doppler et d'angle, une matrice de transition d'état analytique de J2 et le masquage de visibilité des stations restent à venir.

# text
# c1: src/fusion/tightly_coupled.rs
# c2: src/fusion/ukf.rs
# c3: [px,py,pz,vx,vy,vz,b,d]
# c4: pseudorange
# c5: ρ = |p − sᵢ| + b
# c6: range_rate
# c7: ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d
# c8: TightlyCoupled
# c9: propagate
# c10: propagate_orbital
# c11: update_gnss
# c12: src/forces.rs
# c13: src/integrator.rs
# c14: propagate_orbital
seg-0a81039e510c = <b>Navigateur UKF GNSS/INS à couplage serré.</b> Le nouveau <c1/> raccorde le noyau de Kalman non parfumé livré (<c2/>) à un navigateur à couplage serré fonctionnel sur le <c3/> à huit états (position/vitesse ECEF plus biais et dérive de l'horloge du récepteur en unités de distance). Il ingère les <b>mesures brutes des satellites</b> — <c4/> (<c5/>) et <c6/>/Doppler (<c7/>) — plutôt qu'une position déjà calculée, de sorte que <c8/> (avec <c9/>/<c10/>/ <c11/>) continue de corriger <b>avec moins de quatre satellites</b> et navigue en marche libre pendant les coupures GNSS sur sa dynamique propagée. Cinq tests le valident de bout en bout, y compris les scénarios d'acceptation de l'étape clé : la géométrie pseudodistance/Doppler par rapport à des valeurs calculées à la main ; la convergence sans bruit à un niveau <b>sub-métrique</b> avec cinq satellites ; un cas à <b>trois satellites</b> qui converge de ~{ "212" } m à ~{ "13" } m là où une position instantanée PVT ne peut même pas être formée ; une <b>coupure de 120 secondes</b> à vitesse constante à moins de { "50" } m ; et — l'acceptation principale — un <b>passage LEO courbe de 30 minutes</b> (véritable orbite à deux corps + J2) avec une <b>coupure GNSS de 120 secondes</b>, tenu à <b>{ "0.77" } m RMS sur le passage</b> et <b>{ "2.9" } m dans le pire des cas pendant la coupure</b>. Cette navigation orbitale en marche libre compose le modèle de forces de gravité livré (<c12/>) et l'intégrateur RK4 (<c13/>) dans le modèle de processus de l'UKF (<c14/>), de sorte que le filtre suit la courbure de l'orbite — ce qu'une marche libre à vitesse constante ne peut pas faire (la courbure seule représente ~{ "58" } km sur { "120" } s en LEO). Portée honnête : la navigation orbitale en marche libre utilise le modèle de forces à deux corps + J2 plutôt que la force spécifique brute de l'IMU (pour une plateforme orbitale non propulsée, les deux coïncident) ; l'intégration d'un état d'erreur d'IMU en repère lié et de corrections iono/tropo dans la boucle restent à venir.

# text
# c1: src/mapmatch.rs
# c2: src/particle_filter.rs
# c3: field_likelihood
# c4: map_match_likelihood
# c5: Fn(lat, lon) -> value
# c6: src/ionex.rs
# c7: e^(−½)
seg-792f25a4a1da = <b>Modèle de mesure d'appariement de cartes (navigation référencée au relief / à la gravité).</b> Le nouveau <c1/> fournit le modèle de mesure qui transforme le filtre particulaire à échantillonnage d'importance séquentiel livré (<c2/>) en un navigateur fonctionnel sans GPS : <c3/> (une vraisemblance gaussienne d'appariement de champ) et <c4/>, qui échantillonne n'importe quel champ de référence géoréférencé — élévation du relief (TRN) ou anomalie de gravité — à la position d'une particule et la pondère selon son accord avec la valeur mesurée du véhicule. Le champ est n'importe quel échantillonneur <c5/>, de sorte qu'il se compose avec la grille bilinéaire de <c6/> ou une fermeture. Deux tests l'ancrent — la vraisemblance culmine (={ "1" }) pour un appariement parfait et tombe à <c7/> à un sigma, et un filtre particulaire sur une zone de relief synthétique distinctive retrouve la position vraie à { "0.1" } près. Portée honnête : les véritables cartes de référence (élévation SRTM, anomalie de gravité EGM/EIGEN) et leurs chargeurs restent à venir.

# text
# c1: src/lunar.rs
# c2: σ_URE ≈ 30 m
# c3: P_sat ≈ 1e-4
# c4: lunar_araim
# c5: σ_URE
seg-9240e95a5058 = <b>Intégrité du PNT cislunaire (ARAIM lunaire).</b> Le nouveau <c1/> applique le moteur ARAIM MHSS côté Terre à un service de navigation lunaire de type LunaNet avec les paramètres lunaires (<c2/> contre { "0.6" } m pour le GPS, <c3/>) : constantes lunaires, base Est/Nord/Haut sélénocentrique et assistant de géométrie du ciel, et <c4/> (HPL/VPL). Trois tests l'ancrent — la base sélénocentrique orthonormée, la géométrie de distance oblique et la mise à l'échelle linéaire exacte du niveau de protection avec <c5/> (le σ lunaire de { "30" } m donne un niveau de protection { "50" }× plus grand que la même géométrie avec le σ du GPS de { "0.6" } m — la raison quantitative pour laquelle l'intégrité du PNT lunaire est difficile). Portée honnête : l'éphéméride précise de la NRHO de LANS, le budget d'erreur du signal dans l'espace et la réduction de référentiel MCI↔MCMF restent à venir.

# text
# c1: src/jd2.rs
# c2: Jd2
# c3: day
# c4: frac
# c5: [0,1)
# c6: new
# c7: from_parts
# c8: add_seconds
# c9: diff_seconds
# c10: total
# c11: f64
# c12: f64
# c13: f64
seg-4a43e2ff83d7 = <b>Dates juliennes en deux parties (haute précision).</b> Le nouveau <c1/> ajoute <c2/>, une date julienne scindée en un <c3/> entier et un <c4/> fractionnaire dans <c5/> (la convention de SOFA/hifitime), avec <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Les différences entre époques voisines restent exactes jusqu'au plancher de <c11/> là où une date julienne en un seul <c12/> perd ~{ "50" } µs près de J2000. Quatre tests l'ancrent : l'aller-retour, la normalisation de la fraction, la récupération exacte à la microseconde (l'échec du <c13/> unique étant démontré à côté), et l'arithmétique additive/réversible des secondes.

# text
# c1: src/omm.rs
# c2: oem
# c3: OmmFile::from_tle
# c4: BSTAR
# c5: to_omm_kvn
# c6: ndm/omm
seg-8eef92a85711 = <b>Rédacteur CCSDS OMM (Orbit Mean-Elements Message).</b> Le nouveau <c1/> complète le rédacteur d'éphéméride <c2/> par le message d'éléments moyens : <c3/> met en correspondance les éléments moyens SGP4/TLE avec les unités OMM (moyen mouvement en tours/jour, angles en degrés, plus <c4/>), et <c5/> sérialise la forme KVN CCSDS 502.0-B-2 de la voie des normes — de sorte qu'une orbite de Kshana peut être consommée par n'importe quel outil compatible OMM plutôt que sous la forme d'un TLE sur mesure. Deux tests ancrent la conversion d'unités TLE→OMM (≈ { "15.5" } tours/jour, inclinaison de { "51.6" }°, etc.) et la présence des mots-clés KVN requis. Portée honnête : la forme KVN et la correspondance avec le TLE sont livrées ici ; le rendu XML (<c6/>) et un aller-retour avec un analyseur de référence restent à venir.

# text
# c1: src/particle_filter.rs
# c2: predict
# c3: update
# c4: resample
# c5: effective_sample_size
# c6: ionex
seg-ca2b730b5cc3 = <b>Filtre particulaire à rééchantillonnage d'importance séquentiel.</b> Le nouveau <c1/> ajoute l'estimateur non linéaire et non gaussien qui sous-tend la navigation sans GPS assistée par carte (appariement de relief ou de cartes de gravité) : <c2/> (propager les particules à travers la dynamique + un bruit de processus gaussien), <c3/> (repondérer par une vraisemblance de mesure par particule), <c4/> systématique, le moniteur de dégénérescence <c5/> et l'estimation par moyenne pondérée. Six tests ancrent exactement le noyau déterministe — l'ESS couvrant { "1" }…N, le rééchantillonnage systématique qui choisit des indices proportionnellement au poids, la combinaison convexe de la moyenne pondérée, une vraisemblance gaussienne qui tire l'estimation vers la mesure, le comportement de rééchantillonnage vers l'uniforme et le déterminisme de la prédiction à graine fixée. Portée honnête : le moteur est livré ici ; les cartes de référence (élévation SRTM, anomalie de gravité EGM) et le modèle de mesure de carte restent à venir (l'échantillonneur grille+bilinéaire de <c6/> servirait aussi bien pour une carte de gravité/relief).

# text
# c1: tests/navego_imu_crossval.rs
# c2: navego_example_allan.m
# c3: ADEV(1 s) = σ·√dt
# c4: .mat
seg-815eda56aad9 = <b>Validation croisée NaveGo de la chaîne de bruit de l'IMU</b> (<c1/>). Un recoupement externe avec NaveGo (la boîte à outils INS/GNSS open source de R. Gonzalez) : il reproduit l'aller-retour synthétique de <c2/> sur son profil de référence publié du Microstrain 3DM-GX3-35, et confirme que notre estimateur d'ADEV à recouvrement retrouve les coefficients de marche aléatoire de vitesse et d'angle de NaveGo (<c3/>) à moins de { "5" } % près, avec la pente attendue de −1/2 du bruit blanc. (Le journal STIM300 enregistré de { "40" } Mo au format <c4/> n'est pas ingéré : format binaire non pris en charge.)

# text
seg-b67b3ec240de = Mise à jour GNSS/INS à couplage serré (pseudodistance).

# text
# c1: GnssInsEkf::update_tightly_coupled
# c2: ClosedLoopInsGnss::fuse_tightly_coupled
# c3: tight_coupling
seg-c926dddc5256 = <c1/> (et l'enveloppe <c2/>) implémentent la mesure dans le domaine des distances, jusque-là réduite à une ébauche : l'innovation est la distance prédite entre la position de l'INS et chaque satellite, comparée à la pseudodistance mesurée, avec un jacobien de ligne de visée sur l'erreur de position. Comme chaque satellite constitue une mesure scalaire, le filtre continue de corriger avec <b>moins de quatre satellites</b>, là où une solution PVT à couplage lâche n'existe pas. Cinq tests couvrent l'annulation à quatre satellites, la correction à deux satellites (aucun PVT possible), l'observabilité le long de la ligne de visée avec un seul satellite, et la validation des entrées. Pseudodistance uniquement ; la phase de la porteuse et un état explicite d'horloge du récepteur restent sur la feuille de route. La fonctionnalité cargo <c3/>, inutilisée (elle conditionnait l'ancienne ébauche d'erreur), est supprimée.

# text
# c1: kind = "gnss-ins"
# c2: src/fusion/pack.rs
# c3: closed_loop
# c4: gnss_ins_ekf
# c5: scenarios/gnss-ins.toml
seg-94ebfac3bbc3 = <b>Paquet de scénarios GNSS/INS à couplage lâche (<c1/>, <c2/>).</b> Il relie le navigateur strapdown à trois axes et l'EKF à état d'erreur à 15 états (<c3/> / <c4/>) dans un scénario exécutable doté d'une figure de mérite : l'EKF asservit la mécanisation sur des positions GNSS bruitées tant que la couverture est disponible, puis poursuit à l'inertie pendant l'interruption, en remplaçant la réinitialisation sur la vérité terrain du paquet scalaire à 1 degré de liberté d'origine par une véritable fusion. Le résultat fournit la série d'erreur horizontale fusionnée, la figure de mérite de position notée (disponibilité / RMS pendant l'interruption / holdover), et le RMS de l'INS libre en boucle ouverte à titre de comparaison ; une paire d'IMU quantique/classique ne diffère que par le biais réel. Lancé depuis le point d'entrée CLI/Python/wasm, avec un exemple <c5/>. Cadrage honnête : couplage lâche uniquement, une seule trajectoire déterministe, et l'erreur fusionnée pendant l'interruption est limitée par un plancher dû à l'erreur d'attitude au moment du passage de relais (on ne prétend donc pas qu'elle évolue avec le biais) ; les résultats robustes sont que la fusion fait mieux que l'estime sans assistance pour un capteur biaisé, et qu'un capteur à biais plus faible offre la meilleure marche à l'inertie sans assistance.

# text
# c1: src/walker.rs
# c2: walker
# c3: i: T/P/F
# c4: pdop_sweep
# c5: {planes × sats × inclination}
# c6: coverage_revisit
# c7: gps-ops
seg-0a2df01f99d8 = <b>Conception de constellation sur le noyau SGP4 validé (<c1/>).</b> Un nouveau module <c2/> produit un motif Walker-delta conçu (<c3/>) sous forme d'<b>éléments moyens</b> SGP4, de sorte que la constellation synthétique se propage par le même chemin SGP4 que celui validé à { "4.12" } mm près par rapport aux vecteurs AIAA 2006-6753, et non par le générateur képlérien analytique. Par-dessus : <c4/> tabule la couverture et le PDOP médian/pire sur une grille de conception <c5/>, et <c6/> fournit la fraction de couverture et les intervalles de revisite (pire/moyen) en un point au sol. Validé par les monotonies physiques qu'un compromis doit respecter (plus de satellites ⇒ couverture plus élevée, PDOP plus bas, revisite plus courte). Par ailleurs, un véritable <b>instantané TLE Celestrak <c7/></b> (2021-07-28, { "30" } satellites GPS opérationnels) est ajouté comme jeu d'essai réservé aux tests, et le chemin géométrique TLE réel → SGP4 → ECEF est validé par rapport à lui (couche MEO complète à { "1" } % près, neuf satellites tous en vue avec un PDOP de { "1.64" }), en plus des chemins de données réelles SP3 et RINEX existants.

# text
seg-9e051f3725df = Degrés de liberté effectifs propres au type de bruit pour les intervalles de confiance d'Allan.

# text
# c1: allan::edf_overlapping_adev
# c2: PowerLawNoise
# c3: classify_power_law
# c4: overlapping_adev_curve
# c5: AdevPoint
# c6: noise
# c7: edf
# c8: ci_lo
# c9: ci_hi
seg-2392bec8f0b6 = <c1/> implémente les formes closes du tableau { "5" } de NIST SP { "1065" } (l'ensemble simple de Stable32) pour les cinq types canoniques de bruit en loi de puissance (PM blanc/flicker, FM blanc/flicker, FM à marche aléatoire), en remplaçant le décompte conservateur sans recouvrement comme degrés de liberté du χ². Une nouvelle énumération <c2/> et <c3/> identifient le type dominant à partir de la pente de l'écart-type d'Allan <b>modifié</b> de l'enregistrement (la MDEV sépare le PM blanc du PM flicker là où l'ADEV ne le peut pas), et <c4/> associe désormais à chaque point de la courbe d'ADEV exportée le type de bruit identifié, son edf et une bande de confiance à { "95" } % (<c5/> gagne <c6/>/<c7/>/<c8/>/<c9/>, de façon additive avec des valeurs par défaut serde). Validé de deux façons : les cinq formules concordent avec des valeurs évaluées à la main à { "1e-12" } près, et un ensemble Monte-Carlo de { "4" } 000 enregistrements de FM blanc confirme que la formule prédit l'edf du khi-deux réel de l'estimateur à { "20" } % près (et qu'elle fait nettement mieux que le décompte conservateur). Huit nouveaux tests.

# text
seg-df59cc71120f = Modèle stochastique du transfert de temps bidirectionnel.

# text
# c1: timetransfer::TwoWayLink
# c2: (m_AB - m_BA)/2
# c3: two_way_offset_estimate
# c4: 1/sqrt(2)
# c5: ClockModel
# c6: sigma_y^2(tau) = q_rw*tau/3
# c7: LinkCfg
# c8: q_wf_s
# c9: q_rw_s
# c10: adev_tau0
# c11: timetransfer
# c12: tau/3
# c13: step()
# c14: q=0
seg-d2add1ce01e1 = <c1/> remplace l'échantillonneur à bruit blanc seul par un modèle fondé sur la physique : le retard de trajet réciproque (mode commun) s'annule dans l'estimation <c2/> (<c3/>, de sorte que deux mesures unidirectionnelles indépendantes se moyennent en <c4/>), et le résidu est le retard différentiel <b>non réciproque</b>, modélisé comme un processus coloré FM blanc + FM à marche aléatoire (l'<c5/> validé), ce qui donne à la série d'erreur de synchronisation une signature d'Allan réaliste (<c6/>) au lieu d'un bruit blanc plat. <c7/> gagne <c8/>/<c9/> (valeur par défaut serde { "0" } ⇒ le comportement historique à bruit blanc seul, bit à bit), la figure de mérite de la liaison fournit <c10/> (l'écart-type d'Allan du modèle au pas de base), et le scénario et la CLI <c11/> l'exposent. Figure de mérite de référence (golden) refigée. Six tests dérivés à la main (annulation du mode commun, le gain bidirectionnel en racine de { "2" }, la loi RWFM en <c12/> via le propre <c13/> de la liaison, l'équivalence avec l'ancien comportement à <c14/>, le déterminisme, et l'exposition de bout en bout de la figure de mérite).

# text
seg-6c7a1dd63be0 = Parité numérique avec Stable32 pour les estimateurs de la famille d'Allan (NBS14).

# text
# c1: tests/allan_reference.rs
seg-adbb47ca87b4 = <c1/> valide l'ADEV à recouvrement, l'ADEV modifié, l'écart temporel et le Hadamard à recouvrement par rapport aux écarts-types de référence de Stable32 pour le jeu de données canonique <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~p.107) à tau = { "1" }, { "2" }, avec une tolérance relative de { "1e-4" } ; l'accord réel est d'environ { "1e-6" }. Cela ancre les mathématiques des estimateurs sur l'implémentation de référence de fait, et non seulement sur l'auto-cohérence analytique des estimateurs eux-mêmes. Seuls les chiffres de référence publics sont utilisés ; aucun code tiers.

# text
# c1: integrity
# c2: integrity
# c3: IntegrityScenario
# c4: seed
seg-35b0c0644fa2 = <b>Diagramme de Stanford vertical d'intégrité exporté par le scénario <c1/>.</b> Le type de scénario <c2/> exécutable exporte désormais un diagramme de Stanford(-ESA) vertical en plus de la carte de disponibilité HPL/VPL : à chaque époque protégée, un tirage reproductible, avec graine, d'erreur de distance sans panne est converti par la géométrie en une erreur de position verticale réelle, puis classé par rapport au VPL et à la limite d'alerte verticale (Available / System-Unavailable / Misleading / Hazardously-Misleading). Le diagramme (points par époque + décomptes par région) est porté dans le JSON du résultat, et les décomptes d'événements d'intégrité / IHM dans le résumé de la CLI, de sorte que le classificateur de Stanford, auparavant réservé à la bibliothèque, est accessible de bout en bout. <c3/> gagne un champ <c4/> (valeur par défaut { "0" }) qui commande la réalisation de l'erreur ; la carte de disponibilité elle-même reste purement géométrique et indépendante de la graine.

# text
seg-5d76a638ae77 = Budget de risque d'intégrité (P_HMI) ARAIM pour les niveaux de protection.

# text
# c1: raim::araim_raim
# c2: K_md
# c3: (prior, detection threshold, σ)
# c4: araim_protection_level
# c5: araim_integrity_risk
# c6: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c7: P_HMI
seg-449adb9ad6e6 = <c1/> déduit les niveaux de protection horizontal et vertical d'un budget explicite de risque d'intégrité plutôt que d'un multiplicateur <c2/> fixe : pour la solution toutes satellites en vue et pour chaque sous-solution excluant un seul satellite, il construit le triplet <c3/> de chaque mode sur chaque axe, puis <c4/> détermine le plus petit PL dont la probabilité cumulée d'informations dangereusement trompeuses (<c5/>, <c6/>, Blanch et al., <em>Baseline ARAIM</em>) respecte la valeur <c7/> allouée. Le résultat indique le risque d'intégrité que les niveaux atteignent réellement, de sorte qu'un utilisateur peut arbitrer explicitement entre intégrité et limite d'alerte. Six tests dérivés à la main (formes closes à mode unique sans panne et avec seuil, sommation/monotonie multi-modes, protection de bout en bout sans panne avec un budget 10⁵ fois plus serré qui relève le PL, détection/identification de panne, et plancher de redondance à six satellites). La MHSS à panne unique est la référence de base ARAIM ; les pannes simultanées de sous-ensembles de plusieurs SV, le mode de panne touchant toute la constellation et la validation sur le jeu de données de référence gLAB sont des extensions documentées.

# text
seg-3e33581644a5 = Compensation du coning/sculling à deux cadences pour la mécanisation strapdown.

# text
# c1: inertial::mechanization::coning_sculling_compensate
# c2: NavState::step_increments
# c3: ScalarErrorBudget
# c4: AccelModel
# c5: NavState
seg-c900e193ac29 = <c1/> extrait les termes à haute cadence de coning (attitude) et de rotation+sculling (vitesse) des incréments d'IMU ordonnés des sous-intervalles d'une mise à jour grossière, de sorte qu'un <c2/> à cadence modérée reproduit le mouvement rectifié par les vibrations qu'un pas grossier appliqué aux sommes brutes manque. Un test de validation soumet un environnement de coning+sculling à { "10" } Hz pendant { "60" } s et compare la vérité à cadence fine, l'intégration grossière naïve et l'intégration grossière avec repliement : le repliement réduit l'erreur de position d'environ { "18" } fois (de mètres de dérive naïve à moins du décimètre), ce qui confirme que les termes de coning/sculling sont déterminants. Un alias de type <c3/> désigne l'ancien <c4/> à 1 degré de liberté pour ce qu'il est, distinct du navigateur à trois axes <c5/>.

# text
# c1: rinex_obs
# c2: parse_obs
# c3: SYS / # / OBS TYPES
# c4: C1C
# c5: L1C
seg-ceb037e7a6ea = <b>Analyseur de fichiers d'observation RINEX.</b> Le nouveau module <c1/> lit le fichier d'<em>observation</em> RINEX 3.0x / { "4.00" }, c'est-à-dire les mesures réelles du récepteur, et complète ainsi la paire RINEX aux côtés de l'analyseur de messages de navigation existant. <c2/> décode l'en-tête (version/type, listes <c3/> par système avec lignes de continuation, position approchée, intervalle, instant de la première observation) et les enregistrements par satellite de chaque époque : pseudodistance, phase de la porteuse, Doppler et intensité du signal, indexés par leur code d'observation RINEX { "3" } (<c4/>, <c5/>, …) avec les indicateurs de perte de verrouillage (LLI) et d'intensité du signal (SSI), un champ vide étant conservé comme absent plutôt que comme zéro. Périmètre honnête : il s'agit de l'<em>ingestion</em> au format normalisé (un vrai journal d'observation de station RTKLIB/gLAB/IGS en entrée, des mesures typées en sortie), et non d'un moteur de positionnement : ni solution de pseudodistance, ni PPP, ni RTK ici.

# text
# c1: oem
# c2: OemFile::from_propagators
# c3: OemFile::to_oem_string
# c4: CCSDS_OEM_VERS
# c5: CREATION_DATE
# c6: ORIGINATOR
# c7: META_START … META_STOP
# c8: OBJECT_NAME
# c9: OBJECT_ID
# c10: CENTER_NAME
# c11: REF_FRAME = TEME
# c12: TIME_SYSTEM = GPS
# c13: START_TIME
# c14: STOP_TIME
# c15: epoch X Y Z X_DOT Y_DOT Z_DOT
# c16: CREATION_DATE
seg-60efb0c44522 = <b>Écrivain CCSDS OEM (Orbit Ephemeris Message).</b> Le nouveau module <c1/> exporte une constellation propagée sous la forme d'un message CCSDS 502.0-B OEM { "2.0" } valide, le format d'éphéméride KVN qu'ingèrent GMAT, Orekit, STK et la plupart des outils de dynamique du vol. <c2/> échantillonne sur une grille temporelle l'état inertiel (TEME) de chaque satellite, position <b>et</b> vitesse, pris directement du propagateur sans rotation terrestre, contrairement à l'export SP3, et <c3/> sérialise l'en-tête <c4/>/<c5/>/ <c6/> ainsi qu'un segment <c7/> par satellite (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) suivi de ses lignes <c15/> (km, km/s). La <c16/> est fournie par l'appelant, jamais lue sur l'horloge murale, de sorte que la sortie est identique à l'octet près d'une exécution à l'autre (le contrat de reproductibilité). C'est le pendant, pour les éphémérides d'engins spatiaux, de l'export SP3 GNSS : une orbite Kshana peut désormais être transmise à un outil de dynamique du vol dans un format standard.

# text
seg-f8538db4a17c = Éphéméride précise SP3 comme source de propagation.

# text
# c1: Sp3File::interpolator
# c2: Sp3Interpolator
# c3: Propagator::Sp3Precise
seg-2cf2e224deb9 = <c1/> construit, pour chaque satellite, un <c2/> qui comble la position entre les époques SP3 tabulées avec un polynôme de Lagrange d'ordre 9 (pratique IGS standard) et la fait pivoter dans le référentiel TEME partagé, exposé sous le nom <c3/>. Un fichier d'orbites précises d'un centre d'analyse IGS peut désormais alimenter le même pipeline de géométrie/visibilité/intégrité que les propagateurs diffusés et analytiques. Aller-retour validé : une orbite képlérienne écrite en SP3 puis relue par l'interpolateur concorde avec l'originale à moins d'un mètre aux nœuds et à < { "100" } m en milieu d'intervalle. L'interpolation de l'horloge vient ensuite.

# text
# c1: glonass
# c2: parse_glonass_nav
# c3: R
# c4: J2
# c5: Propagator::Glonass
# c6: rinex
seg-8d50fd42f53c = <b>Éphéméride diffusée GLONASS (complète la navigation RINEX multi-GNSS).</b> Nouveau module <c1/> : GLONASS ne diffuse pas d'éléments képlériens mais un <b>vecteur d'état</b> PZ-90 lié à la Terre (position, vitesse, accélération luni-solaire). <c2/> lit les enregistrements RINEX { "3" } <c3/>, et la position du satellite à un instant quelconque s'obtient par <b>intégration de Runge–Kutta d'ordre 4</b> des équations du mouvement de l'ICD GLONASS (gravité centrale + <c4/> + termes de Coriolis/centrifuge dus à la rotation de la Terre + accélération diffusée). Exposé sous le nom <c5/>, de sorte que les satellites GLONASS traversent le pipeline constellation/visibilité/intégrité aux côtés des systèmes képlériens ; un même bloc de constellation <c6/> peut désormais mêler GPS, Galileo, QZSS, BeiDou et GLONASS.

# text
# c1: E
# c2: J
# c3: C
# c4: G
# c5: Propagator::Rinex
seg-8d88144e3726 = <b>Navigation RINEX multi-GNSS (GPS, Galileo, QZSS, BeiDou).</b> L'analyseur de navigation RINEX { "3" } décode désormais les enregistrements Galileo (<c1/>), QZSS (<c2/>) et BeiDou (<c3/>, MEO/IGSO) en plus de GPS (<c4/>) : ils partagent la même disposition képlérienne et le même algorithme utilisateur, chacun étant évalué avec sa propre constante gravitationnelle et sa propre vitesse de rotation de la Terre (μ de Galileo/BeiDou, Ω̇ₑ de BeiDou). Un fichier à constellations mixtes les fournit toutes, et elles traversent le pipeline constellation/visibilité/intégrité sous le nom <c5/>. Les satellites géostationnaires BeiDou utilisent une rotation de coordonnées différente et sont ignorés, en attendant un jeu de référence par rapport auquel les valider. Le parcours des enregistrements utilise des nombres de lignes propres à chaque système, ce qui corrige un bogue latent où les enregistrements GLONASS/SBAS de quatre lignes étaient sautés comme s'ils en comptaient huit. GLONASS (un modèle à vecteur d'état) vient ensuite.

# text
# c1: sp3
# c2: parse_sp3
# c3: Sp3File
# c4: V
# c5: Sp3File::from_propagators
# c6: to_sp3_string
seg-91a6907acc8d = <b>Lecteur et écrivain d'éphémérides précises SP3-c/d.</b> Le nouveau module <c1/> analyse les fichiers d'orbites précises SP3 des centres d'analyse IGS (<c2/>), produit ECEF position/horloge post-traité que les moteurs PPP (Ginan, RTKLIB, gLAB) traitent comme référence, pour en faire un <c3/> structuré (en-tête, grille d'époques, position par satellite km→m, horloge µs, et vitesse dm/s→m/s pour les produits <c4/>), en préservant les valeurs sentinelles de mauvaise donnée de SP3. Le sens inverse est également couvert : <c5/> construit un SP3 à partir d'une constellation propagée (TEME→ECEF à chaque époque) et <c6/> le sérialise, de sorte que les orbites Kshana peuvent être exportées dans le format qu'ingèrent les outils PPP externes : l'aller-retour lecture↔écriture. L'interpolation d'époque et une source de propagateur SP3 viennent ensuite.

# text
# c1: rinex
# c2: tle
# c3: scenarios/orbit-rinex.toml
seg-7d51d1b6f39f = <b>Éphéméride diffusée RINEX comme source de constellation exécutable.</b> Une constellation accepte désormais un bloc <c1/> en ligne (texte de navigation GPS RINEX { "3" }) en plus de l'option <c2/> existante, de sorte qu'un vrai fichier de diffusion pilote un scénario de bout en bout depuis la CLI, Python ou le bac à sable dans le navigateur : RINEX en entrée, géométrie PNT en sortie. Le nouveau <c3/> démontre la disponibilité GNSS et le DOP à partir de huit satellites GPS construits directement à partir des enregistrements diffusés. (GPS LNAV uniquement ; le multi-GNSS et SP3 viennent ensuite.)

# text
# c1: RinexEphemeris
# c2: orbit::Propagator
# c3: Propagator::Rinex
# c4: sv_position_teme
seg-9730835bfc64 = <b>Éphéméride diffusée RINEX comme source de propagation.</b> Un <c1/> analysé se convertit désormais en <c2/> (<c3/>) : la position est l'orbite diffusée IS-GPS-200 pivotée de l'ECEF vers le référentiel inertiel TEME partagé (<c4/>, avec un temps GPS→UT1 exact vis-à-vis des secondes intercalaires), la vitesse est obtenue par différence finie centrée, et la période orbitale est képlérienne. Des données de diffusion GPS réelles peuvent désormais alimenter le même pipeline de géométrie, de visibilité et d'intégrité (RAIM) que les propagateurs analytiques SGP4/képlériens. (Pas encore exposé comme type de scénario à fichier RINEX ; cela, ainsi que le multi-GNSS/SP3, vient ensuite.)

# text
seg-a355e3e52ec3 = <b>DOI d'archivage.</b> Les versions sont désormais déposées sur Zenodo et reçoivent un DOI citable.

# text
seg-c6e4556e1ce5 = <b>Documentation.</b> Le README a été remis à niveau institutionnel : un aperçu des capacités de l'ensemble de la pile { "v0.9.0" }, une section Versions et publications, un en-tête épuré avec la nouvelle marque, et une ligne d'état concise. Aucun changement du moteur.

# text
# c1: integrity
seg-1bfc4e965d2b = Cette version ajoute trois domaines de capacité substantiels au-dessus du substrat SGP4 { "0.8.0" } : un véritable INS strapdown à trois axes, un EKF à état d'erreur GNSS/INS à couplage lâche avec rétroaction en boucle fermée, un véritable RAIM d'instantané et à séparation de solutions (de type ARAIM) avec HPL/VPL et un scénario <c1/> exécutable, et la première étape de l'interopérabilité des formats GNSS (ingestion d'éphémérides GPS RINEX-3).

# text
# c1: src/rinex.rs
# c2: parse_nav
# c3: G
# c4: BROADCAST ORBIT
# c5: RinexEphemeris
# c6: D
# c7: parse_d
# c8: D
seg-7fa2f68d436a = <b>Analyseur de messages de navigation GPS RINEX { "3" } (<c1/>).</b> Première étape vers l'interopérabilité des formats GNSS : <c2/> lit un fichier de navigation RINEX { "3" }.x et décode chaque enregistrement d'éphéméride diffusée GPS (<c3/>), le bloc de huit lignes SV/époque + <c4/>, en un <c5/> d'éléments képlériens et de corrections d'horloge, avec les noms de champs et les unités selon IS-GPS-200. Il gère le format de flottant Fortran à exposant <c6/> (<c7/>) et la disposition en colonnes de largeur fixe ; les enregistrements des systèmes autres que GPS sont ignorés, non rejetés, de sorte qu'un fichier mixte fournit quand même ses éphémérides GPS. Quatre tests : analyse de l'exposant <c8/> (y compris blancs et erreurs), un enregistrement complet décodé par rapport à des valeurs de champs connues avec un contrôle de vraisemblance du demi-grand axe GPS (√A² ≈ { "26 560" } km), l'omission des systèmes autres que GPS, et le cas du fichier vide.

# text
# c1: src/rinex.rs
seg-9c4a068f204c = Éphéméride diffusée GPS → position ECEF (<c1/>).

# text
# c1: RinexEphemeris::sv_position_ecef(t_tow)
# c2: μ
# c3: Ω̇ₑ
# c4: tk
seg-5deeec4b8cc9 = <c1/> évalue la position du satellite dans le repère terrestre à partir de l'éphéméride analysée, via l'algorithme utilisateur IS-GPS-200 §{ "20.3.3.4.3.1" } : résolution de Newton de l'équation de Kepler pour l'anomalie excentrique, corrections de second harmonique de l'argument de latitude / du rayon / de l'inclinaison, et rotation vers l'ECEF tenant compte de la rotation de la Terre depuis l'époque de référence (avec le <c2/> et le <c3/> GPS imposés par la spécification, et un repliement <c4/> pour le changement de semaine). Trois tests : le rayon géocentrique reste dans la bande GPS (≈ { "26 560" } km), la vitesse dans le repère terrestre est d'environ { "3.9" } km/s, et l'évaluation à une semaine entière d'écart redonne la même position.

# text
# c1: src/rinex.rs
seg-583433389a70 = Biais d'horloge de SV GPS avec la correction relativiste (<c1/>).

# text
# c1: RinexEphemeris::sv_clock_bias_s(t_tow)
# c2: af0 + af1·Δt + af2·Δt²
# c3: Toc
# c4: F·e·√A·sin Ek
# c5: EpochUtc::gps_time_of_week
# c6: TGD
# c7: Propagator
# c8: docs/CAPABILITY.md
seg-957588ed5dff = <c1/> évalue le polynôme d'horloge diffusé <c2/> autour de <c3/> plus le terme relativiste d'excentricité <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Un nouveau <c5/> convertit l'époque calendaire de l'enregistrement en temps de semaine GPS par un calcul en jours juliens depuis l'époque GPS (1980-01-06), et la résolution de Kepler est partagée avec l'évaluation de position. Tests : le temps de semaine GPS pour un dimanche/mardi/samedi (limites de semaine), et le biais d'horloge dominé par af0 avec un terme relativiste présent et borné. Le délai de groupe L1 <c6/> est exposé mais délibérément non intégré. Périmètre honnête : une source <c7/>, Galileo/BeiDou/GLONASS et SP3 restent des étapes à venir. (<c8/> mis à jour en conséquence.)

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: kind = "integrity"
# c4: IntegrityScenario
# c5: (sigma, P_fa, P_md, AL_H, AL_V)
# c6: constellation_raim_availability
# c7: kshana scenarios/integrity-raim.toml
seg-ef971feff16c = <b>Type de scénario <c1/> exécutable par l'utilisateur (<c2/>).</b> La capacité de disponibilité RAIM est désormais accessible depuis la CLI/TOML comme tous les autres paquets : <c3/> analyse un <c4/> (orbite de l'utilisateur, une ou plusieurs constellations GNSS, masque d'élévation et configuration d'intégrité <c5/>), exécute <c6/> et produit la carte de disponibilité HPL/VPL par époque en JSON ainsi qu'un SVG autonome : niveaux de protection au fil du temps par rapport aux limites d'alerte, avec une bande de disponibilité verte/rouge. <c7/> écrit le JSON, le graphique et un rapport HTML. Le scénario fourni (Walker à 24 satellites, télémétrie double fréquence à { "1" } m, limites APV-I) indique une disponibilité d'environ { "95" } % ; il documente que le RAIM monofréquence ne satisfait pas la limite verticale APV-I avec une seule constellation, ce qui explique que le guidage vertical recourt à SBAS/double fréquence/ARAIM. Les tests couvrent la répartition, le JSON de la carte de disponibilité et le SVG.

# text
# c1: src/raim.rs
# c2: constellation_raim_availability
# c3: Propagator
# c4: serde
# c5: RaimAvailabilityReport
# c6: n_visible
# c7: available
# c8: RaimConfig
# c9: (sigma, P_fa, P_md, AL_H, AL_V)
# c10: raim_availability_epoch
# c11: None
seg-bbe5721c1785 = <b>Disponibilité RAIM exécutable sur une constellation (<c1/>).</b> Le module d'intégrité n'avait aucun appelant : <c2/> en fait un véritable point d'entrée de bout en bout : à chaque époque d'une grille temporelle, il propage les satellites visibles (les mêmes <c3/> SGP4/képlériens que ceux du moteur), calcule les niveaux de protection sans panne et juge la disponibilité par rapport aux limites d'alerte horizontale/verticale, en renvoyant un <c5/> sérialisable en <c4/> (<c6/>/HPL/VPL/<c7/> par époque plus la fraction de disponibilité). Un <c8/> regroupe <c9/>, et le <c10/> par époque est exposé pour les appelants qui résolvent leur propre géométrie. Trois tests : une époque jugée disponible selon les limites APV-I sur une géométrie de dix satellites, rendue indisponible par une limite impossiblement serrée, et des niveaux <c11/> en dessous de cinq satellites ; et une exécution de bout en bout sur une constellation Walker de 24 satellites qui produit une carte de disponibilité finie et se sérialise. (Six satellites, le plancher de redondance du RAIM résiduel, ne satisfont honnêtement <em>pas</em> APV-I, même avec une télémétrie à { "1" } m ; la disponibilité APV-I exige la géométrie plus dense qu'utilise le test.)

# text
# c1: src/raim.rs
# c2: y = x
# c3: Available
# c4: SystemUnavailable
# c5: MisleadingInformation
# c6: HazardouslyMisleadingInformation
# c7: classify_stanford
# c8: StanfordDiagram
# c9: (error, PL)
# c10: serde
# c11: error == PL
seg-91e32e587cb6 = <b>Accumulateur du diagramme d'intégrité de Stanford(-ESA) (<c1/>).</b> La manière standard de résumer un moniteur d'intégrité sur de nombreuses époques : il trace l'erreur de position réelle (x) en fonction du niveau de protection (y) et classe chaque époque, d'après la diagonale <c2/> et la limite d'alerte, en <c3/> (le PL borne l'erreur, dans la limite d'alerte), <c4/> (le PL borne l'erreur mais dépasse la limite d'alerte : sûr, inutilisable), <c5/> (PL < erreur ≤ AL) ou <c6/> (PL < erreur et erreur > AL : la défaillance dangereuse). <c7/> est le classificateur pur ; <c8/> accumule des points <c9/> par rapport à une limite d'alerte fixe, en exposant les décomptes par région, la disponibilité, les totaux d'événements d'intégrité et des points sérialisables en <c10/> pour le tracé/l'export JSON. Quatre tests : chaque région (y compris la frontière bornée <c11/>), l'accumulation des décomptes/de la disponibilité, et l'aller-retour JSON. C'est la surface de rapport des niveaux de protection RAIM ; son raccordement au scénario de constellation et sa validation sur un jeu de données public restent des éléments de la feuille de route.

# text
# c1: src/raim.rs
# c2: snapshot_raim
# c3: Δ_k = x_k − x₀
# c4: Cov(x_k) − Cov(x₀)
# c5: PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])
# c6: K_fa = Φ⁻¹(1−P_fa/2)
# c7: K_md = Φ⁻¹(1−P_md)
# c8: normal_cdf
# c9: normal_quantile
# c10: erf(x) = P(½,x²)
# c11: excluded_sv == 2
seg-cdeb3a5a4acf = <b>RAIM à séparation de solutions (de type ARAIM) (<c1/>).</b> Un moniteur d'intégrité à hypothèses multiples, en plus du <c2/> existant fondé sur le khi-deux des résidus/de la parité. Pour la solution des moindres carrés toutes satellites en vue et pour chaque sous-solution excluant un seul satellite, il forme la séparation <c3/>, gaussienne centrée en l'absence de panne, de covariance <c4/> (l'identité des estimateurs emboîtés, valable parce que la solution toutes satellites en vue est BLUE), et il <b>détecte</b> ainsi une panne et <b>identifie</b> le satellite défaillant (celui dont l'exclusion donne la plus grande séparation normalisée). Les niveaux de protection horizontal/vertical suivent l'allocation MHSS standard <c5/>, avec <c6/>, <c7/>. De nouveaux <c8/>/<c9/> sans dépendance, construits sur la fonction gamma incomplète régularisée déjà présente dans le module (<c10/>). Quatre tests dérivés à la main : fonction de répartition / quantile normaux par rapport aux valeurs des manuels (Φ({ "1.95996" })={ "0.975" }, la queue à { "1e-7" } = { "5.1993" }, symétrie) ; une géométrie sans panne qui ne déclenche pas d'alarme et donne des HPL/VPL finis et positifs ; un biais de 60 σ sur un seul satellite qui est détecté <em>et</em> correctement identifié (<c11/>) ; et le plancher de redondance à six satellites. Cela clôt, côté algorithme, l'écart P0 de l'audit « intégrité tautologique : pas de vrai RAIM/HPL/VPL » ; la validation sur le jeu de données gLAB et l'accumulateur du diagramme de Stanford restent des éléments de la feuille de route.

# text
# c1: src/fusion/closed_loop.rs
seg-67e771fc0a48 = Intégration GNSS/INS en boucle fermée (<c1/>).

# text
# c1: ClosedLoopInsGnss
# c2: mechanization::radii_of_curvature
# c3: NavState::omega_ie_n
# c4: omega_en_n
seg-5aa467783b99 = <c1/> relie le noyau EKF à état d'erreur à la mécanisation strapdown à trois axes : chaque échantillon d'IMU est corrigé par les estimations de biais courantes, mécanisé vers l'avant, et la covariance de l'EKF est propagée dans le temps avec le contexte de navigation correspondant ; chaque position/vitesse GNSS forme l'innovation INS−GNSS et réinjecte dans la solution la <b>position, la vitesse, l'erreur d'attitude (ψ, sous forme de rotation par quaternion) et les biais d'accéléromètre/gyroscope</b> estimés, en remettant à zéro la moyenne de l'état d'erreur. Réinjecter l'attitude (et pas seulement les biais) est nécessaire à la stabilité : l'inclinaison et le biais d'accéléromètre forment un couple couplé, de sorte que corriger l'un sans l'autre diverge. L'INS et le GNSS sont comparés dans un repère NED de plan tangent local en utilisant les rayons de courbure propres à la mécanisation (nouveau <c2/> ; <c3/>/<c4/> exposés). C'est le remplacement honnête de la <em>réinitialisation sur la vérité terrain</em> du paquet hybride. Trois tests : une boucle fermée qui annule une erreur de position injectée de { "8" } m / −{ "5" } m à <{ "0.1" } m ; une solution assistée qui reste bornée au mètre (<{ "6" } m) sur une trajectoire en conduite pendant qu'un INS en roue libre diverge au-delà de { "100" } m ; et le banc d'essai jalon : le <b>RMS de position Monte-Carlo de la solution fusionnée pendant une interruption GNSS de { "60" } s fait mieux, d'un facteur >{ "2" }, qu'un estimateur à l'estime en boucle ouverte sans assistance (≈{ "4" }× selon les graines)</b>. Limite honnête documentée dans le module : en mode à couplage lâche, le biais d'accéléromètre et l'inclinaison ne sont que faiblement séparables (tous deux se couplent par la gravité), de sorte que la valeur fournie est l'état borné et corrigé et une entrée propre dans l'interruption, et non un étalonnage inertiel précis ; une dynamique plus riche et l'extension à couplage serré restent des éléments de la feuille de route.

# text
# c1: src/fusion/gnss_ins_ekf.rs
# c2: δx = [δp, δv, ψ, b_a, b_g]
# c3: Φ = I + F·dt
# c4: H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]
# c5: tight_coupling
# c6: P/(P+R)
seg-aa9bf0ff6f84 = <b>Noyau EKF à état d'erreur GNSS/INS à couplage lâche (<c1/>).</b> Un filtre de Kalman étendu à état d'erreur à 15 états, <c2/>, avec la dynamique d'erreur strapdown de Groves { "2013" } §{ "14.2" } (couplage force spécifique/inclinaison, Coriolis, projection du biais du repère porteur vers le repère de navigation, modèles de biais de Gauss–Markov), une transition discrète du premier ordre <c3/>, et une mise à jour de mesure position+vitesse à couplage lâche (<c4/>) sous forme de Joseph. Algèbre linéaire dense sans dépendance (inverse de Gauss–Jordan, mise à jour de covariance de Joseph). Une fonctionnalité cargo <c5/> conditionne une mise à jour pseudodistance/Doppler documentée, non encore implémentée. { "7" } tests aux résultats attendus dérivés à la main : l'identité de l'antisymétrique/du produit vectoriel, un inverse { "3" }×{ "3" } vérifié, une covariance qui reste symétrique/PSD pendant la prédiction (avec une incertitude de position qui croît sans assistance), une position qui réduit la covariance de position, la récupération exacte d'une erreur de position connue au gain de Kalman analytique <c6/>, et des corrections plus faibles sous un bruit de mesure plus fort. C'est le noyau qui remplacera la réinitialisation sur la vérité terrain en boucle ouverte du paquet hybride par une rétroaction en boucle fermée (raccordement du paquet et validation NaveGo à suivre).

# text
# c1: src/inertial/imu_errors.rs
seg-5be84079b8b6 = Modèle déterministe d'erreurs d'IMU pour le navigateur strapdown à 3 axes (<c1/>).

# text
# c1: ImuErrorModel
# c2: (ω, f)
# c3: ImuErrorModel::ideal()
# c4: inertial
seg-492e670736b2 = <c1/> déforme une paire <c2/> vraie dans le repère porteur en une paire mesurée au moyen de cinq catégories systématiques (IEEE Std 952-1997 §A.2 ; Groves { "2013" } §{ "4.3" }, tableau { "4.1" }) : <b>facteur d'échelle</b> (erreur de gain par axe en ppm), <b>désalignement / couplage croisé</b> (non-orthogonalité hors diagonale du trièdre), <b>sensibilité à g</b> (un biais de vitesse angulaire du gyroscope proportionnel à la force spécifique), <b>quantification</b> (arrondi au LSB de sortie) et <b>rampe de vitesse</b> (une dérive linéaire dans le temps, la troisième région d'Allan), plus un biais constant à la mise sous tension. Chaque terme vaut zéro par défaut, de sorte que <c3/> est un simple passage transparent et que les scénarios existants ne sont pas affectés. Chaque source d'erreur a un test d'isolement (échelle linéaire à <{ "0.01" } % près, désalignement inter-axes au-dessus du plancher VRW, biais de sensibilité à g, grille de LSB, rampe linéaire), et un test de bout en bout fait produire une erreur de navigation à la mécanisation à partir d'une IMU déformée. Non modélisés : l'erreur de rectification par les vibrations et la dérive due au gradient de température. (Le paquet de scénarios <c4/> livré exécute toujours l'ancien budget scalaire à 1 degré de liberté ; ce modèle alimente la bibliothèque à 3 axes.)

# text
# c1: coning_increment
# c2: ½ Δθ_prev × Δθ_cur
# c3: sculling_increment
# c4: ½ Δθ × Δv
# c5: NavState::step_increments
# c6: Δθ_rel = Δθ_b − C_n^b ζ
seg-f57bc89d4688 = <b>Compensation du coning et du sculling pour l'intégrateur strapdown.</b> Le chemin d'attitude ajoute le <c1/> à deux échantillons (<c2/>) ; il est vérifié qu'une intégration à cadence grossière ({ "30" } Hz, 5 échantillons par cycle) d'un environnement de coning à { "5" } Hz suit la vérité à cadence fine au moins { "3" } fois mieux avec la correction qu'avec une simple somme d'incréments. Le chemin de vitesse ajoute <c3/> (<c4/>, éq. { "5.82" } de Groves) et résout l'incrément de vitesse du repère porteur au moyen d'une nouvelle mise à jour par incréments <c5/> utilisant la rotation relative au repère porteur <c6/>, de sorte qu'une plateforme liée à la Terre ne subit aucun sculling parasite alors qu'une vraie vibration déclenche le terme complet.

# text
# c1: src/inertial/mechanization.rs
seg-56c599250ed4 = Mécanisation strapdown complète à trois axes dans le repère NED (<c1/>).

# text
# c1: NavState { q, v_ned, p_llh }
# c2: step(gyro_b, accel_f_b, dt)
# c3: ω_in = ω_ie + ω_en
# c4: v̇ = f_n − (2 ω_ie + ω_en) × v + g_n
# c5: v_N ≈ a·t
# c6: ½ a t²
seg-d0897492e89b = <c1/> est avancé par <c2/> à l'aide des équations NED standard dans le repère terrestre (Groves §{ "5.4" }) : attitude repère porteur→NED corrigée de la vitesse angulaire inertiel-vers-navigation <c3/> (rotation de la Terre + vitesse de transport) ; force spécifique résolue repère porteur→NED par la DCM ; vitesse intégrant <c4/> (Coriolis/transport + gravité) ; et position géodésique par les rayons de courbure méridien/transverse. La gravité est la <b>gravité normale (fil à plomb)</b> de Somigliana en forme close WGS-84, avec une correction d'altitude en air libre NIMA, et jamais une constante codée en dur. C'est le véritable navigateur à trois axes qui supplante le chemin scalaire à 1 degré de liberté fondé sur un budget d'erreur. Vérifié par des invariants physiques : une plateforme boulonnée à la Terre en rotation à { "45" }° N (percevant la vitesse de rotation de la Terre + { "1" } g) reste à moins de { "1" } mm pendant { "60" } s ; une force spécifique horizontale vers le nord donne <c5/> et un déplacement <c6/> ; la gravité normale concorde avec les valeurs de surface connues à l'équateur/au pôle/à 45° et avec le gradient en air libre.

# text
# c1: src/inertial/attitude.rs
# c2: Quaternion
# c3: to_dcm
# c4: from_dcm
# c5: q̇ = ½ q ⊗ ω
# c6: coning_increment
# c7: ½ Δθ_prev × Δθ_cur
# c8: src/inertial.rs
# c9: src/inertial/
# c10: crate::inertial
seg-290b08199bfb = <b>Représentation d'attitude à trois axes pour l'INS strapdown (<c1/>).</b> Un type de quaternion unitaire <c2/> (scalaire en premier, convention de Hamilton) portant la rotation repère porteur→navigation, avec une vue DCM (<c3/>/<c4/> par la méthode de Shepperd), le produit de Hamilton, des constructeurs axe-angle et vecteur de rotation (application exponentielle exacte), et la cinématique des quaternions : à la fois une mise à jour de vitesse RK du premier ordre (<c5/>) et une mise à jour du vecteur de rotation corrigée du coning. Le <c6/> à deux échantillons (Savage / Bryan–Lewantowski, <c7/>) fournit le terme de couplage croisé de vitesse de rotation que l'estime scalaire omet. C'est le socle d'attitude de la mécanisation complète à 3 axes qui remplace l'ancien chemin à budget d'erreur à 1 degré de liberté. Vérifié par rapport à des rotations en forme close : la propagation à vitesse constante concorde avec le quaternion axe-angle à { "1e-6" } près, les DCM sont orthonormées de déterminant unité, et le coning s'annule pour un mouvement à axe unique. (<c8/> est désormais le répertoire de module <c9/> ; le chemin public <c10/> est inchangé.)

# text
# c1: src/frames.rs
seg-5e6e5bba25a5 = Visibilité d'une station au sol géodésiquement correcte (<c1/>).

# text
# c1: elevation
# c2: is_visible
# c3: visible_count
seg-69bdb1e5bfc8 = <c1/>, <c2/> et <c3/> calculent l'élévation d'un satellite au-dessus de l'horizon d'une station au sol par rapport à la <b>normale à l'ellipsoïde WGS-84</b> (la vraie verticale locale), et non par rapport à la direction radiale géocentrique : les deux diffèrent jusqu'à environ { "0.19" }° de déviation géodésique, ce qui suffit à faire entrer ou sortir d'un masque d'élévation des satellites proches de l'horizon. Vérifié de bout en bout (une constellation Walker propagée, pivotée de TEME vers ECEF, puis comptée depuis un site géodésique) et par rapport à l'approximation géocentrique.

# text
# c1: test-python-bindings
# c2: PyO3/maturin-action
# c3: maturin build
# c4: rustfmt-preview
# c5: cargo-fmt
# c6: deny
# c7: cargo-deny
# c8: taiki-e/install-action
# c9: cargo-deny-action
seg-4de1d79d2e76 = <b>Fiabilité de la CI.</b> Le job <c1/> construit désormais la wheel avec <c2/> (conteneur manylinux) au lieu d'un <c3/> brut sur l'hôte, ce qui élimine un conflit rustup intermittent <c4/>/<c5/> sur l'image du runner. Le job <c6/> installe <c7/> sous forme de binaire précompilé via <c8/> au lieu de l'action <c9/> fondée sur Docker, ce qui supprime un délai d'attente dépassé lors du téléchargement depuis le registre Docker Hub. Aucun de ces changements n'affecte les vérifications effectuées.

# text
seg-05055c993904 = La vitesse inertielle est exposée en aval.

# text
# c1: Propagator::velocity_eci
# c2: Propagator::state_eci
# c3: StateEci { r_m, v_m_s }
# c4: Orbit::velocity_eci
seg-1228235c99b6 = <c1/> et <c2/> (qui renvoie <c3/>) transmettent aux appelants, en m/s, la vitesse TEME analytique que SGP4 calcule déjà et qui était jusque-là écartée ; <c4/> donne au chemin képlérien une vitesse cohérente. Le test de vérification AIAA 2006-6753 contrôle désormais aussi la vitesse pour chaque ligne de référence (pire erreur de vitesse { "1.85e-9" } km/s sur l'ensemble des { "666" } états) et fixe le nombre de lignes comparées à exactement { "666" }.

# text
# c1: ParseOpts { strict_checksum }
# c2: parse_propagators_opts
# c3: strict_checksum
# c4: ConstellationCfg
seg-8ac2598291b8 = <b>Analyse TLE plus stricte et sans panique.</b> Les lignes doivent être en ASCII et sont découpées en toute sécurité (plus de paniques d'index d'octet sur une entrée multi-octets) ; les éléments sont soumis à un contrôle de plage (inclinaison, excentricité, mouvement moyen) ; la somme de contrôle de la colonne 69 peut être imposée via <c1/> / <c2/> et le nouvel indicateur <c3/> de <c4/> (tolérant par défaut).

# text
# c1: adev_curve
# c2: [{tau_s, adev, n_samples}]
seg-1cd2c6621a04 = <b>Courbe d'écart-type d'Allan dans la sortie.</b> Chaque exécution d'horloge fournit désormais une <c1/> (<c2/>), et le bac à sable du navigateur affiche un graphique log-log « Stabilité de l'horloge (ADEV) ».

# text
seg-c76ff20811e7 = Validation des entrées de la grille temporelle.

# text
# c1: TimeCfg::validate
# c2: MAX_TIME_STEPS
seg-75436d067802 = <c1/> rejette une grille temporelle non finie, nulle, négative ou démesurée (un pas supérieur à la durée, ou plus de <c2/> échantillons) avant toute allocation, de sorte qu'un scénario mal formé renvoie une erreur au lieu de paniquer ou d'épuiser la mémoire.

# text
seg-d0a8ce50cf6e = Ensembles Monte-Carlo pour le paquet inertiel.

# text
# c1: runs = N
# c2: ensemble
# c3: monte_carlo
seg-3225674ce4ea = <c1/> sur un scénario inertiel exécute N graines et fournit pour chaque métrique la moyenne, l'écart-type, les percentiles et un intervalle de confiance à { "95" } % par bootstrap de percentiles (<c2/>). Chaque exécution inertielle porte désormais un indicateur <c3/>, de sorte qu'une figure de mérite à réalisation unique ne soit plus prise pour une distribution. (CEP/2DRMS ne sont volontairement pas fournis : ils exigent le modèle à 3 axes qui figure sur la feuille de route.)

# text
# c1: web/share.test.mjs
seg-2967872bfca1 = <b>Mode bac à sable guidé.</b> Le bac à sable du navigateur ne vous jette plus devant un mur de TOML brut : un bandeau « Commencer ici » de cartes de scénarios en un clic charge et exécute un exemple travaillé, des curseurs exposent les paramètres universels (graine, seuil de synchronisation temporelle) sans toucher au TOML, une note « Comment lire ceci » explique le résultat, et le TOML complet se déplie en un clic. Chaque exécution est partageable : <b>Copier le lien de partage</b> encode tout le scénario dans le fragment d'URL (rien n'est téléversé), de sorte qu'un lien reproduit l'exécution exacte au chargement. Le codec est testé unitairement (<c1/>, exécuté en CI).

# text
# c1: src/sweep.rs
seg-2e47e8864718 = Balayages de paramètres à N dimensions (<c1/>).

# text
# c1: nd_sweep
# c2: SweepAxis
seg-5076a9ad20d7 = <c1/> évalue une métrique sur le produit cartésien complet de plusieurs plages <c2/> (l'étude de compromis multiparamètre), dans l'ordre ligne par ligne, de façon déterministe. Additif : l'API de balayage 1-D existante est inchangée. Les intervalles de confiance par bootstrap à chaque nœud et la généralisation au-delà du paquet d'horloge restent sur la feuille de route.

# text
# c1: src/raim.rs
seg-958718831037 = <b>RAIM d'instantané réel (<c1/>).</b> Une véritable surveillance autonome de l'intégrité par le récepteur dans le domaine des positions : il construit la géométrie de ligne de visée vers les satellites visibles, forme la solution des moindres carrés et les résidus, exécute un test de détection de panne par le χ² des résidus (seuil exact issu d'un χ²/χ² non central à gamma incomplète sans dépendance), et calcule des niveaux de protection horizontal et vertical fondés sur la pente (HPL/VPL), avec le biais de détection manquée dérivé pour les P_fa/P_md configurés. Cela se distingue de la figure d'intégrité d'auto-cohérence du filtre du pipeline de scénarios, et n'y est <b>pas encore raccordé</b> ; l'exclusion de panne, le budget limite d'alerte/P_HMI et l'ARAIM restent sur la feuille de route.

# text
# c1: src/allan.rs
# c2: TDEV = tau/sqrt(3) * MDEV
# c3: deviation_ci
seg-1675540acbd9 = <b>Suite de stabilité de fréquence : MDEV, TDEV, HDEV + intervalles de confiance</b> (<c1/>). En plus de l'ADEV à recouvrement : l'écart-type d'Allan modifié (qui sépare le bruit de phase blanc du bruit de phase flicker), l'écart temporel (<c2/>) et l'écart-type de Hadamard (qui rejette exactement la dérive linéaire de fréquence et converge pour les types de bruit rouge divergents). Les intervalles de confiance fondés sur le χ² (<c3/>) utilisent une paire quantile normal/χ² sans dépendance (Acklam + Wilson-Hilferty) avec un edf conservateur sans recouvrement ; l'edf propre au type de bruit et la parité numérique avec Stable32 restent sur la feuille de route.

# text
# c1: src/frames.rs
seg-446a9ed4467c = <b>Réduction de référentiel (<c1/>).</b> Rotation TEME↔ECEF fondée sur le GMST (avec le même temps sidéral IAU-1982 que le propagateur), conversion géodésique↔ECEF WGS-84 exacte avec un inverse itératif initialisé par Bowring (précision machine à toutes les altitudes, y compris MEO/GEO), et un observateur de station au sol géodésique qui renvoie azimut / élévation / distance dans le repère local Est-Nord-Haut. Le mouvement du pôle et la nutation inférieure à la seconde d'arc ne sont pas appliqués (GMST seul, précision sub-kilométrique sur la trace au sol) ; une chaîne CIO précise à l'ITRF figure sur la feuille de route.

# text
# c1: src/timescales.rs
# c2: f64
seg-9f6f53583cf5 = <b>Fondation des échelles de temps (<c1/>).</b> Une API de dates juliennes sans dépendance (calendrier grégorien ↔ JD, MJD), l'historique complet des secondes intercalaires entières de l'IERS (UTC↔TAI, { "10" } s en { "1972" } à { "37" } s depuis { "2017" }), le décalage TAI→TT défini, la correction UT1 au moyen d'un DUT1 fourni, et l'angle de rotation de la Terre IAU-2000. C'est le substrat temporel sur lequel repose la réduction de référentiel terrestre (prévue). Les instants sont des dates juliennes en <c2/> unique (résolution d'environ { "50" } µs près de l'époque actuelle ; un JD en deux parties figure sur la feuille de route), et l'ère de la seconde élastique antérieure à 1972 n'est pas modélisée ; les deux points sont documentés dans le module.

# text
# c1: scripts/gen-sbom.sh
# c2: libm
# c3: docs/REPRODUCIBILITY.md
seg-6ecc053f101f = <b>Reproductibilité et provenance.</b> Un générateur de SBOM CycloneDX déterministe (<c1/>) et une attestation de provenance de construction SLSA sur le binaire de la version et sur le SBOM ; la chaîne d'outils de la version est épinglée pour correspondre à la CI. Les garanties de déterminisme, la réserve <c2/> entre plateformes et l'approche d'épinglage des valeurs de référence (golden) sont documentées dans <c3/>.

# text
# c1: tests/property.rs
# c2: TimeCfg::validate
seg-3e98dcdcb82b = <b>Tests fondés sur les propriétés et tests de fuzzing</b> (<c1/>). Des tests aléatoires déterministes (sans nouvelle dépendance) vérifient des invariants sur des milliers d'entrées : les analyseurs de TLE et de scénarios ne paniquent jamais sur une entrée aberrante, non ASCII, mutée ou tronquée ; <c2/> ne panique jamais sur des grilles NaN/inf/négatives ; la somme de contrôle TLE est cohérente et ne porte que sur la colonne 69 ; les allers-retours géodésique↔ECEF et la rotation TEME→ECEF conservent la norme sur tout le globe et sur une large bande d'altitudes.

# text
# c1: libm
seg-ea252b5d7427 = Les tests de référence (golden) <b>épinglent désormais les figures de mérite champ par champ</b> pour les quatre scénarios de référence (avec une tolérance qui absorbe la gigue <c1/> entre plateformes), en remplacement des anciens contrôles par simple inégalité, de sorte qu'une régression numérique silencieuse soit détectée immédiatement.

# text
# c1: schema_version
# c2: 0.1
# c3: 0.7
seg-4b2a0b78984b = <c1/> dans les artefacts de résultats passé de <c2/> à <c3/> (il était figé alors que le moteur évoluait).

# text
# c1: cargo-deny
seg-ecafa9d44810 = <c1/> <b>refuse</b> désormais (et n'avertit plus pour) les dépendances retirées (yanked).

# text
# c1: CAPABILITY.md
# c2: SCHEMA.md
# c3: INTEGRITY.md
# c4: QUANTUM-MODELS.md
# c5: REAL_TLE_GUIDE.md
# c6: Cargo.toml
seg-c48af44de5b4 = Nouvelle documentation : <c1/> (carte honnête du périmètre), <c2/> (référence des champs de résultat), <c3/>, <c4/>, <c5/>. Un garde-fou de CI échoue si le badge de version du README s'écarte de <c6/>.

# text
seg-8ef32ebec7f5 = <b>Propagation d'orbite SGP4/SDP4.</b> Une implémentation complète et sans dépendance du propagateur standard à perturbations simplifiées : SGP4 pour le proche de la Terre, avec l'extension SDP4 pour l'espace lointain (perturbations luni-solaires séculaires et périodiques et résonance du géopotentiel à { "12" } h / { "24" } h). Il est validé par rapport aux vecteurs de vérification officiels AIAA 2006-6753 (« Revisiting Spacetrack Report #3 ») : les { "666" } états de référence couvrant les cas proche de la Terre, espace lointain, résonant et codes d'erreur concordent, avec une erreur de position au pire cas d'environ { "4" } mm. C'est le modèle par rapport auquel les jeux d'éléments à deux lignes sont définis, il représente donc de vraies constellations, notamment les orbites GNSS d'environ { "12" } h, qui relèvent de l'espace lointain et sont résonantes, et que l'ancien modèle à deux corps + J2 séculaire ne peut pas capter.

# text
# c1: orbit-sgp4-gps.toml
seg-06a77fb9233e = Une constellation fournie sous forme de <b>jeux complets d'éléments à deux lignes</b> (ligne { "1" } + ligne { "2" }) est désormais propagée avec SGP4/SDP4 ; une constellation fournie sous forme d'éléments de ligne 2 seule conserve la propagation képlérienne analytique à deux corps, inchangée. Les deux formes peuvent être mêlées dans un même bloc. Nouveau scénario de référence <c1/> (une constellation MEO de type GPS au vrai format à deux lignes, propagée avec SGP4) : intégrez un jeu « gps-ops » de Celestrak à jour pour étudier la constellation réelle.

# text
# c1: spoof
# c2: spoof-attack.toml
seg-2dbb4054e9b8 = <b>Démonstrateur actif d'attaque par leurrage.</b> Un nouveau type de scénario <c1/> injecte un leurrage temporel faux à rampe croissante et exécute pour chaque horloge son moniteur d'intégrité assisté par l'horloge, en indiquant si et quand le leurrage est détecté et s'il atteint la spécification opérationnelle sans être détecté, ce qui transforme la figure de mérite de sécurité en une démonstration concrète d'attaque/défense. Nouveau scénario de référence <c2/>.

# text
# c1: [[constellations]]
# c2: [constellation]
# c3: orbit-multignss.toml
seg-aa0cb8038baa = <b>Disponibilité multi-constellation.</b> Un scénario d'orbite peut combiner plusieurs constellations (une liste <c1/> aux côtés de la <c2/> principale) pour la disponibilité multi-GNSS et la dilution de précision, par exemple GPS plus Galileo. Nouveau scénario de référence <c3/>.

# text
seg-9b9dcd5be0a7 = <b>Rapport de tableau de bord HTML.</b> Chaque exécution produit désormais aussi un tableau de bord HTML autonome et de marque : le résumé en une ligne, le graphique (intégré sous forme d'image data-URI inerte) et le JSON complet, écrits par la CLI à côté du JSON et du SVG. Un artefact partageable en un seul fichier pour un livrable d'étude ou une annexe.

# text
# c1: fusion
# c2: [phase, frequency]
# c3: [position, velocity]
# c4: fusion-pnt.toml
seg-76c573048a91 = <b>Estimateur conjoint de fusion de capteurs.</b> Un nouveau type de scénario <c1/> exécute un unique filtre de Kalman récursif comme solution de navigation, en fusionnant l'état d'horloge <c2/> et l'état de position <c3/>, asservi par le GNSS (qui apprend le décalage de fréquence et la vitesse) et assisté par le transfert de temps optique pendant l'interruption, plutôt que de composer des prédicteurs indépendants. Il fournit un holdover de synchronisation temporelle/de position fusionné et une intégrité à covariance conjointe. Nouveau scénario de référence <c4/>.

# text
# c1: bias_instability
# c2: q_aa
seg-10f0501c91ef = <b>Modèle de bruit d'IMU plus complet.</b> L'accéléromètre modélise désormais les termes restants de la variance d'Allan au-delà du biais constant et de la marche aléatoire de vitesse : l'<b>instabilité de biais</b> (un plancher de flicker en 1/f au coefficient standard d'instabilité de biais d'Allan, réutilisant la synthèse de flicker de l'horloge) et la <b>marche aléatoire d'accélération</b>. Nouveaux champs facultatifs <c1/> et <c2/> de scénario inertiel ; une nouvelle fixation GNSS réétalonne la dérive de biais résiduelle.

# text
# c1: tle
# c2: orbit-real-tle.toml
seg-251ffc7b7722 = <b>Géométrie réelle de constellation à partir de TLE.</b> Une constellation peut être fournie sous forme d'un bloc de jeux d'éléments à deux lignes (le format standard NORAD/Celestrak) via un champ <c1/>, de sorte que la disponibilité et la dilution de précision utilisent la géométrie publiée d'une constellation réelle plutôt qu'un motif Walker synthétique. Le moteur lit les éléments képlériens moyens de chaque TLE et les propage à deux corps, et non avec SGP4, ce qui est valable pour une étude instantanée à partir d'une époque commune. Nouveau scénario de référence <c2/>.

# text
# c1: sweep
# c2: threshold_ns
# c3: duration_s
# c4: quantum_q_wf
# c5: classical_q_wf
# c6: sweep-clock-stability.toml
seg-7deb93b51cc7 = <b>Balayages de paramètres pour études de compromis.</b> Un nouveau type de scénario <c1/> fait varier un paramètre (<c2/>, <c3/>, <c4/> ou <c5/>) sur une plage linéaire ou logarithmique et enregistre une figure de mérite choisie en chaque point pour les deux horloges, ce qui produit le graphique comparatif « comment le holdover évolue-t-il avec la stabilité de l'horloge ? » dont un compromis de conception a besoin. Nouveau scénario de référence <c6/>.

# text
# c1: runs
# c2: clock-ensemble.toml
seg-ef6f3e77b476 = <b>Bandes de confiance Monte-Carlo.</b> Le scénario de holdover d'horloge peut exécuter de nombreuses réalisations (nouveau champ facultatif <c1/>) : chaque figure de mérite est alors fournie sous forme de moyenne avec un étalement du 5ᵉ au 95ᵉ percentile, et le graphique ombre l'enveloppe d'erreur de { "5" } à { "95" } % autour de la médiane pour chaque horloge. Une exécution unique reste le comportement par défaut. Nouveau scénario de référence <c2/>.

# text
# c1: eccentricity
# c2: argp_deg
# c3: j2
# c4: orbit-molniya.toml
seg-e70cc0973fa3 = <b>Orbites excentriques et dérive J2.</b> Le type d'orbite est désormais une orbite képlérienne complète (demi-grand axe, excentricité, inclinaison, RAAN, argument du périgée, anomalie moyenne), propagée par résolution de l'équation de Kepler, avec en option la régression nodale séculaire due à J2 et la précession apsidale. Nouveaux champs facultatifs <c1/>, <c2/> et <c3/> de scénario, et un scénario de référence <c4/> (un utilisateur à orbite fortement excentrique et à inclinaison critique, de { "12" } h). Les orbites circulaires conservent le chemin d'origine en forme close, bit à bit.

# text
seg-cc041e16d418 = Le paquet hybride (PNT combiné) fournit désormais l'<b>intégrité</b> et la <b>sécurité</b>, de sorte que les quatre paquets couvrent l'ensemble complet des figures de mérite opérationnelles. L'intégrité est le confinement dans la borne de protection du canal de synchronisation temporelle, issu d'un estimateur de Kalman asservi à la vérité terrain tant que le GNSS est nominal et réancré (plus lâchement) à chaque resynchronisation optique ; sa borne inclut le plancher de bruit de mesure de la liaison, de sorte qu'une horloge bien meilleure que la liaison est notée par rapport au bruit réel de la solution délivrée. La sécurité est le score de détection de leurrage assistée par l'horloge par rapport à la spécification de synchronisation temporelle.

# text
# c1: scripts/changelog-extract.sh
seg-e0b666457d6e = Les notes de version sont désormais générées à partir de la section CHANGELOG organisée pour l'étiquette (<c1/>), de sorte que chaque version GitHub met en avant ce qui a changé au lieu de lister les commits bruts.

# text
# c1: [0, 1]
seg-f785718e9454 = Figure de mérite de <b>sécurité</b> (jusque-là non renseignée) : un score de détection de leurrage assistée par l'horloge pour les paquets d'horloge en holdover et d'orbite. Il modélise un moniteur d'intégrité qui recoupe le temps issu du GNSS avec la prédiction à l'inertie de l'horloge elle-même sur une fenêtre cohérente ; le plancher de détection combine le bruit de mesure moyenné et l'incertitude de marche à l'inertie de l'horloge, de sorte qu'une horloge plus silencieuse détecte des leurrages temporels plus petits et plus lents. Le score est exprimé dans <c1/> par rapport à la spécification de synchronisation temporelle, ce qui complète les six figures de mérite opérationnelles.

# text
# c1: Q = (HᵀH)⁻¹
# c2: sigma_uere_m
seg-9164140872c8 = <b>Précision de position</b> dérivée de la géométrie pour le paquet d'orbite : à partir de la géométrie de ligne de visée vers les satellites visibles, il forme la matrice de conception et son facteur de covariance <c1/>, ce qui donne les facteurs de dilution de précision (GDOP/PDOP/HDOP/VDOP/TDOP). La précision de position est le DOP de position mis à l'échelle par une erreur de distance équivalente utilisateur configurable (nouveau champ facultatif de scénario <c2/>). Un résultat d'orbite porte désormais un résumé de géométrie (fraction d'échantillons avec une position, meilleur PDOP et PDOP médian, et sigma de position).

# text
# c1: web/
# c2: pages
# c3: summary
seg-3285502161c6 = Un <b>bac à sable</b> dans le navigateur (<c1/>) qui exécute le moteur côté client en WebAssembly : choisissez un scénario de référence ou modifiez le TOML, exécutez-le, et consultez le résumé, le graphique et le JSON complet, sans rien téléverser. Un workflow <c2/> le construit et le publie sur GitHub Pages, et un nouvel export WebAssembly <c3/> alimente l'affichage.

# text
# c1: chart
seg-0dca5318f7ce = Axes y étiquetés sur les graphiques SVG : lignes de grille, étiquettes numériques de graduation et titre d'axe avec les unités (via un assistant <c1/> partagé), de sorte que les ordres de grandeur soient lisibles.

# text
# c1: publish
seg-ce84a3d61f19 = Workflow de publication de paquets (<c1/>) pour crates.io, PyPI et npm, chacun conditionné par son jeton de registre et déclenché par une version publiée.

# text
# c1: flicker_floor
seg-0f01369fc29b = Plancher de FM flicker (1/f) pour le modèle d'erreur d'horloge, synthétisé comme une somme de processus d'Ornstein-Uhlenbeck à espacement logarithmique et étalonné pour que le plancher plat de l'écart-type d'Allan se situe à un niveau configurable. Désactivé par défaut ; activé par horloge via le champ facultatif <c1/> du scénario.

# text
# c1: gyro_bias
# c2: q_arw
seg-5b7fcd386fd3 = Canal gyroscopique pour le modèle inertiel : le biais gyroscopique résiduel et la marche aléatoire angulaire engendrent une erreur d'attitude (inclinaison) qui couple la gravité à une erreur de force spécifique horizontale, le principal mécanisme de croissance d'erreur du strapdown. Désactivé par défaut ; activé par capteur via les champs facultatifs <c1/> et <c2/>.

# text
# c1: q_wf*T + q_rw*T^3/3
seg-efe9f10d2641 = Estimateur de Kalman d'horloge à deux états (phase, fréquence) avec discrétisation exacte de van Loan du bruit de processus. Une marche à l'inertie à partir d'un état connu reproduit exactement la croissance analytique de l'erreur de holdover (<c1/>), et le filtre fournit en outre une borne d'incertitude à 1 sigma en ligne.

# text
seg-539e24f34ed1 = L'exécution d'horloge fournit désormais la figure de mérite d'<b>intégrité</b> (jusque-là non renseignée) : la fraction des échantillons de l'interruption dont l'erreur reste à l'intérieur de la borne de protection à 3 sigma du filtre, présentée dans le résultat JSON et dans le résumé de la CLI.

# text
# c1: orbit
# c2: orbit-gnss-challenged.toml
seg-80620c97e3f5 = Disponibilité GNSS dérivée de la géométrie : la propagation d'orbite circulaire, un générateur de constellation Walker-delta et la visibilité en ligne de visée (occultation par la Terre plus masque d'élévation) produisent la chronologie de disponibilité à partir de la véritable géométrie orbitale. Nouveau type de scénario <c1/> et scénario de référence <c2/> (un engin spatial à l'intérieur de la couche GNSS avec une couverture intermittente).

# text
# c1: run
# c2: run_full
# c3: version
# c4: pyproject.toml
# c5: wheels
seg-67549163ad7d = Extension Python facultative (PyO3, abi3) exposant <c1/>, <c2/> et <c3/>, empaquetée avec maturin (<c4/>) et construite pour Linux, macOS et Windows par un workflow <c5/> déclenché par l'étiquette de version. La liaison est une dépendance facultative conditionnée par une fonctionnalité : la construction par défaut, les tests et la porte d'audit des dépendances ne sont pas affectés.

# text
# c1: run
# c2: chart_svg
# c3: version
# c4: wasm
# c5: getrandom
# c6: wasm32
seg-c76dc363f0b1 = Module WebAssembly facultatif (wasm-bindgen) exposant <c1/>, <c2/> et <c3/>, construit avec wasm-pack sous la fonctionnalité <c4/> ; <c5/> est conditionné par la cible pour utiliser la source d'entropie du navigateur sur <c6/>.

# text
# c1: api::run_toml
seg-cf1b0eef2201 = Répartition <c1/> partagée utilisée par la CLI et les deux liaisons, de sorte que la ligne de commande et les liaisons ne puissent pas diverger.

# text
seg-8d4f855d11bd = La notation du holdover tient désormais compte des segments : les chronologies d'interruption sont découpées en segments contigus à chaque réacquisition GNSS, et le holdover indiqué est la marche à l'inertie la plus défavorable (la plus courte) parmi eux. Les scénarios à interruption unique sont inchangés. S'applique aux évaluateurs d'horloge, inertiel et hybride.

# text
# c1: kind
# c2: inertial
# c3: accelerometer
seg-8b3556d125ed = Le <c1/> indiqué par le modèle inertiel est désormais <c2/> (il était <c3/>), ce qui reflète les canaux combinés d'accéléromètre et de gyroscope.

# text
seg-d842f9cc0a9c = Première version.

# text
# c1: scenario + seed + engine version
# c2: kind
seg-962b75c38735 = <b>Moteur de simulation déterministe</b> pour un PNT hybride quantique/classique : une interface commune de modèles d'erreur, des scénarios déclaratifs de disponibilité GNSS, des estimateurs de holdover / d'estime, et une notation par figures de mérite selon les critères opérationnels PNT standard. Les résultats sont reproductibles à partir de <c1/> (JSON versionné et autodescriptif avec un hachage du scénario) et rendus sous forme de graphiques SVG. La CLI répartit les scénarios selon <c2/>.

# text
seg-16e574edc3a8 = <b>Quatre paquets de capteurs</b>, chacun étalonné sur des données publiées et validé par rapport à la relation standard :

# text
seg-b49bbb60c2cd = <b>Holdover d'horloge</b> : FM blanc, FM à marche aléatoire et vieillissement linéaire ; validé par l'écart-type d'Allan à recouvrement (Riley, NIST SP { "1065" }). Horloge atomique à l'échelle d'une puce contre horloge optique à réseau de strontium.

# text
seg-be2c5f28b256 = <b>Navigation à l'estime inertielle</b> : biais résiduel + marche aléatoire de vitesse, doublement intégrés en erreur de position ; validée par rapport aux relations de croissance d'erreur de Groves. Accéléromètre à atomes froids contre accéléromètre de qualité navigation.

# text
seg-fcb0f72db736 = <b>Transfert de temps</b> : gigue de synchronisation temporelle d'une liaison optique contre une liaison RF → précision de synchronisation → télémétrie à sens unique.

# text
seg-93e5f2f70b58 = <b>Fusion hybride (clé de voûte)</b> : une suite PNT combinée qui doit tenir à la fois la synchronisation temporelle et la position, avec une assistance facultative de l'horloge par transfert de temps optique inter-satellites.

# text
# c1: scenarios/
# c2: provenance
seg-e0a8cbe0c105 = <b>Un scénario de référence cité par paquet</b> sous <c1/>, chaque paramètre numérique portant une <c2/> relue par des pairs.

# text
seg-8f1cc09b2513 = <b>Garde-fous de reproductibilité et d'hygiène du dépôt</b> ; CI (format, clippy, tests, garde-fous, MSRV) et une chaîne de publication déclenchée par étiquette qui réexécute tous les contrôles.

# text
seg-8b4e21f56334 = <b>Documentation</b> : README avec schémas d'architecture, rapport d'état de validation, guide de contribution, politique de sécurité et code de conduite ; licence Apache-2.0 ; modèles de tickets/PR et configuration Dependabot.

# text
seg-e26d94f06ead = Neutre vis-à-vis des fournisseurs partout ; les citations scientifiques et métrologiques relues par des pairs sont conservées.

# text
# c1: NOTICE
# c2: cargo-deny
seg-84cb67686edf = Hygiène de licence Apache-2.0 : en-têtes SPDX sur toutes les sources, un fichier <c1/> avec mention de marque, validation par signature du Developer Certificate of Origin (DCO) pour les contributions, et application par <c2/> des licences/avis des dépendances en CI.

# text
seg-a0f14bea7532 = Positionnement open-core (README) : un moteur Apache-2.0 gratuit, plus un support commercial, une intégration et des extensions propriétaires disponibles auprès d'Ashforde OÜ, financés par des services et non par des frais de licence.

# text
# c1: CITATION.cff
seg-899815063eb1 = <c1/> afin que le logiciel puisse être cité.

# text
seg-15f45d8ccb0f = <s1>Précédent</s1>Où se situe Kshana

# text
seg-cd8a14a9e8ec = <s1>Suivant</s1>Licences

# text
# c1: src/ionex.rs
# c2: TecGrid
# c3: vtec_at
# c4: Δ = 40.3·TEC/f²
# c5: vtec_to_delay_m
# c6: delay_at
# c7: 1 TECU ≈ 0.162 m
# c8: 1/f²
seg-564ad319685e = <b>Cartes d'ionosphère TEC de type IONEX.</b> Le nouveau <c1/> ajoute l'alternative d'ionosphère mesurée au modèle de Klobuchar diffusé : une <c2/> (une grille régulière lat/lon de TEC vertical, une carte mondiale d'ionosphère de l'IGS) avec interpolation bilinéaire en un point de perforation (<c3/>, bornée hors de la grille) et le retard du premier ordre <c4/> (<c5/>, <c6/>). Quatre tests l'ancrent : <c7/> en L1 avec la mise à l'échelle en <c8/>, l'interpolation exacte aux nœuds, des points milieux bilinéaires qui moyennent les coins, et des requêtes hors grille bornées au bord. Portée honnête : la grille et l'interpolation sont livrées ici ; l'analyse du format de fichier IONEX, l'interpolation temporelle entre cartes et la fonction de projection oblique restent à venir.

# text
# c1: src/timegeo.rs
# c2: timetransfer
# c3: sagnac_correction
# c4: Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)
# c5: common_view_offset
seg-26c7b53cbc8c = <b>Corrections géométriques du transfert de temps (Sagnac + vue commune GNSS).</b> Le nouveau <c1/> ajoute les deux effets déterministes dont une véritable comparaison d'horloges doit tenir compte, en complément du modèle stochastique bidirectionnel de <c2/> : <c3/> (<c4/>, le retard dû à la rotation de la Terre — des dizaines de ns pour des lignes de base continentales) et <c5/>, la différence simple en vue commune GNSS qui annule exactement l'erreur d'horloge du satellite et retrouve le décalage entre stations. Trois tests les ancrent sur des références exactes : le Sagnac d'environ { "33" } ns d'un quart de tour équatorial, l'antisymétrie et les cas radial/polaire nuls, et l'annulation exacte de l'horloge du satellite. Portée honnête : un budget complet de transpondeur/de retard matériel TWSTFT et une solution de transfert de temps PPP sans ionosphère restent à venir.

# text
# c1: src/forces.rs
# c2: two_body_accel
# c3: −μ·r/|r|³
# c4: j2_accel
# c5: gravity_accel
# c6: src/integrator.rs
# c7: f(t,[r;v]) = [v; a(r)]
# c8: j2_secular_rates
# c9: Ω̇
# c10: ω̇
# c11: Ṁ
# c12: μ/r²
# c13: ω̇ = 0
# c14: Ω̇ ≈ −5°/day
seg-098e7ea0ee13 = <b>Modèle de forces orbitales (deux corps + J2).</b> Le nouveau <c1/> ajoute le modèle d'accélération qu'intègre un propagateur numérique : <c2/> (<c3/>), la perturbation d'aplatissement <c4/> (la forme close en ECI) et <c5/> qui les additionne — à associer à <c6/> sous la forme <c7/>. Il expose aussi les <b>taux séculaires</b> analytiques de J2 (<c8/>) : la régression nodale <c9/>, la rotation des apsides <c10/> et la dérive d'anomalie moyenne <c11/>. Six tests ancrent la physique sur des références exactes : <c12/> pour le terme à deux corps, la forme close de J2 à l'équateur (~{ "10" }⁻³ de la magnitude à deux corps), l'<b>inclinaison critique</b> ({ "63.4349" }°) qui fige le périgée (<c13/>), la régression nodale de l'ISS (<c14/>) et la dérive vers l'est d'une orbite héliosynchrone rétrograde. Portée honnête : uniquement deux corps + J2 ; J3–J6, la traînée, la SRP et le troisième corps restent à venir.

# text
# c1: src/permalink.rs
# c2: +/
# c3: -_
# c4: encode_scenario
# c5: decode_scenario
# c6: ?s=
# c7: encode_permalink
# c8: decode_permalink
# c9: "foobar"
# c10: "Zm9vYmFy"
# c11: +
# c12: /
# c13: =
seg-d5c03ebc5707 = <b>Liens permanents de scénarios partageables.</b> Le nouveau <c1/> ajoute un codec Base64 RFC { "4648" } sans dépendance (alphabet standard <c2/> avec remplissage, et alphabet <c3/> sûr pour les URL, sans remplissage) et des enveloppes <c4/> / <c5/>, de sorte qu'un TOML du bac à sable peut être encodé dans un paramètre de requête <c6/> et partagé sous forme d'URL. Exposé au navigateur sous la forme de liaisons wasm <c7/> / <c8/>. Quatre tests l'ancrent sur les vecteurs canoniques de la RFC { "4648" } (<c9/> → <c10/>, etc.), un aller-retour de scénario sûr pour les URL (aucun <c11/>/<c12/>/<c13/> à échapper), le rejet de symboles invalides et un aller-retour sur les 256 octets. Portée honnête : le codec et les liaisons sont livrés ici ; l'interface du bouton Partager du bac à sable, le graphique multi-séries Plotly/D3 et le mode de comparaison A/B restent à venir.

# text
# c1: src/batch_ls.rs
# c2: gauss_newton
# c3: h(x)
# c4: (HᵀWH)·Δx = HᵀW·(z − h(x))
# c5: a·exp(b·t)
seg-b615fb16d547 = <b>Moindres carrés par lots de Gauss–Newton (le correcteur différentiel par lots).</b> Le nouveau <c1/> ajoute le noyau d'estimation sur lequel repose une <em>détermination d'orbite</em> par lots (ou tout ajustement de paramètres) : <c2/> linéarise un modèle <c3/> fourni par l'utilisateur avec une jacobienne par différences finies centrées, forme et résout les équations normales pondérées <c4/> (en réutilisant l'inverse de matrice testé) et itère jusqu'à la convergence avec des poids par mesure. Quatre tests l'ancrent : un ajustement de droite linéaire qui atteint la solution exacte des moindres carrés pondérés, un ajustement non linéaire <c5/> qui retrouve les vrais paramètres, une multilatération de distances en 3D qui retrouve une position connue à partir de distances sans bruit (la variante détermination d'orbite) et le rejet d'entrées sous-déterminées ou incohérentes. Portée honnête : c'est le moteur de correcteur générique ; le modèle de mesure de distance/vitesse radiale/azimut-élévation propre à l'orbite, la matrice de transition d'état analytique de J2 et la validation sur des cas publiés restent à venir.

# text
# c1: src/spoof_monitors.rs
# c2: spoof
# c3: combine_power_dbm
# c4: AgcMonitor
# c5: bpsk_autocorr
# c6: SqmMonitor
# c7: 10·log10(N)
# c8: R(τ)=1−|τ|
seg-0ada87934135 = <b>Moniteurs de leurrage de la couche RF (puissance AGC et SQM).</b> Le nouveau <c1/> ajoute deux détecteurs de leurrage indépendants en entrée de récepteur, qui complètent le moniteur de leurrage temporel assisté par l'horloge de <c2/> : un <b>moniteur de puissance AGC</b> (somme de puissances incohérente <c3/> + <c4/>) qui signale la puissance reçue en excès qu'ajoute un émetteur de leurrage au-delà d'une marge en dB configurable, et un <b>moniteur de qualité du signal</b> (autocorrélation triangulaire du code <c5/> + <c6/>) qui signale le déséquilibre de corrélateur Early moins Late qu'introduisent les trajets multiples, le meaconing et le rejeu. Quatre tests ancrent les formes closes exactes ({ "3.01" } dB pour un doublement de la puissance, l'agrégat <c7/>, le <c8/> triangulaire et le seuil d'alerte Early/Late de { "10" } %). Portée honnête : le détecteur de leurrage par parité de cohérence RAIM complet, la fusion multicouche des sorties des moniteurs et la validation par rapport aux vecteurs de leurrage publiés Spirent/ION GNSS+ restent à venir.

# text
# c1: src/integrator.rs
# c2: rk4_step
# c3: y' = f(t, y)
# c4: integrate
# c5: 0.9·(tol/err)^(1/5)
# c6: y' = y → e
# c7: < 1e-9
# c8: NumericalPropagator
seg-b1ff62d88cd2 = <b>Intégrateur adaptatif d'EDO numérique.</b> Le nouveau <c1/> ajoute la première pièce d'un propagateur <em>numérique</em> (la propagation d'orbite de Kshana étant par ailleurs du SGP4/SDP4 analytique) : un pas de Runge–Kutta générique d'ordre quatre (<c2/>) sur tout système du premier ordre <c3/>, et un pilote adaptatif (<c4/>) qui contrôle l'erreur locale par <b>doublement de pas</b> (extrapolation de Richardson) avec le contrôleur de pas standard <c5/> et la logique d'acceptation/rejet. Six tests l'ancrent sur des solutions exactes : l'exponentielle <c6/> à <c7/> près, la réduction d'erreur d'environ { "16" }× à chaque pas divisé par deux, qui prouve la convergence d'ordre quatre, la conservation de l'énergie et du retour de l'oscillateur harmonique sur une période complète, et le pilote adaptatif qui respecte une tolérance serrée avec des pas variables. Portée honnête : c'est le noyau de l'intégrateur et son contrôle d'erreur ; les tableaux emboîtés de Dormand–Prince RK5({ "4" })/RKF7({ "8" }) et le modèle de forces orbitales hiérarchique (deux corps + J2–J6 + traînée + SRP + troisième corps) qui en font un <c8/> restent à venir.

# text
# c1: src/fusion/ukf.rs
# c2: n
# c3: P⁺ = P⁻ − K S Kᵀ
seg-ca53c62839d8 = <b>Filtre de Kalman non parfumé (à points sigma).</b> Le nouveau <c1/> ajoute le filtre de Kalman non parfumé à échelle (Julier et Uhlmann ; Wan et van der Merwe) comme estimateur général à <c2/> états sur des fonctions de processus et de mesure fournies par l'utilisateur — l'estimateur à points sigma qu'utilise un navigateur GNSS/INS à couplage serré lorsque le modèle de pseudodistance/Doppler est fortement non linéaire et que la jacobienne d'un EKF se dégrade. Il comprend l'algèbre linéaire dense de soutien (facteur de Cholesky pour l'étalement des points sigma, inverse de Gauss–Jordan pour la covariance d'innovation) et une mise à jour <c3/> sans forme de Joseph. Six tests le verrouillent, les principaux exploitant la propriété exacte selon laquelle, pour un modèle <em>linéaire</em>, la transformation non parfumée reproduit le filtre de Kalman à la précision numérique (prédiction, mise à jour et cycle complet prédiction+mise à jour tous comparés à un KF linéaire exécuté à la main, plus une vérification analytique bayésienne a posteriori en 1-D et les identités de Cholesky/de l'inverse). Portée honnête : c'est le moteur d'estimation ; le navigateur GNSS/INS à couplage serré à 17 états, le modèle de mesure de pseudodistance/Doppler et le scénario de validation de coupure restent à venir.

# text
# c1: araim_dual_raim
# c2: araim_raim
# c3: P_const
# c4: DualFaultPriors { p_sat, p_const }
# c5: P_HMI
# c6: N + C
# c7: P_const = 0
# c8: araim_raim
# c9: None
seg-da92d32b5715 = <b>Niveaux de protection ARAIM bi-constellation.</b> Le nouveau <c1/> étend le RAIM avancé à panne unique (<c2/>) avec le <b>mode de panne à l'échelle de la constellation</b> de l'ARAIM de l'UE / DO-316 : à côté des hypothèses sans panne et par satellite, chaque constellation (étiquetée par satellite) apporte une hypothèse qui retire d'un coup tous ses satellites, avec l'a priori <c3/> (un nouveau <c4/>). Chaque hypothèse ajoute un terme à la même somme d'intégrité MHSS, de sorte que VPL/HPL sont les plus petites bornes dont le <c5/> total respecte le budget sur les pannes sans défaut + un seul SV + par constellation (la répartition de fausse alerte de Bonferroni porte sur les <c6/> hypothèses). Avec <c7/>, le résultat est identique bit pour bit à <c8/> ; un utilisateur mono-constellation obtient <c9/> face à la panne de sa propre constellation (elle ne peut pas être exclue) — c'est exactement pourquoi la couverture bi-constellation importe. Quatre tests couvrent l'équivalence, l'élargissement du niveau de protection, l'indisponibilité mono-constellation et la validation des entrées, en réutilisant le mécanisme existant de sous-solutions à séparation de solutions.

# text
# c1: src/precession.rs
# c2: (γ̄, φ̄, ψ̄, ε̄_A)
# c3: fw_angles
# c4: iauFw2m
# c5: precession_matrix
# c6: gcrs_to_mod
# c7: mod_to_gcrs
# c8: frames
# c9: ε̄ = 84381.406″ = 23.4392794°
# c10: ψ̄ ≈ 5039.998″
# c11: det = +1
# c12: ≈ 1.40°
# c13: ROADMAP.md
seg-d06c5f88282b = <b>Précession IAU { "2006" } (angles de Fukushima–Williams et matrice de biais-précession).</b> Le nouveau <c1/> implémente la précession IAU { "2006" } (P03 ; Capitaine, Wallace et Chapront { "2003" }) : les quatre angles de Fukushima–Williams <c2/> sous forme de polynômes en siècles juliens TT (<c3/>), et la matrice de rotation de biais-précession GCRS→moyen à la date construite à partir d'eux par la construction <c4/> de SOFA (<c5/>, avec les assistants <c6/> / <c7/>). C'est la première pièce de référentiel inertiel au-dessus de la réduction <c8/> existante fondée sur GMST. Huit tests valident par rapport à des ancrages en forme close — l'obliquité moyenne J2000 <c9/>, les termes constants des angles publiés, l'accumulation de précession générale <c10/> sur un siècle, l'orthonormalité de la matrice et <c11/>, la valeur quasi identité (biais de référentiel seul) à J2000, et l'angle de rotation nette <c12/>/siècle. Portée honnête (<c13/>) : précession seulement — la nutation IAU 2000A à 678 termes, la chaîne complète TEME→GCRS et un recoupement numérique SOFA/ANISE à µas/<{ "10" } m restent à venir.

# text
seg-14c0a863eef1 = Physique de l'accéléromètre à interféromètre à atomes froids (CAI) issue des premiers principes.

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4π/λ
# c3: Φ = k_eff·a·T²
# c4: σ_Φ = 1/(C·√N)
# c5: C(t) = C₀·e^(−t/τ)
# c6: CaiAccelerometer::q_va()
# c7: AccelModel
# c8: |H(ω)| = (4/ω²)sin²(ωT/2)
# c9: accel_transfer_function
# c10: σ_Φ² = k_eff²·S_a·T³/3
# c11: vibration_phase_variance_white
# c12: vibration_phase_variance_band
# c13: beam_axis_projection
# c14: CaiAccelerometer::vibration_phase_noise
# c15: vibration_limited_accel
# c16: k_eff
# c17: √(S_a/(3T))
# c18: k_eff ≈ 1.61×10⁷
# c19: Φ(1 g) ≈ 1.58×10⁴ rad
# c20: σ_a ≈ 0.13 µg
# c21: 1/T²
# c22: 1/√N
# c23: T³
# c24: docs/QUANTUM.md
seg-408fc6feb284 = <c1/> modélise à partir des premiers principes un interféromètre atomique de Mach–Zehnder à trois impulsions plutôt qu'à partir d'une fiche technique : vecteur d'onde effectif <c2/>, phase de l'interféromètre <c3/>, bruit de projection quantique (de grenaille) <c4/>, sensibilité en accélération par tir, décroissance du contraste <c5/> et — c'est l'essentiel — <c6/>, qui <b>dérive</b> la DSP d'accélération blanche déjà consommée par le <c7/> classique à partir du nombre d'atomes, du temps d'interrogation et du contraste. Le modèle couvre désormais aussi le <b>couplage des vibrations</b> — le terme dominant des dispositifs réels : la fonction de transfert accélération→phase de l'interféromètre <c8/> (<c9/>), la variance de phase à DSP blanche <c10/> (<c11/>, avec un recoupement numérique par intégrale de bande <c12/>), la projection <c13/> de rang 1 le long du faisceau, et <c14/> / <c15/> (ce dernier se réduisant au plancher <c17/> indépendant de <c16/>). Onze tests vérifient la physique à la main (Rb-87 <c18/>, <c19/>, plancher de bruit de grenaille de <c20/>/tir contre un plancher de vibration d'environ { "5.9" } µg, les lois d'échelle en <c21/>, <c22/> et <c23/>). Portée honnête dans <c24/> : cela couvre le plancher de bruit de projection et le régime limité par les vibrations au-dessus ; le bruit de phase du laser, les systématiques de Coriolis et de déplacement lumineux, et les scénarios de validation PHARAO/CARIOQA restent à venir.

# text
# c1: ImuKind
# c2: Classical
# c3: QuantumCai
# c4: [cai]
# c5: CaiCfg
# c6: vibration_psd
# c7: quantum_cai
# c8: q_va
# c9: cai
# c10: skip_serializing_if = "Option::is_none"
# c11: Classical
# c12: QuantumCai
seg-ed668459d019 = <b>Accéléromètre à CAI quantique raccordé au scénario inertiel.</b> Un accéléromètre dans un scénario de navigation inertielle à l'estime se résout désormais en un nouveau <c1/> — <c2/> (le capteur existant à coefficients de fiche technique) ou <c3/> lorsqu'il porte un bloc <c4/> facultatif (<c5/> : longueur d'onde, séparation des impulsions, nombre d'atomes, contraste, temps de cycle et une <c6/> de plateforme facultative). La DSP de marche aléatoire de vitesse <c8/> d'un capteur <c7/> est <b>dérivée</b> de la physique de l'interféromètre — le plancher de bruit de grenaille plus, lorsqu'une DSP de vibration est fournie, la contribution limitée par les vibrations en quadrature — au lieu d'un coefficient fourni, et la provenance de l'exécution consigne que le bruit est issu de la physique. Le champ <c9/> est <c10/>, de sorte que les scénarios existants l'omettent et se sérialisent à l'identique octet pour octet (le hachage du scénario est inchangé). Cinq tests couvrent la dérivation, la somme quadratique des vibrations, la sélection <c11/>/<c12/>, la sérialisation stable du hachage et une exécution de bout en bout pilotée par le CAI.

# text
seg-c3978a122010 = Optimiseur de conception de constellation et géométrie en rues de couverture.

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: MinSatellitesForCoverage
# c6: MaxCoverage
# c7: MinWorstPdop
# c8: coverage_half_angle_rad
# c9: λ = arccos(Re/r·cos ε) − ε
# c10: street_half_width_rad
# c11: cos c = cos λ / cos(π/s)
seg-aae519e71c00 = <c1/> gagne <c2/>, un optimiseur par grille sans gradient qui explore l'espace de conception <c3/> et renvoie la meilleure conception de Walker selon un <c4/> choisi — <c5/>, <c6/> ou <c7/> — sur le balayage PDOP déjà validé (un test confirme qu'il renvoie le gagnant par force brute). Plus les formes closes analytiques <b>en rues de couverture</b> <c8/> (<c9/>) et <c10/> (<c11/>, Rider/Beste), vérifiées à la main par rapport à la géométrie des manuels et détectant l'écart de sous-peuplement. Le solveur complet de Rider du nombre minimal de satellites pour une couverture mondiale, un globe 3D dans le bac à sable et un recoupement du DOP avec un outil externe restent à venir.

# text
# c1: kshana <orbit.toml> --export-sp3 out.sp3
# c2: export_sp3 = true
# c3: <scenario>.sp3
# c4: api::export_sp3
# c5: auto_export_sp3
# c6: OrbitClockScenario::to_sp3_string
# c7: epoch
# c8: tests/sp3_export_roundtrip.rs
# c9: gps-ops
seg-7b8468636dea = <b>Export d'éphéméride précise SP3 depuis la CLI.</b> Un scénario d'orbite/de constellation propagé peut désormais être écrit dans un fichier SP3-c : <c1/>, ou <c2/> dans le scénario écrit automatiquement <c3/> (<c4/> / <c5/>, <c6/>, <c7/> facultatif). Un test d'aller-retour (<c8/>) propage l'instantané Celestrak réel <c9/>, l'exporte, le réanalyse et confirme que les positions ECEF retrouvées concordent avec la vérité SGP4 sur { "24" } h à <b>< { "0.5" } m</b> (bien dans la tolérance de { "10" } m de qualité TLE). Le README documente le rôle d'interopérabilité (RINEX → RTKLIB/gLAB, SP3 → Ginan/produits d'orbite précise).

# text
seg-56c729ba110f = Filtre de Kalman couplé horloge+position (covariance inter-blocs).

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-0a424875131d = <c1/> est un unique filtre <c2/> empilé (mises à jour sous forme de Joseph) dont la mesure de <b>pseudodistance</b> <c3/> couple véritablement les blocs de position et d'horloge — contrairement aux deux filtres à deux états indépendants du paquet de fusion historique, qui maintiennent la covariance inter-blocs exactement nulle. Validé : une pseudodistance partagée rend <c4/> non nul ; deux géométries distinctes résolvent conjointement des décalages injectés de position+horloge qu'une seule distance ne peut pas séparer ; une <b>correction d'horloge seule affine la position</b> grâce à la covariance croisée (le gain que des filtres découplés ne peuvent pas procurer) ; et le NEES Monte-Carlo est <b>cohérent avec χ²({ "4" })</b>. C'est la réalisation à 1 degré de liberté (la dimensionnalité du paquet de fusion) ; l'extension à 8 états en 3D et le raccordement au paquet exécutable sont suivis comme travaux à venir.

# text
seg-3983794a9584 = <b>Surveillance de l'état de santé par cohérence du filtre de Kalman (NIS/NEES).</b> La mise à jour de covariance du filtre d'horloge à deux états est désormais sous <b>forme stabilisée de Joseph</b> `P⁺ = (I−KH)P(I−KH)ᵀ

# text
# c1: , which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked in CI at
# c2: ). A new
# c3: runs a Monte-Carlo consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation², target 1) and **NEES** (normalised estimation error², target 2) against 95% χ² bands, surfaced as a
# c4: block in the clock result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test proves the monitor flips to inconsistent when the process noise is mistuned by ×0.1–×10. Adds a general χ² quantile (
seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, vérifié par table).

# text
# c1: docs/PROVENANCE.md
# c2: gps-ops
# c3: provenance
seg-f9689061a1d2 = <b><c1/> — un tableau de provenance citable unique.</b> Regroupe chaque paramètre de capteur (horloges, inertiel, transfert de temps), chaque modèle physique/algorithmique (orbite, systèmes de temps, référentiels, iono/tropo, intégrité, détection, brouillage, Allan) et chaque jeu de données de validation (AIAA 2006-6753, Celestrak <c2/>) avec sa source publiée — fiche technique, article, ICD ou norme — et une étiquette de maturité honnête (qualifié pour le vol / laboratoire au sol / objectif spatial sur matériel au sol). Lié depuis l'introduction du README et le tableau de documentation ; complète les chaînes <c3/> par exécution qui voyagent déjà dans le JSON du résultat.

# text
# c1: ScenarioKind
# c2: kind
# c3: ScenarioKind::classify
# c4: run_toml
# c5: run_scenario(src) -> Result<RunOutput, KshanaError>
# c6: InvalidInput
# c7: NonConvergence
# c8: Unsupported
# c9: IoError
# c10: kind_tag()
# c11: Scenario
# c12: ExternalPack
# c13: jamming
# c14: list_scenario_kinds()
# c15: list_kinds()
# c16: error_kind()
# c17: docs/ARCHITECTURE.md
seg-55c7b52b5fdb = <b>API de scénarios typée.</b> La répartition se fait désormais sur une énumération typée <c1/> au lieu d'une comparaison de chaînes <c2/> brutes (<c3/> + répartition exhaustive), de sorte que l'ajout d'un paquet est vérifié à la compilation. De nouvelles surfaces typées s'ajoutent à <c4/>, inchangée et renvoyant une chaîne : <c5/> avec une taxonomie d'erreurs structurée (<c6/> / <c7/> / <c8/> / <c9/>, chacune avec un <c10/> stable) ; un trait <c11/> et un point d'extension <c12/> (le paquet <c13/> y est raccordé comme exemple concret) ; et l'introspection <c14/> (nom, description, champs obligatoires/facultatifs par type de scénario). Les liaisons Python et WebAssembly gagnent <c15/> et <c16/>. Documenté dans <c17/>.

# text
seg-2b86391b753e = Constellation GPS réelle + couverture de l'enveloppe de fonctionnement.

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: scripts/fetch_tles.sh
# c5: tests/scenario_coverage.rs
# c6: docs/VALIDATION.md
seg-288f2b1872c8 = <c1/> fournit désormais un <b>instantané Celestrak <c2/> réel</b> (2021-07-28, { "30" } satellites) au lieu de TLE Walker synthétiques, avec <c3/> de sorte qu'il ne se charge que si chaque somme de contrôle de TLE est valide ; <c4/> documente l'actualisation reproductible et le README cite la source de données ouvertes. Le nouveau <c5/> exerce chaque paquet sur ≥{ "5" } variantes d'enveloppe en vérifiant une sortie finie/bornée, confirme que le <b>plancher de bruit de fréquence de scintillation dégrade mesurablement la marche libre d'une horloge</b> lorsqu'il est activé (désormais défini dans trois scénarios livrés), et confirme que le <b>filtre de fusion converge avec un biais d'accéléromètre réaliste non nul</b> (à moins de { "3" }× le cas à biais nul), ce qui comble l'écart de réalisme « la fusion ne fonctionne qu'avec des biais nuls ». <c6/> gagne un tableau d'enveloppe de fonctionnement.

# text
# c1: gnss-sim
# c2: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c3: [iono]
# c4: [tropo]
# c5: gnss_measurements[]
# c6: src/gnss_sim.rs
# c7: scenarios/gnss-sim-raim.toml
seg-f78d7dce7bfa = <b>Simulation GNSS dans le domaine des mesures (type de scénario <c1/>).</b> Un modèle direct au niveau de la pseudodistance : pour chaque satellite visible, il synthétise <c2/> et le Doppler L1, avec l'ionosphère monofréquence de <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) et la troposphère zénithale de <b>Saastamoinen</b> projetée par la fonction de projection de <b>Niell ({ "1996" })</b> — exposées sous forme de blocs TOML <c3/> et <c4/>. Les résidus alimentent le RAIM instantané pour des HPL/VPL à chaque époque, et un tableau JSON <c5/> porte, pour chaque SV, la pseudodistance, le Doppler, le C/N₀ et les corrections iono/tropo. Une exécution sans bruit reproduit la géométrie + les corrections à un niveau sub-millimétrique (test de CI). Nouveaux <c6/> et <c7/>.

# text
# c1: spoof
# c2: linear_ramp
# c3: step_jump
# c4: meaconing
# c5: replay
# c6: target_pfa
# c7: P_md
# c8: mc_runs
# c9: 1 − P_md
# c10: src/detection.rs
# c11: scenarios/spoof-meaconing.toml
# c12: [attack] rate_ns_per_s
seg-833249802c56 = <b>Détecteur stochastique de leurrage temporel (type de scénario <c1/>).</b> Le paquet de leurrage exécute désormais un véritable détecteur au lieu d'une comparaison déterministe rampe contre borne : quatre formes d'injection (<c2/>, <c3/>, <c4/>, <c5/>), un test d'énergie / de Neyman–Pearson bilatéral en χ²₁ sur la statistique du moniteur assisté par l'horloge, avec le seuil fixé à partir d'un budget cible de fausses alarmes <c6/>, et la probabilité de non-détection <c7/> rapportée à la fois en forme close et par Monte-Carlo (<c8/> essais par hypothèse — les deux concordent à quelques ×1/√N près). La figure de mérite de sécurité est désormais <c9/> à la magnitude opérationnellement nuisible (spécification). Nouveau <c10/> (fonctions de queue gaussiennes, test NP/d'énergie, P_fa/P_md Monte-Carlo) et <c11/>. Rétrocompatible : un simple <c12/> reste accepté comme rampe linéaire.

# text
# c1: spoof
# c2: 1 − min_detectable/threshold
# c3: 1 − P_md
# c4: security
seg-b3f3d2ca8a3d = <b>Définition de la figure de mérite de sécurité (type de scénario <c1/>) :</b> de la borne analytique de détectabilité <c2/> au <c3/> du détecteur stochastique. Le champ <c4/> du paquet d'horloge reste le substitut analytique plus rapide.

# text
seg-ee1268975b2c = Ajouts (suite)

# text
# c1: jamming
# c2: Q
# c3: availability_under_jamming
# c4: src/jamming.rs
# c5: scenarios/jamming-demo.toml
# c6: docs/CAPABILITY.md
# c7: docs/VALIDATION.md
seg-f71696b7fa20 = <b>Modèle de brouillage RF (type de scénario <c1/>).</b> Un modèle d'interférence par bilan de liaison qui transforme la puissance et la géométrie d'un brouilleur en perte d'accrochage par satellite : le rapport brouilleur/signal à partir de l'affaiblissement en espace libre et du gain d'antenne de réception par direction, le C/N₀ effectif par l'équation anti-brouillage standard (gain de traitement de désétalement × le facteur de séparation spectrale <c2/> ; Kaplan et Hegarty §{ "9.4" }), et un seuil de poursuite configurable, évalué sur une constellation de Walker comme figure de mérite <c3/>. Nouveaux <c4/> et <c5/>. La portée honnête (ni trajets multiples, ni masquage par le relief, ni AGC, ni annulation adaptative) est documentée dans <c6/> / <c7/>.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: [base]
# c4: scenarios/sweep-nd-inertial.toml
seg-d4dc36011ea1 = <b>Balayage de paramètres N-D générique sur n'importe quel type de scénario (<c1/>).</b> Le balayage N-D précédent ne concernait que le paquet d'horloge. <c2/> fait varier des clés TOML pointées d'un scénario <c3/> sur le produit cartésien de ses axes, relance chaque nœud de la grille par le chemin d'exécution normal et extrait une ou plusieurs métriques du résultat par chemin JSON pointé — il fonctionne donc pour tous les paquets (inertiel, gnss-ins, intégrité, leurrage, …) sans se coupler au type Rust de chaque paquet. Les nœuds de la grille sont évalués en parallèle sur des threads du système d'exploitation sur les cibles natives (sans dépendance ajoutée) ; wasm se rabat sur le séquentiel. Déterministe et en ordre ligne par ligne quel que soit le nombre de threads. Nouvel exemple <c4/>.

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
# c3: gnss-ins
seg-1c42e15d65a9 = <b>Modèle d'erreur d'IMU déterministe configurable en TOML dans le paquet <c1/>.</b> La chaîne d'erreur à trois axes en repère lié (facteur d'échelle, désalignement, sensibilité à g, quantification, rampe de vitesse ; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) est désormais accessible pour chaque capteur depuis un fichier de scénario par un bloc <c2/> facultatif, superposé aux biais constants de mise en marche. L'omission du bloc laisse chaque capteur à l'état de source de biais constant pure, de sorte que les exécutions <c3/> existantes sont inchangées. Cela raccorde le modèle d'erreur jusque-là réservé à la bibliothèque à un paquet exécutable et à une figure de mérite.

# text
# c1: tests/fixtures/igs/NOTICE
seg-e035371fbe58 = <b>Validation sur données réelles.</b> L'analyseur de navigation RINEX multi-GNSS, le propagateur RK4 GLONASS et le lecteur SP3 sont désormais exercés sur de véritables fichiers IGS/DLR (un véritable fichier de navigation diffusé mixte RINEX { "3" } et un produit d'orbite IGS SP3-c), et pas seulement sur des échantillons rédigés en interne — en vérifiant des ensembles de satellites non vides et des positions ECEF finies et de taille physique. Les fixtures sont réservées aux tests (exclues de la crate publiée) ; voir <c1/>.

# text
# c1: P_HMI
seg-2a807ae8e194 = <b>RAIM sur une géométrie d'orbite de référence réelle.</b> Les noyaux de RAIM instantané, de séparation de solutions (MHSS) et de niveau de protection ARAIM sont désormais validés par rapport à la géométrie d'orbite précise IGS (SP3) réelle, et non plus seulement à des constellations synthétiques : la géométrie de visée est construite à partir de la première époque SP3 à une véritable station au sol, et les tests vérifient des niveaux de protection métriques, disponibles pour l'APV-I, qu'un biais de pseudodistance de { "60" } m déclenche le moniteur du χ², que la séparation de solutions <b>identifie</b> le satellite en panne et que les niveaux de l'ARAIM respectent le <c1/> alloué. Comble l'écart « validé uniquement sur géométrie synthétique » (la parité avec gLAB dans le domaine du récepteur sur un arc RINEX complet reste un élément de la feuille de route — elle exige une solution de pseudodistance).

# text
# c1: sweep::nd_sweep_ensemble
# c2: metric_stat
# c3: runs = 1
# c4: nd_sweep
seg-651cc4af4872 = <b>Intervalles de confiance par nœud pour le balayage de paramètres N-D</b> (<c1/>). Chaque nœud de grille du balayage à produit cartésien N-dimensionnel peut désormais être évalué comme un ensemble Monte-Carlo de graines, en rapportant la moyenne de la métrique, ses percentiles et un IC bootstrap par percentiles à { "95" } % par nœud (pour les deux horloges) — un balayage statistiquement honnête plutôt qu'un seul tirage par nœud. Réutilise la mécanique d'ensemble/de bootstrap (<c2/>) ; déterministe ; <c3/> se réduit exactement au <c4/> à graine unique. (La généralisation du balayage à tous les paquets, liée à la refonte du Scénario typé, et l'exécution parallèle restent à faire.)

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Sortie des époques en continu</em> (<c1/> ; <c2/>). Chaque mise à jour de boucle contient :

# text
seg-ff549f07ce78 = les corrélateurs précoce, ponctuel et tardif ;

# text
seg-00457c1bb059 = les trois sorties de discriminateur ;

# text
seg-b17d335f6cac = les états des NCO PLL/FLL/DLL et la phase de la porteuse ;

# text
seg-a3bf3f1034cd = le PLI et les indicateurs de verrouillage ;

# text
seg-7912a72da79b = les deux estimations de C/N0 et les bits ;

# text
seg-8d105d656041 = l'état de verrouillage.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = Elle est écrite au fil de l'exécution, en CSV, en JSON Lines ou sous une forme binaire versionnée, avec des lecteurs en Rust (<c1/>) et en Python (<c2/>).

# text
# c1: iq track
# c2: --epochs
# c3: --events
# c4: --summary
# c5: kshana.track-summary/1
# c6: iq sweep
# c7: --epochs
# c8: --events
# c9: iq_track
# c10: epochs_out
# c11: events_out
seg-aa081bfd9878 = <c1/> gagne <c2/>, <c3/> et <c4/> (<c5/>), et <c6/> gagne <c7/> et <c8/>. L'outil MCP <c9/> gagne <c10/>/<c11/> et construit sa réponse à partir du résumé à mémoire bornée.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = Le tas d'une exécution ne croît plus avec la longueur de l'enregistrement : <c1/> le mesure avec un allocateur à comptage ({ "6" }× la longueur, même pic à { "64" } Kio près), avec un témoin montrant que le chemin en mémoire, lui, croît.

seg-1200856c90da = [{ $version }] - 2026-10-28

seg-05d0c798a196 = { "0.40" } ajoute le fil de mission de classe Artemis et son segment lunaire, une étiquette de preuve sur chaque figure et chaque tableau qu'une exécution écrit, l'ingestion et l'ajustement d'horloge mesurée, une vérification des soumissions de partenaires de données, une région d'émetteur estimée à partir de rapports ADS-B ou AIS, la nouvelle campagne de benchmark { "0.40" }, ainsi que la ligne de commande, les rapports et le Studio en dix-sept langues en plus de l'anglais (les documents machine restent en anglais). La matrice de vérification passe de { "388" } à { "401" } lignes : { "176" } VALIDATED (inchangé), { "221" } MODELLED (contre { "208" }) et { "4" } PARTNER. Aucune ligne n'a été promue à VALIDATED. Les types de scénario passent de { "87" } à { "92" }. Chaque seuil qu'une comparaison préenregistrée n'a pas atteint est énoncé ci-dessous et reste épinglé ; aucun n'a été assoupli. L'énoncé à titre consultatif est inchangé : { -brand } est un logiciel à titre consultatif, et non un équipement de navigation homologué et pas une certification ; l'opérateur reste responsable.

seg-738f33f0ae8a = Limites connues

seg-d4062fab7ae1 = Les exécutions non anglaises prennent environ deux fois plus de temps, car le scénario s'exécute deux fois (une fois en anglais pour les fichiers machine, une fois dans la langue choisie pour la personne).

seg-8db6dedc627a = Certaines phrases du Studio sont assemblées à partir de fragments et peuvent manquer d'articles dans les langues qui ont un genre grammatical.

seg-86e6e35ac846 = Les traductions sont des traductions automatiques qu'aucun locuteur natif n'a relues ; l'anglais fait foi.

seg-dd7ee240b467 = <b>Dix-sept langues en plus de l'anglais</b> pour le texte du moteur destiné aux personnes, ainsi que pour le site et le Studio : nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, les variables de paramètres régionaux ; <c3/> sur les appels de la bibliothèque, de Python, de WebAssembly et de MCP). Les messages et erreurs de la ligne de commande, les synthèses d'exécution, le texte des graphiques, <c4/>, les descriptions des types et les mentions à titre consultatif sont traduits ; les documents machine (JSON, CSV, codes d'erreur, matrice de vérification) restent en anglais, et une exécution non anglaise exécute le scénario une fois en anglais pour les fichiers machine et une fois dans la langue choisie pour la personne (<a1><c5/></a1>). <b>Les traductions sont des traductions automatiques, non relues par des locuteurs natifs ; l'anglais fait foi</b> ; le fichier <c6/> de chaque langue indique ce qu'un relecteur doit vérifier en premier, et les pages du site portent un avis qui le dit. Les mots de verdict, les niveaux de preuve et la portée de la mention à titre consultatif (« non homologué », « pas une certification », « l'opérateur reste responsable ») sont conservés dans toutes les langues.

seg-7a95c263ecec = <c1/> : une <b>région d'émetteur estimée</b> à partir de rapports ADS-B ou AIS. Une postérieure sur l'endroit où peut se trouver une source de rapports de position dégradés (ligne de visée radio sur un rayon terrestre de 4/3, hauteur d'antenne et puissance de l'émetteur marginalisées, aéronefs touchés qui tirent et aéronefs non touchés en ligne de visée qui repoussent), écrite sous forme de régions à { "50" }, { "90" } et { "95" } %, d'un centroïde avec son ellipse d'incertitude (jamais un simple point), de sessions dans le temps (début, fin, durée, surface touchée, aéronefs distincts au-dessus du minimum de publication), d'un profil horaire et d'heures par jour, avec fusion facultative d'une position TDOA issue de <c2/>. Sorties : GeoJSON, synthèse JSON, CSV des sessions et figure SVG, chacune portant la licence, l'attribution, l'identifiant de méthode, les hypothèses, les limites et son étiquette de preuve. Bibliothèque <c3/>, Python et WebAssembly <c4/>. MODELLED (ligne du registre <c5/> ; la matrice compte désormais { "401" } lignes, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER) ; étalonnée sur des données synthétiques seulement, la comparaison avec les sites d'émetteurs de Jammertest { "2025" } ayant été préenregistrée et exécutée une fois : ADS-B et AIS tous deux NOT ASSESSABLE (trop peu de sessions programmées dans les données ouvertes), de sorte que la ligne reste MODELLED (<c6/>). Formulation neutre, agrégat seulement ; la publication des régions d'émetteurs dans l'observatoire public reste désactivée. Un exemple synthétique se trouve dans <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Journaux d'horloge mesurés.

seg-59b240848747 = <c1/> lit un journal d'horloge mesuré pour en tirer une série de phase unique : huit formats (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> et <c4/>, suivi et statistiques de chrony), chacun un sous-ensemble documenté ; tout ce qui sort de ce cadre est refusé avec une erreur qui nomme ce qui a été trouvé. Il est utilisé par <c5/> (<c6/>) et par le type horloge (<c7/>, qui ajoute un bloc <c8/> avec le SHA-256 du journal et les ADEV, TDEV et MTIE qui se recouvrent), avec le scénario fourni <c9/> (<a1><c10/></a1>). Comparé à allantools sur des données publiques réelles par rapport à des seuils préenregistrés : la première exécution <b>n'a pas atteint</b> B1 ({ "5" } cas sur { "11" }, tous des horodatages TICC conservés en <c11/>), B2, B3 ({ "7" } cas sur { "24" }) et B4 (la version de l'en-tête n'était pas vérifiée) ; après les corrections, B1, B3 et B4 sont atteints et B2 l'est sauf pour une paire MTIE, qui est épinglée et n'est pas un défaut du moteur (allantools { "2024.6" } retire la fréquence moyenne avant d'intégrer ; par rapport à son MTIE en mode phase, le moteur concorde à { "1e-10" } près). La ligne reste MODELLED (<c12/>).

seg-400a39dbf3dd = <b>Un holdover piloté par une série mesurée ajustée</b> : le <c1/> du type horloge ajuste le bruit d'une série mesurée et pilote le holdover à partir de celui-ci (<c2/>, scénario fourni <c3/>). Comparaison préenregistrée : F1(b), F3 et F4 atteints ; F1(a) (retrouver la FM à marche aléatoire enregistrée) <b>NOT MET</b> sur les enregistrements C3 (non identifiable par construction) et sur deux des trois enregistrements C4 (FM à marche aléatoire absorbée par la FM de scintillement et la dérive) ; F2 (identification du bruit par rapport à allantools) atteint sur onze des douze enregistrements et D3, et <b>NOT MET</b> sur D2 tel qu'enregistré (atteint à périmètre égal). Tous les échecs sont épinglés (<c4/>) ; le bloc <c5/> et le holdover qu'il pilote restent MODELLED (<c6/>).

seg-f1f15e102774 = <b>La nouvelle campagne de benchmark { "0.40" }</b>, préenregistrée avec la validation du propriétaire avant toute exécution : A3 (EXPLORATORY, l'AUC bootstrap par regroupement de dossiers de <c1/>, quantile à { "2.5" } % { "0.8502" } contre { "0.80" }), D3 (EXPLORATORY, trois détecteurs sur cinq dépassent un écart d'optimisme de { "0.05" } à l'échelle { "0.25" }), R3 (AUC { "1.0" }) et R4 (P_fa { "0.0" }, P_d { "1.0" }) : tous MET, tous MODELLED. A2, D1 et R1 ne sont pas touchés et restent <b>NOT MET</b> ; rien ici ne les referme (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/> : vérifie le format et les métadonnées d'une soumission de partenaire de données (<c2/> : appareil, fichier de données et SHA-256, mode d'acquisition, lignes MODELLED pour lesquelles elle est proposée, licence, déclarations) et lit les données avec les lecteurs de journaux d'horloge ou d'IMU du moteur. Il ne note rien et ne valide rien. Un exemple synthétique se trouve dans <c3/>.

seg-823e1abc7f92 = <c1/> : quelles lignes MODELLED du registre des données mesurées pourraient promouvoir, les formats acceptés, comment une soumission est vérifiée, notée par rapport à un seuil préenregistré et créditée, et ce que signifient PARTNER et VALIDATED ; une note de prospection en brouillon pour le propriétaire dans <c2/> (rien n'est envoyé).

seg-34bdcfd66ded = Dans la branche du dépôt d'où viennent ces documents ; pas encore sur GitHub

seg-ddd45d39e8a9 = <b>Deuxièmes campagnes pour les seuils non atteints de <c1/> et <c2/></b>, exécutées comme préenregistré (<s1><c3/></s1>, <s2><c4/></s2> ; validées avant toute exécution). Chaque échec d'origine reste NOT MET et épinglé. <c5/> : le témoin reproduit l'exécution { "1" } cellule par cellule ; cinq ablations à lecture unique ramènent { "2" } des { "78" } cellules manquées dans la tolérance (EXPLORATORY, sans seuil) ; le nouveau seuil S7b (une forme d'émission à décroissance et plancher ajustée sur des panneaux Classic IIR) est NOT MET sur les panneaux IIR-M à { "3.83" } à { "3.95" } dB contre { "3" } dB ; la campagne de réception publiée mise de côté n'a pas été exécutée (aucune source épinglée) (<s3><c6/></s3>). <c7/> : les nouveaux seuils C3a, C3b (une limite de détection d'environ { "3e-9" } m/s2), Q3a, Q3b (une fonction de répartition normale précise supprime l'écart de { "1.7e-6" }) et G3'' sont atteints comme seuils à part entière, et G3' avec des a priori illustratifs est atteint et étiqueté EXPLORATORY (<s4><c8/></s4>). Tout reste MODELLED. Nouveaux éléments publics : <c9/>.

seg-bc89e70f4d36 = <b>Une étiquette de preuve sur chaque figure et chaque tableau qu'une exécution écrit.</b> Le JSON de résultat a une clé <c1/>, le SVG du graphique un élément de métadonnées et une ligne sous le tracé, et le tableau CSV des lignes de commentaire <c2/> : le niveau (<c3/>, <c4/> ou <c5/>, le plus faible des lignes) et les identifiants des lignes de la matrice de vérification sur lesquelles l'exécution repose. Les lignes et les statuts sont lus dans la matrice, et non saisis à la main ; les identifiants sont stables (<c6/> et huit chiffres hexadécimaux, une nouvelle colonne <c7/> dans <c8/>, une liste figée dans <c9/>). Aussi sur receiver-trust, <c10/>, <c11/>, le rapport d'exposition de l'itinéraire et, dans le <c12/> signé, chaque paquet de preuves (<c13/> { "1.1" } ; <c14/> indique le niveau ; les paquets créés avant { "0.40" } se vérifient sans changement). <c15/> échoue si une figure n'a pas d'étiquette, si une étiquette est en désaccord avec la matrice ou si un nouvel écrivain de fichiers n'est ni étiqueté ni listé avec une raison. Les sorties qui n'en portent aucune sont listées dans <c16/>. Les trois graphiques de démonstration du README ont été rendus de nouveau avec l'étiquette (la retirer restitue les anciens octets ; <c17/>). Aucune affirmation n'a changé.

seg-8abd87414bc4 = Le type de scénario <c1/> (<c2/>, <c3/>) : le budget d'erreur de navigation et de synchronisation d'une chaîne de phases du lancement à l'entrée, chaque nombre MODELLED et chaque entrée déclarée. Huit types de phase : <c4/>, <c5/> (covariance relative de Clohessy-Wiltshire sur des segments de capteur, fenêtre d'amarrage), <c6/> (propagation de Cowell avec une matrice de transition d'état aux différences finies, erreur de poussée, mises à jour <c7/> et de suivi au sol, la Lune issue d'une découpe facultative du noyau DE440), <c8/> (sigma de l'angle de trajectoire, probabilité de corridor, décélération maximale aux bords du corridor, empreinte d'atterrissage) et les quatre types lunaires. Règles de transfert (<c9/>, <c10/>, <c11/>), conversions de référentiel et d'échelle de temps comme lignes de budget à part, une superposition facultative du réseau au sol qui fixe le cycle de suivi de chaque phase, la marge par rapport aux exigences déclarées et le maillon le plus faible. L'exemple suit la séquence d'un diaporama public de concept d'opérations de la NASA avec des nombres ILLUSTRATIVE : un exemple de bout en bout de classe Artemis sur { "11" } phases, segments terrestre et lunaire. La propagation cislunaire a été comparée à la trajectoire publique d'Artemis I sur un arc de { "72" } h par rapport à un seuil fixé dans <c12/> avant l'exécution : <b>NOT MET</b> ({ "45.3" } km et { "0.25" } m/s contre { "5" } km et { "0.05" } m/s). Le diagnostic situe l'écart dans cinq petits événements impulsifs de la référence ; entre eux, le modèle de forces reproduit les états horaires avec une médiane de { "0.4" } m. La ligne reste MODELLED (<c13/>).

seg-67cad0a9c0c4 = Le segment lunaire du fil de mission de classe Artemis : quatre types de scénario, chacun aussi un type de phase de l'interface <c1/> (<c2/>), tous MODELLED.

seg-63066076a0a8 = <c1/> : navigation relative jusqu'à l'amarrage sur une orbite polaire circulaire à { "100" } km ou elliptique de { "100" } km sur { "3000" } km (<c2/>, <c3/>). Une estimation par lots de Gauss-Newton sur l'arc fusionne un point absolu par véhicule issu d'un ensemble illustratif de relais de classe LCNS, une erreur persistante du signal dans l'espace (commune aux deux véhicules et indépendante) et une distance par liaison croisée, sous le modèle de forces lunaires de la crate. Elle rapporte la position et la vitesse relatives dans les axes locaux de la cible, la disponibilité des points, l'erreur d'estimation normalisée moyenne au carré par rapport à sa valeur attendue, le coût d'ignorer les harmoniques de gravité, les modèles de capteurs relatifs terminaux à côté du chiffre des signaux seuls, et la covariance 6x6 transmise.

seg-a2d67bb5cfb3 = <c1/> : le budget de dispersion à l'atterrissage sur un site polaire sud (<c2/> ; <c3/> lit le MNT LOLA depuis une copie du dépôt) : un modèle d'erreur inertielle à cinq états par axe, un point AFS (autonome ou différentiel, avec le résidu de la liaison de correction de <c4/>), un point relatif au terrain (le comparateur <c5/> sur son relief synthétique, ou la borne de Cramer-Rao de l'appariement avec le MNT LOLA), et le temps lunaire par l'horloge du véhicule (<c6/>). Elle rapporte l'ellipse d'atterrissage à 3 sigma, chaque combinaison d'aides, et un étalonnage Monte Carlo de l'ellipse.

seg-1babf99e8d56 = <c1/> : disponibilité du positionnement et de la synchronisation temporelle par site et par saison (<c2/> ; <c3/> ajoute l'horizon LOLA tracé par rayons) : le chiffre de positionnement à site unique égale celui de <c4/> au bit près ; c'est la visibilité de la Terre et du Soleil, issue des éphémérides analytiques, qui varie avec la saison.

seg-bae659d0ff4d = <c1/> : l'ascension jusqu'à l'orbite de rendez-vous et la covariance de position et de vitesse reportée en orbite (<c2/>), avec la dispersion à la coupure des moteurs rapportée à côté.

seg-106be12d960f = <c1/> ; le préenregistrement, ses amendements et chaque résultat, échecs compris, dans <c2/>.

seg-5e8880c28a67 = Préenregistré dans <c1/> avant toute exécution, avec six amendements datés (chacun fait avant la récupération des données, sauf l'amendement { "6" }, qui corrige une erreur de calcul dans un nombre d'états après la récupération et avant tout résultat A2 ; chaque amendement est signalé dans le fichier). Aucun seuil n'a été assoupli.

seg-90adc3a3c58b = A1 (le propagateur par rapport à la trajectoire reconstituée de LRO issue de JPL Horizons, { "24" } h) : <b>MET</b>, un écart 3-D maximal de { "33" } m contre un seuil de { "500" } m et un écart radial RMS de { "2.4" } m contre { "60" } m.

seg-69f903a278eb = A2 (le même propagateur par rapport à la NRHO de CAPSTONE sur une révolution de 6,5 jours) : <b>NOT MET</b>, un écart de position finale de { "136.8" } km contre un seuil de { "25" } km et un écart de rayon de périapse osculateur de { "28.4" } km contre { "10" } km. La ligne reste MODELLED, et l'échec est épinglé par <c1/>.

seg-32fcafe8fa07 = B1 (la cohérence de l'estimation de rendez-vous avec son propre modèle) est MET à la quatrième conception d'estimateur, NEES moyenne de { "5.85" } à { "5.93" } contre une bande de [{ "5.2" }, { "6.8" }] ; les trois conceptions précédentes, un filtre de Kalman étendu en trois variantes, l'ont manquée. Un cinquième changement, fait après qu'on a constaté que le scénario livré de { "2" } h envoyait { "4" } essais sur { "50" } vers un minimum local (NEES moyenne { "1e9" }), exécute l'ajustement de Gauss-Newton sur un arc croissant avec réduction du pas de moitié ; B1 n'en est pas modifié et les scénarios livrés donnent { "6.51" } et { "6.33" }. L'historique se trouve dans <c1/>.

seg-a4b6bfcb9984 = Rien ici n'est VALIDATED : les lignes de références indépendantes testent le propagateur partagé, et non un filtre de navigation, un signal ou un budget.

seg-29d014d29790 = Une mise à jour de dépendance dans la bibliothèque livrée (la première entrée), les autres dans l'outillage de validation croisée (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> et <c3/> { "0.13" } vers { "0.14" } (avec <c4/> { "0.14.3" }, <c5/> { "0.17.0" } et <c6/> { "0.5.5" } vers { "0.7.10" } ; aussi la dépendance directe <c7/>, désormais { "0.7" }) corrigent RUSTSEC-2026-0387, une variabilité de temps d'exécution dans <c8/> { "0.5.5" }. Kshana n'utilise ces crates que pour vérifier des signatures publiques (la clé racine Galileo OSNMA et les jetons d'horodatage RFC { "3161" }) et ne signe que dans les tests, avec des clés jetables ; l'exposition pratique était donc nulle ; la mise à niveau supprime l'avis sans entrée d'exclusion. Les fichiers de verrouillage de la bibliothèque et du MCP changent tous les deux ; aucun résultat de vérification ne change (les tests de vecteurs OSNMA et d'horodatage passent sans modification).

seg-1a4cda9d1486 = La version minimale de Rust prise en charge est désormais { "1.88" } (exigée par le correctif de RUSTSEC-2026-0387).
