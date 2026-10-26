# docs--skyline: translations (es)

# text
seg-f917e7fcac09 = Qué es

# text
seg-6c6e7248496f = Geometría del cielo

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Superficie

# text
seg-ad856ad710eb = Estado

# text
seg-cbf0f9bcd2d8 = Referencia independiente

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-c14b8fe46517 = Máscara de horizonte dependiente del acimut: conjunto visible, acimut y elevación, y DOP bajo la máscara

# text
seg-bbb1828b3db1 = Reducciones de cañón urbano, sectores y terreno a una tabla

# text
seg-2c53381d48ae = Elipse de error horizontal y cofactor por sistema a partir de la covarianza de la geometría

# text
seg-de6c33774c9c = CLI

# text
seg-d1e9715513b4 = Ejemplo

# text
seg-587beeccaa11 = Preajuste

# text
seg-98f4f946a7ac = WASM

# text
seg-b03d56f501c3 = Tipo

# text
seg-4dbf41c0ec3b = Función

# text
seg-2b0d77219437 = Preajustes

# text
seg-7338b6210228 = Fila

# text
seg-6317db731879 = Descripción

# text
# c1: docs/SKYLINE.md
seg-be2f66de7d07 = Fuente: <c1/>

# text
seg-3cb660ef6b03 = Máscaras de horizonte y geometría del cielo

# text
# c1: mask_deg
# c2: docs/design/2026-10-12-geometry-and-skyline-design.md
seg-724f72bdfa36 = Hasta la { "0.36" }, toda prueba de visibilidad terrestre del motor era un único umbral de elevación, <c1/>: un satélite contaba cuando estaba a ese número o por encima de él, fuera cual fuese su dirección. Una calle, un muelle, un fiordo o una grúa tapan una parte del cielo y dejan libre el resto. Un <b>horizonte (skyline)</b> es un corte de elevación que depende del acimut; las <b>funciones de geometría del cielo</b> convierten un emplazamiento, un instante, unas constelaciones y un horizonte en el conjunto visible, la dilución de la precisión (DOP), la covarianza de la geometría, la elipse de error horizontal, una nube de Monte Carlo y un gráfico del cielo (skyplot). El diseño es <c2/> (puntos { "1" } y { "2" }).

# text
seg-6fa3291b70e3 = El horizonte (skyline)

# text
# c1: [0, 90)
seg-08585dd55bb5 = Un horizonte es el máximo punto a punto de cuatro descripciones. El acimut son grados en sentido horario desde el norte verdadero en el sistema local este-norte-arriba del emplazamiento; las elevaciones están en <c1/>.

# text
seg-9d0e2b0a469f = TOML

# text
seg-3dbc7ff9f5ab = Tabla

# text
# c1: [0, 360)
seg-a67486e7d10e = Elevaciones interpoladas linealmente en acimut, con cierre cíclico en { "360" }°. Acimuts estrictamente crecientes en <c1/>; como máximo { "3600" } filas.

# text
seg-bc12ba94381f = Cañón urbano

# text
seg-23066e2eb509 = Dos paredes rectas y paralelas (más abajo).

# attr:aria-label, text
seg-821762272e2f = Sectores

# text
# c1: az_from
# c2: az_to
seg-7387a718a7c3 = Intervalos de bordes netos, en sentido horario desde <c1/> (incluido) hasta <c2/> (excluido), que pueden pasar por el norte; como máximo { "360" }.

# text
seg-2768e3772b56 = Terreno

# text
# c1: atan((height_m − d²/(2 R_eff)) / d)
# c2: R_eff = 4/3 × 6371 km
# c3: height_m
seg-5a5c08a77b86 = Puntos reducidos a una tabla: elevación <c1/>, con la caída por curvatura para <c2/> (una constante elegida y declarada). <c3/> está por encima de la antena.

# text
# c1: preset = "<name>"
# c2: table
# c3: sectors
# c4: terrain
seg-fb86c0db0c90 = <c1/> parte de una geometría con nombre; los campos del cañón sustituyen entonces el cañón del perfil campo a campo, y <c2/>, <c3/> y <c4/> se suman a él.

