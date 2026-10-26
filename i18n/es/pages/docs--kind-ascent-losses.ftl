# docs--kind-ascent-losses: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (catálogo de tipos de escenario (<c1/>))

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
# c1: docs/kinds/by-kind/ascent-losses.md
seg-5d7cf510f4e9 = Fuente: <c1/>

# text
# c1: ascent-losses
seg-23e7becab606 = <c1/> (tipo de escenario)

# text
seg-34d041d6bd9f = Ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" } (ascenso vertical, patada de cabeceo, empuje a lo largo de la velocidad), integrando las pérdidas por gravedad, resistencia, guiado y contrapresión y comprobando que el dv ideal menos las pérdidas coincide con la velocidad de agotamiento; max-Q, aceleración máxima y estado de agotamiento. MODELLED.

# text
# c1: scenarios/ascent-losses.toml
seg-cd6181de5e43 = Una ejecución de <c1/> se resume así: ascent-losses: ideal dv { "11290" } m/s, losses { "2359" } m/s (gravity { "2276" }, drag { "15" }, steering { "0" }, back-pressure { "67" }); burnout { "509" } km at { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

# text
# c1: stages
# c2: payload_kg
# c3: drag_coefficient
# c4: reference_area_m2
# c5: kick_altitude_m
# c6: kick_angle_deg
# c7: kick_duration_s
# c8: step_s
seg-58f9e8d24a73 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ascent-losses.toml
seg-ec4396f2fa76 = El ejemplo <c1/> establece, entre otros:

# text
seg-a44edb1eb84d = kg

# text
seg-37205a55d23c = m^{ "2" }

# text
seg-98151954f217 = false

# text
seg-68a37ebbc01e = Etiqueta del resultado (la del motor): MODELLED — ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de US76, con las pérdidas por gravedad, resistencia, guiado y contrapresión integradas y la identidad dv ideal menos pérdidas comprobada; C_D constante, sin rotación, sin tramo de inercia, sin más guiado que la patada de cabeceo

# attr:alt
seg-ccf2185b0b5e = El gráfico que escribe el motor para scenarios/ascent-losses.toml, tipo de escenario ascent-losses

# text
seg-3a3ee499961e = <b>MODELLED</b> Ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" } (densidad y presión), con una patada de cabeceo, empuje reducido por la contrapresión de la tobera, agotamientos de etapa en s

# text
seg-cac91718c4e1 = <b>MODELLED</b> Ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. de { "1976" } (densidad y presión), con una p. Referencia independiente (InternalConsistency): Autoconsistencia interna: la identidad exacta velocidad de agotamiento = suma de Isp g0 ln(m0/mf) menos las cuatro pérdidas integradas (residuo inferior a { "1e-6" } m/s), la ecuación de Tsiolkovski en una combustión vertical en vacío con la gravedad como única pérdida, y las presiones a nivel del mar y en la tropopausa de US76. LO QUE NO ES: no se han comparado las pérdidas de ningún vehículo publicado; sin rotación terrestre, tramo de inercia, estrangulamiento ni guiado más allá de la patada; C_D constante; no una trayect

# text
# c1: label
seg-906f001cd9ea = MODELLED — ascenso plano con viraje por gravedad de un vehículo de varias etapas sobre una Tierra esférica sin rotación a través de US76, con las pérdidas por gravedad, resistencia, guiado y contrapresión integradas y la identidad dv ideal menos pérdidas comprobada; C_D constante, sin rotación, sin tramo de inercia, sin más guiado que la patada de cabeceo (resultado <c1/>)

# text
seg-4c237f051651 = Las pérdidas por gravedad, resistencia, guiado y contrapresión del ascenso de lanzamiento son MODELLED, no están validadas: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-73148557c9a6 = <s1>Anterior</s1>araim-reference-check

# text
seg-3af9699f27a7 = <s1>Siguiente</s1>attitude-budget

# text
seg-f916c5a08595 = Pérdidas del ascenso con viraje por gravedad de un lanzador ILUSTRATIVO de dos etapas de queroseno/oxígeno (ningún vehículo real): ascenso vertical hasta { "1" } km, una patada de cabeceo de { "3" } deg durante { "10" } s y después empuje a lo largo de la velocidad. La ejecución integra las pérdidas por gravedad, resistencia, guiado y contrapresión y comprueba que el dv ideal menos las pérdidas es igual a la velocidad de agotamiento. MODELLED: plano, Tierra sin rotación, C_D constante, sin tramo de inercia, sin más guiado que la patada. (comentario del archivo de escenario, líneas { "1" } a { "5" })
