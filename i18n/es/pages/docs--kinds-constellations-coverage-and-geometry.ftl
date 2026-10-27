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

# text
seg-3f749aef8d89 = PNT de espacio profundo en Marte: una constelación simulada de relés MARCONI (relés areoestacionarios e inclinados que emiten en un sentido y retransmiten en ambos sentidos a una estación de espacio profundo) navega a un usuario de referencia (transfer | lmo | surface) mediante el estimador de fusión radiométrica conjunta unidireccional y bidireccional. Indica la geometría y la visibilidad por época, el RMS alcanzado frente a la verdad, y la covarianza formal (posición 1σ / 3σ): una cifra de mérito simulada honesta, NO un nivel de protección certificado.

# attr:alt
seg-c564dca90854 = El gráfico que el motor genera para scenarios/mars-pnt-lmo.toml, tipo de escenario mars-pnt

# text
seg-cb4262b66b8f = Disponibilidad de GNSS y DOP a partir de una constelación orbital (Walker / TLE / RINEX).

# attr:alt
seg-3b652c0da6de = El gráfico que el motor genera para scenarios/orbit-rinex.toml, tipo de escenario orbit

# text
seg-a4bdfc291fce = Predicción de pases sobre una estación terrestre: los pases de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación aparente máxima, duración) de una órbita circular, como elementos medios SGP4 al inicio de la ventana, sobre una estación por encima de una máscara de elevación a lo largo de una ventana, con el tiempo total de acceso. Propagación SGP4/SDP4 en el marco fijo a la Tierra IAU 2006/2000A (UT1 - UTC y movimiento polar opcionales), refracción troposférica ITU-R P.834-9 y tiempo de luz del enlace descendente (ambos activados por defecto), cruces resueltos hasta { "1e-7" } s y la culminación mediante búsqueda por sección áurea. La geometría de los pases está VALIDATED frente a Orekit { "13.1.8" } en estaciones a nivel del mar; la órbita y la estación del escenario son entradas ilustrativas.

# attr:alt
seg-a09be8c586e3 = El gráfico que el motor genera para scenarios/passes.toml, tipo de escenario passes

# text
seg-0549bc926a9b = Todo el sistema solar en una época, para PNT (posicionamiento, navegación y temporización) alrededor de cualquier cuerpo. Para el Sol, los ocho planetas, Plutón, la Luna, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán indica la posición y la velocidad heliocéntricas en el ICRF (Marco de Referencia Celeste Internacional, ecuatorial J2000), la distancia heliocéntrica y la longitud y latitud eclípticas J2000, el parámetro gravitacional, el radio ecuatorial y medio, J2 donde está publicado y su radio de referencia, el periodo de rotación sidéreo, el polo de la IAU y el meridiano origen en la época, una traza orbital muestreada a lo largo de una revolución (heliocéntrica para los planetas, centrada en el cuerpo principal para las lunas), y el tiempo de luz, la distancia unidireccional y bidireccional, el retardo de Shapiro solar y la separación del Sol desde un cuerpo observador (por defecto la Tierra); los enlaces adicionales de origen a destino reciben el mismo tratamiento. Posiciones: los elementos keplerianos de JPL de Standish y Williams (Tabla { "1" } para { "1800" } d. C. a { "2050" } d. C., Tablas 2a/2b para { "3000" } a. C. a { "3000" } d. C.) con el error nominal de cada planeta, la serie lunar de Montenbruck & Gill para la separación Tierra-Luna, los elementos medios de JPL con la tasa de rotación síncrona de la IAU para las lunas de Marte y las galileanas, y el modelo de rotación de la IAU para Titán. Tiempo de luz: la resolución radiométrica de punto fijo, con el transmisor en su posición retardada; newtoniano, con el retardo de Shapiro indicado por separado. VALIDATED frente a JPL Horizons (DE441) dentro del doble del error nominal: de Mercurio a Saturno y la Tierra a partir de la Tabla { "1" } (peor caso { "1.87" } veces el nominal) y los ocho planetas a partir de las Tablas 2a/2b (peor caso { "1.71" } veces), y el tiempo de luz de la Tierra a Marte y a Júpiter. MODELLED, con cada fila etiquetada: Urano y Neptuno a partir de la Tabla { "1" } ({ "2.0" } y { "5.2" } veces el error nominal frente a DE441), Plutón (la fila de { "1992" }; sin error indicado), la Luna y las siete lunas (medidas frente a Horizons, sin cota publicada).

# attr:alt
seg-537aa8010e50 = El gráfico que el motor genera para scenarios/solar-system-tour.toml, tipo de escenario solar-system

# text
seg-4e31c8daf798 = Registro

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Fuente: <c1/>

# text
seg-34a6079984a7 = Constelaciones, cobertura y geometría (familia de tipos de escenario)

# text
seg-6800289a282d = { "7" } tipos de escenario del motor v{ $version }. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Todas las etiquetas de aquí son las del motor o las de la matriz de verificación; un tipo es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Páginas temáticas: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Ejecute una: <c1/>. Todas las familias: <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Hoja de contactos de los gráficos que el motor genera para los tipos de escenario de la familia Constelaciones, cobertura y geometría

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Efemérides y traza en tierra: propaga un satélite (TLE→SGP4 u órbita analítica) y emite su estado TEME/GCRS (posición + velocidad), posición ITRF/ECEF, latitud, longitud y altitud del subsatélite en WGS-84, y por paso

# text
seg-d021c1b23dbc = Diseño de constelaciones a escala: patrones Walker DELTA y Walker STAR en la convención i: T/P/F (nodos repartidos en { "360" } o { "180" } grados, separación en el plano { "360" }<em>P/T, desfase de fase entre planos { "360" }</em>F/T), explícito

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = Todo el sistema solar en una época, para PNT (posicionamiento, navegación y temporización) alrededor de cualquier cuerpo.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Posicionamiento alrededor de cualquier cuerpo del sistema solar: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo central elegido por nombre (Marte, la Luna, Europa, Ganímedes, Titán y el resto del catálogo del sistema solar), navega

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = PNT de espacio profundo en Marte: una constelación simulada de relés MARCONI (relés areoestacionarios e inclinados que emiten en un sentido y retransmiten en ambos sentidos a una estación de espacio profundo) navega a un usuario de referencia (transfer / l

# text
seg-cc85d9962c25 = Predicción de pases sobre una estación terrestre: los pases de visibilidad en el dominio del tiempo (AOS/TCA/LOS, elevación aparente máxima, duración) de una órbita circular, como elementos medios SGP4 al inicio de la ventana, sobre una estación por

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Opcionales: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Registro:</b> MODELLED { "4" } · VALIDATED { "4" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Campos obligatorios: <c1/>. Opcionales: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>ephemeris</a1>.

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
seg-47aaf1afd6ec = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "3" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Anterior</s1>Relojes, temporización y holdover

# text
seg-90ff7426b999 = <s1>Siguiente</s1>Mediciones GNSS, posicionamiento e integridad
