# docs--kind-ins-trn-coast: translations (es)

# text
seg-bf51947657c0 = navegación

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-c4ed27a559df = Página de tema: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
# c1: docs/kinds/by-kind/ins-trn-coast.md
seg-f7305f3a0b5a = Fuente: <c1/>

# text
# c1: ins-trn-coast
seg-92b90cb4a839 = <c1/> (tipo de escenario)

# text
seg-5b9a6efe6337 = Modelo de error de deriva INS/TRN: error de posición frente a la duración de la deriva, construido a partir de coeficientes de IMU en lugar de barrerse como una tasa de deriva supuesta. Cinco contribuciones de crecimiento (sesgo del acelerómetro, inclinación por sesgo del giróscopo a través de la gravedad, paseo aleatorio de velocidad, paseo aleatorio de ángulo y factor de escala frente a la distancia recorrida), cada una propagada a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler a una latitud y altura declaradas (las leyes de primer orden de deriva corta t², t³, t^{ "1.5" }, t^{ "2.5" } y t¹/t² se indican junto a él) y combinadas con una regla DECLARADA (suma cuadrática por defecto, o suma lineal, o suma determinista con rss estocástica; las tres se calculan en cada ejecución para que la elección sea visible y no quede oculta). Las duraciones de deriva que alcanzan los umbrales de posición aportados por quien llama ({ "10" } m y { "50" } m por defecto) las localiza la bisección ya existente del motor, cada una con un desglose por contribución que nombra la fuente dominante, y el cruce de cada contribución individual se invierte además algebraicamente para que ambos coincidan. Un modo de navegación relativa al terreno acota la deriva con fijaciones de posición periódicas e indica el mayor intervalo entre fijaciones que mantiene cada umbral; una fijación solo de posición deja vivos el error de velocidad y la inclinación a través de la fijación, por lo que no siempre acota la deriva a cualquier frecuencia de fijación, y el informe lo dice en lugar de devolver un cero. MODELLED: los coeficientes de clase de IMU son cifras representativas de banda, no una hoja de datos, y el residuo de la fijación de terreno es una entrada. Un umbral no alcanzado se indica como nulo con un estado, nunca como cero. No es un producto certificado de rendimiento de navegación inercial.

# text
# c1: scenarios/ins-trn-coast.toml
seg-bbd497aa3ba6 = Una ejecución de <c1/> se resume así: ins-trn-coast | IMU de navegación, { "250" } m/s, combinación rss | { "10" } m a { "251.0" } s (accel_bias) | { "50" } m a { "608.8" } s (accel_bias) | pico TRN solo de posición { "44.7" } m durante { "1200" } s

# text
# c1: imu_grade
# c2: accel_bias_ug
# c3: accel_vrw_m_s_per_sqrt_hr
# c4: accel_scale_factor_ppm
# c5: gyro_bias_deg_per_hr
# c6: gyro_arw_deg_per_sqrt_hr
# c7: speed_m_s
# c8: ref_accel_m_s2
# c9: latitude_deg
# c10: height_m
# c11: combination
# c12: crossing_thresholds_m
# c13: grades
# c14: drift_band_lo_m_per_s
# c15: drift_band_hi_m_per_s
# c16: trn_fix_mode
# c17: trn_fix_interval_s
# c18: trn_fix_residual_m
# c19: mission_duration_s
seg-e0555ca683b1 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/ins-trn-coast.toml
seg-95887c4551c7 = El ejemplo <c1/> establece, entre otros:

# text
seg-4db5a594afc1 = rss

# text
seg-5868f641c089 = ug

# text
seg-1918189ac2bf = ppm

# text
seg-7eba4c5ee1e4 = Etiqueta de resultado (la del motor): presupuesto de error de deriva INS/TRN MODELLED. Cada contribución se propaga a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler (plataforma nivelada con rumbo norte en un emplazamiento declarado, inercial libre incluido el canal vertical inestable); sus leyes de primer orden de deriva corta (sesgo t^{ "2" }, gy

# attr:alt
seg-134a4c91da3a = El gráfico que el motor escribe para scenarios/ins-trn-coast.toml, tipo de escenario ins-trn-coast

# text
seg-7bb77ec86a0a = <b>VALIDATED</b> Presupuesto de error de posición frente a duración de la deriva construido a partir de coeficientes de IMU, con cada fuente de error (sesgo del acelerómetro, sesgo del giróscopo, paseo aleatorio de velocidad, paseo aleatorio de ángulo, factor de escala en crucero y bajo fuerza específica sostenida) propagada a través de un n

# text
seg-d69247df315f = <b>VALIDATED</b> Presupuesto de error de posición frente a duración de la deriva construido a partir de coeficientes de IMU, con cada fuente de error (sesgo del acelerómetro, sesgo del giróscopo, paseo aleatorio de velocidad, paseo aleatorio de ángulo, . Referencia independiente (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), ejecutado como programa independiente bajo GNU Octave { "8.4.0" }: ejecuciones de deriva inercial libre con el mismo perfil de error de IMU, con una zona muerta numérica corregida en su actualización de cuaterniones (qua_update.m: la protección sobre una velocidad angular inferior a { "1e-8" } rad/s sustituida por wnorm == { "0" }, aplicada a una copia en tiempo de ejecución y comprobada una vez para que coincida; con la protección en su sitio, una actitud de plataforma con deriva lenta se congelaba y cortaba el

# text
# c1: label
seg-498cb2f96fa7 = Presupuesto de error de deriva INS/TRN MODELLED. Cada contribución se propaga a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler (plataforma nivelada con rumbo norte en un emplazamiento declarado, inercial libre incluido el canal vertical inestable); sus leyes de primer orden de deriva corta (sesgo t^{ "2" }, inclinación por sesgo del giróscopo t^{ "3" }, paseo aleatorio de velocidad t^{ "1.5" }, paseo aleatorio de ángulo t^{ "2.5" }, factor de escala x distancia recorrida) se contrastan (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-63c221a546f7 = Modelo de error de deriva INS/TRN: error de posición frente a la duración de la deriva, construido a partir de coeficientes de IMU en lugar de barrerse como una tasa de deriva supuesta. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-164504645f4a = MODELLED: los coeficientes de clase de IMU son cifras representativas de banda, no una hoja de datos, y el residuo de la fijación de terreno es una entrada. (catálogo de tipos de escenario (<c1/>))

# text
seg-ee0281a1f401 = La pregunta a la que responde esto: cuando un estudio de GNSS (o con ciclo de trabajo de apertura) dice "suponga una deriva de estima de { "0.001" }–{ "0.050" } m/s", ¿de dónde sale ese número? Sale de la IMU, y este escenario lo calcula en lugar de barrerlo. Cinco términos de crecimiento: sesgo del acelerómetro (t^{ "2" }), inclinación por sesgo del giróscopo a través de la gravedad (t^{ "3" }), paseo aleatorio de velocidad (t^{ "1.5" }), paseo aleatorio de ángulo (t^{ "2.5" }) y factor de escala por la distancia recorrida (comentario del archivo de escenario, líneas { "4" } a { "11" })

# text
seg-32d4adcfe249 = <s1>Anterior</s1>inertial

# text
seg-47366ab55be3 = <s1>Siguiente</s1>integrity
