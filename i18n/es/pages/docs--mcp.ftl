# docs--mcp: translations (es)

# text
seg-261c059bec54 = De carácter consultivo, no es un equipo de navegación homologado: el operador sigue siendo responsable de la navegación. El servidor se ejecuta en su ordenador; no se envía nada a Ashforde OÜ.

# text
seg-13641146503d = Cursor (un clic)

# text
seg-3bd13fe295f4 = VS Code (un clic)

# text
seg-fea7b394cdde = npx

# text
seg-76fcc8024f2f = uvx / pipx

# text
seg-deb5187472d1 = Homebrew

# text
seg-491167f2310c = Scoop

# text
seg-5c425ea185ee = Binario precompilado

# text
seg-d107bc8e1950 = Registro de MCP

# text
seg-842b77a21c5f = Canal

# text
seg-d6476863f862 = Capacidad

# text
seg-fdbb9db68f1d = ninguna

# text
seg-1759a8cce7d6 = Tipos

# text
seg-564133d6a0c4 = Constelaciones alrededor de cualquier cuerpo

# text
seg-b88a2a9497c2 = Herramienta

# text
seg-a683980168f7 = Docker

# text
seg-f3a2279d6df7 = Comando o botón

# text
seg-20c5ae650eb7 = Requiere

# text
seg-af4d3ce85e11 = Forma fijada

# text
seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

# text
seg-b02bdf7c7661 = Node o Docker

# text
seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

# text
seg-abf8b5fe685a = Node { "18" }+

# text
seg-06299cefbf9e = Python { "3.9" }+ con uv o pipx

# text
seg-26795c302f8a = brew

# text
seg-ded975fa67fa = fórmula para v{ $version }

# text
# c1: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket
# c2: scoop install kshana-mcp
seg-667d6dde705b = <c1/> y luego <c2/>

# text
seg-f6e9fc5f46fe = Scoop (Windows)

# text
seg-bc4762d20004 = manifiesto para v{ $version }

# text
seg-f7c0a2fbb0b5 = winget

# text
seg-9e599ab3c0a3 = winget (Windows)

# text
seg-091d1404bb8a = cargo

# text
seg-145ddf98e77f = Rust { "1.88" }+

# text
# c1: kshana-mcp
# c2: kshana-mcp-<target>[.exe]
# c3: SHA256SUMS
# c4: gh attestation verify
seg-b308519d4c8d = <a1>la página de la versión</a1>: <c1/> (Linux x86-64), <c2/>, comprobado con <c3/> y <c4/>

# text
seg-c39cac69f700 = v{ $version }

# text
# c1: io.github.ashfordeOU/kshana-mcp
seg-e8f5e2b6580b = <c1/> (lo encuentran los clientes que conocen el registro)

# text
seg-b1a6e807f06f = un cliente que conoce el registro

# text
seg-d5a3818ac3b6 = Remoto (HTTP en streaming)

# text
seg-5f1397b1ea30 = su propio host

# text
# c1: mcp/kshana-mcp/README.md
seg-e7acd0ff4c84 = Fuente: <c1/>

# attr:alt
seg-81a87d14efda = Kshana: la marca, una retícula de brújula que señala el instante preciso, junto al logotipo tipográfico kshana

# text
seg-3d5232472e42 = kshana-mcp: pregunte a su asistente de IA y el motor responde

# text
# c1: kshana-mcp
seg-ef90bf1e0b51 = <c1/> es un servidor de <a1>Model Context Protocol</a1> (MCP) para <b>Kshana</b>, el simulador de código abierto para la resiliencia de PNT (posicionamiento, navegación y temporización). Permite que un asistente de inteligencia artificial (IA) ejecute el motor real y lea su JSON (JavaScript Object Notation), en lugar de adivinar las matemáticas. Habla por stdio (entrada y salida estándar) con cualquier cliente compatible con MCP, incluidos Cursor y JetBrains AI Assistant / Junie.

# text
seg-1fddef4e9a49 = Las matemáticas para las que Kshana está validado son justo donde un modelo de lenguaje adivina peor: la propagación orbital SGP4 (Simplified General Perturbations { "4" }), los marcos de referencia de la IAU (Unión Astronómica Internacional), las desviaciones de Allan, la disponibilidad de GNSS (sistema global de navegación por satélite) y el DOP (dilución de la precisión), los niveles de protección de ARAIM (monitorización avanzada de integridad autónoma del receptor), la fusión de GNSS e INS (sistema de navegación inercial) y los modelos de sensores cuánticos. Haga una pregunta; el asistente ejecuta un escenario real y obtiene cifras de mérito con su procedencia y su etiqueta VALIDATED o MODELLED.

# attr:alt
seg-d51681f30e8f = Un motor abierto en el centro, con el servidor MCP como una de sus superficies junto a la línea de comandos, la biblioteca de Rust, Python, WebAssembly y Kshana Studio, la imagen de Docker y el complemento de JetBrains; todas las superficies ejecutan el mismo motor, y Kshana Pro depende de él sin bifurcarlo

# text
seg-2a56e1f52830 = Herramientas

