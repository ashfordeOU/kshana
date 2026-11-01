# docs--kind-gnss-sim: translations (es)

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-8e845ce908ee = Tipo de escenario del motor v{ $version }, familia <a1>Mediciones GNSS, posicionamiento e integridad</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-f6b7ca020692 = Página de familia: <a1>Mediciones GNSS, posicionamiento e integridad</a1>

# text
# c1: docs/kinds/by-kind/gnss-sim.md
seg-d5f4762f8455 = Fuente: <c1/>

# text
# c1: gnss-sim
seg-b634bbba2197 = <c1/> (tipo de escenario)

# text
seg-2ffccc9c1eff = Simulación de pseudodistancias en el dominio de la medida (ionosfera de Klobuchar, troposfera de Saastamoinen/Niell) + RAIM.

# text
# c1: scenarios/gnss-sim-raim.toml
seg-db93cbad6c6d = Una ejecución de <c1/> se resume así: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: iono
# c2: tropo
# c3: mask_deg
# c4: noise_sigma_m
# c5: multipath_m
# c6: sat_clock_rms_m
# c7: uere_m
# c8: p_fa
# c9: p_md
# c10: alert_limit_h_m
# c11: alert_limit_v_m
# c12: skyline
seg-ee0d38971d08 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/gnss-sim-raim.toml
seg-c7b57e696bc3 = El ejemplo <c1/> establece, entre otros:

# text
seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

# attr:alt
seg-47ee40d4eb73 = El gráfico que escribe el motor para scenarios/gnss-sim-raim.toml, tipo de escenario gnss-sim

# text
seg-ccc44a4ac68e = <b>VALIDATED</b> Retardo de grupo ionosférico oblicuo de Klobuchar en L1 monofrecuencia a partir de los ocho coeficientes α/β difundidos Pruebas: <a1>klobuchar_reference.rs</a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> Separación de soluciones con hipótesis múltiples de ARAIM según el ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels y add_v42_protecti. Referencia independiente (ExternalDataset): Tres herramientas independientes, preregistradas (0123cee1) antes de que existiera ningún dato de prueba o salida de la referencia independiente, con tolerancias fijadas entonces. ({ "1" }) ARAIM: Stanford MAAST para ARAIM { "2" } (confirmación ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ejecutado como programa separado bajo GNU Octave { "8.4" } con un adaptador de compatibilidad de unique() del lado del controlador (declarado, sin cambio de algoritmo), con el TOL_PL del ADD de { "0.05" } m: el código Rust reproduce la implementación de referencia del ADD en

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP a partir de la geometría de línea de visión mediante Q=(HᵀH)⁻¹ con una descomposición ENU local. Referencia independiente (ExternalDataset): DOP de gnss_lib_py { "1.0.4" } (Stanford NAV Lab) — biblioteca independiente, coincidente a { "1e-6" } relativo

# text
seg-752829346523 = <b>VALIDATED</b> Retardo de grupo ionosférico oblicuo de Klobuchar en L1 monofrecuencia a partir de los ocho coeficientes α/β difundidos. Referencia independiente (ExternalDataset): ionmodel de RTKLIB (tomojitakasu/RTKLIB, src/rtkcmn.c) — implementación de referencia independiente compilada desde el código fuente; coincidente a < { "1e-4" } m

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> El núcleo distribucional en el que se apoya todo nivel de protección: el umbral de detección de fallos instantáneo χ²₁₋ₚfₐ(dof), la no centralidad de detección fallida pbias=√λ, y . Referencia independiente (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — biblioteca independiente (Cephes/Boost), un algoritmo distinto de la serie de gamma incompleta de Kshana; coincidente a ≤{ "1e-6" } rel. Solo el núcleo. La <em>asignación</em> del presupuesto P_HMI de ARAIM MHSS ya no carece de una referencia numérica publicada — el propio ejemplo resuelto del Subgrupo Técnico ARAIM del WG-C respalda ahora la fila separada «ARAIM MHSS protection levels against published referen

# text
seg-cc7018560c2c = Página de tema: <a1>REAL_TLE_GUIDE.md</a1>

# text
seg-53a78e98af12 = Página de tema: <a1>SKYLINE.md</a1>

# text
seg-659e6288ad72 = <s1>Anterior</s1>gnss-ins

# text
seg-7d677a362edd = <s1>Siguiente</s1>gnss-ssv
