# docs--kind-solar-system: translations (es)

# text
seg-e27476e37522 = Tierra

# text
seg-5b561b4fd201 = Marte

# text
seg-59f1f277012b = Júpiter

# text
seg-e6e209ad07e0 = Europa

# text
seg-6f12259c6ec4 = Saturno

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-dae4184bb004 = <b>VALIDATED</b> El tiempo de luz newtoniano unidireccional de cualquier cuerpo a cualquier otro, recibido en una época, resuelto con el resolvedor radiométrico de punto fijo del tiempo de luz (radiometric::light_time_solution, transmisor en su posición retardada) mediante solar_system::link_o Pruebas: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-670191cf797f = Página de tema: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Página de tema: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-4d208b6c0eb8 = día

# text
seg-3319b18ac61f = y { "1" } más en la matriz.

# text
seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: docs/kinds/by-kind/solar-system.md
seg-028ac545e52e = Fuente: <c1/>

# text
# c1: solar-system
seg-934e7998420c = <c1/> (tipo de escenario)

# text
seg-0549bc926a9b = Todo el sistema solar en una época, para PNT (posicionamiento, navegación y temporización) alrededor de cualquier cuerpo. Para el Sol, los ocho planetas, Plutón, la Luna, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán indica la posición y la velocidad heliocéntricas en el ICRF (Marco de Referencia Celeste Internacional, ecuatorial J2000), la distancia heliocéntrica y la longitud y latitud eclípticas J2000, el parámetro gravitacional, el radio ecuatorial y medio, J2 donde está publicado y su radio de referencia, el periodo de rotación sidéreo, el polo de la IAU y el meridiano origen en la época, una traza orbital muestreada a lo largo de una revolución (heliocéntrica para los planetas, centrada en el cuerpo principal para las lunas), y el tiempo de luz, la distancia unidireccional y bidireccional, el retardo de Shapiro solar y la separación del Sol desde un cuerpo observador (por defecto la Tierra); los enlaces adicionales de origen a destino reciben el mismo tratamiento. Posiciones: los elementos keplerianos de JPL de Standish y Williams (Tabla { "1" } para { "1800" } d. C. a { "2050" } d. C., Tablas 2a/2b para { "3000" } a. C. a { "3000" } d. C.) con el error nominal de cada planeta, la serie lunar de Montenbruck & Gill para la separación Tierra-Luna, los elementos medios de JPL con la tasa de rotación síncrona de la IAU para las lunas de Marte y las galileanas, y el modelo de rotación de la IAU para Titán. Tiempo de luz: la resolución radiométrica de punto fijo, con el transmisor en su posición retardada; newtoniano, con el retardo de Shapiro indicado por separado. VALIDATED frente a JPL Horizons (DE441) dentro del doble del error nominal: de Mercurio a Saturno y la Tierra a partir de la Tabla { "1" } (peor caso { "1.87" } veces el nominal) y los ocho planetas a partir de las Tablas 2a/2b (peor caso { "1.71" } veces), y el tiempo de luz de la Tierra a Marte y a Júpiter. MODELLED, con cada fila etiquetada: Urano y Neptuno a partir de la Tabla { "1" } ({ "2.0" } y { "5.2" } veces el error nominal frente a DE441), Plutón (la fila de { "1992" }; sin error indicado), la Luna y las siete lunas (medidas frente a Horizons, sin cota publicada).

