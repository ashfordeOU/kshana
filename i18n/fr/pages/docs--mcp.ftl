# docs--mcp: translations (fr)

# text
seg-261c059bec54 = À titre consultatif, pas un équipement de navigation homologué : l'opérateur reste responsable de la navigation. Le serveur s'exécute sur votre ordinateur ; rien n'est envoyé à Ashforde OÜ.

# text
seg-13641146503d = Cursor (un clic)

# text
seg-3bd13fe295f4 = VS Code (un clic)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Binaire précompilé

# text
seg-d107bc8e1950 = Registre MCP

# text
seg-842b77a21c5f = Canal

# text
seg-d6476863f862 = Capacité

# text
seg-fdbb9db68f1d = aucun

# text
seg-1759a8cce7d6 = Types

# text
seg-564133d6a0c4 = Constellations autour de n'importe quel corps

# text
seg-b88a2a9497c2 = Outil

# text
seg-a683980168f7 = Docker

# text
seg-f3a2279d6df7 = Commande ou bouton

# text
seg-20c5ae650eb7 = Nécessite

# text
seg-af4d3ce85e11 = Forme épinglée

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node, ou Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ avec uv ou pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = formule pour v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> puis <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifeste pour v{ $version }

# text
seg-f7c0a2fbb0b5 = winget

# text
seg-9e599ab3c0a3 = winget (Windows)

# text
seg-091d1404bb8a = cargo

# text
seg-145ddf98e77f = Rust { "1.88" }+

# text
# c1: kshana-mcp
# c2: kshana-mcp-<target>[.exe]
# c3: SHA256SUMS
# c4: gh attestation verify
seg-b308519d4c8d = <a1>la page de la version</a1> : <c1/> (Linux x86-64), <c2/>, vérifié par <c3/> et <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (trouvé par les clients compatibles avec le registre)

# text
seg-b1a6e807f06f = un client compatible avec le registre

# text
seg-d5a3818ac3b6 = À distance (streamable HTTP)

# text
seg-5f1397b1ea30 = votre propre hôte

# text
# c1: mcp/kshana-mcp/README.md
seg-e7acd0ff4c84 = Source : <c1/>

# attr:alt
seg-81a87d14efda = Kshana : la marque, un réticule de boussole marquant l'instant précis, à côté du logotype kshana

# text
seg-3d5232472e42 = kshana-mcp : interrogez votre assistant d'IA, et le moteur répond

# text
# c1: kshana-mcp
seg-ef90bf1e0b51 = <c1/> est un serveur <a1>Model Context Protocol</a1> (MCP) pour <b>Kshana</b>, le simulateur open source de résilience PNT (positionnement, navigation et synchronisation temporelle). Il permet à un assistant d'IA (intelligence artificielle) d'exécuter le véritable moteur et de relire son JSON (JavaScript Object Notation), au lieu de deviner les calculs. Il communique via stdio (entrée et sortie standard) avec tout client compatible MCP, y compris Cursor et JetBrains AI Assistant / Junie.

# text
seg-1fddef4e9a49 = Les calculs pour lesquels Kshana est validé sont exactement ceux où un modèle de langage devine mal : la propagation d'orbite SGP4 (Simplified General Perturbations { "4" }), les référentiels de l'IAU (Union astronomique internationale), les écarts-types d'Allan, la disponibilité GNSS (système mondial de navigation par satellite) et le DOP (dilution de précision), les niveaux de protection ARAIM (surveillance avancée de l'intégrité autonome par le récepteur), la fusion GNSS et INS (système de navigation inertielle), et les modèles de capteurs quantiques. Posez une question ; l'assistant exécute un véritable scénario et obtient des chiffres de mérite avec leur provenance et leur libellé VALIDATED ou MODELLED.

# attr:alt
seg-d51681f30e8f = Un moteur ouvert au centre, avec le serveur MCP comme l'une de ses surfaces à côté de la ligne de commande, de la bibliothèque Rust, de Python, de WebAssembly et de Kshana Studio, de l'image Docker et du module d'extension JetBrains ; chaque surface exécute le même moteur, et Kshana Pro en dépend sans le dupliquer

# text
seg-2a56e1f52830 = Outils

# text
# c1: include_chart
seg-b847694d91b5 = Exécute un scénario à partir d'une définition TOML (Tom's Obvious, Minimal Language) ; renvoie le résumé + le JSON de résultat complet (JavaScript Object Notation : chiffres de mérite, courbes). L'option <c1/> renvoie le graphique en SVG (Scalable Vector Graphics).

# text
seg-a30b46501cff = Les { "87" } types de scénario intégrés avec descriptions + champs obligatoires/facultatifs, afin que l'agent puisse construire un scénario valide.

# text
seg-3c00da00ec30 = Vérification préalable : analyse le TOML et détecte son type, sans l'exécuter.

# text
# c1: name
# c2: kind
# c3: kind
seg-4516fd1e665c = Les scénarios de référence fournis, en JSON : chacun avec son <c1/>, son <c2/> et une phrase sur ce qu'il montre. Filtre <c3/> facultatif. Chaque exemple s'exécute tel quel, c'est donc le moyen le plus rapide d'obtenir un TOML valide pour un type de scénario.

