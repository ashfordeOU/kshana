# docs--araim-reference: translations (es)

# text
# c1: docs/ARAIM_REFERENCE.md
seg-c316596d7ec8 = Fuente: <c1/>

# text
seg-4768b19aaed7 = Referencia de ARAIM: niveles de protección de RAIM avanzado en Kshana

# text
# c1: src/raim.rs
seg-93c83a737a43 = Esta nota documenta la implementación abierta de Kshana de la <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: el algoritmo, cada supuesto, el mensaje de soporte de integridad que consume y el estado de validación. La implementación está en <a1><c1/></a1>; este documento es el complemento en prosa que un auditor (o un revisor de contratación) puede leer junto al código.

# text
seg-f5a7abecc2df = ARAIM es el sucesor bifrecuencia y multiconstelación del RAIM clásico que el Grupo de Trabajo C (WG-C) GPS (Global Positioning System)–Galileo definió para dar soporte a guiado horizontal y vertical hasta LPV-200 (LPV: prestaciones del localizador con guiado vertical). Responde a una única pregunta en cada época:

# text
# c1: P_HMI
seg-252dac107a2a = ¿Cuán grande debe ser el límite del error de posición (el <em>nivel de protección</em>) para que la probabilidad residual de <em>información peligrosamente engañosa</em> —un error mayor que el límite mientras el límite sigue dentro del límite de alerta— se mantenga por debajo del presupuesto de riesgo de integridad <c1/>?

# text
seg-04299e9742b7 = { "1" }. El mensaje de soporte de integridad (ISM)

# text
# c1: IntegritySupportMessage
seg-717bea7d6bc8 = El ISM es el conjunto de parámetros por constelación que aplica el usuario. Lo modela explícitamente <a1><c1/></a1>:

# text
seg-fffbeccd4266 = Símbolo

# text
seg-2247a2344710 = Significado

# text
seg-d7e49778bed2 = σ_URE / SISE (error de señal en el espacio)

# text
seg-b1b5bca63e21 = RMS (raíz del error cuadrático medio) del error de distancia usado para <b>exactitud y continuidad</b>

# text
seg-8ff2973d7f5b = σ_URA / SISA (exactitud de señal en el espacio)

# text
seg-f993962a5c9b = límite del error de distancia usado para <b>integridad</b> (≥ σ_URE)

# text
# c1: b_k = Σ_i |s_i|·b_nom
seg-727c7fbe1b01 = sesgo nominal máximo de distancia incorporado de un solo lado al límite de integridad (<c1/>); véase §{ "3" }

# text
seg-a79e42c29c46 = probabilidad a priori de un fallo no detectado de un solo satélite

# text
seg-78c45312d2ff = probabilidad a priori de un fallo de toda la constelación

# text
# c1: IntegritySupportMessage::gps_galileo_reference()
seg-19cc5ff2e541 = <c1/> devuelve los valores de referencia publicados de WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> sobre el intervalo de exposición. Son los valores usados para dimensionar la disponibilidad de ARAIM en la bibliografía de referencia; el ISM operativo se difunde o se ensambla en tierra y es configurable por constelación. La distinción entre σ_URA (integridad) y σ_URE (exactitud) es deliberada y es la característica definitoria del concepto de ISM.

# text
# c1: .fault_priors()
# c2: .dual_fault_priors()
seg-0c1687628e67 = <c1/> y <c2/> pasan estos valores directamente a los dos motores.

# text
seg-8c516e53f595 = { "2" }. Hipótesis de fallo

# text
# c1: H_k
seg-b6353366ebf0 = ARAIM es un método de <em>separación de soluciones con hipótesis múltiples</em> (MHSS). Para cada hipótesis de fallo <c1/> forma la solución con todos los satélites a la vista y la subsolución que excluye el conjunto con fallo, y acota el error de posición bajo esa hipótesis:

# text
# c1: H_0
# c2: ≈ 1
seg-3b340e082b84 = <c1/> (a priori <c2/>): la solución completa de mínimos cuadrados con todos los satélites a la vista.

# text
seg-03332e433edc = Fallos de un solo satélite

# text
# c1: H_i
# c2: P_sat
# c3: araim_raim
seg-add4792e4e40 = <c1/> (a priori <c2/> cada una): cada subsolución que excluye un satélite. Esta es la línea base clásica de ARAIM con un solo fallo, <a1><c3/></a1>.

# text
seg-7e20f419e670 = Fallos de toda la constelación

# text
# c1: H_c
# c2: P_const
# c3: araim_dual_raim
# c4: P_const = 0
# c5: araim_raim
seg-920bd35833ff = <c1/> (a priori <c2/> cada una): la subsolución que elimina <em>todos</em> los satélites de una constelación a la vez, la extensión de la nota técnica (TN) de ARAIM de la UE (Unión Europea) / DO-316 implementada en <a1><c3/></a1>. Con <c4/> se reduce <b>bit a bit</b> a <c5/>.

# text
seg-323dd205d238 = { "3" }. Niveles de protección

