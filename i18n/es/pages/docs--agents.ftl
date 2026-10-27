# docs--agents: translations (es)

# text
# c1: docs/AGENTS.md
seg-0619151df586 = Fuente: <c1/>

# text
seg-d0e198572cfe = Uso de Kshana desde un agente de IA

# text
# c1: SURFACES.md
seg-eccd1d5fbdb2 = Para un agente (o la persona que lo dirige): qué herramienta llamar para qué pregunta, qué hacen y qué no hacen las herramientas, y qué conservar con cada respuesta. Las superficies y las celdas que no están disponibles en una superficie dada: <a1><c1/></a1>.

# text
seg-a0354cacda4c = Conectar

# text
seg-337d23a873f5 = Aquí se omite un pasaje que nombra clientes de IA de terceros; está en <a1>docs/AGENTS.md</a1> en GitHub.

# text
seg-01a862ed86e6 = La regla para cada respuesta

# text
seg-0adf5e5ad79a = Ejecute el motor; no adivine las cifras. Informe de lo que devolvió una herramienta con su unidad y su nivel de evidencia (VALIDATED frente a una referencia independiente, o MODELLED), el escenario, la semilla y la versión del motor, para que la ejecución pueda repetirse. Conserve con cada resultado sus propias salvedades.

# text
seg-f67845b891c5 = Qué herramienta para qué pregunta

# text
seg-6f4bb4962340 = La pregunta

# text
seg-8efda304925b = Herramienta (MCP)

# text
seg-83d609ff5cc7 = Comando slash

# text
seg-9b937d3cbf88 = Ejecutar o explicar un escenario PNT (órbitas, GNSS, temporización, fusión, lunar, enlaces ópticos, ...)

# text
seg-ba8b3824bba2 = ¿Era fiable este registro de receptor, o el NMEA de este buque, y cuándo dejó de serlo?

# text
# c1: assess_receiver_log
# c2: assess_vessel_log
# c3: assess_vessel_stream
seg-f3ea74f278ac = <c1/> (cualquier formato de registro), <c2/> (NMEA de buque, por lotes), <c3/> (extracto acotado)

# text
seg-aa194fda4300 = Necesito NMEA sintético con un evento de jamming, arrastre de posición, falseamiento de hora o repetición para formación

# text
seg-0211b49536df = Mostrar la puntuación de confianza de un buque en formatos de monitorización o SIEM (Prometheus, CEF, LEEF, OTLP)

# text
seg-701250dfa798 = Puntuar un registro de receptor frente al calendario publicado de Jammertest (latencia de detección, alarmas perdidas, falsas alarmas, tiempo de recuperación), o convertir ese plan en eventos

# text
seg-d1c81008d5f8 = Crear un registro a prueba de manipulación de lo que dijo el motor sobre una ventana del registro de un buque, o comprobar uno

# text
seg-b7892674ac60 = ¿Los datos de navegación de qué satélites Galileo autentica este flujo de receptor (OSNMA)?

# text
# c1: kshana osnma verify
# c2: kshana.osnma_verify
# c3: osnma_verify
seg-084a787c65cf = <b>ninguna: no está en MCP.</b> Use <c1/> (CLI), <c2/> (Python) o <c3/> (WASM, la tarjeta OSNMA de Studio)

# text
seg-4fc021a0a145 = no es un comando slash

# text
seg-0f5db62071e9 = Necesito el movimiento del vehículo y las horas de los eventos de un escenario para reproducirlos en un simulador GNSS de laboratorio

# text
seg-919946a95002 = ¿A qué filas de requisitos de marcos públicos aportan evidencias a favor estas ejecuciones, y cuál es la brecha?

# text
# c1: compliance_report
# c2: compliance_mapping
seg-5e08ec7f4852 = <c1/> (a partir del texto de resultados), <c2/> (las tablas, sin ejecuciones)

# text
seg-ff6556a46025 = ¿Ejecutar un paquete de normas puntuado (perfiles de ensayo RPCF del DHS, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Apéndice F) frente a umbrales fijados antes de la ejecución?

# text
# c1: list_standards_packs
# c2: run_standards_pack
# c3: compliance_report
seg-709c6501a661 = <c1/>, <c2/> (dé el informe a <c3/> para obtener las filas)

