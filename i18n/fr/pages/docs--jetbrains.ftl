# docs--jetbrains: translations (fr)

# text
# c1: ide/jetbrains/README.md
seg-f8a0fe9968c4 = Source : <c1/>

# text
seg-c55e49fd2a72 = Kshana pour les IDE JetBrains

# text
seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> sur la JetBrains Marketplace</a1> — ou, dans tout IDE JetBrains, <em>Settings → Plugins → Marketplace → rechercher « Kshana »</em>.

# text
# c1: .toml
seg-959ab829762c = Un plugin natif qui exécute le simulateur de résilience PNT <b>Kshana</b> depuis n'importe quel IDE JetBrains (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Clic droit sur un scénario <c1/> → <b>Run Kshana Scenario</b> ; les indicateurs de performance et le JSON de résultat s'affichent en continu dans la fenêtre d'outils <b>Kshana</b>.

# text
seg-594199d2ce06 = Complète le <a1>serveur MCP</a1> (qui donne à l'<em>AI Assistant</em> de JetBrains l'accès à Kshana) : ce plugin est la voie <em>humaine</em>, au pointer-cliquer.

# text
# c1: .toml
# c2: kshana <file>
seg-a356f2c30afb = Action <b>Run Kshana Scenario</b> sur tout <c1/> (menus contextuels de l'éditeur et de la vue du projet) — exécute <c2/> et affiche la sortie dans la fenêtre d'outils Kshana.

# text
# c1: receiver-trust
# c2: .toml
# c3: kshana receiver-trust
seg-116d04ae5538 = <b>Assess Receiver Trust</b> sur un scénario <c1/> <c2/> (<c3/>) : la chronologie de confiance, avec un score de 0 à 100 et les raisons pour un navire. Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC { "61108" }, IEC { "61162" }) : l'opérateur reste responsable de la navigation du navire.

# text
# c1: nmea-scenario
# c2: .toml
# c3: kshana nmea-scenario
seg-726d88d0dea7 = <b>Generate Training NMEA</b> sur un <c1/> <c2/> (<c3/>) : du NMEA de passerelle synthétique et un journal d'instructeur, écrits à côté du scénario. Texte seulement ; pour l'entraînement, jamais pour les systèmes de navigation réels d'un navire.

# text
# c1: .csv
seg-99510426a384 = <b>Build Interference Map</b> sur un <c1/> ADS-B ou AIS (vue du projet ; demande de quel jeu de données approuvé il s'agit) et <b>Route Exposure</b> sur un fichier d'itinéraire (demande le dossier de cartes). Une cellule dégradée n'identifie pas l'interférence comme cause ; ce n'est pas une prévision.

# text
# c1: .toml
# c2: kshana bench-export
seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> sur un scénario <c1/> (<c2/>) : mouvement du véhicule, NMEA et événements étiquetés pour un simulateur GNSS de laboratoire, écrits à côté du scénario. Il n'écrit aucun signal ; n'exécutez un simulateur que là où c'est autorisé.

# text
# c1: .json
# c2: kshana compliance-report
# c3: kshana compliance-report --mapping
seg-79c553c303c5 = <b>Build Compliance Report</b> sur un résultat d'exécution <c1/> (<c2/>) et <b>Tools → Show Compliance Mapping</b> (<c3/>) : la correspondance avec le cadre public, affichée avec la propre déclaration du moteur mot pour mot.

# text
# c1: kshana evidence verify
# c2: .pub
seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> sur un dossier de paquet de preuves (vue du projet ; <c1/>) : demande la clé publique du signataire ({ "64" } chiffres hexadécimaux ou un fichier <c2/> ; toujours épinglée, le plugin n'accepte jamais un signataire non épinglé) et facultativement le journal de session complet. Seul un résultat vérifié est présenté comme vérifié ; un paquet intact avec un signataire non épinglé est présenté comme « NOT VERIFIED ».

# text
# c1: receiver-trust
# c2: .json
# c3: kshana trust-telemetry --result
seg-253d5b7f94ce = <b>Render Trust Telemetry</b> sur un résultat <c1/> <c2/> (<c3/>) : du texte Prometheus, des événements syslog CEF/LEEF ou des lignes MQTT Home Assistant affichés dans la fenêtre Kshana. Rien n'est envoyé ni servi ; les exportateurs en cours d'exécution restent en ligne de commande.

# text
# c1: .csv
# c2: kshana imu-fit
# c3: hybrid
# c4: fusion
# c5: [accel_classical]
seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> sur un <c1/> IMU stationnaire (<c2/>) : les paramètres d'accéléromètre et de gyroscope des scénarios <c3/> et <c4/> ajustés par la déviation d'Allan, affichés dans la fenêtre Kshana sous forme de tableau <c5/>. Rien n'est écrit ; l'ajustement est MODELLED.

# text
# c1: kshana --validate
# c2: kshana kinds
# c3: .toml
# c4: kshana receiver-trust live --file
seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menu Tools ; <c2/>) et <b>Assess Receiver Stream</b> (une session de navire <c3/> plus un journal NMEA enregistré que vous choisissez ; <c4/>, noté une fois sans socket ni barrière).

# text
# c1: kshana example
# c2: .toml
# c3: .toml
# c4: .geojson
seg-38037d36639c = <b>Insert Example Scenario</b> (dossier de la vue du projet ou menu Tools ; <c1/>) : choisissez un scénario fourni et il est écrit comme un nouveau <c2/> (jamais par-dessus un fichier). <b>Export Scenario</b> sur un <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF ; sortie simulée uniquement), <b>Animate Scenario</b> (HTML ou SVG, ouvert dans le navigateur) et <b>Import Route</b> sur un <c4/> d'itinéraire (demande quel scénario).

