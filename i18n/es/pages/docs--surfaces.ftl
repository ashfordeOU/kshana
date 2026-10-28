# docs--surfaces: translations (es)

# text
seg-f917e7fcac09 = Qué es

# text
seg-76dc5d9ec114 = JetBrains

# text
seg-379f49bff6fb = Python

# text
seg-2bd2101ce454 = Superficie

# text
seg-d6476863f862 = Capacidad

# text
seg-e0426ffe2628 = Nota

# text
seg-de6c33774c9c = CLI

# text
seg-98f4f946a7ac = WASM

# text
seg-206c78a69ded = Exposición de ruta

# text
seg-4dbf41c0ec3b = Función

# text
seg-d5b5bdf6081c = Rust

# text
seg-40a7552d2ba9 = MCP

# text
# c1: docs/SURFACES.md
seg-1194bde1c9df = Fuente: <c1/>

# text
# c1: kshana::surface
seg-4d8a164605fb = Cada capacidad está disponible en las superficies donde tiene sentido; donde una superficie no puede soportar una capacidad, la celda indica <b>N/A</b> y el motivo. El mismo motor funciona detrás de todas las superficies: los puntos de entrada de Python, WebAssembly y MCP para las { "0.35" } capacidades son envoltorios finos sobre <c1/>, que llama al código que ejecuta la línea de comandos.

# text
seg-8a7389e86887 = Aquí se omite un pasaje que nombra clientes de IA de terceros; está en <a1>docs/SURFACES.md</a1> en GitHub.

# text
seg-d18c05fd2838 = Plugin

# text
seg-d78822583c64 = Notebook

# text
seg-334caeae9fba = Studio

# text
seg-00c6ee5bf2ea = Confianza del receptor de un buque, registro por lotes (puntuación de 0-100, motivos)

# text
# c1: /kshana-assess-receiver
# c2: vessel-receiver-trust
seg-b43593b3ede8 = <c1/>, skill <c2/>

# text
seg-6f33cfd0477e = Assess Receiver Trust

# text
seg-3d7149c8caba = Página de confianza marítima

# text
seg-892f8b2c1dc9 = Confianza del receptor sobre un fragmento acotado de flujo (puntuaciones, estados, motivos; sin compuerta)

# text
seg-e9f5fc58fe12 = igual

# text
seg-b3ff5c36ef39 = Assess Receiver Stream (un registro almacenado)

