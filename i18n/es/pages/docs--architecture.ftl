# docs--architecture: translations (es)

# text
# c1: docs/ARCHITECTURE.md
seg-e366c6dd500e = Fuente: <c1/>

# text
seg-1f25b7fa1187 = Kshana: arquitectura

# text
seg-b0136a82669c = Kshana es <b>un único motor</b> organizado en capas sobre un núcleo compartido: los <b>paquetes de sensores</b> (reloj, inercial, transferencia de tiempo, híbrido); una capa de <b>astrodinámica / numérica</b> (SGP4/SDP4 analíticos (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), un propagador numérico de Cowell con su modelo de fuerzas de siete perturbaciones, diseño de maniobras, determinación de órbita a partir de distancias de estaciones terrestres y el ajuste del modelo de fuerzas frente a efemérides precisas de agencias); una capa de <b>tiempo y marcos de referencia</b> (escalas de tiempo del IERS (International Earth Rotation and Reference Systems Service), precesión–nutación 2006/2000A de la IAU (International Astronomical Union) y la reducción GCRS↔ITRS con CIO (Celestial Intermediate Origin) (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); una capa de <b>fusión</b> (los estimadores GNSS/INS (GNSS: sistema global de navegación por satélite; INS: sistema de navegación inercial)); y las capas de <b>integridad, resiliencia, PNT alternativo (PNT: posicionamiento, navegación y temporización) y lunar</b> (RAIM/ARAIM/SBAS (RAIM: monitorización autónoma de integridad del receptor; ARAIM: monitorización autónoma avanzada de integridad del receptor; SBAS: sistema de aumentación basado en satélites), detección de jamming y de spoofing multicapa, correspondencia de mapas de gravedad/terreno/magnéticos y PNT cislunar); y las capas más recientes de <b>LEO-PNT</b> (PNT en órbita terrestre baja), <b>espectro</b>, <b>sistema solar y diseño de constelaciones</b>, <b>temporización de red</b> y <b>campañas</b>, con los escritores de informes, animaciones e interoperabilidad que puede usar cualquier ejecución (§1d). En todas ellas el motor no sabe nada de "cuántico" frente a "clásico": maneja <em>modelos de error</em> de sensores a través de un escenario de interrupción del GNSS, ejecuta un estimador y puntúa el resultado. Un dispositivo cuántico y uno clásico se comparan por tanto en el mismo escenario, y solo difieren en sus parámetros de error (publicados y citados) y en sus semillas de ruido independientes.

# text
seg-02110864419e = Este documento reúne los diagramas estructurales y de comportamiento. El §{ "1" } es el núcleo de paquetes de sensores; el §1a describe las capas de astrodinámica, fusión y PNT alternativo añadidas desde entonces; los §1b–§1d, las capas de estudio, de dominio y de salida. Para el uso, véase el <a1>README</a1>; para lo que está y no está validado, véase <a2>VALIDATION</a2>; para la tabla de madurez por capacidad, véase <a3>CAPABILITY</a3>.

# text
seg-7bcc7b5cd049 = Abreviaturas usadas en los diagramas y no desarrolladas donde aparecen: ADEV, desviación de Allan; BW, ancho de banda; CAI, interferómetro de átomos fríos; CZML, el Cesium Language; Δ-DOR, medición de distancia unidireccional diferencial delta; DO-229E, el estándar de receptores SBAS de RTCA (Radio Technical Commission for Aeronautics); EKF, filtro de Kalman extendido; FM, modulación de frecuencia; GSE, equipo de apoyo en tierra; HPL/VPL, nivel de protección horizontal/vertical; IMU, unidad de medición inercial; IOAG, Interagency Operations Advisory Group; IQ, muestras en fase/cuadratura; ISL, enlace entre satélites; ITU-T, el Sector de Normalización de las Telecomunicaciones de la Unión Internacional de Telecomunicaciones; J2–J6, los armónicos zonales de gravedad de la Tierra de grado { "2" } a { "6" }; KIF, el Kshana Interchange Format; KML, Keyhole Markup Language; KPI, indicador clave de rendimiento; L1/L5, bandas portadoras GNSS (el L2 de las órbitas halo CR3BP es en cambio el punto de Lagrange { "2" } Tierra–Luna); LEO, órbita terrestre baja; LOO, dejar uno fuera; LTC, Hora Lunar Coordinada; MEO, órbita terrestre media; MTIE, error máximo de intervalo de tiempo; N2, el número de diversidad de Hill de orden 2; NED, norte-este-abajo; NTN, red no terrestre; OD, determinación de órbita; OPS-SAT, el satélite laboratorio de software en órbita de la Agencia Espacial Europea; PPP, posicionamiento de punto preciso; PSD, densidad espectral de potencia; PVT, posición, velocidad y tiempo; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), integradores de Runge–Kutta de cuarto orden y de quinto(cuarto) orden incrustado; SH, armónico esférico; SigMF, Signal Metadata Format; SIR, remuestreo por importancia de muestreo; SRIF, filtro de información de raíz cuadrada; SRP, presión de radiación solar; SSC, coeficiente de separación espectral; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, desviación de tiempo; TDM, el Tracking Data Message de CCSDS (Consultative Committee for Space Data Systems); TLE, conjunto de elementos de dos líneas; TPL, nivel de protección de temporización; UBX, el protocolo binario de u-blox; UHF, frecuencia ultraalta; VLBI, interferometría de línea de base muy larga; VRW / ARW, paseo aleatorio de velocidad / de ángulo; WASM, WebAssembly.

