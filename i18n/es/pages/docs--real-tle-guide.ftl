# docs--real-tle-guide: translations (es)

# text
seg-a6da23b43f90 = <s1>Siguiente</s1>Campañas

# text
# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Fuente: <c1/>

# text
seg-68b27f011ced = Uso de TLE de constelaciones reales

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = El <c1/> incluido ya lleva <b>TLE reales</b> (conjuntos de elementos de dos líneas): la instantánea <c2/> de Celestrak de la constelación operativa GPS (Global Positioning System) catalogada el 2021-07-28, { "30" } satélites, con <c3/>. Cada satélite se propaga con SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), validado frente a los vectores oficiales de AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. La misma instantánea se incorpora como <c4/>, y <c5/> descarga una nueva. Lea la sección { "3" } antes de citar una cifra de geometría obtenida de ella: ese escenario propaga cada satélite desde su propia época.

# text
# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Como ejemplo sintético y autónomo, <c1/> da seis satélites de tipo GPS como registros de línea 2 sueltos, propagados como elementos keplerianos analíticos, y todo escenario <c2/> sin un bloque <c3/> construye una constelación Walker.

# text
seg-1c9b96a07f5b = Para estudiar la constelación GPS <b>actual</b> (o cualquier otra), incorpore una instantánea reciente.

# text
seg-95bb71044de0 = { "1" }. Descargar una instantánea actual

# text
seg-ab93ab55ddd9 = <a1>Celestrak</a1> redistribuye los conjuntos de elementos del catálogo de NORAD (Mando de Defensa Aeroespacial de Norteamérica), actualizados al menos a diario. Para GPS:

# text
# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Otros grupos útiles: <c1/>, <c2/> (GLONASS, el Sistema Global de Navegación por Satélite de Rusia), <c3/>, <c4/> (la ISS, Estación Espacial Internacional, y otras estaciones tripuladas).

# text
seg-d7fe0dccbc36 = El archivo es una secuencia de registros de tres líneas (nombre, línea { "1" }, línea { "2" }). El analizador de Kshana ignora las líneas de nombre, de modo que puede pegar el archivo tal cual.

# text
seg-c2d6ca2089a1 = { "2" }. Incorporarla a un escenario

# text
# c1: tle
seg-6e221c5b640a = En cualquier escenario de órbita, fije el bloque <c1/> de la constelación con el contenido de la instantánea:

# text
seg-f2b0e78ef568 = (PRN es el número de código de ruido pseudoaleatorio que transmite un satélite GPS.)

# text
seg-976bcb48df94 = Un par de línea { "1" } + línea { "2" } se propaga con <b>SGP4/SDP4</b> (términos de arrastre y de espacio profundo); una línea { "2" } suelta se trata como elementos medios keplerianos analíticos. Ambos pueden mezclarse.

# text
# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> rechaza cualquier línea cuya suma de verificación módulo 10 de la columna 69 sea incorrecta: una buena comprobación de integridad en un archivo recién descargado. Su valor por defecto es <c2/> porque los escenarios didácticos sintéticos usan sumas de verificación de relleno.

# text
seg-90d3872ebf87 = { "3" }. Notas sobre las épocas: léalas antes de citar una cifra de geometría

# text
# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = SGP4 propaga cada satélite desde <b>su propia época de TLE</b>, y <c1/> (en <c2/>) devuelve solo propagadores, de modo que el tiempo del escenario <c3/> se aplica como <c4/> a cada satélite de forma independiente. Esa es la convención correcta solo si todos los conjuntos de elementos del archivo comparten una época.

# text
seg-3d04797ae50e = <b>Un archivo de grupo de Celestrak no le ofrece eso.</b> El archivo se <em>descarga</em> en un único instante, pero el conjunto de elementos de cada satélite se actualiza con su propio ritmo, de modo que las épocas que contiene se reparten a lo largo de días. Medido en los conjuntos incorporados a este repositorio (línea { "1" }, columnas { "19" }–{ "32" }):

# text
seg-5f67557dd207 = fixture

# text
seg-ce4855643f31 = conjuntos

# text
seg-49a5b4798be4 = dispersión de épocas

# text
seg-b758a9b7ee02 = { "70.6" } h

# text
seg-79e6ea88957c = { "76.4" } h

# text
seg-e1e30f69fa4f = { "335.7" } h

# text
# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h son { "5.9" } revoluciones de GPS. Propagado tal cual, el fasado en el plano queda revuelto: los satélites están a las altitudes e inclinaciones correctas, pero no donde estaban en ningún día concreto, de modo que el conjunto visible, el DOP (dilución de la precisión) y cualquier disponibilidad calculada a partir de ellos describen una constelación que nunca existió. Nada en el analizador mide por usted esta dispersión, y los tipos de escenario <c1/> e <c2/> no alinean épocas: un bloque TLE de un escenario se propaga siempre con la época de cada satélite.

# text
# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Haga esto en su lugar.</b> Conserve la época junto al propagador, elija un instante de referencia único y desplace a él el <c1/> de cada satélite. <c2/> es público, de modo que el bucle de análisis es corto; <c3/> (<c4/>) es el ejemplo resuelto de este árbol:

# text
# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME es el marco de ecuador verdadero y equinoccio medio en el que trabaja SGP4; <c1/> lo rota a coordenadas fijas a la Tierra con <c2/>.

# text
seg-78f483dfc3fa = Si no alinea las épocas, dígalo al informar de la cifra: es una afirmación sobre <em>capas</em> orbitales, no sobre un cielo real.

# text
# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = Cuánto importa esto se mide en <c1/>, que aplica los mismos desplazamientos (instante de referencia: la última época de los datos de prueba combinados de GPS + Galileo, 2026-06-07T07:{ "21" }:{ "04" } UTC (Tiempo Universal Coordinado)) a una ejecución de disponibilidad de ARAIM (monitorización autónoma avanzada de la integridad en el receptor) de doble constelación de { "24" } h. Con un VAL (límite de alerta vertical) de { "12" } m, el cielo alineado da { "0.993" } solo con GPS, { "1.000" } con GPS+Galileo combinados y { "0.990" } con doble constelación robusta ante fallos de constelación; la convención no alineada de época por satélite da { "0.208" }, { "0.671" } y { "0.031" } para las mismas entradas: una conclusión distinta, no un error pequeño.

# text
# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1>: los escenarios de órbita.

# text
# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1>: los campos del tipo de escenario <c2/>; los tipos de escenario <c3/>, <c4/>, <c5/> y <c6/> toman la misma tabla <c7/>, y <a2><c8/></a2> toma un único <c9/>.

# text
# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1>: el motor ARAIM que ejecuta la prueba de cielo real.

# text
# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/>: el analizador (<c2/>, <c3/>).

# text
seg-c9068c1bc579 = <s1>Anterior</s1>Esquema de resultados
