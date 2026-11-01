# docs--example-multi-tool: translations (es)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Fuente: <c1/>

# text
seg-42e93cd44e94 = Ejemplo resuelto: Kshana como capa de unión del análisis de misión con varias herramientas

# text
# c1: label
seg-286cf0e7bb71 = Este ejemplo recorre una trayectoria de principio a fin por los tipos de escenario de interoperabilidad basada en estándares y de análisis de misión, y muestra cómo Kshana se sitúa <em>entre</em> las herramientas de alta fidelidad que un programa ya usa, en lugar de competir con ellas: GMAT (General Mission Analysis Tool), Orekit y STK (Systems Tool Kit) para el diseño de trayectorias, y Basilisk o { "42" } para la simulación del sistema de control de actitud y órbita (AOCS). Cada paso es un tipo de escenario ejecutable, y cada resultado lleva un <c1/> que indica su alcance y su nivel de evidencia.

# text
# c1: label
seg-7198d05bece6 = Nota de honestidad: esto es una cadena <em>geométrica/analítica</em> de nivel previo a la fase A / estudio de compromisos (antes de la primera fase formal de diseño de una misión). No es una certificación de dinámica de vuelo; véase el campo <c1/> de cada tipo de escenario.

# text
seg-70c18138497b = Otras abreviaturas usadas a continuación: FDS (sistema de dinámica de vuelo), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, el propagador de elementos de dos líneas), TOML (el formato de archivo de escenario) y CLI (interfaz de línea de comandos).

# text
seg-7cc0d4d15c4a = La cadena de pasos

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = Los pasos son ejecuciones separadas: cada uno toma sus entradas de su propio archivo de escenario, de modo que usted lleva un número de uno a otro (por ejemplo, una distancia oblicua de <c1/> a <c2/>) editando el archivo siguiente. El tipo de escenario <c3/> puede reunir varios tipos de escenario en una sola ejecución bajo condiciones compartidas; véase <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Cada comando de abajo se ejecuta desde la raíz del repositorio, y el resumen que figura debajo es la primera línea que imprime kshana { $version } para el escenario incluido.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Ingerir la trayectoria que produjo un diseñador (<c1/>)