# text
seg-a87f668a8f97 = { "1" }. Estructura de módulos

# text
# c1: api::run_toml
# c2: types
# c3: scenario
# c4: allan
# c5: hybrid
# c6: orbit
# c7: navsignal
# c8: κ
# c9: jamming
# c10: Q = 1/(R_c·κ)
seg-0388999448a6 = La CLI (interfaz de línea de comandos) y ambos bindings confluyen en un único punto de entrada <c1/>, de modo que nunca se desvían. Los paquetes reutilizan el núcleo compartido (<c2/>, <c3/>, <c4/>); el Paquete { "4" } (<c5/>) compone los modelos y estimadores de los Paquetes { "1" }–{ "3" } en lugar de reimplementarlos; <c6/> deriva una cronología GNSS a partir de la geometría que después alimenta la ejecución del Paquete { "1" }. El módulo <c7/> se sitúa a nivel de señal entre el presupuesto de enlace y el dominio de medición: deriva el coeficiente de separación espectral <c8/> a partir de los espectros de potencia reales de la señal y del jammer, con el que <c9/> calcula ahora su <c10/> antijamming en lugar de tomar una constante representativa (contrastado en CI (integración continua)); también incluye el compromiso de diseño del código de distancia (secuencia m/Gold).

# text
# c1: holdover
# c2: clock_state
# c3: inertial::quantum_imu
# c4: QuantumNavBudget
# c5: AccelModel
# c6: verification
seg-cee4eb61a8e9 = Tres módulos más forman la espina de <b>resiliencia sin GNSS</b>. <c1/> responde directamente a la pregunta operativa —<em>¿cuánto tiempo puede un reloj funcionar libre antes de que su error de temporización supere el presupuesto?</em>— exponiendo la forma cerrada de van Loan del error de deriva como una inversión de holdover a umbral, contrastada con la recursión de covarianza de varios pasos de <c2/>. Su gemelo inercial vive en <c3/> (<c4/>), que compone la deriva de ruido blanco del interferómetro de átomos fríos con el error de sesgo y de factor de escala en un presupuesto de deriva de posición durante el holdover (el término de sesgo contrastado con el integrador independiente <c5/>). <c6/> genera la matriz completa del motor de requisito a módulo, a prueba, a referencia independiente y a estado, con invariantes comprobados por pruebas unitarias que prohíben una etiqueta de <em>validado</em> sin una referencia independiente externa, de modo que la afirmación de aseguramiento no puede desviarse del código.

# text
seg-c7bee352c04d = 1a. Capas de astrodinámica, fusión y PNT alternativo

# text
# c1: orbit
# c2: kind
seg-99c44e3a86d5 = Más allá del núcleo de paquetes de sensores, tres subsistemas comparten el mismo núcleo compartido y alimentan a <c1/> (o son alimentados por él). La capa de <b>astrodinámica / numérica</b> añade un propagador de Cowell no analítico junto a la vía analítica SGP4/SDP4; la capa de <b>fusión</b> lleva los estimadores GNSS/INS; y la capa de <b>PNT alternativo</b> es la correspondencia de mapas de gravedad sin GPS (GPS: Global Positioning System). Son capacidades de biblioteca o de escenario (véase <a1>CAPABILITY</a1> para saber cuáles están conectadas a un tipo de escenario (<c2/>) y cuáles son accesibles como API (interfaz de programación de aplicaciones) de Rust).

# text
# c1: forces
# c2: integrator
seg-69f93294d2c8 = Los términos de fuerza del propagador numérico están desactivados por defecto, de modo que activarlos nunca perturba los goldens publicados. El filtro de Kalman unscented (UKF) de 17 estados y acoplamiento fuerte recorre una interrupción del GNSS con el paseo aleatorio de velocidad derivado del acelerómetro cuántico CAI; la determinación de órbita reutiliza los mismos <c1/>/<c2/> para propagar un estado candidato a lo largo del arco de seguimiento.

