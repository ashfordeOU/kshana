# docs--kind-fusion: translations (es)

# text
seg-03442e4be82d = Hoja de datos del CSAC Microchip SA65 / SA.45s, sigma_y(1s)={ "3e-10" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = y { "4" } más en la matriz.

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Desviación de Allan / modificada / de Hadamard + identificación de ruido de ley de potencias con intervalos de confianza χ². Referencia independiente (ExternalDataset): NIST SP { "1065" } (Riley) / desviaciones de referencia de Stable32 en NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crecimiento del error de inercia en forma cerrada + holdover hasta el umbral; clases de reloj cuántico. Referencia independiente (ReferenceImpl): Recursión de covarianza de clock_state en varios pasos (comprobación cruzada en el mismo código base); el núcleo subyacente de varianza de inercia e inversión de holdover está validado externamente frente a scipy (véase «Clock-holdover coast-variance & threshold inversion»). Las cifras de holdover por clase con suelo de ruido rojo siguen siendo MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> Reloj de Kalman de 3 estados (fase/frecuencia/deriva) de van Loan, estabilizado de Joseph. Referencia independiente (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz por bloques de Van Loan { "1978" } — una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Consistencia entre implementaciones: la física del reloj y la calibración de Allan no están validadas externamente, por lo que esto sigue siendo MODELLED. { "0.30" } comparación externa, un hallazgo (sigue siendo MODELLED): en relojes finales de IGS de { "30" } s de { "11" } GPS Blo

# text
seg-e12f672ae71d = El holdover del reloj sin GNSS es MODELLED, no está validado: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = La estimación del estado del reloj de a bordo es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = La detección de spoofing es MODELLED, no está validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/fusion.md
seg-4de09fe367df = Fuente: <c1/>

# text
# c1: fusion
seg-53e498cffeba = <c1/> (tipo de escenario)

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-ec26df467b88 = PNT con fusión de sensores mediante un filtro de Kalman conjunto sobre las mismas entradas híbridas.

# text
# c1: scenarios/fusion-pnt.toml
seg-25708bf88728 = Una ejecución de <c1/> se resume así: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: coupled
seg-3d5cae65f093 = Campos opcionales: <c1/>

# text
# c1: scenarios/fusion-pnt.toml
seg-56bca36cabba = El ejemplo <c1/> establece, entre otros:

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-5d3f15c0688a = Acelerómetro de cuarzo de grado de navegación; ruido-deriva ilustrativo

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-6ddd8a067e26 = Acelerómetro de átomos fríos, bajo paseo aleatorio de velocidad a tau larga;

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e79eecc14bea = Acelerómetro de cuarzo de grado de navegación; i

# attr:alt
seg-c8a1c797f4b1 = El gráfico que escribe el motor para scenarios/fusion-pnt.toml, tipo de escenario fusion

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-46c0903ff7b5 = <b>VALIDATED</b> Recuperar un estado de época [r,v] a partir de distancias de estaciones en tierra mediante un corrector diferencial por lotes de Gauss–Newton y un filtro secuencial, sobre un modelo de fuerzas de dos cuerpos+J2 Pruebas: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

# text
seg-44f77aaf9d7e = <b>MODELLED</b> EKF de estado de error sobre { "15" } estados de INS, un reloj de receptor de dos estados y una ambigüedad de portadora flotante por satélite en seguimiento; pseudodistancia, fase de portadora y velocidad de distancia opcional de una constelación Walker SGP4 (tiempo de luz y Sagnac), Klobuchar y Pruebas: <a1>fusion_carrier_tc.rs</a1>.

# text
seg-509f93c7e9ce = <b>MODELLED</b> Tres escenarios gnss-ins sobre la biblioteca de trayectorias (un buque que zigzaguea a { "8" } m/s con una interrupción de cinco minutos; un tren por un desmonte de dos satélites y un túnel; una aeronave cuya interrupción abarca un viraje con alabeo de 25 grados) y el opcional del paquete Pruebas: <a1>gnss_ins_packs.rs</a1>.

# text
seg-e0633b308e4e = <b>MODELLED</b> Un filtro de Kalman apilado sobre posición, velocidad, fase y frecuencia del reloj alimentado con pseudodistancias que acoplan posición y reloj (actualizaciones en forma de Joseph que llevan la covarianza cruzada); una variante de 1 grado de libertad aumentada con un sesgo constante del acelerómetro Pruebas: <a1>fusion_coupled_filters.rs</a1>.

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
seg-a849735fcc6e = Página de tema: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c894aa7d9585 = <s1>Anterior</s1>ephemeris

# text
seg-d14a7850df1c = <s1>Siguiente</s1>gnss-ins
