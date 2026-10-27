# docs--resilience-crosswalk: translations (es)

# text
seg-88372b30ed79 = Límite

# text
seg-aab745a65e76 = Módulo

# text
seg-ad856ad710eb = Estado

# text
seg-b03d56f501c3 = Tipo

# text
seg-4dbf41c0ec3b = Función

# text
seg-f472e43c1100 = Qué muestra

# text
seg-fa4468d4cb80 = Disponibilidad

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-fe4d868448ef = Fuente: <c1/>

# text
seg-d745715d5332 = Correspondencia con marcos de resiliencia PNT

# text
# c1: VALIDATED
# c2: MODELLED
# c3: resilience::diversity
# c4: resilience::stats
seg-aa1c24d63df5 = <b>Alineado con, no calificado ni aprobado.</b> Esto relaciona las capacidades simuladas de Kshana con los marcos publicados de resiliencia PNT (PNT: posicionamiento, navegación y temporización). Es una <em>autoevaluación derivada de simulación y alineada con</em> el Resilient PNT Conformance Framework (RPCF) v2.0 de DHS/CISA (DHS: Departamento de Seguridad Nacional; CISA: Agencia de Ciberseguridad y Seguridad de las Infraestructuras), el modelo Resist-Detect-Respond-Recover (RDRR) de RethinkPNT/Firesmith y los criterios de PNT resiliente de Yang Yuanxi. <b>No</b> es una calificación, una aprobación, una acreditación ni una declaración de compliance, y no lleva el respaldo de DHS, de IEEE (Institute of Electrical and Electronics Engineers) ni de ninguna autoridad. Cada fila está etiquetada con su estado de verificación honesto (<c1/> frente a una referencia independiente externa, o <c2/> a partir de principios fundamentales con pruebas); la propia capa de puntuación de resiliencia es <b>MODELLED</b>. Dos de sus núcleos llevan sus propias filas VALIDATED en la matriz de verificación: el núcleo de diversidad de inverso de Simpson (<c3/>) y el núcleo de estadísticos de orden por rangos (<c4/>); eso valida la aritmética, no las puntuaciones construidas sobre ella.

# text
# c1: src/resilience/
# c2: src/verification.rs
seg-652fcf3ec12d = El motor de puntuación (<c1/>) consume estas capacidades y emite subpuntuaciones por dimensión, nunca un único número fantasma. Véase <c2/> para las invariantes de estado comprobadas por máquina.

# text
seg-7a71de89a9fd = RPCF v2.0 de DHS: qué define el marco y las categorías de subpuntuación propias de Kshana

# text
seg-1985dbfe351d = El marco publicado (Resilient PNT Conformance Framework, Versión { "2.0" }, { "26" } de abril de { "2022" }, Dirección de Ciencia y Tecnología de DHS con CISA) define tres <b>funciones centrales</b> (sección { "5.2" }: Prevent, Respond, Recover), <b>niveles de resiliencia de { "0" } a { "4" }</b> (sección { "5.3" }) y <b>ocho requisitos mínimos numerados</b> repartidos entre los niveles { "1" } a { "4" } (sección { "5.3" }, reformulados en { "5.5" }), además de un enfoque de evaluación (sección { "8" }). <b>No</b> define una lista de siete categorías de técnicas. Una versión anterior de esta página y los comentarios del módulo de resiliencia describían siete «categorías de técnicas del RPCF»; las palabras Obfuscate y Diversify no aparecen en la v2.0. El texto de ese documento se volvió a leer el 2026-10-09 y no se encontró ninguna lista así.

# text
seg-178d1e119dce = Los siete nombres de subpuntuación que emite el motor de puntuación (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; «OLVIDMR» es nuestra regla mnemotécnica) son, por tanto, las <b>categorías de puntuación propias de Kshana</b>, conservadas por estabilidad de la salida. No son términos de DHS y las filas siguientes no dicen que DHS las exija. Cuando una categoría se corresponde con un requisito del marco, la última columna lo indica; cuando no, dice «ninguno».

