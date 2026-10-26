# docs--lunar-reference-station: translations (es)

# text
seg-f37311ad7ef0 = Salidas

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-9872e31ebd72 = Fuentes

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
seg-38afa54b0306 = Fuente: <c1/>

# text
seg-22eb5bd00092 = Finalidad

# text
seg-25678ae41147 = Material público describe una estación de referencia lunar en el polo sur que monitoriza un servicio de navegación lunar, calcula correcciones diferenciales locales, mantiene una referencia de tiempo lunar en un reloj atómico y lleva un retrorreflector láser y un transmisor VLBI para el marco de referencia lunar (la clase descrita públicamente para el concepto NovaMoon de ESA; fuentes abajo). Kshana ya modela cada pieza por separado. Este estudio las compone en un único análisis abierto y reproducible de lo que una estación así podría hacer bajo supuestos públicos, y lo preregistra para poder puntuarlo frente a resultados publicados y, con el tiempo, frente a resultados de vuelo.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = o <c1/> desde Python, WebAssembly o el <c2/> del servidor MCP con <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Mapa de cobertura y exactitud (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Para una estación de referencia diferencial en un emplazamiento conocido del polo sur: en cada punto de usuario de una malla en anillos desde { "80" }° S hasta el polo y sobre la región, a lo largo de un día de épocas y de ensayos Monte Carlo, el error de posición percentil corregido y sin corregir (3-D, horizontal, vertical), la disponibilidad con un motivo para cada época no disponible, la cobertura frente a un umbral indicado antes de la ejecución, los niveles de protección DO-229E, el radio de cobertura por sector de acimut y el balance del enlace de correcciones en la estación y en el peor punto. Ninguna física nueva: barre las funciones probadas de <c1/> y se reduce exactamente a ese tipo en un punto, una época y un ensayo.

# text
seg-94058315dfe4 = Entrada

# text
seg-7670cf4ceda3 = Valor por defecto

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Constelación (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) o <c6/>

# text
seg-bfdd053b2611 = el conjunto del repositorio de clase LCNS

# text
# c1: station_lat_deg
# c2: station_lon_deg
# c3: station_height_m
seg-6b9d48431e4b = Estación (<c1/>, <c2/>, <c3/>)

# text
seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

# text
seg-f32dcb376b51 = { "0.30" } m

# text
# c1: orbit_err_m
# c2: clock_err_m
# c3: sise_sigma_m
# c4: sise_orbit_variance_fraction
seg-59286c0377ce = <c1/>, <c2/>, o <c3/> con <c4/>

# text
seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE en la línea de visión { "65" } m)

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bits

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Malla (<c1/>, <c2/>) o <c3/>

# text
seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } puntos)

# text
seg-e945f5407b12 = la región de estudio

# text
# c1: t_start_s
# c2: t_span_s
# c3: t_step_s
# c4: n_trials
seg-fed48a6c31be = Tiempo (<c1/>, <c2/>, <c3/>), <c4/>

# text
seg-0fec404c8c7c = { "0" } s, un día, { "600" } s, { "200" }

# text
seg-d35d88b0753b = { "20" } m en p95 en el valor por defecto incluido ({ "1" } m en el ejemplo de fuentes públicas)

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

# text
# c1: units
# c2: tests/field_units_global.rs
# c3: availability
# c4: coverage_fraction
# c5: corrected_p_3d_m
# c6: corrected_p_h_m
# c7: corrected_p_v_m
# c8: uncorrected_p_3d_m
# c9: improvement_factor
# c10: hpl_max_m
# c11: vpl_max_m
# c12: hpl_below_alert_fraction
# c13: worst_point
# c14: coverage_radius_km
# c15: points[]
# c16: budget_at_station_and_at_edge
seg-c530b459b0ef = Cada campo numérico lleva una unidad y una clase de procedencia en el bloque <c1/> del resultado (comprobado por <c2/>). El bloque de región: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> por cada sector de acimut de { "30" }°; <c15/> por punto; y <c16/>.

# text
seg-4aa380258574 = Qué pueden y qué no pueden decir las comprobaciones

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/>: la reducción a <c2/>, los mínimos de línea base cero y de levantamiento, la monotonía, los motivos de indisponibilidad, el determinismo y la protección de trabajo. Muestran que el barrido es el modelo que dice barrer.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/>: un recálculo independiente con numpy de la aritmética sobre casos exportados, preregistrado antes de ejecutarse. Las posiciones y los percentiles alcanzaron sus umbrales; las correcciones de la estación no alcanzaron los suyos por redondeo de doble precisión (registrado, con sus cifras, en <c2/>).

