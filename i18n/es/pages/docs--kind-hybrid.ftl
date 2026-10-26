# docs--kind-hybrid: translations (es)

# text
seg-03442e4be82d = Hoja de datos del CSAC Microchip SA65 / SA.45s, sigma_y(1s)={ "3e-10" }

# text
seg-f4cf8b629797 = Página de tema: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

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
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

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
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e0633b308e4e = <b>MODELLED</b> Un filtro de Kalman apilado sobre posición, velocidad, fase y frecuencia del reloj alimentado con pseudodistancias que acoplan posición y reloj (actualizaciones en forma de Joseph que llevan la covarianza cruzada); una variante de 1 grado de libertad aumentada con un sesgo constante del acelerómetro Pruebas: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = La resiliencia de la navegación inercial a estima cuántica es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
# c1: docs/kinds/by-kind/hybrid.md
seg-d91dc5633e67 = Fuente: <c1/>

# text
# c1: hybrid
seg-3b43d9c5624d = <c1/> (tipo de escenario)

# text
seg-22cd963c7042 = Integración final de PNT híbrido: reloj + IMU + ayuda de transferencia de tiempo.

# text
# c1: scenarios/hybrid-pnt.toml
seg-166be08d5276 = Una ejecución de <c1/> se resume así: escenario f33d734ecc51 | holdover de PNT cuántico 6600s (t 6600s/p 6600s) integridad { "0.998" } seguridad n/a (sin ataque) | holdover de PNT clásico 350s (t 6600s/p 350s) integridad { "1.000" } seguridad n/a (sin ataque)

# text
seg-5a70fcb097dc = Campos opcionales: ninguno

# text
# c1: scenarios/hybrid-pnt.toml
seg-f33278986879 = El ejemplo <c1/> establece, entre otros:

# text
seg-7bebd09c614b = Acelerómetro de cuarzo de grado de navegación (Honeywell QA-2000 / G

# text
seg-4f5fd1bc8a4e = Triada de acelerómetros cuánticos híbridos de Exail, estabilidad del sesgo { "5.8" }

# text
seg-49bff8dc860e = Acelerómetro de cuarzo de grado de navegación (H

# attr:alt
seg-52378a7b074c = El gráfico que el motor escribe para scenarios/hybrid-pnt.toml, tipo de escenario hybrid

# text
seg-a1810bbca337 = <b>MODELLED</b> Bidireccional/TWSTFT (Sagnac), vista común de GNSS, PPP; fluctuación del enlace→distancia. Referencia independiente (ExternalDataset): Magnitud de Sagnac comprobada frente a un VALOR PUBLICADO de autoridad: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Ec. { "1.29" }: una circunnavegación ecuatorial hacia el este acumula { "207.4" } ns (2ωA_E/c²); kshana reproduce { "207.386" } ns. Corroborado de forma independiente por geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que lleva la misma geometría 2Aω/c². El BIPM TWSTFT compuesto transponder/common-view/

# text
seg-a8beb8dfc757 = El presupuesto de errores de transferencia de tiempo es MODELLED, no validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, así que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a9c56fc9608a = Página temática: <a1>MACHINE-INPUTS.md</a1>

# text
seg-cc86939900fe = <s1>Anterior</s1>hybrid-ukf

# text
seg-53b95026bf54 = <s1>Siguiente</s1>impairment-eval
