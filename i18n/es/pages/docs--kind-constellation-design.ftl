# docs--kind-constellation-design: translations (es)

# text
seg-e27476e37522 = Tierra

# text
seg-37d29d8303fe = km

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-670191cf797f = Página de tema: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
# c1: docs/kinds/by-kind/constellation-design.md
seg-f305ed6dc164 = Fuente: <c1/>

# text
# c1: constellation-design
seg-f708c26a5139 = <c1/> (tipo de escenario)

# text
seg-de173c9f4034 = Diseño de constelaciones a gran escala: patrones Walker DELTA y Walker STAR en la convención i: T/P/F (nodos repartidos en { "360" } o { "180" } deg, separación en el plano { "360" }<em>P/T, desfase entre planos { "360" }</em>F/T), listas explícitas de elementos y diseños de varias capas, varias constelaciones en una ejecución, alrededor de la Tierra, la Luna, Marte o cualquier otro planeta, Plutón o luna principal, con las constantes del módulo body (las mismas que usan los tipos de escenario solar-system y body-pnt). PRESETS a partir de elementos nominales publicados: gps-baseline y gps-expandable (los { "24" } huecos y los seis pares expandibles delantero/trasero del GPS Standard Positioning Service Performance Standard, 5.ª edición { "2020" }, tablas 3.2-1 a 3.2-3), galileo (Walker 24/3/1 a { "29 599.801" } km y { "56" } deg, Galileo Open Service Service Definition Document edición { "1.1" } tablas { "1" } y { "23" }), beidou y beidou-meo (Walker 24/3/1 a { "21 528" } km y { "55" } deg más tres satélites geoestacionarios a { "80" }, { "110.5" } y { "140" } deg E y tres satélites geosíncronos inclinados a { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } sección { "4.1" }; la fase MEO y el cruce geosíncrono inclinado de { "118" } deg E están modelados porque la norma no los indica) y glonass (24/3/1 a { "19 100" } km y { "64.8" } deg a partir de la fórmula de huecos del GLONASS Interface Control Document edición { "5.1" } sección { "5.2" }). COBERTURA Y DILUCIÓN DE LA PRECISIÓN: sobre una cuadrícula de latitud/longitud y una ventana muestreada con máscara de elevación, el número de satélites a la vista, GDOP, PDOP, HDOP y VDOP por celda, la disponibilidad (una solución con PDOP igual o inferior a un umbral, { "6" } por defecto) por celda, globalmente (ponderada por área) y en el peor emplazamiento, con un reloj de receptor por constelación salvo que clock = "common". Escala a miles de satélites: la visibilidad es un producto escalar frente al semiángulo de cobertura de cada satélite, y los satélites se agrupan en bandas por latitud subsatélite en cada época, de modo que una fila de la cuadrícula solo prueba los que pueden estar a la vista; el informe cuenta las pruebas de pares ahorradas. El JSON incluye los mapas de la cuadrícula y las trazas en tierra por satélite submuestreadas. VALIDATED: el generador Walker frente a la tabla { "23" } del Galileo OS SDD y la fórmula de huecos del ICD de GLONASS, el preset de GPS frente a la columna publicada de cruce ecuatorial de la tabla 3.2-1 de SPS PS, y la distribución global de HDOP de la línea base de GPS frente al apéndice B de SPS PS (mediana { "0.94" }, { "95" } % { "1.25" }, media { "0.96" }, tolerancia { "0.03" }). MODELLED: órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico, solo visibilidad geométrica (sin potencia de señal, estado de salud ni terreno), y la fase relativa entre sistemas distintos, que no es una instantánea de ninguna fecha real.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-21fbd84bfba1 = Una ejecución de <c1/> se resume así: constellation-design: { "5000" } satellites (LEO-PNT) around the Earth; availability { "99.22" }% (PDOP <= { "3" } at { "20" } deg mask), worst site { "0.00" }%, median PDOP { "1.11" }, mean { "39.4" } in view; { "648" } grid points x { "12" } epochs (MODELLED)

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-af572ce1fd89 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-fd393ddc7d5d = El ejemplo <c1/> establece, entre otros:

# text
seg-d72b4c5393e0 = earth

# text
seg-d9b3c54bd272 = common

# text
seg-6411970ba342 = delta

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-0a6f7f6c66c4 = km^3/s^{ "2" }

# text
seg-ab9b72b9ffce = Etiqueta del resultado (la del motor): MODELLED - órbitas keplerianas de dos cuerpos (J2 secular opcional) alrededor de un cuerpo esférico, visibilidad geométrica por encima de una máscara de elevación, dilución de la precisión con todos los satélites a la vista con un reloj de receptor por constelación salvo que clock = "common"; sin potencia de señal, estado de salud ni terreno. La geometría Walker y los presets publi

# attr:alt
seg-899e728ad9bd = El gráfico que escribe el motor para scenarios/leo-pnt-mega-shell.toml, tipo de escenario constellation-design

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: constellation-design
seg-602493ac6987 = <b>VALIDATED</b> Los generadores del tipo de escenario <c1/>: patrones Walker delta y star en la convención T/P/F (separación de nodos 360/P o 180/P, separación en el plano { "360" }·P/T, desfase entre planos { "360" }·F/T), y los 24 huecos de la línea base y expandible de GPS, Gal