# text
# c1: include_chart
seg-b847694d91b5 = Ejecuta un escenario a partir de una definición TOML (Tom's Obvious, Minimal Language); devuelve el resumen y el JSON de resultados completo (JavaScript Object Notation: cifras de mérito, curvas). El parámetro opcional <c1/> devuelve el gráfico como SVG (Scalable Vector Graphics).

# text
seg-3c00da00ec30 = Comprobación previa: analiza el TOML y detecta su tipo de escenario, sin ejecutarlo.

# text
# c1: name
# c2: kind
# c3: kind
seg-4516fd1e665c = Los escenarios de referencia incluidos como JSON: cada <c1/>, su <c2/> y una frase sobre lo que muestra. Filtro <c3/> opcional. Cada ejemplo se ejecuta tal cual, de modo que esta es la vía más rápida hacia un TOML válido para un tipo de escenario.

# text
# c1: scenarios/
seg-61db4a94ad72 = El texto TOML de un escenario de referencia incluido, byte por byte el archivo de <c1/>.

# text
# c1: format
# c2: json
# c3: html
seg-306f7a835bb9 = Ejecuta un escenario y devuelve su informe: resumen ejecutivo, entradas, cada cifra con su unidad y su etiqueta VALIDATED o MODELLED, sucesos, las capacidades ejercitadas y un registro de reproducibilidad. <c1/> es <c2/> (por defecto) o <c3/> (la página imprimible de un solo archivo).

# text
# c1: svg
# c2: html
# c3: frames
seg-bdacef6d5133 = Ejecuta un escenario y devuelve su serie temporal como animación: <c1/> (por defecto), <c2/> (un reproductor autónomo) o <c3/> (como máximo { "120" } en una respuesta). El primer elemento de contenido es un resumen JSON de lo que se dibujó; siguen los archivos. Un tipo de escenario sin eje temporal muestreado se rechaza indicando el motivo.

# text
# c1: czml
# c2: kml
# c3: geojson
# c4: stk
# c5: sigmf
seg-313f7594bd81 = Qué formatos de interoperabilidad se aplican a un escenario (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), el motivo cuando uno no se aplica y la especificación que sigue cada escritor. No ejecuta el escenario.

# text
# c1: .e
# c2: spectrum
# c3: [iq]
seg-e63b7853bb96 = Exporta un escenario como CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit) <c1/>, o SigMF (Signal Metadata Format, para un escenario <c2/> con un bloque <c3/>). El primer elemento de contenido es un índice JSON de los archivos (sufijo, tamaño, codificación y el resumen SHA-256, el Secure Hash Algorithm de 256 bits); siguen los archivos, con el archivo binario de muestras SigMF en base64.

# text
# c1: LineString
# c2: terrain-nav
# c3: terrain-slam
# c4: gravity-map
# c5: combined-altpnt
seg-074e914789c5 = Escribe una ruta GeoJSON <c1/> en un escenario que vuela una trayectoria de puntos de paso (<c2/>, <c3/>, <c4/>, <c5/>) y devuelve el nuevo TOML.

# text
# c1: orbit
seg-ae58a8577aa7 = Exporta la constelación de un escenario <c1/> como efemérides precisas SP3-c (Standard Product { "3" }, revisión c).

# text
# c1: orbit
seg-6a59aacf26bb = Exporta los elementos de un escenario <c1/> como un catálogo OMM (Orbit Mean-elements Message) de CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2.

# text
# c1: orbit
# c2: export_sp3
seg-5562b319968b = Exporta la serie de estados de un escenario <c1/> como efemérides CCSDS OEM (Orbit Ephemeris Message) { "2.0" }: la serie de posición <em>y</em> velocidad en TEME (ecuador verdadero, equinoccio medio) que leen las herramientas de dinámica de vuelo (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit); el complemento con velocidad de <c2/>, que solo lleva posición.

# text
# c1: <scenario>.table.csv
# c2: realtime-frame-eop
# c3: lunar-time-budget
# c4: lunar-jamming
# c5: telecom-timing
# c6: leo-navmsg
# c7: encode-decode
# c8: kepler16
# c9: kepler-rac
# c10: moonlight-service-volume
# c11: export_site_lat_deg
# c12: export_site_lon_deg
seg-b0cf13e530b7 = Ejecuta un escenario y devuelve su tabla de reproducibilidad como CSV (valores separados por comas): la tabla estable byte a byte que la CLI (interfaz de línea de comandos) escribe como <c1/>. Solo <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (su análisis <c7/> sobre un modelo de mensaje <c8/> o <c9/>) y <c10/> con <c11/> + <c12/> fijados emiten una; cualquier otro tipo de escenario devuelve un error que nombra estos.

