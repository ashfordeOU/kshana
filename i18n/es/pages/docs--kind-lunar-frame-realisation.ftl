# docs--kind-lunar-frame-realisation: translations (es)

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-49f323360dc3 = <b>VALIDATED</b> Ajuste del datum de Helmert de 7 parámetros + enlace de orientación ICRF a partir de una red de puntos. Referencia independiente (ExternalDataset): Resolutor independiente de transformación de similitud de Umeyama (Horn) ponderado de forma cerrada (basado en SVD de numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A): un algoritmo distinto del ajuste iterativo de Gauss–Newton de kshana, que alcanza el mismo óptimo de mínimos cuadrados ponderados unívocamente definido sobre redes de puntos idénticas byte a byte

# text
# c1: docs/kinds/by-kind/lunar-frame-realisation.md
seg-0225ace73ba8 = Fuente: <c1/>

# text
# c1: lunar-frame-realisation
seg-a092c5795651 = <c1/> (tipo de escenario)

# text
seg-0c4c119abfca = Realización modelada del marco de referencia lunar: un ajuste de datum de Helmert (similitud) de 7 parámetros ({ "3" } de traslación, { "3" } de rotación de ángulo pequeño, { "1" } de escala) que liga un conjunto estimado de coordenadas de puntos MCMF derivadas de lo selenográfico a un datum mediante mínimos cuadrados ponderados (crate::batch_ls::gauss_newton), más un sencillo enlace de orientación que expresa la pequeña rotación realizada en torno a los ejes ICRF respecto de la orientación del cuerpo WGCCRE de la IAU { "2015" }. El escenario inyecta una transformación pequeña conocida (traslación ~decenas de m, rotación ~µrad, escala ~{ "1e-7" }) en una red sintética de puntos bien repartidos, añade ruido gaussiano con semilla, recupera el datum e informa de la transformación recuperada, del error de recuperación por parámetro frente a la verdad inyectada y del residuo RMS posterior al ajuste. Autocoherencia MODELLED: recupera una transformación de similitud inyectada (sin ruido hasta ~precisión de máquina), NO es una realización frente a datos reales de seguimiento/VLBI; determinista (con semilla); sin TRL/herencia/respaldo de ninguna agencia.

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-32d5e2749e64 = Una ejecución de <c1/> se resume así: lunar-frame-realisation | { "8" } puntos | err. de traslación { "3.125e-1" } m, err. de rotación { "3.418e-7" } rad, err. de escala -5.891e2 ppb | residuo rms { "0.887" } m | converged false

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-e732d2c2ab91 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: scenarios/lunar-frame-realisation.toml
seg-29f85024974b = El ejemplo <c1/> establece, entre otros:

# text
seg-49baab4910f3 = ppb

# text
seg-a7d59ba6e225 = rad

# attr:alt
seg-f3a6d69d0225 = El gráfico que el motor escribe para scenarios/lunar-frame-realisation.toml, tipo de escenario lunar-frame-realisation

# text
# c1: kshana kinds --json
seg-f99a78efa965 = Autocoherencia MODELLED: recupera una transformación de similitud inyectada (sin ruido hasta ~precisión de máquina), NO es una realización frente a datos reales de seguimiento/VLBI; determinista (con semilla); sin TRL/herencia/respaldo de ninguna agencia. (catálogo de tipos de escenario (<c1/>))

# text
seg-238cea087ae0 = Honestidad: autocoherencia MODELLED. La referencia independiente es la recuperación de una transformación de similitud de 7 parámetros inyectada (sin ruido hasta ~precisión de máquina) más la identidad algebraica de ida y vuelta de apply_helmert. Esto NO es una realización del marco de referencia lunar frente a datos reales de seguimiento / VLBI y no reclama ninguna precisión absoluta del marco. Determinista (con semilla). No se reclama TRL, herencia de vuelo ni respaldo de ninguna agencia. (comentario del archivo de escenario, líneas { "23" } a { "27" })

# text
seg-07550d3d9610 = <s1>Anterior</s1>lunar-frame-campaign

# text
seg-5a3a7120aae2 = <s1>Siguiente</s1>lunar-infrastructure
