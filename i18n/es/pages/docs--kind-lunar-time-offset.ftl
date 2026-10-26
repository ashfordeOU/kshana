# docs--kind-lunar-time-offset: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
seg-4d208b6c0eb8 = día

# text
# c1: docs/kinds/by-kind/lunar-time-offset.md
seg-64813e3da228 = Fuente: <c1/>

# text
# c1: lunar-time-offset
seg-000bb13909f1 = <c1/> (tipo de escenario)

# text
seg-7f3e13712f10 = Tasa relativista modelada del reloj Tierra-Luna (Tiempo Coordenado Lunar, LTC/TCL): la tasa secular LTC−TT a partir de la diferencia de potencial propio y del término cinético de la Luna, indicada con la banda publicada de { "56" }–{ "59" } µs/día, más el desfase acumulado a lo largo de un horizonte.

# text
# c1: scenarios/lunar-time-offset.toml
seg-9efcf3e1be04 = Una ejecución de <c1/> se resume así: lunar-time-offset | tasa secular LTC−TT { "57.04" } µs/día (banda { "56" }–{ "59" }) | potencial propio { "57.50" } cinético -0.46 | desfase @ { "1.00" } d = { "57.04" } µs

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-9367773c4889 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/lunar-time-offset.toml
seg-4731141e6aac = El ejemplo <c1/> establece, entre otros:

# text
seg-3843825d0733 = us

# attr:alt
seg-e9deb6ed41c1 = El gráfico que el motor genera para scenarios/lunar-time-offset.toml, tipo de escenario lunar-time-offset

# text
seg-982426693747 = <b>VALIDATED</b> Tasa de reloj relativista Tierra-Luna (LTC/TCL) + encadenamiento TT/TAI/UTC + conjunto. Referencia independiente (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; base del LTC de IAU/IAG LunaNet): el potencial propio de la superficie lunar L_m = { "3.13881e-11" } y el total secular de { "56.02" } µs/día coinciden como valores numéricos publicados; la velocidad geocéntrica de la Luna se contrastó con JPL DE440 (de440s.bsp mediante SPICE)

# text
seg-96b65f604cc2 = Honestidad: MODELLED, no certificado. La cifra principal en us/día depende de la referencia (geoide terrestre W0 frente a un selenoide lunar, la ventana de promediado temporal, correcciones centrífugas/J2 inferiores a us/día despreciadas); por eso una banda, y no una cifra única, es la salida honesta. Nada de esto está validado con exactitud absoluta inferior al nanosegundo ni certificado para la medición del tiempo operativa. El informe también da el desfase LTC-TT acumulado a lo largo del hori (comentario del archivo de escenario, líneas { "11" } a { "16" })

# text
seg-e4552368a6a7 = <s1>Anterior</s1>lunar-time-budget

# text
seg-777dc23bac6a = <s1>Siguiente</s1>lunar-vlbi-fim