# text
# c1: (p_fault, threshold, σ)
# c2: K_fa = Φ⁻¹(1 − P_fa / 2N)
# c3: N
# c4: PL
seg-9ab2676d2554 = Para cada eje (vertical, horizontal) y cada hipótesis, el motor construye un modo <c1/> en el que el umbral es el límite de detección de separación de soluciones con el multiplicador de falsa alerta <c2/> (un reparto de Bonferroni del presupuesto de continuidad entre las <c3/> hipótesis). El nivel de protección es el menor límite <c4/> cuyo riesgo de integridad sumado

# text
seg-05c0d8fc855c = Nota de implementación.

# text
# c1: b_k = Σ_i |s_{axis,i}|·b_nom
# c2: axis_bias_sum
# c3: horiz_bias_sum
# c4: b_nom_m
# c5: b_nom = 0.75 m
# c6: b_nom = 0
# c7: integrity
# c8: sigma_ura_m
# c9: sigma_uere_m
# c10: b_nom_m
# c11: INTEGRITY.md
seg-248092fe9b94 = <c1/> es la proyección unilateral del sesgo nominal sobre el eje —la suma en el peor caso de las magnitudes de ganancia por satélite (<a1><c2/>/<c3/></a1>)—, tomada del <c4/> del ISM. El ISM de referencia de WG-C usa <c5/>; con <c6/> el límite se reduce a la forma MHSS de sesgo nominal cero. El escenario ejecutable <c7/> expone <c8/> (el límite de integridad usado para el nivel de protección, acotado a ≥ <c9/> y con ese valor por defecto) y <c10/> (por defecto { "0" }), de modo que el nivel de protección se dimensiona siempre con el límite de integridad σ_URA, nunca con el menor σ_URE de exactitud. Sigue siendo una implementación de ARAIM <b>modelada y no certificada</b>: véase <a2><c11/></a2>.

# text
# c1: araim_protection_level
# c2: araim_integrity_risk
# c3: ≤
seg-f6bccff61ff5 = satisface el presupuesto asignado ([<c1/>] / <a1><c2/></a1>). VPL (nivel de protección vertical) y HPL (nivel de protección horizontal) son las respuestas vertical y horizontal. El resultado informa además del riesgo de integridad realmente alcanzado (<c3/> la asignación) y de si una subsolución se separó más allá de su umbral.

# text
seg-b1a868221848 = Este es el contrato explícito de ARAIM —"¿cuán grande debe ser el límite?"— en lugar del riesgo implícito, dependiente de la geometría, de un RAIM clásico de multiplicador fijo.

# text
seg-c90cf313dea8 = { "4" }. Diagrama de Stanford

# text
# c1: StanfordDiagram
# c2: (error, PL)
# c3: classify_stanford
# c4: stanford_svg
# c5: PL = error
seg-b51e44c3deda = <a1><c1/></a1> acumula <c2/> por época frente a un límite de alerta (AL) fijo y <a2><c3/></a2> clasifica cada una como <em>disponible</em>, <em>sistema no disponible</em> (PL > AL, conservador), <em>información engañosa</em> (PL < error ≤ AL) o <em>información peligrosamente engañosa</em> (error > AL y > PL). <a3><c4/></a3> genera el diagrama de dispersión clásico —el límite de integridad <c5/>, las guías del límite de alerta y un marcador codificado por color por época— como un SVG (Scalable Vector Graphics) autónomo.

# text
seg-c902173f6acf = { "5" }. El beneficio de la doble constelación

# text
# c1: raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault
seg-96e114a6981c = En <c1/> se demuestran dos efectos:

# text
seg-06c7d8d62b44 = <b>Geometría / redundancia</b>: agrupar los satélites de una segunda constelación reduce el HPL de fallo único: más mediciones y un conjunto mayor de subsoluciones de un solo SV (SV: vehículo espacial, es decir, un satélite) dan un límite estrictamente menor.

# text
# c1: P_const
# c2: araim_dual_raim
# c3: None
seg-f788c9e07547 = <b>Tolerancia a fallos de constelación</b>: con <c1/> activo, el usuario de doble constelación sigue disponible cuando puede fallar toda una constelación (los satélites de la <em>otra</em> constelación sobreviven), mientras que un usuario de una sola constelación demostrablemente no puede protegerse frente al fallo de su propia constelación (<c2/> devuelve <c3/>).

# text
seg-f52a937bad94 = Una sutileza que conviene declarar con honestidad: como la hipótesis de fallo de constelación exige sobrevivir a la pérdida de una constelación <em>entera</em>, el nivel de protección de la <em>instantánea</em> de doble constelación está acotado inferiormente por la geometría residual de una sola constelación: no es automáticamente menor que el PL solo con GPS en cada instante. El resultado principal de la TN de ARAIM de la UE, que GPS+Galileo da un <b>HPL { "15" }–{ "25" } % menor</b>, es un resultado de <b>disponibilidad</b> acumulado sobre constelaciones y ubicaciones de usuario realistas, no una garantía por instantánea.