# text
seg-4b732dd54291 = GMAT, Orekit y STK <em>exportan</em> todos mensajes de efemérides de órbita CCSDS (OEM). Kshana los importa (el otro sentido del puente), de modo que un análisis de Kshana puede partir de la órbita exacta que el diseñador de la trayectoria dio por buena, y no de una aproximación recalculada:

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = Informa de los segmentos, los objetos, los marcos y el intervalo de épocas, y de una comprobación de coherencia de velocidad, lo que muestra que las efemérides se ingirieron fielmente (error de ida y vuelta inferior a { "1" }×{ "10" }⁻⁶ km). Si en su lugar se da un archivo externo en <c1/>, informa de lo que interpretó: alimentado con el OEM que escribe <c2/>, imprime <c3/>. El <c4/> deja claro que se trata de una comprobación estructural y física de la ingesta, no de una validación de la exactitud orbital de la fuente.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. ¿Cuándo es visible desde una estación terrena? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Predice los pasos de salida y puesta sobre una estación por encima de una máscara de elevación: adquisición de señal (AOS), instante de máximo acercamiento (TCA), pérdida de señal (LOS), elevación máxima y duración, además del tiempo total de acceso. Esa es la consulta de planificación del segmento terreno. La órbita es un conjunto de elementos SGP4 llevado al marco terrestre mediante la cadena IAU 2006/2000A, y las elevaciones son aparentes: refracción ITU-R P.834-9 y tiempo de luz del enlace descendente, cada uno conmutable (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. ¿Se cierra el contacto? (<c1/>)

# text
seg-47bdb9d4700c = Para un paso, introduzca la distancia oblicua y las cifras del terminal en la ecuación de enlace de CCSDS { "401" } / DSN 810-005 (Red de Espacio Profundo de la NASA):

# text
seg-db12a99edcd2 = Informa de la pérdida de trayecto en espacio libre (FSPL), la densidad de portadora a ruido (C/N₀), la energía por bit sobre la densidad de ruido (Eb/N₀), el margen y si el enlace <b>se cierra</b> frente a una Eb/N₀ requerida: la comprobación de viabilidad de comunicaciones que convierte «es visible» en «de hecho podemos descargar los datos». Los números se siguen directamente de las entradas del archivo (aquí una PIRE, potencia isotrópica radiada equivalente, de { "55" } dBW hacia una G/T de recepción, relación entre ganancia y temperatura de ruido, de { "53" } dB/K); introduzca las cifras de su propio terminal antes de leer el margen. Es un cálculo determinista, no la hoja de datos de un terminal calibrado.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. ¿Con qué rapidez la hace decaer el entorno? (<c1/>)

# text
seg-8977b12fd934 = Obtiene la densidad neutra termosférica a partir de la actividad solar (F10.7, el flujo de radio de { "10.7" } cm, y su media de 81 días F10.7a) y geomagnética (índices Kp y ap) mediante la temperatura exosférica de Jacchia-71. Eso recoge la oscilación de densidad de ~{ "5" }–{ "10" }× del ciclo solar que una atmósfera estática omite, de modo que una estimación de vida orbital o de arrastre refleja el régimen de clima espacial y no una atmósfera fija. Desde { "0.30" } la densidad es la densidad termosférica de Jacchia { "1971" }, caracterizada frente a NRLMSISE-00 (Naval Research Laboratory, espectrómetro de masas y dispersión incoherente), pero no una atmósfera NRLMSISE-00 validada con datos.

# text
seg-4b5bdadf3e7e = { "5" }. Devolver el resultado (exportaciones)

# text
# c1: orbit
# c2: --export-oem <file>
# c3: --export-sp3 <file>
# c4: --export-omm <file>
# c5: --export <czml|kml|geojson|stk|sigmf|all|list>
# c6: .e
# c7: spectrum
# c8: --export list
# c9: lunar-interop-export
seg-f4a438636ea8 = La misma CLI escribe archivos estándar para la herramienta siguiente. En un escenario <c1/>, <c2/> escribe unas efemérides CCSDS OEM { "2.0" } con velocidad (el archivo que leen GMAT, Orekit y STK), <c3/> unas efemérides precisas SP3 (Standard Product { "3" }) y <c4/> un catálogo de mensajes de elementos medios de órbita CCSDS. <c5/> cubre los visores: CZML (Cesium Language), KML (Keyhole Markup Language, para Google Earth), GeoJSON, archivos de efemérides de STK (<c6/>, uno por satélite más el usuario) y grabaciones SigMF (Signal Metadata Format) del tipo de escenario <c7/>. <c8/> indica cuáles se aplican a un escenario. Para la Luna, el tipo de escenario <c9/> emite el marco lunar, la escala de tiempo y las efemérides como un OEM de CCSDS con una comprobación de ajuste a la norma. Véase <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Por qué esto es la capa de unión y no un competidor

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Cada paso es un escenario pequeño, auditable y reproducible con una etiqueta de alcance explícita. Las herramientas de alta fidelidad se encargan de la optimización de trayectorias, del AOCS de seis grados de libertad (6-DoF) y de la entrada, descenso y aterrizaje aerotérmicos (EDL); Kshana se encarga del <b>tejido conectivo abierto, citable y ejecutable</b>: ingerir los formatos estándar, responder a las preguntas transversales de geometría y viabilidad, y pasar el resultado a la herramienta siguiente, en un nivel que cualquier socio puede ejecutar sin licencia. Véanse también los tipos de escenario de análisis de misión complementarios <c1/>, <c2/>, <c3/>, <c4/> y <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Anterior</s1>{ "3" } · Cuántico frente a clásico

# text
seg-b0765a28b4ce = <s1>Siguiente</s1>Tipos de escenario

# text
seg-dc88ec5ccc43 = { "1" }. Ingerir la trayectoria que produjo un diseñador (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. ¿Cuándo es visible desde una estación terrena? (passes)

# text
seg-afa47b4283a3 = { "3" }. ¿Se cierra el contacto? (link-budget)

# text
seg-e508e844bf2d = { "4" }. ¿Con qué rapidez la hace decaer el entorno? (space-weather)
