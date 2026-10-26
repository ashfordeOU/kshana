# docs--kinds-constellations-coverage-and-geometry: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-e7dad1a1ecba = Posicionamiento en torno a cualquier cuerpo del sistema solar: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo central elegido por nombre (Marte, la Luna, Europa, Ganímedes, Titán y el resto del catálogo del sistema solar), que navega con pseudodistancias unidireccionales de una pequeña constelación de navegación Walker en torno al cuerpo (órbitas de dos cuerpos con la deriva secular J2 propia del cuerpo, un reloj de usuario desconocido) y, opcionalmente, una medida de distancia bidireccional de espacio profundo desde la Tierra, libre de reloj, cuya dirección y distancia proceden de las efemérides analíticas del sistema solar en cada época. Las líneas de visión quedan bloqueadas por la esfera media del cuerpo, y un usuario en superficie necesita además la máscara de elevación. Por época: relés a la vista, si la Tierra está por encima del limbo, el GDOP y el PDOP solo de la constelación (dilución de la precisión geométrica y de posición), la incertidumbre formal de posición de un sigma con y sin la fila de la Tierra, y el error de un ajuste de mínimos cuadrados de Gauss-Newton con semilla en cada caso; a lo largo de la ejecución: disponibilidad, visibilidad de la Tierra, PDOP mediano, error RMS y sigma formal mediano, además del tiempo de luz de la Tierra al cuerpo, el viaje de ida y vuelta, el retardo de Shapiro y la separación del Sol en la época. MODELLED: las órbitas de los relés, los niveles de ruido y el modelo de medida instantáneo son decisiones de modelado, no validadas frente a datos de navegación de una misión; las constantes del cuerpo son los valores publicados citados en body.rs, y la geometría de la Tierra hereda las etiquetas de las efemérides del sistema solar.

# attr:alt
seg-6f341acbe994 = El gráfico que escribe el motor para scenarios/mars-orbit-pnt.toml, tipo de escenario body-pnt

# text
seg-de173c9f4034 = Diseño de constelaciones a gran escala: patrones Walker DELTA y Walker STAR en la convención i: T/P/F (nodos repartidos en { "360" } o { "180" } deg, separación en el plano { "360" }<em>P/T, desfase entre planos { "360" }</em>F/T), listas explícitas de elementos y diseños de varias capas, varias constelaciones en una ejecución, alrededor de la Tierra, la Luna, Marte o cualquier otro planeta, Plutón o luna principal, con las constantes del módulo body (las mismas que usan los tipos de escenario solar-system y body-pnt). PRESETS a partir de elementos nominales publicados: gps-baseline y gps-expandable (los { "24" } huecos y los seis pares expandibles delantero/trasero del GPS Standard Positioning Service Performance Standard, 5.ª edición { "2020" }, tablas 3.2-1 a 3.2-3), galileo (Walker 24/3/1 a { "29 599.801" } km y { "56" } deg, Galileo Open Service Service Definition Document edición { "1.1" } tablas { "1" } y { "23" }), beidou y beidou-meo (Walker 24/3/1 a { "21 528" } km y { "55" } deg más tres satélites geoestacionarios a { "80" }, { "110.5" } y { "140" } deg E y tres satélites geosíncronos inclinados a { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } sección { "4.1" }; la fase MEO y el cruce geosíncrono inclinado de { "118" } deg E están modelados porque la norma no los indica) y glonass (24/3/1 a { "19 100" } km y { "64.8" } deg a partir de la fórmula de huecos del GLONASS Interface Control Document edición { "5.1" } sección { "5.2" }). COBERTURA Y DILUCIÓN DE LA PRECISIÓN: sobre una cuadrícula de latitud/longitud y una ventana muestreada con máscara de elevación, el número de satélites a la vista, GDOP, PDOP, HDOP y VDOP por celda, la disponibilidad (una solución con PDOP igual o inferior a un umbral, { "6" } por defecto) por celda, globalmente (ponderada por área) y en el peor emplazamiento, con un reloj de receptor por constelación salvo que clock = "common". Escala a miles de satélites: la visibilidad es un producto escalar frente al semiángulo de cobertura de cada satélite, y los satélites se agrupan en bandas por latitud subsatélite en cada época, de modo que una fila de la cuadrícula solo prueba los que pueden estar a la vista; el informe cuenta las pruebas de pares ahorradas. El JSON incluye los mapas de la cuadrícula y las trazas en tierra por satélite submuestreadas. VALIDATED: el generador Walker frente a la tabla { "23" } del Galileo OS SDD y la fórmula de huecos del ICD de GLONASS, el preset de GPS frente a la columna publicada de cruce ecuatorial de la tabla 3.2-1 de SPS PS, y la distribución global de HDOP de la línea base de GPS frente al apéndice B de SPS PS (mediana { "0.94" }, { "95" } % { "1.25" }, media { "0.96" }, tolerancia { "0.03" }). MODELLED: órbitas de dos cuerpos con J2 secular opcional, un cuerpo esférico, solo visibilidad geométrica (sin potencia de señal, estado de salud ni terreno), y la fase relativa entre sistemas distintos, que no es una instantánea de ninguna fecha real.

# attr:alt
seg-899e728ad9bd = El gráfico que escribe el motor para scenarios/leo-pnt-mega-shell.toml, tipo de escenario constellation-design

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemérides y traza en tierra: propaga un satélite (TLE→SGP4 u órbita analítica) y emite su estado TEME/GCRS (posición + velocidad), su posición ITRF/ECEF, la latitud/longitud/altitud WGS-84 del punto subsatélite, y por paso el acimut/elevación/distancia de la estación y la velocidad de distancia (Doppler). El satélite procede de un <c1/> o de una <c2/> analítica con su <c3/> (un <c4/> prevalece cuando se dan ambos); con un <c5/>, un <c6/> sustituye a la época propia del TLE como t = { "0" }.

# attr:alt
seg-0fd3c58fde09 = El gráfico que escribe el motor para scenarios/ephemeris.toml, tipo de escenario ephemeris