# text
# c1: tle
# c2: epoch
# c3: skyline_preset
# c4: request
# c5: docs/SKYLINE.md
seg-ab242cd0259c = Geometría del cielo bajo un perfil del horizonte dependiente del acimut: a partir de un emplazamiento, una hora y preajustes de constelación, conjuntos de elementos de dos líneas (<c1/>, propagados con SGP4 a una <c2/> UTC) o satélites como acimut/elevación o ECEF, los satélites visibles y los ocultos por el perfil, GDOP/PDOP/HDOP/VDOP/TDOP a partir del núcleo de DOP comprobado con gnss_lib_py, el cofactor y la covarianza este-norte-arriba (un reloj por sistema o uno común) y la elipse de error horizontal; con <c3/> en lugar de <c4/>, un preajuste REPRESENTATIVE con su procedencia y su corte cada grado. MODELLED; lleva la declaración consultiva; sin Monte Carlo por MCP. Véase <a1><c5/></a1>.

# text
# c1: format
# c2: ubx
# c3: rinex
# c4: android
# c5: nmea
# c6: sbf
# c7: text
# c8: base64
# c9: [[events]]
# c10: [compare]
# c11: [platform] kind = "vessel"
# c12: text
# c13: base64
# c14: docs/RECEIVER-TRUST.md
seg-d6ed4e8d56e5 = Evalúa la confianza de un registro real de un receptor GNSS (sistema global de navegación por satélite). El TOML nombra el <c1/> del registro (<c2/>, <c3/>, <c4/>, <c5/> o <c6/>) y da sus bytes en línea como <c7/> o <c8/>; la herramienta ejecuta los monitores de confianza (caída de la densidad de portadora a ruido, pérdida de enganche, AGC (control automático de ganancia), indicador de inhibición, salto de posición y, con RINEX más navegación difundida, RAIM (monitorización de integridad autónoma del receptor) y un monitor asistido por reloj) y devuelve cuándo y por qué la posición dejó de ser digna de confianza. Las secciones opcionales <c9/> y <c10/> puntúan sucesos declarados y caídas previstas de C/N0 frente a tolerancias declaradas. Una tabla <c11/> selecciona los monitores marítimos y añade una puntuación de confianza de 0 a 100 por época con los monitores que restaron (consultivo; MODELLED). El registro se envía en línea como <c12/> o <c13/> (como máximo { "4" } MiB). Gráfico y CSV por época a petición. Véase <a1><c14/></a1>.

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: --listen
# c4: docs/MARITIME-TRUST.md
seg-d1a967a443ea = Puntúa un extracto NMEA { "0183" } acotado (como máximo { "2" } MiB y { "20,000" } épocas; debe contener la ventana de calibración) como lo puntúa <c1/>: estado de confianza por época y puntuación de 0 a 100 con los monitores que restaron, un resumen y la última <c2/>. La forma acotada del comando en directo: no se abre ningún socket y no se escribe nada en un puerto; la puerta, <c3/> y los exportadores de telemetría (Prometheus, OTLP, syslog) son solo de línea de comandos. Solo consultivo; MODELLED. Véase <a1><c4/></a1>.

# text
seg-89e894d4b416 = Un registro NMEA { "0183" } de un buque (como máximo { "4" } MiB) como ejecución por lotes, con el TOML de sesión que indica los límites del buque: el modelo de puntuación y la puntuación de 0 a 100 de cada época con sus deducciones (la respuesta conserva los recuentos por estado y las primeras { "200" } épocas degraded o untrusted). Solo consultivo; MODELLED.

# text
# c1: kshana jammertest import
# c2: docs/JAMMERTEST.md
seg-27698c80b7f1 = Lee el catálogo de pruebas y el plan de transmisión publicados de Jammertest (NPRA/jammertest-plan, MIT) como verdad programada (<c1/>): las franjas de un área de prueba se convierten en sucesos de confianza del receptor con el identificador del catálogo y el año en cada etiqueta. Franjas planificadas, no horas de emisión registradas; no se lee ningún campo de contacto del plan. MODELLED. Véase <a1><c2/></a1>.

# text
# c1: kshana jammertest score
# c2: log
# c3: ubx
# c4: sbf
# c5: log_base64
seg-23daf6121ca0 = Puntúa un registro de receptor frente a ese programa (<c1/>): por prueba, la latencia de detección, las alarmas perdidas y el tiempo de recuperación, y las falsas alarmas fuera de cada franja. Registros de texto como <c2/>, binarios (<c3/>, <c4/>) como <c5/>. Un paquete firmado necesita una clave: línea de comandos. Solo consultivo; MODELLED.

# text
# c1: kshana receiver-trust evidence
# c2: docs/EVIDENCE-PACKS.md
seg-0ca5b319e850 = Un paquete de evidencias firmado para una ventana del registro de un buque (<c1/>): los bytes brutos del registro de la ventana, la configuración, los resultados y motivos por época, una página de resumen y un manifiesto con cada SHA-256 y una cadena de hashes, firmado con Ed25519. La semilla de firma nunca se devuelve ni se registra; sin una se usa una clave de un solo uso, de modo que el paquete prueba integridad, no identidad. Un registro técnico, no un dictamen jurídico. Véase <a1><c2/></a1>.

# text
# c1: .tsr
# c2: kshana evidence attach-timestamp
# c3: openssl ts -verify
seg-8df4c6fb851d = Vincula a un paquete un token de marca de tiempo RFC { "3161" } (base64 de los bytes de <c1/>), en memoria (<c2/>); el paquete con el token debe seguir verificándose. No se comprueba la firma de la autoridad de marca de tiempo: use <c3/>.

