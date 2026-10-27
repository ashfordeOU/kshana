# docs--kind-sweep: translations (es)

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Una ejecución toma un plan de contactos (una lista de ventanas aos_s/los_s, cada una de las cuales solicita a la apertura navegación o comunicaciones — el mismo vocabulario de ventanas que emite <c1/>, convertido por <c2/>), una apert

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> El barrido del tipo de escenario <c1/> (de una a tres claves con puntos de cualquier tipo de escenario, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y la sec. monte_carlo. Referencia independiente (InternalConsistency): La forma cerrada del paseo aleatorio de fase bajo ruido blanco de frecuencia, de varianza q_wf tau (NIST Technical Note { "1337" }), para la maquinaria estadística, y la igualdad byte a byte con las ejecuciones independientes para la siembra. Comprueba la aritmética del conjunto sobre el propio modelo de reloj del motor, no sobre un conjunto de datos externo

# text
seg-d1c11e493795 = Los barridos de parámetros y los conjuntos de Monte Carlo con semilla sobre cualquier tipo de escenario son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Tipo de escenario del motor v{ $version }, familia <a1>Relojes, temporización y holdover</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a8d92406e428 = Reloj óptico de red de estroncio, objetivo orientado al espacio sigma_y

# text
seg-5278ccdaf16f = <b>MODELLED</b> Crecimiento del error de inercia en forma cerrada + holdover hasta el umbral; clases de reloj cuántico. Referencia independiente (ReferenceImpl): Recursión de covarianza de clock_state en varios pasos (comprobación cruzada en el mismo código base); el núcleo subyacente de varianza de inercia e inversión de holdover está validado externamente frente a scipy (véase «Clock-holdover coast-variance & threshold inversion»). Las cifras de holdover por clase con suelo de ruido rojo siguen siendo MODELLED

# text
seg-e12f672ae71d = El holdover del reloj sin GNSS es MODELLED, no está validado: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Página de familia: <a1>Relojes, temporización y holdover</a1>

# text
seg-ee7dd15019d0 = Página de tema: <a1>CAMPAIGNS.md</a1>

# text
# c1: gnss-ssv
seg-0aae0574c5e6 = <b>MODELLED</b> Los barridos de disponibilidad del tipo de escenario <c1/>: por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y combinadas, la proporción de pares (usuario, época) con al menos una y al menos cuatro señales y la interrupción más larga, para un usuario sobre una esfera

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep.md
seg-de72ae48731d = Fuente: <c1/>

# text
# c1: sweep
seg-81c2da4650c9 = <c1/> (tipo de escenario)

# text
seg-e7ab7b55c969 = Barrido 1-D de estudio de compromisos sobre un parámetro del paquete de relojes.

# text
# c1: scenarios/sweep-clock-stability.toml
seg-0412c0dbfb75 = Una ejecución de <c1/> se resume así: barrido de holdover_s sobre classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } puntos, escala logarítmica) | cuántico 6600.000->{ "6600.000" } | clásico 2610.000->{ "250.000" }

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
seg-d2a441254bcd = Campos obligatorios: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scale
seg-2b8d8159bdaf = Campos opcionales: <c1/>

# text
# c1: scenarios/sweep-clock-stability.toml
seg-73c2e732b0c1 = El ejemplo <c1/> establece, entre otros:

# text
seg-f8a627a78bdb = Microchip SA.45s CSAC datasheet sigma_y(1s)={ "3e-10" }; q_wf is s

# attr:alt
seg-c784b8f22f12 = El gráfico que el motor genera para scenarios/sweep-clock-stability.toml, tipo de escenario sweep

# text
# c1: campaign
seg-cb00aca0268d = <b>MODELLED</b> Las secciones sweep del tipo de escenario <c1/> (de una a tres claves con puntos de cualquier tipo, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y monte_carlo: la realización k se ejecuta con base_seed + k; cada métrica indica media, desviación e Pruebas: <a1>campaign_composition_reference.rs</a1>.

# text
seg-1750fbfc4a99 = <s1>Anterior</s1>sweep-nd

# text
seg-de5468ac32fc = <s1>Siguiente</s1>telecom-timing