# text
seg-b4289b877902 = { "6" }. Estado de la validación

# text
# c1: P_const = 0
# c2: tests/igs_real_data.rs
seg-e553de2eee63 = <b>En el repositorio, automatizado:</b> el álgebra MHSS (<c1/> ⇒ fallo único bit a bit; el fallo de constelación ensancha el PL; el presupuesto nunca se supera), los beneficios de geometría y de fallo de constelación de arriba, y la ejecución sobre <b>geometría real de órbita precisa (SP3, Standard Product { "3" }) del IGS (International GNSS Service; GNSS = sistema global de navegación por satélite)</b> (<c2/>), y no solo sobre constelaciones sintéticas.

# text
# c1: src/araim_reference.rs
# c2: tests/araim_reference_vectors.rs
# c3: tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt
# c4: TOL_PL = 5 × 10⁻² m
# c5: G
# c6: K_fa,3
# c7: N_fault,max = 1
# c8: araim-reference-check
seg-633bf11af170 = <b>Referencia independiente externa: el ejemplo resuelto publicado de WG-C.</b> Los niveles de protección se comprueban frente al propio ejemplo numérico del Subgrupo Técnico de ARAIM, en <a1><c1/></a1>, <c2/> y el fixture confirmado <c3/> (cada vector lleva su URL (dirección web) de obtención, la fecha de obtención, el SHA-256 (SHA: Secure Hash Algorithm) del archivo fuente y la página). La tolerancia de aceptación es la propia de la referencia, <c4/>. Frente al Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Apéndice D: <b>VPL { "18.2926" } m frente a { "18.3" } m publicado (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m frente a { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (umbral efectivo del monitor) { "7.2997" } m frente a { "7.2998" } m, σ_v,acc { "1.3694" } m frente a { "1.3694" } m, y los seis intermedios publicados de fallo de constelación (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) con una diferencia de menos de media unidad en su último decimal impreso. El Milestone { "3" } Report de { "2016" } expone el mismo ejemplo pero tiene dos defectos internos —una errata de signo en la fila { "3" } de <c5/> y un <c6/> evaluado en { "57" } modos de fallo mientras el documento declara <c7/> ({ "12" } modos)—, de modo que sus intermedios de geometría se reproducen exactamente mientras que sus niveles de protección se registran como discrepancias medidas (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) y se excluyen de la cifra de aceptación. La comprobación es accesible como el tipo de escenario <c8/>.

# text
# c1: N_fault,max = 1
seg-6d79f9836abd = <b>Residuo honesto (externo / pendiente de revisión):</b> la cifra de disponibilidad de { "15" }–{ "25" } % frente a una <b>instantánea de TLE (conjunto de elementos de dos líneas) real de Celestrak con la versión fijada</b>, y el depósito de los fixtures de prueba de ARAIM como registro citable de <b>Zenodo</b>. La comprobación de referencia de arriba cubre solo <c1/> (modos de fallo de un solo satélite y de una sola constelación); los subconjuntos de fallo de varios eventos simultáneos, la exclusión de fallos, la comprobación de coherencia χ² y el paso de reasignación por doble recuento del algoritmo de referencia no están implementados, y un caso cuyos a priori los necesitaran se rechaza en lugar de truncarse.

# text
# c1: integrity
# c2: araim_dual_raim
# c3: araim_dual = true
# c4: p_hmi
# c5: scenarios/araim-gps-galileo.toml
# c6: tests/araim_dual_real_data.rs
seg-b57b889dc536 = <b>Alcance mediante archivo de escenario:</b> el tipo de escenario <c1/> ejecuta <c2/> en cada época cuando su archivo TOML (Tom's Obvious Minimal Language) fija <c3/> (<c4/> opcional); el <a1><c5/></a1> incluido lo hace sobre una geometría agrupada de GPS + Galileo, y <c6/> ejecuta el mismo motor con TLE reales de Celestrak de GPS y Galileo propagados a una época común. Sin la bandera, el ejecutor usa el RAIM clásico de separación de soluciones.

# text
seg-6cb7a787ac67 = Referencias

# text
seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, versión final, { "25" } de febrero de { "2016" } — Anexo A (algoritmo de usuario de referencia) y §A.IX (ejemplo numérico). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

# text
seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, versión { "3.1" }, { "20" } de junio de { "2019" } — Apéndice D (ejemplo numérico para LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

# text
seg-8758a6e4f6eb = Cooperación UE–EE. UU. sobre navegación por satélite, <em>ARAIM Technical Note</em>.

# text
seg-c4d2879b2ec4 = RTCA (antes Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (normas de prestaciones operativas mínimas); material de DO-316 ARAIM MASPS (normas de prestaciones mínimas del sistema de aviación).

# text
seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

# text
seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (metodología del diagrama de Stanford).

# text
seg-d4f50d307775 = <s1>Anterior</s1>Espectro y cascada

# text
seg-f05ca316fe8e = <s1>Siguiente</s1>Mapa de DO-316 / DO-229E
