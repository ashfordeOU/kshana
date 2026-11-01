# docs--kind-conflict-resilience: translations (es)

# text
seg-c4ed27a559df = Página de tema: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-216efc4e6fba = Tipo de escenario del motor v{ $version }, familia <a1>PNT alternativo sin GPS</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-98133e74f88a = Página de familia: <a1>PNT alternativo sin GPS</a1>

# text
# c1: docs/kinds/by-kind/conflict-resilience.md
seg-34f14aa2ee0b = Fuente: <c1/>

# text
# c1: conflict-resilience
seg-a80556cfe1a9 = <c1/> (tipo de escenario)

# text
seg-c8f93431680a = Resiliencia MODELLED de conflicto con PNT por capas (P7): un usuario en un entorno disputado dispone de varias capas PNT (GNSS de servicio abierto, GNSS de banda ancha, una constelación autenticada, un relé de aumentación), cada una con una disponibilidad base, una exactitud de 1σ y una vulnerabilidad de denegación por vector frente a la amenaza compartida de jamming/spoofing. Un Monte Carlo CON SEMILLA con barrido de intensidad deniega cada capa con probabilidad clamp(vulnerabilidad·intensidad·peso_del_vector,{ "0,1" }), fusiona las supervivientes mediante la regla de forma cerrada de varianza inversa σ_fusionada=(Σ 1/σ_i²)^(−1/2), e informa de la probabilidad de pérdida total (todas las capas denegadas), del error fusionado mediano y de estadísticas por capa de uso y denegación frente a la intensidad. La razón de resiliencia principal (probabilidad de pérdida total con una sola capa frente a con capas) resulta de ~7x bajo el supuesto de INDEPENDENCIA; un barrido de denegación correlacionada con cópula gaussiana de un factor muestra entonces que esas ~7x se hunden hacia { "1" } a medida que aumenta la correlación de la denegación (la correlación anula la estratificación). Un bloque de sensibilidad a los a priori recorre la cifra principal sobre los a priori de vulnerabilidad CON FUENTE mediante el tornado mcda + una reasignación del esfuerzo de amenaza de Dirichlet + intervalos de confianza por percentiles. Núcleo VALIDATED: la pérdida total de Monte Carlo converge al producto independiente de forma cerrada Π_i p_deny_i (dentro del error típico de Monte Carlo con semilla fija y N grande); la fusión de varianza inversa es una identidad de forma cerrada; con ρ={ "0" } la cópula se reduce al modelo independiente y todo ρ conserva la tasa marginal de denegación de cada capa. MODELLED: las magnitudes de vulnerabilidad, disponibilidad y exactitud por capa son entradas con fuente pero modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — véase conflict_threat_params), y la magnitud concreta de ~7x y la forma de la curva razón frente a correlación se derivan de esa parametrización. Un desglose de supervivencia por vector del § { "4.2" } resuelve entonces la amenaza de RF compartida en los cuatro vectores con nombre (jamming/spoofing/cinético/ciber) e informa de la curva de degradación gradual de PNT utilizable de cada vector S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibilidad_i,v·x,{ "0,1" }))) — VALIDATED: el Monte Carlo con semilla por capa converge a esa forma cerrada; el jamming es el vector más agudo para la línea base de RF correlacionada y la capa inercial inmune a la RF es la superviviente decisiva. No es un producto de disponibilidad de navegación certificado.

# text
# c1: scenarios/conflict-resilience.toml
seg-dd10a00edc2f = Una ejecución de <c1/> se resume así: conflict-resilience | { "4" } layers ({ "0" } baseline) | reference intensity { "1.00" } | resilience ratio closed-form 6.73x MC 6.19x (layered vs single-layer) | correlation defeats layering: ratio 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior CI [5.51-8.48]x | per-vector survival @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (sharpest jamming) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-674bafccbaf7 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/conflict-resilience.toml
seg-71fcff68edaf = El ejemplo <c1/> establece, entre otros:

# text
seg-4e3b5bb5a5e7 = GNSS L1 C/A (servicio abierto)

