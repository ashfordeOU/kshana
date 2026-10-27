# docs--maritime-trust: translations (es)

# text
seg-2247a2344710 = Significado

# text
seg-6940543aa3c0 = cadena

# text
seg-abec93a4a488 = cadena o null

# text
seg-f5e7215e6835 = objeto

# text
seg-b993ef559bd0 = Desde código

# text
seg-c353e7bec219 = Clave

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> o <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Fuente: <c1/>

# text
seg-342f34403ac5 = Confianza marítima: ¿puede el puente fiarse de esta posición?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> puede puntuar, para un <b>buque en movimiento</b>, una cifra de confianza de 0 a 100 en tiempo real para cada posición, a partir de lo que cualquier receptor ya pone en el bus (primero NMEA { "0183" }), e indicar qué comprobaciones la redujeron. Es una capa de software que se sitúa junto a un receptor. No es un receptor, no sustituye a ninguno y no hace más exacta una posición.

# text
seg-3c66739c9250 = <b>Software de carácter consultivo.</b> Kshana no es un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }) y no se ha evaluado frente a ninguna norma de rendimiento. Su puntuación y su puerta son ayudas al criterio del navegante. El operador sigue siendo responsable de la navegación segura del buque y de cualquier decisión de fiarse, o de dejar de fiarse, de una posición.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = Esta página dice qué examinan las comprobaciones, qué puede y qué no puede detectar cada una, cómo ejecutarlo en tiempo real y qué hace la puerta. La correspondencia de la puntuación y cada valor por defecto están en <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = Qué lee

# text
seg-e784fdbe26e6 = Un buque se declara en el archivo de sesión, con sus límites indicados antes de la ejecución:

# text
seg-e8e9ee2965cf = Sentencia

