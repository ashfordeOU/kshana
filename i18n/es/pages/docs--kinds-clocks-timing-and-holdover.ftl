# docs--kinds-clocks-timing-and-holdover: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-78cba87823f7 = Holdover del reloj frente a la especificación; conjunto de Monte Carlo opcional (ejecuciones > { "1" }).

# attr:alt
seg-cb0b7da83f5c = El gráfico que escribe el motor para scenarios/clock-ensemble.toml, tipo de escenario clock

# text
seg-c0924aa36e64 = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que suministra el OPERADOR (un registro de linuxptp ptp4l, phc2sys o ts2phc, un registro de seguimiento o estadísticas de chrony, un registro de reloj TICC, TimeLab o RINEX, o pares time_s,time_error_ns). La prueba tiene cuatro pasos y Kshana no realiza ninguno: una LÍNEA BASE con enganche, GNSS RETIRADO por el operador (el cable de antena o la salida del simulador; Kshana no transmite ni controla nada) en un instante indicado, HOLDOVER con el oscilador propio del sistema, y RECUPERACIÓN después de que el operador restablezca el GNSS en un segundo instante indicado. El registro se divide en esos dos instantes. Línea base: estadísticas de error de tiempo y las máscaras de ITU-T escritas para un reloj enganchado. Holdover: estadísticas, el desvío fraccionario de frecuencia que mantuvo el sistema (una recta de mínimos cuadrados), las máscaras escritas para holdover o para un reloj autónomo, la envolvente de holdover de ePRTC-A a partir de la duración indicada de enganche, y el tiempo hasta superar cada presupuesto de error de tiempo. Recuperación: si |TE| entró dentro de una banda indicada y cuándo, y si permaneció en ella, el máximo y el mayor salto. Todo límite se transcribe de una tabla pública de ITU-T (las máscaras de temporización de telecomunicaciones); las palabras son «medido frente a la máscara», y los dos instantes son una declaración del operador, no verificada. Un registro demasiado corto para una máscara es INCOMPLETE, nunca se extrapola. Véase docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = El gráfico que escribe el motor para scenarios/holdover-test-ptp4l.toml, tipo de escenario holdover-test

# text
seg-540545e6f846 = Cadena de temporización cuántica de confianza MODELLED: un presupuesto de transferencia de tiempo de extremo a extremo cuántico (reloj de red óptica + enlace de entrelazamiento o de fotón único) frente a clásico (CSAC + bidireccional por RF), un nivel de protección de temporización reutilizado + una cifra de mérito de seguridad frente a ataques de retardo o repetición (1-P_md), una probabilidad de detección de anomalías del reloj + latencia de CUSUM, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con un registro de representatividad y de brechas hasta el vuelo. Parámetros ilustrativos de dispositivo y enlace de fuentes públicas; modela la clase, sin TRL, vuelo ni certificación reclamados.

# attr:alt
seg-09760f892c7b = El gráfico que el motor genera para scenarios/quantum-time-transfer.toml, tipo de escenario quantum-time-transfer

# text
seg-1b61962464c5 = Temporización de ranuras: segundos hasta que un reloj libre sale de la guarda de una ranura de enrutamiento o de asignación de tareas indexada en el tiempo (el mayor error de tiempo absoluto que tolera la ranura), la contribución de cada término en ese momento con el dominante nombrado (incertidumbre de la fijación, ruido de fase blanco, ruido de frecuencia blanco, de parpadeo, de paseo aleatorio y de carrera aleatoria, desfase de frecuencia residual, temperatura, envejecimiento), el tiempo restante desde la última fijación y el mayor intervalo de fijación que mantiene al reloj dentro, descontada la latencia de la fijación. El oscilador es un valor por defecto de CLASE (csac, uso, dsac, tcxo, ocxo o rafs: una desviación de Allan citada a un segundo y un suelo de ruido rojo supuesto), un PRESET DE HOJA DE DATOS de temporización de telecomunicaciones o una HOJA DE DATOS en línea (máximos de desviación de Allan ajustados como envolvente, más envejecimiento y un coeficiente de temperatura), o un REGISTRO DE FASE MEASURED en línea (su desviación de Allan superpuesta ajustada por mínimos cuadrados ponderados en la base de fase blanca y de modulación de frecuencia de IEEE Std { "1139" }, de modo que el suelo de ruido rojo es medido y no supuesto). Una rotura de la guarda más allá del mayor tiempo de promediado que admite la hoja de datos o el registro se marca como extrapolado. Una sección opcional de spoofing añade el nivel de protección de temporización para un receptor en órbita: velocidad y periodo orbitales, cuánto tiempo puede alcanzar al satélite por pase un único spoofer terrestre, el suelo del monitor asistido por reloj y la latencia de detección de CUSUM, la cota condicional, el arrastre que acumula un spoofer con una tasa de rampa máxima indicada antes de que el satélite salga de su alcance o se ejecute una comprobación independiente, y si cada comprobación de contacto con tierra o de enlace cruzado es independiente de ese spoofer. VALIDATED: la inversión de holdover a partir de un registro ajustado, reservada sobre un reloj real de cesio medido frente a un máser de hidrógeno (tests/slot_timing_cs5071a_holdout.rs, condicionada a los datos); sobre un oscilador de cuarzo medido, la predicción reservada es conservadora pero no queda dentro del umbral, de modo que el caso del cuarzo es MODELLED. MODELLED: las fuentes de clase y de hoja de datos, los términos deterministas y la evaluación del spoofing.

