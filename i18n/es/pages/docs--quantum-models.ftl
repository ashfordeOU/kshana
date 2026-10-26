# docs--quantum-models: translations (es)

# text
seg-638b8d451550 = Sensor

# text
seg-c35a20fa2529 = Madurez

# text
# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Fuente: <c1/>

# text
seg-39ab7752d86d = Modelos de sensores cuánticos: qué modela Kshana y qué no

# text
seg-daf0e0c0b16f = Kshana es un <b>simulador de resiliencia PNT (PNT: posicionamiento, navegación y temporización) con modelos de rendimiento de sensores cuánticos</b>. <em>No</em> es un simulador de física cuántica a partir de principios fundamentales. Esta página establece con exactitud lo que eso significa, para que el enfoque «cuántico» no pueda tomarse por algo más de lo que es.

# text
seg-6e504d97c41e = Lo que SÍ se modela

# text
seg-7884c9a7d883 = Cada sensor cuántico (y clásico) es un <b>modelo de errores</b> alimentado por parámetros publicados de presupuesto de ruido:

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Relojes</b>: PSD (densidades espectrales de potencia) de ruido blanco de frecuencia y de paseo aleatorio de frecuencia, un suelo de Allan de flicker (1/f) y deriva lineal, a partir de hojas de datos y artículos: el CSAC (reloj atómico a escala de chip) Microchip SA.45s; el reloj de red óptica de estroncio de Origlia et al. (arXiv:{ "1503.08457" }), un objetivo de orientación espacial; y los seis valores por defecto de <c1/> (CSAC; USO, oscilador ultraestable; DSAC, Deep Space Atomic Clock; TCXO, oscilador de cristal con compensación de temperatura; OCXO, oscilador de cristal con horno; RAFS, patrón de frecuencia atómico de rubidio), cada uno con una fuente citada. La desviación de Allan que producen se valida frente a las pendientes estándar de los tipos de ruido (véase <a1><c2/></a1>). Una curva de reloj óptico es real: la desviación de Allan medida del reloj de pinzas de ⁸⁸Sr de Norcia et al. (<em>Science</em> { "2019" }) se reproduce con el ajuste de ruido, una fila VALIDATED en <a2><c3/></a2>; las cifras de holdover construidas sobre la clase óptica siguen siendo MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Sensores inerciales</b>: en los paquetes <c1/> e híbridos, un presupuesto de errores de acelerómetro/giróscopo de un solo eje (1-DOF, un grado de libertad): paseo aleatorio de velocidad, paseo aleatorio angular, paseo aleatorio de aceleración y un suelo de Allan de inestabilidad del sesgo. En cambio, los tipos de escenario <c2/> y <c3/> ejecutan la mecanización strapdown de tres ejes de <c4/> (actitud en cuaternios, ecuaciones de navegación norte-este-abajo, un modelo determinista de errores de la IMU).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Los tipos de escenario cuánticos (<c1/>, <c2/>, <c3/>, <c4/> y <c5/>) se construyen a partir de estos modelos de errores y son MODELLED; <c6/>, <c7/> y <c8/> informan además de un registro de representatividad con las brechas hasta el vuelo.

# text
seg-05bbaddd4df6 = El motor es <b>neutral</b>: «cuántico» y «clásico» son la misma ruta de código con coeficientes distintos. El contraste en las cifras de mérito procede por completo de los parámetros de ruido de entrada, cada uno trazable hasta una fuente citada.

# text
seg-a1a067588520 = Lo que NO se modela

# text
seg-49a656243210 = En los sensores de reloj y de transferencia de tiempo no se simula nada de la física cuántica subyacente, solo la contribución neta de Allan, aportada como coeficiente. Para el <b>acelerómetro de átomos fríos</b> existe ahora una capa a partir de principios fundamentales (véase abajo); el resto de las sistemáticas sigue a nivel de coeficiente o sin modelar:

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = la <b>fase de Mach–Zehnder</b> del interferómetro atómico (<c1/>), el <b>ruido de proyección cuántica / de disparo</b> (<c2/>), el decaimiento del <b>contraste</b> del interferómetro, el <b>tiempo de ciclo</b> y la <b>función de transferencia de acoplamiento de vibraciones</b> (<c3/>, varianza de PSD blanca <c4/>) <em>se modelan ahora a partir de principios fundamentales</em> para el acelerómetro CAI (interferómetro de átomos fríos) (<c5/>), derivando la PSD de aceleración blanca <c6/> que consume el modelo clásico, junto con el <b>rango dinámico de ambigüedad de franjas</b> (<c7/>); véase <a1><c8/></a1>;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = la sistemática de <b>Coriolis</b> (<c1/> / <c2/>, el acoplamiento cruzado <c3/>) y la sistemática de <b>AC-Stark (AC: corriente alterna) / desplazamiento lumínico</b> (<c4/>, que se cancela con una desintonía simétrica de dos fotones) <em>se modelan ahora y tienen pruebas unitarias</em> en <c5/>;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = otros tres términos de error del CAI <em>se modelan ahora</em> como funciones de biblioteca en <c1/> ({ "0.36" }; MODELLED; todavía no son accesibles desde un tipo de escenario):

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>ruido de fase del láser Raman</b>: la ponderación por función de sensibilidad de Cheinet et al. ({ "2008" }), Ec. { "8" }, con la forma cerrada de ruido blanco de fase <c1/> (Ec. { "18" } a un ciclo) y una vía numérica para cualquier espectro de ruido de fase, además del ruido de frecuencia del láser que el retardo de retrorreflexión <c2/> no cancela (Le Gouët et al. { "2007" }, Ecs. { "9" } a { "11" });

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>curvatura del frente de onda</b> (solo desenfoque puro): el sesgo <c1/> de una nube térmica en un haz de radio de curvatura <c2/>, y su reducción cuando solo se cuentan los átomos situados dentro de un radio de detección (según Louchet-Chauvet et al. { "2011" } y Schkolnik et al. { "2015" }); no se modelan las aberraciones de orden superior;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>resolución de la ambigüedad de franjas</b>: la probabilidad de un índice de franja erróneo, <c1/>, para una ayuda de acelerómetro clásico (Lautier et al. { "2014" }) y para dos tiempos de interrogación (según Bonnin et al. { "2018" }), con la inversa que da el mayor ruido clásico para una probabilidad de fallo dada.

