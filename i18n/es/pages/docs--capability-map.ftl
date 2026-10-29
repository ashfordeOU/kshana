# docs--capability-map: translations (es)

# text
seg-76b323512350 = Sistemas de tiempo

# text
seg-ee2e250497f9 = Exportación para test bench

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Fuente: <c1/>

# text
seg-891eb89a8801 = Mapa de capacidades: qué hace Kshana, qué hace en parte y qué no hace

# text
# c1: POSITIONING.md
seg-f9b372e8832b = Kshana es un <b>motor de evidencias de rendimiento y resiliencia PNT (posicionamiento, navegación y temporización)</b>, no un conjunto completo de herramientas de sistemas espaciales. Se centra en la temporización y el holdover, su dominio mejor validado (véase <a1><c1/></a1>). Esta página es el mapa honesto del alcance: para cada área de capacidad que podría comprobar una persona revisora de adquisiciones o de investigación, indica el estado, lo que existe realmente en el código, lo que falta y dónde se sitúa en la hoja de ruta. El estado es uno de:

# text
seg-1b3a49d09c7d = <b>full</b>: implementado de extremo a extremo y validado hasta el nivel indicado en la fila;

# text
seg-0da2570a5ca3 = <b>partial</b>: un modelo real pero limitado (alcance acotado explícitamente más abajo);

# text
seg-6e02edaa8f54 = <b>none</b>: no modelado (fuera de alcance hoy).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Estos tres son los únicos valores que toma la columna de estado. Califican la <em>madurez de la capacidad</em>, que es un eje distinto de la calificación VALIDATED / MODELLED / PARTNER de <a1><c1/></a1>: esta última califica la <em>procedencia de la evidencia</em>, fila por fila, y se comprueba por máquina a partir de <c2/>.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Nada de lo que figura aquí es aspiracional: "partial" nunca significa "casi terminado", significa "esto y nada más". Véanse también <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> y el registro de cierre de afirmaciones excesivas <a4><c4/></a4> (cada afirmación excesiva histórica, cómo se resolvió y una protección de CI (integración continua) que mantiene esa resolución).

# text
seg-b55f7e5a69cc = PNT básico (donde Kshana realmente actúa)

# text
seg-d6476863f862 = Capacidad

# text
seg-ad856ad710eb = Estado

# text
seg-2ee4023e3a27 = Qué existe

# text
seg-25843dc03c73 = Qué falta

# text
seg-331d2821d43f = Hoja de ruta

# text
seg-724b1929b536 = Determinación y propagación de órbita

# text
seg-9aa33b4484ca = parcial

# text
# c1: ephemeris
# c2: src/ephemeris.rs
# c3: --export-oem
# c4: src/propagator.rs
# c5: forces::zonal_accel
# c6: J2..J6
# c7: integrate_dopri
# c8: propagate_dopri
# c9: solve_kepler_checked
# c10: Err
# c11: ForceModel::third_body
# c12: accel_at
# c13: src/ephem.rs
# c14: epoch_jd_tt + t/86400
# c15: third_body_accel
# c16: forces::srp_accel
# c17: ForceModel::solar_radiation
# c18: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c19: forces::conical_shadow
# c20: forces::drag_accel
# c21: ForceModel::drag
# c22: accel_rv
# c23: −½·ρ(h)·(C_D·A/m)·|v_rel|·v_rel
# c24: v_rel = v − ωₑ ẑ × r
# c25: ρ
# c26: forces::atmospheric_density
# c27: forces::relativistic_accel
# c28: ForceModel::relativity
# c29: β = γ = 1
# c30: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c31: 3μ²/(c²r³)·r̂
# c32: ≈1.9e-9
# c33: forces::lense_thirring_accel
# c34: ForceModel::lense_thirring
# c35: src/orbit_determination.rs
# c36: src/batch_ls.rs
# c37: [r, v]
seg-7f4957a488b7 = <b>SGP4/SDP4</b> sin dependencias (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), validado hasta { "4.12" } mm frente a los { "666" } vectores AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (posición <b>y</b> velocidad, esta última hasta { "1" } mm/s); kepleriano analítico + secular J2; velocidad inercial expuesta y presentada <b>de extremo a extremo</b> mediante el <b>escenario <c1/></b> ejecutable (<c2/>, accesible desde CLI/Python/WASM/MCP (CLI: interfaz de línea de comandos; WASM: WebAssembly; MCP: Model Context Protocol)): por paso emite el estado TEME (ecuador verdadero, equinoccio medio) <b>y</b> GCRS (Geocentric Celestial Reference System) (posición + velocidad), la posición ITRF/ECEF (ITRF: International Terrestrial Reference Frame; ECEF: centrado en la Tierra y fijo a ella), la <b>traza en tierra del subsatélite</b> en WGS-84 (WGS: World Geodetic System) (lat/lon/alt), y acimut/elevación/alcance de estación + <b>tasa de alcance/Doppler</b> (la tasa radial de alcance coincide con la derivada verdadera de la posición, sin ruido de JD (JD: fecha juliana), hasta { "6e-9" } m/s), y mediante la exportación de efemérides con velocidad en <b>OEM</b> (Orbit Ephemeris Message) de CCSDS (Consultative Committee for Space Data Systems) (<c3/>). Un <b>propagador numérico (de Cowell)</b> (<c4/>) integra un modelo de fuerzas de <b>gravedad zonal</b> configurable, con el <b>campo zonal terrestre completo hasta el grado { "6" }</b> (<c5/>, el <c6/> publicado de EGM-96 (EGM: Earth Gravitational Model)), con un integrador adaptativo a elegir (RK4 (Runge–Kutta de cuarto orden) con <b>doblado de paso</b> o el par embebido <b>Dormand–Prince RK5({ "4" })</b> (<c7/> / <c8/>, una estimación de error embebida más barata, de 7 evaluaciones, que supera la misma puerta de Kepler y coincide con la ruta RK4 hasta <{ "1" } m en una órbita J2..J6)), contrastado con una <b>verdad analítica más sólida que un contraste numérico entre herramientas</b>: la órbita sin perturbar reproduce la <b>solución kepleriana exacta de variables universales con precisión submétrica en { "24" } h</b> (una puerta más estricta que la del hito, "frente a la referencia < { "10" } m"), la energía y el momento angular se conservan hasta ~{ "1e-9" } relativo, la regresión nodal por J2 coincide con la tasa secular de forma cerrada según la teoría de primer orden, se verifica que la aceleración zonal es el <b>gradiente exacto de su propio potencial</b> (y que se reduce a la forma cerrada de J2 validada con los 666 vectores), y <c9/> <b>devuelve <c10/> en lugar de una respuesta errónea</b> cuando Newton no converge (p. ej., cerca del perigeo con e = { "0.999" }). La gravedad de <b>tercer cuerpo (Sol y Luna) dependiente de la época</b> está <b>integrada en el integrador dependiente del tiempo</b> (<c11/> / <c12/>, con las efemérides de baja precisión de Sol y Luna de Montenbruck y Gill de <c13/>, sin necesidad de un kernel DE/SPK (DE: Development Ephemeris; SPK: kernel de efemérides planetarias)): cada evaluación del lado derecho (RHS) muestrea las posiciones de los perturbadores en la época avanzada <c14/>, de modo que el Sol y la Luna se mueven por sus órbitas durante la integración. Se verifica que la perturbación es el gradiente exacto de su potencial perturbador, que se anula en el geocentro y que tiene las magnitudes de LEO (órbita terrestre baja) de los manuales (~{ "5e-7" } m/s² el Sol, ~{ "1.1e-6" } m/s² la Luna); las efemérides del Sol alcanzan anclas J2000 derivadas a mano (distancia al perihelio, declinación del solsticio de ~−{ "23" }°, movimiento de ~{ "1" }°/día) y las de la Luna su envolvente de perigeo/apogeo, una distancia media de ~{ "384 400" } km, una cota de inclinación de ≤ { "5.3" }° y el retorno de dirección al mes sidéreo; y se prueba que la conexión con la integración es <b>exacta bit a bit</b> (el término RHS es igual a <c15/> en la posición muestreada en t = { "0" } y t = { "1" } día), con un desplazamiento de época de un cuarto de año que da una trayectoria distinta. La <b>presión de radiación solar</b> (SRP) usa el mismo RHS dependiente de la época (<c16/> / <c17/>): el modelo de bola de cañón <c18/> con un factor de eclipse de umbra y penumbra <c19/> (ν suave ∈ [{ "0,1" }], verificado para decrecer por una penumbra monótona que se extiende más allá del cilindro de umbra), verificado frente a la presión de 1 AU (AU: unidad astronómica) de los manuales (≈ { "4.54e-6" } N/m²), la magnitud de LEO de ~{ "1.36e-7" } m/s² que empuja alejándose del Sol, la caída con el inverso del cuadrado (al duplicar la distancia al Sol queda en la cuarta parte), una aceleración <b>exactamente nula</b> en el cilindro de umbra y un desplazamiento propagado que escala ~linealmente con A/m. La <b>resistencia atmosférica</b> es el primer término que depende de la velocidad (<c20/> / <c21/> + el nuevo RHS con <c22/> / paso de velocidad): resistencia cuadrática <c23/> frente a la atmósfera en corrotación <c24/>, con <c25/> el <c26/> exponencial por tramos de Vallado, verificada por el ancla de nivel del mar de { "1.225" } kg/m³, una caída de LEO estrictamente monótona con una altura de escala física de ~{ "58" } km, la magnitud de resistencia de ~{ "2e-6" } m/s² que se opone a la velocidad relativa y la <b>firma de disipación</b> (una órbita de { "300" } km pierde energía específica de forma monótona y su semieje mayor decae unos ~km/día acotados, mientras que la órbita en el vacío conserva la energía). La <b>corrección relativista postnewtoniana (de Schwarzschild)</b> es el segundo término que depende de la velocidad (<c27/> / <c28/>): la forma <c29/> de IERS (International Earth Rotation and Reference Systems Service) <c30/>, el principal responsable del avance relativista del perigeo, verificada frente a su valor circular de forma cerrada <c31/> (radial, hacia fuera), su cociente de LEO de manual <c32/> respecto al problema de dos cuerpos, la forma simplificada a mano de velocidad radial y la <b>firma conservativa</b> (perturba la órbita pero mantiene el semieje mayor por debajo de un metro al día, lo contrario estructural de la resistencia). El término de arrastre de marco de <b>Lense–Thirring</b> (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) es la corrección gravitomagnética más allá de Schwarzschild: opcional, de ~{ "1" }–{ "2" } órdenes de magnitud por debajo de este en LEO, verificado para anularse sin rotación terrestre y para quedar por debajo de la magnitud de Schwarzschild. La <b>determinación de órbita</b> (OD, <c35/>) cierra el lazo desde las observaciones hasta un estado: un corrector <b>por lotes de Gauss–Newton</b> (<c36/>) lleva un <c37/> candidato al mejor ajuste de los alcances de estación terrestre propagados a lo largo del arco (submétrico / mm·s⁻¹ con alcances sin ruido; ~{ "2" } m con un residuo posterior al ajuste en el nivel de ruido de { "5" } m, la firma de un ajuste de mínimos cuadrados coherente), con una variante recursiva <b>secuencial</b> sobre el filtro unscented

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = El modelo de fuerzas de Cowell por defecto lleva solo el campo zonal: el campo <b>teseral</b> de alto grado de EGM2008 (Earth Gravitational Model { "2008" }) (<c1/>, grado y orden { "70" }, con un cargador <c2/> para archivos ICGEM (International Centre for Global Earth Models)) se compone únicamente en el motor de ajuste de efemérides preciso (<c3/>; véase <a1><c4/></a1>); la densidad de resistencia atmosférica es la exponencial por tramos de Vallado <b>estática</b> (independiente de la actividad solar), <b>no</b> NRLMSISE-00 (el modelo de atmósfera extendido de espectrómetro de masas y radar de dispersión incoherente del Naval Research Laboratory; la cláusula de densidad termosférica < { "5" } %); la SRP es el modelo de <b>bola de cañón</b> con una sombra geométrica de <b>umbra y penumbra cónicas</b> (sin oscurecimiento del limbo solar, sin sombra de Tierra achatada, sin forma ni actitud del satélite); la relatividad abarca los términos de <b>Schwarzschild y de Lense–Thirring</b> (arrastre de marco), ambos opcionales, pero sin ajuste de parámetros PPN (PPN: posnewtoniano parametrizado); <b>el tercer cuerpo y la SRP usan las efemérides de baja precisión (~{ "0.005" }° el Sol, ~{ "0.3" }° la Luna), no la exactitud de un kernel DE/SPK</b>. Los niveles conservativos del modelo de fuerzas (dos cuerpos → J2–J6 → Sol/Luna → SRP) están <b>VALIDATED frente a Orekit { "12.2" }</b> (peor caso de { "0.08" } m en { "24" } h, <c5/>), y la determinación de órbita por lotes y secuencial está <b>VALIDATED frente a los estimadores de Orekit { "12.2" }</b> (<c6/>); el nivel de resistencia atmosférica y la fidelidad absoluta de las entradas de efemérides y densidad siguen siendo MODELLED; no hay contraste con GMAT (General Mission Analysis Tool)

# text
seg-c66f25447fe9 = gravedad teseral en el modelo de Cowell por defecto + resistencia atmosférica NRLMSISE-00 + oscurecimiento del limbo solar + efemérides de grado DE + validación cruzada con GMAT + mediciones de tasa de alcance y ángulo en OD y STM analítica (matriz de transición de estado): P2+

# text
# c1: src/timescales.rs
# c2: eraEra00
# c3: gstime
# c4: ephemeris
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: finals2000A
# c9: eop_finals2000a
# c10: kshana --eop <file>
# c11: EopSeries
# c12: precise_od
seg-fffd275219ff = <c1/>: API de fecha juliana (civil↔JD, MJD (fecha juliana modificada)), UTC↔TAI (UTC: Tiempo Universal Coordinado; TAI: Tiempo Atómico Internacional) mediante la tabla completa de segundos intercalares de IERS ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT: Tiempo Terrestre), UT1 (Tiempo Universal { "1" }, el tiempo de rotación terrestre) mediante DUT1 (el tiempo de rotación terrestre menos el Tiempo Universal Coordinado), y el <b>ángulo de rotación terrestre</b> de IAU-2000 (IAU: Unión Astronómica Internacional) (ERA validado bit a bit frente al vector <c2/> de SOFA (Standards of Fundamental Astronomy)). La <b>aproximación DUT1≈{ "0" } de la ruta de SGP4 está documentada explícitamente</b> en el punto de llamada <c3/> (un error de GMST (tiempo sidéreo medio de Greenwich) de ≤ ~{ "13" }″, muy por debajo del propio error de modelo de SGP4), y el escenario <c4/> admite parámetros explícitos <c5/>/<c6/>/<c7/> <b>o una serie IERS real <c8/> incorporada</b> (<c9/> / <c10/>, interpolada con la misma <c11/> que usa <c12/>), de modo que la traza en tierra se reduce con el UT1 y el movimiento polar reales de IERS, y no solo con los escalares nominales

