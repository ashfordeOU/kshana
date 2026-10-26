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
