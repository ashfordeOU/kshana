# docs--kinds-inertial-fusion-and-quantum-sensors: translations (es)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Tipo

# text
seg-ec26df467b88 = PNT con fusión de sensores mediante un filtro de Kalman conjunto sobre las mismas entradas híbridas.

# attr:alt
seg-c8a1c797f4b1 = El gráfico que escribe el motor para scenarios/fusion-pnt.toml, tipo de escenario fusion

# text
seg-38df285a3f25 = EKF de estado de error GNSS/INS con acoplamiento débil y fuerte.

# attr:alt
seg-7d993b676006 = El gráfico que escribe el motor para scenarios/gnss-ins.toml, tipo de escenario gnss-ins

# text
seg-c6edf89eb8d4 = UKF híbrido cuántico + clásico GNSS/INS fuertemente acoplado de 17 estados (MODELLED): { "15" } estados de error INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase + frecuencia) del motor de reloj de parámetros q, accionado por el modelo de error de CAI acotado. La figura de mérito es la autocoherencia del filtro (NEES + blancura de la innovación frente a los límites χ²), una afirmación de autocoherencia, NO una garantía de precisión en el mundo real. Solo simulación; sin TRL>{ "3" }, sin herencia de vuelo, sin validación externa.

# attr:alt
seg-2968660fa880 = El gráfico que el motor escribe para scenarios/hybrid-ukf.toml, tipo de escenario hybrid-ukf

# text
seg-22cd963c7042 = Integración final de PNT híbrido: reloj + IMU + ayuda de transferencia de tiempo.

# attr:alt
seg-52378a7b074c = El gráfico que el motor escribe para scenarios/hybrid-pnt.toml, tipo de escenario hybrid

# text
seg-bdedf28adc48 = Navegación inercial estimada de 1 DOF durante una interrupción de GNSS.

# attr:alt
seg-873c402bb724 = El gráfico que el motor escribe para scenarios/imu-deadreckoning.toml, tipo de escenario inertial

# text
seg-5b9a6efe6337 = Modelo de error de deriva INS/TRN: error de posición frente a la duración de la deriva, construido a partir de coeficientes de IMU en lugar de barrerse como una tasa de deriva supuesta. Cinco contribuciones de crecimiento (sesgo del acelerómetro, inclinación por sesgo del giróscopo a través de la gravedad, paseo aleatorio de velocidad, paseo aleatorio de ángulo y factor de escala frente a la distancia recorrida), cada una propagada a través de un modelo de error inercial de nivel local de nueve estados con realimentación de Schuler a una latitud y altura declaradas (las leyes de primer orden de deriva corta t², t³, t^{ "1.5" }, t^{ "2.5" } y t¹/t² se indican junto a él) y combinadas con una regla DECLARADA (suma cuadrática por defecto, o suma lineal, o suma determinista con rss estocástica; las tres se calculan en cada ejecución para que la elección sea visible y no quede oculta). Las duraciones de deriva que alcanzan los umbrales de posición aportados por quien llama ({ "10" } m y { "50" } m por defecto) las localiza la bisección ya existente del motor, cada una con un desglose por contribución que nombra la fuente dominante, y el cruce de cada contribución individual se invierte además algebraicamente para que ambos coincidan. Un modo de navegación relativa al terreno acota la deriva con fijaciones de posición periódicas e indica el mayor intervalo entre fijaciones que mantiene cada umbral; una fijación solo de posición deja vivos el error de velocidad y la inclinación a través de la fijación, por lo que no siempre acota la deriva a cualquier frecuencia de fijación, y el informe lo dice en lugar de devolver un cero. MODELLED: los coeficientes de clase de IMU son cifras representativas de banda, no una hoja de datos, y el residuo de la fijación de terreno es una entrada. Un umbral no alcanzado se indica como nulo con un estado, nunca como cero. No es un producto certificado de rendimiento de navegación inercial.

# attr:alt
seg-134a4c91da3a = El gráfico que el motor escribe para scenarios/ins-trn-coast.toml, tipo de escenario ins-trn-coast

# text
seg-04310cd6cbec = Detección de fallos y anomalías MODELLED para sistemas de PNT cuántico: un catálogo etiquetado de fallos (salto de frecuencia, deriva y pérdida de enganche del reloj; escalón de sesgo y pérdida de señal del sensor), un AUC de la ROC del estadístico de detección (con un IC bootstrap de eval_stats, validado externamente) y un fallo mínimo detectable con una tasa fija de falsas alarmas, con el monitor asistido por reloj cuántico (menor ruido) detectando fallos más pequeños, como TradeEvidence honesta + representatividad. Modelo gaussiano del estadístico de detección (AUC = Phi(mu/(sigma*sqrt2))); modela la clase, con parámetros ilustrativos de fuentes públicas, sin TRL, vuelo ni certificación.

# attr:alt
seg-2f1d14239d1a = El gráfico que el motor genera para scenarios/quantum-anomaly-detect.toml, tipo de escenario quantum-anomaly-detect