# text
# c1: scenarios/
seg-61db4a94ad72 = Le texte TOML d'un scénario de référence fourni, octet pour octet le fichier sous <c1/>.

# text
# c1: format
# c2: json
# c3: html
seg-306f7a835bb9 = Exécute un scénario et renvoie son rapport : résumé exécutif, entrées, chaque chiffre avec son unité et son libellé VALIDATED ou MODELLED, événements, les capacités exercées et un enregistrement de reproductibilité. <c1/> vaut <c2/> (par défaut) ou <c3/> (la page imprimable en un seul fichier).

# text
# c1: svg
# c2: html
# c3: frames
seg-bdacef6d5133 = Exécute un scénario et renvoie sa série temporelle sous forme d'animation : <c1/> (par défaut), <c2/> (un lecteur autonome) ou <c3/> (au plus { "120" } dans une réponse). Le premier élément de contenu est un résumé JSON de ce qui a été dessiné ; les fichiers suivent. Un type sans axe temporel échantillonné est refusé, avec la raison.

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
seg-313f7594bd81 = Quels formats d'interopérabilité s'appliquent à un scénario (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), la raison lorsque l'un ne s'applique pas, et la spécification que suit chaque rédacteur. N'exécute pas le scénario.

# text
# c1: .e
# c2: spectrum
# c3: [iq]
seg-e63b7853bb96 = Exporte un scénario en CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, éphéméride STK (Systems Tool Kit) <c1/>, ou SigMF (Signal Metadata Format, pour un scénario <c2/> avec un bloc <c3/>). Le premier élément de contenu est un index JSON des fichiers (suffixe, taille, encodage, et le condensat SHA-256, le Secure Hash Algorithm de 256 bits) ; les fichiers suivent, le fichier binaire d'échantillons SigMF en base64.

# text
# c1: LineString
# c2: terrain-nav
# c3: terrain-slam
# c4: gravity-map
# c5: combined-altpnt
seg-074e914789c5 = Écrit un itinéraire GeoJSON <c1/> dans un scénario qui suit une trajectoire de points de cheminement (<c2/>, <c3/>, <c4/>, <c5/>) et renvoie le nouveau TOML.

# text
# c1: orbit
seg-ae58a8577aa7 = Exporte la constellation d'un scénario <c1/> en éphéméride précise SP3-c (Standard Product { "3" }, révision c).

# text
# c1: orbit
seg-6a59aacf26bb = Exporte les éléments d'un scénario <c1/> sous forme de catalogue CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message).

# text
# c1: orbit
# c2: export_sp3
seg-5562b319968b = Exporte la série d'états d'un scénario <c1/> sous forme d'éphéméride CCSDS OEM (Orbit Ephemeris Message) { "2.0" } : la série de position <em>et</em> de vitesse TEME (équateur vrai, équinoxe moyen) que lisent les outils de dynamique du vol (GMAT, le General Mission Analysis Tool ; Orekit ; STK, le Systems Tool Kit) ; le complément porteur de vitesse de <c2/>, qui ne porte que la position.

# text
# c1: <scenario>.table.csv
# c2: realtime-frame-eop
# c3: lunar-time-budget
# c4: lunar-jamming
# c5: telecom-timing
# c6: leo-navmsg
# c7: encode-decode
# c8: kepler16
# c9: kepler-rac
# c10: moonlight-service-volume
# c11: export_site_lat_deg
# c12: export_site_lon_deg
seg-b0cf13e530b7 = Exécute un scénario et renvoie son tableau de reproductibilité en CSV (valeurs séparées par des virgules) : le tableau stable octet par octet que l'interface en ligne de commande (CLI) écrit sous <c1/>. Seuls <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (son analyse <c7/> sur un modèle de message <c8/> ou <c9/>) et <c10/> avec <c11/> + <c12/> définis en émettent un ; tout autre type renvoie une erreur qui nomme ceux-ci.