# text
# c1: kshana evidence verify
# c2: verdict
# c3: verified
# c4: intact-signer-not-pinned
# c5: failed
# c6: require_timestamp
seg-1f7a6f7f005a = Verifica un paquete (<c1/>): cada hash, la cadena, la firma y, con la clave pública del firmante y el registro completo, quién lo firmó y que el fragmento procede de ese registro. Nombra cada fallo y archivo. El <c2/> es <c3/> (firmante fijado), <c4/> (todo se comprueba pero no se dio ninguna clave pública, de modo que el firmante no queda establecido) o <c5/>; <c6/> hace fallar un paquete sin token de marca de tiempo.

# text
# c1: nmea-scenario
# c2: kshana-nmea-training/1
seg-c43761e01f63 = NMEA { "0183" } sintético de puente para formación de tripulaciones a partir de un TOML <c1/> (inhibición, arrastre de posición, suplantación de hora, retardo de reproducción) con el registro del instructor (<c2/>); determinista por semilla. Solo texto: no se sintetiza nada a nivel de RF ni de IQ y no se transmite nada; nunca para los sistemas de navegación en vivo de un buque. La respuesta lleva las primeras { "2000" } líneas.

# text
# c1: kshana-interference-map/v1
# c2: docs/INTERFERENCE-MAP.md
seg-8aec8f61dab2 = Un mapa de interferencias GNSS a partir de informes de posición ADS-B o AIS como texto CSV (como máximo { "4" } MiB): un GeoJSON <c1/> por día UTC, solo agregado (sin identificadores, con las celdas de menos de { "5" } aeronaves o buques distintos retenidas), con la licencia del conjunto de datos incorporada. Una celda degradada no identifica la interferencia como causa; no es una previsión. MODELLED. Véase <a1><c2/></a1>.

# text
# c1: kshana bench-export
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: docs/TEST-BENCH.md
seg-d5959e4f1c96 = El movimiento del vehículo y los sucesos de un escenario para un simulador GNSS de laboratorio (<c1/>): CSV y JSON de movimiento, NMEA, puntos de paso y sucesos como texto, sin escribir nada en disco. Tipos de escenario <c2/>, <c3/>, <c4/>. Sin señal: nada de lo exportado es, modela ni maneja una señal de radiofrecuencia o de banda base; el simulador y su operador aportan las señales. Véase <a1><c5/></a1>.

# text
# c1: kshana evidence round-trip
# c2: kshana.test-conditions/1
seg-1076916237f0 = El paquete firmado de ida y vuelta de laboratorio (<c1/>): el escenario, el documento <a1><c2/></a1> del laboratorio, el registro del receptor y su puntuación frente a los sucesos declarados, enlazados por hash. Rechaza condiciones y sucesos de puntuación que discrepan. Sin señal; un registro técnico, no una certificación.

# text
# c1: kshana iq sweep
seg-9e1df2016cd7 = Reproduce una grabación IQ del directorio de trabajo con varios diseños de lazo de seguimiento (<c1/>): por diseño y PRN, la fluctuación de fase y de código en régimen estacionario, las fracciones de enganche y la C/N0 media. Como máximo { "256" } canales (diseño, PRN) por llamada; el intervalo debe caber en el presupuesto de muestras.

# text
# c1: kshana iq monitor
seg-a5af1743f993 = Ejecuta los monitores de detección de interferencia y de suplantación sobre una grabación IQ del directorio de trabajo (<c1/>): monitores de potencia y espectrales de banda ancha y monitores de C/N0 y de calidad de señal por satélite frente a una línea base aprendida. Nombres y longitudes de series y hasta { "200" } sucesos en la respuesta; el informe completo a petición como archivos. Un suceso dice que una magnitud medida salió de su línea base, no por qué. MODELLED.

# text
# c1: kshana iq labfit
# c2: iq-labfit
# c3: text
# c4: base64
# c5: path
seg-c9c9c909c621 = Ajusta el modelo de pérdida de enganche del lazo de seguimiento a ejecuciones de laboratorio (<c1/>) a partir de un escenario <c2/> cuyos registros van en línea (<c3/> o <c4/>; se rechaza un <c5/>). No lee ni escribe ningún archivo. MODELLED.

# text
# c1: kshana.test-conditions/1
seg-4f231cd18d37 = Valida un archivo <c1/> dado como texto y devuelve las condiciones resueltas con su hash. Solo en línea.

# text
# c1: kshana compliance-report
# c2: runs
# c3: {label, result, scenario?}
# c4: statement
# c5: docs/compliance/
seg-2851f2858910 = La correspondencia con marcos públicos, rellenada a partir de documentos de resultados dados como texto (<c1/>): a qué filas de seis marcos y normas de resiliencia (marco US DHS Resilient PNT v2.0, IMO para buques, EASA para aviación, NIS2 artículo { "21" }, EN { "16803" }, NIST IR 8323r1) aportan evidencias a favor las ejecuciones, a cuáles no, y la brecha de cada fila. Recibe <c2/> de <c3/> (como máximo { "64" }, { "4" } MiB en total). Un estado indica que las ejecuciones aportan evidencias a favor de las capacidades de la fila; no es una conclusión de que se haya alcanzado un marco ni una calificación o aprobación de ningún producto. La <c4/> se devuelve con cada informe; muéstrela literalmente. MODELLED. Véase <a1><c5/></a1>.

