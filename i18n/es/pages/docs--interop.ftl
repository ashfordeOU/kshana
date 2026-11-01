# docs--interop: translations (es)

# text
seg-f917e7fcac09 = Qué es

# text
seg-cae10fb9bff8 = Escenario

# text
seg-f2ce7fc60cdf = Formato

# text
seg-8c718f7f9f5d = SigMF

# text
seg-507b8c235614 = CZML

# text
seg-bf09433a7342 = GeoJSON

# text
seg-9c92e0bc42aa = KML

# text
seg-b03d56f501c3 = Tipo

# text
seg-357c2320b43a = sí

# text
# c1: docs/INTEROP.md
seg-c8c964a11462 = Fuente: <c1/>

# text
# c1: --export
seg-881ec6f8fbe0 = Una ejecución escribe un documento de resultados, un gráfico y un informe. <c1/> escribe además la geometría del escenario, o su señal sintetizada, en los formatos que ya leen otras herramientas: un visor de globo terráqueo, un mapa de escritorio, un sistema de información geográfica (GIS), un paquete de análisis de misión o una herramienta de radio definida por software (SDR). Nada de esto lee un reloj ni la red, y ninguna exportación lleva una marca de tiempo de generación, de modo que el mismo escenario da archivos idénticos byte a byte en cada ejecución.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Los archivos se escriben junto al escenario, con nombres como el del documento de resultados: <c1/>, <c2/>, <c3/>, un <c4/> por objeto en movimiento (o <c5/> cuando hay uno), y el par <c6/> / <c7/>. Con <c8/> toman en su lugar el nombre del estudio, como hacen las demás salidas.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Un formato nombrado explícitamente que no se aplica al escenario es un error que imprime el motivo; con <c1/> se imprime el motivo y se omite el formato. Los puntos de entrada de la biblioteca son <c2/>, <c3/> y <c4/>; toman el texto del escenario y devuelven bytes, sin tocar ningún archivo, por lo que funcionan también en la compilación WebAssembly. El servidor del Model Context Protocol (MCP) ofrece las mismas tres como las herramientas <c5/>, <c6/> y <c7/> (véase <c8/>).

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
seg-77200201db88 = Código: <c1/> (<c2/> construye una descripción geométrica del escenario; <c3/>, <c4/>, <c5/> y <c6/> la escriben), <c7/> y <c8/> para la señal. Pruebas: <c9/>.

# text
seg-f13ab6bb2e47 = Formatos

# text
seg-fc52229b569c = Especificación seguida

# text
seg-3f237c8956eb = Cesium Language: una matriz JSON (JavaScript Object Notation) de paquetes con marca de tiempo, leída por CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, un estándar del Open Geospatial Consortium (OGC), leído por Google Earth y la mayoría de las herramientas GIS; las trazas con marca de tiempo usan la extensión de Google <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (espacio de nombres del esquema <c1/>; espacio de nombres de la extensión <c2/>)

# text
seg-4cfac7667dbc = JSON geográfico, Request for Comments (RFC) { "7946" } de la Internet Engineering Task Force (IETF)

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = el archivo de efemérides de Ansys Systems Tool Kit (STK), en la forma de tiempo-posición-velocidad <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format: un archivo de metadatos JSON y un archivo en bruto de muestras complejas en fase y cuadratura (IQ)

# text
seg-b38ee3ebd012 = Qué contiene cada archivo

# text
seg-7d873bc11593 = Todos los formatos geoespaciales se escriben a partir de la misma escena, de modo que no pueden discrepar sobre dónde está cada cosa. Una escena tiene hasta cuatro clases de objeto:

# text
seg-1fc686f6a7ea = <b>Objetos en movimiento</b>: satélites, y una plataforma de usuario cuando se mueve, muestreados en la propia rejilla temporal del escenario con los propagadores que usa la ejecución del tipo.

# text
seg-3db28cb6adc5 = <b>Emplazamientos fijos</b>: un receptor, una estación terrestre, un inhibidor o el origen de un marco de navegación local.

