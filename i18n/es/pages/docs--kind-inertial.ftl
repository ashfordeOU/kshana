# docs--kind-inertial: translations (es)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-b054c73f22e5 = sin valor

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = y { "4" } más en la matriz.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Balance de posición compuesto de sesgo + factor de escala + VRW + decaimiento de estabilidad a lo largo del holdover. Referencia independiente (ReferenceImpl): integración SDE de Monte Carlo independiente en numpy del ruido de aceleración blanca doblemente integrado (valida la varianza analítica del VRW con un algoritmo realmente independiente) + un ancla de valor publicado de Groves { "2013" } para los términos de sesgo y de factor de escala; las cifras del dispositivo CAI cuantifican hardware del socio y siguen siendo MODELLED

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La resiliencia de la navegación inercial a estima cuántica es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
seg-ca448daf5ec7 = nominal

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página temática: <a1>QUANTUM.md</a1>

# text
seg-7bebd09c614b = Acelerómetro de cuarzo de grado de navegación (Honeywell QA-2000 / G

# text
# c1: docs/kinds/by-kind/inertial.md
seg-cead54058894 = Fuente: <c1/>

# text
# c1: inertial
seg-783be547f01e = <c1/> (tipo de escenario)

# text
seg-bdedf28adc48 = Navegación inercial estimada de 1 DOF durante una interrupción de GNSS.

# text
# c1: scenarios/imu-deadreckoning.toml
seg-55b5599ef867 = Una ejecución de <c1/> se resume así: escenario fc9191cef784 | holdover cuántico 6600s p95 41.39m | holdover clásico 350s p95 30629.9m

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
seg-b05c3cb45c0d = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
seg-94fd9afe6f30 = Campos opcionales: <c1/>

# text
# c1: scenarios/imu-deadreckoning.toml
seg-bd021b5dff80 = El ejemplo <c1/> establece, entre otros:

# text
seg-8a9e52e38b05 = Triada de acelerómetros cuánticos híbridos de Exail: estabilidad del sesgo 6e-

# attr:alt
seg-873c402bb724 = El gráfico que el motor escribe para scenarios/imu-deadreckoning.toml, tipo de escenario inertial

# text
seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-41f3a20fadfb = <b>VALIDATED</b> Mecanización inercial strapdown NED WGS-84 con actitud en cuaterniones (con compensación de coning/sculling) que propaga un estado de navegación a partir de incrementos (Δθ, Δv) Pruebas: <a1>classical_strapdown_ins_reference.rs</a1>.

# text
seg-102d2e51460e = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos desde primeros principios (k_eff·T², QPN) Pruebas: <a1>quantum_inertial_sensor_reference.rs</a1>.

# text
seg-83fa50d4859a = <b>MODELLED</b> Rango dinámico de ambigüedad de franja Mach–Zehnder: la lectura de franja periódica de 2π fija una fuerza específica máxima sin ambigüedad a_max=π/(k_eff·T²), y el rango sin ambigüedad en celdas de resolución a_max/σ_a=π/σ_Φ es independiente del factor de escala óptico

# text
seg-89ec2e65cf4f = <b>MODELLED</b> Presupuesto de posición compuesto de sesgo + factor de escala + VRW + decaimiento de estabilidad durante el holdover Pruebas: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

# text
seg-bb07c8ee153f = <b>PARTNER</b> No proporcionado: solo modelos de rendimiento; el hardware de átomos fríos/relojes es del socio. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
seg-fab4c926e628 = <s1>Anterior</s1>impairment-eval

# text
seg-aa783749183d = <s1>Siguiente</s1>ins-trn-coast