# text
seg-d6f194e28401 = Máscaras de horizonte del terreno

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Una sección opcional <c1/> (<c2/>) da a la estación y a cada punto de usuario su propio horizonte dependiente del acimut, en el formato de tabla de perfil del horizonte de { "0.36" } (filas <c3/>, lineal en el acimut con cierre a { "360" }°). Un satélite cuenta en un emplazamiento cuando supera tanto <c4/> como el horizonte en su acimut; una época que el horizonte deja con menos de cuatro satélites en un punto, donde la máscara plana da cuatro, se notifica como <c5/> (<c6/> conserva su significado plano). Dos fuentes, combinadas como su máximo punto a punto cuando se dan ambas:

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = un perfil declarado, <c1/> o <c2/> (aplicado en cada punto de usuario), cada uno con una etiqueta <c3/> obligatoria;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = un horizonte trazado por marcha de rayos sobre un DEM polar (<c1/>): círculos máximos de la esfera lunar con curvatura exacta, desde una altura de mástil declarada (por defecto { "2" } m), cada <c2/> (por defecto { "1" }°), hasta <c3/> (por defecto { "150" } km) o el borde de la malla. El repositorio incluye un recorte del producto polar LOLA de LRO, de dominio público, <c4/>, remuestreado por medias de bloque de { "5" } × { "5" } a { "1200" } m y de unos ±{ "420" } km desde el polo (<c5/>: URL de origen, SHA-256, licencia, recorte y pasos de remuestreo);

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = o, en lugar de <c1/>, una tesela de DEM de latitud/longitud (<c2/>) en el formato de texto <c3/> (una cabecera <c4/>, luego las alturas en metros sobre la esfera media, por filas), recorrida por rayos del mismo modo, de forma que el espaciado en latitud fija el paso por defecto. El informe repite la ruta, el SHA-256 y la extensión de la tesela (<c5/>). Una tesela remuestreada a partir del recorte incluido da a la estación el propio horizonte del recorte con una diferencia de { "0.22" }° (<c6/>). No se incluye ninguna tesela.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = Las mismas máscaras se aplican a la malla de <c1/> (<c2/>, <c3/> y <c4/>; un punto de la malla fuera del DEM conserva la máscara plana y se cuenta). Sin la sección, cada documento es idéntico byte a byte al de una ejecución sin ella.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Comprobaciones: la marcha de rayos reproduce horizontes de forma cerrada (la depresión del horizonte de la esfera desnuda, un cráter en una meseta desde su centro y fuera de él, un cono rasterizado frente al cono analítico); el recorte incluido está orientado como la fuente (los suelos de Shackleton y Haworth bajos, el macizo de Malapert alto); un trazado de rayos independiente con numpy sobre el recorte, preregistrado (<c1/>), coincide hasta { "5.5e-10" } grados en cinco emplazamientos, lo que comprueba la aritmética, no el terreno. No se ha reproducido ninguna cifra publicada de horizonte polar ni de iluminación, por lo que la fila sigue siendo MODELLED (fila del registro "Lunar terrain horizon masks from a stated profile or a polar DEM").

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> ejecuta las entradas incluidas sobre una malla de { "2" }° con { "100" } ensayos y el horizonte del DEM en cada emplazamiento. El emplazamiento de la estación ({ "89" }° S, { "0" }° E) tiene un horizonte máximo de unos { "4.0" }°, por debajo de la máscara de { "5" }°, así que en la estación el terreno no condiciona; en los puntos de usuario la media ponderada por área del horizonte máximo de cada punto es { "9.7" }° y el mayor { "26.3" }°. Frente a las mismas entradas con la máscara plana, el error 3-D p95 corregido de la región sube de { "16.3" } m a { "18.6" } m y el mayor HPL de { "480" } m a { "62" } km. La disponibilidad de la región sube de { "91.9" } % a { "93.0" } %: una época no está disponible cuando un punto usa un satélite que la estación no ve, y un horizonte que oculta ese satélite al punto puede hacer disponible la época.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Terreno y enmascaramiento del horizonte: abordado en { "0.36" }, con límites.</b> Las máscaras de horizonte por emplazamiento a partir de un perfil declarado o del recorte de DEM LOLA incluido están modeladas (arriba). Lo que queda: el recorte incluido tiene { "1200" } m por píxel, de modo que el relieve inferior a un kilómetro aproximadamente se alisa y las medias de bloque rebajan los picos agudos; un rayo que sale del recorte (a unos { "420" } km del polo) termina allí; no hay difracción, multitrayecto por terreno ni obstrucción parcial; las posiciones de los emplazamientos para la medición de distancia permanecen sobre la esfera media a las alturas indicadas (el DEM solo fija el horizonte); el horizonte no está validado frente a una cifra externa. El emplazamiento de exportación por satélite de <c1/> se enmascara como un punto de la malla: con una sección <c2/>, cada fila exportada lleva <c3/> y el informe el horizonte del emplazamiento (<c4/>); los recuentos de antena en haz siguen contando todos los enlaces que superan la máscara plana.