# text
# c1: tle
# c2: epoch
# c3: skyline_preset
# c4: request
# c5: docs/SKYLINE.md
seg-ab242cd0259c = Géométrie du ciel sous une ligne d'horizon dépendant de l'azimut : à partir d'un site, d'un instant et de préréglages de constellation, d'ensembles d'éléments à deux lignes (<c1/>, propagés par SGP4 jusqu'à une <c2/> UTC) ou de satellites en azimut/élévation ou ECEF, les satellites visibles et ceux masqués par la ligne d'horizon, GDOP/PDOP/HDOP/VDOP/TDOP à partir du noyau DOP vérifié par gnss_lib_py, le cofacteur et la covariance est-nord-haut (une horloge par système ou une horloge commune) et l'ellipse d'erreur horizontale ; avec <c3/> au lieu de <c4/>, un préréglage REPRESENTATIVE avec sa provenance et sa coupure à chaque degré. MODELLED ; porte la mention à titre consultatif ; pas de Monte Carlo via MCP. Voir <a1><c5/></a1>.

# text
# c1: format
# c2: ubx
# c3: rinex
# c4: android
# c5: nmea
# c6: sbf
# c7: text
# c8: base64
# c9: [[events]]
# c10: [compare]
# c11: [platform] kind = "vessel"
# c12: text
# c13: base64
# c14: docs/RECEIVER-TRUST.md
seg-d6ed4e8d56e5 = Évalue la confiance d'un journal de récepteur GNSS (système mondial de navigation par satellite) réel. Le TOML nomme le <c1/> du journal (<c2/>, <c3/>, <c4/>, <c5/> ou <c6/>) et en donne les octets en ligne sous forme de <c7/> ou <c8/> ; l'outil exécute les moniteurs de confiance (chute de la densité porteuse sur bruit, perte d'accrochage, AGC (commande automatique de gain), indicateur de brouillage, saut de position et, avec RINEX plus la navigation diffusée, RAIM (surveillance autonome de l'intégrité par le récepteur) et un moniteur assisté par l'horloge) et renvoie quand et pourquoi le point de position a cessé d'être digne de confiance. Des sections <c9/> et <c10/> facultatives notent des événements déclarés et des chutes de C/N0 prédites par rapport à des tolérances déclarées. Une table <c11/> sélectionne les moniteurs maritimes et ajoute un score de confiance de 0-100 par époque avec les moniteurs qui ont déduit (à titre consultatif ; MODELLED). Le journal se transmet en ligne sous forme de <c12/> ou <c13/> (au plus { "4" } Mio). Graphique et CSV par époque sur demande. Voir <a1><c14/></a1>.

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: --listen
# c4: docs/MARITIME-TRUST.md
seg-d1a967a443ea = Note un extrait NMEA { "0183" } borné (au plus { "2" } Mio et { "20,000" } époques ; il doit contenir la fenêtre d'étalonnage) comme le fait <c1/> : état de confiance par époque et score de 0-100 avec les moniteurs qui ont déduit, un résumé et la dernière <c2/>. La forme bornée de la commande en direct : aucun socket n'est ouvert et rien n'est écrit sur un port ; la barrière, <c3/> et les exportateurs de télémétrie (Prometheus, OTLP, syslog) ne sont disponibles qu'en ligne de commande. À titre consultatif seulement ; MODELLED. Voir <a1><c4/></a1>.

# text
seg-89e894d4b416 = Un journal NMEA { "0183" } de navire (au plus { "4" } Mio) en exécution par lot, avec le TOML de session énonçant les limites du navire : le modèle de score et le score de 0-100 de chaque époque avec ses déductions (la réponse garde les nombres par état et les { "200" } premières époques degraded ou untrusted). À titre consultatif seulement ; MODELLED.

# text
# c1: kshana jammertest import
# c2: docs/JAMMERTEST.md
seg-27698c80b7f1 = Lit le catalogue d'essais et le plan de transmission Jammertest publiés (NPRA/jammertest-plan, MIT) comme vérité planifiée (<c1/>) : les créneaux d'une zone d'essai deviennent des événements de confiance du récepteur avec l'identifiant du catalogue et l'année dans chaque libellé. Des créneaux planifiés, non des heures d'émission enregistrées ; aucun champ de contact du plan n'est lu. MODELLED. Voir <a1><c2/></a1>.

# text
# c1: kshana jammertest score
# c2: log
# c3: ubx
# c4: sbf
# c5: log_base64
seg-23daf6121ca0 = Note un journal de récepteur par rapport à ce calendrier (<c1/>) : par essai, la latence de détection, les alarmes manquées et le temps de rétablissement, et les fausses alarmes en dehors de tous les créneaux. Journaux texte sous forme de <c2/>, binaires (<c3/>, <c4/>) sous forme de <c5/>. Un paquet signé exige une clé : ligne de commande. À titre consultatif seulement ; MODELLED.

# text
# c1: kshana receiver-trust evidence
# c2: docs/EVIDENCE-PACKS.md
seg-0ca5b319e850 = Un paquet de preuves signé pour une fenêtre du journal d'un navire (<c1/>) : les octets bruts du journal pour la fenêtre, la configuration, les résultats et raisons par époque, une page de résumé, et un manifeste avec chaque SHA-256 et une chaîne de hachage, signé avec Ed25519. La graine de signature n'est jamais renvoyée ni journalisée ; sans graine, une clé à usage unique est utilisée, de sorte que le paquet prouve l'intégrité, non l'identité. Un enregistrement technique, non un avis juridique. Voir <a1><c2/></a1>.

# text
# c1: .tsr
# c2: kshana evidence attach-timestamp
# c3: openssl ts -verify
seg-8df4c6fb851d = Lie un jeton d'horodatage RFC { "3161" } (base64 des octets <c1/>) à un paquet, en mémoire (<c2/>) ; le paquet avec le jeton doit encore se vérifier. La signature de l'autorité d'horodatage n'est pas vérifiée : utilisez <c3/>.

# text
# c1: kshana evidence verify
# c2: verdict
# c3: verified
# c4: intact-signer-not-pinned
# c5: failed
# c6: require_timestamp
seg-1f7a6f7f005a = Vérifie un paquet (<c1/>) : chaque condensat, la chaîne, la signature, et avec la clé publique du signataire et le journal complet, qui l'a signé et que l'extrait provient de ce journal. Nomme chaque échec et chaque fichier. Le <c2/> vaut <c3/> (signataire épinglé), <c4/> (tout se vérifie mais aucune clé publique n'a été donnée, de sorte que le signataire n'est pas établi) ou <c5/> ; <c6/> fait échouer un paquet sans jeton d'horodatage.

# text
# c1: nmea-scenario
# c2: kshana-nmea-training/1
seg-c43761e01f63 = NMEA { "0183" } synthétique de passerelle pour la formation d'équipage à partir d'un TOML <c1/> (brouillage, entraînement de position, leurrage de l'heure, retard de rejeu) avec le journal de l'instructeur (<c2/>) ; déterministe par graine. Texte seulement : rien n'est synthétisé en RF ou IQ et rien n'est émis ; jamais pour les systèmes de navigation en direct d'un navire. La réponse porte les { "2000" } premières lignes.

# text
# c1: kshana-interference-map/v1
# c2: docs/INTERFERENCE-MAP.md
seg-8aec8f61dab2 = Une carte des interférences GNSS à partir de rapports de position ADS-B ou AIS en texte CSV (au plus { "4" } Mio) : un GeoJSON <c1/> par jour UTC, agrégé seulement (aucun identifiant, cellules de moins de { "5" } aéronefs ou navires distincts retenues), avec la licence du jeu de données incorporée. Une cellule degraded n'identifie pas une interférence comme cause ; non une prévision. MODELLED. Voir <a1><c2/></a1>.

# text
# c1: kshana bench-export
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: docs/TEST-BENCH.md
seg-d5959e4f1c96 = Le mouvement du véhicule et les événements d'un scénario pour un simulateur GNSS de laboratoire (<c1/>) : CSV et JSON de mouvement, NMEA, points de cheminement et événements en texte, rien n'est écrit sur disque. Types <c2/>, <c3/>, <c4/>. Aucun signal : rien de ce qui est exporté n'est, ne modélise ni ne pilote un signal radiofréquence ou en bande de base ; le simulateur et son opérateur fournissent les signaux. Voir <a1><c5/></a1>.

# text
# c1: kshana evidence round-trip
# c2: kshana.test-conditions/1
seg-1076916237f0 = Le paquet signé d'aller-retour de laboratoire (<c1/>) : le scénario, le document <a1><c2/></a1> du laboratoire, le journal du récepteur et son score par rapport aux événements déclarés, liés par condensat. Refuse des conditions et des événements de notation qui ne concordent pas. Aucun signal ; un enregistrement technique, non une certification.

# text
# c1: kshana iq sweep
seg-9e1df2016cd7 = Rejoue un enregistrement IQ du répertoire de travail à travers plusieurs conceptions de boucle de poursuite (<c1/>) : par conception et par PRN, la gigue de phase et de code en régime établi, les fractions d'accrochage et le C/N0 moyen. Au plus { "256" } canaux (conception, PRN) par appel ; l'intervalle doit tenir dans le budget d'échantillons.

# text
# c1: kshana iq monitor
seg-a5af1743f993 = Exécute les moniteurs de détection d'interférence et de leurrage sur un enregistrement IQ du répertoire de travail (<c1/>) : moniteurs de puissance large bande et spectraux et moniteurs de C/N0 et de qualité du signal par satellite par rapport à une référence de base apprise. Noms et longueurs des séries et jusqu'à { "200" } événements dans la réponse ; le rapport complet sur demande sous forme de fichiers. Un événement dit qu'une grandeur mesurée a quitté sa référence de base, non pourquoi. MODELLED.

# text
# c1: kshana iq labfit
# c2: iq-labfit
# c3: text
# c4: base64
# c5: path
seg-c9c9c909c621 = Ajuste le modèle de perte d'accrochage de la boucle de poursuite à des exécutions de laboratoire (<c1/>) à partir d'un scénario <c2/> dont les journaux sont en ligne (<c3/> ou <c4/> ; un <c5/> est refusé). Ne lit ni n'écrit aucun fichier. MODELLED.

# text
# c1: kshana.test-conditions/1
seg-4f231cd18d37 = Valide un fichier <c1/> fourni sous forme de texte et renvoie les conditions résolues avec leur condensat. En ligne seulement.

# text
# c1: kshana compliance-report
# c2: runs
# c3: {label, result, scenario?}
# c4: statement
# c5: docs/compliance/
seg-2851f2858910 = La correspondance avec les cadres publics, remplie à partir de documents de résultats fournis sous forme de texte (<c1/>) : quelles lignes de six cadres et normes de résilience (cadre DHS Resilient PNT des États-Unis v2.0, OMI navires, EASA aviation, NIS2 article { "21" }, EN { "16803" }, NIST IR 8323r1) les exécutions apportent des éléments de preuve en faveur de, lesquelles non, et l'écart de chaque ligne. Prend <c2/> de <c3/> (au plus { "64" }, { "4" } Mio au total). Un statut dit que les exécutions apportent des éléments de preuve en faveur des capacités de la ligne ; ce n'est pas un constat qu'un cadre est satisfait ni une évaluation ou une approbation d'un produit quelconque. Le <c4/> est renvoyé avec chaque rapport ; affichez-le tel quel. MODELLED. Voir <a1><c5/></a1>.

# text
# c1: sources
seg-0a5161ddea94 = Les tables de correspondance statiques (ou, avec <c1/>, les documents sources qu'elles citent avec versions et URL) en Markdown, précédées de la même déclaration. N'exige aucune exécution.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-ffcc6c72dc1e = Un flux de confiance (lignes JSON) ou un résultat <c1/> rendu en texte Prometheus, en lignes syslog CEF ou LEEF, en charge utile JSON OTLP ou en lignes de découverte et d'état MQTT de Home Assistant, avec les encodeurs <c2/>. Texte dans la réponse : rien n'est envoyé ni servi et aucune horloge n'est lue. À titre consultatif seulement.

# text
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
# c4: kshana imu-fit
seg-2b82a8a22298 = Paramètres d'accéléromètre et de gyroscope des scénarios <c1/> et <c2/> ajustés à partir d'un journal d'IMU immobile (CSV ou EuRoC) par écart-type d'Allan, avec une table <c3/> prête à coller et le SHA-256 du journal (<c4/>). Texte en entrée, JSON en sortie ; MODELLED.

# text
# c1: kshana standards-pack list
seg-30d5bb6b34cb = Les paquets de normes (<c1/>) : des jeux de scénarios notés pour les profils d'essai du cadre DHS Resilient PNT (niveaux { "1" } à { "4" }), l'OMI MSC.1/Circ.1575 et l'OACI Doc { "9849" } Appendice F.

# text
# c1: kshana standards-pack run
# c2: MET
# c3: NOT MET
# c4: NEEDS INPUT
# c5: compliance_report
seg-767a05e5df9f = Un paquet exécuté par rapport à ses seuils fixés avant l'exécution (<c1/>) : chaque essai <c2/>, <c3/> ou <c4/>, avec les valeurs mesurées et attendues ; donnez le rapport à <c5/> pour voir les lignes. MODELLED ; n'évalue aucun produit.

# text
# c1: spec
# c2: symbols
# c3: generate
seg-74110e6b530f = Le signal direct augmenté LunaNet vérifié par rapport à LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } janvier { "2025" }) : <c1/> (l'implémentation par rapport aux tables de codes imprimées du document et à ses exemples résolus), <c2/> (un flux de symboles : motif de synchronisation, SB1, FID, continuité du TOI) ou <c3/> (un flux d'essai). LDPC et CRC-24Q des sous-trames { "2" } à { "4" } ne sont pas vérifiés ; aucun signal n'est écrit.

# text
# c1: kshana bench score
# c2: bench/SPEC.md
seg-b6abad1f2c9d = Une soumission kshana-bench notée par rapport à un fichier de vérité, tous deux en texte JSON (<c1/>, <c2/>) : le fichier de résultat avec la version de la spécification, la partition, les condensats d'entrée et les métriques de la tâche. MODELLED ; décrit un journal ou un corpus, jamais un produit.

# text
seg-c7a0d7981bfd = Fichiers de résultats kshana-bench rendus sous forme de page de classement statique (texte HTML), chacun validé d'abord.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-1ec7117c7825 = Un flux de confiance (lignes JSON) ou un résultat <c1/> rendu en texte Prometheus, en lignes syslog CEF ou LEEF ou en charge utile JSON OTLP, avec les encodeurs <c2/>. Texte dans la réponse : rien n'est envoyé ni servi et aucune horloge n'est lue. À titre consultatif seulement.

# text
seg-0fc2e3928768 = La part de la longueur d'un itinéraire située dans des cellules degraded, not-degraded, non évaluées et non observées d'une ou plusieurs cartes d'interférence, éventuellement dans une plage de dates. Les cellules non observées ne sont pas une preuve que l'itinéraire est dégagé.

# text
seg-62756ba18cf5 = La configuration de la couche IQ GNSS : les noms de signaux que les outils IQ acceptent, si les outils de fichiers IQ sont activés, le répertoire de travail et le budget d'échantillons par appel. Appelez-la en premier.

# text
# c1: kshana iq info
seg-98939638409f = Décrit un enregistrement IQ (en phase et en quadrature) du répertoire de travail sans le traiter : format, fréquence d'échantillonnage, fréquence centrale, échantillons, durée, fichiers de données et tailles (<c1/>).

# text
# c1: kshana iq scene
seg-c529b1a7ee53 = Génère une scène IQ GNSS multi-satellites dans le répertoire de travail (<c1/>) : profils Doppler/C/N0 déclarés, ou véritable géométrie d'éphéméride diffusée à partir d'un fichier de navigation RINEX, avec un canal de propagation facultatif au niveau du signal. Répond avec les fichiers écrits et leur nombre d'octets et la première époque de la vérité par satellite.

# text
# c1: kshana iq acquire
# c2: surface_out
seg-0c6f5e26367f = Acquisition par FFT (transformée de Fourier rapide) d'un ou plusieurs PRN (codes de bruit pseudo-aléatoire) sur un enregistrement (<c1/>), éventuellement derrière des étages frontaux : par PRN, acquis ou non, Doppler, phase du code, statistique de pic et seuil ; <c2/> (un PRN) conserve toute la surface de corrélation Doppler × phase du code avec des raffinements fins du Doppler.

# text
# c1: kshana iq track
# c2: kshana.loop-design/1
# c3: design
# c4: reacquire
# c5: epochs_out
# c6: events_out
seg-1da73ad326de = Acquiert, puis poursuit avec l'ensemble de DLL/PLL/FLL (boucles à verrouillage de délai, de phase et de fréquence) (<c1/>), avec les boucles d'un fichier TOML <c2/> du répertoire de travail (<c3/>) ou la conception intégrée, et une réacquisition facultative (<c4/>) : par canal, époques, Doppler final, C/N0 final et moyen, fractions de verrouillage de phase et de code, verrouillé à la fin, l'état de verrouillage final, faux verrouillages et réacquisitions, plus le nom et le condensat de la conception. La poursuite se fait en flux dans une mémoire bornée ; la sortie par époque va uniquement dans des fichiers (<c5/> : E/P/L, discriminateurs, états des boucles, C/N0, état de verrouillage en .csv/.jsonl/.bin ; <c6/>).

# text
# c1: kshana iq frontend
seg-262bb9c592c0 = Applique le DSP frontal de récepteur et d'atténuation des interférences (traitement numérique du signal : passe-bande, réjecteur, blanking, excision, AGC, quantificateur) à un enregistrement et en écrit un nouveau (<c1/>).

# text
# c1: kshana iq campaign
# c2: max_cells
seg-cf33e101b144 = Exécute une campagne de rejeu de laboratoire (<c1/>) : des enregistrements, chacun avec un fichier de conditions d'essai énonçant la vérité connue du laboratoire, × chaînes frontales × conceptions de boucle. Chaque cellule est notée pour le temps jusqu'à la perte d'accrochage, le temps de réacquisition, la dégradation du C/N0 par rapport au J/S déclaré (à côté d'une référence analytique étiquetée MODELLED), le taux de faux verrouillage, la gigue PLL/DLL et la disponibilité. Incrémentale et reprenable : chaque appel exécute les cellules en attente qui tiennent dans le budget d'échantillons (ou <c2/>).

# text
seg-8112428c6226 = L'avancement du dossier de sortie d'une campagne : cellules terminées et en attente, et le condensat une fois terminée. Ne lit que des fichiers.

# text
# c1: kshana
seg-8bd76f017ae4 = Chaque outil est une enveloppe mince et fidèle d'une fonction publique de la bibliothèque <c1/> : aucune nouvelle logique de simulation ne vit ici, de sorte qu'un agent exécute exactement le moteur validé.

# text
seg-b37bbaf38900 = Les outils IQ GNSS : fichiers en entrée, JSON compact en sortie

# text
# c1: iq_*
seg-ecf2ec0eb66d = Les enregistrements IQ atteignent des gigaoctets, de sorte que les outils <c1/> ne font jamais passer d'échantillons par le protocole. Ils suivent un seul contrat :

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: overwrite: true
seg-31a173dfe40d = <b>Un répertoire de travail.</b> Le serveur ne lit et n'écrit des fichiers IQ qu'à l'intérieur du dossier nommé par <c1/>. Chaque argument de chemin est relatif à ce dossier (un chemin absolu doit se résoudre à l'intérieur) ; les entrées sont résolues à travers les liens symboliques avant le contrôle, le dossier d'une sortie doit déjà exister à l'intérieur, et une sortie existante n'est remplacée qu'avec <c2/>. Si elle n'est pas définie, les outils de fichiers IQ sont désactivés et indiquent comment les activer ; tous les autres outils ne sont pas affectés.