# text
seg-1745cce01677 = ¿Comprobar la LunaNet Augmented Forward Signal (códigos, SB1, formato de trama) frente a LNIS V5 / LSIS-AFS V1.0, o comprobar un flujo de símbolos?

# text
# c1: lunanet_afs_check
# c2: mode
seg-d4d2e950054c = <c1/> (<c2/> spec, symbols o generate); el LDPC y el CRC-24Q de las subtramas { "2" } a { "4" } no se verifican

# text
seg-86c207c3996e = ¿Enlazar una ejecución de laboratorio (escenario, condiciones de ensayo declaradas, registro de receptor, puntuación) en un único paquete firmado?

# text
# c1: create_round_trip_pack
# c2: export_test_bench
# c3: docs/spec/TEST-CONDITIONS.md
seg-25bb29e6aa3d = <c1/> después de <c2/> (<c3/>)

# text
seg-3856b38bb9d2 = ¿Puntuar un envío de detección o de holdover frente a un archivo de verdad de kshana-bench, o generar archivos de resultados como la página de clasificación?

# text
seg-87e686c064ce = Necesito un escenario que recorra una ruta GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

# text
seg-bf72fff11d84 = ¿Qué satélites ve un usuario en una calle, un puerto, un fiordo o una terminal de contenedores, y cuáles son el DOP y la elipse de error?

# text
# c1: sky_geometry
# c2: skyline_preset
# c3: [skyline]
# c4: run_scenario
# c5: orbit
# c6: integrity
# c7: user_site
seg-86eb2756fd7f = <c1/> (una solicitud, o un <c2/>); la sección <c3/> de un escenario mediante <c4/> (<c5/> e <c6/> necesitan <c7/>)

# text
seg-bd7f9d7e8e27 = ¿Dónde se ha visto degradado el GNSS, y qué parte de esta ruta está en esa zona?

# text
# c1: build_interference_map
# c2: route_exposure
seg-908b6e65372f = <c1/>, y después <c2/>

# text
seg-1f715d5e0c4f = Grabaciones IQ de GNSS (escena, adquisición, seguimiento, front-end, campañas)

# text
# c1: iq_signals
# c2: iq_*
seg-5569efd18c6b = Primero <c1/>, y después las herramientas <c2/>

# text
# c1: vessel-receiver-trust
# c2: training-nmea-scenario
# c3: trust-telemetry
# c4: compliance-mapping
# c5: test-bench-export
# c6: gnss-iq
# c7: interference-map-route-exposure
seg-d44650438742 = Las skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> y <c7/> llevan las reglas siguientes para los agentes que cargan skills.

# text
seg-a4de5a40b743 = Lo que no hace cada herramienta

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-3f27662a983e = <b>Leer o escribir archivos.</b> El contenido va en línea: las entradas son texto en la solicitud, limitado a { "4" } MiB, y un campo de escenario que nombra un archivo se rechaza. Solo las herramientas <c1/> tocan una carpeta, y solo la que nombra <c2/>, con cada ruta confinada a ella.

# text
# c1: kshana osnma verify <file> --public-key ... --json
# c2: osnma_verify
seg-3efe81d26cad = <b>Verificar OSNMA.</b> No hay herramienta MCP: la entrada es un flujo largo de receptor en bruto (páginas I/NAV o una captura UBX), que encaja con la CLI y con Python, y una herramienta que lo recibiera añadiría una superficie de entrada grande sin ningún beneficio. Remita al usuario a <c1/> (o a <c2/> de Python). Diga lo que diga su salida, conserve literalmente la advertencia: solo estado de autenticación, no un servicio de integridad de la navegación, no un equipo de navegación homologado, y sin ninguna afirmación de prestaciones antispoofing; un resultado solo tiene sentido con una raíz de Merkle o una clave pública que el usuario haya obtenido por otra vía.

# text
seg-b13a75d08152 = Ejecutar un proceso.