# text
# c1: constellation-design
seg-bdc81f37ad16 = <b>VALIDATED</b> El motor de cobertura del tipo de escenario <c1/> sobre el preset de línea base de 24 huecos de GPS bajo las condiciones del apéndice B del GPS Standard Positioning Service Performance Standard (SPS PS) (un día sidéreo, { "287" } pasos de cinco minutos, una cuadrícula global de { "4" } x { "4" } deg c

# text
# c1: constellation-design
seg-1272200ad4f2 = <b>MODELLED</b> El tipo de escenario <c1/> más allá de los dos casos fijados: diseños explícitos y de varias capas, varias constelaciones por ejecución con un reloj de receptor por constelación, la Tierra, la Luna y Marte a partir de las constantes de los cuerpos, el preset de BeiDou Pruebas: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

# text
# c1: constellation-design
seg-0c64f22330d2 = <b>VALIDATED</b> Los generadores del tipo de escenario <c1/>: patrones Walker delta y star en la convención T/P/F (separación de nodos 360/P o 180/P, separación en el plano { "360" }·P/T, int. Referencia independiente (ExternalDataset): Documentos de agencia publicados: Galileo Open Service Service Definition Document edición { "1.1" } (European GNSS Service Centre) tablas { "1" } y { "23" }, la constelación de referencia a 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edición { "5.1" } ({ "2008" }) sección { "5.2" }, la fórmula de huecos para la longitud del nodo y el argumento de latitud; GPS Standard Positioning Service Performance Standard 5.ª edición (abril de { "2020" }) tablas 3.2-1, 3.2-2 y

# text
# c1: constellation-design
seg-87c4e19dc780 = <b>VALIDATED</b> El motor de cobertura del tipo de escenario <c1/> sobre el preset de línea base de 24 huecos de GPS bajo el GPS Standard Positioning Service Performance Standard (SPS PS) apéndice . Referencia independiente (ExternalDataset): GPS SPS PS 5.ª edición (abril de { "2020" }) apéndice B secciones B.3.2.2 y B.3.2.3, la distribución publicada de HDOP promedio global de la constelación base de 24 huecos totalmente ocupada (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, media { "0.96" }), la tabla 3.8-1 (disponibilidad de PDOP) y la tabla B.3-1 (PDOP de conjunto de una constelación degradada, usada solo como cota superior), más una forma cerrada derivada a mano para una época. El VDOP y el PD

# text
# c1: constellation-design
seg-04289f7252cd = <b>MODELLED</b> El tipo de escenario <c1/> más allá de los dos casos fijados: diseños explícitos y de varias capas, varias constelaciones por ejecución con un reloj de receptor por conste. Referencia independiente (InternalConsistency): Autoconsistencia interna: el barrido de elevación por fuerza bruta, las reducciones calculadas a mano y las de orbit::dop, y la geometría Walker y geosíncrona de forma cerrada. Órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico con la vertical local a lo largo del radio, solo visibilidad geométrica (sin potencia de señal, estado de salud del satélite, terreno ni perturbación de terceros cuerpos), y la fase relativa entre sistemas tomada de distintas re

# text
# c1: label
seg-00fa65d44cbd = MODELLED - órbitas keplerianas de dos cuerpos (J2 secular opcional) alrededor de un cuerpo esférico, visibilidad geométrica por encima de una máscara de elevación, dilución de la precisión con todos los satélites a la vista con un reloj de receptor por constelación salvo que clock = "common"; sin potencia de señal, estado de salud ni terreno. La geometría Walker y los presets publicados se comprueban frente al Galileo OS SDD, el ICD de GLONASS y las tablas de huecos del GPS SPS Performance Standard, a (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-62f0fc16a247 = MODELLED: órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico, solo visibilidad geométrica (sin potencia de señal, estado de salud ni terreno), y la fase relativa entre sistemas distintos, que no es una instantánea de ninguna fecha real. (catálogo de tipos de escenario (<c1/>))

# text
seg-3ef4276dd40b = Lo que responde la ejecución: satélites a la vista, PDOP/HDOP/VDOP/GDOP por celda de { "10" } deg, y la proporción de tiempo con PDOP igual o inferior a { "3" } por encima de una máscara de { "20" } deg durante dos horas. El punto débil que muestra el mapa son los casquetes polares: ninguna capa llega por encima de unos { "82" } deg de latitud, de modo que un usuario cerca de un polo ve todos los satélites en un lado del cielo y la geometría vertical se degrada. MODELLED: un diseño ilustrativo, órbitas de dos cuerpos con J2, un cuerpo esfé (comentario del archivo de escenario, líneas { "17" } a { "21" })

# text
seg-c333d3fe22cd = Los mapas de cobertura y de dilución de la precisión para diseños multiconstelación arbitrarios a gran escala, alrededor de cualquier cuerpo central, son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-436504a8b26f = <s1>Anterior</s1>conflict-resilience

# text
seg-cba188459c80 = <s1>Siguiente</s1>contact-schedule
