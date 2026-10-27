# docs--example-multi-tool: translations (fr)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Source : <c1/>

# text
seg-42e93cd44e94 = Exemple détaillé — Kshana comme couche de liaison d'analyse de mission multi-outils

# text
# c1: label
seg-286cf0e7bb71 = Cet exemple suit une trajectoire à travers les types de scénario d'interopérabilité fondée sur des normes et d'analyse de mission, de bout en bout, en montrant comment Kshana se place <em>entre</em> les outils haute fidélité qu'un programme utilise déjà plutôt que de les concurrencer : GMAT (le General Mission Analysis Tool), Orekit et STK (Systems Tool Kit) pour la conception de trajectoire, et Basilisk ou { "42" } pour la simulation du système de contrôle d'attitude et d'orbite (AOCS). Chaque étape est un type de scénario exécutable, et chaque résultat porte un <c1/> indiquant sa portée et son niveau de preuve.

# text
# c1: label
seg-7198d05bece6 = Mise au point d'honnêteté : il s'agit d'une chaîne <em>géométrique/analytique</em> au niveau pré-phase A / étude de compromis (avant la première phase formelle de conception d'une mission). Ce n'est pas une certification de dynamique de vol ; voir le champ <c1/> de chaque type de scénario.

# text
seg-70c18138497b = Autres abréviations utilisées ci-dessous : FDS (système de dynamique de vol), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, le propagateur à éléments à deux lignes), TOML (le format de fichier de scénario) et CLI (interface en ligne de commande).

# text
seg-7cc0d4d15c4a = La chaîne d'outils

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = Les étapes sont des exécutions séparées : chacune prend ses entrées dans son propre fichier de scénario ; vous reportez donc une valeur de l'une à la suivante (par exemple une distance oblique de <c1/> vers <c2/>) en modifiant le fichier suivant. Le type de scénario <c3/> peut contenir plusieurs types de scénario dans une même exécution sous des conditions partagées ; voir <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Chaque commande ci-dessous est exécutée depuis la racine du dépôt, et le résumé qui la suit est la première ligne que kshana { $version } affiche pour le scénario fourni.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Ingérer la trajectoire produite par un concepteur (<c1/>)

# text
seg-4b732dd54291 = GMAT, Orekit et STK <em>exportent</em> tous des messages d'éphémérides d'orbite CCSDS (OEM). Kshana les importe (l'autre sens du pont), de sorte qu'une analyse Kshana peut partir de l'orbite exacte validée par le concepteur de trajectoire, et non d'une approximation recalculée :

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = Il indique les segments, les objets, les référentiels et l'étendue des époques, ainsi qu'un contrôle de cohérence des vitesses, ce qui montre que l'éphéméride a été ingérée fidèlement (erreur d'aller-retour inférieure à { "1" }×{ "10" }⁻⁶ km). Avec un fichier externe dans <c1/> à la place, il indique ce qu'il a analysé : alimenté avec l'OEM qu'écrit <c2/>, il affiche <c3/>. Le <c4/> précise explicitement qu'il s'agit d'un contrôle d'ingestion structurel et physique, et non d'une validation de l'exactitude d'orbite de la source.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. Quand est-elle visible depuis une station au sol ? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Prédit les passages (lever/coucher) au-dessus d'une station, au-dessus d'un masque d'élévation : acquisition du signal (AOS), instant de plus courte distance (TCA), perte du signal (LOS), élévation maximale et durée, ainsi que le temps d'accès total. C'est la requête de planification du segment sol. L'orbite est un jeu d'éléments SGP4 porté dans le référentiel terrestre par la chaîne IAU 2006/2000A, et les élévations sont apparentes : réfraction ITU-R P.834-9 et temps de lumière de la liaison descendante, chacun pouvant être activé ou non (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. Le contact est-il fermé ? (<c1/>)

# text
seg-47bdb9d4700c = Pour un passage, placez la distance oblique et les valeurs du terminal dans l'équation de liaison CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network) :