# text
seg-0def04909935 = <b>Trazas sin tiempo</b>: los puntos de paso que vuela un tipo de posicionamiento, navegación y temporización (PNT) alternativo de terreno, gravedad o combinado. Estos tipos no tienen eje temporal, de modo que las trazas no llevan ninguno.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Huellas de inhibidores</b>: para el tipo de escenario <c1/>, dos círculos alrededor del inhibidor: el alcance sobre el terreno dentro del cual un satélite en el cenit (el más fuerte) cae por debajo del umbral de seguimiento, de modo que se pierden todos los satélites, y el alcance dentro del cual lo hace un satélite en la máscara de elevación (el más débil), de modo que el seguimiento empieza a fallar. Ambos salen de las propias ecuaciones de enlace del tipo (Kaplan y Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3.ª ed., §{ "9.4" }) con el inhibidor en el horizonte del receptor y pérdida en espacio libre, y el conjunto de pruebas comprueba que la relación efectiva de densidad de portadora a ruido en cada radio es igual al umbral con una diferencia de { "1e-6" } dB. El círculo se dibuja sobre una esfera del radio medio de la Tierra.

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
seg-e1dd97c47993 = El primer paquete es el paquete del documento (<c1/>, <c2/>) con un reloj que abarca la rejilla temporal. Cada objeto en movimiento es un paquete cuyo <c3/> tiene un <c4/> ISO { "8601" } (formato de fecha y hora de la Organización Internacional de Normalización) UTC (Tiempo Universal Coordinado), <c5/> <c6/>, y muestras <c7/> <c8/>: segundos tras la época, metros en el Geocentric Celestial Reference System (GCRS). CesiumJS toma <c9/> como el International Celestial Reference Frame (ICRF), cuyos ejes comparte el GCRS. Los emplazamientos fijos y los centros de las huellas son posiciones <c10/> constantes fijas a la Tierra, con <c11/> <c12/>. Una huella es una <c13/> con ambos semiejes iguales a su radio; una traza sin tiempo, una <c14/> adherida al terreno. La <c15/> de cada paquete vuelve a indicar el marco con palabras.

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
seg-be6362f4c7e7 = Un <c1/> con una <c2/> por clase de objeto. Un objeto en movimiento es un <c3/> que contiene un <c4/>: un <c5/> por muestra (ISO { "8601" } UTC), y después un <c6/> por muestra (longitud, latitud, altura). Los emplazamientos son <c7/>s, las huellas son <c8/>s cuyo anillo es cerrado y antihorario, y las trazas sin tiempo son <c9/>s. Las coordenadas son longitud y latitud del World Geodetic System { "1984" } (WGS { "84" }) en grados decimales y altura en metros sobre el elipsoide WGS { "84" }, escritas con <c10/> <c11/>. KML lee <c12/> como altura sobre el nivel medio del mar; la diferencia, la ondulación del geoide, está dentro de unos ±{ "110" } m y no se aplica. La descripción del documento lo dice.

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
seg-37dc14626a6c = Una <c1/>. Las posiciones son <c2/> o <c3/> (longitud primero, como exige la RFC { "7946" }) en grados WGS { "84" }, con la altura en metros sobre el elipsoide. Un objeto en movimiento es un <c4/> con una propiedad <c5/> que contiene una hora ISO { "8601" } por posición; una traza que cruza el meridiano de { "180" }° se escribe como un <c6/> cortado allí, como pide la RFC { "7946" } §{ "3.1.9" } (el punto de cruce se interpola, y <c7/> enumera entonces solo las muestras originales). Los emplazamientos son <c8/>s, las huellas son <c9/>s con un anillo exterior cerrado y antihorario (§{ "3.1.6" }), y las trazas sin tiempo son <c10/>s. Cada elemento tiene una propiedad <c11/> que nombra la unidad de cada miembro numérico.

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
seg-ea28a2bd431c = Un archivo por objeto en movimiento, ya que una efemérides de STK describe un solo vehículo. La cabecera da <c1/> (igual al número de filas de datos), <c2/> (UTC, <c3/>), <c4/> con <c5/>, <c6/>, <c7/> y <c8/>; las filas bajo <c9/> son segundos tras la época, posición en metros y velocidad en metros por segundo, en el GCRS. Una escena con solo emplazamientos fijos o trazas sin tiempo no escribe ningún archivo <c10/>: un punto fijo es una Facility de STK, no una efemérides. Un identificador que no es una parte simple de nombre de archivo (una capa de constelación y un satélite, <c11/>) se escribe con cada otro carácter como <c12/>, numerado si dos identificadores coinciden entonces.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = El tipo de escenario <c1/> y el tipo de escenario <c2/> (mediante su etapa <c3/>) exportan cada satélite de órbita terrestre baja (LEO) y el usuario a partir de los propagadores y la rejilla temporal propios del tipo. El tipo trabaja en ECI0, el marco inercial centrado en la Tierra alineado con el marco fijo a la Tierra en la época; cada muestra se pasa al marco fijo a la Tierra en su propio instante mediante la rotación terrestre del tipo y de ahí al GCRS a través del marco del ecuador verdadero y equinoccio medio (TEME) en el que emite el propagador Simplified General Perturbations { "4" } (SGP4), en ese instante, con UT1 (Tiempo Universal, el ángulo de rotación de la Tierra) tomado igual a UTC y el movimiento polar despreciado, como en las demás exportaciones. Los demás tipos de escenario LEO indican por qué un formato no se aplica (la tabla de más abajo).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = Un <c1/> exporta cada escenario miembro que tiene geometría como su propio conjunto de archivos, con la etiqueta del miembro insertada antes del sufijo del formato: cada ejecución de fase (<c2/>, o <c3/> cuando la fase tiene varias ejecuciones), el escenario base del barrido (<c4/>), el escenario de Monte Carlo (<c5/>) y cada miembro compuesto (su etiqueta, con los valores compartidos que enlaza escritos). <c6/> escribe <c7/> y <c8/>. Un miembro idéntico a uno anterior se escribe una sola vez, y los valores que una campaña aplica en tiempo de ejecución (traspasos, valores de barrido, semillas) no están en el miembro exportado. Un formato se aplica a una campaña cuando se aplica a algún miembro; en caso contrario, el motivo es la nota { "4" } de la tabla de más abajo. Véase <a1>CAMPAIGNS.md</a1>.

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
seg-6579b6941d10 = La instantánea <c2/> del tipo de escenario <c1/> (la banda L modelada dibujada como muestras complejas en un instante) como un par <c3/> / <c4/>, en el tipo de datos que indica <c5/> (<c6/> o <c7/>). Es la misma grabación que la ejecución escribe y vuelve a leer para su propia comprobación de consistencia: los metadatos exportados son iguales al bloque <c8/> del documento de resultados, y el archivo de datos tiene la longitud <c9/>. El escritor es <c10/>, el módulo que el tipo de escenario <c11/> ya usaba; no se duplica nada.