# text
# c1: scenarios/solar-system-tour.toml
seg-bd2d27e1f91d = Una ejecución de <c1/> se resume así: Sistema solar en 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } cuerpos, observador Tierra Standish Tabla { "1" } ({ "1800" } d. C. a { "2050" } d. C.) Sun { "0.0000" } au lon { "0.00" } deg tiempo de luz { "500.1" } s [origen] Mercury { "0.4666" } au lon { "259.05" } deg tiempo de luz { "605.3" } s [VALIDATED] Venus { "0.7272" } au lon { "348.72" } deg tiempo de luz { "182.1" } s [VALIDATED] Earth { "1.0022" } au lon { "4.52" } deg observador [VALIDATED] Moon { "1.0046" } au lon { "4.56" } deg tiempo de luz { "1.3" } s [MODELLED] Mars { "1.5544" } au lon { "83.81" } deg tiempo de luz { "841.1" } s [VALIDATED] Phobos { "1.5545" } au lon { "83.81" } deg tiempo de luz { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg tiempo de luz { "841.1" } s [MODELLED] Jupiter { "5.3036" } au lon { "130.91" } deg tiempo de luz { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg tiempo de luz { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg tiempo de luz { "2968.7" } s [MODELLED] Ganymede { "5.3005" } au lon { "130.98" } deg tiempo de luz { "2969.6" } s [MODELLED] Callisto { "5.3153" } au lon { "130.96" } deg tiempo de luz { "2976.7" } s [MODELLED] Saturn { "9.4356" } au lon { "10.77" } deg tiempo de luz { "4212.2" } s [VALIDATED] Titan { "9.4401" } au lon { "10.74" } deg tiempo de luz { "4214.3" } s [MODELLED] Uranus { "19.4363" } au lon { "62.62" } deg tiempo de luz { "9444.1" } s [MODELLED] Neptune { "29.8775" } au lon { "2.62" } deg tiempo de luz { "14409.3" } s [MODELLED] Pluto { "35.6122" } au lon { "304.19" } deg tiempo de luz { "17529.1" } s [MODELLED] enlace Mars -> Jupiter: unidireccional { "2193.539" } s, bidireccional { "4386.919" } s, Shapiro { "15.0" } us, Sol { "15.0" } deg enlace Saturn -> Earth: unidireccional { "4212.176" } s, bidireccional { "8424.347" } s, Shapiro { "22.1" } us, Sol { "172.5" } deg enlace Europa -> Jupiter: unidireccional { "2.218" } s, bidireccional { "4.437" } s, Shapiro { "0.0" } us, Sol { "22.0" } deg

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-26ecec1af8af = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/solar-system-tour.toml
seg-13de19567146 = El ejemplo <c1/> establece, entre otros:

# text
seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

# text
seg-c4b64eb26210 = ICRF (ecuatorial J2000), heliocéntrico; m

# text
seg-6096a0ab243b = Standish Tabla { "1" } ({ "1800" } d. C. a { "2050" } d. C.)

# text
seg-5c9a8d4716f5 = Etiqueta del resultado (la del motor): MIXED: cada cuerpo lleva su propia etiqueta. Las posiciones de los planetas están VALIDATED frente a JPL Horizons dentro del doble del error nominal de Standish (de Mercurio a Saturno y la Tierra a partir de la Tabla { "1" }; los ocho planetas a partir de las Tablas 2a/2b); Urano y Neptuno a partir de la Tabla { "1" }, Plutón, la Luna y las siete lunas son MODELLED.

# attr:alt
seg-537aa8010e50 = El gráfico que el motor genera para scenarios/solar-system-tour.toml, tipo de escenario solar-system

# text
# c1: solar-system
seg-7432155d5fec = <b>VALIDATED</b> El tipo de escenario <c1/> con planetary_kernel_path: cada cuerpo indicado cuyo propio código NAIF contiene el SPK toma su posición y velocidad heliocéntricas J2000 del núcleo mediante el propio lector del motor (etiqueta KERNEL), un enlace cuyos dos extremos

# text
seg-84ce0dd8daef = <b>VALIDATED</b> Posiciones heliocéntricas de Mercurio, Venus, el baricentro Tierra-Luna, la Tierra, Marte, Júpiter y Saturno a partir de la Tabla { "1" } de Standish ({ "1800" } d. C. a { "2050" } d. C.), y de los ocho planetas a partir de las Tablas 2a/2b ({ "3000" } a. C. a { "3000" } d. C., con las anomalías medias b, c, s, f Pruebas: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

# text
seg-cc5bd76ec542 = <b>MODELLED</b> Posiciones de Urano y Neptuno a partir de la Tabla { "1" } de Standish (la predeterminada dentro de { "1800" } d. C. a { "2050" } d. C.), Plutón a partir de la fila de { "1992" } de la Tabla { "1" } que la página actual de JPL ya no incluye, y la velocidad heliocéntrica de cada planeta: la derivada de dos cuerpos con Pruebas: <a1>solar_system_horizons_reference.rs</a1>.

# text
# c1: solar-system
seg-ad3da7fe8e46 = <b>VALIDATED</b> El tipo de escenario <c1/> con planetary_kernel_path: cada cuerpo indicado cuyo propio código NAIF contiene el SPK toma su posición y velocidad heliocéntricas J2000 de. Referencia independiente (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 mediante spiceypy { "8.3.0" }) estados heliocéntricos de spkezr sobre el de440s.bsp completo, un programa separado que no llama a ningún código de Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); el motor lee recortes de de440s bit a bit. Preregistrado f8e946ea. Una comprobación de biblioteca del conexionado: DE440 en sí y los cuerpos analíticos no se validan aquí. Resultados: docs/design/evidence/cap31-solar-system-kernel/RE

# text
seg-735fb0bc1705 = <b>VALIDATED</b> Posiciones heliocéntricas de Mercurio, Venus, el baricentro Tierra-Luna, la Tierra, Marte, Júpiter y Saturno a partir de la Tabla { "1" } de Standish ({ "1800" } d. C. a { "2050" } d. C.), y de todos . Referencia independiente (ExternalDataset): Vectores heliocéntricos geométricos de JPL Horizons DE441 (eclíptica e ICRF), obtenidos tras los commits de preregistro { "80451866" }, 8d38a28b y 558cc807. Umbral: por planeta y componente, RMS como máximo 1.0x los errores aproximados de la Tabla { "8.10.1" } del Explanatory Supplement 3.ª ed. (la fila EMB para la Tierra); la separación Tierra-EMB se comprueba directamente frente a DE441 { "399" } menos { "3" }, como máximo { "0.3" } deg y { "8.1" } km en cada época de 1950-2050 (th

# text
seg-ab1192de28f5 = <b>VALIDATED</b> El tiempo de luz newtoniano unidireccional de cualquier cuerpo a cualquier otro, recibido en una época, resuelto con el resolutor radiométrico de tiempo de luz de punto fijo (radiometric::light_t. Referencia independiente (ExternalDataset): Tiempo de luz newtoniano LT de tramo descendente unidireccional de JPL Horizons DE441 (VEC_CORR=LT, observador el centro de la Tierra), preregistrado (480037d3, enmienda 54d5c86f que cambia solo el espaciado de los nodos de interpolación después de que la primera obtención no satisficiera su precondición de precisión de interpolación de { "10" } m, antes de comparar ningún tiempo de luz) con un umbral de { "1e-6" } s por tiempo de luz, alimentando al resolutor con posiciones baricéntricas de DE441 de modo que la iteración del transmisor retardado sea visib

# text
seg-5a2e745828ea = <b>MODELLED</b> Posiciones de Urano y Neptuno a partir de la Tabla { "1" } de Standish (la predeterminada dentro de { "1800" } d. C. a { "2050" } d. C.), Plutón a partir de la fila de { "1992" } de la Tabla { "1" } que la página actual de JPL ya no in. Referencia independiente (ExternalDataset): Medido frente a JPL Horizons DE441 (los mismos archivos de prueba confirmados), pero no validado: las cifras indicadas en la Tabla { "1" } para Urano y Neptuno se superan hasta { "2.0" } y { "5.2" } veces frente a las posiciones heliocéntricas de DE441 (Neptuno las satisface frente a las posiciones baricéntricas, lo que sugiere que el ajuste no era heliocéntrico), la página no indica ningún error para Plutón y no existe ninguna cota publicada para las velocidades. Las Tablas 2a/2b satisfacen su propio

# text
# c1: label
seg-0131b082906b = MIXED: cada cuerpo lleva su propia etiqueta. Las posiciones de los planetas están VALIDATED frente a JPL Horizons dentro del doble del error nominal de Standish (de Mercurio a Saturno y la Tierra a partir de la Tabla { "1" }; los ocho planetas a partir de las Tablas 2a/2b); Urano y Neptuno a partir de la Tabla { "1" }, Plutón, la Luna y las siete lunas son MODELLED. Los tiempos de luz son newtonianos, a partir de las mismas posiciones. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-3e24f0bf9ccd = MODELLED, con cada fila etiquetada: Urano y Neptuno a partir de la Tabla { "1" } ({ "2.0" } y { "5.2" } veces el error nominal frente a DE441), Plutón (la fila de { "1992" }; sin error indicado), la Luna y las siete lunas (medidas frente a Horizons, sin cota publicada). (catálogo de tipos (<c1/>))

# text
seg-62b2e925233a = QUÉ ESTÁ VALIDATED Y QUÉ NO Cada cuerpo lleva su propia etiqueta. De Mercurio a Saturno y la Tierra están VALIDATED frente a JPL Horizons (Development Ephemeris DE441) dentro del doble del error nominal de la página de Standish. Urano y Neptuno a partir de la Tabla { "1" } superan las cifras de la página frente a DE441 (en { "2.0" } y { "5.2" } veces) y son MODELLED; también lo son Plutón, la Luna y las siete lunas, que se midieron frente a Horizons pero no tienen ninguna cota pu (comentario del archivo de escenario, líneas { "20" } a { "25" })

# text
seg-2b36ac40e457 = Urano y Neptuno a partir de la Tabla { "1" } de Standish, Plutón y las velocidades planetarias son MODELLED, no validados: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-c19e6d035b7e = Las posiciones de la Luna y de siete lunas principales (Fobos, Deimos, las lunas galileanas, Titán) son MODELLED, no validadas: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ce15aaa5453c = Las constantes físicas de cada cuerpo del sistema solar y el informe del sistema completo son MODELLED, no validados: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-ceadf891b1e2 = <s1>Anterior</s1>slot-timing

# text
seg-0493962a6937 = <s1>Siguiente</s1>space-packet
