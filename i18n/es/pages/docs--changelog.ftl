# docs--changelog: translations (es)

# text
seg-9a2a5f0a8a02 = Sistema solar

# text
seg-20db2c79b998 = Validado

# text
seg-a20b4a6e8f53 = reloj atómico a escala de chip

# text
seg-49a994d77d2f = oscilador de cristal con compensación de temperatura

# text
seg-2247a2344710 = Significado

# text
seg-5770537524d3 = Área

# text
# c1: CHANGELOG.md
seg-40d4fc0d3922 = Fuente: <c1/>

# text
seg-7333b85d448f = Aquí se documentan todos los cambios relevantes de Kshana.

# text
seg-bbc8f38627f1 = El formato se basa en <a1>Keep a Changelog</a1>, y este proyecto sigue el <a2>Semantic Versioning</a2>. Mientras el proyecto esté en una versión anterior a 1.0, el esquema público de escenarios y resultados todavía puede cambiar; los cambios incompatibles se señalan de forma explícita.

# text
seg-985f7b4c001a = Sin publicar

# text
seg-66749e5be121 = [{ $version }] - 2026-10-22

# text
seg-a2f583aadd0b = Sin funciones nuevas: una corrección en la línea de comandos, actualizaciones de dependencias en las herramientas de validación cruzada y documentación. Los resultados del motor no cambian respecto a { "0.38.0" }.

# text
seg-c9a8a5898ced = Corregido

# text
# c1: kshana kinds | head
# c2: yes | head
# c3: tests/cli_closed_pipe.rs
seg-3cc8ba4d1be6 = La línea de comandos termina en silencio con el estado { "141" } cuando se cierra su salida estándar (<c1/>), en lugar de entrar en pánico con "failed printing to stdout: Broken pipe". { "141" } es { "128" } más SIGPIPE, el estado que informa un shell para <c2/>. Solo se trata una tubería cerrada: un disco lleno o cualquier otro error de escritura sigue informando de sí mismo, y un flujo en vivo que escribe en un socket cerrado sigue recibiendo su error de escritura. <c3/> cierra el lector antes de que se inicie el programa, de modo que la primera escritura falla en cada ejecución.

# text
# c1: xval/
seg-2a47e785cc1d = Actualizaciones de dependencias en las herramientas de validación cruzada (<c1/>); no cambia ningún crate, wheel ni paquete distribuido.

# text
# c1: memmap2
# c2: xval/anise-lunar-od
# c3: xval/anise-mars-od
# c4: kshana
seg-9df898fb24be = <c1/> { "0.9.10" } a { "0.9.11" } (RUSTSEC-2026-0186) en los bloqueos de la comprobación cruzada con ANISE (<c2/>, <c3/>); los bloqueos también resincronizan la dependencia de ruta <c4/> del propio repositorio.

# text
# c1: pillow
# c2: certifi
# c3: xval/oracles/requirements.lock
# c4: requirements.frozen.txt
seg-835e9d6058f8 = <c1/> { "12.3.0" } a { "13.0.0" } y <c2/> { "2026.7.22" } a { "2026.10.19" } en las versiones fijadas del entorno de referencias independientes (<c3/>, <c4/>): las versiones corregidas para ocho avisos de pillow y un aviso de certifi.

# text
# c1: docs/BENCH.md
# c2: xval/bench/RESULTS-v2.md
# c3: agc_k_sigma
seg-902fc421a851 = <c1/>, el README y este archivo listan cada umbral de kshana-bench que es NOT MET, tal como consta en <c2/>: <b>A2</b> (AUC de <c3/> { "0.766" } frente a al menos { "0.80" } en la partición de prueba), <b>D1</b> (mayor brecha { "0.0301" }) y <b>tarea (b) R1</b> (arrastrado, no se volvió a ejecutar). No se ha relajado ningún umbral.

# text
# c1: docs/kinds/by-kind/
# c2: docs/KINDS.md
# c3: docs/COMMANDS.md
# c4: docs/ALL-SURFACES.md
# c5: docs/CAPABILITY-DOMAINS.md
# c6: tools/gen_kinds_index.py
# c7: tools/gen_readme_blocks.py
# c8: tools/gen_figures_038.py
# c9: tools/readme_audit.py
# c10: tests/readme_completeness_doc_sync.rs
seg-44d9c9622c24 = Revisión de integridad del README: una lista de contenidos; los tipos de escenario archivados por familias, cada uno con una página bajo <c1/> (la descripción y los campos del motor, las entradas y los resultados de una ejecución de ejemplo, las filas del registro y las referencias independientes, las limitaciones que indica el informe de la ejecución y el gráfico que escribe el motor), una hoja de contactos por familia, todo indexado por <c2/>; cada comando en <c3/>; cada superficie, comando de plugin, skill y página de Studio en <c4/>; cada dominio de capacidad en <c5/>; diagramas Mermaid incrustados (visión general del sistema, superficies, bucle interno, confianza del receptor, ida y vuelta de laboratorio, Studio, flujo de pruebas y publicación, mapa de módulos, distribución). Escrito por <c6/>, <c7/> y <c8/>; auditado por <c9/>; protegido por <c10/>, que además fija la descripción y los campos de cada entrada al motor.

# text
# c1: tools/render-diagram-chromium.sh
seg-b953186d5726 = <c1/>: renderiza un diagrama Mermaid a SVG y PNG en Linux y actualiza el registro de renderizado.

# text
# c1: docs/
# c2: ../../docs/JAMMERTEST.md
seg-68e19f94faed = README: las figuras de usuarios espaciales y lunares usaban rutas relativas a <c1/>, por lo que no se cargaban desde el README; un enlace apuntaba a <c2/>.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: sweep-clock-stability.svg
# c3: docs/KINDS.md
seg-850e1574e2d6 = Se eliminaron dos archivos de gráficos obsoletos copiados a mano (<c1/>, <c2/>) que ninguna página usaba y que ya no coincidían con el motor; <c3/> contiene los gráficos actuales.

# text
seg-033d52126d8a = Añadido

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-090bf5ae96b6 = <b>GNSS más allá de la constelación (<c1/>).</b> Un nuevo tipo de escenario para naves espaciales por encima, alrededor y más allá de las órbitas GNSS (<a1><c2/></a1>): disponibilidad de una y de cuatro señales, duraciones de interrupciones, C/N0, DOP y enlaces de lóbulo principal frente a lóbulos laterales para GPS, GLONASS, Galileo, BDS, QZSS y NavIC en una capa o a lo largo de trayectorias LEO, MEO, GEO, HEO y de transferencia lunar; patrones de transmisión del folleto, paramétricos o aportados por el usuario; un modelo de ionosfera, plasmasfera y atmósfera con rayo rasante; un diseño de receptor de señal débil; un filtro de Kalman extendido GNSS a bordo para HEO y transferencia lunar; y navegación relativa de formación. Comparado con el folleto del Space Service Volume del ICG bajo un preregistro confirmado antes de la ejecución: las constantes de potencia mínima radiada y el umbral lunar coinciden, los demás umbrales no se alcanzan según la lectura preregistrada (casi todos por el ángulo de haz inconsistente de GLONASS en el folleto), y el sustituto paramétrico de lóbulos laterales no reproduce los patrones medidos de los paneles GPS. Todo sigue siendo MODELLED (<a2><c3/></a2>).

# text
# c1: lunar-infrastructure
# c2: study
# c3: docs/LUNAR-INFRASTRUCTURE.md
# c4: xval/lunar-infra/PREREGISTRATION.md
# c5: xval/lunar-infra/RESULTS.md
seg-3281ef6e21eb = <b>Órbita y superficie lunares como infraestructura de navegación y geodésica (<c1/>).</b> Un nuevo tipo de escenario con cinco estudios seleccionados por <c2/> (<a1><c3/></a1>): coherencia de una determinación de órbita GNSS terrestre a bordo en una órbita de halo casi rectilínea frente a una determinación independiente de distancia y velocidad de distancia desde tierra; fase de portadora de doble diferencia conjunta de estación de superficie y orbitador con fijación de enteros mediante LAMBDA; información de Fisher del datum lunar de siete parámetros con y sin distancias entre orbitador y superficie; desfases entre técnicas GNSS, VLBI y telemetría láser frente al vínculo local; y sensibilidad a h2, k2, l2 y a la libración física. MODELLED, con entradas ILLUSTRATIVE: la numérica se comprueba con programas independientes de numpy y scipy, y nada se compara con una medición de una magnitud lunar. Los umbrales se fijaron en <c4/> y dos enmiendas declaradas. Tres son NOT MET y cada una está fijada por una prueba que afirma el fallo: C3 (un error de fuerza inyectado no se detecta a la tasa preregistrada), Q3 (la tasa de éxito con bootstrap difiere de la referencia independiente de numpy en { "1.7e-6" } frente a un umbral de { "1e-9" }, por la aproximación de la CDF normal de LAMBDA) y la mitad de traza de G3 (añadir una familia de distancias no siempre reduce la traza de la pseudoinversa). Los demás se alcanzan (<a2><c5/></a2>).

# text
# c1: cislunar-observability
# c2: kshana scenarios/cislunar-observability.toml
# c3: cislunar-arc-recovery
seg-022859135e79 = <b>Un sexto artículo en la tabla de investigación.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) muestra que la dilución de la precisión no está definida para el seguimiento cislunar solo por distancia y utiliza en su lugar el gramiano de observabilidad sobre cuatro órbitas retrógradas distantes planas: solo con distancia el rango es { "2" } de { "4" } en una instantánea y requiere un arco de unas { "2.09" } h, la velocidad de distancia (Doppler) da rango { "4" } al instante, y co-estimar una estación con los estados de los satélites y los relojes sigue siendo deficiente en rango por uno sin un observable interferométrico externo. Sus cifras las regenera el tipo de escenario <c1/> (<c2/>); <c3/> prueba el umbral con un estimador independiente. La tarjeta de investigación del README, los README de crates, npm y PyPI y el generador lo incluyen.

# text
seg-d74a1b2dcb38 = El árbitro neutral, hecho medible.

# text
# c1: kshana jammertest import
# c2: kshana jammertest score
# c3: docs/JAMMERTEST.md
# c4: xval/jammertest-score/
seg-bf568567fe06 = <c1/> lee el catálogo de ensayos y el plan de transmisión publicados de NPRA Jammertest como verdad programada (identificadores del catálogo conservados) y <c2/> puntúa un registro de receptor frente a él por ensayo (latencia de detección, alarmas omitidas, falsas alarmas, tiempo de recuperación), opcionalmente como paquete de evidencias firmado (<a1><c3/></a1>). Los umbrales de puntuación se preregistraron antes de cualquier ejecución puntuada (<c4/>). En el conjunto de datos de JammerTest { "2024" } (obtenido, nunca incorporado al repositorio), la regla preregistrada de datos mínimos falló tanto en la primera ejecución como en la revisión del tratamiento de datos, de modo que ningún umbral es evaluable y no se afirma nada; ambas ejecuciones están registradas y fijadas. MODELLED: el calendario son las ventanas registradas del conjunto de datos, no horas de emisión grabadas. El conjunto NMEA de SimulaMet de { "2025" } no se adapta (su página no indica ninguna licencia).

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
# c4: sbf-tools
# c5: receiver-trust live --serial
seg-0a2bcad8d645 = <b>Los propios indicadores del receptor, junto a los de Kshana.</b> UBX-NAV-STATUS <c1/> y UBX-SEC-SIG se leen en <c2/> en cada época, y la comparación <c3/> del resultado los contrasta con los monitores de Kshana (ambos, solo el receptor, solo Kshana, ninguno); no genera ninguna alarma ni cambia ninguna puntuación. Se suman un lector SBF de Septentrio (PVTGeodetic, MeasEpoch, RFStatus, solo lectura, sobre el crate <c4/> con licencia MIT) y <c5/> (un flujo NMEA serie o USB, solo lectura; nunca escribe en un receptor).

# text
# c1: docs/TIMING-HIL.md
# c2: docs/HARDWARE-SAFETY.md
# c3: holdover-test
# c4: clock_log
# c5: ptp4l
# c6: phc2sys
# c7: ts2phc
# c8: tracking
# c9: statistics
# c10: iq scene --format sdrx
# c11: iq monitor --follow
# c12: compliance-report
# c13: lab-attestation
# c14: HARDWARE-SAFETY.md
seg-90d9927fe3e2 = <b>Temporización y seguridad del hardware</b> (<a1><c1/></a1>, <a2><c2/></a2>). El tipo de escenario <c3/> puntúa un ensayo de holdover de un sistema de temporización (GNSS retirado por el operador, holdover, recuperación) a partir de un registro medido del error de tiempo, medido frente a las máscaras de ITU-T de tablas públicas. <c4/> lee registros de linuxptp (<c5/>, <c6/>, <c7/>) y de chrony (<c8/>, <c9/>). <c10/> escribe metadatos ION GNSS SDR y <c11/> monitoriza una grabación SigMF mientras crece (solo recepción). <c12/> incorpora el NIST IR 8323r1 Foundational PNT Profile ({ "15" } filas parafraseadas, aporta evidencias a favor de). Un paquete de evidencias puede registrar el <c13/> del operador en su manifiesto firmado, nunca verificado; las etapas de hardware { "0" } a { "4" } y las notas legales están en <c14/> (pendiente de revisión legal). No existe ninguna vía de transmisión de ningún tipo.

# text
# c1: kshana bench
# c2: bench/SPEC.md
# c3: docs/BENCH.md
# c4: xval/bench/PREREGISTRATION.md
# c5: agc_k_sigma
# c6: xval/bench/RESULTS-v2.md
# c7: bench_score
# c8: bench_leaderboard
# c9: score_benchmark
# c10: render_leaderboard
seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): tareas, particiones y métricas fijas para la detección de interferencias GNSS en registros de receptor (JammerTest { "2024" }) e IQ, predicción de holdover de temporización (relojes IGS) y la brecha de optimismo fuera de distribución; manifiestos de particiones con hashes fijados y scripts de obtención (sin datos incorporados), un conjunto reservado sellado mediante compromiso y revelación, un esquema de archivo de resultados y una página estática de clasificación. Líneas base con umbrales preregistrados en <c4/>: umbrales del puntuador alcanzados, C1 a C3 alcanzados, D2 alcanzado; <b>A2 NOT MET</b> (AUC de <c5/> { "0.766" } frente a al menos { "0.80" } en la partición de prueba), <b>D1 NOT MET</b> (mayor brecha { "0.0301" }) y <b>tarea (b) R1 NOT MET</b> (arrastrado, no se volvió a ejecutar), cada uno fijado (<c6/>). Toda puntuación es MODELLED. Python <c7/>, <c8/>; WebAssembly igual; MCP <c9/>, <c10/>.

# text
# c1: kshana interference-map daily
# c2: sensitivity
# c3: docs/observatory/METHOD.md
seg-04c0d6161c7a = <b>Observatorio de interferencias</b> (<c1/>, <c2/>, <a1><c3/></a1>): un GeoJSON diario reproducible, un PNG y un JSON de informe de incidentes con tres estados (degradado, no degradado, no observado), un retraso mínimo de { "24" } h, celdas de { "0.5" } grados o más gruesas, ninguna causa atribuida y datos de OpenSky rechazados; un estudio de sensibilidad de los parámetros preregistrados; un catálogo retrospectivo del Báltico de 30 días de adsb.lol.

# text
# c1: receiver-trust
# c2: docs/MACHINE-INPUTS.md
# c3: [log] format
# c4: rtklib-pos
# c5: .pos
# c6: novatel
# c7: BESTPOS
# c8: RANGE
# c9: RXSTATUS
# c10: self_report
# c11: receiver-self-report
# c12: rtcm3
# c13: NOTICE
# c14: gnss-sdr
# c15: integrations/gnss-sdr/relay.py
seg-497ae18bfb03 = <b>Entradas de máquina y de sensor para <c1/></b> (<a1><c2/></a1>). Nuevos valores de <c3/>, todos de solo lectura, MODELLED, con fixtures escritos para la ocasión y sin datos incorporados: <c4/> (archivos de solución <c5/> de RTKLIB), <c6/> (<c7/> ASCII y binarios de OEM7, C/No de <c8/> y <c9/>; el indicador de jammer del receptor pasa a ser el <c10/> de la época, contrastado con las alarmas de Kshana mediante la comparación <c11/>), <c12/> (C/N0 MSM4 y MSM7 para GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou y NavIC; disposiciones de las tablas de pyrtcm con licencia BSD, cuyo aviso está en <c13/>, no del estándar RTCM) y <c14/> (mensajes de GNSS-SDR Monitor y PVT-monitor como líneas JSON, retransmitidos por <c15/>).

# text
seg-22e8b434782f = Registros IMU como segundo sensor.

# text
# c1: [log.imu]
# c2: csv
# c3: euroc
# c4: heading-course
# c5: kshana imu-fit
# c6: imu_fit
# c7: imu_fit
# c8: fit_imu_log
# c9: /kshana-fit-imu
# c10: hybrid
# c11: fusion
# c12: [accel_classical]
seg-5491196d6421 = <c1/> (<c2/> o <c3/>) integra la velocidad de guiñada del giróscopo en el rumbo que lee el monitor <c4/>; en línea en cada superficie y transportado a través de los paquetes de evidencias. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plugin <c9/>, una acción de JetBrains) ajusta los parámetros del acelerómetro y del giróscopo de los escenarios <c10/> y <c11/> a partir de un registro estacionario mediante desviación de Allan e imprime una tabla <c12/> con el SHA-256 del registro en su procedencia.

# text
# c1: integrations/ros2/kshana_trust
# c2: ublox_ubx_msgs
# c3: gnss_lib_py
# c4: integrations/gnss_lib_py
seg-f48fdf6252cd = <b>Integraciones:</b> un paquete ROS { "2" } (<c1/>: NavSatFix y <c2/> como entrada, temas de confianza como salida; su puente sin ROS se prueba contra el motor real, el propio nodo no se ha ejecutado en un grafo ROS en vivo), un puente con <c3/> (<c4/>, dependencia MIT, opcional) y un relé de GNSS-SDR.

# text
# c1: kshana trust-telemetry --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: format = "mqtt"
seg-1a8727ad42bb = <b>Exportador MQTT de Home Assistant</b> para la telemetría de confianza: <c1/> y <c2/> (mensajes de descubrimiento y un documento de estado JSON; solo publicación, sin credenciales ni TLS), y <c3/> como texto en Python, WebAssembly y MCP.

# text
seg-f1cb2c2881c9 = Siete filas del registro MODELLED para lo anterior. Nada de esto es VALIDATED: no se leyó ninguna captura de un receptor real, estación base, IMU, ejecución de GNSS-SDR, grafo ROS ni broker MQTT.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: duration_h
# c4: step_s
# c5: seed
# c6: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-12c7a28c80b5 = <b>Margen del enlace óptico a lo largo del tiempo.</b> El tipo de escenario <c1/> admite una tabla opcional <c2/> (<c3/>, <c4/>, <c5/>) y entonces también escribe, por sitio, una realización con semilla del modelo de sitio declarado a lo largo del tiempo: episodios de nubes, una columna de agua líquida por episodio, una muestra de centelleo gamma-gamma por paso y, a partir de ellas, el margen del enlace, los desvanecimientos por nubes y por centelleo y el indicador de enlace activo, con la disponibilidad realizada, la fracción de nubes, el número de interrupciones y la interrupción más larga. MODELLED (una extracción del modelo, no el clima; sin referencia independiente externa). Sin la tabla, el resultado es el documento { "0.37" }. Los dos escenarios ópticos incluidos llevan la tabla ({ "336" } h, { "600" } s, semilla { "37" }). Umbrales preregistrados en <c6/> antes de la primera ejecución.

# text
seg-78524dbb3bd2 = Especificación de condiciones de ensayo e ida y vuelta de laboratorio.

# text
# c1: kshana.test-conditions/1
# c2: docs/spec/TEST-CONDITIONS.md
# c3: recording.kind = "receiver-log"
# c4: kshana bench-export
# c5: <base>.conditions.json
# c6: kshana evidence round-trip
# c7: evidence_round_trip
# c8: create_round_trip_pack
# c9: /kshana-evidence-pack
seg-fbf034925641 = <c1/> se publica como <a1><c2/></a1> con un esquema JSON, e incorpora <c3/>. <c4/> también escribe <c5/>. <c6/> construye un paquete firmado que enlaza el hash del escenario, el hash de las condiciones declaradas, el hash del registro del receptor y la puntuación frente a los eventos declarados, y rechaza condiciones que no coincidan con los eventos de puntuación. Ejemplo desarrollado con gps-sdr-sim que solo escribe un archivo; la reproducción es responsabilidad del operador y nunca se automatiza. Python <c7/>, MCP <c8/>, plugin <c9/>.

# text
# c1: kshana standards-pack
# c2: standards/
# c3: compliance-report
seg-8bda4472d561 = <b>Paquetes de normas</b> (<c1/>, <c2/>): los perfiles de ensayo del marco Resilient PNT del DHS para los niveles { "1" } a { "4" }, los niveles de precisión y la evaluación de integridad de IMO MSC.1/Circ.1575 y monitorizar, evaluar y mitigar del Apéndice F de ICAO Doc { "9849" }, cada uno un conjunto de escenarios puntuados frente a umbrales establecidos antes de la ejecución, con las filas de compliance-report a favor de las cuales aportan evidencias. Los fallos constan y están fijados: DHS L4-T1 y las cuatro pruebas de precisión de IMO. El propio Doc { "9849" } no se leyó (de pago); el paquete de ICAO sigue la propia presentación del Plan de mitigación de RFI de ICAO. <c3/> incorpora una sección de standards-pack. Todo MODELLED.

# text
# c1: docs/LUNANET-AFS.md
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: kshana iq
# c5: kshana lunanet-afs-check
# c6: spec
# c7: symbols
# c8: generate
seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): códigos Gold AFS-I y Weil AFS-Q para PRN { "1" } a { "210" }, señales <c2/> y <c3/> en <c4/>, el código BCH SB1, CRC-24Q y entrelazador, y <c5/> (<c6/>, <c7/>, <c8/>), fijados a LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } de enero de { "2025" }). Códigos VALIDATED frente a las tablas impresas del documento (que lo marca como TBC); una columna terciaria impresa (PRN { "147" }) es probablemente una errata y el fallo está fijado. La codificación LDPC de las subtramas { "2" } a { "4" } no está implementada.

# text
# c1: notebooks/course/
seg-5a5720500b6d = <b>Cuadernos del curso</b> (<c1/>): jamming, spoofing, holdover, integridad, OSNMA y mapa de interferencias, cada uno con ejercicios.

# text
# c1: xval/araim-m3/
# c2: src/bin/gen_araim_m3_study.rs
seg-3d543433051c = <b>Estudio de URA máxima del Hito { "3" } de ARAIM del WG-C UE-EE. UU.</b> (<c1/>, <c2/>), que sustituye al plan retirado de la "Table A-3"; MODELLED con las desviaciones declaradas.

# text
# c1: docs/drafts/
# c2: LICENSES/
seg-4f1f786e2658 = <b>Borradores para aprobación del propietario</b> en <c1/>: artículo de JOSS, enmienda de la carta del TSC, proceso de registro de referencias independientes y una propuesta de división de <c2/>. Nada de ello está adoptado.

# text
# c1: optical-atmosphere
# c2: [timeseries]
# c3: holdover-test
# c4: record.series
# c5: .pos
# c6: /benchmark
# c7: kshana bench leaderboard
seg-49a758039871 = <b>Vistas de Studio para las funciones de { "0.38" }</b> (kshana.dev/studio/). Reproducción del puente (dos ejecuciones sintéticas sobre un mismo reloj: trayectoria, puntuación de confianza, los satélites que oye el registro y el veredicto, con los propios indicadores del receptor junto a las alarmas de Kshana); PNT óptico (los dos escenarios <c1/>, con una realización con semilla <c2/> opcional, MODELLED); ensayo de holdover (el resultado de <c3/> medido frente a las máscaras de ITU-T, dibujado a partir de la propia <c4/> del resultado); un visor del observatorio de interferencias que abre los archivos que usted ha producido y no incluye ninguno; en la página Herramientas, un puntuador de Jammertest, un ajuste de IMU y MQTT como formato de telemetría; y en Confianza un selector de formato de registro (<c5/> de RTKLIB, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) con un archivo IMU opcional. Cada vista lee archivos en el navegador y no sube nada; cada cifra conserva la etiqueta que le asigna el registro, y cada una lleva la declaración consultiva. La página del sitio <c6/> muestra el fragmento de <c7/>.

# text
# c1: KSHANA_EXACT_PINS=1
# c2: scripts/gate.sh
# c3: tests/exact_pin_gate_guard.rs
# c4: scripts/oracle-triage.sh
# c5: docs/LOCAL-ORACLE-TESTS.md
# c6: .github/workflows/oracle-macos.yml
seg-91f6beb29f8e = <b>Incidencia #36: capas de fijación exactas al byte.</b> Las capas de fijación exactas al byte solo se ejecutan en un host declarado como línea base (<c1/>, establecido por <c2/>), no en todo Mac con Apple silicon, porque la biblioteca matemática de Apple difiere entre versiones de macOS; la capa portable se ejecuta en todas partes, y <c3/> impide que una capa exacta al byte vuelva a condicionarse solo a la plataforma. Las comparaciones con la referencia independiente en sí pasan en macOS. No se volvió a tomar ningún literal ni se cambió ninguna tolerancia. <c4/> y <a1><c5/></a1> explican cómo clasificar una diferencia; <c6/> es un diagnóstico manual y semanal, no una puerta de control.

# text
# c1: web/studio/lib/trust-open.mjs
seg-15070f7dcc0a = <b>CodeQL: un patrón sin anclar en el asistente trust-open de Studio</b> ahora coincide con la cabecera completa (<c1/>).

# text
# c1: check
seg-56856063519f = <b>CI: disco del runner.</b> El trabajo <c1/> compila los perfiles de desarrollo y de prueba sin información de depuración, de modo que el enlazado ya no llena el disco.

# text
seg-38c59868835e = <b>Guardas de código fuente.</b> Todo archivo fuente que contiene fixtures de prueba con valores fijados declara su ámbito de fijación, y las pruebas que escriben archivos temporales usan una ruta única por llamada, de modo que las ejecuciones en paralelo no pueden colisionar.

# text
# c1: docs/SCENARIOS.md
# c2: timeseries
seg-884f693585fa = <b><c1/></b> se regenera para el campo opcional <c2/> de optical-atmosphere.

# text
# c1: verifyPlugin
# c2: FileEditorManager.openFile
# c3: OpenFileDescriptor
# c4: verifyPlugin
seg-e16d328f3967 = <b>Plugin de JetBrains: sin uso de API de plataforma obsoleta ni prevista para su eliminación.</b> El IntelliJ Plugin Verifier (<c1/>) frente a la compilación { "263" } de IntelliJ IDEA ({ "2026.3" }: { "263.6800.24" } y { "263.7031.23" }) encontró una llamada obsoleta, <c2/>, en Insert Example; ahora abre el nuevo archivo con <c3/>. El plugin es compatible con { "2024.3" } (la since-build, sin cambios) y con ambas compilaciones { "263" }, sin problemas. CI ahora ejecuta <c4/> y falla ante problemas de compatibilidad y ante cualquier uso de API prevista para su eliminación.

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
# c3: docs/design/optical-atmosphere-0.37.md
# c4: optical_linkbudget
# c5: xval/optical-atmosphere/PREREGISTRATION.md
seg-07ce053c906a = <b>PNT óptico a través de la atmósfera</b> (tipo de escenario <c1/>, <a1><c2/></a1>, nota de diseño <c3/>). Para un enlace óptico y un conjunto de sitios terrestres, informa de la pérdida en aire despejado dependiente de la longitud de onda y de la elevación, el estado de turbulencia de Hufnagel-Valley (varianza de Rytov, índice de centelleo, desvanecimientos gamma-gamma, promediado de apertura), la disponibilidad frente al margen del enlace según un clima de nubes declarado, el margen necesario para disponibilidades objetivo y el techo que ningún margen supera, la distribución de la duración de las interrupciones, el error de temporización y de distancia por interrupción mediante el modelo de holdover del reloj, la diversidad de sitios correlacionada por distancia, y ganancias hipotéticas por un cambio de longitud de onda, una apertura mayor, una reducción del centelleo con óptica adaptativa y margen adicional. <c4/> incorpora un presupuesto consciente de la atmósfera; sin él, su salida es idéntica bit a bit a la de { "0.36" } (umbral A5). Dos escenarios incluidos llevan climas de nubes ILLUSTRATIVE. MODELLED: tres filas del registro. La numérica alcanza los umbrales A1 a A6 preregistrados en <c5/> frente a un programa independiente con mpmath; eso comprueba la implementación de las fórmulas declaradas, no la atmósfera, y no se ha comparado ningún registro medido de disponibilidad, por lo que ninguna fila es VALIDATED. El umbral A4 se falló al principio por { "3e-9" } porque la CDF normal en uso era una aproximación de { "1.5e-7" }; se sustituyó la CDF y el umbral se dejó tal como se registró. Las compilaciones nativa y WebAssembly devuelven documentos idénticos byte a byte para ambos escenarios incluidos (A7, ejecutado sobre el commit de integración { "0.37.0" }).

# text
# c1: docs/design/DETECTION-ROC.md
# c2: roc_window_s
# c3: roc.json
seg-eb589aff44ad = <b>ROC de detección de los monitores IQ</b> (PRO-32, <a1><c1/></a1>). Una campaña con monitores conserva el máximo del estadístico de cada prueba sobre las ventanas de eventos declarados (positivas) y sobre ventanas en mosaico fuera de los eventos (negativas, <c2/>). El informe las agrupa por tipo de alarma en una ROC con su AUC y el punto de funcionamiento en el umbral configurado, como <c3/> y una sección del informe. En campañas sintéticas se alcanza la comprobación de nivel de azar. El umbral de AUC de C/N0 ({ "0.95" }) no se alcanza ({ "0.79" }), porque las ventanas negativas inmediatamente posteriores a un evento heredan el decaimiento del CUSUM procedente de la detección; queda registrado. MODELLED.

# text
# c1: docs/design/MONITORS-IN-CAMPAIGN.md
# c2: [monitors]
# c3: 2Q(k)
seg-d25a34e23f1a = <b>Monitores IQ en la campaña de reproducción de laboratorio</b> (PRO-31, <a1><c1/></a1>). Una tabla opcional <c2/> en un archivo de campaña ejecuta los monitores IQ en la pasada única del ejecutor: potencia y espectral tras cada cadena de front end, y C/N0, SQM y enganche por canal seguido. Sus alarmas se puntúan frente a los eventos declarados: detectado u omitido, tiempo de detección y falsas alarmas por hora de exposición. Se declara la cifra de falsa alarma de forma cerrada de cada prueba, incluida una nueva cifra gaussiana bilateral para las pruebas SQM (<c3/>). Sin la tabla no cambia nada. En campañas sintéticas se alcanzan los umbrales de falsa alarma de potencia y SQM y el de falsa alarma de C/N0; se detectan { "18" } de { "18" } atenuaciones, pero la cota del tiempo de detección, por construcción inferior a una muestra del detector, no se alcanza y queda registrada. MODELLED; fila del registro "Monitores IQ puntuados en campañas de reproducción de laboratorio".

# text
# c1: tests/iq_labfit_followup.rs
# c2: labfit-iq-followup
# c3: docs/design/LABFIT-FROM-IQ.md
# c4: docs/design/evidence/labfit-followup/RESULTS.md
seg-8eb0f650065e = <b>Ajuste de laboratorio a partir de campañas IQ, seguimiento</b> (<c1/>, trabajo de CI <c2/>). Prueba las dos hipótesis que el §{ "13.6" } de <c3/> dejó abiertas, frente a umbrales preregistrados en 1e532f84. Añade dos campañas sintéticas: S, con un J/S escalonado (semilla 2026_1014), y R, una rampa nueva (semilla 2026_1015). Los resultados están en <c4/>.

# text
# c1: δ_eff
seg-ce60405d0005 = S1 alcanzado: con cada nivel de J/S mantenido, <c1/> se recupera dentro de +{ "0.185" } dB. El error de −{ "1.1" } dB de las campañas de rampa es retardo del estimador.

# text
seg-ea9f206c2999 = S2 no alcanzado, fijado por una prueba que afirma el fallo: (d) tal como está escrito, en la campaña escalonada, se sostiene para el modelo de lazo de seguimiento ({ "0.45" } dB) pero no para el empírico ({ "6.42" } dB).

# text
seg-fab0653558e4 = R1 alcanzado: en la nueva campaña de rampa, (d) con los tiempos de permanencia de caída ajustados multiplicados por la tasa de rampa de cada evento queda dentro de { "1" } dB para ambos modelos.

# text
seg-24c6725c2c7d = Los fallos de (a′) y (d) se replican en R.

# text
# c1: step
seg-7cbbce356973 = Una campaña ahora puede declarar su J/S como un perfil <c1/> en el arnés de pruebas.

# text
seg-34007ba58a9f = Ningún veredicto del §{ "13" } cambia, y la fila del registro sigue siendo MODELLED.

# text
# c1: [design.carrier] fll_pull_in_max_s
# c2: LoopConfig::fll_pull_in_max_s
# c3: fll_assist = "pull-in"
seg-df2c3f2532d6 = <b>Enganche inicial del FLL limitado, opcional</b> (DS-LOOP-05): una nueva clave de diseño de lazo <c1/> (s), en Rust <c2/>. Con <c3/> fuerza el traspaso del FLL al PLL transcurrido ese tiempo, sea cual sea el PLI. Sin definir por defecto y entonces fuera del hash de diseño; el diseño predeterminado y su hash no cambian.

# text
seg-ae2794b2d3d5 = Comprobado frente a umbrales preregistrados en 58789af0, sobre una verdad inyectada. El control se alcanza: el valor predeterminado nunca traspasa en { "9" } de { "10" } semillas a { "33" } dB-Hz.

# text
seg-6d9483874b35 = No alcanzado: con un límite de { "1.0" } s, { "16" } de { "20" } ejecuciones mantienen el enganche a { "33" } dB-Hz y { "8" } de { "20" } a { "31" } dB-Hz; las demás alternan entre traspasos forzados y el retorno del FLL. El jitter de fase es { "1.8" }× el del PLL solo a { "33" } dB-Hz.

# text
seg-deeefaf50e3e = El piso de enganche inicial de ~{ "35" } dB-Hz sigue siendo el límite documentado del valor predeterminado.

# text
seg-780de73c01e1 = MODELLED; fila del registro "Enganche inicial del FLL limitado por debajo del piso de traspaso FLL-PLL del diseño predeterminado (opcional)".

# text
# c1: jamming
seg-ace6b53749bd = <b>Histéresis de adquisición y cuantificador del front end en el tipo de escenario jamming</b> (CAP-06c): dos secciones opcionales para un escenario <c1/>.

# text
# c1: [acquisition]
# c2: acquisition_threshold_dbhz
# c3: reacquisition_delay_s
# c4: epochs[].sats[].acquired
# c5: epochs[].acquired
# c6: fom.availability_acquired
seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, en o por encima del umbral de seguimiento) y <c3/> (s, por defecto { "0" }). Un satélite se adquiere en o por encima del umbral de adquisición, una vez que ha estado sin adquirir durante el retardo. Se mantiene mientras esté en o por encima del umbral de seguimiento. Salidas: <c4/> (true/false), <c5/> (recuento) y <c6/> ({ "1" }).

# text
# c1: [front_end]
# c2: adc_bits
# c3: bandwidth_mhz
# c4: front_end
# c5: agc_gain_reduction_db
# c6: 10·log10(1 + J/N)
# c7: quantiser_loss_db
# c8: loss_model
seg-b568f542e23a = <c1/>: <c2/> ({ "1" } a { "16" }) y <c3/> (MHz, por defecto el doble de la velocidad de chip). Produce un bloque <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, descontada del C/N0 efectivo de cada enlace) y <c8/>. La pérdida es la de entrada gaussiana, señalada como no válida para jammers CW, de banda estrecha y de barrido.

# text
seg-0dad81736863 = Sin las secciones, todas las salidas son idénticas byte a byte.

# text
seg-92007bfb6680 = Comprobado frente a umbrales preregistrados en 70c72fcc. La pérdida del cuantificador está dentro de { "0.0007" } dB de un Monte Carlo independiente, y la lectura del AGC dentro de { "0.012" } dB del lazo de AGC de la capa IQ.

# text
seg-973e451df99d = Las ejecuciones de histéresis registradas no fueron informativas (todos los enlaces perdidos), por lo que ese umbral es NOT MET. Un conjunto de ejecuciones suplementario registrado en { "37793290" } lo alcanza: cada indicador es igual a un recálculo independiente, y { "732" } de { "1824" } enlaces muestran la histéresis.

# text
seg-912e9f1a4d5b = Hallazgo: con un jammer CW un ADC de 1 bit pierde unos { "5" } dB más que la cifra gaussiana.

# text
seg-a19aee81b581 = MODELLED; fila del registro "Histéresis de adquisición y cuantificador del front end en el tipo de escenario jamming frente a recálculos independientes".

# text
# c1: [terrain]
# c2: jamming
seg-97f43a4fe71d = <b>Sombra del terreno sobre el jammer en el tipo de escenario jamming</b> (CAP-06b): una sección opcional <c1/> en un escenario <c2/> con un jammer. Campos:

# text
# c1: dem_hgt
# c2: .hgt
seg-6d59a2857ab9 = <c1/>: una tesela SRTM <c2/>, relativa al directorio de trabajo;

# text
# c1: samples_per_side
# c2: ll_lat_deg
# c3: ll_lon_deg
seg-fa5b15500405 = <c1/>, <c2/> y <c3/> (deg): el tamaño y la esquina de la tesela;

# text
# c1: geoid_undulation_m
# c2: k_factor
# c3: profile_step_m
seg-09a35655f010 = <c1/> (m, por defecto { "0" }), <c2/> (por defecto 4/3) y <c3/> (m, por defecto { "30" }).

# text
seg-ad58fe7ff627 = El motor muestrea el perfil del terreno por círculo máximo entre el jammer y el receptor y halla el filo de cuchillo dominante. La potencia recibida del jammer, y con ella cada J/S, se reduce en la pérdida por un único filo de cuchillo de ITU-R P.526-15 §{ "4.1" }.

# text
# c1: jammer_terrain
# c2: nu_max
# c3: diffraction_loss_db
# c4: obstacle_distance_m
# c5: obstacle_terrain_m
# c6: path_length_m
# c7: profile_points
seg-001d7b88b26d = El resultado incorpora un bloque <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) y <c7/> (recuento).

# text
seg-b9696f5eda4b = Sin la sección, todas las salidas son idénticas byte a byte.

# text
# c1: ν
seg-593b6a5b4480 = Comprobado frente a umbrales y diez ubicaciones preregistrados en 92cd2bfd, sobre la tesela SRTM real confirmada de Death Valley, frente a un recálculo independiente con numpy. Todos alcanzados: peor diferencia { "1.6e-10" } en <c1/> y en la pérdida (umbral { "1e-9" }), la pérdida monótona respecto a la altura del jammer y la pérdida que reduce exactamente el J/S.

# text
seg-62e07defd715 = MODELLED; fila del registro "Sombra del terreno sobre el jammer en el tipo de escenario jamming frente a un recálculo independiente con numpy sobre una tesela SRTM real".

# text
# c1: [crpa]
# c2: jamming
# c3: elements_enu_m
# c4: weighting
# c5: "null-steering"
# c6: "mvdr"
# c7: bandwidth_mhz
seg-378e9052e2c4 = <b>Ganancias de antena CRPA en el tipo de escenario jamming</b> (CAP-06a): una sección opcional <c1/> en un escenario <c2/>. Campos: <c3/> (posiciones de los elementos en este-norte-arriba local, m), <c4/> (<c5/> o <c6/>) y <c7/> (ancho de banda de ruido de MVDR, MHz, por defecto el doble de la velocidad de chip).

# text
# c1: ‖w‖²
# c2: |wᴴa_j|²
seg-ca39fefc0fb3 = Cada canal forma un haz sin distorsión hacia su satélite. El ruido del enlace se escala por <c1/> y el jammer por <c2/> antes de la ecuación C/N0 antiinterferencia existente.

# text
# c1: crpa
# c2: array_noise_gain_db
# c3: jammer_gain_db
seg-1f1ddc11ad94 = Cada enlace incorpora un bloque <c1/>: <c2/> (dB) y <c3/> (dB).

# text
# c1: kshana
# c2: api::run_toml
# c3: jamming::run_jamming
seg-790ecc6a1bd4 = Una sección no válida (una lista de elementos vacía, una ponderación desconocida, un ancho de banda no positivo) es un error, tanto a través de <c1/> y <c2/> como de <c3/>.

# text
seg-2464d9dde85f = Comprobado frente a umbrales preregistrados en 08d83b4d. Alcanzados: aditividad (tras una corrección: la primera compilación añadió las nuevas unidades a la tabla de unidades de cada ejecución de jamming); un elemento no es una agrupación; ganancia de ruido y C/N0 efectivo frente a un recálculo independiente con numpy dentro de { "1e-9" } dB; MVDR tiende al nulo con un JNR alto.

# text
# c1: docs/revisions/STUDIO15-batch4-rebaseline.md
seg-c04495f7a65a = No alcanzado: la ganancia del jammer con MVDR en { "194" } de { "456" } enlaces con las matemáticas portables de { "0.36" } ({ "202" } con las matemáticas del host; <c1/>) (peor caso { "1.7e-6" } dB). Los residuos de −{ "100" } a −{ "188" } dB están por debajo de la resolución de float64 en ese umbral, y numpy discrepa de sí mismo en el mismo orden.

# text
seg-c10e1c72eb15 = MODELLED; fila del registro "Ganancias de antena CRPA en el tipo de escenario jamming frente a un recálculo independiente con numpy".

# text
# c1: kshana iq track
seg-0a3adfa7271c = <b>Motor de seguimiento IQ frente a GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> y GNSS-SDR siguen las mismas grabaciones independientes de numpy de GPS L1 C/A a { "30" } hasta { "45" } dB-Hz.

# text
seg-cc73857e38e8 = Umbrales preregistrados en 48edd4a5. La calibración registrada falló por un traspaso erróneo de GNSS-SDR (F3), de modo que la Enmienda { "1" } (1e4288c4) añade un FLL solo de enganche inicial a ambos receptores, confirmada antes de cualquier grabación de prueba.

# text
seg-1d651ff134f9 = Alcanzado: el jitter de portadora y de código y el Doppler coinciden dentro del { "5" } % en cada C/N0.

# text
seg-bc9c9a0247d1 = No alcanzado: el C/N0 NWPR del motor lee de { "2.3" }–{ "7.1" } dB por debajo del SNV de GNSS-SDR (F4, un límite conocido del estimador; M2M4 está a { "0.06" } dB de la verdad); los indicadores de enganche difieren por definición (F5); un desacuerdo de deslizamiento a { "30" } dB-Hz (F6).

# text
seg-7c32867b5c27 = MODELLED; fila del registro "Motor de seguimiento IQ frente a GNSS-SDR { "0.0.19" } con grabaciones independientes".

# text
seg-6ba057fab559 = <b>Dos filas VALIDATED para códigos de la capa IQ</b> (DS-GIQ-06b, PRO-39).

# text
seg-55524624777b = <b>BeiDou B1I.</b> Los { "63" } códigos primarios B1I coinciden chip a chip con el generador independiente de GNSS-SDR { "v0.0.19" } (umbral preregistrado en 911106d1). Solo se confirma la salida de ese programa: los códigos PRN B1I que define el ICD público, como prefijo y hash.

# text
seg-37437a09dd67 = <b>GPS L1C.</b> Los { "126" } códigos L1CP/L1CD y las { "63" } superposiciones L1CO coinciden con las columnas de comprobación que imprime IS-GPS-800J, y la secuencia de Legendre calculada coincide con su Tabla 6.2-1 (umbrales preregistrados en fe372e26).

# text
seg-f445784a7f2d = Filas: "Códigos de distancia primarios BeiDou B1I frente a un generador independiente" y "Códigos de distancia y de superposición GPS L1C frente a las columnas de comprobación impresas de IS-GPS-800J".

# text
# c1: glonass-l1of
# c2: glonass-l2of
# c3: glonass-l1of-k<K>
# c4: beidou-b1i
# c5: beidou-b1c
# c6: beidou-b2a
# c7: beidou-b3i
# c8: galileo-e6
seg-001f48d86a3c = <b>Bandas GLONASS, BeiDou y Galileo E6 en el modelo de espectro</b> (CAP-12, señales): nuevos nombres de banda <c1/> y <c2/> (cualquier canal FDMA como <c3/>, K = −{ "7" } a { "6" }), <c4/>, <c5/>, <c6/>, <c7/> y <c8/>. Cada una lleva su portadora, modulación y potencia mínima recibida del ICD. Son opcionales por nombre: el conjunto de bandas predeterminado y todas las salidas existentes no cambian.

# text
seg-158a6ec19d6b = Comprobado frente a umbrales preregistrados en 5806f28b: se alcanzan los valores del ICD, los nulos, el compuesto B1C y la ruta C/N0.

# text
seg-805092ae8ca2 = Dos umbrales no se alcanzaron. El umbral de área unitaria era inalcanzable tal como estaba escrito (F1). Las formas de onda B1I y B1C de la capa IQ coinciden con el modelo solo promediadas por banda, debido a los espectros de líneas irregulares de sus códigos (F2).

# text
seg-db88f07d97bb = MODELLED; fila del registro "Modelo de espectro: bandas GLONASS, BeiDou y Galileo E6 (opcional)".

# text
# c1: iq::acq::ca_cfar
# c2: ca_cfar_cells
# c3: M
# c4: ca_cfar_pfa
# c5: ca_cfar_alpha
seg-b0147cf3acc8 = <b>Opción CFAR de promediado de celdas en la adquisición IQ</b> (PRO-37): <c1/> y <c2/> deciden sobre una cuadrícula de adquisición comparando cada celda con la media de las celdas de referencia de su fila Doppler. El umbral procede de la probabilidad de falsa alarma de forma cerrada del CA-CFAR para <c3/> bloques no coherentes (<c4/>, <c5/>), de modo que la decisión no depende de la normalización de la potencia de muestra. Es opcional; el detector predeterminado y todas las salidas existentes no cambian.

# text
seg-a56e74b1e091 = Comprobado frente a umbrales preregistrados en 3724aefa: la forma cerrada frente a Monte Carlo ({ "18" } de { "18" } casos), y una tasa de diseño del { "1" } % medida en { "0.97" }–{ "1.01" } % con ruido gaussiano y cuantificado a 2 bits.

# text
seg-f88fe97e0ee6 = Un umbral no se alcanzó: con una señal de 2 bits sin ruido, el { "1.28" } % de las celdas fuera del pico superan el umbral de decisión, en los lóbulos laterales de correlación del código (hallazgo F1).

# text
seg-8d88b626c31e = MODELLED; fila del registro "Opción CFAR de promediado de celdas en la adquisición IQ".

# text
# c1: scripts/fetch_scint_malindi.sh
seg-d596329195cf = <b>Modelo de centelleo frente a datos medidos</b> (PRO-34): el modelo de centelleo de Cornell del canal IQ se comparó con la intensidad y la fase medidas de GPS L1 a { "50" } Hz de una noche de centelleo ecuatorial (registro de Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), con umbrales preregistrados en b6ccb499. Alcanzados: la distribución de la intensidad y el centelleo de fase ligado a S4. No alcanzado: el modelo se desvanece { "2.4" } veces más a menudo por debajo de −{ "10" } dB y { "3.5" } veces más tiempo (hallazgo F1). El procesamiento registrado lee la fase envuelta del modelo (hallazgo F2); el resultado de fase se mantiene con ella desenvuelta. <c1/> obtiene los datos. La fila sigue siendo MODELLED: "Canal de centelleo ionosférico IQ (modelo de Cornell) frente al centelleo medido de GPS L1 a { "50" } Hz".

# text
# c1: realdata::lugre::parse_iqs_sdrx
# c2: 2v + 1
# c3: SdrLayout::mid_rise
# c4: run_acq.py --corrected
# c5: xval/lugre-reader/RESULTS.md
seg-d6740cab2271 = <b>Lector de muestras de LuGRE corregido</b> (MR-09): <c1/> lee un lote IQ de LuGRE con I en el nibble alto y los niveles mid-rise <c2/> (<c3/>), que eliminan la media de −½ que llevan I y Q en los enteros en complemento a dos sin más. <c4/> da a GNSS-SDR la misma lectura. El lector ION genérico y todas las salidas existentes no cambian: { "149" } resultados de escenario y un estudio son idénticos byte a byte antes y después, y los hallazgos fijados de LuGRE se leen tal como se registraron (<c5/>). No cambia ninguna fila del registro.

# text
# c1: LoopConfig::boc
# c2: N = 8
# c3: Channel::bump_jumps
# c4: docs/design/evidence/boc-bump-jump/RESULTS.md
seg-5adf36c03c14 = <b>Seguimiento BOC({ "1,1" }) opcional</b> (CAP-07 (a)): <c1/> reescala los discriminadores del DLL para el pico principal del BOC({ "1,1" }) senoidal y añade un monitor de salto de pico (correladores muy adelantado y muy retrasado a ±{ "0.5" } chip, contadores ascendentes/descendentes, <c2/>) que aparta el NCO de código de un pico lateral; <c3/> lista los saltos. Desactivado por defecto, y todas las salidas existentes no cambian. Comprobado frente a umbrales preregistrados en 6b68f6cc con una señal BeiDou B1C sintética: un inicio en un pico lateral que sin la opción permanece a { "0.55" } chip se lleva al pico principal con un salto a los { "0.08" } s con ella, y no se vio ningún salto falso desde el pico principal. Un umbral no se alcanzó: la cuadrícula de pruebas unitarias del escalado llega fuera del rango lineal de los discriminadores (hallazgo F1 en <c4/>). MODELLED; fila del registro "Seguimiento de BOC({ "1,1" }): escalado del DLL y resolución de ambigüedad por salto de pico (opcional)".

# text
# c1: docs/design/LABFIT-FROM-IQ.md
# c2: [input] campaign = "<out-dir>"
# c3: kshana iq campaign
# c4: kshana iq labfit
# c5: kshana.iq_labfit
seg-89345aa385f7 = <b>Ajuste de laboratorio a partir de campañas IQ</b> (B7.1, <a1><c1/></a1>). El <c2/> de un escenario labfit ajusta una carpeta de salida de <c3/> en la CLI (<c4/>), en Python (<c5/>) y en la herramienta labfit de MCP (solo carpetas dentro de su directorio de trabajo). Ajusta una unidad por señal, diseño de lazo, cadena de front end y tipo de jammer:

# text
seg-1726361b81c4 = el modelo de C/N0 frente al J/S declarado, con censura;

# text
seg-e1b8a27b06fd = el umbral de seguimiento, directamente y en forma cerrada;

# text
seg-8dce89923619 = los modelos de lazo de seguimiento y de enganche empírico, acoplados mediante el modelo de C/N0, con sus tiempos de permanencia;

# text
seg-108646713c97 = un bootstrap por conglomerados con semilla sobre las grabaciones, intervalos de predicción del { "90" } % y conjuntos reservados de dejar una grabación fuera;

# text
# c1: [validation]
seg-ee5deb4d5d4b = una tabla <c1/> preregistrada, con hash, con PASS/FAIL por umbral.

# text
# c1: kshana.labfit-iq/1
# c2: Q_eff
# c3: delta_eff = delta - 10 log10 Q
# c4: Q
# c5: delta_eff
seg-4d58263106af = El informe es <c1/> como JSON, CSV y Markdown, con un bloque de unidades. <b><c2/> no es identificable a partir de datos de C/N0</b> sin una medición independiente de la potencia. Se declara, nunca se ajusta, y el parámetro ajustado es <c3/> (enmienda de diseño 2026-10-12). Un tipo de jammer desconocido toma el <c4/> declarado más perjudicial (cw, { "1" }). En campañas sintéticas a partir de las propias escenas de Kshana, el umbral de cobertura del conjunto reservado (c) se supera. Los umbrales de <c5/> (a') y (b') ({ "0" } de { "50" } campañas cubiertas) y el umbral (d) del umbral en forma cerrada no se alcanzan: constan con sus valores. MODELLED; fila del registro "Calibración de los modelos de C/N0 y de enganche del receptor abierto con los resultados de campañas IQ, con error de predicción declarado". La vía labfit del registro del receptor y sus salidas no cambian.

# text
# c1: solar-system
# c2: planetary_kernel_path
# c3: KERNEL
# c4: kernel
seg-308d19be658d = <b><c1/> sobre un kernel de JPL</b> (CAP-31): <c2/> toma cada cuerpo que contiene el SPK (con de440s: Mercurio, Venus, la Tierra, la Luna) del kernel, etiqueta <c3/>, y añade un bloque <c4/> solo cuando se establece. Fila nueva, VALIDATED frente a SPICE (preregistrada f8e946ea; peor caso { "3.3e-5" } m, { "1.0e-11" } m/s). El informe predeterminado no cambia.

# text
# c1: maneuver::porkchop_kernel
seg-fe16c24eae60 = <b>Porkchop sobre las efemérides DE440</b> (CAP-20b): <c1/> barre C3 y V∞ de llegada sobre estados heliocéntricos de un SPK de DE440. Fila nueva, VALIDATED frente a estados de SPICE

# text
seg-a8632f3c86e9 = pykep { "3.0.1" } (preregistrada 2d857fb1; Tierra a Marte 2026-2028, { "304" } celdas, peor caso { "2.6e-14" }, la misma celda de C3 mínimo).

# text
# c1: lunar_od::LunarMacroModel
# c2: LunarForceModel::macro_model
# c3: LunarMacroModel::lro_generic
# c4: docs/design/evidence/ds-lro-10-macro-model/RESULTS.md
# c5: forces::conical_shadow_body
seg-266cffab38a7 = <b>Macromodelo no gravitatorio de LRO: NOT MET</b> (DS-LRO-10, preregistrado e82047e2). <c1/> (opcional mediante <c2/>): radiación solar directa sobre placa plana con la sombra de la Luna, un panel que sigue al Sol, y albedo lunar e IR térmico; <c3/> es una aproximación genérica etiquetada de LRO a partir de hechos publicados (sin placas del bus: no se pudo obtener la tabla de placas). En el arco de LRO de { "4" } h deja el RMS reducido-dinámico en { "6.668" } m y el dinámico en { "11.94" } m, con un factor de radiación inverosímil (de aproximadamente +{ "21" } / −{ "22" }), por lo que se fallan los tres umbrales. El hallazgo queda fijado por una prueba y ninguna salida predeterminada cambia (<c4/>). El SRP de bola de cañón lunar opcional ahora usa la sombra cónica de la Luna en lugar de la de la Tierra (<c5/>).

# text
# c1: LunarForceModel::lunar_tide
# c2: ::relativity
# c3: KSHANA_LRO_DEGREE
# c4: docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md
seg-e4ed6e0e5048 = <b>OD lunar: marea sólida k2 y relatividad selenocéntrica opcionales</b> (DS-LRO-11), desactivadas por defecto (<c1/>, <c2/>); un conmutador <c3/> para la validación cruzada con ANISE (DS-LRO-04); un fixture de arco de LRO de { "24" } h y un ajuste de arco largo solo informativo (DS-LRO-09). Las ejecuciones informativas se registran en <c4/>; no cambia ninguna cifra publicada.

# text
seg-b065138adba8 = <b>NRHO { "9" }:{ "2" } del CR3BP frente a CAPSTONE</b> (CAP-29d): nueva fila MODELLED que mide la NRHO circular restringida del motor frente a la órbita volada de CAPSTONE (JPL Horizons, marzo de { "2023" }; preregistrada { "4e868170" }): periodo { "1.07" } %, apolunio { "0.05" } %, perilunio { "4.1" } % respecto a las medias de CAPSTONE, dentro de los umbrales registrados de { "3" } / { "5" } / { "20" } %. Una medición, no una validación.

# text
# c1: cr3bp::to_moon_centred_icrf
# c2: from_moon_centred_icrf
# c3: to_moon_centred_icrf_de440
seg-954bd2771180 = <b>Estados rotatorios del CR3BP a ICRF centrado en la Luna</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> proyectan un estado rotatorio adimensional Tierra-Luna sobre la línea instantánea Tierra-Luna de DE440, incluida la velocidad fuera del plano del marco. Fila nueva, VALIDATED frente a un marco de dos vectores de SPICE (preregistrada 2313eb1b, enmendada antes de cualquier ejecución d5ef79b3; { "72" } casos, peor caso { "1.8e-7" } m y { "1.2e-9" } m/s).

# text
# c1: cr3bp_family
# c2: #[doc(hidden)]
# c3: docs/design/evidence/cr3bp-families/RESULTS.md
seg-14599ab79300 = <b>Miembros de familias del CR3BP frente a la API de órbitas periódicas de tres cuerpos de JPL: NOT MET</b> (RM-35, preregistrado a9074f65). <c1/> (corrección de halo, NRHO y DRO, índice de estabilidad de la monodromía, continuación por pseudolongitud de arco) coincide con { "54" } de { "58" } miembros de la API en todos los umbrales (estado, periodo y Jacobi dentro de { "1e-10" } en todos los casos). Un índice de estabilidad de un halo L1 ({ "9.5e-2" }) y tres cierres de DRO pequeñas ({ "1.5e-8" } a { "3.3e-8" } frente a { "1e-8" }) no se alcanzan, por lo que el módulo es <c2/> y ninguna fila lo afirma. Resultados: <c3/>.

# text
# c1: lunar_frame::try_icrf_to_moon_pa_de440
# c2: lunar::try_mci_to_mcmf_de440
# c3: try_mcmf_to_mci_de440
# c4: lunar_od::De440LunarEnvironment
# c5: docs/design/evidence/fut05-de440-lunar-env/RESULTS.md
seg-0cd0e67a2e28 = <b>Orientación y entorno lunares DE440 opcionales</b> (FUT-05, DS-LRO-08; valores predeterminados sin cambios): <c1/>, <c2/> / <c3/> (ancladas a la época, ejes principales de DE440) y <c4/> (orientación de ejes principales de DE440 incorporada más el Sol y la Luna geocéntricos de un SPK de DE440 aportado por el usuario). Frente a ANISE (preregistrado ea537710): orientación dentro de { "3.5e-7" } rad y ajustes de LRO dentro de { "1" } mm, pero el tramo de efemérides no alcanzó su umbral (Sol { "30.7" } m, Luna { "1.1" } m, un desfase temporal de ~{ "1" } ms en el lado de ANISE), por lo que no es una fila validada. Resultados: <c5/>.

# text
# c1: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md
seg-92cc171c69da = <b>Datum de campaña del marco lunar, umbral de NumPy escalado por condición: NOT MET</b> (preregistrado b887eb05; sigue siendo MODELLED). El paso { "0" } descarta la alternativa de la pseudoinversa como causa de la brecha de { "0.30" } de las estaciones estimadas; NumPy coincide dentro del umbral en seis de ocho escenarios, pero stations_estimated no lo alcanza ({ "6.8e-6" } frente a { "5.9e-7" }), y en la fecha nueva 2026-12-01 una baliza no observada del polo sur hace que la información de las balizas sea deficiente en rango, lo que la referencia independiente sin cambios no puede evaluar. Resultados: <c1/>.

# text
# c1: docs/design/evidence/mr06-llr-analytic-fresh/RESULTS.md
seg-8d2f1e9708ff = <b>Datum del marco lunar a partir de una campaña de observación real (Luna analítica) VALIDATED</b> con puntos normales EDC nuevos de { "2025" } (preregistrado 31f5283 antes de obtener ninguno): la referencia independiente de SPICE y NumPy sin cambios coincide en la contabilidad, los rangos y el acoplamiento nulo, y dentro de { "1.11e-3" } en las sigmas (umbral { "1e-2" }), { "8.95e-4" } en la condición y { "1.79e-3" } en las razones transversal/longitudinal (umbral { "2e-2" }). Una comprobación de biblioteca solo del cálculo de la covarianza; los umbrales no discriminan entre modelos de la Luna. Resultados: <c1/>.

# text
# c1: Body::iau_rotation_et
# c2: pxform
# c3: Body::mu
# c4: docs/design/evidence/mr08-body-orientation/RESULTS.md
seg-058d7d490111 = <b>Orientación IAU y GM de los catorce cuerpos del sistema solar añadidos</b>, separados de la fila "Constantes físicas de cada cuerpo del sistema solar" en una fila VALIDATED (preregistrado 154bc54): <c1/> coincide con <c2/> de SPICE en pck00011 dentro de { "1e-9" } rad en { "574" } matrices en las épocas originales y en { "574" } en { "41" } épocas nuevas nunca comparadas antes (peor caso Fobos { "1.38e-10" } rad), y <c3/> es igual a gm_de440 para los catorce cuerpos. El resto de la fila original (J2, radio medio, el informe) sigue siendo MODELLED. Resultados: <c4/>.

# text
# c1: maneuver::lambert_multirev
# c2: maneuver::kepler_universal
# c3: docs/design/evidence/lambert-multirev/RESULTS.md
seg-56c445aa8d9e = <b>Lambert de múltiples revoluciones</b> (<c1/>): todas las soluciones con hasta tres revoluciones, ambas ramas. Nueva fila del registro, VALIDATED frente a pykep { "3.0.1" } (preregistrado a75de851; { "382" } casos, { "1058" } soluciones, peor diferencia de velocidad { "1.6e-13" } frente a { "1e-8" }). La guarda interna de aterrizaje de Kepler halló una limitación de <c2/> en un arco con e = { "0.994" }; consta en <c3/>.

# text
seg-b62dc38b09e9 = Presión de radiación solar de caja-alas y ECOM2 (DS-PA-14), opcional.

# text
# c1: srp_boxwing
# c2: ForceModel::box_wing_srp
# c3: PreciseForceModel::box_wing_srp
# c4: srp_boxwing
# c5: None
# c6: cr
# c7: xval/srp-boxwing-orekit/
seg-fd50e846d10e = <c1/>: un modelo de caja-alas de placas planas con las tablas FOC/IOV de Galileo de los metadatos de satélites del GSC, con guiñada nominal de dirección GNSS, con factor de radiación y derivadas parciales por panel, y el modelo empírico ECOM2 con sus derivadas parciales. Se selecciona con <c2/> / <c3/> (campos <c4/>, por defecto <c5/>: la vía de bola de cañón y todos los valores de referencia no cambian); con un conjunto caja-alas, <c6/> es su factor de radiación. Comparado con Orekit { "12.2" } bajo un preregistro (<c7/>): todos los umbrales alcanzados, unos { "1e-15" } relativos; VALIDATED como evaluación de modelo, la predicción de la SRP de Galileo sigue siendo MODELLED.

# text
# c1: srp_shadow
# c2: oblate_conical_shadow
# c3: limb_darkened_shadow
# c4: ShadowModel
# c5: ForceModel::srp_shadow
# c6: forces::srp_accel_with_lit_fraction
# c7: xval/srp-oblate-shadow-orekit/
seg-fd7a7fe09705 = <b>Sombra de la SRP con Tierra achatada y oscurecimiento del limbo solar (FUT-09, RM-11).</b> Nuevo módulo <c1/>: <c2/> (elipsoide ocultante WGS-84), <c3/> (ley de Eddington) y <c4/>, seleccionado con <c5/> (por defecto: la sombra cónica esférica existente, sin cambios); <c6/>. La sombra achatada coincide con la razón de iluminación de Orekit { "12.2" } dentro de { "7.4e-9" } en { "2400" } geometrías (VALIDATED, <c7/>); el oscurecimiento del limbo no tiene referencia independiente externa (MODELLED).

# text
seg-f09d4b831dfe = Termosfera NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

# text
# c1: nrlmsise00
# c2: gtd7
# c3: gtd7d
# c4: xval/nrlmsise00-pymsis/
seg-1f838a403840 = <c1/>: un port de <c2/> y <c3/> (conmutadores, modos de Ap diario y de matriz ap cada 3 horas) de la versión en C de dominio público del Fortran del NRL. Es idéntico bit a bit a ese port en C y está dentro de { "1.9e-6" } relativo de pymsis { "0.13.0" } (Fortran del NRL, precisión simple) en una cuadrícula de 720 puntos, y reproduce los { "17" } casos de prueba publicados (VALIDATED; <c4/>). Esto valida el port, no la exactitud del modelo frente a la densidad medida.

# text
seg-9e8e9018dbaf = Nivel opcional de densidad de arrastre NRLMSISE-00.

# text
# c1: forces::DensityModel::{Exponential, Nrlmsise00 { f107a, f107, ap }}
# c2: forces::drag_accel_with_density
# c3: density_at
# c4: propagator::ForceModel::drag_density
# c5: xval/drag-tier-orekit/
seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> y <c4/>. El modelo exponencial estático sigue siendo el predeterminado, bit a bit. La meteorología espacial es constante por modelo. VALIDATED a nivel de órbita frente al propio arrastre NRLMSISE-00 de Orekit { "12.2" } durante { "24" } h (peor caso { "0.03" } m frente a hasta { "142" } km de desplazamiento por arrastre; <c5/>).

# text
seg-b1b2ac9ac91e = Sol y Luna de DE440 opcionales en el propagador de Cowell (RM-33, FUT-10).

# text
# c1: propagator::ForceModel::with_ephemeris
# c2: EphemerisProvider
# c3: KernelEphemeris
# c4: EphemerisProvider::relative_position_jd2
# c5: xval/propagator-de440-orekit/
seg-4f323703b251 = <c1/> acepta cualquier <c2/> (por ejemplo, un <c3/> de DE440) para los términos de tercer cuerpo y de SRP; rechaza un proveedor que no pueda servir la época, cuenta los recursos a la serie analítica y está desactivado por defecto. <c4/> conserva la precisión en dos partes. Frente a Orekit { "12.2" } con su propio lector de DE440, las órbitas de { "24" } h coinciden hasta { "0.017" } m; el umbral preregistrado de posición del Sol y la Luna no se alcanzó ({ "6.4" } m / { "0.24" } m; SPICE muestra la misma brecha), por lo que MODELLED (<c5/>).

# text
seg-6ac7f3f65b33 = Marea atmosférica S1 opcional (DS-PA-03).

# text
# c1: tides::atmospheric_tide_s1
# c2: s1_air_tide_acceleration
# c3: air_tide_s1()
# c4: propagator::ForceModel
# c5: precise_od::PreciseForceModel
seg-35da1ed0dc83 = <c1/> y <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabla { "1" } modelo N1, grados { "2" }–{ "6" }), activadas con <c3/> en <c4/> y <c5/>; desactivadas por defecto. MODELLED (coeficientes recomprobados frente a la tabla publicada; sin referencia independiente externa para el efecto de la fuerza).

# text
seg-c62d816a93cf = Determinación de órbita por lotes con velocidad de distancia y acimut/elevación con máscara de elevación (RM-36, FUT-13).

# text
# c1: orbit_determination::determine_orbit_batch_tracking
# c2: simulate_tracking
# c3: predict_tracking
# c4: propagate_with_stm
# c5: is_visible
# c6: measurement_with_partials
# c7: batch_ls::gauss_newton_analytic
seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (STM variacional con derivadas parciales analíticas de dos cuerpos + J2), <c5/>, <c6/>; <c7/>. La vía solo de distancia no cambia. Comparado con mínimos cuadrados por lotes de Orekit { "12.2" } en { "8" } escenarios preregistrados: todos los umbrales alcanzados salvo la coincidencia de estado sin ruido (≤ { "1" } cm), no alcanzada en { "2" } de { "4" } escenarios con { "1.46" } y { "1.74" } cm, con kshana a { "1e-8" } m de la verdad; registrado, MODELLED.

# text
seg-223f1e39669f = Ponderación de exactitud SP3 (DS-PA-06).

# text
# c1: sp3::parse_sp3_accuracy
# c2: Sp3Accuracy::position_sigma_m
seg-b5560ff1c426 = <c1/> y <c2/> asignan los códigos de exactitud de la cabecera y de cada registro a sigmas de observación; se añade una variante de ajuste de Galileo ponderada con SP3 (RMS 3-D de nivel 2 de { "0.035" } m frente a { "0.070" } m sin ponderar) junto a las ejecuciones registradas sin cambios. MODELLED.

# text
# c1: .github/workflows/agency-od-validation.yml
seg-831d35c5f97e = <b>Trabajo de despacho de arco completo de Swarm-A (DS-PA-08)</b> en <c1/>.

# text
seg-cc5e8af7cb0d = Gravedad planetaria a partir de tablas SHADR de PDS (CAP-30, parte de CAP-31).

# text
# c1: SphericalHarmonicField::from_shadr
# c2: src/gravity_pds.rs
# c3: Body::with_gravity_field
# c4: tests/fixtures/planetary_gravity/NOTICE.md
# c5: xval/planetary-gravity-pyshtools/fetch_data.sh
seg-bc9149c18ea8 = <c1/> (<c2/>) lee Mars GMM-3 (g/o { "120" }) y GRAIL GL0660B (g/o { "660" }); <c3/> asocia cualquier campo cargado (valores predeterminados sin cambios). Se incluyen recortes de grado 20 (NASA PDS, dominio público; <c4/>); los archivos completos los obtiene <c5/>. VALIDATED frente a pyshtools { "4.14.1" } (dentro de { "4e-15" } de la gravedad total con g/o { "120" } sobre toda la esfera, { "5e-14" } con g/o { "660" } para |lat| ≤ { "60" }°); la conexión con el marco del cuerpo sigue siendo MODELLED (el marco nativo de cada campo no es el marco IAU utilizado).

# text
seg-afb5fbf86ffc = Gravedad de alto grado hasta el grado { "2190" } (RM-14, FUT-07).

# text
# c1: SphericalHarmonicField::acceleration_hf
# c2: potential_hf
# c3: prepare_high_degree
# c4: from_gfc_file
# c5: from_gfc_reader
# c6: scripts/fetch_egm2008.sh
# c7: KSHANA_EGM2008_GFC
# c8: propagator::FieldEvaluator
# c9: Geopotential
# c10: xval/
seg-28bc597b06b2 = <c1/> / <c2/> (columna directa modificada de Holmes–Featherstone, sin desbordamiento inferior (underflow), sin singularidad polar), <c3/>, un cargador ICGEM en flujo <c4/> / <c5/> (comprobaciones de norma y de grado máximo, sistema de mareas registrado, términos variables en el tiempo rechazados) y <c6/> (EGM2008 completo, SHA-256 fijado, no incluido; pruebas condicionadas a <c7/>). <c8/> lo selecciona en el <c9/> opcional. Coincide con Orekit { "12.2" } hasta { "7.3e-17" } m/s² hasta el grado { "2190" }, y una órbita de { "24" } h { "200" }×{ "200" } coincide hasta { "0.13" } m. MODELLED: pyshtools no alcanzó el umbral preregistrado cerca del polo (atribuido a pyshtools) y el control de sensibilidad de grado 70 de la órbita no se alcanzó ({ "0.73" } m < { "1" } m); ambos constan en <c10/>.

# text
seg-4ef4f74f21c1 = Integrador DOP853 (FUT-11).

# text
# c1: integrator::integrate_dop853
# c2: integrate_dop853_checked
# c3: integrate_dop853_dense
# c4: dop853_step
# c5: dop853_initial_step
# c6: propagator::Integrator::Dop853
# c7: propagate_dop853
# c8: propagate_dop853_checked
# c9: solve_ivp(method="DOP853")
# c10: xval/dop853-scipy/
seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (salida densa de orden 7), <c4/>, <c5/>, con una guarda de paso que falla en modo cerrado; <c6/>, <c7/>, <c8/>. El controlador predeterminado no cambia. VALIDATED frente a SciPy { "1.18.1" } <c9/>: pasos individuales dentro de { "5.6e-15" }, secuencias de pasos coincidentes, estados finales dentro de { "1.6e-12" } (<c10/>).

# text
# c1: kepler
# c2: solve_kepler_markley
# c3: propagator::solve_kepler_robust
# c4: xval/kepler-mpmath/
seg-d36f657f93ad = <b>Resolutor robusto de Kepler (FUT-12).</b> Nuevo módulo <c1/>: <c2/> (arranque de Markley { "1995" }, residuo sin cancelación) para todo { "0" } ≤ e < { "1" }, envuelto por <c3/>. VALIDATED frente a raíces de mpmath de 50 dígitos hasta { "0.9" } ε·|E| con e hasta { "0.999999" } (<c4/>).

# text
seg-5e82deb7c853 = Gravedad terrestre teseral opcional en el propagador de Cowell (RM-09).

# text
# c1: propagator::ForceModel
# c2: geopotential: Option<Geopotential>
# c3: with_geopotential
# c4: with_egm2008(nmax)
# c5: SphericalHarmonicField
# c6: .gfc
# c7: EarthFixedFrame::Era
# c8: EarthFixedFrame::Cio
# c9: None
# c10: xval/cowell-tesseral-orekit/PREREGISTRATION.md
seg-e1a7ad42211e = <c1/> incorpora <c2/> (<c3/>, <c4/>). Evalúa un <c5/> (EGM2008 incluido hasta grado/orden { "70" }, o cualquier <c6/> de ICGEM) en un marco ligado a la Tierra alcanzado mediante el ángulo de rotación terrestre (<c7/>) o la cadena GCRS-ITRS del CIO (<c8/>). Por defecto <c9/>: ninguna salida existente cambia. VALIDATED frente a Holmes–Featherstone de Orekit { "12.2" } durante { "24" } h ({ "6" } casos, peor caso { "0.036" } m), con los umbrales preregistrados en <c10/>.

# text
# c1: jd2::gmst82
# c2: cio::gcrs_to_itrs_matrix_jd2
# c3: frames::teme_to_itrf_jd2
# c4: itrf_to_teme_jd2
# c5: orbit::Propagator::position_in_frame_jd2
# c6: own_jd2_utc
# c7: From
# c8: jd2::Jd2
# c9: timescales::TwoPartJd
# c10: two_part_jd = true
# c11: ephemeris
# c12: gmst82
# c13: c2t06a
# c14: f64
# c15: f64
seg-957686bb351e = <b>Fechas julianas en dos partes en la rotación terrestre de la vía de órbita</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> y <c6/>, conversiones <c7/> entre <c8/> y <c9/>, y un <c10/> opcional para el escenario <c11/> (ECEF, traza sobre el suelo y vista de estación; desactivado por defecto y sin cambios, y la clave se omite del hash del escenario cuando está desactivada). Nueva fila del registro, VALIDATED frente a pyerfa <c12/>/<c13/> (preregistrado b10475ee; { "40" } fechas: GMST idéntico bit a bit, matriz dentro de { "2.7e-14" }, rotación en pasos de { "1" } µs dentro de { "1.1e-14" } rad, donde la vía de un solo <c14/> no los alcanza). La época del modelo de fuerzas de Cowell sigue siendo de un solo <c15/>; el motivo consta en su documentación.

# text
# c1: EopSeries::with_ls_ar_prediction
# c2: EopSeries::last_mjd
seg-0680b1f4c98b = <b>Predicción de EOP más allá de la tabla</b> (<c1/>, <c2/>): una extensión opcional de una serie de orientación terrestre del IERS mediante el predictor LS+AR emitido en su última fila, de modo que los argumentos de marco de una época posterior siguen la previsión en lugar de quedar fijados a la última fila. Las respuestas dentro de la tabla son idénticas bit a bit (probado); la serie sigue quedando fijada salvo que se llame a esto. La exactitud de la previsión sigue siendo el hallazgo existente de LS+AR frente al Bulletin A (MODELLED).

# text
# c1: cio::gcrs_to_cirs_matrix_with_offsets
# c2: precession_matrix
# c3: teme_to_gcrs_matrix
seg-a7d272a1ddd6 = <b>Desfases del polo celeste dX, dY en la cadena del CIO</b> (<c1/>), y comprobaciones vectoriales directas con ERFA de <c2/>, <c3/> y la nueva función. Nueva fila del registro, VALIDATED frente a pyerfa (preregistrado 979c1e39; { "40" } épocas { "1950" }–{ "2100" }: precesión y CIO idénticas bit a bit, TEME→GCRS dentro de { "1.1e-10" } rad, el efecto previsto de la serie de dos términos de la ecuación de los equinoccios). Las funciones existentes no cambian.

# text
# c1: timescales::tai_minus_utc_on_date
# c2: Jd2::from_utc_calendar
# c3: jd2::utc_to_tai
# c4: jd2::tai_to_utc
# c5: dtf2d
# c6: utctai
# c7: taiutc
# c8: f64
# c9: timescales::tai_minus_utc
seg-20d19a2d65ec = <b>UTC anterior a 1972 en la vía temporal de dos partes</b> (<c1/>, y <c2/>, <c3/> y <c4/> desde 1960-01-01): la era de tasa derivante ("segundo elástico"), con la tabla de deriva de SOFA, saltos fraccionarios a final de día y el escalado de UTC a SI de la fracción del día. Nueva fila del registro, VALIDATED frente a pyerfa <c5/>/<c6/>/<c7/> (preregistrado 23c40661; { "117" } instantes { "1960" }–{ "1971" }, peor caso { "2.9e-11" } s frente a un umbral de { "1" } µs). Todo resultado de { "1972" } en adelante es idéntico bit a bit (suma de comprobación fijada antes del cambio). Antes de { "1960" }, TAI − UTC es { "0" }, como en SOFA. El <c9/> de un solo <c8/> no cambia.

# text
# c1: GlonassEphemeris::sv_clock_bias_s
# c2: −τn + γn·(t − tb)
# c3: −τn
# c4: γn
# c5: geph2clk
# c6: geph2pos
seg-3ff0d080d9e6 = <b>Reloj de satélite difundido de GLONASS</b> (<c1/>): <c2/> a partir del registro RINEX, a una hora leída en el reloj del satélite (dos iteraciones de punto fijo, la convención de RTKLIB). Los <c3/> y <c4/> analizados no se usaban antes. Nueva fila del registro "Reloj de satélite difundido de GLONASS y propagación de la órbita difundida", VALIDATED frente a <c5/>/<c6/> de RTKLIB 2.4.2-p13 (preregistrado e099c42a; { "292" } casos sobre un archivo de difusión real de { "2013" }: diferencia de reloj { "0" } s, peor posición { "1.1" } mm frente a un umbral de { "1" } cm). Función de biblioteca; ninguna salida de escenario cambia. No se aplica ninguna transformación PZ-90.11 → ITRF, y el módulo lo dice.

# text
# c1: xval/ppp-time/
# c2: igs_2025055_WTZR_05m_0006.clk
seg-71ae2ee163e0 = <b>Solución de tiempo PPP frente al reloj de estación del IGS</b> ({ "0.36" }, FUT-19): el reloj del receptor del filtro PPP flotante en WTZR coincide con el reloj combinado final del IGS para la estación hasta { "0.075" } ns (desviación típica) con un desfase constante de −{ "0.66" } ns durante las dos horas convergidas. Los umbrales se preregistraron en <c1/>. VALIDATED (nueva fila del registro). Nuevo fixture <c2/>, los registros de reloj de estación del archivo de reloj final del IGS ya usado para los relojes de satélite.

# text
seg-463ac67600b1 = <b>Paridad de PPP con gLAB</b> ({ "0.36" }, WP-07, RM-31): se ejecutó gLAB { "6.0.0" } con las mismas entradas de WTZR como herramienta aparte (núcleo Apache-2.0; suma de comprobación de la descarga verificada frente a la lista publicada), con la línea de comandos de una enmienda de procedimiento confirmada antes de la ejecución. En su primera ejecución registrada, el PPP flotante de Kshana y el de gLAB coinciden dentro de { "0.05" } m en { "240" } de { "240" } épocas y hasta { "5.0" } mm en la última. El umbral de SPP no se alcanzó (mediana { "1.187" } m frente a { "0.50" } m) y se registra como hallazgo: las propias soluciones SPP de gLAB y de RTKLIB difieren entre sí en { "0.852" } m. Por tanto, la regla registrada deja los tramos de ambas herramientas como no alcanzados en conjunto, mientras que la paridad de PPP se mantiene.

# text
# c1: rinex::parse_nav
# c2: > EPH
# c3: parse_nav_with
seg-158717c78c80 = <b>Lectura de navegación RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> lee archivos de navegación RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV y F/NAV, BeiDou D1/D2, QZSS LNAV; otros registros se omiten hasta la siguiente cabecera de registro), y <c3/> admite opciones. VALIDATED frente al archivo combinado RINEX { "3" } del IGS del mismo día: cada campo decodificado idéntico y { "0" } m en posición. La lectura de RINEX 2/3 no cambia.

# text
# c1: NavParseOptions::include_beidou_geo
# c2: RinexEphemeris::sv_position_ecef_bds_geo
# c3: parse_nav
seg-57aa5c6ef4f8 = <b>Posiciones difundidas de BeiDou GEO</b> (opcional): <c1/> y <c2/> (ICD de BDS, inclinación de −{ "5" } deg). <c3/> sigue omitiendo los GEO. MODELLED: la comparación preregistrada con una órbita precisa está condicionada a datos y aún no se ha ejecutado.

# text
seg-416f58111d1f = <b>Archivos de observación RINEX { "4" }</b>: en las pruebas se lee un archivo de observación MGEX real RINEX { "4.00" } (MODELLED, ajuste a la norma del formato).

# text
# c1: rtk_real::run_rtk
seg-64b4664c0ff6 = <b>RTK con LAMBDA sobre RINEX real</b> ({ "0.36" }, WP-07 ★): <c1/>, dobles diferencias de línea base corta de código y fase GPS de doble frecuencia con un filtro de Kalman flotante y fijación de enteros con LAMBDA (prueba de razón). VALIDATED en las estaciones del IGS WTZR y WTZZ (a { "1.4" } m una de otra) frente a su línea base ITRF2020 con umbrales preregistrados: fijada en todas las épocas tras los primeros diez minutos, error de línea base con mediana de { "4.5" } mm y percentil 95 de { "5.5" } mm.

# text
# c1: xval/ppp-parity/run.sh
# c2: tests/ppp_parity_glab_rtklib.rs
seg-69db4437ebbb = <b>Paridad con RTKLIB del PPP con datos reales</b> (RM-31): <c1/> y <c2/> con umbrales preregistrados. El PPP de RTKLIB v2.4.2-p13 sobre las mismas entradas de WTZR coincide con Kshana dentro de { "5" } cm en cada época de las dos últimas horas ({ "9.7" } mm al final) en el tercer registro; las dos primeras ejecuciones, registradas como hallazgos, tenían la marea sólida desactivada y la antena del receptor en la ranura base de RTKLIB. El umbral de paridad de posicionamiento de punto único no se alcanzó (mediana de { "1.09" } m frente a { "0.5" } m). El tramo de gLAB no se ha ejecutado (condicionado a datos).

# text
# c1: gnss_navmsg
# c2: 0101100000
# c3: 101101110000
seg-fb6e053a0a9d = <b>Codificadores de mensajes de navegación más allá de LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> codifica GPS CNAV (tipos de mensaje { "10" }, { "11" }, { "30" }; CRC-24Q; codificación continua de tasa 1/2 con K={ "7" }), Galileo I/NAV (tipos de palabra 1-5 en páginas nominales par/impar; entrelazador de 30x8; sincronización <c2/>) y Galileo F/NAV (tipos de página 1-4; entrelazador de 61x8; sincronización <c3/>), con decodificadores de prueba. MODELLED: ida y vuelta y respuestas conocidas del ICD; una comprobación preregistrada de que las efemérides difundidas de Galileo se sitúan en la cuadrícula de LSB del codificador se sostuvo (peor caso { "3.6e-3" } LSB) pero no alcanzó su umbral de número de satélites ({ "15" } de { "20" }), registrado. Los codificadores son funciones de biblioteca; la conexión con la escena no forma parte de este cambio.

# text
# c1: ionex::parse_ionex_file
# c2: IonexFile
# c3: IonexHeader
# c4: IonexEpoch
# c5: IonexFileMap
# c6: IonexTimeInterp
# c7: 9999
# c8: iontec
seg-562f36eb18e6 = <b>Lector de archivos IONEX</b> ({ "0.36" }, WP-07): <c1/> con <c2/>, <c3/>, <c4/>, <c5/> y <c6/>: un lector estricto de IONEX { "1.0" } de columnas fijas con épocas contadas desde el día del primer mapa, <c7/> leído como ausente, mapas de RMS y las interpolaciones temporales del formato de mapa más cercano, consecutivo y rotado; TEC oblicuo a la altura de la capa de la cabecera. Comprobado con un mapa sintético confirmado y, condicionado a datos (obtenido en el momento de la prueba con un SHA-256 fijado, no incorporado), con un recorte de un GIM real de CODE: cada nodo exacto; la interpolación coincide con una referencia de fórmula hasta { "4e-13" } TECU. <c8/> de RTKLIB coincide hasta { "3.6e-13" } TECU en { "6885" } puntos (B6 preregistrado). VALIDATED con evidencia condicionada a datos (decisión del propietario, 2026-10-13): la prueba falla con cualquier mapa que no sea el de SHA fijado.

# text
# c1: hatch::HatchFilter
# c2: pvt::assemble_epoch_precise_smoothed
seg-9fac2e8535c8 = <b>Suavizado de portadora de Hatch</b> ({ "0.36" }, WP-07): <c1/> y <c2/>, la forma sin divergencia (libre de ionosfera) en el ensamblado preciso de punto único. MODELLED con un hallazgo registrado: en la estación del IGS WTZR reduce el error de punto único mediano de { "1.55" } m a { "1.12" } m y el percentil 95 de { "3.47" } m a { "3.21" } m, por debajo de la reducción preregistrada del { "40" } % (el error restante es de tipo sesgo, no ruido).

# text
# c1: ppp_real::run_ppp
# c2: parse_antex_receiver
seg-7e4c7639d102 = <b>PPP flotante sobre RINEX real</b> ({ "0.36" }, WP-07): <c1/>, un filtro de posicionamiento de punto preciso flotante estático sobre código y fase GPS de doble frecuencia reales con productos finales del IGS (desfases y variaciones de antena, marea terrestre sólida, wind-up de fase, retardo de Shapiro, retardo húmedo estimado, detección de saltos de ciclo), con <c2/>. VALIDATED en la estación reservada del IGS WTZR frente a su coordenada ITRF2020 con umbrales preregistrados: tras { "6" } h el error es de { "1.5" } mm en horizontal y { "2.9" } cm en vertical, y cada época de las dos últimas horas está dentro de { "10" } cm.

# text
# c1: Sp3File::clock_s
# c2: clock_nodes
# c3: ClockRinex::from_sp3
# c4: PreciseProducts
seg-173aa308e3e8 = <b>Interpolación de reloj preciso SP3</b> ({ "0.36" }, WP-07): <c1/> y <c2/> interpolan linealmente los relojes de satélite tabulados de SP3 entre los dos nodos válidos que los acotan (se omite el centinela de reloj erróneo), y <c3/> los entrega a <c4/>, de modo que la cadena precisa funciona solo con un SP3. VALIDATED frente a los relojes finales de { "30" } s del IGS del 2025-02-24 con umbrales preregistrados: { "32" } satélites GPS, RMS en el punto medio { "0.121" } ns (umbral { "0.15" } ns), percentil 95 { "0.265" } ns (umbral { "0.30" } ns).

# text
# c1: [integrity]
# c2: integrity_fom
seg-e7c4e88d4ba4 = <b>RAIM junto a las cifras de mérito de holdover del reloj</b> (CAP-05b): una sección opcional <c1/> en el tipo de escenario clock informa de un bloque <c2/> aparte (RAIM instantáneo sobre un cielo predefinido desde un sitio declarado: veredicto por época y niveles de protección, disponibilidad; no disponible mientras se deniega el GNSS, nunca extrapolado). Las cifras de holdover no cambian; sin la sección la salida es idéntica byte a byte. MODELLED.

# text
# c1: examples/jammertest_trust_calibration.rs
# c2: [monitors] profile = "jammertest-2024-calibrated"
# c3: xval/jammertest-trust/RESULTS.md
seg-99d9a67fc2f3 = <b>Umbrales de receiver-trust calibrados con JammerTest { "2024" }</b> (CAP-13): una calibración preregistrada de los monitores de caída de C/N0, AGC e indicador de jamming con el conjunto de datos público JammerTest { "2024" } (obtenido en tiempo de ejecución, nunca incorporado; <c1/>), distribuida solo como el <c2/> opcional ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Con conjunto reservado: los umbrales de AGC, indicador de jamming y unión pasan; el umbral de falsa alarma de C/N0 falla ({ "0.023" } frente a { "0.02" }), por lo que la fila es MODELLED (<c3/>). Los valores predeterminados y las salidas sin el perfil no cambian.

# text
# c1: add_v42_subset_plan
# c2: add_v42_protection_levels_to_order
# c3: araim_subset_raim
seg-8ccd18c54b4b = <b>Hipótesis de fallo ARAIM con varios satélites</b> (CAP-05a): la regla de subconjuntos de ADD v4.2 generalizada más allá de los pares (<c1/>, <c2/>; el orden { "2" } es exactamente la vía existente comprobada con MAAST) y un RAIM avanzado opcional sobre esas hipótesis (<c3/>), que informa del subconjunto de mayor separación cuando se detecta un fallo. Las probabilidades a priori que necesitan subconjuntos más profundos se rechazan, nunca se truncan. MODELLED.

# text
# c1: [skyline]
# c2: sky-blocked
# c3: behind_skyline
# c4: open_fraction
# c5: geometry
# c6: environment
# c7: natural-degradation
# c8: scenarios/training/fjord-natural-degradation.toml
seg-02f1f2d72263 = <b>Línea del horizonte en receiver trust</b> (FUT-01): una sesión de receiver-trust puede declarar una <c1/>; los satélites detrás de ella se pierden para el cielo (<c2/>, <c3/>, <c4/>) y sus pérdidas se clasifican como <c5/>, nunca <c6/>; sin ella, la alternativa por huecos de acimut y todas las salidas son como antes. El generador de entrenamiento de tripulaciones incorpora un evento <c7/> (un cielo bloqueado, no interferencia) y el escenario <c8/>. El Monte Carlo de UERE x DOP incorpora las dos geometrías de línea del horizonte enmascarada de la nota de diseño, preregistradas por separado: las { "26" } comprobaciones pasan.

# text
# c1: kshana::evidence::tsa::verify_token
# c2: kshana evidence verify --tsa-ca <anchors.pem>
# c3: timestamp.tsr
seg-69fa2ecdc4e9 = <b>Verificación de sellos de tiempo RFC { "3161" }</b> (CAP-14): <c1/> comprueba la firma de un token de sello de tiempo (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 y P-384), su vínculo ESS con el certificado de firma, el uso timeStamping del firmante y su cadena hasta un ancla de confianza en el genTime del token, sin conexión; <c2/> la aplica al <c3/> de un paquete (opcional; sin ella el informe no cambia). VALIDATED, de forma acotada: los { "27" } casos autogenerados coinciden con OpenSSL { "3.0.13" } en el veredicto y en el genTime, con una comparación preregistrada antes de escribir el verificador. No se comprueba la revocación.

# text
# c1: figure_tiers
# c2: api::without_figure_tiers
# c3: lunar-station-coverage
# c4: figure_tiers
# c5: leo-ppp
# c6: solar-system
# c7: sweep
# c8: sweep-nd
# c9: lunar-attack-surface
seg-1b7777e600a8 = <b>Niveles de verificación por cifra para cada tipo de escenario</b> (RM-04): el resultado de cada tipo de escenario ahora termina con un bloque <c1/> que nombra sus cifras principales, la fila de la matriz de verificación que es propietaria de cada una y el nivel leído de esa fila (las cifras que ninguna fila posee se listan como sin nivel). El bloque se añade tras la ejecución y se retira para volver al documento anterior byte a byte (<c2/>). <c3/> no tiene <c4/> hasta que una nueva predicción fechada sustituya a la congelada; <c5/>, <c6/>, <c7/> y <c8/> no tienen cifra principal escalar, y <c9/> escribe JSON compacto. Los miembros de campaña conservan sus documentos sin nivel.

# text
# c1: quantum-cai-coast
# c2: [accel_quantum.cai]
seg-54aec3e311cf = <b>Preajuste cuántico <c1/></b> (CAP-08c): un escenario inercial incluido en el que un acelerómetro interferómetro de átomos fríos, especificado por la física de su interferómetro (<c2/> con un nivel de vibración de plataforma declarado), navega por inercia frente a un acelerómetro de cuarzo de grado de navegación durante una interrupción del GNSS de 110 minutos. MODELLED.

# text
# c1: allan::edf_greenhall
# c2: assurance::uncertainty
seg-21d2b7fd2a21 = <b>Grados de libertad equivalentes exactos de Greenhall</b> (CAP-03): <c1/>, el algoritmo completo de Greenhall y Riley ({ "2003" }) (órdenes de diferencia { "1" } a { "3" }, exponentes de ruido de +{ "2" } a -4, con y sin solapamiento, modificado y sin modificar, con las tablas de J grande), con envoltorios de ADEV, MDEV y HDEV. VALIDATED con una comparación preregistrada con allantools { "2024.6" }: { "4 876" } puntos de la cuadrícula dentro de { "6.0e-13" } relativo; allantools falla en { "32" } puntos más, que se registran sin valor de referencia independiente. Los intervalos de confianza de <c2/> no cambian bit a bit.

# text
# c1: src/inertial/cai_error_terms.rs
# c2: docs/QUANTUM-MODELS.md
seg-8e04ebc15045 = <b>Términos de error del interferómetro de átomos fríos</b> (RM-26/27/28): ruido de fase del láser Raman (con el término de retardo de retrorreflexión), el sesgo por curvatura del frente de onda de una nube térmica (desenfoque puro, con un radio de detección) y la resolución de la ambigüedad de franjas (asistida por clásico y con dos tiempos de interrogación), como funciones de biblioteca en <c1/>, cada forma cerrada comprobada frente a cuadratura o Monte Carlo. MODELLED; todavía no accesible desde un tipo de escenario (<a1><c2/></a1>).

# text
# c1: src/clock_log.rs
# c2: [series.clock_log]
# c3: [clock_log]
# c4: measured
# c5: docs/CLOCK-LOG-FORMATS.md
seg-7d2899c3173b = <b>Formatos de registro de reloj</b> (RM-03): <c1/> lee archivos de reloj RINEX, registros ASCII de fase o frecuencia al estilo TimeLab y registros de contador TICC de TAPR en una única serie de fase normalizada (tau0 declarado o hallado, huecos contados, una política de huecos). Opcional: una serie de temporización de telecomunicaciones puede nombrar un registro (<c2/>), y la tabla <c3/> de un escenario de reloj añade un bloque <c4/> (ADEV, TDEV, MTIE). Sin la tabla, ambos tipos de escenario son idénticos byte a byte (<a1><c5/></a1>). Una comparación preregistrada con tres registros sintéticos alcanzó sus umbrales de fase y de conexión; los estimadores coinciden con allantools hasta { "2.5e-14" } allí donde este evalúa, y no evalúa el punto de MTIE del registro completo (registrado). MODELLED.

# text
# c1: telecom-timing
# c2: scenarios/telecom-synce-eec.toml
seg-53369a5c3749 = <b>Máscaras de wander de sincronización de frecuencia</b> (RM-01): el tipo de escenario <c1/> incorpora siete máscaras de generación de wander de MTIE y TDEV a temperatura constante, ITU-T G.811 PRC, G.812 Tipos I a III, G.8262 EEC Opciones { "1" } y { "2" } y G.8262.1 eEEC, con los tramos de ley de potencias que escriben las tablas, y el escenario de referencia <c2/> (un OCXO en funcionamiento libre frente a las máscaras EEC: falla a { "1 000" } s, donde debe trabajar un lazo). Cada fila se releyó frente al texto de itu.int; G.812 (06/2004) ha sido sustituida por una edición prepublicada de 08/2026 que no pudo leerse. MODELLED (una transcripción); las máscaras y salidas existentes no cambian.

# text
# c1: gnss-ins
# c2: [imu_*.filter_prior]
seg-5e84b35ee4e7 = <b>Orientación sobre el a priori del filtro para el tipo de escenario <c1/></b> ({ "0.36" }, WP-09, hallazgo RM-21): el a priori de filtro predeterminado del paquete es adecuado para una IMU de grado táctico. Con una IMU de grado de navegación, el valor predeterminado puede empeorar la navegación por inercia fusionada respecto a un INS libre: { "52" } m frente a { "11" } m en un perfil de aeronave de { "70" } m/s. Establezca <c2/> para que coincida con el grado del sensor, como hacen los nuevos paquetes marítimo, ferroviario y de aviación. Ningún escenario incluido combina una IMU de grado de navegación con el a priori predeterminado: todos los que usan el valor predeterminado tienen sesgos residuales del acelerómetro de al menos { "0.015" } m/s². Solo documentación; ninguna salida cambia.

# text
# c1: kshana bench-export
# c2: xval/testbench-gpssdrsim/
# c3: docs/TEST-BENCH.md
seg-f74b3c265f3a = <b>Exportación para test bench comprobada con los propios lectores de un simulador</b> ({ "0.36" }, WP-09, CAP-16): los archivos de movimiento de <c1/> de { "8" } escenarios incluidos se leyeron de vuelta con los lectores de NMEA, latitud/longitud/altura y movimiento ligado a la Tierra de gps-sdr-sim (MIT, commit 28ca29a6, usado como herramienta aparte mediante <c2/>; no se invoca ninguna función de señal). Devuelven la trayectoria exportada con { "1.2" } mm, { "0.15" } mm y exactamente. HALLAZGO: el lector de movimiento ligado a la Tierra de ese simulador no puede aceptar el CSV de ancho completo, porque su búfer de línea de 100 caracteres divide cada fila. <c3/> ahora indica los cortes de columna que hay que usar y el límite de { "300" } s del simulador. VALIDATED (nueva fila del registro); los bytes de la exportación no cambian.

# text
# c1: fusion::kfgins
# c2: xval/kfgins/PREREGISTRATION.md
seg-e77e1ac87dd5 = <b>GNSS/INS con el conjunto de datos KF-GINS</b> ({ "0.36" }, WP-09, FUT-17): cargadores y ejecutor de <c1/> y el modelo de medida del brazo de palanca en el EKF de lazo cerrado. Con el conjunto de datos de demostración de KF-GINS (obtenido en el momento de la prueba, no incorporado), el RMS horizontal de Kshana frente a la trayectoria de referencia es de { "1.09" } cm frente a los { "1.11" } cm del propio KF-GINS, y todos los umbrales preregistrados se mantuvieron. VALIDATED con evidencia condicionada a datos (decisión del propietario, 2026-10-13): el conjunto de datos se obtiene con SHA-256 fijados y la vía de reproducción está en <c2/>.

# text
# c1: fusion
# c2: [coupled]
# c3: fusion::coupled::CoupledPntBiasFilter
# c4: fusion::coupled::CoupledPnt3d
# c5: fusion-pnt-coupled
# c6: fusion
# c7: hybrid
# c8: hybrid
seg-4d5a503c5c9c = <b>Filtro PNT acoplado en el paquete de fusión</b> ({ "0.36" }, WP-09, FUT-16): el tipo de escenario <c1/> admite una tabla opcional <c2/> que ejecuta un único filtro apilado sobre pseudodistancias con un estado de sesgo del acelerómetro (<c3/>), y <c4/> es la versión 3-D de 8 estados. Nuevo escenario incluido <c5/>: con acelerómetros sesgados, el modo acoplado mantiene la posición de la suite cuántica en { "18.7" } m (percentil 95) con integridad completa, donde los filtros desacoplados llegan a { "430" } m. Sin la tabla, tanto <c6/> como <c7/> no cambian (fijado); <c8/> rechaza la tabla. MODELLED.

# text
# c1: gnss-ins-maritime
# c2: gnss-ins-rail
# c3: gnss-ins-aviation
# c4: [tight]
# c5: gnss-ins
# c6: [tight]
seg-b7f07e3693df = <b>Paquetes GNSS/INS marítimo, ferroviario y de aviación</b> ({ "0.36" }, WP-09, RM-21): escenarios incluidos <c1/>, <c2/> y <c3/> sobre la biblioteca de trayectorias, y una tabla opcional <c4/> para el tipo de escenario <c5/> que fusiona pseudodistancias de una constelación Walker SGP4 (todos los satélites en condición nominal, los pocos más altos cuando está degradado). En el paquete ferroviario, el acoplamiento estrecho mantiene la solución de grado de navegación en { "5.3" } m a través de una trinchera y un túnel, frente a { "12.9" } m con acoplamiento débil. Sin <c6/> el paquete no cambia (fijado). MODELLED.

# text
# c1: fusion::carrier_tc
seg-0daf8b2646ad = <b>Acoplamiento estrecho con fase de portadora</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, un EKF de estado de error con un reloj de receptor explícito de dos estados y ambigüedades de portadora flotantes, accionado por una constelación Walker SGP4 con correcciones de Klobuchar y Saastamoinen en el lazo de medida, detección de saltos por portadora diferenciada en el tiempo y reinicialización de ambigüedades, y una ejecución solo con código sobre las mismas medidas a modo de comparación. MODELLED: en un recorrido figure-8 la solución con portadora es de { "2.5" } cm frente a { "47" } cm solo con código, y NIS/NEES son coherentes entre semillas.

# text
# c1: gnss-ins
# c2: [trajectory]
# c3: profile = "straight" | "figure8" | "stop_go" | "aircraft" | "uas" | "csv"
# c4: csv
# c5: t, lat, lon, alt, vn, ve, vd, roll, pitch, yaw
seg-7032646c0bc4 = <b>Biblioteca de trayectorias GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): el tipo de escenario <c1/> admite una tabla opcional <c2/> con <c3/>. Los perfiles ordenan velocidades de Euler y aceleración a lo largo de la trayectoria a partir del estado verdadero y derivan la IMU verdadera a partir de la cinemática de sólido rígido (giros coordinados, ascensos, Coriolis); <c4/> importa una trayectoria verdadera (<c5/>) y resuelve la IMU que la reproduce. Sin la tabla, el paquete vuela su recorrido histórico, bit a bit (fijado). MODELLED.

# text
# c1: [terrain] dem_tile_path
# c2: realdata::lola_dem
# c3: dem_path
# c4: lunar-station-coverage
# c5: moonlight-service-volume
# c6: terrain.dem_tile
# c7: realdata::lola_dem
seg-e6b31bf61185 = <b>Teselas DEM de latitud/longitud para el horizonte lunar</b>: <c1/> lee una tesela de texto <c2/> (alturas sobre la esfera media en una cuadrícula de latitud/longitud) en lugar de la estereográfica polar <c3/>, tanto para <c4/> como para <c5/>; el informe repite la tesela (<c6/>, con su SHA-256). <c7/> ahora está conectado al avance de rayos del horizonte. Una tesela remuestreada a partir del recorte incluido da a la estación el horizonte del recorte hasta { "0.22" } deg. MODELLED.

# text
# c1: terrain
# c2: moonlight-service-volume
# c3: clears_terrain
# c4: export_site_terrain
seg-0c7ebb6c7d0d = <b>Terreno en el sitio de exportación del volumen de servicio</b>: con una sección <c1/>, cada fila de la exportación de geometría por satélite de <c2/> incluye <c3/> (el satélite supera la máscara plana y el horizonte del sitio de exportación en su acimut), el informe incluye el horizonte del sitio (<c4/>), y el CSV de tiempo de ejecución incorpora la columna. Sin terreno, la exportación no cambia. MODELLED.

# text
# c1: kshana::api::HEADLINE_FIELDS
# c2: field_importance_json()
# c3: field_importance()
# c4: jammers[].eirp_dbw
# c5: tests/field_importance.rs
seg-7c8789777c26 = <b>Campos principales desde el motor</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> y el <c3/> de WebAssembly indican, para doce tipos de escenario, qué campos de un escenario responden a su pregunta, los mejores primero, como rutas con puntos (<c4/>). Studio los lee antes que su propia clasificación. Solo metadatos de presentación: el motor nunca los lee, ningún archivo de escenario los necesita, ningún resultado depende de ellos. <c5/> falla si un tipo de escenario no es despachable o si una ruta no se encuentra en ninguno de los escenarios incluidos del tipo (detectó dos rutas que los identificadores aplanados de Studio habían escrito sin los corchetes de matriz).

# text
# c1: kshana::api::KIND_MODULES
# c2: kind_modules_json()
# c3: kind_modules()
# c4: tests/kind_modules.rs
seg-7528700924b2 = <b>Tabla de tipo de escenario a módulo desde el motor</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> y el <c3/> de WebAssembly dan, para cada tipo de escenario cuyas filas de la matriz de verificación nombran un módulo distinto del suyo, los nombres de módulo. El mapa de capacidades de Studio usaba su propia copia escrita a mano; <c4/> falla si un tipo de escenario de la tabla no es despachable o si un módulo no aparece en ninguna fila de la matriz. Ninguna salida cambió.

# text
# c1: iq_signals()
# c2: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
# c3: iq::cli
# c4: iq::scene::synthetic
# c5: iq::signals::by_name
# c6: web/smoke.mjs
# c7: tests/fixtures/iq_short_golden.json
seg-af7d28b7fb0e = <b>Ejecución IQ corta en la compilación para navegador</b> ({ "0.36" }): <c1/> y <c2/> en el módulo WebAssembly construyen una escena sintética, adquieren cada satélite y siguen los adquiridos, todo en memoria, limitado a { "0.25" } s, { "1 000 000" } muestras y { "8" } satélites. El constructor de escenas y la búsqueda de señales por nombre se trasladaron fuera de <c3/>, exclusivo de la versión nativa (a <c4/> y <c5/>), de modo que ambas compilaciones los comparten; la salida de la línea de comandos no cambia. La prueba nativa y <c6/> comparan la misma solicitud con un único valor de referencia (<c7/>), byte a byte: desde el cambio de matemáticas portables (STUDIO-15, más abajo) la compilación para navegador y la nativa dan los mismos bits.

# text
# c1: kshana.pyi
# c2: ScenarioKind
# c3: ErrorKind
# c4: ProvenanceClass
# c5: KindMeta
# c6: FieldUnit
# c7: scenario_kinds()
# c8: error_kind()
# c9: run_typed
# c10: RunOutput
# c11: data
# c12: scenario_kinds
# c13: KindMeta[]
# c14: kshana.d.ts
# c15: error_kind
# c16: ErrorKind | ""
# c17: tests/typed_api_sync.rs
seg-c0eab9b97b7d = <b>API tipadas de Python y TypeScript</b> (CAP-34): <c1/> tipa los vocabularios cerrados (<c2/>, el nombre de cada tipo de escenario; <c3/>; <c4/>) y los diccionarios <c5/> y <c6/>; <c7/> y <c8/> los devuelven. El paquete WebAssembly añade <c9/> (una ejecución como objeto <c10/> tipado con el documento analizado como <c11/>) y <c12/> (el <c13/> analizado), y su <c14/> incluye el mismo vocabulario; <c15/> se tipa como <c16/>. <c17/> mantiene ambas listas iguales a las del motor.

# text
# c1: sweep-nd
# c2: sweep-nd
# c3: key_units
# c4: metric_units
# c5: unit
# c6: null
# c7: points[].coords[]
# c8: points[].metrics[]
seg-b097c2f105c3 = <b>Unidades para cada columna de <c1/></b> (FUT-28): un resultado de <c2/> ahora incluye <c3/> y <c4/>, la unidad de cada clave barrida y de cada métrica registrada, leídas de la propia tabla de unidades del paquete barrido. Un eje puede declarar <c5/> para una clave que el paquete no repite; una unidad declarada que contradice la del paquete se rechaza, y una unidad que ninguno aporta es <c6/>, nunca supuesta. <c7/> y <c8/> están descritos, de modo que cada uno de los { "76" } tipos de escenario queda ahora totalmente cubierto por la puerta de unidades de campo (techo de tipos de escenario sin cubrir { "1" } -> { "0" }).

# text
# c1: RunOutput
# c2: RunOutput
# c3: array(path)
# c4: columns(path)
# c5: series()
# c6: numpy.ndarray
# c7: numpy.asarray
# c8: data()
# c9: kshana.pyi
seg-3a83af8daa43 = <b>Matrices NumPy desde <c1/></b> (FUT-26): el <c2/> de Python incorpora <c3/>, <c4/> y <c5/>, que devuelven <c6/> para una lista numérica, las columnas numéricas de una lista de registros o cada serie de registros del documento. Cada matriz es igual a <c7/> de los mismos valores de <c8/> (dtype y bits). NumPy se importa solo cuando se llama a una de ellas y no figura en los requisitos de ejecución. Tipado en <c9/> y comprobado con stubtest.

# text
# c1: campaign
# c2: [optimize]
# c3: trace
# c4: scenarios/campaign-optimize-link-budget.toml
# c5: docs/design/evidence/cap32-optimize/
seg-1c7a22dabad3 = <b>Optimizador de campañas</b> (CAP-32): la nueva sección opcional <c2/> del tipo de escenario <c1/> busca una a tres claves de escenario dentro de límites declarados para el mejor valor de una métrica: minimizar, maximizar o alcanzar un objetivo. Busca de forma exhaustiva en una cuadrícula, o con un símplex de Nelder–Mead acotado determinista. Cada evaluación es una ejecución real del tipo de escenario nombrado y se lista en el <c3/> del resultado. Ejemplo: <c4/>. Los umbrales se preregistraron (<c5/>):

# text
seg-f4e79236b6bf = la función de Rosenbrock se alcanza (f* = { "1.7e-20" });

# text
seg-3dbe3fdfebcf = una resolución de objetivo 1-D de forma cerrada se alcanza ({ "6e-15" } relativo);

# text
seg-5ab478e03354 = la cuadrícula es igual bit a bit a una fuerza bruta independiente;

# text
seg-ea0a04c6e713 = el símplex lo hace al menos tan bien como una cuadrícula de { "41" } × { "41" } en { "177" } ejecuciones.

# text
seg-161d8c5b55e8 = El umbral 1-D de la ronda { "1" } se registra como NOT MET, porque el recuadro preregistrado excluía la solución. MODELLED; fila del registro "Optimización acotada de una métrica sobre parámetros de campaña". Aditivo: las campañas sin la sección no cambian.

# text
# c1: docs/CALIBRATION-ENSEMBLES.md
# c2: gen_calibration_ensembles
# c3: docs/data/calibration-ensembles.csv
seg-83d40a636fcb = <b>Conjuntos de calibración</b> (CAP-10): tres comprobaciones de una sola semilla repetidas con { "200" } semillas independientes frente a umbrales preregistrados, en <a1><c1/></a1> (generado por <c2/>; valores por semilla en <c3/>).

# text
seg-b163e53e06e9 = El intervalo del { "95" } % del bootstrap del Monte Carlo de campaña cubre la media verdadera en { "192" } de { "200" } conjuntos, y su comprobación de chi cuadrado pasa en { "196" }.

# text
seg-022a7fbee13a = La tolerancia de percentil de una sola semilla pasa solo en { "183" } de { "200" }: NOT MET, como se había predicho. Es un umbral de unos 2 sigma, registrado y no relajado.

# text
seg-096f36d21b02 = Las calibraciones de ADEV de FM blanca pasan en cada semilla, con su peor error muy por dentro de la tolerancia.

# text
# c1: Scenario
# c2: BuiltinKind
# c3: api::BuiltinKind
# c4: append_figure_tiers
# c5: inertial
# c6: spoof
# c7: passes
# c8: link-budget
# c9: jamming
# c10: tests/scenario_output_manifest.rs
seg-369c7f2a115c = <b>Tipos de escenario integrados mediante el trait <c1/></b> (FUT-27, en curso): el trait <c2/> (<c3/>, con un gancho de nivel por cifra y <c4/>), y los primeros tipos de escenario trasladados a él (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). La salida no cambia: un manifiesto de todo el catálogo con el SHA-256 de cada salida es idéntico antes y después (<c10/>).

# text
# c1: tests/playground_no_fetch.rs
seg-fd6e68ff5e5d = <b>Comprobación de no descarga del playground</b> (RM-07): <c1/> comprueba tres cosas:

# text
seg-3e424188f6e1 = cada escenario de la biblioteca de Studio está en el paquete del navegador;

# text
# c1: scenarios/
seg-2803ccf8b9ae = el paquete es idéntico byte a byte a <c1/>;

# text
seg-b98016a4a844 = cada escenario del navegador se ejecuta desde un directorio de trabajo vacío.

# text
# c1: gravity-map
# c2: [reference]
# c3: .gfc
# c4: gfc_path
# c5: gps-denied-gravity-nav-egm2008
# c6: [map_error_mc]
# c7: gravity-map-error-mc
# c8: combined-altpnt
# c9: [magnetic_grid]
# c10: csv_path
# c11: column
# c12: tools/fetch_emag2_tile.py
# c13: altpnt::sequential::run_sequential_trn_on_map
# c14: xval/terrain-slam-rbpf/
# c15: terrain-slam
# c16: xval/srtm-ungate/
seg-efc143b4f2a9 = <b>Mapas de Alt-PNT: campo gravitatorio real, Monte Carlo de error de mapa, SRTM a resolución completa</b> ({ "0.36" }, WP-10). El tipo de escenario <c1/> admite un <c2/> opcional: una anomalía gravitatoria sintetizada a partir de los coeficientes EGM2008 incluidos (o de un archivo <c3/> de ICGEM mediante <c4/>, solo en compilaciones nativas). Esa síntesis coincide con el ICGEM Calculation Service hasta unos { "1e-8" } mGal en { "794" } nodos de dos regiones, frente a umbrales preregistrados de { "0.005" } mGal de RMS y { "0.02" } mGal de máximo (VALIDATED; fila del registro "Síntesis de anomalías gravitatorias a partir de un modelo de armónicos esféricos"). El nuevo escenario incluido <c5/> ejecuta el benchmark de 60 minutos sobre ese campo real de grado 70. Resultado preregistrado: error de correlación { "3106" } m, por lo que el umbral de < { "500" } m es NOT MET, como se había predicho (el grado { "70" } es demasiado suave), y la reducción por un factor de diez de la deriva es MET (MODELLED). Una tabla opcional <c6/> repite el benchmark con errores de mapa gaussianos correlacionados y con semilla, e informa de la distribución del error de correlación (escenario incluido <c7/>). Exploratorio y no preregistrado: con un error de mapa de { "2" } mGal correlacionado en { "0.2" } deg (el tamaño que presupuesta la propia sigma del correlador), { "1" } de { "20" } realizaciones se mantiene dentro de { "500" } m (mediana { "2.9" } km, p95 { "14.7" } km), frente a { "144" } m con un mapa perfecto. La solución de menos de 500 m del benchmark sintético supone que el mapa es exacto. Sin ninguna de las dos opciones, el documento es idéntico byte a byte al de versiones anteriores. <c8/> admite un <c9/> opcional (<c10/>, <c11/>) que lee el canal magnético de un CSV en formato EMAG2v3. EMAG2 no se incorpora porque sus términos no son explícitos: <c12/> lo obtiene con un SHA-256 fijado y recorta un recuadro. No se afirma ningún resultado de navegación sobre la cuadrícula real de EMAG2. Estimación conjunta del mapa (SLAM de terreno, RM-18): <c13/> hace volar el navegador secuencial de terreno sobre un mapa almacenado que difiere de la verdad, ya sea confiando en él o estimando una corrección de mapa por celda con un filtro Rao-Blackwellizado al estilo FastSLAM. Preregistrado frente a SITAN con mapa conocido con un error de mapa correlacionado de { "15" } m en { "20" } semillas: una ganancia media del { "1.5" } %, mejor en { "10" } de { "20" }, por lo que ambos umbrales de mejora son NOT MET ({ "10" } % y { "12" } de { "20" }), sin perjuicio con un mapa perfecto (MET). Una sola pasada sin revisitas no permite aprender el mapa (<c14/>, MODELLED). Los documentos de <c15/> son idénticos byte a byte. Las pruebas con SRTM real ahora se ejecutan en CI sobre dos recortes confirmados a resolución completa; todos los umbrales preregistrados se alcanzan, con el nodo más cercano igual a GDAL { "3.8.4" } en { "8" } de { "8" } puntos (<c16/>).

# text
seg-aa7ac7a47111 = <b>Interoperabilidad, WP-08</b> ({ "0.36" }; cada elemento preregistrado y confirmado por separado antes de su ejecución de referencia independiente, cada uno una nueva fila VALIDATED del registro, salvo el elemento de telemetría, que amplía una fila existente):

# text
# c1: src/odm.rs
# c2: OmmMessage::from_omm_file
# c3: OmmFile::to_omm_kvn
# c4: ELEMENT_SET_NO
# c5: COMMENT
# c6: BTERM
# c7: BSTAR
# c8: META_START
seg-a5d0b22337d7 = <b>Mensajes de datos de órbita CCSDS</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 y OCM { "3.0" } (bloques TRAJ, PHYS, COV, MAN, USER) escritos y leídos en KVN y NDM/XML, y un OMM de precisión completa a partir de un conjunto de elementos SGP4 (<c2/>); la salida de <c3/> no cambia. Frente a Orekit { "13.1.8" } en ambos sentidos: { "27" } de { "30" } mensajes de Kshana se analizan en Orekit y Kshana lee todos los escritos por Orekit, con valores dentro de { "1e-14" } relativo y épocas dentro de { "1e-9" } s; cuatro hallazgos fijados (Orekit exige <c4/>, rechaza <c5/> en los parámetros definidos por el usuario en XML, no escribe <c6/> sin <c7/>, y lee las épocas relativas de OCM en TDB en segundos SI). El <c8/> del escritor OMM heredado es rechazado por Orekit (registrado). Fila "Mensajes de datos de órbita CCSDS (OPM, OMM, OCM)".

# text
# c1: src/adm.rs
# c2: src/ndm_xml.rs
# c3: MAN_DELTA_MASS
seg-39c70cb59f31 = <b>Mensajes de datos de actitud CCSDS</b> (<c1/>, <c2/>): AEM 2.0/1.0 y APM { "2.0" } en KVN y XML frente a Orekit { "13.1.8" }, todos los umbrales alcanzados; el escritor APM de Orekit rechaza una maniobra sin <c3/> (fijado). Fila "Mensajes de datos de actitud CCSDS (AEM, APM)".

# text
# c1: src/spk_writer.rs
seg-bdfce382a98c = <b>Exportación SPICE SPK</b> (<c1/>): escritor y lector de SPK de tipos { "9" } y { "13" } y exportación de OEM a SPK; frente a CSPICE N0067 los kernels son idénticos byte a byte a los de SPICE y se evalúan de forma idéntica bit a bit. Fila "Exportación SPICE SPK (tipos { "9" } y { "13" })".

# text
# c1: src/spk_writer.rs
seg-ce217acb9fe7 = <b>SPICE SPK de tipos { "3" } y { "21" }</b> (<c1/>): segmentos de tipo { "3" } (Chebyshev) y de tipo { "21" } (líneas de diferencias extendidas) escritos a partir de registros dados y evaluados como lo hace SPICE; frente a CSPICE N0067 los kernels son idénticos byte a byte a los de SPICE y cada evaluación coincide bit a bit en ambos sentidos. Fila "SPICE SPK de tipos { "3" } y { "21" } (Chebyshev, líneas de diferencias extendidas)".

# text
# c1: src/space_packet.rs
# c2: crc_hqx
seg-72b8edbc74dc = <b>Extensiones de Space Packet</b> (<c1/>): cabecera secundaria con códigos de tiempo CUC/CDS, control de errores de paquete, segmentación y comprobaciones de flujo, frente a ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } y <c2/> de CPython, con cero discrepancias. Fila "Cabecera secundaria, control de errores de paquete y segmentación de CCSDS Space Packet".

# text
# c1: class
# c2: check metrics
seg-c5fcf933b656 = <b>Esquema de telemetría { "1.3" } mediante consumidores reales</b>: la exposición Prometheus y el JSON OTLP/HTTP de un flujo sintético de esquema 1.3, incluida la serie de geometría y la etiqueta <c1/>, leídos exactamente por prometheus_client y el proto de OTLP, aceptados por promtool { "3.5.0" } <c2/> sin ningún problema de lint, y pasados sin cambios por el OpenTelemetry Collector contrib { "0.135.0" } (condicionado a datos: herramientas obtenidas con SHA-256 fijados, salidas confirmadas).

# text
# c1: mars_od::fit_damped
# c2: xval/mro-od/PREREGISTRATION-RUN2.md
# c3: docs/revisions
seg-013344665417 = <b>Determinación de órbita de Marte, ejecución { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> escala la matriz normal por su diagonal y amortigua el paso (Levenberg-Marquardt), después de que el ajuste de Gauss-Newton registrado fallara con una matriz cuya diagonal bruta abarca ocho órdenes de magnitud. Registrado por separado (<c2/>, mismo arco, umbrales y edición). En los pasos de MRO puntuados, la órbita está a { "0.36" } km de RMS ({ "0.53" } km como máximo) de la reconstrucción de navegación de MRO, umbrales alcanzados. El Doppler posajuste es { "48.6" } mHz frente al umbral de { "30" } mHz, no alcanzado (hallazgo fijado). Una enmienda solo de puntuación, R2-A1, se declara en <c3/>. La fila sigue siendo MODELLED.

# text
# c1: mars_od
# c2: naif_kernel
# c3: gravity_sh::from_shadr
# c4: scripts/fetch_mro_od.sh
seg-fee311480417 = <b>Modelo Doppler 2-way con rampa de Marte y determinación de órbita</b> ({ "0.36" }, WP-14, parte de CAP-30, etapa { "2" }): <c1/> predice el Doppler 2-way en banda X con rampa de la DSN a partir de las tablas de rampa de ODF (tiempo de luz, Shapiro, troposfera, hora de estación, estaciones de la DSN mediante la cadena del CIO y EOP del IERS) y ajusta un orbitador de Marte (GMM-3, terceros cuerpos, SRP, arrastre). <c2/> lee SPK de tipo { "1" } (comprobado frente a CSPICE) y <c3/> lee campos SHADR de PDS. Preregistrado frente a la reconstrucción de navegación de MRO con pasos reales de MRO (condicionado a datos, <c4/>, CI mensual): el Doppler predicho coincide con las observaciones hasta { "12.5" } mHz (umbral { "30" } mHz, alcanzado); el ajuste de órbita registrado falló en el arco puntuado y no produjo ninguna órbita (hallazgo fijado). La fila sigue siendo MODELLED.

# text
# c1: odf::parse_odf
seg-d8212aa309ef = <b>Lector de Orbit Data File de la DSN</b> ({ "0.36" }, WP-14, parte de CAP-30): <c1/> lee ODF TRK-2-18. Con un ODF real de Mars Reconnaissance Orbiter (NASA PDS, incorporado), el lector coincide con el recuento de registros, las posiciones de grupo, las estaciones y las horas de la etiqueta de PDS, y todos sus tipos de datos son conocidos. La tabla de fin de archivo de la etiqueta tiene una fila menos que el archivo, una inconsistencia de la etiqueta registrada como hallazgo. MODELLED. Todavía no se ha hecho la determinación de órbita con estos datos.

# text
# c1: time-transfer-budget
seg-bf26920a50bc = <b>Presupuesto de TWSTFT y estabilidad de transferencia de tiempo: el tipo de escenario <c1/></b> ({ "0.36" }, WP-14, FUT-19).

# text
seg-6038e0d04f89 = Ecuación bidireccional:

# text
# c1: twstft_budget
seg-c1fdd431db57 = <c1/> la resuelve para T_A − T_B con retardos de equipos de estación, la asimetría ionosférica ascendente/descendente en banda Ku, la diferencia de retardo del transpondedor y los términos de Sagnac, y recupera el modelo directo hasta { "1e-15" } s.

# text
seg-a5468765380d = <b>Presupuesto de incertidumbre:</b> combinado en cuadratura, con el TDEV del enlace como término de tipo A.

# text
# c1: timetransfer
seg-7f365f91bb3e = <b>Ruido del enlace:</b> la serie bidireccional incorpora un piso de ruido de fase flicker, una no reciprocidad diurna y un residuo de reciprocidad constante. El paquete <c1/> de jitter blanco no cambia.

# text
# c1: MJD,ns
seg-8b40e74db08c = <b>Serie real:</b> la estabilidad de series aportadas de la Circular T del BIPM, CSV <c1/> o de reloj de estación del IGS.

# text
# c1: time-transfer-budget
seg-267fd20d823c = MODELLED. Nuevo escenario incluido <c1/>. La solución de tiempo PPP está VALIDATED por separado frente al reloj de estación del IGS en la rama de datos reales de GNSS.

# text
seg-ae33b92da4a6 = <b>Calentamiento de entrada, radiometría de observación de la Tierra y pérdidas de ascenso</b> ({ "0.36" }, WP-14, CAP-28): tres nuevos tipos de escenario.

# text
# c1: entry-heating
seg-34951878aa49 = <c1/>: una entrada de masa puntual de 3 grados de libertad sobre una Tierra o un Marte en rotación con calentamiento en el punto de estancamiento de Sutton-Graves.

# text
# c1: eo-radiometry
seg-98fe7a4c464a = <c1/>: SNR del generador de imágenes, MTF en Nyquist, respuesta relativa de borde y NIIRS de GIQE { "4" }.

# text
# c1: ascent-losses
seg-173dfbe3cc3e = <c1/>: un ascenso con viraje por gravedad de varias etapas con pérdidas por gravedad, arrastre, dirección y contrapresión, comprobado mediante la identidad exacta de dv ideal menos pérdidas.

# text
# c1: reentry::us76_pressure
# c2: entry-heating-stardust
# c3: eo-radiometry
# c4: ascent-losses
# c5: docs/ENTRY-EO-ASCENT.md
seg-0c9e7aacec80 = La deceleración máxima de la entrada se comprobó frente al valor nominal publicado de Stardust con un umbral preregistrado: { "35.44" } g frente a { "33.4" } g (+{ "6.1" } %, umbral { "10" } %). Esa fila es VALIDATED. El calentamiento, la radiometría y el ascenso son MODELLED. También son nuevos: <c1/>, los escenarios incluidos <c2/>, <c3/> y <c4/>, y <c5/>.

# text
# c1: aocs
# c2: aocs
# c3: aocs_mekf
# c4: aocs-slew
# c5: aocs-slew-mekf
# c6: docs/AOCS.md
seg-d4648c4e6655 = <b>Control de actitud con ruedas de reacción: el tipo de escenario <c1/></b> ({ "0.36" }, WP-14, CAP-21). Un giro de apuntamiento inercial de un cuerpo rígido con tres o más ruedas de reacción equilibradas bajo realimentación MRP, con pares de rueda de norma mínima recortados al límite de cada motor (<c2/>). También puede cerrar el lazo sobre un EKF multiplicativo a partir de un giróscopo y un seguidor estelar simulados (<c3/>). El lazo de estado verdadero se comparó con Basilisk { "2.9.1" } en tres casos preregistrados antes de que existiera el código (tres ruedas ortogonales, una pirámide de cuatro ruedas, un caso de saturación). Cada componente MRP, velocidad del cuerpo, velocidad de rueda y par motor coincidió en cada muestra, con un peor caso de { "2.4e-14" } en sigma y { "2.9e-11" } rad/s en velocidad de rueda. Esta fila es VALIDATED; el MEKF es MODELLED (coherencia NEES). Nuevos escenarios incluidos <c4/> y <c5/>, y <c6/>.

# text
# c1: acm-link
# c2: contact-schedule
# c3: acm-link
# c4: contact-schedule
# c5: docs/CONTACT-SCHEDULING.md
seg-8ce699586340 = <b>Planificación de contactos con tierra y ACM de DVB-S2</b> ({ "0.36" }, WP-14, CAP-22/23): dos nuevos tipos de escenario. <c1/> da, para un satélite sobre una estación, el Es/N0 de cada paso y el MODCOD de DVB-S2 elegido a lo largo de él (umbrales de la Tabla { "13" } de ETSI EN { "302" } 307-1 más un margen). También da el volumen de datos que mueve el ACM frente a la línea base de codificación constante. <c2/> hace lo mismo para varios satélites sobre varias estaciones y construye un plan de contactos sin conflictos (tiempo de reorientación de la antena, una estación por satélite, entrega ponderada por prioridad limitada a cada acumulación pendiente). Informa de un plan voraz de valor marginal, una línea base por orden de llegada y el óptimo exacto en conjuntos pequeños, con la brecha de optimalidad del voraz. Las ventanas de acceso proceden del predictor de pasos aparentes VALIDATED. Nuevos escenarios incluidos <c3/> y <c4/> (entradas ilustrativas) y <c5/>. MODELLED (dos nuevas filas del registro).

# text
# c1: leo-pvt
# c2: starlink-sop
# c3: tests/starlink_doppler_published_proxy.rs
seg-cd6dbcc3a78b = <b>Posicionamiento Doppler con Starlink frente a un experimento publicado</b> ({ "0.36" }, WP-14, parte de CAP-11, MODELLED). Es una comparación indirecta preregistrada del modo Doppler de <c1/> con el preajuste <c2/> frente a los percentiles del conjunto de datos 3 de "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). El modelo usó { "3" } satélites (una máscara de { "47" } deg elegida con una regla fija), sin ayuda de altura y con una sigma Doppler de { "30" } Hz, con { "200" } semillas. Su error 3-D del percentil 90 es { "92.2" } m a { "20" } s y { "870" } m a { "8" } s, frente a los { "2" } m y { "10" } m publicados, por lo que ambos umbrales de factor dos son NOT MET. El modelo es pesimista, no optimista como se había predicho: tres satélites fijos dan mucha menos diversidad geométrica que los { "63" } satélites del experimento durante { "10" } minutos con cambio de canal cada { "15" } s. Ambos fallos se afirman (<c3/>).

# text
# c1: maneuver::optimise_transfer_kernel
# c2: porkchop_kernel
seg-ffeb1b66cda5 = <b>Optimizador de transferencias impulsivas sobre DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> halla las fechas de salida y llegada de una transferencia balística de dos impulsos de una sola revolución que minimizan el C3 de salida o el V-infinito de llegada dentro del Tipo I o el Tipo II. Busca en una cuadrícula de 2 días y luego refina con Nelder-Mead 2-D, sobre estados heliocéntricos del kernel DE440; se apoya en <c2/>. La comparación se preregistró (bf0439e8) frente a un optimizador independiente con SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } sobre la oportunidad Tierra-Marte de { "2026" }: las cuatro optimizaciones coinciden hasta { "8.7e-13" } relativo, con fechas dentro de { "1e-5" } días (VALIDATED, nueva fila del registro). Como referencia publicada secundaria, NASA/TM-2010-216764 (el manual Tierra-Marte 2026-2045) coincide en el C3 mínimo del Tipo II ({ "9.182" } frente a { "9.144" }) y en el V-infinito de llegada mínimo del Tipo II ({ "2.564" } frente a { "2.565" }). Su C3 mínimo del Tipo I no coincide: { "10.535" } frente a { "11.11" } (-5.18 %), donde la referencia independiente de la biblioteca coincide con Kshana. Ese fallo se registra y se afirma.

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
# c2: lunar-station-coverage
# c3: lunar-differential-pnt
seg-91fe2e2625a1 = <b>Estudio de la estación de referencia lunar</b> ({ "0.36" }, motivado por material publicado sobre una estación de referencia prevista en el polo sur lunar; fuentes en <a1><c1/></a1>): el tipo de escenario <c2/>, un barrido de Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios polar sur y un día de épocas, que da por punto y sobre la región el error corregido y sin corregir por percentiles, la disponibilidad con sus motivos, la cobertura frente a un umbral declarado, los niveles de protección, el radio de cobertura por acimut y el presupuesto del enlace de correcciones. Se reduce exactamente a <c3/> en un punto, una época y un ensayo; su aritmética se recalculó con numpy con un umbral preregistrado (posiciones y percentiles alcanzados; las correcciones de la estación no alcanzaron el suyo por redondeo de doble precisión, registrado). MODELLED; fila del registro "Mapa de cobertura y exactitud de la estación de referencia lunar". Sin afiliación ni respaldo de ninguna agencia; ninguna afirmación sobre el rendimiento de ningún sistema real.

# text
# c1: docs/predictions/lunar-reference-station.md
# c2: lunar-station-coverage
# c3: tests/prediction_frozen.rs
# c4: docs/VALIDATION.md
seg-3d0cd9692787 = <b>Predicción preregistrada: cobertura de la estación de referencia lunar</b> (no es una validación; MODELLED). <a1><c1/></a1> congela, en el commit c05dac1d, los resultados de <c2/> bajo los supuestos declarados públicamente, con hashes SHA-256 de las entradas y los resultados y un protocolo de puntuación fijado ahora (factor { "2" } para exactitudes y niveles de protección, { "10" } puntos porcentuales para disponibilidad y cobertura; un supuesto modificado recibe una nueva predicción fechada, nunca una edición; un fallo se publica con tanta visibilidad como un acierto). Cada cifra está dominada por el conjunto de elementos no publicado de la constelación de cuatro satélites, que es ILLUSTRATIVE, y así se indica. <c3/> la protege; <c4/> incorpora una sección "Predicciones preregistradas". Ninguna fila del registro.

# text
# c1: lunar-station-coverage
# c2: [receiver]
# c3: a + b exp(-el / el0)
# c4: orbit_err_growth_m_per_s
# c5: [solution]
seg-00ec7ccd4d0d = <b>Extensiones de la estación de referencia lunar</b> ({ "0.36" }; las limitaciones { "2" } y { "3" } del estudio de la estación y el estilo de solución de las fuentes), cada una opcional en <c1/> y ausente por defecto, de modo que todos los documentos existentes, incluida la predicción congelada, no cambian: <c2/> (multitrayecto <c3/> en el usuario y en la estación, el de la estación opcionalmente de Gauss-Markov a lo largo de las épocas, ruido de código del DLL a partir del C/N0, sesgos entre canales; valores ILLUSTRATIVE en la Luna); <c4/> (crecimiento lineal del error de la órbita difundida durante la latencia de la corrección, ILLUSTRATIVE); <c5/> (restricción de altura, un mínimo de tres satélites con ella, una ventana de usuario estático a lo largo de las épocas). Dos anexos a la comparación con las afirmaciones publicadas, cada uno preregistrado por separado antes de su ejecución, se sitúan junto a la ejecución registrada sin editar: K5 con crecimiento falla a todas las tasas; con el estilo de solución de las fuentes, K1 a K5 fallan y K6 pasa ({ "1" } de { "6" }), con el error 3-D corregido del percentil 95 de R300 bajando de { "280.6" } m a { "2.11" } m. MODELLED; tres filas del registro.

# text
# c1: [terrain]
# c2: lunar-station-coverage
# c3: moonlight-service-volume
# c4: station_horizon
# c5: user_horizon
# c6: dem_path
# c7: LDEM_75S_240M
# c8: data/lunar-dem/
# c9: scripts/make_lola_south_polar_crop.py
# c10: scenarios/lunar-station-coverage-terrain.toml
seg-1d0a0dcd42de = <b>Máscaras de horizonte del terreno lunar</b> ({ "0.36" }; la primera limitación del estudio de la estación de referencia lunar): una sección opcional <c1/> en <c2/> (la estación y cada punto de usuario) y <c3/> (cada punto de la cuadrícula) da a cada sitio un horizonte dependiente del acimut en el formato de tabla de línea del horizonte de { "0.36" }, a partir de un perfil declarado etiquetado con su fuente (<c4/>, <c5/>) o un avance de rayos sobre un DEM polar (<c6/>) a lo largo de círculos máximos de la esfera lunar con curvatura exacta, o ambos. Incorpora un recorte de { "0.98" } MB del DEM polar sur LRO LOLA <c7/> de dominio público, remuestreado por media de bloques de { "5" } x { "5" } a { "1200" } m (<c8/>, con su NOTICE, SHA-256 y <c9/>), y el escenario solo de repositorio <c10/>. Comprobado frente a horizontes de forma cerrada (esfera desnuda, cráter en una meseta, cono rasterizado); MODELLED, fila del registro "Máscaras de horizonte del terreno lunar a partir de un perfil declarado o un DEM polar". Sin la sección, todos los documentos, incluido el bloque de unidades, son idénticos byte a byte.

# text
# c1: receiver-trust
# c2: good
# c3: degraded
# c4: few-satellites
# c5: high-pdop
# c6: high-hdop
# c7: sky-blocked
# c8: unknown
# c9: orbit::dop
# c10: good
# c11: fair
# c12: poor
# c13: geometry
# c14: geometry
# c15: environment
# c16: inconsistency
# c17: loss-of-lock
# c18: geometry
# c19: inconsistency
# c20: [geometry]
# c21: signal_loss
# c22: environment
# c23: cap_points
# c24: full_ratio
# c25: floor
# c26: degraded_min
# c27: [geometry]
# c28: min(cap_points, 100 - floor)
# c29: [score]
# c30: degraded_min
# c31: degraded_min
seg-ca0c6ca7396a = <b>Confianza consciente de la geometría</b> (nota de diseño de geometría de { "0.36" }, sección { "4" }). Cada época de <c1/>, estática o de buque, por lotes o en vivo, lleva su geometría de satélites: <c2/>, <c3/> (motivos <c4/>, <c5/>, <c6/>, e informativo <c7/>) o <c8/> cuando el registro no da geometría de satélites, con HDOP, PDOP, VDOP y los satélites utilizados. Se deriva de las elevaciones y los acimuts que informa el receptor (NMEA GSV, UBX NAV-SAT) mediante el kernel <c9/> existente, o se toma de NMEA GSA. Cada época también lleva una etiqueta, <c10/>, <c11/> o <c12/>, siempre informada y nunca puntuada, y una nota con el HDOP, el PDOP, el VDOP, el número de satélites y la pérdida de señal en palabras. La puntuación de un buque incorpora un monitor <c13/> que no descuenta nada salvo que la geometría sea mala (HDOP por encima de { "4" }, PDOP por encima de { "6" } o menos de { "5" } satélites utilizados), y entonces aumenta gradualmente hasta un tope de { "15" } puntos; la geometría por sí sola alcanza como máximo la banda degradada, nunca la no fiable (sin alarma). Cada descuento recibe una clase, <c14/>, <c15/> o <c16/>, de modo que un cielo malo no se lea como un ataque. <c17/> es <c18/> cuando los satélites perdidos estaban todos por debajo de { "15" } grados en su último informe; un descuento por mala geometría es <c19/> cuando el HDOP que declara el receptor discrepa de su cielo declarado en más de max({ "1.0" }, { "25" } % del HDOP derivado), de modo que un cielo malo falsificado no puede comprar la etiqueta. Una nueva tabla <c20/> declara cada umbral con su procedencia (HDOP { "4" }, PDOP { "6" }, al menos { "5" } utilizados, sigma_UERE { "1.5" } m, una tolerancia de HDOP de max({ "1.0" }, { "25" } % del HDOP derivado) con el { "25" } % como elección representativa para receptores con relojes por constelación o soluciones por subconjuntos, { "15" } grados; las cifras de IEC 61108-1 y de GPS SPS tal como se citan, por comprobar frente al texto de las normas). La pérdida total de señal no se etiqueta como cielo: cuando los satélites a la vista no se siguen y el DOP de los satélites a la vista es bueno (y los no seguidos no se concentran en una mitad del horizonte), la época lleva <c21/> y el descuento por geometría es <c22/>. Un HDOP o PDOP declarado de { "99" } o más, una calidad GGA de { "0" } y un modo GSA de { "1" } se leen como ausencia de solución, no como DOP. El tope (<c23/> { "15" }), el final de la rampa (<c24/> { "1.5" }) y el piso (<c25/>, por defecto el <c26/> de la puntuación) están en <c27/>, igual que los niveles buenos de la etiqueta (HDOP { "2" }, PDOP { "3" }, { "6" } satélites, representativos); el tope en vigor es <c28/>, de modo que una tabla <c29/> que eleve <c30/> (incluida una de { "0.35" }) reduce el tope en lugar de ser rechazada, y un piso por debajo de <c31/> se rechaza. MODELLED; Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
# c1: epochs[].geometry
# c2: class
# c3: geometry_model
# c4: geometry_summary
# c5: receiver_trust
# c6: assess_vessel_log
# c7: receiver_trust_replay
# c8: assess_*
# c9: epochs.json
# c10: config.json
# c11: trust-telemetry
# c12: kshana_trust_geometry*
# c13: class
# c14: kshana_trust_reason_active
# c15: kshana.geometry.*
# c16: cs6
# c17: cfp3
# c18: cfp4
# c19: geoStatus
# c20: geoHdop
# c21: geoClass
# c22: kshana_trust_geometry_label{label}
# c23: kshana_trust_geometry_vdop
# c24: kshana.geometry.label
# c25: kshana.geometry.vdop
# c26: geoLabel
# c27: geoPdop
# c28: geoVdop
# c29: geoUsed
# c30: cs6
# c31: cn1
# c32: geometry_summary.hdop_mismatch
# c33: degraded
# c34: kshana_trust_geometry_signal_loss
# c35: kshana.geometry.signal_loss
# c36: geoSignalLoss=1
# c37: environment
# c38: cs6
seg-d976d3495695 = La geometría llega a todas las superficies: el JSON de resultados (<c1/>, <c2/> en cada descuento, <c3/>, <c4/>), las líneas JSON en vivo (esquema { "1.3" }), los <c5/> de Python y WebAssembly, <c6/> y <c7/>, las herramientas <c8/> de MCP, los paquetes de evidencias (<c9/>, <c10/>, un carril de geometría en la página de resumen) y <c11/> (Prometheus <c12/> y una etiqueta <c13/> en <c14/>, OTLP <c15/>, campos personalizados de CEF <c16/> (estado y clases de geometría), <c17/> (HDOP) y <c18/> (PDOP), comprobados con ambos analizadores de referencia independiente de CEF, y LEEF <c19/>, <c20/>, <c21/>). La etiqueta de geometría también se exporta, añadida después de cada serie y campo anteriores y solo para las entradas que la llevan: Prometheus <c22/> y <c23/>, OTLP <c24/> y <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, y en CEF un tercer campo <c30/> (la etiqueta) y <c31/> (satélites utilizados); el VDOP no está en CEF (los campos personalizados de coma flotante están ocupados). Ambos analizadores de referencia independiente de CEF leen de vuelta los casos de etiqueta tal como se escribieron (enmienda { "5" }: { "176" } líneas, { "172" } analizadas por pycef, { "176" } por Logstash). Un HDOP declarado que el cielo declarado no explica se señala en cada época y se cuenta (<c32/>, una línea en la página de resumen de evidencias), y se puntúa solo cuando la geometría es mala. La pérdida de señal se exporta por separado, ya que el estado de la geometría sigue siendo <c33/> mientras dura: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; en CEF aparece como la clase <c37/> en <c38/>.

# text
# c1: orbit::dop_cofactor
# c2: (HᵀH)⁻¹
# c3: orbit::dop
seg-5030e5214ed0 = <c1/>: el factor de covarianza <c2/> que hay detrás de <c3/>, extraído de él con la misma aritmética.

# text
seg-c6cc061a3ed6 = Fila del registro "Error de posición por geometría: error RMS = sigma_UERE x DOP" (<b>MODELLED</b>, coherencia interna): un Monte Carlo con semilla de la solución de mínimos cuadrados del motor sobre las { "8" } geometrías DOP emparejadas con gnss_lib_py frente al factor de covarianza del kernel DOP validado, con tolerancias preregistradas antes de la primera ejecución y dos controles negativos que fallan como se requiere; junto a ella, una comprobación anterior sobre cuatro cielos elegidos a mano con intervalos de confianza de chi cuadrado, informada como ejecutada antes del preregistro.

# text
# c1: src/skyline.rs
# c2: docs/SKYLINE.md
# c3: max(mask_deg, skyline)
# c4: city-street
# c5: harbour-approach
# c6: fjord
# c7: container-terminal
# c8: [skyline]
# c9: gnss-sim
# c10: jamming
# c11: leo-pvt
# c12: leo-pass
# c13: nmea-scenario
# c14: orbit
# c15: integrity
# c16: user_site = { lat_deg, lon_deg, height_m }
# c17: epoch + t
# c18: epoch
# c19: user
# c20: skyline { source, open_fraction, provenance }
# c21: masked_by_skyline
# c22: orbit-urban-canyon-skyline
# c23: integrity-harbour-approach
# c24: gnss-sim-container-terminal-skyline
# c25: jamming-harbour-approach-skyline
# c26: leo-pvt-fjord-skyline
# c27: leo-vertical-autonomous-vehicle-skyline
seg-b87b6eafd465 = <b>Máscaras de línea del horizonte dependientes del acimut</b> (<c1/>, <a1><c2/></a1>, elemento { "1" } de la nota de diseño): un corte de elevación que depende del acimut, el máximo puntual de tablas (cada una interpolada por separado, envuelta en { "360" }°), un cañón urbano en forma cerrada (con extremos abiertos opcionales), sectores de borde afilado y un perfil de terreno con la curvatura de la Tierra; el corte efectivo es <c3/>. Cuatro preajustes REPRESENTATIVE con procedencia declarada (<c4/>, <c5/>, <c6/>, <c7/>), sobrescribibles campo a campo. Una sección opcional <c8/> en los archivos de entrenamiento <c9/>, <c10/>, <c11/> (todos los modos, incluido el barrido polar), <c12/> y <c13/>, y en <c14/> e <c15/> mediante un nuevo usuario de sitio en tierra, <c16/> (ángulos de observación geodésicos sobre la Tierra en rotación, con la vertical geodésica para la separación horizontal y vertical de ARAIM; cada muestra es un instante absoluto, <c17/>, al que se avanzan los conjuntos de elementos, las efemérides difundidas y los archivos SP3 desde sus propias épocas, fechadas desde la época de satélite más reciente cuando no se declara <c18/>; un <c19/> en órbita rechaza una línea del horizonte). Los resultados incorporan <c20/> y <c21/> por muestra. Sin la sección, todos los escenarios son idénticos byte a byte a { "0.35.0" }, comprobado frente a los resúmenes del commit de la versión. Seis ejemplos incluidos: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> y la campaña <c27/> (el cañón del vehículo autónomo como corte plano y como calle; la campaña existente no cambia). MODELLED.

# text
# c1: src/geometry.rs
# c2: sky_geometry
# c3: tle
# c4: epoch
# c5: sky_source
# c6: sky_statement
# c7: tle_skipped
# c8: sky_monte_carlo
# c9: skyline_presets
# c10: skyline_profile
# c11: skyplot_svg
# c12: orbit::dop_cov
# c13: orbit::dop
# c14: kshana sky
# c15: kshana skyline
# c16: sky_geometry
# c17: notebooks/geometry.ipynb
# c18: .md
# c19: tests/python/test_notebooks.py
seg-95cdecf341d6 = <b>Funciones de geometría del cielo</b> (<c1/>, elemento { "2" } de la nota de diseño): <c2/> (satélites visibles y enmascarados desde un sitio, una hora y preajustes de constelación, conjuntos de elementos de dos líneas (<c3/>, como máximo { "4" } MiB, propagados por el SGP4 del motor a una <c4/> UTC) o satélites dados; <c5/> y <c6/> indican si el cielo es representativo o el cielo que dan los conjuntos de elementos en esa época, no una medición; <c7/> lista cada línea sin usar con su motivo; límites de entrada de { "2000" } satélites sobre el horizonte, comprobados antes de construir una tabla de sistema, y { "16" } relojes de receptor; los cinco DOP; el cofactor y la covarianza ENU con un reloj por sistema o uno en común; la elipse de error horizontal a una sigma y con una confianza declarada), <c8/> (errores de mínimos cuadrados con semilla, como máximo { "5000" }), <c9/>, <c10/> y <c11/>. <c12/> expone la covarianza que hay detrás de <c13/>, que ahora es su reducción (los escalares validados no cambian). Superficies: <c14/> y <c15/>, funciones de Python y WASM con los mismos nombres, y la herramienta MCP <c16/> ({ "40" } herramientas), y el cuaderno <c17/> (con su réplica <c18/>; ejecutado por <c19/>). Cada resultado lleva la etiqueta MODELLED, la declaración del modelo de error y la declaración consultiva.

# text
# c1: TopocentricFrame
# c2: ElevationMask
# c3: get_dop
# c4: xval/orekit-skyline/
# c5: linalg.inv
# c6: linalg.eigh
# c7: xval/numpy-ellipse/
seg-9414d387cf79 = Registro: cinco filas de línea del horizonte y geometría del cielo. <b>VALIDATED</b>, cada una en una comparación preregistrada antes de ejecutar su referencia independiente: <em>Máscara de línea del horizonte dependiente del acimut: conjunto visible, acimut y elevación, y DOP bajo la máscara</em> frente a Orekit { "12.2" } (<c1/>, <c2/>) y gnss_lib_py { "1.0.4" } (<c3/>), peores diferencias de ángulo de observación y de máscara { "1.1e-12" }° frente a { "1e-9" }°, conjuntos visibles idénticos, DOP { "3.3e-13" } relativo (<c4/>); <em>Elipse de error horizontal y cofactor por sistema a partir de la covarianza de la geometría</em> frente a <c5/> y <c6/> de numpy (estándar P2), { "270" } casos, ejes { "5.1e-13" } relativo (<c7/>). <b>MODELLED</b>: las reducciones de cañón, sector y terreno; los preajustes; la composición de la geometría del cielo (cielo predefinido, nube de Monte Carlo).

# text
seg-8f5ebce999fe = Con las filas de confianza por geometría, línea del horizonte y estación de referencia lunar, el registro tiene { "274" } filas: { "134" } validadas, { "136" } modeladas, { "4" } de socio.

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: src/lunar_time_lab.rs
# c4: scenarios/lunar-station-time-lab.toml
seg-686b1211d7bb = <b>Estación de referencia lunar: laboratorio de tiempo de la estación</b> (<b>MODELLED</b>). Un bloque opcional <c1/> en <c2/> (<c3/>). Modela un reloj de estación (por defecto la clase miniRAFS, cualquier clase con nombre, o una ficha de dispositivo ajustada a puntos de estabilidad declarados) guiado a LTC y luego en funcionamiento libre o reguiado cada N segundos. Emite la curva de error de tiempo x(t), el tiempo hasta { "1" }, { "10" } y { "100" } ns (bisección junto a la forma cerrada) y el término dominante por horizonte, todo con unidades. El residuo de guiado es ILLUSTRATIVE. La tasa de LTC no se rederiva y conserva su propia fila VALIDATED. El objetivo de nivel de nanosegundos del material público de PNT lunar del ICG WG-B (junio de { "2024" }) se cita como declaración de la fuente, no como afirmación. El orden de relojes óptico < PHM < RAFS < miniRAFS se mantiene de { "1" } s a { "7e5" } s, y la prueba fija el cruce de las curvas de PHM y RAFS cerca de { "7.5e5" } s. Ese cruce es una propiedad de los modelos de reloj de un solo tipo de ruido (FM flicker pura frente a FM blanca pura), no un resultado físico. Sin el bloque, el informe, su tabla y su resumen no cambian. Ejemplo: <c4/>. Añade una fila del registro, etiquetada MODELLED.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: station_geodesy
# c5: lunar-frame-campaign
# c6: scenarios/lunar-station-geodesy-baseline.toml
# c7: -with-station.toml
seg-863c2c7a5f0b = <b>Estación de referencia lunar: geodesia de la estación</b> (<b>MODELLED</b>). Las entradas opcionales <c1/> y <c2/> en <c3/> añaden un bloque <c4/>. La información de datum de cinco matrices del segmento archivado de telemetría láser se combina con lo que aportarían un retrorreflector añadido y una baliza VLBI añadida en sitios declarados. El reflector se mide a las épocas archivadas en que puede ver, con sus pesos archivados. La baliza usa la red y el calendario de <c5/>, con las estaciones fijas. El bloque da cada 1-sigma de Helmert antes y después, y su razón. Son cotas de Cramér-Rao para un conjunto reducido de parámetros, sobre un calendario y un sitio ILLUSTRATIVE. Las entradas ausentes o vacías dejan el informe idéntico byte a byte. Ejemplos: <c6/> y <c7/>. Añade una fila del registro, etiquetada MODELLED.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
# c2: tests/fixtures/lunar_station/SOURCES.md
# c3: PREREGISTRATION.md
# c4: tests/lunar_station_published_oracle.rs
seg-45c6febcc7fc = <b>Estación de referencia lunar: comparación con afirmaciones publicadas</b> (<b>MODELLED</b>). Cada afirmación numérica de cinco fuentes públicas se lista con su redacción exacta, página y supuestos declarados, y se clasifica como comparable, parcialmente comparable o no comparable (<c1/>; fuentes con URL, fecha de obtención, SHA-256 y licencia en <c2/>). Las afirmaciones parcialmente comparables se puntuaron con seis umbrales unilaterales preregistrados antes de la ejecución (<c3/>, revisión { "2" }, 05bf9a19): { "1" } de { "6" } afirmaciones dentro del umbral preregistrado (preregistrado 05bf9a19). La cobertura es { "0.00" } frente a >= { "0.95" } en ambos círculos polares sur, y el p95 corregido es { "280.6" } m frente a <= { "1.5" } m. La causa son los elementos orbitales de los satélites, que ninguna fuente publica: con los elementos ILLUSTRATIVE del propio repositorio, cuatro satélites están a la vista en común en el { "8" } % de las épocas, con una geometría casi singular. La ejecución no reproduce las afirmaciones con esos elementos y no es evidencia de que las afirmaciones sean erróneas. Fijado en <c4/>. Una fila del registro, etiquetada MODELLED con el hallazgo.

# text
# c1: realdata::clk::rinex_clock_series
# c2: TIME SYSTEM ID
seg-2b01d2ccb666 = <b>Estación de referencia lunar: preparación de datos de archivos de reloj</b>. <c1/> ahora declara el sistema de tiempo de sus épocas. Es el valor de <c2/> o, cuando este no está declarado, el valor predeterminado del sistema de satélites de la cabecera. El resultado también indica si el sistema se declaró. La función rechaza un sistema de tiempo desconocido (una escala de tiempo lunar, por ejemplo), un archivo de sistemas mixtos sin declarar y archivos que discrepan, en lugar de leerlos como hora GPS. Incluye un fixture sintético de reloj de estación. No se define ningún formato de archivo de correcciones, porque no existe ninguno público.

# text
seg-0fb89eb36003 = Cambiado

# text
# c1: fusion::ukf
# c2: fusion::tightly_coupled
# c3: fusion::gnss_ins_ekf
# c4: hybrid_ukf
# c5: tightly_coupled17
# c6: carrier_tc
seg-b63c95f12bc4 = La documentación de módulo de <c1/>, <c2/> y <c3/> ya no califica de trabajo futuro el navegador UKF de 17 estados, el acoplamiento estrecho con INS completo y el estado de reloj explícito; remite a <c4/>, <c5/> y <c6/>.

# text
seg-aedd06cf6127 = <b>RINEX { "4" } ya no se rechaza</b> ({ "0.36" }, WP-07): un archivo de navegación RINEX { "4" } se rechazaba a propósito; ahora se lee (véase Añadido). Para los archivos de observación de la versión { "4" } y posteriores, las etiquetas de cabecera se buscan solo en las columnas 61-80, de modo que los nuevos registros de texto libre no puedan pasar por etiquetas.

# text
# c1: ionex::parse_ionex
# c2: None
seg-5829841b58d7 = <b><c1/> lee archivos IONEX reales</b> ({ "0.36" }, WP-07): un registro completo de 16 valores llena las columnas 61-80, que el lector tomaba por una etiqueta, de modo que devolvía <c2/> con cada archivo IONEX real. Ahora lee como valores un registro cuyo campo de etiqueta es numérico. Ninguna salida distribuida lo usaba.

# text
# c1: galileo-e1
# c2: galileo-e5a
seg-a66bd6592b93 = <b>Potencias recibidas de Galileo E1 y E5a según OS SIS ICD Issue { "2.1" }</b> (revisión, 2026-10-14). Las bandas de espectro <c1/> y <c2/>, y las víctimas GNSS de señales LEO que toman su potencia de ellas, ahora usan las potencias mínimas recibidas de la Tabla { "12" } del Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (antes −{ "157.0" }) y −{ "155.25" } dBW (antes −{ "155.0" }).

# text
seg-b0386f62923f = Cambian nueve resultados de escenario: los ejemplos de espectro, la campaña de espectro, tres verticales de resiliencia LEO y tres diseños de señal LEO. El C/N0 efectivo cambia −{ "0.25" } dB y el J/S +{ "0.25" } dB en estas bandas.

# text
# c1: docs/revisions/CAP12-galileo-icd21-power-changes.md
seg-2af90bfcefae = Cada valor modificado ({ "1766" }, antiguo → nuevo) figura en <c1/> y su CSV, con las tablas de documentación que cambiaron. Ninguna fila del registro cambia de estado.

# text
# c1: galileo-e5b
# c2: galileo-e5-altboc
seg-d468174b2d4c = Segunda parte, el mismo día: las víctimas de señales LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Tabla { "12" } E5b) y <c2/> (−{ "152.0" } → −{ "152.24" } dBW). El ICD no tiene una fila de E5 de banda completa, de modo que el valor de AltBOC es la suma de potencias de los totales de E5a y E5b de la Tabla { "12" }, construida como lo era el valor antiguo. Cambian tres resultados de diseño de señal LEO ({ "64" } valores: estas potencias recibidas y la degradación del C/N0 de LEO a GNSS en las dos víctimas), listados en la misma revisión (§{ "5" }) y el CSV. Nada más cambia.

# text
# c1: tides::atmospheric_tide
# c2: P_nm
# c3: N_nm
# c4: ε = 90° − ψ
# c5: tides::s2_air_waves
# c6: xval/s2-air-tide-fix/
seg-a96992246ef8 = <b>Corrección de la marea atmosférica S2</b> (<c1/>). Los armónicos de presión del aire S2 de Ray ({ "2001" }) son coeficientes de <c2/> sin normalizar con retardos de fase de coseno; se usaban como totalmente normalizados con el retardo como adelanto de seno del IERS. Ahora entran divididos por <c3/> con <c4/>; el nuevo <c5/> reproduce el modelo A2 de la Tabla { "5" } de GFZ STR06/01 para las { "21" } ondas (peor caso { "0.0005" } cm, { "0.05" }°; VALIDATED). Solo cambian las salidas con mareas activadas: el ajuste CI de Galileo { "0.132" } → { "0.133" } m, los componentes de Swarm-A en { "1" }–{ "2" } mm (preregistrado en <c6/>).

# text
# c1: propagator::solve_kepler_checked
# c2: orbit::solve_kepler
# c3: ephem::solve_kepler
# c4: kepler::solve_kepler_markley
seg-6fa076226c01 = Solo documentación: <c1/>, <c2/> y <c3/> se documentan como resolutores heredados, numéricamente sin cambios, que remiten a <c4/>.

# text
# c1: utck_bound
seg-a757fd7ca793 = <b>Estado de la ronda { "3" } de D9 (<c1/>).</b> La Circular T { "465" } del BIPM salió el 2026-10-12. La puntuación prospectiva preregistrada sigue sin ejecutarse: el número { "465" } contiene unos { "285" } valores de prueba, y la regla de parada necesita { "1000" }, es decir, aproximadamente los números { "465" }–{ "468" }. La ejecución también necesita los archivos por laboratorio archivados del 2026-09-30, porque el BIPM ha reescrito desde entonces { "87" } de los { "113" }. La fila del registro y la cabecera de la prueba lo indican; la prueba, sus umbrales y su partición no cambian.

# text
# c1: PositioningFom
# c2: orbit::Propagator
# c3: src/ionex.rs
# c4: raim
# c5: docs/design/evidence/cn0-m2m4/RESULTS.md
seg-e064546d05ec = <b>Revisión de veracidad de la documentación ({ "0.36" }).</b> La hoja de ruta, las filas de capacidades, las líneas de estado de los documentos de diseño y los comentarios de módulo se han puesto en línea con el código; ninguna salida cambia. Los elementos ya construidos pero todavía listados como abiertos se marcan ahora como hechos: las comprobaciones de máscara de ITU-T, el escenario de holdover de { "24" } h y la ingesta de registros de reloj (temporización de telecomunicaciones), las guías de inicio del primer minuto, Lense–Thirring y la comprobación cruzada del propagador de Orekit, la cadena GCRS precisa en ITRF, los hashes de referencia y multiplataforma, la procedencia, el ARAIM de fallos múltiples (ADD v4.2), el FDE de un solo satélite, la biblioteca CRPA, el límite de ambigüedad de franjas de CAI, el dimensionamiento de calles de cobertura y la vista de órbita 3-D, la dinámica de actitud de sólido rígido, el escritor OMM y el lector de kernels NAIF, la libración lunar de DE440, la frase de significado de la ejecución en el playground, <c1/>, el navegador de acoplamiento estrecho de 17 estados y el tipo de escenario gravity-map. Las filas también indican con precisión qué sigue abierto (por ejemplo, el JD en dos partes en <c2/>, el lector de <c3/> frente a un producto real y la exclusión de varios satélites en <c4/>). El <c5/> que faltaba se escribe a partir de una ejecución nueva de sus pruebas (M1–M4 pasan), y el borrador de validación IQ orientado a socios tiene los recuentos actuales del registro.

# text
seg-e2290a640df7 = Los códigos de memoria de Galileo E1 ya no se incluyen en el paquete.

# text
# c1: data/galileo-os-sis-icd/C7_E1B.txt
# c2: C8_E1C.txt
# c3: LICENSING.md
# c4: galileo::e1b_table
# c5: e1c_table
# c6: Result
# c7: KSHANA_GALILEO_E1B
# c8: KSHANA_GALILEO_E1C
# c9: data/galileo-os-sis-icd/
# c10: scripts/fetch_galileo_e1_codes.sh
# c11: galileo::E1B_TABLE_TEXT
# c12: E1C_TABLE_TEXT
# c13: galileo-e1b
# c14: galileo-e1c
# c15: tests/iq_signals.rs
seg-80f8ca869682 = <c1/> y <c2/> (anexo C.7/C.8 del ICD) se han retirado del repositorio y de los paquetes. Los términos del ICD (citados en <c3/>) permiten a un usuario almacenar los códigos citando la fuente y utilizarlos en un producto, pero solo permiten su redistribución con fines no comerciales, y Kshana también se ofrece con una licencia comercial. <c4/> / <c5/> ahora devuelven un <c6/> y leen la copia propia del usuario desde <c7/> / <c8/> o, en una copia del código fuente, desde <c9/>, donde el nuevo <c10/> las extrae del PDF del ICD (con comprobación de hash). <c11/> / <c12/> se han retirado. Sin las tablas, las señales Galileo E1 (<c13/>, <c14/>) devuelven un error que indica cómo proporcionarlas, y las pruebas de E1 se omiten con un mensaje. Con las tablas disponibles, todas las salidas de E1 permanecen sin cambios. Ningún escenario, golden ni salida de espectro utiliza las tablas de códigos. Los archivos de prueba del anexo C.3/C.4 de E5a (la referencia independiente LFSR en <c15/>) se tratan igual: los descarga el mismo script, se excluyen de git y la prueba se omite si faltan.

# text
# c1: f64
# c2: rand_distr
# c3: libm
# c4: portable_math::PortableFloat
# c5: portable_distr
# c6: docs/revisions/STUDIO15-portable-math-rebaseline.md
# c7: europa-surface-pnt
# c8: lunar-joint-od-clock
# c9: paper/crossover/inertial.json
# c10: vibration_psd
# c11: cislunar-observability
# c12: skyline_scenarios
# c13: geometry_corpus_identity
# c14: geometry_trust_no_change
# c15: docs/predictions/*.portable-0.36.json
# c16: tests/lunar_joint_od_numpy_oracle.rs
# c17: docs/revisions/STUDIO15-lunar-joint-od-oracle-rerecord.md
# c18: docs/revisions/STUDIO15-batch4-rebaseline.md
# c19: iq_campaign
# c20: gnss-ins
# c21: docs/revisions/STUDIO15-greenhall-edf-portable.md
# c22: docs/revisions/STUDIO15-testbench-gpssdrsim-rerun.md
seg-654d0358137b = <b>Matemáticas portables en todas partes</b> ({ "0.36" }, STUDIO-15): todas las funciones trascendentes de <c1/> de la biblioteca, y los muestreadores normal, gamma y exponencial de <c2/>, ahora se calculan mediante la biblioteca <c3/> escrita en Rust puro (<c4/>, <c5/>), de modo que una compilación nativa y la compilación WebAssembly devuelven JSON de resultados idénticos byte a byte para los { "141" } escenarios incluidos y para la ejecución IQ corta. El coste es que se desplazaron los últimos bits de los resultados calculados con la biblioteca matemática del host: cambiaron { "98" } de los { "141" } escenarios incluidos y { "43" } no cambiaron; { "5" } cambiaron en más de { "1e-3" } en su campo mayor, y el resto en menos. Cada valor desplazado figura como antiguo -> nuevo en <a1><c6/></a1> (con un CSV de los { "136,127" } números desplazados); no cambió ningún umbral, tolerancia ni límite. Cifras publicadas que cambiaron: disponibilidad de <c7/> con el alcance a la Tierra { "0.719" } -> { "0.713" } y error RMS { "86.147" } -> { "86.499" } m (una época en el límite de disponibilidad ahora se resuelve igual en todas partes; en macOS arm64 imprimía { "0.725" } / { "85.800" } m); error de estación de <c8/> { "3.541350" } -> { "3.536885" } m con VLBI y { "2183.558" } -> { "2184.021" } m sin VLBI; <c9/>, ocho valores de <c10/> en { "3" } unidades en el último lugar (fe de erratas del informe técnico); el documento <c11/> publicado en magnitudes situadas en el suelo del error de redondeo (ocho valores más allá de la sexta cifra significativa, hasta { "6.8e-5" } en términos relativos; no se movió ningún rango ni umbral). Los hashes fijados de las protecciones de identidad byte a byte (<c12/>, <c13/>, <c14/>) se rebasan a una línea base denominada "{ "0.36" } portable", y los valores de { "0.35.0" } se conservan como registro histórico; la predicción congelada de la estación de referencia lunar no se toca y su nueva ejecución portable se guarda junto a ella (<c15/>). <c16/> (la fila validada de OD conjunta lunar): se reexportaron los archivos de prueba y se repitió la comparación con numpy { "2.4.6" }, la versión registrada, con el script y el umbral sin cambios; las seis redes pasan (<a2><c17/></a2>). El trabajo de los lotes 2-3 incorporado después de STUDIO-15 también usa matemáticas portables ({ "457" } puntos de llamada en { "62" } archivos); lo que eso desplazó figura en <a3><c18/></a3>: { "12" } escenarios incluidos (mayor cambio relativo { "5.2e-8" }, ninguna cifra impresa se mueve), { "28" } filas de protección de skyline reaprobadas, el digest M2M4 de <c19/>, los hashes de verdad de referencia heredados de <c20/>, la sigma de datum de balizas no observadas ({ "632.3769" } -> { "632.3772" } m) y dos hallazgos registrados (cierres de DRO en CR3BP; CRPA A3, { "194" } de { "456" } enlaces). El edf exacto de Greenhall mantiene su umbral validado con un logaritmo de doble-doble en su núcleo (<a4><c21/></a4>), y la referencia independiente del test bench de gps-sdr-sim se volvió a ejecutar sobre las exportaciones NMEA desplazadas, y todos los umbrales se mantienen (<a5><c22/></a5>).

# text
seg-a21df3f8e0a6 = README: la fila de la suite lunar indica el nivel de evidencia de cada pieza (decía que todas eran MODELLED).

# text
# c1: realdata::clk::rinex_clock_series
# c2: RinexClockSeries
# c3: (PhaseSeries, GriddingLog)
# c4: AS
# c5: AR
seg-ffb14764a7a9 = <c1/> devuelve <c2/> (serie, registro de interpolación en malla, sistema de tiempo, si se declaró y tipo de registro) en lugar de una tupla <c3/>. Ahora recurre a los registros de receptor/estación (<c5/>) con el nombre solicitado cuando no hay registros de satélite (<c4/>).

# text
# c1: tests/geometry_trust_no_change.rs
# c2: tests/geometry_corpus_identity.rs
# c3: score_model.weights
# c4: geometry
# c5: class
# c6: geometry
# c7: class
# c8: geometry
# c9: monitors_run
# c10: [score.weights]
# c11: [geometry]
seg-6777ca96624a = Ninguna puntuación cambia a menos que la geometría sea mala; la etiqueta se informa siempre. Con geometría buena o aceptable (incluido un cielo abierto solo con GPS de { "8" } satélites) o con geometría desconocida (el monitor no se ejecuta), toda puntuación es la de { "0.35" }: <c1/> mantiene las salidas de ambas sesiones de ejemplo y <c2/> cada corpus NMEA de buque confirmado (también como cielo abierto solo con GPS) y los escenarios de formación de tripulaciones con los bytes de { "0.35.0" }, una vez eliminadas las claves añadidas; en los dos escenarios de formación en los que el jamming hace que la geometría sea mala, las épocas malas difieren únicamente por la deducción por geometría. Un registro con geometría mala pierde hasta { "15" } puntos que no perdía en { "0.35" }. Por lo demás, los cambios previstos son todos adiciones: las claves anteriores en el JSON de resultados y en los paquetes de evidencias (<c3/> no cambia); el esquema JSON-lines en vivo pasa de { "1.2" } a { "1.3" } (<c4/> añadido, <c5/> en cada deducción); el resumen del extracto incorpora <c6/>; la telemetría incorpora series, campos y la etiqueta <c7/> de geometría solo para las entradas que los incluyen, de modo que un flujo o resultado de { "0.35" } se representa byte a byte como antes. <c8/> es el 17.º nombre de monitor; figura en último lugar en <c9/> cuando decidió (un buque cuyo registro proporciona la geometría; una lista de { "0.35" } conserva su orden y el recuento de monitores del resumen aumenta en uno) y no tiene entrada en <c10/> (establecerla se rechaza: su deducción se fija en <c11/>).

# text
# c1: tests/fixtures/dop/NOTICE
seg-45b44c851937 = <c1/> indicaba que la licencia de gnss_lib_py era Apache-2.0; la versión { "1.0.4" } es MIT.

# text
seg-a1a670a9c63e = El lector NMEA ahora lee GSA (una GSA corta se ignora, no se cuenta como omitida) y conserva las elevaciones y los acimuts de GSV, también para satélites listados sin señal; el lector UBX conserva la elevación y el acimut de NAV-SAT. C/N0 se lee exactamente igual que antes.

# text
# c1: navsignal
seg-0bafbea5c75d = <b>Cambio de resultados: los inhibidores de banda ancha y de barrido ahora usan Q = { "2" }.</b> La ecuación antiinterferencia usa para estos inhibidores el ajuste Q de espectro ensanchado de los manuales, donde antes usaba { "1" }. Q = { "2" } corresponde a ruido blanco sobre el lóbulo principal con la potencia de señal en banda normalizada; en las pruebas está fijado a la forma cerrada de <c1/>.

# text
# c1: q_override
seg-21f31ec302de = <b>Sin cambios:</b> los inhibidores CW y de banda estrecha (Q = { "1" }), un tipo de inhibidor no reconocido (Q = { "1" }, el valor más perjudicial) y <c1/>.

# text
seg-f362499d2ed0 = <b>Efecto:</b> allí donde actúa un inhibidor de banda ancha o de barrido, el C/N0 efectivo aumenta hasta { "3.0103" } dB, los umbrales J/S derivados aumentan { "3.0103" } dB y los radios de denegación en espacio libre se reducen en un factor de { "0.7071" }.

# text
# c1: xval/jammer-q/PREREGISTRATION.md
# c2: xval/jammer-q/RESULTS.md
seg-088dcd34cc88 = <b>Escenarios incluidos que cambian:</b> cambian { "12" } de { "144" }, todos según lo preregistrado (<c1/>, resultados en <c2/>):

# text
# c1: jamming-demo
seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

# text
# c1: lunar-jamming
seg-afb42538cfde = <c1/>: satélites perdidos { "26" } → { "0" }, distancia de seguridad mediana de pérdida de enganche { "27.4" } → { "19.4" } km;

# text
# c1: tracking-loop
seg-8c2691f38d28 = <c1/>: radio de denegación por dinámica del lazo { "75.2" } → { "53.2" } km;

# text
seg-096a24491872 = y las campañas y verificaciones cruzadas de espectro que los contienen.

# text
# c1: jamming
# c2: lunar-jamming
# c3: tracking-loop
# c4: impairment-eval
# c5: jamming_kind_cross_check
seg-ecdf60335064 = <b>Consumidores afectados:</b> los tipos de escenario <c1/>, <c2/>, <c3/> y <c4/>, la <c5/> de los tipos de escenario de espectro, la curva de referencia MODELLED de la campaña IQ y la Q por defecto de labfit, y la exportación de escenas de interoperabilidad.

# text
# c1: DialogWrapper
# c2: Messages.showChooseDialog
# c3: FileChooserDescriptor
# c4: FileChooserDescriptorFactory.createSingleFileDescriptor()
# c5: BrowserUtil.browse(Path)
# c6: browse(File)
# c7: verifyPlugin
# c8: KSHANA_VERIFY_IDES
seg-89672d99e9e2 = Complemento de JetBrains: ninguna API de la plataforma obsoleta o programada para su eliminación. Los cinco diálogos de selección usan un pequeño <c1/> con una lista desplegable en lugar del obsoleto <c2/>; los selectores de un solo archivo usan el constructor de <c3/> en lugar del obsoleto <c4/>; la animación se abre con <c5/> en lugar de <c6/>, que la plataforma { "2026.3" } programa para su eliminación. Since-build sigue siendo { "243" }. El IntelliJ Plugin Verifier informa Compatible sin ningún uso obsoleto o programado para su eliminación frente a { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) y { "2026.3" } EAP (IU-263.6259.32); <c7/> comprueba { "2024.3" } por defecto y cualquier lista indicada en <c8/>.

# text
# c1: gnss_sim::run_gnss_sim
# c2: jamming::run_jamming
# c3: Result
# c4: [skyline]
# c5: api::run_toml
seg-58ee61cbd633 = <c1/> y <c2/> devuelven <c3/>: una sección <c4/> no válida es un error cuando se llama directamente, como ya lo era a través de <c5/>, en lugar de una vuelta silenciosa a la máscara plana. <b>Cambio incompatible</b> para quienes llamen a estas dos funciones desde Rust.

# text
# c1: iq::campaign
# c2: false-lock
# c3: tests/iq_campaign_false_lock.rs
seg-9b4113258e1e = <b>Evaluador de campañas: nunca se contaba un falso enganche real del seguidor</b> (<c1/>). La comprobación de falso enganche del seguidor pasa un canal de LOCKED a LOST al dispararse. El evaluador marcaba en cambio la siguiente actualización del canal, que ya estaba desenganchado y por tanto nunca se contaba. Un evento <c2/> notificado desde LOCKED es ahora un episodio en su instante, en la ejecución y en cada evento indicado que lo contiene. Uno encontrado durante la captura inicial, o repetido por un canal que ya está LOST, no es un episodio nuevo. Una prueba nueva provoca un falso enganche real: una portadora legítima de GPS L1 C/A que da un salto de 1/(2T) mientras está enganchada (<c3/>).

# text
# c1: tests/iq_campaign.rs
seg-ac508954b6a6 = En la campaña de referencia de <c1/>, solo cambia el PRN { "11" } de ramp/agc-3bit (episodios de falso enganche { "0" } → { "1" }, { "426" } y { "437" } por hora de enganche).

# text
seg-cfc47d9d9237 = Sus DIGEST de celda se vuelven a fijar.

# text
seg-fcfa0de18b05 = El fijado preregistrado de los resultados evaluados sigue vigente y se sigue reproduciendo exactamente: en su hash solo esos seis campos, cambiados por esta corrección hecha tras el registro, se vuelven a asignar a sus valores anteriores a la corrección. Los valores corregidos se fijan por separado.

# text
seg-b96d34bb1d36 = No se modificó ningún umbral, y no se movió ninguna fila, cifra ni número web VALIDATED.

# text
# c1: unobserved_beacons
# c2: warning
# c3: docs/revisions/BEACON-unobserved-cell-changes.md
seg-ccbe11bd50b6 = <b>lunar-frame-campaign: ahora se informa de una baliza sin observación</b> (hallado por MR-05). El informe incorpora <c1/> y <c2/> solo cuando alguna baliza no tiene observación y, entonces, las sigmas de las balizas observadas proceden de su propia información en lugar de ser todas nulas. El datum no cambia y no se mueve ninguna salida por defecto, incluida ni publicada (<c3/>).

# text
# c1: lunar_frame::icrf_to_moon_pa
# c2: lunar_od
# c3: moon_080317.tf
# c4: pxform('MOON_ME','MOON_PA')
# c5: docs/design/evidence/fut05b-me-pa-offset-sign/
# c6: tests/agency_lro.rs
seg-c223c1fc1323 = <b>Marco lunar de ejes principales</b> (<c1/>, usado por <c2/> y el ajuste de LRO): el desfase de DE421 entre el marco de Tierra media y el de ejes principales de <c3/> se aplicaba en sentido contrario y con un orden de Euler erróneo, de modo que el marco analítico PA quedaba a unos { "208" }″ de PA en lugar de coincidir con él. Ahora se transcribe tal como lo define el Frames Required Reading de SPICE y coincide con SPICE <c4/> hasta { "2.6e-16" } rad; el marco analítico PA queda a entre { "6" }″ y { "8" }″ del PA de DE440 (preregistrado e1ead19b, reregistrado be33382e después de que el primer cambio propuesto no alcanzara el umbral de { "1e-12" }; <c5/>). Cifras publicadas que se mueven: el ajuste de LRO (<c6/>), solapamiento en bruto { "53.8" } → { "39.9" } m, dinámico { "12.6" } → { "12.05" } m, dinámico reducido { "6.65" } → { "6.67" } m (umbrales sin cambios). La pila analítica ahora coincide con la validación cruzada de grado DE de ANISE ({ "12.0" } / { "6.67" } m) en ambos niveles; la discrepancia anterior en el nivel dinámico se debía a este error.

# text
# c1: [terrain] dem_hgt
# c2: inline_only::FILE_SOURCE_KEYS
# c3: _hgt
seg-ef2b49d4ad48 = <b>El servidor MCP rechaza <c1/></b> (seguimiento de CAP-06b). La ruta del mosaico de terreno del tipo de escenario jamming figura ahora en <c2/>. Una superficie en línea rechaza un escenario que nombre una, con un mensaje que no incluye ni la ruta ni un error del sistema operativo. La prueba de la protección de fuentes de archivo ahora también señala los campos que terminan en <c3/>.

# text
# c1: Jd2::from_parts
seg-ef005d2e3d42 = <c1/> con una parte fraccionaria del día descartaba la fracción en las conversiones UTC, TAI, UT1 y de rotación terrestre (una hora de parte del día hacía que la Tierra quedara { "15" }° mal); ahora la parte del día se normaliza a un entero. No se vio afectada ninguna llamada del motor: todas pasan un día entero, y toda salida distribuida es idéntica bit a bit.

# text
seg-144d90307ec6 = Previsto

# text
# c1: src/skyline.rs
# c2: sky-blocked
# c3: open_fraction
# c4: nmea-scenario
seg-7ef4cd25cb87 = La geometría a partir de un skyline indicado (elemento { "1" } de { "0.36" }, ahora en el motor como <c1/>): <c2/> y <c3/> a partir del skyline cuando la entrada proporciona uno (el hueco de acimut como alternativa), un evento de degradación natural (fiordo o terminal) en <c4/> y las dos geometrías enmascaradas de la nota de diseño en la fila sigma_UERE x DOP, preregistradas como adenda.

# text
# c1: Status
# c2: unknown
# c3: $PKSHT
seg-49481d2fdf31 = Geometría para registros RINEX con navegación (a partir de la solución del propio motor) y registros de Android (a partir de las filas <c1/>); ambos indican hoy <c2/>. Geometría en <c3/> (versión { "1" } sin cambios en { "0.36" }) y las integraciones con Signal K y OpenCPN.

# text
# c1: loss-of-lock
# c2: signal_loss
# c3: environment
seg-57df1332ff87 = Una carencia previa, no introducida en { "0.36" }: cuando el campo SNR de todos los satélites está vacío, no se activa ninguna deducción de <c1/> ni de C/N0; la pérdida total de señal solo es visible a través de <c2/> del monitor de geometría (clasificada como <c3/>). Está prevista una deducción para ese caso.

# text
seg-a5a7a10ee11c = Un flujo de esquema { "1.3" } en las referencias independientes de telemetría externas (el analizador de formato de texto de Prometheus y el recolector OTLP), que hoy solo cubren flujos { "1.2" }.

# text
seg-caa1977b5b5e = Una obstrucción por ambos lados (un cañón o un fiordo estrecho) se interpreta como pérdida de señal y no como cielo bloqueado hasta que se integre el skyline.

# text
seg-4bd0f178ca4e = Un pasaje que nombra a clientes de IA de terceros se omite aquí; está en <a1>CHANGELOG.md</a1> en GitHub.

# text
seg-b2689beaba9e = Verificador de Galileo OSNMA

# text
# c1: kshana::osnma
# c2: kshana osnma verify <input>
# c3: $PKSOS
# c4: docs/OSNMA.md
# c5: --format ubx
seg-d16c9b4bf537 = <b>Nuevo módulo <c1/> y <c2/>: un verificador abierto en Rust puro, del lado del receptor, para Galileo OSNMA.</b> Lee páginas I/NAV e informa, por satélite y época, de si los datos de navegación están autenticados, con un motivo para cada fallo o retraso: análisis de HKROOT y MACK, reensamblado de DSM-KROOT y DSM-PKR, verificación Merkle de la clave pública, verificación de la cadena de claves TESLA, verificación de MACSEQ y de etiquetas para ADKD { "0" }, { "4" } y { "12" } con autenticación cruzada, y un resultado con la forma de <c3/> para el monitor de confianza del receptor. La salida incluye un aviso orientativo de que el estado no es un servicio de integridad de la navegación. <c4/> indica lo que se verifica y lo que no, el requisito de tiempo, y que Kshana no concede derechos sobre los IPR del ICD de OSNMA de la UE (los usuarios se basan en la autorización del anexo E del ICD). Implementado conforme al SIS ICD Issue { "1.1" } y a las Receiver Guidelines Issue { "1.3" }. Las páginas se comprueban con CRC y se puede leer directamente un flujo de bytes UBX-RXM-SFRBX de u-blox (<c5/>). Las pruebas por defecto usan datos sintéticos y pruebas de respuesta conocida de las primitivas publicadas; una prueba opcional lee una copia descargada localmente de los vectores oficiales. Tras una revisión independiente, el verificador toma su tiempo solo de claves TESLA verificadas (un subframe falsificado situado en un futuro lejano ya no puede borrar un fallo), hace que una autenticación caduque y siga el IODnav en uso, respeta los mensajes de alerta verificados (cuya hoja Merkle ahora incluye el campo NPK aleatorio) y el estado NMA "don't use", mantiene las etiquetas ficticias fuera del estado del satélite, conserva las cadenas por CID con revocación y renovación, comprueba el hash de relleno de KROOT y limita las longitudes de trama UBX y el trabajo de verificación TESLA. Un satélite figura como autenticado solo mientras los datos más recientes de efemérides y reloj que envía son, bit a bit, los datos que se autenticaron (no meramente bajo el mismo IODnav); un estado o una revocación procedente de la cabecera NMA no autenticada cuenta solo cuando dos satélites coinciden o lo transporta un KROOT verificado, un KROOT anterior reproducido no puede sustituir a una cadena, y se informa de un flujo de claves detenido.

# text
seg-3e7df5c888ca = Añadido (canales del servidor MCP)

# text
# c1: kshana-mcp --http <addr>
# c2: --allow-remote
# c3: KSHANA_MCP_HTTP_TOKEN
# c4: docs/deploy/mcp-http.md
seg-4e70d8b85211 = <b><c1/>, HTTP en streaming, autoalojado.</b> Solo loopback por defecto; una dirección que no sea loopback requiere <c2/> y un token de portador en <c3/>; ninguna herramienta lee ni escribe una ruta (las herramientas de archivos IQ están desactivadas); límites de tamaño de solicitud, de tiempo y de concurrencia; sin cabecera CORS; comprobaciones de Host y Origin. Kshana no aloja ningún punto de conexión (<c4/>, con plantillas para Docker, Fly.io y Cloud Run).

# text
seg-c392cde151c9 = Añadido (superficies)

# text
# c1: osnma_verify
# c2: kshana osnma verify
# c3: --json
# c4: advisory
# c5: docs/SURFACES.md
# c6: docs/OSNMA.md
seg-19ab5c068b6e = <b><c1/> en Python y WebAssembly.</b> El verificador que hay detrás de <c2/> sobre bytes en memoria, que devuelve el JSON que imprime <c3/> (aviso orientativo en su campo <c4/>; solo estado de autenticación, no un servicio de integridad de la navegación). Las mismas negativas que en la línea de comandos. No está en MCP: la entrada es un flujo bruto largo de receptor que la CLI y Python atienden mejor. <c5/> y <c6/> lo indican.

# text
# c1: trust_telemetry
# c2: receiver-trust
# c3: kshana trust-telemetry
# c4: kshana::surface::trust_telemetry
# c5: /kshana-trust-telemetry
# c6: trust-telemetry
# c7: wasm
# c8: python
# c9: otlp
seg-6128929994b4 = <b><c1/> en WebAssembly, Python y MCP, con un comando de complemento y una acción de JetBrains.</b> Representa un flujo de confianza o un resultado de <c2/> como texto de Prometheus, líneas de syslog CEF o LEEF o una carga útil JSON de OTLP, con los codificadores que usa <c3/> (<c4/>); sin socket ni reloj. Complemento: <c5/> y la skill <c6/>. JetBrains: Render Trust Telemetry. Las funciones <c7/> y <c8/> y el servidor MCP ahora también activan <c9/>, que no añade ningún crate.

# text
# c1: kshana --help
# c2: receiver-trust evidence
# c3: evidence
# c4: trust-telemetry
# c5: nmea-scenario
# c6: compliance-and-test-bench
# c7: docs/SURFACES.md
seg-83d01411c6d4 = <b>Barrido de paridad.</b> Acciones de JetBrains Validate Scenario, List Scenario Kinds y Assess Receiver Stream; <c1/> ahora lista <c2/>, <c3/>, <c4/> y <c5/>; el cuaderno <c6/> (correspondencia de compliance y exportación a test bench); y cada celda restante de JetBrains "CLI only" en <c7/> es ahora un N/A explícito con su motivo.

# text
seg-062ef0cf7ee7 = Añadido (paquetes de evidencias)

# text
# c1: kshana receiver-trust evidence
# c2: kshana evidence verify
# c3: kshana evidence keygen
# c4: *.evidence-key
# c5: verify
# c6: --pubkey
# c7: openssl ts -verify
# c8: kshana::evidence
# c9: wasm32
# c10: ed25519-dalek
# c11: zeroize
# c12: docs/EVIDENCE-PACKS.md
seg-9889575c2df1 = <b><c1/> y <c2/>: paquetes de evidencias firmados y verificables para un evento de confianza de GNSS.</b> Un paquete reúne el fragmento del registro en bruto y el SHA-256 del registro completo, la configuración con todos los umbrales, los resultados y motivos de cada época, la versión del motor, un manifiesto encadenado por hash y un resumen HTML autónomo, firmado con Ed25519 (una clave de <c3/> o su propio archivo; las claves nunca se almacenan en un paquete y <c4/> está excluido de git). <c5/> comprueba cada hash, la cadena y la firma e indica exactamente qué falla; con <c6/> fija el firmante. Se puede adjuntar un token RFC { "3161" }, que se lee y se vincula al manifiesto (esta compilación no comprueba la firma propia de la autoridad; <c7/> la cubre). El fragmento del registro son los bytes exactos de la ventana cuando el lector informa de rangos de origen (NMEA, UBX, RINEX { "3" }, Android) y, si no, el registro completo, y el manifiesto indica cuál. La creación y la verificación son funciones públicas puras (<c8/>) que se compilan para <c9/>. Los paquetes declaran que son un registro técnico, no un dictamen jurídico. Las dependencias nuevas son el árbol de <c10/> (BSD-3-Clause y Apache-2.0/MIT, funciones mínimas) y <c11/> directo (ya presente en ese árbol) para borrar el material de claves. Véase <c12/>.

# text
seg-280fd37126c1 = Añadido (telemetría de confianza)

# text
# c1: kshana trust-telemetry
# c2: receiver-trust
# c3: /metrics
# c4: otlp
# c5: kshana_trust_syslog_send_failures_total
# c6: /metrics
# c7: deploy/grafana/
# c8: docs/TRUST-TELEMETRY.md
# c9: src/telemetry/sample.rs
seg-ebd269c618b0 = <b><c1/>: la confianza en GNSS como fuente de telemetría de seguridad.</b> Lee el flujo de confianza por época (líneas JSON: puntuación 0-100, banda, motivos) o un resultado por lotes de <c2/> y alimenta un punto de conexión <c3/> de Prometheus (localhost por defecto), eventos syslog en CEF o LEEF dentro de un envoltorio RFC { "5424" } (UDP o TCP) y, tras la función <c4/>, desactivada por defecto, exportación JSON OTLP/HTTP. El envío se ejecuta en hilos de trabajo con límites de tiempo de conexión y de escritura, retroceso de reconexión acotado y un contador <c5/>, de modo que un recolector caído o bloqueado no pueda detener la evaluación en vivo ni congelar <c6/>; las etiquetas de motivo se limitan a { "64" } series. Sin dependencias nuevas. Hay un panel de Grafana de ejemplo en <c7/>. Los nombres de las métricas, las etiquetas y la correspondencia de campos CEF/LEEF están en <c8/>. El formato del flujo está aislado en <c9/>.

# text
seg-fa5e803edb44 = Confianza marítima: una puntuación de confianza en vivo de 0 a 100 para la posición de un buque en movimiento, a partir del NMEA { "0183" } que el receptor ya emite, con una compuerta opcional.

# text
# c1: kshana receiver-trust
# c2: [platform]
# c3: kind = "static"
# c4: "vessel"
# c5: [maritime]
# c6: [score]
# c7: kshana receiver-trust live <session.toml>
# c8: $PKSHT
# c9: --gate
# c10: V
# c11: N
# c12: --listen tcp:<port>
# c13: examples/maritime-trust/
# c14: docs/MARITIME-TRUST.md
seg-c5b3fcb9bba8 = <c1/> admite una tabla <c2/> (<c3/> o <c4/>, la velocidad, la aceleración y la velocidad de giro máximas del buque, la altura de la antena sobre la línea de flotación y un sensor de rumbo opcional; cada valor por defecto está documentado con su motivo). Para un buque, el monitor estático de saltos de posición, que mide la distancia a la media de calibración y es erróneo en un barco en marcha, se sustituye por monitores causales de plataforma móvil: coherencia cinemática de la posición con la velocidad y el rumbo notificados y con los límites del buque, rumbo del girocompás frente al rumbo sobre el fondo, corredera frente a velocidad sobre el fondo, altitud de la antena frente a la altura declarada sobre la línea de flotación, colapso de la dispersión de C/N0 y su aumento conjunto frente a la línea base de calibración, y coherencia temporal (también con el reloj de este ordenador, en modo en vivo). También lee un estado de autenticación notificado, global o por satélite (solo un estado notificado: sin criptografía OSNMA). Cada umbral se declara en una tabla <c5/> antes de la ejecución. Después cada época recibe una puntuación de { "0" } a { "100" } mediante una asignación determinista y preregistrada (sin aprendizaje, nada ajustado a los eventos; los pesos, los límites de banda y la evidencia constan en una tabla <c6/>), asignada a los estados de confianza existentes, con los monitores que dedujeron y sus puntos. Los escenarios estáticos no cambian y su hash es el de antes. <c7/> lee stdin, un archivo al que se añaden datos, TCP o UDP y escribe una línea JSON por época y una sentencia propia <c8/>; con <c9/> pasa el flujo sin cambios mientras la posición es fiable y marca la posición como no válida (calidad GGA { "0" }, estado RMC y GLL <c10/>, modo GNS y VTG <c11/>) mientras no lo es. La compuerta está desactivada salvo que se pida; <c12/> sirve el flujo con compuerta a cualquier número de clientes TCP (loopback por defecto; un cliente lento se descarta en lugar de bloquear a los demás). Este es un software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }); el operador sigue siendo responsable. <c13/> es un registro sintético de Tallin a Helsinki, escrito solo como texto, con un arrastre de la posición a mitad del recorrido durante el cual el receptor sigue notificando una posición válida; su salida esperada está fijada por una prueba. Guía: <c14/>. Las comprobaciones no pueden detectar a un falsificador cuya posición sea coherente con todo lo que hay en el bus; la guía lo indica.

# text
seg-80f3f0aae42c = Mapa de interferencias

# text
# c1: kshana interference-map
# c2: kshana route-exposure
# c3: fetch-land --allow-network
# c4: flate2
# c5: null
# c6: <source>-<dataset>-<date>.geojson
# c7: docs/INTERFERENCE-MAP.md
# c8: docs/data/INTERFERENCE-DATA-SOURCES.md
seg-8539a42718cb = <b><c1/> y <c2/>: una imagen pública de dónde aeronaves y buques notificaron datos de navegación degradados y de cuánto de una ruta alcanza.</b> Las entradas son archivos CSV locales elaborados a partir de datos ADS-B (adsb.lol, ODbL { "1.0" }) y AIS (NOAA MarineCadastre, Kystverket bajo NLOD { "2.0" }) con licencia abierta; cada archivo de salida corresponde a una fuente y a un día UTC de GeoJSON que contiene el método, sus umbrales, la licencia de los datos, la atribución y el sesgo de cobertura de la fuente. El método ADS-B agrega NIC y NACp en una cuadrícula fija y califica una celda como degradada según la proporción de aeronaves distintas, con protecciones para equipos que nunca notifican precisión, para baja altitud y para causas de área amplia. El método AIS ejecuta cinco detectores: posiciones en tierra (frente a una línea de costa proporcionada por el usuario), trayectorias circulares, saltos inverosímiles, velocidades inverosímiles y muchos buques en una misma posición. Los umbrales son constantes preregistradas de una versión de método con nombre. Solo agregados: los identificadores se calculan con hash en memoria y nunca se escriben, y no se publican las celdas con menos de { "5" } aeronaves o buques distintos. Una celda degradada no es una constatación de interferencia. Los comandos por defecto no usan la red; un asistente <c3/> opcional descarga los polígonos de tierra de Natural Earth desde una dirección fijada a un commit y conserva el archivo solo si su SHA-256 coincide. La entrada ADS-B es un CSV o directamente los archivos de historial readsb de adsb.lol (nueva dependencia: <c4/> con su backend en Rust puro, para gzip). Ambos métodos están en la versión { "2" }: una calificación de degradada o anómala requiere al menos { "5" } aeronaves o buques (el mínimo de publicación), todo recuento por celda inferior a { "5" } se retiene como <c5/>, y un día cuyo fondo no pueda estimarse retiene sus calificaciones. Los archivos de salida se llaman <c6/> y nunca se sobrescriben; la entrada se procesa en flujo línea a línea; la exposición de ruta maneja el antimeridiano. Las pruebas usan solo datos sintéticos. Véanse <c7/> y la revisión de licencias en <c8/>.

# text
seg-7a54dfab93dc = Añadido (flujos de formación)

# text
# c1: kshana nmea-scenario
# c2: scenarios/training/
# c3: receiver-trust
# c4: docs/NMEA-TRAINING.md
seg-0b01d1d871e2 = <b><c1/>: NMEA { "0183" } sintético de puente para la formación de tripulaciones en el reconocimiento de jamming y spoofing de GNSS.</b> A partir de un TOML de escenario escribe un archivo, o emite por TCP o UDP (unicast o broadcast; en tiempo real, acelerado o lo más rápido posible), el conjunto completo de sentencias de puente GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT y VBW para la derrota de un buque con límites de velocidad de giro, aceleración y corriente, con la geometría de satélites de las constelaciones nominales propias del motor. Eventos con guion en una línea temporal: jamming, arrastre de posición (una posición válida que se va alejando), spoofing de hora y un retardo de repetición, cada uno con rampas de inicio y de recuperación. Un registro del instructor (JSON y texto) anota qué se inyectó y cuándo, con la derrota real frente a la notificada. Una biblioteca en <c2/> (jamming en mar abierto, arrastre costero, spoofing de hora en la aproximación a puerto, combinado) incluye notas para el instructor. La salida tiene sumas de comprobación válidas y es determinista por semilla; las pruebas fijan un extracto golden por escenario y leen cada sentencia con el lector NMEA de <c3/>. Solo texto: sin salida de RF, IQ ni forma de onda; los flujos son para formación y pruebas y nunca deben alimentar los sistemas de navegación en vivo de un buque. Véase <c4/>.

# text
seg-bb8d508c92fa = Integraciones marítimas ({ "0.35.0" }, línea de trabajo B)

# text
# c1: integrations/signalk/
# c2: kshana receiver-trust live
# c3: $PKSHT
# c4: navigation.gnss.kshana.*
# c5: navigation.position
# c6: warn
# c7: alarm
seg-538cdf145ac1 = <b>Complemento de Signal K</b> (<c1/>, no publicado en npm): ejecuta <c2/> o se conecta a él (la propia entrada NMEA del servidor, argumentos de entrada personalizados, una fuente TCP JSON-lines o las sentencias <c3/> de un flujo con compuerta), publica la puntuación de confianza, la banda, los motivos, las alarmas y el estado de la compuerta bajo <c4/> (incluida la posición notificada por el receptor como contexto, nunca <c5/>), y emite una notificación de Signal K (<c6/> en degradado, <c7/> en no fiable, con umbrales de mantenimiento, de borrado y de obsolescencia, todos en el esquema de configuración). Sin dependencias de npm. Probado con salida sintética grabada.

# text
# c1: kshana receiver-trust live --gate --listen tcp:10110
# c2: integrations/opencpn/nmea-tcp-relay.mjs
# c3: $PKSHT
# c4: integrations/opencpn/plugin/
# c5: $PKSHT
# c6: integrations/opencpn/evidence/
seg-b6eb7110291e = <b>OpenCPN</b>: el NMEA en modo compuerta lo sirve directamente <c1/> (recomendado); un relé TCP sin dependencias (<c2/>) es la alternativa opcional. En cualquier caso OpenCPN ve una posición no válida cuando la confianza se desploma y <c3/> en su ventana de depuración NMEA; las pruebas reproducen el flujo sintético con compuerta a través de un socket TCP real y comprueban lo que recibe un consumidor. Un complemento nativo de panel de puntuación (<c4/>, API de complementos { "1.18" }, CMake) lee <c5/> del propio flujo NMEA de OpenCPN y alerta en la banda no fiable; se compila, su lógica tiene pruebas unitarias y se ejecutó dentro de OpenCPN { "5.8.4" } bajo una pantalla virtual (evidencias y un script de reproducción en <c6/>); no está empaquetado para el gestor de complementos.

# text
# c1: deploy/reference-build/
# c2: systemd-analyze verify
# c3: check-units.sh
seg-bb26e8c1aff0 = <b>Construcción de referencia</b> (<c1/>): lista genérica de piezas, configuración del sistema operativo, unidades systemd para el monitor consultivo y la compuerta opcional (comprobadas con <c2/> mediante <c3/>), una opción de contenedor, conexión con Signal K.

# text
# c1: position
# c2: advisory
seg-6695d4c1f13b = El complemento de Signal K acepta el esquema JSON en vivo { "1.2" } (se añade una clave <c1/> y luego una <c2/>; las claves añadidas desconocidas se ignoran), comprobado con salida real de { "1.2" } y con un signalk-server real.

# text
# c1: check-units.sh
# c2: inputArgs
# c3: notifications.navigation.gnss.kshana.trust
# c4: $PKSHT
# c5: marine-integrations.yml
seg-622c2d3dd8fa = Correcciones de la revisión: las unidades systemd se reinician siempre y se ejecutan aisladas (sin shell, sin red donde no hace falta), un fragmento de logrotate, <c1/> falla ante cualquier hallazgo; el contenedor ejecuta la compuerta desde variables de entorno con una comprobación de estado y con imágenes base fijadas por digest; metadatos de puntuación en Signal K, la notificación obsoleta se sustituye cuando se reanudan los datos, se conservan los errores de procesos hijos y las terminaciones escalan, se rechazan los <c2/> no seguros y la notificación está en <c3/>; el relé limita una línea parcial retenida; los analizadores de <c4/> rechazan puntuaciones fuera de { "0" } a { "100" }; una comprobación de enlaces de la documentación; un flujo de trabajo de CI (<c5/>) que ejecuta todo ello, incluido el binario real de extremo a extremo.

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7c615a62ca26 = <c1/>. Software de carácter consultivo, no un equipo homologado; el operador sigue siendo responsable. Solo software: no transmite nada y no se afirma ninguna cifra de detección ni de falsas alarmas.

# text
seg-72cb9f45ce99 = Añadido: correspondencia de compliance y exportación a test bench

# text
# c1: docs/compliance/
# c2: kshana compliance-report
# c3: kshana compliance-report <result.json>...
# c4: evidenced
# c5: partly-evidenced
# c6: not-evidenced
# c7: out-of-scope
seg-15aae04a9490 = <b><c1/> y <c2/>.</b> Una correspondencia entre las salidas de Kshana y cinco marcos y normas de resiliencia (el Resilient PNT Conformance Framework v2.0 del DHS de EE. UU., la guía de la OMI para buques, la guía de la EASA para la aviación, el artículo { "21" } de NIS2 y EN { "16803" }, una norma de pago citada por parte y por los pocos números de cláusula visibles en el texto del catálogo), con una tabla por marco: la referencia, lo que exige según nuestra paráfrasis, las salidas que aportan evidencias a favor de ella y la carencia. Se registran las versiones de las fuentes, las URL y lo que se leyó y lo que no. <c3/> rellena la correspondencia a partir de las ejecuciones indicadas y marca cada fila como <c4/>, <c5/>, <c6/> o <c7/>, en Markdown y JSON, con la carencia conservada en cada fila. La fórmula es "aporta evidencias a favor de"; nada se califica ni se aprueba. Las pruebas usan ejecuciones sintéticas y fallan cuando una tabla confirmada se desvía del código.

# text
# c1: kshana bench-export <scenario.toml>
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
# c5: GGA
# c6: RMC
# c7: receiver-trust
# c8: [[events]]
# c9: src/interop/testbench.rs
# c10: tests/interop_testbench.rs
# c11: docs/TEST-BENCH.md
# c12: kshana receiver-trust
seg-ee9a0a43e4b0 = <b><c1/>.</b> Escribe el movimiento del vehículo y los eventos de un escenario <c2/>, <c3/> o <c4/> para un simulador GNSS de laboratorio: un CSV de movimiento de usuario con marcos documentados y un archivo auxiliar de metadatos, NMEA { "0183" } <c5/>/<c6/>, texto de puntos de ruta, y los eventos como CSV y como bloques <c7/> <c8/> (<c9/>). Solo movimiento y eventos: no se escribe ninguna señal. Cada archivo se vuelve a leer en <c10/> y se compara dentro de su tolerancia declarada. <a1><c11/></a1> indica el método para reproducir la exportación mediante un simulador y puntuar el registro del receptor con <c12/>.

# text
# c1: compliance::run_from_text
# c2: assess_texts
seg-fc0fe915ed3d = <b>Qué cuenta como evidencia.</b> Un resultado cuenta para una capacidad solo cuando incluye los campos que escribe su tipo de escenario; una etiqueta de tipo de escenario por sí sola no cuenta para nada. Los tipos de escenario desconocidos, un resultado que discrepa de su escenario hermano, los hashes no hexadecimales y los recuentos de receiver-trust mal formados se listan como no usados, con el motivo. El informe escapa las celdas de Markdown y no puede entrar en pánico ante un hash no ASCII. <c1/> y <c2/> reciben textos, no rutas.

# text
seg-6b46de1164d8 = Exportación a test bench.

# text
# c1: --epoch
# c2: UtcEpoch::parse_iso
# c3: gnss-ins
# c4: GGA
# c5: bench-export
# c6: compliance-report
seg-c48a4dd4134b = <c1/> se comprueba en rango (<c2/>); el archivo de puntos de ruta comprueba cada intervalo y el comando indica el motivo cuando se omite; la documentación señala que el rumbo de <c3/> es la guiñada del cuerpo y no el rumbo efectivo, los campos de relleno de <c4/> y el cambio de altura propio del escenario. <c5/> y <c6/> están en el texto de uso.

# text
# c1: fusion::pack::truth_trajectory
# c2: gnss-ins
# c3: UtcEpoch
seg-eb2e415ec540 = <c1/> expone el historial de estados verdaderos del perfil de conducción de <c2/> (el mismo avance que usa la verdad de referencia del propio tipo de escenario), y <c3/> incorpora campos de fecha y hora NMEA.

# text
seg-fbfc1a59e99b = Validación del mapa de interferencias

# text
# c1: tests/fixtures/interference_map_ref/PREREGISTRATION.md
seg-a68d88381eea = <b>La semántica de decodificación y la geometría del mapa de interferencias se comprueban frente a implementaciones independientes sobre entradas sintéticas.</b> Los significados de los códigos NIC y NACp frente a la decodificación de pyModeS de tramas ADS-B sintéticas, los valores de no disponible de AIS frente a la decodificación de pyais de sentencias AIVDM sintéticas, la asignación de celdas de la cuadrícula frente a shapely, la longitud de ruta por estado de celda frente a shapely y GeographicLib, y el enmascarado de zonas interiores frente a shapely y pyproj, cada uno con una tolerancia fijada antes de la primera comparación (<c1/>). Esto valida cómo se leen los códigos y los valores de los campos, y la geometría, no que una celda señalada sea interferencia. El lector de polígonos de tierra ahora cierra un anillo que no repite su primer vértice, y antes lo leía sin su última arista. La documentación indica los umbrales de baja precisión de NACp y NIC como la cota que representa cada código (NACp { "6" } es una cota de EPU de { "556" } m, NIC { "5" } una cota de contención de { "1" } NM).

# text
seg-cf4ffdbba1a6 = Añadido (validación de los formatos de telemetría y de los paquetes de evidencias)

# text
# c1: docs/EVIDENCE-PACKS.md
# c2: cryptography
# c3: opentelemetry-proto
# c4: docs/EVIDENCE-PACKS.md
# c5: VerifyReport
# c6: signature_valid
# c7: scripts/gen_ed25519_rfc8032_ref.py
# c8: scripts/gen_evidence_pack_ref.py
# c9: scripts/evidence_verify_cleanroom.py
# c10: scripts/gen_telemetry_formats_ref.py
# c11: evidence_crypto_reference
# c12: evidence_pack_reference
# c13: telemetry_formats_reference
seg-ad6730e0e891 = <b>Comprobaciones externas de la criptografía de los paquetes de evidencias, del verificador de paquetes y de los formatos de transmisión de telemetría.</b> Los vectores de prueba Ed25519 de la sección { "7.1" } de RFC { "8032" } ({ "1" }, { "2" }, { "3" } y { "1024" }) y los ejemplos SHA-256 de FIPS 180-4 se ejecutan a través de las propias funciones de firma, verificación y hash del paquete, hasta la igualdad exacta. Un verificador escrito en Python solo a partir de la sección normativa de <c1/> (hashlib y <c2/>) coincide con el verificador de Rust en { "71" } paquetes íntegros y manipulados: veredicto, conjunto de fallos, veredicto de la firma y ambas cabezas de cadena. Nuestra exposición de Prometheus se lee con el analizador del cliente oficial de Python y nuestro JSON de OTLP con el mensaje oficial <c3/>, de forma estricta, y ambos coinciden con el estado a partir del cual se generaron. CEF y LEEF no tienen un validador abierto independiente y siguen siendo de nivel modelado. <c4/> incorporó el formato normativo del paquete y el procedimiento de verificación a partir de los cuales se escribió el verificador de sala limpia; <c5/> incorporó <c6/>. Referencias independientes y archivos de prueba: <c7/>, <c8/> con <c9/>, <c10/>; pruebas <c11/>, <c12/> y <c13/>. La CI no necesita Python.

# text
seg-20d1b02bfda4 = Añadido (validación de los eventos CEF)

# text
seg-8c464e43e43d = Los eventos CEF de telemetría los leen correctamente dos analizadores independientes de código abierto.

# text
# c1: pycef
# c2: logstash-codec-cef
# c3: =
# c4: pycef
# c5: tests/cef_reference.rs
# c6: tests/fixtures/cef/
# c7: scripts/gen_cef_ref.py
# c8: scripts/gen_cef_logstash_ref.py
# c9: cfp1
# c10: cfp2
# c11: cn1
# c12: cn2
seg-a6321d13b0ab = <c1/> { "1.11" } y el códec CEF de Logstash (<c2/> { "6.2.7" } en Logstash { "8.15.3" }) analizan { "157" } líneas CEF (cada cambio de banda y cada época del flujo de telemetría confirmado, más texto adversarial que contiene <c3/>, barras invertidas, barras verticales, saltos de línea, tabuladores y texto multibyte) y recuperan cada campo de cabecera, la severidad, el conjunto exacto de claves de extensión y cada valor exactamente. El códec de Logstash también lee cuatro líneas cuyo texto de cabecera necesita escapado, algo que <c4/> no puede. El umbral se registró antes de ejecutar ninguno de los dos analizadores (<c5/>); archivos de prueba en <c6/>, scripts de referencia independiente <c7/> y <c8/>; la CI no necesita ni Python ni Logstash. LEEF no tiene un analizador abierto mantenido y sigue siendo de nivel modelado. Los eventos CEF ahora llevan la puntuación de confianza y el desfase de época en los campos personalizados de coma flotante del diccionario CEF (<c9/>, <c10/>) en lugar de los campos enteros <c11/> y <c12/>, que no convenían a ninguno de los dos valores; CEF es nuevo en esta versión, de modo que no cambia nada de lo ya distribuido.

# text
# c1: assess_receiver_log
# c2: text
# c3: base64
seg-65b362fa8711 = MCP: <c1/> acepta el registro como <c2/> o <c3/>; la entrada de la herramienta está limitada a { "4" } MiB.

# text
seg-8999974aa1fa = El gráfico de jamming también toma sus colores de la paleta.

# text
# c1: src/jamming.rs
# c2: *.chart.svg
# c3: jamming
# c4: maritime-strait-jamming
# c5: jamming
# c6: src/palette.rs
# c7: tests/palette_sync.rs
# c8: jamming-demo
# c9: maritime-strait-jamming
# c10: font-family
# c11: web/studio/recorded/
seg-8c8ff384dbf6 = <c1/> era el único módulo que la revisión de la paleta del Observatory dejó con sus propios colores mientras llegaba el trabajo sobre la Q de los inhibidores; su <c2/> (los escenarios <c3/>, <c4/> y otros del tipo de escenario <c5/>) ahora lee <c6/>, y la lista de permitidos de <c7/> está vacía. Solo colores y tipografía: los gráficos de <c8/> y <c9/> son iguales a sus representaciones registradas anteriormente una vez normalizados el color, <c10/> y el pie con la versión. No se movió ningún valor representado. Las copias grabadas de Studio en <c11/> se volvieron a grabar en los nuevos portes de { "0.33.0" } y { "0.34.0" } (solo el sello de versión): todavía llevan los colores antiguos del gráfico de jamming y tomarán los de la paleta en el próximo nuevo porte.

# text
# c1: flicker_floor
# c2: clock-ensemble
# c3: consistent = false
# c4: flicker_floor
# c5: integrity
# c6: clock-ensemble
# c7: filter_health
# c8: holdover_s
# c9: timing_p95_ns
# c10: scenarios/orbit-gnss-challenged.toml
# c11: fom.integrity
# c12: filter_health
# c13: filter_health.consistent
# c14: true
# c15: false
seg-a059d10c5330 = <b>La cota de 3 sigma del conjunto de relojes ahora cubre el suelo de flicker, y la comprobación de salud del filtro lo detecta.</b> Con un <c1/>, el reloj verdadero llevaba FM de flicker pero el filtro de dos estados que proporciona la cota de integridad no, de modo que la cobertura de 3 sigma del escenario <c2/> distribuido era { "0.41" } (clásico) y { "0.33" } (cuántico), y la comprobación NIS/NEES, que extraía su verdad de referencia del modelo del propio filtro, informaba valores idénticos con y sin el suelo. Ahora la cota es la varianza de dos estados más la varianza exacta de la fase de flicker acumulada desde la última sincronización, calculada con el mismo banco que usa el reloj verdadero; la comprobación NIS/NEES extrae su verdad de referencia del modelo ampliado con ese banco y ejecuta el filtro ampliado correspondiente (y el filtro de dos estados frente a una verdad de referencia con flicker informa <c3/>). Cambio de salida, solo para relojes con <c4/> distinto de cero: <c5/> en <c6/> pasa de { "0.40866" } / { "0.33026" } a { "0.99970" } / { "1.0" } (clásico / cuántico) y los NIS/NEES de <c7/> ahora incluyen el flicker; el error de temporización, <c8/> y <c9/> no cambian, y los escenarios sin suelo son idénticos byte a byte. <c10/> (tipo de escenario orbit, semilla { "7" }, suelos { "1e-16" } / { "2e-11" }) también se mueve: <c11/> clásico de { "0.7734" } a { "1.0" } y cuántico de { "0.9796" } a { "1.0" }, y cambian los NIS/NEES de <c12/> y sus bandas. Su <c13/> cuántico pasa de <c14/> a <c15/>: un evento de muestreo del conjunto de flicker de 16 semillas por 60 pasos (NIS { "0.8815" } frente a una banda de [{ "0.9125" }, { "1.0914" }]), no un defecto. La banda es una banda del { "95" } %, de modo que aproximadamente el { "5" } % de las semillas señalan un filtro correspondiente por construcción ({ "40" } semillas nuevas de este escenario: cuántico { "1" } y clásico { "2" } señalados); con { "64" } por { "200" } la misma semilla queda dentro de la banda para ambos relojes (NIS { "0.990" } y { "1.001" }). Seguimiento conocido: el tipo de escenario fusion tiene la misma carencia (integridad clásica { "0.80" } con un suelo); el tipo de escenario hybrid se mantiene por encima de { "0.99" }.

# text
seg-c7308350b6d4 = <b>Reforzamiento de la entrada del servidor MCP.</b> Las herramientas de escenario del servidor MCP ahora aceptan solo contenido en línea y rechazan los campos de fuente de archivo; el tamaño de la entrada está limitado. Aviso: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

# text
seg-065c4431197e = Reproducción de laboratorio: un motor de seguimiento, monitores de detección y un ejecutor de campañas para grabaciones IQ de GNSS, con los diseños de lazo, los estimadores de C/N0 y las puntuaciones que los acompañan. Clase de evidencia: todo lo que sigue es <b>MODELLED</b> o está comprobado en su coherencia interna frente a formas cerradas y simulación con semilla; nada de ello añade una fila VALIDATED, y el registro de verificación no cambia ({ "251" } filas: { "124" } validadas, { "123" } modeladas, { "4" } del socio). Es una capa de análisis de software: nada de esto sintetiza una forma de onda de inhibidor o de spoofer, y nada transmite.

# text
seg-912ecb44cee4 = Reproducción de laboratorio: condiciones de prueba, ejecutor de campañas y puntuación ({ "0.34.0" }).

# text
# c1: kshana iq campaign <campaign.toml>
# c2: kshana.loop-design/1
# c3: kshana.test-conditions/1
seg-962c50f9ce8d = <c1/> reproduce grabaciones × cadenas de front-end × diseños de lazo (<c2/>) y puntúa cada celda frente a un archivo de condiciones de prueba por grabación (<c3/>, TOML o JSON). Ese archivo indica lo que un laboratorio sabe de la grabación: los satélites esperados y, para cada evento, su etiqueta de tipo, el inicio y el final, los satélites afectados y el perfil indicado de J/S o de potencia del inhibidor. Son solo metadatos. Las puntuaciones por satélite, para toda la ejecución y por evento, son:

# text
seg-180447aaf31e = disponibilidad, tiempo hasta la pérdida de enganche y J/S indicada en el momento de la pérdida;

# text
seg-1ababddb0d87 = tiempo de readquisición, desde el final del evento y desde la pérdida;

# text
seg-a6468323c971 = degradación medida de C/N0 por intervalo de J/S indicada;

# text
seg-4cb6f510e159 = episodios de falso enganche por hora enganchada (el indicador del seguidor, o Doppler frente a un archivo auxiliar de verdad de referencia);

# text
seg-97c6243bac2e = fluctuación de los discriminadores PLL y DLL.

# text
# c1: jamming::effective_cn0_dbhz
# c2: Q
seg-014b28f61db8 = Junto a cada curva de degradación medida se dibuja una referencia analítica de separación espectral (<c1/> con la <c2/> del tipo) y se etiqueta MODELLED dondequiera que aparece.

# text
# c1: data_class
# c2: synthetic
# c3: client-confidential
# c4: run.epochs
# c5: kshana.track-epoch/1
# c6: cell_key
# c7: report::digest
# c8: scorecard.csv
# c9: .json
# c10: report.html
# c11: DIGEST
# c12: [scoring.bars]
seg-eb5c38197dab = Las celdas se ejecutan en paralelo a través de la máquina de estados de enganche de la sesión de seguimiento, y cada una se escribe de forma atómica bajo una clave de hash de contenido. La clave abarca el SHA-256 de la grabación, los hashes de condición, front-end, diseño, ejecución y puntuación, el <c1/> obligatorio (<c2/> | <c3/>) y la versión del motor. Con <c4/> establecido, también se conservan el flujo <c5/> y los eventos de enganche de cada celda, nombrados por clave de celda y con su hash incorporado a la celda. <c6/> y <c7/> son públicos, de modo que un consumidor puede volver a derivar cada clave y el digest. Por tanto, una nueva ejecución omite las celdas terminadas, y las salidas nunca dependen del número de procesos de trabajo. La ejecución escribe <c8/>/<c9/>, un <c10/> autónomo y un <c11/>. Los umbrales de superado/no superado (<c12/>, sustituibles por grabación) se aplican al construir el informe.

# text
# c1: [scoring] cn0_estimator = "m2m4" | "nwpr"
# c2: "m2m4"
seg-beec1c1264c9 = <c1/> (por defecto <c2/>, parte del hash de puntuación) elige el C/N0 en el que se basan el C/N0 notificado y la curva de degradación. Ambas estimaciones se puntúan y se notifican siempre (medianas de toda la ejecución y de la línea base, y por intervalo de J/S), y la celda y el cuadro de puntuación registran el estimador. NWPR lee unos { "8" } dB × Bn·T por debajo bajo la propia fluctuación del lazo; M2M4 no.

# text
seg-baf1a2422a66 = También es nuevo:

# text
# c1: kshana iq campaign report <dir>
seg-f36e22ff54c3 = <c1/> reconstruye los cuadros de puntuación, el informe y el digest a partir de las celdas;

# text
# c1: kshana iq conditions <file>
seg-aad7fcc28bc8 = <c1/> comprueba un archivo de condiciones de prueba frente a su esquema;

# text
# c1: events_from_sigmf = true
# c2: kshana:test_event
seg-c3e5e4461aaa = <c1/> importa como eventos las anotaciones <c2/> de una grabación SigMF;

# text
# c1: iq_test_conditions
# c2: iq_campaign
# c3: iq_campaign_report
seg-c1a2ebb844c5 = Python incorpora <c1/>, <c2/> y <c3/>;

# text
# c1: kshana-mcp
# c2: iq_campaign
# c3: iq_campaign_status
seg-cd69258ccc09 = <c1/> incorpora <c2/>, que es incremental y reanudable bajo el presupuesto de muestras por llamada, con todos los archivos confinados al directorio de trabajo, y <c3/>.

# text
# c1: tests/iq_campaign.rs
seg-c398b66a7058 = Pruebas: <c1/> ejecuta una campaña sintética de { "3" } grabaciones × { "2" } front-ends × { "2" } diseños. Sus escenas llevan perfiles de C/N0 indicados y cubre:

# text
seg-3f2fbdecb101 = cada métrica comprobada frente a la verdad de referencia inyectada;

# text
seg-e103a30260db = reanudación tras una ejecución parcial con un solo proceso y una celda corrupta, idéntica byte a byte a una ejecución ininterrumpida con cuatro procesos;

# text
seg-79164d8b0b22 = archivos de épocas por celda;

# text
# c1: reacquire
# c2: reacquire
seg-9470016f056a = una regresión de readquisición de tres satélites de { "20" } s: con <c1/> activado, todos los canales vuelven en { "2" } s tras un hueco de { "2" } s; el resultado con <c2/> desactivado queda fijado;

# text
seg-1deb4ab83054 = umbrales reevaluados sin volver a ejecutar;

# text
seg-351f9cdcbcd6 = la CLI;

# text
seg-2c35af369a36 = comprobaciones ignoradas en modo release de rendimiento y memoria, incluida una grabación de { "4" } GB ({ "5.45" }× el tiempo real, memoria máxima { "2" } MB por encima del RSS inicial; mediciones en una máquina, no umbrales).

# text
# c1: docs/design/LAB-CAMPAIGN.md
seg-efbaf5a00ea2 = Solo software: nada transmite y no se sintetiza ninguna forma de onda de interferencia ni de spoofing. Notas de diseño y de lo construido: <c1/>.

# text
seg-c9871226c82f = Motor de seguimiento para reproducción de laboratorio ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

# text
# c1: kshana.loop-design/1
# c2: docs/design/LOOP-DESIGN-TOML.md
# c3: iq::track::design
seg-cd353717667b = <em>Archivos de diseño de lazo</em>: TOML <c1/> (<c2/>; analizador <c3/>). Uno o más diseños con nombre fijan cada campo del lazo:

# text
seg-0437148324ca = tipo de portadora (PLL, FLL o PLL asistido por FLL), órdenes y anchos de banda;

# text
seg-4e722960f8c6 = discriminadores PLL/FLL/DLL y ayuda a la portadora;

# text
seg-44976e3ad4e7 = espaciado e integración;

# text
seg-5c06173036d6 = umbrales de enganche y ventanas de C/N0, y sincronización de bits;

# text
seg-405e693dd757 = la máquina de estados de enganche;

# text
# c1: "auto"
seg-e6908584e2f4 = la adquisición de relevo (<c1/> o explícita).

# text
# c1: extends
seg-8844cc963705 = Los diseños pueden <c1/> unos a otros. Se rechazan las claves desconocidas. Cada diseño resuelto tiene un hash SHA-256 sobre una forma JSON canónica (claves ordenadas en cada nivel, formato numérico fijo), de modo que el hash no depende del orden de los campos; todas las salidas lo registran. Superficies:

# text
# c1: kshana iq track --design <file> [--design-name]
seg-5c32182634f7 = <c1/>, donde las opciones explícitas prevalecen sobre el diseño y quedan registradas;

# text
# c1: kshana iq sweep --design <file>
seg-9356751a6b98 = <c1/>, que ejecuta todos los diseños del archivo;

# text
# c1: iq_track(design=, design_name=, reacquire=)
# c2: iq_loop_designs
seg-6815ec9b33c6 = Python <c1/>, <c2/>;

# text
# c1: iq_track
# c2: design
# c3: design_name
seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

# text
# c1: EpochOutput.cn0_m2m4_dbhz
# c2: cn0_m2m4_dbhz
# c3: cn0_beaulieu_dbhz
seg-70d3b295bea0 = <em>C/N0 M2M4</em> (<c1/>, la columna <c2/> de track-epoch tras <c3/>; diccionarios de épocas de Python). La estimación por momentos de segundo y cuarto orden sobre las mismas ventanas que NWPR, solo a partir de la potencia del prompt: NWPR lee por debajo bajo la propia fluctuación de portadora del lazo (unos { "8" } dB × Bn_PLL·T) y M2M4 no. En GPS L2C CM ({ "20" } ms, nominal { "40" } dB-Hz, PLL de { "1" } a { "10" } Hz) lee { "39.93" } dB-Hz en cada ancho de banda mientras que NWPR cae de { "39.55" } a { "38.22" }; en L1 C/A a { "45" } dB-Hz lee { "45.34" }. NWPR y todas las demás salidas no cambian (fijado bit a bit). El registro binario sigue siendo de { "184" } bytes (el valor ocupa el flotante reservado y el bit de indicador { "6" }).

# text
seg-c02d07475717 = Tomas de correlador adicionales (multicorrelador / SQM).

# text
# c1: [design.integration] extra_taps_chips = [..]
# c2: EpochOutput.extra
# c3: (offset, value)
# c4: kshana.track-epoch/1
# c5: 184 + 16 × taps
# c6: extra_taps_chips
# c7: --extra-taps
# c8: extra_taps
# c9: extra_taps_chips
# c10: iq_track
seg-70fcdc903413 = <c1/> (desfases en chips respecto al prompt, positivos hacia adelantado; como máximo { "16" }, cada uno dentro de ±{ "2" }) correlaciona réplicas adicionales junto a E/P/L y las devuelve como <c2/> (<c3/> en el orden del diseño). Los lazos nunca las usan. La clave se omite del JSON canónico cuando está vacía, de modo que el hash del diseño por defecto y toda salida sin tomas no cambian (<c4/> se mantiene; el CSV/JSONL/binario sin tomas son idénticos bit a bit). Con tomas: columnas CSV/JSONL y un registro binario de <c5/> bytes cuya cabecera lleva <c6/>, de modo que un lector antiguo rechaza el archivo en lugar de interpretarlo mal. <c7/> (CLI), <c8/> (Python) y <c9/> (MCP <c10/>). Los diseños de una misma ejecución deben coincidir en las tomas.

# text
# c1: iq track
# c2: iq sweep --threads <N|auto>
# c3: TrackSession::with_threads
# c4: std::thread::scope
# c5: wasm32
seg-66d494267598 = <em>Canales en paralelo</em> (<c1/> / <c2/>; Rust <c3/>). Los canales de cada fragmento se ejecutan en hasta N hilos (<c4/>; <c5/> sigue siendo serie). La correlación y la máquina de estados de enganche de un canal solo afectan a ese canal; sus épocas y eventos se almacenan en búfer y se escriben en los destinos en orden de canal, de modo que la salida (CSV, JSONL, binario, eventos, resumen) es idéntica byte a byte a la ejecución en serie para cualquier N. Por defecto sigue siendo { "1" } hilo. Medido en una grabación de 12 canales, { "4" } s, { "4.092" } MHz en { "4" } núcleos: { "19.5" } s en serie, { "11.5" } s con { "2" } hilos, { "6.3" } s con { "4" } ({ "3.1" }×; la adquisición inicial es en serie).

# text
# c1: kshana.acq-surface/1
# c2: iq::acq_surface
# c3: docs/design/ACQ-SURFACE.md
# c4: iq acquire --surface <path>
# c5: iq_acq_surface
# c6: iq_acquire
# c7: surface_out
# c8: acquire
# c9: acquire
seg-cf59911d458f = <em>Exportación de la superficie de adquisición</em> (<c1/>; <c2/>, <c3/>). <c4/> (un PRN; CSV, JSON o binario), <c5/> de Python y <c6/> <c7/> de MCP escriben toda la superficie de potencia de correlación Doppler × fase de código que calcula la búsqueda (sus celdas son las de <c8/>, bit a bit) con el pico y dos refinamientos de Doppler fino: una estimación parabólica y una búsqueda fina de 1/16 de intervalo (≈{ "5" } Hz con { "4" } ms coherentes, frente a intervalos de { "167" } Hz). <c9/> en sí y todos los valores por defecto no cambian.

# text
# c1: kshana.track-epoch/1
# c2: iq::track::sink
seg-a01bf371cc4f = <em>Salida de épocas en flujo</em> (<c1/>; <c2/>). Cada actualización del lazo incluye:

# text
seg-ff549f07ce78 = los correladores adelantado/prompt/retrasado;

# text
seg-00457c1bb059 = las tres salidas del discriminador;

# text
seg-b17d335f6cac = los estados de los NCO de PLL/FLL/DLL y la fase de portadora;

# text
seg-a3bf3f1034cd = los indicadores PLI y de enganche;

# text
seg-7912a72da79b = ambas estimaciones de C/N0 y los bits;

# text
seg-8d105d656041 = el estado de enganche.

# text
# c1: BinaryEpochReader
# c2: iq_read_epochs
seg-6af6331255fb = Se escribe a medida que ocurre, como CSV, JSON Lines o una forma binaria versionada con lectores en Rust (<c1/>) y Python (<c2/>).

# text
# c1: iq track
# c2: --epochs
# c3: --events
# c4: --summary
# c5: kshana.track-summary/1
# c6: iq sweep
# c7: --epochs
# c8: --events
# c9: iq_track
# c10: epochs_out
# c11: events_out
seg-aa081bfd9878 = <c1/> incorpora <c2/>, <c3/> y <c4/> (<c5/>), y <c6/> incorpora <c7/> y <c8/>. <c9/> de MCP incorpora <c10/>/<c11/> y construye su respuesta a partir del resumen de memoria acotada.

# text
# c1: tests/iq_track_memory.rs
seg-8cb2f8b27bad = El montón de una ejecución ya no crece con la duración de la grabación: <c1/> lo mide con un asignador contador ({ "6" }× la duración, mismo pico dentro de { "64" } KiB), con un control que muestra que la vía en memoria sí crece.

# text
seg-e3eff59db445 = La salida en flujo es idéntica bit a bit a la reproducción en memoria.

# text
# c1: iq::track::lock
# c2: TrackSession
# c3: reacq_window_s
# c4: reacq_interval_s
# c5: reacq_max_interval_s
# c6: reacq_interval_s
# c7: max_reacq_attempts
seg-c602902313f8 = <em>Máquina de estados de enganche</em> (<c1/>, <c2/>): captura inicial → enganchado → perdido → readquisición → captura inicial, o retirado cuando una pérdida supera <c3/> (por defecto { "30" } s). Las búsquedas fallidas se reintentan cada <c4/> ({ "0.1" } s), con espaciado uniforme, de modo que el calendario de reintentos añade como máximo { "0.1" } s al tiempo de readquisición medido. Un retroceso opcional (<c5/> por encima de <c6/>) está desactivado por defecto, y <c7/> es un tope opcional ({ "0" }, ninguno, por defecto). Una interrupción de { "2" } s en tres PRN a { "4.092" } MS/s ahora termina con todos los canales readquiridos y enganchados. Con un presupuesto de 3 intentos, todos los canales se retiraban en { "0.2" } s desde la pérdida.

# text
# c1: loss_dwell_s
# c2: pull_in_max_s
seg-56bc109dbef9 = Los umbrales (<c1/>, <c2/>, la ventana Doppler de readquisición) proceden del diseño. Cada transición es un evento con su motivo.

# text
seg-b1c551e48389 = La comprobación de falso enganche busca el Doppler seguido frente a su alias FLL/PLL de ±1/(2T). Detecta el falso enganche que midió PR #38 (−{ "2400" } Hz seguido con { "500" } Hz de desviación). Con la readquisición activada, el canal termina enganchado en el Doppler inyectado.

# text
seg-39409dd0b4bc = Un hueco de señal de { "0.8" } s se declara como pérdida y se readquiere en { "0.3" } s desde el regreso de la señal.

# text
# c1: final_state
# c2: RETIRED
seg-ce3162720ce5 = <c1/> (y la columna de la tabla) es el estado tras la última transición, de modo que un canal retirado después de su última actualización del lazo figura como <c2/>.

# text
# c1: [design.carrier] fll_assist = "pull-in"
# c2: "always"
# c3: fll_off_pli
# c4: fll_gate_dwell_s
# c5: fll_on_pli
# c6: docs/design/evidence/carrier-lock/
# c7: fll_assist = "always"
seg-520ab6d84a6c = <b>Asistencia del FLL solo durante la captura inicial</b> (<c1/>, el valor por defecto; <c2/> mantiene el comportamiento anterior bit a bit). El FLL cede el control al PLL cuando el PLI suavizado se mantiene en <c3/> ({ "0.8" }) o por encima durante <c4/> ({ "0.1" } s), y vuelve cuando cae por debajo de <c5/> ({ "0.6" }). Con la asistencia siempre activa, la vía FLL de { "10" } Hz rompía el enganche de fase por debajo de unos { "38" } dB-Hz en señales limpias: a { "35" } dB-Hz la fracción de enganche de fase era del { "10" }–{ "16" } %, con un error de fase verdadero de { "38" }–{ "41" }°. Con la compuerta, el valor por defecto mantiene el { "100" } % a { "35" } dB-Hz con { "4.5" }°, igual que un PLL solo. La captura inicial desde un error de relevo de { "100" } Hz no cambia. Evidencias con umbrales preregistrados: <c6/>. <b>Por tanto, los lazos por defecto no coinciden bit a bit con las ejecuciones anteriores del diseño por defecto.</b> Use <c7/> para reproducirlas. Límite conocido: a { "35" } dB-Hz el traspaso llega a los { "1.9" }–{ "2.6" } s del seguimiento, y a { "33" } dB-Hz el FLL de { "10" } Hz mantiene el PLI por debajo del umbral de traspaso, de modo que la captura inicial nunca se completa.

# text
seg-1a911b958f8e = Claves de diseño de lazo y API nuevas, en lista:

# text
# c1: [design.lock]
# c2: reacq_window_s
# c3: reacq_interval_s
# c4: reacq_max_interval_s
# c5: max_reacq_attempts
seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, con <c5/> cambiado de un valor por defecto de { "3" } a un tope opcional (por defecto { "0" });

# text
# c1: LoopConfig.fll_assist
# c2: FllAssist
# c3: FllGate
# c4: LoopCore::set_fll_enabled
# c5: EpochOutput.fll_active
# c6: ChannelSummary.final_state
seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

# text
# c1: 33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80
seg-eecacf54975b = El hash del diseño se calcula sobre una forma JSON canónica, y el hash del valor por defecto incorporado es <c1/> (fijado por una prueba).

# text
seg-2405be1bc0c6 = Notas de compatibilidad de la salida:

# text
# c1: iq track
# c2: final_state
seg-77670b7dd608 = la tabla de <c1/> tiene una columna final <c2/>;

# text
# c1: iq sweep
# c2: design_hash
# c3: design_hash
# c4: warnings
seg-a52d9bbdd1a4 = el CSV de <c1/> tiene una columna final <c2/>, y su JSON tiene <c3/> y <c4/>;

# text
# c1: mean_cn0_dbhz
seg-3fa0f9243806 = el <c1/> del barrido es ahora la media de todas las actualizaciones que tienen una estimación NWPR (resumen de memoria acotada), y ya no la de la segunda mitad de la ejecución.

# text
# c1: [design.lock] reacquire = true
# c2: --reacquire
# c3: reacquire=True
seg-d542c1616f35 = La readquisición está <b>desactivada en el valor por defecto incorporado</b>, donde la máquina de estados solo observa y los lazos funcionan bit a bit igual que sin ella. (Los propios lazos por defecto sí cambiaron: véase la asistencia del FLL más arriba.) Actívela por diseño (<c1/>), con <c2/> o con <c3/>.

# text
# c1: commensurate_sampling
# c2: iq::track::commensurate_samples_per_chip
# c3: iq track
# c4: iq sweep
# c5: --summary
# c6: iq_track
# c7: iq_track
# c8: docs/design/evidence/dll-jitter/
seg-61d6b3122888 = Una <b>advertencia de <c1/></b>: cuando fs está a menos de { "1e-6" } de un múltiplo de la mitad de la tasa de chips (<c2/>), <c3/>/<c4/> (salida, <c5/>, JSON del barrido), la respuesta de <c6/> de MCP y el resultado de <c7/> de Python advierten de que la fluctuación y el sesgo del lazo de código no son representativos. La causa raíz está documentada con umbrales preregistrados en <c8/>. Con exactamente { "2" } muestras por chip y espaciado de 0,5 chips, la curva S del DLL es un único escalón y el lazo oscila: ≈ { "0.09" } chips de error de código RMS (≈ { "26" } m) a { "45" } dB-Hz, frente a ≈ { "0.004" } chips con una tasa inconmensurable. El C/N0 NWPR unos { "2" } dB bajo a esa tasa tiene la misma causa. Con exactamente { "0" } Hz de Doppler de código y { "4" } muestras por chip, el código nunca cruza la zona muerta de ±0,21 chips, de modo que puede persistir un sesgo de fase de código de hasta aproximadamente { "0.2" } chips sin aparecer en la fluctuación (medido: un espaciado de 0,5 chips da { "2.0" }× el error de código del control con una media de +{ "0.011" } chips; un espaciado de 0,25 chips da +{ "0.125" } chips); la advertencia cubre la tasa.

# text
# c1: docs/design/evidence/carrier-lock/
seg-8fbfb3f0bee2 = <b>Límite conocido: el diseño por defecto no hace el traspaso FLL→PLL por debajo de unos { "35" } dB-Hz</b> (un suelo de captura inicial de ~{ "35" } dB-Hz; véase la asistencia del FLL más arriba y <c1/>).

# text
seg-43f02bc861be = Una búsqueda de falso enganche o de readquisición que no puede ejecutarse (una tasa sin un número entero de muestras por periodo de código) ya no detiene el seguimiento.

# text
# c1: tests/iq_track_engine.rs
# c2: tests/iq_cli.rs
# c3: iq::track::design::tests
# c4: tests/python
seg-14f4e9edc443 = Pruebas: <c1/>, <c2/>, <c3/>, <c4/> y el viaje de ida y vuelta de IQ por MCP.

# text
seg-60141bb08f64 = Perfiles de C/N0 en escenas sintéticas ({ "0.34.0" }).

# text
# c1: iq::channel::cn0_profile
# c2: Cn0ProfileChannel
# c3: cn0_dbhz
seg-1b44566881e8 = <c1/> programa un C/N0 variable en el tiempo por satélite en las propias escenas de Kshana, como desfases en dB relativos al C/N0 de la escena. Formas: escalón, rampa, lineal por tramos y desvanecimientos de Rice con semilla de tipo centelleo, con un S4 y un tiempo de decorrelación indicados. Se aplican mediante el gancho de canal de escena existente (<c2/>, que se compone con los efectos de ionosfera, troposfera, centelleo y multitrayecto), sin cambios en el núcleo de la escena. El <c3/> del archivo auxiliar de verdad de referencia sigue el perfil.

# text
# c1: kshana iq scene … --cn0-profile <toml>
# c2: kshana.iq_scene(…, cn0_profile="<toml>")
seg-548eeca516ff = Superficies: <c1/> y <c2/>.

# text
seg-a242e4d9f071 = Para qué sirve: los lazos, los monitores y la puntuación de campañas pueden someterse a pruebas de esfuerzo frente a una verdad de referencia conocida. Solo cambia la intensidad de las señales legítimas.

# text
# c1: tests/iq_cn0_profile.rs
seg-ff4df7c343dc = Comprobaciones (<c1/>). Umbrales: intensidad media del desvanecimiento dentro del { "5" } % de { "1" }, S4 dentro del { "8" } % del objetivo (con S4 = { "0.3" }, { "0.7" } y { "1" }), correlación de intensidad superior a { "0.9" } con { "0.05" } τ e inferior a { "0.05" } con { "5" } τ; verdad de referencia exactamente el C/N0 indicado más el perfil; una caída del C/N0 NWPR seguido dentro de { "0.7" } dB de un escalón de { "6" } dB. Medido: S4 dentro del { "1.3" } % del objetivo y una caída seguida de { "6.26" } dB.

# text
# c1: iq::monitor
# c2: kshana iq monitor
# c3: kshana.iq_monitor(path, ...)
seg-e214458cd1b6 = <b>Monitores de detección en la vía IQ ({ "0.34.0" } "Reproducción de laboratorio").</b> Nuevo módulo <c1/>, comando <c2/> y enlace <c3/>. Observan una grabación e informan de series temporales y de eventos marcados (instantes de inicio, de alarma y de fin, pico, umbral). Solo detectan y miden; nada de esto genera una señal.

# text
seg-5b05b2a54fab = <b>Potencia total / AGC</b>: potencia por bloque y la ganancia que aplicaría un AGC ideal; marca subidas y bajadas.

# text
# c1: pulse_pfa
seg-2a84a640d7f1 = <b>Espectro precorrelación</b>: PSD de Welch por bloque frente a una línea base aprendida. El umbral de exceso procede de un objetivo de falsas alarmas. También curtosis compleja y un detector de pulsos. El detector de pulsos cuenta las muestras que superan un umbral en cada bloque y genera un evento cuando la cola superior binomial exacta de ese recuento queda por debajo de <c1/> (por defecto { "1e-4" } por bloque), no cuando una puntuación z supera un límite: con los recuentos esperados pequeños de bloques cortos, una sola muestra ya supone varias sigmas.

# text
seg-7704ac807c38 = <b>C/N0 por canal</b>: dos detectores de cambio CUSUM unilaterales (descenso y ascenso), alimentados con estimaciones independientes (el paso se fija a partir de la ventana de C/N0 del lazo).

# text
# c1: (I_E − I_L)/I_P
# c2: (I_E + I_L)/(2 I_P)
seg-f965a68d388b = <b>SQM a partir de los correladores</b>: delta <c1/> y cociente <c2/>, además de pruebas de asimetría con correladores adicionales cuando un canal los proporciona.

# text
seg-a4006c2e8692 = <b>Serie de indicadores de enganche</b>: PLI y un indicador de enganche de frecuencia a partir de prompts sucesivos, como señales en bruto. Las decisiones de enganche y de pérdida de enganche siguen en la máquina de estados de enganche del motor de seguimiento.

# text
# c1: iq::monitor::run::run_monitors
# c2: MonitorConfig
# c3: tests/iq_monitor.rs
seg-da72318f44cc = Una sola pasada en flujo (<c1/>) ejecuta todo, con un archivo de ajustes TOML/JSON (<c2/>); el ejecutor de campañas usa el mismo punto de entrada. Todo MODELLED. Cada estadístico se comprueba frente a su forma cerrada mediante simulación con semilla (<c3/>):

# text
seg-0ff96e4c5a20 = superaciones de la potencia por bloque frente a la cola Gamma;

# text
# c1: 2/√N
seg-97b559ea0897 = media de curtosis { "2" } y dispersión <c1/>;

# text
# c1: e^{−t}
seg-2b941c702b7f = fracción de pulsos <c1/>;

# text
seg-e8f068c41f0c = longitudes de racha de CUSUM frente a la aproximación de Siegmund (medidas { "330" } y { "8.46" } muestras frente a { "338" } y { "8.34" });

# text
seg-e2cd6a55e49b = el indicador de enganche de fase frente a la media de fase de Rice;

# text
seg-06291b1c6274 = en una señal C/A seguida, las dispersiones del delta y del cociente SQM se desvían alrededor de un { "6" } % de las formas cerradas de primer orden (medido { "5.97" } %; umbral de la prueba { "12" } %).

# text
seg-12deb36a2e3a = La fórmula de falsas alarmas del exceso espectral es una aproximación; la tasa medida fue { "1.3" }× la fórmula. De extremo a extremo, los monitores marcan:

# text
seg-b002c66c7881 = un escalón de C/N0 de { "6" } dB (instante del cambio dentro de una estimación);

# text
seg-2e828d106393 = un trayecto reflejado que aparece a mitad de la grabación (prueba de cociente);

# text
seg-68063f036e2c = una interrupción de la señal (el PLI cae de { "0.999" } a −{ "0.3" } y el FLI de { "0.93" } a { "0.03" } durante ella);

# text
seg-0cd95f0197ec = un tono de banda estrecha y muestras dispersas de gran amplitud (pruebas espectrales, de pulsos y de curtosis). Son entradas genéricas de prueba de DSP, no modelos de interferencia.

# text
# c1: iq track
# c2: iq sweep
seg-7128b9000cc2 = <c1/>/<c2/> transmiten en flujo a través de la nueva sesión (véase Añadido).

# text
# c1: --csv
# c2: --json
# c3: --epochs
seg-98891d33e48c = <c1/> conserva sus columnas de { "0.32" } pero ahora se emite en flujo, de modo que las filas de varios canales se intercalan en orden temporal en lugar de agruparse por canal. <c2/> conserva su forma de { "0.32" } y sigue guardando todas las épocas en memoria: use <c3/> para grabaciones largas.

# text
# c1: iq sweep
# c2: design_hash
seg-2ef2d5771ade = <c1/> mide la fluctuación sobre las actualizaciones de la segunda mitad de la duración de la ejecución (antes la segunda mitad del número de actualizaciones), y su CSV/JSON incorporan una columna <c2/>.

# text
# c1: final_state
seg-f23b6db96748 = La tabla de seguimiento incorpora una columna <c1/>.

# text
# c1: iq track
# c2: iq acquire
seg-a5769fbc201e = El texto de uso ya no afirma que <c1/> acepte las opciones del front-end; solo <c2/> las aplica.

# text
# c1: iq_track
# c2: acq_noncoherent
# c3: doppler_max
# c4: None
# c5: carrier_phase_cycles
# c6: bit_edge
# c7: bit
# c8: state
# c9: design
# c10: events
seg-cf28fa21786a = <c2/> y <c3/> de <c1/> de Python ahora tienen <c4/> por defecto (los valores del diseño, { "1" } y { "5000" } Hz en el diseño incorporado). Sus épocas incorporan los correladores adelantado/retrasado, <c5/>, <c6/>, <c7/> y <c8/>, y el resultado incorpora <c9/> y <c10/>.

# text
# c1: 2 / (3 · N · T_code)
# c2: 1 / (3 · N · T_code)
# c3: 1 / (4 T_track)
# c4: N = 1
# c5: 0.2 / T_track
# c6: kshana::iq::acq::default_step_hz
# c7: N = 4
# c8: "auto"
# c9: doppler_step_hz
# c10: --doppler-step
# c11: iq acquire
# c12: --summary
# c13: resolved
seg-666b9e3faa5d = <b>El paso de adquisición por defecto ya no entrega al seguimiento de Galileo E1 un residuo que el FLL no puede captar.</b> El paso <c1/> deja hasta <c2/> de error Doppler en el traspaso, pero el FLL de dos cuadrantes por defecto solo capta <c3/>. Para todo código de { "4" } ms o más (<c4/>), incluidos Galileo E1-B y E1-C, el residuo ({ "83.3" } Hz con { "4" } ms) quedaba fuera de la captura de { "62.5" } Hz y el seguimiento hacía falso enganche a +{ "125" } Hz, con un indicador de enganche de fase de { "0.97" } que lo ocultaba. El paso por defecto ahora también está limitado a <c5/> (<c6/>), { "0.8" } de la captura, de modo que el traspaso queda dentro de ella incluso cuando gana el intervalo contiguo. ({ "0.4" } se probó primero: hizo falso enganche en { "1" } ejecución de { "42" } con E1-B, y una búsqueda GPS L1 C/A de { "1" } ms coherente eligió un intervalo a { "350" } Hz y se enganchó a +{ "500" } Hz; { "0.25" } y { "0.2" } no tuvieron ninguno en las mismas ejecuciones.) Coste: Galileo E1-B/E1-C pasan de intervalos de { "166.7" } Hz a { "50" } Hz, { "201" } intervalos sobre ±{ "5" } kHz en lugar de { "61" }; los códigos de { "1" } ms ({ "166.7" } Hz, <c7/>) no cambian. <c8/> en un diseño de lazo significa esto; un <c9/> o <c10/> explícito se usa tal como está escrito, y <c11/> (sin traspaso al seguimiento) conserva el paso de los manuales. La cabecera de época y <c12/> ahora registran el paso resuelto y los anchos de banda de lazo de cada canal (<c13/>). El hash del diseño por defecto no cambia. Cambio de salida: las detecciones en códigos de { "4" } ms o más pueden caer en intervalos Doppler distintos.

# text
# c1: Bn · T
# c2: carrier.bn_t_max
# c3: bn_t_max / T
# c4: Design::loop_config_for
# c5: bn_t_max = 0
seg-9150dc89e186 = <b>GPS L2C CM (actualización de lazo de { "20" } ms) mantiene el enganche con el diseño por defecto.</b> El PLL de { "15" } Hz y el FLL de { "10" } Hz por defecto tienen <c1/> de { "0.3" } y { "0.2" } con T = { "20" } ms, y el lazo perdía el enganche incluso desde un inicio perfecto (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Una nueva clave de diseño, <c2/> (por defecto { "0.1" }), limita los anchos de banda de ruido del PLL y del FLL a <c3/> cuando el tiempo de actualización del lazo es superior a { "4" } ms (<c4/>): { "5" } Hz y { "5" } Hz con { "20" } ms, { "10" } Hz y { "10" } Hz con los { "10" } ms de BeiDou B1C; los códigos de { "1" } ms y { "4" } ms conservan { "15" } y { "10" } Hz. Se aplica también a los anchos de banda explícitos; <c5/> lo desactiva. La clave se omite de la forma canónica en su valor por defecto, de modo que el hash por defecto no cambia; un diseño que fija cualquier otro valor tiene un hash distinto. A { "45" } dB-Hz, L2C CM da ahora PLI { "0.996" }, error Doppler { "0.00" } Hz y M2M4 { "42.71" } dB-Hz. Asunto abierto conocido: el C/N0 NWPR lee { "1.76" } dB por debajo allí (y { "2.45" } dB por debajo en B1C con { "10" } ms), por lo que el T5 de la matriz para L2C sigue siendo un hallazgo ignorado.

# text
# c1: docs/assets/clock-ensemble-band.svg
# c2: scenarios/clock-ensemble.toml
# c3: flicker_floor = 1e-16
# c4: flicker_floor = 2e-11
seg-74517bee3f6f = <b><c1/> regenerado: la figura confirmada estaba desactualizada respecto a su propio escenario (un cambio de datos, no un redibujado).</b> El gráfico se dibujó el 2026-06-02 a partir de <c2/>; dos días después, 67fed19e fijó los suelos de FM de flicker en ese escenario (cuántico <c3/>, CSAC <c4/>) y la figura nunca se volvió a dibujar. Mostraba la ejecución anterior a los suelos: eje y de { "0" } a { "47" } ns, p95 de interrupción por ejecución del CSAC de { "10.5" } a { "47.6" } ns (media { "25.2" } ns), holdover clásico de { "4050" } s de media. El escenario tal como se distribuye (y como ya indican el tutorial y el resumen de la CLI) da un eje y de { "0" } a { "407" } ns, p95 por ejecución del CSAC de { "40.8" } a { "374.0" } ns (media { "167.0" } ns), holdover clásico de { "844" } s [{ "220" } a { "2130" } s]; la línea de especificación de { "20" } ns queda en los mismos { "20" } ns sobre un eje aproximadamente nueve veces más alto. El motor no ha cambiado: el motor actual sobre el archivo de escenario de junio reproduce exactamente el eje de la figura antigua. La figura no se referencia desde el README ni desde la documentación.

# text
seg-75636f9419b2 = Limitaciones conocidas

# text
# c1: bn_t_max = 0.1
seg-2c607b56048e = <b>El C/N0 NWPR lee por debajo con un C/N0·T por prompt alto, y BOC({ "1,1" }) a { "5" } MS/s pierde aproximadamente { "1" } dB.</b> NWPR no tiene sesgo con prompts ideales, pero la propia fluctuación del PLL del lazo cuesta unos { "8" } dB × Bn·T ajustados (una escena, cuatro puntos: −0.24/−0.44/−0.77/−{ "1.58" } dB a 1/2.5/5/10 Hz y { "20" } ms; unos −{ "1" } dB con el <c1/> por defecto); M2M4 es insensible. Los datos de BeiDou B1C a { "5" } MS/s también pierden unos { "1" } dB de potencia de prompt por la limitación de banda (use { "10" } MS/s o más). Ninguno de los dos es un defecto del estimador; las filas T5 de la matriz de señales para GPS L2C y BeiDou B1C siguen siendo hallazgos ignorados con estas causas.

# text
seg-ff195e575023 = <b>Texto de los gráficos y adopción de gráficos en Studio reforzados.</b> El texto que un escenario lleva a un gráfico generado ahora se escapa de forma coherente mediante una rutina compartida, y Studio adopta solo el marcado de dibujo de un gráfico. Los parámetros de dirección de Studio, las búsquedas por tipo de escenario y las descargas de escenarios se restringen a valores conocidos. Los gráficos incluidos, los resultados registrados y las cifras publicadas no cambian. Se recomienda actualizar a quien abra en Studio archivos de escenario de fuentes no fiables o incruste gráficos generados en páginas web. Aviso: <a1>GHSA-h25h-cg9f-v2cg</a1>.

# text
# c1: iq::scene
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
# c5: sdr
# c6: iq::acq
# c7: iq::track
# c8: docs/POSITIONING.md
# c9: docs/SPECTRUM.md
seg-7f566858d036 = <b>El alcance de la capa IQ en interferencia y spoofing, indicado con exactitud.</b> Las entradas de { "0.31.0" } y { "0.32.0" } más abajo dicen que la capa IQ añade "ninguna síntesis de formas de onda de interferencia ni de spoofing". Eso es cierto de la propia capa IQ (<c1/> genera solo señales GNSS legítimas), pero se leía como una afirmación sobre todo el motor, y no lo es: desde { "0.29.0" }, la sección <c3/> del tipo de escenario <c2/> escribe una instantánea SigMF de su modelo analítico con los inhibidores configurados (inhibidores de tipo ruido intervalo a intervalo, tonos y chirps como formas de onda), y <c4/> suma en memoria una señal auténtica y una réplica de spoofer para probar la captura del lazo (el compuesto nunca se escribe). El motor también incorpora un receptor GNSS por software desde { "0.20.0" } (<c5/>: adquisición y seguimiento; desde { "0.31.0" } también <c6/> y <c7/>). Nada en Kshana transmite ni controla hardware de radio. La línea de estado del README, <c8/>, <c9/> y las notas de diseño de IQ ahora lo dicen; las entradas publicadas se dejan como se publicaron. No cambia ningún comportamiento.

# text
# c1: docs/design/iq-notes/receiver.md
seg-61befd8b474d = <b>Limitación conocida: muestreo conmensurable.</b> Con una tasa de muestreo que es un múltiplo entero o semientero de la tasa de chips, las muestras caen en las mismas fases de chip en cada chip y el discriminador de código se convierte en una escalera. En una señal sintética GPS L1 C/A a { "45" } dB-Hz con espaciado de 0,5 chips, { "2.046" } MHz ({ "2" } muestras/chip) da un error de código RMS de ≈ { "0.09" } chips (≈ { "26" } m) y un sesgo de −{ "0.09" } chips, frente a ≈ { "0.003" } chips con una tasa inconmensurable. El C/N0 NWPR lee ≈ { "2.4" } dB por debajo allí. A { "4.092" } MHz depende del espaciado y del Doppler de código. Con { "0.5" } chips es inocuo con { "1500" } Hz de Doppler, pero { "2" }× con un sesgo de { "0.011" } chips con { "0" } Hz, y con { "0.25" } o { "0.1" } chips el error de código es de { "8" }–{ "10" }×. El seguimiento de portadora no se ve afectado. <c1/> contiene las mediciones.

# text
seg-3a30bd47380a = Capa IQ de GNSS en el servidor MCP (Fase B.1).

# text
# c1: kshana-mcp
# c2: kshana iq
# c3: iq_signals
# c4: iq_info
# c5: iq_scene
# c6: iq_acquire
# c7: iq_track
# c8: iq_frontend
# c9: KSHANA_MCP_IQ_DIR
# c10: overwrite
# c11: KSHANA_MCP_IQ_MAX_SAMPLES
# c12: kshana::iq::cli::execute
# c13: iq::cli::build_code
# c14: iq::cli::signal_names
# c15: server.json
# c16: mcp/kshana-mcp/tests/iq_round_trip.rs
seg-ef81eca03bca = <c1/> incorpora seis herramientas que manejan la capa <c2/> desde un agente: <c3/> (los nombres de señal aceptados y la configuración IQ), <c4/> (describir una grabación), <c5/> (generar una escena de perfil indicado o de efemérides de difusión, con el canal opcional a nivel de señal), <c6/> (adquisición por FFT, opcionalmente tras etapas de front-end), <c7/> (adquirir y luego el banco DLL/PLL/FLL) y <c8/> (paso de banda, filtro de muesca, supresión, excisión, AGC, cuantificador). Las muestras IQ nunca cruzan el protocolo: cada herramienta recibe rutas de archivo dentro de un único directorio de trabajo fijado por <c9/> (si no está definido, las herramientas de archivos IQ quedan desactivadas y las demás no se ven afectadas), rechaza las rutas que resuelven fuera de él y las salidas que ya existen salvo que se fije <c10/>, aplica un presupuesto de muestras por llamada (<c11/>, por defecto { "50 000 000" }) antes de cualquier trabajo, rechaza los argumentos desconocidos y responde con un resumen JSON compacto (detecciones, C/N0, estado de enganche y cada archivo escrito con su recuento de bytes). La salida por época va solo a los archivos que nombre quien llama. Las herramientas ejecutan la misma vía de código que la CLI a través de una nueva junta pública, <c12/>, que devuelve el mensaje de la CLI en lugar de imprimirlo (stdout es el canal JSON-RPC de MCP); <c13/> y <c14/> también son ahora públicas. Solo software y aditivo: la capa IQ no añade síntesis de interferencia ni de spoofer, nunca se transmite nada y no hay dependencias nuevas. <c15/> declara las dos variables de entorno. Las pruebas de ida y vuelta de <c16/> generan una escena corta de dos satélites y comprueban la adquisición frente al propio archivo auxiliar de verdad de referencia de la escena, el enganche y el C/N0 del seguimiento, el front-end, la salida SigMF, el presupuesto, el confinamiento de rutas y el estado desactivado.

# text
# c1: tests/iq_gpssdrsim_cross_generator.rs
# c2: tests/fixtures/iq_gpssdrsim_cross_generator/
# c3: scripts/gen_iq_gpssdrsim_ref.sh
seg-6963f3fa1db7 = <b>La capa IQ de GNSS en el registro de validación.</b> Una verificación cruzada preregistrada frente a gps-sdr-sim (un generador independiente de banda base GPS L1 C/A, MIT, commit 28ca29a6) forma ahora parte de la suite de pruebas siempre activa (<c1/>). Su salida de referencia confirmada (<c2/>: { "20" } ms de I/Q de 8 bits propios de gps-sdr-sim, su listado de canales y el estado de canal subyacente obtenido con un arnés enlazado contra la misma compilación) se regenera con <c3/>. Nada en el momento de la prueba necesita red ni la herramienta externa. Se añaden dos filas al registro ({ "251" } filas: { "124" } validadas, { "123" } modeladas, { "4" } del socio):

# text
seg-21d005e2ef0e = <em>Geometría de señal de la escena IQ de GNSS frente a un generador independiente de banda base</em>: <b>Validado</b>. La verdad de referencia de la escena (conjunto visible, pseudodistancia, fase de código, Doppler, ángulos de observación) para una escena de efemérides de difusión coincide con el estado de canal de gps-sdr-sim en los { "11" } canales: en el peor caso { "1.6" } mm, { "5.5e-6" } chips, { "7.4e-5" } Hz, { "4e-9" } grados, frente a umbrales de { "0.05" } m, { "2e-4" } chips, { "0.02" } Hz y { "1e-4" } grados fijados antes de la ejecución.

# text
# c1: iq::acq
seg-5c8858182d41 = <em>Adquisición IQ de GNSS sobre muestras I/Q generadas de forma independiente</em>: <b>Modelado, con un hallazgo</b>. <c1/> encuentra todos los satélites simulados en las muestras de gps-sdr-sim dentro de los umbrales registrados (fase de código dentro de { "0.195" } chips, Doppler dentro de { "72" } Hz). Sin embargo, el umbral registrado "ningún otro PRN detectado" falla: en la salida sin ruido de gps-sdr-sim, el umbral de ruido gaussiano es superado por la correlación cruzada de los otros satélites en los { "21" } PRN ausentes. La prueba estricta se conserva, ignorada junto con el hallazgo, y una prueba fijada lo registra. No cambia ningún código del motor ni API pública. Las muestras I/Q no se comparan muestra a muestra: la tabla de senos entera de gps-sdr-sim, las ganancias, la fase inicial de portadora nula y los campos LNAV truncados no son magnitudes en las que un receptor necesite coincidir. La comparación se hace en los observables que mide un receptor.

# text
# c1: iq track
# c2: ceil(4 ms / T_code)
# c3: T_code
# c4: 2 / (3 · N · T_code)
# c5: docs/design/evidence/iq-track-acq-default/
# c6: kshana iq track
# c7: kshana iq sweep
# c8: --acq-coherent
# c9: kshana.iq_track
# c10: acq_coherent=None
# c11: iq_track
# c12: acq_coherent=1
# c13: --acq-coherent 1
# c14: kshana iq acquire
# c15: --coherent
# c16: iq::acq::auto_coherent_periods
# c17: iq::acq::AUTO_COHERENT_S
# c18: tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did
seg-a2be63287ce4 = <b><c1/> hace el traspaso desde una adquisición de ≈{ "4" } ms por defecto (cambio de comportamiento).</b> La adquisición que inicializa cada canal de seguimiento ahora integra <c2/> periodos de código de forma coherente en lugar de uno, donde <c3/> es el periodo completo del código (primario por longitud secundaria en un código por niveles, la unidad sobre la que integra la adquisición). Los códigos de { "1" } ms sin niveles (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) ahora buscan { "4" } periodos ({ "4" } ms), de modo que el paso Doppler por defecto <c4/> es de ~{ "167" } Hz en lugar de ~{ "667" } Hz. Todo código cuyo periodo completo ya es de { "4" } ms o más conserva { "1" } periodo: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), y los GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q y E1-C por niveles ({ "10" } a { "100" } ms con sus códigos de recubrimiento), y GPS L2C. Por tanto, todas las señales integran al menos ~{ "4" } ms. Una búsqueda de un solo periodo podía hacer el traspaso a un canal con una desviación de hasta ~{ "333" } Hz, fuera de la captura del FLL, y este hacía seguimiento de un falso enganche a ~{ "500" } Hz mientras notificaba un seguimiento limpio. En un barrido con semilla de { "180" } canales GPS L1 C/A (Doppler en ±{ "5" } kHz, de { "38" } a { "47" } dB-Hz, la mitad con datos de navegación; <c5/>, repetible), los falsos enganches bajan de { "27" } de { "180" } a { "1" } de { "180" } y las adquisiciones fallidas de { "102" } a { "11" }, a cambio de ~{ "40" } ms más de búsqueda por PRN en GPS L1 ({ "11" } → { "52" } ms). El único falso enganche residual está a { "38" } dB-Hz, a { "36" } Hz de desviación. Todas las superficies coinciden: <c6/> y <c7/> (<c8/>), <c9/> de Python (<c10/> es ahora automático; stub actualizado) y la herramienta <c11/> de MCP. Quien dependiera del valor por defecto anterior puede pasar <c12/> (<c13/>). El valor por defecto propio de <c15/> en <c14/> sigue siendo { "1" }. Nuevos <c16/> y <c17/> públicos; prueba de regresión <c18/>.

# text
# c1: *.chart.svg
# c2: *.report.html
# c3: --animate
# c4: #0c0b08
# c5: #e0bd84
# c6: src/palette.rs
# c7: web/theme.css
# c8: #060A14
seg-52768eb8e3d5 = <b>Todo gráfico generado sigue ahora el tema Observatory del sitio: cambian los bytes de todos los gráficos.</b> Es una revisión deliberada de las figuras publicadas, solo de colores y tipografías; no se movió ningún valor representado, coordenada ni etiqueta. El <c1/> de cada escenario (y por tanto las exportaciones de gráficos de Studio y los gráficos de demostración del README), el HTML del informe de ejecución (<c2/>), la animación de la línea temporal (<c3/>), las páginas HTML de resultados de escenarios y de estudios, el resumen de validación y las figuras y diagramas de la documentación usaban la paleta oscura cálida de julio (fondo <c4/>, oro <c5/>) y un tema de informe en papel cálido. Ahora toman cada color y tipografía de un único módulo, <c6/>, que refleja <c7/>: los gráficos se dibujan en oscuro de instrumento sobre el fondo Observatory (<c8/>) con la pila tipográfica Geist; el informe, el reproductor de animación y las páginas de resultados siguen la preferencia clara/oscura de quien los ve con los tokens claros y oscuros de Observatory. Los seis dominios de fallo conservan un color cada uno (interferencia coral, spoofing magenta, temporización azul, órbitas cian, integridad lima, navegación ámbar), y los niveles de evidencia se leen validado lima, modelado ámbar, socio magenta. Las rampas de la cascada conservan su orden perceptual (inferno), reanclado en el nuevo fondo.

# text
# c1: tests/palette_sync.rs
# c2: web/theme.css
# c3: docs/assets/palette.json
# c4: docs/diagrams/mermaid-config.json
# c5: src/
seg-d967e354a966 = <c1/> ajusta el módulo a <c2/> en ambos temas, comprueba que <c3/> y <c4/> (ambos generados a partir del módulo, para las herramientas de figuras de Python y mermaid-cli) estén al día, y falla si aparece un literal de color hexadecimal en <c5/> fuera de la paleta.

# text
# c1: tests/published_figures_still_reproduce.rs
seg-fa3e60422ca5 = <c1/> incorpora un tercer diagnóstico, "solo se movieron colores y tipografías", de modo que una revisión de la paleta se distingue de un valor representado que se haya movido. Se comprobó que cada gráfico del README regenerado es igual a su predecesor bajo ese normalizador.

# text
# c1: tools/gen_validation_figures.py
# c2: domain-coverage-map
# c3: scenario-fom
# c4: sgp4-regime-bars
# c5: web/capabilities.json
# c6: clock-holdover
# c7: tests/fixtures/sgp4_comparison.md
# c8: tools/gen_readme_assets.py
# c9: sgp4-regime-bars
# c10: kshana↔ref
# c11: tests/figures_doc_sync.rs
seg-3bc4056fd57e = <c1/> lee la paleta y ahora también genera las tres figuras de resultados del README que no tenían generador confirmado (<c2/>, <c3/>, <c4/>), con elementos de texto reales, a partir de <c5/>, el resultado de <c6/> y <c7/>. <c8/> lee la misma paleta, lo que corrige su deriva del tema claro respecto al sitio. Los valores de <c9/> son la columna del peor caso <c10/> de ese archivo de prueba ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } y { "4.12e-6" } km), sin cambios respecto a la figura de Matplotlib, y <c11/> ahora falla si la figura confirmada y el archivo de prueba discrepan.

# text
# c1: docs/assets/figures/domain-coverage-map
# c2: web/capabilities.json
seg-3196836a2a0d = <b><c1/> actualizado a los datos vigentes (un cambio de datos, no un redibujado).</b> La figura indicaba { "28" } capacidades en { "8" } dominios ({ "11" } validadas, { "17" } modeladas), desactualizada respecto a su propia fuente declarada; dibujada ahora por su nuevo generador a partir de <c2/>, indica { "46" } capacidades en { "8" } dominios ({ "17" } validadas, { "29" } modeladas).

# text
# c1: κ = T_c
# c2: Q = 1/(R_c κ)
# c3: jamming
# c4: lunar-jamming
# c5: spectrum
# c6: q_override
seg-55d5b16379aa = <b>La Q de los inhibidores CW/de banda estrecha es ahora { "1.0" }, no { "1.5" }.</b> El valor de los manuales para un tono sobre la portadora es { "1" } (un tono conserva el pico espectral de la señal, <c1/>, <c2/>); el antiguo { "1.5" } hacía que un tono fuera menos dañino que el ruido de banda ancha con la misma J/S. Cambio de salida: unos −{ "1.8" } dB de C/N0 efectivo bajo inhibidores CW/de banda estrecha con J/S alta en los tipos de escenario <c3/>, <c4/> e interop (el tono del ejemplo <c5/> incluido: { "17.98" } dB-Hz según la tabla, era { "19.74" }). La Q de banda ancha sigue siendo { "1.0" } (conservadora, unos { "3" } dB por debajo de los ~{ "2" } de los manuales) a la espera de la revisión de { "0.34" }. Fije <c6/> para conservar el antiguo { "1.5" }.

# text
# c1: kshana iq scene
# c2: ci8
# c3: ci16
seg-99fab1936170 = <b>La salida entera de <c1/> usa el rango entero.</b> Con ruido de potencia unitaria y una escala de escritura de { "1" }, las escenas <c2/>/<c3/> salían como aproximadamente { "{" }-1, { "0" }, { "1" }{ "}" } y las escenas de 2 bits tenían sus umbrales a { "2.8" } sigmas. Los formatos enteros ahora se escalan de modo que el RMS esperado por componente sea una cuarta parte de la escala completa ({ "31.75" } LSB en ci8, { "8191.75" } en ci16) o { "2" } LSB en 2 bits. La escala y el recuento de elementos recortados se imprimen y se escriben en el archivo auxiliar. La salida en coma flotante no cambia.

# text
# c1: sin az
# c2: asin
seg-696109ae70f8 = <b>Ocho fijaciones de archivos de prueba en siete archivos de test ya no fallan en macOS por diferencias en el último bit</b> (parte de la incidencia #36). Las fijaciones que comprueban que el motor sigue construyendo las entradas confirmadas de una referencia independiente (jacobianos, una tabla de estados, acimuts de lanzamiento) se comparaban bit a bit y fallaban en macOS arm64 por entre { "2" } y unos pocos miles de unidades en el último lugar. Ahora comparan dentro de { "1e-12" } de una escala tomada del archivo de prueba; los enteros, las claves y las longitudes se siguen comparando exactamente, y una prueba de mutación muestra que un cambio relativo de { "1e-6" } sigue fallando. La fijación del acimut de lanzamiento compara <c1/> y la rama ascendente/descendente en lugar del propio acimut, porque <c2/> amplifica un ulp de su argumento hasta unos { "3e-9" } rad cuando una inclinación es igual a la colatitud de un emplazamiento. No cambió ninguna tolerancia de referencia independiente ni umbral preregistrado. Dos pruebas (OD conjunta lunar, observabilidad lunar) no están cubiertas: en macOS se mueven las propias comparaciones preregistradas, y eso se deja para un seguimiento posterior.

# text
# c1: kshana iq track
# c2: kshana iq sweep
# c3: --bandpass
# c4: --notch
# c5: --blank
# c6: --excise
# c7: --agc
# c8: --bits
# c9: track
# c10: track
# c11: sweep
# c12: --notch
# c13: iq acquire
# c14: iq frontend
seg-b6c354fa0c28 = <b><c1/> y <c2/> aplican las opciones del front-end.</b> El texto de uso anunciaba <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> en <c9/>, pero <c10/> y <c11/> nunca construían la cadena: las opciones se ignoraban en silencio, y una sin valor, como <c12/>, se tragaba la opción siguiente. Ahora ambos comandos las analizan como lo hace <c13/> y colocan una cadena de front-end nueva delante de la pasada de adquisición y de la de seguimiento. La salida es igual a ejecutar el comando sobre el archivo que escribe <c14/> con las mismas opciones.

# text
seg-d7238dab610e = Los datos de la escena IQ se colocan por señal.

# text
# c1: kshana iq scene --data
# c2: NavData::Seeded
# c3: SpreadingCode::data_modulation()
# c4: DataModulation
# c5: iq::signals
# c6: NavData::Lnav
# c7: Scene
# c8: NavData::Lnav
# c9: NavData::Seeded
seg-46ace9a3e008 = <c1/> (y <c2/>) ponían bits de { "50" } bit/s en cada señal, pilotos incluidos, y a la tasa LNAV de GPS en Galileo y BeiDou. Ahora los datos siguen la temporización de símbolo propia de cada señal, indicada por el nuevo <c3/> (<c4/>, fijado por cada constructor de <c5/>). Eso son { "10" } ms en L5-I5, { "4" } ms en E1-B, { "2" } ms en BeiDou B1I GEO (D2), y bits de { "20" } ms con un meandro de { "10" } ms en GLONASS L1OF. Se rechazan los datos en pilotos, en GPS L2C como un único flujo CM/CL, y <c6/> en cualquier señal que no sea L1 C/A. Los códigos personalizados conservan por defecto la temporización anterior de { "20" } ms. Una <c7/> programática que pedía <c8/> en un código distinto de L1 C/A, o <c9/> en un piloto, generaba en silencio y ahora devuelve un error en la primera lectura.

# text
seg-9dd38fa39d14 = Los canales GLONASS L1OF se adquieren y se siguen en su propia portadora FDMA.

# text
# c1: iq::acq::acquire
# c2: if_hz
# c3: SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)
# c4: carrier − center
# c5: if_hz
# c6: k
# c7: u32
# c8: k = -7
# c9: sat_id
# c10: k + 2^32
# c11: k
# c12: i32
seg-a775751ed6f6 = <c1/> y los canales de seguimiento llevaban todos los códigos a banda base usando solo <c2/>. En una grabación GLONASS de varios canales, una búsqueda del canal +{ "3" } encontraba por tanto la señal del canal { "0" } (todos los canales comparten un código de medición de distancia) y nunca buscaba { "1.6875" } MHz más arriba. Ahora ambos usan <c3/>. El término de portadora es cero para cualquier grabación centrada en la propia portadora de la señal y se omite cuando se desconoce el centro, de modo que el procesamiento CDMA no cambia. Si evitaba el comportamiento anterior incorporando <c4/> al <c5/> del archivo auxiliar, elimine ese término: el desfase ahora se aplica a partir de la portadora y el centro, de modo que dejarlo lo aplica dos veces. Limitación conocida, sin cambios aquí: una escena GLONASS identifica cada satélite por su canal de frecuencia <c6/>, y el identificador de satélite <c7/> envuelve un canal negativo. El archivo auxiliar de verdad de referencia escribe <c8/> como <c9/> { "4294967289" } (<c10/>). Léalo de nuevo como <c11/> con una conversión a <c12/>.

# text
# c1: iq
# c2: kshana iq
# c3: scene
# c4: acquire
# c5: track
# c6: sweep
# c7: labfit
# c8: kshana.iq_scene
# c9: iq_acquire
# c10: iq_track
# c11: iq_labfit
# c12: iq_signals
# c13: iq::cli
# c14: tests/iq_cli.rs
seg-1c88bffc605b = <b>Capa IQ de GNSS en la CLI y en Python ({ "0.32.0" } Fase A).</b> El módulo <c1/> existente ya es utilizable sin escribir Rust. Cinco comandos <c2/> nuevos se unen al grupo de manejo de datos: <c3/> genera a un archivo una escena IQ larga de varios satélites con un archivo auxiliar de verdad de referencia; <c4/> ejecuta la adquisición por FFT de uno o más PRN sobre una grabación e informa de cada detección (PRN, Doppler, fase de código, estadístico, umbral); <c5/> adquiere y luego ejecuta el banco DLL/PLL/FLL sobre una grabación y emite una salida de seguimiento por época (CSV/JSON) con anchos de banda de lazo, tiempo de integración y espaciado de correladores configurables; <c6/> reproduce una grabación a través de varios diseños de lazo e informa de la fluctuación y de las métricas de enganche resultantes por diseño; y <c7/> ajusta el modelo de pérdida de enganche del lazo de seguimiento a una línea temporal de confianza del receptor. El mismo núcleo se expone a Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), que devuelve listas y diccionarios aptos para NumPy. Solo software y aditivo: sin dependencias nuevas, sin transmisión, sin síntesis de formas de onda de interferencia ni de spoofing; el motor, la adquisición, el seguimiento y los diseños de lazo son los propios del crate, de modo que quien llama desde la CLI o Python obtiene los mismos bits que las pruebas de Rust. Nuevo módulo <c13/>; el propio archivo auxiliar de verdad de referencia de la escena es la referencia independiente en <c14/> (la adquisición recupera cada fase de código y Doppler inyectados, el seguimiento converge al Doppler inyectado). No cambia ningún recuento publicado de tipos de escenario ni ninguna fila de la matriz de verificación.

# text
# c1: iq
# c2: iq
seg-1971e3e9cfe6 = <b>Capacidades restantes de la biblioteca IQ de GNSS en la CLI <c1/> y en Python ({ "0.32.0" } Fase A.2).</b> Se apoya en la Fase A y expone el resto de la capa <c2/> sin escribir Rust:

# text
# c1: iq scene
# c2: iq_scene
# c3: --iono-stec
# c4: --iono-vtec
# c5: --iono-klobuchar
# c6: --tropo
# c7: --s4
# c8: --scint-tau0
# c9: --sigma-phi
# c10: --multipath-height
# c11: --multipath-ground
# c12: --land-mobile
# c13: --nlos
# c14: iq::channel::SceneChannelAdapter
seg-67c485097357 = <b>Canal de propagación en <c1/></b> (y en <c2/> de Python): una ionosfera de primer orden (<c3/>/<c4/> o <c5/>), la troposfera de Saastamoinen/Niell (<c6/>), el modelo de centelleo de Cornell (<c7/>, <c8/>, <c9/>), multitrayecto especular con el suelo (<c10/>/<c11/>), el canal móvil terrestre de tres estados (<c12/>) y un bloqueo sin visibilidad directa (<c13/>) se aplican a cada satélite mediante un nuevo puente interno del crate (<c14/>) que convierte las trayectorias absolutas de los modelos de canal a la forma de exceso sobre la geometría de la escena.

# text
# c1: iq scene
# c2: --format sigmf
# c3: .sigmf-data
# c4: .sigmf-meta
# c5: acquire
# c6: track
seg-d736671f2251 = <b>Salida SigMF en <c1/></b> (<c2/>): escribe las muestras como un par <c3/>/<c4/> con una captura y anotaciones por satélite; <c5/>/<c6/> ya leen SigMF, de modo que una escena hace el viaje de ida y vuelta.

# text
# c1: iq frontend <in> <out>
# c2: acquire
# c3: track
# c4: --bandpass
# c5: --notch
# c6: --blank
# c7: --excise
# c8: --agc
# c9: --bits
# c10: iq::frontend
# c11: iq_frontend
seg-c59ae97779ae = <b>DSP de front-end</b>: un nuevo comando <c1/> y las mismas opciones en <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) ejecutan las etapas de <c10/> (FIR paso de banda, filtro de muesca adaptativo, supresión de pulsos, excisión en el dominio de la frecuencia, AGC, cuantificador); reflejado en Python como <c11/>.

# text
# c1: iq scene --nav <rinex_nav> --rx-pos lat,lon,alt
# c2: --start
# c3: --window
# c4: --prn
# c5: iq_scene_broadcast
# c6: tests/iq_cli.rs
seg-878d66b73571 = <b>Escenas de efemérides de difusión</b>: <c1/> (con <c2/>/<c3/>/<c4/>) coloca cada satélite GPS sano en su geometría de difusión real usando el lector RINEX del motor, de modo que el archivo auxiliar de verdad de referencia lleva la distancia, el Doppler y la fase de código reales por satélite; reflejado en Python como <c5/>. Solo software y aditivo: sin dependencias nuevas, sin transmisión, sin síntesis de formas de onda de interferencia ni de spoofing (los efectos de propagación del canal actúan solo sobre la señal legítima). Cada afirmación numérica se prueba frente a una referencia independiente (forma cerrada o verdad de referencia inyectada) en las pruebas unitarias de canal y de front-end y en <c6/>.

# text
# c1: iq
# c2: kshana iq
# c3: iq::scene
# c4: iq::channel
# c5: iq::acq
# c6: iq::track
# c7: iq::frontend
# c8: iq::io
# c9: iq::signals
# c10: iq::labfit
# c11: docs/design/GNSS-IQ-PLAN.md
seg-1e71370d87d8 = <b>Capa IQ de GNSS: simulación a nivel de señal y procesamiento de receptor por software.</b> Un nuevo módulo <c1/> lleva a Kshana desde un front-end L1 C/A de un solo satélite y de bloques cortos a una capa completa a nivel de señal, accesible desde el grupo de comandos <c2/>. Genera escenas IQ en bruto largas y de varios satélites con un archivo auxiliar de verdad de referencia por época (<c3/>); aplica la propagación a nivel de señal: ionosfera con divergencia código-portadora, troposfera, centelleo de amplitud y de fase (modelo de Cornell), multitrayecto de Fresnel y un canal móvil terrestre de tres estados, con visibilidad directa bloqueada (<c4/>); adquiere y sigue con adquisición por FFT y un banco DLL/PLL/FLL de varios canales, reproduciendo una grabación a través de muchos diseños de lazo (<c5/>, <c6/>); modela el front-end: filtrado FIR/IIR, cuantificación de 1 a 14 bits, AGC, filtro de muesca, supresión de pulsos y excisión en el dominio de la frecuencia (<c7/>); procesa en flujo grandes conjuntos de datos grabados con memoria acotada: formatos int8/int16/float32/2 bits empaquetados e IF real, SigMF de varios archivos, remuestreo, un inventario de conjuntos de datos con SHA-256 por archivo y un ejecutor por lotes (<c8/>); añade códigos de ensanchamiento para GPS L5/L2C, Galileo E1 (CBOC, códigos de memoria reales del ICD) y E5a, BeiDou B1C/B1I y GLONASS L1OF, cada uno comprobado frente a su documento de control de interfaz (<c9/>); y ajusta el modelo de pérdida de enganche del lazo de seguimiento al comportamiento observado de un receptor real en ejecuciones de laboratorio, con error de conjunto reservado dejando una ejecución fuera y extrapolación etiquetada como predicción (<c10/>). Cada afirmación numérica se prueba frente a una referencia independiente (una tabla del ICD, una forma cerrada o un receptor independiente que recupera la verdad de referencia inyectada); los modelos físicos de canal y de lazo siguen siendo MODELLED. Es solo una capa de software: escribe archivos IQ para receptores por software y no sintetiza formas de onda de interferencia ni de spoofing ni controla hardware de radio. No cambia ningún recuento publicado de tipos de escenario ni ninguna fila de la matriz de verificación. Diseño: <c11/>.

# text
seg-943e21ccb25f = Confianza del receptor: evaluar un registro real de un receptor GNSS.

# text
# c1: kshana receiver-trust <scenario.toml>
# c2: kshana.receiver_trust
# c3: receiver_trust
# c4: assess_receiver_log
# c5: docs/RECEIVER-TRUST.md
# c6: examples/receiver-trust/
# c7: tests/receiver_trust_jammertest.rs
seg-f8274120bff2 = <c1/> lee un registro u-blox UBX, RINEX { "3" } (con un archivo de navegación de difusión opcional), Android GnssLogger o NMEA { "0183" } en una única línea temporal con marcas de tiempo y ejecuta sobre ella monitores de confianza: caída de la densidad de portadora a ruido (C/N0), pérdida de enganche, control automático de ganancia (AGC), el indicador de jamming de u-blox, salto de posición y, con RINEX y navegación, la propia solución de punto único del motor con monitorización autónoma de la integridad del receptor (RAIM) por paridad y el monitor asistido por reloj. Cada época es nominal, degradada o no fiable, y el resultado indica cuándo y por qué. Los eventos y las caídas de C/N0 previstas indicadas en el escenario se puntúan frente a tolerancias indicadas en el mismo archivo: detectado, tardío o no detectado, y coincide o discrepa. Las salidas son el JSON de resultados, un CSV por época y un gráfico; el resultado lleva el SHA-256 del registro y cada umbral. También es accesible desde Python (<c2/>), el paquete WebAssembly (<c3/>, registros en línea) y la nueva herramienta <c4/> del servidor del Model Context Protocol (MCP). Guía: <c5/>; ejemplo: <c6/>. En los registros de spoofing de JammerTest { "2024" }, la vía del motor reproduce la primera alarma de la canalización preregistrada de referencia independiente en cada inicio publicado (<c7/>). Los monitores siguen siendo MODELLED; no cambia ninguna fila de la matriz de verificación.

# text
seg-55669fe92932 = Una versión menor. Las rondas de validación { "2" } y los paquetes de wave-1 llevan la matriz de verificación de { "223" } filas ({ "93" } VALIDATED) en { "0.29.3" } a { "249" } filas ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); cada promoción se comprobó frente a una referencia independiente con una tolerancia fijada antes de la ejecución, y cada discrepancia se publica como un hallazgo. Novedades: un lector nativo de kernels NAIF y una vía DE440, una propagación y vía de tiempo validadas de SGP4 a ITRS, una biblioteca de relojes medidos, un generador de referencia LunaNet AFS, solucionadores de precisión extendida y de información en raíz cuadrada, y procesamiento IQ lunar real sobre datos de LuGRE. Las cifras publicadas que se movieron figuran a continuación como revisiones.

# text
# c1: docs/VALIDATION.md
# c2: docs/VERIFICATION-MATRIX.md
seg-f75f1878045e = Veintisiete filas de la matriz de verificación pasan a VALIDATED después de que una referencia independiente coincidiera dentro de una tolerancia fijada antes de la primera comparación (la regla de promoción de <c1/>): diez en una primera ronda de validación y diecisiete en una segunda. Cincuenta y una filas MODELLED se sometieron a una referencia independiente externa en la primera ronda y las demás filas encaminables en la segunda; cada discrepancia se registra a continuación como hallazgo en lugar de ajustarse para que desaparezca. Tres filas se dividieron para que una parte validada no cargue con un resto sin validar, lo que lleva la matriz de { "223" } a { "226" } filas; los paquetes de validación incorporados desde entonces la llevan a { "249" }. Los recuentos se leen del <c2/> generado.

# text
seg-8d542741fa77 = tras la ronda { "1" }

# text
seg-ae3743f976c5 = Filas de la matriz de verificación

# text
seg-6c4b1fd56a31 = de ellas VALIDATED frente a una referencia independiente externa

# text
seg-90450fe87280 = de ellas MODELLED

# text
seg-86972e4c7f12 = de ellas PARTNER

# text
seg-61c5c5e308ed = Abreviaturas usadas en esta entrada

# text
seg-5907283b71da = Abreviatura

# text
seg-47e2e7d1a000 = ADD, ARAIM, MAAST

# text
seg-0306daa1107f = Airborne Design Document (de ARAIM); monitorización autónoma avanzada de la integridad del receptor; la herramienta de simulación de disponibilidad de algoritmos en Matlab de la Universidad de Stanford

# text
seg-f031f12836be = ADEV, VRW, ARW

# text
seg-b32744d6f0c2 = desviación de Allan; paseo aleatorio de velocidad; paseo aleatorio de ángulo

# text
seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

# text
seg-d10345f7bfab = un kit de herramientas de astrodinámica de código abierto (Nyx Space); el kit de herramientas Spacecraft, Planet, Instrument, C-matrix, Events de la NASA, de su Navigation and Ancillary Information Facility; kernel de constantes planetarias

# text
seg-0789b1b8dba2 = BCRS, TDB, TT

# text
seg-584e509c80a5 = Sistema de Referencia Celeste Baricéntrico; Tiempo Dinámico Baricéntrico; Tiempo Terrestre

# text
seg-f03148ef3497 = BIPM, UTC(k)

# text
seg-d6e01fbf4f10 = Oficina Internacional de Pesas y Medidas; la realización por un laboratorio del Tiempo Universal Coordinado

# text
seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

# text
seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; sistemas de tiempo lunar escritos en el campo TIME_SYSTEM del mensaje

# text
seg-bed3cea7e74f = CRLB

# text
seg-525ebb08f4bc = cota inferior de Cramér–Rao

# text
seg-a1fff77503b4 = CW

# text
seg-064470740a35 = movimiento relativo de Clohessy–Wiltshire

# text
seg-d70a9b3e92a7 = Development Ephemeris { "440" } del Jet Propulsion Laboratory

# text
seg-6f6e14685742 = DOP, PDOP

# text
seg-08aad29b6845 = dilución de la precisión; dilución de la precisión de posición

# text
seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

# text
seg-e9ecdbb0f600 = filtro de Kalman extendido; filtro de Kalman unscented (UKF); sistema de navegación inercial; sistema global de navegación por satélite; unidad de medida inercial

# text
seg-86765c7a6bbf = EMT, VPL, HPL

# text
seg-23029e0ceed2 = umbral efectivo del monitor; nivel de protección vertical y horizontal

# text
seg-27786c406107 = EOP, IERS, PCC, MAE

# text
seg-9d0a1a9fdebc = parámetros de orientación de la Tierra; Servicio Internacional de Rotación de la Tierra y Sistemas de Referencia; Prediction Comparison Campaign; error absoluto medio

# text
seg-1508f3d3a180 = ERFA, SOFA

# text
seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

# text
seg-900c7c7e99cd = GMAT

# text
seg-0382d12eabc8 = General Mission Analysis Tool de la NASA

# text
seg-025aec0f5e29 = NTN, SSB

# text
seg-183dca4a747b = red no terrestre (3GPP); bloque de señal de sincronización

# text
seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

# text
seg-9cebc1f9338d = Servicio Internacional de GNSS; Servicio Internacional de Telemetría Láser; Marco de Referencia Terrestre Internacional { "2020" }

# text
seg-eaca07ff8609 = ILS, LAMBDA

# text
seg-b3cb3e6ea499 = mínimos cuadrados enteros; Least-squares AMBiguity Decorrelation Adjustment

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = sesgo entre sistemas

# text
seg-743c3303e01c = LEO

# text
seg-d7b83e7c427f = órbita terrestre baja

# text
seg-1f76fe708934 = MHSS, PL, TPL

# text
seg-a93515a6ff89 = separación de soluciones con hipótesis múltiples; nivel de protección; nivel de protección de temporización

# text
seg-9e93c8223a11 = PSD, IQ, SigMF

# text
seg-67248a79ac93 = densidad espectral de potencia; muestras en fase y en cuadratura; Signal Metadata Format

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = ruido de proyección cuántica

# text
seg-3ab6fb5e9394 = RAIM

# text
seg-ebda65a9a20f = monitorización autónoma de la integridad del receptor

# text
seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

# text
seg-1aeedd26b9cd = sistema de aumentación basado en satélites; el Wide Area Augmentation System de EE. UU.; doble frecuencia y multiconstelación; un satélite SBAS geoestacionario

# text
seg-eabf9641678b = RMS, SISRE

# text
seg-50a677b8e972 = raíz del valor cuadrático medio; error de distancia de la señal en el espacio

# text
seg-430b3c681347 = RTKLIB

# text
seg-3e75054c0034 = una biblioteca de posicionamiento GNSS de código abierto

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-264e9e51b8f8 = interferometría de línea de base muy larga

# text
seg-c3bc7d828ecc = Cada fila siguiente indica su tipo de referencia independiente (Library: una biblioteca independiente de terceros que calcula una magnitud definida de forma unívoca; Measured: datos reales medidos; P2: una biblioteca numérica independiente que recalcula una magnitud de álgebra lineal sobre entradas confirmadas), la referencia independiente, la tolerancia fijada antes de la ejecución y el resultado. Cada promoción fue repetida por un segundo revisor, que regeneró el archivo de prueba byte a byte y mostró que una mutación deliberada del motor pone la prueba en rojo.

# text
seg-be0a4e3ac81c = <b>Fusión de sensores GNSS/INS</b> (Library), limitada al EKF de estado de error de 15 estados débilmente acoplado: NaveGo v1.4 (LGPL-3.0, ejecutado con GNU Octave) sobre su propio recorrido real con IMU/GNSS Ekinox. El RMS horizontal, vertical y de innovación de posición de Kshana es { "0.912" }, { "0.940" } y { "0.861" } del de NaveGo (umbral { "1.2" }) y su innovación media normalizada es { "0.395" } (umbral { "1.5" }). GNSS está presente durante todo el recorrido, de modo que no se prueba ninguna interrupción. El UKF fuertemente acoplado y el filtro de reloj acoplado quedan fuera de la afirmación.

# text
seg-0c82afd5ba30 = <b>Actitud en 3 grados de libertad y presupuesto de error de apuntamiento</b> (Library), limitado al pico del par de gradiente de gravedad: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } casos, dentro de { "1e-12" } en términos relativos (peor caso { "2.1e-15" }). El presupuesto de apuntamiento RSS es una suma de números aportados por quien llama y queda fuera.

# text
seg-71cf58e91a09 = <b>Geometría conjunta lunar de comunicaciones y navegación</b> (Library), limitada a la colocación del emplazamiento, el acimut, la elevación y la distancia: ANISE { "0.10.2" }, { "768" } muestras, dentro de { "1e-6" } grados y { "1" } mm (peor caso { "2.2e-12" } grados y { "5.6e-9" } m). El parámetro de precisión de medición de distancia es una entrada de diseño fuera de la afirmación.

# text
seg-0687c757231b = <b>Dinámica de actitud de un cuerpo rígido sin par</b> (Library): el cuerpo central de nave de Basilisk { "2.9.1" }, { "1e4" } s sobre dos inercias generales, cuaternión y velocidades dentro de { "1e-9" } (peor caso { "3.3e-11" } y { "3.4e-12" } rad/s).

# text
# c1: lambda()
seg-d8c3f8cc65ac = <b>Resolución de ambigüedad entera de fase de portadora GNSS (LAMBDA)</b> (Library), limitada a la solución ILS y sus dos mejores normas: RTKLIB v2.4.2-p13 <c1/>, { "300" } covarianzas, { "0" } discrepancias enteras, normas dentro de { "1e-9" } en términos relativos (peor caso { "5.6e-13" }). La tasa de éxito con bootstrap sigue comprobándose solo internamente.

# text
seg-c23196cbdc96 = <b>PL de temporización compuesto, MHSS escalar</b> (P2): numpy { "2.3.5" } y scipy { "1.18.1" } sobre { "300" } entradas confirmadas, PL dentro de { "1e-9" } en términos relativos (peor caso { "1.2e-10" }), subconjunto determinante idéntico.

# text
seg-8f524d815949 = <b>Blanqueo GLS de modo común e identidad de Mahalanobis</b> (P2): LAPACK de numpy { "2.3.5" } sobre { "201" } covarianzas confirmadas, dentro de { "1e-12" } en términos relativos (peor caso { "7.9e-16" }); números de condición de hasta { "19.3" }.

# text
# c1: pxform
seg-b4136cdb8a98 = <b>Proveedor de orientación de ejes principales lunares de DE440</b> (Library): SPICE <c1/> sobre el PCK binario en { "2 000" } épocas fuera de nodo, dentro de { "1.7e-5" } rad (peor caso { "1.7e-6" } rad, unos { "3" } m en la superficie), tras la corrección indicada en "Corregido".

# text
# c1: welch_psd
# c2: signal.welch
seg-c28de00a491c = <b>Entrada y salida de grabaciones SigMF, y espectros de Welch</b> (Library), limitado a la lectura y escritura de SigMF y a <c1/>: <c2/> de scipy { "1.18.1" } dentro de { "1e-12" } en términos relativos por intervalo (peor caso { "6.0e-14" }); grabaciones de sigmf-python { "1.13.0" } decodificadas de forma idéntica bit a bit; los metadatos del crate válidos frente al esquema SigMF { "v1.2.6" }. La síntesis IQ y sus comparaciones de modelos quedan fuera.

# text
seg-a7756d2e124a = <b>Ajustador de efemérides de difusión LEO y SISRE frente al intervalo de ajuste</b> (Measured), limitado al ajuste kepleriano de 16 parámetros y a su SISRE solo orbital: órbitas precisas ITSG de TU Graz de cuatro satélites frente a las estadísticas de Liu et al. { "2025" }, componentes dentro de 1,5x ({ "0.804" } a { "1.087" }) y SISRE dentro de 1,5x ({ "0.716" } a { "0.809" }).

# text
seg-99debd58724a = Hallazgos

# text
# c1: docs/MODELLED-RATIONALE.md
seg-3f5b2f54c7bf = La referencia independiente discrepó con estas filas, por lo que siguen siendo MODELLED. Cada hallazgo también se escribe en el texto de referencia independiente de la fila (y por tanto en <c1/>), con una prueba que lo fija.

# text
seg-e28fac875d8c = <b>Estimación del estado del reloj de a bordo:</b> con relojes IGS reservados de { "11" } satélites GPS Block IIF, el filtro de tres estados es coherente a un paso pero demasiado confiado a una hora en { "9" } de { "11" } (los términos periódicos y de flicker no están en el modelo).

# text
seg-5900ce454dc7 = <b>Detección de spoofing:</b> en JammerTest { "2024" } ningún monitor a nivel de observables dio la alarma en { "10" } s desde ninguno de los { "8" } inicios publicados, y tres ventanas previas al inicio presentaron falsas alarmas.

# text
seg-08b6e6aa7d08 = <b>Nivel de protección de temporización bajo spoofing:</b> el error de tiempo no detectado medido supera el TPL en { "3" } de { "8" } inicios detectados (de 1,9x a 5,3x); una calibración de reloj de { "60" } s no cubre la deriva del TCXO del receptor.

# text
seg-a2f4df11d9cc = <b>Geometría de la ventana de lanzamiento y del ascenso:</b> frente a Orekit { "12.2" } la geometría coincide hasta el redondeo, pero la velocidad del emplazamiento por rotación terrestre no alcanza { "1e-6" } en términos relativos a { "62.9" } grados de latitud ({ "1.12e-6" }, el movimiento polar que omite el modelo esférico). Ronda { "2" }: la velocidad con polo verdadero y época coincide, la velocidad por defecto sin época sigue sin alcanzarlo (véase más abajo).

# text
seg-f6b6c9251a17 = <b>Corredor de reentrada balística (Allen–Eggers):</b> la deceleración máxima prevista para la reentrada de Stardust es de { "61.8" } g frente a los { "32.89" } g reconstruidos (+{ "88" } %, tolerancia { "15" } %).

# text
seg-5d83648dd867 = <b>Error conjunto de UT1 y movimiento polar:</b> frente a la fórmula de precisión impresa en { "178" } números del Boletín A del IERS, el polo coincide dentro de 1,5x pero UT1 no ({ "0.48" } a { "10" } días, { "1.59" } a { "40" } días). Reemplazado en la ronda { "2" }: la fila es ahora VALIDATED (véase más abajo).

# text
seg-98a99bcba894 = <b>Entrada de orientación terrestre por defecto sin conexión:</b> astropy confirma el censo de filas, pero las { "12" } filas que el crate llama predicciones del Boletín A están marcadas como medidas (I), no como predichas (P). Por tanto, las cifras de concordancia de la fila del predictor operativo se compararon con filas medidas. Reemplazado en la ronda { "2" }: el motor clasifica las filas por indicador y la fila es VALIDATED.

# text
seg-d96fbfa4be79 = <b>Error de predicción de orientación terrestre de estilo operativo:</b> el error de UT1 del predictor es de 2,4x a 12,6x el del Boletín A a { "1" } a { "10" } días y de { "5.32" } ms a { "10" } días, fuera del intervalo de { "0.36" } a { "3.13" } ms de la 2.ª EOP PCC.

# text
seg-1833bf6e3b6f = <b>VLBI geodésico lunar:</b> frente a los tiempos de luz de ANISE a través de DE440, ningún retardo queda dentro de { "1" } ps; la mayor diferencia es de { "24" } µs, sobre todo por el centro lunar analítico (a unos { "200" } km de DE440). Ronda { "2" }: la vía de kernel es VALIDATED en una fila propia; esta vía analítica sigue siendo MODELLED.

# text
seg-0ec8a2a91702 = <b>Exportación de interoperabilidad lunar:</b> Orekit { "12.2" } rechaza los sistemas de tiempo LTC y TCL, por lo que no está establecido el intercambio de los archivos OEM lunares con un segundo lector.

# text
seg-09cfd4e61b7b = <b>Movimiento relativo de Clohessy–Wiltshire:</b> frente al movimiento no lineal de Orekit a { "100" } m, la diferencia es de { "1.2" } a { "6.3" } mm, por encima de { "1" } mm; escala como el término de segundo orden omitido, de modo que la tolerancia preregistrada quedaba por debajo del error de linealización. Reemplazado en la ronda { "2" }: la corrección de segundo orden es VALIDATED frente al mismo umbral.

# text
seg-af1bdd974ba5 = <b>Crecimiento del error de deriva de INS/TRN:</b> frente a un Monte Carlo de inercial libre de NaveGo, las leyes de crecimiento se cumplen dentro del { "5" } % hasta { "600" } s y sobrestiman más allá (de 2,2x a 8x a una hora), porque omiten la realimentación de Schuler. Reemplazado en la ronda { "2" }: el modelo de error de Schuler es VALIDATED.

# text
seg-8459bc50f8b4 = <b>Volumen de servicio lunar a partir de la geometría real de la constelación:</b> { "4" } de { "12" } estadísticas de disponibilidad publicadas difieren en más de { "2" } puntos porcentuales (hasta { "22.5" }).

# text
seg-7a0fd1377b9c = <b>Sobrecota del sesgo de trazabilidad heterogéneo de UTC(k):</b> en { "105 024" } filas del BIPM, la sobrecota se supera en el { "50.8" } % de las filas; la incertidumbre publicada acota la medición del desfase por el BIPM, no el desfase.

# text
seg-814acf34cffd = <b>Clasificación del espacio nulo del datum lunar:</b> en la geometría publicada de cinco reflectores, la correlación es -0.78 frente a -0.97, y la CRLB del origen es un { "96" } a { "98" } % inferior a la del artículo.

# text
seg-da01b5e08a87 = <b>Sustrato de geometría del datum LLR lunar:</b> frente a { "192" } puntos normales lunares del ILRS de { "2024" }, el RMS del residuo unidireccional fue de { "96" } m con la interpolación de orientación anterior y es de { "22.7" } m tras la corrección siguiente, todavía por encima del umbral de { "10" } m (coordenadas de estación redondeadas, sin movimiento polar). La serie de orientación se satura en silencio fuera de 2024-2025. Ronda { "2" }: el modelo de distancia medida es VALIDATED en una fila propia ({ "2.81" } m); la serie ahora cubre 2014-2030 y da error fuera de ese intervalo.

# text
seg-fd9ad94680e9 = <b>Acoplamiento relativista de la tasa de reloj al marco:</b> el término de autopotencial supera en { "3.18e-4" } el valor publicado (tolerancia { "1e-4" }); el artículo evalúa un potencial distinto, por lo que no existe ningún valor publicado de esta forma cerrada. Reemplazado en la ronda { "2" }: el potencial ecuatorial de grado 2 es VALIDATED frente al mismo artículo.

# text
seg-e002819c1e2d = <b>Constantes físicas de todos los cuerpos del sistema solar:</b> { "12" } de { "84" } constantes de los cuerpos añadidos difieren de NAIF pck00011 y gm_de440 (elementos más antiguos de los satélites de Marte; otras soluciones de GM para Urano, Neptuno y Plutón). Ronda { "2" }: las constantes ahora siguen a NAIF (una transcripción, no se cuenta) y la orientación calculada coincide con SPICE; la fila sigue siendo MODELLED.

# text
seg-e722d242e78e = <b>Modelos de efemérides LEO seleccionables:</b> el ajuste de 22 parámetros deja 1,71x y 1,86x el error a lo largo de la traza publicado en arcos de { "20" } min, por encima de 1,5x. Reemplazado en la ronda { "2" }: el modelo de 22 parámetros y su ajuste son VALIDATED en una fila propia.

# text
seg-c136023752df = <b>Posicionamiento conjunto GNSS y LEO:</b> el sesgo entre sistemas coincide con RTKLIB, pero el { "93.2" } % de las épocas queda dentro de { "3" } m de ITRF2020 frente al { "95" } %; el propio RTKLIB alcanza el { "88.2" } % con los datos ({ "93.6" } % tras la corrección del retardo de grupo de la ronda 2).

# text
seg-e5f0e3c21def = <b>Ceguera de integridad de modo común</b> y <b>mapas de cobertura y DOP:</b> ambas comparaciones se superaron pero se rechazaron en la revisión porque un motor deliberadamente erróneo también las supera (la primera solo comprueba una identidad interna; los suelos publicados de la segunda no pueden detectar un PDOP duplicado). Ronda { "2" }: la ceguera de integridad de modo común es VALIDATED con entradas que llevan paridad; los mapas de cobertura siguen siendo un hallazgo (véase más abajo).

# text
seg-688e1753cd53 = Ronda de validación { "2" }

# text
seg-b320fbdb72c3 = La segunda ronda tomó todas las filas que la primera dejó encaminables, con preregistros nuevos confirmados antes de obtener ningún archivo de prueba o ejecutar ninguna referencia independiente, un segundo revisor adversarial que repitió cada comparación y una mutación deliberada del motor que debe poner cada prueba en rojo. El propietario aceptó la redacción corregida de la fila de la cota fuera de Omega el 2026-10-02 antes de su promoción (su texto anterior contradecía el código).

# text
seg-7b7c584caaaf = <b>Promovidas a VALIDATED ({ "17" }).</b> Tipo de referencia independiente entre corchetes; tolerancia fijada antes de la ejecución.

# text
seg-555e6ad454d2 = <b>Acoplamiento relativista de la tasa de reloj al marco</b> (Reference): L_m de Ashby y Patla { "2024" } dentro de { "2.8e-6" } (umbral { "1e-4" }) a partir del potencial ecuatorial de grado 2 de los dos campos que cita el artículo; gravedad de grado 350 de pyshtools para la entrada radial ({ "8.3e-5" }); velocidad lunar de DE441 ({ "2.5e-3" }).

# text
seg-0c01fac44708 = <b>Entrada de orientación terrestre por defecto sin conexión</b> (Library): astropy { "8.0.1" } y el Boletín A del IERS n.º { "039" } confirman las { "30" } filas finales, { "54" } rápidas y { "90" } predichas del extracto reelaborado.

# text
seg-b77253dd26b5 = <b>Error conjunto de UT1 y movimiento polar</b> (Library): las rotaciones completas de astropy y pyerfa reproducen la tabla conjunta (UT1 y polo dentro de { "6e-16" }, la combinación dentro de { "1.9e-7" }); los errores realizados del IERS Annual Report { "2019" } dan cocientes de { "1.001" } a { "1.100" }.

# text
seg-378414f812c1 = <b>Huella y cobertura de cargas útiles de observación de la Tierra</b> (Library): Orekit { "12.2" } y GeographicLib { "2.1" } en cada umbral preregistrado, con la regresión nodal de J2 ya incluida en el espaciado de nodos.

# text
seg-792bf58a1c1e = <b>Movimiento relativo de Clohessy–Wiltshire</b> (Library): con una corrección de segundo orden en forma cerrada, dentro de { "1.2e-7" } m del movimiento no lineal de Orekit frente a { "1e-3" } m; la matriz lineal por sí sola sigue caracterizada ({ "1.2" } a { "6.3" } mm).

# text
seg-423437d90022 = <b>Apuntamiento en el plano B y asistencia gravitatoria de cónicas empalmadas</b> (Library): plano B, asíntotas, C3 y elementos heliocéntricos de GMAT R2026a; sbpy { "0.6.0" } y Kasuga y Jewitt { "2019" } para el parámetro de Tisserand.

# text
seg-b29b0dfcd3a4 = <b>Crecimiento del error de deriva de INS/TRN</b> (Library): un modelo de error de Schuler de nueve estados dentro del { "5" } % de las ejecuciones de deriva de NaveGo corregidas en los { "48" } puntos (peor caso { "3.70" } %).

# text
# c1: lstsq
seg-8cc49496b4c6 = <b>Ceguera de integridad de modo común</b> (P2): <c1/> de numpy sobre { "1464" } entradas con paridad dentro de { "1e-12" } (peor caso { "1.06e-14" }).

# text
seg-f0ff538b7329 = <b>OD y reloj multitécnica conjunta lunar</b> (P2): numpy recalcula cada paso de Gauss-Newton, sigma y error de estación en seis redes (dentro de { "2.4e-11" }) tras una corrección de la solución QR.

# text
seg-7ed9b059f888 = <b>Covarianza de coordenadas de estación del VLBI lunar</b> (Library): un jacobiano construido con SPICE reproduce el calendario, el espectro, las sigmas y el espacio nulo dentro del { "1" } % y { "0.1" } grados; numpy hasta { "2e-13" }.

# text
seg-0e4e1c3fc899 = <b>Cota de modo común indetectable con residuo fuera de Omega</b> (P2, redacción corregida por decisión del propietario): LAPACK de numpy en { "256" } casos dentro de { "1e-12" }, seis infinitos exactos.

# text
seg-0fc8ce9cde6c = <b>Clasificación del espacio nulo invariante respecto a la base</b> (P2): intersección de subespacios con SciPy y NumPy en { "72" } matrices construidas, enteros exactos, norma del proyector dentro de { "6.0e-15" }.

# text
seg-4e5e7a6072bc = <b>Servicios ionosféricos de frecuencia única y UTC de un mensaje de navegación LEO</b> (Library): GNSSTk { "15.3.1" } para Klobuchar, Az y la deriva de UTC; ERFA para los tres casos de segundo intercalar.

# text
seg-a644bf49c816 = <b>Cota de posicionamiento de redes no terrestres 5G</b> (P1): cotas de SSB único de Bachl, Lei y Nabeel { "2026" } dentro de medio dígito impreso; numpy para las covarianzas de la solución.

# text
seg-b326f6fc55ad = <b>Modelo de distancia medida de LLR</b> (Measured, nueva fila separada del sustrato del datum LLR): { "192" } puntos normales lunares del ILRS con { "2.81" } m de RMS frente a un umbral de { "10" } m, con el tiempo de luz baricéntrico de IERS { "2010" }; los componentes por debajo del umbral no se resuelven uno a uno, y la fila lo indica.

# text
seg-82e9fba684dc = <b>VLBI geodésico lunar, vía de kernel</b> (Library, nueva fila separada de la fila de VLBI lunar): tiempos de luz convergidos de SPICE dentro de { "1" } ps y parciales dentro de { "1e-6" } en épocas cercanas a J2000; la vía analítica por defecto sigue siendo MODELLED.

# text
seg-03c47d262ff3 = <b>Modelo de efemérides LEO de 22 parámetros de Liu et al. { "2025" } y su ajuste</b> (Measured, nueva fila separada de la fila de modelos seleccionables): órbitas precisas reales dentro de 1,5x de las estadísticas publicadas en los días del artículo y en días reservados ({ "0.683" } a { "1.186" }); la convención de escala de n_dot está transcrita y esta comparación no la valida, y la regla de parada es la regla de convergencia de parámetros de Kshana, no la regla de cambio de RMS del artículo. El polinomio ATOMIC y la tabla de cinco altitudes siguen siendo MODELLED.

# text
seg-b49f96eb52ad = Filas VALIDATED existentes con nuevo respaldo (sin cambio de recuento).

# text
seg-4e26bec3297c = <b>Posiciones planetarias a partir de los elementos de Standish del JPL</b> y <b>tiempo de luz entre cuerpos del sistema solar</b>: los umbrales posteriores de dos veces el valor nominal se sustituyen por comparaciones preregistradas con JPL Horizons DE441 (RMS como máximo la cifra de la Tabla { "8.10.1" } del Explanatory Supplement, peor caso { "0.778" }, con la división de la Tierra y la rotación ICRF incluidas; tiempos de luz dentro de { "1e-6" } s de Horizons con posiciones DE441, peor caso { "6.7e-9" } s). Se retiran sus indicadores "límite fijado después de la comparación".

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
# c4: raim::solution_separation_raim
seg-d3b745392d29 = <b>Integridad (RAIM/ARAIM/SBAS)</b>: la fila ya no se apoya en comprobaciones de verosimilitud. Ahora dice: la separación de soluciones con hipótesis múltiples de ARAIM del ADD v4.2 coincide con Stanford MAAST para ARAIM { "2" } en { "270" } casos reales (peor diferencia de VPL { "2.2e-3" } m frente a { "0.05" } m); la detección y exclusión RAIM instantánea coinciden con <c1/> de RTKLIB en { "2016" } de { "2016" } decisiones, con el nivel de protección por pendiente dentro de { "2.7e-12" } m; los niveles de protección L1 de SBAS DO-229E coinciden con Stanford MAAST en emisiones WAAS reales ({ "2868" } pares dentro de { "1.6e-5" } m). Indica con claridad que las funciones de sigma uniforme <c2/> y <c3/> NO están ajustadas a la norma ADD (diferencias con entradas coincidentes de 0.75/4.04 m y 0.39/1.93 m de VPL/HPL, un hallazgo), que la comparación de SBAS DFMC L5 es un hallazgo ({ "308" } pares sin ningún GEO a la vista están protegidos por Kshana y no por MAAST) y que <c4/> no tiene comparación externa. Se retira su indicador propio.

# text
seg-d059b9953c3f = <b>Ajustador de efemérides de difusión LEO</b>: la órbita verdadera integrada se añade a la parte validada (Orekit { "12.2" } dentro de { "4.55" } mm en { "6" } h, umbral { "2" } cm); los polinomios de corrección, el ajuste del reloj y el compromiso del periodo de actualización siguen siendo de nivel modelado.

# text
seg-166d511bbba3 = <b>Hallazgos y filas bloqueadas (siguen siendo MODELLED).</b> El texto de referencia independiente de cada fila incluye el hallazgo y su prueba fijada.

# text
seg-7f233dbdf110 = Modulación de señales de navegación (Betz { "2001" }, Hein { "2006" }): los espectros y las correlaciones coinciden; los lóbulos laterales de { "24" } MHz y todos los sesgos de multitrayecto ({ "11" } a { "15" } % por debajo) no, causa sin resolver.

# text
seg-4d5a6bb44d64 = Geolocalización TDOA/FDOA: las cotas coinciden con Ho y Chan y Ho y Xu, y con el código de los autores hasta { "3e-12" }; los factores de Ottawa impresos a partir de un Monte Carlo difieren en el { "1.3" } % y el { "4.4" } %.

# text
seg-5fa189f788ca = GNSS terrestre a distancia lunar: las medias en cenit de GENESIS coinciden con Montenbruck et al. { "2023" } en { "5" } de { "6" }; las medias en nadir quedan de { "1.0" } a { "2.4" } satélites por encima.

# text
seg-d7e5b5a64f43 = Mapas de cobertura y DOP: los diseños terrestres coinciden con Orekit, gnss_lib_py y numpy en cada umbral; los diseños de la Luna y de Marte superan { "1e-9" } solo en celdas casi singulares.

# text
seg-3c8fb07d83ec = Posicionamiento GNSS conjunto: doble frecuencia { "79.9" } % y productos precisos { "94.2" } % dentro de { "3" } m frente al { "95" } % (RTKLIB { "67.9" } % y { "94.1" } %); la diferencia de ISB con productos precisos se debe a que RTKLIB ignora los desfases de antena.

# text
seg-5d3d4d99fbc4 = Lazos de seguimiento (GNSS-SDR { "0.0.19" }): coinciden entre { "35" } y { "45" } dB-Hz; a { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, umbrales +{ "1.5" } dB; tiempos de deslizamiento de { "0.5" } a { "2" } décadas más cortos.

# text
seg-0dd24947169c = Volumen de servicio lunar (Orekit e Hipparchus): { "155" } de { "160" } valores coinciden; el requisito de la peor muestra falla en la geometría casi singular de LNCSS B.

# text
seg-74002245287f = Sensor inercial cuántico: el suelo solo de QPN es un { "21" } a { "31" } % inferior al ruido medido de Gauguet { "2009" } (umbral { "30" } %, no alcanzado por { "0.5" } puntos).

# text
seg-ab8b17cf325e = Preajustes de osciladores: las unidades medidas superan los preajustes de holdover de rubidio, de corto plazo de cesio y de peor unidad de CSAC; el preajuste de OCXO no tiene registro medido.

# text
seg-81ad9b839a28 = Densidad de meteorología espacial: Jacchia { "1971" } queda dentro de un factor { "2" } de las densidades de acelerómetro en el máximo solar, pero es aproximadamente 1,7x demasiado densa en el mínimo de { "2008" }.

# text
seg-68e5d0942847 = TEC oblicuo libre de geometría: { "33" } de { "36" } arcos dentro de { "3" } TECU del mapa CODE (peor caso { "6.84" }).

# text
seg-f410ce9cf195 = Detección de spoofing y TPL frente al registro oficial de JammerTest { "2024" }: { "4" } de { "10" } inicios detectados a tiempo; el TPL se supera en { "4" } de { "10" }.

# text
seg-41eb2c318469 = Filtro de reloj con relojes IGS nuevos: dos de { "11" } satélites no superan el criterio de la suma de innovaciones.

# text
seg-064b623e918b = Predictor de EOP de mínimos cuadrados más autorregresivo: UT1 { "1.73" } a 2,11x el del Boletín A a { "2" } a { "10" } días.

# text
seg-d98571cc21f4 = Sobrecota del desfase realizado de UTC(k): superación agrupada { "0.0333" } frente a { "1e-2" }.

# text
seg-527aca91ec7c = Datum de marco lunar a partir de una campaña: la rama SPICE coincide; la rama P2 con estaciones estimadas no alcanza { "1e-9" } en un problema de condición 2,1e8.

# text
seg-9805c4c821f9 = Datum de marco lunar a partir de LLR real: { "15" } de { "16" } cifras coinciden con SPICE; la sigma de la traslación z es un { "1.03" } % alta frente a un { "1" } %.

# text
seg-08e6c541b59e = Reentrada (Allen-Eggers): la solución de masa puntual coincide con las reconstrucciones de las agencias (solo una verificación cruzada); la comparación con el acelerómetro está bloqueada a la espera de una fuente legible de Hayabusa2.

# text
seg-0bb78ffbd915 = Máscaras de la ITU-T: los valores resueltos impresos coinciden; los límites de clase de G.8273.2 no tienen ninguno (bloqueado).

# text
seg-308c1bca3fd9 = Geometría de la ventana de lanzamiento: la velocidad del emplazamiento con polo verdadero y época coincide con Orekit ({ "4.9e-8" }); la velocidad por defecto sin época sigue sin alcanzarlo ({ "1.12e-6" }). No promovida; seguimiento pendiente.

# text
seg-f0b7c3d60df8 = Constantes físicas de todos los cuerpos: ahora { "0" } de { "84" } difieren de NAIF (una transcripción), y la orientación calculada coincide con SPICE hasta { "1.4e-10" } rad. No promovida; seguimiento pendiente.

# text
seg-a5a787c9a761 = Bloqueadas por una decisión de alcance del propietario, cada una con su comparación coincidente confirmada: observabilidad absoluta de estaciones lunares, DOP de balizas de superficie, la exportación fuera del eje, la potencia de detección entre modalidades, el estadístico de coherencia de modo común y la cobertura LEO polar.

# text
seg-cf638ec9878b = Bloqueadas por datos: presupuesto de errores de transferencia de tiempo (requiere una reducción de datos reales), C/N0 de JammerTest (la posición de la antena y el reparto de potencia no están documentados).

# text
seg-e8709509eef3 = Revisiones (cifras publicadas que se movieron, antiguo -> nuevo).

# text
# c1: snapshot_raim
# c2: gnss-sim
# c3: docs/tutorials/scenarios/gnss-sim.toml
seg-5e93ab237b15 = Los niveles de protección de <c1/> ahora están en el nivel local geodésico en lugar del radial: hasta { "0.31" } m de HPL y { "0.14" } m de VPL en ABMF ({ "16" } grados N); no se movió ningún golden, pero el resumen registrado del tutorial de <c2/> pasa de HPL medio { "22.1" } m / VPL { "40.0" } m a { "22.2" } m / { "39.9" } m (<c3/>).

# text
seg-c14361b2cb1f = Valores por defecto del acoplamiento lunar de marco de tasa: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } por metro.

# text
# c1: realtime-frame-eop
# c2: docs/revisions/M035-default-eop-recut-cell-changes.md
# c3: tests/golden/realtime-frame-eop.csv
seg-8ac9cb8c5631 = Ejecución de EOP por defecto sin conexión (<c1/>, celdas listadas en <c2/>): predicted_rows { "12" } -> { "90" }; suelo del polo { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; las filas de la Tabla { "2" } de <c3/>; concordancia del predictor operativo 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

# text
# c1: docs/LEO-NAVMSG.md
seg-dd93329245ba = <c1/> SISRE de liu22 órbita/con reloj: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

# text
seg-e4205dfdb0d2 = Tabla de altitudes de Liu, Kshana (cociente): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

# text
# c1: nDot
seg-4655e8ee7bab = Escala de <c1/> del mensaje de navegación LEO { "2" }^-60 -> { "2" }^-58 (no preregistrada, comunicada; fuera de la comparación del ajuste); el CRC de la trama de muestra de liu22 0x62373A -> 0xDED99C.

# text
# c1: docs/LEO-NAVMSG.md
seg-3f565c0ca2bf = Tabla de verificación de <c1/>: la fila de Liu y ATOMIC se divide en una fila VALIDATED de 22 parámetros y una fila MODELLED de ATOMIC y cinco altitudes.

# text
seg-537f5d80b66c = Texto de la fila de orientación de ejes principales lunares de DE440: intervalo 2024-2025 / { "731" } filas -> 2014-2030 / { "6 209" } filas; "se satura en silencio" -> da error fuera de su intervalo.

# text
# c1: eo-coverage
seg-17a5dd090566 = Escenario <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nuevos campos inclination_deg ({ "98.19" }) y nodal_period_min ({ "98.893" }).

# text
# c1: constellation-multi-gnss-coverage
seg-6ce48a53df35 = <c1/> (el reloj de referencia de TDOP/GDOP es ahora la constelación de menor número a la vista): GDOP global máx. { "2.2236" } -> { "2.1205" }, media { "1.122" } -> { "1.131" }, mediana { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, y el mapa de GDOP por celda; mean_visible_by_constellation sumado como enteros (alrededor de { "1e-12" } en términos relativos, invisible con { "4" } decimales).

# text
seg-e48b212c4881 = Solución GNSS conjunta de frecuencia única tras la corrección del retardo de grupo de difusión: { "93.2" } % -> { "93.6" } % dentro de { "3" } m; mediana de ISB -0.351 -> -0.114 ns.

# text
# c1: tracking-loop
seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (SNR rho/4 del lazo de Costas): en el umbral de { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; a { "25" } dB-Hz { "9.55" } -> { "1.60" }; a { "22" } dB-Hz { "2.24" } -> -0.14.

# text
# c1: ins-trn-coast
# c2: tests/conflict_resilience_architecture_guard.rs
seg-789a302679f7 = <c1/>: todas las salidas se mueven con el modelo de error de Schuler; el pico de TRN del escenario distribuido { "52.932679" } -> { "44.711834" } m (<c2/>).

# text
# c1: lunar-vlbi
seg-9d65f2ce8715 = Informe de <c1/>: nueva clave geometry_path ("analytic" en la ejecución por defecto, ningún valor numérico cambió); nuevos campos opcionales planetary_kernel_path, earth_orientation_kernel_path y moon_orientation_kernel_path, con epoch_partials en la vía de kernel; se reescribe la descripción del tipo de escenario. La referencia independiente de la vía de kernel de la fila de verificación es SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) pasa a ser una verificación cruzada de evaluación de kernel.

# text
seg-3631a31e7b26 = Constantes de cuerpos: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }; Plutón { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); radio ecuatorial de Fobos { "13.1" } -> { "13.0" } km; polo y meridiano origen de Fobos y Deimos de pck00011; el prime_meridian_deg del sistema solar ahora incluye los términos cuadráticos y periódicos.

# text
# c1: europa-surface-pnt
# c2: body-pnt
# c3: docs/SOLAR-SYSTEM.md
# c4: mcp/kshana-mcp/tests/round_trip.rs
# c5: mars-orbit-pnt
seg-ac1251d7a0fd = <c1/> (<c2/> en Europa), a partir de la orientación completa de Europa de pck00011 (7cfd66b4; la orientación coincide con pxform de SPICE hasta { "1.4e-10" } rad), que mueve el módulo de aterrizaje en el espacio inercial: disponibilidad solo con relés / con el alcance a la Tierra { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } de { "171" } épocas solo con relés), PDOP mediano { "5.266" } -> { "5.360" }, error de posición RMS { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, sigma formal mediana { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. La tabla de <c3/> y la fijación de <c4/> las siguen; <c5/> no cambia.

# text
# c1: space-weather
# c2: tests/space_weather_reference.rs
seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), con el factor calibrado sustituido por Jacchia { "1971" }: activity_density_kg_m3 a 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k retirado, mean_exospheric_temperature_k añadido ({ "1186.7" } K); <c2/>: la oscilación del ciclo solar a { "800" } km es ahora 10,4x (NRLMSISE-00 13,6x) y la aserción de altitud sigue el aumento de NRLMSISE hasta { "500" } km y su descenso a { "800" } km.

# text
# c1: ntn-5g-positioning
seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (el texto del resumen no cambia, en { "2.09" } / { "25.94" } m).

# text
# c1: lunar-joint-od-clock
seg-6a6fb57d177e = <c1/> (solución QR): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

# text
# c1: docs/field-units-schema.json
seg-76c94424e828 = <c1/> se vuelve a emitir para los campos nuevos y eliminados indicados arriba.

# text
seg-717c51e1cca0 = Paquetes de validación

# text
seg-4ec44f8a5f8e = D12, precisión extendida y un solucionador de raíz cuadrada (dos filas VALIDATED nuevas: { "226" } -> { "228" } filas, { "110" } -> { "112" } validadas).

# text
seg-d28005966948 = Parte { "1" }, referencia independiente de precisión extendida:

# text
seg-9a5f94973450 = Datum de marco lunar con las estaciones estimadas: una referencia independiente de precisión extendida de 50 dígitos con mpmath (preregistrada 804662d5, umbrales escalados por condición a partir de una fórmula de error hacia atrás a priori) coincide en una nueva fecha de campaña (2026-03-18) y en el escenario original de 2024-01-01; nueva fila VALIDATED bajo P2. Resuelve la disputa anterior de doble precisión: las sigmas del datum del motor se desvían hasta { "9.7e-6" }, las rutas de inversa y de autovalores de NumPy hasta { "6.2e-6" }, y sus rutas de Cholesky y QR en torno a { "1e-8" }. El motor está dentro de su cota de error pero es unas mil veces menos preciso que una ruta de factorización.

# text
seg-b055435a2138 = Entorno de la referencia independiente: se añade mpmath { "1.3.0" }.

# text
seg-d0c2b2a8e635 = Revisiones: ninguna. No cambia ningún archivo golden ni cifra publicada; la fila "Datum de marco lunar a partir de una campaña de observación" sigue siendo MODELLED (decisión del fundador 2026-10-02, opción A: no toma prestado el estado de la fila independiente); el texto de sus pruebas cita la nueva prueba y su hallazgo.

# text
seg-50b53908fb7c = Parte { "2" }, solucionador de datum de información en raíz cuadrada:

# text
# c1: linalg_sr
# c2: solver = "srif"
seg-4c6089cfac5e = Nuevo solucionador de información en raíz cuadrada opcional (<c1/>; <c2/> en el escenario lunar-frame-campaign): QR de Householder, marginalización a través del factor triangular, una SVD de Jacobi para el espectro y productos compensados solo a partir de operaciones correctamente redondeadas. Frente a la referencia independiente de 50 dígitos (preregistrada b41908c9), sus sigmas de datum coinciden hasta { "3e-13" } en una fecha nueva (2026-06-09); en las entradas de 2026-03-18 y de 2024-01-01, el solucionador por defecto se desvía hasta { "1e-5" }. Nueva fila VALIDATED bajo P2. El solucionador por defecto y su salida no cambian. Los umbrales preregistrados solo acreditan errores superiores a unos { "2e-7" } en términos relativos: rechazan el solucionador por defecto pero no un signo de Householder invertido, un producto escalar sin compensar ni una inversa final espectral, y la fila lo indica.

# text
# c1: fim::crlb_srif
# c2: batch_ls::gauss_newton_srif
# c3: orbit_determination::determine_orbit_batch_srif
# c4: lunar_combination::formal_covariance_srif
# c5: precise_od::fit_srif
# c6: cislunar_srif::srif_cross_validation_sqrt
# c7: linalg_sr::weighted_lstsq
# c8: covariance_from_sqrt_information
# c9: precise_od::fit
seg-de9aeb2adde0 = Vías opcionales de raíz cuadrada junto a los valores por defecto sin cambios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> y <c6/>, sobre los nuevos <c7/> y <c8/>. Cada una coincide con su valor por defecto allí donde ambos son precisos (una comprobación interna, sin fila; no se afirma validación alguna para ellas). <c9/> ahora delega en una rutina compartida; su salida y la salida por defecto de todos los escenarios no cambian.

# text
seg-87a632404f32 = Decisiones de rango de la campaña de marco lunar: una comprobación preregistrada de precisión extendida sobre { "40" } días confirma cada decisión decidible de bloque de estaciones y de Helmert de rango completo. La cota a priori no puede acreditar los { "20" } días de Helmert con rango deficiente; en aritmética exacta su defecto es geométrico, con el umbral de { "1e-9" } dentro del intervalo natural de cocientes de autovalores de la campaña. Sin fila.

# text
seg-3b24e7fa36bf = La afirmación de la fila de la campaña de precisión extendida se limita a "dentro de la cota del peor caso", y su comprobación de la dirección más débil con estaciones fijas ahora mide un ángulo real ({ "6.6e-16" } rad; el comparador cambió de acos a una cuerda, el umbral no).

# text
seg-4fad02ab4b6d = Revisiones: ninguna. No cambia ningún archivo golden ni cifra publicada; la fila "Datum de marco lunar a partir de una campaña de observación" no cambia y sigue siendo MODELLED (decisión del fundador 2026-10-02, opción A).

# text
seg-627d3357d620 = D4, columna vertebral de efemérides de kernel del JPL, fase { "1" } (cuatro filas VALIDATED nuevas: { "228" } -> { "232" } filas, { "112" } -> { "116" } validadas).

# text
seg-30e8a645191f = El lector de kernels NAIF tiene su propia fila.

# text
# c1: naif_kernel
# c2: tests/naif_reader_spice_oracle.rs
seg-98ff121aa2a9 = <c1/> (contenedor DAF, SPK tipo { "2" }, PCK binario tipo { "2" }) coincide con el SPICE Toolkit (CSPICE N0067 a través de spiceypy { "8.2.0" }) y con ANISE { "0.10.6" } en los { "600" } estados de DE440 y las { "200" } rotaciones de orientación lunar de una malla aleatoria obtenida del propio hash del commit de preregistro (abcd9133), dentro de umbrales derivados de antemano de la evaluación de Chebyshev en doble precisión (peor caso { "0.6" } % del umbral, { "1.95e-3" } m). La fila afirma que el motor lee correctamente los kernels del JPL, no que DE440 o la serie analítica sean exactas (<c2/>).

# text
# c1: ephem_provider::KernelEphemeris
# c2: LunisolarSource
seg-e0b5ea7af969 = <b><c1/></b>: posiciones de DE440 (o de cualquier SPK de tipo 2) a través del propio lector del motor, con épocas TDB en dos partes y el SHA-256 del kernel conservado para los informes; nunca sustituye un baricentro de sistema por un planeta. <c2/> permite que una vía de geometría elija la serie analítica (por defecto) o un kernel.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: planetary_kernel_path
# c4: moon_ephemeris
seg-6c7dae98601e = <b>Luna de kernel opcional para <c1/> y <c2/></b>: una clave <c3/> lee del kernel el centro geocéntrico de la Luna; no cambia nada más, y el informe incorpora un bloque <c4/> que nombra el kernel y su SHA-256. Sin la clave, ambos informes son idénticos byte a byte a los anteriores.

# text
# c1: tests/lunar_vlbi_surface_point_spice_oracle.rs
seg-74e8def84747 = <b>Covarianza de un punto de la superficie lunar en la vía de kernel</b> (nueva fila VALIDATED): con todas las estaciones fijas y la baliza en la Luna de DE440, la covarianza de la baliza coincide con un jacobiano de tiempo de luz de SPICE (peor caso { "1.7e-3" } frente a un umbral del { "1" } %) y con una inversa de NumPy ({ "4e-14" } frente a { "1e-9" }), preregistrada 4a51256 (<c1/>). La fila de la vía analítica sigue siendo MODELLED: con la Luna analítica su menor sigma de baliza es un { "3.9" } % inferior a la de la referencia independiente.

# text
# c1: tests/validate_llr_datum_kernel_moon_fresh.rs
seg-55002d236ab0 = <b>Datum de marco lunar a partir de una campaña real, centro lunar de kernel</b> (nueva fila VALIDATED): con { "447" } puntos normales de 2019-T2 no vistos, preregistrada 830d945a antes de obtener ninguno, la covarianza del datum en la vía de kernel coincide con la referencia independiente SPICE y NumPy sin cambios dentro de { "7.6e-5" } frente a umbrales del { "1" } % y del { "2" } % (<c1/>). El fundador decidió que esta fila solo se promueve con puntos nuevos; el diagnóstico con datos ya vistos (c51f8b2) es un hallazgo, no una evidencia. El umbral no discrimina entre modelos de la Luna: la Luna analítica también lo supera en el mismo tramo (peor caso { "3.8e-3" }), la mutación prevista (la Luna de kernel con una hora de retraso) no se detectó, y en el pliegue un centro lunar erróneo en unos { "4,650" } km (la Luna tomada respecto al baricentro Tierra-Luna) también lo superó. La fila afirma la covarianza en esa vía, no el centro lunar, y así lo indica.

# text
# c1: KernelEphemeris::relative_position_utc
# c2: tests/kernel_ephemeris_skyfield_oracle.rs
seg-f147f9257b8b = <b>Posiciones del Sol, la Luna, Mercurio y Venus a partir de DE440 en épocas UTC</b> (nueva fila VALIDATED): <c1/> coincide con Skyfield { "1.54" } en { "600" } posiciones entre { "1973" } y { "2026" }, peor caso { "2.96" } m, dentro de un umbral preregistrado (0bfafe6d) fijado por la serie de dos términos TDB − TT (<c2/>). Las posiciones planetarias obtienen ahora esta nueva fila de kernel; la fila de Standish y la de las lunas planetarias no cambian, y las lunas esperan a un escenario que las necesite (decisión del fundador).

# text
# c1: tests/validate_llr_datum_kernel_moon.rs
seg-bb840641c655 = Hallazgos: el único fallo de la comparación del datum LLR (sigma de la traslación z { "1.025" } % frente a { "1" } %) baja a { "0.049" } % cuando solo se lee de DE440 el centro lunar, con datos ya vistos (<c1/>); en el tramo nuevo de { "2019" } la Luna analítica también lo supera, de modo que el fallo de { "2015" } era marginal respecto a la geometría de ese trimestre. Las filas analíticas "Datum de marco lunar a partir de una campaña de observación REAL" y "Covarianza de coordenadas de un punto de la superficie lunar … distinta de la de una estación terrestre" siguen siendo MODELLED; sus textos de referencia independiente ahora remiten a las filas de la vía de kernel.

# text
# c1: lunar_ephemeris
seg-64c9f3b96392 = <c1/> ya no dice que el motor carece de lector de kernels binarios; remite a la fila del lector y explica por qué los kernels de naves (tipos { "13" } y { "21" }) siguen obteniéndose de Horizons.

# text
# c1: lunar-llr-datum
# c2: lunar-vlbi-fim
# c3: lunar-vlbi-fim
seg-841deceb80e6 = Revisiones: ninguna. No cambia ningún archivo golden, cifra publicada ni valor de prueba existente; los informes analíticos de <c1/>, <c2/> y <c3/> con todas las estaciones fijas son idénticos byte a byte a los anteriores (prefijos SHA-256 del resultado 9927aac2, cf1d2671, 25c357e4).

# text
seg-95b8207466a3 = D9, biblioteca de relojes medidos "Clock Atlas" (tres filas nuevas, una VALIDATED: { "232" } -> { "235" } filas, { "116" } -> { "117" } validadas).

# text
# c1: clock_library
# c2: realdata::clk
# c3: utck_bound
seg-1f8644486f5d = <b>Biblioteca de relojes medidos (<c1/>).</b> Fichas de dispositivo (ruido blanco de fase, modulación de frecuencia blanca, flicker y de paseo aleatorio, una deriva lineal de frecuencia y, opcionalmente, términos de fase de una a cuatro veces por revolución) ajustadas a un registro de reloj medido con nombre y puntuadas sobre datos reservados; varianzas de Allan y de Hadamard conscientes de los huecos; un detector de acondicionamiento que registra cada hueco, valor atípico de fase, salto de fase, ráfaga y salto de frecuencia y que no sabe nada de los límites de archivo o de día; conversión de una ficha al modelo de ruido de temporización de ranura, al modelo de reloj de Kalman extendido y a los niveles de ruido del monitor de spoofing. Lectores de archivos de reloj RINEX e IGS, de archivos por laboratorio del BIPM y de la Sección { "1" } de la Circular T (<c2/>); una cota de envejecimiento jerárquica y agrupada para UTC(k) (<c3/>, todavía sin puntuar).

# text
# c1: allan::lag1_noise_id
# c2: autocorr_noise_id
# c3: tests/clock_library_lag1_noise_id_allantools.rs
seg-93add052ae56 = <b>Identificación de ruido por autocorrelación de retardo 1</b> (<c1/>, Riley y Greenhall { "2004" }), nueva fila VALIDATED (Library): coincide con <c2/> de allantools { "2024.6" } en { "140" } casos, enteros idénticos, peor diferencia { "9.6e-13" } frente a un umbral de { "1e-9" } (preregistrada 2ec76864; <c3/>).

# text
# c1: tests/clock_library_device_cards_oracle.rs
# c2: tests/clock_library_f9p_cards_oracle.rs
seg-1fcea6ee6136 = <b>Fichas de dispositivo medidas con predicción sobre datos reservados</b>, nueva fila MODELLED (un hallazgo): ajuste con un tercio, predicción de la desviación de Allan de los otros dos tercios dentro de un factor de { "1.5" } (preregistrada 2ec76864). GPS Block IIF en una ventana IGS nueva (de 2026-03-01 a { "14" }): { "10" } de { "11" }; G27 es optimista a la escala de dos horas (peor factor { "1.510" }). Se informa del cesio (dentro, { "1.070" }), del OCXO (fuera, { "2.348" }) y del estroncio (dentro), no a ciegas. La ficha del receptor de JammerTest y las fichas del máser de Galileo y del Deep Space Atomic Clock están bloqueadas. Una clase de modelo de TCXO de receptor ZED-F9P en { "12" } estaciones estáticas de Wroclaw (Zenodo { "6488497" }) falla: { "1" } de { "11" } estaciones a ciegas en una nueva ejecución corregida comunicada (<c1/>, <c2/>).

# text
# c1: tests/clock_library_periodic_cards_oracle.rs
seg-26fa898f6272 = <b>Fichas de GPS Block IIF con términos por revolución</b>, nueva fila MODELLED (un hallazgo): en una segunda ventana nueva (de 2026-04-01 a { "14" }) { "9" } de { "11" } quedan dentro del umbral; G03 ({ "1.947" }) y G25 ({ "1.581" }) son optimistas porque sus registros reservados son más ruidosos que sus tercios de ajuste; al eliminar los términos periódicos fallan los { "11" } (preregistrada fb475550; <c1/>).

# text
# c1: tests/clock_state_ext_igs_conditioned_oracle.rs
seg-ef456da29319 = <b>M002, estimación del estado del reloj de a bordo, ronda { "3" }</b> (un hallazgo, sigue siendo MODELLED): tras el detector de acondicionamiento congelado, el filtro ampliado de la ronda 2, con ajuste y criterios sin cambios, satisface (a) y (c) en los { "11" } satélites por primera vez; (b) falla en G09 ({ "0.894" }) y G26 ({ "0.876" }) (preregistrada fb475550; <c1/>).

# text
# c1: tests/clock_library_tcxo_card_jammertest_oracle.rs
seg-0014b2629fd2 = <b>M010, detección de spoofing, rondas { "3" } a 4b</b> (sigue siendo MODELLED): la ronda { "3" } quedó bloqueada ({ "167" } épocas de entrenamiento de las otras sesiones de la unidad de JammerTest frente a { "3600" }); con una ficha de clase de modelo ZED-F9P (rondas { "4" } y 4b) el monitor de reloj produce cero falsas alarmas previas al inicio en los { "10" } inicios registrados (ronda { "2" }: { "86" }) y { "6" } de { "10" } inicios se detectan en { "10" } s (ronda { "2" }: { "4" }); los mismos cuatro siguen siendo tardíos (<c1/>).

# text
# c1: tests/utck_bound_prospective_oracle.rs
seg-79757abc69e3 = <b>M083, sobrecota de UTC(k), ronda { "3" }</b>: preregistrada de forma prospectiva (fb475550) sobre números de la Circular T a partir de { "465" }, todavía no ejecutada (<c1/>).

# text
# c1: $KSHANA_ORACLES/data/wroclaw_f9p
seg-09abf996ed16 = Entorno de la referencia independiente: el registro ZED-F9P de Wroclaw está sujeto a datos bajo <c1/> (CC BY { "4.0" }, unos { "1.5" } GB); los archivos de prueba de relojes IGS están incorporados (productos IGS, con atribución).

# text
seg-b05fa0811a3e = Revisiones: ninguna. No cambia ningún archivo golden, cifra publicada ni valor de prueba existente; no se actúa sobre M001 (reanclaje de holdover) porque no se promovió ninguna clase de reloj.

# text
seg-986f4075210b = D8, una vía validada de propagación, marco y tiempo (tres filas VALIDATED nuevas y M131 promovida: { "235" } -> { "238" } filas, validadas { "117" } -> { "121" }).

# text
seg-d7a612528765 = Los tipos de escenario de órbita terrestre que llevaban sus propios modelos de dos cuerpos, de J2 secular o solo de tiempo sidéreo ahora comparten una única vía: conjuntos de elementos SGP4/SDP4 con fechas julianas en dos partes, llevados al GCRS y al ITRS (International Terrestrial Reference System) mediante la cadena IAU (International Astronomical Union) 2006/2000A, con parámetros de orientación de la Tierra opcionales.

# text
# c1: sgp4::MeanElementSet
# c2: sgp4::SgpOrbit
# c3: sgp4::Eop
# c4: sgp4::teme_to_itrs_matrix[_eop]
# c5: sgp4::gcrs_to_itrs_matrix[_eop]
# c6: Sgp4::new_at
# c7: Sgp4::propagate_at
# c8: jd2::Jd2::from_utc_calendar
# c9: dtf2d
# c10: jd2::utc_to_tai
# c11: tai_to_utc
# c12: utc_to_ut1
# c13: utcut1
# c14: tai_to_tt
# c15: jd2::earth_rotation_angle
seg-016507ccdb8f = Nuevos <c1/>, <c2/>, <c3/>, <c4/> y <c5/>; <c6/> y <c7/> reciben épocas en dos partes. Nuevos <c8/> (convención <c9/> de SOFA para los días con segundo intercalar), <c10/>, <c11/>, <c12/> (a través de TAI, como <c13/> de SOFA), <c14/> y un <c15/> en dos partes.

# text
# c1: leo-pvt
# c2: leo_fusion::polar::latitude_sweep_at
seg-158c39fff817 = El modo polar de <c1/> propaga con SGP4 en 2026-01-01T00:{ "00" }:{ "00" } UTC sobre la cadena IAU (<c2/> acepta cualquier época); el generador Walker SGP4 gira al marco fijo a la Tierra a través de la cadena IAU.

# text
# c1: passes
# c2: passes::predict_passes_apparent
# c3: apparent_look_angles
# c4: refraction
# c5: light_time
# c6: ut1_minus_utc_s
# c7: xp_arcsec
# c8: yp_arcsec
# c9: passes::predict_passes
seg-86ecad91a601 = El tipo de escenario <c1/> ejecuta un nuevo predictor de pasos aparentes (<c2/>, <c3/>): SGP4 sobre la cadena IAU, refracción ITU-R P.834-9 y el tiempo de luz del enlace descendente (nuevos interruptores <c4/> y <c5/>, activados por defecto), parámetros de orientación de la Tierra (<c6/>, <c7/>, <c8/>, por defecto { "0" }), cruces resueltos hasta { "1e-7" } s y la culminación mediante búsqueda de sección áurea. El <c9/> geométrico no cambia.

# text
# c1: tests/no_private_models.rs
seg-9ce091899bf1 = <c1/> impide que los núcleos de geometría, tiempo y propagación del paquete lleven una propagación kepleriana propia, tasas de J2 seculares o una rotación solo de tiempo sidéreo; los niveles rápidos con nombre y la física que es el objeto de una fila son excepciones razonadas.

# text
# c1: dtf2d
# c2: utctai
# c3: taiutc
seg-cf4ae964c5d1 = Nueva fila VALIDATED "Fechas julianas en dos partes y segundos intercalares en la vía de tiempo de órbita terrestre": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> en { "224" } instantes alrededor de los { "27" } segundos intercalares dentro de { "1e-6" } s (preregistrada e947e69d); peor caso { "1.9e-11" } s.

# text
# c1: c2t06a
# c2: pnm06a
# c3: ee06a
seg-c0dec16ea932 = Nueva fila VALIDATED "Una única vía de órbita terrestre": posiciones TEME de { "232" } conjuntos de elementos frente a python-sgp4 { "2.24" } (el SGP4 de referencia de Vallado) dentro de { "6.1e-8" } m (umbral { "1" } cm), y las rotaciones GCRS -> ITRS y TEME -> ITRS frente a <c1/>, <c2/> y <c3/> de ERFA dentro de { "2.9e-6" } mas y { "0.41" } mas (umbrales { "0.1" } y { "2" } mas), con parámetros de orientación de la Tierra (preregistrada 72ea9eb0). Comunicado: la primera ejecución falló en 2016-12-31T23:{ "59" }:{ "59.5" } por un segundo de rotación; UT1 se tomó de la fecha juliana cuasi UTC en un día con segundo intercalar, el motor ahora pasa por TAI, y la segunda ejecución coincide con los umbrales sin cambios.

# text
seg-a72ccdc2516e = M131 "Cobertura LEO y dilución de la precisión para usuarios polares y árticos frente a GNSS MEO" pasa a VALIDATED: Orekit { "13.1.8" } toma los estados GCRS del motor, los rota y calcula la visibilidad y el DOP (NumPy para grupos de varios relojes); posiciones dentro de { "6.8e-5" } m (umbral { "0.2" } m), recuentos de satélites a la vista idénticos en 4040/4040 muestras, DOP mediano dentro de { "2.3e-11" } en términos relativos.

# text
seg-db498ac8e135 = Nueva fila VALIDATED "Predicción de pasos aparentes por una estación terrestre con refracción y tiempo de luz": Orekit { "13.1.8" } propagando los mismos conjuntos de elementos en un TEME que construye según la definición indicada, con refracción ITU-R P.834 y su modelo de medición de tiempo de luz, sobre { "60" } casos en estaciones a nivel del mar: { "1210" } pasos, cruces dentro de { "3.4e-6" } s (umbral { "5" } ms), elevación máxima dentro de { "5.5e-7" } grados, dirección aparente dentro de { "8.8e-7" } grados (umbral { "1e-4" } grados).

# text
seg-ab87bb0ee63d = Hallazgos, mantenidos fijados: las primeras comparaciones de la afirmación completa frente a Orekit de extremo a extremo no alcanzaron sus umbrales de posición y de dirección, no por el motor sino porque el SDP4 de Orekit { "13.1.8" } se aparta del SGP4 de referencia para órbitas de espacio profundo circulares (e = { "0" }) (hasta { "67" } m) y su TEME por defecto se construye sobre la nutación IERS { "1996" } (IAU { "1980" }), a unos { "72" } milisegundos de arco de la cadena IAU 2006/2000A ({ "2.7" } m en LEO). El coeficiente de refracción ITU-R P.834 de Orekit para h*theta0^{ "2" } es { "0.011380" } donde la Recomendación imprime { "0.01380" }; la comparación se hace a nivel del mar, donde el término se anula, y la diferencia por encima queda fijada.

# text
# c1: passes::predict_passes
# c2: passes
seg-49978e6a73b2 = "Predicción de pasos por una estación terrestre (segmento terreno)" sigue siendo VALIDATED con su afirmación limitada al <c1/> geométrico; el tipo de escenario <c2/> pertenece a la nueva fila.

# text
# c1: xval/d8-orekit13/setup.sh
seg-60d6ac0011f1 = Entorno de la referencia independiente: Orekit { "13.1.8" } con Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

# text
# c1: scenarios/passes.toml
# c2: passes
# c3: docs/examples/multi-tool-pipeline.md
# c4: passes
# c5: docs/CAPABILITY.md
# c6: polar-arctic-leo-coverage
seg-532e10ead5a2 = Revisiones: el <c1/> incluido pasa de un acceso total de { "1675" } s a { "1659" } s (cinco pasos como antes; mejor elevación máxima { "73.25" } grados -> { "70.08" } grados), y todas las salidas de <c2/> se mueven con la nueva vía (la línea impresa en <c3/> y la entrada <c4/> de <c5/> ahora lo indican); el VDOP GNSS de <c6/> incluido en el ecuador { "1.19669" } -> { "1.19710" }, a { "89.9" } grados { "1.50645" } -> { "1.50590" }, VDOP fusionado a { "89.9" } grados { "1.14388" } -> { "1.14250" } (las cifras publicadas con dos decimales { "1.20" }, { "1.51" } y { "1.14" } no cambian). No cambia ningún archivo golden.

# text
# c1: leo_pass
# c2: leo-pvt
# c3: leo_navmsg
# c4: leo_link::geometry
# c5: leo_fusion::geom
# c6: constellation-design
seg-b65f3186a7e9 = Todavía sin encaminar: <c1/>, los modos doppler, joint y timing de <c2/> y la órbita de verdad de referencia de <c3/> (sus modelos viven en <c4/> y <c5/>), y los diseños terrestres de <c6/> (un nivel rápido de dos cuerpos con nombre).

# text
seg-03f638f20376 = D6, generador de referencia LunaNet AFS, LSIS V1.0 (cuatro filas nuevas, dos VALIDATED: { "238" } -> { "242" } filas, validadas { "121" } -> { "123" }).

# text
# c1: lunar_afs
# c2: xval/lunar-afs/fetch_lsis.sh
# c3: lunar_afs::lsis
seg-1d09f0582781 = <b>Generador de referencia de LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), fijado al LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 del { "29" } de enero de { "2025" } y que nombra esa versión en cada salida: la portadora de { "2492.028" } MHz; el canal de datos AFS-I BPSK({ "1" }) a { "500" } símbolos por segundo con su código Gold de 2046 chips; el piloto AFS-Q BPSK({ "5" }) con sus códigos primario de Weil de 10230 chips, secundario de 4 chips y terciario de 1500 chips; la trama con identificador de trama { "0" } (patrón de sincronización, subtrama { "1" } BCH ({ "51" }, { "8" }), CRC-24, subtramas LDPC de tasa un medio { "2" } a { "4" }, entrelazador de bloques de { "60" } por { "98" }) con un decodificador exhaustivo de la subtrama 1 y un decodificador LDPC min-sum escrito solo a partir de la matriz de comprobación de paridad; y síntesis de IQ en banda base con etiquetas de verdad de referencia escrita como una grabación SigMF. Los códigos se generan a partir de los registros de desplazamiento y de las construcciones de Legendre/Weil del estándar. No se redistribuye nada copiado del estándar (que no contiene términos de reutilización): los índices primarios de AFS-Q proceden de IS-GPS-800J, y lo que solo definen los anexos del estándar (retardos G2 de AFS-I, códigos terciarios, submatrices LDPC) se lee en tiempo de ejecución de una caché local que <c2/> rellena desde el PDF alojado por la NASA, con cada archivo comprobado frente a un SHA-256 fijado (<c3/>). El modelo es una referencia de ajuste a la norma, no un modelo de canal, de propagación ni de balance de enlace.

# text
# c1: sigmf::meta_to_json_with_extensions
# c2: sigmf::annotation_extension_fields
# c3: core:extensions
seg-7b8cb0461377 = <c1/> y <c2/>: una grabación puede llevar campos de extensión con espacio de nombres declarados en <c3/>.

# text
seg-a9465820a1fc = Nueva fila VALIDATED "Representación en banda base de LunaNet AFS frente a un generador independiente, dado su estado de canal": frente a LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, compilación de banda S), cero discrepancias de chips en los códigos de los PRN { "1" } a { "210" }, cero discrepancias de símbolos en las tres tramas de la ejecución, y una correlación compleja normalizada de { "0.999990" } sobre { "23.9" } s de sus propias muestras (peor bloque de { "2" } ms { "0.999948" }), dentro de umbrales fijados antes de la comparación (preregistrada 986ac280). Maneja el renderizador con el propio estado de canal del simulador y no cubre el reparto de potencia a partir de la densidad de portadora a ruido ni la escritura en SigMF y en 8 bits.

# text
seg-07edced2764a = Nueva fila VALIDATED "Codificación de canal de tramas de LunaNet AFS, FID { "0" }": las tramas de 6000 símbolos son iguales a las de LANS-AFS-SIM símbolo a símbolo (preregistrada 986ac280); el código de la subtrama 1 reproduce el ejemplo resuelto de la Figura { "8" } del LSIS y el CRC-24 el valor de comprobación del catálogo CRC-24/LTE-A.

# text
# c1: xval/lunar-afs/fetch_lsis.sh
seg-ab94ac9f41fc = Ambas filas promovidas están sujetas a datos en la caché de LSIS: su prueba de referencia independiente se omite con un aviso hasta que se haya ejecutado <c1/>.

# text
seg-89a4bc4a766e = Hallazgo (nueva fila MODELLED), "Generación de códigos de ensanchamiento de LunaNet AFS": de { "2 937 232" } chips y bits generados y comparados con las tablas del estándar y los archivos del Anexo { "3" }, uno difiere: los "últimos { "24" } chips" que imprime la Tabla E-5 para el PRN terciario { "147" }, que duplica la celda del PRN { "151" } mientras que el propio archivo del Anexo { "3" } del estándar coincide con el generador. No se alcanza el criterio de cero discrepancias.

# text
seg-d4e76301323f = Hallazgo (nueva fila MODELLED), "Decodificabilidad en lazo cerrado de LunaNet AFS": tres ejecuciones preregistradas frente a PocketSDR-AFS; la tercera alcanzó íntegramente sus umbrales de seguimiento y decodificación pero no su protección de que una compilación del receptor que solo imprime reproduzca el registro de la compilación fijada, porque dos ejecuciones del receptor sin modificar ya difieren en sus registros de adquisición.

# text
# c1: lunar_service
# c2: export_antenna.carrier_hz
# c3: lunar_jamming
# c4: attack_surface
seg-93cfa05a1923 = Corregido: la portadora por defecto de <c1/> (<c2/>), <c3/> y <c4/> era un valor redondeado de { "2.4" } GHz; ahora es la portadora AFS de LSIS-020, { "2492.028" } MHz. Con el valor por defecto anterior, la pérdida en espacio libre estaba subestimada en { "0.327" } dB.

# text
seg-ed7c170ccc2c = Revisiones: ninguna. Cada escenario incluido nombra su portadora, y los resultados de los { "138" } archivos de escenario son idénticos byte a byte a los del main anterior.

# text
seg-3ec7f5b17122 = D7, IQ lunar real y LNAV de GPS (siete filas nuevas, ninguna VALIDATED: { "242" } -> { "249" } filas, validadas { "123" } sin cambios).

# text
# c1: portable_math::FftPlan
# c2: xval/portable-fft-wasm/
seg-0c3dcf4f2b0f = <c1/>: una transformada rápida de Fourier (FFT) de base mixta cuya salida son los mismos bits en todas las plataformas; una fijación SHA-256 de las transformadas de 8000 y 24000 puntos pasa en x86_64 y en wasm32-wasip1 (ejecutor en <c2/>).

# text
# c1: acquisition
# c2: pcps_acquire
# c3: pcps_grid
# c4: refine
# c5: prompt_series
seg-150d9809c584 = <c1/>: búsqueda paralela de fase de código sobre IQ muestreado (<c2/>, <c3/>) con plegado coherente, acumulación no coherente, un umbral chi-cuadrado para una probabilidad de falsa alarma de toda la búsqueda y un estadístico de promediado por celdas para ruido de banda limitada; <c4/>, <c5/> con Doppler de código, y los estimadores de densidad de portadora a ruido (C/N0) M2M4 y de pico de malla.

# text
# c1: gps_lnav
seg-46bda8ecf2cd = <c1/>: un codificador del mensaje de navegación heredado (LNAV) de IS-GPS-200 para las subtramas { "1" } a { "3" }, con la paridad de la Tabla 20-XIV y un decodificador de campos.

# text
# c1: realdata::ion_sdr
# c2: .sdrx
# c3: to_mid_rise
seg-43444792974c = <c1/>: un lector del ION GNSS SDR Metadata Standard (<c2/>) y de sus archivos de muestras, con <c3/> para niveles en complemento a dos.

# text
# c1: realdata::lugre
# c2: .sdrx
seg-a7dfc3475923 = <c1/>: la cabecera de lote IQS de LuGRE (Lunar GNSS Receiver Experiment), la telemetría RAW, ACQ y NAV y los archivos CLK, y una comprobación que lista dónde los metadatos de <c2/> contradicen la cabecera binaria.

# text
# c1: antenna::GainPattern2D
# c2: earth_gnss_lunar
# c3: transmit_side_db
seg-f0125531c4f8 = <c1/> y, en <c2/>, el marco del cuerpo con guiñada dirigida, los ángulos de acimut de transmisión y fuera del nadir, y <c3/> para el C/N0 relativo con diagramas medidos.

# text
# c1: tests/gps_lnav_rtklib_integer_oracle.rs
seg-679aa02de1d0 = Codificación del mensaje de navegación LNAV de GPS (nueva fila, sigue siendo MODELLED tras la verificación posterior del integrador): en el archivo de difusión de IGS del { "2" } de marzo de { "2025" }, analizado y decodificado por RTKLIB v2.4.2-p13, las { "960" } palabras pasan la paridad, las { "96" } subtramas se decodifican y los { "608" } enteros de difusión son iguales a los de Kshana (<c1/>), pero el preregistro (d4d9eb9d) llegó a la rama pública dos segundos después del commit que contenía el resultado, de modo que no puede demostrarse el orden "registrado antes de obtener el archivo" y la fila no se promueve.

# text
# c1: realdata::ion_sdr
# c2: SdrLayout::fill_lsb_first
seg-2875ba2d8f5f = <c1/> rellena las palabras desde el bit más significativo (I en el nibble alto de un byte de LuGRE; la lectura anterior producía la señal conjugada), conserva la lectura antigua como <c2/> y lee muestras más anchas que una palabra.

# text
# c1: acquisition::refine_doppler_coherent
seg-f6e0e3b9b166 = <c1/>: refinamiento Doppler coherente en fase ({ "0.2" } Hz RMS a { "30" } dB-Hz sobre { "200" } ms en simulación).

# text
seg-b0f6a61acce0 = GPS L1 C/A frente a gps-sdr-sim: chips y bit de paridad exactos bit a bit; { "230" } de { "1152" } campos LNAV difieren en una unidad porque gps-sdr-sim trunca donde el entero de difusión necesita redondeo.

# text
seg-1c525ca495c0 = LNAV decodificado por RTKLIB: toda la paridad y todas las subtramas pasan y cada parámetro queda dentro de medio cuanto; { "41" } valores escalados difieren en unas pocas unidades del último lugar por la constante decimal { "2" }^-43 de RTKLIB, por encima del umbral registrado.

# text
seg-14e26e69777b = Adquisición de LuGRE frente a GNSS-SDR { "0.0.19" }: { "266" } de { "266" } decisiones coinciden, { "250" } localizadas en la misma celda; la mayoría de los positivos son artefactos de una media de −{ "0.5" } en los niveles de 4 bits en bruto; la rama de C/N0 no tuvo datos de vuelo contemporáneos. Dos lotes (OP5, OP12) se excluyeron por error: sus metadatos coinciden con sus cabeceras, pero el lector no podía entonces leer una muestra más ancha que una palabra.

# text
seg-3a32ff9d66fc = Adquisición de LuGRE frente al Doppler predicho por la órbita: con la decisión por potencia de muestra, toda búsqueda cruza sobre ruido de banda limitada; con la decisión por promediado por celdas, los pares más fuertes coinciden en magnitud con el signo invertido, lo que muestra que el orden I/Q registrado es el conjugado de los datos.

# text
seg-2bb618ba4059 = Adquisición a ciegas en los lotes de la superficie lunar: cuatro lotes adquieren cada uno un satélite (predicho visible, sin falsa alarma a { "1e-7" }), ninguno dos, de modo que el umbral de diferencia de Doppler no tiene ningún par que puntuar.

# text
seg-f95606e17fd1 = C/N0 relativo a distancia lunar (M039 reformulada): { "15" } registros Block IIR/IIR-M y un par, demasiado pocos para el umbral registrado.

# text
seg-9306cf44fc44 = Revisiones: ninguna; no cambia ninguna cifra publicada, archivo golden ni figura de la documentación.

# text
seg-2a3cb68c94d6 = La fila M039 "GNSS terrestre a distancia lunar" reformula su afirmación a distancia lunar como el C/N0 relativo entre satélites en una misma época más la visibilidad (no se afirma el C/N0 absoluto); sigue siendo MODELLED. El NOTICE de nivel superior incluye la atribución CC BY { "4.0" } de LuGRE.

# text
seg-e1e4094a186a = La orientación de ejes principales lunares de DE440 ahora se interpola a lo largo de la geodésica entre nodos diarios. La interpolación anterior, elemento a elemento, tenía un error de hasta { "2.0e-4" } rad ({ "340" } m en la superficie lunar) cerca de los puntos de cuarto de cada día, no los "unos { "14" } m" que indicaba la fila. Sus usuarios (geometría de telemetría láser lunar, datum lunar, observabilidad de fallos lunares) obtienen la orientación corregida.

# text
# c1: snapshot_raim
seg-a2071d345923 = Correcciones del motor de la ronda { "2" }, cada una repetida frente a su tolerancia preregistrada sin cambios: la versión de IERS de una fila de EOP se lee de sus indicadores I/P y no de un bloque en blanco del Boletín B; <c1/> usa el nivel local geodésico; el acoplamiento lunar del marco de tasa usa el radio ecuatorial, J2 y la rotación; el ajuste liu22 parte de correcciones nulas sin a priori y usa la tasa de movimiento medio del artículo; el espaciado de nodos de EO incluye la regresión nodal de J2; el tiempo de deslizamiento de ciclo de Costas usa rho/4; la solución conjunta aplica el retardo de grupo de difusión del par; la solución conjunta lunar usa un paso QR; la cota de NTN se evalúa en la posición verdadera; la referencia de reloj del diseño de constelaciones es la constelación de menor número a la vista; la serie de orientación de DE440 abarca 2014-2030 y da error fuera de ese intervalo en lugar de saturarse.

# text
# c1: leo_navmsg::truth::TruthOrbit::from_ecef_states
seg-74f397ad9c16 = <c1/>, una órbita de verdad de referencia construida a partir de estados tabulados fijos a la Tierra, usada por la comparación del ajustador de órbitas reales.

# text
# c1: NOTICE.md
seg-7293b717d978 = Los archivos de prueba y los archivos auxiliares de las comparaciones anteriores, cada uno con su generador y un <c1/> que indica la fuente, la licencia, la fecha de obtención y el SHA-256.

# text
# c1: araim_reference::add_v42_protection_levels
# c2: _ecef
# c3: raim::snapshot_raim_fde
# c4: cw_dynamics::second_order_correction
# c5: propagate_second_order
# c6: inertial::coast::ErrorDynamics
# c7: lunar_vlbi::KernelGeometry
# c8: lunar-vlbi
# c9: naif_kernel
# c10: lunar_llr_geometry::llr_bcrs_one_way_m
# c11: solar_system::link_on
# c12: launch::site_rotation_speed_at
# c13: eo_payload::j2_nodal_period
# c14: ground_track_spacing_equator_j2
# c15: batch_ls::gauss_newton_qr
# c16: precise_products
seg-920fe965bda9 = Ronda { "2" }: <c1/> y <c2/> (detección de fallos ADD v4.2, siguiendo a Stanford MAAST para ARAIM { "2" }, aviso BSD-3 en el código fuente); <c3/>; <c4/> y <c5/>; el modelo de error de INS de nueve estados <c6/>; los parciales de <c7/> y las entradas de <c8/> en la vía de kernel; <c9/>, un lector de kernels SPK tipo { "2" } y PCK binarios; <c10/> con estaciones ITRF2020; densidad de Jacchia { "1971" }; <c11/> sobre cualquier proveedor de efemérides; <c12/>; <c13/> y <c14/>; <c15/>; <c16/> (lectores de reloj RINEX, ANTEX y DCB).