# text
seg-5a9eb11bb965 = Categoría de subpuntuación de Kshana

# text
seg-e117e6f71845 = Capacidad de Kshana usada como impulsor

# text
seg-7677dafa7016 = Referencia más cercana del RPCF v2.0

# text
seg-27e0f6b39605 = Obfuscate

# text
seg-7327b9cbc106 = Técnica declarada × calidad de la fuente (sin impulsor conductual directo)

# text
seg-b63e61fa5fa2 = ninguno (una técnica de prevención; sección { "5.2" }, Prevent)

# text
seg-7ed4f2e21189 = Técnica declarada × calidad de la fuente

# text
seg-8579207ae2e5 = Verify

# text
seg-30b8cb030965 = AUC (área bajo la curva) del detector de perturbaciones en el escenario (monitores de spoofing, jamming y meaconing)

# text
seg-3d358c029f50 = Nivel { "2" }, requisito { "4" }; nivel { "3" }, requisito { "7" }

# text
seg-fcb8cb7d4c97 = Isolate

# text
seg-b3cd355743da = Nivel { "3" }, requisito { "6" }

# text
seg-ffa87d149a20 = Diversify

# text
seg-1282685a888b = Recuento de grupos independientes → diversidad efectiva de inverso de Simpson

# text
seg-f0dd4c4ef1c5 = Nivel { "4" }, requisito { "8" }; sección { "5.5" } (modo común)

# text
seg-2d91b12a9e56 = Mitigate

# text
seg-d183b552df76 = Disponibilidad bajo denegación

# text
seg-c337df73e231 = sección { "5.2" }, Respond

# text
seg-2da4df22d35d = Recover

# text
seg-85d7e3292549 = Inercia de holdover × umbral de degradación acotada

# text
seg-3aec9f076902 = Nivel { "2" }, requisito { "5" }; sección { "5.2" }, Recover

# text
seg-36958650abc0 = La correspondencia requisito por requisito con el marco real, con aquello a favor de lo cual las salidas de Kshana aportan evidencias y lo que queda sin cubrir, está en <a1>compliance/dhs-rpcf.md</a1>.

# text
seg-a085dd81c769 = Funciones RDRR de RethinkPNT / Firesmith

# text
seg-1b972717180b = Impulsor

# text
seg-6eaf161f8871 = Resist

# text
seg-6046a8914dc7 = Media de las subpuntuaciones Obfuscate/Limit/Isolate/Diversify

# text
seg-242e2c01ebc2 = Detect

# text
seg-45c8da13581f = Subpuntuación Verify (AUC del detector)

# text
seg-d29232baaaa6 = Respond

# text
seg-36ab7ce187e6 = Subpuntuación Mitigate (disponibilidad)

# text
seg-f98dc190541c = Holdover × umbral acotado; indicadores clave de rendimiento (KPI) de la cronología de resiliencia (detección/reacción/recuperación/pérdida)

# text
seg-e7190928bed6 = Criterios de Yang Yuanxi (el subconjunto al que se refieren las cifras de mérito de temporización y detección)

# text
seg-52836e247425 = Criterio

# text
seg-cbbe4c0baf3f = Fiabilidad

# text
seg-32d64f865b21 = Fracción de integridad del filtro

# text
seg-214372f29bd1 = Continuidad

# text
seg-ad5e76a596b8 = Holdover × umbral acotado

# text
seg-d92fb15e6dfa = Exactitud

# text
# c1: fom::positioning_performance
seg-0de1f9119e0f = Sustituto de temporización/calidad: <b>la exactitud en el dominio de la posición no forma parte de la puntuación</b>. <c1/> convierte una covarianza de posición y un HPL (nivel de protección horizontal) suministrados en CEP/SEP/2DRMS (error circular probable, error esférico probable, el doble de la raíz cuadrática media de la distancia), pero ningún escenario lo introduce en la puntuación de resiliencia

# text
seg-0aa925a09499 = MODELLED (solo en el dominio de la temporización)