# text
seg-677252c2d3e5 = Crecimiento del error de efemérides durante la latencia: abordado en { "0.36" } como opción voluntaria, con límites.

# text
seg-4f8274f839a7 = Comparación con las afirmaciones publicadas

# text
seg-82391b00e1bc = MODELLED. Una comparación de este modelo, ejecutado bajo los supuestos públicos, con las afirmaciones que hacen las fuentes. No es una afirmación sobre el rendimiento de ningún sistema real.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Fuentes S1 a S5 (título, URL, fecha de consulta, SHA-256, licencia): <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Cada afirmación numérica, citada con su página y sus supuestos declarados y clasificada como comparable, parcialmente comparable o no comparable: <c1/>. Ninguna afirmación es totalmente comparable, porque ninguna fuente indica un percentil ni los elementos orbitales de los satélites.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Umbrales, casos y entradas, confirmados por separado antes de la ejecución (revisión { "2" }, 05bf9a19), y la ejecución registrada: <c1/>. El hallazgo está fijado en <c2/>.

# text
seg-069a652c402e = umbral

# text
seg-d6120708c062 = afirmación (fuentes)

# text
seg-5b480535b54b = este modelo

# text
seg-6231a005ccc9 = veredicto

# text
seg-45dc6ff5d546 = una estación da exactitud submétrica sobre todo el círculo de { "300" } km del polo sur (S1, S2, S3)

# text
seg-4da98cf6180b = cobertura { "0.00" }

# text
seg-70a79ec95bf4 = falla

# text
seg-cd0e9021aaa3 = lo mismo, círculo de { "600" } km (S2 p. 10, S3 p. 23)

# text
seg-ef9f2ee31c52 = submétrica con correcciones de código (S1, S2)

# text
seg-9f4e2b6991e8 = 3-D p95 corregido { "280.6" } m

# text
seg-ac3c99ec0d15 = <={ "1.5" } m

# text
seg-1b720f1677cc = "nivel decimétrico" a partir de correcciones de seudodistancia (S3 p. 22, S5 p. 5)

# text
seg-ffa1c831a14f = { "280.6" } m

# text
seg-70368d910820 = <= { "0.15" } m

# text
seg-786f940b345e = falla (no podía pasar con el ruido de código de { "0.30" } m de las fuentes)

# text
seg-da761dde1cae = submétrica mantenida con { "600" } s de latencia (S2 p. 16)

# text
seg-2a9db96bd87f = { "293.0" } m

# text
seg-021336eb5623 = la misma exactitud con una línea base de { "10" } km a { "500" } km (S2 p. 17)

# text
seg-62190343777c = razón { "1.39" }

# text
seg-7a33a168b020 = pasa

# text
seg-1da5fcf7bbf5 = Predicción preregistrada

# text
seg-e6aef34d5023 = Laboratorio de tiempo de la estación

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Si el miniRAFS de la estación, dirigido a LTC y luego en marcha libre o redirigido, se mantiene dentro de { "1" }, { "10" } y { "100" } ns: el bloque opcional <c1/> de <c2/> (<c3/>). El miniRAFS alcanza { "1" } ns tras { "2.8" } s, { "10" } ns tras { "377" } s y { "100" } ns tras { "10.5" } h; el objetivo de nivel nanosegundo de la fuente se cita, no se adopta. MODELLED. Modelo, resultados, la tabla de tiempo hasta el umbral para cuatro clases de reloj y la comparación con las fuentes: <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Geodesia de la estación

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Cada fuente por título, identificador y editor, con su fecha de consulta y su licencia. Las URL, los hashes SHA-256 y las notas sobre dónde discrepan las fuentes están en el registro, <a1><c1/></a1>. No se redistribuye ningún archivo fuente. Los nombres de personas se omiten a propósito.

# text
seg-b1f1e1efa042 = id

# text
seg-02071a726f21 = título

# text
seg-0634af374469 = identificador

# text
seg-fd875b5fb817 = editor

# text
seg-a6f8ef268fcc = consultado