# text
seg-6e7c5f0e34f3 = Marcos y tiempo

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = El motor propaga en TEME (ecuador verdadero, equinoccio medio de la fecha), su marco nativo. Los objetos en movimiento se rotan al GCRS mediante la reducción <c1/> (precesión IAU { "2006" } y nutación IAU 2000B, donde IAU es la Unión Astronómica Internacional), que reproduce con { "0.11" } m el ejemplo publicado de Vallado de TEME a GCRF (Geocentric Celestial Reference Frame), para CZML y STK, y al marco fijo a la Tierra mediante <c2/> para KML y GeoJSON. La rotación al marco fijo a la Tierra es el ángulo sidéreo medio de Greenwich con UT1 tomado igual a UTC y sin aplicar el movimiento polar, la misma reducción que usa la exportación SP3 (Standard Product { "3" }). Con el radio orbital de GPS, la UT1−UTC despreciada de hasta { "0.9" } s desplaza la longitud de un satélite hasta unos { "1.7" } km; los emplazamientos terrestres no se ven afectados, porque se dan en latitud y longitud.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = El tipo de escenario <c1/> es la excepción: su salida del motor ya lleva posiciones GCRS y fijas a la Tierra (con la UT1−UTC y el movimiento polar del escenario, o una serie real del International Earth Rotation and Reference Systems Service (IERS)), y se escriben sin cambios.

