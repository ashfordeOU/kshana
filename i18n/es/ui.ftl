# Texto de la interfaz (español): estructura del sitio, avisos, selector de idioma, carcasa del Studio.

## Site chrome
site-skip-link = Saltar al contenido
site-nav-primary = Principal
site-nav-missions = Misiones
site-nav-capabilities = Capacidades
site-nav-evidence = Evidencias
site-nav-research = Investigación
site-nav-developers = Desarrolladores
site-nav-docs = Documentación
site-nav-editions = Ediciones
site-nav-search = Buscar
site-nav-launch = Iniciar
site-nav-studio = { -brand } Studio
site-nav-home = Inicio de { -brand }
site-nav-theme = Cambiar entre el tema claro y el oscuro
site-version = v{ $version }

site-footer-tagline = Simulador de código abierto de resiliencia PNT (posicionamiento, navegación y temporización). No controla ningún equipo de radio y no transmite nada: su salida a nivel de señal son archivos de muestras IQ en banda base, y su receptor GNSS por software es una herramienta de análisis. No es un producto de vuelo.
site-footer-product = Producto
site-footer-company = Empresa
site-footer-benchmark = Referencia comparativa
site-footer-install = Instalación
site-footer-mcp = Servidor MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · de Ashforde® OÜ · AGPL-3.0, con opción de licencia comercial
site-footer-provenance = Cada gráfico se dibuja a partir de una ejecución registrada del motor v{ $version } e indica su escenario, su semilla y la ruta para reproducirlo.

## Language switcher
site-lang-label = Idioma
site-lang-switch-aria = Elija el idioma de esta página
site-lang-auto = Idioma del navegador
site-lang-remembered = Su elección se recuerda en este dispositivo.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } parte de esta página ha cambiado desde que se tradujo y se muestra en inglés.
        [many] { $n } de partes de esta página han cambiado desde que se tradujeron y se muestran en inglés.
       *[other] { $n } partes de esta página han cambiado desde que se tradujeron y se muestran en inglés.
    }
notice-not-started = Esta página aún no se ha traducido. Se muestra en inglés.
notice-detected = Se muestra en { $language }. <a1>Cambiar a inglés</a1>
notice-dismiss = Cerrar
notice-recorded-in-english = Registrado en inglés
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Inicio de { -brand }
studio-search-label = Buscar un escenario, un área, un ajuste o un comando
studio-search-placeholder = Busque por nombre, pregunta o ajuste, por ejemplo máscara de elevación
studio-search-scenarios = Buscar escenarios, áreas o ajustes
studio-search-commands = Buscar escenarios y comandos
studio-search-all = Buscar un escenario, un área, un ajuste, una vista o un comando
studio-search = Buscar
studio-theme = Cambiar entre el tema claro y el oscuro
studio-starting-questions = Preguntas para empezar
studio-where-you-are = Dónde se encuentra
studio-engine-status = Dónde se ejecuta el motor
studio-views = Vistas: Geometría, Confianza del receptor, Mapa de interferencias, Informe de formación, Herramientas
studio-more-views = Más vistas
studio-advanced-full = El panel completo: todos los paneles, campos y pestañas
studio-advanced-switch = Cambiar a la vista avanzada
studio-view-geometry = Geometría: skyplot, horizonte y DOP
studio-view-training = Informe de formación: abrir un registro de instructor
studio-view-interference = Mapa de interferencias: abrir archivos de mapa
studio-view-receiver-trust = Confianza del receptor: abrir una ejecución de buque
studio-view-tools = Herramientas: evidencias, bench, compliance, OSNMA
studio-result = Resultado
studio-result-meaning = Qué significa el resultado
studio-key-figures = Cifras clave
studio-result-views = Vistas de este resultado
studio-figures-of-merit = Figuras de mérito
studio-find-result-field = Buscar un campo del resultado
studio-capability-view = Vista de capacidades
studio-time-series = Series temporales
studio-chart-source = Origen del gráfico
studio-signal-band = Señal y banda
studio-signal-field = Campo de señal
studio-clock-holdover = Holdover del reloj
studio-telecom-masks = Máscaras de temporización de telecomunicaciones
studio-clock-stability = Estabilidad del reloj
studio-orbit-3d = Órbita 3D
studio-ground-track = Traza en tierra
studio-parameter-sweep = Barrido de parámetros
studio-compare-runs = Comparar ejecuciones
studio-animation = Animación
studio-engine-report = Informe del motor
studio-exports = Exportaciones e informe
studio-full-result = Documento de resultado completo
studio-settings = Ajustes y detalles
studio-find-setting = Buscar un ajuste, por ejemplo máscara
studio-find-scenario-setting = Buscar un ajuste de este escenario
studio-engine-summary = El resumen propio del motor
studio-restore-scenario = Restaurar el escenario incluido
studio-copy-scenario = Copiar el texto del escenario
studio-scenario-source = Fuente del escenario (TOML)
studio-install-engine = Instalar el motor
studio-run-history = Historial de ejecuciones
studio-scenarios-count =
    { $n ->
        [one] Escenario que ejecuta ({ $n })
        [many] Escenarios que ejecuta ({ $n })
       *[other] Escenarios que ejecuta ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } fila del registro
        [many] { $n } de filas del registro
       *[other] { $n } filas del registro
    }
studio-recorded-in-english = Registrado en inglés
studio-lang-engine-fallback = No se pudo cargar el texto del motor para este idioma; se muestra el inglés.

studio-geometry-kshana-home = Inicio de Kshana

studio-geometry-back-to-the-studio = Volver al Studio

studio-geometry-step-the-time = Avanzar el tiempo

studio-geometry-draw-the-skyline = Dibujar el perfil del horizonte

studio-geometry-skip-to-the-view = Saltar a la vista

studio-geometry-which-satellites-can-you-see = ¿Qué satélites se ven y qué tan buena es su geometría?

studio-geometry-what-this-shows = Qué muestra esto

studio-geometry-starting-the-engine = Iniciando el motor…

studio-geometry-every-setting-is-in-the = Todos los ajustes están en la dirección de la página, de modo que un enlace copiado abre el mismo cielo.

studio-geometry-offset-from-the-constellations-reference = Desfase respecto a la época de referencia de las constelaciones

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Sus propios elementos orbitales (TLE)

studio-geometry-use-these-elements = Usar estos elementos

studio-geometry-back-to-the-presets = Volver a los preajustes

studio-geometry-clear-the-skyline = Borrar el perfil del horizonte

