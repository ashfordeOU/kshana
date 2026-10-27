# docs--npm: translations (fr)

# text
seg-3d770dd786e4 = Usage

# text
seg-d4a762001549 = Licence

# attr:alt
seg-81a87d14efda = Kshana : la marque, un réticule de boussole marquant l'instant précis, à côté du logotype kshana

# text
# c1: README.npm.md
seg-0ddcab84868f = Source : <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>l'instant précis</em></b><br/> Un simulateur open source pour la résilience PNT (positionnement, navigation et synchronisation temporelle).

# text
seg-3b861b2f08b8 = Version v{ $version }

# text
seg-ebe636986f46 = { "176" } capacités sur { "388" } validées par rapport à des références externes indépendantes

# text
seg-6a1906d8d4ad = Environ { "95" } % de couverture de lignes, imposée à { "85" } % en intégration continue

# text
seg-a9f4f2795fb5 = Licence : AGPL-3.0-only, ou une licence commerciale

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Répétez la minute où le GNSS s'éteint : la console de mission de Kshana, tracée à partir d'une exécution réelle du moteur, une campagne enchaînée de brouillage, de leurrage, de holdover et d'intégrité sur les { "102" } satellites de GPS, Galileo, BeiDou et GLONASS

# text
seg-d1153c5e9112 = Répétez la minute où le GNSS s'éteint

# text
seg-d284448743af = Kshana rejoue le brouillage, le leurrage et le holdover d'horloge lorsque les signaux GNSS (Global Navigation Satellite System) tombent, et vous dit combien de temps un système garde la synchronisation temporelle et la position dans son budget, et quelle horloge ou quel capteur procure le plus de marge. Voici le paquet WebAssembly : tout le moteur en JavaScript, dans le navigateur ou dans Node.js. Chaque exécution est reproductible bit pour bit à partir du scénario, de la graine et de la version du moteur.

# text
seg-d1a3f78ad8e0 = Essayez d'abord sans rien installer : <a1>Kshana Studio</a1> exécute tout le moteur dans votre navigateur, compilé en WebAssembly, et ne téléverse rien.

# text
seg-2d2c47db0c1f = <b>{ "176" } sur { "388" }</b> capacités validées par rapport à des références externes indépendantes ; { "208" } honnêtement étiquetées modélisées, { "4" } détenues par un partenaire. Chaque capacité porte une étiquette dans un registre vérifié par machine : VALIDATED (une référence externe indépendante concorde : données réelles, implémentation indépendante ou vecteurs de référence publiés), MODELLED (cohérent en interne, et dit à voix haute) ou PARTNER (un partenaire matériel la détient). Parmi les vérifications : les { "666" } vecteurs SGP4 (Simplified General Perturbations { "4" }) de l'AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 à { "4.12" } mm, et le modèle de forces de Cowell à { "0.08" } m près par rapport à Orekit { "12.2" }.

# attr:alt
seg-44f7862c45a2 = Comment une capacité gagne son étiquette : capacité, référence indépendante, test, étiquette du registre. L'état de vérification sur l'ensemble des { "388" } capacités : { "176" } validées, { "208" } modélisées, { "4" } détenues par un partenaire

# text
seg-d662055d817f = Le paquet est un module ES (ECMAScript, JavaScript standard) avec une charge WebAssembly, conçu pour le navigateur. Initialisez-le une fois, puis appelez le moteur de façon synchrone. La seule différence entre le navigateur et Node.js est la manière dont le binaire WebAssembly est chargé.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>Dans le navigateur</b> (via un bundler, ou une page qui sert <c1/>), <c2/> récupère <c3/> à côté du module :

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>Dans Node.js</b>, <c1/> échoue avec <c2/> (le <c3/> de Node ne peut pas lire un fichier local), il faut donc lire le binaire sur le disque et le transmettre à <c4/> :

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Enregistrez la version Node.js comme fichier <c1/> (ou définissez <c2/> dans votre <c3/>) pour que <c4/> fonctionne. À partir de là, les deux sont identiques :

# text
# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = TypeScript voit des résultats typés : <c1/> renvoie un <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> un <c9/> dont le <c10/> est l'union <c11/> de tous les types de scénario, et <c12/> un <c13/> (ou <c14/> en cas de succès). Les champs propres à chaque document de résultat varient selon le type de scénario ; <c15/> type l'enveloppe commune (<c16/>, <c17/>, et le bloc <c18/> de <c19/>).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Quatre autres fonctions décrivent le moteur à une interface. <c1/> renvoie un objet JSON allant du type de scénario aux modules que nomment les lignes de sa matrice de vérification, <c2/> un autre allant du type de scénario aux champs de résultat qui répondent à sa question (métadonnées d'affichage ; le moteur ne les lit jamais), <c3/> les noms de signaux qu'accepte <c4/>, et <c5/> une courte scène IQ synthétique, acquise et poursuivie en mémoire (au plus { "0.25" } s, { "1,000,000" } échantillons et { "8" } satellites), avec la même réponse que la version native.