# text
seg-2299da743a4c = Todas las horas son UTC. Los segundos intercalares no se modelan: un desfase a través de un segundo intercalar se cuenta como si cada día tuviera { "86 400" } s, como cuentan las rejillas temporales del motor.

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
seg-4f7a0b8b4358 = La época de <c1/> es la que usa la ejecución del tipo, y cada archivo la nombra: el <c3/> del tipo de escenario <c2/>; cuando falta, la época más temprana que llevan los propios datos de los satélites (una época de conjunto de elementos de dos líneas (TLE), el tiempo de referencia de una efemérides difundida, el inicio de un archivo SP3), y 2000-01-01T00:{ "00" }:00Z solo cuando ningún satélite lleva ninguna (elementos keplerianos). Las exportaciones SP3 y OEM (Orbit Ephemeris Message) mantienen 2000-01-01T00:{ "00" }:00Z para un escenario sin <c4/>, por lo que en tal escenario sus fechas difieren de las de estos archivos. Sin <c5/> de escenario, cada satélite que lleva su propia época se rota a los marcos GCRS y fijo a la Tierra en su propio instante (su época más <c6/>), ya que esa es la fecha a la que pertenece su posición TEME; cuando las épocas de los satélites difieren, las etiquetas de tiempo compartidas siguen la premisa del motor de que todos los satélites empiezan en <c7/>, y el archivo indica en cuántas horas difieren. La época del elemento SGP4 de las constelaciones Walker de los tipos de escenario <c8/> y <c9/> (2018-06-12T00:{ "00" }:00Z), que sus ejecuciones usan también para la rotación terrestre; el <c11/> del tipo de escenario <c10/>; el <c13/> o la época TLE del tipo de escenario <c12/>. El tipo de escenario <c14/> no tiene época de calendario; su exportación fecha <c15/> como para un escenario de órbita sin ella.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Los satélites conservan los identificadores posicionales <c1/>, <c2/>, ... que les dan las exportaciones SP3 y OEM, porque los propagadores no llevan las líneas de nombre de los TLE.

# text
seg-0491624c5f12 = Importaciones

# text
seg-798f3ae1b77d = Ruta GeoJSON.

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
seg-2a04d7d4bafc = <c1/> (biblioteca: <c2/>) lee la primera <c3/> de un documento GeoJSON (una geometría sola, una <c4/> o una <c5/>) y la escribe en las entradas de traza de <c6/>, <c7/>, <c8/> y <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) antes de la ejecución. Esos tipos vuelan <c15/>, por lo que una ruta se acepta cuando es exactamente eso: sus dos extremos (se conserva el número de <c16/> del escenario), o tres o más posiciones espaciadas uniformemente sobre una línea recta en latitud y longitud, con una tolerancia de { "1e-7" } grados (unos { "1" } cm). Cualquier otra ruta se rechaza y el error nombra la posición más alejada de la línea. Una ruta para un tipo sin entrada de trayectoria se rechaza con ese motivo. La longitud y la latitud se comprueban en rango, lo que detecta un archivo con la latitud primero.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>Grabación SigMF.</b> El bloque <c2/> del tipo de escenario <c1/> lee un par <c3/> / <c4/> a través de <c5/> y dibuja su estimación de Welch junto al modelo (véase <a1>SPECTRUM.md</a1>). Leer archivos es una función de la compilación nativa; la compilación WebAssembly toma los bytes a través de <c6/>.