# text
# c1: geometry
# c2: label
# c3: geometry
# c4: monitors_run
# c5: class
# c6: geometry_model
# c7: geometry_summary
seg-0b94fa406ab3 = Geometría de satélites y clases de deducción ({ "0.36" }: <c1/> buena/degradada/desconocida con motivos y DOP, una <c2/> buena/aceptable/mala que siempre se informa, el monitor <c3/> (nada salvo que la geometría sea mala, y entonces hasta { "15" } puntos; figura el último en <c4/> cuando decidió, de modo que el recuento de monitores del veredicto incluye la geometría), una <c5/> en cada deducción, <c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: receiver-trust live
# c3: $PKSHT
seg-611550e6f227 = <c1/>, <c2/> (en el JSON de resultado y en cada línea JSON; el CSV, el SVG, el veredicto de una línea y <c3/> llevan una deducción de geometría como cualquier otra y, por lo demás, no cambian)

# text
# c1: receiver_trust::geometry
# c2: EpochTrust
# c3: Deduction
# c4: EpochReport
seg-863e12c6ef61 = <c1/>, en <c2/>, <c3/> y <c4/>

# text
# c1: receiver_trust
# c2: assess_vessel_log
# c3: receiver_trust_replay
seg-4d764d29cebe = <c1/>, <c2/>, <c3/> (en los diccionarios devueltos)

# text
seg-3e381a941742 = los mismos tres (en el JSON devuelto)

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
# c4: geometry_model
# c5: geometry_summary
# c6: trust_telemetry
seg-8411558f9852 = <c1/>, <c2/>, <c3/> (en la respuesta; la respuesta de un registro de buque conserva <c4/> y <c5/>); <c6/> lo representa

# text
# c1: vessel-receiver-trust
# c2: trust-telemetry
seg-d397f9a330d2 = igual, skills <c1/>, <c2/>

# text
seg-95093013d169 = las acciones anteriores imprimen la salida de la CLI, que lo incluye

# text
# c1: vessel-trust-and-training
seg-f0bc22ec95d3 = <c1/> (en el resultado que carga)

# text
# c1: docs/MARITIME-TRUST.md
seg-86c0548edb03 = <b>pending</b>: la página de confianza marítima aún no lo muestra (campos enumerados en <c1/>, elemento { "6" } de la vista de Studio)

# text
# c1: receiver-trust live
# c2: --gate
# c3: --listen
seg-dffdbf379423 = <c1/> como proceso en ejecución (stdin, archivo seguido, TCP, UDP, <c2/>, <c3/>)

# text
seg-bb4f68155884 = Tools: tarjeta Command line (el comando que se ejecuta; un navegador no es un proceso en la ruta de los datos)

# text
# c1: lab-attestation
seg-a783976420e6 = Paquete de evidencias: crear (firmado, ventana de un registro; { "0.38" }: un <c1/> opcional, la declaración del operador sobre una configuración de laboratorio, registrada en el manifiesto firmado y nunca verificada)

# text
seg-65826be9b437 = <b>N/A</b> (clave de firma)

# text
# c1: /kshana-evidence-pack
# c2: evidence-pack
seg-95395e63565d = <c1/>, skill <c2/>

# text
seg-cc9b1d83ed15 = Create Evidence Pack (sin campo de atestación en el cuadro de diálogo en { "0.38" }: <b>pending</b>; la línea de comandos lo admite)

# text
seg-70534bdc6c87 = <b>N/A</b> (una clave de firma no debe estar en una página); Tools: tarjeta Command line

# text
# c1: import
# c2: score
seg-83d9a9e9603a = Jammertest como árbitro ({ "0.38" }): el catálogo publicado de NPRA y el plan de transmisión se leen como verdad programada (<c1/>), y un registro de receptor se puntúa frente a ellos por ensayo (<c2/>: latencia de detección, omisiones, falsas alarmas, tiempo de recuperación; MODELLED)

# text
# c1: /kshana-jammertest
# c2: jammertest
seg-38dcbafd214a = <c1/>, skill <c2/>

# text
seg-c61ff1d0f579 = <b>N/A</b> (necesita los archivos del plan y un registro en disco; ejecútelo desde un terminal)

# text
seg-5a9087e23823 = <b>N/A</b> (todavía no hay notebook)

# text
seg-c92ea39fb2d1 = <b>pending</b>: una tarjeta Tools para la línea de comandos (la franja y las vistas de Studio son de WS-A)

# text
# c1: jammertest score --key
# c2: config.json
seg-3eae6f848b58 = Paquete firmado de puntuación de Jammertest (<c1/>: el paquete de evidencias de confianza del receptor con el cuadro de puntuación y el calendario dentro de <c2/>)

# text
# c1: create_evidence_pack
seg-f1695a89c33b = <b>N/A</b> (clave de firma: use <c1/> sobre una ventana, o la línea de comandos)

# text
# c1: spoofDetState
# c2: self_report
# c3: receiver_self_report
seg-a3655f428a0c = Autoinforme del receptor ({ "0.38" }): UBX-NAV-STATUS <c1/> y UBX-SEC-SIG se leen en <c2/> en cada época, y la comparación <c3/> (ambos / solo el receptor / solo Kshana / ninguno) en el resultado; no genera ninguna alarma y no cambia ninguna puntuación

# text
# c1: receiver-trust
# c2: jammertest score
seg-b0190b99d9fd = <c1/> (en el JSON de resultado; <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-70c1a825afa5 = <c1/>, <c2/> (en los diccionarios devueltos)

# text
# c1: receiver_trust
seg-0cd306174106 = <c1/> (en el JSON devuelto)

# text
# c1: assess_receiver_log
seg-0b7d16c95d12 = <c1/> (en la respuesta)

# text
# c1: epochs[].self_report
seg-833ac4d6bded = <b>pending</b>: la franja de la página Trust (WS-A; el campo es <c1/>)

# text
seg-c56746c298f2 = Formato de registro SBF de Septentrio ({ "0.38" }, solo lectura: PVTGeodetic, MeasEpoch, RFStatus)

# text
# c1: receiver-trust
# c2: [log] format = "sbf"
seg-1f4c22e8bf78 = <c1/> con <c2/>

# text
# c1: receiver_trust
# c2: assess_receiver_log
# c3: format = "sbf"
# c4: base64
seg-741ee07949d0 = <c1/>, <c2/> (<c3/>, registro como <c4/>)

# text
seg-003608556fc0 = igual

# text
seg-ae8bf32d890b = las acciones anteriores

# text
seg-20f086cdea29 = <b>N/A</b> (la página Trust no ofrece la carga de registros binarios en { "0.38" })

# text
# c1: receiver-trust live --serial <device> [--baud n]
# c2: --configure
seg-1303f81c2407 = <c1/>: una fuente NMEA serie o USB, solo lectura (abre el dispositivo para leer, nunca escribe en el receptor; <c2/> se rechaza)

# text
seg-59610023b124 = <b>N/A</b> (un dispositivo y un proceso)

# text
seg-1fcba825118e = Paquete de evidencias: crear (firmado, ventana de un registro)

# text
seg-fa4022137830 = Create Evidence Pack

# text
seg-e6b694a68935 = Paquete de ida y vuelta de laboratorio (escenario, condiciones de ensayo, registro del receptor y puntuación vinculados por hash)

# text
seg-bfcfc5d28be8 = <b>N/A</b> (las acciones de JetBrains están ligadas a un único archivo seleccionado; el paquete necesita un escenario, unas condiciones, un registro y una clave: ejecútelo desde el terminal del IDE)

# text
seg-7942dacc8476 = Paquete de evidencias: verificar

# text
seg-93a0c989870b = Verify Evidence Pack (solo con clave fijada)

# text
seg-bf617fa341c8 = Tools: Evidence packs (verificar, adjuntar marca de tiempo)

# text
# c1: format = "mqtt"
# c2: --mqtt-tcp
seg-49df5efbbd2b = Telemetría de confianza (Prometheus, syslog CEF/LEEF, OTLP; { "0.38" }: <c1/>, descubrimiento de Home Assistant y líneas de estado; <c2/> publica desde la CLI)

# text
# c1: trust_telemetry
seg-60d46f0e3ead = <c1/> (salida de texto; sin socket)

# text
# c1: /kshana-trust-telemetry
# c2: trust-telemetry
seg-45ee1c8b6f70 = <c1/>, skill <c2/>

# text
seg-9eff7c00723a = Render Trust Telemetry (un resultado almacenado)

# text
seg-1b60ff4652cd = Tools: tarjeta Telemetry (pestaña Command line; solo formatos, sin sockets)

# text
# c1: receiver-trust
# c2: rtklib-pos
# c3: novatel
# c4: gnss-sdr
# c5: [log.imu]
# c6: csv
# c7: euroc
seg-3e332170d963 = Entradas de máquina y de sensor ({ "0.38" }): <c1/> formatos <c2/>, <c3/>, <c4/> y <c5/> (<c6/>, <c7/>)

# text
# c1: receiver-trust
# c2: [log] format
seg-060e5931ac62 = <c1/> (escenario <c2/>)

# text
# c1: receiver_trust
# c2: assess_receiver_log
seg-9dad5918cbf9 = <c1/>, <c2/> (en línea)

# text
# c1: receiver_trust
seg-de4cb342c417 = <c1/> (en línea)

# text
# c1: assess_receiver_log
# c2: path
seg-4b6a73f5dc13 = <c1/> (texto/base64 en línea; un <c2/> se rechaza)

# text
seg-4c6056fb8884 = <b>N/A</b> (la página Trust de Studio lee los formatos que enumera; los formatos nuevos llegarán con su próximo traslado)

# text
# c1: [accel_classical]
seg-5d69867fc6f8 = Registro IMU a parámetros de sensor híbrido/de fusión (tabla <c1/> a partir de un registro estacionario, ajuste de Allan)

# text
seg-426814dbf8dd = <b>N/A</b> (todavía no hay acción de IDE)

# text
seg-e8477119c213 = <b>N/A</b> (el editor de escenarios de Studio admite la tabla pegada)

# text
# c1: trust-telemetry --mqtt-tcp
# c2: integrations/ros2
# c3: integrations/gnss-sdr
seg-7cacfab5931c = Nodo ROS { "2" }, repetidor UDP de GNSS-SDR, <c1/> (<c2/>, <c3/>)

# text
seg-70e2e895a01f = procesos

# text
# c1: trust_telemetry
# c2: mqtt
seg-c1ad125a051e = <b>N/A</b> (procesos de larga duración y sockets; formas de texto: <c1/> con <c2/>)

# text
# c1: docs/OSNMA.md
seg-7527df567fc3 = Verificación OSNMA de Galileo de páginas I/NAV o de un flujo UBX (<c1/>)

# text
seg-e5295f10cf3f = <b>N/A</b> (un flujo largo de receptor sin procesar conviene a la CLI y a Python; una herramienta de agente añadiría una superficie de entrada grande sin ningún beneficio)

# text
# c1: kshana osnma verify
seg-32560c9024ff = <b>N/A</b> (los comandos del plugin se ejecutan sobre el servidor MCP, que no tiene herramienta OSNMA por el motivo indicado en la celda de MCP; ejecute <c1/>)

# text
# c1: kshana osnma verify
seg-e4b399062eca = <b>N/A</b> (el resultado no significa nada sin una raíz de Merkle o una clave pública de confianza obtenidas del ICD por otra vía y, para la vigencia, una hora de referencia independiente; una acción de clic derecho no tiene dónde recibirlas, y un valor predeterminado sin fijar se leería como verificación; ejecute <c1/>)

# text
seg-dac011642033 = <b>N/A</b> (entra un flujo, sale un informe JSON; sin notebook)

# text
seg-dbe4907cd74c = Tools: OSNMA

# text
seg-5ee6c4f68127 = NMEA de entrenamiento con un registro del instructor

# text
# c1: /kshana-training-scenario
# c2: training-nmea-scenario
seg-e321d52ad21d = <c1/>, skill <c2/>

# text
seg-79776273210a = Generate Training NMEA

# text
seg-899995619176 = Página de análisis posterior del entrenamiento

# text
seg-9cb27f0adfb3 = NMEA de entrenamiento transmitido a una dirección TCP o UDP

# text
seg-71e498158f5d = Tools: tarjeta Command line (transmite a una dirección)

# text
seg-6a3b4cf33177 = Mapa de interferencias (ADS-B, AIS)

# text
# c1: /kshana-interference-map
# c2: interference-map-route-exposure
seg-3d7c2700cf7d = <c1/>, skill <c2/>

# text
seg-3740aafd1749 = Build Interference Map

# text
seg-b164d99daf08 = Página del mapa de interferencias

# text
seg-81d53d4f3a11 = Route Exposure

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-c73605fe5e59 = Plugin de Signal K y alimentación de compuerta de OpenCPN (<c1/>)

# text
seg-10037d51a377 = <b>N/A</b> (procesos)

# text
# c1: /kshana-marine-integrations
# c2: marine-integrations
seg-0360c13bb637 = solo guía práctica: <c1/>, skill <c2/>

# text
seg-e3acebdb4cd0 = Tools: tarjeta Command line (guía práctica; un despliegue)

# text
seg-38fafad3482b = Exportación de test-bench (CSV de movimiento, NMEA, puntos de ruta, eventos para un simulador de laboratorio)

# text
# c1: /kshana-bench-export
# c2: test-bench-export
seg-ffe594484ff8 = <c1/>, skill <c2/>

# text
seg-af0be6bf84c7 = Export Test-Bench Files

# text
seg-e676bae4b98d = Tools: Test-bench export

# text
seg-394eee3f0c0f = Correspondencia de compliance a partir de ejecuciones (a qué filas de marcos públicos aportan evidencias a favor las ejecuciones)

# text
# c1: /kshana-compliance-report
# c2: compliance-mapping
seg-c7782a49a50e = <c1/>, skill <c2/>

# text
seg-a97d66893e2c = Build Compliance Report

# text
seg-314d03d7d075 = Tools: Compliance mapping

# text
seg-02601f519c92 = Tablas y fuentes de la correspondencia de compliance

# text
seg-31d29baca4c2 = Show Compliance Mapping

# text
seg-01418b04e9bf = Paquetes de normas (conjuntos de escenarios puntuados con umbrales fijados antes de la ejecución: perfiles de ensayo DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Apéndice F)

# text
# c1: kshana standards-pack
seg-72ea3b5bf39d = <b>N/A</b> (las acciones de JetBrains están ligadas a un archivo seleccionado; los paquetes están incorporados y no necesitan ninguno: ejecute <c1/> desde el terminal del IDE)

# text
seg-731504a1218f = <b>N/A</b> (las tarjetas Tools de Studio para paquetes pertenecen al flujo de trabajo de Studio; la CLI o la salida de cualquier superficie alimenta la tarjeta Compliance mapping)

# text
# c1: docs/LUNANET-AFS.md
seg-ffab4fc439d9 = LunaNet Augmented Forward Signal: códigos, SB1/CRC/entrelazador y una comprobación frente a LSIS-AFS V1.0 (<c1/>)

# text
# c1: lunanet-afs-check
# c2: lunanet-afs-i
# c3: lunanet-afs-q
# c4: iq scene/acquire/track/sweep
seg-c348615fae6f = <c1/>; señales <c2/>, <c3/> en <c4/>

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-a4f461bbd9fa = <c1/>, <c2/>, <c3/>; <c4/> etc. con los dos nombres de señal

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: iq_scene
seg-3fddaefc42f4 = <c1/>, <c2/>, <c3/>; <c4/> etc. mediante las ejecuciones breves en memoria

# text
# c1: kshana lunanet-afs-check
seg-338350a8097c = <b>N/A</b> (las acciones de JetBrains están ligadas a un archivo seleccionado; ejecute <c1/> desde el terminal del IDE)

# text
seg-01a840e0bdc8 = <b>N/A</b> (una tarjeta de Studio es un elemento del flujo de trabajo de Studio; la CLI y todas las demás superficies lo incluyen)

# text
# c1: docs/SKYLINE.md
seg-d04d7f608263 = Geometría del cielo bajo un perfil del horizonte: satélites visibles y enmascarados, DOP, covarianza ENU, elipse de error (<c1/>)

# text
# c1: /kshana-run
seg-9dfe4289533b = <c1/> (remite a la herramienta)

# text
# c1: kshana sky
seg-f21f2810b363 = <b>N/A</b> (un skyplot interactivo es una vista de navegador; <c1/> cubre los números)

# text
seg-f923796dab30 = — (la vista Geometry de Studio se añade por separado en { "0.36" })

# text
seg-26c89146e670 = Nube Monte Carlo del cielo (errores de mínimos cuadrados con semilla, RMS, contención del { "95" } %)

# text
seg-3627b76a3778 = <b>N/A</b> (muestras en bloque que un agente debe resumir, no transportar)

# text
seg-4ebfbca0614e = <b>N/A</b> (sin herramienta MCP)

# text
seg-8b6155019a17 = <b>N/A</b> (como arriba)

# text
seg-586e8d98ecd9 = — (como arriba)

# text
# c1: docs/SKYLINE.md
seg-ae43880fd2cc = Preajustes y perfiles de horizonte (<c1/>)

# text
seg-ad514737bf83 = Skyplot como SVG

# text
# c1: sky_geometry
seg-9a6087f458bc = <b>N/A</b> (un agente lee los números de <c1/>)

# text
# c1: [skyline]
# c2: user_site
seg-6de10d28a5fc = Sección de horizonte en un escenario (<c1/>: órbita e integridad con <c2/>, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario)

# text
seg-65ffc53b15fa = el archivo de escenario

# text
seg-74fac0bacb76 = Run Kshana Scenario

# text
# c1: optical-atmosphere
# c2: docs/OPTICAL-ATMOSPHERE.md
seg-f71e5e2eb4f3 = Enlace óptico de temporización a través de la atmósfera: disponibilidad por emplazamiento, diversidad de emplazamientos, técnicas de mejora, acoplamiento entre interrupción y holdover (tipo de escenario <c1/>; <c2/>; MODELLED, emplazamientos ILLUSTRATIVE, orientativo)

# text
seg-490147c5e7ec = <b>pending</b>: aún no hay vista de Studio; el escenario se ejecuta en el ejecutor de escenarios de Studio y en la tarjeta Command line de Tools

# text
# c1: holdover-test
# c2: docs/TIMING-HIL.md
seg-de2c788670aa = Prueba de holdover puntuada a partir de un registro de error de tiempo aportado por el operador: línea base, GNSS retirado por el operador, holdover, recuperación, medidos frente a las máscaras de la ITU-T (tipo de escenario <c1/>; <c2/>; MODELLED, orientativo; Kshana no transmite ni controla nada)

# text
# c1: run
# c2: samples
# c3: clock_log.text
seg-3fdb9a269cd0 = <c1/> (<c2/> o <c3/> en línea; las claves de archivo se rechazan)

# text
# c1: run_scenario
seg-d946c75f821a = <c1/> (solo en línea)

# text
# c1: run
seg-b91e77ef7186 = <b>N/A</b> (no hay notebook en { "0.38" }; los escenarios de ejemplo se ejecutan en cualquier notebook mediante <c1/>)

# text
# c1: gnss-ssv
# c2: docs/SSV.md
# c3: xval/gnss-ssv/RESULTS.md
seg-5041a1d6272f = GNSS más allá de la constelación: disponibilidad de señales de GPS, GLONASS, Galileo, BDS, QZSS y NavIC para un usuario en una capa o en una trayectoria de LEO a transferencia lunar (folleto, patrón de transmisión paramétrico o medido, medio de rayo rasante, diseño de receptor de señal débil), un EKF GNSS a bordo para naves de órbita alta y de transferencia lunar, y navegación relativa en formación (tipo de escenario <c1/>; <c2/>; MODELLED, orientativo; comparado con el folleto SSV del ICG bajo un preregistro, <c3/>)

# text
# c1: run
# c2: transmit.pattern_text
seg-3e16823c1c90 = <c1/> (en línea; <c2/> lleva en línea un patrón medido)

# text
# c1: run_scenario
# c2: transmit.pattern_csv
seg-126a59c992d9 = <c1/> (solo en línea; <c2/> se rechaza)

# text
# c1: run
seg-2010eb196565 = <b>N/A</b> (no hay notebook en { "0.38" }; los escenarios se ejecutan en cualquier notebook mediante <c1/>)

# text
# c1: lunar-infrastructure
# c2: study = ...
# c3: docs/LUNAR-INFRASTRUCTURE.md
seg-593b7761803d = Órbita y superficie lunares como infraestructura de navegación y geodésica: coherencia de la determinación de órbita, resolución de ambigüedades de fase de portadora, coestimación de marcos, vínculo espacial y sensibilidad a los números de Love (tipo de escenario <c1/>, <c2/>; <c3/>; MODELLED, entradas ILLUSTRATIVE, orientativo)

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-34ed7b4d59e4 = <c1/> (y los otros cinco ejemplos hermanos)

# text
# c1: run
seg-ba584b2da776 = <b>N/A</b> (no hay notebook; los ejemplos se ejecutan en cualquier notebook mediante <c1/>)

# text
seg-b5ae9f9fd5df = <b>pending</b>: aún no hay vista de Studio; los escenarios se ejecutan en el ejecutor de escenarios de Studio y en la tarjeta Command line de Tools

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
# c4: tracking
# c5: statistics
# c6: [clock_log]
# c7: [series.clock_log]
# c8: docs/CLOCK-LOG-FORMATS.md
seg-3103be5ffa0a = Registros de reloj medidos leídos a una serie de fase: linuxptp <c1/>, <c2/>, <c3/>, chrony <c4/> y <c5/>, junto con reloj RINEX, TimeLab y TICC (<c6/> / <c7/>; <c8/>; MODELLED, ninguna referencia independiente compara un análisis con otro lector)

# text
# c1: [clock_log]
seg-5b9d4cfbbbf7 = un escenario con <c1/>

# text
# c1: run
# c2: text
seg-f0ac32797edb = <c1/> (<c2/> solo en línea; sin lecturas de archivos en un navegador)

# text
# c1: run_scenario
# c2: text
# c3: path
seg-bf0495255831 = <c1/> (<c2/> solo en línea; <c3/> se rechaza)

# text
seg-aa26d73d9b79 = <b>N/A</b> (no hay notebook; un registro es un archivo que aporta el usuario)

# text
seg-d1ebbe70e454 = <b>pending</b>: no hay vista de Studio; el ejecutor de escenarios de Studio admite el texto del escenario

# text
# c1: /studio/optical/
seg-04edbdcaf5c7 = la vista Optical PNT de Studio (<c1/>, { "0.38" }) dibuja los resultados registrados de los dos escenarios incluidos, con la serie temporal con semilla; el escenario también se ejecuta en el ejecutor de escenarios de Studio y en la tarjeta Command line de Tools

# text
# c1: interference-map fetch-land
seg-dbe94c1cb4b0 = Descarga de polígonos de tierra (<c1/>)

# text
seg-d61b28df9367 = Código de la CLI

# text
# c1: --allow-network
seg-3c816222df90 = Tools: tarjeta Command line (necesita <c1/>)

# text
# c1: docs/BENCH.md
seg-858b2c4a1451 = Benchmark (kshana-bench v1: puntuar una entrega frente a un archivo de verdad, página de clasificación; <c1/>, MODELLED, orientativo)

# text
seg-f6e2271206a6 = <b>N/A</b> (las dos herramientas MCP lo incluyen; un comando de barra sobre dos archivos JSON no aporta nada)

# text
seg-4edd4fe793f1 = <b>N/A</b> (no es una acción de IDE)

# text
seg-15ffa4639a46 = <b>N/A</b> (los notebooks educativos son un flujo de trabajo aparte)

# text
# c1: bench/site/
seg-5d48d48ae295 = <b>N/A</b> (la clasificación es la página estática <c1/>, trasladada al sitio tal cual; Studio no calcula nada)

# text
# c1: bench truth|cases|baseline|seal|reveal-check|manifest|verify-manifest|validate
seg-f730ab44ca82 = Herramientas de datos y de conjunto reservado del benchmark (<c1/>)

# text
# c1: seal
seg-efdc66eff3d8 = <b>N/A</b> (la CLI lee directorios de conjuntos de datos y archivos de reloj y, para <c1/>, un archivo de semilla secreta; una semilla no debe pasar por un agente ni por una página)

# text
# c1: interference-map daily|sensitivity
# c2: docs/observatory/METHOD.md
seg-2146297abaf0 = Producto diario del observatorio y estudio de sensibilidad (<c1/>; <c2/>)

# text
seg-f359f5223666 = <b>N/A</b> (los comandos leen un directorio de archivo con cientos de miles de archivos, escriben cuatro archivos, entre ellos un PNG, y aplican el retraso de publicación de { "24" } h frente al reloj de la máquina que publica; el mapa CSV está en todas las superficies de la fila anterior)

# text
# c1: trust/
# c2: training/
# c3: interference/
# c4: geometry/
# c5: lunar/
# c6: lunar-station-coverage
# c7: #osnma
# c8: #evidence
# c9: #bench
# c10: #compliance
# c11: #ai
# c12: —
seg-55cf42830155 = Kshana Studio es la aplicación web construida sobre la compilación WebAssembly, de modo que existe una vista de Studio donde la columna WASM tiene un punto de entrada, y donde no lo tiene la celda remite a una <b>tarjeta Command line</b> (el comando que se ejecuta, con sus argumentos), nunca a un resultado calculado por Studio. Páginas (kshana.dev/studio/, en el cliente): <b>Maritime trust</b> (<c1/>), <b>Training debrief</b> (<c2/>), <b>Interference map</b> (<c3/>), <b>Geometry</b> (<c4/>: un skyplot representativo, perfil del horizonte, DOP, elipse de error y nube Monte Carlo del motor; { "0.36" }), <b>Lunar station</b> (<c5/>: la cobertura modelada de una estación de referencia lunar a partir del tipo <c6/>; { "0.36" }) y la página <b>Tools</b>, cuyas secciones son OSNMA (<c7/>), Evidence packs (<c8/>), Test-bench export (<c9/>), Compliance mapping (<c10/>), la pestaña Command line (tarjeta de telemetría, IQ, integraciones marinas: comandos que se ejecutan) y Use from your AI assistant (<c11/>). Un <c12/> en la columna de Studio de la tabla de subcomandos es un comando que no es una de las { "0.35" } capacidades que presenta Studio.

# text
seg-73006c42aef2 = Por qué las celdas N/A son N/A

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-6d586f5fbaa3 = <b>Signal K y OpenCPN.</b> Son consumidores del proceso en vivo en ejecución y de su compuerta TCP, de modo que son despliegues de línea de comandos; el plugin lleva un comando de guía práctica y una skill que remiten a <c1/> y no llaman a ninguna herramienta.

# text
seg-79ec7e7307da = Un proceso en ejecución.

# text
# c1: receiver-trust live
# c2: position
# c3: advisory
# c4: geometry
# c5: class
# c6: receiver-trust live
# c7: --replay
# c8: --udp <port>
# c9: --listen tcp:<port>
seg-17fcf959153f = <c1/> mantiene abierto un flujo, puede servir el flujo con compuerta a cualquier número de clientes TCP y se ejecuta hasta que se detiene. Una llamada de Python, una llamada de navegador, una llamada a una herramienta MCP y una acción de IDE devuelven cada una su resultado al terminar y no mantienen abierto un socket para otros. Python, WASM y MCP llevan en su lugar la forma acotada: un fragmento puntuado por el mismo motor, en el esquema en vivo (líneas JSON { "1.3" }: <c2/>, una declaración <c3/> y la <c4/> de satélites en cada época, una <c5/> en cada deducción), sin socket y sin compuerta (la compuerta marca una posición como no válida en un flujo en vivo, algo que solo un proceso situado en la ruta de los datos puede hacer). Dos comportamientos pertenecen al proceso y no están en las herramientas de fragmentos: un flujo reproducido más rápido que el tiempo real mediante <c6/> sin <c7/> se puntúa como no fiable (su hora no coincide con el reloj del anfitrión; un fragmento se lee sin reloj del anfitrión), y <c8/> y <c9/> se enlazan a la dirección de bucle local salvo que se indique una dirección.

# text
# c1: trust_telemetry(input, format, host, input_kind, options_json)
# c2: trust_telemetry
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: trust-telemetry
# c6: kshana trust-telemetry --result session.result.json --print-metrics
# c7: TRUST-TELEMETRY.md
seg-824d2bbbf280 = <b>Telemetría de confianza.</b> WASM lleva <c1/>: los mismos codificadores, que devuelven texto de Prometheus, líneas de syslog CEF o LEEF, o la carga JSON de OTLP para un flujo o un resultado por lotes, sin reloj (las líneas de syslog llevan la marca de tiempo nula de la RFC { "5424" }) y sin enviar nada. Python (<c2/>) y MCP (<c3/>, con el comando del plugin <c4/>) también la llevan. El resto de <c5/> sirve métricas de Prometheus, envía syslog y exporta OpenTelemetry desde un flujo en ejecución, por lo que es un proceso por naturaleza. Guía práctica: canalice el comando en vivo hacia él, o reproduzca un archivo de resultado (<c6/>); véase <a1><c7/></a1>. Un agente o un notebook que quiera las puntuaciones por época llama en su lugar a las funciones por lotes o de fragmentos.

# text
# c1: evidence_verify
seg-a5c2ef208191 = <b>Crear un paquete en el navegador.</b> Firmar necesita una clave privada, que no debe pasar por una página web; la compilación para navegador verifica paquetes (<c1/>) y las demás superficies los crean. La herramienta MCP nunca devuelve ni registra la semilla de firma y, sin ella, firma con una clave de un solo uso (integridad, no identidad); para una clave que importe, use la CLI. Lo mismo vale para transmitir NMEA de entrenamiento a una dirección: Python, WASM y MCP devuelven el texto generado, y la CLI lo envía.

# text
seg-dea93c47b3b1 = Suites de estudio.

# text
# c1: --study <suite.toml>
# c2: run
# c3: run_scenario
# c4: run_all
seg-2e88bb410874 = <c1/> ejecuta un manifiesto que nombra archivos de escenario hermanos en disco. Las superficies en memoria admiten texto de escenario, no una carpeta de archivos, de modo que ejecutan cada miembro como un escenario (<c2/>, <c3/>, <c4/>).

# text
# c1: KSHANA_MCP_IQ_DIR
# c2: iq extract
# c3: convert
# c4: decimate
# c5: iq labfit
# c6: iq conditions
seg-d08f585c4f02 = <b>IQ de GNSS en el navegador y grabaciones que se reescriben.</b> Una grabación son gigabytes de muestras, que una página no puede contener y que el protocolo MCP no debe transportar, de modo que WASM no tiene funciones de IQ y las herramientas MCP leen y escriben en un único directorio de trabajo (<c1/>, con un presupuesto de muestras por llamada). <c2/>, <c3/> y <c4/> existen para reescribir grabaciones en disco y siguen siendo solo de línea de comandos. <c5/> y <c6/> llevan texto, por lo que MCP los admite en línea (se rechaza un registro que nombra un archivo).

# text
# c1: curl
# c2: --allow-network
# c3: curl
# c4: land_geojson
seg-f571dc5c2330 = <b>La descarga de tierra.</b> Es el único comando que abre una conexión de red, necesita el <c1/> del sistema y un <c2/> explícito, y comprueba un SHA-256 fijado. El navegador no tiene <c3/>, y un agente de IA no debe obtener datos en nombre de un usuario; las demás superficies admiten en su lugar el archivo de tierra como texto (<c4/>).

# text
seg-f81f6b6a2e67 = Archivos de trazas y directorios.

# text
# c1: interference-map adsb
seg-2f226f3955d9 = <c1/> sobre un directorio de trazas de readsb lee archivos del disco y es solo de línea de comandos; las superficies en memoria admiten texto CSV.

# text
seg-6fb9f23090ca = Cada subcomando de la línea de comandos y quién lo cubre

# text
# c1: kshana --help
seg-4a225d5d59af = Una fila por subcomando o modo de <c1/>. <b>yes</b> indica el punto de entrada; <b>no</b> es una laguna con su motivo; <b>N/A</b> es una superficie que no puede soportarlo por el motivo indicado arriba o en la última columna. Las acciones de JetBrains ejecutan la línea de comandos, de modo que un <b>N/A</b> ahí indica por qué no existe una acción de IDE.

# text
seg-35720f38b1a5 = Subcomando

# text
# c1: kshana <scenario.toml>
seg-d46c11fa6dea = <c1/> (ejecutar, gráfico, tabla)

# text
# c1: error_kind
seg-af645810cc0c = <c1/> (una ejecución lanza un error ante un escenario no válido)

# text
seg-7d6c8218a4a6 = Validate Scenario

# text
seg-d75a5f64c7cc = <b>N/A</b> (nombra archivos hermanos en disco)

# text
seg-16775dd25139 = Una suite nombra archivos de escenario hermanos en disco (N/A arriba); ejecute cada miembro como un escenario

# text
seg-1742459cb792 = Export Scenario

# text
# c1: utf-8
seg-2bc957bd567b = Los archivos se devuelven como texto (<c1/>) o como base64 (las muestras SigMF)

# text
seg-bf69da729efd = Import Route

# text
seg-6d762f20af07 = Animate Scenario

# text
seg-052c13118454 = Como máximo { "120" } fotogramas por llamada; las secuencias más largas usan la CLI

# text
# c1: sky <request>
# c2: --monte-carlo
# c3: --svg
seg-5580a1a89bcb = <c1/> (o indicadores), <c2/>, <c3/>

# text
# c1: sky_geometry
seg-b96c18c1f157 = <c1/> (sin Monte Carlo, sin SVG)

# text
seg-5b62ca019ebd = <b>N/A</b> (véase la fila de la capacidad)

# text
seg-4f7453d89d9d = Geometría MODELLED; salida en JSON o SVG

# text
seg-c853beadb55e = Preajustes REPRESENTATIVE con procedencia

# text
seg-52638393d72d = List Scenario Kinds

# text
seg-69bc0d382eb7 = Insert Example Scenario

# text
# c1: python
# c2: wasm
seg-611dbcb5a15c = Las características <c1/> y <c2/> compilan el texto de ejemplo en el binario (unos { "0.7" } MB)

# text
# c1: receiver-trust <scenario.toml>
seg-51e0c2c100f8 = <c1/> (por lotes)

# text
# c1: receiver_trust_replay
seg-c9421c4d744f = fragmento: <c1/>

# text
# c1: assess_vessel_stream
seg-6a2439967519 = fragmento: <c1/>

# text
seg-efe5e5dbe710 = fragmento

# text
# c1: --file
seg-816f9bd210d5 = Assess Receiver Stream (un registro almacenado, <c1/>)

# text
seg-d81457d8f038 = Página de confianza marítima (fragmento); tarjeta Command line para el proceso

# text
seg-9cf210dd2301 = Un proceso en ejecución; el fragmento no tiene socket ni compuerta (N/A arriba)

# text
seg-315d0dcd39fb = Solo texto en todas las superficies, sin socket; los exportadores en ejecución son un proceso (véase arriba)

# text
seg-5c93482c9ae4 = Entra texto, sale JSON; MODELLED

# text
seg-3763f34af33d = N/A (véase arriba)

# text
# c1: --json
# c2: advisory
seg-4110fadc04db = El mismo JSON que <c1/>, con la declaración orientativa en su campo <c2/>; la lectura del archivo pasa a ser bytes en memoria. Solo estado de autenticación: no es un servicio de integridad de la navegación, y no se afirma ningún rendimiento antisuplantación

# text
# c1: receiver-trust evidence
seg-399524b468f3 = <c1/> (crear un paquete)

# text
seg-6dfc4b352892 = Tools: tarjeta Command line (ninguna clave de firma en una página)

# text
seg-69dadb564662 = Ninguna clave de firma en un navegador

# text
seg-fd26107fa3cd = <b>N/A</b> (terminal; necesita archivos)

# text
seg-38dc9c30191a = <b>pending</b>: Tools: tarjeta Command line

# text
# c1: --key
seg-57257e80468f = El plan y el catálogo se dan como texto; el paquete firmado (<c1/>) es solo de línea de comandos (clave de firma)

# text
seg-3ea5db063974 = Ninguna clave de firma en un navegador; no se escribe ni se reproduce ninguna señal

# text
seg-8b27a6ca1aef = <b>N/A</b> (el plugin nunca crea ni lee una clave privada)

# text
seg-dda21be14d64 = Tools: tarjeta Command line

# text
seg-03376576d0b6 = Python devuelve la clave en memoria con una advertencia; una clave privada no debe pasar por una conversación ni por una página

# text
seg-cd21674be5d7 = Attach Timestamp

# text
# c1: openssl ts -verify
seg-6c0caa6e1be2 = Token como bytes o base64, paquete actualizado devuelto en memoria; no se comprueba la firma de la autoridad (<c1/>)

# text
seg-907eedb51849 = <b>N/A</b> (véase la Nota)

# text
seg-f70892a9f007 = Envía a una dirección (N/A arriba)

# text
# c1: interference-map adsb|ais
seg-76bcb50897c6 = <c1/> (CSV)

# text
# c1: interference-map adsb
seg-79f851a94048 = <c1/> (directorio de trazas)

# text
seg-d2cc933b6894 = Lee un directorio (N/A arriba)

# text
seg-316b51d83726 = Acceso a la red (N/A arriba)

# text
seg-b611fd739914 = Lee un directorio de archivo y escribe archivos; el retraso de publicación se aplica en la máquina que publica (N/A arriba)

# text
seg-96b313373128 = N/A (la herramienta MCP lo incluye)

# text
seg-cb1fc7c162e3 = Entra texto, sale texto; no se lee ni se escribe nada

# text
# c1: bench/site/
seg-5292a4966861 = la página estática <c1/>

# text
seg-839999463148 = Texto HTML

# text
seg-bb10d5a1eb50 = Archivos de conjuntos de datos y una semilla secreta (N/A arriba)

# text
seg-45bbda779645 = Devuelve texto, no escribe nada; sin señal

# text
seg-0e64b97b025b = <b>N/A</b> (las grabaciones son gigabytes de archivos; véase la Nota)

# text
# c1: --format sdrx[:ci16_le]
# c2: .sdrx
# c3: format: "sdrx"
seg-7c9273837b73 = Las muestras son archivos. <c1/> (o una ruta de salida que termine en <c2/>) escribe metadatos ION GNSS SDR junto a las muestras: la CLI y MCP (<c3/>) los escriben; Python devuelve las muestras en memoria y no escribe ningún archivo, de modo que los metadatos no tienen forma en Python (<b>N/A</b>)

# text
# c1: rows
# c2: tests
seg-4f1cc14c9af4 = Los escenarios están incorporados; no hay sistema de archivos; <c1/> y <c2/> imprimen las tablas de documentación confirmadas y son solo de CLI

# text
seg-5de02dcfb151 = Los flujos de símbolos son texto de { "0" } y { "1" }, de { "4" } MiB como máximo (MCP) o { "100" } fotogramas generados por llamada; no se verifican LDPC ni CRC-24Q de las subtramas { "2" } a { "4" }; no se escribe ninguna señal

# text
seg-db29ea94222b = Las muestras son archivos

# text
# c1: iq_labfit
seg-9b7afa156e9a = <c1/> (registros en línea, sin archivos)

# text
# c1: --follow [--idle-timeout <s>]
# c2: iq::io::follow::open_sigmf_follow
# c3: receiver-trust live
# c4: iq_monitor
seg-295fe0c63fe2 = <c1/> lee una grabación SigMF que todavía se está escribiendo, solo recepción (<c2/> en Rust): <b>N/A</b> para Python y MCP, porque una llamada que espera a que un archivo crezca no devuelve su resultado cuando termina el trabajo, el mismo motivo por el que <c3/> también es solo de línea de comandos; la grabación con su longitud actual se procesa mediante <c4/>

# text
# c1: iq_test_conditions
seg-e651dceda9b2 = <c1/> (texto, en línea)

# text
seg-237bb76fae50 = El inventario de una carpeta es de Python y de la CLI; el servidor MCP lee un único directorio de trabajo

# text
seg-654781b74f2a = Reescriben grabaciones en disco (N/A arriba)

# text
# c1: iq --help
seg-6a010403db35 = la lista de señales (<c1/>)

# text
# c1: kshana iq --help
seg-1154d82301ca = <b>N/A</b> (una lista; ejecute <c1/>)

# text
seg-8c90b8cb2e78 = Funciones de utilidad

# text
seg-3d9ac26ec730 = Pequeños puntos de entrada que no son una fila de capacidad, y dónde reside cada uno:

# text
# c1: kshana.version()
# c2: kshana.__version__
# c3: version
# c4: --version
seg-b8c43ffb2a13 = Python (<c1/>, <c2/>), WASM (<c3/>), CLI (<c4/>), MCP (la información del servidor)

# text
seg-3f32bbece220 = La versión del motor

# text
# c1: kshana.track-epoch/1
# c2: kshana iq track --epochs
# c3: iq_*
seg-d5fb77719df2 = Lee un archivo binario <c1/> que escribió <c2/>. <b>N/A</b> en los demás sitios: lee un archivo del disco (WASM no tiene sistema de archivos, MCP lee un único directorio de trabajo solo mediante las herramientas <c3/>)

# text
# c1: ?s=
seg-57ef8e3fe6bc = El códec de enlaces para compartir <c1/> del playground del navegador (TOML del escenario a un token apto para URL y viceversa). <b>N/A</b> en los demás sitios: un enlace a una página web no tiene sentido para una línea de comandos, una llamada de Python o un agente

# text
seg-bd6e451f5cdf = Límites que difieren según la superficie

# text
seg-8f3e8345d90d = Límite de entrada

# text
seg-4b5abdf098e3 = Archivos

# text
seg-1910f2cef7da = { "4" } MiB por entrada de texto ({ "2" } MiB y { "20,000" } épocas para un fragmento de flujo); las respuestas llevan como máximo { "2000" } líneas NMEA, { "200" } líneas de épocas no nominales y { "4" } MiB de GeoJSON o de archivos de paquete

# text
# c1: iq_*
seg-116e2d0202f4 = solo contenido en línea: se rechaza un campo de escenario que nombre un archivo; las herramientas <c1/> usan un único directorio de trabajo opcional, con cada ruta confinada en él

# text
# c1: --http
seg-ee5e8de88144 = MCP sobre HTTP (<c1/>, autoalojado)

# text
seg-f095909e9feb = como MCP, con un cuerpo de solicitud de { "5" } MiB, { "120" } s por solicitud y { "8" } solicitudes simultáneas de forma predeterminada

# text
# c1: iq_*
seg-95d4ab7863e6 = ninguno: las herramientas de archivos <c1/> están desactivadas; todas las demás herramientas admiten contenido en línea

# text
seg-a8b290453c39 = Python, Rust

# text
seg-3df89722db78 = { "64" } MiB por entrada de texto

# text
# c1: receiver_trust
# c2: path
seg-00acf8b1ff29 = <c1/> puede nombrar un <c2/> que el proceso pueda leer

# text
seg-cf23db887749 = { "64" } MiB por entrada de texto, dentro de la propia memoria del navegador

# text
seg-e38059970288 = ninguno: el navegador no tiene sistema de archivos, no se sube nada

# text
seg-241399edb372 = Niveles de evidencia y salvedades en todas las superficies

# text
seg-b3307ae773f7 = Un paquete de evidencias es un <b>registro técnico</b> de lo que el motor calculó a partir de un registro con unos ajustes indicados, con cada hash y una firma sobre ellos. No es un dictamen jurídico, una constatación de hechos sobre ningún suceso ni una aprobación. Un resultado superado de verify indica que el registro no ha cambiado; sin una clave pública de confianza, prueba solo la integridad frente a la clave que el propio paquete nombra.

# text
seg-0d8ed8b92a00 = Los monitores de confianza del receptor y la puntuación de confianza son <b>MODELLED</b>: los umbrales son entradas declaradas y nada afirma cómo se comportan frente a una interferencia real. La salida es <b>orientativa</b>; Kshana no es un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }) y el operador sigue siendo responsable. Una puntuación alta no es prueba de una posición genuina.