# text
# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = Sur la face WebAssembly, chaque point d'entrée est un appel distinct : <c1/> (le document de résultat sous forme de chaîne JSON), <c2/>, <c3/>, <c4/> (la table CSV (valeurs séparées par des virgules) du scénario sous forme de chaîne, ou <c5/> pour les types de scénario qui ne publient aucune table ; elle lève une exception sur un scénario invalide), <c6/> (une exécution du moteur renvoyant <c7/> sous forme de chaîne JSON — à utiliser lorsque vous voulez plus d'une sortie, puisque chaque autre appel réexécute le scénario à neuf), <c8/> (les mêmes sorties sous forme d'un seul objet typé, avec le document déjà analysé comme <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspection ; <c14/> renvoie la liste analysée), <c15/> / <c16/> — le codec de lien partageable (URL, uniform resource locator) que <a1>Kshana Studio</a1> utilise pour faire l'aller-retour d'un scénario entier par le fragment de la barre d'adresse — et <c17/> / <c18/> / <c19/>, les artefacts d'éphéméride SP3-c (révision c du format Standard Product { "3" }) et CCSDS (Consultative Committee for Space Data Systems) — OMM, l'Orbit Mean-elements Message, et OEM, l'Orbit Ephemeris Message — que la ligne de commande écrit — et <c20/>, qui évalue un journal de récepteur réel décrit par un scénario <c21/> et renvoie <c22/> sous forme de chaîne JSON (le navigateur n'a pas de système de fichiers, de sorte que le journal, et tout fichier de navigation, doivent figurer en ligne dans le scénario sous forme de <c23/> ou de <c24/> ; une table <c25/> ajoute les moniteurs maritimes et le score de confiance de 0-100, à titre consultatif seulement), <c26/> / <c27/> (quels formats d'interopérabilité un scénario prend en charge, sans l'exécuter, et une exportation en mémoire : <c28/>, <c29/>, <c30/>, <c31/> ou <c32/> comme JSON <c33/>, identique octet pour octet pour le même scénario, rien n'est téléversé), <c34/> (un itinéraire GeoJSON écrit dans un scénario à trajectoire de points de cheminement, le <c35/> de la ligne de commande), <c36/> (la série temporelle de l'exécution sous forme de SVG animé, de lecteur HTML unique ou d'images SVG), <c37/> / <c38/> (les scénarios de référence fournis et leur TOML), <c39/> (lie un jeton RFC { "3161" } à un paquet de preuves en mémoire ; le paquet doit toujours se vérifier, et la signature de l'autorité d'horodatage n'est pas vérifiée), <c40/> (quelles données de navigation Galileo de quels satellites un fichier de pages I/NAV ou un flux UBX authentifie, avec la racine de Merkle ou les clés publiques de confiance et un temps de référence indépendant facultatif ; il authentifie des données et ne revendique aucune performance anti-leurrage ; rien n'est téléversé), <c41/> (un extrait NMEA borné évalué comme le mode actif l'évalue ; sans filtre), <c42/> (le journal NMEA d'un navire comme exécution par lots), <c43/> (un flux ou résultat de confiance sous forme de texte Prometheus, de lignes syslog CEF ou LEEF ou d'une charge OTLP ; rien n'est envoyé), <c44/> (vérifie un paquet de preuves signé ; rien n'est téléversé ; les paquets se font avec la CLI, Python ou MCP), <c45/> (le mouvement et les événements d'un scénario sous forme de texte pour un simulateur de laboratoire ; aucun signal n'est écrit), <c46/> et <c47/> (quelles lignes d'exigences d'un cadre public les documents de résultat apportent des éléments de preuve en faveur de, avec l'écart de chaque ligne ; non un constat qu'un cadre est atteint), et <c48/> (du texte CSV ADS-B ou AIS vers un GeoJSON <c49/> par jour UTC ; agrégat seulement), <c50/> (la part d'un itinéraire traversant des cellules dégradées de ces cartes ; non une prévision), <c51/> (du NMEA de passerelle synthétique et un journal de l'instructeur pour l'entraînement des équipages ; texte seulement, jamais pour les systèmes de navigation actifs d'un navire) et les fonctions de géométrie du ciel <c52/>, <c53/>, <c54/>, <c55/> et <c56/> (quels satellites un site voit lorsque des bâtiments, des quais ou le relief masquent une partie du ciel, avec la dilution de précision, l'ellipse d'erreur horizontale, un nuage de Monte-Carlo généré avec une graine et un diagramme du ciel en texte SVG ; la décision de visibilité et l'ellipse sont vérifiées par rapport à des bibliothèques indépendantes, les préréglages sont des géométries représentatives et non des relevés, et une ligne d'horizon retire les satellites en visibilité directe et rien de plus). Absents de la version navigateur : <c57/> avec son filtre et son écouteur TCP, le NMEA d'entraînement en flux continu, et les exportateurs de télémétrie (Prometheus, OpenTelemetry, syslog) sont des processus réseau de longue durée et restent dans l'outil en ligne de commande ; la création d'un paquet de preuves exige une clé de signature, qui relève de la CLI ou de Python. Il n'y a pas ici d'appel unique <c58/> ; cette liaison n'existe que sur la roue Python.

