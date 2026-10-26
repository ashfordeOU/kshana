# docs--kind-cislunar-arc-recovery: translations (es)

# text
seg-debc2f07db78 = true

# text
seg-330cbcd04718 = fracción (adimensional)

# text
# c1: docs/kinds/by-kind/cislunar-arc-recovery.md
seg-8f21a5462b09 = Fuente: <c1/>

# text
# c1: cislunar-arc-recovery
seg-e4858b0a33c9 = <c1/> (tipo de escenario)

# text
seg-1f17ef6a853e = Tipo de escenario del motor v{ $version }, familia <a1>Lunar y cislunar</a1>. Consultivo: salida de análisis de una herramienta de investigación e ingeniería, no un equipo de navegación homologado ni un servicio de seguridad de la vida humana. Toda etiqueta de aquí es la del motor o la de la matriz de verificación; un tipo de escenario es MODELLED salvo que la matriz diga otra cosa (cómo se gana una etiqueta: la sección Evidence del README).

# text
# c1: independence
seg-f994c81583bf = Prueba de estimador independiente MODELLED del umbral de observabilidad de la longitud de arco cislunar. Ese umbral es una lectura de RANGO sobre la matriz de observabilidad ensamblada a partir de las filas ANALÍTICAS del jacobiano de distancia y de la matriz de transición de estado variacional ANALÍTICA, y su comprobación cruzada con el filtro de información de raíz cuadrada pliega esas mismas filas — una comprobación de consistencia entre dos máquinas numéricas, no una corroboración. Este tipo de escenario aporta el árbitro que faltaba: un estimador por lotes de mínimos cuadrados que RECUPERA realmente el estado inicial del jefe a partir de medidas simuladas, con las derivadas parciales de la medida tomadas como DIFERENCIAS FINITAS CENTRALES del modelo directo compuesto. No llama a ninguna fila jacobiana analítica, ni a ninguna STM variacional, ni a ninguna descomposición en valores singulares o propios, ni a ninguna tolerancia de rango, ni a ningún filtro de información de raíz cuadrada — una guarda de texto fuente en tests/cislunar_arc_recovery_reference.rs lo hace exigible — mientras que la dinámica (el mismo flujo CR3BP con RK4), las condiciones iniciales (la misma constelación corregida diferencialmente), el observable escalar y la malla de épocas se comparten deliberadamente y se nombran en el bloque <c1/> emitido, porque dos análisis de un mismo problema físico deben coincidir en la física para ser comparables. Dos criterios, cada uno barrido a lo largo de cinco décadas de su propio límite: RECUPERACIÓN SIN RUIDO (el error de estado final de cada ensayo con semilla es como mucho recovery_factor veces su desplazamiento a priori — el análogo del rango, sin tolerancia de valores singulares) y ESTIMABILIDAD DE MONTE CARLO (el error RMS de posición medido sobre un conjunto de ruido con semilla por debajo de un límite indicado — el análogo de la estimabilidad, medido en lugar de predicho). Admite el caso plano de cuatro estados y el espacial de seis estados, las familias DRO / halo L2 / NRHO L2, los observables de distancia y de velocidad de distancia, y una parametrización polar centrada en la Luna en la que la transformación se aplica al ESTADO y el modelo directo se vuelve a diferenciar allí. MEDIDO en la malla DRO plana publicada: el estimador recupera el estado de cuatro componentes a partir de { "0.782609" } h frente a las { "2.086957" } h del criterio de rango con rel_tol { "1e-6" } (razón { "0.375" }) — el umbral de rango NO está corroborado como límite de recuperabilidad — mientras que el límite de estimabilidad medido cae en la misma celda de la malla que el formal, { "5.739130" } h, y la curva de error medida reproduce el 1 sigma formal sobre { "21" } longitudes de arco con una razón de media geométrica de { "0.98" }. MODELLED: el diseño de la constelación, la malla de épocas, el único enlace con seguimiento, la magnitud del desplazamiento, el sigma de medida y los dos límites indicados. No es un producto de prestaciones de navegación certificado.

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-ada71f37b21b = Una ejecución de <c1/> se resume así: cislunar-arc-recovery | dro family, 4-state, { "4" } s/c, range observable, cartesian parameterisation | { "6.0" } h arc, { "24" } epochs (grid { "0.260870" } h), { "32" } trials, seed { "20260920" } | finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free recovery from { "0.782609" } h (factor { "1e-2" }) vs Gramian rank threshold { "2.086957" } h | Monte-Carlo estimability from { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) vs Gramian estimability { "5.739130" } h | end-of-arc RMS pos { "0.6026" } km

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-3d4a2773c32f = Campos opcionales: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/cislunar-arc-recovery.toml
seg-eb621f41dfbb = El ejemplo <c1/> establece, entre otros:

# text
seg-6d584e86deba = razón (adimensional)

# text
seg-f7f4d06e661f = cislunar-observability sobre el idéntico

# text
seg-a6cb7ed2ff6d = Etiqueta del resultado (la del motor): prueba de recuperación de longitud de arco cislunar MODELLED (corroboración con estimador independiente del umbral de observabilidad P6). Núcleo VALIDATED: el estimador es el corrector por lotes de Gauss-Newton ponderado preexistente del crate (crate::batch_ls), cuya matriz de diseño es una DIFERENCIA FINITA CENTRAL del modelo directo compuesto

# attr:alt
seg-2fe411ae2153 = El gráfico que escribe el motor para scenarios/cislunar-arc-recovery.toml, tipo de escenario cislunar-arc-recovery

# text
seg-99dd8cc0e3ef = <b>MODELLED</b> Un estimador por lotes de mínimos cuadrados que RECUPERA el estado inicial del jefe a partir de medidas intersatélite simuladas sobre prefijos crecientes de la misma malla de épocas que usa la tabla de rango frente a arco, con las derivadas parciales de la medida tomadas como diferencias finitas centra Pruebas: <a1>cislunar_arc_recovery_reference.rs</a1>.

# text
seg-67aab2162719 = <b>MODELLED</b> Un estimador por lotes de mínimos cuadrados que RECUPERA el estado inicial del jefe a partir de medidas intersatélite simuladas sobre prefijos crecientes de la misma malla de épocas. Referencia independiente (ReferenceImpl): Un estimador separado de este código base con un algoritmo distinto y una ruta de código disjunta: Gauss-Newton ponderado no lineal con derivadas parciales por diferencias finitas, cuyo veredicto se lee como un error de recuperación de estado medido en km y mm/s. No tiene ninguna expresión en común con la vía de rango y covarianza del gramiano, y la separación está IMPUESTA por una guarda de texto fuente en lugar de afirmarse. MEDIDO en la malla DRO plana publicada: el

# text
# c1: label
seg-7be582874f98 = Prueba de recuperación de longitud de arco cislunar MODELLED (corroboración con estimador independiente del umbral de observabilidad P6). Núcleo VALIDATED: el estimador es el corrector por lotes de Gauss-Newton ponderado preexistente del crate (crate::batch_ls), cuya matriz de diseño es una DIFERENCIA FINITA CENTRAL del modelo directo compuesto - no llama a ninguna fila jacobiana analítica de medida, ni a ninguna matriz de transición de estado variacional, ni a ningún valor singular o (resultado <c1/>)

# text
# c1: kshana kinds --json
seg-52fe686b1fdf = Prueba de estimador independiente MODELLED del umbral de observabilidad de la longitud de arco cislunar. (catálogo de tipos de escenario (<c1/>))

# text
# c1: kshana kinds --json
seg-48e6e57a0b40 = MODELLED: el diseño de la constelación, la malla de épocas, el único enlace con seguimiento, la magnitud del desplazamiento, el sigma de medida y los dos límites indicados. (catálogo de tipos de escenario (<c1/>))

# text
seg-75f275dcb2d2 = MODELLED: el diseño de la constelación, la malla de épocas, el único enlace con seguimiento, la magnitud del desplazamiento, el sigma de medida y los dos límites indicados. No es un producto de prestaciones de navegación certificado. (comentario del archivo de escenario, líneas { "33" } a { "35" })

# text
seg-ea82d9fd6506 = La corroboración con estimador independiente del umbral de longitud de arco cislunar es MODELLED, no está validada: se comprueba frente a una implementación separada de este mismo código base — independiente de la unidad bajo prueba, pero no autoridad externa. (matriz de verificación (docs/MODELLED-RATIONALE.md))

# text
seg-1c1eeb2dcaa0 = Página de familia: <a1>Lunar y cislunar</a1>

# text
seg-53d57e6dafa6 = <s1>Anterior</s1>campaign

# text
seg-fe3ecf4b55fe = <s1>Siguiente</s1>cislunar-observability
