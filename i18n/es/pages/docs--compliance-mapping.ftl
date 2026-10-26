# docs--compliance-mapping: translations (es)

# attr:aria-label, text
seg-6555ff9a6d8e = Salida

# text
seg-2247a2344710 = Significado

# text
seg-d6476863f862 = Capacidad

# text
seg-ad856ad710eb = Estado

# text
seg-8d216d42c776 = Evaluación de la confianza del registro del receptor

# text
seg-ff808ce8ec48 = Fuentes PNT alternativas y diversas

# text
seg-3621a68a508c = Procedencia reproducible de la ejecución

# text
seg-50fe2a3ff712 = Monitorización de la integridad y niveles de protección

# text
# c1: docs/compliance/README.md
seg-554a16dc7965 = Fuente: <c1/>

# text
# c1: kshana compliance-report
seg-76db63e8d2de = Los compradores y los fabricantes de receptores responden ante marcos públicos de resiliencia. Esta carpeta hace corresponder, fila por fila, lo que Kshana calcula y registra con esos marcos, y <c1/> rellena la correspondencia a partir de las ejecuciones que usted tiene realmente.

# text
seg-e22a3aca9550 = <b>Redacción.</b> Las salidas de Kshana <em>aportan evidencias a favor de</em> un requisito. No son una calificación ni una aprobación de ningún producto, y ninguno de estos archivos es una declaración de un organismo de evaluación; Kshana no lo es. El texto de los requisitos se parafrasea, nunca se reproduce.

# text
seg-2602c3f5aff6 = Marco

# text
seg-245fe1f87b08 = Archivo

# text
seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

# text
seg-0f7279ffb619 = Orientaciones de la OMI sobre interferencia GNSS para buques

# text
seg-f318176b86de = Orientaciones de la EASA sobre interferencia GNSS para la aviación

# text
seg-7939ac1eea3b = Directiva NIS2 de la UE, artículo { "21" }

# text
seg-f2eccc9b815f = EN { "16803" } (norma de pago; solo por partes y números de cláusula visibles en el catálogo)

# text
seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (enero de { "2023" })

# text
# c1: kshana standards-pack list
seg-499fc17fb83a = Los <b>paquetes de normas</b> ({ "0.38" }) convierten un marco en escenarios puntuados: cada paquete tiene escenarios, umbrales fijados antes de la ejecución y filas a favor de las cuales aporta evidencias. <c1/> los muestra.

# text
seg-9c0eb89a2fbe = Paquete

# text
seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, perfiles de prueba para los niveles { "1" } a { "4" }

# text
seg-13e63b993f26 = IMO MSC.1/Circ.1575, tratamiento de datos PNT a bordo: niveles de exactitud e integridad

# text
seg-aa77ffe0acbf = ICAO Doc { "9849" } Apéndice F, vigilar, evaluar y mitigar la interferencia GNSS

# text
seg-b9387be0e4f1 = Cada archivo enumera sus documentos fuente con la versión, la URL, la fecha de lectura y lo que se comprobó y lo que no. Las fuentes se leyeron el 2026-10-09 (el perfil del NIST el 2026-10-18; el boletín de la EASA y las páginas del catálogo de EN { "16803" } se comprobaron de nuevo el 2026-10-10). Cuando una fuente solo pudo leerse a través de un espejo o de una página de catálogo, el archivo lo indica.

# attr:alt
seg-e98e25897176 = Todas las pruebas de los tres paquetes de normas puntuados, a partir de ejecuciones reales del motor v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } alcanzadas, { "1" } no alcanzada, { "2" } necesitan una entrada; imo-circ-1575: { "1" } alcanzada, { "4" } no alcanzadas, { "2" } necesitan una entrada; icao-doc9849-appf: { "6" } alcanzadas, { "0" } no alcanzadas, { "2" } necesitan una entrada. En total, { "13" } alcanzadas, { "5" } no alcanzadas y { "6" } necesitan una entrada de la que el motor no dispone (un registro de receptor o documentación del equipo). Cada umbral se fijó antes de la ejecución; un fallo se conserva como fallo. Un umbral alcanzado indica que un escenario modelado alcanzó un umbral fijado, y nada acerca de un producto. Los paquetes aportan evidencias a favor de las filas que citan; no son una evaluación. Orientativo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de salvaguarda de la vida humana; no debe ser la única base de ninguna decisión de navegación o de seguridad.

# text
seg-092dd691ca17 = El informe