# text
# c1: f64
# c2: timescales::TwoPartJd
# c3: src/jd2.rs
# c4: Jd2
# c5: Sgp4::propagate_at(Jd2)
# c6: tests/jd2_sofa_time_oracle.rs
# c7: jd2::gmst82
# c8: cio::gcrs_to_itrs_matrix_jd2
# c9: orbit::Propagator::position_in_frame_jd2
# c10: two_part_jd
# c11: tests/jd2_earth_rotation_erfa_oracle.rs
# c12: Jd2
# c13: TwoPartJd
# c14: f64
# c15: two_part_jd
# c16: f64
# c17: jd2
# c18: timescales::tai_minus_utc_on_date
# c19: tests/jd2_pre1972_sofa_oracle.rs
# c20: f64
# c21: timescales::tai_minus_utc
# c22: src/eop_ls_ar.rs
# c23: EopSeries::with_ls_ar_prediction
# c24: tests/eop_prediction_beyond_table.rs
seg-d488e9db94e9 = Las rutas de órbita terrestre siguen usando una JD de un solo <c1/> (resolución de ~{ "50" } µs hacia { "2020" }; este, y no el algoritmo, es el límite de un contraste por diferencias finitas); existe una JD en dos partes (<c2/>, usada por las rutas radiométrica, CCSDS-TDM, de simulador de segmento terreno y de sistema solar, y <c3/> <c4/>) que se aplica en SGP4 (<c5/>), la predicción de pasos, la geometría y los diseños Walker (validada frente a SOFA, <c6/>), y en la rotación terrestre de la ruta de órbita (<c7/>, <c8/>, <c9/>, el <c10/> opcional del escenario de efemérides; VALIDATED frente a ERFA, <c11/>), con conversiones sin pérdida entre <c12/> y <c13/>; las rutas de órbita terrestre por defecto mantienen la fecha de un solo <c14/> salvo que se establezca <c15/>, y la época del modelo de fuerzas de Cowell sigue siendo de un solo <c16/> a propósito (su error analítico de Sol y Luna eclipsa un redondeo de { "40" } µs); el UTC de segundo elástico anterior a 1972 ({ "1960" }–{ "1971" }) se modela en la ruta en dos partes (<c17/>, <c18/>, VALIDATED frente a ERFA, <c19/>), pero <c21/> de un solo <c20/> sigue fijando { "10" } s antes de { "1972" }; un predictor de orientación terrestre por mínimos cuadrados + autorregresivo (<c22/>, comparado con el Boletín A de IERS como hallazgo) puede ahora extender una serie EOP más allá de su última fila (<c23/>, opcional; <c24/>), de modo que los argumentos de marco posteriores a la tabla siguen el pronóstico en lugar de quedar fijados; la serie por defecto sigue fijándose y todavía ninguna clave de escenario activa la predicción

# text
seg-d59294cf367c = <b>hecho</b> (base); JD en dos partes a través de la rotación terrestre en la ruta de órbita: <b>hecho</b> (opcional en el escenario de efemérides) ; predicción de EOP más allá de la tabla: <b>hecho</b> (biblioteca, opcional); UTC anterior a 1972 en la ruta en dos partes: <b>hecho</b>

# text
seg-798b3b5db6d6 = Marcos de referencia

# text
seg-69930da8bc5a = full