# text
# c1: KSHANA_MCP_IQ_MAX_SAMPLES
# c2: cf32_le
# c3: ci16_le
# c4: ci8
# c5: cf32_le
# c6: format
# c7: max_seconds
seg-4f734b84a91a = <b>Un budget d'échantillons.</b> Un appel génère ou traite au plus <c1/> échantillons complexes (par défaut { "50 000 000" }). En octets, cela fait { "400" } Mo en <c2/> ({ "8" } octets par échantillon complexe), { "200" } Mo en <c3/> ({ "4" } octets) et { "100" } Mo en <c4/> ({ "2" } octets) ; une scène est écrite en <c5/> sauf si <c6/> dit autre chose. Le contrôle s'exécute avant tout travail, et le refus nomme la durée ou le <c7/> qui convient.

# text
# c1: json_out
# c2: csv_out
seg-178284ddfee0 = <b>Réponses compactes.</b> Chaque outil répond par un résumé JSON : pics d'acquisition, C/N0, état de verrouillage, et chaque fichier écrit avec son chemin et son nombre d'octets. Les tables par époque vont dans les fichiers <c1/> / <c2/> que vous nommez.

# text
seg-f375643798e9 = <b>Les arguments inconnus sont refusés</b>, non ignorés, de sorte qu'une option mal orthographiée est une erreur.

