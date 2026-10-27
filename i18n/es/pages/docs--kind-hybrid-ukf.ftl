# docs--kind-hybrid-ukf: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-7b2721b7588d = Tipo de escenario del motor v{ $version }, familia <a1>Sensores inerciales, de fusión y cuánticos</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-451a304052c4 = <b>MODELLED</b> Acelerómetro de interferómetro de átomos fríos a partir de primeros principios (k_eff·T², QPN). Referencia independiente (ExternalDataset): vectores numéricos publicados de artículos primarios de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, el suelo unilateral de la ASD de ruido de disparo dentro de ~{ "2" }× de cada instrumento publicado (los dispositivos reales llevan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. { "0.30" } ronda { "2" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente al medido por Gauguet et al.

# text
seg-9955b1b1c018 = El rendimiento de un sensor inercial cuántico es MODELLED, no está validado: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, por lo que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Página de familia: <a1>Sensores inerciales, de fusión y cuánticos</a1>

# text
seg-ea4498cc0324 = <b>VALIDATED</b> EKF de estado de error de 15 estados, con acoplamiento débil (validado en una conducción real con IMU/GNSS frente a NaveGo); un UKF de pseudodistancia/Doppler con acoplamiento fuerte y un reloj+pos acoplado. Referencia independiente (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, ejecutado como herramienta bajo GNU Octave, nunca enlazado): su ins_gnss de acoplamiento débil sobre su propia conducción real de vehículo terrestre con IMU/GNSS Ekinox, con ambas soluciones puntuadas frente a la trayectoria de referencia de Ekinox. Ambos filtros leen la misma entrada float32 de { "20" } Hz, y la configuración de Kshana se asigna mecánicamente a partir de los parámetros publicados del conjunto de datos. El RMS de posición horizontal y vertical de Kshana y su

# text
# c1: docs/kinds/by-kind/hybrid-ukf.md
seg-4b84d9846715 = Fuente: <c1/>

# text
# c1: hybrid-ukf
seg-d8da1a3f1798 = <c1/> (tipo de escenario)

# text
seg-c6edf89eb8d4 = UKF híbrido cuántico + clásico GNSS/INS fuertemente acoplado de 17 estados (MODELLED): { "15" } estados de error INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase + frecuencia) del motor de reloj de parámetros q, accionado por el modelo de error de CAI acotado. La figura de mérito es la autocoherencia del filtro (NEES + blancura de la innovación frente a los límites χ²), una afirmación de autocoherencia, NO una garantía de precisión en el mundo real. Solo simulación; sin TRL>{ "3" }, sin herencia de vuelo, sin validación externa.

# text
# c1: scenarios/hybrid-ukf.toml
seg-d43a562eb9c2 = Una ejecución de <c1/> se resume así: escenario e8be19a6199e | hybrid-ukf (17 estados, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | reloj q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 en [10.12,{ "14.04" }] | NEES 7.11/8 en [6.48,{ "9.68" }] | CONSISTENT | asistido 0.4m -> deriva 7.7m en 120s | autocoherencia, no precisión

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
seg-be1b25b8551d = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: residual_accel_bias_m_s2
# c2: speed_m_s
# c3: sigma_pr_m
# c4: sigma_rr_mps
# c5: consistency_seeds
# c6: q_factor
# c7: r_factor
seg-139800576fb7 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/hybrid-ukf.toml
seg-40773fa1ab5f = El ejemplo <c1/> establece, entre otros:

# text
seg-5e9c8b22ed24 = Acelerómetro interferométrico de átomos fríos (Rb-87 D2); brackete

# text
seg-4c8e2caeba5b = Clase de oscilador de a bordo ultraestable/óptico, white-FM sigm

# attr:alt
seg-2968660fa880 = El gráfico que el motor escribe para scenarios/hybrid-ukf.toml, tipo de escenario hybrid-ukf

# text
seg-5719161d0b2a = <b>MODELLED</b> Rendimiento acotado (mejor/nominal/conservador) del interferómetro de átomos fríos: inestabilidad del sesgo, paseo aleatorio de velocidad/ángulo, estabilidad del factor de escala, interrogation. Referencia independiente (InternalConsistency): Coherencia interna: el rango de VRW citado se contrasta con la física de CaiAccelerometer::accel_asd y con el rango dinámico bruto calculado a partir del límite de ambigüedad de franja; las cifras son rangos MODELLED de una revisión de la literatura (needs_source_confirmation), ningún dispositivo está validado, sin halo de validación

# text
# c1: modelled_note
seg-8632967dc5f8 = SIMULACIÓN MODELLED. Autocoherencia del filtro (NEES + blancura de la innovación) con entradas de ruido de CAI y de reloj acotadas: una afirmación de autocoherencia, NO una garantía de precisión en el mundo real. No son resultados de campo ni de vuelo; sin TRL>{ "3" }, sin herencia de vuelo, sin validación externa. El hardware de CAI es propiedad del socio. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e55c8e2bc619 = UKF híbrido cuántico + clásico GNSS/INS fuertemente acoplado de 17 estados (MODELLED): { "15" } estados de error INS + corrección del sesgo del acelerómetro derivada de CAI + un reloj de 2 estados (fase + frecuencia) del motor de reloj de parámetros q, accionado por el modelo de error de CAI acotado. (catálogo de tipos de escenario (<c1/>))

# text
seg-b06538ca3a8c = UKF híbrido cuántico + clásico GNSS/INS fuertemente acoplado de 17 estados (MODELLED). (comentario del archivo de escenario, línea { "1" })

# text
seg-b5fc96916b4e = FIGURA DE MÉRITO: autocoherencia del filtro (NEES + blancura de la innovación), lo único que una simulación puede afirmar con honestidad sobre un estimador. Sobre un conjunto de Monte Carlo cuya verdad se genera exactamente a partir del ruido que el filtro supone, las medias agrupadas de NIS (blancura) y NEES deben caer dentro de sus bandas chi-cuadrado del { "95" }%. Esto es una afirmación de AUTOCOHERENCIA, NO una garantía de precisión en el mundo real. (comentario del archivo de escenario, líneas { "21" } a { "25" })

# text
seg-91afdc2d3ee2 = HONESTIDAD: todo lo que hay aquí es MODELLED / SIMULACIÓN. Las entradas de CAI y de reloj son valores acotados y representativos de la literatura, no hardware medido; el hardware de CAI y su Key-Person siguen siendo propiedad del socio. Sin TRL>{ "3" }, sin herencia de vuelo, sin validación externa. (comentario del archivo de escenario, líneas { "27" } a { "29" })

# text
seg-9b94bd3ce7df = Semillas de Monte Carlo sobre las que agrupa la referencia independiente de coherencia, y multiplicadores de desajuste del filtro. { "24" } semillas dan bandas chi-cuadrado de NEES basadas en ejecuciones ({ "8" }*{ "24" } DOF) lo bastante estrechas para distinguir un filtro ajustado de uno desajustado sin encarecer la ejecución. Fije q_factor / r_factor lejos de { "1.0" } para desajustar el filtro y ver cómo la barrera de coherencia lo rechaza (q_factor escala el ruido de proceso supuesto, r_factor el ruido de medición supuesto (comentario del archivo de escenario, líneas { "44" } a { "48" })

# text
seg-496b17a8d3b9 = Página temática: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Página temática: <a1>QUANTUM.md</a1>

# text
seg-963425965e64 = <s1>Anterior</s1>hybrid-optical-rf

# text
seg-437eb2e463b3 = <s1>Siguiente</s1>hybrid
