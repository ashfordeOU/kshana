# docs--compliance: translations (es)

# text
seg-f65b1f2b4182 = Modo

# text
# c1: docs/COMPLIANCE.md
seg-e19db3d5273b = Fuente: <c1/>

# text
seg-045b24defdbb = Mapa de compliance de integridad DO-316 / DO-229E

# text
seg-9100800daa1c = Este documento hace corresponder los requisitos de nivel de protección y de monitorización de la integridad de la RTCA (antes Radio Technical Commission for Aeronautics) <b>DO-229E</b> (MOPS (normas mínimas de rendimiento operativo) de SBAS (sistema de aumentación basado en satélites)) y <b>DO-316</b> (equipo aerotransportado GPS/SBAS (GPS: Sistema de Posicionamiento Global)) con las funciones de Kshana que los implementan. Es una <b>ayuda de trazabilidad de ingeniería</b>, no una declaración de que se satisfaga ningún requisito: Kshana implementa los algoritmos publicados; no es aviónica aprobada.

# text
# c1: sbas::do316_compliance_map
# c2: docs/ARAIM_REFERENCE.md
seg-0e6ec5617eb5 = La forma legible por máquina es <a1><c1/></a1>; esta prosa es su complemento (reflejo de <a2><c2/></a2>).

# text
seg-d5d7a2ec9c73 = Niveles de protección por mínimos cuadrados ponderados (DO-229E Apéndice J)

# text
# c1: Elᵢ
# c2: Azᵢ
seg-0dc19f403f5e = Para cada satélite <em>i</em> con elevación <c1/> y acimut <c2/> en el usuario, la fila de observación en nivel local (ENU (este-norte-arriba) + reloj) es

# text
# c1: wᵢ = 1/σᵢ²
# c2: σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²
# c3: D = (GᵀWG)⁻¹
seg-6415f7f28e7e = con peso <c1/>, <c2/> (el presupuesto de UDRE (error diferencial de distancia del usuario) / GIVE (error vertical ionosférico de la cuadrícula) / aerotransportado / troposfera). La covarianza de posición es <c3/>; su bloque ENU da los niveles de protección horizontal y vertical (HPL, VPL):

# text
# c1: D
# c2: orbit::invert4
# c3: D[2][2]
# c4: Σᵢ S_{U,i}²·σᵢ²
# c5: inv(GᵀG)
seg-ea574448bda4 = Kshana calcula <c1/> invirtiendo la matriz normal de { "4" }×{ "4" } con la misma rutina que usa la pila de RAIM (monitorización autónoma de la integridad por el receptor) (<c2/>), y valida el resultado de dos maneras (la vía de la covarianza <c3/> y la vía de la proyección <c4/> deben coincidir) y, además, frente a una geometría de referencia independiente de numpy <c5/>.

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-268ae5b25684 = En ruta → NPA (aproximación de no precisión; solo horizontal)

# text
# c1: √(−2·ln 5e-9)
seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

# text
seg-dbae96c75a06 = Aproximación de precisión

# text
seg-1bfafdcf6ab0 = DO-229E MOPS

# text
# c1: 6.0
# c2: Φ⁻¹(1 − 1e-9/2)
# c3: 6.109
# c4: K_V = Φ⁻¹(1 − 1e-7/2) = 5.327
# c5: raim::normal_quantile
seg-1922c53b8340 = Nota de honestidad: el MOPS usa la constante horizontal redondeada <c1/>; el cuantil normal bilateral exacto <c2/> es <c3/>. Kshana usa en el código el { "6.0" } publicado y deriva <c4/> del mismo <c5/> que usa la pila de RAIM, una comprobación cruzada no circular (el valor se redondea al { "5.33" } del MOPS).

# text
seg-ef191c1d3db1 = Combinación libre de ionosfera de doble frecuencia L1/L5 (IS-GPS-705)

# text
# c1: f₁ = 1575.42 MHz
# c2: f₅ = 1176.45 MHz
# c3: γ₁₅ = (f₁/f₅)² = 1.79327
seg-b69825ef05d3 = Con <c1/>, <c2/>, <c3/>:

# text
# c1: 40.3·10¹⁶·TEC/f²
# c2: timetransfer_adv::iono_delay_m
# c3: √(c₁² + c₅²) = 2.588
seg-ce81c6b71738 = El retardo ionosférico de primer orden (<c1/>) se cancela exactamente, verificado frente a la física independiente de <c2/> del motor para un intervalo de TEC (contenido total de electrones). La amplificación del ruido para entradas de igual varianza es <c3/>.

# text
# c1: γ₁₅
# c2: inv(GᵀG)
# c3: sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry
seg-e111fb05a7c6 = <b>En el repositorio, automatizado</b> (en cada commit): los factores K frente a sus definiciones distribucionales, <c1/> y los coeficientes libres de ionosfera (IF) frente a las frecuencias de IS-GPS-705 (IS: especificación de interfaz), la cancelación iono de primer orden frente a la física del retardo independiente, y los niveles de protección por mínimos cuadrados ponderados (WLS) frente a una geometría de referencia de numpy <c2/> (<c3/>).

# text
# c1: tests/sbas_reference.rs
# c2: sbas_protection_level
# c3: waasprotlevels()
# c4: zsiki/rtklib_ws
# c5: d_U
# c6: core/filter.c
seg-f30d84abe275 = <b>Referencia independiente externa, automatizada</b> (<c1/>): dadas la elevación, el acimut y el 1-σ total de cada satélite, <c2/> reproduce el HPL de una implementación independiente, <c3/> en la bifurcación de niveles de protección SBAS de RTKLIB (una biblioteca de código abierto de posicionamiento cinemático en tiempo real) <c4/> (Siki y Takács { "2017" }), en seis épocas que esa herramienta calculó a partir de mensajes difundidos <b>reales de EGNOS (Servicio Europeo de Navegación por Complemento Geoestacionario)</b> (PRN (número de código pseudoaleatorio) geoestacionario { "120" }) y observaciones RINEX (Receiver Independent Exchange Format) reales de la estación BUTE en Budapest (2017-02-19), con <b>< { "2e-3" } m</b>. La referencia independiente redondea K_V a { "5.33" }, de modo que la componente vertical se compara sin factores K, como <c5/> frente a su VPL / { "5.33" }. ESA (Agencia Espacial Europea) gLAB { "v6.0.0" } (<c6/>) usa la misma fórmula.

# text
seg-389e8a57e3e8 = <b>No realizado</b>: el σ por satélite es el propio de la referencia independiente; modelar σ a partir de mensajes UDRE/GIVE en bruto queda fuera de alcance, y no se ha reproducido de extremo a extremo ningún producto oficial publicado de niveles de protección de WAAS (Wide Area Augmentation System) o EGNOS. DO-229E/DO-316 son en sí mismos de pago en la RTCA; la fuente abierta de la derivación son las páginas de SBAS de ICAO/EGNOS (ICAO: Organización de Aviación Civil Internacional) de ESA Navipedia.

# text
seg-7686fb3d3e0c = <s1>Anterior</s1>Referencia ARAIM

# text
seg-0457ef382fb0 = <s1>Siguiente</s1>Correspondencia de resiliencia
