# docs--validation: translations (es)

# text
seg-70860389903a = Reloj

# text
seg-583dc9ff6178 = Biblioteca

# attr:aria-label, text
seg-d01db1c2710a = Referencia

# text
seg-619f89bf160c = Realización del marco de referencia lunar

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-2eb6d1b0483d = RAIM / ARAIM

# text
seg-da3532b1444d = SBAS / DO-229E

# text
seg-d3af26f389f5 = IONEX / Klobuchar

# text
seg-d6476863f862 = Capacidad

# text
seg-ad856ad710eb = Estado

# text
seg-d12d4565b01d = VLBI geodésico lunar, ruta de kernel

# text
seg-5ed34a5b402e = OD lunar conjunta multitécnica + reloj

# text
seg-4bcec6e2dd9f = Volumen de servicio de navegación lunar

# text
seg-c04a3591074c = Exportación de interoperabilidad lunar

# text
seg-20fee61b3107 = Biblioteca de modelos de error de dispositivos cuánticos

# text
seg-eaf341ff4522 = Navegación cuántica sin GNSS

# text
seg-75636f9419b2 = Limitaciones conocidas

# text
seg-04f69a0edb2f = tipo

# text
seg-9c0eb89a2fbe = Paquete

# text
seg-f63dd3d7aad4 = Fuente

# text
seg-638b8d451550 = Sensor

# text
seg-b03d56f501c3 = Tipo

# text
seg-35bf9a48e566 = Término

# text
seg-f3526b0d95f8 = Medido

# text
seg-7634c6f4b32c = Enlace

# text
seg-b966dd26caa6 = Conjunto de datos

# text
seg-4fe4920a3fa1 = Norma

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Fuente: <c1/>

# text
seg-028f26d1374e = <b>Sobre las tolerancias.</b> "Validado" significa a continuación que una prueba de calibración afirma que el estadístico simulado coincide con la relación de referencia dentro de una <b>compuerta exigida</b>, actualmente un <b>error relativo del { "20" }–{ "25" }%</b> (promediado sobre semillas) para las relaciones de Allan y de presupuesto de ruido. La coincidencia mediana observada suele ser mucho más estrecha (unos pocos por ciento), pero la cota <em>garantizada</em> es la compuerta, no la mediana. Donde aparece un número como "~{ "2" }%", es una observación típica, no la tolerancia exigida. Véase <a1>Afirmaciones frente a realidad</a1>.

# text
seg-94a480ed9ccb = La regla de promoción

# text
# c1: src/verification.rs
seg-a550784412a6 = Una fila de la matriz de verificación comprobada por máquina (<c1/>) es VALIDATED solo cuando una referencia independiente <b>ajena a Kshana</b> coincide con la implementación <b>dentro de una tolerancia declarada antes de ejecutar la comparación</b>, en una prueba que se ejecuta en la compuerta. Esta sección es el único lugar donde se escribe la regla; la matriz, la prosa de cada fila y las notas de versión remiten a ella.

# text
seg-5e14faed9f05 = Los tipos de referencia independiente aceptados

# text
seg-4297b6a1b385 = Qué cuenta

# text
seg-a42c0c36b37f = Ejemplos que ya están en la matriz

# text
seg-e39aeb132e03 = Datos medidos reales de la magnitud que afirma la fila: una observación del mundo físico, no una salida de un modelo.

# text
seg-e77977db9de1 = Los dos tercios reservados de un registro real de reloj de cesio; puntos normales archivados de telemetría láser lunar; la serie UTC(k) de la Circular T de la BIPM (Oficina Internacional de Pesas y Medidas); la tesela de terreno de SRTM (Shuttle Radar Topography Mission).

# text
seg-6325fe1fafaf = Una biblioteca o herramienta independiente de terceros que calcula una magnitud <b>definida de forma única</b> con las mismas entradas, donde la biblioteca implementa por sí misma el cálculo del dominio. La coincidencia entre bibliotecas es una comprobación genuina solo porque la magnitud tiene una única respuesta correcta.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, las distribuciones estadísticas de SciPy.

# text
seg-056adffae706 = Vectores de referencia, tablas o ejemplos de verificación publicados: números que una norma, una agencia o un texto de referencia imprimen para que se puedan comprobar las implementaciones frente a ellos.

# text
seg-991fb822e99c = Vectores de SOFA/ERFA (Standards of Fundamental Astronomy), los vectores de verificación de SGP4 de AIAA (American Institute of Aeronautics and Astronautics), los ejemplos de validación de la ITU-R (Unión Internacional de Telecomunicaciones, Sector de Radiocomunicaciones), el ejemplo desarrollado de ARAIM del Grupo de Trabajo C, JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Otras dos normas resuelven los casos límite. Ambas se adoptan para la versión { "0.30" }.

# text
seg-f5c6cf536ba1 = <b>P1, un valor desarrollado publicado.</b> Un valor desarrollado publicado, calculado con la misma forma cerrada que implementa la fila, cuenta como un vector de referencia publicado cuando la publicación es independiente de Kshana y la comparación fija una tolerancia declarada. El valor debe estar impreso como número en la publicación (un valor leído de un gráfico cuenta solo si la incertidumbre de lectura queda dentro de la tolerancia declarada), y la prueba debe hacer que Kshana lo calcule a partir de las entradas de la publicación; comparar una constante con el documento del que se copió es una comprobación de transcripción, no P1.

# text
seg-0b043b552e76 = <b>P2, una biblioteca numérica independiente.</b> Una biblioteca numérica independiente, como numpy o LAPACK (Linear Algebra PACKage), que recalcula una magnitud de álgebra lineal definida de forma única con entradas declaradas, cuenta como biblioteca independiente. La biblioteca debe realizar la descomposición, la inversa, la resolución o el paso de mínimos cuadrados con su propio algoritmo, con entradas incluidas en el repositorio junto con el fixture; la afirmación validada es entonces el álgebra lineal sobre esas entradas, no las magnitudes físicas de un escenario representativo. Un script que reevalúa una forma cerrada escalar con aritmética de numpy es una segunda implementación nuestra, no P2.

# text
seg-b7911d589f7a = Condiciones que se aplican a todos los tipos: la referencia independiente no la escribe, ejecuta ni publica este proyecto (por tanto, la propia serie de artículos de este repositorio no es independiente de él); la tolerancia está en la prueba y se fijó antes de la primera comparación; una prueba condicionada a datos que se omite cuando faltan sus datos públicos lo indica al omitirse.

# text
seg-7e6057a2cad7 = Qué no cuenta

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>Nuestra propia segunda implementación</b>: una segunda ruta de código en este crate (<c1/>), o un script de este repositorio que reevalúa la misma forma cerrada.

# text
seg-d6efaf8399f9 = <b>La coincidencia con nuestra propia salida anterior</b>: valores de referencia (goldens), fijaciones de regresión, instantáneas o una tabla de los propios artículos de este proyecto.

# text
seg-4d0365b383e5 = <b>Una transcripción de las constantes de una cita</b>: comprobar un coeficiente, un preajuste, una cifra de hoja de datos o una hoja de parámetros frente al documento del que se copió.

# text
seg-3bf8025077fb = <b>Una decisión de diseño</b>: una asignación, una ponderación, un umbral, un límite de alerta o un escenario representativo. No hay verdad externa para una elección.

# text
seg-4f0aafd7166e = <b>Una identidad interna</b>: una integral numérica frente a su propia forma analítica, una ida y vuelta, una inversión, una prueba de propiedad o de monotonía.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Una ejecución de integración frente a un anfitrión real</b> (<c1/>): cargar un plugin en un servidor real de Signal K o de OpenCPN, o alimentar a un consumidor TCP con la salida de una compuerta real, y comprobar que el anfitrión acepta la entrada y muestra el estado esperado. Muestra que la instalación funciona. El anfitrión no es una referencia independiente para ningún valor que lleve la integración, de modo que no hay nada externo con lo que comparar y una fila así (la fila de integraciones marinas) es MODELLED, no VALIDATED. <c2/> es un tipo de referencia independiente propio, permitido solo en filas MODELLED: <c3/> en <c4/> falla si una fila VALIDATED lo lleva, y <c5/> ya exige que toda fila VALIDATED sea <c6/>.

# text
seg-a39a87c56a16 = <b>Verosimilitud con entradas reales</b>: datos reales usados solo como entrada, con aserciones de escala en lugar de una comparación con un valor externo.

# text
seg-db6f5d98b4ef = Una tolerancia elegida después de ver la comparación.

# text
seg-f4f18b7549df = Cómo se aplica la regla

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Toda fila VALIDATED declara, en <c1/> de <c2/>, en qué tipo se basa (Measured, Library, Reference, P1 o P2), la fuente independiente (citada del propio texto de referencia independiente de la fila) y la única prueba que lleva la comparación. Las pruebas unitarias junto a la tabla fallan cuando una fila VALIDATED no está declarada o está declarada dos veces, cuando una declaración nombra una fila que no es VALIDATED, cuando la fuente declarada no es la que nombra el texto de referencia independiente de la fila o es la propia Kshana, cuando la prueba declarada no es una que cita la fila, o cuando una fila P2 no nombra ninguna biblioteca numérica independiente. <c3/> exige entonces que la prueba declarada exista en disco como un <c4/> real que no esté ignorado. Lo que la máquina no puede comprobar es si la prueba nombrada compara frente a la fuente declarada; eso sigue siendo una lectura humana. Los recuentos por tipo no se escriben aquí: la fuente es la tabla.

# text
seg-e8ae3e380f40 = Filas VALIDATED existentes reexaminadas según la regla

# text
seg-1dd44545a67a = La regla se aplicó a las filas existentes además de a las promociones futuras.

# text
seg-38db7b6e7053 = <b>Filas P1 nombradas por el estudio de validación { "0.30" }, cada una respaldada:</b> Balance de enlace unidireccional (la tabla de control de diseño de banda X de Galileo de JPL Pub 82-76, reensamblada a partir de sus partidas hasta { "4.6e-3" } dB de pérdida en espacio libre); Formas cerradas de banda limitada para cualquier señal de distancia (el { "90.3" } por ciento de la potencia del lóbulo principal y la fluctuación coherente early-late publicada); Doppler máximo de un satélite de navegación en órbita terrestre baja (las cifras publicadas de Xona Pulsar X1 e Iridium); Doppler máximo que ve un usuario estático desde una órbita LEO o MEO (Tabla { "1" } del artículo de Pulsar, { "20" } valores); Doppler que debe gestionar un receptor en tierra desde un satélite de navegación LEO (las mismas cifras publicadas a partir de una órbita volada). Cada publicación es independiente de Kshana, imprime sus números, y la prueba declara su tolerancia.

# text
seg-8e38103d05d6 = <b>Otras filas que se basan en P1, halladas en el reexamen, cada una respaldada:</b> Compromiso de diseño de códigos de distancia (la correlación cruzada de Gold publicada de −{ "23.9" } dB); Tiempo coordenado lunar (Ashby y Patla { "2024" }, cuya comprobación cruzada de la velocidad de la Luna frente a DE440 es una comprobación de biblioteca); Densidades espectrales de potencia de señales de banda L de forma cerrada (valores Q de Kaplan y Hegarty); Retardo ionosférico de primer orden por banda (la razón de retardo de grupo de IS-GPS-200); Pesos del error de distancia de la señal en el espacio promediados globalmente (la tabla de Montenbruck, Steigenberger y Hauschild { "2018" }).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>Filas P2 nombradas por el estudio, cada una respaldada:</b> Información de Fisher y observabilidad de Cramér–Rao (numpy <c1/>/<c2/>); Identificabilidad del datum lunar; Calibre acoplado de marco y escala de tiempo lunares; Canalización autónoma de observabilidad de fallos en red libre (SVD de numpy/SciPy, descomposición en valores singulares). Cada una recalcula una magnitud de álgebra lineal definida de forma única con entradas incluidas en el repositorio mediante un algoritmo distinto del resolvedor de valores propios de Jacobi de Kshana.

# text
# c1: expm
seg-e9d01633d002 = <b>Otras filas que se basan en P2, halladas en el reexamen, cada una respaldada:</b> Derivación de prioridades MCDA (análisis de decisión multicriterio) (el vector propio del AHP, proceso analítico jerárquico, con SciPy/LAPACK; la tabla de Índice Aleatorio que también reproduce es una transcripción y no se cuenta); Varianza de deriva en holdover de reloj (<c1/> de SciPy de la matriz aumentada de Van Loan); Realización del marco de referencia lunar (una resolución de Umeyama por SVD de numpy); Formación de haz CRPA (antena de patrón de recepción controlado) (resolución compleja de LAPACK); Núcleo del nivel de protección ARAIM lunar (la inversa LU de RTKLIB con cuantiles de SciPy); Coherencia lunar de marcos y dinámica entre proveedores (un ajuste de mínimos cuadrados por SVD de numpy de tres efemérides publicadas).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>Señaladas en la primera pasada, respaldadas de nuevo en la ronda { "2" } de la ejecución { "0.30" }.</b> Se señalaron tres filas como no respaldadas por la regla escrita. Cada una se basa ahora en una comparación preregistrada antes de obtener su fixture, de modo que ninguna fila queda señalada; una prueba unitaria junto a <c1/> fija la lista (ahora vacía).

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Integridad (RAIM/ARAIM/SBAS).</b> Las pruebas citadas solo afirmaban antes verosimilitud con geometría real del IGS (Servicio Internacional de GNSS). La fila se basa ahora en tres referencias independientes de biblioteca: la separación de soluciones de hipótesis múltiples de ARAIM del Airborne Design Document v4.2 frente a Stanford MAAST para ARAIM { "2" } ({ "270" } casos reales, peor diferencia de VPL de { "2.2e-3" } m frente a { "0.05" } m); la detección y exclusión de RAIM de instantánea frente a <c1/> de RTKLIB ({ "2016" } de { "2016" } decisiones idénticas) con el nivel de protección por pendiente; y los niveles de protección L1 de SBAS DO-229E frente a Stanford MAAST con emisiones reales de WAAS ({ "2868" } pares dentro de { "1.6e-5" } m). La fila dice con claridad que las funciones de sigma uniforme <c2/> y <c3/> no se ajustan al ADD y que la comparación SBAS L5 de doble frecuencia es un hallazgo.

# text
seg-16a4261c77ec = <b>Posiciones de planetas en todo el sistema solar a partir de los elementos keplerianos de Standish de JPL.</b> El umbral a posteriori del doble del error nominal se sustituye por un umbral preregistrado: RMS como máximo la cifra de la Tabla { "8.10.1" } del Explanatory Supplement por planeta y componente, frente a JPL Horizons DE441, con la separación de la Tierra y la rotación ICRF cubiertas.

# text
seg-8d5b51a942e0 = <b>Tiempo de luz entre cuerpos del sistema solar.</b> El resolvedor de tiempo de luz se compara ahora con los tiempos de luz de Horizons dentro de { "1e-6" } s con posiciones DE441, un umbral preregistrado que no hereda el umbral de posición.

# text
seg-e96900bc322f = <b>Filas MODELLED que las dos políticas hacen promovibles</b> (solo mediante la ejecución { "0.30" } fila por fila, nunca por este texto): con P1, la cota de geolocalización de emisores por TDOA/FDOA (diferencia de tiempo y de frecuencia de llegada), el acoplamiento entre la tasa relativista del reloj y el marco, las máscaras de sincronización de la ITU-T (Sector de Normalización de las Telecomunicaciones) (solo para valores de máscara que las Recomendaciones imprimen como números; los puntos de quiebre transcritos comprobados frente a sí mismos no cuentan) y la cota de posicionamiento de redes no terrestres 5G (solo si se encuentra una cifra desarrollada publicada); con P2, la ceguera de integridad de modo común, el nivel de protección de temporización MHSS (separación de soluciones de hipótesis múltiples) escalar y el blanqueo GLS (mínimos cuadrados generalizados). Las dos filas de benchmark de integridad de temporización (el clasificador del diagrama de integridad de Stanford y el evaluador de cobertura de integridad) son clasificación basada en reglas, no álgebra lineal, de modo que P2 no las alcanza; necesitan una herramienta independiente, y la única hallada (gLAB) lleva una licencia no comercial.

# text
seg-50a08fe5918b = <b>Coherencia con rechazos anteriores.</b> La comprobación de Vallado de la fila de ventana de lanzamiento calificaría ahora con P1 si su prueba calcula el ejemplo desarrollado impreso; el plan { "0.30" } la promueve en su lugar mediante Orekit. La tabla de cruce de tiempo lunar por clase de reloj sigue MODELLED: la tabla que reproduce procede del propio artículo de este proyecto, que no es independiente.

# text
seg-02423542480f = Término de ruido

# text
seg-2bd49b92f14b = Paridad de los estimadores de Allan (ADEV/MDEV/TDEV/OHDEV (ADEV: desviación de Allan; MDEV: desviación de Allan modificada; OHDEV: desviación de Hadamard solapada))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Dos comprobaciones con fuente primaria frente a la <b>SP (Special Publication) { "1065" } del NIST (National Institute of Standards and Technology)</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), ambas con una tolerancia relativa de <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: los estimadores de ADEV solapada, ADEV modificada, desviación de tiempo y Hadamard solapada reproducen las desviaciones del conjunto de datos canónico de 10 puntos <b>NBS14</b> (<b>SP { "1065" } Tabla 29/30, p. { "107" }</b>) con tau = { "1" }, { "2" }; la coincidencia es en realidad de ~{ "1e-6" } (por ejemplo, ADEV solapada (OADEV) con τ = { "2" }: { "85.952868" } frente a { "85.95287" }). ({ "2" }) <c2/>: los mismos cuatro estimadores reproducen el <b>conjunto de datos de 1000 puntos de SP { "1065" } §{ "12.4" }</b> (<b>Tabla { "31" }, p. { "108" }</b>) con factores de promediado { "1" } / { "10" } / { "100" }, donde el conjunto de datos se regenera en código a partir del LCG de SP { "1065" } (Ec. { "73" }): hermético, sin fixture. Los mismos datos y números de la Tabla 31 son el objetivo de regresión en aewallin/allantools (<c3/>), reproducido aquí sin código de terceros. Esto fija las <em>matemáticas del estimador</em> frente a la referencia, distinto de las filas de <em>calibración</em> del ruido que siguen.

# text
seg-79e6f7d1e7f0 = Paridad de los estimadores de Allan con <b>hardware real medido</b>

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/>: los estimadores de Allan solapada y de Hadamard solapada reproducen las desviaciones de referencia de <b>Stable32</b> para un <b>patrón primario real de cesio 5071A medido frente a un máser de hidrógeno</b> ({ "556 990" } muestras de fase con τ₀ = { "1" } s; { "1" } PPS (pulso por segundo) a un contador 53230A, feb. { "2014" }; recogido por A. Wallin, distribuido con <c2/>). Comprobado en <b>toda la escalera decádica de τ ({ "16" } factores de promediado, τ = { "1" } s … { "4" }×10⁴ s)</b>: los factores bien muestreados con una compuerta relativa de <b>{ "1e-3" }</b> (la coincidencia observada es en realidad ≤ { "3e-5" }, por ejemplo OADEV({ "1" } s) { "3.317111e-10" } frente a Stable32 { "3.3171e-10" }), y los factores dispersos de τ largo deben quedar dentro de la banda de confianza de { "1" }‑σ impresa por Stable32. Esto complementa la paridad sintética de NBS14 anterior con una comprobación de reloj medido. El archivo de fase sin procesar son datos de terceros sin licencia de redistribución, de modo que está excluido de git; <c3/> lo reproduce y la prueba imprime un aviso de omisión (CI (integración continua) sigue en verde) cuando falta. Solo se incluyen en el repositorio los números públicos de referencia de Stable32 (<c4/>); no se usa código de terceros.

# text
seg-1a7f0e741913 = Paridad de los estimadores de Allan con el <b>PHASE.DAT canónico de Stable32</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/>: los estimadores de Allan solapada, de Allan modificada y de desviación de tiempo reproducen las desviaciones de referencia de <b>Stable32</b> para <b>PHASE.DAT</b>, la serie de 1001 puntos distribuida con Stable32 que herramientas independientes (por ejemplo, <c2/>) usan como su objetivo estándar de regresión, en <b>toda la escalera de factores de promediado ({ "139" } factores)</b> con una compuerta relativa de <b>{ "1e-3" }</b> (observado ≤ { "5e-5" }). Una segunda serie de referencia real e independiente, junto a la comprobación de cesio medido anterior. PHASE.DAT se distribuye con la herramienta comercial Stable32, de modo que la serie sin procesar está excluida de git; <c3/> la reproduce y la prueba se omite en verde (CI sigue en verde) cuando falta. Solo se incluyen en el repositorio los números públicos de referencia de Stable32 (<c4/>); no se usa código de terceros.

# text
seg-9dde9e0c8055 = Estabilidad de relojes ópticos sobre una <b>curva real medida</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/>: la inversión de los parámetros de ruido del reloj (<c2/>) reproduce el <b>σ_y(τ) publicado del reloj de red óptica de ⁸⁸Sr de Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), curva incorporada en <c3/>): el coeficiente de frecuencia blanca recuperado √q_wf ≈ { "4.33e-16" } coincide con la estabilidad a corto plazo de ≈4.7e-16/√τ del artículo (~{ "10" }% de RMS (valor cuadrático medio) a lo largo de la curva) y el ajuste detecta un suelo medido distinto de cero (q_rw > { "0" }). Esto fija la <b>inversión de ADEV medida → parámetros de ruido frente a un reloj óptico real</b>; el beneficio de holdover hasta el umbral que se construye sobre ella sigue siendo MODELLED.

# text
seg-e1e930dcd0a1 = AUC (área bajo la curva) de la ROC (característica operativa del receptor) para detección de anomalías sobre <b>telemetría real de OPS-SAT de la ESA (Agencia Espacial Europea)</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reproduce las etiquetas)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/>: sobre el conjunto de datos <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) —segmentos reales de telemetría de servicio de OPS-SAT con etiquetas de anomalía de referencia— el AUC de la ROC de Mann–Whitney de Kshana (<c2/>) reproduce <b><c3/> de scikit-learn</b> con una diferencia <b>< { "1e-9" }</b> en la partición de prueba reservada ({ "529" } segmentos, { "113" } anomalías), para dos puntuaciones deterministas: un detector transparente de una sola característica (recuento de picos del segmento, <b>AUC ≈ { "0.851" }</b>) y una puntuación de Mahalanobis diagonal de 8 características ajustada sobre los segmentos normales de entrenamiento (AUC ≈ { "0.556" }); <c4/> acota la estimación puntual con un límite inferior que queda por encima del azar. Esto valida el <b>cálculo del AUC sobre datos reales de la ESA</b> y la <b>separación etiquetada</b> de un detector transparente; <b>no</b> reproduce la mejor métrica publicada en el artículo de OPSSAT-AD (una FCNN (red neuronal totalmente conectada) supervisada, F1 ≈ { "0.95" }), que requiere su modelo entrenado. Datos CC-BY incorporados (<c5/>, herméticos); la referencia independiente se regenera con <c6/>.

# text
seg-5f2d41617fb2 = Síntesis de funcionales del campo gravitatorio (mapa de navegación asistida por gravedad / sin GNSS (GNSS: sistema global de navegación por satélite))

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/>: el núcleo de funcionales de gravedad en armónicos esféricos (<c2/> / <c3/>) —el «lector de mapas» con el que se compara un navegador asistido por gravedad— se valida frente al <b>estándar de gravedad normal GRS80 (Sistema de Referencia Geodésico { "1980" })</b> (Moritz { "1980" }, adoptado por la IAG (Asociación Internacional de Geodesia)). Construir el campo normal GRS80 a partir de sus armónicos zonales pares publicados J₂…J₈ y sintetizar la gravedad (gravitación + centrífuga) sobre el elipsoide reproduce la gravedad normal de forma cerrada de <b>Somigliana</b>, y los valores publicados en el ecuador y en el polo γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², con una diferencia relativa de <b>{ "3.5e-12" }</b> en todas las latitudes (umbral { "1e-9" }). El mismo núcleo carga el <b>modelo terrestre real EGM2008 de ICGEM (Centro Internacional de Modelos Globales de la Tierra) (Modelo Gravitatorio Terrestre { "2008" })</b> (NGA (Agencia Nacional de Inteligencia Geoespacial), dominio público, vía ICGEM; el lector <c4/> también se ejercita con el campo lunar GRAIL (Gravity Recovery and Interior Laboratory) en <c5/>) y produce un mapa de perturbación de la gravedad físicamente acotado (RMS ≈ { "26" } mGal, máx. ≈ { "89" } mGal a grado y orden { "70" }). Valida la <b>corrección del código de síntesis</b>; la <em>precisión de la posición de navegación</em> asistida por gravedad sigue siendo MODELLED (no existe una trayectoria pública de gravímetro sobre una plataforma con verdad de referencia).

# text
seg-7dc3ff4c6eea = edf específicos por tipo de ruido (intervalos de confianza)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/>: la banda de confianza χ² de cada punto de ADEV solapada usa los grados de libertad efectivos específicos por tipo de ruido (formas cerradas de la Tabla { "5" } de NIST SP { "1065" } para modulación de fase blanca y de fase flicker, modulación de frecuencia blanca y de frecuencia flicker, y modulación de frecuencia de paseo aleatorio (WPM/FPM/WFM/FFM/RWFM) —el conjunto simple de Stable32—), identificando el tipo de ley de potencias del registro a partir de su pendiente log-log de MDEV. Tres comprobaciones independientes: (a) las cinco fórmulas reproducen valores evaluados a mano en N={ "64" }, m={ "4" } con una diferencia de { "1e-12" }; (b) un <b>conjunto de Monte Carlo de FM blanca (FM: modulación de frecuencia)</b> ({ "4 000" } registros) mide el edf real de chi cuadrado del estimador = { "2" }·media²/Var(σ²) y coincide con la fórmula dentro del { "20" }% (y mejora de forma apreciable el recuento conservador sin solapamiento); (c) <c2/> reproduce el edf impreso en la <b>Tabla { "32" } de SP { "1065" } (p. { "109" })</b> = { "146.177" } para el conjunto de datos de 1000 puntos con m={ "10" } (FM blanca) con una diferencia de { "5e-3" }, y los límites de confianza del { "95" }% de la tabla ({ "8.223942e-2" } / { "1.035201e-1" }) con una diferencia <{ "0.2" }% (el pequeño residuo es la aproximación χ² de Wilson-Hilferty frente al χ² exacto de NIST). La curva de ADEV exportada incluye el tipo de ruido identificado, el edf y la banda del { "95" }% para cada τ.

# text
seg-7048ac695b99 = FM blanca (corto plazo)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/>: la ADEV solapada simulada reproduce el sigma_y({ "1" } s) publicado —normalmente con una diferencia de pocos puntos porcentuales, con un <b>umbral impuesto del { "20" }%</b> (CSAC y el objetivo de red óptica)— y la curva de FM blanca sigma_y(tau)=sigma_y(1s)/sqrt(tau) para tau = { "1" }, { "10" }, { "100" } s dentro de un <b>umbral del { "25" }%</b> (coincide con la hoja de datos del CSAC (reloj atómico a escala de chip) { "3e-10" } / { "1e-10" } / { "3e-11" }).

# text
seg-11fc7c4b61ff = FM de paseo aleatorio (largo plazo)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/>: la ADEV simulada coincide con sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley, NIST SP { "1065" }) en torno al ~{ "20" }% (promediado entre semillas).

# text
seg-dcfca4041429 = Envejecimiento / deriva lineal

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + compensada

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Determinista; el estimador de holdover elimina el desfase y el envejecimiento mediante un predictor cuadrático, de modo que el residuo es el límite estocástico. Probado en <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Estimador de Kalman + cota de integridad

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/>: un filtro de dos estados (fase, frecuencia) cuyo ruido de proceso exacto de van Loan coincide con el modelo de referencia; la inercia reproduce la varianza analítica de holdover <c2/> con una diferencia de { "1e-9" }. La actualización de la covarianza está en <b>forma estabilizada de Joseph</b> <c3/>, que se mantiene semidefinida positiva (comprobado con Cholesky) a lo largo de { "500" } pasos de predicción/actualización con una razón extrema <c4/>, y coincide con la forma ingenua con una diferencia de { "1e-9" } allí donde esta última está bien condicionada. La capa de ejecución informa de la integridad como la fracción de muestras de la interrupción que quedan dentro de la cota de protección de 3 sigma (<c5/>).

# text
seg-f332f06e80f9 = Autoconsistencia del filtro (NIS (innovación normalizada al cuadrado) / NEES (error de estimación normalizado al cuadrado))

# text
# c1: validated
seg-333e1701b6d0 = <c1/> (modelo)

