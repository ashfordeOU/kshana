# docs--kind-combined-altpnt: translations (es)

# text
# c1: docs/kinds/by-kind/combined-altpnt.md
seg-a83b25413fd8 = Fuente: <c1/>

# text
# c1: combined-altpnt
seg-92b24377c9be = <c1/> (tipo de escenario)

# text
seg-216efc4e6fba = Tipo de escenario del motor v{ $version }, familia <a1>PNT alternativo sin GPS</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f496b7f4c63a = Navegador combinado sin GPS de gravedad + magnetismo + terreno: tres canales de campo escalar fusionados por punto de ruta para obtener una corrección de deriva más precisa (CRLB más bajo) que con cualquier campo por separado.

# text
# c1: scenarios/combined-altpnt.toml
seg-670730bd221e = Una ejecución de <c1/> se resume así: combined-altpnt | free-inertial drift { "70659" } m | gravity { "464" } m magnetic { "782" } m terrain { "368" } m | FUSED { "365" } m

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
seg-cf6981466329 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: coeffs
# c2: mascons
# c3: magnetic_mascons
# c4: igrf_alt_km
# c5: refine_stages
# c6: refine_factor
# c7: noise_seed
# c8: magnetic_grid
seg-078f09d100fa = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/combined-altpnt.toml
seg-557db767b9c3 = El ejemplo <c1/> establece, entre otros:

# text
seg-df8d5e07e737 = mGal

# attr:alt
seg-498b1aea3770 = El gráfico que escribe el motor para scenarios/combined-altpnt.toml, tipo de escenario combined-altpnt

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-0df60ac6343f = <b>MODELLED</b> Correspondencia con mapas de gravedad, navegación referida al terreno (TERCOM/SITAN), anomalía magnética. Referencia independiente (InternalConsistency): coeficientes de IGRF-14; CRLB de filtro adaptado a partir de primeros principios. El campo del benchmark de gravedad con campo real está comprobado externamente (fila «Gravity-anomaly synthesis from a spherical-harmonic model»), pero su resultado de navegación no tiene referencia independiente externa

# text
seg-d776abd5691c = El PNT alternativo / complementario es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-98133e74f88a = Página de familia: <a1>PNT alternativo sin GPS</a1>

# text
seg-49efcd2ced81 = <s1>Anterior</s1>clock

# text
seg-f2ccea3bb03e = <s1>Siguiente</s1>conflict-resilience