# text
# c1: timescales
# c2: jd2
# c3: precession
# c4: nutation
# c5: cio
# c6: frames
# c7: eop
# c8: ephemeris
# c9: raim
# c10: sbas
# c11: jamming
# c12: spoof
# c13: spoof_detect
# c14: spoof_monitors
# c15: detection
# c16: navsignal
# c17: κ
# c18: jamming
# c19: Q
# c20: lunar
# c21: lunar_frame
# c22: lunar_od
# c23: cr3bp
# c24: cr3bp_jacobian
# c25: propagate_state_stm
# c26: differential_correct_halo
# c27: precise_od
# c28: lunar_od
# c29: tides
# c30: gravity_sh
# c31: igrf
# c32: altpnt/terrain
# c33: gravimeter
seg-bd87e20c284b = El mismo núcleo compartido lleva además cuatro subsistemas más no dibujados arriba (sus paquetes aparecen en el despacho del §{ "4" }): una capa de <b>tiempo y marcos de referencia</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) que reduce TEME↔GCRS↔ITRS (TEME: ecuador verdadero, equinoccio medio) y alimenta el paquete de <c8/> y traza en tierra; una capa de <b>integridad</b> (<c9/>, <c10/>) para RAIM/ARAIM/SBAS; una capa de <b>resiliencia</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) para la detección de jamming y de spoofing multicapa, con una capa de <b>señal de navegación</b> (<c16/>) a nivel de señal —densidades espectrales de potencia BPSK-R (BPSK: modulación por desplazamiento de fase binaria) / BOC (BOC: portadora de desplazamiento binario) senoidal, el coeficiente de separación espectral <c17/> que ahora deriva el <c19/> antijamming de <c18/>, el ancho de banda de distancia RMS (Gabor), el jitter de seguimiento de código del DLL (lazo de enganche de retardo) coherente temprano–tardío y la envolvente del error de multitrayecto (análisis de prestaciones de señal, <b>no</b> diseño de hardware de carga útil de RF (RF: radiofrecuencia) / antena, que es el papel de un socio de carga útil)—; y una capa <b>lunar / cislunar</b> (<c20/>, <c21/>, <c22/>, <c23/>) para la dinámica CR3BP (problema circular restringido de tres cuerpos) —incluida la matriz de transición de estado de { "6" }×{ "6" } y un corrector diferencial de disparo único (<c24/>, <c25/>, <c26/>) que produce órbitas halo/NRHO (NRHO: órbita halo casi rectilínea) genuinamente periódicas, reproduciendo la NRHO sur L2 { "9" }:{ "2" } publicada (la órbita de Gateway) con período ≈ { "6.57" } d / periselenio ≈ { "3,250" } km (publicado ≈ { "6.56" } d / ≈ { "3,370" } km); la transformación selenocéntrica MCI/MCMF (MCI: inercial centrado en la Luna; MCMF: centrado en la Luna y fijo a ella) de una órbita corregida y la continuación de familias siguen pendientes, y la NRHO es una solución CR3BP (circular, sin Sol), no validada frente a una efeméride real de LANS/Gateway (LANS: Lunar Augmented Navigation Service)— e integridad de LunaNet. El ajuste del modelo de fuerzas a efemérides de agencias (<c27/>, <c28/>, <c29/>, <c30/>) y el conjunto completo de campos de PNT alternativo (<c31/>, <c32/>, <c33/>) completan la lista de módulos; véase <a1>CAPABILITY</a1> para la madurez por módulo.

# text
seg-05f8c8c84d15 = 1b. Estudios de resiliencia, evaluación de aprendizaje automático y artefactos reproducibles

# text
# c1: kind
# c2: cargo run --example
# c3: --bin
seg-7350971daf4e = Cinco grupos más de módulos forman la capa de <b>estudios abiertos y reproducibles</b> que respalda los artículos de investigación del proyecto. A diferencia de los tipos de escenario (<c1/>), a estos se llega como generadores <c2/> / <c3/> que escriben artefactos <b>deterministas byte a byte</b> (semillas fijas, versión del motor y hash de configuración registrados). Todos son <b>MODELLED</b> (calibración sintética o de conjuntos de datos públicos) y llevan etiquetas de validación honestas; ninguno es una certificación.

# text
# c1: tpl
seg-86b177166f0e = <b><c1/></b>: el nivel de protección de temporización condicional, un límite limitado por el holdover sobre el error de tiempo <em>no detectado</em> bajo spoofing, que compone un suelo de monitor de k sigmas, la varianza de deriva de van Loan sobre la latencia de detección y un tiempo hasta la alarma de CUSUM (suma acumulada); calibrado con un spoofing real grabado (JammerTest { "2024" }). No existe un límite <em>incondicional</em> finito: el TPL es condicional a que una comprobación cruzada independiente detecte el ataque.

