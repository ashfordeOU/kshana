# docs--kind-lunar-station-coverage: translations (es)

# text
seg-9feefecdcf67 = rafs

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-6f4246bd8f6f = <b>MODELLED</b> Estación de referencia diferencial de clase NovaMoon: cancelación de modo común + residuo que crece con la línea base + niveles de protección DGNSS. Referencia independiente (InternalConsistency): Identidad de cancelación de errores diferencial + reutilización de la maquinaria de PL de SBAS DO-229E; la diferencia simple + resolución WLS se contrasta además con lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilado): código de resolución independiente, pero con el mismo álgebra de primer orden de la diferencia de LOS, por lo que sigue siendo InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Los tres términos que recoge una corrección diferencial entre la época en que se calcula y la época en que se usa, cada uno dejado antes como margen sin modelar:. Referencia independiente (InternalConsistency): Identidades de forma cerrada y autocoherencia: la varianza step²/12 del cuantizador uniforme, la propagación exacta de covarianza (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que se reduce a σ·PDOP para σ iguales, la transferencia { "1" }:{ "1" } del término de topografía como consecuencia de û_user ≈ û_ref, y el cierre en cuadratura de la desconexión. La contrastación del PDOP con orbit::dop comparte la matriz normal [−û, { "1" }], por lo que es una comprobación de coherencia y se etiqueta como tal en lugar de una in

# text
seg-7171b2e3f29d = El PNT diferencial lunar es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = El PNT diferencial lunar: presupuesto de residuo del enlace de corrección es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Página temática: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-station-coverage.md
seg-f3231c08fa26 = Fuente: <c1/>

# text
# c1: lunar-station-coverage
seg-1a28838279fe = <c1/> (tipo de escenario)

# text
seg-f7ea776e70c9 = Cobertura modelada de estaciones de referencia lunares: un barrido de Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios del polo sur y un día de épocas. Una estación de referencia diferencial en un emplazamiento conocido del polo sur corrige una constelación declarada (kepleriana ilustrativa o unas efemérides tabuladas) con un error declarado de señal en el espacio, un error de topografía, una latencia de corrección y una cuantización del enlace; por punto y sobre la región informa del percentil del error de posición corregido y sin corregir (3D, horizontal, vertical), la disponibilidad, la cobertura frente a un umbral declarado, los niveles de protección DO-229E, el radio de cobertura por acimut y el presupuesto del enlace de corrección en la estación y en el peor punto. No es una afirmación sobre el rendimiento de ningún sistema real; sin afiliación ni respaldo de ninguna agencia. MODELLED.

# text
# c1: scenarios/lunar-station-coverage.toml
seg-d18c93c2e136 = Una ejecución de <c1/> se resume así: lunar-station-coverage | { "346" } puntos x { "144" } épocas x { "200" } pruebas | disponibilidad { "92.2" } % | cobertura { "76.5" } % (p95 <= { "20" } m) | p95 3D corregido { "15.592" } m (sin corregir { "1056.892" } m) | HPL máx. { "480.385" } m | MODELLED; no es una afirmación sobre ningún sistema real

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-cb73ac0d57de = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

# text
# c1: scenarios/lunar-station-coverage.toml
seg-0c3460704315 = El ejemplo <c1/> establece, entre otros:

# text
seg-2d84b341a41f = Etiqueta del resultado (la del motor): MODELLED

# attr:alt
seg-922b8656fcae = El gráfico que el motor genera para scenarios/lunar-station-coverage.toml, tipo de escenario lunar-station-coverage

# text
# c1: lunar-station-coverage
seg-4f5941f12127 = <b>MODELLED</b> Barrido Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios en el polo sur y un día de épocas (el tipo de escenario <c1/>): para una estación de referencia diferencial en un emplazamiento conocido del polo sur, por punto y sobre la región, el Pruebas: <a1>lunar_station_coverage_reference.rs</a1>.

# text
# c1: lunar-station-coverage
seg-d547d600ee2d = <b>MODELLED</b> Barrido Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios en el polo sur y un día de épocas (el tipo de escenario <c1/>): para una r diferencial. Referencia independiente (InternalConsistency): Aritmética recalculada por un script de numpy independiente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; preregistrado en tests/fixtures/lunar_station/PREREGISTRATION.md, confirmado por separado en 9caedf97 antes de la primera ejecución): en { "20" } casos con todos los términos de error activados, los conjuntos visibles y el estado son idénticos, los errores de distancia brutos coinciden hasta { "1.4e-14" } m, los vectores y magnitudes del error de posición hasta { "1.4e-9" } m frente a

# text
# c1: label
seg-626ab55f0424 = MODELLED (resultado <c1/>)

# text
seg-6f09def22469 = HONESTIDAD: MODELLED. Bajo los supuestos indicados a continuación, el modelo da estas cifras. No es una afirmación sobre el rendimiento de ningún sistema real; sin afiliación ni respaldo de ninguna agencia; sin ninguna afirmación de TRL ni de herencia de vuelo. Omitido: enmascaramiento del terreno y del horizonte en el polo (la primera limitación), multitrayecto, hardware del receptor. (comentario del archivo de escenario, líneas { "15" } a { "18" })

# text
seg-db27cc015952 = El mapa de cobertura y precisión de la estación de referencia lunar es MODELLED, no validado: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-6ac5bd1500a8 = <s1>Anterior</s1>lunar-llr-datum

# text
seg-625c1973128e = <s1>Siguiente</s1>lunar-time-budget