# text
# c1: compliance-report.compliance.md
# c2: compliance-report.compliance.json
# c3: --out <base>
# c4: <name>.result.json
# c5: <name>.toml
# c6: kshana receiver-trust
# c7: kind
# c8: kind
# c9: scenario_hash
seg-10fac3e641e0 = escribe <c1/> y <c2/> (<c3/> cambia el nombre). Las entradas son archivos de resultados de ejecuciones anteriores: la ejecución de un escenario escribe <c4/> junto a <c5/>, y <c6/> escribe el suyo. El tipo de escenario de cada ejecución se lee del archivo de escenario contiguo al resultado, del contenido de un resultado de receiver-trust o de un <c7/> de nivel superior, y debe ser un tipo de escenario que el motor conozca. Un resultado se enumera como no utilizado, con el motivo, y no cuenta para nada cuando no se encuentra su tipo de escenario, no es un tipo de escenario conocido, o el escenario contiguo y el <c8/> del propio resultado discrepan. (El <c9/> del resultado y un hash del archivo de escenario no se comparan: el motor calcula el primero sobre su escenario analizado y un hash de archivo se calcula sobre el texto, de modo que son magnitudes distintas.)

# text
# c1: jamming
# c2: integrity
# c3: src/compliance/mapping.rs
# c4: KIND_FIELDS
seg-464351dcdcc3 = <b>Una etiqueta de tipo de escenario por sí sola no es evidencia.</b> Una ejecución cuenta para una capacidad solo cuando su resultado lleva también los campos que escribe ese tipo de escenario (por ejemplo, un resultado <c1/> necesita sus cifras de mérito y sus filas por época; un resultado <c2/> necesita sus recuentos de muestras). Los campos se enumeran en <c3/> (<c4/>) y un resultado al que le falte uno no se cuenta. Un hash que no es hexadecimal no se notifica como hash. Un resultado de receiver-trust cuyos recuentos no son números enteros, o cuyo recuento de detectados o coincidentes supera su recuento de evaluables, se excluye y se enumera como no utilizado.

# text
seg-5a316d97f37b = Para cada fila, el informe da uno de estos valores:

# text
seg-2243532bd26b = cada capacidad que nombra la fila tiene al menos una ejecución en el conjunto

# text
seg-e905ae20cec1 = algunas la tienen

# text
seg-e23d6dfc4a00 = ninguna la tiene

# text
seg-cf223ce076ce = ninguna salida de Kshana se refiere a la fila

# text
# c1: --mapping
# c2: --sources
seg-ec76997fb4d4 = La columna de brecha se imprime para cada fila, incluidas las que cuentan con evidencias: una ejecución que aporta evidencias a favor de una capacidad deja aún la mayor parte de un requisito a otras evidencias. El informe repite la regla de redacción al principio. <c1/> imprime las tablas estáticas y <c2/> la lista de fuentes.

# text
seg-f1c508a908ad = Las ejecuciones de receiver-trust aportan además los recuentos que indican (sucesos detectados de los evaluables, predicciones coincidentes de las evaluables). Estos describen ese registro, puntuado frente a sucesos y tolerancias fijados antes de la ejecución, y se notifican tal como los indica la ejecución.

# text
seg-662b717575e0 = Tipos de escenario de las ejecuciones

# text
seg-4377e24c36f5 = estado de confianza por época del propio registro de un receptor real, momentos de alarma y concordancia con sucesos fijados antes de la ejecución

# text
seg-766182e85848 = Efectos del balance del enlace en jamming

# text
seg-6bee09017be6 = densidad de portadora a ruido y estado de enganche por satélite bajo una geometría de jammer indicada

# text
seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

# text
seg-48fb757a45fc = Detección de spoofing y meaconing

# text
seg-2e4a3355a936 = decisiones del detector y discriminación del detector bajo un ataque de spoofing indicado

# text
seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

# text
seg-e9a55e5a015b = niveles de protección, disponibilidad frente a límites de alerta y resultados de detección de fallos

# text
seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

# text
seg-6344bf03463c = Holdover y marcha libre

# text
seg-a643345646c3 = crecimiento del error de posición o de tiempo mientras se deniega el GNSS, frente a un umbral indicado

# text
seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

# text
seg-97e06c8a9b7f = rendimiento de navegación o de temporización a partir de fuentes independientes de la banda GNSS principal

# text
seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

# text
seg-25291db2798d = Puntuación de resiliencia sobre conjuntos de amenazas

# text
seg-9eef8dd0d9b9 = razones de supervivencia y de resiliencia por vector de amenaza sobre un conjunto indicado, con las hipótesis indicadas

# text
seg-bdaa039247bd = conflict-resilience, campaign

# text
seg-e4be26a0cc63 = hash del escenario, versión del motor y semilla incluidos en cada resultado para que una ejecución pueda repetirse

# text
# c1: scenario_hash
seg-89edc36c3560 = cualquier ejecución cuyo resultado lleve un <c1/>

# text
seg-488aeabdc552 = <s1>Anterior</s1>Ejecutar un receptor frente a un escenario

# text
seg-53a872636d5a = <s1>Siguiente</s1>Marco PNT resiliente del DHS de EE. UU.