# text
# c1: kshana iq
# c2: spectrum
seg-41040247770d = Chaque outil exécute le même chemin de code que <c1/> en ligne de commande, dans le processus. La couche est purement logicielle : elle écrit des fichiers pour des récepteurs logiciels et ne pilote aucun matériel radio. La couche IQ n'ajoute aucune synthèse d'interférence ni de leurreur, et rien n'est jamais émis. (Le type de scénario distinct <c2/> peut écrire dans un fichier des instantanés IQ analytiques de brouilleur.)

# text
# c1: docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp
seg-f02d2f6bac7c = Avec l'image Docker, montez le dossier et pointez la variable vers lui : <c1/>.

# text
seg-721079aa25e7 = Chaque type de scénario est accessible

# text
# c1: run_scenario
# c2: kind
# c3: list_scenario_kinds
seg-116ada4f4498 = <c1/> distribue selon le <c2/> du scénario, de sorte que chaque type de scénario que <c3/> nomme passe par lui. Cela comprend les familles plus récentes, chacune avec des exemples fournis qu'un agent peut récupérer :

# text
seg-c7047f5750a9 = Un exemple pour commencer

# text
seg-b45752760eca = Le système solaire

# text
seg-1ccf38ab6e24 = Campagnes : phases enchaînées, balayages, Monte Carlo (ensembles aléatoires à graine), composition

