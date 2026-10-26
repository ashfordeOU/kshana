# docs--positioning: translations (es)

# attr:aria-label, text
seg-6555ff9a6d8e = Salida

# text
seg-0be9b5747c00 = Kshana

# text
seg-94058315dfe4 = Entrada

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1>: el mapa de alcance fila por fila (el alcance completo y los residuos del solucionador <c2/> están en la fila <b>Procesamiento GNSS / PNT</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1>: qué está validado, con evidencias.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1>: el tipo de escenario de temporización de telecomunicaciones y sus máscaras.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1>: definiciones en lenguaje llano de los términos usados aquí.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1>: el entorno de pruebas en el navegador.

# text
seg-54e2deeffc7d = <s1>Anterior</s1>Arquitectura

# text
seg-b2f93c49d5c6 = <s1>Siguiente</s1>Registro de cambios

# text
# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Fuente: <c1/>

# text
seg-5b362d7b0903 = Kshana es un <b>motor de evidencias de resiliencia PNT (posicionamiento, navegación y temporización)</b> abierto y reproducible. Usted describe un escenario — los sensores o relojes, una interrupción del GNSS (sistema global de navegación por satélite), un ataque de jamming o spoofing, un presupuesto — y le dice cuán bien se mantienen el tiempo y la posición, puntuados frente a figuras de mérito (FoM) operativas. Cada capacidad que hay detrás de esas cifras se etiqueta en una matriz comprobada por máquina como <b>VALIDATED</b> (contrastada con una referencia independiente externa), <b>MODELLED</b> (internamente consistente, sin comprobación externa) o <b>PARTNER</b> (propiedad de un socio de hardware). Esta página dice dónde destaca, para qué sirve y qué no es.

# text
seg-48d576a345e3 = Dónde destaca: temporización y holdover para infraestructuras críticas

# text
seg-f41d8a48ff13 = La parte mejor validada del motor es la temporización. Las redes de telecomunicaciones, las redes eléctricas y los mercados financieros toman su hora del GNSS, y cada uno debe dimensionar el <b>holdover</b>: cuánto tiempo puede funcionar libre un reloj local tras perder el GNSS antes de que su error de tiempo rompa el presupuesto.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>Qué está VALIDATED.</b> Los estimadores de estabilidad de frecuencia con los que se construye una respuesta de holdover — desviación de Allan (ADEV), desviación de Allan modificada (MDEV), desviación de tiempo (TDEV), error máximo de intervalo de tiempo (MTIE) y el estimador Theo1 de rango extendido — se contrastan con las desviaciones de referencia de Stable32, la biblioteca independiente <c1/> y un reloj de cesio medido real. El cálculo de la varianza de deriva del holdover y su inversión a un tiempo de holdover se contrastan con SciPy. Véase <a1><c2/></a1> para cada fila, su prueba y su referencia independiente.

# text
seg-9fbedc930565 = <b>Qué sigue siendo MODELLED.</b> Los suelos de ruido por clase de reloj (por ejemplo, el suelo a largo plazo de una clase de oscilador dada) fijan la respuesta para un reloj estable, y son cifras representativas, no mediciones de su dispositivo. Aporte suelos medidos para una cifra que piense defender.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Unidades de telecomunicaciones.</b> El tipo de escenario <c1/> informa de MTIE y TDEV, los contrasta con las máscaras del Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones (ITU-T) — G.8272 para un reloj de tiempo de referencia primario (PRTC), G.8272.1 para un PRTC mejorado (ePRTC), G.8273.2 para un reloj de frontera de telecomunicaciones (T-BC) y G.8271.1 para los límites de red en el punto de referencia C — e informa de cuánto tiempo permanece un holdover dentro de cada presupuesto de error de tiempo. Véase <a1><c2/></a1>.

# text
seg-50421d8247ab = Qué lo hace diferente

# text
seg-7ec913b140ed = La física y las normas no son la diferencia: la propagación Simplified General Perturbations { "4" } (SGP4), la desviación de Allan, los marcos de referencia y la dilución de la precisión están disponibles, gratuitos y correctos, en otras bibliotecas, y Kshana se contrasta con varias de ellas. La diferencia es la disciplina de la evidencia:

# text
seg-f7d466d5215b = <b>Abierto.</b> El motor está bajo la GNU Affero General Public License (AGPL), de modo que cualquiera puede leerlo y volver a ejecutarlo. Existe una licencia comercial para integraciones cerradas.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reproducible.</b> Un resultado queda determinado por <c1/>, bit a bit, y una ejecución puede compartirse como un enlace al playground del navegador.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Con procedencia etiquetada.</b> Cada parámetro de sensor se rastrea hasta una fuente publicada (<a1><c1/></a1>), y cada capacidad lleva su nivel VALIDATED / MODELLED / PARTNER. Una guarda de integración continua (CI) rechaza una fila VALIDATED sin referencia independiente externa, de modo que una autocomprobación interna no pueda presentarse como una validación.

# text
seg-8bccfe110f4c = No hemos encontrado otra herramienta abierta que combine estas características en holdover, integridad, navegación inercial por estima y sensores cuánticos, pero una búsqueda que no encuentra nada no prueba que no exista nada; no afirmamos ser la única.

# text
seg-e942b2474960 = Cuántico: un método de compromiso neutral, resultados etiquetados MODELLED

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = Kshana compara relojes y sensores inerciales cuánticos y clásicos sobre el mismo escenario con el mismo código: cada dispositivo es un modelo de error, y el motor no sabe cuál es "cuántico". Considérelo <b>un método neutral de compromiso cuántico frente a clásico cuyos resultados se etiquetan MODELLED</b>. La mayoría de las entradas son coeficientes publicados de Allan/presupuesto de ruido; el acelerómetro de interferómetro de átomos fríos tiene una capa de primeros principios que deriva su coeficiente de ruido. Los datos medidos de desviación de Allan de un socio pueden introducirse mediante el tipo de escenario <c1/>, que es la vía para promover las cifras de un dispositivo concreto. Véanse <a1><c2/></a1> y <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Lunar, cislunar y espacio profundo: mantenidos, no el titular

# text
seg-4b9bd68b7fb1 = La suite lunar / cislunar (monitorización de integridad lunar, el núcleo de tres cuerpos Tierra–Luna, escalas de tiempo lunares, análisis de volumen de servicio) y el motor de navegación radiométrica de espacio profundo son capacidades mantenidas. La mayoría de sus filas son MODELLED, y ya existen herramientas dedicadas a la navegación lunar, de modo que se ofrecen como capacidades del mismo motor, cada una con su propio nivel, y no como lo principal.

# text
seg-26f242f1bef8 = El resto del motor

# text
seg-b9b2e29e51d9 = El mismo motor, con los mismos niveles, cubre también:

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT de órbita terrestre baja (LEO), de extremo a extremo.</b> Diseño de señal (<c1/>), paso y presupuesto de enlace por banda (<c2/>), mensaje de navegación de difusión (<c3/>), posicionamiento fusionado de órbita media y baja (<c4/>), convergencia del posicionamiento preciso de punto (PPP) con aumentación LEO (<c5/>), posicionamiento desde una red no terrestre 5G (<c6/>) y <c7/>, que pasa la salida de cada etapa a la siguiente para un sistema.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Espectro.</b> Una cascada de densidad espectral de potencia en banda L (y en bandas de ultra alta frecuencia (UHF), S y C) bajo una cronología guionizada de interferidor, con relación interferencia-señal por banda y densidad de ruido a portadora efectiva (<c1/>), y grabación de entrada y salida en Signal Metadata Format (SigMF).

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>El sistema solar y cualquier cuerpo central.</b> Posiciones y constantes físicas de los planetas y las lunas principales (<c1/>), posicionamiento alrededor de cualquiera de esos cuerpos (<c2/>) y diseño de constelaciones Walker y de ranuras publicadas con mapas de cobertura y de dilución de la precisión alrededor de cualquiera de ellos (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Campañas.</b> Tipos de escenario existentes encadenados en una cronología compartida, barridos, ejecutados como conjuntos de Monte Carlo con semilla o ejecutados en paralelo bajo condiciones compartidas (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Salidas.</b> Cada ejecución escribe un documento de resultado, un gráfico y un informe en HTML (HyperText Markup Language) y JSON (JavaScript Object Notation); <c1/> escribe una animación SVG (Scalable Vector Graphics), HTML o de secuencia de fotogramas; <c2/> escribe efemérides CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON o STK (Systems Tool Kit) para los tipos de escenario que sitúan elementos en la Tierra, y SigMF para <c3/>.

# text
seg-75206591a52a = La mayoría de estas filas son MODELLED; la matriz de verificación nombra las pocas que son VALIDATED (por ejemplo, las recomendaciones de la Unión Internacional de Telecomunicaciones sobre lluvia y centelleo, el algoritmo de efemérides de difusión de Galileo, la comprobación de trama CRC-24Q (comprobación de redundancia cíclica de 24 bits) y el solucionador del tiempo de luz planetario).

# text
seg-785218a0ea66 = Lo que Kshana no es

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>No es un simulador de señales de radiofrecuencia (RF) ni un banco de pruebas con hardware en el bucle (HIL).</b> Kshana no controla ningún hardware de radio y no transmite nada. La mayor parte funciona al nivel de modelos de error y presupuestos de enlace, antes de comprar hardware o tiempo de laboratorio. A nivel de señal es solo software: la capa IQ de GNSS (<c1/>) escribe archivos de muestras IQ (en fase/cuadratura) en banda base de señales GNSS legítimas para receptores por software y ejecuta sobre ellos su propio receptor por software; la sección <c3/> (desde { "0.29.0" }) del tipo de escenario <c2/> escribe una instantánea SigMF (Signal Metadata Format) de su modelo analítico que incluye los interferidores configurados (los interferidores de tipo ruido, contenedor por contenedor; los tonos y los chirps, como formas de onda); y <c4/> suma en memoria una señal auténtica y una réplica de spoofer para probar la captura del lazo, sin escribirla. Probar un receptor de hardware frente a un estímulo de RF real es tarea de un simulador de RF.

# text
seg-ca243f3f8e8d = <b>No sustituye a MATLAB/Simulink, STK ni Orekit.</b> Se sitúa junto a ellos. Lee y escribe los formatos de intercambio que usan — mensajes de efemérides orbitales CCSDS (Consultative Committee for Space Data Systems), órbitas precisas SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) —, escribe efemérides CZML, KML, GeoJSON y STK para sus visores, y su modelo numérico de fuerzas se contrasta con Orekit en lugar de ofrecerse en su lugar.

# text
seg-8fa4e93c3d0e = <b>No es un motor de procesamiento GNSS de fase de portadora ni un servicio de posicionamiento</b> (véase más abajo).

# text
seg-8ba4b67bc813 = <b>No es una autoridad de certificación.</b> Una etiqueta VALIDATED significa que una capacidad coincide con una referencia independiente externa; no es una certificación de ningún producto ni operador.

# text
seg-362b857140b9 = Lo que Kshana es, y lo que no es, junto a un motor de procesamiento GNSS

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = Kshana <b>no</b> es un motor de <em>procesamiento</em> GNSS de fase de portadora, y ningún tipo de escenario es un servicio de posicionamiento. Sí tiene un pie en el dominio de la medida, como código de biblioteca en el que se apoya el estudio de desempeño y que se contrasta con referencias independientes. El posicionamiento cinemático en tiempo real (RTK) de línea base corta con fijación de enteros LAMBDA (ajuste de decorrelación de ambigüedades por mínimos cuadrados) se ejecuta sobre observaciones RINEX reales de doble frecuencia, igual que un filtro de posicionamiento preciso de punto (PPP) flotante estático con órbitas y relojes finales del IGS, y el reloj del receptor que estima ese filtro es una solución de tiempo frente al reloj final de estación del IGS. Cada una de las tres es una fila VALIDATED de la <a1>matriz de verificación</a1>, frente a los datos de estación del IGS que allí se nombran, y cada una se ejecuta con ventanas de observación estáticas y cortas, no como un servicio en flujo con resolución de ambigüedades en líneas base largas, suavizado de portadora o un rover cinemático. El tipo de escenario <c1/> ejecuta un filtro PPP flotante sobre código y fase de portadora, pero con mediciones que simula él mismo, para estudiar el tiempo de convergencia con y sin aumentación LEO; no procesa un archivo de observaciones. El tipo de escenario <c2/> (posición, velocidad y tiempo) resuelve una posición del receptor a partir de pseudodistancias de código RINEX reales más efemérides de difusión, validado frente a una coordenada topografiada del International GNSS Service (IGS) (estación ABMF, 2018-05-13) con <b>{ "5.7" } m de RMS (raíz de la media cuadrática) en 3-D / { "1.1" } m horizontal</b>. Pero el producto es el estudio de desempeño, no el servicio de posicionamiento, y el planteamiento que sigue pretende ahorrar a un posible usuario la decepción de la herramienta equivocada.

# text
seg-169dd778c45f = Un motor de procesamiento GNSS (RTKLIB, una biblioteca abierta de posicionamiento cinemático en tiempo real; gLAB, el conjunto de herramientas del laboratorio GNSS del grupo gAGE de la Universidad Politécnica de Cataluña)

# text
# c1: pvt
seg-4faa1de0ef70 = un escenario: modelos de error de sensores, ventanas de interrupción, geometría — o, para <c1/>, un archivo real de observaciones RINEX más navegación de difusión

# text
seg-ae60d0def8af = observaciones GNSS reales (RINEX), efemérides, correcciones

# text
# c1: pvt
seg-5fce99bb803d = FoM de desempeño: holdover, error de temporización/posición, disponibilidad, cotas de integridad/seguridad — más una posición de posicionamiento de punto único (SPP) por código del tipo de escenario <c1/>

# text
seg-b752bb5c3f64 = una <b>solución</b> de posición/velocidad/tiempo (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Pregunta que responde

# text
seg-b52fd8e0c856 = "¿cuán buena <em>sería</em> esta arquitectura y dónde se rompe?"

# text
seg-09672ca004ac = "dadas estas mediciones, ¿dónde estoy <em>ahora</em>?"

# text
seg-00d5ebd56088 = Sensores cuánticos / ópticos

# text
seg-a55f2bd6c1bf = modelados como modelos de error (relojes ópticos, unidad de medida inercial (IMU) de átomos fríos, transferencia óptica de tiempo), resultados etiquetados MODELLED

# text
seg-7ccfb3395d84 = no modelado

# text
seg-ec21dbf4b910 = Procesamiento de observaciones reales

# text
# c1: pvt
seg-324ef9a933d5 = SPP por código a partir de observaciones RINEX reales (<c1/>, a nivel de metros); RTK de línea base corta con LAMBDA y PPP flotante estático sobre fase de portadora real, como código de biblioteca contrastado con estaciones del IGS (VALIDATED, ventanas estáticas y cortas, no un servicio en flujo); más geometría / dilución de la precisión (DOP) / disponibilidad

# text
seg-e15db8a33a9a = la competencia principal, hasta PPP/RTK de fase de portadora

# text
seg-e6df7ccdba96 = cero — se ejecuta en una pestaña del navegador (WebAssembly)

# text
seg-812c1c70ce63 = compilación nativa / cadena de herramientas

# text
seg-58df67617e1a = Complementarios, no competidores — RTKLIB y gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> y <a2>gLAB</a2> son suites de procesamiento GNSS maduras y de uso generalizado. Toman mediciones reales y producen una solución de posicionamiento (SPP/PPP/RTK; gLAB es además una magnífica herramienta didáctica con una sólida trayectoria en la Agencia Espacial Europea (ESA) y en el Servicio Europeo de Navegación por Complemento Geoestacionario (EGNOS)). Kshana <b>no</b> las sustituye y no lo intenta. Su vía de observación es estrecha: posicionamiento de punto único por código (<c1/>) y, como código de biblioteca contrastado, RTK de línea base corta con fijación de enteros LAMBDA y un filtro PPP flotante estático sobre observaciones reales de doble frecuencia, cada uno VALIDATED frente a datos de estaciones del IGS (el filtro PPP también frente a una ejecución de RTKLIB con las mismas entradas). No tiene suavizado de portadora, ni procesamiento cinemático o en flujo, ni resolución de ambigüedades en líneas base largas, y <c2/> no estima la troposfera ni la ionosfera — aplica los modelos troposféricos de Saastamoinen/Niell y la combinación libre de ionosfera L1/L2, no las resuelve como estados.

# text
seg-9c4e70ce8a55 = La cadena es complementaria:

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> responden <em>"¿dónde estoy, a partir de estas señales?"</em>

# text
seg-f5370894cdd1 = <b>Kshana</b> responde <em>"¿cuánto tiempo conservo una buena respuesta cuando esas señales cesan — y cuánto me aporta un reloj o un sensor inercial mejor, clásico o cuántico?"</em>

# text
seg-2403d6b115de = Un flujo de trabajo natural usa un motor de procesamiento para el segmento con GNSS disponible y Kshana para estudiar el comportamiento de <b>holdover</b> y el espacio de compromisos de sensores a su alrededor. Si necesita un servicio de posicionamiento por fase de portadora — PPP o RTK cinemático, líneas base largas, resolución de ambigüedades en red — use RTKLIB o gLAB; si necesita evidencias reproducibles y etiquetadas sobre resiliencia y holdover, para eso está hecha Kshana.

# text
seg-21631e5c6be3 = Un nivel de navegador sin instalación

# text
seg-9b01dd6721ed = La mayoría de las herramientas de simulación de este ámbito (RTKLIB, gLAB, la General Mission Analysis Tool (GMAT), Orekit, STK) requieren una instalación nativa o una licencia, y una curva de aprendizaje antes del primer resultado. Kshana se compila a WebAssembly y se ejecuta <b>íntegramente en el navegador</b> — el <a1>playground</a1> carga un escenario trabajado, ejecuta el motor real en el cliente (no se sube nada) y muestra el resultado en segundos. Los controles deslizantes guiados y los escenarios de un clic hacen que el primer resultado útil no necesite TOML (Tom's Obvious Minimal Language, el formato de archivo de escenarios) ni cadena de herramientas.

# text
seg-b1cb4b8f0ef1 = Ese nivel sin instalación es una postura deliberada:

# text
seg-33b361bde50d = <b>Alcance</b> — un revisor, un estudiante o un responsable de compras puede probar el motor real desde un enlace, en cualquier dispositivo, sin configuración.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reproducibilidad</b> — el mismo motor que se publica en el navegador es la biblioteca que se publica en crates.io, el Python Package Index (PyPI) y npm; un resultado es reproducible a partir de <c1/>, y una ejecución puede compartirse como una URL (dirección web).

# text
seg-3d3d4bda606c = <b>Honestidad</b> — ejecutar usted mismo el motor, a la vista, es el mejor argumento frente a "confíe en las cifras": el nivel de navegador <em>es</em> la superficie de auditoría.

# text
seg-6095bcacb725 = El nivel de navegador no convierte a Kshana en un sustituto de una suite de procesamiento de escritorio — hace que la cuestión del estudio de compromisos de desempeño resulte accesible para quienes nunca instalarían una.