# text
# c1: src/filter_health.rs
# c2: consistent=true
# c3: consistent=false
# c4: filter_health
# c5: detection::chi2_inv_cdf
seg-c1304de95180 = <c1/>: una evaluación de consistencia de Monte Carlo (Bar-Shalom §{ "5.4" }). El <b>NIS → { "1" }</b> y el <b>NEES → { "2" }</b> agrupados del filtro acorde caen dentro de sus bandas χ² del { "95" }% (la banda del NIS usa el recuento agrupado de innovaciones blancas; la banda del NEES usa el recuento de ejecuciones independientes, ya que los errores de estimación están correlacionados en el tiempo). Una prueba de <b>barrido de desajuste Q/R</b> verifica que el monitor informa <c2/> solo con la sintonía unitaria y <c3/> con desajustes de ×0.1/×0.5/×2/×{ "10" }, con el NIS escalando como ≈1/q_factor según lo derivado. Se expone como <c4/> en el JSON (JavaScript Object Notation) de resultados del reloj y en una tarjeta del playground. Las bandas χ² usan el cuantil de Wilson–Hilferty (<c5/>, comprobado con tablas).

# text
seg-078c4009b24f = Modelo de transferencia de tiempo bidireccional

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/>: el retardo recíproco de modo común se cancela exactamente en la estimación <c2/> (derivada a mano, exacta) y dos medidas unidireccionales se promedian a <c3/> (promediado entre semillas); el retardo diferencial no recíproco es un proceso coloreado de FM blanca + FM de paseo aleatorio cuya desviación de Allan sigue <c4/> (promediado entre semillas, ~{ "20" }%, mediante el propio <c5/> del enlace). Los <em>parámetros</em> (<c6/>, <c7/> de cada enlace) son cifras representativas de TWSTFT/óptico (TWSTFT: transferencia bidireccional de tiempo y frecuencia por satélite), no ajustadas a un terminal concreto.

# text
seg-6ab219622143 = Seguridad (puntuación de detección de spoofing)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/>: el suelo de 1 sigma del monitor <c2/>, el desfase mínimo detectable de <c3/> sigma resultante y la puntuación <c4/> están derivados a mano y probados con pruebas unitarias. El modelo (innovación / detección asistida por reloj de tipo RAIM (RAIM: monitorización autónoma de la integridad por el receptor)) es sólido; los <em>parámetros</em> (ventana de monitorización <c5/>, multiplicador de detección <c6/>, ruido de medida <c7/>) son representativos, no ajustados a un receptor concreto.

# text
seg-ca51e4f1e19c = Detección de ataques de spoofing

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/>: un spoofing de tiempo falso en rampa se señala cuando su desfase supera la cota de detección del reloj; el tiempo de detección coincide con <c2/> derivado a mano con una diferencia de un paso de la malla, y un reloj cuya cota supera la especificación permite que el spoofing alcance el umbral sin ser detectado. Se aplica la misma salvedad de <c3/> que en la puntuación de seguridad.

# text
seg-3d2f6d2b7722 = FM flicker (suelo)

# text
# c1: modeled
seg-55697d598918 = <c1/> (desactivada por defecto)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Sintetizada como una suma de procesos de Ornstein-Uhlenbeck (OU) espaciados logarítmicamente y calibrados a un suelo de ADEV plano configurable; <c1/> valida que el suelo es plano en todo el tiempo de promediado y se sitúa en el nivel configurado (promediado entre semillas). Se activa por reloj mediante <c2/>. Los escenarios de referencia citados la dejan desactivada: el CSAC está dominado por FM blanca en todo el rango de su hoja de datos (1-1000 s) y el suelo sistemático del reloj óptico (~{ "5e-17" }) se representa mediante su cifra de exactitud.

# text
seg-e2e3de9a61a4 = Estadísticas del conjunto de Monte Carlo

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (agregación)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/>: percentiles por rango más cercano y media sobre <c2/> realizaciones reproducibles; una sola ejecución colapsa la dispersión, la banda por paso de tiempo está ordenada <c3/>, y las repeticiones son idénticas bit a bit. Se trata de una agregación estadística sobre la ejecución individual ya validada, no de un modelo físico nuevo.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Hoja de datos de Microchip SA65 / SA.45s

# text
seg-e3bde4355d78 = optical-sr-lattice (red de Sr)

# text
seg-87793f684233 = reloj de red óptica de estroncio, objetivo orientado al espacio, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Estado: FM blanca y FM de paseo aleatorio validadas; envejecimiento modelado y compensado; FM flicker modelada y validada (desactivada por defecto en los escenarios citados).

# text
seg-c5ff448dcb88 = Madurez: las cifras del reloj óptico son el <em>objetivo orientado al espacio</em> sobre hardware terrestre: ningún reloj óptico de estroncio ha volado. Los relojes de Sr de laboratorio alcanzan { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Las cifras del CSAC proceden de un componente comercial desplegado.

# text
seg-b59a4b8e6d88 = Relaciones: Riley, NIST SP { "1065" }, Ec. { "67" }: FM blanca sigma_y^{ "2" }(tau)=h0/({ "2" } tau); FM de paseo aleatorio sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, equivalentemente q_rw*tau/3 para un proceso de Wiener en frecuencia de difusión q_rw.

# text
seg-dca7ee671d91 = Paquete { "2" } — navegación inercial por estima (unidad de medida inercial cuántica)

# text
seg-98452a081241 = Sesgo constante/residual -> posición

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = error de posición = familia { "0.5" }<em>b</em>T^{ "2" } (Groves, tutorial de la AESS (Sociedad de Sistemas Aeroespaciales y Electrónicos)); prueba discreta derivada a mano en <c1/>.

# text
seg-c60c0b54c485 = Paseo aleatorio de velocidad (aceleración blanca)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/>: la DE (desviación estándar) simulada del error de posición coincide con sigma_x(T)=sqrt(S_a*T^3/3) (Groves ec. 54) en torno al ~{ "12" }% observado (promediado entre semillas; umbral impuesto del { "20" }%).

# text
seg-8ac776795d40 = Física del acelerómetro de interferómetro de átomos fríos (CAI) (a partir de primeros principios)

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4pi/lambda ~ 1.611e7 rad/m
# c3: Phi = k_eff*a*T^2 ~ 1.580e4 rad
# c4: T = 10 ms
# c5: sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad
# c6: C = 0.5
# c7: N = 1e6
# c8: sigma_a ~ 1.24e-6 m/s^2
# c9: 1/T^2
# c10: 1/sqrt(N)
# c11: q_va()
# c12: AccelModel
# c13: QUANTUM.md
seg-4eafc81873ed = <c1/>: un interferómetro de átomos fríos Mach-Zehnder de tres pulsos. Verificado a mano frente a la geometría de los manuales: Rb-87 <c2/>; <c3/> a { "1" } g, <c4/>; ruido de proyección <c5/> con <c6/>, <c7/>; <c8/> por disparo; las leyes de escala <c9/> y <c10/>; decaimiento exponencial del contraste. <c11/> <b>deriva</b> la PSD (densidad espectral de potencia) de aceleración blanca que consume el <c12/> clásico. Alcance honesto: solo el <b>suelo de ruido de proyección cuántica</b> (~{ "0.09" } ug/sqrtHz aquí), muy por debajo de los dispositivos reales, limitados por la vibración (1-50 ug/sqrtHz); el tensor de vibración, Coriolis y los sistemáticos de desplazamiento lumínico aún no están modelados (véase <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Sesgo del giróscopo + paseo aleatorio angular (ARW) -> inclinación -> acoplamiento con la gravedad

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Un sesgo residual del giróscopo y el ARW provocan un error de actitud; la inclinación acopla la gravedad (<c1/>) en error horizontal de fuerza específica. <c2/> valida exactamente el crecimiento cúbico de la posición por sesgo puro y el crecimiento de la actitud por ARW como un proceso de Wiener (promediado entre semillas). Se activa por sensor mediante <c3/> y <c4/>; desactivado en los escenarios citados que solo usan acelerómetro.

# text
seg-e68d093e952a = Inestabilidad del sesgo (suelo flicker 1/f)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/>: un proceso flicker 1/f (la misma síntesis OU validada para el reloj) cuyo suelo plano de desviación de Allan se sitúa en el coeficiente de inestabilidad del sesgo; cero no tiene efecto, un suelo distinto de cero cambia la trayectoria, ambos reproducibles. Se activa por sensor mediante <c2/>.

# text
seg-b631c1bfce05 = Paseo aleatorio de aceleración (paseo aleatorio de tasa)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/>: el sesgo es un proceso de Wiener con <c2/>, comprobado promediando entre semillas en torno al ~{ "20" }%. Se activa por sensor mediante <c3/>.

# text
seg-49c4a2532dca = Validación cruzada con NaveGo (coeficientes de ruido de la IMU (unidad de medida inercial))

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/>: una comprobación cruzada externa frente a <b>NaveGo</b> (R. Gonzalez, herramienta de código abierto INS/GNSS (INS: sistema de navegación inercial), <c2/>). Reproduce el viaje de ida y vuelta sintético del <c3/> de NaveGo sobre su <b>perfil de referencia publicado del Microstrain 3DM-GX3-35</b>: al alimentar nuestro estimador de ADEV solapada (validado con NBS14/Stable32) con ruido blanco del sensor a los niveles de 1 σ de NaveGo, recupera los coeficientes de paseo aleatorio de velocidad y de ángulo (VRW, ARW) (<c4/>) dentro de <c5/> (real ~{ "0.4" }%), con la rama de ruido blanco en la pendiente −1/2. Confirma que nuestra cadena de Allan y las definiciones de VRW/ARW de NaveGo coinciden. El registro <c6/> grabado del STIM300 de { "40" } MB no se ingiere (condicionado al formato binario).

# text
seg-171b215f0526 = Factor de escala, términos de ejes cruzados más finos

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> en este paquete de 1 GDL (un grado de libertad)

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = El paquete heredado de un solo eje no tiene error de factor de escala ni de acoplamiento cruzado. La biblioteca strapdown de tres ejes y el paquete <c1/> sí modelan factor de escala, desalineación, sensibilidad a g, cuantización y rampa de velocidad (<c2/>; véase la tabla de afirmaciones más abajo).

# text
seg-ce2b3237acfe = estabilidad del sesgo

# text
seg-129dc6af8f10 = PSD raíz del ruido

# text
seg-7109e60b8c9b = cold-atom-quat (cuántico)

# text
seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

# text
seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

# text
seg-09b42bed82c9 = nav-grade-quartz (clásico)

# text
seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

# text
seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-8714c547449a = Honeywell QA-2000 / tutorial de la AESS de Groves

# text
seg-79fc524162b5 = Planteamiento honesto: la ventaja de los átomos fríos es la <b>estabilidad del sesgo a largo plazo</b> (~2600 veces menor), que domina en una interrupción larga de GNSS a través de { "0.5" }<em>b</em>T^{ "2" }. El ruido a corto plazo es comparable (cuántico ~{ "22" } frente a clásico ~{ "20" } ug/sqrtHz): el sensor cuántico gana el maratón, no el sprint. Madurez: los acelerómetros de átomos fríos están en fase de laboratorio/temprana (JRC122785); el cuarzo de grado de navegación está desplegado.

# text
seg-e02e93f4f30a = Paquete { "3" } — transferencia de tiempo (óptica frente a radiofrecuencia (RF), enlace óptico entre satélites)

# text
seg-2b87e5f0ba7e = Jitter de temporización blanco -> precisión de sincronización

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/>: el RMS de sincronización simulado reproduce el jitter del enlace sigma_j; la media muestral se promedia como sigma/sqrt(N) con una diferencia <{ "20" }% (promediado entre semillas).

# text
seg-4325ec478bca = Temporización -> medición de distancia unidireccional

# text
seg-aa7a1f463683 = distancia = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (exacto, prueba derivada a mano).

# text
seg-7ad8bb95bf35 = Suelo flicker/TDEV, residuo de reciprocidad bidireccional

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (tipo de escenario <c2/>): ruido de fase flicker (Kasdin–Walter, TDEV plana), una no reciprocidad diurna y un residuo de reciprocidad constante en la serie bidireccional; el paquete <c3/> de jitter blanco no cambia.

# text
seg-dae3fa0375fe = jitter de una sola muestra

# text
seg-4a141a45a8ff = fuente

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = objetivo creíble en órbita

# text
seg-9dfc1d4334a3 = enlace óptico entre satélites, objetivo de sincronización de picosegundos; O-TWTFT (TWTFT: transferencia bidireccional de tiempo y frecuencia) de laboratorio ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = medido en una sola sesión

# text
seg-b9faad47d802 = TWSTFT de BIPM/PTB/NIST (BIPM: Oficina Internacional de Pesas y Medidas; PTB: Physikalisch-Technische Bundesanstalt, el instituto nacional alemán de metrología)

# text
seg-51e2e5782c96 = Planteamiento honesto: la cifra óptica es un objetivo de sincronización en órbita del orden de picosegundos (no ha volado). El suelo de laboratorio óptico terrestre es de ~{ "1" } fs (mucho mejor); un enlace de microondas bien diseñado (el enlace de microondas (MWL) del ACES (Conjunto de Relojes Atómicos en el Espacio), ~{ "0.3" } ps) puede competir con el óptico, de modo que la línea base de «RF = { "0.5" } ns» corresponde específicamente a un TWSTFT ordinario. La conversión a distancia es unidireccional (distancia = c<em>dt); en bidireccional/ida y vuelta se reduce a la mitad (distancia = c</em>dt/2).

# text
seg-5fa72f18f983 = Paquete { "4" } — fusión híbrida (culminación)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Compone el Paquete { "1" } (reloj), el Paquete { "2" } (inercial) y el Paquete { "3" } (transferencia de tiempo) en una única suite PNT (posicionamiento, navegación y temporización). La suite debe mantener AMBOS, la temporización (< especificación de temporización) y la posición (< especificación de posición), dentro de los límites; <c1/> es el tiempo hasta que uno de los dos se rebasa. La transferencia de tiempo opcional por enlace óptico entre satélites (ISL) resincroniza el reloj durante la interrupción (solo asistencia de tiempo: la posición no se resincroniza, ya que la transferencia de tiempo da tiempo, no posición).

# text
seg-4f7cd8f86565 = Aspecto

# text
seg-19deb2a3537c = Puntuación PNT combinada (temporización Y posición)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/>: prueba <c2/> derivada a mano (pnt_holdover = el primero entre temporización y posición en rebasar su límite).

# text
seg-d0e39bf123d8 = Integridad + seguridad del paquete híbrido

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/>: un estimador de temporización de Kalman disciplinado a la referencia (nominal) y reanclado en cada resincronización óptica; la integridad es la contención en la cota de protección (la cota incluye el suelo de jitter del enlace), y la seguridad es la puntuación de detección de spoofing. Probado para ambas suites, incluido el caso asistido por enlace.

# text
seg-c3be96b7cb41 = Estimador de fusión conjunta

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/>: un único filtro de Kalman conjunto ([fase, frec] ⊕ [pos, vel]) es el navegador, disciplinado por GNSS (aprendiendo los desfases a partir de una covarianza inicial distinta de cero) y asistido por transferencia de tiempo; la covarianza conjunta da una integridad conjunta que se prueba fiable (≥{ "0.9" }) para ambas suites con sensores consistentes con el ruido. El paquete observa la posición y el tiempo <b>por separado</b>, para lo cual el filtro óptimo es diagonal por bloques; la estimación de sesgo constante con estado aumentado y la asistencia cruzada dinámica son trabajo futuro.

# text
seg-915ec766439f = Filtro acoplado de reloj + posición (covarianza entre bloques)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/>: un único filtro de Kalman <c2/> apilado (actualizaciones en forma de Joseph) cuya medida de <b>pseudodistancia</b> <c3/> acopla los bloques de posición y de reloj. Pruebas: una pseudodistancia compartida hace que <c4/> sea distinto de cero (los filtros desacoplados lo mantienen exactamente en { "0" }); dos geometrías distintas resuelven conjuntamente desfases inyectados de posición y de reloj que una sola distancia no puede separar; una corrección de <b>solo reloj</b> afina la <b>posición</b> a través de la covarianza cruzada (la ventaja que aporta el acoplamiento y que los filtros desacoplados no pueden dar); y un <b>NEES de Monte Carlo es consistente con χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, banda basada en ejecuciones). 1 GDL (la dimensionalidad del paquete); aún no está conectado al paquete ejecutable, y la extensión de 8 estados en 3-D es trabajo futuro.

# text
seg-31ecf062b941 = Composición de submodelos validados

# text
seg-9b849cb4fe8d = hereda

# text
seg-4e1c8b6791f3 = los términos de reloj/inercial/transferencia de tiempo se validan en sus propios paquetes.

# text
# c1: gnss-ins
seg-b672e5499976 = GNSS/INS de acoplamiento débil (paquete <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/>: un EKF de estado de error de 15 estados (δp, δv, ψ, sesgo de acelerómetro/giróscopo; Groves §{ "14" }) gobierna el navegador strapdown de tres ejes con realimentación. Pruebas: un error de posición inyectado se anula con asistencia de referencia perfecta; la solución asistida se mantiene acotada a metros mientras un INS en marcha libre diverge más allá de { "100" } m; y el RMS de la posición fusionada durante una interrupción de { "60" } s supera a la navegación por estima sin asistencia en la cota de la prueba de conjunto (~{ "4" }× al medir antes de { "0.27.3" }; el margen es mayor tras la corrección que se describe más abajo). El acoplamiento del sesgo del giróscopo se comprueba frente al propio strapdown: un sesgo residual conocido del giróscopo debe producir el error de actitud que predice el filtro (<c2/>), y un a priori amplio debe aprender un sesgo de giróscopo de clase controlador de vuelo manteniéndose acotado; ambas fallan con el signo anterior a la 0.27.3. <b>Revisado en { "0.27.3" }:</b> ese acoplamiento tenía el signo equivocado, de modo que las estimaciones del sesgo del giróscopo empujaban en sentido contrario y solo un a priori estrecho mantenía estable el paquete; las cifras publicadas de interrupción cambiaron (CHANGELOG, Fixed). Límite honesto: el sesgo de acelerómetro y la inclinación de acoplamiento débil son poco separables, por lo que no se afirma una calibración por sesgo.

# text
seg-1c9a9f76a432 = GNSS/INS de acoplamiento fuerte (pseudodistancia)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: la innovación se forma en el dominio de la distancia (jacobiano de línea de visión sobre δp). Pruebas: cuatro satélites anulan un error horizontal inyectado de { "8" } m/−{ "5" } m hasta < { "0.1" } m; <b>dos satélites</b> (sin posibilidad de solución de posición, velocidad y tiempo (PVT)) siguen reduciendo el error horizontal en más de { "5" }×; un único satélite en el cenit observa solo la componente a lo largo de la línea de visión (vertical) y deja intacta la horizontal; las entradas mal formadas se rechazan. Solo pseudodistancia: la fase de portadora y un estado explícito de reloj del receptor forman parte de la hoja de ruta.

# text
seg-240b681b6021 = Fidelidad de la asistencia cruzada entre sensores (fusión completa con Kalman/grafo de factores)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> en el paquete <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = El paquete híbrido es una composición a nivel de sistema + asistencia de tiempo, no un estimador óptimo. Los filtros existen en otra parte: el EKF (filtro de Kalman extendido) de acoplamiento débil y fuerte del paquete <c1/> (filas anteriores) y el UKF (filtro de Kalman unscented (UKF)) de 17 estados del tipo de escenario <c2/>. No se modela ningún suavizador de grafo de factores.

# text
seg-189758709fd2 = Resultado: la suite totalmente cuántica mantiene el PNT completo durante una interrupción de { "1.8" } h; la suite totalmente clásica está <b>limitada por la posición</b> (la IMU de grado de navegación rebasa su límite primero). La transferencia de tiempo por ISL óptico mantiene bloqueado incluso el RELOJ clásico, lo que aísla el sensor inercial como el eslabón débil de la suite clásica: el argumento central a favor de combinar inercial cuántico y temporización óptica.

# text
seg-a4c5b45ea8a5 = Geometría — disponibilidad de GNSS a partir de las órbitas

# text
seg-d347bb63c1fd = Propagación circular de dos cuerpos

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/>: periodo <c2/> (mu = { "3.986004418e14" }), la posición vuelve tras un periodo, planitud ecuatorial/polar: pruebas derivadas a mano.

# text
seg-1260a2fef95f = Propagación excéntrica (kepleriana)

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/>: ecuación de Kepler <c2/> resuelta por Newton (residuo < { "1e-12" }); radios de perigeo/apogeo <c3/>; el caso circular coincide con la vía de forma cerrada con una diferencia de { "1e-9" }.

# text
seg-958f03424508 = Deriva secular nodal/apsidal por J2

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); el nodo retrocede (prógrado) / avanza (retrógrado) / es estacionario (polar), y los ápsides se congelan a la inclinación crítica de { "63.4" } grados: pruebas de signo/cero derivadas a mano. Solo dos cuerpos + secular, no osculatriz.

# text
seg-dcba8d368326 = Visibilidad en línea de visión (ocultación por la Tierra + máscara de elevación)

# text
seg-2eee9a8f894b = Un satélite antipodal ocultado, un satélite radialmente hacia afuera a { "90" } grados de elevación y un satélite tangencial en el horizonte: pruebas exactas derivadas a mano.

# text
seg-f251c75eb367 = Visibilidad -> estado GNSS -> línea de tiempo

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> visibles = nominal, 1-3 degradado, { "0" } denegado; generador Walker-delta; una prueba de integración conduce una ejecución de holdover del reloj a partir de la línea de tiempo derivada.

# text
seg-988d3fedb7f5 = Optimizador de diseño de constelaciones + geometría de franjas de cobertura

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: coverage_half_angle_rad
# c6: λ = arccos(Re/r·cos ε) − ε
# c7: street_half_width_rad
# c8: cos c = cos λ / cos(π/s)
# c9: λ < π/s ⇒ None
seg-2a636487a4e6 = <c1/>: <c2/> recorre la malla <c3/> y devuelve la celda que satisface mejor un <c4/> (mínimo de satélites para un objetivo de cobertura / cobertura máxima / mínimo del peor PDOP (PDOP: dilución de la precisión de posición)); una prueba afirma que la elección coincide con un barrido exhaustivo independiente del mismo recorrido, y un ejemplo resuelto confirma que un diseño Walker 24/6/1 de GPS (Sistema de Posicionamiento Global) cubre al menos tan bien como uno reducido de 18 satélites. Las formas cerradas analíticas de <b>franjas de cobertura</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) se verifican a mano frente a la geometría de los manuales (GPS con una máscara de { "5" }°: λ ≈ { "71.16" }°, semianchura de franja de 4 satélites ≈ { "62.83" }°) y detectan el hueco de subpoblación (<c9/>). El solucionador completo de Rider de número mínimo de satélites para cobertura <em>global</em> (el recuento de planos, sensible a las costuras) aún no está implementado.

# text
seg-a1c1364cc45a = Dilución de la precisión (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: dilución geométrica de la precisión; HDOP: dilución horizontal de la precisión; VDOP: dilución vertical de la precisión; TDOP: dilución temporal de la precisión)) -> precisión de posición

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/>: <c2/> a partir de la matriz de diseño de línea de visión. <b>Referencia independiente externa</b> (<c3/>): los cinco factores DOP reproducen los calculados por <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab, una biblioteca GNSS independiente y revisada por pares, usada aquí como se usa ERFA (Essential Routines for Fundamental Astronomy) para los marcos) en <b>{ "8" } geometrías</b> que van desde bien condicionadas hasta casi singulares (DOP en las centenas), con una diferencia relativa de <b>{ "1e-6" }</b>; procedencia + regeneración en <c4/>. Como comprobación adicional de forma cerrada, una geometría de tetraedro regular reproduce los DOP analíticos (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) con una diferencia de { "1e-9" }. Sigma de posición = PDOP × error de distancia equivalente del usuario.

# text
seg-504d5aa92cbc = Error de posición = σ_UERE × DOP para la solución de mínimos cuadrados propia del motor

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/>: un Monte Carlo con semilla (N = { "20,000" } épocas por geometría, σ = { "1.5" } m, semilla ChaCha8 { "36" } + i) de <c3/> con pesos unitarios, resuelto desde la posición verdadera, sobre las <b>{ "8" } geometrías de <c4/></b> (aquellas cuyo DOP coincide con gnss_lib_py), frente a σ²·Q, donde Q es el factor de covarianza del propio núcleo <c5/> (<c6/>, la misma aritmética). <b>Tolerancias preregistradas</b> (commit e50c88d2, antes de la primera ejecución, según la nota de diseño de geometría { "0.36" }, sección { "5.2" }), cada una expresada en número de errores estándar: varianzas este, norte, arriba y de reloj dentro del { "5" } %; RMS H/V/P dentro del { "2.5" } %; correlación este-norte dentro de { "0.035" }; medias dentro de { "5" } errores estándar; la fracción de la elipse horizontal del { "95" } % dentro de { "0.95" } ± { "0.0077" }. Primera ejecución: pasan las { "104" } comprobaciones (peor varianza { "3.2" } %, RMS { "1.6" } %, correlación { "0.012" }, media { "2.2" } errores estándar, elipse { "0.0039" }). Los <b>controles negativos</b> fallan como se exige: duplicar el PDOP falla en todas las geometrías; los errores que crecen como 1/sin(elevación) frente a la Q sin ponderar fallan una comprobación de varianza en toda geometría cuyo satélite más bajo está por debajo de { "20" }°. <b>Cómo se combina con la fila anterior:</b> esa fila valida el DOP de estas geometrías frente a gnss_lib_py; esta añade el paso de esos factores a metros a través del solucionador del motor. <b>Se mantiene al lado una primera comprobación, aparte</b> (<c7/>, <c8/>, ejecutada antes del preregistro e informada como tal): cuatro cielos elegidos a mano (abierto, agrupado, cañón urbano, medio cielo; σ { "1" } m) con intervalos de confianza de chi cuadrado de { "1e-6" } en total sobre { "20" } comprobaciones; razones de { "0.987" } a { "1.009" }, y sus propios controles negativos (un error de DOP del { "10" } %, errores de 1/sin(elevación)) fallan como se exige. <b>Por qué MODELLED:</b> no hay conjunto de datos externo; no demuestra que el error de un receptor real siga el modelo, y σ_UERE es una entrada.

# text
seg-94bffbd8385b = Disponibilidad multiconstelación

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/>: las <c2/> adicionales se fusionan en un único conjunto de satélites para visibilidad/DOP; una prueba de recuento combinado confirma la unión.

# text
seg-0b905100d91c = Ionosfera difundida (Klobuchar, IS-GPS-200 (IS: especificación de interfaz)) → retardo oblicuo en L1

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/>: <c2/>, el modelo monofrecuencia difundido de ocho coeficientes. <b>Referencia independiente externa</b> (<c3/>): el retardo oblicuo en L1 reproduce el <c4/> de <b>RTKLIB (una biblioteca de código abierto de posicionamiento cinemático en tiempo real)</b> (tomojitakasu/RTKLIB, <c5/>, la referencia GNSS abierta de facto, compilada desde el código fuente y ejecutada de forma independiente) en <b>{ "10" } casos</b> que abarcan elevación, acimut, hora local y dos conjuntos de coeficientes (el predeterminado de kshana + el de RTKLIB), con una diferencia <b>< { "1e-4" } m</b>. El lector de mapas de TEC (TEC: contenido total de electrones) IONEX (formato de intercambio de mapas de la IONosfera) para archivos GIM (mapa global de la ionosfera) ya existe (<c6/>, <c7/> con interpolación espacial bilineal y temporal y un mapeo oblicuo, probado con pruebas unitarias en el propio crate); una comprobación cruzada de esa interpolación frente a un producto GIM real de CODE (Center for Orbit Determination in Europe) sigue pendiente. El propio modelo difundido está validado externamente.

# text
seg-39e235557ecc = Núcleo de detección RAIM/ARAIM (ARAIM: monitorización autónoma avanzada de la integridad por el receptor) (χ² / χ² no central / normal) → umbrales y multiplicadores