studio-geometry-drag-on-the-skyplot-to = Arrastre sobre el skyplot para dibujar el perfil del horizonte (pasos de 1° en acimut y de 0,5° en elevación). Con el foco en el skyplot: Izquierda y Derecha recorren el horizonte (Mayús para 10°), Arriba y Abajo suben o bajan el perfil en ese punto (Mayús para 5°) y Supr lo borra.

studio-geometry-copy-a-link-to-this = Copiar un enlace a este cielo

studio-geometry-download-the-skyplot-svg = Descargar el skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = El cenit en el centro, el horizonte en el borde y el norte arriba. Las marcas rellenas son satélites de la solución; las marcas huecas están ocultas por la máscara o por el perfil del horizonte, o no se usan.

studio-geometry-dilution-of-precision = Dilución de la precisión

studio-geometry-how-much-the-geometry-multiplies = Cuánto multiplica la geometría el error de distancia. Cuanto menor, mejor; cerca de 1 es excelente y por encima de 6 es deficiente.

studio-geometry-horizontal-position-error = Error de posición horizontal

studio-geometry-satellites-as-a-table = Satélites, en forma de tabla

studio-geometry-the-same-satellites-as-the = Los mismos satélites que en el skyplot.

studio-geometry-azimuth = Acimut, °

studio-geometry-elevation = Elevación, °

studio-geometry-in-the-solution = En la solución

studio-geometry-the-engine-runs-here-as = El motor se ejecuta aquí como WebAssembly. No se descarga nada de otro sitio y nada de lo que usted establezca se envía a ninguna parte.

studio-holdover-holdover-test-scenarios = Escenarios de prueba de holdover

studio-holdover-holdover-test = Prueba de holdover

studio-holdover-how-far-does-the-time = ¿Hasta dónde llega el error de tiempo cuando falta el GNSS?

studio-holdover-opening-the-scenarios = Abriendo los escenarios…

studio-holdover-verdict-step-by-step = Veredicto, paso a paso

studio-holdover-time-error-over-the-record = Error de tiempo a lo largo del registro

studio-holdover-the-three-phases-are-shaded = Las tres fases están sombreadas; las líneas verticales discontinuas son los dos instantes que indicó el operador. Las líneas horizontales discontinuas son los límites de las máscaras sobre el error de tiempo absoluto máximo, cada una dibujada sobre el escalón que su máscara nombra, y la banda de recuperación; un triángulo marca el momento en que se supera por primera vez un presupuesto o la envolvente de holdover ePRTC-A.

studio-holdover-of-the-baseline-and-the = De la línea base y del holdover; una cruz es un límite de máscara en el momento en que su comprobación fue la peor.

studio-holdover-the-same-two-steps-against = Los mismos dos escalones frente a los límites de TDEV.

studio-holdover-the-numbers = Las cifras

studio-holdover-everything-below-is-the-engine = Todo lo que sigue es del motor, en las unidades que este indica.

studio-holdover-mask-checks = Comprobaciones de máscara

studio-holdover-each-mask-is-measured-on = Cada máscara se mide sobre el escalón que su condición nombra. Una máscara que necesita un registro más largo que el que dio el escalón está INCOMPLETE y nunca se extrapola; toda entrada que una Recomendación deja para estudio posterior está ausente.

studio-holdover-what-this-does-not-cover = Qué no cubre esto