# text
seg-d04709ddc97d = licencia

# text
seg-1d4174e911c1 = libro blanco sobre una estación de referencia lunar para posicionamiento, temporización y ciencia, versión { "3" }

# text
seg-e09e1cc11921 = arXiv (libro blanco de los autores)

# text
seg-c91720d34bd3 = licencia no exclusiva de arXiv para distribuir { "1.0" } (concede derechos solo a arXiv)

# text
seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } diapositivas)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, sección { "6" }, elemento { "07" }

# text
seg-406990fe43a8 = Taller ICG-IOAG sobre PNT cislunar, febrero de { "2025" }; diapositivas de la Agencia Espacial Europea

# text
seg-58579c3faf2f = ninguna indicada; marcadas como divulgables al público desde la diapositiva { "3" }

# text
seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } diapositivas)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, sesión del Grupo de Trabajo Conjunto del ICG sobre PNT lunar, junio de { "2024" }; diapositivas de la Agencia Espacial Europea

# text
seg-f4e53e44f0b5 = ninguna indicada; marcadas como divulgables al público

# text
seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } diapositivas)

# text
seg-3fd0ab93507d = 2.º Taller ICG-IOAG sobre PNT cislunar, febrero de { "2026" }; diapositivas de la Agencia Espacial Europea y Telespazio

# text
seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } diapositivas)

# text
seg-6229db9cb23d = Taller sobre PNT cislunar, febrero de { "2026" }; diapositivas de la Agencia Espacial Europea

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, y <c1/> del repositorio

# text
# c1: lunar_afs
seg-4e07c500e353 = según lo registrado con <c1/>

# text
seg-28f8d886c4e5 = ya en el repositorio

# text
seg-2006c194fef6 = según lo registrado allí

# text
seg-68db6a17b4e7 = <s1>Anterior</s1>Sistema solar y otros cuerpos

# text
seg-79d53edd2374 = <s1>Siguiente</s1>Navegación de usuarios espaciales (gnss-ssv)

# text
seg-9c59637f0666 = Mapa de cobertura y exactitud (lunar-station-coverage)

# text
seg-329ad585cd9b = ILUSTRATIVO: no existe ningún valor público

# text
seg-389db26524b4 = ILUSTRATIVO en el valor por defecto incluido; el ejemplo de fuentes públicas fija cuatro satélites y el periodo de { "24" } h de S2 y S4, y el conjunto de elementos sigue siendo ILUSTRATIVO (ninguna fuente lo indica)

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> añade un crecimiento lineal del error de órbita difundido con la edad (distancia 1 sigma <c2/>), sobre la reproyección de error congelado; el crecimiento lineal es el término de primer orden de un error de estado propagado (comprobado al { "1" } % a { "600" } s frente a la propagación de dos cuerpos del repositorio). Lo que queda: ninguna fuente pública da una tasa de crecimiento lunar (ILUSTRATIVA); no hay estructura a lo largo de la traza ni radial; el bloque del balance del enlace de correcciones usa el modelo congelado. El apéndice K5 (<c3/>, preregistrado por separado) ejecuta K5 a { "0.001" }, { "0.01" } y { "0.1" } m/s: falla en todos los casos ({ "369.8" } m, { "2315" } m, { "22797" } m frente a un umbral de { "1.5" } m), como se indicó antes de la ejecución.

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Una predicción preregistrada, congelada en el commit <c1/> con las entradas de fuentes públicas, con su protocolo de puntuación: <a1><c2/></a1>. Es una predicción, no una validación, y todas sus cifras están dominadas por el conjunto de elementos no publicado de la constelación de cuatro satélites (los elementos usados son ILUSTRATIVOS): sobre la región de { "80" } grados S, disponibilidad { "8.2" } %, 3-D p95 corregido { "280" } m, sin corregir { "3.8" } km. MODELLED; <c3/> falla si se mueve cualquier byte congelado.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Estilo de solución (filtro, restricción de altura, tres satélites): opción voluntaria en { "0.36" }, con límites.</b> Una sección <c1/> (<c2/>) añade una seudomedición de altura, un mínimo de tres satélites con ella y una ventana de mínimos cuadrados ponderados para usuario estático a lo largo de las épocas (una posición compartida, un reloj por época), que sustituye a un filtro. Lo que queda: trata los errores de las épocas como independientes, así que promedia a la baja más deprisa que errores correlacionados en el tiempo; es solo para usuario estático; no hay filtro dinámico, ni fase de portadora, ni resolución de ambigüedades; la traza del caso (<c3/>) muestra la aritmética instantánea. El apéndice de afirmaciones publicadas con este modo es <c4/> (preregistrado por separado). Con una restricción de altura de { "1" } m, tres satélites y una ventana de 6 épocas (ajustes ILUSTRATIVOS), el error 3-D p95 corregido de R300 baja de { "280.6" } m a { "2.11" } m (horizontal { "0.90" } m, no puntuado); K1 a K5 siguen fallando y K6 pasa, { "1" } de { "6" } como en la ejecución registrada. El supuesto de independencia de la ventana la favorece.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = Cuánto afinan un retrorreflector y una baliza VLBI en el emplazamiento de la estación el datum del marco lunar más allá de las cinco matrices de retrorreflectores archivadas: las entradas opcionales <c1/> y <c2/> de <c3/> (<c4/> y <c5/>). Cotas de Cramer-Rao para un conjunto reducido de parámetros con un calendario y un emplazamiento ILUSTRATIVOS: la norma de traslación 1 sigma baja de { "0.0185" } m a { "0.0102" } m (razón { "0.551" }), la escala de { "0.00178" } a { "0.00063" } ppm. MODELLED. Método, salvedades (un emplazamiento polar sur ve la Tierra baja o no la ve) y la tabla completa de Helmert: <a1><c6/></a1>.