# text
seg-606127880e96 = El mapa de interferencias es <b>MODELLED</b> (umbrales fijados de antemano, no validados frente a una medición de verdad de referencia). Una celda degradada no identifica la interferencia como causa; una celda no observada no es evidencia de una ruta despejada; describe informes pasados y no es una previsión. Es solo agregado: no se devuelve ningún identificador.

# text
seg-b2fd2a05842f = El NMEA de entrenamiento es <b>solo texto</b>: no se sintetiza RF, IQ ni forma de onda, no se transmite nada, y nunca está destinado a los sistemas de navegación en vivo de un buque.

# text
seg-4e3bbacda9ac = <s1>Anterior</s1>Uso de Kshana desde un agente

# text
seg-c5fbfab85e01 = <s1>Siguiente</s1>Plugin de JetBrains

seg-6555ff9a6d8e = Salida

seg-12471a4b2b57 = Región del emisor (ADS-B, AIS; MODELLED)

seg-0a58678302e5 = <b>N/A</b> (aún no incluido; las superficies de Rust, Python y WASM lo cubren)

seg-dff1bfe0263e = <b>N/A</b> (la publicación de regiones de emisores en el observatorio público es una decisión aparte del propietario y está desactivada)

seg-ec2d91e2f867 = Comprobación de envíos de socios de datos (formato y metadatos de un envío de datos medidos, <c1/>; no puntúa nada)

