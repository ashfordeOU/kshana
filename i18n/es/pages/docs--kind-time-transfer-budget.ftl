# docs--kind-time-transfer-budget: translations (es)

# text
seg-f42465f7d066 = ns

# text
seg-dfe78b9d0811 = GHz

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
# c1: docs/kinds/by-kind/time-transfer-budget.md
seg-937ebbbd612c = Fuente: <c1/>

# text
# c1: time-transfer-budget
seg-6af6f07f5f5a = <c1/> (tipo de escenario)

# text
seg-9a2bb9809aed = Transferencia bidireccional de tiempo y frecuencia por satélite entre dos estaciones a través de un relé geoestacionario: la ecuación bidireccional resuelta para T_A - T_B con cada término no recíproco (retardos del equipo de estación, ionosfera en banda Ku, transpondedor, Sagnac), un presupuesto de incertidumbre en cuadratura cuyo término de tipo A es la TDEV del enlace simulado al tiempo de promediado, un enlace simulado con ruido de fase blanco y de parpadeo y una no reciprocidad diurna, y la estabilidad (tasa, RMS residual, TDEV, ADEV) de cualquier serie suministrada de la Sección { "1" } de la Circular T del BIPM, CSV de MJD,ns o registros de reloj de estación RINEX del IGS. MODELLED.

# text
# c1: scenarios/time-transfer-budget.toml
seg-a4f8e9a09026 = Una ejecución de <c1/> se resume así: time-transfer-budget: desfase europe - north-america { "12.500" } ns (Sagnac { "204.365" } ns, ionosfera { "0.0213" } ns); u combinada { "1.087" } ns (tipo A { "0.031" } ns a { "86400" } s); { "0" } series reales (MODELLED)

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
seg-0353d795ebdf = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: uplink_ghz
# c2: downlink_ghz
# c3: true_offset_ns
# c4: flicker_noise_ns
# c5: diurnal_amplitude_ns
# c6: reciprocity_bias_ns
# c7: step_s
# c8: span_days
# c9: averaging_s
# c10: seed
# c11: series
seg-fe3afa366df2 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/time-transfer-budget.toml
seg-00026a1d3760 = El ejemplo <c1/> establece, entre otros:

# text
seg-2409cc9397c7 = Etiqueta del resultado (la del motor): MODELLED — ecuación bidireccional de TWSTFT (retardos de estación, ionosfera en banda Ku, transpondedor, Sagnac) resuelta a partir de retardos indicados, un presupuesto de incertidumbre en cuadratura con la TDEV del enlace simulado como término de tipo A, un enlace simulado con ruido de fase de parpadeo y no reciprocidad diurna, y la estabilidad de cualquier

# attr:alt
seg-92d3c84024d7 = El gráfico que el motor genera para scenarios/time-transfer-budget.toml, tipo de escenario time-transfer-budget

# text
seg-83b9c66b9e92 = <b>MODELLED</b> La ecuación bidireccional de TWSTFT resuelta para T_A - T_B con los retardos de transmisión y recepción de estación, la asimetría ionosférica de subida y bajada en banda Ku, la diferencia de retardo del transpondedor y los términos de Sagnac, frente a su modelo directo exacto; una incertidumbre en cuadratura

# text
seg-58cf4086c7a5 = <b>MODELLED</b> La ecuación bidireccional de TWSTFT resuelta para T_A - T_B con los retardos de transmisión y recepción de estación, la asimetría ionosférica de subida y bajada en banda Ku, la diferencia de retardo del transpondedor. Referencia independiente (InternalConsistency): Autoconsistencia interna: el modelo directo y la ecuación resuelta coinciden hasta { "1e-15" } s, el término de Sagnac es igual a la forma de lazo 2A omega/c^{ "2" } independiente del BIPM del módulo, el término ionosférico es { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, y los procesos de ruido muestran las formas de TDEV esperadas. LO QUE NO: no se ha comparado ninguna medición real de TWSTFT ni informe de calibración; los retardos y las incertidumbres indicados son entradas, no medidos; t

# text
# c1: label
seg-15de1cdaa684 = MODELLED — ecuación bidireccional de TWSTFT (retardos de estación, ionosfera en banda Ku, transpondedor, Sagnac) resuelta a partir de retardos indicados, un presupuesto de incertidumbre en cuadratura con la TDEV del enlace simulado como término de tipo A, un enlace simulado con ruido de fase de parpadeo y no reciprocidad diurna, y la estabilidad de cualquier serie real UTC-UTC(k) o de reloj de estación suministrada; no comparado con un enlace TWSTFT real (resultado <c1/>)

# text
seg-70448ca49780 = Transferencia bidireccional de tiempo y frecuencia por satélite (TWSTFT) entre dos estaciones ILUSTRATIVAS, una en Europa central y otra en el este de Norteamérica, a través de un relé geoestacionario a { "10" } grados O. La ejecución resuelve la ecuación bidireccional para T_A - T_B a partir de los términos indicados de equipo, transpondedor, ionosfera (banda Ku, 14/11 GHz) y Sagnac. Forma un presupuesto de incertidumbre cuyo término estadístico es la TDEV, a un día, de un simula (comentario del archivo de escenario, líneas { "1" } a { "8" })

# text
seg-4b0d23aed0ab = La ecuación bidireccional de TWSTFT, el presupuesto de incertidumbre y la estabilidad del enlace con parpadeo y no reciprocidad diurna son MODELLED, no validados: se comprueban frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-52e06909ccc5 = <s1>Anterior</s1>terrain-slam

# text
seg-a22fa1c51042 = <s1>Siguiente</s1>timetransfer
