# docs--kinds-gps-denied-alternative-pnt: translations (es)

# text
seg-b03d56f501c3 = Tipo

# text
seg-f496b7f4c63a = Navegador combinado sin GPS de gravedad + magnetismo + terreno: tres canales de campo escalar fusionados por punto de ruta para obtener una corrección de deriva más precisa (CRLB más bajo) que con cualquier campo por separado.

# attr:alt
seg-498b1aea3770 = El gráfico que escribe el motor para scenarios/combined-altpnt.toml, tipo de escenario combined-altpnt

# text
seg-c8f93431680a = Resiliencia MODELLED de conflicto con PNT por capas (P7): un usuario en un entorno disputado dispone de varias capas PNT (GNSS de servicio abierto, GNSS de banda ancha, una constelación autenticada, un relé de aumentación), cada una con una disponibilidad base, una exactitud de 1σ y una vulnerabilidad de denegación por vector frente a la amenaza compartida de jamming/spoofing. Un Monte Carlo CON SEMILLA con barrido de intensidad deniega cada capa con probabilidad clamp(vulnerabilidad·intensidad·peso_del_vector,{ "0,1" }), fusiona las supervivientes mediante la regla de forma cerrada de varianza inversa σ_fusionada=(Σ 1/σ_i²)^(−1/2), e informa de la probabilidad de pérdida total (todas las capas denegadas), del error fusionado mediano y de estadísticas por capa de uso y denegación frente a la intensidad. La razón de resiliencia principal (probabilidad de pérdida total con una sola capa frente a con capas) resulta de ~7x bajo el supuesto de INDEPENDENCIA; un barrido de denegación correlacionada con cópula gaussiana de un factor muestra entonces que esas ~7x se hunden hacia { "1" } a medida que aumenta la correlación de la denegación (la correlación anula la estratificación). Un bloque de sensibilidad a los a priori recorre la cifra principal sobre los a priori de vulnerabilidad CON FUENTE mediante el tornado mcda + una reasignación del esfuerzo de amenaza de Dirichlet + intervalos de confianza por percentiles. Núcleo VALIDATED: la pérdida total de Monte Carlo converge al producto independiente de forma cerrada Π_i p_deny_i (dentro del error típico de Monte Carlo con semilla fija y N grande); la fusión de varianza inversa es una identidad de forma cerrada; con ρ={ "0" } la cópula se reduce al modelo independiente y todo ρ conserva la tasa marginal de denegación de cada capa. MODELLED: las magnitudes de vulnerabilidad, disponibilidad y exactitud por capa son entradas con fuente pero modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — véase conflict_threat_params), y la magnitud concreta de ~7x y la forma de la curva razón frente a correlación se derivan de esa parametrización. Un desglose de supervivencia por vector del § { "4.2" } resuelve entonces la amenaza de RF compartida en los cuatro vectores con nombre (jamming/spoofing/cinético/ciber) e informa de la curva de degradación gradual de PNT utilizable de cada vector S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibilidad_i,v·x,{ "0,1" }))) — VALIDATED: el Monte Carlo con semilla por capa converge a esa forma cerrada; el jamming es el vector más agudo para la línea base de RF correlacionada y la capa inercial inmune a la RF es la superviviente decisiva. No es un producto de disponibilidad de navegación certificado.

# attr:alt
seg-4dd2bcc206db = El gráfico que escribe el motor para scenarios/conflict-resilience.toml, tipo de escenario conflict-resilience

# text
seg-9a58a7b09423 = Navegación sin GPS por correspondencia con mapas de gravedad: un gravímetro de átomos fríos recupera una deriva constante de la INS a partir de la secuencia de anomalías de gravedad que sobrevuela.

# attr:alt
seg-c42d90057e9f = El gráfico que escribe el motor para scenarios/gravity-map-nav.toml, tipo de escenario gravity-map

