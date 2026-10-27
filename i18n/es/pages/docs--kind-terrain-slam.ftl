# docs--kind-terrain-slam: translations (es)

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
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Fuente: <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (tipo de escenario)

# text
seg-6bdc150ab25b = Navegación secuencial (recursiva) por referencia al terreno sin GPS: un filtro de partículas ejecuta el modelo de medida de correlación con el terreno época a época (SITAN como filtro en ejecución), de modo que se sigue a lo largo de la trayectoria una deriva del INS variable en el tiempo, mientras que el terrain-nav por lotes solo recupera un único desfase constante.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Una ejecución de <c1/> se resume así: terrain-slam | { "60" } puntos de ruta | RMS inercial libre { "2947" } m (final { "5082" } m) | RMS con correlación de terreno { "1241" } m (final { "69" } m, reducción de 2x) | ESS medio 2599/4000 | sigma de correlación { "17.0" } m

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
seg-939d877137f6 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-4aca87f022dc = El gráfico que el motor genera para scenarios/terrain-slam.toml, tipo de escenario terrain-slam

# text
seg-832919783819 = <s1>Anterior</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Siguiente</s1>time-transfer-budget