# text
# c1: receiver-trust live
# c2: --listen
# c3: trust-telemetry
# c4: assess_vessel_stream
# c5: advisory
# c6: geometry
# c7: class
# c8: #
# c9: --udp
# c10: --listen tcp:
seg-9dfcbee6fdb8 = <c1/> como flujo en ejecución (con una puerta y <c2/>), los exportadores de telemetría (<c3/>: Prometheus, syslog, OTLP) y la emisión de NMEA de formación a una dirección solo existen en la línea de comandos. <c4/> puntúa un extracto con el mismo motor y no escribe en ningún puerto. Las herramientas de extracto devuelven el esquema live de JSON por líneas { "1.3" } (una declaración <c5/> y la <c6/> de satélites en cada época, una <c7/> en cada deducción); el CSV de una ejecución de buque empieza con una línea de comentario <c8/> que lleva la misma declaración, así que léalo con una opción de comentarios. <c9/> y <c10/> se enlazan a la dirección de bucle local salvo que se indique otra cosa.

# text
seg-ac51aad84893 = Escribir una señal.

# text
# c1: export_test_bench
# c2: notice
seg-ad032dee3fd3 = <c1/> devuelve el movimiento del vehículo e intervalos de eventos etiquetados como texto; nada de lo que devuelve es, modela ni maneja una señal de radiofrecuencia o de banda base, y un evento no es una receta para producir interferencia. Dé su <c2/> junto con los archivos; el simulador y su operador son responsables de ejecutarlos solo donde esté autorizado.

# text
seg-39f3aae1143a = Decir más de lo que dice la correspondencia.

# text
# c1: compliance_report
# c2: statement
seg-ed04b567fc87 = <c1/> indica a qué filas de marcos aporta evidencias a favor un conjunto de ejecuciones, con la brecha de cada fila. Nunca dice que un marco queda satisfecho ni que un producto está calificado o aprobado; conserve su <c2/> literalmente y diga "aporta evidencias a favor de", nada más fuerte. Lee texto de resultados y de escenarios que usted le pasa, nunca una ruta.

# text
# c1: --allow-network
seg-eda73a8fcbfe = <b>Descargar datos.</b> La descarga de polígonos de tierra solo existe en la línea de comandos y necesita <c1/>. Pase el archivo de tierra, si se desea, como texto. Use solo datos que el usuario tenga licencia para usar.

# text
seg-d513f734248e = <b>Transmitir nada ni sintetizar RF.</b> El generador de formación escribe texto NMEA; la capa IQ escribe archivos de muestras para receptores de software.

# text
seg-63eb4c5b4a17 = Qué conservar con la respuesta

# attr:aria-label, text
seg-6555ff9a6d8e = Salida

# text
seg-a056a59fb678 = Conservar

# text
seg-c01c0fedd895 = Geometría de satélites y clases de deducción ({ "0.36" })

# text
# c1: geometry
# c2: environment
# c3: inconsistency
# c4: unknown
seg-3723ec5a3f8c = Informe de la geometría junto a la puntuación y de la clase de cada deducción tal como se devuelven: <c1/> significa el cielo (una declaración sobre el cielo, no un hallazgo de que no hubo ataque), <c2/> el entorno de señal, <c3/> evidencia de tipo ataque. Diga "geometría desconocida" cuando el estado es <c4/> (sin GSV ni GSA en el registro); no la deduzca. Los umbrales son <b>MODELLED</b> con procedencia declarada.

# text
seg-0938dfb71d72 = Puntuación de confianza del receptor

# text
seg-8e3a7376cd6b = <b>Consultivo</b>: no es un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }); el operador sigue siendo responsable. <b>MODELLED</b>. Declare los límites del buque antes de la ejecución y no ajuste un umbral a un resultado. Una puntuación alta no es prueba de una solución genuina; las comprobaciones no pueden ver a un spoofer coherente con todos los demás sensores.

# text
seg-ae3f0548e93f = Paquete de evidencias

# text
# c1: intact-signer-not-pinned
seg-81189f29f884 = Un <b>registro técnico</b>, no una opinión jurídica, una constatación de hechos ni una aprobación. Verifique con la clave pública del firmante obtenida por otra vía; sin ella el veredicto es <c1/>, que prueba solo la integridad frente a la clave que el propio paquete nombra: diga "intacto, firmante no establecido", nunca "verificado". Si la clave importa, nunca devuelva, registre ni pida una semilla de firma en una conversación: use la CLI.

