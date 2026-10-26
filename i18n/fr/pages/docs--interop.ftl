# docs--interop: translations (fr)

# text
seg-f917e7fcac09 = Ce que c'est

# text
seg-cae10fb9bff8 = Scénario

# text
seg-f2ce7fc60cdf = Format

# text
seg-8c718f7f9f5d = SigMF

# text
seg-507b8c235614 = CZML

# text
seg-bf09433a7342 = GeoJSON

# text
seg-9c92e0bc42aa = KML

# text
seg-b03d56f501c3 = Type

# text
seg-357c2320b43a = oui

# text
# c1: docs/INTEROP.md
seg-c8c964a11462 = Source : <c1/>

# text
# c1: --export
seg-881ec6f8fbe0 = Une exécution écrit un document de résultat, un graphique et un rapport. <c1/> écrit aussi la géométrie du scénario, ou son signal synthétisé, dans les formats que d'autres outils lisent déjà : un visualiseur de globe, une carte de bureau, un système d'information géographique (SIG), un logiciel d'analyse de mission ou un outil de radio logicielle (SDR). Rien ici ne lit une horloge ni le réseau, et aucun export ne porte d'horodatage de génération, de sorte que le même scénario donne des fichiers identiques à l'octet près à chaque exécution.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Les fichiers sont écrits à côté du scénario, nommés comme le document de résultat : <c1/>, <c2/>, <c3/>, un <c4/> par objet mobile (ou <c5/> lorsqu'il n'y en a qu'un), et la paire <c6/> / <c7/>. Avec <c8/>, ils prennent à la place le nom de l'étude, comme les autres sorties.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Un format nommé explicitement qui ne s'applique pas au scénario est une erreur qui affiche la raison ; avec <c1/>, la raison est affichée et le format ignoré. Les points d'entrée de la bibliothèque sont <c2/>, <c3/> et <c4/> ; ils prennent le texte du scénario et renvoient des octets, sans toucher à aucun fichier, de sorte qu'ils s'exécutent aussi dans la version WebAssembly. Le serveur Model Context Protocol (MCP) sert les trois mêmes sous forme des outils <c5/>, <c6/> et <c7/> (voir <c8/>).

