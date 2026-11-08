# docs--kind-campaign: translations (es)

# text
seg-8784979d6569 = dBW

# text
# c1: docs/kinds/by-kind/campaign.md
seg-68a2bcb6eedd = Fuente: <c1/>

# text
# c1: campaign
seg-24ce6aee5e53 = <c1/> (tipo de escenario)

# text
seg-931a3d27c0f0 = Tipo de escenario del motor v{ $version }, familia <a1>Campañas</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-a07990e776cb = Campaña: tipos de escenario existentes compuestos en una sola ejecución, con cada número leído de una ejecución real del tipo de escenario nombrado. Cuatro secciones, en cualquier combinación. PHASES: una misión encadenada en una línea temporal compartida -- cada fase ejecuta uno o más escenarios (por ejemplo inhibición, luego suplantación, luego un reloj en holdover con un sistema de navegación inercial en inercia a su lado, luego una alarma de integridad, luego la recuperación), sus salidas se leen en canales con nombre (error de tiempo del reloj frente a su guarda, relación portadora-densidad de ruido frente al umbral de seguimiento, nivel de protección frente al límite de alerta, error de posición, satélites en seguimiento, indicadores de alarma) mediante un preajuste por tipo de escenario o mediante rutas de resultado explícitas, y se remuestrean sobre una malla común por retenedor de orden cero, con los límites de fase y los eventos; el estado se transmite por carry (un canal continúa desde el valor final de la fase anterior), handoff (un número de la fase anterior escrito en el escenario de esta fase) y end_at (una fase termina en un instante que calculó una ejecución, como el instante de detección de un monitor de suplantación). SWEEP: una malla sobre una a tres claves de escenario con puntos de cualquier tipo de escenario (un segmento de número entero indexa una matriz de tablas, como en system.2.sisre_m), con métricas leídas por ruta de resultado y, con ejecuciones por encima de una, un conjunto de Monte Carlo con semilla en cada nodo. MONTE_CARLO: la realización k se ejecuta con base_seed + k; cada métrica informa de la media, la desviación típica, los percentiles 5, 50 y 95 por rango más cercano y un intervalo de confianza bootstrap de semilla fija del { "95" } % sobre la media. COMPOSE: varios escenarios con valores compartidos (la potencia y la posición de un inhibidor escritas en un receptor marítimo y en uno de carretera), con un resumen combinado de mejor y peor caso. El resultado lleva un hash de campaña, un resumen sobre todos los resultados de los miembros y una entrada de unidades para cada número emitido; las exportaciones de interoperabilidad escriben cada escenario miembro que tiene geometría como su propio conjunto de archivos. Las identidades de composición se prueban: una campaña de una sola fase reproduce la ejecución independiente bit a bit, un conjunto de semilla fija es estable byte a byte, y con un reloj de ruido blanco de frecuencia la media del conjunto cae dentro del intervalo informado con la dispersión coincidente con sqrt(q_wf * tau). MODELLED: el arrastre aditivo y el retenedor de orden cero son decisiones de modelado, y cada fase lleva la etiqueta del tipo de escenario que la ejecutó.

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
# c2: jamming
seg-05e842f80dbb = Una ejecución de <c1/> se resume así: campaign 46aa07cb58fb | Jammer power sweep: availability and J/S against transmit power | sweep of <c2/>: { "13" } nodes over [jammer_power] | { "13" } member runs (MODELLED)

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-bf339fa14645 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
seg-abd3eac6da41 = El ejemplo <c1/> establece, entre otros:

# text
seg-c4f955d5f506 = disponibilidad

# text
# c1: scenarios/
seg-7bcf77278958 = { "22" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
seg-38faa927b2bd = lin

# text
seg-1a33a746eeee = Etiqueta del resultado (la del motor): composición MODELLED de tipos de escenario existentes. Cada número se lee de una ejecución real del tipo de escenario nombrado; el encadenamiento (arrastre aditivo de un canal a través del límite de una fase, retenedor de orden cero sobre la malla de la línea temporal, una fase terminada en un instante calculado) es una decisión de modelado, y cada fase lleva la etiqu

# attr:alt
seg-b2c7cd1f9712 = El gráfico que escribe el motor para scenarios/campaign-sweep-jammer-power.toml, tipo de escenario campaign

# text
seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect y el ejecutor de campañas: una tabla opcional [monitors] ejecuta los monitores de IQ en cada celda en la pasada única del ejecutor. Pruebas: <a1>iq_campaign.rs</a1>.

# text
seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada celda de una campaña con monitores conserva, por tipo de alarma y canal, el máximo del propio estadístico de prueba del monitor sobre cada ventana de evento indicada (positivo) y sobre t

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) y <c1/> en <c2/>, Python <c3/> y la herramienta MCP labfit (solo carpetas de campaña dentro de su directorio de trabajo): lee una carpeta de salida de <c4/> por su Pruebas: <a1>iq_labfit_followup.rs</a1>.

