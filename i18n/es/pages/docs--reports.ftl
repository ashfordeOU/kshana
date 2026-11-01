# docs--reports: translations (es)

# text
seg-3ea93ae372ca = Qué contiene

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campañas

# text
seg-aa5482ac34ff = Límites, declarados con claridad

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Fuente: <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Cada ejecución de la interfaz de línea de comandos (CLI) escribe un informe junto a su resultado: una página imprimible en HyperText Markup Language (HTML), <c1/>, y un documento legible por máquina en JavaScript Object Notation (JSON), <c2/>, con el mismo contenido. El informe sirve para cualquier tipo de escenario y para campañas.

# text
seg-e26b1a83a86d = El documento de resultado responde <em>qué calculó el motor</em>. El informe añade lo que un lector necesita antes de actuar a partir de él: qué entró, en qué se apoyan las cifras, qué se dejó fuera y cómo obtener de nuevo los mismos bytes. No inventa nada de eso. Cada sección se lee de una fuente que el motor ya conserva y nombra la fuente junto a lo que cita.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = El constructor es <c1/> (<c2/>). Es una función pura de la salida de la ejecución, de los bytes del archivo de escenario y de la línea de comandos: no lee ningún reloj, ningún archivo ni la red, y se compila para WebAssembly.

# text
seg-bed0af192da5 = Secciones

# text
seg-fca842769048 = Sección

# text
seg-2654051d8292 = Se lee de

# text
seg-5790851a4a5f = Resumen ejecutivo

# text
seg-3d34b2ef5988 = qué hace el tipo de escenario, el resumen de una línea de la ejecución, las cifras principales, la etiqueta de honestidad de la ejecución, el recuento de capacidades VALIDATED / MODELLED / PARTNER usadas

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = el catálogo de tipos de escenario (<c1/>), el <c2/> del resultado, su bloque <c3/> o de cifras de mérito, los percentiles de una campaña Monte Carlo

# text
seg-e1ce0e8d5c61 = cada campo que fija el archivo de escenario, aplanado hasta su ruta, con su unidad y de dónde procede la unidad

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = el archivo de escenario; unidades del bloque <c1/> del resultado (el esquema de unidades de campo, <c2/>), o, si no, del sufijo del nombre del campo (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); una unidad que ninguno indica se imprime como <b>no indicada</b>

# text
seg-88ccaef6fc49 = el gráfico de la ejecución, cada escalar del documento de resultado con su unidad y un resumen de recuento / mínimo / máximo / primero / último de cada columna numérica

# text
# c1: units
seg-42a82485f8c8 = el documento de resultado y su bloque <c1/>

# text
seg-f554fbcdd85c = Agregación (campañas y barridos)

# text
seg-7c0466805f54 = la tabla de nodos de un barrido; la media, la desviación típica, los percentiles 5 / 50 / 95 y el intervalo de confianza del { "95" } % de la media de una ejecución Monte Carlo, con un histograma por métrica; la tabla de fases de una cadena; las condiciones compartidas, los miembros y el resumen combinado de una composición

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = la sección <c1/>, <c2/>, <c3/> o <c4/> del resultado de la campaña; la cuadrícula de un resultado <c5/> o <c6/>

# text
seg-3bf44008fc65 = Animación y exportaciones

