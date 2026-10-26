# docs--kind-attitude-budget: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-3068552e4ab4 = VALIDATED: las filas de la <a1>matriz de verificación</a1> que nombran este tipo de escenario.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Fuente: <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (tipo de escenario)

# text
seg-62c0dda9fc56 = Balance de errores de actitud y apuntamiento en 3 grados de libertad: el par de perturbación de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) y un balance de error de apuntamiento por raíz de la suma de cuadrados sobre contribuyentes con nombre de 1σ (ruido de sensor, vibración de ruedas de reacción, térmico, alineación) con el término dominante, para una altitud orbital y una dispersión de inercia del cuerpo. Balance AOCS escalar MODELLED — un complemento previo al hardware de Basilisk/42, no una simulación de bucle de control, de 6 grados de libertad ni de modos flexibles.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Una ejecución de <c1/> se resume así: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG torque { "7.04e-5" } N·m; pointing { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalar budget)

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-7cf112b1bcc3 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/attitude-budget.toml
seg-91ebbc89f9bb = El ejemplo <c1/> establece, entre otros:

# text
seg-c33e3cbba749 = arcsec

# text
seg-36df1bc710ab = alineación

# text
seg-d45f0ee66587 = kg*m^{ "2" }

# text
seg-3e3ce4fa89aa = N*m

# text
seg-0a78a7d6f93f = Etiqueta del resultado (la del motor): MODELLED — balance de errores AOCS escalar en 3 grados de libertad: par de perturbación de gradiente de gravedad en el peor caso + balance de apuntamiento por RSS; NO es una simulación de bucle de control / 6 grados de libertad / modos flexibles (un complemento previo al hardware de Basilisk/42, no un sustituto)

# attr:alt
seg-ad0e72e3b688 = El gráfico que escribe el motor para scenarios/attitude-budget.toml, tipo de escenario attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Par de perturbación de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) como el máximo sobre la actitud (la afirmación validada), más un balance de error de apuntamiento RSS sobre contribuyentes con nombre de 1σ con el término dominante (una suma cuadrática de números suministrados por quien llama Pruebas: <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Par de perturbación de gradiente de gravedad en el peor caso ((3/2)(μ/R³)ΔI) como el máximo sobre la actitud (la afirmación validada), más un balance de error de apuntamiento RSS sobre contribuyentes con nombre de 1σ . Referencia independiente (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), una implementación independiente en C++ del par de gradiente de gravedad con tensor completo: el máximo (3/2)(μ/R³)ΔI de Kshana es igual al par de Basilisk en la actitud de { "45" } deg con un error relativo inferior a { "1e-12" } (peor caso { "2.1e-15" }) sobre { "5" } altitudes y { "8" } tensores de inercia, y acota el par de Basilisk sobre { "2000" } actitudes aleatorias por caso; tolerancia fijada antes de la comparación. Afirmación validada: el gravity-

# text
seg-d2a6cf813e95 = <b>PARTNER</b> No se proporciona — Kshana es un simulador de prestaciones de navegación, no un fabricante de plataformas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
# c1: label
seg-3895121a5466 = MODELLED — balance de errores AOCS escalar en 3 grados de libertad: par de perturbación de gradiente de gravedad en el peor caso + balance de apuntamiento por RSS; NO es una simulación de bucle de control / 6 grados de libertad / modos flexibles (un complemento previo al hardware de Basilisk/42, no un sustituto) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = Balance AOCS escalar MODELLED — un complemento previo al hardware de Basilisk/42, no una simulación de bucle de control, de 6 grados de libertad ni de modos flexibles. (catálogo de tipos de escenario (<c1/>))

# text
seg-333fca11ac0c = ALCANCE HONESTO: balance de errores escalar MODELLED -- un complemento previo al hardware de Basilisk/42, NO una simulación de bucle de control / 6 grados de libertad / modos flexibles. El término de gradiente de gravedad se informa como un par (convertirlo en apuntamiento requiere una rigidez de control que corresponde a quien llama); el balance es la suma cuadrática de los contribuyentes de 1 sigma suministrados. Ejecución: kshana scenarios/attitude-budget.toml (comentario del archivo de escenario, líneas { "8" } a { "13" })

# text
seg-0e27fcef1499 = <s1>Anterior</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Siguiente</s1>body-pnt