# text
# c1: sources
seg-0a5161ddea94 = Las tablas de correspondencia estáticas (o, con <c1/>, los documentos fuente que citan, con versiones y URL) en Markdown, encabezadas por la misma declaración. No necesita ejecuciones.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-ffcc6c72dc1e = Un flujo de confianza (líneas JSON) o un resultado de <c1/> convertido a texto Prometheus, líneas syslog CEF o LEEF, una carga útil JSON de OTLP o líneas de descubrimiento y estado MQTT de Home Assistant, con los codificadores de <c2/>. Texto en la respuesta: no se envía ni se sirve nada y no se lee ningún reloj. Solo orientativo.

# text
# c1: hybrid
# c2: fusion
# c3: [accel_classical]
# c4: kshana imu-fit
seg-2b82a8a22298 = Parámetros de acelerómetro y giróscopo de los escenarios <c1/> y <c2/> ajustados a partir de un registro de IMU estacionaria (CSV o EuRoC) mediante desviación de Allan, con una tabla <c3/> lista para pegar y el SHA-256 del registro (<c4/>). Texto de entrada, JSON de salida; MODELLED.

# text
# c1: kshana standards-pack list
seg-30d5bb6b34cb = Los paquetes de normas (<c1/>): conjuntos de escenarios puntuados para los perfiles de ensayo del marco DHS Resilient PNT (niveles { "1" } a { "4" }), IMO MSC.1/Circ.1575 y OACI Doc { "9849" } Apéndice F.

# text
# c1: kshana standards-pack run
# c2: MET
# c3: NOT MET
# c4: NEEDS INPUT
# c5: compliance_report
seg-767a05e5df9f = Un paquete ejecutado frente a sus umbrales fijados antes de la ejecución (<c1/>): cada ensayo es <c2/>, <c3/> o <c4/>, con valores medidos y esperados; entregue el informe a <c5/> para ver las filas. MODELLED; no califica ningún producto.

# text
# c1: spec
# c2: symbols
# c3: generate
seg-74110e6b530f = La señal directa aumentada de LunaNet comprobada frente a LNIS V5 AD1 Volumen A (LSIS-AFS V1.0, { "29" } de enero de { "2025" }): <c1/> (la implementación frente a las tablas de códigos impresas del documento y sus ejemplos resueltos), <c2/> (un flujo de símbolos: patrón de sincronización, SB1, FID, continuidad de TOI) o <c3/> (un flujo de prueba). LDPC y CRC-24Q de las subtramas { "2" } a { "4" } no se verifican; no se escribe ninguna señal.

# text
# c1: kshana bench score
# c2: bench/SPEC.md
seg-b6abad1f2c9d = Una entrega de kshana-bench puntuada frente a un archivo de verdad de referencia, ambos en texto JSON (<c1/>, <c2/>): el archivo de resultados con la versión de la especificación, la partición, los hashes de entrada y las métricas de la tarea. MODELLED; describe un registro o un corpus, nunca un producto.

# text
seg-c7a0d7981bfd = Archivos de resultados de kshana-bench convertidos en la página estática de clasificación (texto HTML), cada uno validado antes.

# text
# c1: receiver-trust
# c2: kshana trust-telemetry
seg-1ec7117c7825 = Un flujo de confianza (líneas JSON) o un resultado de <c1/> convertido a texto Prometheus, líneas syslog CEF o LEEF o una carga útil JSON de OTLP, con los codificadores de <c2/>. Texto en la respuesta: no se envía ni se sirve nada y no se lee ningún reloj. Solo orientativo.

# text
seg-0fc2e3928768 = La proporción de la longitud de una ruta que cae en celdas degradadas, no degradadas, no evaluadas y no observadas de uno o más mapas de interferencia, opcionalmente dentro de un intervalo de fechas. Las celdas no observadas no son evidencia de que la ruta esté despejada.

# text
seg-62756ba18cf5 = La configuración de la capa IQ de GNSS: los nombres de señal que aceptan las herramientas IQ, si las herramientas de archivos IQ están activadas, el directorio de trabajo y el presupuesto de muestras por llamada. Llámela primero.

# text
# c1: kshana iq info
seg-98939638409f = Describe una grabación IQ (en fase y en cuadratura) del directorio de trabajo sin procesarla: formato, frecuencia de muestreo, frecuencia central, muestras, duración, archivos de datos y tamaños (<c1/>).

# text
# c1: kshana iq scene
seg-c529b1a7ee53 = Genera una escena IQ de GNSS con varios satélites en el directorio de trabajo (<c1/>): perfiles de Doppler/C/N0 indicados, o geometría real de efemérides de difusión a partir de un archivo de navegación RINEX, con un canal de propagación opcional a nivel de señal. Responde con los archivos escritos y sus recuentos de bytes y la primera época de la verdad de referencia por satélite.