# text
seg-790fbfdd80f0 = Navegación cuántica sin GNSS MODELLED: durante una interrupción de GNSS, un presupuesto inercial cuántico (interferómetro de átomos fríos) frente a un INS clásico de grado de navegación: crecimiento del error de posición durante la deriva, holdover hasta un umbral de posición, y la comparación cuántico-frente-a-clásico como TradeEvidence honesta con representatividad. Nota honesta de observabilidad: sin una fijación externa, el sesgo del acelerómetro no es observable, por lo que el error crece; el sensor cuántico reduce esa brecha pero no la cierra. Parámetros de dispositivo ilustrativos de fuentes públicas; modela la clase, sin TRL, vuelo ni certificación.

# attr:alt
seg-1bdbf1a737b2 = El gráfico que el motor genera para scenarios/quantum-gnss-free-nav.toml, tipo de escenario quantum-gnss-free-nav

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Comparación de PNT cuántico frente a clásico ({ "13503" }): beneficio en holdover de temporización y en holdover inercial de un reloj candidato (una curva de ADEV medida, el eje de la defendibilidad, o una clase de reloj cuántico) frente a una clase de línea base clásica, con la salvedad del supuesto de suelo de tau largo incluida en el artefacto, más una envolvente de resiliencia frente al tiempo sin GNSS. MODELLED; cuantifica (nunca valida) un dispositivo de socio. El reloj candidato es una curva medida (<c1/> + <c2/>, de igual longitud, con al menos { "2" } puntos; prevalece cuando se dan ambas formas) o una <c3/>.

# attr:alt
seg-c74c63ffd859 = El gráfico que el motor genera para scenarios/quantum-trade.toml, tipo de escenario quantum-trade

# text
seg-4e31c8daf798 = Registro

# text
seg-9095869ec445 = { "9" } tipos de escenario del motor v{ $version }. De carácter consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Todas las etiquetas de aquí son las del motor o las de la matriz de verificación; un tipo es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-efd15cff3d32 = MODELLED (etiqueta del resultado)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Fuente: <c1/>

# text
seg-23762f3a250b = Sensores inerciales, de fusión y cuánticos (familia de tipos de escenario)

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Páginas temáticas: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Ejecute uno: <c1/>. Todas las familias: <a4>KINDS.md</a4>.

# attr:alt
seg-0e73a37b716b = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia Sensores inerciales, de fusión y cuánticos

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = UKF GNSS/INS fuertemente acoplado, híbrido cuántico+clásico, de 17 estados (MODELLED): { "15" } estados de error del INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase+frecuencia) del motor de relojes de parámetros q

# text
seg-a7d3c32b29b3 = Modelo de error de deriva del INS/TRN en marcha por inercia: error de posición frente a la duración de la marcha por inercia, construido a partir de coeficientes de la IMU y no barrido como una tasa de deriva supuesta.

# text
seg-beb568dec44f = Navegación cuántica MODELLED sin GNSS: durante una interrupción del GNSS, un presupuesto inercial cuántico (interferómetro de átomos fríos) frente a un INS clásico de grado de navegación: crecimiento del error de posición durante la marcha por inercia, holdover t

# text
seg-d948ea4d1f33 = Detección MODELLED de fallos/anomalías para sistemas PNT cuánticos: un catálogo etiquetado de fallos (salto de frecuencia, deriva o pérdida de enganche del reloj; escalón de sesgo o pérdida de señal del sensor), un ROC AUC del estadístico de detección (con un IC bootstrap

# text
seg-48e72d451a50 = Compromiso entre PNT cuántico y clásico ({ "13503" }): beneficio en holdover de temporización y holdover inercial de un reloj candidato (una curva de ADEV medida —el eje de su defendibilidad— o una clase de reloj cuántico) frente a una línea base clásica

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcional: <c7/>.

# text
seg-75867e8b4b4f = <b>Registro:</b> MODELLED { "6" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>inertial</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-fdf140d4ce68 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>hybrid</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
# c11: coupled
seg-3246c9e1e0cb = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcional: <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Registro:</b> MODELLED { "4" } · VALIDATED { "4" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>fusion</a1>.

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
# c6: residual_accel_bias_m_s2
# c7: speed_m_s
# c8: sigma_pr_m
# c9: sigma_rr_mps
# c10: consistency_seeds
# c11: q_factor
# c12: r_factor
seg-d0790a2643ae = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcionales: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-85ab600e3050 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>hybrid-ukf</a1>.

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
# c7: fix_interval_s
# c8: sigma_pos_m
# c9: sigma_vel_mps
# c10: lat_deg
# c11: lon_deg
# c12: alt_m
# c13: trajectory
# c14: tight
seg-3bbd5ce09bee = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcionales: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-08ad3969f65b = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>gnss-ins</a1>.

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
seg-1703619ca20e = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Registro:</b> VALIDATED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-b05e96ce392d = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>quantum-gnss-free-nav</a1>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-cbefb1538dec = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>quantum-anomaly-detect</a1>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>. Opcionales: <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Registro:</b> MODELLED { "1" } · VALIDATED { "2" }. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Anterior</s1>PNT alternativo sin GPS

# text
seg-0585e4ae329e = <s1>Siguiente</s1>Jamming, spoofing y el espectro