seg-c16a5ff8218b = <b>N/A</b> (la comprobación lee archivos locales y su SHA-256; la API de Rust es la superficie de biblioteca y la CLI es la herramienta)

seg-ed29039d1dc0 = <b>N/A</b> (no hay sistema de archivos en la compilación para navegador)

seg-b3397901ea5f = <b>N/A</b> (MCP rechaza por diseño las fuentes de archivo (solo texto en línea))

seg-c5fc0c41b9bb = <b>N/A</b> (los comandos de barra llaman a herramientas MCP, y esta comprobación necesita archivos en disco)

seg-be971c31e0de = <b>N/A</b> (las acciones de JetBrains están ligadas a un archivo seleccionado; un envío es una carpeta)

seg-b9e56d6ab03b = <b>N/A</b> (Studio no tiene acceso al sistema de archivos; ejecute el comando)

seg-521b58a1080e = Presupuesto de errores de navegación y temporización de una cadena de fases de misión desde el lanzamiento hasta la entrada: ocho tipos de fase, reglas de traspaso, conversiones de marco y de escala de tiempo, una superposición de la red terrestre, el margen frente a los requisitos indicados y el eslabón más débil (tipo de escenario <c1/>; <c2/>; MODELLED, entradas ILLUSTRATIVE, de carácter consultivo; solo fuentes públicas, sin respaldo)

