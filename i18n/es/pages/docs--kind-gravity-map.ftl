# docs--kind-gravity-map: translations (es)

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-216efc4e6fba = Tipo de escenario del motor v{ $version }, familia <a1>PNT alternativo sin GPS</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-df8d5e07e737 = mGal

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondencia con mapas de gravedad, navegación referida al terreno (TERCOM/SITAN), anomalía magnética. Referencia independiente (InternalConsistency): coeficientes de IGRF-14; CRLB de filtro adaptado a partir de primeros principios. El campo del benchmark de gravedad con campo real está comprobado externamente (fila «Gravity-anomaly synthesis from a spherical-harmonic model»), pero su resultado de navegación no tiene referencia independiente externa

# text
seg-d776abd5691c = El PNT alternativo / complementario es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página de familia: <a1>PNT alternativo sin GPS</a1>

# text
# c1: docs/kinds/by-kind/gravity-map.md
seg-43227f4c8295 = Fuente: <c1/>

# text
# c1: gravity-map
seg-2a4cb69bc920 = <c1/> (tipo de escenario)

# text
seg-9a58a7b09423 = Navegación sin GPS por correspondencia con mapas de gravedad: un gravímetro de átomos fríos recupera una deriva constante de la INS a partir de la secuencia de anomalías de gravedad que sobrevuela.

# text
# c1: scenarios/gravity-map-nav.toml
seg-c8caaff45826 = Una ejecución de <c1/> se resume así: gravity-map | free-inertial drift { "78302" } m | gravity-matched { "1882" } m | matching sigma { "2.000e0" } mGal

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
seg-4d9bcce2dd39 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

# text
# c1: coeffs
# c2: mascons
# c3: refine_stages
# c4: refine_factor
# c5: noise_seed
# c6: reference
# c7: map_error_mc
seg-54272925e770 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/gravity-map-nav.toml
seg-5dfee3a0cc22 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-c42d90057e9f = El gráfico que escribe el motor para scenarios/gravity-map-nav.toml, tipo de escenario gravity-map

# text
seg-fe3ba7e11502 = <s1>Anterior</s1>gnss-ssv

# text
seg-2b9bdd9def58 = <s1>Siguiente</s1>holdover-test
