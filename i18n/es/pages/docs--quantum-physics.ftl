# docs--quantum-physics: translations (es)

# text
seg-5ad814c7ef9e = Notas

# text
seg-ad856ad710eb = Estado

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Fuente: <c1/>

# text
seg-5df810623ef1 = Física de sensores inerciales cuánticos (interferómetro de átomos fríos)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = Gran parte de Kshana alimenta sus sensores cuánticos con <b>coeficientes de Allan/ruido publicados</b>, es decir, consultas a hojas de datos (véanse <a1><c1/></a1> y <a2><c2/></a2>). Este documento trata el único lugar donde el motor calcula en cambio el rendimiento del sensor <b>a partir de principios fundamentales</b>: el modelo de acelerómetro de interferómetro de átomos fríos (CAI) de <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = Es deliberadamente una capa de física <em>mínima y honesta</em> (el suelo de ruido de proyección cuántica y el factor de escala del interferómetro), no un simulador completo de instrumento. Las secciones siguientes establecen con exactitud lo que se modela y lo que no.

# text
seg-64509c048541 = Lo que se modela

# text
seg-9fa6211c962e = Un interferómetro atómico de Mach–Zehnder de tres pulsos (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), la geometría estándar de un acelerómetro de átomos fríos:

# text
seg-3c513ef2fd3b = Magnitud

# text
seg-c0a13eeb346d = Fórmula

# text
seg-f838cd800e16 = Vector de onda efectivo

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Raman de dos fotones; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Fase del interferómetro

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Fuerza específica uniforme <c1/> a lo largo de <c2/>, separación de pulsos <c3/>. La escala con <c4/> es la principal palanca de sensibilidad (la microgravedad permite <c5/> largos).

# text
seg-f5b8b6c35dce = Ruido de proyección cuántica

# text
# c1: C
# c2: N
seg-8902ae6f313c = Por disparo, contraste de franjas <c1/>, número de átomos <c2/>: el límite de ruido de disparo de una lectura de población de dos puertos.

# text
seg-b95d4d1e45f0 = Sensibilidad de aceleración por disparo

# text
seg-c97f2fd35d48 = Ruido de fase referido a la aceleración.

# text
seg-cda09ac79409 = ASD (densidad espectral de amplitud) limitada por ruido de disparo

# text
# c1: T_c
seg-4d84800a3adb = Muestreo en cada tiempo de ciclo <c1/>; unidades (m/s²)/√Hz.

# text
seg-707ee648d1d5 = PSD (densidad espectral de potencia) de paseo aleatorio de velocidad

# text
# c1: AccelModel
seg-be0ac61054db = <b>El coeficiente que consume el <c1/> clásico</b>, ahora <em>derivado</em> y no aportado.

# text
seg-939e12a62637 = Decaimiento del contraste

# text
seg-05b0e7130b78 = Decoherencia durante la interrogación.

# text
seg-e64f748b35ab = Función de transferencia de vibraciones

# text
# c1: T²
seg-1754ac375452 = Respuesta aceleración→fase de la geometría ideal de tres pulsos (Cheinet et al. { "2008" }); límite de CC (frecuencia cero) <c1/>.

# text
seg-a710cfe4f533 = Fase limitada por vibraciones

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = PSD de aceleración plana <c1/> a lo largo del eje Raman; <c2/>.

# text
seg-13109dcfc52b = Aceleración limitada por vibraciones

# text
# c1: k_eff
seg-812990a8f058 = Por disparo; obsérvese que <c1/> se cancela: lo fijan solo la PSD de la plataforma y el tiempo de interrogación.

# text
seg-1c2764469718 = Ambigüedad de franjas

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, rango en celdas <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = La fase de franja se lee módulo 2π, de modo que una lectura aislada es inequívoca solo dentro de ±<c1/> y presenta alias cada <c2/> fuera de ese intervalo; el número de celdas no depende de <c3/> ni de <c4/>.

# text
seg-14bbedf1cd0d = Proyección sobre el eje

# text
seg-1ac2d4904b8a = El acoplamiento de primer orden es de rango 1: solo la componente a lo largo del haz entra en la fase.

# text
seg-7200f91fa19a = Fase de Coriolis / de rotación

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Sistemática de rotación para un vehículo en movimiento (Lan et al. { "2012" }); sesgo equivalente <c1/> = el término clásico de Coriolis.