seg-6b451021b87a = <c1/> (desde una copia del repositorio: lee un recorte confirmado del kernel de la Luna)

seg-ac3e013b5217 = <c1/> (<c2/> es una clave de archivo y se rechaza; sin un kernel la Luna es la serie analítica y la fila de conversión lo indica)

seg-e957474f44a8 = <c1/> (solo en línea; la clave del kernel se rechaza)

seg-1c1729fafe99 = <b>N/A</b> (no hay cuaderno; el ejemplo se ejecuta en cualquier cuaderno mediante <c1/> desde una copia del repositorio)

seg-39e5b9fc3560 = <c1/> (CSV)

seg-743d33b43d99 = N/A (aún no incluido)

seg-ab52a3469f6a = Regiones estimadas del emisor, MODELLED; los directorios de trazas y <c1/> son solo de línea de comandos

seg-5f1ce275acbd = Lee un archivo de envío y su archivo de datos en disco y verifica el SHA-256; ninguna de esas superficies tiene la carpeta. Solo formato y metadatos, nada puntuado; véase <c1/>

seg-fc9ab9f71553 = La etiqueta de evidencia y las salidas que no llevan ninguna

seg-b1e4bcc2ac09 = Cada figura y tabla que escribe una ejecución lleva su nivel de evidencia (<c1/>, <c2/> o <c3/>, el más débil de las filas del registro que la respaldan) y los identificadores de esas filas, en cada superficie que ejecuta un escenario: el JSON de resultados (clave <c4/>), el SVG del gráfico (elemento de metadatos y una línea bajo el trazado) y la tabla CSV (líneas de comentario <c5/>). La misma etiqueta está en las salidas de receiver-trust (CLI, MCP, Python), <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, el informe de ruta del mapa de interferencias, y dentro del <c11/> de cada paquete de evidencias (firmado; <c12/> lo informa). Los identificadores de fila son estables (<c13/> y ocho dígitos hexadecimales, la columna <c14/> de <c15/>).