# text
# c1: mask_deg
# c2: az
# c3: max(mask_deg, skyline(az))
# c4: >=
# c5: mask_deg
seg-0d76504a1d74 = El <c1/> del receptor conserva su significado: es un horizonte plano. El corte efectivo en el acimut <c2/> es <c3/>, y un satélite es visible cuando su elevación está <b>en ese valor o por encima</b>: el mismo <c4/> que siempre usó la máscara plana. Un satélite por encima de <c5/> pero por debajo del horizonte queda <b>enmascarado por el horizonte</b>.

# text
seg-f7fd13e569e3 = El cañón urbano

# text
# c1: s
# c2: w
# c3: a
# c4: az
# c5: θ = az − s
# c6: d(az) = (w/2) / |sin θ|
# c7: h
seg-290f563c1ff7 = Una calle discurre según el acimut <c1/>, a <c2/> metros entre las paredes, con la antena a <c3/> metros de altura sobre el eje. En el acimut <c4/>, con <c5/>, el rayo alcanza una pared tras <c6/>, de modo que una pared de altura <c7/> corta a

# text
# c1: length_m = L
# c2: d(az) · |cos θ| > L/2
# c3: antenna_m
# c4: width_m
seg-8662708f4f32 = La franja abierta se extiende a lo largo de la calle. Con <c1/> (la antena en el centro), un rayo sale por un extremo abierto, y la pared no corta nada, cuando <c2/>. Una pared que no sea más alta que la antena no corta nada. <c3/> vale por defecto { "1.5" } m (el techo de un coche o un receptor de mano, una elección declarada); un cañón nuevo necesita <c4/>.

# text
# c1: kshana skyline --preset <name>
seg-1eeff52ea5a5 = Dimensiones elegidas y declaradas (las de la nota de diseño), no levantamientos de ningún lugar real. <c1/> imprime una con su procedencia y su corte cada grado.

# text
seg-13e8e5460280 = Geometría

# text
seg-6d71c5cbe104 = Cañón: calle { "0" }°, anchura { "20" } m, paredes de { "30" } m y { "30" } m, antena { "1.5" } m. { "70.7" }° en sentido transversal a la calle, abierto a lo largo de ella.

# text
seg-ab3415ff8811 = Relación altura/anchura { "1.5" }, dentro de la banda de { "0.5" }–{ "2" } de relaciones de aspecto de cañones urbanos en Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

# text
seg-e331f02251f8 = Sectores: abierto hacia el mar entre { "090" }–{ "270" } ({ "180" }°); edificios del muelle de { "8" }° entre { "315" }–{ "045" } ({ "90" }°); el rompeolas y su luz de { "3" }° entre { "045" }–{ "090" } y { "270" }–{ "315" }.

# text
seg-6926e1bfc55d = Elecciones declaradas (por ejemplo, almacenes de { "40" } m a unos { "285" } m).

# text
# c1: 1500/|sin az|
seg-f13d4df9a42c = Terreno: paredes de { "600" } m sobre la antena a { "1500" } m a cada lado de un canal norte-sur, un punto por grado (a <c1/> m), con la caída por curvatura aplicada. { "21.8" }° en sentido transversal, por debajo de { "1" }° a lo largo del eje.

