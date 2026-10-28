# docs--kind-gnss-ssv: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-834408a40783 = min

# text
# c1: docs/kinds/by-kind/gnss-ssv.md
seg-1b94e5a24a2d = Fuente: <c1/>

# text
# c1: gnss-ssv
seg-ee3ecc6e0330 = <c1/> (tipo de escenario)

# text
seg-d07af7221334 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación de usuarios espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-d6d7bca305dc = Disponibilidad MODELLED de GNSS e intensidad del enlace en el Volumen de Servicio Espacial y más allá: para un usuario sobre una esfera (la capa global del folleto del ICG) o sobre una trayectoria kepleriana (de LEO a transferencia lunar) cuenta, por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y para todas juntas, las señales utilizables por encima de un umbral de C/N0 - disponibilidad de al menos una y de cuatro señales, duración máxima de interrupción, C/N0 recibido, dilución de la precisión, enlaces por lóbulo principal frente a lóbulos laterales - con un patrón de transmisión del folleto, paramétrico o suministrado por el usuario, efectos opcionales de ionosfera en rayo rasante, plasmasfera y atmósfera y un diseño opcional de receptor de señal débil; también un filtro de Kalman extendido GNSS a bordo para naves en HEO y en transferencia lunar (dinámica orbital, presión de radiación solar, terceros cuerpos, reloj) y la navegación relativa de una formación de varias naves mediante pseudodistancias de diferencia simple. Contrastado con las tablas del folleto SSV del ICG bajo un preregistro (xval/gnss-ssv)

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-d739ae994bf0 = Una ejecución de <c1/> se resume así: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

# text
# c1: shell|trajectory|navigation
seg-79d2e350ed73 = Campos obligatorios: <c1/>

# text
# c1: name
# c2: constellations
# c3: transmit
# c4: receiver
# c5: atmosphere
# c6: formation
seg-7fc75803140d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/gnss-ssv-heo.toml
seg-cebc76420d69 = El ejemplo <c1/> establece, entre otros:

# text
seg-ce3b64e8c1f4 = [l1, l5]

# text
seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

# text
seg-b02a3ef32d54 = HEO, antenas de alta ganancia en nadir y de parche en cenit, paramétrico s

# text
seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

# text
seg-3421a66993bd = heo

# text
seg-8974ff39f695 = parametric

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-8ac8f00f6c77 = 1/m^{ "3" }

# text
seg-15ca016a7a4f = Etiqueta del resultado (la del motor): MODELLED: un barrido geométrico y de balance de enlace. El patrón del folleto es un lóbulo principal de potencia constante, el patrón paramétrico un sustituto representativo y el medio del rayo rasante un modelo sencillo indicado; nada de esto es una medición de una señal en el espacio. Las cifras de disponibilidad y de interrupción siguen el método de

# attr:alt
seg-7dae5e291c8b = El gráfico que escribe el motor para scenarios/gnss-ssv-heo.toml, tipo de escenario gnss-ssv

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Los barridos de disponibilidad del tipo de escenario <c1/>: por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y combinadas, la proporción de pares (usuario, época) con al menos una y al menos cuatro señales y la interrupción más larga, para un usuario sobre una esfera

# text
# c1: gnss-ssv
# c2: [navigation]
seg-07c94d5ad15c = <b>MODELLED</b> El modo <c2/> del tipo de escenario <c1/>: un filtro de Kalman extendido de nueve estados (posición, velocidad, sesgo y deriva del reloj del receptor, un factor de escala de la presión de radiación solar) sobre pseudodistancias cuya disponibilidad, ruido y C/N0 proceden del mismo enlace

# text
# c1: gnss-ssv
# c2: [formation]
seg-41bfe74c6f6f = <b>MODELLED</b> El modo <c2/> del tipo de escenario <c1/>: un jefe y sus adjuntos ejecutan cada uno el filtro absoluto; la posición del adjunto respecto al jefe se estima restando las estimaciones absolutas y mediante un filtro relativo sobre pseudodistancias de diferencia simple

# text
# c1: gnss-ssv
seg-de9a2a5b5f04 = <b>MODELLED</b> Los barridos de disponibilidad del tipo de escenario <c1/>: por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y combinadas, la proporción de pares (usuario, época) con al menos. Referencia independiente (ExternalDataset): El folleto del Volumen de Servicio Espacial del ICG (UN OOSA ST/SPACE/75, { "2018" }), que es en sí mismo una simulación, comparado bajo un preregistro confirmado antes de la ejecución (xval/gnss-ssv/PREREGISTRATION.md; resultados en xval/gnss-ssv/RESULTS.md, fijados por tests/ssv_booklet_results.rs, fallos incluidos). Ejecución { "1" } con la lectura preregistrada: las constantes de potencia radiada mínima y el umbral lunar coinciden (S0, S6 alcanzados); el SSV superior e inferior, umbral de RF