studio-interference-cell-size-in-degrees-empty = Tamaño de celda en grados (vacío para 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Acerca de esta página

studio-interference-interference-map = Mapa de interferencias

studio-interference-where-did-position-reports-look = ¿Dónde parecían degradados los informes de posición?

studio-interference-open-map-files = Abrir archivos de mapa

studio-interference-or-drop-them-here = o suéltelos aquí

studio-interference-open-the-synthetic-demo = Abrir la demostración sintética

studio-interference-close-all-maps = Cerrar todos los mapas

studio-interference-nothing-open-yet = Aún no hay nada abierto.

studio-interference-build-a-map-here = Crear un mapa aquí

studio-interference-build-from-the-synthetic-sample = Crear a partir de la muestra sintética

studio-interference-route-exposure-here = Exposición de la ruta aquí

studio-interference-use-the-synthetic-route = Usar la ruta sintética

studio-interference-reading-these-maps = Cómo leer estos mapas

studio-interference-maps-inherit-the-coverage-of = Los mapas heredan la cobertura de su fuente: los receptores ADS-B de voluntarios dejan poco cubierto el mar abierto y los datos abiertos de AIS omiten algunas clases de buque. Lea las notas de cobertura de cada archivo.

studio-interference-no-coastline-or-basemap-is = No se dibuja ninguna línea de costa ni mapa base y no se descarga nada de ningún servidor; la cuadrícula es solo de latitud y longitud.

studio-interference-no-identifier-of-any-aircraft = Estos archivos no contienen ningún identificador de aeronave ni de buque; las celdas con muy pocas aeronaves o buques distintos no se publican en absoluto, y un recuento AIS de uno o dos se retiene.

studio-lunar-infra-lunar-infrastructure-scenarios = Escenarios de infraestructura lunar

studio-lunar-infra-lunar-infrastructure = Infraestructura lunar

studio-lunar-infra-what-can-the-moon-s = ¿Qué pueden hacer la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, y en qué se quedan cortas?

studio-lunar-infra-five-studies-of-what-lunar = Cinco estudios de lo que podrían hacer juntos unos orbitadores lunares y una estación en la superficie lunar como infraestructura de navegación y geodésica: determinación de órbita a partir de señales GNSS terrestres frente al seguimiento desde tierra, fijación de fase de portadora entre una estación de superficie y un orbitador, coestimación del marco lunar, enlace de GNSS, VLBI y telemetría láser en una sola nave, y qué tan sensibles son la telemetría láser y el seguimiento a las mareas y a la libración de la Luna. Las entradas son ilustrativas y el modelo es limitado; donde un estudio no alcanzó el umbral frente al que se había preregistrado, esta página lo dice. Cada número se copia de un resultado que registró el motor; la página lo escala y lo dibuja, y no calcula nada más.

studio-lunar-infra-what-the-result-holds = Qué contiene el resultado

studio-lunar-infra-findings-disclosures-and-what-was = Hallazgos, divulgaciones y lo que no se verificó

studio-lunar-what-these-figures-are = Qué son estas cifras

studio-lunar-map-key = Leyenda del mapa

studio-lunar-lunar-station = Estación lunar

studio-lunar-what-accuracy-could-a-reference = ¿Qué precisión podría dar una estación de referencia cerca del polo sur lunar, y dónde?

studio-lunar-the-constellation-its-signal-in = La constelación, su error de señal en el espacio, el error de levantamiento de la estación, la latencia de la corrección y la cuantización del enlace son entradas indicadas en el archivo de escenario, cada una con su fuente o marcada como ilustrativa. Ninguna cifra de aquí se ha comprobado frente a una estación real ni a datos de vuelo.

studio-lunar-the-source-and-every-input = La fuente y cada entrada que cambie están en la dirección de la página, de modo que un enlace copiado abre el mismo estudio.

studio-lunar-a-result-file-is-the = Un archivo de resultado es el JSON que el motor escribe para este tipo (la salida JSON de la línea de comandos, o una ejecución guardada desde aquí). Se lee en esta página; no se envía nada.

studio-lunar-each-field-shows-the-scenario = Cada campo muestra el valor del archivo de escenario hasta que usted lo cambie. Un día de épocas sobre toda la cuadrícula tarda un poco: menos ensayos o un paso de tiempo mayor se ejecutan más rápido.

studio-lunar-run-it-here = Ejecutar aquí

studio-lunar-back-to-the-file-s = Volver a los valores del archivo

studio-lunar-copy-a-link = Copiar un enlace

studio-lunar-save-this-result-json = Guardar este resultado (JSON)

studio-lunar-corrected-error-over-the-south = Error corregido en la región polar sur

studio-lunar-south-polar-stereographic-the-pole = Estereográfica polar sur: el polo en el centro, el borde de la cuadrícula en el límite, la longitud 0° arriba y 90° este a la derecha. Cada celda es un punto de la cuadrícula; la línea gruesa es donde el error corregido cruza el umbral y la línea discontinua es el radio de cobertura por acimut.

studio-lunar-region-figures = Cifras de la región

studio-lunar-over-the-whole-grid-means = Sobre toda la cuadrícula: medias ponderadas por área y el peor punto.

studio-lunar-coverage-radius-per-azimuth = Radio de cobertura por acimut

studio-lunar-along-each-bearing-from-the = A lo largo de cada rumbo desde la estación, la distancia a la que la cobertura cae por primera vez por debajo del 95 %.

studio-lunar-as-a-table = En forma de tabla

studio-lunar-radius-km = Radio, km

studio-lunar-at-the-grid-edge = En el borde de la cuadrícula

studio-lunar-points-along-it = Puntos a lo largo de él

studio-lunar-an-epoch-is-unavailable-at = Una época no está disponible en un punto cuando el usuario ve menos de cuatro satélites o cuando la estación no ve todos los satélites que usa el usuario; para ella no se calcula ningún error.

studio-lunar-grid-points-as-a-table = Puntos de la cuadrícula, en forma de tabla

studio-lunar-the-same-points-as-the = Los mismos puntos que en el mapa, primero los más cercanos a la estación.

studio-lunar-latitude = Latitud, °

studio-lunar-longitude = Longitud, °

studio-lunar-from-the-station-km = Desde la estación, km

studio-lunar-corrected-error = Error corregido

studio-lunar-uncorrected-error = Error sin corregir

studio-lunar-hpl-median = Mediana de HPL

studio-lunar-the-engine-s-statement-inputs = La declaración del motor, las entradas y el presupuesto del enlace

studio-lunar-inputs-as-the-engine-read = Entradas, tal como las leyó el motor

studio-lunar-error-model = Modelo de error

studio-lunar-correction-link-budget-at-the = Presupuesto del enlace de corrección en la estación y en el peor punto

studio-observatory-previous-day = Día anterior

studio-observatory-day-opened = Día abierto

studio-observatory-next-day = Día siguiente

studio-observatory-interference-observatory = Observatorio de interferencias

studio-observatory-what-did-one-day-s = ¿Qué aspecto tenían los informes de posición de un día?

studio-observatory-the-observatory-writes-a-few = El observatorio escribe unos pocos archivos por cada día UTC y región: las celdas de la cuadrícula con uno de tres estados, una lista de incidentes y un manifiesto. Abra aquí los archivos que haya producido y léalos. La página no calcula nada y solo muestra lo que dicen los archivos. No incluye datos del observatorio, no descarga nada y no sube nada.

studio-observatory-open-a-day = Abrir un día

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Los tres estados

studio-observatory-the-picture-the-observatory-wrote = La imagen que escribió el observatorio

studio-observatory-the-png-you-opened-as = El PNG que abrió, tal cual. Las celdas que no se dibujan no se observaron.

studio-observatory-cells-drawn-from-the-file = Celdas, dibujadas a partir del archivo

studio-observatory-plate-carr-eacute-e-no = Plate carrée, sin mapa base. Pase el cursor sobre una celda, o use la tabla, para ver su estado y sus recuentos. Un lugar sin celda no se observó.

studio-observatory-hover-or-focus-a-cell = Pase el cursor sobre una celda, o dele el foco, para ver su estado.

studio-observatory-every-cell-in-the-file = Todas las celdas del archivo

studio-observatory-a-count-the-file-withholds = Un recuento que el archivo retiene (menos de 5 aeronaves) se lee “retenido”, nunca 0.

studio-observatory-files-and-their-hashes = Archivos y sus hashes

studio-observatory-dataset-licence-and-notice = Conjunto de datos, licencia y aviso

studio-observatory-what-this-page-does-and = Qué muestra y qué no muestra esta página

studio-observatory-products-are-released-at-least = Los productos se publican al menos 24 horas después del final del día UTC, en celdas de 0,5 grados o más gruesas. Nunca es una vista en vivo y nunca dice “ahora”.

studio-observatory-it-shows-no-cause-no = No muestra ninguna causa, ningún país, ninguna fuerza ni ninguna fuente de interferencia, ninguna alerta, ninguna comparación entre lugares o días, ni AIS. ADS-B y AIS nunca se combinan.

studio-observatory-the-page-ships-none-of = La página no incluye ninguno de los productos del observatorio. Publicarlos es decisión de su propietario.

studio-optical-optical-atmosphere-scenarios = Escenarios de atmósfera óptica

studio-optical-optical-pnt = PNT óptico

studio-optical-can-an-optical-link-get = ¿Puede un enlace óptico atravesar el tiempo atmosférico?

studio-optical-the-link = El enlace

studio-optical-sites-as-the-engine-states = Sitios, tal como los indica el motor

studio-optical-inputs-are-marked-everything-else = Las entradas están marcadas; todo lo demás es la salida del motor para ellas.

studio-optical-it-draws-only-what-the = Solo dibuja lo que el motor registró para cada escenario, incluida su serie temporal con semilla. La página no calcula nada: escala los números del motor al gráfico.

studio-optical-the-sites-their-cloud-climates = Los sitios, sus climas de nubosidad, las clases de reloj y las técnicas son entradas elegidas a modo de ilustración y están rotuladas como tales. No se ha comparado ningún registro de disponibilidad medido.

studio-replay-replay-controls = Controles de reproducción

studio-replay-previous-moment-page-up = Momento anterior (Re Pág)

studio-replay-step-back = Retroceder un paso

studio-replay-step-back-left-arrow = Retroceder un paso (flecha izquierda)

studio-replay-play-or-pause-space = Reproducir o pausar (Espacio)

studio-replay-step-forward = Avanzar un paso

studio-replay-step-forward-right-arrow = Avanzar un paso (flecha derecha)

studio-replay-next-moment-page-down = Momento siguiente (Av Pág)

studio-replay-replay-speed-mission-seconds-per = Velocidad de reproducción, segundos de misión por segundo

studio-replay-mission-clock-seconds-from-the = Reloj de misión, segundos desde el inicio de cada ejecución

studio-replay-bridge-replay = Reproducción del puente

studio-replay-two-runs-one-clock-when = Dos ejecuciones, un reloj: ¿cuándo lo supo el puente?

studio-replay-put-two-synthetic-runs-side = Ponga dos ejecuciones sintéticas una al lado de la otra y reprodúzcalas con un mismo reloj de misión. Cada panel muestra dónde estaba realmente el buque frente a dónde decía el receptor que estaba, la puntuación de confianza del motor y su banda a lo largo del tiempo, los satélites que el propio registro enumera (el cielo queda en blanco donde el registro no oye ninguno) y un veredicto al terminar la ejecución. Todo lo que se dibuja procede de un registro o del resultado del motor para él; no se lee nada de la red.

studio-replay-save-animated-svg = Guardar SVG animado

studio-replay-save-frames-zip = Guardar fotogramas (ZIP)

studio-replay-opening-the-two-demo-runs = Abriendo las dos ejecuciones de demostración…

studio-replay-the-skyplot-is-the-log = El skyplot es el GSV del propio registro: una marca rellena es un satélite con intensidad de señal, una hueca figura sin ella y un sector sombreado es un rango de acimut donde el registro enumera satélites y no oye ninguno. Un cielo bloqueado y una señal interferida se ven igual aquí. No es un perfil del horizonte, y la constelación es nominal, no unas efemérides para la fecha del registro.

studio-replay-position-error-is-the-logged = «Error de posición» es la distancia registrada entre la posición real y la notificada; el anillo alrededor del buque es esa distancia dibujada a escala. El tiempo desde el inicio de un evento hasta la primera puntuación por debajo de lo nominal es una resta de dos instantes registrados, no una cifra de rendimiento de detección.

studio-replay-the-vessel-glyph-points-along = El icono del buque apunta según el rumbo del girocompás (HDT), que ningún evento toca; el contorno discontinuo es donde el receptor sitúa el buque, siguiendo el rumbo que notifica. Una discrepancia entre ambos es una pista para el análisis posterior.

studio-replay-the-coast-is-natural-earth = La costa es tierra de dominio público de Natural Earth a 1:10 millones, incluida en esta página (no se descarga nada). Las posiciones de las demostraciones son inventadas, así que la costa muestra dónde caen esas coordenadas inventadas. Solo ilustrativo, nunca para navegar.

studio-ssv-space-user-gnss-scenarios = Escenarios de GNSS para usuarios espaciales

studio-ssv-space-user-gnss = GNSS para usuarios espaciales

studio-ssv-which-navigation-signals-can-a = ¿Qué señales de navegación puede seguir usando una nave situada muy por encima de los satélites GNSS?

studio-ssv-the-satellites-of-a-navigation = Los satélites de un sistema de navegación apuntan a la Tierra, de modo que una nave situada por encima de ellos solo oye lo que se escapa más allá del limbo o se filtra por los lóbulos laterales. Esta página muestra lo que el motor encuentra en cinco casos: disponibilidad en una capa a altura geoestacionaria, una órbita muy elíptica, una transferencia lunar con un receptor de señal débil, un filtro a bordo y una formación de dos naves. Cada número se copia de un resultado que registró el motor; la página lo escala y lo dibuja, y no calcula nada más.

studio-ssv-against-the-icg-booklet = Frente al folleto del ICG

studio-tools-leave-empty-to-check-integrity = déjelo vacío para comprobar solo la integridad

studio-tools-synthetic-osnma-example = Ejemplo OSNMA sintético

studio-tools-trust-and-evidence-tools = Herramientas de confianza y evidencias

studio-tools-trust-evidence-and-test-tools = Herramientas de confianza, evidencias y pruebas

studio-tools-the-0-35-features-that = Las funciones de la 0.35 que se ejecutan en su navegador y dónde encontrar las que no pueden hacerlo. Los archivos que abra aquí se leen en esta página y nunca se suben; el motor se ejecuta en su equipo como WebAssembly.

studio-tools-maritime-trust = Confianza marítima

studio-tools-training-debrief = Análisis posterior de la formación

studio-tools-the-engine-starts-when-you = El motor se inicia cuando usa una herramienta.

studio-tools-every-0-35-feature-and = Todas las funciones de la 0.35 y dónde están

studio-tools-in-this-browser-where-it = En este navegador, donde puede ejecutarse. El resto son funciones de línea de comandos o de servidor, y se indica el motivo.

studio-tools-in-the-studio = En el Studio

studio-tools-verify-an-evidence-pack = Verificar un paquete de evidencias

studio-tools-open-the-synthetic-example-pack = Abrir el paquete de ejemplo sintético

studio-tools-open-it-with-one-byte = Abrirlo con un byte cambiado

studio-tools-no-pack-files-chosen = No se ha elegido ningún archivo de paquete.

studio-tools-verify-the-pack = Verificar el paquete

studio-tools-attach-a-timestamp-token = Adjuntar un token de sello de tiempo

studio-tools-attach-to-the-chosen-pack = Adjuntar al paquete elegido

studio-tools-export-a-scenario-for-a = Exportar un escenario para un simulador de laboratorio

studio-tools-which-public-framework-rows-do = ¿Para qué filas de marcos públicos aportan evidencias a favor sus ejecuciones?

studio-tools-use-the-synthetic-example-runs = Usar las ejecuciones de ejemplo sintéticas

studio-tools-show-the-mapping-tables = Mostrar las tablas de correspondencia

studio-tools-show-the-sources-they-cite = Mostrar las fuentes que citan

studio-tools-no-result-files-chosen = No se ha elegido ningún archivo de resultado.

studio-tools-build-the-report = Generar el informe

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: ¿están autenticados los datos de navegación?

studio-tools-load-it = Cargarlo

studio-tools-show-the-recorded-result = Mostrar el resultado registrado

studio-tools-imu-fit-sensor-parameters-for = Ajuste de IMU: parámetros de sensor para los escenarios híbridos y de fusión

studio-tools-fit-the-parameters = Ajustar los parámetros

studio-tools-jammertest-score-a-receiver-log = Jammertest: puntuar un registro de receptor frente al plan de pruebas publicado

studio-tools-import-the-schedule = Importar el calendario

studio-tools-score-the-log = Puntuar el registro

studio-training-synthetic-library-scenarios = Escenarios sintéticos de la biblioteca

studio-training-library-scenario-to-generate = Escenario de la biblioteca que se generará

studio-training-random-seed-optional = Semilla aleatoria (opcional)

studio-training-from-the-scenario = del escenario

studio-training-time-cursor = Cursor de tiempo

studio-training-replay-speed = Velocidad de reproducción

studio-training-time-cursor-in-log-rows = Cursor de tiempo, en filas del registro

studio-training-debrief-timeline-time-cursor = Cronología del análisis posterior: cursor de tiempo

studio-training-what-did-the-crew-see = ¿Qué vio la tripulación y qué ocurría realmente?

studio-training-open-a-log = Abrir un registro

studio-training-choose-an-instructor-log-or = Elija un registro de instructor o abra uno de los cinco escenarios sintéticos de la biblioteca que escribe la CLI.

studio-training-or-drop-it-here-or = o suéltelo aquí, o abra un escenario de la biblioteca:

studio-training-generate-a-stream-here = Generar un flujo aquí

studio-training-run-the-engine-s-nmea = Ejecute en este navegador el generador de formación NMEA del motor. Obtiene el flujo NMEA 0183 sintético para el ejercicio y el registro del instructor, y puede analizarlo de inmediato. No se sube nada; la transmisión a un simulador de puente por TCP o UDP es una función de línea de comandos (véase la página Herramientas).

studio-training-previous-moment = Momento anterior

studio-training-next-moment = Momento siguiente

studio-training-true-track-against-reported = Derrota real frente a la notificada

studio-training-north-up-one-scale-on = Norte arriba, una sola escala en ambos ejes. La línea gris fina es donde estaba realmente el buque. La línea de color es lo que notificó el receptor, coloreada según su distancia a la realidad. Donde el receptor no notificó ninguna solución, no se dibuja nada.

studio-training-events-and-what-the-receiver = Eventos y lo que dijo el receptor

studio-training-one-shared-time-axis-drag = Un único eje de tiempo compartido. Arrastre o haga clic para mover el cursor; las teclas de flecha lo desplazan paso a paso. Las barras de eventos muestran la intensidad de cada evento inyectado a lo largo del tiempo.

studio-training-sky-at-the-cursor = Cielo en el cursor

studio-training-the-satellites-the-stream-s = Los satélites que enumera el propio GSV del flujo. Una marca rellena tiene intensidad de señal; una hueca figura sin ella; un sector sombreado es donde el flujo enumera satélites y no se oye ninguno. Constelación nominal, no unas efemérides para la fecha del flujo.

studio-training-at-the-cursor = En el cursor

studio-training-events-injected = Eventos inyectados

studio-training-as-the-instructor-log-states = Tal como los indica el registro del instructor, con todos sus parámetros.

studio-training-debrief-timeline = Cronología del análisis posterior

studio-training-choose-a-moment-to-move = Elija un momento para mover el cursor hasta él.

studio-training-the-satellite-sky-is-a = El cielo de satélites es una constelación nominal, no unas efemérides para la fecha del flujo.

studio-training-nothing-here-is-a-measure = Nada de esto es una medida de cómo se comporta ningún receptor o sistema frente a la interferencia.

studio-trust-session-settings-in-toml = Ajustes de sesión en TOML

studio-trust-receiver-trust-session-settings-in = Ajustes de sesión de confianza del receptor en TOML

studio-trust-time-cursor-and-filters = Cursor de tiempo y filtros

studio-trust-time-cursor-in-epochs = Cursor de tiempo, en épocas

studio-trust-score-timeline-time-cursor = Cronología de la puntuación: cursor de tiempo

studio-trust-each-monitor-s-alarm-ratio = Proporción de alarmas de cada monitor a lo largo del tiempo

studio-trust-about-this-view = Acerca de esta vista

studio-trust-can-the-bridge-trust-this = ¿Puede el puente fiarse de esta solución?

studio-trust-open-a-run = Abrir una ejecución

studio-trust-open-the-masked-sky-demo = Abrir la demostración de cielo enmascarado (geometría, 0.36)

studio-trust-score-an-nmea-log-here = Puntuar aquí un registro NMEA

studio-trust-run-the-engine-in-this = Ejecute el motor en este navegador sobre un registro NMEA 0183 de un buque y vea el resultado en la vista de abajo. El registro se lee en esta página y nunca se sube. Debe ser un extracto de como máximo 2 MiB (unas 20.000 épocas) y debe contener la ventana de calibración de cinco minutos. Los ajustes son los límites del buque y los pesos de la puntuación, como en un archivo de sesión.

studio-trust-score-the-synthetic-demo-log = Puntuar el registro de demostración sintético

studio-trust-session-settings-toml = Ajustes de sesión (TOML)

studio-trust-starts-from-the-demo-s = Parte de los ajustes de la demostración: edite los límites de velocidad, aceleración y velocidad de giro del buque para que coincidan con los suyos. Aquí se puede pegar un archivo de ajustes de su propio buque.

studio-trust-jammertest-scorecard = Tarjeta de puntuación de Jammertest

studio-trust-no-scorecard-open = No hay ninguna tarjeta de puntuación abierta.

studio-trust-generic-receiver-trust-run-not = Ejecución genérica de confianza del receptor (no de un buque)

studio-trust-run-the-illustrative-jamming-example = Ejecutar el ejemplo ilustrativo de jamming

studio-trust-assess-the-chosen-file = Evaluar el archivo elegido

studio-trust-the-format-is-guessed-from = El formato se deduce del nombre del archivo; cámbielo aquí cuando sea incorrecto y vuelva a evaluar. NovAtel OEM7, RTCM 3 y Septentrio SBF son formatos binarios; se envían al motor tal cual, en este navegador.

studio-trust-imu-file-optional-a-second = Archivo IMU (opcional): un segundo sensor para el rumbo

studio-trust-an-imu-log-on-the = Un registro IMU con el reloj del registro del receptor completa el rumbo que lee el monitor de rumbo frente a derrota allí donde el registro del receptor no lo incluye. Solo lo usa una sesión de buque.

studio-trust-remove-the-imu-file = Quitar el archivo IMU

studio-trust-no-imu-file = Sin archivo IMU.

studio-trust-session-settings-toml-the-log = Ajustes de sesión (TOML, el registro se suministra en línea)

studio-trust-first-deduction = Primera deducción

studio-trust-first-untrusted = Primera no fiable

studio-trust-receiver-reported-track = Derrota notificada por el receptor

studio-trust-the-satellites-the-log-s = Los satélites que enumera el propio GSV del registro. Una marca rellena tiene intensidad de señal; una hueca figura sin ella; un sector sombreado es donde el registro enumera satélites y no oye ninguno (un cielo bloqueado y una señal interferida se ven igual aquí). Constelación nominal, no unas efemérides para la fecha del registro.

studio-trust-score-over-time = Puntuación a lo largo del tiempo

studio-trust-score-0-to-100-dashed = Puntuación de 0 a 100. Las líneas discontinuas son los bordes de las bandas; las franjas de debajo son la banda y la compuerta. Arrastre o haga clic para mover el cursor de tiempo; las teclas de flecha lo desplazan paso a paso.

studio-trust-reasons-at-the-cursor = Motivos en el cursor

studio-trust-points-each-check-took-off = Puntos que cada comprobación restó en esta época, de mayor a menor. Haga clic en una comprobación para marcar dónde superó su umbral de inicio.

studio-trust-geometry-at-the-cursor = Geometría en el cursor

studio-trust-the-satellite-geometry-always-shown = La geometría de los satélites, siempre visible: su etiqueta (buena, aceptable o deficiente) y los DOP. Un cielo enmascarado (un casco, un muelle, la pared de un fiordo) es una degradación natural, distinta de la incoherencia propia de un ataque. La puntuación resta puntos por la geometría solo cuando es deficiente, como máximo 15, y nunca por debajo de la banda degradada.

studio-trust-the-receiver-s-own-flag = El indicador propio del receptor

studio-trust-what-the-receiver-itself-says = Lo que el propio receptor dice sobre spoofing y jamming (u-blox UBX-NAV-STATUS y UBX-SEC-SIG), junto a los monitores de Kshana. Los códigos son los del receptor; ninguno de los dos detectores es la verdad de referencia y la coincidencia no es validación. El indicador no cambia ninguna puntuación.

studio-trust-over-the-run = A lo largo de la ejecución

studio-trust-what-the-score-used = Qué usó la puntuación

studio-trust-read-from-the-run-read = Leído de la ejecución, solo lectura.

studio-trust-what-this-view-does-and = Qué muestra y qué no muestra esta vista

studio-trust-nmea-only-checks-cannot-see = Las comprobaciones solo con NMEA no pueden ver a un spoofer que reproduzca toda la constelación con una posición, velocidad, rumbo, potencia y reloj coherentes entre sí, ni una reproducción de señales reales grabadas. Una solución sin alarma no es por ello una buena solución.

studio-trust-nothing-on-this-page-is = Nada de esta página es una medida de cómo rinden las comprobaciones ante interferencias reales. La correspondencia de la puntuación y cada peso se fijan antes de puntuar un registro, sin aprendizaje y sin nada ajustado a eventos.

studio-main-which-satellites-can-you-see = ¿Qué satélites se ven desde un lugar y qué tan buena es su geometría? Skyplot, perfil del horizonte y DOP del motor en su navegador

studio-main-trainer-debrief-for-kshana-nmea = Análisis posterior para instructores con los registros de instructor de kshana nmea-scenario (solo para formación; los archivos permanecen en su navegador)

studio-main-where-did-aircraft-and-ships = ¿Dónde notificaron aeronaves y buques datos de navegación degradados en un día pasado? Abra archivos de mapa por día (permanecen en su navegador)

studio-main-can-the-bridge-trust-this = ¿Puede el puente fiarse de esta solución? Abra una ejecución de confianza del receptor de un buque (los archivos permanecen en su navegador)

studio-main-evidence-packs-test-bench-export = Paquetes de evidencias, exportación test-bench, correspondencia de compliance, OSNMA, herramientas de línea de comandos y el asistente de IA (los archivos permanecen en su navegador)

studio-main-map-of-satellites-in-view = Mapa de los satélites a la vista sobre la Tierra, a partir de la ejecución registrada

studio-main-interactive-3-d-view-of = Vista 3D interactiva de la trayectoria propagada

studio-main-close-history = Cerrar el historial

studio-main-skip-to-the-content = Saltar al contenido

studio-main-receiver-trust = Confianza del receptor

studio-main-advanced-view = Vista avanzada

studio-main-what-would-you-like-to = ¿Qué desea averiguar?

studio-main-pick-a-question-or-start = Elija una pregunta o parta del resultado de abajo.

studio-main-showing-below = Se muestra abajo

studio-main-integrity-over-12-hours = Integridad a lo largo de 12 horas

studio-main-a-radio-waterfall = Una cascada de radio

studio-main-recorded-result = Resultado registrado

studio-main-how-many-navigation-satellites-can = ¿Cuántos satélites de navegación se ven desde cualquier punto de la Tierra?

studio-main-loading-the-recorded-result = Cargando el resultado registrado…

studio-main-everything-kshana-can-do = Todo lo que Kshana puede hacer

studio-main-each-area-shows-a-real = Cada área muestra un resultado real registrado y la combinación de evidencias que lo respalda.

studio-main-open-your-own-files = Abra sus propios archivos

studio-main-pages-that-run-the-engine = Páginas que ejecutan el motor con sus propios ajustes y archivos. Todas funcionan en este navegador; no se sube nada.

studio-main-which-satellites-can-you-see-2 = ¿Qué satélites se ven desde un lugar y qué tan buena es su geometría? Dibuje el perfil del horizonte.

studio-main-what-accuracy-could-a-reference = ¿Qué precisión podría dar una estación de referencia cerca del polo sur lunar, y dónde? MODELLED.

studio-main-can-the-bridge-trust-this-2 = ¿Puede el puente fiarse de esta solución? Puntúe un registro NMEA de un buque.

studio-main-where-aircraft-and-ships-reported = Dónde notificaron aeronaves y buques datos de navegación degradados, y la exposición de una ruta.

studio-main-generate-a-drift-or-jamming = Genere un flujo de ejercicio de deriva o de jamming y analice el registro del instructor.

studio-main-two-synthetic-runs-on-one = Dos ejecuciones sintéticas con un mismo reloj: derrota, puntuación de confianza, skyplot en vivo y el veredicto.

studio-main-the-two-optical-atmosphere-scenarios = Los dos escenarios de atmósfera óptica: disponibilidad frente al techo de nubes, interrupciones y diversidad de sitios.

studio-main-which-navigation-signals-a-spacecraft = Qué señales de navegación puede seguir usando una nave muy por encima de los satélites, y qué rendimiento logran con ellas un filtro a bordo y una formación.

studio-main-what-lunar-orbiters-and-a = Qué pueden hacer unos orbitadores lunares y una estación de superficie como infraestructura de navegación y geodésica, con los fallos indicados.

studio-main-open-a-day-s-observatory = Abra los archivos del observatorio de un día y léalos: tres estados, ninguna causa, nada subido.

studio-main-pull-the-antenna-score-the = Desconecte la antena, puntúe el holdover: un registro de error de tiempo medido frente a las máscaras de la UIT-T.

studio-main-check-a-signed-pack-or = Compruebe un paquete firmado o adjunte un sello de tiempo.

studio-main-motion-and-event-files-for = Archivos de movimiento y de eventos para un simulador de laboratorio.

studio-main-what-your-runs-evidence-against = Frente a qué marcos publicados aportan evidencias sus ejecuciones.

studio-main-whether-recorded-galileo-data-is = Si los datos Galileo registrados están autenticados, etiqueta por etiqueta.

studio-main-use-kshana-from-your-assistant = Use Kshana desde su asistente mediante el servidor MCP.

studio-main-all-scenarios = Todos los escenarios

studio-main-pick-one-it-opens-on = Elija uno: se abre de inmediato con su resultado.

studio-main-all-questions = Todas las preguntas

studio-main-every-published-figure = Todas las cifras publicadas

studio-main-read-from-the-result-document = Leídas del documento de resultado, con la unidad, la nota y la procedencia que el motor registra para cada una.

studio-main-kalman-self-consistency = Autocoherencia de Kalman

studio-main-a-consistent-filter-s-reported = La incertidumbre notificada por un filtro coherente coincide con sus errores reales. El NIS (innovación normalizada al cuadrado) debe situarse cerca de 1 y el NEES (error de estimación normalizado al cuadrado) cerca de 2, cada uno dentro de su banda χ² del 95 %.

studio-main-engine-chart = Gráfico del motor

studio-main-each-series-this-run-publishes = Cada serie que publica esta ejecución, frente al tiempo. Pase el cursor o arrastre por el gráfico para leer los valores.

studio-main-carrier-to-noise-density-db = densidad de potencia portadora a ruido, dB-Hz

studio-main-with-the-jammer = Con el jammer

studio-main-without-it = Sin él

studio-main-each-cell-is-one-satellite = Cada celda es un satélite en una época de esta ejecución. Las celdas rayadas están por debajo del umbral de seguimiento del receptor: ese satélite se pierde.

studio-main-interference-outcome = Resultado de la interferencia

studio-main-error-since-gnss-was-lost = error desde que se perdió el GNSS

studio-main-scenario-budget = Presupuesto del escenario

studio-main-move-the-budget-and-the = Mueva el presupuesto y el tiempo hasta la superación se lee en el propio registro de error de esta ejecución. La cifra de holdover del motor, calculada con el presupuesto del escenario, se muestra al lado y es la cifra de referencia. Cambie el reloj o la interrupción en los parámetros para volver a ejecutar la física.

studio-main-maximum-time-interval-error = error máximo de intervalo de tiempo

studio-main-time-deviation = desviación de tiempo

studio-main-mask-checks-and-holdover-budgets = Comprobaciones de máscara y presupuestos de holdover

studio-main-each-check-s-limit-is = El límite de cada comprobación se traza como un anillo en el tiempo de promediado donde el margen fue peor. Las máscaras se transcriben de las Recomendaciones de la UIT-T (Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones) que se nombran en cada fila.

studio-main-lower-is-better-fractional-frequency = Cuanto menor, mejor. Estabilidad de frecuencia fraccionaria frente al tiempo de promediado τ, en ejes logarítmicos.

studio-main-earth-centred-inertial-frame = Marco inercial centrado en la Tierra

studio-main-drag-to-rotate-scroll-to = Arrastre para girar y use la rueda para ampliar.

studio-main-run-the-engine-once-per = Ejecute el motor una vez por valor y represente una cifra de mérito. Añada un segundo parámetro para obtener un mapa de calor. Cada punto es una ejecución real del motor, hasta 60.

studio-main-pinned-runs-side-by-side = ejecuciones fijadas una al lado de otra

studio-main-clear-pins = Quitar las fijaciones

studio-main-key-figures-run-against-run = Cifras clave, ejecución frente a ejecución

studio-main-the-headline-readouts-of-each = Las lecturas principales de cada ejecución fijada; el cambio es respecto a la ejecución A.

studio-main-the-engine-s-own-export = la exportación propia del motor

studio-main-written-by-the-engine = escrito por el motor

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, efemérides STK, SigMF

studio-main-try-other-settings = Probar otros ajustes

studio-main-change-a-value-then-run = Cambie un valor y vuelva a ejecutar. La respuesta y el gráfico se actualizan en el sitio.

studio-main-run-again = Volver a ejecutar

studio-main-cancel-the-run = Cancelar la ejecución

studio-main-runs-in-your-browser-nothing = Se ejecuta en su navegador. No se sube nada.

studio-main-advanced-settings = Ajustes avanzados

studio-main-every-setting-comes-from-the = Todos los ajustes proceden del archivo de escenario. Edite el archivo completo en «Para investigadores».

studio-main-how-this-is-computed = Cómo se calcula esto

studio-main-level-of-evidence = Nivel de evidencia

studio-main-the-engine-s-own-one = El resumen de una línea del propio motor

studio-main-every-figure-is-labelled-with = Cada cifra se rotula con su nivel de evidencia. Validada significa comprobada frente a una referencia externa independiente; modelada significa física de primeros principios con pruebas, aún no comprobada frente a una referencia.

studio-main-for-researchers = Para investigadores

studio-main-code-data-citation = código, datos, cita

studio-main-run-it-on-your-computer = Ejecutarlo en su equipo

studio-main-run-it-from-python = Ejecutarlo desde Python

studio-main-exported-figures-carry-this-doi = Las cifras exportadas llevan este DOI (identificador de objeto digital) en su pie. El mismo escenario, la misma semilla y la misma versión del motor dan los mismos números.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = En el editor, Tab sangra dos espacios. Pulse Escape y luego Tab para avanzar. Vuelva a ejecutar para usar su edición.

studio-main-every-panel-and-field = Todos los paneles y campos

studio-main-the-advanced-view-is-the = La vista avanzada es el panel completo: todos los paneles de esta ejecución uno al lado de otro, todos los campos del escenario, barridos, comparaciones y el informe propio del motor. Se abre sobre este escenario, con sus ajustes.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Solicitar una evaluación

studio-main-talk-to-us-about-a = Háblenos de una licencia comercial

studio-main-request-a-study = Solicitar un estudio

studio-main-imagery-nasa-visible-earth-blue = Imágenes: NASA Visible Earth (Blue Marble). Costas: Natural Earth. Cada gráfico de aquí se dibuja a partir de una ejecución del motor; una ejecución, informe, animación o exportación hecha por el motor nativo de línea de comandos se rotula como registrada.

studio-main-this-session = esta sesión

studio-main-runs-you-make-appear-here = Las ejecuciones que haga aparecen aquí. Seleccione una para recuperar su escenario y su resultado, o fíjela para compararla.

studio-advanced-find-a-scenario-a-domain = Buscar un escenario, un dominio, un campo o un comando

studio-advanced-the-runs-you-made-in = Las ejecuciones que hizo en esta sesión

studio-advanced-a-short-tour-of-the = Una breve visita guiada por el Studio

studio-advanced-toggle-colour-theme = Cambiar el tema de color

studio-advanced-switch-to-the-simple-view = Cambiar a la vista simple

studio-advanced-the-simple-view-the-answer = La vista simple: primero la respuesta, cinco ajustes, detalles a petición

studio-advanced-scenario-library = Biblioteca de escenarios

studio-advanced-close-the-library = Cerrar la biblioteca

studio-advanced-find-a-scenario-a-domain-2 = Buscar un escenario, un dominio o un campo

studio-advanced-scenario-domain-or-field = Escenario, dominio o campo

studio-advanced-filter-by-domain = Filtrar por dominio

studio-advanced-scenarios-by-mission-domain = Escenarios por dominio de misión

studio-advanced-how-the-studio-works = Cómo funciona el Studio

studio-advanced-search-scenarios-domains-or-fields = Buscar escenarios, dominios o campos

studio-advanced-search-scenarios-domains-or-fields-2 = Buscar escenarios, dominios o campos, por ejemplo máscara de elevación

studio-advanced-the-engine-kind-this-scenario = El tipo de motor que ejecuta este escenario

studio-advanced-open-the-scenario-library = Abrir la biblioteca de escenarios

studio-advanced-show-the-parameters-and-the = Mostrar los parámetros y la fuente del escenario

studio-advanced-keep-this-run-to-compare = Conservar esta ejecución para compararla con otra (hasta 4)

studio-advanced-compare-the-pinned-runs = Comparar las ejecuciones fijadas

studio-advanced-share-this-run-or-download = Compartir esta ejecución o descargarla

studio-advanced-result-panels = Paneles de resultado

studio-advanced-run-summary = Resumen de la ejecución

studio-advanced-parameters-and-scenario-source = Parámetros y fuente del escenario

studio-advanced-close-the-parameters-and-show = Cerrar los parámetros y mostrar los resultados

studio-advanced-find-a-field-of-this = Buscar un campo de este escenario

studio-advanced-find-a-field-for-example = Buscar un campo, por ejemplo máscara

studio-advanced-parameter-view = Vista de parámetros

studio-advanced-find-a-scenario-domain-field = Buscar un escenario, dominio, campo, panel o comando

studio-advanced-skip-to-results = Saltar a los resultados

studio-advanced-find-anything = Buscar cualquier cosa

studio-advanced-lunar-station-coverage-of-a = Estación lunar: cobertura de una estación de referencia (MODELLED)

studio-advanced-simple-view = Vista simple

studio-advanced-choose-a-scenario = Elegir un escenario

studio-advanced-what-do-you-want-to = ¿Qué desea hacer?

studio-advanced-pick-a-domain-and-a = Elija un dominio y un escenario, configúrelo, ejecute el motor en su navegador y luego lea, compare y exporte los resultados. No se sube nada.

studio-advanced-share-or-export = Compartir o exportar

studio-advanced-good-first-runs = Buenas primeras ejecuciones

studio-advanced-pin-run = Fijar ejecución

studio-advanced-report-json-scenario-tables-and = informe, JSON, escenario, tablas y exportaciones

studio-advanced-the-exact-scenario-in-the = el escenario exacto, en el enlace

studio-advanced-an-iframe-for-a-course = un iframe para la página de un curso o una wiki

studio-advanced-opens-in-a-new-tab = se abre en una pestaña nueva

studio-advanced-loading-the-engine-the-recorded = Cargando el motor. Primero se muestra el resultado registrado de este escenario.

studio-advanced-got-it = Entendido

studio-advanced-headline-numbers-from-the-engine = Cifras principales del resultado del motor, con el cambio desde su ejecución anterior de este escenario y un resultado de superado o no superado cuando la ejecución indica un umbral.

studio-advanced-set-parameters = Establecer parámetros

studio-advanced-every-change-re-runs-the = Cada cambio vuelve a ejecutar el motor y actualiza las cifras clave y los paneles.

studio-advanced-drag-a-slider-and-the = Arrastre un deslizador y el escenario se vuelve a ejecutar. Cada control escribe directamente en el texto del escenario de abajo.

studio-advanced-in-the-editor-tab-indents = En el editor, Tab sangra dos espacios. Pulse Escape y luego Tab para avanzar.

studio-mission-thread-time-axis = Eje de tiempo

studio-mission-thread-mission-thread = Hilo de misión

studio-mission-thread-where-does-a-mission-s = ¿Dónde se agota el presupuesto de error de navegación y temporización de una misión?

studio-mission-thread-a-mission-is-a-chain = Una misión es una cadena de fases: lanzamiento, encuentro, transferencia a la Luna, alunizaje, regreso. Cada fase tiene sus propios sensores y su propio presupuesto de error, y cada una transmite su incertidumbre a la siguiente. Esta página muestra el presupuesto de toda la cadena, fase por fase, y nombra el eslabón más débil.

studio-mission-thread-open-the-artemis-class-example = Abrir el ejemplo de clase Artemis

studio-mission-thread-open-a-result-file = Abrir un archivo de resultado…

studio-mission-thread-the-thread = El hilo

studio-mission-thread-error-against-mission-elapsed-time = Error frente al tiempo transcurrido de la misión

studio-mission-thread-the-phases = Las fases

studio-mission-thread-the-budget-of-one-phase = El presupuesto de una fase