# text
seg-4d3dedbe4491 = El orden de magnitud de la anchura y del relieve de los profundos fiordos del oeste de Noruega (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

# text
seg-51f5219cb050 = Sectores: pilas de contenedores de { "12" }° sobre la mitad de tierra { "000" }–{ "180" }; plumas de grúa de { "35" }° entre { "245" }–{ "255" } y de { "25" }° entre { "285" }–{ "295" }; abierto al agua en el resto.

# text
seg-a568ae949c3b = Cinco contenedores high-cube ISO { "668" } ({ "14.5" } m) a unos { "60" } m de una antena situada a { "2" } m de altura; una pluma a unos { "50" } m sobre el muelle a { "70" } m y { "100" } m, del orden de una grúa post-Panamax. Un sector de grúa es opaco.

# text
seg-65b1b45c787f = En un escenario

# text
# c1: [skyline]
seg-e489759bbd65 = Una sección <c1/> opcional, sobre el umbral de corte propio del tipo:

# text
seg-f98345079e70 = Qué cambia el horizonte

# text
seg-cbe2f5ae721f = Por muestra

# text
# c1: orbit
# c2: user_site
seg-7368ea5c4b79 = <c1/> (con <c2/>)

# text
seg-fde216d940fb = La cronología de visibilidad (disponibilidad de GNSS) y el resumen de DOP.

# text
# c1: integrity
# c2: user_site
seg-7f6b2fcda681 = <c1/> (con <c2/>)

# text
# c1: araim_dual
seg-8fafdb892253 = Los satélites que usan RAIM y ARAIM (<c1/>).

# text
seg-c0156fd1c895 = Los satélites cuyas pseudodistancias se simulan y usa RAIM.

# text
seg-d7fa5e5cf33d = Los satélites que el receptor puede seguir, antes del inhibidor.

# text
seg-86caf3ae19ad = El conjunto en vista de cada modo sobre la máscara propia de cada sistema, incluido el barrido polar (el mismo horizonte en cada emplazamiento). La envolvente del modo Doppler y el paso único diseñado son cotas de lo que un receptor debe manejar y conservan la máscara de cada sistema.

# text
seg-20d2e86d17bc = Qué épocas cuentan como por encima de la máscara, el tiempo por encima de ella, los satélites de la comparación con GNSS.

# text
# c1: nmea-scenario
seg-ed5bbd6b2c46 = <c1/> (NMEA de entrenamiento)

# text
seg-d0eb9fd84d24 = Los satélites en GSV y en la solución de posición. Los acimuts son rumbos verdaderos fijos respecto al terreno, no el rumbo del buque.

# text
# c1: orbit
# c2: integrity
# c3: user_site = { lat_deg, lon_deg, height_m }
# c4: user
# c5: epoch + t
# c6: t
# c7: epoch
# c8: epoch
# c9: integrity
# c10: user_site
# c11: user
seg-56cc8ae30218 = <b>El emplazamiento terrestre de <c1/> y <c2/>.</b> Ambos tipos modelan un usuario en órbita con una elevación geocéntrica y sin acimut fijo a la Tierra, por lo que solo admiten un horizonte con el modo de emplazamiento terrestre de la nota de diseño: <c3/> en lugar de <c4/> (exactamente uno de los dos). Cada muestra es un instante absoluto, <c5/>: cada satélite se propaga hasta él (un conjunto de elementos, unas efemérides de difusión o un archivo SP3 avanza desde su propia época; un satélite Walker cuenta <c6/> desde <c7/>) y se rota a coordenadas fijas a la Tierra en ese instante, de modo que el emplazamiento ve un único cielo coherente. <c8/> es el del propio escenario de órbita; sin él (y siempre para <c9/>, que no lo tiene) es la época más reciente entre los satélites que la llevan, o J2000 solo para patrones Walker. La elevación y el acimut son geodésicos (WGS-84). La división horizontal y vertical de los niveles de protección ARAIM del tipo integrity y del error vertical de Stanford usa la misma vertical geodésica (la normal al elipsoide WGS-84, a unos { "0.19" }° de la radial geocéntrica a { "45" }° de latitud); el RAIM instantáneo ya la usaba. Un <c10/> sin horizonte es un usuario terrestre normal; la ruta del <c11/> en órbita no cambia.

# text
# c1: [skyline]
# c2: tests/skyline_scenarios.rs
# c3: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c4: [skyline]
# c5: skyline
# c6: masked_by_skyline
seg-fae979b3b96f = <b>Compatibilidad hacia atrás.</b> Sin una sección <c1/>, un escenario es idéntico byte a byte a lo que daba el mismo motor antes de que existiera el código de horizonte: <c2/> comprueba el JSON, el gráfico y el resumen de cada escenario distribuido que ejecuta uno de estos tipos, y el texto NMEA de cada escenario de entrenamiento, frente a los resúmenes SHA-256 de la línea base «{ "0.36" } portable» (los resúmenes de la confirmación de la versión { "0.35.0" }, rebasados cuando el motor pasó a matemática portable y conservados en la prueba como registro: <c3/>). Una sección <c4/> vacía no corta nada; el resultado es entonces igual a la ejecución sin ella salvo por el bloque <c5/> añadido y los recuentos <c6/> a cero.

# text
# c1: user
# c2: user
# c3: user_site
# c4: width_m
# c5: [0, 360)
# c6: [0, 90)
seg-fe88e0ad01e9 = <b>Qué se rechaza</b>, con el motivo en el mensaje: un horizonte en un <c1/> en órbita; <c2/> y <c3/> a la vez; un perfil desconocido; un cañón sin <c4/>; una tabla que no es estrictamente creciente en <c5/>; una elevación fuera de <c6/>; un sector vacío; una distancia de terreno no positiva; una entrada que supera los límites; cualquier clave desconocida.

# text
# c1: skyline: { source, open_fraction, provenance }
# c2: source
# c3: preset:<name>
# c4: preset:<name>+overrides
# c5: custom
# c6: open_fraction
# c7: max(mask_deg, skyline)
# c8: 1 − sin(cut)
# c9: provenance
# c10: units
seg-d1b10a0c833f = <b>El resultado</b> incorpora <c1/> cuando la sección está presente: <c2/> es <c3/>, <c4/> o <c5/>; <c6/> es la fracción del ángulo sólido del hemisferio superior por encima de <c7/> (la media de <c8/> en acimut: { "1" } para una máscara nula, { "0.5" } para un corte plano de { "30" }°); <c9/> es la línea del perfil o la del propio escenario. Las unidades y las clases de procedencia están en el bloque <c10/>.

# text
# c1: kshana example <name>
seg-0842c1133eb5 = Ejemplos incluidos (<c1/>):

# text
# c1: [skyline]
seg-5f77a52314c7 = Qué muestra (retire la sección <c1/> para comparar)

# text
# c1: city-street
seg-523f8c1a7912 = GPS + Galileo en el fondo de <c1/>: { "17" } de { "289" } muestras mantienen una solución de posición, PDOP mediano { "70.5" } ({ "1.14" } con cielo abierto).

# text
seg-6c5618dce8ab = ARAIM con doble constelación al entrar en un puerto: { "70" } épocas de satélite ocultas, disponibilidad sin cambios ({ "145" } de { "145" }).

# text
seg-36254db521fd = Pseudodistancias y RAIM en un muelle: { "44" } épocas de satélite ocultas; disponibilidad de RAIM { "0.59" } ({ "0.85" } con cielo abierto).

# text
seg-6b0f8b4c700f = Un inhibidor de { "2" } W en un puerto: { "83" } épocas de satélite ocultas, seguimiento sin cambios (el inhibidor ya los había anulado).

# text
seg-22ceab915271 = GPS + Galileo + una capa LEO en un fiordo: PDOP fusionado mediano { "1.14" } ({ "0.93" } con cielo abierto).

# text
# c1: leo-vertical-autonomous-vehicle
# c2: city-street
seg-f940e764e244 = El cañón de <c1/> como un corte plano de { "35" }° y como <c2/> girado según el rumbo del coche: { "8" } frente a { "4" } a { "5" } satélites GPS y Galileo; error medio fusionado { "2.1" } m en ambos; la alarma de { "1.5" } m en el { "51" } % y el { "59" } % de las épocas.

# text
# c1: src/geometry.rs
seg-6aa4ec7e4058 = Cinco funciones del motor (<c1/>), iguales en todas las superficies:

# text
seg-4d6a793b2794 = Entrada → salida

# text
# c1: id
# c2: system
# c3: az_deg
# c4: el_deg
# c5: cut_deg
# c6: visible
# c7: masked
# c8: n_visible
# c9: n_masked
# c10: open_fraction
# c11: dop
# c12: tdop_by_clock
# c13: states
# c14: cofactor_enu
# c15: covariance_enu_m2
# c16: ellipse_1sigma
# c17: ellipse
# c18: label
# c19: statement
# c20: advisory
seg-c99f58f1ccd2 = por satélite <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (varianza unitaria), <c15/>; <c16/> y <c17/> con la confianza solicitada; <c18/>, <c19/>, <c20/>

# text
# c1: n
# c2: σ_UERE
# c3: seed
# c4: samples_enu_m
# c5: σ_UERE × HDOP
# c6: σ_UERE × PDOP
seg-a5b914aac404 = <c1/> (como máximo { "5000" }, un límite de entrada) errores de mínimos cuadrados con errores de distancia gaussianos independientes de <c2/> a partir de un flujo ChaCha8 con semilla <c3/>: <c4/>, la covarianza empírica, el RMS horizontal y 3-D junto a <c5/> y <c6/>, la fracción dentro de la elipse del { "95" } %

# text
# c1: open_fraction
seg-f435ee3b8709 = los perfiles con etiqueta, descripción, procedencia, el corte cada grado y <c1/>

# text
# c1: source
# c2: provenance
# c3: open_fraction
seg-1937af5fa347 = una sección de horizonte reducida a la tabla de 360 entradas que usa el motor, con <c1/>, <c2/>, <c3/>

# text
seg-f16a1f2de329 = el gráfico del cielo (skyplot) como SVG estático (sin script, sin referencia externa, con todas las cadenas de entrada escapadas)

# text
seg-c802cf2a2e30 = Una solicitud:

# text
# c1: systems
# c2: constellation-design
# c3: gps-baseline
# c4: galileo
# c5: beidou-meo
# c6: glonass
# c7: xona-pulsar
# c8: iridium-stl
# c9: leo-pvt
# c10: [[system]]
# c11: time_s
# c12: leo-pvt
# c13: "satellites": [{"id": "G05", "system": "GPS", "az_deg": 120, "el_deg": 35}, ...]
# c14: "ecef_m": [x, y, z]
# c15: site
# c16: user_ecef_m
# c17: "common"
# c18: σ_UERE
seg-c3c44c1967ba = <c1/> son los perfiles de constelación del motor (<c3/>, <c4/>, <c5/>, <c6/>, ... de <c2/>; los perfiles LEO <c7/>, <c8/>, ...) o una tabla <c10/> completa de <c9/>, propagados hasta <c11/> (kepleriano con J2 secular, las órbitas del modo conjunto <c12/>). Sus fases relativas proceden de épocas de referencia distintas, por lo que el cielo es <b>una geometría representativa, no el cielo de esa fecha en ese lugar</b>. Los satélites pueden darse en su lugar (o además) directamente: <c13/>, o con <c14/> y un <c15/> o <c16/>. Valores predeterminados: la máscara propia de cada sistema ({ "5" }° GNSS, { "10" }° LEO; { "5" }° para los satélites dados directamente), un reloj de receptor por sistema (<c17/> para un reloj compartido), <c18/> { "1" } m (una línea de presupuesto representativa de doble frecuencia), confianza { "0.95" }. Límites de entrada: como máximo { "2000" } satélites por encima del horizonte (una tabla de sistema que pida más se rechaza antes de construirse) y { "16" } relojes de receptor.

# text
seg-6408f9b02ccb = Un cielo fechado a partir de conjuntos de elementos.

# text
# c1: "tle"
# c2: orbit-real-tle
# c3: "epoch"
# c4: time_s
# c5: site
# c6: "epoch"
# c7: 2026-06-07T12:00:00Z
# c8: epoch
# c9: tle
# c10: "tle_system"
# c11: TLE
# c12: sky_source
# c13: sky_statement
seg-7724e4ecafee = <c1/> toma texto de conjuntos de elementos de dos líneas (una línea de nombre antes de cada conjunto es opcional; como máximo { "4" } MiB, un límite de entrada), propagados con el SGP4 del motor (WGS-72, el propagador que usa <c2/>) hasta <c3/> más <c4/>, rotados a coordenadas fijas a la Tierra con UT1 tomado como UTC y sin movimiento polar, y vistos desde <c5/>. <c6/> es UTC ISO { "8601" } (<c7/>) y fecha solo los conjuntos de elementos (los perfiles no llevan fecha, por lo que un <c8/> sin <c9/> se rechaza); <c10/> los etiqueta para el reloj de cada sistema (valor predeterminado <c11/>). Cada resultado indica qué cielo es en <c12/> y <c13/>:

# text
seg-13a8b4ac40f9 = El cielo

# text
seg-c0bde35f9442 = los perfiles de constelación del motor: una geometría representativa

# text
seg-d368b50280cc = los conjuntos de elementos propagados hasta la época indicada: el cielo que esos conjuntos dan en esa época, no una medición de él (su propia precisión es la de SGP4 y la antigüedad de los conjuntos)

# text
# c1: epoch
# c2: time_s
seg-0bc07825a9b5 = sin <c1/>: los conjuntos de elementos propagados hasta la época propia del conjunto más reciente más <c2/>, un cielo representativo

# text
seg-1230388da233 = satélites dados directamente, tal como se indican

# text
# c1: +
# c2: epoch_utc
# c3: tle_skipped
# c4: systems
seg-1a30004a7f9e = Una mezcla los une con <c1/>. <c2/> es el instante hasta el que se propagaron los conjuntos de elementos, y <c3/> nombra qué parte del texto no se usó, con el motivo: líneas de conjuntos de elementos mal formadas o huérfanas (con sus números de línea), conjuntos que el analizador rechazó y conjuntos que SGP4 no pudo propagar hasta ese instante (decaídos o fuera de sus límites); como máximo { "100" } entradas en total y después una última entrada que cuenta el resto. Una lista <c4/> vacía no añade ningún perfil. El gráfico del cielo indica la base en su pie.

# text
# c1: orbit::cofactor_from_los
# c2: orbit::dop
# c3: orbit::dop_cov
# c4: orbit::dop
# c5: tests/dop_reference.rs
seg-8560c13c7ea3 = <b>Un único núcleo.</b> La matriz de cofactores es <c1/>, el ensamblado de la matriz de diseño y la inversa de Gauss-Jordan que hay tras <c2/>. <c3/> expone la covarianza y <c4/> es su reducción, de modo que los escalares VALIDATED no cambian y siguen fijados por <c5/>. No hay una segunda implementación de DOP.

# text
# c1: k σ √λ
# c2: λ
# c3: k = √(−2 ln(1 − p))
# c4: √5.991 = 2.448
# c5: ½ atan2(2 Q_EN, Q_NN − Q_EE)
# c6: [0, 180)
seg-cb1be3e04419 = <b>La elipse.</b> Semiejes <c1/> para los autovalores <c2/> del bloque este-norte, con <c3/> (<c4/> al { "95" } %, { "1" } al { "39.35" } %), y el acimut del eje mayor <c5/> en <c6/> desde el norte.

# text
seg-96062e2cfed1 = Puntos de entrada

# text
# c1: kshana sky <request.json|toml>
# c2: kshana sky --site <lat,lon[,h]> (--systems <a,b> | --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]
# c3: --monte-carlo <n> --seed <s>
# c4: --svg
# c5: kshana skyline --preset <name> | --presets | --profile <file>
seg-f8dc86bd9da2 = <c1/> o <c2/>, con <c3/> o <c4/>; <c5/>

# text
seg-d5b5bdf6081c = Rust

# text
# c1: kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}
# c2: kshana::surface::*
seg-8d0f99ed4837 = <c1/>, <c2/> con los mismos nombres

# text
seg-40a7552d2ba9 = MCP

# text
# c1: sky_geometry
# c2: request
# c3: skyline_preset
seg-42f0fe3b42ab = <c1/> (<c2/>, o <c3/>); sin Monte Carlo por MCP (muestras en bloque que un agente debe resumir, no transportar)

# text
# c1: label
# c2: statement
seg-9d04c658b37a = Todo resultado lleva <c1/> (MODELLED), el <c2/> (geometría bajo un modelo de error declarado: errores de distancia gaussianos independientes, iguales y de media cero; no es una predicción del error real de un receptor, que además tiene sesgos, multitrayecto y errores sin línea de visión; no es una cota de integridad) y el aviso consultivo: <em>Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.</em>

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-0e1285fdfe52 = Cinco filas del registro (<c1/>), tal como las delimita la nota de diseño:

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/PREREGISTRATION.md
seg-1aa76286f152 = Orekit { "12.2" } (ángulos de observación de <c1/>, <c2/>) con gnss_lib_py { "1.0.4" } (<c3/> y la matriz de DOP), preregistrado en <c4/> (commit e4b9d912) antes de ejecutar ninguno de los dos: { "1173" } ángulos de observación en seis emplazamientos y cuatro épocas, seis tablas, { "142" } conjuntos visibles; peor elevación { "1.3e-13" }°, acimut { "2.3e-13" }°, máscara { "1.1e-12" }° frente a { "1e-9" }°; conjuntos visibles idénticos, ninguno en la banda del límite; DOP { "3.3e-13" } relativo y cofactor { "6.6e-13" } de la escala de la matriz frente a { "1e-9" }. Alcance: máscaras de tabla, ángulos de observación geodésicos, el conjunto enmascarado y su DOP y cofactor con reloj común.

# text
seg-b33828edbe2f = valores calculados a mano; la comparación anterior lee sus tablas como entradas y no las comprueba

# text
seg-ca950752be62 = Perfiles de horizonte

# text
seg-83946f66ca78 = ninguna: dimensiones elegidas y declaradas (comprobadas solo consigo mismas)

# text
# c1: linalg.inv
# c2: linalg.eigh
# c3: xval/numpy-ellipse/PREREGISTRATION.md
seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> y <c2/> (P2 estándar) sobre los { "142" } conjuntos visibles confirmados, reloj común y un reloj por sistema, preregistrado en <c3/> (commit 0bbeeaee): { "270" } casos, ejes { "5.1e-13" } relativo, orientación { "5.3e-12" }°, cofactor { "1.0e-12" } de la escala de la matriz, frente a { "1e-9" } y { "1e-6" }°

# text
seg-44e5f9ca28f7 = Funciones de geometría del cielo

# text
seg-8e3953481bbf = la composición: propagación de perfiles hasta un cielo representativo, la nube de Monte Carlo (comprobada frente a la geometría que muestrea) y las superficies

# text
# c1: [skyline]
seg-e8eec007c6b9 = La ausencia de una sección <c1/> se comprueba byte a byte frente a las salidas de la { "0.35.0" }, lo que demuestra la compatibilidad hacia atrás y no valida nada. gnss_lib_py aplica solo una máscara de elevación única, por lo que aquí es la referencia independiente del DOP, no la de la máscara.

# text
seg-d5894e54715b = Lo que un horizonte no modela: la difracción en el borde de una pared, las reflexiones y las señales sin línea de visión que un receptor real aún puede seguir (se descartan, no se degradan), la transparencia parcial (una grúa de celosía es opaca en todo su sector), el terreno más allá de los puntos dados y la curvatura terrestre dentro de las formas de cañón y de sector.

# text
seg-745d19d6b35d = <s1>Anterior</s1>Integraciones marinas

# text
seg-bbe8dd07d33b = <s1>Siguiente</s1>La confianza como telemetría de seguridad

# text
seg-4c1bc0b37f54 = Evidencia: la decisión de visibilidad con máscara (ángulos de observación geodésicos, la máscara de tabla, el conjunto visible y su DOP) está <b>VALIDATED</b> frente a Orekit { "12.2" } y gnss_lib_py { "1.0.4" } en una comparación preregistrada, y también lo están la elipse de error y el cofactor por sistema (numpy, preregistrado); las reducciones de cañón urbano, de sector y de terreno, los perfiles y el resto de las funciones de geometría del cielo son <b>MODELLED</b> (<a1>Evidencia</a1>). Un horizonte elimina satélites con línea de visión y nada más. Los perfiles son geometrías REPRESENTATIVE, no levantamientos.
