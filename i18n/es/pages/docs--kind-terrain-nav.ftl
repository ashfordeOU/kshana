# docs--kind-terrain-nav: translations (es)

# text
seg-216efc4e6fba = Tipo de escenario del motor v{ $version }, familia <a1>PNT alternativo sin GPS</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondencia con mapas de gravedad, navegación referida al terreno (TERCOM/SITAN), anomalía magnética. Referencia independiente (InternalConsistency): coeficientes de IGRF-14; CRLB de filtro adaptado a partir de primeros principios. El campo del benchmark de gravedad con campo real está comprobado externamente (fila «Gravity-anomaly synthesis from a spherical-harmonic model»), pero su resultado de navegación no tiene referencia independiente externa

# text
seg-d776abd5691c = El PNT alternativo / complementario es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página de familia: <a1>PNT alternativo sin GPS</a1>

# text
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Fuente: <c1/>

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (tipo de escenario)

# text
seg-0d7bf5a4f07e = Navegación por referencia al terreno sin GPS (TERCOM/SITAN): un altímetro radar o barométrico contrasta el perfil de elevación del terreno con un DEM de estilo SRTM para recuperar la deriva del INS.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Una ejecución de <c1/> se resume así: terrain-nav | deriva inercial libre { "70659" } m | con correlación de terreno { "53" } m (reducción de 1342x) | sigma de correlación { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
seg-db286a072e43 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Campos opcionales: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-c5e33c7122e2 = El gráfico que el motor genera para scenarios/terrain-nav.toml, tipo de escenario terrain-nav

# text
seg-0fcad0016c78 = <s1>Anterior</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Siguiente</s1>terrain-slam

seg-e66e2ca31e54 = Página del tema: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> El tipo de escenario y fase <c1/>: un modelo de error inercial de cinco estados por eje (posición, velocidad, sesgo del acelerómetro, inclinación, sesgo del giróscopo) durante un descenso propulsado, ayudado por posiciones AFS (autónomas o diferenciales, con el caso de tres rel