# text
seg-67fe14962e1c = Navigation en orbite terrestre basse (LEO) : conception du signal

# text
seg-c555e5b73203 = Navigation LEO : bilan de liaison d'un passage

# text
seg-67de12cac6f0 = Navigation LEO : message de navigation

# text
seg-b8badd962245 = Navigation LEO : positionnement et synchronisation temporelle fusionnés

# text
# c1: list_example_scenarios
# c2: kind
# c3: animate_scenario
# c4: report_scenario
# c5: export_interop
seg-0561cfd970d8 = <c1/> avec un <c2/> nomme chaque exemple fourni de ce type de scénario. Les animations, les rapports et les exports d'interopérabilité ne sont pas des types de scénario : ce sont des vues d'une exécution, et <c3/>, <c4/> et <c5/> les renvoient pour tout scénario auquel ils s'appliquent.

# text
# c1: kshana --study <suite.toml>
# c2: run_scenario
seg-62d106ca4a89 = Non servies : les suites d'étude (<c1/>), car une suite nomme des fichiers de scénario frères sur disque et les outils de scénario ne lisent aucun fichier. Exécutez chaque membre avec <c2/>. (Les outils IQ lisent et écrivent bien des fichiers, à l'intérieur de leur seul répertoire de travail.)

# text
seg-57f592bb676b = Installer le serveur MCP