# text
seg-f1ca9cee1065 = Cómo se comprueban las exportaciones

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> analiza cada exportación con un validador escrito a partir de la especificación del formato, no con el código del propio escritor:

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML: una matriz JSON cuyo primer paquete es el paquete del documento con un <c1/>; identificadores de paquete únicos; cada posición indica <c2/> <c3/> o <c4/>; las posiciones muestreadas son <c5/> con una época ISO { "8601" } y tiempos crecientes.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML: un documento XML (Extensible Markup Language) bien formado en el espacio de nombres OGC KML { "2.2" } con un único elemento raíz; el orden de elementos del esquema dentro de un Placemark; como máximo una geometría por Placemark; anillos lineales cerrados de cuatro o más posiciones; tuplas <c1/> en rango; valores de <c2/> válidos; <c3/> que se resuelven; un <c4/> con tantos <c5/> como <c6/>, y el espacio de nombres de la extensión declarado.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON: longitud primero y en rango, latitud en rango, dos o tres números por posición, cadenas de líneas de dos o más posiciones, anillos exteriores cerrados y antihorarios, ningún segmento a través del meridiano de { "180" }°, ningún miembro <c1/>, una propiedad <c2/> en cada elemento.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK: la línea de versión <c1/>, un bloque <c2/> / <c3/> con las palabras clave obligatorias, <c4/>, <c5/> igual al número de filas de datos, siete números por fila, tiempos crecientes.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF: <c1/> y <c2/> en <c3/>, matrices <c4/> y <c5/>, <c6/> en cada captura y un archivo de datos de muestras enteras.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Más allá de la estructura, un satélite exportado a CZML y a STK se compara con el propio estado del motor tras la misma reducción de marco, y coincide con { "1" } mm en posición (los archivos llevan { "0.1" } mm): frente a la propia salida GCRS del tipo de escenario <c1/>, y frente a una propagación independiente de TEME a GCRS de la constelación <c2/>, con cada satélite fechado por su propia época TLE leída del texto del escenario. Dos comprobaciones salen del motor: las posiciones CZML del primer satélite <c3/> coinciden con { "0.1" } m (medido { "2.3" } cm) con el mismo TLE propagado por el paquete de Python <c4/> y reducido al GCRS por ERFA (Essential Routines for Fundamental Astronomy, la implementación abierta de la biblioteca SOFA de la IAU), y las posiciones fijas a la Tierra de los satélites <c5/> son iguales con { "1" } mm a las posiciones de efemérides difundidas de la especificación de interfaz del Global Positioning System. Las posiciones fijas a la Tierra de la exportación <c6/> se comparan con las posiciones que puntúa la ejecución de jamming, con { "5" } mm. La ruta GeoJSON hace el viaje de ida y vuelta a través de un escenario de traza, el par SigMF vuelve a leerse con los mismos bytes, y toda exportación es determinista byte a byte.

# text
seg-20fbf9a3fba7 = Son comprobaciones frente a las especificaciones publicadas y frente al propio motor. Los archivos no se han cargado en CesiumJS, Google Earth, Ansys STK ni una herramienta SDR como parte del conjunto de pruebas, por lo que aquí no se prueba su aceptación por una versión concreta de esas herramientas.

# text
seg-7349c09206ac = Intercambio de órbitas, actitud y núcleos (biblioteca, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Junto a los formatos de <c1/>, { "0.36" } añadió lectores y escritores de biblioteca para los archivos estándar que intercambian las herramientas de análisis de misión. Toman y devuelven texto o bytes y no tocan ningún archivo. Cada uno es una fila VALIDATED de la <a1>matriz de verificación</a1>, frente a la implementación independiente que allí se nombra:

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, con <c2/> para la forma XML): OPM, OMM y OCM en notación de palabra clave y valor (KVN) y NDM/XML, según CCSDS 502.0-B-3 (versiones { "3.0" } y { "2.0" } de OPM y OMM, { "3.0" } de OCM). Comprobado en ambos sentidos con Orekit: Orekit lee los archivos de Kshana y Kshana lee los de Orekit. Los hallazgos que quedan están fijados por pruebas.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, con <c2/>): AEM y APM según CCSDS 504.0-B-2, en KVN y NDM/XML. Comprobado con Orekit de la misma manera, y las rotaciones de los registros con las de Orekit.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): escritores y lectores de segmentos SPK de NAIF de los tipos { "9" } y { "13" } (con la exportación de un OEM de CCSDS a un núcleo SPK) y de los tipos { "3" } y { "21" } (polinomios de Chebyshev y líneas de diferencias extendidas), comprobados frente a los lectores propios del kit de herramientas SPICE de NAIF, hasta la identidad byte a byte. Kshana escribe los segmentos a partir de los registros que se le dan: no ajusta coeficientes de Chebyshev ni produce líneas de diferencias.