# text
# c1: campaign
seg-f16a176dc1f8 = <b>MODELLED</b> Las fases del tipo de escenario <c1/>: cada fase ejecuta uno o más escenarios de tipos de escenario existentes mediante run_toml, lee sus salidas en canales con nombre (error de tiempo del reloj y guarda, relación media efectiva portadora-densidad de ruido y umbral de seguimiento, v Pruebas: <a1>campaign_composition_reference.rs</a1>.

# text
seg-be831b52a339 = y { "4" } más en la matriz.

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Balance de enlace J/S geométrico, C/N₀ antiinterferencia, pérdida de enganche por satélite. Referencia independiente (InternalConsistency): ecuación del balance de enlace de C/N₀ antiinterferencia contrastada con una rederivación independiente en numpy (comparte la misma forma cerrada → InternalConsistency) más una caracterización de la degradación de C/N₀ de JammerTest-2024 real. { "0.30" } ronda { "2" }, bloqueado (sigue siendo MODELLED): no se ejecutó la comparación de la caída de C/N0 medida en JammerTest { "2024" } con una predicción del balance de enlace (preregistrada 6a66994b, dentro de { "3" } dB) porque la posición y el apuntamiento de la antena F8.1 en

# text
seg-59afd80736c5 = <b>PARTNER</b> No se proporciona — Kshana modela las prestaciones de la señal, no el hardware de carga útil ni de antenas. Referencia independiente (NoneKind): ninguna: una disciplina propiedad del socio, sin módulo ni prueba por diseño

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> El barrido del tipo de escenario <c1/> (de una a tres claves con puntos de cualquier tipo de escenario, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y la sec. monte_carlo. Referencia independiente (InternalConsistency): La forma cerrada del paseo aleatorio de fase bajo ruido blanco de frecuencia, de varianza q_wf tau (NIST Technical Note { "1337" }), para la maquinaria estadística, y la igualdad byte a byte con las ejecuciones independientes para la siembra. Comprueba la aritmética del conjunto sobre el propio modelo de reloj del motor, no sobre un conjunto de datos externo

# text
# c1: label
seg-c15b5ac32282 = Composición MODELLED de tipos de escenario existentes. Cada número se lee de una ejecución real del tipo de escenario nombrado; el encadenamiento (arrastre aditivo de un canal a través del límite de una fase, retenedor de orden cero sobre la malla de la línea temporal, una fase terminada en un instante calculado) es una decisión de modelado, y cada fase lleva la etiqueta del tipo de escenario que la produjo. (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-9e33dcc39c27 = MODELLED: el arrastre aditivo y el retenedor de orden cero son decisiones de modelado, y cada fase lleva la etiqueta del tipo de escenario que la ejecutó. (catálogo de tipos de escenario (<c1/>))

# text
# c1: jamming
seg-adcc6ea59840 = MODELLED: igual que el tipo de escenario <c1/>. (comentario del archivo de escenario, línea { "14" })

# text
seg-143f3f1cc521 = La resiliencia a la inhibición en entornos sin GNSS es MODELLED, no está validada: se comprueba frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-d1c11e493795 = Los barridos de parámetros y los conjuntos de Monte Carlo con semilla sobre cualquier tipo de escenario son MODELLED, no están validados: se comprueban frente a su propia identidad analítica o de forma cerrada — detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-edbda7aca5b9 = Página de familia: <a1>Campañas</a1>

# text
seg-cb91473bfdda = Página de tema: <a1>LEO-PNT.md</a1>

# text
seg-c4ed27a559df = Página de tema: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-774e035da605 = <s1>Anterior</s1>body-pnt

# text
seg-fadd92303a4d = <s1>Siguiente</s1>cislunar-arc-recovery

seg-a349aa76b0ed = PARTNER