# text
seg-77fc92e21295 = Un passage nommant des clients d'IA tiers est omis ici ; il figure dans <a1>mcp/kshana-mcp/README.md</a1> sur GitHub.

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-9ec78559983f = <c1/>, auto-hébergé : voir <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

# text
seg-b32b9d4e0f8b = Depuis une copie de travail ou git (développement) :

# text
seg-73a73af88f08 = Mode HTTP (auto-hébergé)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
# c2: /mcp
# c3: --allow-remote
# c4: KSHANA_MCP_HTTP_TOKEN
seg-4f248ed3e597 = <c1/> sert les mêmes outils via streamable HTTP sur <c2/>. Il se lie uniquement au bouclage local ; une adresse hors bouclage exige <c3/> et un jeton porteur dans <c4/> ; les outils de fichiers IQ sont désactivés ; la taille des requêtes, la durée et la concurrence sont plafonnées ; aucun en-tête CORS n'est envoyé. Kshana n'héberge aucun point d'accès : vous l'auto-hébergez. Voir <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: cargo install
# c2: kshana-mcp
# c3: PATH
# c4: ~/.cargo/bin/kshana-mcp
# c5: rmcp
# c6: kshana
seg-60f55b197ac2 = <c1/> place <c2/> dans votre <c3/> (typiquement <c4/>). Le serveur parle JSON-RPC (appel de procédure distante JSON) via stdio ; les journaux vont sur stderr. La compilation depuis les sources exige une chaîne d'outils Rust ≥ { "1.88" } (le SDK <c5/> { "2" }.x corrigé l'exige ; la bibliothèque <c6/> elle-même n'exige que { "1.85" }) ; l'image Docker n'en exige aucune.

# text
seg-2f3216082425 = L'enregistrer auprès d'un client

# text
# c1: mcpServers
# c2: kshana-mcp
seg-1090ae3f689c = Pratiquement tous les clients MCP utilisent le même bloc de configuration <c1/> : enregistrez le binaire <c2/> par chemin absolu :