# text
# c1: src/interop/
# c2: scene.rs
# c3: czml.rs
# c4: kml.rs
# c5: geojson.rs
# c6: stk.rs
# c7: src/sigmf.rs
# c8: src/spectrum.rs
# c9: tests/interop_formats.rs
seg-77200201db88 = Code : <c1/> (<c2/> construit une description géométrique unique du scénario, <c3/>, <c4/>, <c5/> et <c6/> l'écrivent), <c7/> et <c8/> pour le signal. Tests : <c9/>.

# text
seg-f13ab6bb2e47 = Formats

# text
seg-fc52229b569c = Spécification suivie

# text
seg-3f237c8956eb = Cesium Language : un tableau JSON (JavaScript Object Notation) de paquets horodatés, lu par CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, une norme de l'Open Geospatial Consortium (OGC), lue par Google Earth et la plupart des outils SIG ; les traces horodatées utilisent l'extension Google <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (espace de noms du schéma <c1/> ; espace de noms de l'extension <c2/>)

# text
seg-4cfac7667dbc = JSON géographique, Request for Comments (RFC) { "7946" } de l'Internet Engineering Task Force (IETF)

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = le fichier d'éphéméride d'Ansys Systems Tool Kit (STK), forme temps-position-vitesse <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format : un fichier JSON de métadonnées et un fichier brut d'échantillons complexes en phase et en quadrature (IQ)

# text
seg-b38ee3ebd012 = Ce que contient chaque fichier

# text
seg-7d873bc11593 = Chaque format géospatial est écrit à partir de la même scène, de sorte qu'ils ne peuvent pas être en désaccord sur la position de quoi que ce soit. Une scène comporte jusqu'à quatre sortes d'objets :

# text
seg-1fc686f6a7ea = <b>Objets mobiles</b> — les satellites, et une plateforme utilisateur lorsqu'elle se déplace — échantillonnés sur la grille temporelle propre au scénario avec les propagateurs qu'utilise l'exécution du type de scénario.

# text
seg-3db28cb6adc5 = <b>Sites fixes</b> — un récepteur, une station au sol, un brouilleur, ou l'origine d'un référentiel de navigation local.

# text
seg-0def04909935 = <b>Traces sans horodatage</b> — les points de passage que parcourt un type de scénario de positionnement, navigation et synchronisation temporelle (PNT) alternatif fondé sur le terrain, la gravité ou une combinaison. Ces types n'ont pas d'axe temporel, de sorte que les traces n'en portent aucun.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Empreintes de brouilleur</b> — pour le type de scénario <c1/>, deux cercles autour du brouilleur : la portée au sol à l'intérieur de laquelle un satellite au zénith (le plus fort) passe sous le seuil de poursuite, de sorte que tous les satellites sont perdus, et la portée à l'intérieur de laquelle un satellite au masque d'élévation (le plus faible) le fait, de sorte que la poursuite commence à défaillir. Les deux proviennent des équations de liaison propres au type de scénario (Kaplan et Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3e éd., §{ "9.4" }) avec le brouilleur à l'horizon du récepteur et une perte en espace libre, et la suite de tests vérifie que le rapport effectif porteuse sur densité de bruit à chaque rayon est égal au seuil à { "1e-6" } dB près. Le cercle est tracé sur une sphère du rayon moyen de la Terre.

# text
# c1: "id": "document"
# c2: "version": "1.0"
# c3: position
# c4: epoch
# c5: referenceFrame
# c6: "INERTIAL"
# c7: cartesian
# c8: [t, x, y, z, ...]
# c9: INERTIAL
# c10: cartesian
# c11: referenceFrame
# c12: "FIXED"
# c13: ellipse
# c14: polyline
# c15: description
seg-e1dd97c47993 = Le premier paquet est le paquet de document (<c1/>, <c2/>) avec une horloge couvrant la grille temporelle. Chaque objet mobile est un paquet dont <c3/> a une <c4/> UTC (temps universel coordonné) au format ISO { "8601" } (format de date et d'heure de l'Organisation internationale de normalisation), <c5/> <c6/>, et des échantillons <c7/> <c8/> : secondes après l'époque, mètres dans le Geocentric Celestial Reference System (GCRS). CesiumJS prend <c9/> pour l'International Celestial Reference Frame (ICRF), dont le GCRS partage les axes. Les sites fixes et les centres d'empreinte sont des positions <c10/> constantes liées à la Terre avec <c11/> <c12/>. Une empreinte est une <c13/> dont les deux demi-axes sont égaux à son rayon ; une trace sans horodatage est une <c14/> plaquée au sol. La <c15/> de chaque paquet énonce de nouveau le référentiel en toutes lettres.

# text
# c1: <Document>
# c2: <Folder>
# c3: <Placemark>
# c4: <gx:Track>
# c5: <when>
# c6: <gx:coord>
# c7: <Point>
# c8: <Polygon>
# c9: <LineString>
# c10: altitudeMode
# c11: absolute
# c12: absolute
seg-be6362f4c7e7 = Un <c1/> avec un <c2/> par classe d'objets. Un objet mobile est un <c3/> contenant un <c4/> : un <c5/> par échantillon (UTC au format ISO { "8601" }), puis un <c6/> par échantillon (longitude, latitude, hauteur). Les sites sont des <c7/>, les empreintes des <c8/> dont l'anneau est fermé et orienté dans le sens antihoraire, les traces sans horodatage des <c9/>. Les coordonnées sont la longitude et la latitude du World Geodetic System { "1984" } (WGS { "84" }) en degrés décimaux et la hauteur en mètres au-dessus de l'ellipsoïde WGS { "84" }, écrites avec <c10/> <c11/>. KML lit <c12/> comme une hauteur au-dessus du niveau moyen de la mer ; la différence, l'ondulation du géoïde, est d'au plus environ ±{ "110" } m et n'est pas appliquée. La description du document le dit.

# text
# c1: FeatureCollection
# c2: [longitude, latitude]
# c3: [longitude, latitude, height]
# c4: LineString
# c5: times_utc
# c6: MultiLineString
# c7: times_utc
# c8: Point
# c9: Polygon
# c10: LineString
# c11: units
seg-37dc14626a6c = Une <c1/>. Les positions sont <c2/> ou <c3/> — longitude d'abord, comme l'exige la RFC { "7946" } — en degrés WGS { "84" }, avec la hauteur en mètres au-dessus de l'ellipsoïde. Un objet mobile est une <c4/> avec une propriété <c5/> contenant un temps ISO { "8601" } par position ; une trace qui franchit le méridien { "180" }° est écrite comme une <c6/> coupée à cet endroit, comme le demande la RFC { "7946" } §{ "3.1.9" } (le point de franchissement est interpolé, et <c7/> ne liste alors que les échantillons d'origine). Les sites sont des <c8/>, les empreintes des <c9/> avec un anneau extérieur fermé orienté dans le sens antihoraire (§{ "3.1.6" }), les traces sans horodatage des <c10/>. Chaque entité a une propriété <c11/> nommant l'unité de chaque membre numérique.

# text
# c1: NumberOfEphemerisPoints
# c2: ScenarioEpoch
# c3: d Mon yyyy hh:mm:ss.ssssss
# c4: InterpolationMethod Lagrange
# c5: InterpolationSamplesM1 5
# c6: CentralBody Earth
# c7: CoordinateSystem ICRF
# c8: DistanceUnit Meters
# c9: EphemerisTimePosVel
# c10: .e
# c11: Pulsar inclined/S1-0163
# c12: -
seg-ea28a2bd431c = Un fichier par objet mobile, puisqu'une éphéméride STK décrit un seul véhicule. L'en-tête donne <c1/> (égal au nombre de lignes de données), <c2/> (UTC, <c3/>), <c4/> avec <c5/>, <c6/>, <c7/> et <c8/> ; les lignes sous <c9/> sont des secondes après l'époque, la position en mètres et la vitesse en mètres par seconde, dans le GCRS. Une scène ne comportant que des sites fixes ou des traces sans horodatage n'écrit aucun fichier <c10/> : un point fixe est une Facility STK, et non une éphéméride. Un identifiant qui n'est pas un élément simple de nom de fichier (une couche de constellation et un satellite, <c11/>) est écrit avec chaque autre caractère remplacé par <c12/>, numéroté si deux identifiants coïncident alors.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = Le type de scénario <c1/> et le type de scénario <c2/> (par son étape <c3/>) exportent chaque satellite en orbite terrestre basse (LEO) et l'utilisateur à partir des propagateurs et de la grille temporelle propres au type de scénario. Le type de scénario travaille dans l'ECI0, le référentiel inertiel géocentrique aligné sur le référentiel terrestre à l'époque ; chaque échantillon est converti dans le référentiel terrestre à son propre instant par la rotation terrestre du type de scénario, puis de là dans le GCRS en passant par le référentiel de l'équateur vrai et de l'équinoxe moyen (TEME) dans lequel le propagateur Simplified General Perturbations { "4" } (SGP4) fournit ses sorties, à cet instant, avec UT1 (temps universel, l'angle de rotation de la Terre) pris égal à UTC et le mouvement du pôle négligé, comme pour les autres exports. Les autres types de scénario LEO indiquent pourquoi un format ne s'applique pas (le tableau ci-dessous).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = Un <c1/> exporte chaque scénario membre qui a une géométrie comme son propre jeu de fichiers, l'étiquette du membre étant insérée avant le suffixe de format : chaque exécution de phase (<c2/>, ou <c3/> lorsque la phase a plusieurs exécutions), le scénario de base du balayage (<c4/>), le scénario Monte Carlo (<c5/>) et chaque membre composé (son étiquette, avec les valeurs partagées qu'il lie incluses). <c6/> écrit <c7/> et <c8/>. Un membre identique à un membre précédent n'est écrit qu'une fois, et les valeurs qu'une campagne applique à l'exécution (transferts, valeurs de balayage, graines) ne figurent pas dans le membre exporté. Un format s'applique à une campagne lorsqu'il s'applique à l'un des membres ; sinon la raison est la note { "4" } du tableau ci-dessous. Voir <a1>CAMPAIGNS.md</a1>.

# text
# c1: spectrum
# c2: [iq]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: iq.sigmf.meta
# c9: iq.sigmf.data_bytes
# c10: src/sigmf.rs
# c11: spectrum
seg-6579b6941d10 = L'instantané <c2/> du type de scénario <c1/> — la bande L modélisée dessinée sous forme d'échantillons complexes à un instant — sous forme d'une paire <c3/> / <c4/>, dans le type de données que nomme <c5/> (<c6/> ou <c7/>). C'est le même enregistrement que l'exécution écrit et relit pour son propre contrôle de cohérence : les métadonnées exportées sont égales au bloc <c8/> du document de résultat, et le fichier de données a la longueur <c9/>. L'écriture est assurée par <c10/>, le module que le type de scénario <c11/> utilisait déjà ; rien n'est dupliqué.

# text
seg-6e7c5f0e34f3 = Référentiels et temps

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = Le moteur propage en TEME (équateur vrai, équinoxe moyen de la date), son référentiel natif. Les objets mobiles sont tournés vers le GCRS par la réduction <c1/> (précession IAU { "2006" } et nutation IAU 2000B, où IAU est l'Union astronomique internationale), qui reproduit à { "0.11" } m l'exemple publié par Vallado de TEME vers GCRF (Geocentric Celestial Reference Frame), pour CZML et STK, et vers le référentiel terrestre par <c2/> pour KML et GeoJSON. La rotation vers le référentiel terrestre est l'angle sidéral moyen de Greenwich avec UT1 pris égal à UTC et sans mouvement du pôle — la même réduction que celle de l'export SP3 (Standard Product { "3" }). Au rayon d'une orbite GPS, l'écart UT1−UTC négligé, pouvant atteindre { "0.9" } s, déplace la longitude d'un satellite d'au plus environ { "1.7" } km ; les sites au sol ne sont pas affectés, puisqu'ils sont donnés en latitude et longitude.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = Le type de scénario <c1/> fait exception : sa sortie du moteur porte déjà des positions GCRS et liées à la Terre (avec l'UT1−UTC et le mouvement du pôle du scénario, ou une véritable série de l'International Earth Rotation and Reference Systems Service (IERS)), et celles-ci sont écrites telles quelles.

# text
seg-2299da743a4c = Tout temps est en UTC. Les secondes intercalaires ne sont pas modélisées : un décalage à travers une seconde intercalaire est compté comme si chaque jour avait { "86 400" } s, comme le comptent les grilles temporelles du moteur.

# text
# c1: t = 0
# c2: orbit
# c3: epoch
# c4: epoch
# c5: epoch
# c6: t
# c7: t = 0
# c8: jamming
# c9: gnss-sim
# c10: passes
# c11: epoch
# c12: ephemeris
# c13: epoch
# c14: integrity
# c15: t = 0
seg-4f7a0b8b4358 = L'époque de <c1/> est celle qu'utilise l'exécution du type de scénario, et chaque fichier la nomme : le <c3/> du type de scénario <c2/> ; lorsqu'il est absent, la plus ancienne époque que portent les données propres aux satellites (une époque d'ensemble d'éléments à deux lignes (TLE), le temps de référence d'une éphéméride diffusée, le début d'un fichier SP3), et 2000-01-01T00:{ "00" }:00Z seulement lorsqu'aucun satellite n'en porte (éléments képlériens). Les exports SP3 et OEM (Orbit Ephemeris Message) conservent 2000-01-01T00:{ "00" }:00Z pour un scénario sans <c4/>, de sorte que, pour un tel scénario, leurs dates diffèrent de celles de ces fichiers. Sans <c5/> de scénario, chaque satellite qui porte sa propre époque est tourné vers les référentiels GCRS et terrestre à son propre instant (son époque plus <c6/>), puisque c'est la date à laquelle appartient sa position TEME ; lorsque les époques des satellites diffèrent, les étiquettes de temps partagées suivent la prémisse du moteur selon laquelle chaque satellite démarre à <c7/>, et le fichier dit de combien d'heures elles diffèrent. L'époque d'élément SGP4 des constellations de Walker des types de scénario <c8/> et <c9/> (2018-06-12T00:{ "00" }:00Z), que leurs exécutions utilisent aussi pour la rotation de la Terre ; le <c11/> du type de scénario <c10/> ; le <c13/> ou l'époque TLE du type de scénario <c12/>. Le type de scénario <c14/> n'a pas d'époque calendaire ; son export date <c15/> comme pour un scénario d'orbite sans époque.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Les satellites conservent les identifiants positionnels <c1/>, <c2/>, ... que leur donnent les exports SP3 et OEM, car les propagateurs ne portent pas les lignes de nom des TLE.

# text
seg-0491624c5f12 = Importations

# text
seg-798f3ae1b77d = Itinéraire GeoJSON.

# text
# c1: --import-route <file>
# c2: interop::geojson::apply_route
# c3: LineString
# c4: Feature
# c5: FeatureCollection
# c6: terrain-nav
# c7: terrain-slam
# c8: gravity-map
# c9: combined-altpnt
# c10: start_lat_deg
# c11: start_lon_deg
# c12: step_lat_deg
# c13: step_lon_deg
# c14: waypoints
# c15: start + i·step
# c16: waypoints
seg-2a04d7d4bafc = <c1/> (bibliothèque : <c2/>) lit la première <c3/> d'un document GeoJSON — une géométrie seule, une <c4/>, ou une <c5/> — et l'écrit dans les entrées de trace de <c6/>, <c7/>, <c8/> et <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) avant l'exécution. Ces types de scénario parcourent <c15/> ; un itinéraire n'est donc accepté que s'il est exactement cela : ses deux extrémités (le nombre de <c16/> du scénario est conservé), ou trois positions ou plus régulièrement espacées sur une droite en latitude et en longitude, à { "1e-7" } degré près (environ { "1" } cm). Tout autre itinéraire est refusé et l'erreur nomme la position la plus éloignée de la droite. Un itinéraire pour un type de scénario sans entrée de trajectoire est refusé avec cette raison. La longitude et la latitude sont contrôlées en plage, ce qui détecte un fichier à latitude en premier.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>Enregistrement SigMF.</b> Le bloc <c2/> du type de scénario <c1/> lit une paire <c3/> / <c4/> via <c5/> et trace son estimation de Welch à côté du modèle (voir <a1>SPECTRUM.md</a1>). La lecture de fichiers est une fonctionnalité de la version native ; la version WebAssembly prend les octets par <c6/>.

# text
seg-f1ca9cee1065 = Comment les exports sont vérifiés

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> analyse chaque export avec un validateur écrit à partir de la spécification du format, et non avec le code propre de l'écriture :

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML : un tableau JSON dont le premier paquet est le paquet de document avec <c1/> ; des identifiants de paquet uniques ; chaque position indique <c2/> <c3/> ou <c4/> ; les positions échantillonnées sont <c5/> avec une époque ISO { "8601" } et des temps croissants.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML : un document XML (Extensible Markup Language) bien formé dans l'espace de noms OGC KML { "2.2" } avec une seule entité racine ; l'ordre des éléments du schéma à l'intérieur d'un Placemark ; au plus une géométrie par Placemark ; des anneaux linéaires fermés de quatre positions ou plus ; des n-uplets <c1/> dans la plage ; des valeurs <c2/> valides ; des <c3/> qui se résolvent ; un <c4/> avec autant de <c5/> que de <c6/>, et l'espace de noms de l'extension déclaré.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON : longitude d'abord et dans la plage, latitude dans la plage, deux ou trois nombres par position, lignes brisées d'au moins deux positions, anneaux extérieurs fermés orientés dans le sens antihoraire, aucun segment à travers le méridien { "180" }°, aucun membre <c1/>, une propriété <c2/> sur chaque entité.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK : la ligne de version <c1/>, un bloc <c2/> / <c3/> avec les mots-clés requis, <c4/>, <c5/> égal au nombre de lignes de données, sept nombres par ligne, temps croissants.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF : <c1/> et <c2/> dans <c3/>, tableaux <c4/> et <c5/>, <c6/> sur chaque capture, et un fichier de données d'échantillons entiers.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Au-delà de la structure, un satellite exporté vers CZML et vers STK est comparé à l'état propre du moteur après la même réduction de référentiel, et concorde à { "1" } mm en position (les fichiers portent { "0.1" } mm) : par rapport à la sortie GCRS propre du type de scénario <c1/>, et par rapport à une propagation TEME vers GCRS indépendante de la constellation <c2/>, chaque satellite étant daté par sa propre époque TLE lue dans le texte du scénario. Deux contrôles sortent du moteur : les positions CZML du premier satellite <c3/> concordent à { "0.1" } m (mesuré { "2.3" } cm) avec le même TLE propagé par le paquet Python <c4/> et réduit vers le GCRS par ERFA (Essential Routines for Fundamental Astronomy, l'implémentation ouverte de la bibliothèque SOFA de l'IAU), et les positions liées à la Terre des satellites <c5/> sont égales à { "1" } mm aux positions d'éphéméride diffusée de la spécification d'interface du Global Positioning System. Les positions liées à la Terre de l'export <c6/> sont comparées aux positions que note l'exécution de brouillage, à { "5" } mm. L'itinéraire GeoJSON fait l'aller-retour via un scénario de trace, la paire SigMF se relit aux mêmes octets, et chaque export est déterministe à l'octet près.

# text
seg-20fbf9a3fba7 = Ce sont des contrôles par rapport aux spécifications publiées et par rapport au moteur lui-même. Les fichiers n'ont pas été chargés dans CesiumJS, Google Earth, Ansys STK ou un outil SDR dans le cadre de la suite de tests ; l'acceptation par une version particulière de ces outils n'est donc pas testée ici.

# text
seg-7349c09206ac = Échange d'orbite, d'attitude et de noyau (bibliothèque, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Outre les formats <c1/>, { "0.36" } a ajouté des lecteurs et des écrivains de bibliothèque pour les fichiers standard qu'échangent les outils d'analyse de mission. Ils prennent et renvoient du texte ou des octets et ne touchent à aucun fichier. Chacun est une ligne VALIDATED de la <a1>matrice de vérification</a1>, par rapport à l'implémentation indépendante qui y est nommée :

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, avec <c2/> pour la forme XML) : OPM, OMM et OCM en notation clé-valeur (KVN) et NDM/XML, selon CCSDS 502.0-B-3 (OPM et OMM versions { "3.0" } et { "2.0" }, OCM { "3.0" }). Vérifiés dans les deux sens par rapport à Orekit : Orekit lit les fichiers de Kshana et Kshana lit ceux d'Orekit. Les constats qui subsistent sont figés par des tests.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, avec <c2/>) : AEM et APM selon CCSDS 504.0-B-2, en KVN et NDM/XML. Vérifiés par rapport à Orekit de la même façon, ainsi que les rotations d'enregistrement par rapport à celles d'Orekit.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>) : écrivains et lecteurs de segments NAIF SPK des types { "9" } et { "13" } (avec l'export d'un OEM CCSDS vers un noyau SPK) et des types { "3" } et { "21" } (polynômes de Tchebychev et lignes de différences étendues), vérifiés par rapport aux lecteurs propres de la boîte à outils NAIF SPICE, jusqu'à l'identité d'octets. Kshana écrit les segments à partir des enregistrements qu'on lui donne : il n'ajuste pas de coefficients de Tchebychev et ne produit pas de lignes de différences.

# text
seg-bb97cbb1ab9f = L'importateur et l'écrivain CCSDS OEM, ainsi que le bloc de covariance OEM, sont plus anciens et sont décrits dans les importations ci-dessus et dans la matrice.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Seuls les types de scénario du tableau ci-dessous exportent une géométrie. Les types de scénario dont la géométrie est centrée sur la Lune, Mars ou un autre corps ne sont pas exportés : CZML, KML et GeoJSON décrivent des positions autour de la Terre, et cette version n'écrit des fichiers STK qu'avec <c1/>, bien que le format STK lui-même admette d'autres corps centraux.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = <c1/>, <c2/> et <c3/> ont une géométrie référencée à la Terre que cette version n'exporte pas ; le tableau donne la raison pour chacun.

# text
# c1: gnss-ins
seg-2bb9237839f3 = Le type de scénario <c1/> fait voler sa trajectoire dans un plan tangent local plat ; seule l'origine du plan est donc exportée, et non la trajectoire.

# text
seg-6049ab4ca3c9 = Les positions de satellites liées à la Terre négligent UT1−UTC et le mouvement du pôle (voir Référentiels et temps) ; les hauteurs KML sont ellipsoïdales, et non au-dessus du niveau moyen de la mer.

# text
seg-4dda05aefd2b = Les empreintes supposent une propagation en espace libre, un brouilleur à l'horizon du récepteur et une Terre sphérique pour le cercle.

# text
seg-2dd0656c518f = Chaque fichier de scénario

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = Ce que fait <c1/> pour chaque fichier de <c2/> (le manifeste de la suite n'est pas un scénario et est écarté). « oui » signifie que le format est écrit et passe son validateur ; sinon le numéro renvoie à la raison. Généré par <c3/> ; <c4/> échoue lorsqu'il est périmé.

# text
seg-c27f67dfbb37 = non [{ "1" }]

# text
seg-3468244e2385 = non [{ "2" }]

# text
seg-d0cf3f74cd10 = non [{ "3" }]

# text
seg-62c880979169 = non [{ "4" }]

# text
seg-9229b499c702 = non [{ "5" }]

# text
seg-d9d6561c9e5b = non [{ "6" }]

# text
seg-7d4a6538c638 = non [{ "7" }]

# text
seg-f170ed4d8dca = non [{ "8" }]

# text
seg-1c5eb5dca942 = non [{ "9" }]

# text
seg-a930bb0d2e42 = non [{ "10" }]

# text
seg-236853169f42 = non [{ "11" }]

# text
seg-411e4f3aeae7 = non [{ "12" }]

# text
seg-34fabcbb82f2 = non [{ "13" }]

# text
seg-772bd344bbce = non [{ "14" }]

# text
seg-460fd74c7c7e = non [{ "15" }]

# text
seg-e1d91ce54b8b = non [{ "16" }]

# text
seg-f3e0486f02e3 = non [{ "17" }]

# text
seg-884160b0ed12 = non [{ "18" }]

# text
seg-8202f4a426b0 = non [{ "19" }]

# text
seg-a4e9a36289e5 = non [{ "20" }]

# text
seg-034364e38105 = non [{ "21" }]

# text
seg-3e3b6ecc7b43 = Pourquoi un format ne s'applique pas :

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = les types de scénario <c1/> et <c2/> planifient les contacts de liaison descendante et le codage ; exportez un scénario <c3/> pour le même satellite et la même station afin de voir la géométrie

# text
# c1: spectrum
seg-f587b4df1635 = SigMF contient des échantillons complexes en bande de base, que seul le type de scénario <c1/> synthétise

# text
# c1: aocs
seg-d102fb18ce8d = le type de scénario <c1/> simule l'attitude autour du centre de masse sans orbite ni position au sol, il n'y a donc rien à placer sur la Terre

# text
seg-ecc0e31b0369 = l'entrée du scénario ne porte aucune position horizontale (ni latitude ni longitude, ni coordonnées géocentriques, ni éléments orbitaux au-delà d'au plus une altitude), il n'y a donc rien à placer sur la Terre

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = les types de scénario <c1/> et <c2/> calculent des bilans sans position terrestre

# text
seg-1f17b963c7a6 = une éphéméride STK décrit la position et la vitesse d'un véhicule en fonction du temps ; cette scène n'a que des points fixes ou des traces sans horodatage (un point fixe est une Facility STK, et non une éphéméride)

# text
seg-f79d0ce7b945 = aucun scénario membre de la campagne n'a rien que ce format décrive ; exportez un membre seul pour voir sa raison

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = le type de scénario <c1/> analyse des conceptions de signal (spectres, poursuite, acquisition, compatibilité) sans position de satellite ni d'utilisateur ; exportez le scénario <c2/> ou <c3/> qui fait voler la conception

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = non exporté dans cette version : les types de scénario de positionnement fusionné placent leurs satellites dans un référentiel terrestre relatif à une époque qu'ils ne nomment jamais, de sorte qu'un export horodaté devrait inventer la date calendaire (exportez plutôt le scénario <c1/> ou <c2/>)

# text
seg-3c57b084f0d7 = la géométrie du type de scénario est centrée sur la Lune, Mars ou un autre corps du système solaire ; CZML, KML et GeoJSON décrivent des positions sur ou autour de la Terre, et cette version n'écrit des éphémérides STK qu'avec CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = non exporté dans cette version : <c1/> place ses satellites dans un référentiel lié au corps relatif à une époque qu'il ne nomme jamais, de sorte qu'un export horodaté devrait inventer la date calendaire

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = non exporté dans cette version : la constellation terrestre de système mondial de navigation par satellite (GNSS) de <c1/> est vue depuis un récepteur à distance lunaire, dont le type de scénario n'expose pas la trajectoire sous forme de série temporelle

# text
# c1: entry-heating
seg-3cf7f7460c55 = non exporté dans cette version : le type de scénario <c1/> rapporte des charges de pointe et un échauffement, et ne conserve aucune trace au sol horodatée

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = le type de scénario <c1/> balaie la disponibilité et la puissance de liaison pour un utilisateur sur une couche ou une trajectoire képlérienne ; il n'a pas de position unique à placer sur une carte

# text
# c1: launch-window
seg-6271953188bd = le scénario <c1/> donne la latitude du site de lancement mais pas de longitude, le site ne peut donc pas être placé

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = non exporté dans cette version : l'orbite de vérité de <c1/> est une référence d'ajustement dont l'angle de rotation de la Terre à l'époque est une entrée (<c2/>, par défaut { "0" }), et non dérivé de la date calendaire, de sorte que ses positions liées à la Terre ne sont pas rattachées à une date

# text
seg-a03c2f0426db = ce scénario de spectre n'a pas de bloc [iq], aucun échantillon n'est donc synthétisé pour être enregistré

# text
# c1: oem-interop
seg-d75f8ad6903a = non exporté dans cette version : <c1/> lit et écrit un Orbit Ephemeris Message du CCSDS (Consultative Committee for Space Data Systems), qui est lui-même le fichier d'échange d'éphéméride

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = le type de scénario <c1/> calcule des statistiques de liaison pour des sites au sol sans géométrie horodatée à placer

# text
seg-146a2e8ee590 = le scénario balaie un autre scénario sur une grille ; exportez le scénario balayé seul

# text
# c1: time-transfer-budget
seg-b74484e3586b = le type de scénario <c1/> calcule un bilan de liaison et des stabilités, sans géométrie horodatée à placer

# text
seg-bcd613e62c69 = <s1>Précédent</s1>Export d'animation

# text
seg-0525f7fbbfd2 = <s1>Suivant</s1>État de validation

# text
seg-53a778722c16 = STK .e
