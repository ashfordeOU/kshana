# docs--kind-leo-ppp: translations (es)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Página de tema: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Tipo de escenario del motor v{ $version }, familia <a1>Navegación en órbita terrestre baja</a1>. Orientativo: resultado de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta aquí es del motor o de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se obtiene una etiqueta: la sección Evidence del README).

# text
seg-c5478f572d21 = Página de familia: <a1>Navegación en órbita terrestre baja</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Fuente: <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (tipo de escenario)

# text
seg-32a570f1a4fa = Convergencia del posicionamiento preciso de punto (PPP) solo con GNSS y con aumento LEO: un filtro de Kalman extendido flotante sobre código y fase de portadora libres de ionosfera con las coordenadas de estación estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio proyectado por 1/sin(elevación) y una ambigüedad flotante por arco de satélite; el error de órbita y reloj precisos es blanco y común al código y a la fase de un satélite, por lo que cada satélite es una actualización correlacionada de dos filas en forma estabilizada de Joseph. Las mediciones se simulan con el mismo modelo con ruido con semilla sobre varios emplazamientos y semillas, y cada caso (primero solo GNSS, luego cada [[case]] de sistemas LEO, de cualquier constelación o preajuste) informa del tiempo de convergencia mediano (la primera época a partir de la cual los errores horizontal y vertical permanecen por debajo de los umbrales, { "10" } cm por defecto), la fracción convergida, las curvas de error medianas y la coherencia del filtro (el NEES de posición promediado por ejecución frente a la banda chi-cuadrado bilateral del { "95" }%). Opcionalmente junto a las cifras de latitud media publicadas de Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min para multi-GNSS acortados a { "7.0" }, { "3.2" }, { "2.1" } y { "1.3" } min con { "60" }, { "96" }, { "192" } y { "288" } satélites LEO. MODELLED: una comparación de coherencia de la tendencia, no una reproducción de las constelaciones, el ruido ni las estaciones de ese estudio; sin resolución de ambigüedades, saltos de ciclo, phase wind-up, mareas ni errores de producto correlacionados en el tiempo.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Una ejecución de <c1/> se resume así: convergencia de PPP a { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } ejecuciones por caso, { "96" } satélites GNSS solo GNSS { "0" } LEO mediana { "7.4" } min convergidas { "100" }% NEES medio { "3.13" } { "60" } LEO { "60" } LEO mediana { "4.8" } min convergidas { "100" }% NEES medio { "3.08" } { "96" } LEO { "96" } LEO mediana { "3.2" } min convergidas { "100" }% NEES medio { "2.74" } { "192" } LEO { "192" } LEO mediana { "2.7" } min convergidas { "100" }% NEES medio { "2.65" } { "288" } LEO { "288" } LEO mediana { "2.3" } min convergidas { "100" }% NEES medio { "3.06" } Li et al. { "2019" } (publicado, min) frente a modelado: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-aee2e93b2c20 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-3589a089c89d = El ejemplo <c1/> establece, entre otros:

# text
seg-4dbe1423bb57 = { "60" } LEO

# text
seg-85b65d194f0d = { "96" } LEO

# text
seg-2750ec8c218f = Etiqueta de resultado (la del motor): PPP flotante MODELLED (código y fase libres de ionosfera, reloj blanco, retardo húmedo de paseo aleatorio, ambigüedades flotantes por arco) sobre mediciones simuladas del mismo modelo; las cifras de Li et al. ({ "2019" }) son una comparación de tendencia, no una reproducción

# attr:alt
seg-225ef04c64af = El gráfico que el motor escribe para scenarios/leo-ppp-convergence.toml, tipo de escenario leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Un filtro de Kalman extendido de PPP flotante sobre código y fase libres de ionosfera: coordenadas estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio proyectado por 1/sin(elevación), una ambigüedad flotante por satél Pruebas: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Un filtro de Kalman extendido de PPP flotante sobre código y fase libres de ionosfera: coordenadas estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un rand. Referencia independiente (ExternalDataset): La prueba chi-cuadrado de NEES es una comprobación de coherencia interna (la verdad y el filtro comparten el modelo). La tendencia se compara con Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min acortados a { "7.0" }, { "3.2" }, { "2.1" } y { "1.3" } min con { "60" }, { "96" }, { "192" } y { "288" } satélites LEO. El escenario incluido da { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } y { "2.3" } min con i

# text
# c1: label
seg-302365809dbf = PPP flotante MODELLED (código y fase libres de ionosfera, reloj blanco, retardo húmedo de paseo aleatorio, ambigüedades flotantes por arco) sobre mediciones simuladas del mismo modelo; las cifras de Li et al. ({ "2019" }) son una comparación de tendencia, no una reproducción (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED: una comparación de coherencia de la tendencia, no una reproducción de las constelaciones, el ruido ni las estaciones de ese estudio; sin resolución de ambigüedades, saltos de ciclo, phase wind-up, mareas ni errores de producto correlacionados en el tiempo. (catálogo de tipos de escenario (<c1/>))

# text
seg-ba2fd25fdcff = Las cuatro constelaciones LEO de aquí son capas Walker delta representativas a { "1000" } km y { "60" } deg con { "60" }, { "96" }, { "192" } y { "288" } satélites; NO son los diseños del artículo, y el ruido, las estaciones y la definición de convergencia (errores horizontal y vertical por debajo de { "10" } cm hasta el final de la ejecución) son de este modelo. Por tanto, la comparación es una comprobación de coherencia MODELLED sobre la tendencia: la convergencia debe acortarse de forma monótona con t (comentario del archivo de escenario, líneas { "10" } a { "14" })

# text
seg-b641b835570c = La convergencia del posicionamiento preciso de punto solo con GNSS y con aumento LEO es MODELLED, no validada: una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, así que la capacidad sigue siendo modelada. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Anterior</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Siguiente</s1>leo-pvt
