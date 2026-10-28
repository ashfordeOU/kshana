# docs--kinds-optical-pnt: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-e6839b50b560 = Figura de mérito conjunta de PNT heterogéneo óptico + RF MODELLED (P5): compone el presupuesto de enlace óptico bidireccional de { "1550" } nm (CRLB de la medición de distancia bidireccional limitada por fotones σ_τ/√N y huella de difracción λ/D·distancia), un nivel de protección RAIM de separación de soluciones entre modalidades (posición Y temporización) que fusiona las soluciones RF holgada y óptica ajustada con covarianzas dispares, la disponibilidad óptica de cielo despejado de N estaciones (unión independiente { "1" }−Π({ "1" }−a_i) y una variante con correlación espacial), un traspaso de estado/covarianza óptico↔RF con una media continua bit a bit (sin salto) PROBADA y una barrera de coherencia NEES χ², y una puntuación conjunta de P(disponible Y de grado de precisión Y con integridad asegurada) con tratamiento de la correlación. Forma cerrada VALIDATED: el CRLB de la medición de distancia, la huella de difracción, el cuantil de nivel de protección χ², la combinatoria de la unión, la continuidad de la media del traspaso + la barrera NEES y el producto independiente conjunto. MODELLED: las asignaciones de pérdidas ópticas, las magnitudes σ de RF/óptica, las entradas de climatología de nubes, las correlaciones y el presupuesto P_HMI. No es un producto de disponibilidad/integridad certificado.

# attr:alt
seg-5cea5229815e = El gráfico que el motor escribe para scenarios/hybrid-optical-rf.toml, tipo de escenario hybrid-optical-rf

# text
seg-a878d9be65b7 = PNT óptico MODELLED a través de la atmósfera: para un enlace óptico y un conjunto de emplazamientos terrestres con climas nubosos indicados, indica la pérdida de aire despejado dependiente de la longitud de onda y de la elevación (ley de visibilidad de Kim más Rayleigh), el estado de turbulencia de Hufnagel-Valley (varianza de Rytov, índice de centelleo, parámetros gamma-gamma, promediado de apertura), la disponibilidad condicionada por el tiempo meteorológico frente al margen del enlace (profundidad óptica de las nubes a partir de un clima de agua líquida lognormal, extinción de óptica geométrica, desvanecimiento por turbulencia independiente), el margen de enlace necesario para las disponibilidades objetivo, la distribución de la duración de las interrupciones, el crecimiento del error de temporización y de distancia por interrupción mediante el modelo de holdover del reloj, la disponibilidad por diversidad de emplazamientos correlacionada con la distancia, y las ganancias hipotéticas de las técnicas de mejora (longitud de onda, apertura de recepción, reducción del centelleo mediante óptica adaptativa, margen adicional). VALIDATED como implementación de las fórmulas indicadas frente a una referencia independiente de mpmath: varianza de Rytov, índice de centelleo, probabilidad de desvanecimiento gamma-gamma, factor de promediado de apertura, profundidad óptica de nubes y de aire despejado. MODELLED: todas las entradas de tiempo meteorológico, de técnica y de reloj y los supuestos de independencia y de cópula; no se ha comparado ningún registro medido de disponibilidad. Análisis de carácter consultivo, no un producto certificado de disponibilidad ni de navegación.

# attr:alt
seg-4e2b759aff17 = El gráfico que el motor genera para scenarios/optical-atmosphere-network.toml, tipo de escenario optical-atmosphere

# text
seg-4e31c8daf798 = Registro

# text
# c1: docs/kinds/optical-pnt.md
seg-963749981a7c = Fuente: <c1/>

# text
seg-079c8b284c44 = PNT óptico (familia de tipos de escenario)

# text
seg-6dea687b727b = { "2" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/optical-atmosphere-network.toml
seg-d019c8511f48 = Páginas temáticas: <a1>OPTICAL-ATMOSPHERE</a1>. Ejecute uno: <c1/>. Todas las familias: <a2>KINDS.md</a2>.

# attr:alt
seg-b8f937411028 = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia PNT óptico

# text
seg-76131e6805e5 = PNT óptico MODELLED a través de la atmósfera: para un enlace óptico y un conjunto de emplazamientos en tierra con climas de nubosidad declarados, informa de la pérdida en aire despejado dependiente de la longitud de onda y de la elevación (visibilidad de Kim

# text
seg-55725043f48e = Figura de mérito conjunta MODELLED de PNT óptico + RF heterogéneo (P5): compone el presupuesto de enlace óptico bidireccional de { "1550" } nm (CRLB de la medición bidireccional de distancias limitada por fotones σ_τ/√N y huella de difracción λ/D·distancia), un

# text
seg-5e658f01d9f4 = HETEROGENEOUS (etiqueta de resultado)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-750466e3188c = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-9e3ce423c0b9 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>optical-atmosphere</a1>.

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
seg-93f5d0527850 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

# text
seg-6a6f8eea5767 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>hybrid-optical-rf</a1>.

# text
seg-a4baaf1fbb8c = <s1>Anterior</s1>Análisis de misión, enlaces y operaciones espaciales

# text
seg-48792381ba0b = <s1>Siguiente</s1>Navegación de usuarios espaciales

seg-22449071fb11 = <s1>Anterior</s1>Hilos de misión