# text
# c1: .toml
# c2: kshana receiver-trust evidence
# c3: kshana evidence keygen
# c4: kshana evidence attach-timestamp
# c5: openssl ts -verify
seg-1f1b18f8e102 = <b>Create Evidence Pack</b> sur une session de confiance du récepteur <c1/> (<c2/>) : demande la fenêtre, un fichier de clé de signature que vous possédez déjà, et le dossier de sortie. Le plugin ne crée, ne lit ni ne stocke jamais de clé (<c3/> reste en ligne de commande). <b>Attach Timestamp</b> sur un dossier de paquet (<c4/>) : Kshana ne vérifie pas la signature de l'autorité d'horodatage ; exécutez vous-même <c5/>.

# text
# c1: evidence keygen
# c2: receiver-trust live
seg-f4f6605d3db9 = Toujours en ligne de commande uniquement : les commandes IQ, <c1/> et <c2/>.

# text
seg-63efd04104f1 = Une fenêtre d'outils <b>Kshana</b> en bas qui héberge la console d'exécution.

# text
# c1: kshana receiver-trust live
# c2: kshana trust-telemetry
# c3: docs/MARITIME-TRUST.md
seg-decda07aa7eb = Pas dans le plugin : <c1/> (un processus de flux de longue durée avec une barrière et un écouteur TCP facultatif) et <c2/> restent en ligne de commande, car une action d'IDE exécute une commande jusqu'à son terme et affiche sa sortie ; voir <c3/>.

# text
# c1: kshana
# c2: PATH
# c3: cargo install kshana
seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> pour désigner le binaire <c1/> (vide → résolu depuis <c2/> ; installer avec <c3/>).

# text
seg-44dfdd65bd0a = Le plugin est purement de plateforme (aucune dépendance propre à un langage), il se charge donc dans tout IDE JetBrains de build { "243" } ({ "2024.3" }) et plus récent.

# text
seg-453bd42c23fa = Compilation et exécution

# text
seg-b5328f8c7a8a = Nécessite JDK { "17" }+ (la compilation fige JDK { "21" }) et le wrapper Gradle fourni.

# text
# c1: verifyPlugin
# c2: TYPE:VERSION
seg-758124ceb1c7 = <c1/> vérifie par défaut le since-build, { "2024.3" }. Pour vérifier d'autres lignes, listez-les sous la forme <c2/> (chaque IDE est un téléchargement d'environ { "1" } Go) :

# text
# c1: KshanaChooser
# c2: Messages.showChooseDialog
seg-15d175aaeb59 = Le plugin n'utilise aucune API de plateforme obsolète ou prévue pour suppression sur aucune de ces lignes ; il faut qu'il en reste ainsi (une boîte de dialogue de choix passe par <c1/>, et non par <c2/>).

# text
seg-39cfd740d9b3 = Installez le zip compilé via <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

# text
seg-87aff08f344c = Organisation

# text
seg-73b3f55b7208 = Isolation

# text
# c1: mcp/
# c2: xval/
# c3: kshana
# c4: /ide
# c5: exclude
seg-a14db8de576a = Comme <c1/> et <c2/>, il s'agit d'un projet Gradle autonome, exclu de la crate <c3/> publiée (<c4/> dans le <c5/> du paquet) ; sa sortie de compilation est ignorée par git.

# text
# c1: LICENSING.md
seg-b38914a430b9 = Licence : AGPL-3.0-only (ou une licence commerciale d'Ashforde OÜ — voir le <c1/> du dépôt).

# text
seg-bb286e3ce9c9 = <s1>Précédent</s1>Où chaque capacité est accessible

# text
seg-e62586b5f58c = <s1>Suivant</s1>Où Kshana s'exécute
