# docs--kind-holdover-test: translations (es)

# text
seg-f42465f7d066 = ns

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
# c1: docs/kinds/by-kind/holdover-test.md
seg-73929aeded02 = Fuente: <c1/>

# text
# c1: holdover-test
seg-218f00012d0e = <c1/> (tipo de escenario)

# text
seg-c0924aa36e64 = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que suministra el OPERADOR (un registro de linuxptp ptp4l, phc2sys o ts2phc, un registro de seguimiento o estadísticas de chrony, un registro de reloj TICC, TimeLab o RINEX, o pares time_s,time_error_ns). La prueba tiene cuatro pasos y Kshana no realiza ninguno: una LÍNEA BASE con enganche, GNSS RETIRADO por el operador (el cable de antena o la salida del simulador; Kshana no transmite ni controla nada) en un instante indicado, HOLDOVER con el oscilador propio del sistema, y RECUPERACIÓN después de que el operador restablezca el GNSS en un segundo instante indicado. El registro se divide en esos dos instantes. Línea base: estadísticas de error de tiempo y las máscaras de ITU-T escritas para un reloj enganchado. Holdover: estadísticas, el desvío fraccionario de frecuencia que mantuvo el sistema (una recta de mínimos cuadrados), las máscaras escritas para holdover o para un reloj autónomo, la envolvente de holdover de ePRTC-A a partir de la duración indicada de enganche, y el tiempo hasta superar cada presupuesto de error de tiempo. Recuperación: si |TE| entró dentro de una banda indicada y cuándo, y si permaneció en ella, el máximo y el mayor salto. Todo límite se transcribe de una tabla pública de ITU-T (las máscaras de temporización de telecomunicaciones); las palabras son «medido frente a la máscara», y los dos instantes son una declaración del operador, no verificada. Un registro demasiado corto para una máscara es INCOMPLETE, nunca se extrapola. Véase docs/TIMING-HIL.md.

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-cd6d840a1382 = Una ejecución de <c1/> se resume así: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

# text
# c1: test
# c2: series
seg-6a3dc8804be5 = Campos obligatorios: <c1/>, <c2/>

# text
# c1: masks
# c2: budgets
seg-4792040e4773 = Campos opcionales: <c1/>, <c2/>

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-ad4f9c40e317 = El ejemplo <c1/> establece, entre otros:

# text
seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

# text
seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

# text
seg-a0f9749e9ca1 = master

# text
seg-cd857523297f = phase

# text
seg-29a012ae4735 = refuse

# text
seg-d578fc8e6052 = Etiqueta del resultado (la del motor): MODELLED — una prueba de holdover puntuada a partir de un registro de error de tiempo suministrado por el operador. Todo límite se transcribe de la Recomendación pública de ITU-T nombrada y el resultado se mide frente a la máscara; no dice nada sobre si algún reloj o sistema satisface una Recomendación, y nadie lo ha calificado ni aprob

# attr:alt
seg-8ce93392747b = El gráfico que escribe el motor para scenarios/holdover-test-ptp4l.toml, tipo de escenario holdover-test

# text
# c1: holdover-test
seg-3361819ae321 = <b>MODELLED</b> El tipo de escenario <c1/>: un registro de error de tiempo (un registro de reloj de linuxptp, chrony, TICC, TimeLab o RINEX, o pares time_s,time_error_ns) se divide en los dos instantes que indica el operador para la retirada y el restablecimiento del GNSS en una línea base, un holdover y

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> El error máximo de intervalo de tiempo y la desviación de tiempo que informa el tipo de escenario <c1/>, en un registro de holdover de escala de telecomunicaciones: una cola monótona deslizante O(n). Referencia independiente (ExternalDataset): allantools { "2024.06" } — una biblioteca independiente de terceros de estabilidad de frecuencia — mtie() y tdev() sobre tests/fixtures/telecom_timing/holdover_te_series.csv, con la serie analizada a partir del mismo texto de 17 cifras significativas en ambos lados; la referencia registra el SHA-256 de la serie y es regenerable sin conexión mediante tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valida los ESTIMADORES en este registro, no el sin

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Límites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado y ePRTC-A en holdover (incluida la envolvente de error de tiempo de la Tabla { "3" }. Referencia independiente (InternalConsistency): Transcripción de las Recomendaciones citadas (de descarga libre en itu.int), con cada límite acompañado de su tabla o cláusula, y con cada elemento sin confirmar o sin implementar listado en docs/TELECOM-TIMING.md; las identidades de continuidad en los puntos de ruptura que implican las tablas se comprueban en las pruebas. Una transcripción de normas con comprobaciones de coherencia interna, no una prueba de ajuste a la norma ni una validación externa. { "0.30" } round { "2" } (pre-register

# text
# c1: holdover-test
seg-142528f34e66 = <b>MODELLED</b> El tipo de escenario <c1/>: un registro de error de tiempo (un registro de reloj de linuxptp, chrony, TICC, TimeLab o RINEX, o pares time_s,time_error_ns) se divide en los dos instantes en que th. Referencia independiente (InternalConsistency): Cálculo manual sobre registros construidos a partir de fórmulas cuya pendiente, escalón, extremo y tiempo de recuperación se conocen antes de la ejecución (las pruebas los indican), y las máscaras, la envolvente y los presupuestos de las filas de temporización de telecomunicaciones anteriores. No se puntuó ninguna medición de laboratorio de un holdover real ni se comparó con ninguna referencia independiente externa, por lo que el tipo de escenario no afirma nada sobre ningún reloj o sistema; se necesita un socio de laboratorio de temporización antes de cualquier per-clock-class fi

# text
# c1: label
seg-59ff0b0e3d2d = MODELLED: una prueba de holdover puntuada a partir de un registro de error de tiempo aportado por el operador. Cada límite está transcrito de la Recomendación pública ITU-T citada y el resultado se mide frente a la máscara; no dice nada sobre si algún reloj o sistema satisface una Recomendación, y nadie lo ha calificado ni aprobado. Los instantes en que se retiró y se restableció el GNSS son una declaración del operador y no están verificados. Software de carácter consultivo (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-daeb4ad7aa35 = Prueba de holdover MODELLED de un sistema de temporización, puntuada a partir de un registro de error de tiempo que aporta el OPERADOR (un registro ptp4l, phc2sys o ts2phc de linuxptp, un registro de tracking o de estadísticas de chrony, un registro de reloj de TICC, TimeLab o RINEX, o pares time_s,time_error_ns). (catálogo de tipos de escenario (<c1/>))

# text
seg-ff3008c250cc = Las máscaras de sincronización de telecomunicaciones ITU-T con PASS/FAIL y margen son MODELLED, no validadas: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8ccd0f911626 = La prueba de holdover puntuada a partir de un registro de error de tiempo aportado por el operador es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-72bad5444282 = Página temática: <a1>TIMING-HIL.md</a1>

# text
seg-3b3a24664dae = Página temática: <a1>HARDWARE-SAFETY.md</a1>

# text
seg-b754be35fb52 = <s1>Anterior</s1>gravity-map

# text
seg-e7665ee5e30e = <s1>Siguiente</s1>hybrid-optical-rf
