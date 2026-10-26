# docs--kind-lunar-time-budget: translations (es)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-8f8871ac8a0f = Página temática: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Página temática: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-time-budget.md
seg-11f512367036 = Fuente: <c1/>

# text
# c1: lunar-time-budget
seg-f7cd4fcfc62d = <c1/> (tipo de escenario)

# text
seg-cac3a0bcbfc6 = Presupuesto de error de tiempo MODELLED de extremo a extremo del Tiempo Lunar Coordinado (LTC): los siete términos de error del LTC reunidos como curvas de error de tiempo x_i(τ) sobre toda una cuadrícula de tiempos de promediado, sumados en raíz cuadrática en x_Σ(τ), y el τ de CRUCE reloj-marco en el que el término creciente del reloj supera al término constante de realización del marco en tiempo real (por debajo de él el presupuesto está limitado por el marco, por encima, por el reloj): la respuesta honesta al artefacto de un único τ. Las pendientes en τ son de forma cerrada y comprobables analíticamente (reloj τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, suelos τ^{ "0" }, medida τ^{ "{" }-1/2{ "}" }) y las filas de reloj reproducen las especificaciones publicadas de reloj a un día (crate::clock_specs); las MAGNITUDES de los suelos del enlace de RF u óptico, de la realización del marco, del residuo relativista y de las efemérides son asignaciones de presupuesto modeladas (valores por defecto documentados, sustituibles por quien llama), no mediciones. La aportación es el τ de cruce reproducible, no una cifra por término certificada; no certificado para la medición del tiempo operativa.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Una ejecución de <c1/> se resume así: lunar-time-budget | reloj passive-h-maser | x_Σ(τ) de 7 términos en { "57" } puntos de τ ({ "1" }–{ "1e7" } s) | τ de cruce { "8.689e4" } s (x { "1.001e-9" } s) | suelo del marco { "1.001e-9" } s | reloj x({ "1" } d) { "0.995" } ns (MODELLED)

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-7cdc521303eb = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-time-budget.toml
seg-c050033b32c3 = El ejemplo <c1/> establece, entre otros:

# text
seg-eebd3e40d0b9 = Etiqueta del resultado (la del motor): presupuesto de error de tiempo del LTC de extremo a extremo MODELLED. Las pendientes en τ son de forma cerrada y comprobables analíticamente (reloj τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, suelos τ^{ "0" }, medida τ^{ "{" }-1/2{ "}" }) y las filas de reloj reproducen las especificaciones publicadas de reloj a un día; los suelos del enlace de RF u óptico, de la realización del marco, del residuo relativista y de las efemérides

# attr:alt
seg-56fe184f2a12 = El gráfico que el motor genera para scenarios/lunar-time-budget.toml, tipo de escenario lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Cada ejecución de lunar-time-budget emite una fila de cruce reloj-marco por clase de reloj frente a un único término de marco compartido, de modo que el reloj es la única variable de la comparación; cada fila lleva el cruce obtenido de dos maneras: por bisección a partir de la

# text
seg-fd52e493b6c2 = <b>MODELLED</b> El bloque opcional [time_lab] del escenario lunar-time-budget modela un reloj de estación de referencia lunar (por defecto la clase miniRAFS, o cualquier clase con nombre, o una ficha de dispositivo ajustada a puntos de estabilidad indicados) pilotado hacia el Tiempo Lunar Coordinado y Pruebas: <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Cada ejecución de lunar-time-budget emite una fila de cruce reloj-marco por clase de reloj frente a un único término de marco compartido, de modo que el reloj es la única variable de la comp. Referencia independiente (InternalConsistency): Dos cálculos distintos dentro del código de la misma magnitud, no uno reformulado: la bisección sobre la curva de ley de potencias de IEEE-1139 no sabe nada del tipo de ruido, mientras que la forma cerrada invierte algebraicamente el tipo dominante, de modo que un tipo de ruido mal clasificado o un intervalo mal acotado se manifiesta como una diferencia relativa no despreciable. Los cuatro valores también reproducen la tabla publicada del artículo con una precisión de media unidad de su último dígito impreso, pero esa tabla era su

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> El escenario lunar-time-budget publica sus salidas de tipo matriz en forma de tabla larga (índice de cuadrícula, tiempo de promediado, término) junto al informe, de modo que los siete por. Referencia independiente (InternalConsistency): Solo autoconsistencia: el total publicado se comprueba frente a la suma en raíz cuadrática de los términos del mismo archivo, y la curva emitida reproduce el p3_time_budget_curve.csv publicado en los { "57" } puntos. Ambas comprobaciones comparten las propias definiciones de términos de este motor, de modo que ninguna es independiente. El término del reloj se apoya en especificaciones de reloj publicadas, pero las MAGNITUDES de los suelos del enlace, del marco, relativista y de las efemérides son documentadas

# text
# c1: label
seg-8abdeb1a36e1 = Presupuesto de error de tiempo del LTC de extremo a extremo MODELLED. Las pendientes en τ son de forma cerrada y comprobables analíticamente (reloj τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, suelos τ^{ "0" }, medida τ^{ "{" }-1/2{ "}" }) y las filas de reloj reproducen las especificaciones publicadas de reloj a un día; las MAGNITUDES de los suelos del enlace de RF u óptico, de la realización del marco, del residuo relativista y de las efemérides son asignaciones de presupuesto modeladas (valores por defecto documentados, sustituibles por quien llama), no mediciones. La aportación (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = Presupuesto de error de tiempo MODELLED de extremo a extremo del Tiempo Lunar Coordinado (LTC): los siete términos de error del LTC reunidos como curvas de error de tiempo x_i(τ) sobre toda una cuadrícula de tiempos de promediado, sumados en raíz cuadrática en x_Σ(τ), y el τ de CRUCE reloj-marco en el que el término creciente del reloj supera al término constante de realización del marco en tiempo real (por debajo de él el presupuesto está limitado por el marco, por encima, por el reloj): la respuesta honesta al artefacto de un único τ (catálogo de tipos (<c1/>))

# text
seg-ca1763d4a416 = Honestidad: MODELLED. Las pendientes en tau son de forma cerrada y comprobables analíticamente (reloj tau^{ "{" }+1/2{ "}" } o tau^{ "{" }+{ "1" }{ "}" }, suelos tau^{ "0" }, medida tau^{ "{" }-1/2{ "}" }) y las filas de reloj reproducen las especificaciones publicadas de reloj a un día; pero las MAGNITUDES de los suelos del enlace de RF u óptico, de la realización del marco, del residuo relativista y de las efemérides son asignaciones de presupuesto modeladas (valores por defecto documentados, sustituibles por quien llama), no mediciones. La aportación es (comentario del archivo de escenario, líneas { "13" } a { "18" })

# text
seg-8f884949bdf1 = La tabla de cruce lunar por clase de reloj es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = La reproducibilidad del presupuesto de error de tiempo lunar es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Anterior</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Siguiente</s1>lunar-time-offset