# text
# c1: resilience/
seg-8c9d1d90dc8e = <b><c1/></b>: un motor de puntuación de resiliencia PNT alineado con marcos (categorías del RPCF (Resilient PNT Conformance Framework) del DHS (Departamento de Seguridad Nacional)) más un estudio de inestabilidad de decisión: un símplex de ponderación de Dirichlet, inestabilidad de rango de Kendall-τ, tasa de cambio del ganador top-1 y <b>colapso de diversidad</b> de modo común (Hill-N2), con un informe de aseguramiento con hash de integridad y { "35" } pruebas de referencia independiente derivadas a mano. Véase <a1>RESILIENCE-CROSSWALK</a1>. Arquitecturas sintéticas alineadas con RPCF v2.0: una autoevaluación, no una certificación.

# text
# c1: impairment_eval
# c2: impairment_study
# c3: impairment_ml
# c4: eval_stats
seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b>: el estudio de la brecha de optimismo ante deterioros de RF: un corpus sintético etiquetado y un arnés de ROC/AUC (ROC: característica operativa del receptor; AUC: área bajo la curva) independiente del detector, un panel de 13 detectores (energía/AGC/SQM/paridad (AGC: control automático de ganancia; SQM: monitorización de calidad de señal) más detectores de regresión logística con semilla y de MLP (MLP: perceptrón multicapa) de una capa oculta), leyes de escala dentro y fuera de distribución con una hipótesis nula de permutación, y un predictor de dejar uno fuera de la degradación fuera de distribución. Las métricas de evaluación se validan bit a bit frente a scikit-learn.

# text
# c1: sdr
# c2: realdata
seg-36206681024f = <b><c1/> / <c2/></b>: un front end de receptor definido por software (IQ/IF en bruto (IQ: fase/cuadratura; IF: frecuencia intermedia) → tomas de correlador temprana/puntual/tardía → SQM) y adaptadores de ingesta (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) que permiten ejecutar los mismos detectores sobre grabaciones suministradas localmente; no se confirma ningún conjunto de datos en el repositorio.

# text
# c1: crossover
# c2: quantum_trade
seg-fefd78868fc2 = <b><c1/> / <c2/></b>: el mapa de cruce de resiliencia cuántico frente a clásico bajo incertidumbre de parámetros, y el compromiso del beneficio de holdover con ADEV medido; los núcleos numéricos del compromiso se validan frente a scipy.

# text
seg-5749f1300772 = 1c. Capas de integridad, GNSS, espacio profundo, lunares y de misión

# text
# c1: api
# c2: verification
seg-f44755d6d921 = Los dominios restantes se conectan al mismo despacho <c1/> y reutilizan el núcleo compartido, los marcos y la geometría. Todo lo de aquí es <b>MODELLED</b> salvo que una fila de la matriz <c2/> cite una referencia independiente externa (núcleo de RAIM frente a SciPy, SBAS frente al fork de RTKLIB (una biblioteca abierta de posicionamiento cinemático en tiempo real), el núcleo de DOP (dilución de la precisión) de gnss_lib_py, la evaluación de OPS-SAT, el núcleo de nivel de protección de ARAIM lunar, la coherencia de efemérides lunares entre proveedores); el resto de la suite lunar y el demostrador cuántico son modelados, ilustrativos, de fuente pública, y no llevan ninguna afirmación de TRL (nivel de madurez tecnológica) / herencia / aval de una agencia.

# text
seg-044940c8d052 = 1d. LEO PNT, espectro, sistema solar, temporización de red, campañas y salidas

# text
# c1: kind
# c2: api
seg-253a26d9cc5d = Las capas más recientes siguen el mismo patrón: cada una es uno o más tipos de escenario (<c1/>) despachados desde <c2/>, construidos sobre el núcleo compartido, y MODELLED salvo que una fila de la matriz nombre una referencia independiente externa.

# text
seg-e47cccd54da3 = El detalle por tipo de escenario está en <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> e <a13>INTEROP</a13>.

# text
seg-d04b21c7cb6c = 1e. Capas de confianza del receptor, evidencias, telemetría, formación y compliance ({ "0.35" })

# text
# c1: api
# c2: receiver-trust
seg-84ee122959b4 = Estas capas leen el propio registro de un receptor o escriben archivos para otras herramientas; ninguna de ellas sintetiza ni transmite una señal de radiofrecuencia. Se sitúan junto a <c1/> y no bajo los tipos de escenario, salvo <c2/> en sí, que es un tipo de escenario. Todas son MODELLED salvo que una fila de la matriz nombre una referencia independiente externa, y las salidas marítimas son de carácter consultivo, no un equipo de navegación homologado.

# text
seg-aab745a65e76 = Módulo

# text
seg-9d17ad3e87c8 = Documentado en