# text
seg-db12a99edcd2 = Indique l'affaiblissement en espace libre (FSPL), la densité porteuse sur bruit (C/N₀), l'énergie par bit sur densité de bruit (Eb/N₀), la marge et si la liaison se <b>ferme</b> par rapport à un Eb/N₀ requis : le contrôle de faisabilité des communications qui transforme « elle est visible » en « nous pouvons réellement télécharger les données vers le sol ». Les chiffres découlent directement des entrées du fichier (ici une PIRE de { "55" } dBW, puissance isotrope rayonnée équivalente, vers un G/T de réception de { "53" } dB/K, rapport gain sur température de bruit) ; mettez les valeurs de votre propre terminal avant de lire la marge. C'est un calcul déterministe, et non la fiche technique d'un terminal étalonné.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. À quelle vitesse l'environnement la fait-il décroître ? (<c1/>)

# text
seg-8977b12fd934 = Pilote la densité neutre thermosphérique à partir de l'activité solaire (F10.7, le flux radio de { "10.7" } cm, et sa moyenne sur 81 jours F10.7a) et géomagnétique (indices Kp et ap) via la température exosphérique de Jacchia-71. Cela restitue l'oscillation de densité d'un facteur ~{ "5" }–{ "10" }× liée au cycle solaire qu'une atmosphère statique omet, de sorte qu'une estimation de durée de vie orbitale ou de traînée reflète le régime de météorologie spatiale plutôt qu'une atmosphère fixe. Depuis { "0.30" }, la densité est la densité thermosphérique de Jacchia { "1971" }, caractérisée par rapport à NRLMSISE-00 (Naval Research Laboratory, spectromètre de masse et diffusion incohérente) mais n'est pas une atmosphère NRLMSISE-00 validée sur des données.

# text
seg-4b5bdadf3e7e = { "5" }. Restituer le résultat (exports)

# text
# c1: orbit
# c2: --export-oem <file>
# c3: --export-sp3 <file>
# c4: --export-omm <file>
# c5: --export <czml|kml|geojson|stk|sigmf|all|list>
# c6: .e
# c7: spectrum
# c8: --export list
# c9: lunar-interop-export
seg-f4a438636ea8 = La même CLI écrit des fichiers standard pour l'outil suivant. Sur un scénario <c1/>, <c2/> écrit une éphéméride CCSDS OEM { "2.0" } avec vitesse (le fichier que lisent GMAT, Orekit et STK), <c3/> une éphéméride précise SP3 (Standard Product { "3" }) et <c4/> un catalogue de messages d'éléments moyens d'orbite CCSDS. <c5/> couvre les visionneuses : CZML (Cesium Language), KML (Keyhole Markup Language, pour Google Earth), GeoJSON, fichiers d'éphéméride STK (<c6/>, un par satellite plus l'utilisateur) et enregistrements SigMF (Signal Metadata Format) issus du type de scénario <c7/>. <c8/> indique lesquels s'appliquent à un scénario. Pour la Lune, le type de scénario <c9/> émet le référentiel, l'échelle de temps et l'éphéméride lunaires sous forme de CCSDS OEM, avec un contrôle de concordance avec le format. Voir <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Pourquoi c'est la liaison, et non un concurrent

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Chaque étape est un petit scénario vérifiable et reproductible, avec une étiquette de portée explicite. Les outils haute fidélité possèdent l'optimisation de trajectoire, l'AOCS à six degrés de liberté (6-DoF) et l'entrée, descente et atterrissage aérothermiques (EDL) ; Kshana possède le <b>tissu conjonctif ouvert, citable et exécutable</b> : ingérer les formats standard, répondre aux questions transverses de géométrie et de faisabilité, et transmettre le résultat, à un niveau que tout partenaire peut exécuter sans licence. Voir aussi les types de scénario d'analyse de mission associés <c1/>, <c2/>, <c3/>, <c4/> et <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Précédent</s1>{ "3" } · Quantique contre classique

# text
seg-b0765a28b4ce = <s1>Suivant</s1>Types de scénario

# text
seg-dc88ec5ccc43 = { "1" }. Ingérer la trajectoire produite par un concepteur (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. Quand est-elle visible depuis une station au sol ? (passes)

# text
seg-afa47b4283a3 = { "3" }. Le contact est-il fermé ? (link-budget)

# text
seg-e508e844bf2d = { "4" }. À quelle vitesse l'environnement la fait-il décroître ? (space-weather)
