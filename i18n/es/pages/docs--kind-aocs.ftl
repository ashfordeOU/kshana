# docs--kind-aocs: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Fuente: <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (tipo de escenario)

# text
seg-7eff466eb018 = Control de actitud de una nave espacial: un giro de apuntamiento inercial de un cuerpo central rígido con tres o más ruedas de reacción equilibradas bajo realimentación MRP (L = -K sigma - P omega), con pares de rueda de norma mínima recortados al límite de cada motor, RK4 con retenedor de orden cero; opcionalmente cerrado sobre un EKF multiplicativo a partir de un giróscopo simulado (paseo aleatorio de ángulo y de velocidad) y un seguidor de estrellas. Informa del tiempo de asentamiento, del error de apuntamiento final y máximo, de la velocidad y el par máximos de las ruedas, de la fracción saturada, de la deriva del momento angular y, con el estimador, de su error de actitud y su NEES. El bucle de estado verdadero es VALIDATED frente a Basilisk { "2.9.1" }; el estimador es MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Una ejecución de <c1/> se resume así: aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
seg-2ad4d3f07a6a = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: duration_s
# c2: dt_s
# c3: sample_s
# c4: omega0_rad_s
# c5: pointing_threshold_deg
# c6: estimator
seg-ed0c5c6266d9 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/aocs-slew.toml
seg-a09eb69b36d7 = El ejemplo <c1/> establece, entre otros:

# text
seg-8b51cfcf5bd5 = N m

# text
seg-6876b0214e4c = N m s

# text
seg-8e4dea0df19e = kg m^{ "2" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-b054c73f22e5 = sin valor

# text
seg-6e22c97374b0 = Etiqueta del resultado (la del motor): ley de control y dinámica de ruedas VALIDATED (frente a Basilisk { "2.9.1" } en el bucle de estado verdadero); las entradas de esta ejecución son las propias del escenario — control de actitud con ruedas de reacción bajo realimentación MRP, apuntamiento inercial, sin ruido de sensor, sin fricción

# attr:alt
seg-08c624d5324d = El gráfico que escribe el motor para scenarios/aocs-slew.toml, tipo de escenario aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Control de actitud con apuntamiento inercial de un cuerpo central rígido con tres o más ruedas de reacción equilibradas: la ley de realimentación MRP L_r = -K sigma_BR - P omega_BR (Schaub y Junkins), con pares de motor de rueda de norma mínima G_s u = -L_r recortados al l Pruebas: <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> El EKF multiplicativo de Lefferts-Markley-Shuster: estados de error de actitud en ejes del cuerpo y de sesgo del giróscopo, propagación con la velocidad del giróscopo menos la estimación del sesgo y el ruido de proceso discreto de Farrenkopf (paseo aleatorio de ángulo y de velocidad), actualización con seguidor de estrellas

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Control de actitud con apuntamiento inercial de un cuerpo central rígido con tres o más ruedas de reacción equilibradas: la ley de realimentación MRP L_r = -K sigma_BR - P omega_BR (Schaub y J. Referencia independiente (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; la ejecución de ruedas de bsk como herramienta aparte, nunca enlazada ni incorporada al repositorio): cuerpo central de la nave, reactionWheelStateEffector (BalancedWheels, límite de par activado), simpleNav, inertial3D, attTrackingError, mrpFeedback (sin término integral) y rwMotorTorque con dt = { "0.1" } s y su RK4, frente a la implementación propia de Kshana en tres casos (tres ruedas ortogonales; una pirámide de cuatro ruedas; un caso de cuatro ruedas con saturación),

# text
seg-d7889856073b = <b>MODELLED</b> El EKF multiplicativo de Lefferts-Markley-Shuster: estados de error de actitud en ejes del cuerpo y de sesgo del giróscopo, propagación con la velocidad del giróscopo menos la estimación del sesgo y Farre. Referencia independiente (InternalConsistency): Autoconsistencia interna: el error de estimación normalizado al cuadrado del filtro frente a una verdad simulada con los mismos modelos de sensor sobre semillas de Monte Carlo, y la convergencia de las estimaciones de actitud y de sesgo. LO QUE NO SE HA HECHO: no se ha comparado ningún estimador externo ni datos de vuelo (Basilisk { "2.9.1" } no tiene módulo MEKF); los modelos de sensor son los de los manuales, sin desalineación, factor de escala ni efectos del campo de visión del seguidor de estrellas.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = El bucle de estado verdadero es VALIDATED frente a Basilisk { "2.9.1" }; el estimador es MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-c7ff0ddbd040 = La estimación de actitud con EKF multiplicativo a partir de un giróscopo y un seguidor de estrellas es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Página de tema: <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Anterior</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Siguiente</s1>aperture-duty-cycle
