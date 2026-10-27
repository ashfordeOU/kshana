# docs--kind-telecom-timing: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: una capa de análisis sintáctico que convierte un archivo de reloj RINEX (registros AS/AR de un reloj con nombre, versiones { "2" } y { "3.00" } a { "3.04" }), un registro ASCII de fase o de frecuencia de estilo TimeLab, o un registro de marcas de tiempo o de intervalos de TAPR TICC en una fase uniforme Pruebas: <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> El error máximo de intervalo de tiempo y la desviación de tiempo que informa el tipo de escenario <c1/>, en un registro de holdover de escala de telecomunicaciones: una cola monótona deslizante O(n). Referencia independiente (ExternalDataset): allantools { "2024.06" } — una biblioteca independiente de terceros de estabilidad de frecuencia — mtie() y tdev() sobre tests/fixtures/telecom_timing/holdover_te_series.csv, con la serie analizada a partir del mismo texto de 17 cifras significativas en ambos lados; la referencia registra el SHA-256 de la serie y es regenerable sin conexión mediante tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida los ESTIMADORES en este registro, no el sin

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Límites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado y ePRTC-A en holdover (incluida la envolvente de error de tiempo de la Tabla { "3" }. Referencia independiente (InternalConsistency): Transcripción de las Recomendaciones citadas (de descarga libre en itu.int), con cada límite acompañado de su tabla o cláusula, y con cada elemento sin confirmar o sin implementar listado en docs/TELECOM-TIMING.md; las identidades de continuidad en los puntos de ruptura que implican las tablas se comprueban en las pruebas. Una transcripción de normas con comprobaciones de coherencia interna, no una prueba de ajuste a la norma ni una validación externa. { "0.30" } round { "2" } (pre-register

# text
seg-5547f1f662d3 = y { "2" } más en la matriz.

# text
seg-8aee75a55007 = ocxo

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Fuente: <c1/>

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (tipo de escenario)

# text
seg-a448b24ded2b = Temporización de telecomunicaciones: error de tiempo, error máximo de intervalo de tiempo (MTIE) y desviación de tiempo (TDEV) de un holdover de GNSS, comprobados frente a las máscaras de ITU-T con un PASS o FAIL y un margen por máscara. La entrada es un HOLDOVER SINTÉTICO (un preajuste de oscilador -- ocxo, rubidio, cesio o csac, cada uno con las cifras de estabilidad, envejecimiento y temperatura de una hoja de datos pública de Microchip con nombre -- más el tiempo de pérdida de GNSS, la longitud del registro y el intervalo de muestreo; el reloj libre lleva ruido de frecuencia blanco, de parpadeo y, donde el ajuste a la hoja de datos lo necesita, de paseo aleatorio, envejecimiento lineal y un término de temperatura sinusoidal) o una SERIE INGERIDA de pares [time_s, time_error_ns] dada en línea (y, solo en compilaciones nativas, un archivo CSV). Máscaras: ITU-T G.8272 (07/2025) PRTC-A y PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tablas 1-2, TDEV Tablas 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC enganchado ({ "30" } ns, Tablas 1-2) y holdover de ePRTC-A (la envolvente de error de tiempo de la Tabla { "3" } que crece de { "30" } ns a { "100" } ns durante el periodo de holdover H fijado por la duración de enganche, MTIE Tabla { "4" }, TDEV Tabla { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) clases A-C de T-BC/T-TSC (max|TE|, error de tiempo constante, MTIE y TDEV filtrados paso bajo) y clase D (max|TE_L| { "5" } ns, la única cifra de la clase D no dejada para estudio posterior); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punto de referencia C (max|TE_L| { "1100" } / { "600" } / { "100" } ns con MTIE Tablas 7-1 a 7-3). Toda entrada que una Recomendación marca para estudio posterior está ausente y no rellenada, y cada informe enumera lo que no está implementado. También indica el tiempo hasta superar cada presupuesto de error máximo de tiempo (por defecto: { "100" } ns de max|TE_HO| de ePRTC, { "400" } ns de asignación de holdover de red, { "1100" } ns de punto C, { "1.5" } us de clase { "4" }), las curvas de MTIE y TDEV como tabla CSV con cada límite de máscara, y una entrada de unidades y procedencia por campo numérico. VALIDATED: los estimadores de MTIE y TDEV frente al paquete allantools sobre una serie de holdover confirmada. MODELLED: las tablas de máscaras son transcripciones, y un holdover sintético es un modelo construido a partir de máximos de hojas de datos, no una medición de ninguna unidad. No es una prueba de ajuste a la norma.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Una ejecución de <c1/> se resume así: telecom-timing: max|TE| { "488.2" } ns durante { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = El ejemplo <c1/> establece, entre otros:

# text
seg-e7cab30ef039 = [] (sin elementos)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Etiqueta del resultado (la del motor): MODELLED — error de tiempo, MTIE y TDEV comprobados frente a máscaras de ITU-T transcritas. Los estimadores están validados frente a allantools; las tablas de máscaras son transcripciones de las Recomendaciones indicadas; un holdover sintético es un modelo construido a partir de cifras públicas de hojas de datos, no una medición de ninguna unidad. No es una prueba de ajuste a la norma

# attr:alt
seg-ec7745a09d08 = El gráfico que el motor genera para scenarios/telecom-synce-eec.toml, tipo de escenario telecom-timing

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> El error máximo de intervalo de tiempo y la desviación de tiempo que informa el tipo de escenario <c1/>, sobre un registro de holdover de escala de telecomunicaciones: un MTIE de ventana deslizante con cola monótona de O(n) (telecom_timing::mtie_sliding, necesario para que un día de muestras de un segundo Pruebas: <a1>telecom_timing_reference.rs</a1>.

# text
seg-75aa6f7234ae = <b>MODELLED</b> Límites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Pruebas: <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Siete máscaras de generación de wander de MTIE y TDEV a temperatura constante para el tipo de escenario <c1/>: G.811 (09/1997) PRC (autónomo), G.812 (06/2004) Tipos I, II y III, G.8262 (10/2024) EEC Opciones { "1" } y { "2" } y G.8262.1 (11/2025) eEEC (enganchado

# text
seg-d4bd840708db = <b>MODELLED</b> Cuatro preajustes — OCXO (Microchip OX-208), rubidio (Microchip 8040C), cesio (tubo de alto rendimiento Microchip 5071A) y CSAC (Microchip SA.45s) — cada uno con . Referencia independiente (InternalConsistency): Las cuatro hojas de datos de Microchip con nombre (números de documento y URL en cada preajuste y en docs/TELECOM-TIMING.md) para las cifras de entrada; la rampa de envejecimiento de forma cerrada y la propiedad de envolvente del ajuste como comprobaciones internas. Cómo se convierten las cifras en un modelo de ruido (el ajuste, la regla del suelo, el mes de 30 días, la lectura lineal de la temperatura) es una decisión de modelado; ningún preajuste es una medición de una unidad. { "0.30" } ronda { "2" }, umbrales unilaterales frente

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = todo requisito que las Recomendaciones marcan 'para estudio posterior' (clase D más allá de max|TE_L|, holdover de ePRTC-B, holdover de T-BC/T-TSC con ambas entradas perdidas, límites de red de TDEV, MTIE y TDEV del holdover de ePRTC-A más allá de { "10 000" } s) (resultado <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = error de tiempo dinámico filtrado paso alto (dTE_H, Tabla 7-7 de G.8273.2 y cláusulas 7.3.2-7.3.3 de G.8271.1) (resultado <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = el MTIE de temperatura variable de la Tabla 7-6 de G.8273.2 y el MTIE de holdover asistido por la capa física de la Tabla 7-10 de G.8273.2 (resultado <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = error de tiempo relativo (cTE_R, dTE_R,L) entre dos salidas (resultado <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = el filtro de paquetes de media móvil G.8272 y el estado de G.8272.1 para interfaces PTP: la serie se trata como un error de intervalo de tiempo de un pulso por segundo (resultado <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — error de tiempo, MTIE y TDEV comprobados frente a máscaras de ITU-T transcritas. Los estimadores están validados frente a allantools; las tablas de máscaras son transcripciones de las Recomendaciones indicadas; un holdover sintético es un modelo construido a partir de cifras públicas de hojas de datos, no una medición de ninguna unidad. No es una prueba de ajuste a la norma. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED: las tablas de máscaras son transcripciones, y un holdover sintético es un modelo construido a partir de máximos de hojas de datos, no una medición de ninguna unidad. (catálogo de tipos (<c1/>))

# text
seg-a0ddb65b00af = El reloj: el preajuste OCXO (hoja de datos del Microchip OX-208, Rev 12-1-2021), libre desde la primera muestra, con ruido de frecuencia blanco, de parpadeo y (donde el ajuste lo necesita) de paseo aleatorio ajustados a los máximos de desviación de Allan de la hoja de datos, y su envejecimiento lineal. La temperatura se mantiene constante (amplitud { "0" } K), como suponen las máscaras. (comentario del archivo de escenario, líneas { "12" } a { "15" })

# text
seg-101dbde1c65b = Página temática: <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Anterior</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Siguiente</s1>terrain-nav