# text
seg-6b661e6e4399 = Lo que esta correspondencia no afirma

# text
seg-51a48d0c718d = Ningún nivel RPCF conferido. El nivel asignado es una lectura <em>provisional derivada de simulación</em> con un umbral explícito de degradación acotada, no una madurez conferida.

# text
# c1: pvt
# c2: gnss-ins
# c3: leo-pvt
# c4: integrity
seg-df73b7c76ae5 = Ninguna exactitud en el dominio de la posición en la puntuación. Las subpuntuaciones de resiliencia se construyen a partir de métricas del dominio de la temporización y de detección. El motor sí calcula posiciones en otros lugares (los tipos de escenario <c1/>, <c2/> y <c3/>) y niveles de protección (el tipo de escenario <c4/>), pero la capa de puntuación no los consume.

# text
# c1: resilience::panel
seg-30a1b1a4dfea = Ninguna validación de campo. El panel de referencia y el conjunto de amenazas son reducciones sintéticas basadas en parámetros (<c1/>), declaradas como una limitación de primer orden.

# text
# c1: resilience::study
seg-83c465cd78b0 = El estudio complementario (<c1/>) existe precisamente para mostrar que colapsar estas dimensiones en una puntuación compuesta o en un nivel único produce una calificación cuya clasificación de arquitecturas es inestable ante ponderaciones y elecciones de amenaza defendibles; por eso esta correspondencia es una capa de medición que debe leerse por dimensión, no una nota única con la que calificar un producto.

# text
seg-32bd45dc031d = Escenarios de resiliencia y verticales que ejercitan estas capas

# text
seg-4e36adba1c55 = Los escenarios incluidos a continuación ejecutan la maquinaria de amenaza y recuperación a la que apuntan las filas de la correspondencia. Cada uno es una ejecución real del tipo de escenario indicado; todos son <b>MODELLED</b> (sin datos de campo).

# text
# c1: scenarios/
seg-44664e49d449 = Escenario (<c1/>)

# text
seg-44b8d7435bfd = PNT por capas bajo una amenaza compartida de jamming/spoofing: un Monte Carlo con semilla de denegación de capas, la fusión por varianza inversa de las supervivientes, la razón de pérdida total entre una sola capa y varias capas, y cómo la denegación correlacionada colapsa esa razón. Sus identidades entre Monte Carlo y forma cerrada y de fusión se comprueban con pruebas dentro del crate; el tipo de escenario no tiene fila en la matriz de verificación, de modo que aquí se califica MODELLED.

# text
seg-1734506ad287 = GNSS (sistema global de navegación por satélite) con jamming, una capa PNT de órbita terrestre baja (LEO) sostiene al usuario, con la integridad mantenida (tres fases en una misma cronología).

# text
seg-ff8cc090bdce = Un jammer contra un receptor de cuatro bandas; qué monitor de spoofing ve a qué spoofer.

# text
seg-0a93502a4a19 = El margen jammer-señal (J/S) a partir de la potencia recibida.

# text
seg-f2230253bdff = Detección de spoofing mediante coherencia de Doppler y de geometría de pasada.

# text
seg-d8ca900a8c14 = Temporización de estaciones base y de infraestructuras críticas en holdover, con tiempo LEO.

# text
seg-2a61d07bf177 = Usuarios de carretera, ferrocarril, marítimos, polares y de Internet de las cosas (IoT) con una capa LEO.

# text
seg-8723073167ad = Navegación por estima GNSS/INS (sistema de navegación inercial) a través de un cañón urbano y de jamming en una pequeña aeronave no tripulada.

# text
seg-6ee1ef707b20 = Durante cuánto tiempo un INS mantiene un buque o un tren dentro de su límite con el GNSS denegado.

# text
seg-7ca913e1729b = Un jammer marítimo; detección de un spoofer que arrastra la posición informada de un buque.

# text
seg-c49548e8393b = <s1>Anterior</s1>Correspondencia DO-316 / DO-229E

# text
seg-dedf3b53d31f = <s1>Siguiente</s1>Confianza del receptor