# text
# c1: --animate svg
seg-64d1073dfadc = el dibujo animado de la ejecución (la salida <c1/>) incrustado como imagen inerte, o por qué no lo hay; enlaces a los archivos de animación e interoperabilidad que el mismo comando escribió junto al informe; cada formato de exportación con indicación de si se aplica al escenario, por qué no, y su especificación

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = el exportador de animación (<c1/>), <c2/> y los archivos que escribió la línea de comandos (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Cronología de eventos

# text
seg-f29f1b90edbd = ventanas temporizadas y eventos puntuales, dibujados y tabulados sobre el eje de tiempo de la ejecución

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = tablas de escenario con <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> o un instante de inicio; el intervalo de la ejecución <c7/>; cualquier matriz <c8/> del resultado; las fases y los traspasos de una campaña

# text
seg-00bee96167aa = Etiquetas de verificación

# text
seg-6dea392111a6 = cada fila de la matriz de verificación que ejercitan los tipos de escenario de la ejecución, con su etiqueta, su referencia independiente y su evidencia de pruebas, y los niveles por cifra que indica el resultado

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = la matriz de verificación (<c1/>, <c2/>), a través de la correspondencia de tipo de escenario a fila <c3/>

# text
seg-c19ae28a2355 = Lo no modelado y las hipótesis

# text
seg-aff7a016c7e2 = cada limitación, citada

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = los bloques <c1/>, <c2/> y <c3/> del resultado; las cláusulas MODELLED del catálogo de tipos de escenario; los comentarios de escenario y los textos de entrada que dicen «not modelled»; el motivo de la matriz por el que cada fila MODELLED sigue siendo modelada (<c4/>)

# text
seg-a3ee5ba71183 = Registro de reproducibilidad

# text
seg-a9746c2f1881 = versión del motor, commit de origen, resúmenes del Secure Hash Algorithm de 256 bits (SHA-256) del archivo de escenario y del documento de resultado, semilla, plataforma, el comando exacto, la regla del directorio de trabajo, el resumen de cada archivo de entrada adicional

# text
seg-ec1f62f6bbd1 = la compilación, los archivos, la línea de comandos

# text
seg-ea460048debd = Una sección sin nada que enumerar dice por qué en una frase (por ejemplo, «No timed event: the scenario scripts no window or onset time and the result reports no event»). Ninguna sección queda nunca vacía y en silencio.

# text
seg-b99234469953 = Qué significa una etiqueta en el informe

# text
seg-f9060b1e8077 = Una etiqueta de verificación califica la <b>capacidad</b> nombrada en una fila de la matriz, tal como la registra la matriz. No califica la configuración del escenario, y una fila VALIDATED no hace que las entradas de una ejecución sean medidas. Una fila PARTNER es una disciplina en la que se apoya la ejecución y que Kshana no proporciona (el hardware de antena para los tipos de escenario de radiofrecuencia, la carga útil cuántica para los tipos de escenario cuánticos, el bus de la nave para el presupuesto de actitud); el informe la muestra como <em>se confía en ella, no se proporciona</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = La correspondencia de tipo de escenario a filas es una tabla de cadenas <c1/> de la matriz. La etiqueta, la referencia independiente y la evidencia se vuelven a leer de la matriz al construir el informe, de modo que mover una fila entre VALIDATED y MODELLED mueve consigo todos los informes. Una campaña lleva la fila de su modo (cadena, barrido o Monte Carlo, composición) más cada fila de cada tipo de escenario miembro que ejecutó; <c2/> lleva las filas del tipo de escenario que barrió. Toda ejecución lleva además la fila «Reproducibility & software assurance», en la que se apoya el registro de reproducibilidad.

# text
# c1: advanced_report::PATH_GATED_CAPABILITIES
# c2: orbit
# c3: ephemeris
# c4: tle
# c5: slot-timing
# c6: oscillator.record
# c7: spectrum
# c8: [[panels]]
# c9: leo-pass
# c10: leo-pnt-chain
# c11: leo-navmsg
# c12: leo-pvt
# c13: terrain-nav
# c14: terrain-slam
seg-f38434695c28 = Una fila que califica solo una ruta de entrada de un tipo de escenario figura únicamente cuando la ejecución siguió esa ruta (<c1/>): <c2/> y <c3/> llevan la fila «Orbit propagation & determination» solo con un <c4/> (la ruta de Simplified General Perturbations { "4" } (SGP4); una órbita analítica es una propagación de dos cuerpos), y <c5/> lleva la fila de registro medido solo con un <c6/>. La misma tabla condiciona la fila multibanda de <c7/> a que la ejecución dibuje <c8/>, y las filas de los tipos de escenario de órbita terrestre baja (LEO) a la ruta que siguió cada ejecución: una fila de lluvia, entrada en edificios, baja energía o spoofer de <c9/> o <c10/> solo cuando el escenario fija ese término, la fila de centelleo salvo que el escenario la desactive, una fila de posicionamiento puntual preciso de <c11/>, <c12/> o de cadena solo para el análisis o el modo que lleva el resultado, y la fila de preajuste de sistema LEO solo cuando se usa un preajuste con nombre. La fila del lector de la Shuttle Radar Topography Mission (SRTM) no la lleva ningún tipo de escenario: <c13/> y <c14/> se ejecutan sobre un modelo digital de elevación (DEM) sintético, y ningún campo de escenario lee una tesela SRTM. Una fila VALIDATED que la ejecución no tocó afirmaría, de otro modo, una evidencia que la ejecución no tiene.

# text
seg-29efeadac5c7 = Reproducir una ejecución a partir de su informe

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> contiene todo lo necesario:

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Compruebe el archivo de escenario frente a <c1/>, y cualquier archivo de <c2/> (un archivo de orientación terrestre <c3/>) frente a su resumen.

# text
# c1: command
seg-5b3c59266451 = Ejecute <c1/> desde el directorio en el que se inició la ejecución original. La ruta del escenario y cualquier ruta de datos relativa dentro del escenario se resuelven respecto a él.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = El nuevo <c1/> tiene el SHA-256 de <c2/>, y los nuevos <c3/> y <c4/> son idénticos byte a byte a los antiguos.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> hace exactamente esto para un escenario de reloj, una campaña encadenada, una campaña de barrido y una ejecución de órbita con un archivo <c2/>: lee el comando del informe, lo ejecuta en un directorio nuevo que contiene solo las entradas registradas y compara bytes.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> es el resumen de los bytes exactos del archivo. El <c2/> propio del resultado es otra cosa: la huella del tipo de escenario para el escenario (a menudo de una forma canónica), y el informe imprime ambos, etiquetados.

# text
# c1: seed
seg-3d72d2059a6c = <b>Semilla.</b> La semilla es el <c1/> del escenario o, en su defecto, la que indica el resultado. Para un tipo de escenario que no admite semilla, el informe lo dice y señala que el archivo de escenario y la compilación del motor bastan por sí solos para fijar el resultado.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Commit de origen.</b> El motor registra el commit solo si se compiló con la variable de entorno <c1/> definida, leída en tiempo de compilación:

# text
seg-3c7ed74729d3 = Una compilación sin ella informa del commit como no registrado, y la versión del motor identifica la versión publicada. No se adivina nada.

# text
seg-86ff67531a0e = <b>Plataforma.</b> Sistema operativo, arquitectura y familia de la compilación. Los resultados son idénticos byte a byte en una misma plataforma; entre plataformas, los resultados en coma flotante pueden diferir en las últimas cifras (véase <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Determinismo y la única marca de tiempo

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = Los mismos bytes de escenario, la misma semilla y la misma compilación del motor dan un <c1/> y un <c2/> idénticos byte a byte. El informe no lleva ninguna marca de tiempo. La única lectura de reloj en todo el crate es la que hace <c3/>, que estampa <c4/> en el documento de resultado; el informe muestra entonces esa marca y dice que es el único campo que una reproducción no igualará. Para evitarlo, ejecute sin <c5/>. <c6/> construye dos veces el informe de cada archivo de escenario de <c7/> (salvo el manifiesto de la suite) y vuelve a ejecutar seis escenarios (entre ellos una campaña de cada uno de los modos de cadena, barrido y composición) para comprobarlo de extremo a extremo.

# text
seg-8a3fc60a5b54 = Impresión a PDF

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = El motor no escribe archivos Portable Document Format (PDF). Un escritor de PDF que renderizara los gráficos supondría una dependencia nueva y pesada, de modo que no existe la opción <c1/>. En su lugar, <c2/> incluye una hoja de estilos de impresión: ábralo en un navegador, imprima y elija «Guardar como PDF».

# text
seg-13f1f294ede1 = La hoja de estilos está escrita para A4 y para US Letter. No fija tamaño de papel (se aplica la elección del cuadro de impresión), mantiene márgenes de { "15" } mm / { "14" } mm que caben en ambas hojas, pasa a negro sobre blanco, repite los encabezados de tabla en cada página, impide que filas de tabla, figuras y tarjetas se partan entre páginas, mantiene los encabezados con el texto que les sigue y empieza en página nueva las secciones de entradas, resultados, etiquetas de verificación y reproducibilidad. La barra de navegación se oculta al imprimir.

# text
seg-a25bb320665d = El documento JSON

# text
# c1: report.json
# c2: report_schema = "kshana-report"
# c3: report_schema_version = "1.0"
# c4: kind
# c5: title
# c6: executive_summary
# c7: inputs
# c8: results
# c9: aggregation
# c10: events
# c11: capabilities
# c12: not_modelled
# c13: companions
# c14: animation
# c15: exports
# c16: export_command
# c17: reproducibility
# c18: items
# c19: omitted
# c20: items
# c21: statement
# c22: value
# c23: display
# c24: null
# c25: value
# c26: display
seg-9d9af39942a7 = <c1/> tiene <c2/> y <c3/>, luego <c4/> y <c5/> y una clave por sección: <c6/>, <c7/>, <c8/>, <c9/> (solo campañas y barridos), <c10/>, <c11/>, <c12/>, <c13/> (sección 3b: <c14/>, <c15/> y <c16/>) y <c17/>. Una sección de lista tiene <c18/>, <c19/> (las filas que el límite de la página dejó fuera; el documento de resultado lleva todos los valores) y, cuando <c20/> está vacío, un <c21/> que dice por qué. Un valor conserva su forma JSON sin procesar en <c22/> y el texto que muestra la página en <c23/>; un valor ausente es <c24/> en <c25/> y «no value» en <c26/>.

# text
seg-06cc70ca3601 = <b>Unidades.</b> Cuando ni el esquema de unidades de campo ni el nombre del campo dan una unidad, el informe dice «not stated» en lugar de adivinar. Las entradas anidadas dentro de los escenarios miembros de una campaña se resuelven solo con el bloque de unidades propio de la campaña y el sufijo del nombre del campo, de modo que más de ellas figuran como «not stated» que en una ejecución independiente.

# text
seg-023d5a1fbffc = <b>Criterio de correspondencia.</b> Qué filas de la matriz ejercita un tipo de escenario es una tabla curada, comprobada por una prueba para que nombre exactamente una fila existente por entrada y cubra todos los tipos de escenario integrados. Que cada correspondencia sea la correcta es un juicio humano, como la propia elección de referencia independiente de la matriz.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Límites.</b> La página enumera como máximo { "400" } entradas, { "150" } resultados escalares, { "60" } columnas numéricas y { "200" } eventos; <c1/> cuenta el resto. Una tabla de más de { "24" } filas dentro de un escenario (una serie ingerida) se resume por columna.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> conserva sus propios <c2/> y <c3/>; no escribe este informe.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Bindings.</b> Los bindings de Python y WebAssembly conservan <c1/>, la tarjeta de puntuación de una página; el informe descargable del entorno de pruebas es su propia página (<c2/>). Este informe lo escribe la CLI, y quienes llaman desde Rust pueden construirlo con <c3/>. El servidor del Model Context Protocol (MCP) lo devuelve desde su herramienta <c4/>, como JSON o como página HTML; el nombre del archivo de escenario en su comando de reproducción es el que pasa quien llama (por defecto <c5/>), y no enumera ningún archivo complementario, ya que el servidor no escribe ninguno.

# text
seg-c8ab7b4605cf = <s1>Siguiente</s1>Exportación de animación
