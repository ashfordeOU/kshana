# docs--kind-launch-window: translations (es)

# text
seg-99ef7c1d552c = Tipo de escenario del motor v{ $version }, familia <a1>Análisis de misión, enlaces y operaciones espaciales</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Página de familia: <a1>Análisis de misión, enlaces y operaciones espaciales</a1>

# text
seg-b054c73f22e5 = sin valor

# text
seg-8e62cc4af6ea = Página de tema: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/launch-window.md
seg-1c385961d594 = Fuente: <c1/>

# text
# c1: launch-window
seg-e0990c5f14da = <c1/> (tipo de escenario)

# text
seg-7a4e6215a488 = Geometría de lanzamiento y ascenso de dos cuerpos: acimut(s) de lanzamiento (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, la bonificación hacia el este de la rotación terrestre, Δv de cambio de plano en dogleg cuando la inclinación objetivo es inferior a la latitud del emplazamiento, y el número de oportunidades de lanzamiento diarias. Geometría de Tierra esférica MODELLED (sin corrección del triángulo de velocidades de Tierra en rotación, sin modelo de pérdidas de ascenso/arrastre).

# text
# c1: scenarios/launch-window.toml
seg-e24b0ae723c7 = Una ejecución de <c1/> se resume así: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s de bonificación por rotación terrestre, { "2" } oportunidades/día (MODELLED)

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-6f955816b5c6 = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/launch-window.toml
seg-aaadee0743ee = El ejemplo <c1/> establece, entre otros:

# text
seg-58d26f083b8f = Etiqueta de resultado (la del motor): MODELLED: geometría de lanzamiento de dos cuerpos con Tierra esférica; el acimut es la relación geométrica sin(Az)=cos(i)/cos(lat) (sin corrección del triángulo de velocidades de Tierra en rotación, sin modelo de pérdidas de ascenso/arrastre)

# attr:alt
seg-9696283a95ae = El gráfico que el motor escribe para scenarios/launch-window.toml, tipo de escenario launch-window

# text
seg-38175030f689 = <b>MODELLED</b> Acimut(s) de lanzamiento de dos cuerpos (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, bonificación hacia el este de la rotación terrestre, Δv de cambio de plano en dogleg y oportunidades diarias, y, dados una época y filas IERS finals2000A, el emplazamiento

# text
seg-53bc589c7ed6 = <b>MODELLED</b> Acimut(s) de lanzamiento de dos cuerpos (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, bonificación hacia el este de la rotación terrestre, Δv de cambio de plano en dogleg a. Referencia independiente (InternalConsistency): Geometría de lanzamiento de trigonometría esférica de forma cerrada frente a anclajes de ejemplos resueltos publicados (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } launch-azimuth + Ch.6 plane-change; tests/launch_window_ascent_geometry_reference.rs). Estos reutilizan la misma forma cerrada que implementa kshana (una comprobación de paridad con valores publicados / de transcripción, InternalConsistency); dos cuerpos MODELLED, sin triángulo de velocidades de Tierra en rotación / ascenso / dra

# text
# c1: label
seg-12396619d3e5 = MODELLED: geometría de lanzamiento de dos cuerpos con Tierra esférica; el acimut es la relación geométrica sin(Az)=cos(i)/cos(lat) (sin corrección del triángulo de velocidades de Tierra en rotación, sin modelo de pérdidas de ascenso/arrastre) (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-715f1856bd37 = Geometría de Tierra esférica MODELLED (sin corrección del triángulo de velocidades de Tierra en rotación, sin modelo de pérdidas de ascenso/arrastre). (catálogo de tipos de escenario (<c1/>))

# text
seg-4e9a215e3918 = ALCANCE HONESTO: MODELLED. Solo acimut geométrico: sin corrección del triángulo de velocidades de Tierra en rotación (la bonificación se indica aparte para incorporarla), sin trayectoria de ascenso / pérdidas por arrastre / modelo de guiado. Geometría de pre-Fase A. Ejecución: kshana scenarios/launch-window.toml (comentario del archivo de escenario, líneas { "8" } a { "11" })

# text
seg-12332d181de4 = La geometría de ventana de lanzamiento y ascenso (análisis de misión) es MODELLED, no validada: se comprueba frente a su propia identidad analítica o de forma cerrada, lo que detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-1a3841380d88 = <s1>Anterior</s1>jamming

# text
seg-78411b85f301 = <s1>Siguiente</s1>leo-navmsg