# text
seg-bb97cbb1ab9f = El importador y escritor CCSDS OEM, y el bloque de covarianza OEM, son anteriores y se describen en las importaciones de más arriba y en la matriz.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Solo los tipos de escenario de la tabla siguiente exportan geometría. Los tipos de escenario cuya geometría está centrada en la Luna, en Marte o en otro cuerpo no se exportan: CZML, KML y GeoJSON describen posiciones respecto a la Tierra, y esta versión escribe archivos STK solo con <c1/>, aunque el propio formato STK admite otros cuerpos centrales.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = <c1/>, <c2/> y <c3/> tienen una geometría referida a la Tierra que esta versión no exporta; la tabla indica el motivo en cada caso.

# text
# c1: gnss-ins
seg-2bb9237839f3 = El tipo de escenario <c1/> recorre su trayectoria en un plano tangente local plano, de modo que solo se exporta el origen del plano, no la trayectoria.

# text
seg-6049ab4ca3c9 = Las posiciones de satélite fijas a la Tierra desprecian UT1−UTC y el movimiento polar (véase Marcos y tiempo); las alturas de KML son elipsoidales, no sobre el nivel medio del mar.

# text
seg-4dda05aefd2b = Las huellas suponen propagación en espacio libre, un inhibidor en el horizonte del receptor y una Tierra esférica para el círculo.

# text
seg-2dd0656c518f = Todos los archivos de escenario

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = Lo que hace <c1/> con cada archivo de <c2/> (el manifiesto de la suite no es un escenario y se omite). «sí» significa que el formato se escribe y supera su validador; en otro caso, el número remite al motivo. Generado por <c3/>; <c4/> falla cuando está desactualizado.

# text
seg-c27f67dfbb37 = no [{ "1" }]

# text
seg-3468244e2385 = no [{ "2" }]

# text
seg-d0cf3f74cd10 = no [{ "3" }]

# text
seg-62c880979169 = no [{ "4" }]

# text
seg-9229b499c702 = no [{ "5" }]

# text
seg-d9d6561c9e5b = no [{ "6" }]

# text
seg-7d4a6538c638 = no [{ "7" }]

# text
seg-f170ed4d8dca = no [{ "8" }]

# text
seg-1c5eb5dca942 = no [{ "9" }]

# text
seg-a930bb0d2e42 = no [{ "10" }]

# text
seg-236853169f42 = no [{ "11" }]

# text
seg-411e4f3aeae7 = no [{ "12" }]

# text
seg-34fabcbb82f2 = no [{ "13" }]

# text
seg-772bd344bbce = no [{ "14" }]

# text
seg-460fd74c7c7e = no [{ "15" }]

# text
seg-e1d91ce54b8b = no [{ "16" }]

# text
seg-f3e0486f02e3 = no [{ "17" }]

# text
seg-884160b0ed12 = no [{ "18" }]

# text
seg-8202f4a426b0 = no [{ "19" }]

# text
seg-a4e9a36289e5 = no [{ "20" }]

# text
seg-034364e38105 = no [{ "21" }]

# text
seg-3e3b6ecc7b43 = Por qué no se aplica un formato:

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = los tipos de escenario <c1/> y <c2/> planifican contactos de enlace descendente y codificación; exporte un escenario <c3/> del mismo satélite y la misma estación para ver la geometría

# text
# c1: spectrum
seg-f587b4df1635 = SigMF contiene muestras complejas en banda base, que solo sintetiza el tipo de escenario <c1/>

# text
# c1: aocs
seg-d102fb18ce8d = el tipo de escenario <c1/> simula la actitud en torno al centro de masas, sin órbita ni posición en tierra, por lo que no hay nada que situar sobre la Tierra