# text
seg-e127f2f26824 = Se lee

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = posición, calidad de la posición ({ "0" } = sin posición), altitud sobre el nivel medio del mar, separación del geoide, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = estado (<c1/> válido, <c2/> no), velocidad y rumbo sobre el fondo, fecha, modo

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = velocidad y rumbo sobre el fondo, donde RMC no los tiene

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = rumbo (THS solo cuando su modo no es <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = velocidad a través del agua (VBW solo cuando su estado es <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = hora

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = intensidad de señal por satélite (dB-Hz), elevación y acimut (para la geometría)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = dilución de la precisión y satélites usados (para la geometría, donde GSV no da cielo; y el HDOP declarado que compara la protección)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = un estado de OSNMA notificado por un receptor, traducido a esta sentencia por el adaptador que lee el receptor: <c1/> autenticado, <c2/> fallido, <c3/> sin resultado

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Las épocas que el propio receptor dice que no son una posición por satélite (calidad GGA { "0" }, o { "6" } a { "8" }: estimada, manual, simulador; estado RMC <c1/>, o modo <c2/>, <c3/>, <c4/>, <c5/>) no se usan para las comprobaciones de posición y no aportan evidencia en ningún sentido: el receptor ya lo ha dicho.

# text
# c1: calibration_s
seg-a0ae80781c6e = Los primeros <c1/> segundos forman la línea base y nunca se puntúan. Cada monitor mira solo la época actual y las anteriores, de modo que una decisión en una época no cambia cuando llegan datos posteriores, y un flujo en directo da la misma puntuación que el mismo texto leído como archivo.

# text
seg-068593ad0a52 = Qué detecta cada comprobación y qué no puede detectar

# text
seg-094b90f0c701 = Las direcciones entre posiciones (el rumbo de la trayectoria que usa la comprobación de velocidad de giro, el rumbo implícito en dos posiciones) son la dirección de la cuerda entre ellas, que es el <b>acimut medio</b> de la geodésica entre las posiciones, no el acimut directo en la primera; ambos difieren en aproximadamente la mitad de la convergencia de los meridianos entre las posiciones ({ "0.001" } grados para una línea base de { "260" } m a { "59.5" } grados de latitud).

# text
seg-ed3cdfcfbff5 = Una posición falsificada tiene que concordar con la física del buque y con los demás sensores del buque. Cada comprobación compara la posición con uno de ellos. Una comprobación es tan independiente como lo sea su otra fuente: un rumbo procedente de una brújula GNSS, o una "velocidad a través del agua" derivada de GNSS, no es independiente del receptor sometido a prueba y no aporta nada.

# text
seg-9480aabf136e = Comprobación

# text
seg-20e4f746c7e1 = Detecta

# text
seg-e7b2ebe5eabc = No puede detectar

# text
seg-21ad9895f606 = un salto de posición; una trayectoria cuyo movimiento no explican la velocidad y el rumbo notificados; una velocidad, aceleración o velocidad de giro implícitas por encima de los límites declarados del buque

# text
seg-dcbc6d4cd17f = un arrastre cuya velocidad y rumbo notificados siguen la trayectoria falsificada y permanece dentro de los límites (el receptor los deriva de su propia solución, de modo que concuerdan entre sí); un límite de velocidad declarado demasiado alto

# text
seg-3542f83a7988 = una trayectoria que se aparta de hacia dónde apunta el buque en más del ángulo de deriva declarado

# text
# c1: min_speed_kn
seg-75f4d659f716 = un arrastre a lo largo del rumbo (el rumbo no cambia); un rumbo procedente del mismo receptor o de una brújula GNSS; un desvío transversal por encima de la tolerancia (falsa alarma); velocidades por debajo de <c1/>

# text
seg-09dde82be447 = un arrastre que cambia la velocidad sobre el fondo frente a la velocidad a través del agua

# text
seg-6ac740e5f51c = una corredera derivada de GNSS; una corriente por encima de la tolerancia (falsa alarma); un arrastre más lento que la tolerancia

# text
seg-e85d5f0933b7 = una altitud que no está donde la sitúan la superficie del mar y la altura de antena declarada

# text
seg-3806e1d46332 = un suplantador que mantiene verosímil la altitud; la tolerancia es amplia porque el error vertical autónomo es grande; la separación del geoide se registra pero no se comprueba, porque el motor no tiene modelo de geoide

# text
seg-5b70bd80640e = la firma de un único transmisor: la C/N0 de todos los satélites que se hunde a la vez, o sube a la vez, respecto a la línea base de calibración

# text
seg-e6874a8047b1 = un suplantador que conforma la potencia por satélite; cualquier cosa mientras la propia línea base está suplantada; una cadencia de GSV demasiado lenta para seguirla

# text
seg-371b17ce936a = el tiempo del receptor que avanza de forma irregular o retrocede; frente al reloj de este ordenador, el tiempo del receptor que se desvía de él (solo flujos en tiempo real)

# text
seg-026479cb7966 = una hora falsificada que es consistente y estable; un reloj que está mal desde el principio

# text
seg-906ab911b73d = un fallo de autenticación OSNMA notificado

# text
seg-a04757b7ae57 = el estado se lee, no se verifica; no se ve a un suplantador que suprime el informe

# text
seg-c36c24a337b8 = denegación de potencia y pérdida de satélites, como en el caso estático

# text
seg-940b39a3988a = dicen que el entorno es hostil, no que la posición sea errónea

# text
seg-9d751e1f5938 = <b>Lo que los monitores solo de NMEA no pueden hacer.</b> Un suplantador que reproduce toda la constelación con una posición, una velocidad, un rumbo compatible con el de proa, una potencia por satélite verosímil y un reloj coincidente, todo autoconsistente, es invisible para todas las comprobaciones anteriores: nada en las sentencias distingue su posición de una real. Tampoco lo hace una reproducción de señales reales grabadas. La autenticación (OSNMA, o un receptor con su propia protección antisuplantación) y los sensores de navegación independientes son lo que cierra esa brecha; esta capa solo puede usar su estado notificado. Un flujo que ya está siendo suplantado mientras se forma la línea base no tiene una línea base limpia. La ausencia de una alarma no es evidencia de una buena posición.

# text
seg-e3e09e2412fb = Puntuación de confianza

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Cada época posterior a la calibración recibe una puntuación de { "0" } a { "100" } y los motivos por los que no es { "100" }: qué comprobaciones restaron, su estadístico frente al umbral y sus puntos. Bandas (bordes indicados en la sesión): <c1/> con { "90" } o más, <c2/> con { "55" } o más, <c3/> por debajo. La correspondencia, cada peso y su motivo están en <a1><c4/></a1>; es determinista y se fija antes de puntuar un registro, sin aprendizaje y sin nada ajustado a sucesos.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Toda salida de buque lleva la declaración consultiva: la clave <c1/> del JSON de resultados y de cada línea en directo, una primera línea de comentario <c2/> del CSV (los lectores la omiten con su opción de comentarios), el <c3/> y un pie del SVG. Salidas de una ejecución por lotes: <c4/> (con el modelo de puntuación y las deducciones de cada época), <c5/> (con columnas <c6/> y <c7/>) y <c8/>, que para un buque es la trayectoria notificada por el receptor coloreada por banda de confianza sobre la puntuación a lo largo del tiempo.

# text
seg-918516588036 = Una demostración sintética

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> contiene un registro NMEA inventado de un transbordador en una ruta de Tallin a Helsinki (un extracto de 50 minutos, unos { "17" } kn, { "1" } Hz: GGA, RMC, VTG, un rumbo de giróscopo, una corredera, GSV con un cielo verosímil) en el que un arrastre de posición aparta la posición <em>notificada</em> de la real del buque a partir de { "1500" } s. El receptor sigue notificando una posición <b>válida</b> en todo momento; lo que cae es la puntuación de confianza, pasando por la banda degraded hasta la untrusted. <c2/> declara cada umbral, los límites del buque y cada peso de la puntuación antes de la ejecución.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = El registro es <b>texto escrito en un archivo</b> por <c1/>: no modela ninguna señal de radio y no transmite nada. No es una medición y la ruta es ilustrativa, no una carta. <c2/> fija el registro y la salida esperada como protecciones de regresión sobre los datos sintéticos; no dicen nada sobre cómo se comporta ningún monitor frente a interferencias reales.

# attr:alt
seg-26ab8544afba = Puntuación de confianza a lo largo de una travesía sintética, a partir de una ejecución real del motor v{ $version } sobre examples/maritime-trust (un registro NMEA inventado de un transbordador en una ruta de Tallin a Helsinki, { "3001" } épocas a { "1" } Hz). Tres carriles comparten un eje de tiempo. Arriba: la distancia entre la posición que notifica el receptor y la posición real del buque, que se mantiene dentro de unos pocos metros hasta unos { "1576" } s, cuando el arrastre de posición programado en el registro la aparta, mientras el receptor sigue notificando una posición válida. En medio: la puntuación de confianza de { "0" } a { "100" }, no calculada durante los primeros { "300" } s de calibración, en la banda nominal (al menos { "90" }) hasta el arrastre y luego descendiendo por la banda degraded (al menos { "55" }) hasta la banda untrusted. Abajo: la banda de cada época como una cinta de color con su nombre. La puntuación es consultiva. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque. El registro es inventado para mostrar el formato y los monitores; no es una medición y no dice nada sobre cómo funcionaría ningún receptor.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = La figura la dibuja <c1/> a partir de una ejecución real de esta demostración (<c2/>); la puntuación es consultiva y el registro es inventado.

# text
seg-8badaf0d8586 = Especificación de la vista de Studio

# text
seg-588092535a89 = Para quien construya la vista de Studio de una ejecución de buque. Nada de esta sección está implementado todavía en Studio; el lado del motor (los datos de abajo) sí lo está.

# text
seg-5c34f31acf1d = <b>Entradas.</b> Cualquiera de estas:

# text
# c1: kshana receiver-trust <session.toml>
# c2: receiver_trust(toml)
# c3: score_model
# c4: monitors_run
# c5: states
# c6: epochs[]
# c7: t_s
# c8: state
# c9: alarms
# c10: score.{score,band,deductions[]}
# c11: marine.{position:[lat,lon], stats, ratios}
# c12: geometry
# c13: class
# c14: geometry_model
# c15: geometry_summary
seg-57ca6d9000b1 = el JSON de resultados de una ejecución por lotes (<c1/>, o lo mismo mediante <c2/> en el paquete WebAssembly con el registro en línea): <c3/> (bordes de banda, rampa, retención de evidencia, cada peso), <c4/>, <c5/> y <c6/>, cada uno con <c7/>, <c8/>, <c9/>, <c10/>, <c11/> y, desde { "0.36" }, <c12/> y la <c13/> de cada deducción, con <c14/> y <c15/> en el nivel superior; o bien

# text
# c1: position
seg-bfab64386b6c = las líneas JSON en directo (esquema de arriba), un objeto por época, añadidas a medida que corre el flujo. Cada línea lleva la <c1/> notificada por el receptor (esquema { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = El conjunto de demostración es <c1/>: <c2/>, <c3/> (el registro) y <c4/> (<c5/>: dónde estuvo realmente el buque, algo que ningún registro real tiene). Una vista debería ejecutar la sesión y leer el archivo de verdad terreno a su lado.

# text
seg-c015c26cf30a = Qué dibujar.

# text
seg-92f452bdbed6 = <em>Trayectoria</em>, norte arriba, una escala en ambos ejes: las posiciones notificadas por el receptor como una línea coloreada según la banda de la época (gris calibrando, verde nominal, ámbar degraded, rojo untrusted), inicio y final marcados, una barra de escala. En la demostración, la trayectoria real como una línea neutra fina debajo, de modo que el arrastre se vea como la separación de ambas; un conmutador para la trayectoria real y una lectura del desfase en metros en el instante del cursor.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Cronología de la puntuación</em>: la puntuación de { "0" } a { "100" } frente al tiempo, los bordes de banda (<c1/>, <c2/> de <c3/>) como líneas discontinuas, la banda como una tira debajo y el inicio de cualquier suceso declarado como una marca. El eje de tiempo se comparte con la trayectoria.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Motivos</em>: para la época bajo el cursor, las deducciones (monitor, razón frente al umbral, puntos) como barras horizontales, de mayor a menor, con el peso que lleva cada monitor de <c1/>; los monitores que se ejecutaron y no costaron nada se muestran tenues, los monitores que no se ejecutaron (que no están en <c2/>) se listan como "not run", nunca como superados. El monitor <c3/> no tiene entrada en <c4/>: su tope es <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Tiras de monitor</em>: una tira fina por cada monitor de <c1/> que muestra su razón a lo largo del tiempo (alarma en { "1" }), de modo que el lector ve qué comprobación se movió primero.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>Estado de la puerta</em>: en una vista en directo, el <c1/> de cada época (<c2/>, <c3/>, <c4/>) como una tira bajo la tira de banda, y la última <c5/>. En una vista por lotes, las épocas que una puerta habría retenido son aquellas cuya banda es untrusted, con la retención de liberación aplicada.

# text
# c1: geometry.status
# c2: class
# c3: geometry_summary
# c4: geometry.note
# c5: n_used
# c6: source
# c7: age_s
# c8: reported_derived_mismatch
# c9: unknown
# c10: [geometry]
# c11: geometry_model
seg-b96652af3a03 = <em>Carril de geometría</em> ({ "0.36" }): una tira bajo la tira de banda coloreada según <c1/> (verde bueno, ámbar degraded, gris rayado desconocido), en una familia de color distinta de la de los carriles de inconsistencia y de entorno, con la leyenda "geometry: the sky, not the signal". Deducciones coloreadas según <c2/> (geometría, entorno, inconsistencia) en el panel de motivos y en las tiras de monitor, y los recuentos de épocas por clase de <c3/> junto a los recuentos de banda. Para la época bajo el cursor: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> y un indicador cuando <c8/> está activado (la deducción de geometría es entonces una inconsistencia). <c9/> se muestra como "geometry unknown: no GSV or GSA in the log", nunca como bueno. Los umbrales de <c10/> y su procedencia desde <c11/> van junto a los ajustes de la puntuación. La nota consultiva permanece.

# text
seg-c48906d03f90 = <em>Posición notificada por el receptor</em>: el receptor de la demostración notifica una posición válida en todo momento (calidad GGA { "1" }, estado RMC A); dígalo en la leyenda, porque ese es el sentido de la vista.

# text
seg-869c8a92e2cf = <b>Interacciones.</b> Un cursor de tiempo compartido por todos los paneles (arrastrar, teclas de flecha y un botón de reproducción que reproduce de 1x a 60x); pasar el cursor sobre la trayectoria o sobre cualquier tira lo mueve. Hacer clic en una deducción resalta las épocas en las que ese monitor estuvo por encima de su inicio. Un filtro de banda (mostrar solo las épocas degraded y untrusted) y un salto a la primera deducción y a la primera época untrusted. Texto emergente en cada nombre de monitor con la descripción de una línea de esta página. Los umbrales y pesos de la sesión se muestran, de solo lectura, junto al gráfico, de modo que lo que usó la puntuación está en pantalla.

# text
seg-1f97fe8ea2f1 = <b>Redacción que debe mantenerse.</b> La página debe decir que es software de carácter consultivo y no un equipo de navegación homologado, que la demostración es texto sintético con un arrastre inventado, y que una posición sin alarma no es por ello una buena posición (véanse los límites de arriba). Ninguna cifra de la página debe leerse como una medida de cómo se comportan las comprobaciones frente a interferencias reales.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Para quienes llaman con la sesión y los bytes en memoria (sin archivos, sin reloj, sin sockets; seguro para WebAssembly), <c1/> ofrece:

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/>: un registro completo, puntuado como una ejecución por lotes; el mismo resultado que <c2/>, que se serializa en el JSON de resultados (<c3/>, <c4/>, <c5/> con puntuaciones y deducciones).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/>: un fragmento acotado de un flujo (como máximo { "2" } MiB y { "20,000" } épocas, y lo bastante largo para contener la ventana de calibración), puntuado como lo puntúa el modo en directo y devuelto en el esquema de líneas JSON en directo (<c2/>, la última <c3/>, un resumen de recuentos de banda, puntuación más baja y final, primer instante untrusted). El tiempo del receptor no se compara con un reloj del anfitrión. El modo en directo de larga duración (sockets, un archivo al que se añade, la puerta) corresponde al binario.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Ambos necesitan una sesión con <c1/>; su tabla <c2/> es opcional.

# text
seg-870fece8026e = Ejecútelo en directo

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = La sesión es el mismo <c1/> que en una ejecución por lotes, con una tabla <c2/> que declara <c3/>; su tabla <c4/> no es necesaria. Los puertos serie todavía no se abren directamente: lea el puerto con la herramienta que ya usa (<c5/> y <c6/>, un servidor de terminales, un multiplexor) y canalícelo o reenvíelo. La entrada serie directa puede llegar más adelante.

# text
seg-13a043c1ce60 = Cada época completada escribe una línea JSON en la salida estándar:

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> es <c2/>, <c3/>, <c4/> o <c5/> (la banda de la puntuación, con los bordes en la tabla <c6/> de la sesión); <c7/> está ausente durante la calibración; <c8/> enumeran qué comprobaciones restaron puntos y cuántos, de mayor a menor.

# text
seg-9b21238a7dc1 = Esquema de líneas JSON (versión { "1.1" })

# text
seg-79306ff2d878 = Un objeto JSON por época completada, con las claves en este orden:

# text
seg-a129b9e613d0 = Tipo

# text
seg-bbcdd898d24d = entero

# text
seg-96958263575f = recuento de épocas notificadas, a partir de { "1" }

# text
seg-16022703e1c0 = número

# text
seg-95dde7698840 = segundos desde la primera época del flujo

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = la hora de la época tal como la indica el flujo (UTC ISO-8601 con fecha una vez que se ha visto una RMC; en caso contrario <c1/>)

# text
seg-0361f40a8e59 = número o null

# text
# c1: note
seg-c2418289d966 = de { "0" } a { "100" }, un decimal; null durante la calibración o cuando <c1/> dice por qué no se pudo producir ninguna

# text
seg-00575e5df2e1 = matriz

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, primero los que más puntos restan; <c2/> es el estadístico sobre el umbral (alarma en { "1" } o más); solo se listan los monitores que cuestan puntos; <c3/> <em>(añadido en { "1.3" })</em> es <c4/>, <c5/> o <c6/>

# text
seg-24d178dfb34f = matriz de cadenas

# text
seg-30948e769405 = monitores en su umbral o por encima de él

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> o <c3/>

# text
seg-495aa49df7e2 = por qué no se produjo ninguna puntuación (por ejemplo, un sensor de rumbo declarado que está ausente)

# text
seg-3dabfd59cf4b = objeto o null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(añadido en { "1.1" })</em> la posición que el receptor notificó en esta época, <c1/> (altura elipsoidal cuando la sentencia da la separación del geoide; si no, sobre el nivel medio del mar); null cuando el receptor no dio ninguna, incluidas las épocas de calibración sin posición

# text
seg-3af4806d7d74 = <em>(añadido en { "1.2" })</em> qué es y qué no es este software: consultivo, no un equipo de navegación homologado, el operador sigue siendo responsable

# text
# c1: status
# c2: good
# c3: degraded
# c4: unknown
# c5: reasons
# c6: few-satellites
# c7: high-pdop
# c8: high-hdop
# c9: sky-blocked
# c10: source
# c11: derived
# c12: reported
# c13: none
# c14: n_used
# c15: hdop
# c16: pdop
# c17: vdop
# c18: open_fraction
# c19: max_azimuth_gap_deg
# c20: age_s
# c21: reported_hdop
# c22: reported_derived_mismatch
# c23: note
# c24: in_view
# c25: signal_loss
# c26: environment
# c27: label
# c28: good
# c29: fair
# c30: poor
# c31: unknown
# c32: poor
# c33: RECEIVER-TRUST.md
seg-79adcc5ee873 = <em>(añadido en { "1.3" })</em> la geometría de los satélites: <c1/> (<c2/>, <c3/>, <c4/> cuando el flujo no tiene elevaciones ni acimutes de GSV y no tiene GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satélites a la vista pero no seguidos mientras el DOP a la vista es bueno: la deducción de geometría es entonces <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: siempre notificado, nunca puntuado; la puntuación solo resta por <c32/>) (véase <a1><c33/></a1>)

# text
# c1: cn0-drop
# c2: agc
# c3: jam-ind
# c4: loss-of-lock
# c5: position-jump
# c6: raim
# c7: clock
# c8: solve-failure
# c9: kinematic
# c10: heading-course
# c11: speed-log
# c12: sea-level
# c13: cn0-spread
# c14: cn0-rise
# c15: time-consistency
# c16: osnma
# c17: geometry
# c18: $PKSHT
# c19: position
# c20: advisory
# c21: geometry
# c22: class
seg-fc212411bf3c = Nombres de monitor (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> y, desde { "1.3" }, <c17/>. En versiones posteriores pueden añadirse nombres nuevos; los consumidores deben tratar un nombre de monitor desconocido como un monitor. La disposición de <c18/> de abajo lleva una versión de formato en su primer campo; este esquema JSON es la versión { "1.3" }: { "1.1" } añadió <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> al final y <c22/> en cada deducción, y solo cambia añadiendo claves al final.

# text
seg-0019bf7fbfcd = Entrada de autenticación

# text
# c1: osnma
# c2: MarineObs::sat_auth
# c3: (satellite, status)
# c4: Authenticated
# c5: Failed
# c6: Unavailable
# c7: MarineObs::osnma
# c8: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c9: $PKSOS,A,E11:A,E19:F
seg-39b3dfbd97cc = El monitor <c1/> toma el estado de autenticación por satélite de una fuente de autenticación mediante <c2/> (una lista de <c3/>, estado <c4/>, <c5/> o <c6/>), junto al <c7/> global. Del lado de NMEA lo transporta <c8/>, por ejemplo <c9/>. Cualquier fallo, global o en un satélite, activa la alarma del monitor y le cuesta todo su peso (se le asigna la razón { "1.5" }); el éxito no es evidencia. Kshana no verifica nada aquí: la fuente que lo hace es responsable del estado que notifica.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Una época está completa cuando llega la siguiente sentencia con hora; las sentencias de instrumentos más lentos o no sincronizados (un giróscopo unas décimas de segundo por detrás del receptor) que llegan antes le pertenecen. Si el flujo se detiene durante <c1/> (por defecto { "1.5" } s; fíjelo por encima del mayor intervalo entre las sentencias con hora de su receptor), la época se completa tal como está. Los primeros <c2/> segundos del flujo forman la línea base y nunca se puntúan, por lo que <b>un flujo que ya está siendo suplantado cuando se conecta por primera vez no tiene una línea base limpia</b>: inicie la capa antes de la travesía, o mientras se sepa que la posición es buena. La ventana de calibración se cierra una sola vez, por orden de llegada: una época cuya hora es anterior a una hora ya vista (un retroceso, una reproducción del inicio del flujo) nunca es calibración, diga lo que diga su hora; se puntúa con una deducción completa de <c3/>, que es untrusted. El motor en directo puntúa cada época sobre las épocas de calibración y el último minuto aproximadamente del flujo, de modo que su coste por época crece con <c4/> por la tasa de épocas; mantenga la ventana corta en un receptor rápido. Sus búferes están acotados (una avalancha de líneas sin sentencia con hora se completa cada { "5,000" } líneas; la calibración y el historial están limitados a { "20,000" } épocas).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = El tiempo del receptor se compara también con el reloj monótono de este ordenador, lo cual solo tiene sentido para un flujo que llega en tiempo real. Un registro almacenado introducido a toda velocidad por stdin, TCP o UDP activa esa comprobación por construcción: pase <c1/>. (<c2/> sin <c3/> ya lo implica.) Un <c4/> se lee como una reproducción hasta que se ha leído hasta su final y, desde entonces, se activa el reloj del anfitrión, de modo que un atraso acumulado no se lee como un fallo de reloj; la comprobación necesita entonces que la ventana de calibración siga abierta (en caso contrario no tiene línea base y no se ejecuta).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Finales de flujo y fallos: stdin y un archivo leído hasta su final terminan con normalidad (salida { "0" }). Una conexión TCP cerrada por el otro extremo no es un final normal para un flujo que debería continuar: la capa sale con código distinto de cero tras puntuar y escribir todo lo que había recibido y no se reconecta, así que ejecútela bajo un supervisor que la reinicie. Los datagramas UDP que dividen una sentencia se unen; los lectores de stdin, de un archivo y de TCP están respaldados por una cola acotada que presiona al emisor (no se pierde nada), mientras que UDP, que no puede presionar, descarta los datagramas que el motor no puede aceptar y lo indica en stderr. <c1/> se enlaza a la dirección de bucle local; indique <c2/> para escuchar en otro sitio (se imprime una advertencia).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/>: la sentencia propietaria

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Cada época produce además una sentencia NMEA { "0183" }, con una suma de comprobación válida, que <c1/> escribe en un archivo o en la salida estándar y que la puerta inserta en el flujo reenviado:

# text
# c1: 1
seg-df9382f4b055 = <c1/>: la versión del formato

# text
# c1: hhmmss.ss
seg-6986879f86fb = hora UTC de la época, <c1/>; vacía si el flujo no dio ninguna

# text
seg-34418696f9d2 = puntuación de confianza de { "0" } a { "100" }, un decimal; vacía durante la calibración o cuando no se pudo producir ninguna

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = banda: <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = puerta: <c1/> off, <c2/> passed, <c3/> withheld (la posición se marcó como no válida en el ciclo reenviado)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = hasta dos motivos, <c1/> unidos por <c2/>; vacío cuando no se dedujo nada

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = La dirección es <c1/> + el mnemónico del fabricante <c2/> + <c3/>. El equipo que no conoce una sentencia propietaria la ignora. Kshana ignora su propia <c4/> en la entrada.

# text
seg-d75c9da94f37 = Modo de puerta

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> sitúa a Kshana entre el receptor y el equipo que usa su posición (un sistema de cartas, un sistema de control de rumbo). El flujo NMEA entra, sale por la salida estándar y es:

# text
# c1: $PKSHT
seg-aa0692146620 = <b>transmitido sin cambios</b> mientras la época no es untrusted (y durante la calibración), con una <c1/> después de cada ciclo de sentencias; y

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>marcado como no válido</b> mientras es untrusted: calidad GGA <c1/>; estado RMC <c2/> (y su indicador de modo <c3/> y estado de navegación <c4/> donde estén presentes); modo GNS <c5/> en cada posición; estado GLL <c6/> y modo <c7/>; modo VTG <c8/> donde lo tenga. Los campos de posición se dejan como estaban: lo importante es que el equipo ve que el propio receptor declara la posición no válida y activa su propia alarma. A cada sentencia reescrita se le recalcula la suma de comprobación.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Una vez retenida, la posición se libera solo después de que las épocas hayan estado fuera de la banda untrusted durante <c1/> (por defecto { "30" } s), de modo que una puntuación en el borde de la banda no pueda hacer parpadear la posición. Las líneas JSON van únicamente adonde diga <c2/> (por defecto, a ninguna parte, porque el flujo tiene la salida estándar).

# text
seg-6b7b557a4909 = Para dejar que un trazador de cartas se conecte directamente, sirva el flujo filtrado por la puerta por TCP en lugar de por la salida estándar:

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> escucha en la dirección de bucle local; <c2/> escucha en otro sitio (se imprime una advertencia, porque cualquiera que pueda alcanzar la dirección puede leer el flujo). Puede conectarse cualquier número de clientes; cada uno recibe el mismo flujo desde el momento en que se conecta, y los clientes solo leen. Cada cliente tiene su propia cola acotada y su propio escritor, de modo que el que no pueda seguir el ritmo se descarta (se cierra su conexión y se escribe una línea en stderr) y nunca retrasa a los demás ni a la entrada. <c3/> necesita <c4/>; la salida estándar entonces no lleva nada del flujo, así que <c5/> queda libre.

# text
seg-960e0abb0466 = Lo que la puerta no hace, y lo que hay que saber antes de usarla:

# text
# c1: --gate
seg-ee3f18efa84c = Es <b>opcional</b>. Nada marca una posición como no válida salvo que se indique <c1/>.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = <b>Añade latencia</b>: un ciclo se retiene hasta que se puntúa su época, que es el tiempo hasta la siguiente sentencia con hora (aproximadamente un ciclo: un segundo para un receptor de { "1" } Hz), o <c1/> después de la última cuando el flujo se detiene. El equipo que necesita una sentencia a pocas decenas de milisegundos de la salida del receptor no debe colocarse detrás de ella.

# text
seg-ec63f8f3230b = Es <b>un punto único en la cadena</b>: si se detiene, el flujo se detiene. Ejecútela bajo supervisión y decida de antemano qué hace el equipo posterior sin flujo.

# text
# c1: note
seg-536e41a6a5e7 = <b>Falla en modo cerrado ante sus propios fallos</b>: si los monitores no pueden producir una puntuación tras la calibración (un sensor de rumbo declarado que no envía nada, demasiado pocas épocas de calibración), la época es untrusted, lleva una <c1/> y se retiene; la retención de liberación se mide con el reloj de este ordenador, no con el tiempo del receptor, que es lo que controla un suplantador (para una reproducción solo existe el tiempo del receptor).

# text
seg-5dd62cd853c6 = Puede <b>retener una buena posición</b> (una falsa alarma) además de dejar pasar una suplantada (un fallo de detección). Los monitores comprueban una posición frente a la física del buque y sus demás sensores; una falsificación coherente con todos ellos no se detecta (véanse los límites abajo).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = Espera un <b>flujo de texto NMEA { "0183" } puro</b>. Las tramas binarias mezcladas en el flujo se reenvían sin cambios, pero entonces una <c1/> puede quedar entre los bytes de una trama.

# text
seg-0c919698fa92 = <b>No está homologado</b> y nada en él se ha evaluado frente a IEC { "61108" } ni IEC { "61162" }. El operador sigue siendo responsable de la navegación del buque.

# text
seg-9e3ea39c38cf = <s1>Anterior</s1>Confianza del receptor

# text
seg-136da5c10b2d = <s1>Siguiente</s1>Flujos NMEA de formación

# text
seg-990a49527516 = $PKSHT: la sentencia propietaria
