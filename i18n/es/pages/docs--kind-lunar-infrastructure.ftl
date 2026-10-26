# docs--kind-lunar-infrastructure: translations (es)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-619127334cf3 = Ninguna fila de la matriz nombra este tipo de escenario por su nombre; la etiqueta de su resultado es la propia del motor, más arriba.

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } escenarios incluidos usan este tipo de escenario; los demás están en <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/lunar-infrastructure.md
seg-e821670a8b55 = Fuente: <c1/>

# text
# c1: lunar-infrastructure
seg-56953faa67ae = <c1/> (tipo de escenario)

# text
# c1: study
seg-d0fb90f506c9 = Estudios MODELLED de la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, cinco estudios tras un único tipo de escenario seleccionado por <c1/>: od-consistency (determinación de órbita a bordo con Earth-GNSS en una NRHO o ELFO frente a una determinación de órbita radiométrica terrestre independiente, juzgadas por sus propias covarianzas sobre un Monte Carlo con semilla), carrier-phase (fase de portadora de doble diferencia conjunta superficie-orbitador y resolución de ambigüedades enteras con LAMBDA), frame-coestimation (una estación de superficie y orbitadores añadidos a la medición de distancia de estaciones terrestres para el datum de marco lunar de siete parámetros), space-tie (GNSS, VLBI y telemetría láser en una misma nave, precisión del enlace de marco frente al error del enlace local) y geodesy-sensitivity (información de Fisher de los números de Love lunares h2, k2, l2 y de la libración física a partir de telemetría láser, seguimiento de orbitadores, un gravímetro de superficie y un reloj de superficie). Un modelo restringido de tres cuerpos con simplificaciones declaradas; la numérica se contrasta con programas independientes y nada se compara con una medición de una magnitud lunar.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Una ejecución de <c1/> se resume así: lunar-infrastructure space-tie: { "4" } puntos de barrido sobre { "1" } arcos; sigma de traslación x de láser frente a GNSS { "1.0363" } m en el enlace local registrado

# text
# c1: study
seg-f2594b18e718 = Campos obligatorios: <c1/>

# text
# c1: seed
# c2: orbit
# c3: gnss
# c4: ground
# c5: monte_carlo
# c6: surface
# c7: llr
# c8: orbiter
# c9: gravimeter
# c10: clock
# c11: techniques
# c12: nominal
seg-4875c29c517c = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-7b33bdb70a30 = El ejemplo <c1/> establece, entre otros:

# text
seg-5fad84cbb2be = nrho

# text
seg-def582a1f2ca = Etiqueta de resultado (la del motor): MODELLED: un modelo restringido de tres cuerpos (masas puntuales de la Tierra y la Luna, sin Sol, sin armónicos del campo gravitatorio lunar) con simplificaciones declaradas y entradas ILUSTRATIVAS etiquetadas con sus fuentes públicas. La numérica se contrasta con programas independientes; nada se compara con una medición de una magnitud lunar

# text
seg-f3b4a80a739b = sin gráfico: el ejemplo no escribe ningún gráfico

# text
seg-35a4a7a25561 = <b>MODELLED</b> Determinación de órbita en una órbita de halo casi rectilínea (o una órbita elíptica congelada) a partir de dos tipos de datos independientes: pseudodistancias Earth-GNSS recibidas a bordo . Referencia independiente (ReferenceImpl): Un programa independiente de scipy/numpy integra las mismas ecuaciones variacionales (umbral O1). Nada se compara con una medición de una órbita lunar. La referencia independiente comprueba la numérica de fórmulas declaradas, no la física, por lo que la fila sigue siendo MODELLED. Modelo restringido de tres cuerpos: sin Sol, sin armónicos lunares, con el eje de rotación de la Tierra a lo largo de la normal de la órbita, entradas de receptor y de estación ILUSTRATIVAS.

# text
seg-32455bf5f804 = <b>MODELLED</b> Fase de portadora y código de Earth-GNSS de diferencia simple entre receptores en una estación de superficie lunar y un orbitador, con la diferencia de reloj por época perfilada fuera. Referencia independiente (ReferenceImpl): Una resolución independiente con numpy de las mismas ecuaciones normales a partir de las filas exportadas (Q3) y una enumeración entera por fuerza bruta (Q4). No se compara con ninguna medición de fase de portadora GNSS ni lunar. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Información de Fisher del datum de marco lunar de siete parámetros a partir de telemetría láser de estaciones terrestres a los cinco reflectores solos y con orbitador a estación de superficie ra. Referencia independiente (ReferenceImpl): Una diferencia finita independiente con numpy del modelo directo (F2). Nada se compara con soluciones reales de marco lunar. El factor está condicionado a la órbita conocida supuesta y a la sigma de distancia de { "1" } m. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Precisión de Cramer-Rao de los desfases de traslación, escala y rotación entre técnicas de los marcos GNSS, VLBI y de telemetría láser cuando una nave lleva todos. Referencia independiente (ReferenceImpl): Un sistema apilado independiente con numpy en el que las incógnitas de posición se eliminan mediante complementos de Schur explícitos (T3). No se compara con datos de GRASP, Genesis ni de otra misión. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED: un modelo restringido de tres cuerpos (masas puntuales de la Tierra y la Luna, sin Sol, sin armónicos del campo gravitatorio lunar) con simplificaciones declaradas y entradas ILUSTRATIVAS etiquetadas con sus fuentes públicas. La numérica se contrasta con programas independientes; nada se compara con una medición de una magnitud lunar, y nada de aquí es una afirmación sobre ninguna misión o sistema. Sin afiliación ni respaldo de ninguna agencia. Adviso (resultado <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = Estudios MODELLED de la órbita y la superficie de la Luna como infraestructura de navegación y geodésica, cinco estudios tras un único tipo de escenario seleccionado por <c1/>: od-consistency (determinación de órbita a bordo con Earth-GNSS en una NRHO o ELFO frente a una determinación de órbita radiométrica terrestre independiente, juzgadas por sus propias covarianzas sobre un Monte Carlo con semilla), carrier-phase (fase de portadora de doble diferencia conjunta superficie-orbitador y ambigüedad entera (catálogo de tipos de escenario (<c2/>))

# text
seg-4658f67623b5 = Escenario lunar-infrastructure de Kshana: space-tie. MODELLED; el diseño, las entradas y los umbrales están fijados en xval/lunar-infra/PREREGISTRATION.md (confirmado antes de cualquier ejecución). Allí se etiquetan las entradas ILUSTRATIVAS con sus fuentes públicas. (comentario del archivo de escenario, líneas { "1" } a { "3" })

# text
seg-f7257c25f137 = La determinación de órbita lunar: Earth-GNSS frente a radiométrica terrestre es MODELLED, no validada: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = La resolución de ambigüedades de fase de portadora lunar: superficie y orbitador es MODELLED, no validada: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = La coestimación del marco lunar: estaciones de superficie y orbitadores es MODELLED, no validada: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = La precisión del enlace de marco space-tie: GNSS, VLBI y telemetría láser colocalizados es MODELLED, no validada: se comprueba frente a una implementación independiente de esta misma base de código, independiente de la unidad bajo prueba pero sin autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Página temática: <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Anterior</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Siguiente</s1>lunar-integrity