# text
seg-91231bdcc599 = ILUSTRATIVO

# text
seg-93d78578585f = ILUSTRATIVO (la asignación de realización del marco del repositorio, en sí misma MODELLED)

# text
# c1: sise_sigma_m
seg-9a432ef35cac = ILUSTRATIVO en el valor por defecto incluido; el ejemplo de fuentes públicas fija <c1/> = { "10" } / { "1.96" } m de S4 p. 8

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Multitrayecto y hardware del receptor: abordado en { "0.36" } como opción voluntaria, con límites.</b> Una sección <c1/> (<c2/>) añade multitrayecto dependiente de la elevación <c3/> en el usuario y en la estación (la forma funcional de DO-229; en la Luna todos los valores son ILUSTRATIVOS), el multitrayecto de la estación opcionalmente de Gauss-Markov de primer orden a lo largo de las épocas, ruido de código del DLL adelantado menos retrasado a partir de C/N0 y sesgos entre canales por canal. Lo que queda: la variación del centro de fase de la antena y del retardo de grupo no se modela; ninguna medición lunar fija los valores de multitrayecto; el bloque del balance del enlace de correcciones no incluye los términos del receptor.

# text
seg-be6ecf79d22c = Ninguna de las dos comprueba el modelo. El modelo de error, la decorrelación de primer orden, los modelos de levantamiento, de envejecimiento y de cuantización y todos los umbrales son propios de este proyecto o ILUSTRATIVOS.

# text
seg-e666f1eb7a59 = Pasa { "1" } de { "6" } umbrales. La causa es la geometría. Ninguna fuente publica los elementos orbitales de la constelación. Con los elementos ILUSTRATIVOS del repositorio, un usuario y la estación comparten cuatro satélites por encima de { "5" } grados solo en el { "8" } % ({ "300" } km) y el { "6" } % ({ "600" } km) de las épocas, con una geometría casi singular: el p95 sin corregir es { "3.8" } km, donde las fuentes citan < { "10" } m. Las simulaciones de las propias fuentes usaban un filtro, una restricción de altura y tres satélites en vista común, de los que carece este modelo instantáneo. Por tanto, la ejecución no reproduce las afirmaciones con esos elementos, y no es evidencia de que las afirmaciones sean erróneas. El resultado de K6 es una razón entre dos cifras dominadas por la geometría y no dice nada sobre la decorrelación. Un conjunto publicado de elementos de la constelación se puntuaría con los mismos umbrales como una segunda ejecución fechada.

# text
seg-e8ee3794bac6 = <b>MODELLED.</b> Bajo los supuestos indicados (la constelación, su error de señal en el espacio, la exactitud de levantamiento de la estación, la latencia de las correcciones y la cuantización del enlace, cada uno una entrada etiquetada con su fuente pública o como ILUSTRATIVA), el modelo da las cifras siguientes. <b>No</b> son una afirmación sobre el rendimiento de ningún sistema real. Kshana <b>no</b> tiene afiliación ni respaldo de ninguna agencia y no hace ninguna afirmación de TRL ni de herencia de vuelo. Solo consultivo.

# text
seg-fa7858b14f89 = indicado antes de la ejecución; { "20" } m es ILUSTRATIVO, dimensionado según los errores ilustrativos del valor por defecto