# text
# c1: src/raim.rs
# c2: chi2_quantile
# c3: pbias=√λ
# c4: noncentral_chi2_cdf
# c5: normal_quantile
# c6: tests/raim_reference.rs
# c7: scipy.stats.chi2
# c8: .ncx2
# c9: .norm
# c10: optimize.brentq
# c11: (GᵀG)⁻¹
# c12: tests/araim_reference_vectors.rs
# c13: ARAIM_REFERENCE.md
seg-8906f922b9b9 = <c1/>: el umbral de detección de instantánea / separación de soluciones / ARAIM (<c2/>), la no centralidad de detección omitida <c3/> (<c4/>) y los multiplicadores K_fa/K_md/K_V (<c5/>) se evalúan todos a partir de una función gamma incompleta regularizada sin dependencias. <b>Referencia independiente externa</b> (<c6/>): <b>{ "171" } casos</b> reproducen <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/>, una implementación independiente de Cephes/Boost, con un algoritmo distinto) en los rangos operativos de P_fa / P_md / redundancia, con una diferencia relativa <b>≤ { "1e-6" }</b>. La geometría que envuelve el núcleo (la pendiente/covarianza de <c11/>) es el núcleo DOP validado con gnss_lib_py. <b>Alcance:</b> esta fila fija el <em>núcleo estadístico</em>. El <em>valor</em> del nivel de protección de la asignación MHSS (separación de soluciones de hipótesis múltiples) de ARAIM se fija por separado frente al ejemplo resuelto publicado por el subgrupo técnico ARAIM del WG-C (Grupo de Trabajo C) (<c12/>, VPL (nivel de protección vertical) { "18.2926" } m frente a { "18.3" } m, HPL (nivel de protección horizontal) { "13.4063" } m frente a { "13.45" } m, dentro de la propia tolerancia de { "0.05" } m de la referencia; véase la nota de normas más abajo y <a1><c13/></a1>).

# text
seg-b17f1501a267 = Nivel de protección SBAS (sistema de aumentación basado en satélites) (DO-229E, Apéndice J) → nivel de protección horizontal / vertical (HPL / VPL)

# text
# c1: src/sbas.rs
# c2: sbas_protection_level
# c3: D=(GᵀWG)⁻¹
# c4: tests/sbas_reference.rs
# c5: zsiki/rtklib_ws
# c6: waasprotlevels()
# c7: rnx2rtkp -ws
# c8: core/filter.c
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-abe00b67e4cb = <c1/>: <c2/>, el <c3/> de mínimos cuadrados ponderados (LS: mínimos cuadrados) → eje mayor de la elipse de error horizontal + σ vertical, escalados por los factores K de DO-229E. <b>Referencia independiente externa</b> (<c4/>): el HPL de kshana reproduce la <b>bifurcación SBAS-PL de RTKLIB</b> (<c5/> <c6/>, la implementación «DO-229D Appendix J» de Siki y Takács { "2017" }), ejecutada por <c7/> sobre <b>datos reales de EGNOS (Servicio Europeo de Navegación por Complemento Geoestacionario)</b> (mensajes difundidos del GEO (órbita geoestacionaria) PRN120 + RINEX (formato de intercambio independiente del receptor) real de BUTE/Budapest, 2017-02-19), en <b>{ "6" } épocas</b> con una diferencia <b>< { "2e-3" } m</b>. La σ por satélite es el presupuesto SBAS completo de la propia referencia independiente (UDRE (error diferencial de distancia del usuario) + GIVE (error vertical ionosférico en malla) iono + tropo + a bordo). Se compiló ESA gLAB { "v6.0.0" } (<c8/>) y se confirmó que usa la misma convención. <b>Nota sobre K_V:</b> ambas referencias independientes redondean el K_V de MOPS (estándares mínimos de desempeño operativo) → { "5.33" }; kshana usa el exacto <c9/> (VPL ~{ "0.06" } % menor), por lo que la componente vertical se valida como el <c10/> sin factor K (= VPL de la referencia independiente / { "5.33" }). El HPL se compara directamente (K_H = { "6.0" } en ambos lados).

# text
seg-fd16d642cafd = Geometría real de constelaciones a partir de TLE (línea 2 / kepleriano)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (análisis sintáctico)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/>: analiza los elementos keplerianos medios de la línea 2 (semieje mayor a partir del movimiento medio); un conjunto de elementos conocido de la ISS (Estación Espacial Internacional) recorre el ciclo de ida y vuelta hasta los elementos y el periodo correctos. Para un bloque de solo línea 2, la propagación es la de dos cuerpos del motor (+ J2 opcional) de los elementos <em>medios</em>: válida para una instantánea desde una época común, y se aleja de SGP4 (Simplified General Perturbations { "4" }) con el tiempo.

# text
seg-26d22e76e28d = Propagación SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (TLE completos)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/>: SGP4 completo para órbita cercana a la Tierra + SDP4 para espacio profundo (secular/periódico lunisolar + resonancia geopotencial de { "12" } h / { "24" } h). Validado en <c2/> frente a los vectores oficiales de AIAA (Instituto Americano de Aeronáutica y Astronáutica) 2006-6753 («Revisiting Spacetrack Report #3») — los { "666" } estados de referencia (órbita cercana, espacio profundo, resonantes, casos de códigos de error) coinciden con un error de posición en el peor caso de ≈ { "4.1" } mm. Un conjunto completo de dos líneas (línea { "1" } + línea { "2" }) se propaga con SGP4; el de solo línea 2 sigue siendo kepleriano; ambos pueden mezclarse. El marco es TEME (ecuador verdadero, equinoccio medio), usado de forma coherente para el usuario y los satélites (sin reducción TEME→ECEF (ECEF: centrado en la Tierra y fijo a ella); adecuado para la geometría de disponibilidad/DOP).

# text
seg-c8fc6a49d249 = Nutación IAU (Unión Astronómica Internacional) 2000A / 2000B + reducción TEME→GCRS (GCRS: Sistema de Referencia Celeste Geocéntrico)

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_iau2000b
# c4: eraNut00a
# c5: eraNut00b
# c6: nut00a
# c7: tools/gen_nut00a.py
# c8: nutation_iau2000a_data.rs
# c9: iauNumat
# c10: teme_to_gcrs
# c11: numat
# c12: tests/frame_reference_vectors.rs
seg-b31c49596100 = <c1/>: la <b>serie completa IAU 2000A</b> ({ "678" } términos lunisolares + { "687" } planetarios, <c2/>) y el truncamiento 2000B de 77 términos (<c3/>) se validan cada uno <b>bit a bit</b> frente a los vectores de referencia publicados de SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) en JD_TT { "2453736.5" }: <c4/> da Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> da Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" }, ambos con una diferencia de <b>{ "1e-13" } rad</b>. La tabla 2000A se genera automáticamente a partir del código fuente <c6/> de ERFA mediante <c7/> (reproduce bit a bit el <c8/> confirmado). La matriz de nutación (<c9/>), la ecuación de los equinoccios y la cadena completa TEME→TOD→MOD→GCRS (TOD: verdadero de la fecha; MOD: medio de la fecha) (<c10/>, Vallado AIAA-2006-6980) se prueban en cuanto a rotación propia, ida y vuelta y propiedades de precesión más nutación; la matriz de nutación frente a <c11/> de ERFA elemento a elemento con una diferencia de { "1e-14" }, y toda la cadena TEME→GCRS frente al ejemplo TEME→GCRF publicado de Vallado (AIAA 2006-6753, 2004-04-06) con una diferencia de <b>{ "0.11" } m</b> (<c12/>); hasta que se añadió esa comprobación de extremo a extremo, la matriz de nutación llevaba Δψ con el signo equivocado, un giro de { "2" }·Δψ (unos { "25" }″) que las pruebas de propiedades no podían ver (véase CHANGELOG, Unreleased, Fixed); 2000A y 2000B coinciden con una diferencia < { "1" } mas, como se exige. La cadena está basada en el equinoccio/GMST (GMST: tiempo sidéreo medio de Greenwich); la reducción CIO (X,Y,s) libre de equinoccio y su comprobación numérica cruzada independiente con ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, un conjunto de herramientas de geometría planetaria en Rust puro; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m en órbita GNSS, muy dentro del objetivo de < { "10" } m) están en la fila CIO de más abajo.

# text
seg-0be3c40cc81a = Modelo geomagnético del campo principal IGRF-14 (IGRF: Campo Geomagnético Internacional de Referencia)

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: igrf_data.rs
# c5: (B_r,B_θ,B_φ)
# c6: < 0.02°
# c7: synthesis_matches_the_official_bgs_igrf14_values_at_2025
seg-9dbb3b1b18a1 = <c1/>: el campo en armónicos esféricos con normalización de Schmidt de la IAGA (Asociación Internacional de Geomagnetismo y Aeronomía) (grado/orden { "13" }, { "2025.0" } + variación secular; coeficientes generados automáticamente a partir del <c2/> oficial mediante <c3/>, reproduciendo <c4/> bit a bit). Validado en cinco frentes independientes: ({ "1" }) comprobaciones puntuales exactas de coeficientes frente al archivo de la IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) la síntesis de grado 1 reproduce el campo del <b>dipolo inclinado exacto de forma cerrada</b> <c5/> con una diferencia de { "1e-6" }; ({ "3" }) el <b>campo analítico completo de grado 13 es igual a −∇V</b> del potencial escalar (diferencias finitas, con una diferencia de { "1e-4" }), ejercitando de extremo a extremo las derivadas de Legendre y el término 1/sinθ; ({ "4" }) el eje del dipolo reproduce el <b>polo norte geomagnético</b> conocido (~{ "80.7" }°N, −{ "72.7" }°E) y la <b>intensidad del dipolo</b> (~{ "29.7" } µT), y el campo global se sitúa en la banda física de { "22" }–{ "67" } µT con el signo correcto de la inclinación en cada hemisferio; y ({ "5" }) <b>referencia independiente externa</b>: la síntesis completa reproduce los valores del <b>servicio web IGRF-14 del British Geological Survey</b> en { "2025.0" } (altitud geodésica WGS-84 (WGS: Sistema Geodésico Mundial)) con una diferencia <b>< { "2" } nT</b> en X/Y/Z/F y <c6/> en D/I en cuatro puntos, incluido uno a { "400" } km de altitud (<c7/>).

# text
seg-c1027d5ffc44 = Reducción GCRS↔ITRS (ITRS: Sistema de Referencia Terrestre Internacional) IAU 2006/2000A basada en CIO

# text
# c1: src/cio.rs
# c2: (X, Y)
# c3: s
# c4: eraXys06a
# c5: eraC2ixys
# c6: eraEra00(2400000.5, 54388.0)
# c7: s
# c8: s06.c
# c9: tools/gen_s06.py
# c10: cio_s06_data.rs
# c11: gcrs_to_itrs_matrix
# c12: eraC2tcio
# c13: xval/anise-frames/
# c14: gcrs_to_itrs_matrix
# c15: earth_latest_high_prec.bpc
# c16: finals2000A
# c17: kshana
seg-aad81285e8cf = <c1/>: la cadena celeste-a-terrestre libre de equinoccio. Las coordenadas del CIP (Polo Intermedio Celeste) <c2/> y la serie del localizador de CIO <c3/> de 66 términos se validan <b>bit a bit</b> frente al vector publicado de SOFA/ERFA <c4/> en JD_TT { "2453736.5" }: X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); la matriz GCRS→CIRS (CIRS: Sistema de Referencia Intermedio Celeste) frente a <c5/> (los nueve elementos con una diferencia de { "1e-12" }); el ángulo de rotación terrestre (ERA) frente a <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). La tabla <c7/> se genera automáticamente a partir de la referencia <c8/> de ERFA mediante <c9/> (reproduce <c10/> bit a bit). La <c11/> completa (CIO <c12/> = movimiento polar · ERA · GCRS→CIRS) se prueba en cuanto a rotación propia e ida y vuelta, y se muestra coherente con la reducción TEME heredada de equinoccio/GMST-1982 dentro de { "1" } m a un radio de { "7 000" } km (las convenciones difieren en unos { "5" } cm allí). <b>Comprobación cruzada independiente de terceros (<c13/>):</b> la misma <c14/> se compara con <b>ANISE</b> (la reimplementación en Rust puro de NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) rotando GCRF→ITRF93 (GCRF: Marco de Referencia Celeste Geocéntrico; ITRF93: Marco de Referencia Terrestre Internacional { "1993" }) a partir de <c15/> del JPL (Laboratorio de Propulsión a Chorro), con <b>parámetros idénticos de orientación terrestre <c16/> del IERS (Servicio Internacional de Rotación de la Tierra y Sistemas de Referencia) aplicados a ambos lados</b>, en ocho épocas trimestrales de { "2020" }–{ "2023" }. Las dos realizaciones independientes del marco coinciden con una <b>rotación relativa máxima de { "0.028" }″ — ≤ { "0.86" } m sobre el suelo, ≤ { "0.93" } m en LEO (órbita terrestre baja), ≤ { "3.6" } m en órbita GNSS</b> (ángulo medio { "0.023" }″). Esta es la comprobación cruzada de marcos de «< { "10" } m» de la ROADMAP, <b>entregada</b>; el residuo es la diferencia esperada de modelo/datum entre ITRF93 y el CIO de IERS-2010, no un defecto (el ancla bit a bit sigue siendo los vectores SOFA/ERFA anteriores). ANISE es un crate con licencia MPL-2.0 (MPL: Mozilla Public License) / edición 2024, por lo que la comprobación reside en un subcrate independiente, excluido del espacio de trabajo, que nunca toca el grafo de dependencias publicado de <c17/> ni ninguna puerta de CI por defecto.

# text
seg-fa5889f379d2 = Exportación de SP3 (Standard Product { "3" }, el formato de órbitas precisas) de ida y vuelta (constelación → SP3-c → nuevo análisis)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/>: la instantánea real de <c2/> de Celestrak ({ "30" } satélites GPS) se propaga con SGP4, se exporta a SP3-c (<c3/> → <c4/>), se vuelve a analizar (<c5/>), y las posiciones ECEF recuperadas se comparan con la referencia SGP4 en cada época a lo largo de { "24" } h: peor residuo <b>< { "0.5" } m</b> (la serialización milimétrica del escritor; la tolerancia de { "10" } m de grado TLE (TLE: conjunto de elementos de dos líneas) del hito se alcanza con un amplio margen). La ruta de la CLI (interfaz de línea de comandos) <c6/> también está cubierta: el escenario de órbita incluido exporta un SP3 de 30 satélites que puede volver a analizarse, y un escenario que no es de órbita se rechaza.

# text
seg-fa5ee52e59aa = Geometría real de la constelación GPS a partir de TLE (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/>: una <b>instantánea genuina de <c2/> de Celestrak</b> (2021-07-28, { "30" } satélites GPS operativos; procedencia en <c3/>) se analiza y cada satélite se propaga mediante el núcleo SGP4 validado hasta un instante común, rotado de TEME a ECEF. Afirma que toda la constelación cae sobre la capa MEO (órbita terrestre media) de GPS con una diferencia de { "1" }%, y que desde un emplazamiento de cielo abierto de latitud media la vista real de todos los satélites (nueve satélites) da un PDOP de { "1.64" } con la dilución vertical superando a la horizontal (como debe ocurrir para un usuario en tierra). Esto ejercita SGP4 sobre una constelación real, junto a las rutas de datos reales SP3 (precisas) y RINEX (difundidas).

# text
seg-a1b7d74bbe02 = Generador Walker de elementos medios SGP4

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/>: un patrón Walker-delta diseñado se emite como elementos medios SGP4 (movimiento medio de Kozai elegido para que el semieje mayor de SGP4 caiga sobre la capa objetivo) y se propaga mediante el núcleo validado. Pruebas: un Walker de 24 satélites de tipo GPS se sitúa sobre la capa MEO con una diferencia de { "1" }%, los planos están separados exactamente { "90" }° en RAAN (ascensión recta del nodo ascendente) recuperada de las normales de las órbitas, y el movimiento medio reproduce el periodo de ~{ "718" } min de la capa de GPS.

# text
seg-6e8c472ec9fa = Barrido de PDOP de constelaciones + FoM (figuras de mérito) de cobertura/revisita

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (monotonía)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/>: <c2/> tabula la cobertura y el PDOP mediano/peor sobre una malla <c3/>; <c4/> informa de la fracción de cobertura y de los huecos de revisita en un punto del suelo. Validado mediante las monotonías físicas que debe respetar un compromiso de diseño: añadir satélites nunca reduce la cobertura y reduce estrictamente el PDOP mediano (un diseño completo de 24 satélites cubre de forma continua con un PDOP de ~{ "1.7" }), y densificar una constelación reducida disminuye estrictamente el peor hueco de revisita. El hueco medio de revisita nunca supera el máximo. Son tablas de compromiso geométrico, no un presupuesto de enlace/cobertura certificado.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Planteamiento honesto: esta es una capa geométrica determinista (órbitas circulares, Tierra esférica de radio medio { "6371" } km, línea de visión pura). Establece la <em>disponibilidad</em> y la precisión de posición <em>geométrica</em> (dilución de la precisión × un presupuesto representativo de error de distancia) a partir de geometría real, no una solución de navegación con efemérides precisas. La referencia <c1/> sitúa una nave dentro de la capa GNSS: solo mantiene una solución ~{ "59" }% del día, el reloj cuántico mantiene una solución de temporización de { "5" } ns a través de todos los huecos (disponibilidad { "1.0" }) mientras que el reloj a escala de chip mantiene ~{ "0.73" }.

# text
seg-e2c433c35ba8 = Propagador numérico (Cowell) y modelo de fuerzas

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = El propagador numérico (<c1/>) integra un modelo jerárquico de fuerzas (<c2/>) con los integradores adaptativos (<c3/>). Cada término siguiente se valida frente a una verdad analítica o a una forma cerrada derivada a mano; las perturbaciones están <b>desactivadas por defecto</b>, de modo que los valores de referencia publicados no se alteran. El modelo compuesto también se comprueba de forma cruzada con otra herramienta: <c4/> ejecuta { "11" } casos de LEO y GTO (órbita de transferencia geoestacionaria), { "275" } épocas horarias, frente al propagador DormandPrince853 de Orekit { "12.2" }, y los niveles conservativos (dos cuerpos → J2–J6 → Sol/Luna → SRP de bola de cañón) coinciden con una diferencia en el peor caso de { "0.08" } m a lo largo de { "24" } h (VALIDATED en la matriz); el nivel de resistencia atmosférica solo está caracterizado ({ "333" } m) y sigue siendo MODELLED.

# text
seg-ec74e57ff801 = Propagador de Cowell frente a la verdad kepleriana analítica

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/>: la órbita no perturbada (dos cuerpos) reproduce la <b>solución kepleriana exacta de variable universal con una diferencia submétrica a lo largo de una órbita LEO de { "24" } h</b> (un umbral más estricto que «frente a una referencia numérica < { "10" } m»); la energía específica y el momento angular se conservan con una diferencia relativa de ~{ "1e-9" }; la regresión nodal por J2 reproduce la forma cerrada <c2/> según la teoría de primer orden (dentro del { "2" } %, el residuo O(J2²)). <c3/> devuelve <c4/> en lugar de una respuesta silenciosamente errónea cuando Newton no converge (cerca del perigeo, e = { "0.999" }). El <c5/> robusto (arranque de Markley { "1995" }, <c6/>) converge allí y en { "0" } ≤ e ≤ { "0.999999" }, dentro de { "0.9" } ε·|E| de las raíces de mpmath de 50 dígitos (<c7/>).

# text
seg-549d15780f79 = Integradores adaptativos (RK4 (Runge–Kutta de cuarto orden) con duplicación de paso + el par embebido de Dormand–Prince RK5({ "4" }), DP5({ "4" }) más abajo)

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/>: RK4 integra <c2/> con una diferencia < { "1e-9" }, muestra una caída del error de ~{ "16" }× por cada paso reducido a la mitad (convergencia de 4.º orden) y conserva el oscilador armónico a lo largo de un periodo. La estimación de error embebida de DP5({ "4" }) es <b>O(h⁵)</b> (reducir el paso a la mitad la divide por ~{ "32" }), integra el oscilador durante { "50" } periodos conservando la energía con una diferencia < { "1e-6" }, y alcanza el mismo punto final con la misma tolerancia en <b>menos evaluaciones de función</b> que la duplicación de paso; <c3/> supera el mismo umbral kepleriano submétrico y coincide con la ruta RK4 con una diferencia < { "1" } m en una órbita J2..J6. <b>DOP853</b> (<c4/>): el par { "8" }({ "5,3" }) de Hairer con salida densa reproduce paso a paso el DOP853 de SciPy { "1.18.1" } (un solo paso con una diferencia de { "5.6e-15" }; recuentos de pasos idénticos en las ejecuciones de e = { "0.7" } y de Arenstorf, un cambio de aceptar/rechazar en { "501" } pasos en la ejecución LEO; estados finales con una diferencia de { "1.6e-12" }) y coincide con la solución kepleriana exacta tan de cerca como lo hace SciPy (<c5/>).

# text
seg-345ae1eb05ec = Campo de armónicos zonales J2–J6

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/>: <c2/> se comprueba de tres maneras: <b>se reduce al <c3/> validado con 666 vectores hasta la precisión de máquina</b> cuando se restringe a <c4/>; <b>coincide con el gradiente numérico de su propio potencial zonal</b> a través de todo el campo J2..J6 (el patrón oro de los campos conservativos); y los términos impares <c5/> frente a los pares <c6/>/<c7/> muestran la (anti)simetría norte–sur característica bajo <c8/>. Una órbita J2..J6 propagada conserva la energía total con una diferencia de ~{ "1e-8" } a lo largo de un día.

# text
seg-5536986d9c8f = Gravedad de tercer cuerpo (Sol y Luna)

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>coincide con el gradiente exacto de su potencial perturbador</b>, se anula en el geocentro y alcanza las magnitudes de LEO de los manuales (~{ "5e-7" } m/s² el Sol, ~{ "1.1e-6" } m/s² la Luna). La efeméride solar de baja precisión de Montenbruck–Gill alcanza los anclajes J2000 derivados a mano (distancia al perihelio ≈ { "1.471e11" } m, declinación en el solsticio de ~−{ "23" }°, movimiento de ~{ "1" }°/día); la efeméride lunar permanece dentro de su envolvente de perigeo/apogeo, recupera la distancia media de ~{ "384 400" } km, nunca supera la inclinación de { "5.3" }° y vuelve a estar a menos de { "1" }° tras un mes sidéreo. El cableado del lado derecho (RHS) dirigido por época es <b>exacto bit a bit</b> (el término del RHS es igual a <c4/> en la posición muestreada en t = { "0" } y t = { "1" } día), y un desplazamiento de época de un cuarto de año produce una trayectoria distinta.

# text
seg-9c8756f9d534 = Presión de radiación solar (SRP) + sombra cónica

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/>: <c2/> (<c3/> de bola de cañón) es <b>idéntico bit a bit</b> a la forma cerrada a pleno sol, fija la <b>presión de radiación a 1 AU (AU: unidad astronómica) en ≈ { "4.5398e-6" } N/m²</b>, se sitúa en la banda de LEO de ~{ "1.36e-7" } m/s² empujando en sentido contrario al Sol, se reduce a la cuarta parte cuando se duplica la distancia al Sol (inversa del cuadrado) y es <b>exactamente cero</b> en lo profundo de la umbra. <c4/> da <c5/> a pleno sol y <c6/> en umbra total (exacto), con una penumbra suave y monótona que sube de { "0" } → { "1" } a lo largo de la banda <c7/>, que <b>se extiende más allá del cilindro umbral</b>.

# text
seg-17b48db4038b = Resistencia atmosférica (primer término dependiente de la velocidad)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado, Tabla 8-4, exponencial por tramos) <b>se ancla en { "1.225" } kg/m³ a nivel del mar</b>, se satura por debajo de la superficie, decrece de forma monótona a lo largo de LEO, se sitúa en la banda de ~{ "1e-12" } kg/m³ a { "400" } km con una altura de escala recuperada físicamente de ~{ "58" } km; <c3/> se opone a la velocidad relativa corrotante con la magnitud de LEO de ~{ "2e-6" } m/s². La comprobación distintiva: una órbita de { "300" } km pierde energía específica <b>de forma monótona</b> y su semieje mayor decae unos km/día acotados, mientras que la línea base en vacío conserva la energía con una diferencia < { "1e-9" }.

# text
seg-133eed361425 = Corrección relativista postnewtoniana (Schwarzschild)

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/>: <c2/> (forma de IERS <c3/> <c4/>) colapsa en una órbita circular a la forma cerrada <c5/> (componentes radial, <b>hacia afuera</b>, y fuera del eje exactamente nulas), muestra la <b>razón <c6/> de LEO respecto a dos cuerpos</b> de los manuales, coincide con la forma simplificada a mano de velocidad radial <c7/> con una diferencia < { "1e-12" }, y en el propagador <b>perturba la órbita manteniendo el semieje mayor por debajo de un metro/día</b>: lo opuesto conservativo del decaimiento por resistencia.

# text
# c1: ForceModel
# c2: src/gravity_sh.rs
# c3: src/tides.rs
# c4: src/precise_od.rs
# c5: ForceModel
# c6: propagator::Geopotential
# c7: HolmesFeatherstoneAttractionModel
# c8: tests/cowell_tesseral_orekit_oracle.rs
# c9: acceleration
# c10: acceleration_hf
# c11: from_gfc_file
# c12: scripts/fetch_egm2008.sh
# c13: acceleration_hf
# c14: xval/high-degree-gravity/
# c15: xval/cowell-tesseral-200-orekit/
# c16: src/nrlmsise00.rs
# c17: tests/nrlmsise00_reference.rs
# c18: forces::DensityModel
# c19: ForceModel::drag_density
# c20: ForceModel::with_ephemeris
# c21: ForceModel::srp_shadow
# c22: tests/srp_oblate_shadow_orekit_oracle.rs
# c23: tests/drag_tier_orekit_oracle.rs
seg-d39e75019595 = Alcance honesto: los valores por defecto publicados de <c1/> integran el campo zonal. El campo <b>teseral</b> EGM2008 de alto grado (<c2/>, grado/orden { "70" }), las <b>mareas</b> sólida/oceánica/atmosférica (<c3/>) y el término de arrastre de marcos de <b>Lense–Thirring</b> están ahora implementados y compuestos en el modelo de fuerzas preciso de ajuste de efemérides (<c4/>; véase más abajo). El campo teseral es también un término opcional del <c5/> de Cowell (<c6/>, desactivado por defecto), validado frente a <c7/> de Orekit { "12.2" } hasta grado/orden { "70" } ({ "6" } casos a lo largo de { "24" } h, peor |Δr| { "0.036" } m; <c8/>). Existen dos evaluadores del campo: el histórico <c9/> (parciales esféricas; válido hasta el grado ~{ "180" } lejos de los polos; salidas fijadas) y <c10/> (columna directa modificada de Holmes–Featherstone { "2002" }, gradiente sin 1/cos φ; válido hasta el grado { "2190" } en cualquier latitud). EGM2008 hasta { "2190" } se carga en tiempo de ejecución (<c11/>, <c12/>, no incluido). <c13/> coincide con Orekit { "12.2" } con una diferencia de { "7.3e-17" } m/s² en ocho puntos hasta el grado { "2190" }; sigue siendo MODELLED porque pyshtools no alcanzó el umbral preregistrado cerca de los polos (una comprobación con mpmath sitúa el error en pyshtools; <c14/>). Una órbita de { "200" }×{ "200" } durante { "24" } h coincide con Orekit con una diferencia de { "0.13" } m, pero su control de sensibilidad preregistrado de grado 70 no se alcanzó ({ "0.73" } m < { "1" } m), por lo que los grados { "71" }–{ "200" } están caracterizados, no validados, en órbita (<c15/>). La densidad termosférica NRLMSISE-00 (NRLMSISE: modelo de atmósfera extendida con espectrómetro de masas y radar de dispersión incoherente del Laboratorio de Investigación Naval) está portada (<c16/>: idéntica bit a bit al port en C de dominio público en { "720" } puntos, dentro de una diferencia relativa de { "1.9e-6" } respecto a pymsis, y reproduce los { "17" } casos de prueba publicados; <c17/>) y es un nivel opcional de densidad de resistencia (<c18/>, <c19/>; por defecto sigue siendo el modelo estático de Vallado). Esto valida el port, no la exactitud del modelo frente a la densidad medida. El Sol y la Luna de DE440 (DE: efeméride de desarrollo) son un nivel opcional de efemérides (<c20/>). La sombra de SRP con Tierra achatada WGS-84 es opcional (<c21/>), y coincide con la razón de iluminación de Orekit { "12.2" } con una diferencia de { "7.4e-9" } en { "2400" } geometrías (<c22/>); su variante con oscurecimiento de limbo no tiene referencia independiente externa (MODELLED). El nivel de resistencia NRLMSISE-00 coincide con la propia resistencia NRLMSISE-00 de Orekit { "12.2" } a lo largo de { "24" } h con una diferencia de { "0.03" } m frente a un desplazamiento por resistencia de hasta { "142" } km (<c23/>, VALIDATED bajo las convenciones compartidas). Una comprobación cruzada con GMAT (General Mission Analysis Tool) sigue siendo un trabajo posterior.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Mareas sobre el geopotencial (<c1/>)

# text
seg-81b18c4caad3 = Correcciones dependientes del tiempo ΔC̄_nm, ΔS̄_nm de los coeficientes de Stokes (IERS Conventions { "2010" }, capítulo { "6" }), validadas frente a las cifras publicadas por las propias convenciones, no frente a otra herramienta.

# text
seg-78dc5baf4d9d = Contribución