# text
seg-bd3832c8215d = Etiqueta del resultado (la del motor): resiliencia MODELLED de conflicto con PNT por capas (P7). Núcleo VALIDATED: la probabilidad de pérdida total de Monte Carlo converge al producto independiente de forma cerrada Pi_i p_deny_i (afirmado dentro del error típico de Monte Carlo con semilla fija y N grande); la fusión de posición de varianza inversa sigma_fused = (sum_i 1/sig

# attr:alt
seg-4dd2bcc206db = El gráfico que escribe el motor para scenarios/conflict-resilience.toml, tipo de escenario conflict-resilience

# text
seg-c0e69524f05d = <b>MODELLED</b> Subpuntuaciones por dimensión sobre las siete categorías de resiliencia propias de Kshana (no términos del DHS), las funciones RDRR de RethinkPNT y los criterios de Yang, cada una etiquetada como modelada con i. Referencia independiente (InternalConsistency): fórmulas por métrica derivadas a mano: diversidad de Simpson inversa, compuesto de media ponderada, duraciones de línea temporal acotadas o no acotadas, escalera de niveles del eslabón más débil

# text
# c1: label
seg-2ca37a78e899 = Resiliencia MODELLED de conflicto con PNT por capas (P7). Núcleo VALIDATED: la probabilidad de pérdida total de Monte Carlo converge al producto independiente de forma cerrada Pi_i p_deny_i (afirmado dentro del error típico de Monte Carlo con semilla fija y N grande); la fusión de posición de varianza inversa sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) es una identidad de forma cerrada; con correlación rho={ "0" } la cópula gaussiana se reduce exactamente al modelo independiente (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-d0d834e377ee = Resiliencia MODELLED de conflicto con PNT por capas (P7): un usuario en un entorno disputado dispone de varias capas PNT (GNSS de servicio abierto, GNSS de banda ancha, una constelación autenticada, un relé de aumentación), cada una con una disponibilidad base, una exactitud de 1σ y una vulnerabilidad de denegación por vector frente a la amenaza compartida de jamming/spoofing. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-3ca12700b54c = La razón de resiliencia principal (probabilidad de pérdida total con una sola capa frente a con capas) resulta de ~7x bajo el supuesto de INDEPENDENCIA; un barrido de denegación correlacionada con cópula gaussiana de un factor muestra entonces que esas ~7x se hunden hacia { "1" } a medida que aumenta la correlación de la denegación (la correlación anula la estratificación). (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-70e4fdff099f = MODELLED: las magnitudes de vulnerabilidad, disponibilidad y exactitud por capa son entradas con fuente pero modeladas (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — véase conflict_threat_params), y la magnitud concreta de ~7x y la forma de la curva razón frente a correlación se derivan de esa parametrización. (catálogo de tipos de escenario (<c1/>))

# text
seg-33541cca61b6 = Un usuario en un entorno disputado dispone de cuatro capas PNT de RF que viajan todas por la misma banda y, por tanto, comparten el vector de denegación de jamming/spoofing — el caso frágil y correlacionado. El escenario informa de: * la probabilidad de pérdida total frente a la intensidad de la amenaza (Monte Carlo frente al producto independiente de forma cerrada al que converge), * la razón de resiliencia de ~7x entre capas y una sola capa bajo el supuesto de independencia, * cómo esas ~7x se hunden hasta (comentario del archivo de escenario, líneas { "3" } a { "15" })

# text
# c1: layers
seg-83badfe4784d = Cada magnitud por capa es una entrada MODELLED con procedencia; véase src/conflict_threat_params.rs para los a priori [mín, nominal, máx] con fuente y los perfiles de susceptibilidad por vector (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Omitir <c1/> ejecuta la misma línea base de cuatro capas con fuente; aquí se escribe explícitamente — incluido el vector_profile de cada capa — por transparencia. (comentario del archivo de escenario, líneas { "17" } a { "22" })

# text
seg-bb182ed41520 = La puntuación alineada con marcos de resiliencia PNT es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-6a42653a8a0f = <s1>Anterior</s1>combined-altpnt

# text
seg-2bd3e9d1505c = <s1>Siguiente</s1>constellation-design