# text
seg-ecc0e31b0369 = la entrada del escenario no incluye ninguna posición horizontal (ni latitud y longitud, ni coordenadas geocéntricas, ni elementos orbitales más allá, como mucho, de una altitud), por lo que no hay nada que situar sobre la Tierra

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = los tipos de escenario <c1/> y <c2/> calculan balances sin posición sobre la Tierra

# text
seg-1f17b963c7a6 = una efeméride STK describe la posición y la velocidad de un vehículo en función del tiempo; esta escena solo tiene puntos fijos o trazas sin marca de tiempo (un punto fijo es una instalación STK, no una efeméride)

# text
seg-f79d0ce7b945 = ningún escenario miembro de la campaña contiene nada que describa este formato; exporte un miembro por separado para ver su motivo

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = el tipo de escenario <c1/> analiza diseños de señal (espectros, seguimiento, adquisición, compatibilidad) sin posición de satélite ni de usuario; exporte el escenario <c2/> o <c3/> que haga volar el diseño

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = no se exporta en esta versión: los tipos de escenario de posicionamiento fusionado sitúan sus satélites en un marco fijo a la Tierra referido a una época que nunca nombran, por lo que una exportación con marcas de tiempo tendría que inventar la fecha del calendario (exporte en su lugar el escenario <c1/> o <c2/>)

# text
seg-3c57b084f0d7 = la geometría del tipo de escenario está centrada en la Luna, en Marte o en otro cuerpo del sistema solar; CZML, KML y GeoJSON describen posiciones sobre la Tierra o en torno a ella, y esta versión escribe efemérides STK solo con CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = no se exporta en esta versión: <c1/> sitúa sus satélites en un marco fijo al cuerpo referido a una época que nunca nombra, por lo que una exportación con marcas de tiempo tendría que inventar la fecha del calendario

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = no se exporta en esta versión: la constelación terrestre del Sistema Global de Navegación por Satélite (GNSS) de <c1/> se observa desde un receptor a distancia lunar, cuya trayectoria el tipo de escenario no expone como serie temporal

# text
# c1: entry-heating
seg-3cf7f7460c55 = no se exporta en esta versión: el tipo de escenario <c1/> informa de cargas máximas y de calentamiento, y no conserva ninguna traza en tierra con marcas de tiempo

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = el tipo de escenario <c1/> barre la disponibilidad y la intensidad del enlace para un usuario en una capa o en una trayectoria kepleriana; no tiene una única posición que situar en un mapa

# text
# c1: launch-window
seg-6271953188bd = el escenario <c1/> indica la latitud del emplazamiento de lanzamiento pero no la longitud, por lo que el emplazamiento no puede situarse

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = no se exporta en esta versión: la órbita de verdad de referencia de <c1/> es una referencia de ajuste cuyo ángulo de rotación terrestre en la época es una entrada (<c2/>, por defecto { "0" }), no derivada de la fecha del calendario, por lo que sus posiciones fijas a la Tierra no están vinculadas a una fecha

# text
seg-a03c2f0426db = este escenario de espectro no tiene bloque [iq], por lo que no se sintetizan muestras que grabar

# text
# c1: oem-interop
seg-d75f8ad6903a = no se exporta en esta versión: <c1/> lee y escribe un mensaje de efemérides orbitales (Orbit Ephemeris Message) del CCSDS (Consultative Committee for Space Data Systems), que es en sí mismo el archivo de intercambio de efemérides

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = el tipo de escenario <c1/> calcula estadísticas de enlace para emplazamientos en tierra sin geometría con marcas de tiempo que situar

# text
seg-146a2e8ee590 = el escenario barre otro escenario sobre una cuadrícula; exporte por separado el escenario barrido

# text
# c1: time-transfer-budget
seg-b74484e3586b = el tipo de escenario <c1/> calcula un balance de enlace y estabilidades, sin geometría con marcas de tiempo que situar

# text
seg-bcd613e62c69 = <s1>Anterior</s1>Exportación de animación

# text
seg-0525f7fbbfd2 = <s1>Siguiente</s1>Estado de validación

# text
seg-53a778722c16 = STK .e
