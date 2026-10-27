# docs--kind-hybrid-optical-rf: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
# c1: docs/kinds/by-kind/hybrid-optical-rf.md
seg-0482fec5b0f6 = Fuente: <c1/>

# text
# c1: hybrid-optical-rf
seg-830c574e871b = <c1/> (tipo de escenario)

# text
seg-72ad48275ebe = Tipo de escenario del motor v{ $version }, familia <a1>PNT óptico</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-e6839b50b560 = Figura de mérito conjunta de PNT heterogéneo óptico + RF MODELLED (P5): compone el presupuesto de enlace óptico bidireccional de { "1550" } nm (CRLB de la medición de distancia bidireccional limitada por fotones σ_τ/√N y huella de difracción λ/D·distancia), un nivel de protección RAIM de separación de soluciones entre modalidades (posición Y temporización) que fusiona las soluciones RF holgada y óptica ajustada con covarianzas dispares, la disponibilidad óptica de cielo despejado de N estaciones (unión independiente { "1" }−Π({ "1" }−a_i) y una variante con correlación espacial), un traspaso de estado/covarianza óptico↔RF con una media continua bit a bit (sin salto) PROBADA y una barrera de coherencia NEES χ², y una puntuación conjunta de P(disponible Y de grado de precisión Y con integridad asegurada) con tratamiento de la correlación. Forma cerrada VALIDATED: el CRLB de la medición de distancia, la huella de difracción, el cuantil de nivel de protección χ², la combinatoria de la unión, la continuidad de la media del traspaso + la barrera NEES y el producto independiente conjunto. MODELLED: las asignaciones de pérdidas ópticas, las magnitudes σ de RF/óptica, las entradas de climatología de nubes, las correlaciones y el presupuesto P_HMI. No es un producto de disponibilidad/integridad certificado.

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-30904e2367fc = Una ejecución de <c1/> se resume así: hybrid-optical-rf | huella óptica { "700" } m, { "1489" } fotones -> σ de distancia { "0.194" } mm, σ de temporización { "1.30" } ps | HPL de RAIM cruzado { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protegido) | disponibilidad { "99.5" }% ({ "5" } emplazamientos) | traspaso sin salto OK NEES { "3.34" }∈[0.48,{ "11.14" }] dentro de la barrera | FoM conjunta { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | CRLB/PL χ²/unión/traspaso validados, σ/climatología modelados

# text
# c1: wavelength_nm
# c2: tx_power_w
# c3: tx_aperture_m
# c4: rx_aperture_m
# c5: range_km
# c6: pulse_rms_ps
# c7: integration_s
# c8: atmospheric_loss_db
# c9: pointing_loss_db
# c10: optics_efficiency
# c11: detector_efficiency
# c12: two_way
# c13: rf_pos_sigma_m
# c14: rf_vertical_sigma_m
# c15: rf_clock_sigma_s
# c16: p_fa
# c17: p_md
# c18: alert_limit_h_m
# c19: alert_limit_v_m
# c20: alert_limit_t_s
# c21: grade_pos_m
# c22: grade_time_s
# c23: n_optical_sites
# c24: site_correlation
# c25: fom_correlation
# c26: handoff_inflation
# c27: p_hmi
# c28: fault_ramp_rate_pos_m_s
# c29: fault_ramp_rate_clock_s_s
# c30: process_noise_pos_psd_m2_s
# c31: process_noise_clock_psd_s2_s
# c32: coast_coverage_k
# c33: rf_band
# c34: rf_eirp_dbw
# c35: rf_g_over_t_db
# c36: rf_other_losses_db
# c37: rf_data_rate_bps
# c38: rf_required_eb_n0_db
# c39: rf_chip_rate_hz
# c40: rf_correlator_spacing_chips
# c41: rf_dll_bandwidth_hz
# c42: rf_tracking_threshold_dbhz
# c43: rf_degraded_margin_db
seg-73e5cf56c92c = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

# text
# c1: scenarios/hybrid-optical-rf.toml
seg-27338c8b2e5f = El ejemplo <c1/> establece, entre otros:

# text
seg-7b9ce4689508 = Etiqueta de resultado (la del motor): Figura de mérito conjunta de disponibilidad / precisión / integridad de PNT heterogéneo óptico + RF (P5). Forma cerrada VALIDATED: el CRLB de la medición de distancia limitada por fotones (σ_τ/√N) y la huella de difracción (λ/D·distancia), el cuantil de nivel de protección χ² entre modalidades, la disponibilidad de unión independiente de N estaciones ({ "1" } − Π(

# attr:alt
seg-5cea5229815e = El gráfico que el motor escribe para scenarios/hybrid-optical-rf.toml, tipo de escenario hybrid-optical-rf

# text
# c1: variance
seg-a8923a682728 = <b>MODELLED</b> El informe hybrid-optical-rf declara la configuración de enlace con la que realmente se ejecutó (longitud de onda de portadora, apertura de transmisión y de recepción, distancia, anchura de pulso, integratio. Referencia independiente (InternalConsistency): Sin referencia independiente externa, y no es posible ninguna: esto es una autodescripción, no una medición. Se registra porque su ausencia era un defecto: P5 tenía que citar la longitud de onda de portadora y la apertura de transmisión a partir de valores por defecto del código fuente, y deducir que un <c1/> sin más estaba en metros cuadrados a partir de una comprobación de coherencia interna. La deducción era correcta, y precisamente por eso importaba: nada habría detectado que fuera err

# text
seg-28abb5a84eaa = <b>MODELLED</b> El informe hybrid-optical-rf declara una disponibilidad del enlace RF, compuesta a partir de magnitudes que el motor ya calcula y no de una climatología importada, y . Referencia independiente (InternalConsistency): Sin referencia independiente externa, y se rechaza ExternalDataset. Las dos entradas son un margen de Eb/N0 y un cruce del umbral de C/N0, ambos funciones de un EIRP MODELLED, de una figura de mérito y de una asignación de pérdidas agrupadas; no existe ningún registro medido de disponibilidad de un servicio híbrido óptico/RF Tierra-Luna con el que contrastar la cifra compuesta. Las comprobaciones que existen son internas y se declaran como tales: la composición se recalcula a partir de la r

# text
seg-888004543d37 = <b>MODELLED</b> El informe hybrid-optical-rf emite la razón de precisión de distancia óptica frente a RF con la ÚNICA configuración en la que se evaluaron ambos tramos incluida en el mismo objeto: la sa. Referencia independiente (InternalConsistency): Sin referencia independiente externa para la RAZÓN, y se rechaza ExternalDataset deliberadamente. La cadena RF subyacente sí tiene una: tests/validate_p5_rf_ranging_precision.rs comprueba linkbudget::link_budget y navsignal::dll_code_jitter_chips frente a un fixture independiente de Python/NumPy y frente al valor resuelto codificado de Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz), y el CRLB óptico tiene su propia fila de forma cerrada

# text
seg-db5ff373b50f = <b>MODELLED</b> El informe hybrid-optical-rf declara lo que el monitor chi-cuadrado entre modalidades puede realmente DETECTAR, y no solo que pasa un caso sin fallos: el mínimo detec. Referencia independiente (InternalConsistency): Dos referencias independientes internas, sin conjunto de datos externo. ({ "1" }) Ida y vuelta de forma cerrada: el sesgo mínimo detectable se obtiene invirtiendo la cola chi-cuadrado no central sobre el parámetro de no centralidad (raim::pbias) y se verifica volviendo a introducir la no centralidad resultante en raim::noncentral_chi2_cdf con el umbral propio del monitor, lo que debe devolver P_md. ({ "2" }) Inyección frente a análisis: se escribe un sesgo en la estimación RF de un eje

# text
# c1: label
seg-24f31f6b353f = Figura de mérito conjunta de disponibilidad / precisión / integridad de PNT heterogéneo óptico + RF (P5). Forma cerrada VALIDATED: el CRLB de la medición de distancia limitada por fotones (σ_τ/√N) y la huella de difracción (λ/D·distancia), el cuantil de nivel de protección χ² entre modalidades, la disponibilidad de unión independiente de N estaciones ({ "1" } − Π({ "1" }−a_i)), el invariante de continuidad de la media del traspaso óptico↔RF (sin salto bit a bit) y la barrera NEES χ², y el FoM conjunto inde (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-bec90783ad8b = Figura de mérito conjunta de PNT heterogéneo óptico + RF MODELLED (P5): compone el presupuesto de enlace óptico bidireccional de { "1550" } nm (CRLB de la medición de distancia bidireccional limitada por fotones σ_τ/√N y huella de difracción λ/D·distancia), un nivel de protección RAIM de separación de soluciones entre modalidades (posición Y temporización) que fusiona las soluciones RF holgada y óptica ajustada con covarianzas dispares, la disponibilidad óptica de cielo despejado de N estaciones (independent-un (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-15abc895e477 = MODELLED: las asignaciones de pérdidas ópticas, las magnitudes σ de RF/óptica, las entradas de climatología de nubes, las correlaciones y el presupuesto P_HMI. (catálogo de tipos de escenario (<c1/>))

# text
seg-9fafa5ffb521 = MODELLED. Formas cerradas validadas: CRLB de la medición de distancia (sigma_tau/sqrt(N)), huella de difracción (lambda/D * distancia), cuantil de nivel de protección chi-cuadrado, combinatoria de la unión, continuidad de la media del traspaso + barrera NEES, y el producto independiente conjunto. Las asignaciones de pérdidas, las magnitudes sigma, las entradas de climatología de nubes, las correlaciones y el presupuesto P_HMI son entradas representativas modeladas. Todos los campos siguientes son opcionales y se muestran en su (comentario del archivo de escenario, líneas { "10" } a { "14" })

# text
seg-e5f964e5d422 = --- G15 inyección de fallo de sesgo / rampa contra el monitor entre modalidades --- El sesgo mínimo detectable y la curva de potencia de detección son ANALÍTICOS (inversión chi-cuadrado no central), así que no necesitan entradas propias. Estas dos solo fijan la velocidad de rampa de la que el tiempo de detección indicado es una conversión. Ambas MODELLED. (comentario del archivo de escenario, líneas { "56" } a { "59" })

# text
seg-70f50a62aa12 = --- G17 deriva tras el traspaso: ruido de proceso y cruce del límite de alerta --- Paseo aleatorio sobre el filtro de traspaso de 4 estados existente (este, norte, arriba, reloj). Los límites de alerta son los ya declarados más arriba; solo son nuevos el ruido de proceso y el factor de cobertura. Ambas PSD son entradas representativas MODELLED y los tiempos de cruce escalan directamente con ellas. (comentario del archivo de escenario, líneas { "63" } a { "67" })

# text
seg-9fb4240fb0ef = La autodescripción del informe híbrido óptico/RF es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a97755cb13eb = Página de familia: <a1>PNT óptico</a1>

# text
seg-1586d90cdf1b = <s1>Anterior</s1>holdover-test

# text
seg-211275a00df0 = <s1>Siguiente</s1>hybrid-ukf
