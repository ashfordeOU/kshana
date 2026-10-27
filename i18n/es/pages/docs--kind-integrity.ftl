# docs--kind-integrity: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> La sección opcional [integrity] del tipo de escenario clock (clock_integrity::run): a partir de un emplazamiento indicado y de preajustes de constelación (geometry::sky_geometry), en cada época de integridad mientras la línea temporal GNSS no está denegada, RAIM instantáneo (raim::snapshot_ Pruebas: <a1>clock_integrity.rs</a1>.

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Separación de soluciones con hipótesis múltiples de ARAIM según el ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels y add_v42_protecti. Referencia independiente (ExternalDataset): Tres herramientas independientes, preregistradas (0123cee1) antes de que existiera ningún dato de prueba o salida de la referencia independiente, con tolerancias fijadas entonces. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (confirmación ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ejecutado como programa separado bajo GNU Octave { "8.4" } con un adaptador de compatibilidad de unique() del lado del controlador (declarado, sin cambio de algoritmo), con el TOL_PL del ADD de { "0.05" } m: el código Rust reproduce la implementación de referencia del ADD en

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir de la geometría de línea de visión mediante Q=(HᵀH)⁻¹ con una descomposición ENU local. Referencia independiente (ExternalDataset): DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independiente, coincidente a { "1e-6" } relativo

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> El núcleo distribucional en el que se apoya todo nivel de protección: el umbral de detección de fallos instantáneo χ²₁₋ₚfₐ(dof), la no centralidad de detección fallida pbias=√λ, y . Referencia independiente (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independiente (Cephes/Boost), un algoritmo distinto de la serie de gamma incompleta de Kshana; coincidente a ≤{ "1e-6" } rel. Solo el núcleo. La <em>asignación</em> del presupuesto P_HMI de ARAIM MHSS ya no carece de una referencia numérica publicada — el propio ejemplo resuelto del Subgrupo Técnico ARAIM del WG-C respalda ahora la fila separada «ARAIM MHSS protection levels against published referen

# text
# c1: docs/kinds/by-kind/integrity.md
seg-4bec24cd43f6 = Fuente: <c1/>

# text
# c1: integrity
seg-dd304550e695 = <c1/> (tipo de escenario)

# text
seg-eb7e0c2feb2b = RAIM instantáneo / de separación de soluciones / ARAIM con HPL/VPL y un diagrama de Stanford.

# text
# c1: scenarios/integrity-raim.toml
seg-706887c285d8 = Una ejecución de <c1/> se resume así: integrity | { "24" } satélites | 344/361 épocas disponibles ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } eventos de integridad, { "0" } HMI

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
seg-c3f7debf260a = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: sigma_ura_m
# c2: b_nom_m
# c3: constellations
# c4: seed
# c5: araim_dual
# c6: p_hmi
# c7: skyline
seg-7b28ab6567df = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/integrity-raim.toml
seg-581a5231b230 = El ejemplo <c1/> establece, entre otros:

# attr:alt
seg-ce7f6130ddee = El gráfico que el motor escribe para scenarios/integrity-raim.toml, tipo de escenario integrity

# text
seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-dff469738ec3 = <b>VALIDATED</b> TPL de separación de soluciones de tiempo escalar sobre fuentes heterogéneas; PL determinado por el ruido del subconjunto de peor exclusión + el sesgo de UTC(k)

# text
seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); PL semicontinuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrido K(IR/2); exponentes de fase τ/τ³/τ⁵

# text
seg-4787b0b565df = <b>VALIDATED</b> La envolvente de máximo corrido sobrecubre (sin perforación en cero) una serie metrológica real en cada retardo probado tau>=90d en un segmento disjunto; el tau corto (<=30d) es un límite modelado declarado Pruebas: <a1>cti_holdover_coverage_reference.rs</a1>.

# text
seg-090415eca3b7 = y { "6" } más en la matriz.

# text
seg-b4bc9ccbcee2 = <s1>Anterior</s1>ins-trn-coast

# text
seg-f1ba804baade = <s1>Siguiente</s1>jamming