# text
seg-920b6b14c0e2 = puntúa un registro de receptor época a época con los monitores de confianza; una plataforma de buque añade los monitores marítimos y la puntuación de 0 a 100 con motivos

# text
seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

# text
# c1: $PKSHT
# c2: LiveEngine
seg-c311dfc2a161 = la misma puntuación sobre un flujo a medida que llega (stdin, un archivo al que se añade, TCP o UDP), la sentencia <c1/> y la puerta opcional; <c2/> es el conjunto completo, sin entrada ni salida

# text
seg-07b2d6edf7b9 = un paquete firmado y encadenado por hashes de una ventana de registro, su configuración y el resultado del motor, verificable sin conexión; token de marca de tiempo RFC { "3161" } opcional

# text
# c1: otlp
seg-32d08730b9c0 = el flujo de confianza como métricas de Prometheus, eventos de syslog (CEF o LEEF) y, opcionalmente, OpenTelemetry (función <c1/>, desactivada por defecto)

# text
seg-53311b8c3b93 = NMEA { "0183" } de puente sintético con eventos programados de jamming, arrastre, spoofing de tiempo y reproducción, y un registro del instructor, para la formación de tripulaciones (solo texto)

# text
seg-f7cc3cfbdfc6 = mapas agregados de navegación degradada a partir de informes de aeronaves y buques con licencia abierta, y la exposición de una ruta a ellos; solo archivos locales

# text
# c1: osnma::cli::verify_report
seg-83fe3c87e2d5 = un verificador del lado del receptor para Galileo OSNMA: lee páginas I/NAV (páginas sin formato, CSV de vectores, un flujo UBX), comprueba la clave firmada, la cadena TESLA y los MAC, e informa por satélite de si los datos de navegación están autenticados; <c1/> es la única ruta que comparten la línea de comandos, Python y WebAssembly; solo estado de autenticación, no un servicio de integridad

# text
seg-bf8cd5a45deb = OSNMA

# text
# c1: run_from_text
# c2: assess_texts
seg-843a83b82283 = asigna los resultados de Kshana a marcos públicos de resiliencia y rellena la asignación a partir de documentos de resultados; <c1/> y <c2/> reciben textos, no rutas

# text
seg-e16c483479ce = el movimiento del vehículo y los eventos de un escenario como un CSV de movimiento, NMEA, texto de puntos de ruta y archivos de eventos para un simulador GNSS de laboratorio; no se escribe ninguna señal

# text
seg-044c58c98397 = Las integraciones para embarcaciones (el complemento de Signal K, el modo de puerta de OpenCPN y la compilación de referencia) llaman a la herramienta de línea de comandos; consulte <a1>MARINE-INTEGRATIONS</a1>.

# text
seg-cb8d8ff847eb = { "2" }. Canalización del motor (por ejecución)

# text
seg-53e9e596ca44 = Cada ejecución hace avanzar un único modelo de sensor por la rejilla temporal, disciplinándolo siempre que el GNSS es nominal y dejándolo en funcionamiento libre (holdover / navegación por estima) durante la interrupción.

# text
# c1: classical_seed = seed + 0x9e3779b97f4a7c15
seg-257407f3c375 = Un escenario ejecuta esta canalización dos veces, una para el sensor cuántico y otra para el sensor clásico, con <b>semillas independientes</b> (<c1/>) para que las dos realizaciones de ruido no estén correlacionadas.

# text
seg-4659e89ba5f5 = { "3" }. La interfaz del modelo de error (el punto de extensión)

# text
# c1: step()
seg-7b70e8b1b98a = Todo sensor implementa la misma idea: un objeto con estado cuyo <c1/> hace avanzar su error estocástico interno y cuyo estado acumulado se lee en cada paso. Los relojes exponen la fase acumulada; los acelerómetros, la posición integrada dos veces; los enlaces, el jitter por medición.

# text
# c1: ModelSpec { id, kind, provenance, params }
# c2: provenance
seg-79ab76c6dbc0 = <c1/> pasa al resultado, de modo que cada cifra de la salida es trazable hasta la fuente publicada que se nombra en <c2/>.

# text
# c1: HoldoverEstimator
# c2: KalmanClock
# c3: q_wf·T + q_rw·T³/3
seg-514c49659947 = Junto al <c1/> analítico, el paquete de reloj ejecuta un filtro de Kalman de dos estados (fase, frecuencia) (<c2/>) cuyo ruido de proceso coincide con el del modelo de verdad. Al avanzar por inercia durante una interrupción, la varianza de su error de fase crece exactamente hasta <c3/>, la relación analítica de holdover, y su cota de 1-σ en línea se usa para obtener la cifra de mérito de <b>integridad</b> (fracción de muestras de la interrupción cuyo error permanece dentro de la cota de k-σ).

# text
seg-7404589deb40 = { "4" }. Despacho (CLI y enlaces)