# text
# c1: src/frames.rs
# c2: src/precession.rs
# c3: (γ̄, φ̄, ψ̄, ε̄_A)
# c4: src/nutation.rs
# c5: nutation_iau2000a
# c6: nutation_matrix_2000a
# c7: nut00a
# c8: tools/gen_nut00a.py
# c9: iauNumat
# c10: teme_to_gcrs(r, v, jd_tt)
# c11: nut00a
# c12: nut00b
# c13: teme_to_itrf
# c14: polar_motion_matrix
# c15: iauPom00
# c16: x_p
# c17: y_p
# c18: src/cio.rs
# c19: X,Y
# c20: s
# c21: gcrs_to_cirs_matrix
# c22: gcrs_to_itrs_matrix
# c23: eraXys06a
# c24: eraC2ixys
# c25: eraEra00
# c26: tests/frame_reference_vectors.rs
# c27: ephemeris
seg-4b3fe53b3dcd = <c1/>: TEME↔ECEF basado en GMST, geodésicas WGS-84↔ECEF (exacta + inversa iterativa, con precisión de máquina a todas las altitudes) y un observador geodésico de estación terrestre (acimut/elevación/alcance); <b>precesión IAU { "2006" }</b> (<c2/>: los ángulos de Fukushima–Williams <c3/> + la matriz de sesgo y precesión GCRS↔media de la fecha); <b>nutación IAU 2000A/2000B + cadena TEME→GCRS completa</b> (<c4/>: la serie <b>IAU 2000A completa</b>, con { "678" } términos lunisolares + { "687" } planetarios, <c5/> / <c6/>, tabla generada por máquina a partir de la referencia <c7/> de ERFA (Essential Routines for Fundamental Astronomy) mediante <c8/>, junto a la serie 2000B de 77 términos, los argumentos de Delaunay, la matriz de nutación <c9/> de SOFA, la ecuación de los equinoccios y <c10/> mediante TEME→TOD→MOD→GCRS (verdadero de la fecha, medio de la fecha); ambas series validadas <b>bit a bit</b> frente a los vectores de referencia <c11/>/<c12/> de SOFA/ERFA, Δψ/Δε hasta { "1e-13" } rad); <b>movimiento polar de IERS</b> PEF→ITRF (pseudo fijo a la Tierra a terrestre) (<c13/> / <c14/>, <c15/> de SOFA, <c16/>/<c17/> suministrados por quien llama; un efecto de decenas de metros al radio orbital); <b>reducción IAU 2006/2000A basada en CIO (CIO: Origen Intermedio Celeste)</b> (<c18/>: la cadena GCRS↔CIRS↔ITRS sin equinoccio (CIRS: Sistema de Referencia Intermedio Celeste; ITRS: Sistema Internacional de Referencia Terrestre), con el CIP (Polo Intermedio Celeste) <c19/> a partir de la matriz NPB (nutación-precesión-sesgo) 2006/2000A, la serie del localizador del CIO <c20/> de 66 términos, <c21/>, el ángulo de rotación terrestre y la <c22/> completa, validada <b>bit a bit</b> frente a los vectores <c23/>/<c24/>/<c25/> de SOFA). Las transformaciones <b>de extremo a extremo</b> ahora están ancladas a un ejemplo resuelto de autoridad publicado, y no solo a la autoconsistencia: frente al estado de <b>Vallado</b> AIAA 2006-6753 (2004-04-06, con sus EOP (parámetros de orientación terrestre) de IERS; <c26/>), TEME→PEF coincide hasta <b>{ "0.1" } mm</b>, TEME→ITRF hasta <b>{ "0.6" } mm</b>, el GCRS→ITRS completo con CIO hasta <b>{ "4" } mm</b>, y ECEF→geodésicas reproduce el ejemplo 3-3 de Vallado (lat/lon/alt) hasta el último dígito publicado. Toda la cadena es <b>accesible al usuario</b> mediante el escenario <c27/> (posición ITRF/ECEF + traza en tierra del subsatélite en WGS-84 en cada paso)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = La cadena TEME→GCRS por defecto usa 2000B (~{ "1" } mas, por debajo de su propia simplificación de rotación de marco de velocidad); la ruta < { "0.1" } mas 2000A completa está disponible mediante <c1/>, y la reducción rigurosa <b>CIO (X, Y, s)</b> está disponible mediante <c2/>. La ruta TEME heredada usa el GMST de IAU-1982 (convención de SGP4). El contraste numérico independiente con ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, un conjunto de herramientas de geometría planetaria en Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) está <b>entregado</b> (<c3/>: <c4/> frente al GCRF→ITRF93 de ANISE (GCRF: Marco de Referencia Celeste Geocéntrico; ITRF93: Marco de Referencia Terrestre Internacional { "1993" }) en ocho épocas de { "2020" }–{ "2023" }, ≤ { "0.86" } m en el suelo, ≤ { "3.6" } m a la órbita de un sistema global de navegación por satélite (GNSS)); es un crate independiente fuera de las puertas de CI por defecto. <c5/> y <c6/> también se contrastan directamente con ERFA en { "40" } épocas de { "1950" }–{ "2100" }, y la cadena CIO admite los desfases del polo celeste de IERS dX, dY (<c7/>; <c8/>); las rutas por defecto siguen despreciando dX, dY. La matriz de verificación califica esta fila como <b>VALIDATED</b> (vectores SOFA/ERFA + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + geodésicas: <b>hecho</b> (verificado con Vallado); TEME→GCRS inercial: <b>hecho</b> (2000B + 2000A completa); ITRF con movimiento polar: <b>hecho</b> (verificado con Vallado); GCRS→ITRS con CIO: <b>hecho</b> (verificado con Vallado)

# text
seg-7e3e210ca43c = Temporización y frecuencia

# text
# c1: src/filter_health.rs
# c2: filter_health
# c3: src/allan.rs
# c4: tests/allan_reference.rs
# c5: src/timetransfer.rs
# c6: src/holdover.rs
# c7: σ_x²(t) = q_wf·t + q_rw·t³/3 + q_drift·t⁵/20
# c8: clock_state
# c9: src/tpl.rs
# c10: cargo run --example tpl_jammertest
# c11: allantools
# c12: tests/mtie_reference.rs
# c13: tests/mdev_tdev_reference.rs
# c14: tests/gnss_denied_clock_holdover_reference.rs
# c15: telecom-timing
# c16: TELECOM-TIMING.md
seg-97de2d9d9ccf = Reloj de Kalman de dos estados con Q exacta de van Loan (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) con una <b>actualización de covarianza estabilizada de Joseph</b> (semidefinida positiva con cocientes Q/R extremos, comprobada por Cholesky en CI) y un <b>monitor de salud de consistencia del filtro</b> (<c1/>): una evaluación NIS/NEES de Monte Carlo (NIS: innovación normalizada al cuadrado; NEES: error de estimación normalizado al cuadrado) frente a bandas de confianza χ², presentada como <c2/> en el JSON del resultado (JavaScript Object Notation) y como tarjeta verde/ámbar en el área de pruebas, con una prueba de barrido de desajuste Q/R que demuestra que el monitor pasa a <em>incoherente</em> cuando el ajuste es incorrecto (Bar-Shalom §{ "5.4" }); estimadores <b>ADEV (desviación de Allan), MDEV (desviación de Allan modificada), TDEV (desviación de tiempo), HDEV</b> (desviación de Hadamard) solapados + intervalos de confianza basados en χ² con <b>grados de libertad efectivos específicos del tipo de ruido</b> (formas cerradas de la tabla { "5" } de NIST SP { "1065" } para WPM/FPM/WFM/FFM/RWFM (WPM: modulación de fase de ruido blanco; FPM: modulación de fase de ruido flicker; WFM: modulación de frecuencia de ruido blanco; FFM: modulación de frecuencia de ruido flicker; RWFM: modulación de frecuencia de paseo aleatorio), el conjunto que usa Stable32; la curva ADEV exportada identifica el tipo de ley de potencias del registro a partir de su pendiente de MDEV y adjunta una banda del { "95" }% por τ — <c3/>), <b>validados numéricamente frente a las desviaciones de referencia de Stable32 para el conjunto de datos canónico NBS14 hasta { "1e-4" }</b> (<c4/>) y con los edf contrastados mediante un conjunto de Monte Carlo de FM (modulación de frecuencia) de ruido blanco; cifra de mérito (FoM) de holdover honesta y acotada por la rejilla; conjuntos de relojes; <b>modelo de transferencia de tiempo bidireccional</b> con cancelación de retardo recíproco + un límite de retardo diferencial no recíproco de FM de paseo aleatorio (<c5/>, con la firma de Allan informada); una <b>calculadora de holdover de reloj sin GNSS</b> (<c6/>) que expone el crecimiento del error de avance por inercia de van Loan en forma cerrada <c7/> como una inversión de <em>holdover hasta el umbral</em> orientada al usuario (cuánto tiempo funciona un reloj en libertad antes de que su error de temporización supere el presupuesto), con clases representativas de relojes cuánticos (red óptica/iones atrapados/iones de mercurio) — <b>modelado, no validado externamente</b>: contrastado con la recursión de covarianza multipaso <c8/>, y declarado con honestidad que para un reloj muy estable el holdover hasta un umbral estricto está <b>gobernado por el nivel de ruido rojo de tau largo <em>supuesto</em>, no por el ADEV citado</b> (use niveles medidos para obtener una cifra defendible). Un <b>nivel de protección de temporización condicional</b> (<c9/>) se apoya en la misma maquinaria de holdover para el caso de <em>spoofing</em>: una cota del error de tiempo <b>no detectado</b> dada una comprobación cruzada independiente, un límite de monitor de k-σ más la varianza de avance por inercia de van Loan sobre la latencia de detección más un tiempo hasta la alarma de CUSUM (suma acumulada), calibrado con un <b>spoof real registrado</b> (JammerTest { "2024" }, Zenodo { "15911589" }) y reproducible mediante <c10/>. Composición <b>modelada</b>, condicionada a la detección: no existe una cota <em>incondicional</em> finita (una rampa suficientemente lenta elude a un único monitor asistido por reloj). El <b>error máximo de intervalo de tiempo (MTIE)</b> y el <b>TDEV</b> están VALIDATED frente a <c11/> (<c12/>, <c13/>), y la inversión de la varianza de avance por inercia del holdover está VALIDATED frente a SciPy (<c14/>); el tipo de escenario <c15/> los aplica a las máscaras G.8272 / G.8272.1 / G.8273.2 / G.8271.1 de ITU-T (Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones); véase <a1><c16/></a1>

# text
seg-cf16b15c0a27 = edf completo con el algoritmo de Greenhall (las formas cerradas simples tienen sesgo acotado pero son más toscas que el BasicSum exacto) e identificación de mezclas de varios tipos de ruido

# text
seg-d35d1a9e0ed3 = edf exacto + identificación de ruido mixto: P2

# text
seg-cdfb50bca79e = Procesamiento GNSS / PNT

# text
# c1: gnss-sim
# c2: src/gnss_sim.rs
# c3: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c4: gnss_measurements[]
# c5: Propagator
# c6: rinex
# c7: scenarios/orbit-rinex.toml
# c8: pvt
# c9: src/pvt.rs
# c10: −TGD
# c11: tests/pvt_abmf.rs
# c12: scenarios/pvt-abmf.toml
seg-733cf51a8c5e = Una <b>simulación de pseudodistancias en el dominio de la medición</b> (tipo de escenario <c1/>, <c2/>): por cada satélite visible sintetiza <c3/> y el Doppler en L1, con la <b>ionosfera monofrecuencia de Klobuchar</b> (IS-GPS-200 (IS: Interface Specification; GPS: Sistema de Posicionamiento Global) §{ "20.3.3.5.2.5" }) y la <b>troposfera cenital de Saastamoinen</b> (Davis { "1985" }) proyectada con la <b>función de mapeo de Niell ({ "1996" })</b>, cada modelo con prueba unitaria frente a un cálculo manual, y luego pasa los residuos a <b>RAIM instantáneo</b> (monitorización autónoma de integridad del receptor) para obtener HPL/VPL por época (HPL: nivel de protección horizontal; VPL: nivel de protección vertical) y emite una matriz <c4/> (pseudodistancia, Doppler, C/N₀, correcciones de iono/tropo por SV (vehículo espacial, es decir, un satélite)). Además, DOP/disponibilidad (DOP: dilución de la precisión) y RAIM de separación de soluciones a partir de órbitas; <b>ingesta de NAV multi-GNSS de RINEX (Receiver Independent Exchange Format) { "3" }</b> (GPS/Galileo/QZSS/BeiDou (QZSS: Sistema Casi Cenital de Satélites de Japón) mediante IS-GPS-200, vector de estado de GLONASS (Sistema Global de Navegación por Satélite de Rusia)) analizada → posición ECEF y sesgo de reloj del SV, utilizable como fuente <c5/> de primera clase Y como bloque de constelación <c6/> en línea (<c7/>); <b>ingesta de OBSERVACIÓN de RINEX { "3" }</b> (se espera que el formato de observación { "4.00" } se analice, pero no se ha probado ningún archivo { "4.00" }; los archivos de NAVEGACIÓN de RINEX { "4" } se rechazan por su nombre en lugar de decodificarse mal); un <b>solucionador de posicionamiento de punto único</b> (tipo de escenario <c8/>, <c9/>) que convierte pseudodistancias de código RINEX reales + efemérides de difusión en una <b>posición del receptor</b> mediante mínimos cuadrados ponderados iterados: corrección de Sagnac/rotación terrestre, reloj de satélite de difusión con <c10/>, la <b>combinación libre de ionosfera de doble frecuencia L1/L2</b> (o Klobuchar monofrecuencia), troposfera de Saastamoinen/Niell, ponderación por elevación, DOP y RAIM instantáneo, <b>validado con datos reales de IGS (International GNSS Service)</b> (estación ABMF, Guadalupe, 2018-05-13) hasta <b>{ "5.7" } m de RMS (raíz del error cuadrático medio) en 3-D / { "1.1" } m horizontal</b> frente a la coordenada topográfica de la estación (<c11/>, <c12/>); y lectura/escritura de órbitas precisas SP3 (Standard Product { "3" }, el formato de órbitas precisas)

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = Un motor de posicionamiento por <b>código</b> y, desde { "0.36" }, procesamiento de fase de portadora sobre observaciones reales: el solucionador <c1/> calcula una posición real a partir de mediciones de código reales (posicionamiento de punto único, de nivel métrico, con la combinación libre de ionosfera de doble frecuencia); <c2/> hace RTK de línea base corta sobre código y fase GPS de doble frecuencia reales (dobles diferencias, un filtro de Kalman flotante, fijación de ambigüedad entera con LAMBDA con la prueba del cociente, <c3/>), y un filtro PPP flotante estático se ejecuta sobre código y fase reales con órbitas y relojes finales de IGS. Ambos están VALIDATED frente a coordenadas ITRF2020 publicadas de estaciones IGS (WTZR/WTZZ, <c4/>, <c5/>, umbrales preregistrados); lo que sigue ausente es la resolución de ambigüedad entera en PPP, el RTK cinemático o de red y el funcionamiento en tiempo real. El suavizado de portadora de Hatch es un hallazgo MODELLED fijado (sus umbrales preregistrados no se alcanzaron). El tipo de escenario <c6/> ejecuta un filtro PPP flotante sobre mediciones que simula, para estudios de convergencia; el paquete <c7/> directo sigue siendo un simulador a partir de la verdad; BeiDou-GEO (GEO: órbita geoestacionaria) excluido

# text
seg-61b43da61326 = Fijación de ambigüedades PPP, RTK cinemático o de red, funcionamiento en tiempo real: use RTKLIB/gLAB (RTKLIB: una biblioteca de código abierto de posicionamiento cinemático en tiempo real)

# text
seg-820a5f1f7e3b = Fusión de sensores / navegación por estima con INS (sistema de navegación inercial)

# text
# c1: src/inertial/{attitude,mechanization,imu_errors}.rs
# c2: src/fusion/pack.rs
# c3: kind = "gnss-ins"
# c4: src/fusion/{gnss_ins_ekf,closed_loop}.rs
# c5: inertial
# c6: update_tightly_coupled
# c7: fuse_tightly_coupled
# c8: src/fusion/tightly_coupled17.rs
# c9: q_va
# c10: src/fusion/hybrid_ukf.rs
# c11: kind = "hybrid-ukf"
# c12: q_va
# c13: clock_state::q_from_allan
# c14: q_wf
# c15: q_rw
# c16: gnss-ins
# c17: [imu_*.error_model]
seg-4181becfd059 = <b>Biblioteca strapdown de 3 ejes</b> (<c1/>): actitud por cuaternión con compensación de coning/sculling, mecanización NED (norte-este-abajo) completa (velocidad de rotación terrestre + velocidad de transporte, gravedad de Somigliana de WGS-84) y un modelo determinista de errores de IMU (unidad de medida inercial) (se modelan <b>factor de escala, desalineación, sensibilidad a g, cuantización, rampa de velocidad</b>). El navegador strapdown está ahora <b>conectado a un paquete GNSS/INS débilmente acoplado ejecutable</b> con una cifra de mérito (<c2/>, <c3/>): la mecanización de tres ejes se disciplina con el <b>EKF de estado de error de 15 estados</b> (filtro de Kalman extendido) (<c4/>, realimentación de posición/velocidad/actitud/sesgo) mientras hay GNSS, y luego avanza por inercia durante la interrupción, sustituyendo el reinicio por ajuste a la verdad por una fusión genuina e informando del error horizontal fusionado frente al avance de un INS libre en lazo abierto. El paquete <c5/> heredado, aparte, sigue ejecutando el presupuesto <b>escalar de 1 DOF (DOF: grado de libertad)</b> con reinicio por ajuste a la verdad. También se implementa una actualización <b>de pseudodistancia fuertemente acoplada</b> (<c6/> / <c7/>): forma la innovación en el dominio del alcance (jacobiano de línea de visión sobre δp) y sigue corrigiendo con <b>menos de cuatro satélites</b>, donde no existe una solución PVT (posición, velocidad y tiempo) débilmente acoplada. Un <b>UKF GNSS/INS fuertemente acoplado completo de 17 estados</b> (filtro de Kalman unscented) (<c8/>) lleva posición, velocidad, error de actitud, sesgos de acelerómetro y de giroscopio, y el reloj del receptor (sesgo + deriva), con <b>navegación por estima con CAI (CAI: interferómetro de átomos fríos) cuántico</b>: el ruido de proceso de paseo aleatorio de velocidad es el <c9/> derivado del acelerómetro de átomos fríos, y avanza por inercia durante una interrupción de 120 segundos acotada a unos pocos cientos de metros (frente a los kilómetros de un INS libre de grado de navegación). Este UKF de 17 estados está ahora <b>expuesto como un escenario ejecutable</b> (<c10/>, <c11/>, accesible desde CLI/Python/WASM/MCP): los <b>{ "15" } estados de error del INS</b> se amplían con la <b>corrección del sesgo del acelerómetro derivada del CAI</b> (el interferómetro de átomos fríos fija el límite de paseo aleatorio de velocidad <c12/>) y un <b>reloj de 2 estados de fase y frecuencia</b> cuyo ruido de proceso procede del <b>motor de reloj con parámetros q</b> (<c13/>, perfil de Allan → <c14/>/<c15/>), impulsado por el modelo de error de CAI acotado entre corchetes, de modo que la ejecución demuestra una hibridación de corto plazo de IMU clásica + largo plazo cuántico. Su cifra de mérito es la <b>autoconsistencia del filtro</b>: <b>NEES + blancura de innovación (NIS)</b> agrupados sobre un conjunto de Monte Carlo frente a sus bandas χ² del { "95" }% (el filtro ajustado cae dentro de las bandas; un filtro mal ajustado se señala, una puerta objetivamente comprobable). <b>Esto es una declaración de AUTOCONSISTENCIA bajo el ruido modelado, NO una garantía de exactitud en el mundo real</b>: las entradas de CAI y de reloj están acotadas o modeladas, el hardware de CAI es propiedad del socio, y nada de lo aquí expuesto implica TRL (nivel de madurez tecnológica)>{ "3" }, herencia de vuelo ni validación externa. El modelo determinista de errores de IMU es <b>configurable por sensor desde el archivo de escenario TOML (Tom's Obvious Minimal Language) <c16/></b> (<c17/>: factor de escala, desalineación, sensibilidad a g, cuantización, rampa de velocidad), y por defecto es una fuente de sesgo constante pura cuando se omite

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = El acoplamiento fuerte es <b>solo de pseudodistancia</b> (la fase de portadora está en la hoja de ruta); el escenario <c1/> usa una <b>única trayectoria nivelada a velocidad constante</b> en la que los estados de error de actitud y de sesgo de IMU solo son débilmente observables, de modo que la consistencia NEES se evalúa sobre el <b>subconjunto estimable</b> (posición, velocidad, reloj = { "8" } estados): la observabilidad completa de los 17 estados exige una trayectoria con maniobras (hoja de ruta); el par sesgo de acelerómetro/inclinación del acoplamiento débil es débilmente separable, por lo que no se afirma una calibración por sesgo; el modelo de errores de IMU omite la rectificación de vibraciones y la deriva por gradiente de temperatura; el UKF de 17 estados y las rutas de acoplamiento fuerte están <b>autovalidados</b> (integración analítica a velocidad constante, convergencia con ayuda de GNSS, recuperación de sesgos, la cota de interrupción de 120 s limitada por el CAI y la referencia independiente de consistencia χ² de NEES/NIS); la propia <b>mecanización</b> strapdown está VALIDATED frente a NaveGo v1.4 (<c2/>: actitud idéntica bit a bit, velocidad/posición dentro de cotas analíticas indicadas), pero no se ha ejecutado ninguna validación cruzada a nivel de filtro (NaveGo o el conjunto de datos de vehículo de KF-GINS)

# text
seg-5d4529365f46 = acoplamiento fuerte con fase de portadora, observabilidad completa de los 17 estados con trayectoria de maniobras, biblioteca de trayectorias, validación cruzada a nivel de filtro con NaveGo/KF-GINS: <b>P2</b>

# text
seg-7d33171c5e26 = <b>Integridad / RAIM / ARAIM</b> (monitorización autónoma avanzada de integridad del receptor)

# text
# c1: src/raim.rs
# c2: araim_raim
# c3: P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)
# c4: araim_dual_raim
# c5: P_const = 0
# c6: araim_raim
# c7: IntegritySupportMessage
# c8: integrity
# c9: stanford_svg
# c10: PL=error
# c11: ARAIM_REFERENCE.md
seg-fd0afb948d1f = <b>RAIM instantáneo real</b> en <c1/>: solución por mínimos cuadrados + detección de fallos por χ² de residuos (umbral exacto a partir de un χ² de gamma incompleta sin dependencias) y <b>HPL/VPL basados en pendiente</b> (pbias a partir de un χ² no central para los P_fa/P_md configurados); <b>RAIM de separación de soluciones (MHSS)</b> con detección e identificación de fallos; <b>presupuesto de riesgo de integridad (P_HMI) de ARAIM</b> (<c2/>) que resuelve el menor HPL/VPL cuya <c3/> sumada satisface una asignación explícita de riesgo de integridad, el <b>modo de fallo de constelación completa de doble y múltiple constelación</b> (<c4/>, ARAIM TN (nota técnica) de la UE (Unión Europea) / DO-316; <c5/> ⇒ <c6/> bit a bit), un <b>mensaje de soporte de integridad</b> explícito (<c7/>: σ_URA/σ_URE/b_nom/P_sat/P_const, con los valores de referencia GPS+Galileo de WG-C (WG: grupo de trabajo)), además de un <b>diagrama de integridad de Stanford(-ESA, la Agencia Espacial Europea)</b> (el tipo de escenario <c8/> y un renderizador <c9/> independiente de las cuatro zonas + el límite <c10/>). Documentado de extremo a extremo en <a1><c11/></a1>. Además, la autoconsistencia del filtro de la cifra de mérito del escenario (cota de k-σ)

# text
# c1: integrity
# c2: integrity_fom
# c3: [integrity]
# c4: raim::snapshot_raim_fde
# c5: raim_fde
# c6: tests/integrity_snapshot_raim_rtklib_oracle.rs
# c7: src/araim_reference.rs
# c8: tests/integrity_araim_stanford_oracle.rs
# c9: raim::araim_raim
# c10: araim_subset_raim
# c11: add_v42_protection_levels_to_order
# c12: araim_dual_raim
# c13: araim_dual
# c14: scenarios/araim-gps-galileo.toml
# c15: araim_dual_constellation_availability
# c16: tests/igs_real_data.rs
# c17: tests/araim_dual_real_data.rs
# c18: xval/araim-m3/
seg-f5fa7c20d28d = RAIM es accesible mediante el tipo de escenario <c1/> y ({ "0.36" }, opcional) junto a la cifra de mérito de reloj/holdover como un bloque <c2/> aparte (<c3/>: RAIM instantáneo sobre un cielo predefinido desde un emplazamiento declarado, no disponible mientras el GNSS está denegado; MODELLED), nunca integrado en la cifra de mérito de holdover, que sigue informando de la autoconsistencia; el RAIM instantáneo incluye <b>FDE</b> de un solo satélite (detección y exclusión de fallos, <c4/>, VALIDATED frente a RTKLIB <c5/> en <c6/>); la separación de soluciones de múltiples hipótesis de ARAIM ADD v4.2 con determinación de subconjuntos de varios satélites está en <c7/> (VALIDATED frente a Stanford MAAST, <c8/>), pero el presupuesto de sigma uniforme <c9/> sigue cubriendo solo fallos de un único SV y de toda la constelación y no es conforme con ADD ({ "0.36" }, opcional: fallos simultáneos de subconjuntos de varios SV mediante la regla de subconjuntos de ADD v4.2 generalizada más allá de pares, <c10/>, <c11/>; MODELLED, sin ejecución de MAAST más allá de pares), y la exclusión de varios SV no se modela; y <c12/> está conectado al ejecutor de escenarios TOML mediante el indicador <c13/> (<c14/>), con una ruta de disponibilidad por época <c15/>; los núcleos instantáneo/MHSS/ARAIM se ejercitan sobre <b>geometría real de órbitas precisas de IGS (SP3)</b> (<c16/>) y sobre <b>TLE reales de GPS+Galileo de Celestrak</b> (<c17/>, con cada satélite propagado a una época UTC común, la época de TLE (conjunto de elementos de dos líneas) más reciente del conjunto, 2026-06-07T07:{ "21" }:{ "04" }, para un usuario con una inclinación de { "45" }° a { "400" } km durante { "24" } h: la disponibilidad bajo un VAL (límite de alerta vertical) de { "12" } m / HAL (límite de alerta horizontal) de { "10" } m es { "0.993" } solo con GPS, { "1.000" } con GPS+Galileo combinados y { "0.990" } en el modo dual robusto frente a fallos de constelación; la cifra publicada antes aquí, { "0.21" }→{ "0.67" } con el modo robusto "limitado", procedía de propagar cada satélite desde su propia época de TLE, un cielo que nunca existió, y se retira); la comparación anterior con la "Tabla A-3 de EU-ARAIM-TN" se retira (no hay fuente pública), y en <c18/> se intenta una reproducción de las entradas de URA máximo del hito { "3" } de ARAIM de WG-C UE-EE. UU. (tablas { "5" } a { "7" }, filas Depleted y Baseline) con desviaciones declaradas (MODELLED, véase INTEGRITY.md); sin certificación DO-229/ARAIM

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = ARAIM de múltiples fallos (ADD v4.2): <b>hecho</b>; subconjuntos de varios SV en <c1/> + paridad de dominio del receptor con gLAB + conexión con la cifra de mérito: <b>P2</b> (véase <a1><c2/></a1>)

# text
seg-7244b585a932 = Modelado de amenazas de spoofing y jamming

# text
# c1: spoof
# c2: src/spoof.rs
# c3: src/detection.rs
# c4: P_fa
# c5: P_md
# c6: 1 − P_md
# c7: jamming
# c8: src/jamming.rs
# c9: Q
# c10: availability_under_jamming
# c11: src/spoof_monitors.rs
# c12: parity_raim_test
# c13: AgcMonitor
# c14: SqmMonitor
# c15: fuse_spoof_layers
# c16: CombinedSpoofDetector
# c17: evaluate
# c18: spoof-detect
# c19: src/spoof_detect.rs
# c20: tests/spoof_texbat_validation.rs
seg-0cf86b61224c = Un <b>detector estocástico de spoofing de tiempo</b> (tipo de escenario <c1/>, <c2/> + <c3/>): cuatro formas de inyección (rampa lineal, salto escalón, meaconing, reproducción) frente a un monitor asistido por reloj con una <b>prueba de energía χ²₁ / de Neyman–Pearson</b> bilateral, con el umbral de detección fijado a partir de un presupuesto objetivo de falsas alarmas <c4/> y la <b>probabilidad de detección fallida <c5/> informada tanto en forma cerrada como por Monte Carlo</b> (las dos coinciden hasta unas pocas veces 1/√N); la cifra de mérito de seguridad es <c6/>. Además, un <b>modelo de jamming por presupuesto de enlace</b> (tipo de escenario <c7/>, <c8/>): relación inhibidor-señal a partir de la geometría (pérdida de trayectoria en espacio libre + ganancia de la antena receptora por dirección), la <b>ecuación estándar de C/N₀ efectivo con antiinterferencia</b> (ganancia de procesamiento de desensanchado + factor de separación espectral <c9/>; Kaplan y Hegarty §{ "9.4" }), la pérdida de enganche por satélite con un umbral de seguimiento configurable y una cifra de mérito <c10/> sobre una constelación Walker. Además, un <b>conjunto de monitores de spoofing multicapa de RF/medición (RF: radiofrecuencia)</b> (<c11/>): una prueba de paridad de <b>consistencia RAIM multisatélite</b> (<c12/>, SOS (suma de cuadrados) ponderada de residuos frente a un umbral χ²(m−{ "4" }); y señala correctamente que un sesgo de modo común es invisible para RAIM), un <b>monitor AGC (control automático de ganancia)</b> (<c13/>, exceso de potencia recibida sobre el nivel esperado), un <b>monitor de calidad de señal / SQM (monitorización de calidad de señal)</b> (<c14/>, desequilibrio de correlador Early/Late) y un combinador de fusión de capas (<c15/>). Estos se componen en un <b><c16/> integrado</b> cuyo <c17/> ingiere una época de observables (geometría + residuos, potencia de AGC, tomas Early/Late) y ejecuta las tres capas con la fusión ponderada en una sola llamada, devolviendo los diagnósticos por capa; se expone como el <b>escenario <c18/></b> ejecutable (<c19/>, accesible desde CLI / Python / área de pruebas, JSON + SVG (Scalable Vector Graphics)) y está <b>caracterizado frente a los parámetros publicados de los escenarios de TEXBAT (Texas Spoofing Test Battery)</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" }; <c20/>), reproduciendo el patrón de detectabilidad documentado, incluidos los resultados negativos: ds2 de sobrepotencia detectado por AGC + SQM, ds3 de potencia igualada solo por SQM, ds4 de empuje de posición por RAIM, y ds7 de potencia igualada y alineado en fase de portadora dejado (correctamente) al detector asistido por reloj

# text
# c1: jamming
# c2: [crpa]
# c3: src/crpa.rs
# c4: [terrain]
# c5: src/jamming_terrain.rs
# c6: [acquisition]
# c7: [front_end]
# c8: src/jamming_rx.rs
# c9: src/iq/channel/multipath.rs
# c10: src/iq/channel/land_mobile.rs
# c11: src/iq/frontend/agc.rs
# c12: jamming
# c13: Q
# c14: navsignal
# c15: CombinedSpoofDetector
seg-e423ffff332b = El tipo de escenario <c1/> es un <b>presupuesto de enlace</b>: no tiene multitrayecto ni dinámica de AGC en el tiempo. Desde { "0.36" } admite cuatro secciones opcionales: <c2/>, un haz de agrupación adaptativa por canal (anulación de nulos o MVDR de <c3/>, contrastado con un recálculo independiente en numpy; MODELLED), y <c4/>, la pérdida única por difracción de filo de cuchillo de la trayectoria del inhibidor sobre una tesela SRTM (<c5/>, ITU-R P.526-15 §{ "4.1" }, contrastada con un recálculo independiente en numpy sobre una tesela real; MODELLED, un solo filo de cuchillo), <c6/>, histéresis entre adquisición y seguimiento, y <c7/>, la lectura asentada del AGC y la pérdida del cuantificador del ADC con entrada gaussiana (<c8/>; marcada como no válida para inhibidores no gaussianos; MODELLED). El multitrayecto especular, el desvanecimiento móvil terrestre y el AGC existen en la capa IQ (<c9/>, <c10/>, <c11/>) y no están conectados al tipo de escenario <c12/>; la tabla del <c13/> de separación espectral contiene los valores de manual por tipo (CW y banda estrecha { "1" }, banda ancha y barrido { "2" } desde { "0.36" }), <b>fijados a los coeficientes derivados de las densidades espectrales de potencia (PSD)</b> en <c14/> (véase la fila de señal de navegación). El detector de spoofing asistido por reloj es de un solo reloj; los monitores de RF/medición están ahora integrados (<c15/>) y <b>caracterizados frente a los <em>parámetros</em> publicados de los escenarios de TEXBAT</b> (Humphreys et al.); el residuo es la validación frente a los vectores <b>sin procesar</b>, es decir, las muestras IQ (en fase/cuadratura) de TEXBAT (que requieren un front-end de adquisición y seguimiento SDR (radio definida por software) que kshana no tiene, por ser un simulador y no un receptor) o un escenario Spirent con licencia: un trabajo posterior documentado

# text
seg-34e1b6a6b738 = <b>detector combinado</b> asistido por reloj + consistencia RAIM multi-SV integrada + AGC + SQM + caracterización con parámetros de TEXBAT: <b>hecho</b>; validación con vectores sin procesar (IQ de TEXBAT / Spirent con licencia): trabajo posterior

# text
seg-557448077fb0 = Modulación de señales de navegación y rendimiento del seguimiento de código

# text
# c1: src/navsignal.rs
# c2: κ = 2/(3R_c)
# c3: κ = ∫ G_s(f)G_i(f) df
# c4: Q
# c5: jamming
# c6: Q = 1/(R_c·κ)
# c7: CodeFamily
# c8: 1/L
# c9: t(n)/L
# c10: φ(2ⁿ−1)/n
# c11: n mod 4 = 0
seg-22893b9a2c7a = <c1/>: el <b>nivel de señal</b> entre el presupuesto de enlace y el dominio de la medición. <b>Densidades espectrales de potencia</b> de área unitaria para <b>BPSK-R(n)</b> (modulación por desplazamiento de fase binaria, chips rectangulares) y <b>sine-BOC(m,n)</b> (portadora con desplazamiento binario) (validadas en CI hasta área unitaria, hasta la forma cerrada del coeficiente de separación espectral (SSC) propio de BPSK <c2/> y hasta la división espectral de BOC: nulo en la portadora, picos en ±f_s); el <b>coeficiente de separación espectral</b> <c3/>, que ahora <b>deriva el <c4/> antiinterferencia</b> que usa <c5/> a partir de los espectros reales de señal e inhibidor (<c6/>) en lugar de una constante representativa (la referencia de banda ancha se contrasta en CI); el <b>ancho de banda RMS (de Gabor)</b> (BOC > BPSK: la medida de información de distancia / de Cramér–Rao); la <b>fluctuación de ruido térmico del seguimiento de código con DLL (lazo de enganche de retardo) early–late coherente</b> (Kaplan y Hegarty §{ "8" }: ~submétrica para C/A a { "45" } dB-Hz, monótona en C/N₀); y la <b>envolvente de error por multitrayecto</b> (EML (early-minus-late) coherente, hallada localizando el cero del discriminador compuesto; se verifica la supresión del correlador estrecho). Una capa de <b>compromiso de diseño de códigos de distancia</b> (<c7/>) añade el lóbulo lateral de autocorrelación periódica de secuencias m/Gold (<c8/> para una secuencia m) y la <b>cota de correlación cruzada de Gold</b> de tres valores <c9/>, reproduciendo la correlación cruzada de Gold publicada de <b>GPS C/A −{ "23.9" } dB</b> (un ancla externa) y el recuento de secuencias m <c10/>, además de la inversión entre longitud de código y alcance sin ambigüedad; las garantías de Gold devuelven honestamente <em>None</em> donde no existe un par preferido (<c11/>), en lugar de informar una cota que no se sostiene.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Desde { "0.31.0" }, la <b>capa IQ</b> independiente (<c1/>, los comandos <c2/>; diseño en <a1><c3/></a1>) añade una cadena de receptor por software: adquisición por FFT (transformada rápida de Fourier), un banco de seguimiento multicanal DLL/PLL/FLL (lazo de enganche de retardo, de fase y de frecuencia), filtrado de front-end y cuantización de 1 a 14 bits, y transmisión en flujo de conjuntos de datos grabados. Un receptor por software independiente recupera la verdad inyectada de sus escenas, y los códigos GPS L1 C/A y los bits LNAV (mensaje de navegación heredado) coinciden bit a bit con gps-sdr-sim. Sigue faltando: los discriminadores de los lazos suponen el triángulo de correlación BPSK ideal, de modo que no hay resolución de la ambigüedad de seguimiento de BOC; los modelos de canal y de lazo son MODELLED, contrastados con formas cerradas y con la verdad inyectada, <b>no con IQ de campo medido</b>; solo lazos escalares (sin seguimiento vectorial). El diseño del <b>hardware</b> de antena y carga útil de RF (diagramas de radiación, front-end) queda deliberadamente fuera de alcance: es el papel de un socio de carga útil.

# text
seg-a62a0d9aa1d0 = ambigüedad de BOC + validación con IQ de campo de la capa IQ: P2+

# text
seg-6b974aba070f = Física de sensores PNT cuánticos

# text
# c1: src/inertial/quantum_imu.rs
# c2: Φ = k_eff·a·T²
# c3: σ_Φ = 1/(C√N)
# c4: q_va
# c5: |H(ω)|
# c6: coriolis_phase
# c7: 2Ω×v
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: QuantumNavBudget
# c11: ½·b·t²
# c12: AccelModel
# c13: QUANTUM.md
seg-3773b241a9e5 = La mayoría de los sensores son <b>coeficientes publicados de Allan / presupuesto de ruido</b> (CSAC, óptico), <b>más un acelerómetro de interferómetro de átomos fríos (CAI) a partir de primeros principios</b> en <c1/>: la fase de Mach–Zehnder de tres pulsos <c2/>, el ruido de proyección cuántica (shot) <c3/>, la PSD de paseo aleatorio de velocidad derivada <c4/> que consume la pila inercial, la caída de contraste, la función de transferencia de vibración <c5/> + la varianza de PSD blanca y ahora los sistemáticos de <b>Coriolis/rotación</b> (<c6/>, sesgo equivalente <c7/>) y de <b>desplazamiento luminoso AC-Stark (AC: corriente alterna)</b> (<c8/>, cancelación simétrica) + un <b>barrido de deriva</b> del tiempo de ciclo (<c9/>), y un <b>presupuesto de error de navegación por estima cuántico-inercial compuesto</b> (<c10/>) que integra el paseo aleatorio de velocidad de ruido blanco del CAI junto con el sesgo residual (<c11/>, contrastado con el integrador de Euler <c12/> independiente), el error de factor de escala y una degradación opcional de estabilidad a <b>largo plazo</b> (distinta de la decoherencia por disparo) en una única cifra de deriva de posición durante el holdover, más un holdover inercial hasta el umbral: el gemelo de navegación por estima del holdover del reloj. El nivel cuántico modelado está <b>acotado entre dos valores (no igualado en paridad)</b> frente a los { "96" } nm/s²/√Hz del gravímetro móvil de Freier et al. { "2016" } (arXiv:{ "1512.05660" }): queda por debajo y a unos ~{ "2" } órdenes de magnitud de él. Documentado en <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Los sistemáticos de frente de onda y de apuntamiento del haz no se modelan; el <em>límite</em> de ambigüedad de franjas de Mach–Zehnder sí se modela (<c1/>, <c2/> en <c3/>), pero resolver la ambigüedad no; los presupuestos exactos de pruebas en vuelo de CARIOQA-PMP (CARIOQA: Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense (requieren PSD de plataforma publicadas + SNR (relación señal-ruido) por disparo) y un preajuste de área de pruebas en JS (JavaScript) quedan pendientes

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = sistemáticos de frente de onda + reproducción de pruebas en vuelo: P2+ (<a1><c1/></a1>)

# text
# c1: src/walker.rs
# c2: tests/igs_real_data.rs
# c3: {planes × sats × inclination}
# c4: constellation-design
# c5: optimize_walker_design
# c6: MinSatellitesForCoverage
# c7: MaxCoverage
# c8: MinWorstPdop
# c9: coverage_half_angle_rad
# c10: street_half_width_rad
seg-59e99de860b2 = Walker sintético (tanto kepleriano analítico <b>como de elementos medios SGP4</b>, este último propagado con el núcleo validado a { "4.12" } mm: <c1/>) + visibilidad y DOP multiconstelación con TLE reales (GPS+Galileo hasta el { "100" }%), validado frente a una <b>instantánea real de gps-ops de Celestrak</b> (<c2/>); un <b>barrido de diseño de PDOP (dilución de la precisión de posición)</b> sobre la rejilla <c3/> y cifras de mérito de <b>fracción de cobertura / tiempo de revisita</b>; el <b>tipo de escenario <c4/></b> ejecutable (patrones Walker delta y star en la convención i: T/P/F, listas explícitas de elementos, diseños multicapa y preajustes publicados, alrededor de la Tierra, la Luna, Marte o cualquier otro cuerpo catalogado) cuya geometría Walker y cuyas posiciones publicadas de GPS, Galileo y GLONASS están VALIDATED frente a las tablas publicadas y cuya dilución de la precisión global de la línea base de GPS está VALIDATED frente al estándar de rendimiento del Servicio de Posicionamiento Estándar de GPS, mientras que los mapas de cobertura de diseños arbitrarios siguen siendo MODELLED; un <b>optimizador de diseño sin gradiente</b> (<c5/>) que busca en la rejilla el mejor diseño según un objetivo elegido (<c6/> / <c7/> / <c8/>), validado para devolver al ganador por fuerza bruta; y <b>geometría analítica de calles de cobertura</b> (<c9/>, <c10/>; formas cerradas de Rider/Beste, verificadas a mano: GPS con una máscara de { "5" }°: λ ≈ { "71.2" }°, semianchura de calle de 4 satélites ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Existe un dimensionado idealizado de <b>mínimo de satélites por calles de cobertura</b> (<c1/>); no está implementada la corrección exacta de Rider en la costura del límite entre planos contrarrotantes; el área de pruebas dibuja una vista de órbitas en 3-D sin dependencias (<c2/>), y una exportación CZML (Cesium Language), <c3/>, carga la geometría en el globo de CesiumJS; el núcleo de DOP está VALIDATED frente a gnss_lib_py (<c4/>), y la canalización completa de visibilidad multiconstelación se contrasta de extremo a extremo con Orekit { "12.2" } + gnss_lib_py (<c5/>): los diseños terrestres coinciden en todos los umbrales, pero los diseños de la Luna y de Marte no alcanzan el umbral de DOP con geometría numéricamente singular, por lo que la fila sigue siendo MODELLED; "arriba" geodésico frente a geocéntrico en el marco de DOP

# text
seg-3fcc2a2a90ba = dimensionado por calles de cobertura + vista de órbitas en 3-D + contraste terrestre de extremo a extremo: <b>hecho</b>; corrección exacta de Rider en la costura + DOP mal condicionado fuera de la Tierra: P2

# text
seg-afd5b595ee5e = Verificación y validación

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Comprobaciones con referencia independiente externa en todo el motor (SGP4 frente a { "666" } vectores AIAA, la familia de Allan frente a Stable32 y allantools, los marcos frente a SOFA/ERFA, el modelo de fuerzas y la determinación de órbita frente a Orekit, ARAIM frente al ejemplo resuelto de WG-C y más; el recuento vigente está en la cabecera generada de <a1><c1/></a1>); comprobaciones deterministas de Allan; una <b>matriz de verificación comprobada por máquina</b> (<c2/>), una referencia cruzada requisito→módulo→prueba→referencia independiente→estado cuyas invariantes de honestidad tienen <b>pruebas unitarias</b>: una fila solo puede etiquetarse como <em>validada</em> si lleva una referencia independiente <b>externa</b> (NIST/AIAA/SOFA/IGS/valor publicado), de modo que una comprobación interna de autoconsistencia no pueda hacerse pasar por una validación; se representa en Markdown/CSV (CSV: valores separados por comas) para una referencia cruzada de verificación ECSS-E-ST-10-02 (ECSS: Cooperación Europea para la Normalización Espacial), y registra como tales las cuatro lagunas de hardware y PA (PA: aseguramiento del producto) que son responsabilidad del socio

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Los conjuntos de calibración cubren por ahora tres comprobaciones de una sola semilla (<a1><c1/></a1>, preregistrados: el intervalo bootstrap de Monte Carlo cubre en el { "96" } % de { "200" } semillas; una tolerancia de percentil es frágil frente a la semilla, NOT MET en { "91.5" } %); las demás filas siguen calibradas con una sola semilla. La matriz impone la <em>clasificación</em> de las filas, y CI comprueba ahora también que existan todas las pruebas, archivos y elementos internos del crate que cita una fila (<c2/>, <c3/>) y que las cifras publicadas sigan reproduciéndose (<c4/>); no califica la referencia independiente en sí, que una persona revisora sigue leyendo

# text
seg-d3b92a831cd9 = conjuntos de calibración: P1

# text
seg-f382bb1b5d54 = LEO-PNT (posicionamiento, navegación y temporización desde órbita terrestre baja)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Siete tipos de escenario, agnósticos del sistema y con preajustes públicos con nombre: <b><c1/></b> (diseños de señal de cualquier banda y estructura: componentes BPSK, BOC, MBOC (BOC multiplexado) o planos de tipo OFDM (multiplexación por división de frecuencias ortogonales), seguimiento de código, adquisición, compatibilidad con GNSS, compromiso de banda), <b><c2/></b> (un paso diseñado, de elementos, de TLE o Walker con un presupuesto de enlace por banda: lluvia, centelleo y pérdida de penetración en edificios de ITU-R (Sector de Radiocomunicaciones de la Unión Internacional de Telecomunicaciones), ionosfera, antena, Doppler, frente a los satélites GNSS MEO (órbita terrestre media) a la vista), <b><c3/></b> (efemérides y reloj de difusión sobre la base kepleriana del ICD (documento de control de interfaz) de Galileo o modelos LEO seleccionables, ajustados y codificados con una comprobación de trama CRC-24Q (comprobación de redundancia cíclica de 24 bits)), <b><c4/></b> (posicionamiento fusionado MEO + LEO por pseudodistancia y Doppler sobre cualesquiera constelaciones), <b><c5/></b> (convergencia de PPP con y sin aumentación LEO, sobre mediciones simuladas), <b><c6/></b> (cotas de posicionamiento 5G NTN, de red no terrestre, a partir del ancho de banda de la señal) y <b><c7/></b> (un sistema de extremo a extremo, con la salida de cada etapa entregada a la siguiente). Piezas VALIDATED: los términos del enlace de ITU-R frente a las tablas y los ejemplos de validación de las Recomendaciones, el Doppler máximo frente a una tabla publicada, el algoritmo de usuario de Galileo frente a RTKLIB hasta { "1" } mm, CRC-24Q, los pesos del SISRE (error de alcance de la señal en el espacio)

# text
seg-5f87d4e409d5 = Sin datos de campo ni señales grabadas; las cifras de posicionamiento, PPP, NTN y temporización son MODELLED (formas cerradas, consistencia del filtro, comparaciones con tendencias publicadas); los preajustes proceden de fuentes públicas o están derivados, no son datos de un operador

# text
seg-d29a58fe2c84 = validación con señales grabadas reales: P3

# text
seg-4ea6f7ecc4a7 = Espectro / entorno de RF

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>Tipo de escenario <c1/></b> (<c2/>): la banda L de GNSS (y diseños multibanda de ultra alta frecuencia (UHF), banda S y banda C) como una única densidad espectral de potencia, con la frecuencia en horizontal y el tiempo hacia abajo, bajo una línea temporal de inhibidores programada (inhibidores de onda continua, de banda estrecha, chirp y de banda ancha igualada), con J/S (relación inhibidor-señal) por banda y C/N₀ efectivo (densidad de portadora a ruido); grabaciones SigMF de entrada y salida y estimaciones espectrales de Welch de muestras complejas. Los espectros de señal en forma cerrada y los coeficientes de separación espectral están VALIDATED; la cascada es MODELLED

# text
seg-970852c2e2e8 = Señales de GLONASS, BeiDou y Galileo E6 no modeladas; sin validación de front-end de receptor ni de IQ (en fase/cuadratura) grabado

# text
seg-5402957c3eb5 = comparación con señales grabadas: P3

# text
seg-a5e741fa9d69 = Confianza en el registro del receptor (buque y general)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/>: monitores sobre el propio registro de un receptor (densidad de portadora a ruido, consistencia de posición, velocidad y rumbo, tiempo) con eventos y predicciones declarados antes de la ejecución; en una plataforma de buque, una puntuación de 0-100 con motivos; modo en vivo sobre un flujo con la sentencia <c2/> y una puerta opcional. MODELLED; orientativo, no un equipo de navegación homologado

# text
seg-810132d58fbf = Los umbrales son valores por defecto declarados, no medidos frente a receptores en servicio; un registro puntúa solo ese registro; sin entrada ni salida de radiofrecuencia; no es un equipo de navegación homologado

# text
seg-82017a0ec045 = Paquetes de evidencias y telemetría de confianza

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/>: un paquete firmado y encadenado por hash con una ventana de registro, su configuración y el resultado del motor, verificable sin conexión, con un token de sello de tiempo RFC { "3161" } opcional. <c2/>: el flujo de confianza como métricas de Prometheus, eventos de syslog (CEF o LEEF) y, opcionalmente, OpenTelemetry, con un panel de Grafana de ejemplo

# text
seg-9d2138e7a040 = Un paquete es un registro técnico, no un dictamen jurídico, y no dice qué causó un evento; no se verifica la firma de la autoridad de sellado de tiempo; la telemetría transmite solo telemetría

# text
seg-744f186bdf09 = Flujos de formación de tripulaciones y mapas de interferencia

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/>: NMEA de puente sintético con eventos programados de jamming, arrastre, spoofing de tiempo y reproducción, y un registro del instructor (solo texto). <c2/>: mapas agregados de navegación degradada a partir de informes de aeronaves y buques con licencia abierta y la exposición de una ruta, a partir de archivos locales

# text
seg-91174c1a81be = Los flujos son datos de formación, nunca para los sistemas de navegación en vivo de un buque; los mapas son agregados, no un pronóstico, y dependen de los informes dados

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/>: el movimiento del vehículo y los eventos de un escenario <c2/>, <c3/> o <c4/> como un CSV de movimiento, NMEA, texto de puntos de ruta y archivos de eventos para un simulador GNSS de laboratorio

# text
seg-e5aa0f32fb2a = No se escribe ninguna señal; no se afirma ningún rendimiento de simulador ni de receptor; los archivos se comprueban tal como los releen los lectores de movimiento de un simulador de código abierto (gps-sdr-sim), pero la física de la propia trayectoria de verdad del escenario no se comprueba externamente

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> y <c2/>: lee páginas I/NAV de Galileo o un flujo UBX e informa, por satélite y época, de si los datos de navegación están autenticados (clave firmada con raíz de Merkle, cadena TESLA, MAC), con el motivo por el que falló una comprobación y un tiempo de referencia independiente opcional para la frescura; también <c3/> en Python y WebAssembly

# text
seg-0e782e8a2775 = Autentica datos frente a claves que suministra el usuario; no afirma rendimiento antispoofing y no es un servicio de integridad de la navegación ni un equipo homologado; comprobado con vectores sintéticos, los vectores de prueba oficiales del ICD son una descarga externa

# text
seg-98d0bc6b40ce = Asignación de compliance a marcos públicos

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> y <c2/>: resultados de Kshana asignados a seis marcos y normas públicos de resiliencia, con fuentes y una laguna en cada fila; una ejecución solo cuenta cuando su resultado lleva los campos que escribe su tipo de escenario

# text
seg-50652c747b6a = Una asignación es un juicio; el informe indica aquello a favor de lo que aporta evidencias un conjunto de ejecuciones, nunca que un marco se satisfaga ni que un producto esté aprobado; EN { "16803" } se cita solo a partir del texto del catálogo

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Un complemento de Signal K, OpenCPN mediante NMEA en modo de puerta sobre TCP y una compilación de referencia para un ordenador pequeño junto al receptor (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Probado con salida sintética grabada; el complemento no está publicado en npm; orientativo, no un equipo de navegación homologado

# text
seg-8281218f1c7c = Dominios más amplios de sistemas espaciales (fuera de alcance hoy)

# text
# c1: partial
seg-b564e0b42adc = Varios de estos son <b>none</b>; otros son ahora <b>modelos <c1/> de primer orden</b> (los tipos de escenario de análisis de misión / entorno añadidos en la serie { "v0.17.0" }): se enumeran para que el alcance sea inequívoco y no quede implícito por omisión. Kshana es un simulador PNT, no GMAT/STK/Orekit (STK: Systems Tool Kit); estos modelos adyacentes son deliberadamente de primer orden y MODELLED, nunca herramientas de vuelo validadas.

# text
seg-8125b00a48e4 = Nota / hoja de ruta

# text
seg-6779cc4a0e99 = Diseño de misiones / optimización de trayectorias

# text
# c1: src/maneuver.rs
# c2: maneuver::lambert_multirev
# c3: tests/lambert_multirev_oracle.rs
# c4: maneuver::porkchop_kernel
# c5: tests/porkchop_de440_oracle.rs
# c6: maneuver::optimise_transfer_kernel
# c7: tests/transfer_optimiser_oracle.rs
# c8: src/ephem_provider.rs
# c9: xval/anise-mars-od
seg-3c1a80170fd5 = <c1/>: nodos de ΔV impulsivos con propagación de covarianza de { "6" }×{ "6" } (marcos de error de ejecución ECI/LVLH (ECI: inercial centrado en la Tierra; LVLH: vertical local, horizontal local)), integración de quemado finito contrastada con la ecuación de <b>Tsiolkovski</b> en forma cerrada hasta < { "0.01" } %, un solucionador de <b>Lambert de una sola revolución de Izzo-2015</b> + un <b>propagador de Kepler</b> exacto de variables universales (salidas de Lambert reconvertidas frente a la verdad de dos cuerpos) y un barrido <b>porkchop</b> (lanzamiento × llegada) de C3 / V∞ de llegada emitido como una rejilla de contornos JSON cuyo mínimo se contrasta con el suelo analítico de Hohmann. <b>Sin optimizador de trayectorias</b>; un solucionador de <b>Lambert multirrevolución</b> (<c2/>, hasta tres revoluciones, ambas ramas) está VALIDATED frente a pykep { "3.0.1" } (<c3/>); el porkchop se ejecuta sobre el modelo sintético circular coplanario o, con <c4/>, sobre un SPK DE440 (VALIDATED frente a estados de SPICE + el Lambert de pykep, <c5/>); <c6/> encuentra el óptimo continuo de fecha (C3 mínimo o V∞ de llegada mínimo, tipo I o II) sobre DE440, VALIDATED frente a un optimizador independiente con SPICE + pykep + SciPy (<c7/>); frente a los mínimos Tierra–Marte de { "2026" } publicados en NASA/TM-2010-216764 coincide con los valores del tipo II y no alcanza el C3 mínimo del tipo I en −{ "5.18" } % (registrado). No se ejecutó GMAT en sí; pykep es la referencia independiente de la biblioteca. Ya existen una <b>interfaz de efemérides planetarias</b> de espacio profundo (<c8/>) y un <b>contraste con DE440 (Development Ephemeris { "440" })</b> (<c9/>, { "137" } m @ arco de Marte de 1 día); véase la fila de PNT de espacio profundo / interplanetario. La capa de simulación de rendimiento por encima de GMAT/Orekit, no un sustituto. P3

# text
seg-e42e299359d6 = AOCS (sistema de control de actitud y órbita) / GNC (guiado, navegación y control) / actitud

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
# c3: 1.5·(μ/R³)·ΔI
# c4: src/attitude_dynamics.rs
# c5: tests/attitude_dynamics_basilisk_oracle.rs
# c6: tests/attitude_gg_torque_basilisk_oracle.rs
# c7: src/wahba.rs
# c8: aocs
# c9: src/aocs.rs
# c10: src/aocs_kind.rs
# c11: AOCS.md
# c12: src/aocs_mekf.rs
seg-a1bccf1c2e01 = Tipo de escenario <c1/> (<c2/>): <b>par de gradiente de gravedad</b> del peor caso <c3/> + <b>presupuesto de error de apuntamiento RSS (raíz de la suma de cuadrados)</b> sobre términos de 1σ por contribuyente: un presupuesto escalar MODELLED de apuntamiento y perturbaciones previo al hardware. La <b>dinámica de actitud de sólido rígido</b> sin par con estado de cuaternión (<c4/>: ecuaciones de Euler + cinemática de cuaternión, RK4) está VALIDATED frente al concentrador de nave de Basilisk { "2.9.1" } (<c5/>, cuaternión dentro de { "1e-9" } en { "1e4" } s), y el pico del par de gradiente de gravedad frente al GravityGradientEffector de Basilisk (<c6/>); la determinación de actitud de Wahba está en <c7/>. <b>Tipo de escenario <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>): un giro de apuntamiento inercial con ruedas de reacción equilibradas bajo realimentación MRP, pares de rueda de norma mínima con límites de motor; el lazo cerrado está <b>VALIDATED</b> frente a Basilisk { "2.9.1" } en tres casos preregistrados hasta el error de redondeo. Un MEKF a partir de un giroscopio y un seguidor estelar (<c12/>) puede cerrar el lazo sobre su estimación (MODELLED, consistencia del filtro). Sin guiado de seguimiento, realimentación integral, gestión de momento, magnetopares, propulsores, fricción de rueda ni límites de velocidad; sin entorno de pares externos en la dinámica de actitud; no es un controlador de vuelo. P3

# text
seg-eb137d279247 = Marcos de referencia → fijos a la Tierra

# text
seg-c45f5e2f4bec = <b>Hecho</b>: TEME→ECEF/ITRF, el movimiento polar y la cadena GCRS→ITRS basada en CIO están implementados y VALIDATED (bit a bit frente a SOFA/ERFA; { "4" } mm de extremo a extremo frente a Vallado). Véase la fila de <b>marcos de referencia</b> más arriba

# text
seg-aa268d6f1635 = Comunicaciones y presupuestos de enlace

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/>: un <b>presupuesto de enlace de Friis de espacio profundo</b> (potencia de transmisión · ganancias de antena · ruido → C/N₀ · Eb/N₀ · margen) que alimenta la ruta radiométrica/GSE (GSE: equipo de apoyo en tierra), además de los enlaces ópticos y de RF de transferencia de tiempo (<c2/>), y el <b>tipo de escenario <c3/></b> ejecutable: la ecuación de enlace unidireccional CCSDS-401/DSN-810-005 (DSN: Red de Espacio Profundo) <c4/> con entradas de <b>EIRP (potencia isotrópica radiada equivalente) / G-T</b> y selección de banda S/X/Ka (presupuesto de enlace de ingeniería MODELLED, no la hoja de datos de un terminal calibrado). Sin programación de accesos, sin codificación adaptativa. P2

# text
seg-cd6f9d8d0dc2 = Segmento terreno y operaciones

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = Tipo de escenario <c1/> (<c2/>): <b>predicción de pasos de salida y puesta de una estación terrestre</b>: AOS/TCA/LOS (AOS: adquisición de señal; TCA: instante de máximo acercamiento; LOS: pérdida de señal), elevación máxima, duración por paso y acceso total en un horizonte, a partir de un conjunto de elementos SGP4 sobre el marco fijo a la Tierra IAU 2006/2000A con refracción ITU-R P.834-9 y tiempo de luz: <b>VALIDATED frente a Orekit { "13.1.8" }</b> en estaciones a nivel del mar ({ "60" } casos / { "1210" } pasos, <c3/>); el <c4/> geométrico está VALIDATED frente al detector de elevación de Orekit { "12.2" } ({ "22" } escenarios / { "129" } pasos, <c5/>); sin optimizador de programación ni resolución de conflictos. P3

# text
seg-ec6ce48c783e = Telemetría / TT&C / CCSDS

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
# c4: oem
# c5: src/ccsds_tdm.rs
# c6: space-packet
# c7: src/space_packet.rs
# c8: src/omm.rs
# c9: src/naif_kernel.rs
# c10: ephem_provider::KernelEphemeris
seg-4f1158386205 = TOML de entrada y JSON de salida a medida; <b>exportación <em>e importación</em> de CCSDS OEM (Orbit Ephemeris Message)</b> (502.0-B KVN (notación clave-valor), GMAT/Orekit/STK) mediante el <b>tipo de escenario <c1/></b> ejecutable (<c2/> <c3/>, puente de ida y vuelta; el intercambio de un solo objeto, ajustado a la norma, está <b>VALIDATED</b> frente al analizador independiente <c4/> { "0.4.5" }); <b>análisis y emisión de Tracking-Data-Message CCSDS-TDM ({ "503" })</b> (<c5/>, el formato de intercambio radiométrico de espacio profundo); y el <b>tipo de escenario <c6/></b> (<c7/>): codificación y decodificación de la cabecera primaria de <b>Space Packet CCSDS 133.0-B</b> con ida y vuelta exacta bit a bit. Un escritor de <b>CCSDS OMM</b> (Orbit Mean-Elements Message, 502.0-B-2, parte de la familia ODM) (<c8/>) publica elementos medios de SGP4 en KVN, y un <b>lector de kernels NAIF SPICE</b> en Rust puro (<c9/>: contenedor DAF, SPK tipo { "2" }, PCK binario tipo { "2" }) respalda <c10/>. Otros tipos de mensaje CCSDS (OPM, OCM, AEM (AEM: Attitude Ephemeris Message)) y la <em>escritura</em> de SPICE siguen siendo un elemento de la hoja de ruta (P2)

# text
seg-a3e6c2c5e7df = Interoperabilidad y estándares (RINEX/SP3/SPICE/CCSDS)

# text
# c1: Propagator::Sp3Precise
# c2: kshana <orbit.toml> --export-sp3 out.sp3
# c3: export_sp3 = true
# c4: tests/sp3_export_roundtrip.rs
# c5: kshana <orbit.toml> --export-oem out.oem
# c6: export_oem = true
# c7: tests/sp3_export_roundtrip.rs
# c8: pvt
# c9: src/ccsds_tdm.rs
# c10: --export
# c11: src/interop/
# c12: tests/interop_formats.rs
# c13: --import-route
# c14: spectrum
# c15: INTEROP.md
# c16: STANDARDS.md
# c17: oem-interop
# c18: src/omm.rs
# c19: src/naif_kernel.rs
seg-b41f3b5644a8 = <b>NAV multi-GNSS</b> de RINEX { "3" }: GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>y GLONASS</b> (RK4 de vector de estado PZ-90 (PZ: Parametry Zemli, el datum geodésico ruso)), ingerido + propagado + ejecutable como una constelación mixta; <b>analizador de OBSERVACIÓN de RINEX { "3" }</b> (pseudodistancia/portadora/Doppler/SNR por código de observación, con indicadores LLI/SSI (LLI: indicador de pérdida de enganche; SSI: indicador de intensidad de señal); se espera que { "4.00" } se analice, sin probar); <b>ida y vuelta de lectura ↔ escritura</b> de efemérides precisas SP3-c/d (análisis + exportación para Ginan/RTKLIB/gLAB) <b>y un propagador de Lagrange de orden 10 (11 puntos)</b> (<c1/>); la exportación SP3 está <b>expuesta en la CLI</b> (<c2/>, o <c3/>) y <b>validada de ida y vuelta</b> con la constelación GPS real hasta <{ "0.5" } m en { "24" } h (<c4/>); el <b>escritor de efemérides CCSDS OEM { "2.0" }</b>, la exportación de estado TEME con velocidad para herramientas de dinámica de vuelo, ahora <b>expuesto en la CLI</b> (<c5/>, o <c6/>) y comprobado de ida y vuelta frente al estado del propagador (<c7/>). El <b>analizador de observaciones RINEX alimenta ahora una solución de posicionamiento de punto único</b> (<c8/>, validada con datos reales de IGS; véase la fila de GNSS / PNT). Además, análisis y emisión de mensajes de datos de seguimiento <b>CCSDS-TDM ({ "503" })</b> (<c9/>). Exportaciones de geometría para visores y herramientas de análisis de misión: <b>CZML, KML (Keyhole Markup Language), GeoJSON y efemérides STK</b> (<c10/>, <c11/>), cada una releída por un validador escrito a partir de la especificación del formato (<c12/>), una importación de rutas GeoJSON (<c13/>), grabaciones <b>SigMF</b> (Signal Metadata Format) de entrada y salida para el tipo de escenario <c14/> y texto de tipo RINEX-4 / CSV para el mensaje de navegación LEO (<a1><c15/></a1>, <a2><c16/></a2>). Sin BeiDou-GEO, sin fijación de ambigüedad entera en PPP ni RTK cinemático (existen PPP flotante estático y RTK de línea base corta con datos reales; véase la fila de GNSS / PNT), sin escritor de SPICE y todavía sin OPM/AEM (el <b>lector de OEM</b> existe mediante el tipo de escenario <c17/>, el <b>escritor de OMM</b> en <c18/> y un <b>lector de SPK/PCK de SPICE</b> en <c19/>): <b>P2</b> "anexar dominios adyacentes mediante formatos estándar"

# text
seg-437dbb962136 = Clima espacial / entorno (iono/atmósfera/radiación)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = Tipo de escenario <c1/> (<c2/>): índices solares/geomagnéticos (tabla de 28 pasos <b>Kp↔ap</b> de IAGA (Asociación Internacional de Geomagnetismo y Aeronomía), Ap diario, <b>F10.7a</b> centrado de 81 días), <b>temperatura exosférica de Jacchia-71</b> y un <b>acoplamiento de densidad termosférica impulsado por la actividad</b> sobre una atmósfera estática: MODELLED de primer orden, <b>NO</b> un modelo de densidad absoluta NRLMSISE. Ionosfera: el modelo de difusión de Klobuchar (VALIDATED frente a RTKLIB) y un lector de mapas TEC (contenido total de electrones) IONEX (formato de intercambio de mapas de ionosfera) (<c3/>, con pruebas unitarias). Un mapa ionosférico global real de CODE (<c4/>) es la referencia independiente medida de la fila de TEC oblicuo libre de geometría (<c5/>), pero esa prueba evalúa el mapa en su propio generador de datos de prueba, de modo que el propio lector <c6/> todavía no se ha contrastado con un producto real; sin modelo ionosférico de base física ni impulsado por clima espacial; P2+

# text
seg-78a2c5a930e8 = Navegación por mapas de gravedad / alt-PNT

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: mapmatch
# c4: particle_filter
# c5: run_gps_denied_gravity_nav
# c6: scenarios/gps-denied-gravity-nav.toml
# c7: src/igrf.rs
# c8: igrf14coeffs.txt
# c9: src/altpnt/terrain.rs
# c10: .hgt
# c11: run_terrain_nav
# c12: run_combined_altpnt
# c13: src/altpnt/sequential.rs
# c14: run_sequential_trn
# c15: particle_filter
# c16: kind=
# c17: gravity-map
# c18: terrain-nav
# c19: combined-altpnt
# c20: terrain-slam
# c21: scenarios/terrain-nav.toml
# c22: scenarios/combined-altpnt.toml
# c23: scenarios/terrain-slam.toml
# c24: gravity-map
# c25: [reference]
# c26: .gfc
# c27: xval/icgem-egm2008/
# c28: [map_error_mc]
# c29: scenarios/gravity-map-error-mc.toml
# c30: combined-altpnt
# c31: [magnetic_grid]
# c32: terrain-nav
# c33: combined-altpnt
# c34: terrain-nav
# c35: combined-altpnt
# c36: xval/srtm-ungate/
# c37: run_sequential_trn_on_map
# c38: xval/terrain-slam-rbpf/
seg-431b3f05c08c = <c1/>: un <b>modelo de medición de gravímetro</b> de átomos fríos cuyo nivel de ruido blanco se deriva de la ASD del acelerómetro CAI (<c2/>), un <b>campo de anomalías de gravedad en armónicos esféricos completamente normalizados</b> de bajo grado (validado frente a las funciones de Legendre en forma cerrada y a una anomalía de un solo término derivada a mano) más <b>mascons</b> sintéticos, y un <b>filtro de partículas de correlación con mapas de gravedad</b> (que compone <c3/> + <c4/>) que recupera una trayectoria sin GPS a partir de la secuencia de anomalías que atraviesa. El <b>benchmark de 60 minutos sin GPS</b> (<c5/>, <c6/>) recorre una interrupción de ~{ "700" } km / una hora en la que la solución inercial deriva hasta <b>≈ { "70" } km</b>, y un correlador <b>jerárquico de grueso a fino</b> con el ruido blanco determinista con semilla del gravímetro la recupera hasta <b>≈ { "145" } m (< { "500" } m)</b>, estable entre realizaciones de ruido y demostrablemente limitado por el refinamiento (una sola rejilla gruesa se estanca en ~{ "2" } km). Además, un <b>modelo completo del campo principal geomagnético IGRF-14 (IGRF: Campo Geomagnético Internacional de Referencia)</b> (<c7/>: el campo de armónicos esféricos normalizados de Schmidt de IAGA hasta grado y orden { "13" }, { "2025.0" } + variación secular, con coeficientes generados por máquina a partir del <c8/> oficial; validado frente al dipolo inclinado en forma cerrada, una diferencia finita del potencial escalar y el polo/intensidad geomagnéticos conocidos): el campo magnético con el que una plataforma puede hacer correlación de mapas para navegación por anomalías magnéticas. Además, <b>navegación referenciada al terreno (TERCOM/SITAN (TERCOM: correlación de contornos del terreno; SITAN: Sandia Inertial Terrain-Aided Navigation))</b> y el <b>navegador combinado de gravedad + magnetismo + terreno</b> (<c9/>): un analizador artesanal de <c10/> de SRTM (Shuttle Radar Topography Mission) para modelos digitales de elevación (DEM) (16 bits con signo, big-endian, orden por filas, primera fila al norte, vacío -32768; validado frente a la especificación del controlador SRTMHGT de GDAL (Geospatial Data Abstraction Library) (formato de archivo de alturas de la Shuttle Radar Topography Mission) y a una referencia independiente de punto medio bilineal en forma cerrada), un modelo de <b>altímetro</b> radar/barométrico y un correlador <c11/> que recupera una trayectoria sin GPS a partir del perfil de elevación del terreno frente al DEM, y <c12/>, que fusiona <b>tres canales de campo escalares</b> por punto de ruta (Δg mGal · |B| nT anomalía cortical · elevación m) de modo que la distribución posterior conjunta es más nítida (CRLB (cota inferior de Cramér–Rao) más baja) que la de cualquier campo individual: acotada < { "500" } m durante la interrupción de 60 min y, en esperanza, no peor que el mejor canal individual. Además, <b>navegación secuencial (recursiva) referenciada al terreno: SITAN como filtro en ejecución</b> (<c13/>, <c14/>): el mismo modelo de medición altímetro frente a DEM ejecutado <b>época a época</b> mediante el motor SIR (remuestreo por importancia de muestreo) de <c15/> (predicción con el incremento del INS + ruido de proceso → repesado con la correlación con el terreno → remuestreo ante degeneración), de modo que una deriva <b>variable en el tiempo</b> del INS se <em>sigue</em> a lo largo de la trayectoria, mientras que el correlador por lotes solo recupera un único desfase constante: la estimación recursiva permanece acotada y reconverge (final ≈ { "70" } m) mientras que la solución sin ayuda diverge sin cota hasta ≈ { "5" } km, con el error por época siguiendo lo distintivo del terreno y un monitor de salud del tamaño efectivo de muestra. Alcance honesto: el mapa es <b>conocido y fijo</b>, es decir, <em>localización</em> recursiva frente a un DEM almacenado (la mitad de localización del SLAM de terreno (localización y mapeo simultáneos)); la estimación conjunta del mapa es el RBPF aparte que se describe más abajo. Los cuatro están ahora <b>conectados al motor de escenarios mediante <c16/></b> (<c17/>, <c18/>, <c19/>, <c20/>) con un gráfico SVG de deriva (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10):</b> el navegador <c24/> admite un campo de referencia real opcional (<c25/>: EGM2008 incluido hasta grado { "70" }, o un archivo <c26/> de ICGEM), cuya síntesis de anomalías coincide con el ICGEM Calculation Service hasta unos { "1e-8" } mGal (VALIDATED, <c27/>); con ese campo de grado 70 el benchmark de 60 min termina en { "3106" } m, de modo que el umbral de < { "500" } m es NOT MET (preregistrado y previsto: el grado { "70" } es demasiado suave). Un Monte Carlo opcional de error de mapa (<c28/>, <c29/>) muestra que la corrección sintética de { "144" } m supone un mapa exacto ({ "1" } de { "20" } realizaciones dentro de { "500" } m con un error correlacionado de { "2" } mGal; exploratorio). <c30/> admite una rejilla magnética cortical EMAG2v3 opcional (<c31/>; EMAG2 se descarga, no se incorpora al repositorio, y no se afirma ningún resultado de navegación con ella). <c32/> sigue siendo solo de DEM por diseño: es el correlador TERCOM/SITAN de un solo canal, y la correlación magnética está en <c33/>, que fusiona el terreno con los canales magnético y de gravedad; un canal magnético en <c34/> lo duplicaría, de modo que el punto de auditoría "EMAG2 en terrain-nav" queda cubierto por la conexión de <c35/> (RM-16). Las comprobaciones con SRTM real se ejecutan en CI sobre dos recortes completos de resolución completa confirmados en el repositorio (nodo por nodo iguales a GDAL { "3.8.4" }, <c36/>). Existe la estimación conjunta del mapa (<c37/>, un RBPF de estilo FastSLAM): en una sola pasada gana un { "1.5" } % sobre SITAN con mapa conocido en un mapa erróneo, sin alcanzar su umbral preregistrado del { "10" } % (<c38/>). <b>Sigue faltando:</b> un modelo de gravedad de alto grado en una ejecución de navegación (requiere un nuevo preregistro), un resultado de navegación magnética con rejilla real y un caso de SLAM con revisita (cierre de bucle). P3

# text
seg-bf09e5d705a0 = Reentrada / EDL (entrada, descenso y aterrizaje), análisis de lanzamiento, EO/carga útil (EO: observación de la Tierra)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Geometría MODELLED de primer orden mediante tres tipos de escenario ejecutables: <b><c1/></b> (<c2/>, corredor balístico de <b>Allen-Eggers</b>: deceleración máxima, velocidades de pico de g y de pico de calentamiento, altitud de pico de g), <b><c3/></b> (<c4/>, <b>azimut de lanzamiento</b> de dos cuerpos <c5/>, Δv de cambio de plano, bonificación por rotación del emplazamiento, oportunidades diarias) y <b><c6/></b> (<c7/>, geometría de <b>franja / GSD (distancia de muestreo sobre el terreno) / acceso / revisita</b> de EO con triángulo espacial de SMAD (Space Mission Analysis and Design)). <b>Sin</b> simulación EDL/aerotérmica de 6 DoF, sin optimizador de trayectorias, sin radiometría de sensores/MTF (MTF: función de transferencia de modulación). P3

# text
seg-439bd85c8bbc = PNT lunar / cislunar (LunaNet)

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: south_pole_hpl_pass
# c6: src/cr3bp.rs
# c7: cr3bp_jacobian
# c8: propagate_state_stm
# c9: differential_correct_halo
# c10: src/lunar_orientation.rs
# c11: moon_pa_de440
# c12: pxform
# c13: tests/lunar_pa_orientation_spice_oracle.rs
# c14: lunar::mci_to_mcmf
# c15: lunar-integrity
# c16: scenarios/lunanet-araim.toml
seg-a7a12eb111fc = <c1/>: un motor de <b>ARAIM lunar</b> que reutiliza el núcleo MHSS del lado terrestre con parámetros LNIS (LunaNet Interoperability Specification) de LunaNet (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), la <b>reducción de marco cislunar MCI↔MCMF (MCI: inercial centrado en la Luna; MCMF: centrado en la Luna y fijo a ella)</b> (<c2/> / <c3/>, un modelo simplificado de rotación media a la velocidad sidérea) y lat/lon/alt <b>selenográficas</b> (<c4/>), y un <b>paso de nivel de protección en el polo sur</b> (<c5/>) que cuantifica la brecha de integridad: con un alcance de { "30" } m el HPL es finito pero supera un límite de alerta de operaciones en superficie de { "50" } m. <c6/> añade el <b>CR3BP</b> (problema restringido circular de tres cuerpos) Tierra–Luna (dinámica en marco rotante + propagador RK4 + constante de Jacobi + los cinco puntos de Lagrange, validado frente a los valores publicados de L1/L2/L3 y los exactos de L4/L5): el núcleo de tres cuerpos que necesita una NRHO (órbita halo casi rectilínea) real, y un <b>corrector diferencial de matriz de transición de estado + disparo simple</b> (<c7/>, <c8/>, <c9/>) que produce órbitas halo/NRHO de L2 genuinamente periódicas: la STM está validada frente a diferencias finitas, los halos corregidos se cierran sobre sí mismos con precisión de máquina (conservando Jacobi), y al sembrar el estado de apoluna publicado se reproduce la <b>NRHO austral { "9" }:{ "2" } de L2</b> (la órbita de Gateway) con <b>periodo ≈ { "6.57" } d</b> y <b>perilunio ≈ { "3,250" } km</b>, coherente con los ≈ { "6.56" } d / ≈ { "3,370" } km publicados | Las CI (condiciones iniciales) de la NRHO corregida diferencialmente están ahora conectadas, pero la <b>transformación selenocéntrica (MCI/MCMF) desnormalizada de la órbita corregida</b> y la continuación de familias siguen siendo trabajos posteriores; la orientación lunar de ejes principales de DE440 con libración física real existe (<c10/>, a partir del PCK <c11/>, contrastada con SPICE <c12/> en <c13/>), pero la ruta <c14/> más antigua sigue usando la rotación media sin libración ni polo con precesión; la NRHO es una solución de CR3BP (circular, sin Sol), <b>no</b> está validada frente a una efeméride real de LANS/Gateway (LANS: Servicio Lunar de Navegación Aumentada); un tipo de escenario <c15/> ejecutable (<c16/>) expone desde la CLI el paso por el polo sur | transformación selenocéntrica + continuación de familias + interfaz SPICE/LunaNet: <b>P3</b>

# text
seg-e3d975b70014 = PNT de espacio profundo / interplanetario (Marte, radiométrico)

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
# c3: src/deepspace_od.rs
# c4: clock_state.rs
# c5: mars_atmos.rs
# c6: src/body.rs
# c7: src/mars_frame.rs
# c8: EphemerisProvider
# c9: src/ephem_provider.rs
# c10: mars-pnt
# c11: src/mars_pnt.rs
# c12: src/gse_sim.rs
# c13: xval/anise-mars-od
# c14: from_shadr
# c15: Body::with_gravity_field
seg-584d79a8ba08 = <b>Entregado en { "v0.17.0" }.</b> Un motor de navegación radiométrica: tiempo de luz iterativo + retardo de Shapiro, Doppler y distancia de dos, uno y tres sentidos (dos tramos de Moyer), retorno coherente del transpondedor, medición de distancia regenerativa/PN (PN: pseudoruido) (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), medios de plasma solar/tropo/iono (<c1/>); análisis y emisión de <b>CCSDS-TDM ({ "503" })</b> (<c2/>); un <b>SRIF de dinámica reducida</b> (filtro de información de raíz cuadrada) con aceleraciones empíricas RTN (radial, transversal, normal) + un reloj de a bordo de 3 estados + resistencia atmosférica de Marte (<c3/>, <c4/>, <c5/>) que logra una <b>OD en LMO (LMO: órbita baja de Marte) de ≈ { "0.2" } m</b> en un lazo cerrado sintético; fusión de unidireccional y bidireccional; un núcleo de dinámica multicuerpo (<c6/>, GMM-3 de Marte (GMM: Goddard Mars Model), marco de Marte de IAU <c7/>, una interfaz <c8/> <c9/>, JD en dos partes + TT↔TDB (TDB: Tiempo Dinámico Baricéntrico)); y el escenario de PNT por relé <b><c10/></b> (constelación areoestacionaria MARCONI, <c11/>) + un simulador de rendimiento de GSE de extremo a extremo (<c12/>). <b>Validado por simulación</b> (cifra de mérito de covarianza/lazo cerrado); dinámica heliocéntrica contrastada con JPL (Jet Propulsion Laboratory) DE440 ({ "137" } m @ arco de 1 día, <c13/>). <b>Falta:</b> validación con datos de seguimiento reales de DSN/ESTRACK (ESTRACK: Red Europea de Seguimiento Espacial); la gravedad de Marte en su marco nativo (el campo GMM-3 de d/o { "120" } se carga desde la tabla SHADR de PDS, <c14/>, VALIDATED frente a pyshtools, y se conecta mediante <c15/>, pero se evalúa en el marco de IAU y no en el suyo propio, Konopliv-2006); efemérides de grado DE en el núcleo (restringidas a kernels en xval). P3

# text
seg-00450a6acae0 = Sistema solar y PNT alrededor de cualquier cuerpo

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>Tipo de escenario <c1/></b>: posiciones, velocidades y constantes físicas del Sol, los planetas, Plutón, la Luna y siete lunas principales en una época, con el tiempo de luz entre cuerpos; las posiciones de los planetas (elementos de Standish de JPL) y el tiempo de luz están VALIDATED frente a JPL Horizons (<c2/>), las lunas, Plutón y la tabla de planetas exteriores siguen siendo MODELLED. <b>Tipo de escenario <c3/></b>: un orbitador o módulo de aterrizaje alrededor de cualquier cuerpo catalogado (Marte, la Luna, Europa, Ganímedes, Titán y el resto) que navega con pseudodistancias unidireccionales de una constelación Walker local más una distancia bidireccional opcional desde la Tierra: MODELLED. Sin kernel de efemérides planetarias en el núcleo (elementos analíticos), las órbitas de relé de <c4/> usan solo J2 (los campos completos GMM-3 de Marte de d/o { "120" } y GRAIL GL0660B de la Luna de d/o { "660" } se cargan desde tablas SHADR de PDS y se asocian a un <c5/> para el propagador, <c6/>). P3

# text
seg-433128dbc8a9 = Campañas / composición de misiones

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>Tipo de escenario <c1/></b> (<c2/>): tipos de escenario existentes encadenados en una línea temporal compartida (por ejemplo jamming, luego spoofing, luego holdover con un INS avanzando por inercia, luego una alarma de integridad, luego recuperación), barridos de parámetros y conjuntos de Monte Carlo con semilla sobre cualquier tipo de escenario, y varios escenarios bajo condiciones compartidas con un resumen combinado; cada número se lee de una ejecución real del tipo de escenario miembro. Las identidades de composición se prueban (<c3/>: una campaña de una sola fase reproduce la ejecución independiente byte a byte); MODELLED. Una sección <c4/> (rejilla o Nelder–Mead acotado sobre una a tres claves, una métrica, minimizar, maximizar o alcanzar un objetivo) alcanza sus umbrales preregistrados de forma cerrada y de fuerza bruta (<c5/>); MODELLED, una búsqueda local sin afirmación de óptimo global, y sin método de gradiente ni bayesiano. P3

# text
seg-378c53e44b92 = Informes, animación y salidas

# text
# c1: result.json
# c2: report.html
# c3: report.json
# c4: tests/advanced_report_cli.rs
# c5: --animate
# c6: src/animation.rs
# c7: ANIMATION.md
# c8: --export
seg-7bd95909787f = Cada ejecución escribe <c1/>, un gráfico y un informe (<c2/>, <c3/>) cuyas etiquetas se leen de la matriz de verificación y cuyo comando registrado reproduce el resultado byte a byte (<c4/>); <c5/> (svg, html o fotogramas) representa una serie temporal como animación (<c6/>, <a1><c7/></a1>); <c8/> escribe los formatos de intercambio de la fila de interoperabilidad. Son representaciones de la ejecución, no evidencia sobre la física.

# text
seg-3c3d3427723f = Ecosistema y preparación (se sigue con honestidad, no es una capacidad del código)

# text
seg-5770537524d3 = Área

# text
seg-e0426ffe2628 = Nota

# text
seg-bdee8089afb0 = Enlaces de lenguaje y empaquetado

# text
# c1: RunOutput
# c2: array
# c3: columns
# c4: series
# c5: ScenarioKind
# c6: ErrorKind
# c7: KindMeta
# c8: run_typed
# c9: RunOutput
# c10: scenario_kinds
# c11: units
seg-89fd1e232849 = Rust + Python (abi3) + WASM en tres registros. Superficies tipadas ({ "0.36" }, CAP-34): <c1/> de Python con accesores de NumPy (<c2/>, <c3/>, <c4/>) y <c5/> / <c6/> / <c7/> con tipos en stubs; <c8/> de JavaScript (un objeto <c9/> tipado) y <c10/>, con el mismo vocabulario en las declaraciones de TypeScript. Los documentos de resultados siguen siendo JSON por tipo de escenario, tipados solo por su sobre compartido (<c11/>, versiones)

# text
seg-e1dee294d0fe = Educación / UX (experiencia de usuario) de incorporación

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Área de pruebas del navegador con <b>modo guiado entregado</b>: controles deslizantes guiados adaptados al escenario (<c1/>, hasta seis mandos por escenario) y una visita guiada interactiva (<c2/>, repetible desde el área de pruebas). Cada ejecución obtiene además una frase de <b>significado</b> en lenguaje llano y sus cifras clave, leídas del documento de resultados (<c3/>, con plantillas por tipo de escenario en <c4/>; un tipo de escenario sin plantilla obtiene su primera cifra destacada expresada en lenguaje llano). Falta: explicaciones guiadas por cifra más allá de esa frase (el <a1><c5/></a1> en lenguaje llano las cubre)

# text
seg-becc4cd71f4c = Comunidad / gobernanza

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Andamiaje de gobernanza presente: <c1/> (modelo de mantenedor benevolente + umbral técnico + frontera abierto/cerrado), <c2/>, <c3/>, <c4/>, plantillas de incidencias/PR (PR: pull request), <c5/>, dependabot. Fundador único; una <b>comunidad externa activa</b> (colaboradores, citas) depende de las personas y del tiempo y sigue formándose (difusión pendiente de revisión)

# text
seg-5e222a61a61e = Preparación para financiación y contratación

# text
seg-fdbb9db68f1d = ninguna

# text
seg-86709f7f67c0 = TRL ~{ "3" }; todavía sin citas ni contratos de agencias (véanse las notas de estrategia)

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = Adiciones del demostrador FutureNAV (modeladas, contrastadas internamente, <b>no</b> validadas externamente): ({ "1" }) <b>Banco de pruebas de evaluación de detección de deterioros de RF mediante aprendizaje automático</b> <c1/>: un corpus de deterioros <b>sintético</b> etiquetado (basado en parámetros, no en IQ) + un arnés de ROC/AUC/confusión/Pfa-Pmd independiente del detector (ROC: característica operativa del receptor; AUC: área bajo la curva) con protección contra fugas de datos y partición estratificada; los detectores incluidos son líneas base transparentes de métodos publicados, no SOTA (estado del arte), y un AUC alto aquí demuestra la canalización, no el rendimiento en campo. ({ "2" }) <b>Motor de compromiso PNT cuántico frente a clásico</b> <c2/>: ingesta de ADEV medido (ajuste NNLS (mínimos cuadrados no negativos) de <c3/>, comprobado de ida y vuelta frente a <c4/>), una tabla de beneficio de holdover de temporización/inercial que lleva en el propio artefacto la advertencia sobre la hipótesis de nivel mínimo, y una envolvente de resiliencia frente al tiempo sin GNSS; <b>cuantifica</b> el beneficio cuántico de un socio, nunca valida el dispositivo. Ambos fueron revisados de forma adversarial (se detectaron y corrigieron un error de base de deriva τ²→τ³ y una afirmación falsa de resiliencia "acotada indefinidamente"). { "911" } pruebas de la biblioteca en el momento de esa adición, fmt+clippy limpios.

# text
# c1: src/interchange.rs
# c2: Envelope
# c3: format
# c4: SCHEMA_VERSION
# c5: engine_version
# c6: compatibility()
# c7: Envelope::parse
# c8: wrap
# c9: to_json
# c10: parse
# c11: payload_as::<T>()
# c12: Deserialize
# c13: SCHEMA.md
seg-deb7124d3c70 = Adición de intercambio / formato estándar (<c1/>): el <b>Kshana Interchange Format (KIF)</b>, un <c2/> neutro, versionado y autodescriptivo que envuelve cualquier artefacto (escenario, resultado, estudio de compromiso) con una etiqueta <c3/> reconocible, la <c4/> de fuente única de verdad (la versión del esquema, antes copiada como literal en { "15" } lugares, ahora pertenece a una única constante a la que hace referencia todo el crate), el <c5/> productor y un contrato de compatibilidad explícito y probado (<c6/>: la misma versión mayor y una menor igual o anterior se pueden leer bajo la disciplina de campos aditivos; una versión menor más nueva o una versión mayor distinta se rechaza en la frontera mediante <c7/> en lugar de analizarse mal en silencio). Con ida y vuelta (<c8/>→<c9/>→<c10/>→<c11/>) para cualquier carga útil <c12/>; deliberadamente <b>sin marcas de tiempo</b> para preservar la reproducibilidad bit a bit de Kshana. Documentado en <a1><c13/></a1> para que el formato sea <b>citable</b>, y no solo emitido: el posicionamiento de "estándar en espera" del núcleo abierto. { "923" } pruebas de la biblioteca en el momento de esa adición, fmt+clippy limpios.

# text
# c1: src/frugal.rs
# c2: walker
# c3: src/integrity_impact.rs
# c4: classify_stanford
# c5: src/verification.rs
# c6: VERIFICATION-MATRIX.md
# c7: src/impairment_eval.rs
# c8: stratified_split
# c9: Split::has_leakage
seg-adc959257e0b = Adiciones de la fase de dominancia de FutureNAV (modeladas, contrastadas internamente, <b>no</b> validadas externamente): ({ "1" }) <b>Capa frugal de coste por cobertura / ROI (retorno de la inversión)</b> <c1/>: una capa de planteamiento de beneficios sobre el motor de dimensionado de constelaciones (<c2/>) que informa del coste por punto porcentual de cobertura y del ROI de cobertura por euro frente a una línea base; el coste por satélite es un <b>intervalo bajo/nominal/alto suministrado por quien llama y con fuente</b> (sin precios puntuales inventados), de modo que las salidas son rangos y no puntos espurios; un planteamiento económico modelado de una cifra de cobertura modelada, no un presupuesto. ({ "2" }) <b>Asignación de impacto en la integridad de detecciones perdidas</b> <c3/>: asigna un sesgo de posición no detectado, inducido por spoofing o jamming, a su error efectivo → región de Stanford (disponible / sistema no disponible / engañoso / peligrosamente engañoso) frente a <b>límites de alerta específicos del contexto</b> (cielo abierto frente a urbano, HAL frente a VAL), componiendo el <c4/> de RAIM anclado externamente; el puente entre detección perdida y límite de alerta es modelado, no una asignación de integridad certificada. Ambas se asignan a la matriz de verificación comprobada por máquina (<c5/>, invariante Validated⇒ExternalDataset intacto; el recuento vigente de filas está en la cabecera generada de <a1><c6/></a1>). La validación cruzada / protección contra fugas / partición estratificada por parámetros para el arnés de evaluación de IA ya se entregó en <c7/> (<c8/>, <c9/>). { "951" } pruebas de la biblioteca en el momento de esa adición, fmt+clippy limpios.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = Adiciones del estudio de la brecha de optimismo de FutureNAV (modeladas, contrastadas internamente con formas cerradas, <b>no</b> validadas externamente, <b>no</b> una afirmación de simulación a campo): un estudio <b>sintético</b> controlado de la <b>brecha de optimismo</b> del AUC entre dentro y fuera de la distribución para detectores de deterioros de RF. ({ "1" }) <b>Detectores aprendidos</b> <c1/>: un mapa de características fijo + un estandarizador ajustado al entrenamiento, una línea base de regresión logística (descenso de gradiente determinista por lotes completos) y un <b>MLP</b> (perceptrón multicapa; retropropagación SGD (descenso de gradiente estocástico) con semilla) de una capa oculta tras el mismo rasgo <c2/> que usan las líneas base de métodos publicados. ({ "2" }) <b>Estadísticas derivadas a mano</b> <c3/>: intervalos de confianza (IC) por bootstrap de percentiles, varianza/IC del AUC de <b>DeLong</b>, ρ de <b>Spearman</b> y regresión <b>ridge</b>, cada una contrastada con una forma cerrada (AUC binormal Φ(d′/√{ "2" }), una varianza de DeLong calculada a mano, un ρ de manual con rangos empatados, recuperación exacta de OLS (mínimos cuadrados ordinarios)). ({ "3" }) <b>El estudio</b> <c4/>: AUC por clase, la tendencia de ley de escala por <c5/> (brecha frente a { "1" }−gravedad) y un <b>predictor ridge de la brecha solo con datos dentro de la distribución</b> que estima la brecha de optimismo únicamente a partir de diagnósticos dentro de la distribución, puntuado <b>dejando fuera un detector</b> y <b>dejando fuera una clase</b> frente a una línea base que predice la media. Artefacto de un solo comando mediante <c6/>. Cada número es un AUC sobre etiquetas derivadas de un modelo en un corpus sintético basado en parámetros; la brecha es un desplazamiento de gravedad de sintético a sintético, nunca un resultado de detección en campo. Asignado a la matriz de verificación comprobada por máquina (<c7/>, invariante Validated⇒ExternalDataset intacto).

# text
seg-441b67566d5a = <s1>Anterior</s1>Reproducibilidad

# text
seg-861984989d07 = <s1>Siguiente</s1>Estándares e interoperabilidad

seg-312673730e83 = Actualizado el 2026-10-29 para el motor { $version } ({ "92" } tipos de escenario, de <c1/>; nuevos en { $version }: <c2/>, <c3/>, <c4/>, <c5/> y <c6/>). 2026-10-22: motor { "0.39.0" }, { "87" } tipos, ningún tipo nuevo. 2026-10-19: motor { "0.38.0" }, { "87" } tipos (nuevos en { "0.38.0" }: <c7/>, <c8/> y <c9/>). 2026-10-18: { "84" } tipos (nuevo en { "0.37" }: <c10/>). 2026-10-16: { "83" } tipos (nuevos en { "0.36" }: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/> y <c18/>). 2026-10-10: motor { "0.35.0" }, { "75" } tipos, ningún tipo nuevo. 2026-10-09 y 2026-10-08: revisiones anteriores. 2026-10-04: la fila de señal de navegación anota la capa IQ de { "0.31.0" }. 2026-09-29: se añaden las filas de LEO-PNT, espectro, PNT del sistema solar / de cualquier cuerpo, campañas y salidas. Antes: alineado con la matriz de 27 filas de capacidades de la gran auditoría del 2026-06-02; fila de PNT de espacio profundo / Marte añadida en { "v0.17.0" }. Las incorporaciones de PNT cuántico (holdover de reloj sin GNSS <c19/>, presupuesto compuesto de navegación a estima cuántico-inercial <c20/>, compromiso de diseño de códigos de medición de distancia <c21/>, matriz de verificación verificada por máquina <c22/>) se integraron en las filas de Temporización, Sensores de PNT cuántico, Señal de navegación y V&V, cada una etiquetada como validada o modelada según su referencia independiente real.