# text
seg-9eaff8d90a83 = Fase de AC-Stark (desplazamiento lumínico) (AC: corriente alterna)

# text
seg-62630dc178e6 = Desplazamiento lumínico de un fotón; un desplazamiento <em>constante</em> se cancela por la simetría π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = Lo esencial es el cierre del lazo: <c1/> produce exactamente la PSD de aceleración blanca que el resto de la pila inercial ya integra en un error de velocidad/posición, de modo que el ruido de un sensor cuántico puede rastrearse hasta su número de átomos, su tiempo de interrogación y su contraste, y no hasta una línea de hoja de datos.

# text
# c1: T = 10 ms
# c2: N = 10⁶
# c3: C = 0.5
# c4: T_c = 0.5 s
# c5: Φ(1 g) ≈ 1.58×10⁴ rad
# c6: σ_Φ = 2×10⁻³ rad
# c7: σ_a ≈ 1.24×10⁻⁶ m/s²
# c8: n_a ≈ 0.09 µg/√Hz
# c9: S_a = 10⁻¹⁰ (m/s²)²/Hz
# c10: σ_a ≈ 5.8×10⁻⁵ m/s²
# c11: a_max ≈ 1.95×10⁻³ m/s²
# c12: Φ(1 g)
seg-e2363d639ccc = Una cifra resuelta (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) por disparo, y un suelo de ruido de disparo <c8/>. Con una PSD de vibración de plataforma modesta <c9/>, el suelo por disparo <b>limitado por vibraciones</b> es <c10/> (≈ { "5.9" } µg), unas { "46" } veces el suelo de ruido de disparo, lo que muestra por qué los dispositivos reales están limitados por las vibraciones y no por la proyección. El mismo interferómetro lee la fuerza específica sin ambigüedad solo dentro de <c11/> (≈ { "199" } µg), unas { "1 571" } celdas de resolución: <c12/> son miles de franjas, de modo que una lectura aislada de { "1" } g presenta alias.

# text
seg-c209b86f41d8 = Lo que NO se modela (y por qué el suelo es optimista)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = El suelo de ruido de disparo anterior es un <b>límite inferior fundamental</b>. Los instrumentos CAI reales quedan por encima: un gravímetro de laboratorio estático (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) unas { "60" } veces por encima del suelo calculado para sus parámetros, y una tríada de acelerómetros desplegada mucho más (el dispositivo de Exail citado en <c1/> indica { "22" } µg/√Hz). El término dominante, el <b>acoplamiento de vibraciones</b>, y las dos sistemáticas deterministas principales, la de <b>Coriolis/rotación</b> y el <b>desplazamiento lumínico AC-Stark</b>, están modelados (las filas anteriores de función de transferencia, Coriolis y desplazamiento lumínico), y también lo está el <b>rango dinámico de ambigüedad de franjas</b> (<c2/>, <c3/>, <c4/>, <c5/>). La brecha restante es lo que esta capa todavía no incluye:

# text
seg-c56d85817bc6 = <b>Aberración del frente de onda</b> y sistemáticas de apuntamiento del haz de orden superior: <b>no se modelan</b>.

# text
# c1: a_max
seg-525c382e813b = <b>Resolución de la ambigüedad de franjas</b>: el modelo establece el rango sin ambigüedad y devuelve la fase envuelta; no desenvuelve una lectura fuera de ±<c1/> (por ejemplo, con un acelerómetro clásico o con varios tiempos de interrogación), y acota el rango para una franja ideal de tres pulsos, sin términos de frente de onda ni de pérdida de contraste.

# text
seg-7555132ef2c6 = Correspondencia con la bibliografía: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (tecnología cuántica; GNSS: sistema global de navegación por satélite); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) para la sensibilidad y la función de transferencia del interferómetro (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) para el presupuesto de errores del gravímetro móvil; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) para el régimen de parámetros del acelerómetro espacial.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Este es el elemento de la <b>capa de física cuántica P2</b> de <c1/>: la fase de Mach–Zehnder, el ruido de proyección, el factor de escala, el <c2/> derivado, el decaimiento del contraste, <b>y la función de transferencia de acoplamiento de vibraciones / la varianza de PSD blanca</b> están implementados y con pruebas unitarias frente a cálculo manual (incluida una comprobación cruzada de integral numérica en banda de la función de transferencia frente a su resultado analítico en <c3/>).