# text
# c1: api::run_toml(src)
# c2: kind
# c3: { json, svg, summary, csv }
# c4: csv
# c5: report.html
# c6: report.json
# c7: --export
# c8: --animate
seg-6138513a43f7 = <c1/> es el único punto de entrada: examina el <c2/> de nivel superior, deserializa el escenario correspondiente, ejecuta el paquete y devuelve <c3/> (<c4/> solo está presente en los tipos de escenario que publican una tabla de reproducibilidad). La CLI escribe esos resultados en archivos, además del informe (<c5/>, <c6/>) y cualquier salida de <c7/> / <c8/>; los enlaces de Python y WebAssembly los devuelven al anfitrión. Un solo despacho, sin divergencias.

# text
# c1: ScenarioKind
# c2: kind
# c3: clock
# c4: serde
# c5: kind
# c6: kind
# c7: KshanaError::InvalidInput
seg-524f749be364 = El despacho se hace sobre una enumeración <c1/> tipada, con coincidencia exhaustiva (véase la subsección siguiente), de modo que añadir un paquete es un cambio verificado en compilación. Si falta <c2/>, se recurre al paquete <c3/>, así que los escenarios existentes de un solo tipo de escenario se deserializan sin cambios (<c4/> ignora el campo <c5/> en cada estructura de escenario). Un <c6/> no reconocido se rechaza con <c7/>, que nombra el tipo de escenario integrado más cercano cuando el nombre parece una errata.

# text
seg-eedaeae2a7e7 = Despacho tipado y la API estructurada

# text
# c1: ScenarioKind
# c2: ScenarioKind::classify(src)
# c3: kind
# c4: run_toml
seg-ca47f566eaee = El despacho se hace sobre una enumeración <c1/> tipada, no sobre una comparación de cadenas sin formato: <c2/> resuelve el campo <c3/> a una variante y el despachador hace coincidencia exhaustiva sobre ella, de modo que añadir un paquete es un cambio verificado en compilación, no una errata de cadena. Dos superficies tipadas conviven con <c4/>, que devuelve cadenas (se mantiene para la CLI y los enlaces existentes):

# text
# c1: run_scenario(src) -> Result<RunOutput, KshanaError>
# c2: InvalidInput
# c3: NonConvergence
# c4: Unsupported
# c5: IoError
# c6: kind_tag()
# c7: error_kind(toml)
seg-167c47049329 = <b><c1/></b>: la entrada tipada, con una taxonomía de errores estructurada (<c2/>, <c3/>, <c4/>, <c5/>). Cada error lleva un <c6/> estable para que quien llama pueda bifurcar según la categoría del fallo en lugar de analizar el mensaje. Los enlaces lo exponen como <c7/>.

# text
# c1: list_scenario_kinds() -> Vec<ScenarioMeta>
# c2: list_scenario_kinds_json()
# c3: list_kinds()
seg-1943051b3b20 = <b><c1/></b> (y <c2/>, expuesta en los enlaces como <c3/>): introspección programática con el nombre, la descripción y los campos obligatorios y opcionales de cada tipo de escenario, para la interfaz de usuario (UI) y el autocompletado en cuadernos.

# text
seg-630243592256 = Ampliar Kshana con un paquete externo

# text
# c1: api
seg-d1adedd2c08b = Un paquete de terceros implementa dos rasgos (traits) pequeños y estables según semver de <c1/>:

# text
# c1: ExternalPack
# c2: register_into(&mut PackRegistry)
# c3: src/registry.rs
# c4: jamming
# c5: Scenario
# c6: ErrorModel
seg-d01471b13324 = <c1/> también tiene un método <c2/> por defecto, que no hace nada salvo que un paquete opte por el punto de despacho del registro en <c3/>. El paquete <c4/> integrado se conecta mediante <c5/> como ejemplo resuelto; los paquetes externos al árbol siguen el mismo contrato sin bifurcar el núcleo (reflejando el punto de extensión de <c6/> en el §{ "3" }, que usa la capa privada de resiliencia).

# text
# c1: ErrorModel
# c2: Scenario
# c3: ExternalPack
seg-5b0449d96bc3 = Por tanto, Kshana tiene <b>dos puntos de extensión estables</b>: añadir un <em>sensor</em> implementando <c1/> (§{ "3" }), o añadir un <em>tipo de escenario</em> completo implementando <c2/> + <c3/>; ambos son estables según semver y ninguno exige bifurcar el núcleo:

# text
seg-3928a007756b = { "5" }. El cierre híbrido

