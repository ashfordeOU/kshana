# docs--kind-lunar-integrity: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Separación de soluciones con hipótesis múltiples de ARAIM según el ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels y add_v42_protecti. Referencia independiente (ExternalDataset): Tres herramientas independientes, preregistradas (0123cee1) antes de que existiera ningún dato de prueba o salida de la referencia independiente, con tolerancias fijadas entonces. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (confirmación ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ejecutado como programa separado bajo GNU Octave { "8.4" } con un adaptador de compatibilidad de unique() del lado del controlador (declarado, sin cambio de algoritmo), con el TOL_PL del ADD de { "0.05" } m: el código Rust reproduce la implementación de referencia del ADD en

# text
# c1: docs/kinds/by-kind/lunar-integrity.md
seg-8ed008b206de = Fuente: <c1/>

# text
# c1: lunar-integrity
seg-26f0cf6d63c0 = <c1/> (tipo de escenario)

# text
seg-4b6daea39f5c = Paso de nivel de protección ARAIM en el polo sur lunar frente a un conjunto representativo de relés LunaNet. sigma_ure_m expone la precisión de medición de distancia de la señal en el espacio (los niveles de protección escalan linealmente con ella, de modo que barrerla responde qué precisión de medición de distancia exige un límite de alerta). Por defecto, el caso histórico de clase LNIS del polo sur.

# text
# c1: scenarios/lunanet-araim.toml
seg-a6eb6de27cb5 = Una ejecución de <c1/> se resume así: lunar-integrity | polo sur | 0/24 épocas disponibles ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-79da500e2726 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/lunanet-araim.toml
seg-21d10aa98c33 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-610fa190a393 = El gráfico que el motor escribe para scenarios/lunanet-araim.toml, tipo de escenario lunar-integrity

# text
seg-1903c67a762d = <b>VALIDATED</b> El paso de geometría a covarianza del nivel de protección lunar: (GᵀG)⁻¹ sobre la geometría con todos a la vista y cada subgeometría de fallo único, proyectada sobre la vertical local a. Referencia independiente (ExternalDataset): Dos implementaciones de terceros consolidadas, compuestas, ambas ejecutadas sin conexión, con el fixture regenerado de extremo a extremo y verificado idéntico byte a byte. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compilado desde código C con -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() invierte la matriz normal mediante LU de Crout con pivoteo parcial, un algoritmo sin relación con el invert4() de Gauss-Jordan escrito a mano de kshana

# text
seg-3c54da43686e = <s1>Anterior</s1>lunar-infrastructure

# text
seg-f6b399c3fd4a = <s1>Siguiente</s1>lunar-interop-export