# attr:alt
seg-97a91c8a60cd = El gráfico que el motor genera para scenarios/slot-timing-ocxo-leo.toml, tipo de escenario slot-timing

# text
seg-4f19d4fb1341 = Barrido genérico N-D sobre cualquier paquete mediante claves TOML con puntos o rutas de métricas JSON.

# attr:alt
seg-621a18c07044 = El gráfico que el motor genera para scenarios/sweep-nd-inertial.toml, tipo de escenario sweep-nd

# text
seg-e7ab7b55c969 = Barrido 1-D de estudio de compromisos sobre un parámetro del paquete de relojes.

# attr:alt
seg-c784b8f22f12 = El gráfico que el motor genera para scenarios/sweep-clock-stability.toml, tipo de escenario sweep

# text
seg-a448b24ded2b = Temporización de telecomunicaciones: error de tiempo, error máximo de intervalo de tiempo (MTIE) y desviación de tiempo (TDEV) de un holdover de GNSS, comprobados frente a las máscaras de ITU-T con un PASS o FAIL y un margen por máscara. La entrada es un HOLDOVER SINTÉTICO (un preajuste de oscilador -- ocxo, rubidio, cesio o csac, cada uno con las cifras de estabilidad, envejecimiento y temperatura de una hoja de datos pública de Microchip con nombre -- más el tiempo de pérdida de GNSS, la longitud del registro y el intervalo de muestreo; el reloj libre lleva ruido de frecuencia blanco, de parpadeo y, donde el ajuste a la hoja de datos lo necesita, de paseo aleatorio, envejecimiento lineal y un término de temperatura sinusoidal) o una SERIE INGERIDA de pares [time_s, time_error_ns] dada en línea (y, solo en compilaciones nativas, un archivo CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A y PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tablas 1-2, TDEV Tablas 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC enganchado ({ "30" } ns, Tablas 1-2) y holdover de ePRTC-A (la envolvente de error de tiempo de la Tabla { "3" } que crece de { "30" } ns a { "100" } ns durante el periodo de holdover H fijado por la duración de enganche, MTIE Tabla { "4" }, TDEV Tabla { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) clases A-C de T-BC/T-TSC (max|TE|, error de tiempo constante, MTIE y TDEV filtrados paso bajo) y clase D (max|TE_L| { "5" } ns, la única cifra de la clase D no dejada para estudio posterior); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punto de referencia C (max|TE_L| { "1100" } / { "600" } / { "100" } ns con MTIE Tablas 7-1 a 7-3). Toda entrada que una Recomendación marca para estudio posterior está ausente y no rellenada, y cada informe enumera lo que no está implementado. También indica el tiempo hasta superar cada presupuesto de error máximo de tiempo (por defecto: { "100" } ns de max|TE_HO| de ePRTC, { "400" } ns de asignación de holdover de red, { "1100" } ns de punto C, { "1.5" } us de clase { "4" }), las curvas de MTIE y TDEV como tabla CSV con cada límite de máscara, y una entrada de unidades y procedencia por campo numérico. VALIDATED: los estimadores de MTIE y TDEV frente al paquete allantools sobre una serie de holdover confirmada. MODELLED: las tablas de máscaras son transcripciones, y un holdover sintético es un modelo construido a partir de máximos de hojas de datos, no una medición de ninguna unidad. No es una prueba de ajuste a la norma.

# attr:alt
seg-ec7745a09d08 = El gráfico que el motor genera para scenarios/telecom-synce-eec.toml, tipo de escenario telecom-timing

# text
seg-9a2bb9809aed = Transferencia bidireccional de tiempo y frecuencia por satélite entre dos estaciones a través de un relé geoestacionario: la ecuación bidireccional resuelta para T_A - T_B con cada término no recíproco (retardos del equipo de estación, ionosfera en banda Ku, transpondedor, Sagnac), un presupuesto de incertidumbre en cuadratura cuyo término de tipo A es la TDEV del enlace simulado al tiempo de promediado, un enlace simulado con ruido de fase blanco y de parpadeo y una no reciprocidad diurna, y la estabilidad (tasa, RMS residual, TDEV, ADEV) de cualquier serie suministrada de la Sección { "1" } de la Circular T del BIPM, CSV de MJD,ns o registros de reloj de estación RINEX del IGS. MODELLED.

# attr:alt
seg-92d3c84024d7 = El gráfico que el motor genera para scenarios/time-transfer-budget.toml, tipo de escenario time-transfer-budget

# text
seg-ccb244e60d60 = Transferencia bidireccional de tiempo y frecuencia óptica frente a RF.

# attr:alt
seg-bd76bd68eab3 = El gráfico que el motor genera para scenarios/timetransfer.toml, tipo de escenario timetransfer

# text
seg-4e31c8daf798 = Registro

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Fuente: <c1/>

# text
seg-3b549536beed = Relojes, temporización y holdover (familia de tipos de escenario)

# text
seg-9095869ec445 = { "9" } tipos de escenario del motor v{ $version }. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Todas las etiquetas de aquí son las del motor o las de la matriz de verificación; un tipo es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Páginas temáticas: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Ejecute una: <c1/>. Todas las familias: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Hoja de contactos de los gráficos que el motor genera para los tipos de escenario de la familia Relojes, temporización y holdover

# text
seg-efd15cff3d32 = MODELLED (etiqueta del resultado)

# text
seg-ff7dca09f0f2 = Temporización de telecomunicaciones: error de tiempo, error máximo de intervalo de tiempo (MTIE) y desviación de tiempo (TDEV) de un holdover de GNSS, comprobados frente a las máscaras de ITU-T con un PASS o FAIL y un margen por máscara.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Temporización de ranuras: segundos hasta que un reloj libre sale de la guarda de una ranura de enrutamiento o de asignación de tareas indexada en el tiempo (el mayor error de tiempo absoluto que tolera la ranura), la contribución de cada término en ese

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Transferencia bidireccional de tiempo y frecuencia por satélite entre dos estaciones a través de un relé geoestacionario: la ecuación bidireccional resuelta para T_A - T_B con cada término no recíproco (retardos del equipo de estación, Ku

# text
seg-a2a710b3204f = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que suministra el OPERADOR (un registro de linuxptp ptp4l, phc2sys o ts2phc, un registro de seguimiento o de estadísticas de chrony, un TICC, TimeLab o RINEX

# text
seg-1da440dd525c = Cadena de temporización cuántica de confianza MODELLED: un presupuesto de transferencia de tiempo de extremo a extremo cuántico (reloj de red óptica + enlace de entrelazamiento o de fotón único) frente a clásico (CSAC + bidireccional por RF), un nivel de protección de temporización reutilizado

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionales: <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionales: <c7/>.

# text
seg-e359cc42506e = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Campos obligatorios: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Registro:</b> ninguna fila de la matriz nombra este tipo; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Registro:</b> MODELLED { "5" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Campos obligatorios: <c1/>, <c2/>. Opcionales: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Registro:</b> MODELLED { "2" } · VALIDATED { "1" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Opcionales: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Campos obligatorios: <c1/>, <c2/>. Opcionales: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Registro:</b> ninguna fila de la matriz nombra este tipo; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Anterior</s1>Campañas

# text
seg-960d5c757310 = <s1>Siguiente</s1>Constelaciones, cobertura y geometría