# text
# c1: pnt_holdover
seg-7f38e825519a = El paquete híbrido ejecuta una <em>suite</em> (un reloj y un sensor inercial) y exige que <b>tanto</b> la temporización como la posición se mantengan dentro de la especificación; <c1/> es el tiempo hasta que una de las dos la incumple. Opcionalmente, un enlace óptico entre satélites vuelve a sincronizar el <b>reloj</b> durante la interrupción: solo ayuda a la hora; la posición no se vuelve a sincronizar, porque la transferencia de tiempo da tiempo, no posición. Esto es lo que aísla al sensor inercial como factor limitante.

# text
seg-17a8683f0982 = { "6" }. Disponibilidad GNSS derivada de la geometría

# text
# c1: orbit.rs
# c2: Propagator
# c3: Orbit
# c4: Sgp4
# c5: build_timeline
seg-afdb141ac367 = <c1/> es una capa de geometría determinista y sin dependencias. Un <c2/> es o bien el <c3/> kepleriano analítico (dos cuerpos, opcionalmente con J2 secular) o bien un propagador <c4/> completo construido a partir de un conjunto completo de elementos de dos líneas; un generador Walker-delta produce constelaciones sintéticas, y la visibilidad en línea de visión = oclusión terrestre + máscara de elevación. El número de satélites visibles se asigna a un estado GNSS (≥{ "4" } = nominal, { "1" }–{ "3" } = degradado, { "0" } = denegado), y <c5/> lo convierte en la línea temporal de disponibilidad que impulsa la ejecución estándar de holdover del reloj. Por tanto, la disponibilidad está <em>derivada de la geometría</em> en lugar de escrita a mano, mientras que la ejecución, el estimador y la puntuación no cambian.

# text
# c1: sgp4.rs
seg-da82c97ac5c8 = Una constelación suministrada como TLE completos se propaga con el modelo SGP4/SDP4 de <c1/> (validado con los vectores AIAA (American Institute of Aeronautics and Astronautics) 2006-6753); los elementos de solo la línea 2 mantienen la ruta analítica de dos cuerpos. Ambos pueden mezclarse dentro de un mismo bloque de constelación.

# text
seg-a47031620b54 = { "7" }. Enlaces

# text
# c1: python.rs
# c2: wasm.rs
# c3: --features python
# c4: --features wasm
# c5: cargo deny --all-features
# c6: api::run_toml
# c7: web/
# c8: run
# c9: run_all
# c10: chart_svg
# c11: summary
# c12: table_csv
# c13: list_kinds
# c14: error_kind
# c15: version
# c16: encode_permalink
# c17: decode_permalink
# c18: export_sp3
# c19: export_omm
# c20: export_oem
# c21: api
# c22: mcp/kshana-mcp
# c23: rmcp
# c24: run_scenario
# c25: list_scenario_kinds
# c26: validate_scenario
# c27: list_example_scenarios
# c28: get_example_scenario
# c29: report_scenario
# c30: animate_scenario
# c31: list_export_formats
# c32: export_interop
# c33: import_route
# c34: export_sp3
# c35: export_omm
# c36: export_oem
# c37: export_table_csv
# c38: assess_receiver_log
# c39: bundled-scenarios
# c40: ide/jetbrains
# c41: kshana
seg-57fb29fdd9d9 = El núcleo se compila sin cambios a nativo, a una extensión de Python y a WebAssembly. Los módulos de Python (<c1/>, PyO3 abi3) y de WebAssembly (<c2/>, wasm-bindgen) son dependencias opcionales, controladas por funciones (<c3/> / <c4/>): la compilación por defecto y el conjunto de pruebas nunca las compilan, mientras que la puerta de auditoría de dependencias (<c5/>) sí inspecciona sus árboles de dependencias, porque esos crates se distribuyen dentro del wheel y del paquete npm. Ambos llaman a <c6/>, de modo que todas las superficies devuelven resultados idénticos. El módulo de WebAssembly respalda el área de pruebas del navegador en <c7/> y exporta trece funciones: <c8/>, <c9/> (una ejecución del motor que devuelve a la vez resultado, gráfico, resumen y tabla), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, el códec de URL (URL: dirección web) compartible <c16/> / <c17/>, y los tres exportadores <c18/> / <c19/> / <c20/> que respaldan el menú de exportación del área de pruebas. Otras dos puertas de entrada llegan a la misma <c21/>: el <b>servidor MCP (Model Context Protocol)</b> (<c22/>, un crate <c23/> excluido del workspace que expone quince herramientas: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; las dos herramientas de ejemplo leen los escenarios incluidos mediante la función <c39/> de la biblioteca, desactivada por defecto, que solo este servidor activa) y el <b>complemento para el IDE (entorno de desarrollo integrado) de JetBrains</b> (<c40/>, un proyecto en Kotlin que invoca la CLI de <c41/> en lugar de enlazar la biblioteca).

