# docs--rust: translations (fr)

# text
seg-d4a762001549 = Licence

# text
seg-4dbf41c0ec3b = Fonction

# attr:alt
seg-81a87d14efda = Kshana : la marque, un réticule de boussole marquant l'instant précis, à côté du logotype kshana

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
seg-d1a3f78ad8e0 = Essayez d'abord sans rien installer : <a1>Kshana Studio</a1> exécute tout le moteur dans votre navigateur, compilé en WebAssembly, et ne téléverse rien.

# text
seg-2d2c47db0c1f = <b>{ "176" } sur { "388" }</b> capacités validées par rapport à des références externes indépendantes ; { "208" } honnêtement étiquetées modélisées, { "4" } détenues par un partenaire. Chaque capacité porte une étiquette dans un registre vérifié par machine : VALIDATED (une référence externe indépendante concorde : données réelles, implémentation indépendante ou vecteurs de référence publiés), MODELLED (cohérent en interne, et dit à voix haute) ou PARTNER (un partenaire matériel la détient). Parmi les vérifications : les { "666" } vecteurs SGP4 (Simplified General Perturbations { "4" }) de l'AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 à { "4.12" } mm, et le modèle de forces de Cowell à { "0.08" } m près par rapport à Orekit { "12.2" }.

# attr:alt
seg-44f7862c45a2 = Comment une capacité gagne son étiquette : capacité, référence indépendante, test, étiquette du registre. L'état de vérification sur l'ensemble des { "388" } capacités : { "176" } validées, { "208" } modélisées, { "4" } détenues par un partenaire

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