# text
# c1: PATH
seg-2da393482666 = Ou, avec l'image Docker au lieu d'un binaire local (aucun <c1/> nécessaire) :

# text
seg-a4f1295bb27a = L'emplacement de ce bloc dépend du client :

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-154c7e09063d = <b>Cursor</b> : <c1/> (global) ou <c2/> (par projet).

# text
seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> : Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, collez le bloc, puis redémarrez complètement l'IDE (environnement de développement intégré).

# text
# c1: …_config.json
# c2: mcpServers
seg-daf0ea451b11 = <b>Assistants de bureau</b> : la plupart utilisent un <c1/> avec la même forme <c2/> ; consultez la documentation de votre client pour l'emplacement du fichier.

# text
# c1: mcp add
# c2: mcp.json
seg-fc80286aa9bf = <b>Agents en ligne de commande</b> : beaucoup acceptent le même JSON via un mécanisme <c1/> / <c2/>.

# text
# c1: RUST_LOG=debug
# c2: env
seg-9f3ef8d76e05 = Utilisez toujours un chemin absolu vers le binaire. Définissez <c1/> dans <c2/> pour diagnostiquer (les diagnostics vont sur stderr ; stdout est réservé au protocole JSON-RPC).

# text
seg-283d1eba838a = Essayez

# text
seg-61739e9b6515 = Une fois l'enregistrement fait, demandez à votre assistant des choses comme :

# text
# c1: list_scenario_kinds
seg-256276ac933d = <em>« Liste les types de scénario de Kshana. »</em> → <c1/>

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: run_scenario
seg-2a8e3c76b939 = <em>« Montre-moi un exemple spectrum de Kshana et exécute-le. »</em> → <c1/>, <c2/>, <c3/>

# text
# c1: run_scenario
seg-d2e1e4148589 = <em>« Exécute le scénario clock-holdover de Kshana avec un seuil de { "20" } ns et une panne GNSS de 2 heures ; quel est le holdover quantique par rapport au holdover classique ? »</em> → <c1/>

# text
# c1: export_sp3
seg-f4b83873e280 = <em>« Exporte cette constellation GPS (Global Positioning System) en SP3. »</em> → <c1/>

# text
# c1: export_table_csv
seg-54e01c1af45f = <em>« Donne-moi la table realtime-frame-eop en CSV. »</em> → <c1/>

# text
# c1: list_export_formats
# c2: export_interop
seg-478e6fa0e8d8 = <em>« Place ce passage d'Iridium sur un globe Cesium. »</em> → <c1/>, <c2/>

# text
# c1: animate_scenario
seg-90829388d5d9 = <em>« Anime la campagne de brouillage. »</em> → <c1/>

# text
# c1: report_scenario
seg-9eb1b97ad2fd = <em>« Donne-moi le rapport de cette exécution, avec son enregistrement de reproductibilité. »</em> → <c1/>

# text
# c1: iq_signals
# c2: iq_scene
# c3: iq_acquire
# c4: iq_track
seg-dc60d64a3bb8 = <em>« Fabrique une scène GPS L1 d'une seconde avec les PRN { "3" } et { "17" }, puis acquiers-la et poursuis-la. »</em> → <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-942dc8abe0ec = Note de conception : pourquoi un crate distinct

# text
# c1: Cargo.lock
# c2: rmcp
# c3: kshana
# c4: rmcp
# c5: rmcp
# c6: cargo deny
# c7: xval/anise-frames
seg-ce6d0ecab448 = Le serveur est un <b>crate autonome, exclu de l'espace de travail</b>, avec son propre <c1/>, de sorte que le SDK Rust MCP officiel (kit de développement logiciel) <c2/> et son environnement d'exécution asynchrone n'entrent jamais dans le graphe de dépendances du crate <c3/> publié : un utilisateur de la bibliothèque ou de Python ne compile pas un serveur qu'il n'exécute pas. (Il a d'abord été séparé parce que <c4/> est en <b>édition { "2024" }</b>, ce qui exige rustc ≥ { "1.85" }, alors que le crate principal promettait alors { "1.75" }. La bibliothèque déclare désormais { "1.85" } ; ce serveur déclare { "1.88" }, le plancher de <c5/> { "2" }.x corrigé pour la sécurité.) L'intégration continue (CI) contrôle ce crate à part : tests et <c6/> sur son fichier de verrouillage. L'arbre des licences de rmcp est propre (Apache-2.0/MIT/BSD) ; ainsi, contrairement au crate de validation croisée <c7/> qu'il reproduit par ailleurs, la séparation ne tient pas à la licence.

# text
seg-75bf2d74642d = Licence : AGPL-3.0-only, la GNU Affero General Public License version { "3" } seulement (ou une licence commerciale d'Ashforde OÜ ; voir le <a1>LICENSING.md</a1> du dépôt).

# text
seg-490ebbefb561 = <s1>Précédent</s1>Crate Rust

# text
seg-350b6b914734 = <s1>Suivant</s1>Serveur MCP : tous les canaux d'installation