# text
# c1: --features python
# c2: --features wasm
# c3: --features bundled-scenarios
# c4: xval/*
seg-a6620e0d6eef = Control por funciones: Python y WASM son <c1/> / <c2/>; la tabla de escenarios incluidos es <c3/> (el único uso que le da el servidor MCP); el servidor MCP y las comprobaciones cruzadas de <c4/> son crates EXCLUIDOS del workspace; el complemento del IDE no enlaza nada: ejecuta la CLI.

# text
seg-7bc5df56e4e5 = { "8" }. Determinismo y reproducibilidad

# text
# c1: ChaCha8Rng
# c2: (scenario, seed, engine version) → identical bits
seg-fb95c37c7bb9 = Toda la aleatoriedad fluye por un único <c1/> con semilla por ejecución; el orden de los pasos es fijo, de modo que <c2/>.

# text
# c1: scenario_hash
# c2: scripts/check-reproducible.sh
seg-e026c87beb26 = El resultado lleva un <c1/> SHA-256 (SHA: Secure Hash Algorithm); <c2/> ejecuta dos veces un escenario de referencia y comprueba que la salida sea idéntica byte a byte.

# text
# c1: wasm32-unknown-unknown
seg-42a3bdcbd99f = El mismo motor se compila a nativo, a una extensión de Python y a <c1/> para ejecuciones en el navegador que producen los mismos números.

# text
seg-12e00717c2d4 = { "9" }. Estructura diferida / futura

# text
seg-8a8e1b93b704 = Las capas de astrodinámica, fusión y alt-PNT del §1a (el propagador SGP4/SDP4 completo, el propagador numérico de Cowell con su modelo de fuerzas de siete perturbaciones y dos integradores adaptativos, el diseño de maniobras y trayectorias, la determinación de órbita, los estimadores GNSS/INS de 15, 8 y 17 estados, el filtro acoplado de reloj y posición, y la correlación con mapas de gravedad) ya se han entregado, junto con la cifra de mérito de seguridad con un demostrador activo de spoofing, la geometría real de TLE y multiconstelación, las bandas de Monte Carlo, los barridos de estudios de compromiso, el informe HTML (HyperText Markup Language) imprimible con su gemelo legible por máquina, y los flujos de trabajo de publicación, wheels y páginas.

# text
# c1: hybrid-ukf
seg-318ad50d3826 = Varias capacidades que antes figuraban aquí como trabajo futuro se han <b>entregado</b> desde entonces y se tratan más arriba o en <a1>VALIDATION</a1>: la nutación IAU 2000A completa y la reducción GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) con CIO, sin equinoccio (validada bit a bit con SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), el geopotencial EGM2008 (Earth Gravitational Model { "2008" }) hasta grado y orden { "70" }, el término de arrastre de marco de <b>Lense–Thirring</b>, las mareas sólidas, oceánicas y atmosféricas, una validación cruzada de efemérides de grado DE (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, un conjunto de herramientas de geometría planetaria en Rust puro)), la validación cruzada externa con Orekit { "12.2" } del propagador numérico de Cowell ({ "0.08" } m en { "24" } h) y de la determinación de órbita por lotes y secuencial, y el navegador fuertemente acoplado de 17 estados expuesto como el tipo de escenario <c1/>.

# text
# c1: [Unreleased]
# c2: .gfc
# c3: xval/high-degree-gravity/
# c4: space-weather
seg-068119b15b27 = El resto de las tareas pendientes se sigue en <a1>CHANGELOG</a1> <c1/> y la hoja de ruta por capacidad en <a2>CAPABILITY</a2>: un valor de referencia independiente externo para el evaluador de alto grado de EGM (Earth Gravitational Model) exactamente sobre el eje polar y una comparación cercana al polo limpia con pyshtools (el evaluador hasta grado { "2190" } y su cargador <c2/> en tiempo de ejecución ya se han entregado, MODELLED; véase <c3/>), un impulsor variable en el tiempo de clima espacial para el nivel opcional de densidad de arrastre NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (la densidad de arrastre por defecto es el modelo exponencial estático, y la densidad de Jacchia-71 del tipo de escenario <c4/> está caracterizada frente a NRLMSISE-00 pero no se sustituye por ella), una comprobación externa de la sombra opcional con oscurecimiento del limbo solar, el acoplamiento fuerte GNSS/INS con fase de portadora, y un mapa de gravedad real EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) para el correlador alt-PNT.

# text
# c1: ErrorModel
# c2: ExternalPack
seg-b48f69ea54b3 = Un repositorio de superposición privado contiene la profundidad de resiliencia sujeta a control de exportación; se conecta mediante la misma interfaz <c1/> (y el contrato <c2/> del §{ "4" }) sin cambiar el motor público.

# text
seg-2f88ab8f67e8 = <s1>Anterior</s1>Dónde se ejecuta Kshana

# text
seg-02b0e0fdcdbe = <s1>Siguiente</s1>Dónde se sitúa Kshana