# text
# c1: ImuKind::QuantumCai
# c2: cai
# c3: [accel_quantum.cai]
# c4: [accel_classical.cai]
# c5: inertial
# c6: [accel.cai]
# c7: hybrid-ukf
# c8: scenarios/hybrid-ukf.toml
# c9: scenarios/quantum-cai-coast.toml
# c10: wavelength_m
# c11: pulse_sep_t
# c12: T
# c13: atom_number
# c14: N
# c15: contrast
# c16: C
# c17: cycle_time_s
# c18: T_c
# c19: vibration_psd
# c20: q_va
# c21: [cai]
seg-42e8dc204be9 = El modelo también está <b>conectado a escenarios ejecutables</b>: un acelerómetro se resuelve como <c1/> cuando lleva una tabla <c2/> (<c3/> o <c4/> en un escenario <c5/>, <c6/> en un escenario <c7/>; <c8/> incluye uno, y el preajuste incluido <c9/> contrapone un CAI especificado por física a un acelerómetro de cuarzo de grado de navegación durante una interrupción de GNSS), con los campos <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) y un <c19/> opcional de la plataforma. Su PSD de paseo aleatorio de velocidad <c20/> se <b>deriva</b> entonces de la física del interferómetro (el suelo de ruido de disparo más, cuando se da una PSD de vibración, la contribución limitada por vibraciones en cuadratura) en lugar de aportarse como un coeficiente de hoja de datos. Los escenarios sin un bloque <c21/> son clásicos y no cambian ni un byte.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Las sistemáticas de Coriolis (<c1/> / <c2/>) y de desplazamiento lumínico AC-Stark (<c3/>) están implementadas y con pruebas unitarias (el sesgo equivalente de Coriolis se comprueba frente al <c4/> clásico; la fase AC-Stark, frente a su cancelación simétrica). Un barrido de deriva por tiempo de ciclo (<c5/>) informa de la deriva de posición por estima del CAI cuántico frente al tiempo de ciclo, el núcleo computacional de una comparación entre cuántico y clásico. El tipo de escenario <c6/> reutiliza el mismo acelerómetro mediante <c7/>, y <c8/> contiene una hoja de parámetros acotada (mejor, nominal, conservador) con una cita por cifra.

# text
seg-e2acbef44395 = Lo que muestran las comprobaciones externas.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> comprueba la función de transferencia frente a una integral numérica en el dominio del tiempo de la función de sensibilidad de Cheinet, <c2/> frente a longitudes de onda de línea publicadas, y el sesgo de Coriolis frente a <c3/>: coincidencias exactas de las formas publicadas. El suelo de ruido de disparo es una cota unilateral: para los parámetros publicados del gravímetro de cesio de Peters et al. { "2001" } y del gravímetro de rubidio GAIN de Freier et al. { "2016" } (arXiv:{ "1512.05660" }), el suelo modelado queda en o por debajo del ruido alcanzado por cada dispositivo y dentro de tres órdenes de magnitud de él (para GAIN, el suelo es { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz frente al { "9.6" }×{ "10" }⁻⁸ alcanzado, un factor de unos { "63" }). Eso es coherente con que los dispositivos reales estén limitados por vibraciones o por razones técnicas, pero es una cota, no una validación de un modelo de ruido de instrumento, de modo que la fila de la matriz sigue siendo MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Los trabajos de seguimiento restantes son las sistemáticas de frente de onda y de apuntamiento del haz, la resolución de la ambigüedad de franjas, una reproducción numéricamente exacta de los presupuestos Monte Carlo de CARIOQA-PMP y de las pruebas en vuelo sin GPS (GPS: Global Positioning System) de Boeing/AOSense (que necesitan las PSD de plataforma publicadas y la SNR por disparo, la relación señal/ruido), y un preajuste de comparación entre cuántico y clásico en el entorno de pruebas del navegador sobre <c1/>.

# text
seg-2452f58aedf0 = <s1>Anterior</s1>Modelos de sensores cuánticos

# text
seg-206d5a9704f0 = <s1>Siguiente</s1>API de Python
