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