# text
seg-12a295fba8a5 = Chaque capacité de la matrice de vérification est étiquetée <b>validée</b> (vérifiée par rapport à une référence externe indépendante), <b>modélisée</b> ou <b>détenue par un partenaire</b> ; les valeurs des horloges optiques sont des objectifs spatiaux sur du matériel au sol (aucune horloge optique au strontium n'a volé). La maturité n'est <em>pas</em> uniforme selon les domaines — le PNT terrestre est validé par rapport à des données réelles ; la navigation en espace lointain et sur Mars est modélisée, seuls ses éléments constitutifs (temps de lumière, positions des planètes) étant validés par rapport à des références externes ; la détermination d'orbite (OD) de missions réelles en espace lointain figure sur la feuille de route.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = Le moteur compte { "87" } types de scénario ; <c1/> les liste avec leurs champs. Nouveau dans { "0.38.0" } : <c2/> (signaux GNSS pour des engins spatiaux au-dessus, autour et au-delà des orbites GNSS) et <c3/> (orbite et surface lunaires comme infrastructure de navigation et géodésique), tous deux MODELLED, et <c4/> (un enregistrement d'erreur de temps par rapport aux masques de l'UIT-T).

# text
seg-68ed88ec0b32 = <b>Spectre</b> : comment un brouilleur prend la bande L du GNSS, bande par bande.

# text
seg-f04a0aeeee33 = <b>Horloges et synchronisation temporelle</b> : holdover par rapport à un seuil, transfert de temps, et holdover télécom par rapport aux masques du secteur de la normalisation de l'Union internationale des télécommunications (UIT-T).

# text
seg-7e38ac603ef2 = <b>Constellations autour de n'importe quel corps</b> : couverture, dilution de précision et disponibilité autour de la Terre, de la Lune ou de Mars, et le système solaire à une époque.

# text
seg-82708b06dcc6 = <b>Navigation en orbite terrestre basse</b> : signal, passage et liaison, message de navigation, et position fusionnée, étape par étape.

# text
seg-e21e9bb02d00 = <b>Campagnes</b> : une mission enchaînée, un balayage ou un ensemble de Monte-Carlo dans un seul scénario.

# text
seg-ba5057da54e4 = <b>Rapports, animation et exportations</b> : chaque valeur avec son unité et son étiquette ; un dessin animé d'une exécution ; des fichiers SP3 (Standard Product { "3" }), des messages d'orbite CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) et SigMF (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Un moteur ouvert au centre, kshana { $version }, avec une répartition typée sur { "75" } types de scénario ; autour de lui, la ligne de commande, la bibliothèque Rust, Python, WebAssembly et Kshana Studio, le serveur MCP, l'image Docker et le greffon JetBrains ; en dessous, Kshana Pro, une surcouche propriétaire qui dépend du moteur ouvert et ne le fork jamais

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = Le même fichier de scénario donne les mêmes octets sur chaque interface. MCP est le Model Context Protocol : <a1><c1/></a1> permet à un assistant d'IA (intelligence artificielle) d'exécuter le moteur.

# text
seg-f51b0a8cd30e = Six articles sur arXiv reposent sur le moteur ouvert, chacun avec la commande qui le sous-tend : <a1>arXiv:{ "2606.22054" }</a1> (l'écart d'optimisme des détecteurs d'interférence), <a2>arXiv:{ "2606.24210" }</a2> (un niveau de protection conditionnel de la synchronisation temporelle), <a3>arXiv:{ "2607.05415" }</a3> (la stabilité d'un score de résilience PNT), <a4>arXiv:{ "2607.02566" }</a4> (l'observabilité des stations de surface lunaire par interférométrie à très longue base), <a5>arXiv:{ "2607.06212" }</a5> (géométrie polaire sud lunaire et balises de surface) et <a6>arXiv:{ "2610.23871" }</a6> (la navigation cislunaire comme problème d'observabilité : longueur d'arc, conditionnement du gramien et effet de levier Doppler). Voir <a7>Recherche</a7>.

# text
seg-dad7832bf2d2 = Tout le moteur est libre sous l'AGPL-3.0. Kshana Pro, une surcouche propriétaire qui dépend du moteur ouvert et ne le fork jamais, et des études sur mesure sont disponibles sous contrat auprès d'Ashforde® OÜ : <a1>contact@ashforde.org</a1>. Il n'y a pas de tarifs ; voir <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = En savoir plus

# text
seg-0e8320f8ea91 = <b>Le README complet</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (le moteur dans votre navigateur, en WebAssembly) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Capacités</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validation et provenance</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Matrice de vérification</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Citer</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Libre et open source sous la <b>GNU AGPL-3.0-only</b> (la GNU Affero General Public License, version { "3" } seulement). Une <b>licence commerciale</b> est disponible auprès d'<a1>Ashforde® OÜ</a1> (une société estonienne à responsabilité limitée ; OÜ = osaühing) pour une intégration fermée ; voir <a2>LICENSING.md</a2>. Développé et maintenu de façon professionnelle par Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Précédent</s1>API Python

# text
seg-8af548581ae9 = <s1>Suivant</s1>Crate Rust