# text
seg-7c6c910bbf89 = Marea terrestre sólida (IERS Ec. { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/>: la marea permanente (de frecuencia cero) ΔC̄₂₀ queda dentro del { "1" } % del valor publicado por IERS de −{ "4.1736" }×{ "10" }⁻⁹ (números de Love anelásticos); el <b>ejemplo resuelto K1 del paso 2 se reproduce bit a bit</b> (amplitudes sen/cos { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² con una diferencia de { "0.1" }×{ "10" }⁻¹²); la ruta de Legendre normalizada se fija con valores a mano de forma cerrada, independientes de la recurrencia.

# text
seg-f2e2c5334721 = Marea oceánica (IERS Ec. { "6.15" }, FES2004 (atlas de mareas de solución de elementos finitos { "2004" }), { "8" } constituyentes)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = El subconjunto incorporado de FES2004 (<c1/> → <c2/>, análisis de Doodson→multiplicador) reproduce exactamente los coeficientes de la fuente M2 ({ "2,2" }); la fase de Doodson de K1 es igual a θ_g + π; la magnitud sectorial de grado 2 es física y un orden inferior a la de la marea sólida.

# text
seg-52a19a291a41 = Marea atmosférica S2 (Ray { "2001" }, NASA (Administración Nacional de Aeronáutica y del Espacio) GSFC (Centro de Vuelo Espacial Goddard))

# text
seg-86b3d3a39bc7 = Los armónicos de Ray incorporados se convierten mediante la relación de carga superficial (Ec. { "6.21" }) a un ΔC̄₂₂ máximo ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % del término oceánico M2). Salvedad honesta: <b>no existe una referencia independiente publicada de coeficientes de geopotencial para la marea atmosférica</b>, de modo que se valida por integridad de la fuente + magnitud, un umbral más débil que el de las mareas sólida/oceánica.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Maniobras y diseño de trayectorias (<c1/>)

# text
seg-a2ff4b0619d4 = ΔV impulsivo + propagación de covarianza

# text
seg-12f469864d28 = Una discontinuidad de velocidad con una covarianza de { "6" }×{ "6" } arrastrada hacia adelante (encendido determinista ⇒ STM (matriz de transición de estado) identidad; la covarianza del error de ejecución se rota desde el sistema del encendido —ECI (inercial centrado en la Tierra) o LVLH (vertical local, horizontal local)— al bloque de velocidad).

# text
seg-f3f0e4a7ec05 = Integración de encendido finito frente a Tsiolkovsky

# text
seg-f7b35b7acdba = Integración de empuje constante sobre un arco de encendido (la masa como estado) cuyo ΔV alcanzado coincide con la ecuación de cohete de <b>Tsiolkovsky</b> de forma cerrada con una diferencia <b>inferior al { "0.01" } %</b>.

# text
seg-46ae334a0604 = Solucionador de Lambert (Izzo { "2015" }) de ida y vuelta

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = La salida de Lambert de una sola revolución (<c1/>, <c2/>, tiempo de vuelo ⇒ <c3/>, <c4/>) se <b>recorre de ida y vuelta con el propagador kepleriano exacto de variable universal</b>: debe volver a caer en <c5/>.

# text
seg-04d69337acb3 = Barrido porkchop frente al suelo de Hohmann

# text
seg-fb5298b7983c = El mínimo de la malla de C3 de lanzamiento × llegada / V∞ de llegada se comprueba frente al <b>suelo analítico de C3 de la transferencia de Hohmann</b> para dos órbitas circulares coplanares.

# text
seg-bf2eb36e3eb6 = Solucionador de Lambert frente a una biblioteca independiente

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/>: { "13" } transferencias de una sola revolución de LEO a GEO y a heliocéntrica, prógradas y retrógradas, frente a lamberthub { "1.0.0" } <c2/>; peor diferencia de velocidad en el contorno { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Alcance honesto: sin optimizador de trayectorias, sin ramas de Lambert multirrevolución y con un modelo heliocéntrico sintético circular coplanar (sin efemérides planetarias DE, por lo que no se ha ejecutado una comprobación cruzada de C3 Tierra–Marte con GMAT).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Determinación de órbita (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Corrector por lotes de Gauss–Newton

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = El solucionador genérico <c1/> alcanza la solución exacta de mínimos cuadrados ponderados en un ajuste lineal, recupera los parámetros verdaderos en un ajuste no lineal <c2/> y resuelve una multilateración de distancias en 3-D a partir de distancias sin ruido.

# text
seg-b31d1ffa99b1 = Determinación de órbita por lotes a partir de distancias

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> recupera <c2/> a partir del seguimiento de distancias desde una estación terrestre (propagado con el modelo de fuerzas de dos cuerpos + J2) con una precisión <b>submétrica / mm·s⁻¹ con distancias sin ruido</b>, y de <b>~{ "2" } m con un residuo posterior al ajuste en el suelo de ruido de { "5" } m</b>: la firma de un ajuste de mínimos cuadrados consistente.

# text
seg-fb29199bf8bd = OD secuencial (filtro unscented)

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> recupera recursivamente el estado con una diferencia de decenas de metros con la misma dinámica y el mismo modelo de distancias.

# text
seg-7a636cc9eef0 = OD por lotes y secuencial frente a un estimador independiente

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/>: { "8" } escenarios ({ "6" } sin ruido de LEO/MEO/excéntricas con { "3" }–{ "4" } estaciones, { "2" } con σ = { "5" } m) frente a los estimadores de mínimos cuadrados por lotes y de Kalman de Orekit { "12.2" } con un modelo de fuerzas equivalente; peor caso por lotes { "1e-3" } m / { "1e-6" } m/s, secuencial { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | OD por lotes de velocidad de distancia / acimut-elevación con una máscara de elevación | <c1/> (comparación externa, un umbral preregistrado no alcanzado) | <c2/>: { "8" } escenarios frente a los mínimos cuadrados por lotes de Orekit { "12.2" } con medidas geométricas instantáneas personalizadas; conjuntos visibles idénticos, valores de medida dentro de { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, matriz de transición de estado dentro de { "1.2e-14" }, estados con ruido dentro de { "1.74" } cm y RMS por tipo dentro de { "2.7e-4" }; el umbral preregistrado de estado sin ruido ≤ { "1" } cm no se alcanza en { "2" } de { "4" } escenarios ({ "1.46" } y { "1.74" } cm; la propia estimación de Orekit se sitúa a esa distancia de su verdad simulada, la de kshana dentro de { "1e-8" } m). Véase <c3/>. |

# text
seg-35a85fb744cd = Alcance honesto: la OD didáctica usa estaciones inerciales fijas, un marco topocéntrico de Tierra esférica y medidas geométricas instantáneas (sin tiempo de luz, aberración, refracción ni rotación terrestre); la matriz de transición de estado de la ruta de velocidad de distancia/ángulos es variacional (integrada con RK4 con parciales analíticas de dos cuerpos + J2), no de forma cerrada; no hay filtro secuencial para velocidad de distancia ni para ángulos. La ruta solo de distancias conserva su jacobiano por diferencias finitas. (El motor de ajuste de efemérides de fuerza completa de más abajo lleva su propia matriz de transición de estado variacional.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Validación del modelo de fuerzas mediante ajuste de efemérides (<c1/>)

# text
seg-9207d7139b87 = Un estimador preciso de mínimos cuadrados por lotes de observaciones de posición con fuerza completa: el geopotencial teseral EGM2008 (evaluado en el marco fijo a la Tierra mediante la reducción CIO) compuesto con el tercer cuerpo Sol/Luna, SRP, resistencia, GR (relatividad general) de Schwarzschild/Lense–Thirring y las mareas anteriores, ajustado a un seguimiento de posiciones inerciales con un jacobiano de matriz de transición de estado variacional. Validado con datos <b>sintéticos</b>, en los que la verdad es el propio integrador de Kshana, de modo que todo residuo es del estimador y no de la dinámica.

# text
seg-fc676106563e = Composición precisa del modelo de fuerzas

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/>: el campo de grado 0 es la masa puntual exacta en cada época (el término central es invariante a la rotación); el grado 8 añade el achatamiento de la banda J2; el tercer cuerpo del Sol y el término de marea se conectan con fidelidad bit a bit; una aceleración empírica radial constante es puramente radial en RTN (radial, transversal, normal).

# text
seg-98b036354077 = Matriz de transición de estado variacional

# text
seg-71787d9334db = Cada columna de Φ a lo largo de media órbita LEO (geopotencial de grado 8 + Sol + Luna) coincide con una repropagación independiente por <b>diferencias finitas centrales (FD) de arco completo</b> con una diferencia <b>< { "1" }×{ "10" }⁻⁶ relativa</b> tanto en la respuesta de posición como en la de velocidad: la comprobación cruzada documentada STM↔FD. Φ({ "0" }) = I; los propagadores aumentado y simple coinciden por debajo del milímetro.

# text
seg-0b453776136b = Autorrecuperación del ajuste por lotes de mínimos cuadrados

# text
seg-c651db308332 = Un arco de Kshana de 1 hora (grado 6 + Sol + Luna) observado sin ruido se recupera desde un desfase de { "150" } m / { "0.1" } m·s⁻¹ hasta un <b>estado de época dentro de { "1" }×{ "10" }⁻² m</b> con un RMS posterior al ajuste casi nulo; con ruido blanco de { "5" } m el RMS 3-D posterior al ajuste se estabiliza en el <b>suelo de ruido de ~σ</b>, sin sesgo. El <b>C_R de SRP se recupera de { "1.0" } hasta dentro del { "1" } %</b> de la verdad de { "1.4" }.

# text
seg-06bd2857f832 = Edición de valores atípicos e informe en RTN

# text
seg-8b9dea5c0727 = Un error grosero de { "500" } m se rechaza mediante la edición posterior al ajuste a 5 σ (exactamente una observación), dejando un ajuste limpio de nivel milimétrico; los residuos se informan descompuestos en radial/transversal/normal además de en 3-D.

# text
seg-e3969a15df96 = Nivel de aceleración empírica (RTN constante + 1-CPR (CPR: ciclo por revolución))

# text
seg-c46af7926511 = Los nueve parámetros empíricos con restricción a priori se mantienen por debajo de { "1" }×{ "10" }⁻⁸ m·s⁻² sobre una verdad sin componentes empíricos sin perturbar el ajuste; una aceleración constante transversal de { "3" }×{ "10" }⁻⁸ m·s⁻² inyectada en la verdad se recupera con una diferencia dentro del { "20" } %.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Alcance honesto: la onda sintética usa parámetros de orientación terrestre nominales (EOP: UT1 (Tiempo Universal { "1" }, tiempo de rotación terrestre) ≈ TT (Tiempo Terrestre), sin movimiento polar): exactos para la autorrecuperación, ya que el mismo modelo genera y ajusta el arco. Las validaciones con conjuntos de datos de agencias superponen EOP finals2000A <b>reales</b> y la verdad SP3/SPK (SPK: núcleo de efemérides planetarias) sobre este motor a través de la cadena de marcos CIO (<c1/>, <c2/>, <c3/>, <c4/>).

# text
# c1: tests/agency_galileo.rs
# c2: tests/agency_swarm.rs
# c3: tests/agency_lro.rs
seg-934f0f8e4f5f = Órbitas precisas reales de agencias (<c1/>, <c2/>, <c3/>)

# text
seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

# text
# c1: ESA0MGNFIN
# c2: C_R
# c3: C_R
# c4: workflow_dispatch
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-14a2999d0739 = El motor de fuerza completa de Kshana ajustado a un tramo literal de la <b>propia órbita final de ESA/ESOC (ESOC: Centro Europeo de Operaciones Espaciales)</b> (<c1/>, ITRF (Marco de Referencia Terrestre Internacional)) para <b>E11</b> de Galileo a lo largo de { "8" } h, con cada posición ITRF rotada a GCRS con EOP finals2000A reales: <b>RMS 3-D { "0.133" } m</b> posterior al ajuste con fuerza pura + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> con el nivel empírico, a partir de un solapamiento bruto de { "78.7" } km. El arco completo de { "24" } h da <b>{ "0.611" } m</b>. Todo muy por dentro del umbral de { "5" } m. Campo de gravedad convergido con grado/orden 8 (idéntico con grado/orden 8/10/12); el trabajo <c4/> ejecuta el grado/orden 70 completo. Procedencia + SHA-256 (SHA: algoritmo de hash seguro) en <c5/>; registro completo en <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Motor de fuerza completa (+ resistencia atmosférica) ajustado a un tramo literal de la <b>propia órbita precisa de dinámica reducida de Swarm-A de la ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) a lo largo de { "3" } h con grado/orden 70, EOP finals2000A reales mediante la cadena CIO: nivel <b>dinámico</b> (solo estado, densidad estática, <c2/>={ "1" }) con un <b>RMS 3-D { "2.687" } m</b> posterior al ajuste (RTN 0.925/<c3/>/0.045 m; residuo ≈ resistencia pura a lo largo de la traza), nivel <b>de dinámica reducida</b> (+ aceleraciones empíricas CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m); ~{ "10" } cm frente a la órbita de ~{ "2" } cm de la ESA. Procedencia + SHA-256 en <c4/>; registro completo en <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) lunar — validado, por encima de { "5" } m (honesto)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = Ajuste del modelo de fuerzas <b>centrado en la Luna</b> (<c1/>): el campo de gravedad <b>GRGM660PRIM</b> de GRAIL (grado/orden { "100" }) en el marco lunar de ejes principales fijo al cuerpo (<c2/>, IAU { "2015" } Tierra media + el desfase fijo DE421 (efeméride de desarrollo { "421" }) Tierra media → ejes principales (ME→PA), aplicado como lo define SPICE desde { "0.36" }: hasta entonces se aplicaba en sentido contrario, con un error de unos { "208" }″), + tercer cuerpo Tierra/Sol, ajustado mediante el <em>mismo</em> estimador genérico de Gauss–Newton que los conjuntos de datos terrestres a la órbita reconstruida real de <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } épocas, ~{ "98" } km. Resultado honesto posterior al ajuste ({ "0.36" }): <b>dinámico { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>de dinámica reducida { "6.67" } m</b> (RTN 3.41/4.58/3.44, empírico de { "1" }+2 por revolución), a partir de un solapamiento bruto de { "39.9" } m (antes de la corrección ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m): <b>por encima</b> del umbral de < { "5" } m, y no por culpa del estimador (idéntico con grado/orden 100/150 y <c3/> 1e-6/1e-9). Una <b>validación cruzada de grado DE</b> (<c4/>: orientación lunar PA de DE440 (efeméride de desarrollo { "440" }) + efeméride DE440 mediante ANISE) <b>corrigió</b> la afirmación sobre el factor limitante: dio { "12.0" } m dinámico y { "6.67" } m de dinámica reducida, que la pila analítica corregida ya reproduce en ambos niveles (la diferencia dinámica anterior, { "12.6" } → { "12.0" } m, era el error del desfase ME→PA), de modo que el suelo operativo <b>no</b> es la orientación/efeméride analítica sino un residuo irreducible del nivel empírico (lo más coherente con una dinámica no gravitatoria de LRO sin modelar en el arco corto); la pila analítica ligera ya iguala el grado DE para la órbita de dinámica reducida. Procedencia + SHA-256 en <c5/>; registro completo en <c6/>. <b>Validado frente a la verdad real de agencias: { "3" } de { "3" }; alcanzan < { "5" } m: { "2" } de { "3" }.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Navegación por mapa gravitatorio / PNT alternativo (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Campo de anomalías de gravedad en armónicos esféricos

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/>: un campo de grado bajo totalmente normalizado, comprobado frente a las funciones de Legendre de forma cerrada (<c2/>, <c3/>, <c4/>) y a una anomalía de un solo término derivada a mano de { "1.897" } mGal.

# text
seg-f00f82b70e6e = Modelo de medida del gravímetro de átomos fríos

# text
# c1: σ = ASD/√τ
seg-49090598c525 = El suelo de ruido blanco se deriva de la ASD del acelerómetro CAI (<c1/>), inyectado como una secuencia determinista con semilla (al comparador nunca se le entrega la verdad sin ruido, y aun así la ejecución es reproducible bit a bit).

# text
seg-0556db62c45f = Filtro de partículas de remuestreo por importancia secuencial

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/>: el núcleo determinista se fija exactamente: ESS (tamaño efectivo de muestra) que abarca { "1" }…N, remuestreo sistemático que elige índices en proporción al peso, la combinación convexa de la media ponderada, una verosimilitud gaussiana que lleva la estimación hacia la medida y el determinismo de la predicción con semilla.

# text
seg-7dca80b16a00 = Verosimilitud de ajuste al mapa + recuperación

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/>: <c2/> alcanza su máximo (= { "1" }) en un ajuste perfecto y cae a <c3/> a una sigma; un filtro de partículas sobre un parche distintivo de terreno sintético recupera la posición verdadera con una diferencia dentro de { "0.1" }.

# text
seg-446d9f03a860 = Benchmark de 60 minutos sin GPS

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>): una interrupción de ~{ "700" } km / una hora en la que la solución inercial deriva hasta <b>≈ { "70" } km</b> se recupera hasta <b>≈ { "145" } m (< { "500" } m)</b> mediante un comparador jerárquico de grueso a fino: reproducible bit a bit, estable entre realizaciones de ruido y demostrablemente limitado por el refinamiento (una única malla gruesa se estanca en ~{ "2" } km).

# text
# c1: .hgt
seg-81a2963c26cc = Cargador de DEM (modelo digital de elevación) SRTM (Shuttle Radar Topography Mission) <c1/> + muestreo bilineal (REFERENCIA INDEPENDIENTE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/>: un búfer <c3/> de { "2" }×{ "2" } construido a mano con esquinas [{ "100,200" };{ "300,400" }] se interpola bilinealmente a <b>exactamente { "250.0" }</b> en el centro de la celda (referencia independiente de forma cerrada), el ciclo de ida y vuelta de 16 bits big-endian es exacto y la inversión de filas coloca la fila más al norte del archivo en la latitud almacenada más alta; todo frente a la <b>especificación del controlador SRTMHGT (formato de archivo de alturas de la Shuttle Radar Topography Mission) de GDAL (Geospatial Data Abstraction Library)</b> (16 bits con signo big-endian, orden por filas, fila norte primero, vacío -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Un archivo de prueba incluido de { "11" }×{ "11" } (<c4/>) ejercita el analizador en CI; y una <b>tesela real SRTM v3 de dominio público de NASA/USGS (USGS: Servicio Geológico de los Estados Unidos) incluida</b> (N36W117, Valle de la Muerte, diezmada a 6 segundos de arco, { "722" } KB, <c5/>) se lee en CI (no ignorada, <c6/>), situando <b>la cuenca de Badwater en ≈ −{ "78" } m dentro de la banda documentada de [−{ "95" },−{ "70" }] m</b> (levantamiento de NGS/NOAA (NGS: Servicio Geodésico Nacional; NOAA: Administración Nacional Oceánica y Atmosférica) ≈ −{ "86" } m) con el máximo de la tesela ≈ { "2161" } m: la fuente de verdad es el levantamiento y el DEM es lo que se prueba (no circular). Cotas publicadas puntuales más grandes (Mount Whitney { "4421" } m) permanecen en pruebas de tesela completa condicionadas por <c7/>.

# text
seg-80f985ea3e11 = Convergencia de la navegación referida al terreno (TERCOM/SITAN (TERCOM: correlación de contornos del terreno; SITAN: navegación inercial asistida por terreno de Sandia)) (REFERENCIA INDEPENDIENTE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>): una deriva de INS inyectada <b>derivada a mano</b> ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km a una latitud de ~{ "12" }°, calculada como deriva° × M_por_grado × cos lat) se recupera hasta <b>< { "500" } m</b> (dentro del suelo de resolución de la malla <c3/>), una reducción > { "100" }× respecto a la inercial libre; comprobada frente al número <em>inyectado</em>, nunca frente al DEM (no circular), reproducible bit a bit y estable entre semillas de ruido.

# text
seg-5b7c1dc72436 = Ganancia de fusión combinada de gravedad+magnético+terreno (REFERENCIA INDEPENDIENTE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>): tres canales escalares (Δg · anomalía cortical de |B| · elevación) fusionados como una verosimilitud producto dan un residuo <b>acotado < { "500" } m</b> durante la interrupción de 60 min que, promediado entre semillas, <b>no es peor que el mejor canal individual</b> (aditividad de la información / CRLB (cota inferior de Cramér–Rao) más baja). Se sitúa en el régimen publicado de «decenas de metros» de CEP (error circular probable) de TERCOM / navegación referida al terreno (TRN) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: filtro de Kalman de estado de error), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Alcance honesto: el campo de gravedad es de grado bajo + mascones sintéticos, <b>no</b> el conjunto completo de coeficientes de EGM2008/EIGEN (EIGEN: modelo europeo mejorado de gravedad de la Tierra mediante nuevas técnicas); el canal magnético se apoya en el campo principal suave de IGRF más mascones de anomalías corticales <b>sintéticos</b> (un mapa cortical real de alta frecuencia es un trabajo posterior); el campo de terreno de CI para los benchmarks de <em>solución de navegación</em> es el DEM sintético autocontenido, mientras que el propio lector de <c1/> ya se valida en CI frente a una tesela real SRTM v3 incluida (arriba); las teselas reales de resolución completa siguen condicionadas por <c2/>. Un Monte Carlo del error de representación del mapa sigue siendo un trabajo posterior. Los tres navegadores están ahora conectados al motor de escenarios mediante <c3/> (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = Modelo de errores de INS / IMU — validación referida a hojas de datos (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = El modelo de error estocástico de la IMU se valida frente a <b>especificaciones publicadas de hojas de datos de fabricantes / de conjuntos de datos</b>, nunca frente a un valor producido por la propia Kshana. El puente desde una especificación en unidades de campo hasta el modelo de ruido en SI (Sistema Internacional de Unidades) es la identificación estándar por desviación de Allan (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Instituto de Ingenieros Eléctricos y Electrónicos) Std { "952" }): el coeficiente de paseo aleatorio <c1/> es la ADEV solapada leída en τ = { "1" } s sobre la pendiente τ⁻¹ᐟ², y el coeficiente de inestabilidad del sesgo es la meseta plana de Allan (<c2/>, hermético, sin descargas).

# text
seg-702de63000d2 = Evidencia / referencia independiente

# text
seg-c3fed48b98b1 = Capa de conversión de unidades (el riesgo de no circularidad n.º 1)

# text
seg-6cdc88d36bfd = Comprobado a mano: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Paseo aleatorio angular del giróscopo

# text
seg-d5fd60857e4d = El ARW del ADIS16465 de { "0.15" } deg/√hr (hoja de datos de Analog Devices) se recupera a partir de la ADEV({ "1" } s) con una diferencia < { "5" }%.

# text
seg-c5e2d361b83f = Paseo aleatorio de velocidad del acelerómetro

# text
seg-4413d3bb39b4 = El VRW del ADIS16465 de { "0.1" } m/s/√hr se recupera con una diferencia < { "5" }%.

# text
seg-ebeb0bb0e0fb = Pendiente de Allan del ruido blanco

# text
seg-f674ce82dc2c = Pendiente log-log de la rama blanca del ADIS16460 −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Meseta de inestabilidad del sesgo en funcionamiento

# text
seg-94acb18a94cb = La inestabilidad del sesgo (BI) del giróscopo del ADIS16465 de { "2.0" } deg/hr se recupera como el mínimo plano de Allan con una diferencia < { "15" }%.

# text
seg-b359e0e92e20 = Segundo perfil de IMU

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr), ambos recuperados con una diferencia < { "5" }%.

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Alcance honesto: esto valida el <b>modelo de error estocástico</b> frente a los coeficientes de Allan de las hojas de datos. El conjunto de datos de vehículo <b>KF-GINS</b> de i2Nav-WHU (WHU: Universidad de Wuhan) se usa como una comprobación aparte, condicionada a los datos: el EKF de estado de error de lazo cerrado y acoplamiento débil con el modelo de brazo de palanca GNSS es una fila VALIDATED de la <a1>matriz de verificación</a1> (<em>EKF GNSS/INS de acoplamiento débil con brazo de palanca sobre el conjunto de datos KF-GINS</em>), comparado con la trayectoria de referencia en C++ de KF-GINS bajo umbrales registrados antes de la ejecución. Se ejecuta solo donde se suministra el conjunto de datos (<c1/>); sin él se ejecutan las pruebas del cargador sintético y del brazo de palanca. Las variantes de acoplamiento fuerte y de fase de portadora no quedan cubiertas por esa fila (la fila de GNSS/INS de acoplamiento fuerte con fase de portadora es MODELLED).

# text
# c1: src/body.rs
# c2: src/mars_frame.rs
# c3: src/ephem_provider.rs
# c4: src/radiometric.rs
# c5: src/timescales.rs
seg-f0ab98c1a79d = PNT de espacio profundo y de Marte — fundamento D0 (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-bd222b27949c = El primer hito del motor de navegación de espacio profundo: generalizar el núcleo, fijado a la Tierra, a un cuerpo central arbitrario, añadir la dinámica de Marte, una unión para proveedores de efemérides, tiempo submicrosegundo y las primitivas de tiempo de luz / retardo relativista. <b>Todos los escenarios terrestres existentes son idénticos byte a byte</b>: los valores de referencia de reproducibilidad multiplataforma (<c1/>, <c2/>) pasan sin cambios y sin regeneración, impuesto en cada commit.

# text
seg-e0cdbfcbb28a = Abstracción de cuerpo central (Tierra idéntica byte a byte)

# text
# c1: src/body.rs
# c2: Body{mu,re,zonals,gravity,rotation,IAU-pole}
# c3: earth()/mars()/moon()/sun()
# c4: tests/mars_dynamics.rs
# c5: two_body_accel_body(r,&Body::earth())
# c6: zonal_accel_body
# c7: assert_eq!
# c8: ForceModel
seg-7d20649189fa = <c1/>: <c2/> con <c3/>. <c4/> afirma que <c5/> y <c6/> son iguales a las funciones terrestres heredadas con <b>igualdad exacta de bits</b> (<c7/>), y que un arco terrestre con <c8/> por defecto es idéntico byte a byte: los valores de referencia de reproducibilidad no cambian (mismo SHA, sin regeneración).

# text
seg-658acc8112e3 = Gravedad de Marte (GMM-3 (GMM: Goddard Mars Model) teseral, fija al cuerpo)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/>: zonales C̄20/C̄30/C̄{ "40" } a partir de J2/J3/J4 de MRO110 (solución de gravedad del Mars Reconnaissance Orbiter) (<c2/>, J2 recorre el ciclo de ida y vuelta hasta { "1.9604e-3" }) + sectoriales/teserales de MRO110B2 C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv et al. { "2011" }; tabulados en Liu, Baoyin y Ma { "2012" }), evaluados en el marco fijo al cuerpo de Marte de la IAU. <c3/> comprueba el ciclo de ida y vuelta, la desviación de escala J2 respecto a la masa puntual y que el campo es genuinamente fijo al cuerpo (una reorientación de un cuarto de día marciano cambia la aceleración inercial). El grado/orden superior se carga desde un <c4/> incorporado mediante <c5/>.

# text
seg-1dcbee768418 = Marco fijo al cuerpo de Marte (polo IAU)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/>: la rotación IAU 3-1-3 <c2/> (convención WGCCRE/NAIF (WGCCRE: Grupo de Trabajo sobre Coordenadas Cartográficas y Elementos de Rotación), igual que <c3/>). Pruebas: ortonormal con una diferencia de { "1e-12" } y det +{ "1" }, identidad de ida y vuelta, el meridiano origen avanza a <c4/> por día.

# text
seg-5b6355a143c7 = Propagación en torno a Marte / al Sol

# text
# c1: validated
seg-4ab87f666765 = <c1/> (autoconsistencia)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/>: una órbita baja de Marte vuelve a su inicio tras un periodo kepleriano (cierre); la energía específica ε=v²/2−μ/r deriva <{ "1e-9" } a lo largo del arco; la regresión nodal secular por J2 de Marte coincide con la tasa analítica de Vallado (calculada de forma independiente ≈ −{ "5.15" } °/día con una inclinación de { "60" }°) dentro del { "3" }%; una órbita heliocéntrica recupera el año marciano de ~687 días (vis-viva + recuperación independiente del periodo a partir del arco). Sin datos externos.

# text
seg-acff4c016089 = Validación cruzada con DE440 (Marte heliocéntrico)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (EXCLUIDO del workspace; ANISE con licencia MPL-2.0 confinado a su propio Cargo.lock; refleja <c2/>): compara la propagación de Marte centrada en el Sol de Kshana con JPL DE440 (mediante ANISE), con la verdad de Horizons citada literalmente (procedencia + SHA-256). <b>Resultado reproducido</b> (semilla JD (fecha juliana) { "2459580.5" } TDB (Tiempo Dinámico Baricéntrico), <c3/> SHA-256 <c4/>): residuo de posición <b>{ "137" } m con un arco de 1 día</b> ({ "5.97" }×{ "10" }⁻¹⁰ de la distancia heliocéntrica de { "2.299" }×10¹¹ m), creciendo hasta { "3.3" } km a { "5" } d, { "87.9" } km a { "30" } d, { "1.71" } Mm a { "90" } d: el residuo <em>crece</em> con la longitud del arco porque un modelo de dos cuerpos centrado en el Sol omite deliberadamente las perturbaciones planetarias (sobre todo de Júpiter) y el movimiento interno del sistema de Marte que sí incorpora la efeméride baricéntrica DE440, de modo que el crecimiento es la firma honesta de la dinámica de n cuerpos sin modelar, no un error del integrador; un arco corto que permanece en una fracción diminuta de la distancia heliocéntrica confirma que la maquinaria centrada en el Sol es correcta. Se ejecuta solo cuando el núcleo DE440 está presente (<c5/>, o se descarga automáticamente, ~{ "32" } MB): una comprobación manual / <c6/> de grado DE, <b>no</b> una puerta de CI por defecto, de modo que el crate publicado y todas las puertas por defecto permanecen intactos byte a byte.

# text
seg-a7d79066a53b = Tiempo de luz + retardo de Shapiro

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/>: la solución iterativa de tiempo de luz con época retardada (converge |Δτ|<{ "1e-12" } s, con tope) y el retardo de Shapiro Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Pruebas: Tierra–Sol ≈ { "499" } s y Tierra–Luna ≈ { "1.28" } s mediante la efeméride integrada; un emisor sintético de velocidad constante recupera la solución retardada analítica con una diferencia <{ "1e-9" } s (solucionador demostrado independiente de cualquier efeméride real); Shapiro coincide exactamente con un valor calculado a mano y da ~{ "100" }–{ "250" } µs para un rayo rasante Tierra–Marte en conjunción superior.

# text
seg-1bc28f6bdc8f = Unión para proveedores de efemérides

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/>: <c2/> + <c3/> sin núcleo (Montenbruck–Gill Sol/Luna, geocéntrico); devuelve <c4/> para los cuerpos para los que no tiene series (p. ej., Marte), para los cuales la vía es el proveedor ANISE de grado DE: la misma división entre integrado y ANISE que en <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Tiempo en dos partes + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/>: un <c2/> con acumulación de dos sumas de Knuth recupera intervalos submicrosegundo que el JD de un solo f64 pierde cerca de J2000 (>{ "1000" }× mejor, probado); <c3/>/<c4/> usan la serie periódica dominante de Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, verificada a mano en J2000). Aditivo: la ruta de tiempo existente de un solo f64 no cambia.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Observables radiométricos de espacio profundo y mensaje de datos de seguimiento CCSDS — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = El segundo hito del motor de navegación de espacio profundo: el <b>modelo de observables</b> que convierte el núcleo de tiempo de luz/retardo relativista de D0 en las magnitudes reales que informa un pase de seguimiento de la Deep Space Network (DSN) o de ESTRACK (Red Europea de Seguimiento Espacial): distancia, Doppler de una/dos/tres vías, retransmisión coherente del transpondedor, medición de distancia regenerativa/PN (PN: pseudorruido), Δ-DOR (DOR: medición diferencial de distancia unidireccional) y los medios de propagación, además de la entrada/salida del <b>Tracking Data Message (TDM) CCSDS (Comité Consultivo para Sistemas de Datos Espaciales) 503.0-B</b>, que ingiere/emite un archivo estándar de seguimiento de agencia. <b>Alcance honesto:</b> son <b>modelos geométricos exactos</b> que siguen las convenciones de Moyer / CCSDS; el <em>ruido</em> de medida es el <c1/> por observación que aporta quien llama, no está incorporado en el modelo. Reproducir un <em>pase de seguimiento real concreto</em> requiere datos TDM reales más el solucionador de determinación de órbita de espacio profundo: eso es <b>D2</b>, no D1. Todo lo que sigue es aditivo (los valores de referencia de reproducibilidad no cambian; mismo SHA, sin regeneración).

# text
seg-d1d2dc7906c8 = Distancia y Doppler de 1/2/3 vías (solución de dos tramos de Moyer)

# text
# c1: src/radiometric.rs
# c2: one_way_range
# c3: two_way_range
# c4: ρ₂ = c·(τ_up + τ_down)
# c5: one_way_doppler
# c6: two_way_doppler
# c7: three_way_doppler
# c8: f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)
# c9: c·τ
# c10: −(f/c)·ρ̇
seg-e2176b844df8 = <c1/>: <c2/>/<c3/> componen las soluciones de tiempo de luz retardada (tramo descendente) y adelantada (tramo ascendente) de D0; la convención de ida y vuelta completa es <c4/> (m), documentada y coherente. <c5/>/<c6/>/<c7/> forman el desplazamiento de portadora <c8/> (Hz) a partir de la velocidad de variación de la distancia en la línea de visión, <b>convención de signo: una nave que se acerca da un desplazamiento positivo (hacia el azul)</b>. Pruebas: distancia de dos vías = suma de los tramos con una diferencia <{ "1" } mm (~{ "2" } AU de ida y vuelta Tierra–Sol); distancia de una vía = <c9/> exactamente; el Doppler de una vía coincide con el <c10/> analítico para un emisor radial de velocidad constante hasta ppt; el de tres vías con estaciones coubicadas colapsa byte a byte al de dos vías.

# text
seg-638697be5b5b = Retransmisión coherente del transpondedor (razones exactas de DSN)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/>: los números racionales exactos de retransmisión de DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 módulo 201/214): S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Probado por igualdad exacta; un par de bandas no definido hace <b>panic</b> (falla de forma ruidosa, nunca inventa una razón). <c3/> aplica la portadora de banda + la razón de extremo a extremo y es igual al <c4/> explícito hasta la precisión de máquina.

# text
seg-f24f9da1570c = Medición de distancia regenerativa / PN (CCSDS { "414" }; ambigüedad)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (la distancia sin ambigüedad a escala de resolución por chip) y <c4/> = eso × la longitud del código (la distancia sin ambigüedad del código PN completo <c5/>), según CCSDS 414.1-B. Probado: un reloj de distancia de { "1" } MHz da ~{ "149.9" } m; el código PN de votación ponderada de CCSDS-414.1 ({ "1 009 470" } chips) a { "1" } Mchip/s da la distancia sin ambigüedad de diseño de ~{ "151 000" } km; duplicar la tasa de chips reduce a la mitad la ambigüedad por chip.

# text
seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, plano del cielo)

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/>: el retardo diferencial en el plano del cielo <c2/> (s) para una línea base interferométrica <c3/> (CCSDS 506.1-B). Probado: coincide con la proyección analítica exacta <c4/> para un desfase alineado con la línea base conocido con una diferencia de { "1e-15" } s, con la magnitud de ángulo pequeño <c5/> y con el <b>nulo</b> (una nave alineada con el cuásar da un retardo diferencial exactamente cero).

# text
seg-4e5258bb04d5 = Calibración de plasma 1/f² de doble frecuencia

# text
# c1: src/radiometric.rs
# c2: solar_plasma_delay
# c3: K_PLASMA·TEC/(c·f²)
# c4: 1/f²
# c5: K_PLASMA = 40.3 m·Hz²·TECU⁻¹
# c6: coronal_tec_from_sep
# c7: TEC ∝ 1/sin(SEP)
# c8: dual_freq_plasma_calibration
# c9: K_disp = (Δt_X−Δt_Ka)/(1/f_X²−1/f_Ka²)
# c10: d_X/d_Ka = (f_Ka/f_X)²
# c11: dual_frequency_recovers_injected_plasma
seg-e3b340103825 = <c1/>: <c2/> = <c3/> (el retardo de grupo dispersivo <c4/> de partículas cargadas, <c5/>); <c6/> la columna de corona <c7/> de clase Cassini (sustituto analítico, no una corona calibrada); <c8/> la inversión de dispersión <c9/> que usa la DSN para eliminar el plasma. Probado: la ley 1/f² <c10/>; la corona aumenta hacia la conjunción; y un <b>TEC inyectado se recupera con una diferencia <{ "1" } %</b> (en realidad ≪ { "1e-9" } sin ruido): <c11/>.

# text
seg-e1e265ab499a = Medios tropo / iono (reutilizan modelos GNSS)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/>: el segmento de estación terrestre de espacio profundo atraviesa la misma atmósfera terrestre que el paquete GNSS ya modela, por lo que delegan en <c3/> (cenit de Saastamoinen + mapeo de Niell, no dispersivo) y <c4/> (iono difundida). Probado conectado y con signo físico: tropo positivo y mayor a baja elevación que en el cenit; iono un retardo oblicuo no negativo (la fidelidad numérica corresponde a las propias pruebas del paquete GNSS referidas a hojas de datos).

# text
seg-44ba6e0411fd = Análisis / emisión de CCSDS-TDM { "503" } + puente radiométrico

# text
# c1: src/ccsds_tdm.rs
# c2: META_START…META_STOP
# c3: DATA_START…DATA_STOP
# c4: RANGE
# c5: DOPPLER_*
# c6: ANGLE_*
# c7: *_FREQ
# c8: #[cfg(test)]
# c9: tests/fixtures/deepspace/reference.tdm
# c10: to_radiometric_obs
# c11: RANGE
# c12: DOPPLER_*
# c13: RadiometricObs
# c14: PATH
# c15: 1,2
# c16: 1,2,1
# c17: 1,2,3
# c18: TRANSMIT_BAND
# c19: sigma
# c20: 0.0
seg-18eafe936dcb = <c1/>: un lector <b>y</b> escritor KVN (notación clave-valor) de CCSDS 503.0-B-2 (cabecera + segmentos <c2/> / <c3/>; registros <c4/>/<c5/>/<c6/>/<c7/>). Pruebas (<c8/> + <c9/>): el archivo de referencia se analiza hasta los campos con nombre esperados; <b>analizar→emitir→analizar da una estructura igual</b> (ida y vuelta semántica); el puente <c10/> asigna los registros inequívocos <c11/>/<c12/> a <c13/> (vía desde <c14/> <c15/>/<c16/>/<c17/>, banda desde <c18/>, km→m); un archivo de varios segmentos reinicia la máquina de estados. <b>Omisión honesta en lugar de conjetura:</b> los ángulos/frecuencias, las bandas desconocidas, las épocas en día del año y los sistemas de tiempo no reconocidos se <b>omiten</b>, nunca se asignan mal, y <c19/> se deja en <c20/> para que quien llama lo pondere.

# text
seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (precisión del modelo ≫ suelo publicado)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/>: los observables son cálculos geométricos exactos, por lo que el benchmark honesto consiste en que el <b>error numérico propio del modelo está muy por debajo del suelo de medida publicado de DSN/ESTRACK</b>: el modelo no es el cuello de botella de la exactitud, lo es la σ que aporta quien llama. Cada prueba calcula un observable de dos maneras independientes (o recupera una verdad inyectada) y afirma que el residuo está por debajo del suelo: la <b>distancia</b> hace el ciclo de ida y vuelta con una diferencia <{ "1" } mm ≪ el suelo de ~{ "1" } m de la medición de distancia PN (DSN 810-005 mód. { "214" } / CCSDS 414.1-B); el <b>Doppler</b> coincide con la velocidad de variación de la distancia retardada exacta de forma cerrada <c2/> con una diferencia de ~{ "10" }⁻⁶ m/s, varias × por debajo del suelo de banda X de ~{ "0.05" } mm/s (DSN 810-005 mód. { "203" } / Moyer); el residuo es el suelo de diferenciación de distancias en f64 a ~{ "1" } AU, una característica numérica y no un error de modelado; el <b>Δ-DOR</b> reproduce la proyección de forma cerrada con un ángulo equivalente en el plano del cielo ≪ { "1" } nrad ≪ el suelo de ~{ "1" }–{ "10" } nrad (DSN 810-005 mód. { "210" } / CCSDS 506.1-B); el <b>plasma</b> de doble frecuencia recupera el retardo inyectado con una diferencia ≪ { "1" } %; y el retardo de <b>Shapiro</b> se sitúa en la banda publicada de ~{ "100" }–{ "250" } µs de la conjunción Tierra–Marte. Las cifras publicadas se enuncian y etiquetan como especificaciones de DSN de <b>orden de magnitud</b>, no como números exactos fabricados, y la documentación del módulo es explícita en que este benchmark mide la PRECISIÓN DEL MODELO, no la reproducción de un pase real (eso es D2 + TDM reales).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = OD de dinámica reducida de espacio profundo — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = El tercer hito del motor de navegación de espacio profundo: el <b>estimador</b> que convierte los observables radiométricos de D1 en una trayectoria recuperada: un filtro de información de raíz cuadrada (SRIF) numéricamente robusto con aceleraciones empíricas de dinámica reducida, un reloj de a bordo de tres estados, un modelo de resistencia de Marte y las parciales de medida radiométrica que conectan distancia/Doppler con el estado del filtro, cerrado de extremo a extremo mediante una recuperación sintética de determinación de órbita de una órbita baja de Marte (LMO). <b>Alcance honesto:</b> la recuperación es un <b>lazo cerrado sintético</b> (la verdad y el filtro comparten el mismo propagador de Marte, y las observaciones son el mismo modelo geométrico de observables que invierte el filtro, más ruido gaussiano inyectado): valida la <b>maquinaria del estimador</b>, no la fidelidad absoluta del modelo de fuerzas de Marte; la comprobación cruzada externa de grado DE es el crate <c1/>, condicionado al núcleo (D0.8b). Todo lo que sigue es aditivo (los valores de referencia de reproducibilidad no cambian; mismo SHA, sin regeneración).

# text
seg-51f203291066 = Núcleo SRIF (filtro de información de raíz cuadrada)

# text
# c1: Srif
# c2: R
# c3: Λ = RᵀR
# c4: b
# c5: Vec<f64>
# c6: gauss_newton
# c7: srif_matches_batch_on_linear
# c8: P = R⁻¹R⁻ᵀ
# c9: srif_covariance_is_spd
# c10: P
seg-9d5fd8c1d37d = <c1/>: un filtro de información de raíz cuadrada de Bierman hecho a mano: <c2/> triangular superior con <c3/>, vector de información <c4/>, actualizaciones de medida/tiempo de Householder, aritmética de <c5/> pelado (sin nalgebra). Pruebas: el SRIF secuencial coincide con la solución de mínimos cuadrados ponderados por lotes (<c6/>) <b>tanto en estado como en covarianza con una diferencia de { "1e-9" }</b> en un problema lineal-gaussiano diseñado (<c7/>); la covarianza recuperada <c8/> es <b>simétrica ({ "1e-12" }) y definida positiva por construcción</b> tras una larga secuencia de actualizaciones de medida/tiempo (<c9/>, Cholesky tiene éxito); y la información se acumula (la traza de <c10/> decrece de forma monótona a medida que se incorporan medidas de la misma geometría).

# text
seg-f9ffa1ef4688 = Aceleraciones empíricas de dinámica reducida (ajuste crucero↔LMO)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/>: el filtro <c2/> de nueve estados con aceleraciones empíricas RTN como estados de proceso de Gauss–Markov de primer orden, la técnica de dinámica reducida de JPL/ESOC expuesta como un único parámetro <c3/> (casi dinámico ⇒ suaviza el ruido en un arco balístico; casi cinemático ⇒ el nivel empírico absorbe una maniobra/resistencia sin modelar). Pruebas: un filtro casi cinemático sigue una <b>maniobra escalonada (por propulsor)</b> con <½ del residuo del casi dinámico, mientras que el filtro casi dinámico <b>suaviza mejor un arco balístico con ruido</b> (<c4/>); barrer la rigidez desplaza el residuo posterior al ajuste de forma <b>monótona</b>, un continuo y no un interruptor (<c5/>).

# text
seg-9d5db4d63990 = Reloj de a bordo de 3 estados (fase/frec/deriva, Q de van Loan, Allan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/>: estado de error de fase + frecuencia fraccionaria + deriva de frecuencia con el <b>ruido de proceso discreto exacto de van Loan</b> y una actualización estabilizada de Joseph. Pruebas: la <c2/> discretizada coincide con el polinomio de van Loan derivado a mano <b>con una diferencia de { "1e-12" }</b> y <b>se reduce exactamente a la Q de KalmanClock de dos estados cuando la deriva = { "0" }</b> (un superconjunto estricto); una inercia de varios pasos hace crecer la varianza de fase hasta la relación analítica de holdover de NIST SP { "1065" } mediante el término de carrera aleatoria <c3/>; el estado de deriva <b>recupera una rampa de envejecimiento verdadera con una diferencia <{ "5" } %</b>; se <b>recupera un perfil de Allan de clase USO</b> (ADEV solapada en τ={ "1" } s dentro del umbral de calibración) y el estimador se mantiene consistente en NEES (>{ "95" } % dentro de 3σ) y PSD a lo largo de una ejecución con <c4/> severa. <c5/> contiene las cifras <c6/> citadas de CSAC/USO/DSAC (USO: oscilador ultraestable; DSAC: reloj atómico de espacio profundo) y el suelo Doppler de <c7/>.

# text
seg-8666d18daa2b = Resistencia atmosférica de Marte (Mars-GRAM-lite (GRAM: modelo atmosférico global de referencia))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/>: un perfil de densidad neutra de Marte exponencial por tramos (superficie ~{ "0.020" } kg/m³, altura de escala cercana a la superficie ~{ "11" } km, la media de bajo polvo de Mars-GRAM { "2010" } / MCD (Mars Climate Database)) y la aceleración de resistencia cuadrática calculada respecto a la atmósfera de Marte <b>corrotante</b>, más una variante <c2/> que el SRIF puede multiplicar. Pruebas: la densidad decrece de forma monótona y continua entre bandas, la altura de escala cercana a la superficie recuperada es la física de ~{ "11" } km, la resistencia es <b>estrictamente antiparalela a la velocidad relativa</b> (el producto vectorial se anula con una diferencia de { "1e-12" }) con una magnitud razonable en LMO de ~{ "3e-4" } m/s², y es lineal en el término balístico. <b>Alcance honesto:</b> una atmósfera de ingeniería representativa, no un Mars-GRAM/MCD validado en vuelo con dependencia de polvo/estación/hora local.

# text
seg-452f32dace80 = Parciales de medida radiométrica (distancia/Doppler) para el SRIF

# text
# c1: range_observable
# c2: range_rate_observable
# c3: ρ = |r_sc − r_sta|
# c4: ρ̇ = û·(v_sc − v_sta)
# c5: ∂ρ̇_obs/∂y = c
# c6: range_partial_matches_finite_difference
# c7: range_rate_partials_match_finite_difference
# c8: radiometric_update_reduces_covariance_in_observed_direction
# c9: range_rate_update_observes_velocity
seg-6661d241cdaf = <c1/> / <c2/>: las parciales de la distancia en la línea de visión <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) y de su velocidad de variación <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) que conectan los observables de D1 con el estado del filtro, más la parcial de frecuencia de reloj del Doppler de una vía <c5/>. Pruebas: ambas parciales coinciden con una <b>diferencia finita central del observable con una diferencia de { "1e-6" }</b> (<c6/>, <c7/>); una sola actualización de distancia <b>reduce la covarianza en la dirección observada (línea de visión, LOS) en ≫{ "1000" }×</b> y la mantiene definida positiva (PD), y una actualización Doppler reduce la varianza de la <b>velocidad</b> en LOS (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = OD de extremo a extremo en LMO de Marte a partir de datos radiométricos

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/>: un arco de órbita baja de Marte de referencia propagado bajo la gravedad <c2/> genera <b>distancia (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> de dos vías con ruido contra dos estaciones de seguimiento; el SRIF de dinámica reducida lo recupera a partir de un estado inicial <b>perturbado ~{ "2.7" } km</b>. Logrado: <b>RMS de posición convergido ≈ { "0.2" } m</b> (submétrico, muy por dentro del criterio de finalización de metros a decenas de metros) sobre un arco de 3 órbitas con cadencia de { "30" } s, con la <b>covarianza factorizada definida positiva en cada época</b> (la garantía del SRIF, afirmada en todo momento). El <b>continuo de ajuste crucero→LMO</b> se ejercita de extremo a extremo: con una verdad de resistencia sin modelar que la plantilla del filtro no tiene, el parámetro de dinámica reducida (rigidez { "1" }) recupera ~{ "14" } m frente a ~{ "677" } m de la ejecución casi dinámica (rigidez { "0" }): una mejora de { "48" }× gracias a que el nivel empírico absorbe la resistencia. <b>Alcance honesto:</b> lazo cerrado sintético (la verdad = el mismo propagador que usa el filtro); la comprobación cruzada externa de grado DE es el <c3/> condicionado al núcleo (D0.8b), que nunca se ejecuta aquí, sin red.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Escenario PNT de espacio profundo y fusión de una vía + dos vías — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = El cuarto hito del motor de navegación de espacio profundo: un <b>escenario de producto PNT de Marte</b> ejecutable que une el cuerpo/marco de Marte de D0, los observables radiométricos de D1 y la OD de dinámica reducida de D2 en un único tipo de escenario <c1/>. Modela una pequeña <b>constelación de retransmisión de estilo MARCONI</b> que difunde una señal en el espacio de una vía (acoplada al reloj) y además retransmite un enlace de dos vías (coherente, sin reloj) a una estación de espacio profundo, y navega tres usuarios de referencia (transferencia a Marte, orbitador en órbita baja de Marte, punto fijo en superficie) mediante el <b>estimador de fusión conjunta de una vía + dos vías de D3.1</b>: un SRIF de doce estados que aumenta el bloque de órbita/empírico de dinámica reducida de D2 con un reloj de a bordo de tres estados. <b>Alcance honesto:</b> toda figura de mérito es la <b>cota de covarianza formal</b> del estimador (posición de 1σ / 3σ por época) y el RMS logrado frente a una verdad de <b>lazo cerrado sintético</b> (la verdad y el filtro comparten la misma dinámica de Marte y el mismo modelo geométrico de observables, más ruido gaussiano inyectado): una FoM de navegación simulada, <b>NO</b> un nivel de protección certificado para aviación, y <b>NO</b> una afirmación de vuelo (sin modelo de fallos certificado, sin monitor de integridad, sin datos de seguimiento reales). Todo lo que sigue es aditivo (los valores de referencia de reproducibilidad no cambian; mismo SHA, sin regeneración).

# text
seg-b81920d2df82 = Fusión radiométrica conjunta de una vía + dos vías (la fusionada supera a cada una por separado)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/>: el SRIF de dinámica reducida de D2.2 aumentado con los tres estados del reloj de a bordo (<c2/>), que ingiere una serie temporal mixta de distancia/Doppler de <b>dos vías</b> (sin reloj, fija la órbita: columnas de reloj nulas en la parcial) y de <b>una vía</b> (acoplada al reloj: la parcial de frecuencia <c3/>) mediante <c4/>. La estructura de calibrar y luego propagar por inercia: los pases de dos vías fijan la órbita, y los datos de una vía calibran entonces el reloj y propagan la órbita por inercia entre pases con un error acotado por la estabilidad de Allan del reloj. Probado en <c5/> <c6/>: la solución <b>fusionada</b> supera a <b>cada tipo de enlace por separado</b>; el error de propagación por inercia de una ejecución solo de una vía crece con el intervalo entre pases de dos vías de forma coherente con la cota de Allan de la clase de reloj; la covarianza conjunta se mantiene SPD (simétrica definida positiva) en todo momento.

# text
seg-26a4bfa8e6ad = Constelación MARCONI (radio areoestacionario, ocultación)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/>: un conjunto de cinco relés: tres relés <b>areoestacionarios</b> en <c2/> (el radio síncrono de Marte a partir de μ/velocidad de giro publicadas; probado en la banda de <b>{ "20 400" }–{ "20 500" } km</b>) equiespaciados { "120" }° en longitud con { "5" }° de inclinación, más dos relés en una órbita circular más alta ({ "1.4" }× areoestacionaria) inclinada { "60" }° para cobertura en el plano del cielo. Los estados de los relés por época se integran hacia adelante bajo la gravedad <c3/>; la prueba de visibilidad por <b>ocultación de Marte</b> es la geometría de cuerda que libra la esfera (<c4/>, probado: un relé diametralmente opuesto queda ocultado, un relé cenital es visible). <b>Alcance honesto:</b> una geometría mínima y representativa de difusión más relé construida a partir de constantes publicadas de Marte, no un diseño de constelación de vuelo concreto.

# text
# c1: mars-pnt
seg-b53ea4dd9f7d = Escenario <c1/> accesible mediante CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

# text
# c1: MarsScenario
# c2: run_mars_pnt
# c3: kind = "mars-pnt"
# c4: src/api.rs
# c5: mars_pnt_kind_round_trips_through_the_dispatch
# c6: scenarios/mars-pnt-lmo.toml
# c7: scenarios/mars-pnt-surface.toml
# c8: scenarios/mars-pnt-transfer.toml
# c9: fom_note
# c10: summary
# c11: to_svg
seg-3a01d13ad2e7 = <c1/> / <c2/> está conectado como el escenario <c3/> en todas las superficies (D3.3): el ejecutor de la CLI, el enlace de Python, la compilación WASM/playground y el despacho del servidor MCP encaminan todos hacia él (prueba de ida y vuelta de <c4/> <c5/>). Escenarios de referencia incluidos: <c6/>, <c7/>, <c8/>. El resultado lleva un <c9/> explícito que etiqueta la FoM como una cota de covarianza (no un PL certificado), y las salidas <c10/> / <c11/> repiten la etiqueta de honestidad.

# text
seg-28a49a455a74 = Objetivos de MARCONI / LightShip reproducidos: <b>orbitador < { "100" } m</b>, <b>rover < { "15" } m</b>

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/>: los objetivos publicados del programa MARCONI / LightShip (orbitador < { "100" } m, superficie/rover < { "15" } m) reproducidos en simulación. <b>Supuestos compartidos:</b> la constelación MARCONI por defecto de cinco relés; todo relé a la vista da una distancia + Doppler de una vía por época; un pase coherente de estación de dos vías cada <b>{ "30" } min</b>; ruido de clase DSN (<b>σ de distancia = { "1" } m, σ de Doppler = { "0.1" } mm/s</b>); el filtro de fusión conjunta de órbita de dinámica reducida + reloj de 3 estados inicializado a partir de un estado a priori <b>perturbado ~{ "2.7" } km</b> (rigidez { "0.1" }); FoM = RMS de posición 3-D convergido de la segunda mitad del arco frente a la verdad sintética. <b>Orbitador</b> (LMO ~{ "400" } km / { "60" }° de inclinación, reloj <b>USO</b>, cadencia de { "60" } s, arco de ~{ "2" } h ≈ una órbita): RMS convergido logrado <b>≈ { "0.40" } m</b> ≪ el objetivo de { "100" } m (media de { "3.1" } relés a la vista, covarianza SPD en todo momento). <b>Rover</b> (punto fijo ecuatorial de superficie, reloj <b>USO</b>, cadencia de { "30" } s, arco de ~{ "2" } h): RMS convergido logrado <b>≈ { "5.1" } m</b> < el objetivo de { "15" } m (media de { "3.0" } relés a la vista, covarianza SPD). <b>Ambos objetivos se alcanzan sin relajar ninguna aserción</b>: el USO es la clase <em>menos</em> capaz de los relojes de a bordo realistas (un DSAC solo ayudaría) y la cadencia de dos vías de 30 min es conservadora para un calendario rutinario de red de relés, de modo que los supuestos son físicamente razonables para un sistema de clase MARCONI y no están ajustados para pasar. <b>Alcance honesto:</b> reproducción simulada bajo los supuestos indicados, NO una afirmación de vuelo ni un nivel de protección certificado; la verdad de lazo cerrado sintético comparte la dinámica de Marte y el modelo de observables del filtro.

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Tiempo coordenado lunar — tasa relativista del reloj Tierra-Luna (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Una escala de Tiempo Coordenado Lunar (LTC/TCL (TCL: Temps-Coordonnée Lunaire, el nombre francés del Tiempo Coordenado Lunar)) requiere la tasa secular a la que funciona un reloj en la superficie lunar respecto a un reloj en el geoide terrestre (TT). <c1/> la calcula a partir de primeros principios: una identidad postnewtoniana de primer orden que suma la <b>diferencia de autopotencial</b> (el potencial convencional del geoide <c2/> de la IAU <c3/> menos el autopotencial de la superficie de la Luna <c4/>) y el <b>término cinético (efecto Doppler de segundo orden)</b> <c5/> a partir de la velocidad geocéntrica de la Luna (por diferencias finitas de la serie lunar de Montenbruck-Gill de <c6/>). El término dominante de autopotencial da <b>≈ { "57.5" } µs/día</b>, el término cinético <b>≈ −{ "0.5" } µs/día</b>, para un total <b>≈ { "57" } µs/día</b>. El escenario <c7/> informa de esta tasa y del desfase LTC−TT acumulado sobre un horizonte, y admite un conjunto mínimo de varianza inversa (un reloj de papel lunar); las conversiones TT↔LTC hacen el ciclo de ida y vuelta con una diferencia < { "1" } ns/día.

# text
seg-beeb6561ef6b = Referencia independiente / alcance honesto

# text
seg-4500e65ede97 = Tasa relativista del reloj Tierra-Luna (LTC/TCL)

# text
# c1: lunar_rate_breakdown
# c2: tt_to_ltc
# c3: ltc_to_tt
# c4: lunar_ensemble
# c5: LunarTimeScenario
# c6: L_G
# c7: lunar_time::tests
# c8: W0
# c9: Modelled
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Referencia independiente: una identidad relativista interna de forma cerrada</b> (geopotencial <c6/> de la IAU / de las convenciones del IERS y el autopotencial GM/r (GM: parámetro gravitacional, G por la masa)), <b>comprobada de forma cruzada con la banda publicada de tasa del reloj lunar [{ "56" }, { "59" }] µs/día</b>. Pruebas (<c7/>): el término de autopotencial ≈ { "57.5" } µs/día, la velocidad de la Luna ≈ { "1" } km/s, el término cinético un pequeño valor negativo, el total dentro de la banda con los términos nombrados sumando hasta él, el desfase LTC−TT de 1 día ≈ { "57" } µs, y un ciclo de ida y vuelta TT↔LTC con una diferencia < { "1" } ns/día. <b>Alcance honesto:</b> la cifra principal de µs/día <b>depende de la referencia</b>: depende de las superficies de referencia elegidas (geoide terrestre <c8/> frente a un selenoide lunar), de la ventana de promediado temporal y de las correcciones centrífugas/J₂ inferiores a µs/día que se desprecian; por eso lo que se publica es una <b>banda</b>, no un único número certificado. Esto es una comprobación de autoconsistencia <c9/>, <b>NO</b> una validación externa, <b>NO</b> una exactitud absoluta inferior al nanosegundo, y <b>NO</b> está certificado para la medición del tiempo operativa.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = VLBI geodésico lunar — retardo de campo cercano para una línea base terrestre que observa una baliza lunar (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Un observable de VLBI (interferometría de línea base muy larga) geodésico para dos estaciones terrestres (una línea base) que observan una señal de una vía de un transmisor de clase NovaMoon en la superficie lunar. La Luna está en <b>campo cercano</b>, no es una onda plana, por lo que el retardo geométrico es la diferencia exacta de dos distancias <c1/> y no la proyección en el plano del cielo. El observable completo añade la diferencia de desfases de reloj de las estaciones y un término de Shapiro diferenciado del potencial terrestre (reutilizado de <c2/>). Las estaciones se sitúan en coordenadas inerciales geocéntricas (GCRS) mediante <c3/> + <c4/>; la baliza mediante <c5/> (Luna geocéntrica) + <c6/> (selenográfico→MCMF (MCMF: centrado en la Luna y fijo a ella)) + <c7/> (ME fija al cuerpo→inercial de IAU-2015). El escenario <c8/> muestrea el retardo, su tasa por diferencias finitas y la corrección de campo cercano a lo largo de un pase.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = La <b>referencia independiente</b> es el observable Δ-DOR de onda plana del mismo código <c1/> en <c2/>: en el límite de campo lejano (una baliza sintética a { "1e15" } m) el retardo geométrico debe colapsar a <c3/> hasta la precisión de máquina; a la distancia lunar real, la corrección de campo cercano por curvatura del frente de onda es distinta de cero (de decenas a cientos de µs). Las parciales de la baliza <c4/> (y las parciales de las estaciones) se verifican por diferencia finita central (error relativo < { "1e-5" }).

# text
seg-107b9d328f69 = Retardo de VLBI geodésico lunar + parciales

# text
# c1: geometric_delay_s
# c2: vlbi_delay_s
# c3: delay_partials_beacon
# c4: _station1
# c5: _station2
# c6: near_field_correction_s
# c7: LunarVlbiScenario
# c8: ReferenceImpl
# c9: delta_dor
# c10: src/radiometric.rs
# c11: lunar_vlbi::tests
# c12: delta_dor
# c13: run_toml
# c14: Modelled
# c15: xp = yp = 0
# c16: jd_tdb ≈ jd_tt
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Referencia independiente: <c8/></b>: el <c9/> de onda plana del mismo código (<c10/>) en el límite de campo lejano, más <b>parciales por diferencias finitas</b>. Pruebas (<c11/>): magnitud de la estación ≈ radio terrestre, distancia de la baliza a la distancia lunar ({ "356" }–{ "407" } Mm), el retardo geométrico de campo lejano coincide con <c12/> con una diferencia < { "1e-9" } s, una corrección de campo cercano distinta de cero a la distancia lunar, parciales de baliza/estación por DF con un error relativo dentro de { "1e-5" }, un término de reloj exacto y una ejecución finita del escenario despachada mediante <c13/>. <b>Alcance honesto:</b> <c14/>, <b>NO</b> validado frente a datos reales de VLBI. El movimiento polar se descarta (<c15/>), por lo que las posiciones inerciales de las estaciones llevan un error de marco de unos pocos metros; la baliza mezcla una serie lunar de ecuador medio de la fecha con un desfase fijo al cuerpo en ICRF (Marco de Referencia Celeste Internacional) (<c16/>), una incoherencia de marcos inferior a la fidelidad del modelo pero no rigurosa; y no hay iteración del tiempo de luz, ni rotación terrestre durante el tiempo de luz, ni medios (tropo/iono/plasma), ni término de aberración más allá del Shapiro diferenciado. No se afirma ningún TRL (nivel de madurez tecnológica), herencia de vuelo ni aval de ninguna agencia. { "0.30" }: frente a los tiempos de luz de ANISE a través de DE440, ningún retardo de esta ruta analítica queda dentro de { "1" } ps (mayor diferencia { "24" } µs); el hallazgo queda fijado.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (la Tierra y la Luna de DE440, los ejes principales lunares de DE440, la orientación terrestre ITRF93, con cada tiempo de luz convergido en el marco baricéntrico), ejecutada por el escenario <c2/> cuando se establecen las tres rutas de núcleo. <b>Referencia independiente: biblioteca</b>: tiempos de luz convergidos de NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) hacia DSS-14/43/63, preregistrado: { "75" } retardos dentro de { "1" } ps (peor { "0.06" } ps), parciales de baliza y de estación dentro de { "1e-6" }, en { "25" } épocas cerca de J2000 (una enmienda tras fallar las { "2024" } épocas por la propia época de emisión en doble precisión de SPICE, de unos { "6" } ps, divulgada y fijada). El término de Shapiro diferenciado, la tasa de retardo y la corrección de campo cercano del escenario no se comparan.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = OD lunar conjunta multitécnica + reloj — recuperación simulada de lazo cerrado (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Un ajuste de mínimos cuadrados por lotes de una sola época (instantánea) (<c1/>, un paso QR de Householder desde { "0.30" }) que <b>fusiona las técnicas de VLBI geodésico, de distancias radiométricas/de medición de distancia local lunar y de medición de distancia entre satélites</b> sobre una red lunar SIMULADA para recuperar, <em>conjuntamente</em>, la posición 3-D de una estación en la superficie lunar, las posiciones por satélite de una pequeña constelación y el desfase de reloj de cada elemento. Los observables son: ({ "1" }) retardos de VLBI geodésico de línea base terrestre hacia la estación lunar tratada como baliza (reutilizando <c2/>, inercial geocéntrico): la técnica principal; ({ "2" }) distancias radiométricas geocéntricas de estación terrestre→satélite (que multilateran la constelación desde las estaciones terrestres bien repartidas) y distancias locales lunares estación↔satélite (distancia euclídea MCI (inercial centrado en la Luna) más el término de reloj diferenciado); ({ "3" }) distancias entre satélites (misma forma); más una única pseudoobservación de sincronización de reloj de estación que ancla el desfase de reloj común, de otro modo inobservable. El vector de estado es <c3/>. <b>No hay propagación de modelo de fuerzas dentro del solucionador</b>: los satélites son puntos fijos, distintos e ilustrativos sobre una órbita lunar representativa; es un ajuste de instantánea deliberadamente limpio. Internamente, las posiciones se escalan y los relojes se estiman en metros equivalentes de distancia para que la matriz normal siga bien condicionada en f64; las distancias de VLBI y a distancia lunar se restan de su media respecto a la geometría nominal para que el jacobiano por diferencias finitas no sufra una cancelación catastrófica. El escenario <c4/> ejecuta la resolución con y sin los tramos de VLBI sobre la misma semilla/verdad e informa de ambas soluciones además del factor de mejora de observabilidad de la estación.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = El <b>resultado principal honesto</b>: la medición de distancia local lunar desde una estación polar hasta un puñado de satélites que se encuentran todos hacia un lado del cielo deja la posición de la estación <b>débilmente observada a lo largo de una dirección</b>, de modo que la resolución solo con distancias está mal condicionada y el error 3-D recuperado de la estación es grande (o la resolución no converge). <b>Añadir los retardos de VLBI de línea base terrestre hace observable la posición 3-D completa de la estación</b>, y el error recuperado de la estación se reduce al nivel de metros. La prueba <c1/> afirma que el error de la estación con VLBI es claramente (≥{ "5" }×) menor que el error solo con distancias sobre la misma verdad inyectada: que el VLBI restituya la dirección de la estación, de otro modo inobservable, es el objetivo de la fase.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = La <b>referencia independiente</b> es la consistencia interna: un estado de verdad inyectado (estación ~{ "50" } m/eje, satélites ~{ "30" } m/eje, relojes ~{ "1e-7" } s, con una fluctuación por componente con semilla) se transforma en observables sintéticos mediante el <em>mismo</em> modelo geométrico que invierte el solucionador, se añade ruido gaussiano con semilla (valores ilustrativos por defecto: σ de VLBI ≈ { "1e-11" } s, σ de distancia ≈ { "0.1" } m, σ de ISL ≈ { "0.1" } m; pesos <c1/>), y el estimador debe recuperar la verdad inyectada dentro del ruido a partir de una estimación inicial de ceros. Un NEES medio de Monte Carlo <c2/> sobre semillas (<c3/>) se sitúa dentro de una banda amplia en torno a <c4/>, una comprobación del realismo de la covarianza.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: el álgebra lineal de la resolución)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Referencia independiente de { "0.30" }: P2</b>: numpy { "2.4.6" } (LAPACK gelsd e inv) recalcula cada paso de Gauss-Newton, la solución ponderada convergida, las sigmas formales y el error de la estación sobre los jacobianos incorporados de seis redes (<c4/>, pasos dentro de { "2.4e-11" }, sigmas dentro de { "1.3e-11" }); los modelos físicos de observación y las magnitudes siguen siendo MODELLED. <b>Referencia independiente anterior: <c5/></b>: recuperación de una verdad simulada inyectada + consistencia de covarianza NEES. Pruebas (<c6/>): la fusión completa recupera la verdad (estación < { "5" } m, RMS de satélites < { "5" } m, relojes < { "1e-8" } s, convergido); el VLBI restituye la observabilidad 3-D de la estación (error de la estación ≥{ "5" }× menor con VLBI que solo con distancias sobre la misma verdad); determinista (misma semilla → solución idéntica bit a bit, semilla distinta → solución distinta pero recuperada); NEES medio dentro de una banda amplia en torno a <c7/>; cifras informadas finitas/protegidas incluso cuando la resolución solo con distancias está mal condicionada; escenario despachado mediante <c8/>. <b>Alcance honesto:</b> esto es una <b>recuperación simulada de lazo cerrado</b> (la verdad comparte el modelo de observación), <b>NO</b> una validación con datos reales; sin propagación de modelo de fuerzas dentro del solucionador; las posiciones de los satélites y la geometría de la estación terrestre/lunar son ilustrativas. No se afirma ningún TRL, herencia de vuelo ni aval de ninguna agencia.

# text
# c1: src/lunar_frame_realise.rs
seg-7620f3a821f6 = Realización del marco de referencia lunar — ajuste de datum de Helmert de 7 parámetros (<c1/>)

# text
# c1: src/lunar_frame.rs
# c2: p_i
# c3: q_i
# c4: q_i = t + (1 + s)·R(θ)·p_i
# c5: R(θ) = rz(θz)·ry(θy)·rx(θx)
# c6: crate::precession::{rx, ry, rz, matmul, mat_vec}
# c7: [tx, ty, tz, θx, θy, θz, s]
# c8: crate::batch_ls::gauss_newton
# c9: q_i
# c10: p_i
# c11: z
# c12: 1/σ²
# c13: x0 = zeros
# c14: icrf_orientation_tie
# c15: transpose(crate::lunar_frame::icrf_to_iau_moon(jd_tdb))
seg-240271b9d7de = Mientras que <c1/> <em>aplica</em> la orientación del cuerpo lunar WGCCRE de la IAU { "2015" } (un modelo directo), este módulo <em>estima</em> (realiza) un marco de referencia lunar a partir de una red de coordenadas puntuales estimadas ligadas a un datum. El núcleo de estimación es una clásica <b>transformación de semejanza de 7 parámetros (Helmert)</b> —tres de traslación, tres de rotación de ángulo pequeño y uno de escala— que asigna los puntos <c2/> (marco estimado) a <c3/> (marco del datum) como <c4/>, con <c5/> construida a partir de <c6/>. Los siete parámetros <c7/> se estiman a partir de ≥ { "3" } pares de puntos no colineales mediante mínimos cuadrados ponderados con <c8/>: el modelo directo predice cada <c9/> a partir de su <c10/> y aplana las tres componentes de todos los puntos en el vector observable, las coordenadas observadas del datum forman <c11/>, los pesos son <c12/>, y la resolución parte de <c13/>. Los ángulos de rotación se estiman en µrad y la escala en ppb para que el jacobiano por diferencias finitas siga bien escalado a la magnitud de coordenadas de la superficie lunar (~{ "1.7e6" } m). Un pequeño <c14/> compone la pequeña rotación realizada mediante la orientación IAU cuerpo→ICRF (<c15/>) y devuelve el desfase residual de ángulo pequeño del marco realizado respecto a los ejes ICRF: un cambio de marco de expresión deliberadamente simple, <b>no</b> una estimación independiente del polo lunar.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = La <b>referencia independiente</b> es la consistencia interna: una transformación de Helmert conocida (traslación ~decenas de m, rotación ~µrad, escala ~{ "1e-7" }) se <em>inyecta</em> en una red sintética de puntos bien repartidos (latitud/longitud selenográficas variadas → MCMF, algunos puntos con altitud), se añade ruido gaussiano con semilla y el ajuste debe recuperar los parámetros inyectados. Con datos sin ruido la recuperación llega a ~precisión de máquina (traslación < { "1e-6" } m, rotación < { "1e-9" } rad, escala < { "1e-12" }); con ruido de metros, los parámetros recuperados quedan dentro de unas pocas × la σ formal y el residuo RMS posterior al ajuste se sitúa cerca del nivel de ruido. El escenario <c1/> informa del datum recuperado, del error de recuperación por parámetro frente a la verdad inyectada, del residuo RMS posterior al ajuste y del enlace de orientación ICRF de la rotación realizada.

# text
# c1: helmert_fit
# c2: apply_helmert
# c3: realise_frame
# c4: icrf_orientation_tie
# c5: LunarFrameRealiseScenario
# c6: InternalConsistency
# c7: apply_helmert
# c8: lunar_frame_realise::tests
# c9: run_toml
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referencia independiente: <c6/></b>: recuperación de una transformación de semejanza de 7 parámetros inyectada más la identidad algebraica de ida y vuelta de <c7/>. Pruebas (<c8/>): recuperación sin ruido de la transformación inyectada (traslación < { "1e-6" } m, rotación < { "1e-9" } rad, escala < { "1e-12" }); recuperación con ruido dentro de unas pocas × σ y residuo RMS cercano al nivel de ruido; ciclo de ida y vuelta aplicar-luego-invertir; determinista (misma semilla → idéntico bit a bit, semilla distinta → distinto pero recuperado); el enlace ICRF con rotación nula es cero y el enlace conserva la magnitud de la rotación; escenario despachado mediante <c9/>. <b>Alcance honesto:</b> es una comprobación de <b>autoconsistencia</b> —recupera una transformación <em>inyectada</em> sobre una red <em>sintética</em>—, <b>NO</b> una realización del marco de referencia lunar frente a datos reales de seguimiento / VLBI, y no afirma ninguna exactitud absoluta del marco. El enlace de orientación ICRF es un simple cambio de expresión, no una estimación independiente del polo. No se afirma ningún TRL, herencia de vuelo ni aval de ninguna agencia.

# text
# c1: src/lunar_service.rs
seg-f14930d33f47 = Volumen de servicio de navegación lunar — DOP / cobertura / disponibilidad + PL de ARAIM lunar generalizado (<c1/>)

# text
# c1: crate::orbit::dop
# c2: service_dop
# c3: service_dop
# c4: orbit::dop
# c5: crate::lunar::lunar_araim
# c6: P_sat
# c7: lunar_protection_level
# c8: lunar::lunar_araim
seg-9b4f13e138e4 = Este módulo <em>compone</em> piezas ya construidas en un análisis de <b>volumen de servicio</b> de navegación lunar: barre una malla de latitud/longitud selenográficas sobre un horizonte temporal frente a una constelación de órbita lunar <b>ilustrativa, de fuente pública, de clase Moonlight / LCNS</b> (LCNS: Servicios de Comunicaciones y Navegación Lunares) e informa de DOP / cobertura / disponibilidad más una envolvente generalizada de nivel de protección ARAIM lunar. Las dos reutilizaciones son esenciales y explícitas. La <b>geometría DOP</b> es el núcleo <b>VALIDATED</b> (frente a gnss_lib_py) <c1/>: <c2/> es un fino filtro de máscara de elevación más ese núcleo, y una prueba afirma la identidad (<c3/> es igual a un <c4/> directo sobre las mismas posiciones visibles). La <b>integridad</b> reutiliza la maquinaria de ARAIM lunar de LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliza el nivel de protección existente del polo sur a un punto arbitrario de la superficie, y una prueba afirma que <b>se reduce al caso del polo sur</b> (en el polo sur, con la misma geometría/presupuesto, devuelve exactamente el resultado existente de <c8/> con una diferencia < { "1e-9" }).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Los parámetros de la constelación son una <b>aproximación ilustrativa de las descripciones públicas de la ESA</b> de la clase de sistema (≈ { "4" } satélites en órbitas lunares elípticas congeladas que favorecen la cobertura del polo sur: apolunio sobre el hemisferio sur; { "4" } es el valor por defecto de la biblioteca, y el <c1/> incluido establece { "8" } porque el nivel de protección necesita al menos { "6" } a la vista). <b>No</b> son la efeméride real de Moonlight/LCNS y no implican <b>ninguna</b> afiliación, aval, herencia, certificación ni TRL. La composición (cobertura / disponibilidad / integridad) es <b>MODELLED</b>: un conjunto de relés kepleriano circular/elíptico (no una efeméride de NRHO (órbita de halo casi rectilínea) { "9" }:{ "2" } de LCNS corregida diferencialmente), una Luna de rotación media (sin libración física ni polo en precesión) y parámetros de integridad publicados de LunaNet LNIS. Demuestra el <em>método</em> del volumen de servicio, no una cifra de disponibilidad operativa. Determinista (geometría pura; sin aleatoriedad). El escenario <c2/> informa del porcentaje de cobertura, de las envolventes del recuento de visibles y del PDOP, de la envolvente de HPL/VPL sobre el volumen y de la disponibilidad del nivel de protección frente al límite de alerta.

# text
# c1: LunarConstellation
# c2: visible_sats
# c3: service_dop
# c4: coverage
# c5: lunar_protection_level
# c6: LunarServiceScenario
# c7: crate::orbit::dop
# c8: crate::lunar::lunar_araim
# c9: lunar_service::tests
# c10: service_dop
# c11: lunar_protection_level
# c12: lunar::lunar_araim
# c13: run_toml
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Geometría DOP validada por reutilización</b> del núcleo <c7/> validado con gnss_lib_py; la integridad reutiliza el ARAIM lunar publicado de LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Pruebas (<c9/>): <c10/> es una identidad sobre el núcleo validado; <c11/> en el polo sur es igual al PL existente de <c12/> con una diferencia < { "1e-9" } (se reduce al caso del polo sur); la cobertura no decrece con el tamaño de la constelación; la visibilidad respeta la máscara de elevación; el escenario es determinista y se despacha mediante <c13/>. <b>Alcance honesto:</b> la constelación es <b>ilustrativa, de fuente pública, NO afiliada a la ESA</b>: no es la efeméride real de Moonlight/LCNS; la composición de cobertura/disponibilidad/integridad es <b>MODELLED</b> (relés keplerianos circulares/elípticos, Luna de rotación media, parámetros publicados de LNIS), <b>NO</b> una cifra de disponibilidad operativa de Moonlight. No se afirma ningún TRL, herencia de vuelo ni aval de ninguna agencia.

# text
# c1: src/lunar_dpnt.rs
seg-4ff4929f71df = PNT diferencial lunar — cancelación de modo común + residuo creciente con la línea base + niveles de protección DGNSS (<c1/>)

# text
# c1: i
# c2: e_i
# c3: c_i
# c4: −e_i · û_ref,i + c_i
# c5: −e_i · û_user,i + c_i
# c6: −e_i · (û_user,i − û_ref,i)
# c7: c_i
# c8: [x, y, z, clock]
# c9: crate::orbit::invert4
# c10: crate::sbas::sbas_protection_level
seg-8f94c4bf3fe6 = Un análogo lunar de DGNSS (navegación diferencial por satélite) / SBAS: una <b>estación de referencia de clase NovaMoon</b> en una ubicación selenográfica <em>conocida</em> calcula correcciones diferenciales por satélite a partir de una constelación <b>ilustrativa, de fuente pública, de clase Moonlight / LCNS</b>, y un usuario móvil desplazado de ella por una línea base las aplica, de modo que los errores de efemérides difundidas de <b>modo común</b> se cancelan. Cada satélite <c1/> lleva un vector común inyectado de error de órbita 3-D <c2/> y un error de reloj común <c3/>. El residuo de pseudodistancia de la estación de referencia es la corrección <c4/>; el error bruto del usuario es <c5/>; el error corregido del usuario es su diferencia <c6/>. El <b>término de reloj <c7/> se cancela exactamente</b> (es idéntico en ambas observaciones), y el <b>término de órbita colapsa a la proyección sobre la diferencia de los dos vectores unitarios de línea de visión</b>, que → { "0" } cuando la línea base → { "0" } (el suelo de decorrelación espacial) y crece ≈ linealmente con la línea base. Los errores de distancia corregidos por satélite se proyectan a través de la geometría del usuario mediante una pequeña resolución de instantánea de mínimos cuadrados ponderados con pocas dependencias (estado <c8/> mediante <c9/>; un sesgo constante de distancia lo absorbe la incógnita de reloj en lugar de corromper la solución) para dar el error de <b>posición</b> del usuario. El <b>nivel de protección del usuario reutiliza la maquinaria de nivel de protección SBAS de DO-229E</b> (<c10/>, factores K de aproximación de precisión) con la σ residual diferencial como presupuesto de error de 1 σ de cada satélite.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = NovaMoon se menciona <b>solo como clase de sistema</b> (una descripción pública de una estación de referencia lunar); la constelación reutiliza la <c1/> ilustrativa de fuente pública. Son parámetros ilustrativos para ejercitar el <em>método</em> diferencial, <b>no</b> una efeméride real, y no implican <b>ninguna</b> afiliación, aval, herencia, certificación ni TRL. El escenario <c2/> informa del error de posición del usuario con y sin correcciones, del factor de reducción, de la curva de error frente a línea base y del nivel de protección. En la configuración por defecto, el error corregido del usuario con una línea base de { "50" } km es ≈ { "0.008" } m frente a ≈ { "24" } m sin corregir (una reducción de ~{ "3000" }×), y ≈ { "0" } con línea base cero.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = La <b>referencia independiente</b> es la consistencia interna: la cancelación de modo común es una <b>identidad algebraica exacta</b> (con <c1/>, error corregido < { "1e-6" } m con línea base cero; el término de reloj se cancela hasta la precisión de máquina con cualquier línea base), el residuo <b>crece de forma monótona con la línea base</b> y el nivel de protección es el <b>mismo algoritmo de DO-229E</b> frente al que está fijada la pila SBAS. El residuo de decorrelación espacial es un modelo geométrico de <b>primer orden</b>, <b>no</b> un modelo de decorrelación ajustado a partir de seguimiento lunar real.

# text
# c1: differential_corrections
# c2: corrected_user_range_errors
# c3: user_position_error_m
# c4: lunar_dgnss_protection_level
# c5: LunarDpntScenario
# c6: InternalConsistency
# c7: crate::sbas
# c8: lunar_dpnt::tests
# c9: sbas::sbas_protection_level
# c10: None
# c11: run_toml
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Referencia independiente: <c6/></b>: la identidad de cancelación diferencial de errores más la reutilización de la maquinaria de nivel de protección SBAS de DO-229E (<c7/>). Pruebas (<c8/>): con línea base cero, el error corregido del usuario y cada error de distancia corregido por satélite son ~{ "0" } (< { "1e-6" } m) y ≪ el error sin corregir; el término de reloj se cancela exactamente con cualquier línea base (caso de error de órbita nulo); el error corregido crece de forma monótona con la línea base mientras sigue ≪ al sin corregir con líneas base modestas; el diferencial supera al autónomo con un margen claro (> { "2" }×); el nivel de protección es igual a una llamada directa a <c9/> y escala con la σ residual; una geometría subdeterminada devuelve <c10/>; el escenario es determinista (con semilla) y se despacha mediante <c11/>. <b>Alcance honesto:</b> <b>MODELLED</b>: la cancelación de modo común es una identidad exacta, pero el residuo de decorrelación espacial es un modelo geométrico de <b>primer orden</b>, <b>NO</b> un modelo de decorrelación ajustado a partir de seguimiento lunar real, y esto <b>NO</b> está validado con datos reales. NovaMoon se menciona <b>solo como clase de sistema</b> (ilustrativa, de fuente pública, <b>no afiliada a la ESA</b>). No se afirma ningún TRL, herencia de vuelo ni aval de ninguna agencia.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Exportación de interoperabilidad lunar — CCSDS OEM + KIF alineados con LunaNet/IOAG con ajuste a la norma de ida y vuelta (<c1/>)

# text
# c1: crate::oem::OemFile::to_oem_string
# c2: crate::oem::parse_oem
# c3: crate::interchange::Envelope
# c4: export_lunar_oem
# c5: REF_FRAME
# c6: MOON_ME
# c7: MOON_PA
# c8: TIME_SYSTEM
# c9: LTC
# c10: TCL
# c11: UTC
# c12: CENTER_NAME
# c13: MOON
# c14: crate::lunar_service::LunarSat::position_mci
# c15: export_lunar_time_metadata
# c16: crate::lunar_time::lunar_rate_breakdown
# c17: export_kif_lunar
seg-39b875078d27 = El marco de referencia lunar, la escala de tiempo lunar y la efeméride lunar se exportan en <b>formas de intercambio alineadas con LunaNet/IOAG (IOAG: Grupo Asesor de Operaciones Interagencias) y basadas en CCSDS</b>. Esta fase <b>no</b> inventa un formato de transmisión: <b>reutiliza</b> el emisor y el analizador de CCSDS OEM (Orbit Ephemeris Message) { "2.0" } ya existentes en el crate (<c1/> / <c2/>) y el envoltorio del Kshana Interchange Format (<c3/>), reetiquetados para el contexto lunar. <c4/> fija el <c5/> del OEM al <b>marco del cuerpo lunar WGCCRE de la IAU { "2015" }</b> (<c6/> Tierra media o <c7/> ejes principales), <c8/> a la <b>escala de tiempo lunar</b> (<c9/> / <c10/> / <c11/>) y <c12/> a <c13/>, sobre una efeméride de muestra <b>ilustrativa, de fuente pública, de clase LCNS</b> (posiciones de <c14/>, velocidad por diferencia finita central). <c15/> emite un descriptor de tiempo lunar alineado con LunaNet/IOAG (identificador de escala, tasa secular en µs/día de <c16/>, la banda publicada de { "56" }–{ "59" } µs/día, superficie de referencia) que hace el ciclo de ida y vuelta mediante serde_json. <c17/> envuelve el OEM + el descriptor + la etiqueta de marco en el envoltorio KIF existente con la etiqueta de honestidad MODELLED.

# text
# c1: oem.rs
# c2: crate::oem::parse_oem
# c3: oem_conformance
# c4: REF_FRAME
# c5: MOON_*
# c6: TIME_SYSTEM
# c7: META_START … META_STOP
# c8: TIME_SYSTEM
# c9: parse_lunar_time_metadata
# c10: Envelope::parse
seg-bbfce5323abb = La <b>referencia independiente</b> es el ciclo de ida y vuelta / ajuste a la norma de campos. Como <c1/> incluye <em>ambas</em> direcciones, el OEM hace el ciclo de ida y vuelta mediante <c2/> (de vuelta a un segmento igual, con el marco/tiempo lunar y el número de estados conservados) <b>y</b> se comprueba de forma independiente mediante <c3/>, que verifica que está presente cada palabra clave de cabecera exigida por CCSDS/LunaNet, que <c4/> lleva un token lunar <c5/> y que <c6/> no está vacío, que se mantiene la estructura <c7/> y que las líneas de datos de posición+velocidad están bien formadas; devuelve un resultado estructurado más la lista de campos presentes/ausentes, de modo que una exportación rota (p. ej., un <c8/> omitido) se detecta y se nombra. Los metadatos de tiempo hacen el ciclo de ida y vuelta mediante <c9/>, y el envoltorio KIF lo hace mediante <c10/> hasta artefactos iguales que llevan la etiqueta MODELLED.

# text
# c1: export_lunar_oem
# c2: export_lunar_time_metadata
# c3: parse_lunar_time_metadata
# c4: export_kif_lunar
# c5: oem_conformance
# c6: LunarInteropScenario
# c7: InternalConsistency
# c8: crate::oem::parse_oem
# c9: crate::interchange::Envelope::parse
# c10: lunar_interop::tests
# c11: REF_FRAME
# c12: MOON_ME
# c13: MOON_PA
# c14: TIME_SYSTEM
# c15: LTC
# c16: TCL
# c17: CENTER_NAME = MOON
# c18: TIME_SYSTEM
# c19: oem_conformance
# c20: run_toml
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Referencia independiente: <c7/></b>: ciclo de ida y vuelta determinista (CCSDS OEM mediante <c8/>; KIF mediante <c9/>; metadatos de tiempo mediante serde_json) más ajuste a la norma de los nombres de campo frente a la semántica de campos publicada de CCSDS OEM + LunaNet/IOAG. Pruebas (<c10/>): el OEM exportado lleva los tokens lunares <c11/> (<c12/>/<c13/>) y <c14/> (<c15/>/<c16/>), <c17/>, el objeto y líneas de datos bien formadas; los metadatos de tiempo lunar hacen el ciclo de ida y vuelta (tasa/banda/referencia) y rechazan basura; el envoltorio KIF se serializa y deserializa hasta un valor igual con la etiqueta de honestidad MODELLED presente; un OEM deliberadamente roto (sin <c18/>) falla <c19/> y se informa como ausente; el escenario se despacha mediante <c20/>. <b>Alcance honesto:</b> los <b>nombres/unidades</b> de campo están alineados con normas <b>públicas</b> (CCSDS 502.0-B OEM, marcos lunares WGCCRE de la IAU { "2015" }, la LunaNet Interoperability Specification / la arquitectura lunar de IOAG); la exportación es <b>MODELLED</b>: el ciclo de ida y vuelta determinista + el ajuste a la norma de los nombres de campo es la referencia independiente, esto <b>NO</b> es una prueba certificada de ajuste a la norma de interoperabilidad, la efeméride es <b>ilustrativa, de fuente pública, no afiliada a la ESA</b>, y no se afirma ningún TRL, herencia de vuelo ni aval de ninguna agencia.

# text
seg-69a214b7236d = Predicciones preregistradas

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Una predicción preregistrada es un resultado MODELLED congelado antes de que exista ningún dato con el que puntuarlo, con el protocolo de puntuación fijado al mismo tiempo. No es una validación y no añade ninguna fila al registro. Cada una reside en <c1/>, con sus entradas congeladas, su resultado y sus hashes SHA-256, y <c2/> falla si se mueve cualquier byte congelado; un supuesto modificado se responde con una predicción nueva y fechada junto a la antigua, nunca editándola.

# text
seg-e65d79893e2c = Predicción

# text
seg-f9e2d4b52b79 = Congelada

# text
seg-dd68891f75e2 = Puntuada frente a

# text
seg-d5a09f26a028 = Cobertura de una estación de referencia lunar

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = exactitud, disponibilidad, cobertura y niveles de protección publicados de una estación diferencial lunar polar sur, por cualquier parte

# text
seg-4e7d9449a880 = aún no puntuada (sin resultados publicados)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Registro de representatividad de la demostración y de brechas hacia el vuelo (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = El resultado de una simulación solo sirve como evidencia si declara, de forma visible, a qué está anclado, qué supone y qué lo separa todavía de un sistema de vuelo. El registro de representatividad lo convierte en una salida de primera clase, comprobada por máquina: un registro <c1/> contiene los <c2/> externos de la demostración, sus supuestos modelados, sus <c3/> hacia el vuelo (cada uno con la fase/actividad que lo cerraría) y la banda de TRL para la que es representativo. Es el complemento por resultado de la matriz <c4/> a nivel de capacidad.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = La <b>referencia independiente</b> es un conjunto de invariantes de forma cerrada, impuestas por <c1/>: un registro <c2/> debe enumerar al menos un ancla <c3/> (una simulación no puede validarse frente a sí misma); un registro <c4/> debe enumerar al menos una brecha hacia el vuelo y no puede afirmar una banda de TRL representativa por encima de { "4" } (la maduración más allá de eso requiere evidencia de hardware/vuelo, que es una brecha y no una salida de simulación); la banda de TRL debe estar bien formada; y un registro <c5/> no debe afirmar nada. Estas invariantes ponen en práctica la disciplina de «representatividad justificada + brechas restantes hacia el vuelo claramente identificadas».

# text
seg-6b29111096ca = Registro de representatividad y de brechas hacia el vuelo

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: check
# c5: is_valid
# c6: report
# c7: to_json
# c8: InternalConsistency
# c9: verification
# c10: representativeness::tests
# c11: verification
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Referencia independiente: <c8/></b>: invariantes de honestidad de forma cerrada ligadas a la frontera entre estado/tipo de referencia independiente de <c9/>. Pruebas (<c10/>): un registro Validated sin ancla externa falla; un ancla interna (ReferenceImpl) no satisface Validated; un registro Modelled sin brecha falla; un registro Modelled por encima de TRL { "4" } falla; las bandas de TRL mal formadas se detectan; el registro se serializa a JSON con los campos esperados y produce un informe legible. <b>Alcance honesto:</b> el registro comprueba la <em>clasificación</em> de la evidencia de un resultado; no demuestra que las anclas nombradas se resuelvan en pruebas vivas (estas están curadas, exactamente igual que la matriz <c11/>); la afirmación de «comprobado por máquina» se limita a las invariantes de estado/ancla/brecha/TRL.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Evidencia unificada del compromiso cuántico frente a clásico (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Toda área de aplicación de PNT cuántico responde a la misma pregunta de la misma manera: fijar un marco de comparación (escenario + semilla + versión del motor), encaminar un candidato cuántico y una línea base clásica por una misma vía de código neutra, puntuarlos con figuras de mérito comunes e informar —con un intervalo de confianza y una etiqueta honesta de validado/modelado— de dónde gana lo cuántico y dónde no. <c1/> da a esa respuesta una única forma, de modo que las verticales de temporización, navegación y detección de anomalías emiten el <b>mismo</b> objeto reproducible y honestamente etiquetado. No reimplementa ningún compromiso: las cifras por FoM proceden de los motores existentes (<c2/>, <c3/> y los módulos de las verticales); esto es el contrato más la envoltura de reproducibilidad/representatividad, construida sobre el registro de representatividad y las etiquetas de verificación.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = La <b>referencia independiente</b> son identidades de beneficio/ganador de forma cerrada más una envoltura fiel de la salida existente del compromiso. <c1/>: la razón de beneficio tiene la polaridad correcta (orientada de modo que <c2/> signifique siempre que el lado cuántico es mejor, tanto para el holdover, donde más es mejor, como para las FoM de error, donde menos es mejor); un objeto de evidencia construido a partir de un <c3/> real reproduce sus razones de beneficio; la evidencia deshonesta se rechaza (una representatividad Modelled sin brecha, o una FoM <c4/> cuyo registro de compromiso no lleva ancla externa); el JSON es determinista y lleva los campos de marco/semilla/motor/FoM/representatividad.

# text
seg-ae87cea429ba = Evidencia del compromiso cuántico frente a clásico

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Referencia independiente: <c5/></b>: identidades de beneficio/ganador de forma cerrada + envoltura fiel de <c6/>; honestidad ligada al registro de representatividad y a la frontera entre estado/tipo de referencia independiente de la verificación. Pruebas (<c7/>) como arriba. <b>Alcance honesto:</b> el arnés normaliza <em>cómo</em> se informa y se reproduce un compromiso; la física subyacente de cada FoM es la que aporte el motor contribuyente, con su propia etiqueta de validado/modelado; <c8/> no eleva una FoM modelada a validada.

# text
# c1: src/quantum_devices.rs
seg-ce13223e04d0 = Biblioteca de modelos de error de dispositivos cuánticos (<c1/>)

# text
# c1: DeviceCard
# c2: holdover::QuantumClockClass
# c3: clock_state::ClockClass
# c4: quantum_trade
# c5: crossover
# c6: timetransfer_adv
# c7: σ_t ≈ jitter/√(R·τ)
# c8: R
# c9: τ
# c10: √(1 + dark/R)
seg-c206fc7d58d6 = Un único lugar que expone los dispositivos de PNT cuántico entre los que el demostrador hace compromisos —relojes ópticos / de iones atrapados / de iones de mercurio, relojes de referencia clásicos, el interferómetro de átomos fríos y los enlaces de transferencia de tiempo—, cada uno como una <c1/> que lleva su especificación principal y un registro de representatividad. La mayor parte de la física de los dispositivos se <b>reutiliza</b> (estabilidades de reloj de <c2/> y <c3/>; el interferómetro de átomos fríos de <c4/>/<c5/>; enlaces clásicos ópticos/RF de <c6/>). El único modelo realmente nuevo es el <b>enlace de transferencia de tiempo por entrelazamiento / fotón único</b>, cuya precisión de temporización está limitada por el ruido de disparo: <c7/> en la tasa de coincidencias detectadas <c8/> y la integración <c9/>, degradada por una penalización de cuentas oscuras <c10/> y con un suelo fijado por un sistemático irreducible.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = La <b>referencia independiente</b> son los coeficientes publicados y reutilizados de relojes/CAI más identidades de forma cerrada de ruido de disparo/pérdidas. <c1/>: el orden de estabilidad de reloj reutilizado es razonable (red óptica < ion de mercurio < CSAC en σ_y({ "1" } s)); la precisión por entrelazamiento mejora como <c2/> ({ "4" }× de integración reduce a la mitad σ) cuando está limitada por el ruido de disparo; la tasa de coincidencias detectadas cae { "10" }× por cada { "10" } dB de pérdida del enlace; las cuentas oscuras degradan la precisión de forma monótona; el suelo sistemático acota la precisión por debajo; cada ficha de dispositivo es un registro de representatividad válido y Modelled.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Referencia independiente: <c5/></b>: coeficientes publicados reutilizados de relojes/CAI + identidades de forma cerrada de ruido de disparo/pérdidas para el enlace por entrelazamiento. Pruebas (<c6/>) como arriba. <b>Alcance honesto:</b> los parámetros de los dispositivos de reloj/CAI se reutilizan de los modelos de coeficientes publicados ya existentes en el motor; el modelo del enlace por entrelazamiento es MODELLED a partir del comportamiento publicado de sincronización cuántica de relojes, con valores ilustrativos de fuente pública de tasa de pares/eficiencia/pérdidas: <b>no</b> está validado frente a un enlace medido, y el hardware real de fuente/canal/detector es una brecha declarada hacia el vuelo.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Temporización cuántica de confianza — cadena de extremo a extremo, difusión segura, anomalías + compromiso (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = El escenario <c1/> compone la cadena de temporización que necesita un demostrador de PNT cuántico: un presupuesto de tiempo de usuario de extremo a extremo (error de inercia del reloj de referencia y precisión de temporización del enlace combinados en cuadratura) para una cadena <b>cuántica</b> (reloj de red óptica + enlace por entrelazamiento/fotón único) frente a una cadena <b>clásica</b> (CSAC + enlace RF bidireccional); un <b>nivel de protección de temporización</b> (TPL, reutilizado de <c2/>) que acota el error de tiempo no detectado; una <b>figura de mérito de seguridad frente a ataques de retardo/repetición</b> <c3/> con una tasa de falsas alarmas indicada (reutilizada de <c4/>); una <b>probabilidad de detección de anomalías de reloj + latencia de detección de cambios por CUSUM (suma acumulada)</b>; y la comparación cuántico frente a clásico como <c5/> honesta que lleva un registro de representatividad + brechas hacia el vuelo.

# text
# c1: detection::analytic_pd
# c2: analytic_pmd
# c3: timetransfer_chain::tests
# c4: is_honest()
seg-6fa095264bdc = La <b>referencia independiente</b> es un presupuesto en cuadratura de forma cerrada sobre núcleos reutilizados y validados por separado (ADEV frente a Stable32/NIST; la cota del TPL; <c1/>/<c2/>). <c3/>: la precisión cuántica mejora con el tiempo de integración; la cadena cuántica puede ganar <em>y</em> puede perder en la FoM de precisión (con honestidad: no es una victoria universal; un enlace con muchas pérdidas invierte el resultado); el nivel de protección es finito y positivo; la FoM de seguridad está en [{ "0,1" }] y crece con el retardo del ataque; la probabilidad de detección de anomalías es monótona con la magnitud del fallo; y la evidencia del compromiso es internamente honesta (<c4/>).

# text
seg-42a7d1170cc3 = Temporización cuántica de confianza (cadena + difusión segura + anomalías + compromiso)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referencia independiente: <c5/></b>: presupuesto en cuadratura de forma cerrada sobre núcleos validados reutilizados (ADEV/Stable32-NIST, cota del TPL, Pd/Pmd analíticas de detección); honestidad ligada al registro de representatividad. Pruebas (<c6/>) como arriba. <b>Alcance honesto:</b> los parámetros de reloj/enlace son ilustrativos, de fuente pública; el enlace por entrelazamiento es el modelo MODELLED limitado por el ruido de disparo de <c7/>; esto modela la <em>clase</em> de sistema de temporización de confianza: <b>no</b> está validado frente a un enlace de extremo a extremo medido, y el hardware real de reloj/enlace/canal espacial es una brecha declarada hacia el vuelo; no se afirma ningún TRL, herencia de vuelo ni certificación.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = Navegación cuántica sin GNSS (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = El escenario <c1/> compara la navegación por estima durante una interrupción de GNSS con un presupuesto inercial <b>cuántico</b> (un acelerómetro de interferómetro de átomos fríos, reutilizado de <c2/>/<c3/>, cuyo suelo de ruido blanco de CAI está validado dentro de ~{ "2" } órdenes de magnitud respecto a Freier et al. { "2016" }) frente a un INS <b>clásico</b> de grado de navegación. Informa del crecimiento del error de posición durante la inercia, del tiempo de holdover hasta un umbral de posición y del compromiso cuántico frente a clásico como <c4/> honesta. La observabilidad se declara con honestidad: sin ninguna solución externa durante la interrupción, el sesgo del acelerómetro es inobservable, por lo que el error de posición crece sin cota (≈ ½·sesgo·t² más un término de paseo aleatorio de velocidad); un sensor cuántico de menor sesgo <em>ralentiza</em> ese crecimiento pero no cierra la brecha: solo lo hace una solución externa.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = La <b>referencia independiente</b> son los presupuestos inerciales reutilizados (<c1/>/<c2/>, ambos implementan el trait <c3/>) más identidades de deriva de forma cerrada. <c4/>: el presupuesto cuántico supera al clásico en una interrupción larga (menor error, mayor holdover); el error crece con la duración de la interrupción en ambos (la brecha de observabilidad); la ventaja depende de la interrupción y no es un factor de ganancia constante (la curva cuántica está dominada por el ruido en inercias cortas y por el sesgo en las largas); la evidencia del compromiso es internamente honesta.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Referencia independiente: <c5/></b>: presupuestos inerciales reutilizados (CAI validado por reutilización ~{ "2" } órdenes frente a Freier { "2016" }; deriva clásica de forma cerrada); honestidad ligada al registro de representatividad. Pruebas (<c6/>) como arriba. <b>Alcance honesto:</b> una comparación estática de presupuestos de navegación por estima, no un filtro dinámico sobre trayectorias reales; se declara que el sesgo es inobservable sin una solución externa; los parámetros de los dispositivos son ilustrativos, de fuente pública; modela la <em>clase</em> de navegación cuántica sin GNSS: el hardware real de IMU de átomos fríos, una plataforma dinámica y el entorno de vuelo son brechas declaradas hacia el vuelo; no se afirma ningún TRL/vuelo/certificación.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Detección de fallos / anomalías en sistemas de PNT cuántico (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = El escenario <c1/> define un catálogo etiquetado de fallos de PNT cuántico (salto de frecuencia del reloj, deriva, pérdida de enganche; sesgo escalonado del sensor, caída de señal), puntúa un estadístico de detección en ventanas nominales frente a ventanas con fallo, e informa de la discriminación del detector como un AUC de la ROC y de un fallo mínimo detectable con una tasa de falsas alarmas fija. El enfoque cuántico frente a clásico: una referencia de reloj cuántico más estable reduce el ruido σ del monitor, por lo que detecta fallos más pequeños; se emite como <c2/> honesta con un registro de representatividad.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = La <b>referencia independiente</b> es un AUC de forma cerrada para el estadístico de detección gaussiano (nominal <c1/>, fallo <c2/> ⇒ <c3/>), comprobado de forma cruzada con el <c4/> validado externamente (validado frente a scikit-learn) y con los umbrales analíticos de <c5/>. <c6/>: el AUC analítico coincide con valores conocidos ({ "0.5" } en μ={ "0" }, →{ "1" } para μ/σ grande, monótono); el IC de AUC por bootstrap empírico acota la forma cerrada; el monitor cuántico tiene mayor AUC y un fallo mínimo detectable menor; la ventaja desaparece con fallos enormes (ambos detectan a la perfección: no es un margen universal); el catálogo tiene cinco clases etiquetadas; el compromiso es internamente honesto.

# text
seg-9dda4ab0647a = Detección de fallos/anomalías en PNT cuántico

# text
# c1: FaultKind
# c2: QuantumAnomalyScenario
# c3: Report
# c4: analytic_auc
# c5: min_detectable_fault
# c6: kind="quantum-anomaly-detect"
# c7: InternalConsistency
# c8: eval_stats
# c9: detection
# c10: quantum_faults::tests
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Referencia independiente: <c7/></b>: AUC gaussiano de forma cerrada comprobado de forma cruzada con el AUC por bootstrap de <c8/>, validado externamente (frente a scikit-learn), y con los umbrales analíticos de <c9/>. Pruebas (<c10/>) como arriba. <b>Alcance honesto:</b> el estadístico de detección es un modelo gaussiano, no telemetría real; el catálogo de fallos es sintético etiquetado; los niveles de ruido del monitor cuántico/clásico son ilustrativos, de fuente pública; modela la <em>clase</em> de detección de anomalías de PNT cuántico: la telemetría real de hardware con etiquetas de referencia es una brecha declarada hacia el vuelo; no se afirma ningún TRL/vuelo/certificación.

# text
seg-24ad75143bed = Ajuste a las normas — formatos de intercambio, presupuesto de enlace e integridad (comprobaciones con referencia independiente externa)

# text
seg-9d31773e0ecd = Estas normas se validan recuperando los <b>ejemplos resueltos literales / valores de referencia publicados en las propias normas</b> (o en una implementación de referencia independiente), no mediante el ciclo de ida y vuelta propio de Kshana. Recuperar el ejemplo de anexo de una norma es la mejor comprobación de ajuste a la norma disponible para un analizador de formatos de intercambio.

# text
seg-7ec3d508c64f = Referencia independiente externa

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/>: <c2/> recupera las épocas exactas y los vectores de estado X/Y/Z/Ẋ/Ẏ/Ż del ejemplo KVN de OEM de <b>CCSDS 502.0-B-3, Anexo G §G6, Figura G-11</b> («OEM Example with No Acceleration, No Covariance», p. G-10), con los dos segmentos de efemérides, incluidos los valores de origen con ceros a la izquierda (<c3/>). El archivo de prueba <c4/> se reproduce carácter por carácter del Libro Azul oficial (no se incluyen los marcadores editoriales «< intervening data records omitted here >», que no son registros OEM válidos).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/>: <c2/> recupera los { "41" } registros RANGE (el primero { "3198.03679519614" } km, el último { "3270.46440460551" } km) y los metadatos del ejemplo KVN de TDM de <b>CCSDS 503.0-B-2, Anexo E, Figura E-9</b> («Range Data with TIMETAG_REF=TRANSMIT», p. E-9). El archivo de prueba <c3/> es literal del Libro Azul. (Esta es la referencia independiente del Libro Azul publicado, junto al ciclo de ida y vuelta ya existente de <c4/> escrito a mano en <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/>: el codificador reproduce los vectores de prueba de la cabecera primaria a nivel de byte de la <b>biblioteca <c2/></b> independiente (us-irs/spacepackets-py, <c3/>), p. ej. <c4/> y el <c5/> de todo máximos, más el caso canónico de telemetría (TM) con todo unos, cada uno con ciclo de ida y vuelta mediante la decodificación. Anchuras/orden de los campos de bits según <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (presupuesto de enlace, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/>: la cadena de FSPL (pérdida en el espacio libre) y C/N₀ reproduce la tabla publicada de control de diseño de telemetría de espacio profundo de <b>J. H. Yuen (ed.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Tabla 1-1</b>: el enlace descendente en banda X de Galileo ({ "8420.43" } MHz) a { "6.37" } AU: pérdida en el espacio libre <b>{ "290.54" } dB</b> (<{ "0.05" } dB) y <b>Pr/N₀ = { "54.6" } dB-Hz</b> recibido (<{ "0.2" } dB). Los centros de banda quedan dentro de las asignaciones de enlace descendente de espacio profundo de DSN/CCSDS-401 (DSN 810-005 Módulo { "201" }). Los <em>parámetros de misión por defecto</em> siguen siendo representativos (no un transpondedor calibrado); lo que se fija es la <em>ecuación</em> del enlace.

# text
seg-c2cee7d5c7b1 = Normas GNSS — estado de la referencia independiente externa y las brechas honestas que quedan:

# text
seg-d8f653b3c955 = Estado y salvedad honesta

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Núcleo, geometría y nivel de protección de ARAIM validados externamente.</b> El <em>núcleo</em> de detección —el umbral de detección de fallos χ², la no centralidad de detección omitida de χ² no central y los multiplicadores K de ley normal— reproduce <b>SciPy</b> (<c1/>, { "171" } casos, ≤ { "1e-6" } rel), y la geometría que lo envuelve reproduce <b>gnss_lib_py</b> (DOP). El <em>valor</em> del nivel de protección (PL) de ARAIM también queda ahora fijado: frente al «ejemplo numérico LPV-200 (LPV: aproximación con guiado vertical y prestaciones de localizador)» del ADD (Documento de Descripción de Algoritmos) v3.1 de referencia de ARAIM del WG-C (WG: Grupo de Trabajo), <c2/> / <c3/> dan VPL { "18.2926" } m frente a { "18.3" } m, HPL { "13.4063" } m frente a { "13.45" } m y σ_v,acc { "1.3694" } m frente a { "1.3694" } m, dentro de la propia <c4/> = { "0.05" } m de la referencia (el tipo <c5/>). Alcance: modos de fallo de hasta un satélite o una constelación (<c6/>); los subconjuntos de fallos de eventos múltiples y la exclusión no están implementados, y RAIM clásico sigue sin tener <b>ningún vector de prueba publicado canónico de entrada→HPL</b>. Véase <a1><c7/></a1>.

# text
# c1: sbas_protection_level
# c2: zsiki/rtklib_ws
# c3: waasprotlevels()
# c4: tests/sbas_reference.rs
# c5: core/filter.c
# c6: K_H,PA=6.0
# c7: K_V=5.33
# c8: K_H,NPA≈6.18
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-e6a47dfb7e54 = <b>Algoritmo del nivel de protección validado ahora externamente.</b> Dados (el, az, σ) por satélite, el <c1/> de kshana reproduce la <b>bifurcación SBAS-PL de RTKLIB</b> (<c2/> <c3/>, Siki y Takács { "2017" }, «DO-229D Appendix J»), alimentada con la <b>propia</b> σ de esa herramienta calculada a partir de mensajes difundidos <b>reales de EGNOS</b> + RINEX real de BUTE, con una diferencia de <b>HPL < { "2e-3" } m</b> en { "6" } épocas (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) confirmó la misma convención. Los factores K (<c6/>, <c7/>, <c8/>) coinciden con DO-229E, Apéndice J. <b>Qué está validado y qué no:</b> esto fija el <em>algoritmo</em> del PL (entra σ → salen HPL/VPL); el <em>modelado</em> aguas arriba de σ a partir de los mensajes brutos UDRE/GIVE queda fuera del alcance de kshana: ahí es donde las herramientas independientes de <em>cadena completa</em> siguen discrepando en metros con datos reales. K_V se igualó al valor redondeado { "5.33" } de la referencia independiente (el <c9/> exacto de kshana → VPL ~{ "0.06" } % menor; la componente vertical se valida sin factor K como <c10/>).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Modelo difundido validado externamente.</b> El modelo de Klobuchar en L1 reproduce el <c1/> de <b>RTKLIB</b> (<c2/>, < { "1e-4" } m): <em>paridad de implementación</em> con la referencia abierta de facto, ya que no existe ningún ejemplo resuelto oficial de <em>verdad medida</em>. El lector de mapas de TEC de IONEX ya existe (<c3/>, probado con pruebas unitarias); la brecha restante es una comprobación cruzada del mismo frente a un producto GIM real, no el modelo difundido. Véanse las filas de Klobuchar en <a1>Afirmaciones frente a realidad</a1>.

# text
seg-fa3058dffb2a = Código de ensanchamiento GPS L1 C/A (IS-GPS-200)

# text
seg-53ac231770fb = Generación de código validada externamente.

# text
# c1: src/sdr.rs
# c2: ca_first_ten_chips_match_is_gps_200_octal
# c3: navsignal
seg-04db7c613bd5 = <c1/> (<c2/>): el generador de código C/A con LFSR G1/G2 (registro de desplazamiento con realimentación lineal) reproduce exactamente las <b>asignaciones de fase de código publicadas en la Tabla 3-Ia de IS-GPS-200</b>: el octal de los diez primeros chips para PRN (ruido pseudoaleatorio) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }). Esto fija la <b>secuencia de chips del código de ensanchamiento</b> frente a la especificación de interfaz de GPS; las piezas circundantes de modulación, separación espectral y seguimiento de código con DLL (lazo de seguimiento de retardo) (<c3/>) siguen siendo MODELLED.

# text
seg-e5f1b960777a = Temporización para redes, espectro, el sistema solar, constelaciones, campañas y LEO-PNT

# text
# c1: VERIFICATION-MATRIX.md
seg-c5bf3b23d688 = Las capacidades añadidas en la línea { "0.28" } se califican fila por fila en el documento generado <a1><c1/></a1>; esta sección resume cuáles de ellas llevan una referencia independiente externa. Una fila es VALIDATED solo con una referencia independiente externa; todo lo demás es MODELLED.

# text
seg-d791a48b3895 = Capacidad (tipo de escenario)

# text
seg-d4779be2efd8 = Referencia independiente externa, o por qué sigue siendo modelada

# text
# c1: telecom-timing
seg-0d7bb0fc1c5e = MTIE (error máximo de intervalo de tiempo) y TDEV (desviación de tiempo) de telecomunicaciones sobre una serie de holdover (<c1/>)

# text
# c1: tests/telecom_timing_reference.rs
# c2: TELECOM-TIMING.md
seg-18894b55b6c1 = <c1/>: { "17" } factores de promediado de MTIE y { "12" } de TDEV sobre una serie de holdover de reloj a escala de chip de { "2" } 048 muestras incluida en el repositorio, frente a allantools { "2024.06" }, con error relativo < { "1e-12" } / < { "1e-9" }. Los veredictos PASS/FAIL de la máscara de la UIT-T (Unión Internacional de Telecomunicaciones, Sector de Normalización de las Telecomunicaciones) y los ajustes predefinidos de osciladores según hoja de datos siguen siendo MODELLED. Véase <a1><c2/></a1>.

# text
# c1: slot-timing
seg-ff9cb967ae08 = Predicción de holdover a partir de un registro de reloj medido (<c1/>)

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
seg-7821227795d8 = <c1/>: se ajusta sobre el primer tercio del registro real del cesio 5071A, se predice el instante en que se supera un sigma en seis umbrales y se mide sobre los dos tercios reservados; umbral: un factor de { "1.5" } en cualquier sentido, con cocientes observados de { "0.84" } a { "1.03" }. El presupuesto de guarda de ranura y la cadencia de fijación construidos sobre ello siguen siendo MODELLED.

# text
# c1: spectrum
seg-2667e3ddf829 = Densidades espectrales de potencia en banda L en forma cerrada y separación espectral (<c1/>)

# text
# c1: navsignal
seg-1a0c6ef49f98 = Formas cerradas de <c1/> frente a valores publicados (fila de la matriz "Closed-form L-band signal power spectral densities…"). La cascada con J/S por banda (relación interferente-señal) y C/N0 efectiva (densidad portadora-ruido), y la entrada/salida SigMF (Signal Metadata Format), siguen siendo MODELLED.

# text
# c1: solar-system
seg-46278e9c03c1 = Posiciones de los planetas a partir de los elementos de Standish del JPL (Jet Propulsion Laboratory) y tiempo de luz entre cuerpos (<c1/>)

# text
# c1: tests/solar_system_standish_preregistered.rs
# c2: tests/solar_system_standish_earth_icrf_preregistered.rs
# c3: tests/solar_system_light_time_solver_preregistered.rs
# c4: tests/solar_system_horizons_reference.rs
# c5: body-pnt
seg-43cfeb9f2403 = { "0.30" }, preregistrado frente a JPL Horizons (DE441): <c1/> y <c2/>, RMS por planeta y componente como máximo igual a la cifra de la Tabla { "8.10.1" } del Explanatory Supplement (peor caso { "0.778" }), con la división de la Tierra y la rotación ICRF incluidas; <c3/>, el solucionador de tiempo de luz sobre posiciones DE441 dentro de { "1e-6" } s del tiempo de luz de Horizons (peor caso { "6.7e-9" } s). La comparación anterior con el doble del valor nominal (<c4/>), cuyo umbral se fijó después de la primera comparación, se conserva como regresión no determinante. Urano/Neptuno de la Tabla { "1" }, Plutón, las lunas, las constantes de los cuerpos y <c5/> siguen siendo MODELLED.

# text
# c1: constellation-design
seg-b96d8ea13c87 = Geometría Walker y ranuras publicadas de GPS, Galileo y GLONASS (sistema mundial de navegación por satélite); dilución de precisión global de GPS (<c1/>)

# text
# c1: constellation::tests
seg-85c293b8d235 = <c1/>: Walker 24/3/1 reproduce la tabla de definición del servicio abierto de Galileo con { "1e-9" }°, la fórmula de ranuras del documento de control de interfaz de GLONASS y los cruces ecuatoriales de GPS; la mediana de HDOP de la línea base de GPS es { "0.940" } frente a { "0.94" } del estándar de prestaciones del Servicio de Posicionamiento Estándar. Los mapas de cobertura multiconstelación arbitrarios alrededor de cualquier cuerpo siguen siendo MODELLED.

# text
# c1: campaign
seg-f0187be4b97f = Campañas: misiones encadenadas, barridos, conjuntos de Monte Carlo, ejecuciones con condiciones compartidas (<c1/>)

# text
# c1: tests/campaign_composition_reference.rs
seg-b5c45fc12e5f = <c1/> ({ "11" } tests): una campaña de una sola fase reproduce la ejecución independiente byte a byte, un barrido de un solo nodo lee el mismo número y un conjunto con semilla es estable byte a byte. Son identidades de composición, no una referencia independiente externa.

# text
seg-bc25d20125e7 = Física del enlace LEO (órbita terrestre baja): coeficientes de lluvia ITU-R (Sector de Radiocomunicaciones de la UIT) P.838, atenuación por lluvia y centelleo P.618, pérdida de penetración en edificios P.2109, ionosfera de primer orden, Doppler máximo

# text
# c1: tests/leo_link_reference.rs
# c2: tests/leo_doppler_reference.rs
seg-b1f3bd37d169 = <c1/>, <c2/>: las propias tablas de las Recomendaciones UIT-R y los ejemplos de validación de la Comisión de Estudio { "3" } (incluidos en el repositorio con su fuente y fecha de obtención), el cociente de retardo de grupo de IS-GPS-200 para la ionosfera, y la tabla publicada de Doppler máximo de Leclere, Marathe y Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

# text
# c1: leo-navmsg
seg-492917f11386 = Mensaje de navegación LEO: algoritmo de usuario de efemérides de difusión del ICD (documento de control de interfaz) de Galileo, CRC-24Q (comprobación de redundancia cíclica de 24 bits), pesos globales promedio de SISRE (error de distancia de la señal en el espacio) (<c1/>)

# text
# c1: tests/leo_navmsg_reference.rs
seg-514a7da01582 = <c1/>: el algoritmo de usuario de Galileo reproduce RTKLIB (una biblioteca de código abierto de posicionamiento cinemático en tiempo real) con { "1" } mm sobre cuatro efemérides de difusión reales de Galileo; CRC-24Q da el valor de comprobación de catálogo 0xCDE703 y los bytes de comprobación de la trama de ejemplo { "1005" } de RTCM (Radio Technical Commission for Maritime Services); los pesos de SISRE reproducen la tabla publicada de MEO/GEO. El ajustador, la actualización a mitad de pasada, la codificación binaria, el texto de estilo RINEX-4/CSV (valores separados por comas) y los modelos de efemérides seleccionables siguen siendo MODELLED.

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
# c4: leo-ppp
# c5: ntn-positioning
seg-94bbcd43e03a = Diseño de señal LEO, pasada y presupuesto de enlace, Doppler y posicionamiento conjunto GNSS+LEO, convergencia de PPP (posicionamiento preciso de punto), posicionamiento 5G NTN (red no terrestre), transferencia de tiempo LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/leo_signal_reference.rs
# c2: tests/leo_fusion_scenarios.rs
seg-4c37a8cfac87 = <c1/>, <c2/>: formas cerradas, coherencia del filtro (por ejemplo, el NEES promediado por ejecución del filtro PPP dentro de su banda del { "95" }%) y comparaciones de tendencias publicadas; sin datos de campo.

# text
# c1: leo-pnt-chain
seg-91cf4e399f0a = Un sistema LEO-PNT de extremo a extremo (<c1/>)

# text
# c1: tests/leo_pnt_chain.rs
seg-fb947da2e8b4 = <c1/>: cada valor transferido es igual a la salida propia de la etapa anterior, y cambiar una entrada anterior modifica todas las cifras posteriores que dependen de ella.

# text
seg-7e230aa73770 = Resiliencia LEO y verticales (spoofing por Doppler y por coherencia entre bandas, sondeo de la ionosfera)

# text
# c1: tests/leo_resilience_verticals.rs
# c2: RESILIENCE-CROSSWALK.md
seg-ab2542cfc295 = <c1/> ({ "10" } tests). Los escenarios de resiliencia y de verticales se enumeran en <a1><c2/></a1>.

# text
# c1: tests/interop_formats.rs
# c2: INTEROP.md
# c3: tests/animation.rs
# c4: tests/advanced_report.rs
# c5: tests/advanced_report_cli.rs
# c6: result.json
seg-2d3ead293658 = Las salidas que son representaciones y no evidencias tienen tests pero no una fila de la matriz: las exportaciones de intercambio (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemérides STK (Systems Tool Kit), SigMF (Signal Metadata Format)), cada una releída por un validador escrito a partir de la especificación del formato (<c1/>, { "13" } tests; véase <a1><c2/></a1>); las animaciones (<c3/>: repeticiones idénticas byte a byte, recuentos exactos de fotogramas, SVG (Scalable Vector Graphics) bien formado, ninguna dirección externa en el reproductor HTML (HyperText Markup Language)); y el informe de ejecución (<c4/>, <c5/>: cada escenario incluido genera informe sin ninguna sección vacía ni valor de relleno, las etiquetas coinciden con la matriz y el comando registrado reproduce <c6/> y el informe byte a byte).

# text
seg-903e4e51dda1 = Envolvente de operación

# text
# c1: tests/scenario_coverage.rs
seg-e226ad523a3d = Cada paquete se ejercita a lo largo de su envolvente de entrada declarada mediante <c1/>, que comprueba que toda salida numérica es finita (sin NaN/Inf (NaN: no es un número)) y acotada. La tabla indica el intervalo de entrada probado por paquete, el comportamiento esperado de la salida y el test que lo cubre.

# text
seg-8bd4f586f3c7 = Entrada barrida

# text
seg-3ebc1201a545 = Intervalo probado

# text
seg-a1198518d667 = Salida esperada

# text
seg-7bf563f5420a = Test de cobertura

# text
# c1: threshold_ns
seg-4906c027a805 = <c1/> (especificación de temporización)

# text
seg-d91e18ce3773 = { "1" } – { "500" } ns

# text
seg-10cf765fdd75 = FoM de holdover/temporización/seguridad finitas

# text
seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (de átomos fríos a MEMS (sistemas microelectromecánicos) básico)

# text
seg-456c32a126a2 = RMS/p95 de posición finitos y acotados

# text
# c1: mask_deg
seg-dae96fd3a01b = <c1/> (máscara de elevación)

# text
seg-a54c3c8933c6 = DOP/disponibilidad finitos; acotados

# text
seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

# text
seg-b6d0d587046e = P_md / seguridad finitas, acotadas

# text
seg-fda0b32d7784 = { "10" } – { "1000" } m

# text
seg-132fdea2270f = holdover de temporización/posición finito

# text
seg-c9099375b99f = órbita (real)

# text
# c1: gps-ops
seg-952b94eda0ff = TLE reales de <c1/> de Celestrak

# text
seg-60009932477c = instantánea de 30 satélites, con suma de comprobación estricta

# text
seg-deb16d50741e = solo se carga con sumas de comprobación válidas; geometría acotada

# text
seg-c46d726e35b3 = reloj (flicker)

# text
# c1: flicker_floor
seg-15939085bf3a = <c1/> activado/desactivado

# text
seg-504a95f55b88 = { "0" } frente a { "1e-12" }

# text
seg-e1cce0c2028e = activar el suelo 1/f <b>empeora</b> la deriva en p95 de temporización

# text
seg-bdd4e56bdef9 = fusión (realismo)

# text
# c1: accel.bias
seg-09af9dd78fe3 = <c1/> { "0" } frente a { "5.88e-7" } m/s²

# text
seg-0a6723be642c = cero frente a un valor realista distinto de cero

# text
seg-a9eb04be2b9f = el filtro sigue convergiendo, dentro de { "3" }× el error con sesgo cero

# text
seg-2a839953aa6a = Las filas de flicker-FM y de sesgo de fusión cierran dos carencias concretas de realismo: los términos de ruido están <b>desactivados por defecto pero afectan demostrablemente a la salida cuando se activan</b>, y el filtro de fusión conjunto <b>no depende de que los sesgos se anulen</b>: converge también con un sesgo residual realista de calidad de átomos fríos.

# text
seg-4f0e9f9d4cdf = Las ejecuciones cuánticas y clásicas usan ahora semillas independientes del RNG (generador de números aleatorios) (semilla clásica = semilla + 0x9e3779b97f4a7c15), de modo que sus realizaciones de ruido no están correlacionadas; corregido tras la revisión.

# text
# c1: holdover_s
seg-3b6b785f401a = <c1/> tiene en cuenta los segmentos: las líneas temporales de interrupción se dividen en segmentos contiguos en cada readquisición de GNSS y el valor notificado es la deriva del peor caso (la más corta) entre ellos. Sigue estando acotado por la resolución de la rejilla temporal (es una cota inferior).

# text
seg-4a830113b13d = La resincronización de la transferencia de tiempo ISL modela la incertidumbre residual del enlace como un jitter nuevo de media cero en cada paso de medida, más un reanclaje en el intervalo configurado.

# text
seg-30c4d89aa433 = Afirmaciones frente a realidad: referencia rápida

# text
seg-27a22de7b8c0 = La lista de comprobación de un revisor hostil. Para cada término que pueda leerse como algo más de lo que es: qué hace Kshana hoy y dónde se sitúa en la hoja de ruta la versión real.

# text
seg-759eb0cfafe4 = Término que puede encontrar

# text
seg-6a2d3691d642 = Qué es realmente hoy

# text
seg-bbd0145bfb95 = Qué <b>no</b> es (todavía)

# text
seg-a6fdb038b003 = "simulador PNT híbrido cuántico/clásico"

# text
seg-4421f8bd0967 = un simulador estocástico clásico impulsado por coeficientes de Allan/ruido publicados de sensores cuánticos

# text
# c1: QUANTUM-MODELS.md
seg-3885661aafff = física cuántica de primeros principios (fase de Mach–Zehnder, ruido de proyección, sistemáticos); véase <a1><c1/></a1>

# text
seg-1d28debd0302 = "fusión de Kalman conjunta" / paquete de fusión

# text
# c1: fusion
seg-d13beba21ba7 = el paquete ejecutable <c1/> observa el reloj y la posición <b>por separado</b> (una fijación directa de tiempo y una fijación directa de posición), para lo cual el estimador óptimo es genuinamente diagonal por bloques: dos filtros de dos estados con una FoM combinada

# text
# c1: fusion::coupled::CoupledPntFilter
# c2: [pos,vel,phase,freq]
seg-25c2fe6fa6d3 = un filtro <em>acoplado</em> para el caso de <b>pseudodistancia</b> <b>existe</b> ya como <c1/> (4 estados apilados <c2/>, covarianza cruzada entre bloques distinta de cero, validado con NEES) pero <b>todavía no está integrado en el paquete ejecutable</b>, y el paquete es de <b>1 DOF (un grado de libertad)</b>: la extensión 3-D de 8 estados es trabajo futuro

# text
# c1: spoof
seg-5cce1ca5b86f = FoM de seguridad (tipo de escenario <c1/>)

# text
# c1: 1 − P_md
# c2: P_fa
# c3: P_md
seg-d55c30f63023 = <c1/> de un <b>detector estocástico de spoofing de tiempo</b>: una prueba χ²₁ bilateral / de Neyman–Pearson sobre un estadístico de monitor asistido por reloj, con umbral fijado a partir de una <c2/> objetivo, con <c3/> evaluada <b>a la magnitud de la especificación</b> tanto en forma cerrada como por Monte Carlo (que concuerdan hasta unas pocas veces 1/√N)

# text
# c1: INTEGRITY.md
seg-dbf2039a4a8e = un detector RAIM/ARAIM multisatélite; véase <a1><c1/></a1>; el estadístico del monitor es un modelo gaussiano con el σ derivado de la PSD del reloj, no una correlación a nivel de señal

# text
seg-32bcb801e49c = "detección de spoofing asistida por reloj"

# text
seg-58e4d22075e9 = un monitor de discrepancia temporal de <b>un solo reloj</b> (estadístico gaussiano, σ de la PSD del reloj), NO un RAIM multi-SV (SV: vehículo espacial, es decir, un satélite)

# text
seg-f3f6f95bc559 = RAIM multi-SV en el dominio de la distancia con niveles de protección

# text
seg-a5faedaab13e = P_md del detector de spoofing (forma cerrada frente a Monte Carlo)

# text
# c1: Φ
# c2: P_md
# c3: mc_runs
# c4: src/spoof.rs
# c5: src/detection.rs
seg-0362489c341a = la <c2/> analítica basada en <c1/> y la estimación empírica de <c3/> ensayos coinciden dentro del error de muestreo (≈ 1/√N); validado en los tests de <c4/> / <c5/> con una desviación forzada (μ/σ = { "2" })

# text
seg-8fa5c9468ff5 = una ROC de detector medida frente a datos de spoofing registrados

# text
# c1: gnss-sim
seg-8f895aa1c657 = modelo de pseudodistancia de <c1/>

# text
# c1: ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath
# c2: ionmodel()
# c3: klobuchar_agrees_with_rtklib_reference_implementation
seg-a5e5e1e7a0e9 = una <b>simulación directa</b>: <c1/>. Cada modelo atmosférico se prueba unitariamente frente a valores calculados a mano (ZHD (retardo hidrostático cenital) ≈ { "2.3" } m, Niell = { "1" } en el cenit, oblicuidad de Klobuchar), y el modelo de difusión completo de Klobuchar se <b>contrasta con la implementación de referencia <c2/> de RTKLIB</b> con precisión submilimétrica (<c3/>, { "6.1278" } m para el caso de coeficientes por defecto de RTKLIB; no existe ningún vector de prueba oficial publicado de Klobuchar, de modo que esto es paridad de implementación, no verdad medida); una <b>ejecución sin ruido reproduce la geometría y las correcciones con precisión submilimétrica</b> (residuo RAIM ≈ { "0" })

# text
seg-adc8a5d89cbd = una <b>solución</b> de posición a partir de señales reales (PPP/RTK (PPP: posicionamiento preciso de punto)), combinación libre de ionosfera de doble frecuencia, o resolución de ambigüedad de fase de portadora; no está modelada

# text
# c1: jamming
seg-a56533528c6e = modelo de jamming (tipo de escenario <c1/>)

# text
# c1: Q
seg-0a4a28fcd53a = una cadena de <b>presupuesto de enlace</b>: J/S a partir de la pérdida en el espacio libre + la ganancia de antena por dirección → C/N₀ efectiva mediante la ecuación antiinterferencia (ganancia de desensanchamiento × separación espectral <c1/>) → pérdida de enganche en un umbral (Kaplan y Hegarty §{ "9.4" })

# text
# c1: [acquisition]
# c2: [front_end]
# c3: [crpa]
# c4: [terrain]
# c5: Q
seg-b53e210487fb = multitrayecto, dinámica del AGC (control automático de ganancia) en el tiempo, la propia búsqueda de adquisición (la histéresis opcional de <c1/> es un par de umbrales); la pérdida de cuantificación opcional de <c2/> es la de una entrada gaussiana, no válida para un interferente CW; la matriz opcional <c3/> es de banda estrecha e ideal (sin acoplamiento ni desadaptación), y el apantallamiento opcional de <c4/> es un solo filo de cuchillo sobre una sola tesela SRTM; <c5/> es una constante representativa por tipo, no derivada de la PSD medida del interferente

# text
seg-523d66d56f97 = FoM de integridad (paquetes de reloj/holdover)

# text
seg-d0702ee52d37 = <b>autoconsistencia</b> del filtro (fracción de muestras de interrupción dentro de su propia cota k·σ)

# text
# c1: integrity
seg-b4b68065e521 = HPL/VPL, riesgo de integridad / P_HMI, límites de alerta, DO-229E/316/ED-259A: esos se notifican por separado mediante el tipo de escenario <c1/> (RAIM / ARAIM) y las funciones SBAS, y nunca se integran en esta FoM

# text
# c1: inertial
seg-d5b1f858f0e3 = FoM del <b>paquete</b> de escenario <c1/> heredado

# text
seg-e9fe365d7318 = un presupuesto de error de acelerómetro/giróscopo de <b>un solo eje (1 DOF)</b> (VRW/ARW, inestabilidad de sesgo) con reinicio por ajuste a la verdad

# text
# c1: gnss-ins
seg-604e8d96c2c2 = el paquete <em>heredado</em> es de 1 DOF; la <b>ruta de 3 ejes se incluye en el paquete <c1/></b> (fila siguiente)

# text
# c1: gnss-ins
# c2: src/inertial/
# c3: src/fusion/pack.rs
seg-e2a4a1c47f2c = <b>biblioteca</b> strapdown de 3 ejes + <b>paquete</b> <c1/> (<c2/>, <c3/>)

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
seg-01e5672a37a4 = un navegador verificado de cuaternios/NED (NED: norte-este-abajo) con un modelo determinista de error de IMU (<b>factor de escala, desalineación, sensibilidad a g, cuantización, rampa de velocidad</b> modelados; IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }), ahora <b>impulsado por el paquete de escenario <c1/></b> y <b>configurable por sensor desde TOML (Tom's Obvious Minimal Language, el formato de los escenarios)</b> (<c2/>)

# text
seg-acecd6b81859 = <b>no modelados:</b> error de rectificación por vibración, deriva por gradiente de temperatura. El error de deriva fusionada está limitado por un suelo debido al error de actitud en el traspaso (inclinación/sesgo del acelerómetro débilmente separables), por lo que no se afirma una calibración por sesgo

# text
# c1: hybrid
seg-6b04fc376c0d = "Integración PNT híbrida" (paquete <c1/>)

# text
seg-cd3125081b5c = navegación por estima en lazo abierto delimitada por reinicios GNSS con ajuste a la verdad

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-578c93c67ae7 = una mezcla de Kalman GNSS–INS acoplada (débil/fuerte); eso corresponde al paquete <c1/> (EKF) y al tipo de escenario <c2/>, que son distintos

# text
seg-57f603da0331 = "Positioning Performance" (paquetes de reloj)

# text
# c1: timing_rms_ns
seg-278aafe7fadf = RMS de <b>temporización</b> de fase de reloj en ns (<c1/>)

# text
seg-a6af364cbcdc = una precisión en el dominio de la posición ponderada por RMS/CEP/SEP/DOP (SEP: probable error esférico)

# text
# c1: pos_rms_m
seg-b68c5a4363a5 = FoM de posición inercial (<c1/>)

# text
# c1: runs = N
seg-850e030bb5e3 = un RMS/p95 de posición de <b>un solo eje</b> en metros, a partir de una sola semilla salvo que <c1/> pida un conjunto (entonces media, dispersión y un intervalo de confianza bootstrap del { "95" }% por métrica)

# text
seg-be77929afa2c = una distribución de CEP / 2DRMS (el doble del RMS de distancia) de conjunto (hoja de ruta: CEP de Monte Carlo)

# text
seg-75f239679dc2 = "validado hasta ~{ "2" }%"

# text
seg-2d593a99a2b1 = una concordancia observada <em>típica</em>; el <b>umbral que se aplica es un error relativo de { "20" }–{ "25" }%</b>

# text
seg-34cfd0e08235 = una cota de precisión garantizada del { "2" }%

# text
seg-d3402cc1ebd5 = "reproducible / idéntico bit a bit"

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-46ea210bcdad = repetición idéntica bit a bit en el <b>mismo SO (sistema operativo) + cadena de herramientas fijada</b>; entre Linux, macOS y Windows, la CI comprueba un SHA-256 incluido en el repositorio de la huella de entrada y la forma de cada resultado (<c1/>) y los valores numéricos hasta { "1e-6" } (<c2/>)

# text
seg-38c6528122a8 = un resultado completo idéntico byte a byte entre sistemas operativos (diferencias de libm en el último dígito)

# text
# c1: orbit-sgp4-gps.toml
seg-b0e21aea4ccd = escenario SGP4 de GPS (<c1/>)

# text
# c1: gps-ops
seg-1131aa869f1d = una instantánea genuina de <c1/> de Celestrak (2021-07-28, { "30" } satélites, sumas de comprobación estrictas), con cada satélite propagado desde su propia época de TLE

# text
# c1: scripts/fetch_tles.sh
# c2: REAL_TLE_GUIDE.md
seg-21c2f1b5d7e2 = una constelación actual; actualice la instantánea con <c1/> (véase <a1><c2/></a1>); los números de catálogo del NORAD (Mando de Defensa Aeroespacial de América del Norte) son los reales

# text
seg-6948bd06c7e5 = Contrastes cruzados del artículo de PNT lunar (evidencia de regresión, no filas de la matriz)

# text
# c1: tests/validate_p*.rs
seg-9ee0faf0b359 = La suite lunar/cislunar (las capacidades "Lunar & cislunar" y "Lunar PNT suite" del README) tiene sus afirmaciones de artículos publicados contrastadas de forma independiente en <c1/>, cada una frente a una referencia independiente de una implementación <em>distinta</em>:

# text
# c1: scipy.special.j1
seg-b4edbf832fe6 = <b>huella orbital de transmisión/captura</b> frente a <c1/> (Bessel J1 de Cephes);

# text
# c1: (HᵀH)⁻¹
seg-c856d319a46e = <b>DOP de geometría de balizas en superficie</b> frente a una resolución independiente de <c1/> con NumPy;

# text
# c1: finals2000A
seg-33ee672d98d7 = <b>crecimiento del error de predicción de persistencia de UT1/EOP</b> frente a una relectura con NumPy de las mismas filas literales de <c1/> del IERS;

# text
seg-9b6e59789117 = <b>familia plana de órbitas retrógradas distantes</b> frente a la Three-Body Periodic Orbit Database de NASA/JPL;

# text
seg-c77384abd1cc = <b>presupuesto de precisión de medida de distancia por RF</b> frente a una referencia de primeros principios.

# text
# c1: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c2: src/verification.rs
# c3: VERIFICATION-MATRIX.md
# c4: gen_validation_artifacts
# c5: verification_matrix()
# c6: tests/verification_artifacts_doc_sync.rs
seg-a451dbe09e10 = Los fixtures y los scripts generadores de referencias independientes están en <c1/>. Refuerzan la evidencia de capacidades que siguen siendo <b>MODELLED</b> en la matriz comprobada por máquina (<c2/>); son comprobaciones de regresión, <b>no</b> nuevas filas VALIDATED de la matriz, de modo que no modifican por sí mismas el recuento de la matriz comprobada por máquina. Ese recuento no se reproduce aquí, porque una copia escrita a mano se desfasa: el reparto vigente es la cabecera generada de <a1><c3/></a1>, que <c4/> escribe a partir de <c5/> y que <c6/> fija.

# text
seg-a353a63661de = <s1>Anterior</s1>Exportaciones e importaciones de interoperabilidad

# text
seg-fdae3b73ab67 = <s1>Siguiente</s1>Matriz de verificación

# text
seg-59c12422e6e7 = Mareas sobre el geopotencial (src/tides.rs)

# text
seg-10f0b4616abe = Maniobras y diseño de trayectorias (src/maneuver.rs)

# text
seg-56cdbd59ce5d = Determinación de órbita (OD) (src/orbit_determination.rs, src/batch_ls.rs)

# text
seg-3a2c69fcbb86 = Validación del modelo de fuerzas mediante ajuste de efemérides (src/precise_od.rs)

# text
seg-05a25c6ef750 = Órbitas precisas reales de agencias (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

# text
seg-279f4619bc2d = Navegación por mapa gravimétrico / PNT alternativo (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

# text
seg-7b512df70323 = Modelo de error de INS / IMU: validación referenciada a hojas de datos (src/inertial/)

# text
seg-b385e665cfff = PNT de espacio profundo y de Marte: base D0 (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

# text
seg-5887e7e1a218 = Observables radiométricos de espacio profundo y CCSDS Tracking Data Message: D1 (src/radiometric.rs, src/ccsds_tdm.rs)

# text
seg-a9cf84a14301 = OD de espacio profundo de dinámica reducida: D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

# text
seg-dc406cb825db = Escenario PNT de espacio profundo y fusión unidireccional+bidireccional: D3 (src/mars_pnt.rs, src/deepspace_od.rs)

# text
seg-7784f9436dd2 = Tiempo coordenado lunar: tasa relativista del reloj Tierra-Luna (src/lunar_time.rs)

# text
seg-8a34cb900611 = VLBI geodésico lunar: retardo de campo cercano para una línea base terrestre que observa una baliza lunar (src/lunar_vlbi.rs)

# text
seg-d47906a347b3 = OD + reloj lunar conjunto multitécnica: recuperación simulada en lazo cerrado (src/lunar_combination.rs)

# text
seg-17b9f0ae9dee = Realización del marco de referencia lunar: ajuste de datum de Helmert de 7 parámetros (src/lunar_frame_realise.rs)

# text
seg-3cfffa3eeb79 = Volumen de servicio de navegación lunar: DOP / cobertura / disponibilidad + PL de ARAIM lunar generalizado (src/lunar_service.rs)

# text
seg-d80bf3320a15 = PNT diferencial lunar: cancelación de modo común + residuo creciente con la línea base + niveles de protección de DGNSS (src/lunar_dpnt.rs)

# text
seg-23c3d8a79acf = Exportación de interoperabilidad lunar: CCSDS OEM + KIF alineados con LunaNet/IOAG, con ajuste a la norma en ida y vuelta (src/lunar_interop.rs)

# text
seg-a697f4f424b8 = Representatividad de la demostración y registro de brechas hacia el vuelo (src/representativeness.rs)

# text
seg-4c924153299d = Evidencia unificada de compromiso cuántico frente a clásico (src/qtrade.rs)

# text
seg-bd1a5835c5db = Biblioteca de modelos de error de dispositivos cuánticos (src/quantum_devices.rs)

# text
seg-6b1bb731f966 = Temporización cuántica de confianza: cadena de extremo a extremo, diseminación segura, anomalías + compromiso (src/timetransfer_chain.rs)

# text
seg-3332c6c1ae86 = Navegación cuántica sin GNSS (src/quantum_nav_od.rs)

# text
seg-9b46a5add4ab = Detección de fallos / anomalías en sistemas PNT cuánticos (src/quantum_faults.rs)