seg-c66058f24f0e = Estas salidas no llevan etiqueta, cada una por un motivo indicado (la lista es <c1/> en <c2/>, que falla con un escritor que ni está etiquetado ni figura en la lista):

seg-04ca90423b80 = Por qué no lleva etiqueta

seg-a90c022c4dea = archivos de resultados de kshana-bench

seg-9f3f0adbcfe6 = un esquema fijo fijado por los compromisos de datos reservados; cada uno lleva su propio <c1/> (MODELLED o medido)

seg-9bb126104f12 = productos diarios del observatorio de interferencias (GeoJSON, PNG, JSON de incidentes)

seg-ddbc60cb14ac = un esquema publicado y congelado; las salvedades de la nota del método los acompañan

seg-874cb55d3457 = archivos de celda, de tabla de puntuación y de informe de la campaña de iq

seg-8c8cb4bd5110 = fijados por resumen criptográfico; cada uno indica la tabla de puntuación de la campaña que reexpone

seg-8d2645e93451 = muestras IQ, metadatos de SigMF y SDR, referencia de escena, flujos de épocas y de eventos de seguimiento, registros de sesiones en vivo

seg-9fa872028a08 = archivos ligados a un formato y flujos de registros que leen otras herramientas

seg-6c77071a0d03 = exportaciones SP3, OMM, OEM, CZML, KML, GeoJSON, STK, de movimiento de test bench y NMEA; el flujo de formación NMEA

seg-5c1b92afa402 = archivos ligados a un formato que leen herramientas de terceros

seg-b5c79a0e395c = formatos de transmisión de telemetría (Prometheus, OTLP, CEF, LEEF)

seg-8cd0fdb609e5 = definidos por sus formatos de transmisión

seg-3ba06004fc14 = documentos generados (el propio registro, el estudio confirmado y las tablas de datos)

seg-8be4943acd00 = no son la salida de una ejecución
