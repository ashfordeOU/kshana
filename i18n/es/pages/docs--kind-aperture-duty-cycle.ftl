# docs--kind-aperture-duty-cycle: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Fuente: <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (tipo de escenario)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Ciclo de trabajo de apertura: el reparto de tiempo entre navegación y comunicaciones que implica un plan de contactos para un conjunto de aperturas orientables. Toma un plan de contactos (una lista de ventanas aos_s/los_s de <c1/>, cada una de las cuales solicita navegación o comunicaciones — el mismo vocabulario aos_s/los_s que emite el predictor <c2/>), un número de aperturas y una POLÍTICA DE ARBITRAJE (prioridad de navegación por defecto, o prioridad de comunicaciones, o el primero en llegar sin apropiación), e informa del ciclo de trabajo de navegación, del de comunicaciones, del de inactividad y de la interrupción por sesión — el tiempo de contacto que una sesión solicitó y ninguna apertura atendió. Un barrido exacto de intervalos sobre los límites de las ventanas, de modo que las ventanas contiguas nunca compiten y ningún segundo de apertura se cuenta dos veces; los segundos de apertura de navegación, de comunicaciones y de inactividad se acumulan por separado y cierran frente a apertures*horizon_s. El informe indica la política resuelta, su definición completa y las definiciones de ciclo de trabajo y de interrupción, porque una cifra de ciclo de trabajo citada sin su política de arbitraje no es reproducible. Aritmética de planificación MODELLED: no se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión, no interviene en la decisión ningún volumen de datos, estado de búfer, balance de energía ni cierre de enlace, y las ventanas de contacto son entradas — su geometría es la que las produjo. No es un producto de planificación de segmento terreno.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Una ejecución de <c1/> se resume así: aperture-duty-cycle: { "6" } session(s) on { "2" } aperture(s) under navigation-priority -> navigation duty { "0.1167" }, communications duty { "0.2667" }, idle { "0.6167" }; { "0" } s of { "6900" } s requested lost to contention (MODELLED)

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-67c665d5c8c0 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-60f25ccdab6e = El ejemplo <c1/> establece, entre otros:

# text
seg-bf51947657c0 = navegación

# text
seg-b4ff1d640bdf = comunicaciones

# text
seg-2e78730d0737 = aperture*s

# text
seg-330cbcd04718 = fracción (adimensional)

# text
seg-0ef5875db338 = Etiqueta del resultado (la del motor): MODELLED — aritmética de planificación de aperturas sobre un plan de contactos suministrado: un barrido exacto de intervalos del reparto de tiempo entre navegación y comunicaciones y de la pérdida por contención por sesión bajo una política de arbitraje con nombre. No se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión,

# attr:alt
seg-a8b38ed8e029 = El gráfico que escribe el motor para scenarios/aperture-duty-cycle.toml, tipo de escenario aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Una ejecución toma un plan de contactos (una lista de ventanas aos_s/los_s, cada una de las cuales solicita a la apertura navegación o comunicaciones — el mismo vocabulario de ventanas que emite <c1/>, convertido por <c2/>), una apert

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Una ejecución toma un plan de contactos (una lista de ventanas aos_s/los_s, cada una de las cuales solicita a la apertura navegación o comunicaciones — el mismo vocabulario de ventanas que `passes::pre. Referencia independiente (InternalConsistency): Autoconsistencia interna, a partir de tres magnitudes calculadas con expresiones distintas en el mismo barrido y que luego deben cerrar. Los segundos de apertura de navegación, de comunicaciones y de inactividad se acumulan por separado — la inactividad a partir de (aperturas − |atendidas|) por intervalo elemental, nunca como un resto — y su suma se comprueba frente a aperturas × horizon_s, lo que un límite mal acotado, un doble c

# text
# c1: label
seg-a388c24fec99 = MODELLED — aritmética de planificación de aperturas sobre un plan de contactos suministrado: un barrido exacto de intervalos del reparto de tiempo entre navegación y comunicaciones y de la pérdida por contención por sesión bajo una política de arbitraje con nombre. No se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión, no interviene en la decisión ningún volumen de datos, estado de búfer, balance de energía ni cierre de enlace, y las ventanas de contacto son entradas — su (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = Aritmética de planificación MODELLED: no se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión, no interviene en la decisión ningún volumen de datos, estado de búfer, balance de energía ni cierre de enlace, y las ventanas de contacto son entradas — su geometría es la que las produjo. (catálogo de tipos de escenario (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = ALCANCE HONESTO: aritmética de planificación MODELLED sobre las ventanas suministradas. No se cobra ningún tiempo de giro, resintonización o cambio cuando una apertura cambia de servicio o de sesión; no interviene en la decisión ningún volumen de datos, estado de búfer, balance de energía ni cierre de enlace; y las ventanas de contacto son entradas -- su geometría es la que las produjo (el escenario <c1/> emite el mismo vocabulario aos_s / los_s). No es una planificación de segmento terreno (comentario del archivo de escenario, líneas { "18" } a { "24" })

# text
seg-0b7f8d86e5d5 = El ciclo de trabajo de apertura entre navegación y comunicaciones es MODELLED, no está validado: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Anterior</s1>aocs

# text
seg-5b4fd889fdff = <s1>Siguiente</s1>araim-reference-check