# text
seg-f0b778c4922a = <b>MODELLED</b> Una ionosfera de Chapman, una plasmasfera de tipo Gallagher y una atmósfera neutra (curvatura por refractividad, absorción del oxígeno, desenfoque) integradas a lo largo de la recta. Referencia independiente (InternalConsistency): Formas cerradas y magnitudes publicadas en las pruebas (el máximo de una capa de Chapman y la curvatura del limbo de superficie, unos pocos TECU de plasmasfera en un rayo de GPS a GEO); el diseño del receptor reutiliza los modelos de adquisición y de lazo de seguimiento y sus pruebas. No se compara con él ningún dato medido de sondeo de limbo ni de recepción de señal débil

# text
# c1: gnss-ssv
# c2: [navigation]
seg-77cef183420e = <b>MODELLED</b> El modo <c2/> del tipo de escenario <c1/>: un filtro de Kalman extendido de nueve estados (posición, velocidad, sesgo y deriva del reloj del receptor, un factor de escala de la presión de radiación sol. Referencia independiente (InternalConsistency): Verdad simulada frente a la propia estimación del filtro (el error de estimación normalizado al cuadrado medio de un filtro consistente es de unos { "3" } para la posición) y determinismo con una semilla fija. No se compara ningún dato de vuelo ni registrado de GNSS en órbita alta; el Sol y la Luna son sustitutos circulares de baja precisión

# text
# c1: gnss-ssv
# c2: [formation]
seg-429e154cd691 = <b>MODELLED</b> El modo <c2/> del tipo de escenario <c1/>: un jefe y sus adjuntos ejecutan cada uno el filtro absoluto; la posición del adjunto respecto al jefe se estima restando. Referencia independiente (InternalConsistency): La misma verdad simulada que el filtro absoluto: el error del filtro relativo frente al estado relativo verdadero, y la comprobación de que lo hace al menos tan bien como restar dos soluciones absolutas independientes. No se compara ningún dato de formación en vuelo

# text
# c1: label
seg-1dd1beb01075 = MODELLED: un barrido geométrico y de balance de enlace. El patrón del folleto es un lóbulo principal de potencia constante, el patrón paramétrico un sustituto representativo y el medio del rayo rasante un modelo sencillo indicado; nada de esto es una medición de una señal en el espacio. Las cifras de disponibilidad y de interrupción siguen el método del folleto del Volumen de Servicio Espacial del ICG (UN ST/SPACE/75) y se contrastan con sus tablas en xval/gnss-ssv/. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e9c2dedbc971 = Disponibilidad MODELLED de GNSS e intensidad del enlace en el Volumen de Servicio Espacial y más allá: para un usuario sobre una esfera (la capa global del folleto del ICG) o sobre una trayectoria kepleriana (de LEO a transferencia lunar) cuenta, por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y para todas juntas, las señales utilizables por encima de un umbral de C/N0 - disponibilidad de al menos una y de cuatro señales, duración máxima de interrupción, C/N0 recibido, (catálogo de tipos de escenario (<c1/>))

# text
seg-3add0e744c54 = MODELLED: el patrón es representativo, no medido; el medio es un modelo sencillo indicado (docs/SSV.md). (comentario del archivo de escenario, línea { "14" })

# text
seg-6b4655dd5270 = La disponibilidad de señales GNSS en el Volumen de Servicio Espacial y más allá, comparada con el folleto SSV del ICG, es MODELLED, no está validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
# c1: gnss-ssv
seg-a9e1798308df = Los efectos de la ionosfera en rayo rasante, de la plasmasfera y de la atmósfera sobre señales GNSS rasantes, y el diseño del receptor de señal débil, en el tipo de escenario <c1/> son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-132be2813c10 = El filtro de navegación GNSS a bordo para naves de órbita alta y de transferencia lunar es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f9405de9adb8 = La navegación relativa de una formación de varias naves en una órbita muy elíptica a partir de GNSS es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-4881f925ea7f = Página de familia: <a1>Navegación de usuarios espaciales</a1>

# text
seg-4b72df59b3f9 = Página de tema: <a1>SSV.md</a1>

# text
seg-c9ac9a99bcbb = <s1>Anterior</s1>gnss-sim

# text
seg-9df48482a140 = <s1>Siguiente</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> La fase <c1/>: el estado medio mediante el propagador de Cowell del motor (masa puntual terrestre y J2, el Sol y la Luna como terceros cuerpos, la Luna a partir del kernel DE440 del hilo donde cubre el segmento y el Sol a partir de la serie analít

seg-6a26b9ab59fe = Página del tema: <a1>MISSION-THREAD.md</a1>