# text
# c1: kshana iq acquire
# c2: surface_out
seg-0c6f5e26367f = Adquisición por FFT (transformada rápida de Fourier) de uno o más PRN (códigos de ruido pseudoaleatorio) sobre una grabación (<c1/>), opcionalmente tras etapas de front-end: por PRN, adquirido o no, Doppler, fase de código, estadístico de pico y umbral; <c2/> (un PRN) conserva toda la superficie de correlación Doppler × fase de código con refinamientos de Doppler fino.

# text
# c1: kshana iq track
# c2: kshana.loop-design/1
# c3: design
# c4: reacquire
# c5: epochs_out
# c6: events_out
seg-1da73ad326de = Adquiere y después sigue con el banco de lazos DLL/PLL/FLL (lazos de seguimiento de retardo, fase y frecuencia) (<c1/>), con los lazos de un archivo TOML <c2/> del directorio de trabajo (<c3/>) o el diseño integrado, y readquisición opcional (<c4/>): por canal, épocas, Doppler final, C/N0 final y medio, fracciones de enganche de fase y de código, enganchado al final, el estado de enganche final, falsos enganches y readquisiciones, además del nombre y el hash del diseño. El seguimiento se transmite en memoria acotada; la salida por época va solo a archivos (<c5/>: E/P/L, discriminadores, estados de los lazos, C/N0, estado de enganche como .csv/.jsonl/.bin; <c6/>).

# text
# c1: kshana iq frontend
seg-262bb9c592c0 = Aplica DSP (procesamiento digital de señal: paso de banda, filtro de muesca, anulación, escisión, AGC, cuantificador) de front-end del receptor y de mitigación de interferencias a una grabación y escribe una nueva (<c1/>).

# text
# c1: kshana iq campaign
# c2: max_cells
seg-cf33e101b144 = Ejecuta una campaña de repetición de laboratorio (<c1/>): grabaciones, cada una con un archivo de condiciones de ensayo que indica la verdad de referencia conocida del laboratorio, × cadenas de front-end × diseños de lazo. Cada celda se puntúa por tiempo hasta la pérdida de enganche, tiempo de readquisición, degradación de C/N0 frente a la J/S indicada (junto a una referencia analítica etiquetada MODELLED), tasa de falsos enganches, jitter de PLL/DLL y disponibilidad. Incremental y reanudable: cada llamada ejecuta las celdas pendientes que caben en el presupuesto de muestras (o en <c2/>).

# text
seg-8112428c6226 = El progreso de una carpeta de salida de campaña: celdas hechas y pendientes, y el resumen criptográfico una vez completa. Solo lee archivos.

# text
# c1: kshana
seg-8bd76f017ae4 = Cada herramienta es una envoltura fina y fiel de una función pública de la biblioteca <c1/>: aquí no vive ninguna lógica de simulación nueva, de modo que un agente ejecuta exactamente el motor validado.

# text
seg-b37bbaf38900 = Las herramientas IQ de GNSS: archivos de entrada, JSON compacto de salida

# text
# c1: iq_*
seg-ecf2ec0eb66d = Las grabaciones IQ llegan a gigabytes, por lo que las herramientas <c1/> nunca pasan muestras por el protocolo. Siguen un único contrato:

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: overwrite: true
seg-31a173dfe40d = <b>Un directorio de trabajo.</b> El servidor lee y escribe archivos IQ solo dentro de la carpeta indicada por <c1/>. Todo argumento de ruta es relativo a ella (una ruta absoluta debe resolverse dentro de ella); las entradas se resuelven a través de enlaces simbólicos antes de la comprobación, la carpeta de una salida debe existir ya dentro de ella, y una salida existente solo se reemplaza con <c2/>. Si no está definida, las herramientas de archivos IQ están desactivadas e indican cómo activarlas; todas las demás herramientas no se ven afectadas.

# text
# c1: KSHANA_MCP_IQ_MAX_SAMPLES
# c2: cf32_le
# c3: ci16_le
# c4: ci8
# c5: cf32_le
# c6: format
# c7: max_seconds
seg-4f734b84a91a = <b>Un presupuesto de muestras.</b> Una llamada genera o procesa como máximo <c1/> muestras complejas (por defecto { "50 000 000" }). En bytes son { "400" } MB como <c2/> ({ "8" } bytes por muestra compleja), { "200" } MB como <c3/> ({ "4" } bytes) y { "100" } MB como <c4/> ({ "2" } bytes); una escena se escribe como <c5/> salvo que <c6/> indique otra cosa. La comprobación se hace antes de cualquier trabajo, y el rechazo indica la duración o el <c7/> que cabe.

# text
# c1: json_out
# c2: csv_out
seg-178284ddfee0 = <b>Respuestas compactas.</b> Cada herramienta responde con un único resumen JSON: picos de adquisición, C/N0, estado de enganche y cada archivo escrito con su ruta y su recuento de bytes. Las tablas por época van a los archivos <c1/> / <c2/> que usted indique.