# text
# c1: τ_R
seg-f383678fb806 = Cada forma cerrada se comprueba frente a una vía numérica independiente (cuadratura en el dominio de la frecuencia, o un Monte Carlo sobre átomos o disparos) y frente a sus casos límite. La única cifra publicada que se reproduce es el nivel de ruido blanco de fase de Cheinet et al.: −{ "111" } dB·rad²/Hz con <c1/> = { "20" } µs da unos { "1" } mrad por disparo ({ "0.99" } mrad; el artículo deriva ese nivel con su Ec. { "17" }, flicker más blanco). Nada de esto es una medición de ningún instrumento;

# text
seg-150f8b9dfea4 = todavía <b>no</b> se modelan: las aberraciones de frente de onda de orden superior, el ruido de fase de un sistema láser concreto y la física a partir de principios fundamentales del lado del reloj;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = el paquete <c1/> de comparación cuántico frente a clásico es de un solo eje; la ruta strapdown de tres ejes solo se ejecuta en <c2/> y <c3/> (véase la nota sobre la IMU, unidad de medida inercial, en el README y en <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Completar la capa de física cuántica (alcanzar los términos de error del CAI desde un tipo de escenario, las aberraciones de frente de onda de orden superior y la física a partir de principios fundamentales del lado del reloj) es el trabajo P2 pendiente en <c1/>.

# text
seg-f09a31b33faa = Cifras de laboratorio en tierra frente a cifras calificadas para vuelo

# text
seg-dcef4579d2a9 = Las tablas de parámetros mezclan niveles de madurez; trátelas en consecuencia:

# text
seg-4f25895df32f = Cifra de origen

# text
seg-cef61e912cd0 = CSAC (p. ej., SA.45s)

# text
seg-4a016be9bca9 = hoja de datos σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = pieza comercial <b>desplegada</b> (existen variantes espaciales tolerantes a la radiación)

# text
seg-d38d20629ed6 = Reloj de red óptica de estroncio

# text
seg-1f0d3ec00922 = objetivo σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>laboratorio en tierra</b>: Kshana no conoce ningún rendimiento publicado en órbita para uno

# text
seg-ce1d7994188b = Acelerómetro de átomos fríos

# text
seg-b07fa6b8cebc = cifras de Allan de laboratorio publicadas

# text
seg-60864f168701 = laboratorio en tierra / cohete sonda

# text
seg-84a68aeb467d = Las cifras de reloj óptico en Kshana son <em>objetivos espaciales sobre hardware de tierra</em>. No existe ningún reloj óptico que haya volado; el README y la procedencia de los resultados lo dicen de forma explícita.

# text
seg-a204c1b854fa = Benchmark: ACES/PHARAO en la ISS (operativo desde abril de { "2025" })

# text
seg-fb88de1257bd = La carga útil <b>ACES/PHARAO</b> de la ESA (Agencia Espacial Europea) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite), un reloj de cesio enfriado por láser más un máser de hidrógeno activo, que opera en la ISS (Estación Espacial Internacional) desde abril de { "2025" }, es el benchmark operativo actual de estabilidad de reloj en órbita (estabilidad fraccional objetivo del orden de { "1e-16" } tras unos días de integración). El modelo de reloj óptico de Kshana representa un objetivo de laboratorio en tierra <em>más ambicioso</em> que el rendimiento de cesio/máser en vuelo de ACES; al comparar las cifras ópticas de Kshana con «lo que realmente ha volado», ACES/PHARAO es el punto de referencia honesto, y es un sistema de microondas/máser, no un reloj de red óptica.

# text
seg-9d2e850cb986 = Las cifras exactas de rendimiento en órbita de ACES deben citarse de los resultados publicados por la ESA a medida que se difundan; lo que importa aquí es la <em>brecha de madurez</em>, no una cifra concreta: las cifras ópticas de Kshana son objetivos, no rendimiento en vuelo.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1>: etiquetas <c2/> / <c3/> por parámetro.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1>: definiciones de cifras de mérito (FoM) y todas las abreviaturas.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1>: qué son y qué no son las FoM de integridad y de seguridad.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1>: el acelerómetro de átomos fríos a partir de principios fundamentales.

# text
seg-41ba2c8f70fe = <s1>Anterior</s1>Diseño de constelaciones

# text
seg-136fa589fed5 = <s1>Siguiente</s1>Interferómetro de átomos fríos
