# docs--kind-body-pnt: translations (es)

# text
seg-5b561b4fd201 = Marte

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: docs/kinds/by-kind/body-pnt.md
seg-02b8d1f1b7df = Fuente: <c1/>

# text
# c1: body-pnt
seg-e28ba749a2a1 = <c1/> (tipo de escenario)

# text
seg-11e8c29ecb45 = Tipo de escenario del motor v{ $version }, familia <a1>Constelaciones, cobertura y geometría</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-e7dad1a1ecba = Posicionamiento en torno a cualquier cuerpo del sistema solar: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo central elegido por nombre (Marte, la Luna, Europa, Ganímedes, Titán y el resto del catálogo del sistema solar), que navega con pseudodistancias unidireccionales de una pequeña constelación de navegación Walker en torno al cuerpo (órbitas de dos cuerpos con la deriva secular J2 propia del cuerpo, un reloj de usuario desconocido) y, opcionalmente, una medida de distancia bidireccional de espacio profundo desde la Tierra, libre de reloj, cuya dirección y distancia proceden de las efemérides analíticas del sistema solar en cada época. Las líneas de visión quedan bloqueadas por la esfera media del cuerpo, y un usuario en superficie necesita además la máscara de elevación. Por época: relés a la vista, si la Tierra está por encima del limbo, el GDOP y el PDOP solo de la constelación (dilución de la precisión geométrica y de posición), la incertidumbre formal de posición de un sigma con y sin la fila de la Tierra, y el error de un ajuste de mínimos cuadrados de Gauss-Newton con semilla en cada caso; a lo largo de la ejecución: disponibilidad, visibilidad de la Tierra, PDOP mediano, error RMS y sigma formal mediano, además del tiempo de luz de la Tierra al cuerpo, el viaje de ida y vuelta, el retardo de Shapiro y la separación del Sol en la época. MODELLED: las órbitas de los relés, los niveles de ruido y el modelo de medida instantáneo son decisiones de modelado, no validadas frente a datos de navegación de una misión; las constantes del cuerpo son los valores publicados citados en body.rs, y la geometría de la Tierra hereda las etiquetas de las efemérides del sistema solar.

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-c90c1a79f88b = Una ejecución de <c1/> se resume así: Positioning around Mars — orbiter user, { "12" } relays at { "10000" } km, { "296" } epochs Earth light time { "338.3" } s one-way, { "676.6" } s round trip; Sun-Earth-body angle { "175.4" } deg availability: { "1.000" } constellation only, { "1.000" } with the Earth range (Earth in view { "0.811" }) median PDOP { "1.375" } ; RMS error { "1.883" } m constellation only, { "1.629" } m with the Earth range median formal sigma { "1.375" } m constellation only, { "1.304" } m with the Earth range

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-31bacf177d9c = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-3f1989254167 = El ejemplo <c1/> establece, entre otros:

# text
seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

# text
seg-753b1683fb7b = m^3/s^{ "2" }

# text
seg-81d4cd54bd62 = Etiqueta del resultado (la del motor): MODELLED: órbitas de relés de dos cuerpos con deriva secular J2, visibilidad geométrica, ruido gaussiano de distancia y un modelo de medida instantáneo en torno a un cuerpo a partir de las constantes publicadas; no validado frente a datos de navegación de una misión. La geometría Tierra-cuerpo hereda la etiqueta de las efemérides del sistema solar

# attr:alt
seg-6f341acbe994 = El gráfico que escribe el motor para scenarios/mars-orbit-pnt.toml, tipo de escenario body-pnt

# text
seg-dae4184bb004 = <b>VALIDATED</b> El tiempo de luz newtoniano unidireccional de cualquier cuerpo a cualquier otro, recibido en una época, resuelto con el resolvedor radiométrico de punto fijo del tiempo de luz (radiometric::light_time_solution, transmisor en su posición retardada) mediante solar_system::link_o Pruebas: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> El tipo de escenario <c1/>: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo elegido por nombre navega con pseudodistancias unidireccionales de una constelación de navegación Walker en torno al cuerpo (órbitas de dos cuerpos con la deriva secular J2 del cuerpo, un reloj de usuario desconocido

# text
# c1: body-pnt
seg-5c3f8ac041d3 = <b>MODELLED</b> El tipo de escenario <c1/>: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo elegido por nombre navega con pseudodistancias unidireccionales de una constelación de navegación Walker en torno al. Referencia independiente (InternalConsistency): Formas cerradas y autoconsistencia: la tercera ley de Kepler para el periodo del relé, el radio de la órbita y el radio de superficie mantenidos durante la ejecución, el hecho de que añadir una medida nunca aumente la incertidumbre formal, y que los errores con semilla concuerden con la covarianza. Las órbitas de los relés ignoran los terceros cuerpos (la atracción de Júpiter sobre los relés en torno a Europa no está modelada), el ruido es gaussiano en niveles indicados y el modelo de medida es instanta

# text
# c1: label
seg-64920deda9cd = MODELLED: órbitas de relés de dos cuerpos con deriva secular J2, visibilidad geométrica, ruido gaussiano de distancia y un modelo de medida instantáneo en torno a un cuerpo a partir de las constantes publicadas; no validado frente a datos de navegación de una misión. La geometría Tierra-cuerpo hereda las etiquetas de las efemérides del sistema solar. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-bcb5cbf9cbe3 = MODELLED: las órbitas de los relés, los niveles de ruido y el modelo de medida instantáneo son decisiones de modelado, no validadas frente a datos de navegación de una misión; las constantes del cuerpo son los valores publicados citados en body.rs, y la geometría de la Tierra hereda las etiquetas de las efemérides del sistema solar. (catálogo de tipos de escenario (<c1/>))

# text
seg-04cd882741e2 = MODELLED. Las órbitas de los relés, el ruido de distancia de { "1" } m y el modelo de medida instantáneo son decisiones de modelado; nada de esto está validado frente a datos de navegación de una misión. Las constantes de Marte son los valores publicados citados en src/body.rs. (comentario del archivo de escenario, líneas { "20" } a { "22" })

# text
seg-df6bae4c422e = El posicionamiento en torno a cualquier cuerpo del sistema solar con una constelación local y un enlace de espacio profundo desde la Tierra es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a4f1e7d2041e = Página de familia: <a1>Constelaciones, cobertura y geometría</a1>

# text
seg-670191cf797f = Página de tema: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Página de tema: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-a4c650a0eb7a = <s1>Anterior</s1>attitude-budget

# text
seg-96170e5c8e3f = <s1>Siguiente</s1>campaign