# text
seg-f375643798e9 = <b>Los argumentos desconocidos se rechazan</b>, no se ignoran, de modo que una opción mal escrita es un error.

# text
# c1: kshana iq
# c2: spectrum
seg-41040247770d = Cada herramienta ejecuta la misma ruta de código que <c1/> en la línea de comandos, dentro del proceso. La capa es solo software: escribe archivos para receptores de software y no controla ningún hardware de radio. La capa IQ no añade síntesis de interferencia ni de suplantador, y nunca se transmite nada. (El tipo de escenario <c2/>, aparte, puede escribir en un archivo instantáneas IQ de interferentes analíticos.)

# text
# c1: docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp
seg-f02d2f6bac7c = Con la imagen de Docker, monte la carpeta y apunte la variable a ella: <c1/>.

# text
seg-721079aa25e7 = Todo tipo de escenario es accesible

# text
# c1: run_scenario
# c2: kind
# c3: list_scenario_kinds
seg-116ada4f4498 = <c1/> despacha según el campo <c2/> del escenario, de modo que todo tipo de escenario que nombra <c3/> se ejecuta a través de ella. Eso incluye las familias más recientes, cada una con ejemplos incluidos que un agente puede obtener:

# text
seg-c7047f5750a9 = Un ejemplo del que partir

# text
seg-b45752760eca = El sistema solar

# text
seg-1ccf38ab6e24 = Campañas: fases encadenadas, barridos, Monte Carlo (conjuntos aleatorios con semilla), composición

# text
seg-67fe14962e1c = Navegación en órbita terrestre baja (LEO): diseño de señal

# text
seg-c555e5b73203 = Navegación LEO: presupuesto de enlace de un pase

# text
seg-67de12cac6f0 = Navegación LEO: mensaje de navegación

# text
seg-b8badd962245 = Navegación LEO: posicionamiento y temporización fusionados

# text
# c1: list_example_scenarios
# c2: kind
# c3: animate_scenario
# c4: report_scenario
# c5: export_interop
seg-0561cfd970d8 = <c1/> con un <c2/> nombra todos los ejemplos incluidos de ese tipo. Las animaciones, los informes y las exportaciones de interoperabilidad no son tipos de escenario: son vistas de una ejecución, y <c3/>, <c4/> y <c5/> las devuelven para cualquier escenario al que se apliquen.

# text
# c1: kshana --study <suite.toml>
# c2: run_scenario
seg-62d106ca4a89 = No se sirven: las suites de estudio (<c1/>), porque una suite nombra archivos de escenario hermanos en disco y las herramientas de escenario no leen ningún archivo. Ejecute cada miembro con <c2/>. (Las herramientas IQ sí leen y escriben archivos, solo dentro de su directorio de trabajo.)

# text
seg-57f592bb676b = Instalar el servidor MCP

# text
seg-77fc92e21295 = Un pasaje que nombra clientes de IA de terceros se omite aquí; está en <a1>mcp/kshana-mcp/README.md</a1> en GitHub.

# text
# c1: kshana-mcp --http 127.0.0.1:8080
seg-9ec78559983f = <c1/>, autoalojado: véase <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

# text
seg-b32b9d4e0f8b = Desde una copia de trabajo o git (desarrollo):

# text
seg-73a73af88f08 = Modo HTTP (autoalojado)

# text
# c1: kshana-mcp --http 127.0.0.1:8080
# c2: /mcp
# c3: --allow-remote
# c4: KSHANA_MCP_HTTP_TOKEN
seg-4f248ed3e597 = <c1/> sirve las mismas herramientas mediante HTTP en streaming en <c2/>. Se enlaza solo a loopback; una dirección que no sea loopback necesita <c3/> y un token de portador en <c4/>; las herramientas de archivos IQ están desactivadas; el tamaño de las peticiones, el tiempo y la concurrencia están limitados; no se envía ninguna cabecera CORS. Kshana no aloja un punto de conexión: usted lo autoaloja. Véase <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: cargo install
# c2: kshana-mcp
# c3: PATH
# c4: ~/.cargo/bin/kshana-mcp
# c5: rmcp
# c6: kshana
seg-60f55b197ac2 = <c1/> coloca <c2/> en su <c3/> (normalmente <c4/>). El servidor habla JSON-RPC (llamada a procedimiento remoto en JSON) por stdio; los registros van a stderr. Compilar desde el código fuente necesita una cadena de herramientas de Rust ≥ { "1.88" } (el SDK <c5/> { "2" }.x parcheado la necesita; la propia biblioteca <c6/> solo necesita { "1.85" }); la imagen de Docker no necesita ninguna.

# text
seg-2f3216082425 = Registrarlo en un cliente

# text
# c1: mcpServers
# c2: kshana-mcp
seg-1090ae3f689c = Prácticamente todos los clientes MCP usan el mismo bloque de configuración <c1/>: registre el binario <c2/> por su ruta absoluta:

# text
# c1: PATH
seg-2da393482666 = O bien, con la imagen de Docker en lugar de un binario local (no hace falta <c1/>):

# text
seg-a4f1295bb27a = Dónde se coloca ese bloque depende del cliente:

# text
# c1: ~/.cursor/mcp.json
# c2: .cursor/mcp.json
seg-154c7e09063d = <b>Cursor</b>: <c1/> (global) o <c2/> (por proyecto).

# text
seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b>: Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, pegue el bloque y reinicie por completo el IDE (entorno de desarrollo integrado).

# text
# c1: …_config.json
# c2: mcpServers
seg-daf0ea451b11 = <b>Asistentes de escritorio</b>: la mayoría usa un <c1/> con la misma estructura <c2/>; consulte la documentación de su cliente para saber dónde se ubica el archivo.

# text
# c1: mcp add
# c2: mcp.json
seg-fc80286aa9bf = <b>Agentes de CLI</b>: muchos aceptan el mismo JSON mediante un mecanismo <c1/> / <c2/>.

# text
# c1: RUST_LOG=debug
# c2: env
seg-9f3ef8d76e05 = Use siempre una ruta absoluta al binario. Defina <c1/> en <c2/> para diagnosticar problemas (los diagnósticos van a stderr; stdout se reserva para el protocolo JSON-RPC).

# text
seg-283d1eba838a = Pruébelo

# text
seg-61739e9b6515 = Una vez registrado, pida a su asistente cosas como:

# text
# c1: list_scenario_kinds
seg-256276ac933d = <em>"Enumera los tipos de escenario de Kshana."</em> → <c1/>

# text
# c1: list_example_scenarios
# c2: get_example_scenario
# c3: run_scenario
seg-2a8e3c76b939 = <em>"Muéstrame un ejemplo de spectrum de Kshana y ejecútalo."</em> → <c1/>, <c2/>, <c3/>

# text
# c1: run_scenario
seg-d2e1e4148589 = <em>"Ejecuta el escenario de holdover de reloj de Kshana con un umbral de { "20" } ns y una interrupción de GNSS de 2 horas; ¿cuál es el holdover cuántico frente al clásico?"</em> → <c1/>

# text
# c1: export_sp3
seg-f4b83873e280 = <em>"Exporta esa constelación GPS (Sistema de Posicionamiento Global) como SP3."</em> → <c1/>

# text
# c1: export_table_csv
seg-54e01c1af45f = <em>"Dame la tabla realtime-frame-eop como CSV."</em> → <c1/>

# text
# c1: list_export_formats
# c2: export_interop
seg-478e6fa0e8d8 = <em>"Pon ese pase de Iridium en un globo de Cesium."</em> → <c1/>, <c2/>

# text
# c1: animate_scenario
seg-90829388d5d9 = <em>"Anima la campaña de jamming."</em> → <c1/>

# text
# c1: report_scenario
seg-9eb1b97ad2fd = <em>"Dame el informe de esa ejecución, con su registro de reproducibilidad."</em> → <c1/>

# text
# c1: iq_signals
# c2: iq_scene
# c3: iq_acquire
# c4: iq_track
seg-dc60d64a3bb8 = <em>"Crea una escena GPS L1 de un segundo con los PRN { "3" } y { "17" }, y luego adquiérela y síguela."</em> → <c1/>, <c2/>, <c3/>, <c4/>

# text
seg-942dc8abe0ec = Nota de diseño: por qué un crate aparte

# text
# c1: Cargo.lock
# c2: rmcp
# c3: kshana
# c4: rmcp
# c5: rmcp
# c6: cargo deny
# c7: xval/anise-frames
seg-ce6d0ecab448 = El servidor es un <b>crate independiente, excluido del workspace</b>, con su propio <c1/>, de modo que el SDK (kit de desarrollo de software) oficial de MCP para Rust, <c2/>, y su entorno de ejecución asíncrono nunca entran en el grafo de dependencias del crate <c3/> publicado: un usuario de la biblioteca o de Python no compila un servidor que no ejecuta. (Se separó por primera vez porque <c4/> es <b>edición { "2024" }</b> y necesita rustc ≥ { "1.85" }, mientras que el crate principal prometía entonces { "1.75" }. La biblioteca declara ahora { "1.85" }; este servidor declara { "1.88" }, el mínimo de <c5/> { "2" }.x con parches de seguridad.) La integración continua (CI) controla este crate por separado: pruebas y <c6/> frente a su archivo de bloqueo. El árbol de licencias de rmcp está limpio (Apache-2.0/MIT/BSD), así que, a diferencia del crate de validación cruzada <c7/>, que por lo demás imita, la separación no obedece a la licencia.

# text
seg-75bf2d74642d = Licencia: AGPL-3.0-only, la Licencia Pública General Affero de GNU versión { "3" } únicamente (o una licencia comercial de Ashforde OÜ; véase <a1>LICENSING.md</a1> del repositorio).

# text
seg-490ebbefb561 = <s1>Anterior</s1>Crate de Rust

# text
seg-350b6b914734 = <s1>Siguiente</s1>Servidor MCP: todos los canales de instalación

seg-492888115662 = Los { "92" } tipos de escenario integrados con descripciones y campos obligatorios/opcionales, para que el agente pueda construir un escenario válido.