# text
seg-0d7bf5a4f07e = Navegación por referencia al terreno sin GPS (TERCOM/SITAN): un altímetro radar o barométrico contrasta el perfil de elevación del terreno con un DEM de estilo SRTM para recuperar la deriva del INS.

# attr:alt
seg-c5e33c7122e2 = El gráfico que el motor genera para scenarios/terrain-nav.toml, tipo de escenario terrain-nav

# text
seg-6bdc150ab25b = Navegación secuencial (recursiva) por referencia al terreno sin GPS: un filtro de partículas ejecuta el modelo de medida de correlación con el terreno época a época (SITAN como filtro en ejecución), de modo que se sigue a lo largo de la trayectoria una deriva del INS variable en el tiempo, mientras que el terrain-nav por lotes solo recupera un único desfase constante.

# attr:alt
seg-4aca87f022dc = El gráfico que el motor genera para scenarios/terrain-slam.toml, tipo de escenario terrain-slam

# text
seg-4e31c8daf798 = Registro

# text
seg-efd15cff3d32 = MODELLED (etiqueta del resultado)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Fuente: <c1/>

# text
seg-d9fdaf3208ca = PNT alternativo sin GPS (familia de tipos de escenario)

# text
seg-9fde6af9e09f = { "5" } tipos de escenario del motor v{ $version }. Carácter consultivo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Cada etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Páginas temáticas: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Ejecute uno: <c1/>. Todas las familias: <a3>KINDS.md</a3>.

# attr:alt
seg-6dfd2dc2721a = Hoja de contactos de los gráficos que genera el motor para los tipos de escenario de la familia PNT alternativo sin GPS

# text
seg-cff60d8c17d2 = Navegación secuencial (recursiva) por referencia al terreno sin GPS: un filtro de partículas ejecuta el modelo de medición de correspondencia con el terreno época a época (SITAN como filtro continuo), de modo que una deriva del INS variable en el tiempo se tr

# text
seg-9d8f69b51742 = Resiliencia MODELLED de PNT por capas ante conflictos (P7): un usuario en un entorno disputado dispone de varias capas de PNT (GNSS de servicio abierto, GNSS de banda ancha, una constelación autenticada, un relé de aumentación), cada una con

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
# c14: coeffs
# c15: mascons
# c16: refine_stages
# c17: refine_factor
# c18: noise_seed
# c19: reference
# c20: map_error_mc
seg-28486745bb43 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Opcionales: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

# text
seg-c2187e8291f9 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>gravity-map</a1>.

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
# c13: refine_stages
# c14: refine_factor
# c15: noise_seed
seg-b1ff6f0e1769 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Opcionales: <c13/>, <c14/>, <c15/>.

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
# c11: n_particles
# c12: init_pos_sigma_deg
# c13: process_sigma_deg
# c14: resample_ess_frac
# c15: seed
seg-3ec7b38184b7 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcionales: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-7c777178ee8f = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>terrain-slam</a1>.

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
# c16: coeffs
# c17: mascons
# c18: magnetic_mascons
# c19: igrf_alt_km
# c20: refine_stages
# c21: refine_factor
# c22: noise_seed
# c23: magnetic_grid
seg-c5124441822e = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Opcionales: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
seg-d78bd011956c = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>combined-altpnt</a1>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Campos obligatorios: ninguno. Opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-ab895b157152 = <b>Registro:</b> ninguna fila de la matriz nombra este tipo de escenario; el motor etiqueta su propio resultado. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>conflict-resilience</a1>.

# text
seg-c0ef7d676ec1 = <s1>Anterior</s1>Mediciones GNSS, posicionamiento e integridad

# text
seg-54b45b00a2f0 = <s1>Siguiente</s1>Fusión inercial y sensores cuánticos

seg-643fa0f18717 = <b>Registro:</b> MODELLED. Página completa, con las entradas, los resultados, las evidencias y las limitaciones: <a1>terrain-nav</a1>.