# text
seg-512e5ee42c1e = NMEA de formación

# text
seg-c59a76aefff5 = <b>Solo texto</b>, para formación y ensayo, <b>nunca</b> para los sistemas de navegación en vivo de un buque. Devuelva la semilla y el registro del instructor.

# text
seg-14781c19be62 = Mapa de interferencia, exposición de la ruta

# text
seg-7135c6f44d49 = Cómo se leen los códigos de exactitud y cómo se calculan la rejilla y la geometría de la ruta está <b>VALIDATED</b> frente a bibliotecas independientes con entradas sintéticas; los umbrales del método siguen siendo <b>MODELLED</b>, y <b>no</b> se comprueba que una celda degradada sea interferencia: una celda degradada <b>no</b> identifica la interferencia como causa. Una celda no observada <b>no</b> es evidencia de una ruta despejada. Informes pasados, <b>no un pronóstico</b>. Solo agregados: no intente recuperar identificadores. Los mapas ADS-B y AIS se mantienen separados.

# text
seg-e47db9be47ea = Geometría del cielo, horizonte

# text
# c1: advisory
seg-839eb485b1d2 = Geometría <b>MODELLED</b> bajo un modelo de error declarado, solo con visibilidad directa: sin difracción, multitrayecto ni recepción sin visibilidad directa. Los ajustes preestablecidos son <b>REPRESENTATIVE</b>, no levantamientos; conserve la procedencia del ajuste. Las constelaciones preestablecidas son un cielo representativo, no el cielo de una fecha. La elipse escala un UERE declarado: no es una exactitud medida ni un límite de integridad. Conserve el <c1/>.

# text
# c1: optical-atmosphere
seg-0002a3dc682e = Disponibilidad del enlace óptico (<c1/>, { "0.37" })

# text
# c1: availability_ceiling_pct
seg-1098f908d9dc = <b>MODELLED</b>, consultivo. Los climas de nubes son entradas declaradas, no un conjunto de datos, y no se ha comparado ningún registro medido de disponibilidad: diga "bajo estos supuestos", nunca "la disponibilidad en ese emplazamiento". Conserve el <b>techo</b> del emplazamiento (<c1/>: lo que ningún margen eleva) junto a su disponibilidad, y diga qué ganancias de técnica son entradas (Kshana no modela un lazo de óptica adaptativa). La numérica se comprueba con un programa independiente, que comprueba la implementación de las fórmulas y no la atmósfera.

# text
# c1: holdover-test
seg-3324b2e2021e = Prueba de holdover (<c1/>, { "0.38" })

# text
# c1: docs/TIMING-HIL.md
seg-9177789844f7 = <b>MODELLED</b>, consultivo. Diga "medido frente a la máscara", nunca que un reloj o un sistema cumple o está aprobado frente a una Recomendación. Las dos horas (GNSS retirado, GNSS restablecido) son la <b>declaración del operador</b>: Kshana no retiró ni restableció nada y no puede verificarlas, así que cítelas tal como se declaran. Una máscara para la que el registro es demasiado corto es <b>INCOMPLETE</b>, nunca un resultado satisfactorio. Un registro de servo (linuxptp, chrony) es el error bajo control de servo, no una medición independiente frente a UTC; diga de qué registro proceden las cifras. Véase <c1/>.

# text
seg-18d3f2b50d0a = Cualquier resultado de escenario

# text
# c1: figure_tiers
# c2: label
seg-aab46d50d125 = El <c1/> o la <c2/> que declara, y la línea de procedencia.

# text
seg-166f773b2804 = Límites

# text
seg-203a91deb52c = Use datos sintéticos o los propios del usuario. No nombre personas, buques ni organizaciones en las salidas que no estuvieran en la entrada del usuario. Kshana es una herramienta de análisis y formación, no un producto de vuelo ni de navegación.

# text
seg-ec064f62f7dc = <s1>Anterior</s1>Servidor MCP: modo HTTP autoalojado

# text
seg-1f44dbd65ce3 = <s1>Siguiente</s1>Dónde se puede acceder a cada capacidad
