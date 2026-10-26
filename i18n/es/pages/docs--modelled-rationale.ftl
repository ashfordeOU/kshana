# docs--modelled-rationale: translations (es)

# text
seg-2db69c58f694 = PNT diferencial lunar

# text
seg-1ff1d8ebf1e7 = Correspondencia de compliance con marcos públicos

# text
seg-aab745a65e76 = Módulo

# text
seg-d6476863f862 = Capacidad

# text
seg-60a43431ebe0 = Requisito

# text
seg-bde1b3a94a47 = Sombra de SRP con oscurecimiento del limbo solar (opcional)

# text
seg-eaaec545dd68 = Fracción iluminada de SRP como la fracción no ocultada del flujo solar con oscurecimiento del limbo (ley de aproximación de Eddington I(mu)/I({ "1" }) = 2/5 + 3/5 mu, cuadratura de Gauss-Legendre) sobre una Tierra esférica o WGS-84 (srp_shadow::limb_darkened_shadow, la variante OblateEarthLimbDarkened de ShadowModel)

# text
seg-9e15970435c3 = Sol y Luna de DE440 en el modelo de fuerzas de Cowell (opcional)

# text
seg-de6831cf7785 = Nivel opcional de efemérides para los términos de tercer cuerpo y SRP del ForceModel numérico de Cowell: el Sol y la Luna geocéntricos de cualquier EphemerisProvider (un kernel SPK DE440 mediante KernelEphemeris) en TDB = TT + (TDB - TT), rechazando un proveedor que no pueda servir la época y contando cualquier recurso a la serie analítica; desactivado por defecto

# text
seg-057c21daf4f2 = Marea atmosférica S1 (opcional)

# text
seg-f600a39f297e = La marea diurna S1 de presión del aire como perturbación del geopotencial: modelo N1 de Biancale y Bode ({ "2006" }), grados { "2" } a { "6" }, mediante la fórmula de carga de la ec. { "6.21" } de IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcional en los modelos de fuerzas de Cowell y de órbita precisa (air_tide_s1, desactivado por defecto)

# text
seg-e8f5ff8c9149 = Gravedad de armónicos esféricos de alto grado (EGM2008 hasta { "2190" })

# text
seg-d3b2f32dcecb = Evaluación sin desbordamiento por defecto y segura en los polos de un campo totalmente normalizado hasta el grado { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, columna directa modificada de Holmes-Featherstone { "2002" } con el gradiente libre de 1/cos phi), un cargador ICGEM .gfc en flujo (from_gfc_file / from_gfc_reader; el EGM2008 completo se descarga en tiempo de ejecución, no se incluye) y el evaluador de Holmes-Featherstone seleccionable en el Geopotential de Cowell opcional

# text
seg-1960804ef2f4 = Determinación de órbita por lotes con velocidad radial y az/el con enmascaramiento de estación

# text
seg-4c185244bc66 = Recuperar un estado de época a partir de seguimiento mixto de distancia, velocidad radial y acimut/elevación por encima de una máscara de elevación mediante Gauss-Newton sobre H = (dh/dx(t)) Phi(t, t0): derivadas parciales analíticas de la medida y una matriz de transición de estado variacional con derivadas parciales analíticas de dos cuerpos + J2 (integrada con RK4, no una STM de forma cerrada)

# text
seg-bc3d1ee7c639 = Ponderación de observaciones por código de precisión SP3

# text
seg-63b1fab84f85 = Asignar los códigos de precisión SP3 (exponentes ++ de la cabecera en { "2" }^n mm, la base %f, desviaciones típicas base^n mm por registro) a sigmas de posición por observación para el motor de determinación de órbita precisa (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Asociar un campo de gravedad publicado a un cuerpo

# text
seg-ffb2b20e5f32 = with_gravity_field (en Body, en src/gravity_pds.rs): asocia cualquier campo de armónicos esféricos cargado (por ejemplo GMM-3 o GL0660B) a un Body para que el propagador lo evalúe fijo al cuerpo; opcional, los cuerpos por defecto no cambian

# text
seg-9762cf428435 = Codificadores de mensajes de navegación más allá de GPS LNAV (GPS CNAV, Galileo I/NAV y F/NAV)

# text
seg-9b703b9607d8 = Tipos de mensaje GPS CNAV 10/11/30, tipos de palabra 1-5 de Galileo I/NAV en páginas pares/impares nominales y tipos de página 1-4 de Galileo F/NAV: empaquetado de campos y cuantización según ICD, CRC-24Q, codificación convolucional de tasa 1/2 K={ "7" } (G2 invertido para Galileo), entrelazado por bloques y patrones de sincronización, con decodificadores de prueba correspondientes

# text
seg-974d8c1f7876 = Suavizado Hatch de código con portadora sobre observaciones RINEX reales

# text
seg-f26b5da0f52e = Filtro Hatch sin divergencia (código libre de ionosfera transportado por la portadora libre de ionosfera, ventana de N épocas, reinicio ante pérdida de enganche, salto libre de geometría o hueco) en el montaje de posicionamiento puntual preciso

# text
seg-278ca396127a = Lectura de archivos de observación RINEX { "4" }

# text
seg-e0883aa933eb = Cabeceras de observación RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiquetas localizadas en las columnas 61-80 para la versión { "4" } y posteriores) y registros de época

# text
seg-33e5c74720ff = Posición de satélite GEO de BeiDou por difusión

# text
seg-44b61449b65a = Posición de satélite geoestacionario según BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } a partir de unas efemérides de difusión (sistema cuasi inercial, luego Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcional mediante el campo include_beidou_geo de NavParseOptions, de modo que el lector por defecto sigue omitiendo los GEO

# text
seg-71f48628ebb2 = GNSS/INS fuertemente acoplado con fase de portadora y ambigüedades flotantes

# text
seg-5a156aa81275 = EKF de estado de error sobre { "15" } estados INS, un reloj de receptor de dos estados y una ambigüedad de portadora flotante por satélite seguido; pseudodistancia, fase de portadora y velocidad radial opcional de una constelación Walker SGP4 (tiempo de luz y Sagnac), con correcciones de Klobuchar y Saastamoinen/Niell aplicadas en el lazo en la posición propia del filtro; detección de saltos por portadora diferenciada en el tiempo con un umbral por satélite ampliado por la incertidumbre de velocidad; reinicialización de ambigüedades ante saltos y readquisición

# text
seg-7d644516b1ec = Paquetes GNSS/INS marítimo, ferroviario y de aviación con opción de acoplamiento fuerte

# text
seg-cbb03a8baf73 = Tres escenarios gnss-ins sobre la biblioteca de trayectorias (un buque que zigzaguea a { "8" } m/s con una interrupción de cinco minutos; un tren que atraviesa una trinchera con dos satélites visibles y un túnel; una aeronave cuya interrupción abarca un viraje con alabeo de 25 grados) y la tabla opcional [tight] del paquete: pseudodistancias de una constelación Walker SGP4 fusionadas por el navegador en lazo cerrado, con todos los satélites sobre la máscara en condiciones nominales y los pocos más altos en condiciones degradadas

# text
seg-f4dab73c4eda = Filtro PNT acoplado de pseudodistancia con estado de sesgo y extensión 3-D en el paquete de fusión

# text
seg-742b60089361 = Un único filtro de Kalman apilado sobre posición, velocidad, fase y frecuencia de reloj alimentado con pseudodistancias que acoplan posición y reloj (actualizaciones en forma de Joseph que conservan la covarianza cruzada); una variante de 1 grado de libertad aumentada con un estado de sesgo de acelerómetro constante que el paquete de fusión ejecuta bajo [coupled]; y la versión 3-D de 8 estados con filas de línea de visión

# text
seg-2db2b9dc3b45 = Biblioteca de trayectorias GNSS/INS e importación de verdad CSV

# text
seg-e1fe83c75a6c = Perfiles de movimiento seleccionables para el paquete gnss-ins (recta, figura-8, urbano con paradas y arranques, ascenso de aeronave y viraje coordinado, dron de topografía), definidos por órdenes de velocidades de Euler y de aceleración a lo largo de la trayectoria cerradas sobre el estado verdadero con la IMU cinemática (términos centrípeto, de gravedad y de Coriolis), y verdad CSV importada convertida en la IMU que la reproduce; el recorrido histórico no cambia cuando no se da ningún perfil

# text
seg-86f9186bb884 = NRHO { "9" }:{ "2" } del CR3BP Tierra-Luna frente a la órbita que voló CAPSTONE

# text
seg-d4127cf241f3 = La órbita de halo casi rectilínea austral L2 circular restringida { "9" }:{ "2" } que corrige cr3bp::differential_correct_halo (la familia de órbitas de Gateway y CAPSTONE), comparada en su geometría media (periodo, radio de perilunio, radio de apolunio) con la órbita que CAPSTONE voló realmente. Una medición de lo bien que el miembro del CR3BP describe la órbita real; una órbita CR3BP no es una órbita de modelo de efemérides y no se compara época por época

# text
seg-1a5623c81b48 = Error de posición a partir de la geometría: error RMS = sigma_UERE x DOP para la solución de mínimos cuadrados del motor

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry y check: una simulación de Monte Carlo con semilla (N = { "20,000" } épocas por geometría, sigma = { "1.5" } m, semilla ChaCha8 { "36" } + i) de la propia solución de mínimos cuadrados iterada del motor (pvt::solve_spp, pesos unitarios, resuelta desde la posición verdadera) sobre las { "8" } geometrías de tests/fixtures/dop/dop_reference.csv, comparando las varianzas de error este, norte, arriba y de reloj, el RMS H/V/P, la correlación este-norte, los errores medios y la fracción dentro de la elipse horizontal del { "95" } % con sigma^{ "2" } Q, donde Q es el factor de covarianza del kernel orbit::dop (orbit::dop_cofactor, la misma aritmética) sobre la misma geometría

# text
seg-9acfde1b57f7 = Clasificación de confianza con conciencia de geometría: geometría de satélites junto a la puntuación de confianza del receptor y una clase en cada deducción

# text
seg-6138c41e13ff = receiver_trust::geometry: geometría de satélites por época (buena, degradada con motivos pocos satélites/PDOP alto/HDOP alto/cielo bloqueado, o desconocida cuando el registro no da GSV, NAV-SAT ni GSA) derivada de las elevaciones y acimuts informados mediante orbit::dop o tomada de GSA, con una etiqueta siempre informada y nunca puntuada (buena, aceptable, mala, desconocida) y el HDOP, PDOP, VDOP, el número de satélites y la pérdida de señal expresados con palabras; un monitor de geometría de la puntuación del buque que no deduce nada salvo que la geometría sea mala (razón max(hdop/4, pdop/6, 5/n_used) por encima de { "1" }), y luego crece hasta un tope de { "15" } puntos en { "1.5" } que la geometría por sí sola no puede llevar por debajo de la banda degradada (tope, fin de la rampa y suelo en [geometry]; sin alarma); una clase en cada deducción (geometría, entorno, incoherencia) con la pérdida de enganche de satélites por debajo de { "15" } grados clasificada como geometría, los satélites a la vista pero no seguidos clasificados como entorno, y una deducción por mala geometría cuyo HDOP indicado está más allá de max({ "1.0" }, { "25" } % del HDOP derivado) respecto al cielo indicado clasificada como incoherencia

# text
seg-bbb1828b3db1 = Reducciones de cañón urbano, sectores y terreno a una tabla

# text
seg-2864aec7be88 = skyline: el cañón urbano en forma cerrada (corte atan((h - a) / d) con d = (w/2) / abs(sin(az - s)), extremos abiertos para una longitud finita), sectores de bordes netos en sentido horario con cierre, y puntos de terreno reducidos a una tabla con la caída por curvatura d^2/({ "2" } * 4/3 R); el horizonte es su máximo punto a punto con cualquier tabla

# text
seg-3f3d657854ce = Preajustes de horizonte (calle urbana, aproximación a puerto, fiordo, terminal de contenedores)

# text
seg-b915c06fa3f1 = skyline::PRESETS: cuatro geometrías REPRESENTATIVAS con las dimensiones indicadas en la nota de diseño y una línea de procedencia cada una: city-street (un cañón, calle { "0" } grados, { "20" } m entre muros de { "30" } m, antena { "1.5" } m), harbour-approach (sectores: abierto hacia el mar en { "180" } grados, edificios de muelle { "8" } grados en { "90" } grados, el rompeolas { "3" } grados), fjord (terreno: paredes { "600" } m por encima de la antena a { "1.5" } km a cada lado de un canal norte-sur, caída por curvatura aplicada), container-terminal (sectores: pilas { "12" } grados sobre la mitad hacia tierra, plumas de grúa { "35" } grados y { "25" } grados sobre dos sectores estrechos); sobrescribible campo por campo

# text
seg-6012113b4836 = Funciones de geometría del cielo: visibilidad, DOP, covarianza, elipse de error, nube de Monte Carlo

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> y <c2/>, funciones de Python y WASM con los mismos nombres, MCP <c3/>): a partir de un emplazamiento, un instante y preajustes de constelación (o satélites como acimut/elevación o ECEF), los satélites visibles y enmascarados bajo un horizonte, GDOP/PDOP/HDOP/VDOP/TDOP, el cofactor de varianza unitaria (H^T H)^-1 y la covarianza en este-norte-arriba con un reloj de receptor por sistema o uno común, la elipse de error horizontal (semiejes k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientación { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) desde el norte), y n errores de mínimos cuadrados con semilla bajo errores de distancia gaussianos independientes con su covarianza empírica, RMS y contención del { "95" } %. El cofactor es orbit::cofactor_from_los, el único kernel detrás de orbit::dop y orbit::dop_cov (dop es la reducción de dop_cov): no hay una segunda implementación de DOP

# text
seg-7f66be0f15c8 = Holdover de reloj sin GNSS

# text
seg-4d8f87668a0f = Crecimiento del error de deriva en forma cerrada + holdover hasta el umbral; clases de relojes cuánticos

# text
seg-29b482d88916 = Tarjetas de dispositivo de reloj medidas (predicción sobre datos reservados)

# text
seg-8c68c5b25004 = clock_library: una tarjeta de dispositivo (ruido blanco de fase, FM blanco, flicker y de paseo aleatorio más una deriva lineal de frecuencia) ajustada a un tercio de un registro de reloj medido con nombre tras un paso de acondicionamiento registrado (se eliminan huecos, valores atípicos de fase, saltos de fase y ráfagas; se registran los saltos de frecuencia), ponderada por los grados de libertad por tipo de ruido identificados con retardo 1, y su desviación de Allan predicha puntuada sobre los dos tercios reservados; lectores de archivos de reloj RINEX e IGS, archivos por laboratorio del BIPM y la Sección { "1" } de Circular T; conversión de una tarjeta al modelo de ruido de temporización de ranura, al modelo de reloj de Kalman extendido y a los niveles de ruido del monitor de spoofing

# text
seg-5097a0e6460d = Tarjetas de reloj GPS Block IIF medidas con términos por revolución (predicción sobre datos reservados)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: una tarjeta de dispositivo que incluye los términos de fase de una a cuatro veces por revolución (periodo T/k, T = { "43 082.05" } s), ajustados conjuntamente con el cuadrático por mínimos cuadrados sobre un tercio de un registro de reloj de satélite medido, con la contribución de Allan en forma cerrada de cada término { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } en la desviación de Allan predicha

# text
seg-0d72fcc0fbea = Estimación del estado del reloj a bordo

# text
seg-6db5391f8ebe = Reloj de Kalman de van Loan de 3 estados (fase/frecuencia/deriva), estabilizado en forma de Joseph

# text
seg-3f0a9d7c2971 = Presupuesto de errores de transferencia de tiempo

# text
seg-216f46b43860 = Bidireccional/TWSTFT (Sagnac), vista común GNSS, PPP; jitter del enlace→distancia

# text
seg-157fadeb5d67 = Modulación de señales de navegación y análisis de seguimiento de código

# text
seg-ab633d191396 = PSD BPSK-R/BOC, separación espectral κ, ancho de banda de Gabor, jitter del DLL, multitrayecto

# text
seg-e6c08e1e6ae3 = Rendimiento de sensores inerciales cuánticos

# text
seg-d28e1f6a430f = Acelerómetro interferométrico de átomos fríos a partir de primeros principios (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Ambigüedad de franja / rango dinámico de sensor inercial cuántico

# text
seg-deb2850546d5 = Rango dinámico de ambigüedad de franja Mach–Zehnder: la lectura de franja periódica de 2π fija una fuerza específica máxima sin ambigüedad a_max=π/(k_eff·T²), y el rango sin ambigüedad en celdas de resolución a_max/σ_a=π/σ_Φ es independiente del factor de escala óptico: la ganancia de sensibilidad T² cuesta rango sin ambigüedad en exacta proporción (el tiempo de interrogación intercambia resolución por rango, con el número de celdas fijado por el ruido de fase de lectura)

# text
seg-d04bf321d4a1 = Resiliencia de navegación por estima inercial cuántica

# text
seg-c4989abb5d40 = Presupuesto de posición compuesto de sesgo + factor de escala + VRW + decaimiento de estabilidad durante el holdover

# text
seg-5692c7b936b6 = Resiliencia al jamming sin GNSS

# text
seg-f4ff77caa47b = Presupuesto de enlace J/S de la geometría, C/N₀ antiinterferencia, pérdida de enganche por satélite

# text
seg-ff90679d1de9 = Detección de spoofing

# text
seg-b843f63e77e6 = χ² asistido por reloj, RAIM, AGC y SQM fusionados en una FoM de seguridad por época

# text
seg-b10d07921f5e = Nivel de protección de temporización bajo spoofing

# text
seg-2a829711b997 = Cota en forma cerrada del error de tiempo no detectado en el peor caso = suelo del monitor + σ de deriva del oscilador sobre la latencia de detección de CUSUM, informada como banda de suelo de ruido rojo

# text
seg-f1d49eac89f8 = PNT alternativo / complementario

# text
seg-023dda973f66 = Correspondencia de mapas de gravedad, referenciado al terreno (TERCOM/SITAN), anomalía magnética

# text
seg-791e7285c291 = Reproducibilidad y garantía del software

# text
seg-7177355a482c = Determinista, con hash de escenario, SBOM + puertas de referencia multiplataforma

# text
# c1: impairment-eval
seg-241f2eeaef12 = Corpus sintético etiquetado de perturbaciones + arnés ROC/AUC/confusión/Pfa-Pmd independiente del detector; protección contra fugas, partición estratificada, informe de optimismo por cambio de distribución (dentro frente a fuera de régimen). Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Estudio sintético controlado de la brecha de optimismo de AUC de dentro a fuera de la distribución en detectores de método publicado y aprendidos (regresión logística / MLP de una capa oculta): tendencias de ley de escala por clase (ρ de Spearman + pendiente sobre { "1" }−gravedad) y un predictor ridge solo con ID que estima la brecha únicamente a partir de diagnósticos dentro de la distribución, puntuado dejando fuera un detector y dejando fuera una clase. Reproducible mediante <c1/>

# text
seg-fd6424213d1f = Compromiso PNT cuántico frente a clásico y resiliencia sin GNSS ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Ingesta de ADEV medida (NNLS), tabla de compromiso (holdover de temporización/inercial + beneficio), envolvente de resiliencia frente al tiempo; la salvedad del suelo se lleva en el artefacto. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Entorno de clima espacial y densidad termosférica dirigida por la actividad

# text
# c1: space-weather
seg-47308f611c7e = Índices solares/geomagnéticos (tabla definicional Kp↔ap), la temperatura exosférica de Jacchia-1971 y la densidad termosférica de Jacchia { "1971" } (SAO Special Report { "332" }: perfiles de difusión estáticos que reproducen su Tabla { "7" }, con las variaciones diurna, geomagnética, semianual, estacional-latitudinal y del helio) frente a la atmósfera estática USSA76. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/space-weather.toml)

# text
seg-c76b8c395ef0 = Ventana de lanzamiento y geometría de ascenso (análisis de misión)

# text
# c1: launch-window
seg-6066c634faba = Acimut(s) de lanzamiento de dos cuerpos (sin Az = cos i / cos lat), inclinación mínima alcanzable, velocidad circular, bonificación hacia el este por rotación terrestre, Δv de cambio de plano con dogleg y oportunidades diarias, y, dados una época y filas IERS finals2000A, la velocidad del emplazamiento alrededor del polo verdadero (launch::site_rotation_speed_at). Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Corredor de reentrada balística (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Deceleración máxima (independiente del coeficiente balístico), velocidad + altitud en el pico de g y velocidad de calentamiento máximo para una entrada balística en atmósfera exponencial. Ejecutable desde la CLI/los bindings como el tipo de escenario <c1/> (scenarios/reentry.toml)

# text
seg-7b4a8e25c3c9 = Codificación y modulación adaptativas DVB-S2 a lo largo de un paso de enlace descendente LEO

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 del enlace descendente a lo largo de cada paso de un satélite sobre una estación (EIRP, pérdida en espacio libre, pérdida atmosférica con ley de cosecante, otras pérdidas, G/T, constante de Boltzmann, tasa de símbolos), el MODCOD DVB-S2 más eficiente que supera su umbral de casi libre de errores de ETSI EN { "302" } 307-1 V1.4.1 Tabla { "13" } más un margen de implementación en cada paso, el volumen de datos ACM del paso y la línea base de codificación constante que cierra en la máscara y en la mayor distancia. Ejecutable como el tipo de escenario <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-19603a7e0fe8 = Planificación de contactos terrestres multisatélite y multiestación con resolución de conflictos

# text
# c1: contact-schedule
seg-40edeae6e48b = Contactos candidatos a partir de cada paso satélite-estación con su volumen de datos ACM; conflictos cuando una antena serviría a dos satélites dentro de su tiempo de reorientación o un satélite descargaría a dos estaciones a la vez; un objetivo de entrega ponderado por prioridad limitado al atraso de cada satélite; un plan voraz perezoso de valor marginal, una línea base de primero en llegar y una ramificación y acotación exacta sobre hasta { "26" } candidatos, con la brecha de optimalidad del voraz informada. Ejecutable como el tipo de escenario <c1/>. Entradas ilustrativas; MODELLED.

# text
seg-3742d2aea62a = Planteamiento frugal de coste por cobertura / ROI

# text
seg-4228311689f8 = Coste por porcentaje de cobertura + ROI de cobertura por euro sobre el motor de dimensionamiento de constelaciones; el coste por satélite es un rango bajo/nominal/alto aportado por quien llama (sin precios inventados)

# text
seg-8ba6ee9acc8a = Impacto en la integridad de la detección fallida (HPL/VPL según el contexto frente al límite de alerta)

# text
seg-f5985399d0d5 = Transforma un sesgo de spoofing/jamming no detectado en error efectivo → región de Stanford (disponible/no disponible/MI/HMI) frente a HAL/VAL específicos del contexto (cielo abierto frente a urbano)

# text
seg-37d43b5b918a = Hoja de parámetros de modelo de error CAI citados ({ "13503" })

# text
seg-0b6a901f5ad2 = Rendimiento acotado (mejor/nominal/conservador) de interferómetros de átomos fríos (inestabilidad de sesgo, paseo aleatorio de velocidad/ángulo, estabilidad del factor de escala, tasa de muestreo limitada por la interrogación, rango dinámico de ambigüedad de franja), cada uno trazable a una cita; alimenta QuantumNavBudget sin modelar hardware

# text
seg-c93f2d3a3167 = Benchmark de ajuste a la norma de integridad de temporización: clasificador de épocas del diagrama de integridad de Stanford

# text
seg-712d5c35a6a6 = Clasificación de épocas TIB del diagrama de integridad de Stanford (nominal / no disponible / MI / HMI)

# text
seg-573aa0193cb3 = Benchmark de ajuste a la norma de integridad de temporización: evaluador de cobertura de integridad

# text
seg-4d86f3c2d8f5 = Puntuación de cobertura de integridad TIB (tasas de HMI/MI/disponibilidad + veredicto de cobertura de cota superior)

# text
seg-372dd0fdb025 = Benchmark de ajuste a la norma de integridad de temporización: catálogo de fallos (generadores paramétricos)

# text
seg-2604e7cf27d2 = Menú de fallos TIB (divergencia de dominio, golpe de reloj, deriva en holdover, retardo estático/incremental/simétrico/asimétrico, repetición dentro de la frescura, selectivo por trayecto, quórum k de N)

# text
seg-90c0eb1e7c14 = Benchmark de ajuste a la norma de integridad de temporización: veredicto de absorción de lo indetectable

# text
seg-f713acf042ff = Veredicto de absorción de lo indetectable TIB (el simétrico/la repetición deben ser absorbidos por el PL, nunca informados como detectados)

# text
seg-8adbbd2cdb74 = Autodescripción del informe híbrido óptico/RF

# text
seg-2a5e48b558e1 = El informe hybrid-optical-rf declara la configuración de enlace con la que se ejecutó realmente (longitud de onda de portadora, apertura de transmisión y de recepción, distancia, anchura de pulso, tiempo de integración, eficiencias y pérdidas, valores por defecto resueltos) y lleva un bloque de unidades que da la unidad y la clase de procedencia de cada magnitud que probablemente cite un artículo, incluidas las trazas de covarianza del traspaso en metros cuadrados

# text
seg-0691f3dee8cb = Disponibilidad del enlace híbrido óptico/RF en el lado de RF

# text
seg-72ccb655caf0 = El informe hybrid-optical-rf declara una disponibilidad de enlace de RF, compuesta a partir de magnitudes que el motor ya calcula y no de una climatología importada, y declara la composición como una regla con nombre: A_rf = I_closure * I_track, donde I_closure es el veredicto de cierre del presupuesto de enlace unidireccional CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margen de Eb/N0 >= { "0" }) a la distancia propia del escenario e I_track es el veredicto del lazo de seguimiento (jamming::lock_status) sobre el C/N0 que devolvió ese MISMO presupuesto. Cada factor lleva a la salida la clase de procedencia de su entrada, y los factores que deliberadamente NO están en el producto (visibilidad geométrica, denegación por interferencia y una climatología de interrupciones de RF) se nombran con el motivo en lugar de fijarse silenciosamente en { "1" }. El tramo de RF resuelto se repite como su propio bloque rf_link_configuration, y las cifras continuas junto al indicador (margen de enlace, margen de C/N0, las distancias de cierre y de seguimiento en forma cerrada y la utilización de distancia) son las inversiones de distancia del mismo presupuesto. El informe declara por completo, en el bloque y en la entrada de unidades a la que llega un lector, que esta cifra está LIMITADA POR MARGEN/GEOMETRÍA y es DETERMINISTA, mientras que la disponibilidad óptica está LIMITADA POR METEOROLOGÍA/CLIMATOLOGÍA y es probabilista, de modo que nunca puedan citarse como un par comparable de porcentajes

# text
seg-22c5df9b6c7c = Comparación de medición de distancia óptica frente a RF en igualdad de condiciones

# text
seg-70eb396f40af = El informe hybrid-optical-rf emite la razón de medición de distancia óptica frente a RF con la ÚNICA configuración a la que se evaluaron ambos tramos incluida en el mismo objeto: el mismo trayecto unidireccional, la misma distancia y el mismo tiempo de acumulación. El tramo óptico es la CRLB de ToA limitada por fotones del motor sobre el recuento de fotones unidireccional; el tramo de RF es el jitter térmico de seguimiento de código early-late del DLL del motor con el C/N0 que devuelve el propio presupuesto de enlace del motor para esa misma distancia unidireccional. El ancho de banda de ruido del lazo se deriva, no se elige: B_L = 1/({ "2" }*integration_s) sitúa el tramo de RF exactamente en el tiempo de acumulación óptico, y si quien llama lo anula de modo que los dos tiempos de promediado discrepan, la razón queda REFUSED (null, con la discrepancia y ambos tiempos nombrados) en lugar de citarse en dos puntos de operación. No se forma ninguna razón frente al rf_position_sigma_m paramétrico ELEGIDO del escenario, y el rechazo dice por qué: esa entrada no lleva ninguna configuración. El resultado óptico bidireccional publicado y el factor exacto que lo conecta con el tramo de comparación unidireccional se emiten junto a la razón, de modo que el informe no pueda leerse como portador de dos sigmas ópticas discrepantes

# text
seg-3f26f598e013 = Autodescripción del informe de presupuesto de enlace

# text
seg-b88bf41d6d4c = El informe de presupuesto de enlace declara cada constante absoluta con la que se calculó su propio margen (la frecuencia de portadora que usó la pérdida en espacio libre, la EIRP, la figura de mérito, la pérdida global y el término de Boltzmann), además del G/T requerido con el que el margen es cero, la constante de enlace (EIRP - pérdidas - Eb/N0 requerido) que es la única combinación que una tabla publicada de tasa/ganancia puede fijar jamás y, cuando quien llama declara una temperatura de ruido del sistema, la ganancia de la antena receptora que esa figura de mérito implica

# text
seg-a7b192e27cb5 = Tabla de cruce de tiempo lunar por clase de reloj

# text
seg-cab605dc6ea2 = Una ejecución del presupuesto de tiempo lunar emite una fila de cruce reloj-frente-a-sistema de referencia por clase de reloj contra un único término de sistema de referencia compartido, de modo que el reloj es la única variable de la comparación; cada fila lleva el cruce alcanzado de dos maneras (por bisección a partir de la curva general de error de tiempo de ley de potencias y por inversión algebraica a partir del tipo de ruido dominante de la fila) con la diferencia relativa entre ambos

# text
seg-18c72a7565d6 = Huella de captura frente a altitud y anchura de haz

# text
seg-9c30a0ab5233 = Barrido de dos ejes de la huella de captura de superficie, ponderada por el patrón y limitada por la altitud, sobre la altitud del transmisor y el diámetro del plato, emitido en una fila por punto de operación con la anchura de haz a mitad de potencia que implica cada diámetro, y la captura en el limbo informada como UMBRAL: por fila el J/S del limbo, su margen y la potencia de transmisión que lo cerraría; por rejilla los cruces localizados, o una declaración explícita de que el limbo no se alcanza en ningún punto de la rejilla, con el déficit

# text
seg-fc0a64b9a280 = Reproducibilidad del presupuesto de error de tiempo lunar

# text
seg-5d5970506b9c = El escenario de presupuesto de tiempo lunar publica sus salidas de tipo matriz como una tabla en formato largo (índice de rejilla, tiempo de promediado, término) junto con el informe, de modo que las siete curvas x(tau) por término y el total de raíz de suma de cuadrados son salida del motor y no algo que un lector reconstruya a partir de la sección de método

# text
seg-675887733454 = Laboratorio de tiempo de estación lunar: holdover del miniRAFS frente a LTC

# text
seg-7dfedc40da6a = El bloque opcional [time_lab] del escenario lunar-time-budget modela un reloj de estación de referencia lunar (por defecto de la clase miniRAFS, o cualquier clase nombrada, o una tarjeta de dispositivo ajustada a puntos de estabilidad indicados) dirigido al Tiempo Lunar Coordinado y luego en marcha libre o redirigido cada N segundos: la curva de error de tiempo x(t) como raíz de la suma de cuadrados del término de ley de potencias del reloj, un residuo de dirección constante (ILUSTRATIVO), un residuo constante de realización del LTC y un término opcional de tasa por altura de estación; el tiempo tras una dirección hasta { "1" }, { "10" } y { "100" } ns (o umbrales indicados) por bisección junto a la inversa en forma cerrada para el tipo de ruido dominante, y el término dominante en cada horizonte indicado, todo con unidades

# text
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Retardo VLBI de campo cercano para una línea base terrestre que observa una baliza lunar + derivadas parciales

# text
seg-e08e98908f3a = Earth-GNSS a distancia lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Recepción de Earth-GNSS a distancia lunar: la capa de señal débil que nombra la Tabla { "1" } de P7 y para la que el motor no tenía modelo. Por satélite y por época calcula el ángulo fuera del eje respecto al nadir del transmisor, si la Tierra ocluye el trayecto recto, la distancia oblicua y su pérdida en espacio libre, la ganancia de transmisión en ese ángulo, la potencia recibida y la densidad de portadora a ruido; luego agrega solo los enlaces que superan un umbral de seguimiento, y barre una revolución completa de la constelación para que la respuesta sea una DISTRIBUCIÓN y no una instantánea. Tres hechos determinan el resultado y el informe declara cada uno: la Tierra subtiende { "13.90" } grados desde el radio de la constelación, por lo que el PICO del haz no está geométricamente disponible para ningún rayo dirigido a la Luna; lo que queda es el borde del lóbulo principal y los lóbulos laterales, el régimen en el que LuGRE operó en la Luna en { "2025" }; y la pérdida de trayecto en L1 es de unos { "208" } dB, unos { "25" } dB más que la que paga un usuario terrestre. MEDIDO sobre la geometría incluida de 24 satélites de clase GPS durante { "64" } épocas de un periodo orbital: disponibilidad de SEÑAL { "0.375" } con un mejor enlace de { "30.93" } dB-Hz, y disponibilidad de SOLUCIÓN DE POSICIÓN { "0.000" }: como máximo dos enlaces seguibles simultáneos, nunca los cuatro que necesita una posición. La separación de esas dos disponibilidades es el punto central, y el informe se niega a que se confundan: Earth-GNSS a distancia lunar es una capa de grado de TEMPORIZACIÓN, no de posición, y un a priori de resiliencia en capas debe tomar la disponibilidad de solución de posición. El condicionamiento se emite por la misma razón: todo satélite visible queda dentro de un cono de un par de grados de anchura visto desde la Luna, de modo que las líneas de visión son casi paralelas por construcción. Ejecutable como el tipo de escenario <c1/> Reformulado según D7: la afirmación a distancia lunar es la densidad de portadora a ruido RELATIVA entre satélites en una misma época, a partir de patrones de transmisión bidimensionales medidos (NAVCEN Block IIR/IIR-M), más visibilidad geométrica; no se afirma el C/N0 absoluto (Parker et al. informan de una pérdida común de { "7" } a { "12" } dB).

# text
seg-29df5b40a3f9 = Determinación de órbita lunar: Earth-GNSS frente a radiométrica terrestre

# text
seg-647902ebcee3 = Determinación de órbita en una órbita de halo casi rectilínea (o una órbita elíptica congelada) a partir de dos tipos de datos independientes: pseudodistancias Earth-GNSS recibidas a bordo (la regla de enlace de la fila Earth-GNSS a distancia lunar, más la oclusión por la Luna) y distancia y velocidad radial bidireccionales desde tierra de tres estaciones de la Deep Space Network. Cada una es un ajuste por mínimos cuadrados por lotes de un solo paso en torno a la órbita de referencia con su covarianza formal; una simulación de Monte Carlo con semilla de la diferencia entre ambas estimaciones comprueba si las dos covarianzas la explican (q = d' (P_G + P_R)^-1 d, chi cuadrado con seis grados de libertad cuando los modelos coinciden) y qué efecto tiene una aceleración no modelada sobre el estadístico.

# text
seg-652bdc29deea = Resolución de ambigüedades de fase de portadora lunar: superficie y orbitador

# text
seg-02496f9e9af2 = Fase de portadora y código Earth-GNSS de diferencia simple entre receptores en una estación de superficie lunar y un orbitador, con la diferencia de reloj por época perfilada fuera, una ambigüedad por paso continuo y el paso más largo como referencia de gauge. La covarianza flotante de ambigüedades es un complemento de Schur; LAMBDA resuelve los enteros, la tasa de bootstrapping se informa junto a una tasa de éxito de mínimos cuadrados enteros por Monte Carlo con semilla y las sigmas de posición flotante y fija. Informado tal como se encontró: con los { "12" } dBi registrados el problema de dobles diferencias no es formable (la enmienda { "1" } cambió el valor por defecto a { "25" } dBi tras ver solo los recuentos de disponibilidad), y a { "25" } dBi la fijación entera NO se logra: fuera de alcance (unos pocos por ciento como máximo) aunque la solución flotante mejora con el arco.

# text
seg-11dd1bb8e4e1 = Coestimación del sistema de referencia lunar: estaciones de superficie y orbitadores

# text
seg-a38c8d95e6c9 = Información de Fisher del datum del sistema de referencia lunar de siete parámetros a partir de telemetría láser desde estaciones terrestres a los cinco reflectores solos y con distancias orbitador-estación de superficie añadidas: la matriz de información, el rango, las sigmas de Cramer-Rao, la métrica de degeneración del módulo de identificabilidad lunar y conjuntos aleatorios de estaciones con semilla. La órbita se mantiene conocida en los ejes lunares (su error lo lleva la sigma de distancia del orbitador).

# text
seg-862977c4bb01 = Precisión del enlace espacial entre sistemas de referencia: GNSS, VLBI y telemetría láser colocalizados

# text
seg-a9ae8e99f00d = Precisión de Cramer-Rao de los desfases de traslación, escala y rotación entre técnicas de los sistemas de referencia GNSS, VLBI y de telemetría láser cuando una nave lleva las tres, con la posición de la nave eliminada en cada época y nueve parámetros de perturbación de enlace local con un a priori, barrida sobre la exactitud del enlace local. Covarianzas por la vía de la raíz cuadrada (las ecuaciones normales pierden los dígitos cuando las técnicas son casi perfectas).

# text
seg-ae627996875e = Sensibilidad del número de Love y de la libración lunares

# text
seg-28780d07c4a7 = Información de Fisher de h2, k2, l2 y las amplitudes de libración física a partir de telemetría láser (desplazamiento mareal radial y horizontal, rotación de reflectores), seguimiento de orbitadores (la aceleración k2 de grado 2 integrada a lo largo de la línea de visión, con la tendencia eliminada), un gravímetro de superficie (factor gravimétrico { "1" } + h2 - { "1.5" } k2) y un reloj de superficie (tasa fraccional ({ "1" } + k2 - h2) W2/c2, ligada a las constantes de tiempo lunar). Los valores nominales de h2 y l2 son puntos de linealización; el estudio dice qué es sensible a qué, no cuáles son los números.

# text
seg-da712b740519 = Aumento del DOP con balizas de superficie lunar

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Dilución de la precisión aumentada con balizas para un usuario de superficie lunar: las filas de línea de visión de los satélites visibles y las filas de medición de distancia de las balizas de superficie visibles se concatenan en una única matriz de diseño y se evalúan mediante el kernel DOP compartido, y el DOP resultante se transforma en una exactitud realizada de 1 sigma EN METROS mediante un error equivalente de medición de distancia del usuario por baliza compuesto como raíz de la suma de cuadrados de términos de sincronización de reloj, multitrayecto y levantamiento. La visibilidad de balizas es el horizonte geométrico de dos alturas de la Luna sin atmósfera, que no tiene extensión refractiva y es por tanto exacto en lugar de aproximado. Ejecutable como el tipo de escenario <c1/>, que informa de los satélites solos, los satélites más las balizas, y una constelación mayor como la vía alternativa hacia la misma geometría. MEDIDO sobre la geometría de referencia incluida (usuario a -80 grados, tres balizas topografiadas, LCNS ilustrativo de seis satélites en t={ "0" }, máscara de { "5" } grados): { "5" } satélites visibles dan PDOP { "9.6941" } y un 1 sigma 3-D de { "11.222" } m; añadir las balizas que realmente superan el horizonte da PDOP { "4.1160" } y { "4.765" } m, un factor de { "2.355" }; el servicio de 24 satélites da en cambio PDOP { "2.4226" } y { "2.804" } m, un factor de { "4.002" }. El informe imprime el número de balizas VISIBLES y no el configurado, y en esta geometría solo UNA de las tres balizas supera el horizonte: los dos emplazamientos laterales están a unos { "333" } km del usuario frente a un horizonte de { "86" } km para una antena de { "2" } m, de modo que nunca se deja al lector suponer que contribuyeron las tres

# text
seg-845e9f5eec81 = Nivel de protección de modo común y envolvente total de integridad

# text
seg-e4ec41d0f5e1 = Observabilidad absoluta de estaciones lunares (defecto de datum)

# text
seg-b3e4160042d2 = Observabilidad por información de Fisher de la solución lunar conjunta: sin líneas base con la Tierra, el datum del marco absoluto queda en el espacio nulo de HᵀWH (la posición de la estación no es observable); ≥{ "3" } líneas base restituyen el rango completo y acotan el error de Cramér–Rao de la estación, cota que el estimador alcanza

# text
seg-2ed7181c97dd = Generación de códigos de ensanchamiento LunaNet AFS (LSIS V1.0)

# text
seg-13ff6c381275 = Los códigos de la Augmented Forward Signal de LSIS V1.0 ({ "29" } de enero de { "2025" }): el código primario AFS-Q de 10230 chips generado a partir de la construcción del piloto L1C de IS-GPS-800 con los índices de IS-GPS-800J (las mismas { "210" } asignaciones que imprime el Apéndice D de LSIS), los códigos Gold AFS-I de 2046 chips generados a partir de g1 = x^{ "11" } + x^{ "2" } + { "1" } y g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } con el retardo G2 de cada PRN recuperado del archivo del Anexo { "3" } de la norma, los cuatro códigos secundarios, los códigos terciarios de 1500 chips, la asignación provisional de nodos de la Tabla { "11" } y el código piloto escalonado. El contenido de LSIS se lee en tiempo de ejecución desde una caché local verificada con SHA-256 y rellenada desde el PDF alojado por la NASA, nunca redistribuido

# text
seg-56c7aeac59c1 = Decodificabilidad en lazo cerrado de LunaNet AFS por un receptor independiente (LSIS V1.0)

# text
seg-da2d29d437b0 = Una grabación AFS de Kshana adquirida, seguida y decodificada por un receptor de software independiente y comparada con las propias etiquetas de verdad de la grabación. Esto demuestra solo el ajuste a la norma y la coherencia de las etiquetas; no es una afirmación sobre la física del canal, la propagación, la potencia recibida ni los presupuestos de enlace, cuyos valores en la grabación son entradas elegidas

# text
seg-780369fb9a54 = Ajuste a la norma de GPS L1 C/A entre generadores

# text
seg-ee47b60515f1 = Códigos de ensanchamiento GPS L1 C/A (sdr::CaCode) y subtramas LNAV 1-3 (gps_lnav: cuantización de campos de IS-GPS-200 con el pi de la especificación, empaquetado en complemento a dos, palabras TLM y HOW, paridad de la Tabla 20-XIV con inversión D29*/D30*, los bits que resuelven la paridad de las palabras { "2" } y { "10" }) comparados bit a bit con gps-sdr-sim sobre su brdc0010.22n incluido ({ "32" } satélites)

# text
seg-bf429c8f00fb = Adquisición IQ de GNSS sobre muestras I/Q generadas de forma independiente

# text
seg-9a0c52bfb06e = iq::acq::acquire (búsqueda paralela de fase de código por FFT con el umbral Marcum-Q de ley cuadrática) con la réplica GpsL1Ca, sobre { "20" } ms de la propia salida I/Q de 8 bits de gps-sdr-sim decodificada por el decodificador de muestras iq::io (ci8, { "2.6" } MHz, { "11" } satélites, sin ruido): cada PRN { "1" } a { "32" } buscado en dos ventanas de { "10" } ms, con el resultado comparado con la fase de código y el Doppler que gps-sdr-sim moduló

# text
seg-f40dc3dac990 = Monitores IQ puntuados en campañas de reproducción de laboratorio: detección, omisiones, falsas alarmas y cifras de falsas alarmas en forma cerrada

# text
seg-93fb3109728c = iq::campaign::detect y el ejecutor de campañas: una tabla opcional [monitors] ejecuta los monitores IQ en cada celda en la pasada única del ejecutor. Los monitores de potencia y espectrales ven las muestras después de cada cadena de front-end; los monitores de C/N0, SQM y enganche ven las actualizaciones de lazo de cada canal seguido. Cada alarma se puntúa frente a los eventos indicados: detectada u omitida por (evento, tipo de alarma, canal), tiempo hasta la detección, y falsas alarmas fuera de los eventos sobre su exposición. Se indica la cifra de falsas alarmas en forma cerrada de cada prueba: potencia por bloque (cola Gamma exacta), exceso espectral por bloque (aproximación), curtosis (gaussiana unilateral), pulsos (techo binomial), SQM por actualización promediada (2Q(k) = Q(1/2, k^2/2), nueva), y el ARL0 del CUSUM de C/N0 (Siegmund). Sin la tabla, las celdas, claves y resúmenes no cambian. No se sintetiza ninguna forma de onda de interferencia

# text
seg-5b7eb7ddb474 = ROC de detección de los monitores IQ a partir de una campaña de reproducción de laboratorio puntuada

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) e iq::campaign::report::rocs: cada celda de una campaña con monitores conserva, por tipo de alarma y canal, el máximo del propio estadístico de prueba del monitor sobre cada ventana de evento indicada (positivo) y sobre ventanas roc_window_s en mosaico fuera de los eventos (negativo). Los estadísticos son la desviación de potencia de bloque, el exceso de PSD, la z de curtosis, el |z| SQM de la métrica promediada y el CUSUM de C/N0. El informe los agrupa por tipo en una ROC empírica a nivel de ventana con su AUC y el punto de operación en el umbral configurado, escrita como roc.json (kshana.campaign-roc/1) y una sección Detection ROC de report.html. Una campaña sin monitores no escribe ninguno de los dos

# text
seg-3a3cfa322f01 = Calibración de los modelos de C/N0 y de enganche del receptor abierto con los resultados de campañas IQ, con error de predicción indicado

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) y <c1/> en <c2/>, Python <c3/> y la herramienta MCP labfit (carpetas de campaña solo dentro de su directorio de trabajo): lee una carpeta de salida de <c4/> por su DIGEST y agrupa las celdas puntuadas en unidades de ajuste (señal x diseño de lazo x cadena de front-end x tipo de interferente, nunca agrupadas). Por unidad, ajusta el C/N0 medido frente al J/S indicado con la forma de separación espectral. Q_eff no es identificable a partir de datos de C/N0 sin una medición independiente de las potencias del interferente y de la señal, por lo que Q se indica, nunca se ajusta (la tabla de tipos, la q del evento o, para un tipo desconocido, el valor indicado más perjudicial, cw Q = { "1" }). El parámetro ajustado es el desfase identificable delta_eff = delta - { "10" } log10 Q, y la guarda de correlación informa de la degeneración. Los intervalos de C/N0 con enganche inferior al { "90" } % se censuran y se enumeran. El umbral de J/S se da directamente y mediante la forma cerrada; los modelos de lazo de seguimiento y de enganche empírico se acoplan a través del modelo de C/N0, con tiempos de caída y de reenganche. Un bootstrap de conglomerados con semilla sobre grabaciones ({ "1000" } réplicas) da intervalos percentiles; los intervalos de predicción del { "90" } % proceden de extracciones de residuos; las exclusiones de una grabación por vez se dividen en interpolación y extrapolación; una tabla [validation] preregistrada se resume con hash y cada umbral se juzga como PASS/FAIL. Informe kshana.labfit-iq/1 como JSON, CSV y Markdown generado, con un bloque de unidades. Solo sintético (sin grabación de terceros ni forma de onda de interferente). La vía labfit del registro del receptor no cambia

# text
seg-9537d301c95e = Codificación LNAV de GPS decodificada por una biblioteca de receptor independiente

# text
seg-909415621881 = Las subtramas LNAV 1-3 de Kshana (gps_lnav::encode_subframes) para las { "32" } efemérides brdc0010.22n alimentadas a decode_word y decode_frame de RTKLIB: paridad de cada palabra, decodificación de subtramas con emisión de datos coherente, y cada parámetro decodificado frente al entero de Kshana y frente al valor de entrada

# text
seg-f66855e35c53 = Codificación del mensaje de navegación LNAV de GPS

# text
seg-8caf8366e2f8 = Subtramas LNAV 1-3 de IS-GPS-200 (gps_lnav::encode_subframes: cuantización por redondeo al más próximo de cada parámetro de reloj y de órbita con los factores de escala y el valor de pi de la especificación, empaquetado en complemento a dos, palabras TLM y HOW, paridad de la Tabla 20-XIV con inversión D29*/D30*, los bits que resuelven la paridad de las palabras { "2" } y { "10" }), el mensaje que transmite un generador de señal GPS L1 C/A

# text
seg-c5c944357643 = Adquisición y estimación de C/N0 sobre IQ lunar real

# text
seg-f5dcb5e06bf4 = Búsqueda paralela de fase de código (acquisition::pcps_acquire: FFT portátil, plegado coherente, acumulación no coherente, umbral chi cuadrado para una probabilidad de falsa alarma en toda la búsqueda), refinamiento, correlación prompt en lazo abierto con Doppler de código y el estimador de C/N0 M2M4, ejecutados sobre los lotes IQ de 4 bits L1 de LuGRE leídos mediante realdata::ion_sdr

# text
seg-709626569a5c = Adquisición sobre IQ lunar real frente al Doppler predicho por órbita (decisión por potencia de muestra)

# text
seg-784ebd80c425 = acquisition::pcps_acquire con su decisión por potencia de muestra sobre los nueve lotes L1 de LuGRE no superficiales con niveles mid-rise; diferencias de Doppler entre satélites adquiridos comparadas con las diferencias predichas a partir de las órbitas finales de ESA y de la trayectoria Blue Ghost reconstruida por Firefly

# text
seg-89875d67b253 = Adquisición sobre IQ lunar real puntuada por Doppler predicho por órbita

# text
seg-956bcfeaf319 = acquisition::pcps_acquire con la decisión de promediado por celdas (pico sobre la celda media de la cuadrícula, robusta al ruido de banda limitada) sobre los nueve lotes L1 de LuGRE no superficiales con niveles mid-rise; diferencias de Doppler entre satélites adquiridos comparadas con las diferencias predichas a partir de las órbitas finales de ESA y de la trayectoria Blue Ghost reconstruida por Firefly

# text
seg-8fa779dd1788 = Adquisición sobre IQ lunar real reservado frente al Doppler predicho por órbita

# text
seg-484868771231 = acquisition::pcps_acquire (decisión de promediado por celdas, probabilidad de falsa alarma { "1e-7" }) con refine_doppler_coherent sobre los lotes L1 de LuGRE grabados en la superficie lunar (I en el nibble alto, niveles mid-rise); diferencias de Doppler entre satélites adquiridos frente a las diferencias predichas a partir de las órbitas finales de ESA y del núcleo del lugar de aterrizaje de Firefly

# text
seg-10af60b488b9 = Estación de referencia diferencial de clase NovaMoon: cancelación de modo común + residuo creciente con la línea base + niveles de protección DGNSS

# text
seg-c04a3591074c = Exportación de interoperabilidad lunar

# text
seg-91f4a066b3c0 = Exportación alineada con LunaNet/IOAG de marco lunar + tiempo + efemérides (CCSDS OEM + KIF) con ajuste a la norma de ida y vuelta

# text
seg-8ab65cbefb75 = Puntuación alineada con marcos de resiliencia PNT

# text
seg-c48198f31d63 = Subpuntuaciones por dimensión sobre las siete categorías de resiliencia propias de Kshana (no términos del DHS), las funciones RDRR de RethinkPNT y los criterios de Yang, cada una etiquetada como modelada con su factor determinante; nivel RPCF provisional con una compuerta de degradación acotada. Autoevaluación derivada de simulación, nunca una certificación.

# text
seg-d7bdb6fe186e = Estudio de inestabilidad de decisión de la puntuación de resiliencia

# text
seg-5fcf18a68bb1 = Cuantifica cómo una única puntuación compuesta / nivel RPCF reordena arquitecturas bajo un símplex de ponderaciones defendible y un conjunto de amenazas (tasa de cambio del top-1, dispersión de tau de Kendall, tasa de cambio de nivel, rangos de clasificación); análisis de declarado frente a medido y de colapso de diversidad.

# text
seg-1bf03544a010 = Representatividad de la demostración y brechas hasta el vuelo

# text
seg-db24d16d38c9 = Registro de honestidad por resultado que califica la salida de una demostración: sus anclajes externos, supuestos modelados, brechas hasta el vuelo y banda TRL representativa, con invariantes impuestos (lo validado requiere un anclaje externo; lo modelado requiere una brecha y no puede afirmar por encima de TRL { "4" }).

# text
seg-52ab936eb5f5 = Evidencia de compromiso cuántico frente a clásico (forma común)

# text
seg-a6679ed5bed7 = Un objeto TradeEvidence reproducible (marco fijo: escenario+semilla+motor; valores comunes por FoM cuántico frente a clásico con beneficio de polaridad correcta, IC del { "95" }% opcional, etiqueta validado/modelado) que lleva un registro de representatividad, de modo que cada vertical de PNT cuántico informa del compromiso de la misma manera honesta.

# text
seg-20fee61b3107 = Biblioteca de modelos de error de dispositivos cuánticos

# text
seg-e42eabe9bc2a = Tarjetas de dispositivo (relojes ópticos/de iones atrapados/de iones de mercurio + relojes clásicos reutilizados de holdover/clock_state; interferómetro de átomos fríos; enlaces de transferencia de tiempo clásicos + de entrelazamiento/fotón único), cada una con un registro de representatividad; el enlace de entrelazamiento añade un modelo de precisión de temporización limitado por ruido de disparo (~jitter/sqrt(R*tau), penalización por cuentas oscuras, suelo sistemático).

# text
seg-86d71fd89f26 = Temporización cuántica de confianza (transferencia de tiempo + difusión segura + anomalía)

# text
seg-d2a3d37825ef = Cadena de transferencia de tiempo cuántica frente a clásica de extremo a extremo (deriva del reloj + precisión del enlace en cuadratura), un nivel de protección de temporización reutilizado, un FoM de seguridad frente a ataques de retardo/repetición (1-P_md) y una probabilidad de detección de anomalías del reloj + latencia del CUSUM, emitidos como TradeEvidence honesto con un registro de representatividad.

# text
seg-eaf341ff4522 = Navegación cuántica sin GNSS

# text
seg-908a44a9f7c7 = Navegación a estima con INS cuántico (interferómetro de átomos fríos) frente a INS clásico de grado de navegación durante una interrupción de GNSS: crecimiento del error de posición, holdover hasta un umbral de posición y el compromiso cuántico frente a clásico como TradeEvidence honesto; nota honesta de observabilidad (el sesgo no es observable sin una corrección de posición, por lo que el error crece).

# text
seg-914132833f5a = Detección de fallos/anomalías en sistemas PNT cuánticos

# text
seg-f20392820b9d = Catálogo etiquetado de fallos cuánticos (salto/deriva de frecuencia del reloj, pérdida de enganche; salto de sesgo/pérdida de señal del sensor), un AUC de ROC del estadístico de detección con IC por bootstrap y un fallo mínimo detectable con una tasa de falsa alarma fija; un monitor asistido por reloj cuántico detecta fallos menores que uno clásico, emitido como TradeEvidence honesto.

# text
seg-d31be81dfd8f = Geolocalización pasiva de emisores por TDOA/FDOA

# text
seg-aa870cee16f6 = Localizar un emisor (interferente/falsificador, o una fuente oportunista para PNT inverso) a partir de la diferencia de tiempos de llegada en una red de receptores (la intersección de hiperboloides τᵢ=(Rᵢ−R₀)/c resuelta por mínimos cuadrados de Gauss–Newton) y, añadiendo la diferencia de frecuencias de llegada (diferencias de velocidad de distancia) con receptores en movimiento, recuperar conjuntamente posición y velocidad; con la cota inferior de Cramér–Rao sobre la covarianza de posición a partir de la geometría de medición

# text
seg-5bd3882531b6 = Calentamiento convectivo de entrada en el punto de estancamiento (Sutton-Graves) en una entrada de 3-DoF

# text
seg-4f97036ed72f = Flujo de calor convectivo en el punto de estancamiento q = k sqrt(rho/R_n) V^{ "3" } con las constantes de Sutton-Graves para aire terrestre y para la atmósfera de Marte (NASA TR R-376, { "1971" }), su pico y la carga de calor integrada a lo largo de una entrada de 3-DoF, balística o con sustentación a ángulo de alabeo constante, en la Tierra o en Marte.

# text
seg-1b96577665fc = Radiometría de un generador de imágenes electroóptico, MTF, respuesta relativa de borde y NIIRS de GIQE { "4" }

# text
# c1: eo-radiometry
seg-38902593e841 = Presupuesto de relación señal-ruido de un generador de imágenes en nadir (radiancia de escena lambertiana, ecuación de la cámara, ruido de disparo, oscuro, de lectura y de cuantización), la MTF del sistema en Nyquist como producto de la difracción de apertura sin obstrucción, la apertura del detector, el emborronamiento lineal y la vibración gaussiana, la respuesta de borde y la respuesta relativa de borde integradas a partir de esa MTF, Q = lambda F / p, y el NIIRS de GIQE versión { "4" } sin compensación de MTF. Ejecutable como el tipo de escenario <c1/>.

# text
seg-07ca77a67207 = Pérdidas de ascenso de lanzamiento por gravedad, arrastre, guiado y contrapresión

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ascenso planar con giro por gravedad de un vehículo multietapa sobre una Tierra esférica sin rotación a través de la Atmósfera Estándar de EE. UU. { "1976" } (densidad y presión), con un impulso de cabeceo, empuje reducido por la contrapresión de la tobera, agotamientos de etapa en límites de paso exactos, y las pérdidas por gravedad, arrastre, guiado y contrapresión integradas junto al estado. Ejecutable como el tipo de escenario <c1/>.

# text
seg-55e8345def8b = Ecuación bidireccional de TWSTFT, presupuesto de incertidumbre y estabilidad del enlace con no reciprocidad de flicker y diurna

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = La ecuación bidireccional de TWSTFT resuelta para T_A - T_B con retardos de transmisión y recepción de las estaciones, la asimetría ionosférica de subida/bajada en banda Ku, la diferencia de retardo del transpondedor y los términos de Sagnac, frente a su modelo directo exacto; un presupuesto de incertidumbre en cuadratura con la TDEV del enlace como término de tipo A; una serie bidireccional con ruido de fase blanco y flicker (Kasdin-Walter), una no reciprocidad diurna y un residuo constante de reciprocidad; y la tasa, el RMS residual, la TDEV y la ADEV de series suministradas de Circular T, MJD-CSV o reloj de estación IGS RINEX. Ejecutable como el tipo de escenario <c1/>.

# text
seg-2f9be02c92bc = Numérica de la atmósfera de una trayectoria oblicua óptica: varianza de Rytov, centelleo, probabilidad de desvanecimiento gamma-gamma, promediado de apertura, profundidad óptica de nubes y de aire despejado

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Cn2 de Hufnagel-Valley integrada a lo largo de una trayectoria oblicua para la varianza de Rytov de onda plana y esférica (enlace ascendente y descendente), el índice de centelleo de Andrews-Phillips y los parámetros gamma-gamma, la probabilidad de desvanecimiento gamma-gamma y el margen de desvanecimiento, el factor de promediado de apertura de turbulencia débil, la profundidad óptica de nubes de una columna de agua líquida y la profundidad óptica de aire despejado de visibilidad de Kim más Rayleigh, que sustituye la pérdida atmosférica global del presupuesto de enlace óptico cuando se suministra una atmósfera. Ejecutable dentro del tipo de escenario <c1/>.

# text
seg-a2faab92e760 = Disponibilidad de emplazamientos ópticos en tierra dependiente del tiempo meteorológico y diversidad de emplazamientos correlacionada con la distancia

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Disponibilidad de un enlace óptico frente a un margen de enlace indicado a partir de un clima de agua líquida de nubes lognormal (cantidad de ITU-R P.840, extinción de óptica geométrica) y del desvanecimiento por turbulencia gamma-gamma independiente, el margen de enlace necesario para disponibilidades objetivo y el techo que ningún margen supera, duraciones de interrupción lognormales, hipótesis de técnicas de mejora y una disponibilidad de red de cópula gaussiana de un factor cuya correlación de pares es exp(-distancia/longitud de decorrelación). Ejecutable como el tipo de escenario <c1/>.

# text
seg-043ece801e72 = Continuidad de temporización y de medición de distancia a través de interrupciones ópticas

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = La distribución de la duración de interrupciones de un emplazamiento óptico acoplada a la varianza de deriva en forma cerrada del modelo de holdover del reloj: error de temporización y de medición de distancia en cuantiles de interrupción indicados, el holdover hasta un umbral de temporización, la fracción de interrupciones y de tiempo de interrupción dentro de él y la disponibilidad de temporización A + U E[min(D, T_h)]/E[D], para las clases de reloj clásica y cuántica. Ejecutable dentro del tipo de escenario <c1/>.

# text
seg-b119df65d2a7 = Margen de enlace óptico frente al tiempo: una realización con semilla del tiempo meteorológico de un emplazamiento

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Una tabla opcional <c1/> (duración, paso, semilla) hace que el tipo de escenario <c2/> escriba además, por emplazamiento, una realización con semilla del modelo de emplazamiento indicado a lo largo del tiempo: episodios de nubes (periodos despejados exponenciales, interrupciones por nubes lognormales con la media y dispersión indicadas, con la proporción de tiempo nublado fijada a la probabilidad de nubes indicada), una columna de agua líquida lognormal por episodio de nubes, una muestra de centelleo gamma-gamma por paso, y a partir de ellas el margen de enlace, los desvanecimientos por nubes y por centelleo y el indicador de enlace activo, con la disponibilidad, la fracción de nubes, el número de interrupciones y la interrupción más larga realizados. Sin la tabla el resultado es el documento de { "0.37" }. Los sorteos pasan por las rutas portátiles de distribuciones y matemáticas, de modo que native y wasm32 dan los mismos bytes.

# text
seg-58cbf576c959 = Lector de archivos de datos orbitales TRK-2-18 y modelo Doppler de 2 vías con rampas de Marte

# text
seg-d1055650a77f = Un lector de archivos de datos orbitales de la DSN (TRK-2-18): los grupos de registros de 36 bytes (etiqueta de archivo, identificador, datos orbitales, rampas por estación, desfases de reloj, resumen, fin de archivo), y en cada registro de datos orbitales la marca de tiempo desde { "1950" }, retardos de enlace descendente y ascendente, observable, estaciones, tipo de dato, bandas, validez, canal, nave, la frecuencia de referencia de 46 bits y el tiempo de compresión; tiempos de inicio y fin de rampa, tasas y frecuencias iniciales. Sobre él, un modelo Doppler de 2 vías en banda X con rampas (rampas de enlace ascendente integradas, tiempo de luz de ida y vuelta con Shapiro y troposfera, estaciones de la DSN mediante la cadena CIO IAU 2006/2000A y EOP de IERS, tiempo de estación) y una determinación de órbita por lotes de un orbitador de Marte (campo GMM-3, terceros cuerpos, SRP, arrastre).

# text
seg-455dc946c965 = Estimación de actitud con EKF multiplicativo a partir de un giroscopio y un seguidor estelar

# text
# c1: aocs
seg-553d043438b4 = El EKF multiplicativo de Lefferts-Markley-Shuster: estados de error de actitud en ejes cuerpo y de sesgo del giroscopio, propagación con la velocidad del giroscopio menos la estimación del sesgo y el ruido de proceso discreto de Farrenkopf (paseo aleatorio de ángulo y de velocidad), actualizaciones del seguidor estelar con el residuo { "2" } vec(q^-1 q_st) en forma de Joseph y el reinicio multiplicativo; un simulador discreto de Farrenkopf de giroscopio y seguidor estelar. El tipo de escenario <c1/> puede cerrar el lazo de control sobre su estimación.

# text
seg-a971ff07592a = Ciclo de trabajo de la apertura entre navegación y comunicaciones

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Una ejecución toma un plan de contactos (una lista de ventanas aos_s/los_s, cada una pidiendo a la apertura navegación o comunicaciones: el mismo vocabulario de ventanas que emite <c1/>, convertido por <c2/>), un número de aperturas y una política de arbitraje explícita, y devuelve el ciclo de trabajo de navegación, el de comunicaciones, el de inactividad y la interrupción por sesión. La política es una entrada con un valor por defecto documentado (<c3/>; también <c4/> y <c5/> no apropiativa), y el informe lleva la política resuelta, su definición completa y las definiciones de ciclo de trabajo e interrupción, porque una cifra de ciclo de trabajo citada sin su regla de arbitraje no es reproducible. La planificación es un barrido exacto de intervalos sobre los límites de las ventanas, de modo que una ventana que termina justo donde empieza la siguiente nunca compite, y los segundos de apertura de navegación, de comunicaciones y de inactividad se acumulan de forma independiente en ese único barrido. Ejecutable como el tipo de escenario <c6/>

# text
seg-43cd7aa7ab53 = Interferencia de RF en la navegación de superficie lunar (J/S por satélite)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Relación interferente-señal nativa lunar, C/N₀ efectiva y pérdida de enganche para un usuario selenográfico de superficie bajo un interferente de superficie lunar (o elevado), sobre la constelación ilustrativa de clase Moonlight/LCNS de fuentes públicas. Compone la cadena abierta de interferencia (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) con la geometría abierta del cielo lunar (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no se rederiva ninguna geometría ni radiometría. A diferencia del tipo de escenario terrestre <c1/>, el tramo de señal no es una potencia recibida fija: la potencia recibida isótropa de cada satélite es su propio EIRP del presupuesto de enlace − FSPL(distancia oblicua), de modo que J/S varía de un satélite a otro con la distancia y la elevación lunares. Emite UNA FILA POR ENLACE VISIBLE (época, satélite) como JSON y como artefacto *.table.csv, con las dos potencias recibidas cuya diferencia es J/S impresas junto a ella; las cifras de mérito agregadas se sitúan junto a esa tabla, nunca en su lugar. Ejecutable como el tipo de escenario <c2/>

# text
seg-4c116e25c5c5 = Contorno de denegación lunar con una banda de incertidumbre a partir de la dispersión medida de C/N₀

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = El informe <c1/> ya no apoya su contorno de denegación en un único escalar. Emite la distribución completa medida de C/N₀ de la señal deseada sobre la tabla por satélite (n, mín., p05, p25, mediana, p75, p95, máx., media, desviación típica muestral y la propia asimetría de la muestra (p95 − mediana) − (mediana − p05)) junto a las filas por enlace, que no cambian. El contorno se informa entonces en cada uno de esos estadísticos de orden bajo AMBOS criterios de denegación que reconoce el motor, nunca uno en lugar del otro: el criterio vigente de relación de potencias (J/S = { "30" } dB, el mismo umbral que usan attack_surface y tracking_loop, y el criterio tras la columna <c2/> de la tabla publicada de interferencia de enlaces lunares), y el criterio de pérdida de enganche (la C/N₀ efectiva que cae hasta tracking_threshold_dbhz), que es el criterio con el que se puntúa la propia columna links[].status de este informe. Cada punto del contorno se da en ambos ejes del plano de denegación (el EIRP del interferente necesario a la distancia del escenario, y la distancia de denegación al EIRP del escenario), de modo que la banda es un intervalo sobre los mismos ejes en que se dibuja un gráfico de contorno. Los bordes de la banda SON contour(p05) y contour(p95): la misma aplicación en forma cerrada aplicada a los propios cuantiles de la muestra, no un sigma ajustado a la muestra ni la mediana ± k·desviación típica, y el informe lo indica en una cadena band_definition junto a las cifras. stdev se emite por continuidad y no lo usa nada. Un cuantil cuya C/N₀ ya está en el umbral de seguimiento o por debajo no tiene J/S denegante finita; esas columnas se emiten como null con una razón contada en lugar de como un infinito o un radio limitado

# text
seg-2d3944107ba0 = Potencia de detección del monitor de integridad intermodal

# text
seg-38bc7c0bfe57 = El informe hybrid-optical-rf indica lo que el monitor chi cuadrado intermodal puede DETECTAR realmente, y no solo que pasa un caso sin fallos: el sesgo mínimo detectable por eje monitorizado (este, norte, arriba, reloj) con las probabilidades de falsa alarma y de detección omitida indicadas del escenario, la curva de potencia de detección a cada lado de él, el múltiplo de sesgo sin ruido en el que el estadístico realizado cruza por primera vez el umbral y el tiempo hasta la detección de una rampa de sesgo a una tasa indicada. También se inyectan fallos a través del monitor real y el estadístico que devuelve se informa junto a la predicción analítica

# text
seg-38cabd4921c1 = Recrecimiento de la covarianza tras el traspaso frente al límite de alerta

# text
seg-9287268bbada = El informe hybrid-optical-rf expone el modelo de ruido de proceso del filtro e indica cuánto tiempo permanece la solución posterior al traspaso dentro del límite de alerta: para ambos sentidos de traspaso lleva la covarianza por eje que dejó el traspaso, la propaga hacia delante bajo un ruido de proceso de paseo aleatorio indicado, e informa del instante en que el 1σ escalado por cobertura alcanza los límites de alerta horizontal, vertical y de temporización, de qué límite actúa primero, de la constante de tiempo de duplicación de la varianza y de un perfil de deriva muestreado que acota el cruce. Las PSD de ruido de proceso, el factor de cobertura y los límites de alerta son entradas con valores por defecto documentados

# text
seg-a3b8272862aa = Patrón de antena fuera del eje en la exportación de geometría lunar

# text
seg-27d246503a48 = La exportación de geometría por satélite lleva, por (época, satélite), el ángulo fuera del eje EN EL SATÉLITE y la ganancia de transmisión hacia el emplazamiento a partir del patrón real de apertura circular de iluminación uniforme (Airy), e informa del recuento en haz bajo ese patrón JUNTO AL recuento en haz bajo la aproximación simétrica de ganancia a ancho de haz (θ_3dB[grados] = √(31000/G_lin)), con la diferencia emitida como corrección explícita en enlaces, en satélites por época y como la peor época individual. Se emiten ambas eficiencias de apertura implícitas de la aproximación ({ "0.641" } frente a la regla de { "70" }·λ/D grados con la que se cita, { "0.920" } frente a una apertura circular uniforme), de modo que la eficiencia que supone en silencio se indica en lugar de inferirse. Desactivada por defecto: el bloque aparece solo cuando se dan a la vez un emplazamiento de exportación y una apertura

# text
seg-6fbfa234ef3e = Pérdida de enganche del lazo de seguimiento y arrastre de falsificación bajo interferencia

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Pérdida de enganche calculada a partir de la dinámica del lazo en lugar de una relación de potencias: fluctuación térmica 1σ de portadora (Costas) y de código (anticipado/retardado no coherente) frente a C/N₀ con la pérdida por elevación al cuadrado, frente a las reglas indicadas 3σ_PLL + θ_e ≤ { "45" }° y 3σ_DLL + retardo de rampa ≤ d/2 chips; umbrales de C/N₀ de caída y de reenganche con el lazo determinante nombrado y la histéresis DERIVADA del mayor ancho de banda de arrastre en lugar de afirmada; el tiempo declarado hasta perder el enganche de un detector de enganche de dos umbrales con permanencias de confirmación, informado por separado del tiempo físico de escape de fase (tiempo medio de Viterbi entre saltos de ciclo, en log₁₀ s porque abarca cientos de décadas); la mayor deriva de código y tasa de Doppler de portadora que pueden seguir los lazos de la víctima; y el RADIO DE DENEGACIÓN que implica la dinámica del lazo, informado junto al radio de relación de potencias existente con su diferencia con signo como campo propio con nombre. Ejecutable como el tipo de escenario <c1/>

# text
seg-0f4d023fe2d4 = Covarianza de coordenadas de un punto de la superficie lunar a partir de un plan de retardos de VLBI, distinta de la de la estación terrestre

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Una tercera opción de datum, <c1/>, que mantiene fijas todas las estaciones terrestres y estima solo las coordenadas fijas al cuerpo lunar de la BALIZA: la configuración para la que realmente se cita la incertidumbre de un punto de la superficie lunar, ya que las coordenadas de las estaciones terrestres son una entrada del modelo de retardo y no una incógnita suya. Existe porque la covarianza a nivel de estación y la covarianza del punto de superficie son MAGNITUDES DISTINTAS separadas por el brazo de palanca ρ/B, y nada impedía antes citar una frente a la otra. El bloque <c2/> emitido lleva ρ, la línea base más larga, el brazo de palanca, la forma de punto de superficie del enlace de equipartición c·σ_τ·(ρ/B)·√(g/N), el sigma de baliza por coordenada calculado y su razón, siendo la razón null en lugar de engañosa siempre que la baliza no se estima o la matriz es de rango deficiente. B se toma como la línea base MÁS LARGA presente, la más favorable, de modo que la razón solo puede subestimar. Ejecutable como <c3/> con <c4/>, que se rechaza con un mensaje que nombra la entrada que falta cuando la baliza no se estima

# text
seg-0315968c8214 = PNT diferencial lunar: presupuesto de residuo del enlace de corrección

# text
seg-c6785166a44c = Los tres términos que una corrección diferencial acumula entre la época en que se calcula y la época en que se usa, cada uno dejado antes como margen sin modelar: error de levantamiento de la estación de referencia (correlacionado entre satélites, independiente de la línea base, transferencia de posición de ~{ "1" }:{ "1" } y demostrablemente no amplificado por DOP), envejecimiento de la corrección (el vector de error de órbita congelado reproyectado sobre la línea de visión en la que el propio propagador del motor sitúa el satélite una latencia después, más la deriva de reloj c·σ_y(τ)·τ de la ley de potencias calibrada) y cuantización uniforme del enlace sobre una escala completa exacta ±(orbit_err + clock_err) con varianza step²/12. Informado en los dominios de distancia y de posición, junto al residuo y al nivel de protección existentes y nunca en su lugar, con una curva de latencia junto a la cifra única

# text
seg-c42646ae4707 = Mapa de cobertura y exactitud de estaciones de referencia lunares

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Barrido de Monte Carlo del modelo de PNT diferencial lunar sobre una cuadrícula de usuarios del polo sur y un día de épocas (el tipo de escenario <c1/>): para una estación de referencia diferencial en un emplazamiento conocido del polo sur, por punto y sobre la región, el error de posición corregido y no corregido en percentiles (3-D, horizontal, vertical), la disponibilidad con una razón para cada época no disponible (user_lt4, station_missing_sat), la cobertura frente a un umbral indicado antes de la ejecución, los niveles de protección de DO-229E, el radio de cobertura por sector de acimut y el presupuesto del enlace de corrección en la estación y en el peor punto. No es una afirmación sobre el rendimiento de ningún sistema real; no está afiliado a ningún organismo ni avalado por él

# text
seg-7ecf4b0038b0 = Máscaras de horizonte del terreno lunar a partir de un perfil indicado o de un DEM polar

# text
seg-7102948907bc = Máscaras de horizonte dependientes del acimut por emplazamiento para el tipo de escenario lunar-station-coverage (la estación de referencia y cada punto de usuario) y para la cuadrícula de moonlight-service-volume y su emplazamiento de exportación por satélite (cada fila de exportación gana clears_terrain), en el formato de tabla de horizonte de { "0.36" } (skyline::Skyline, lineal en acimut con envoltura a { "360" } grados; un perfil indicado y un horizonte de DEM en un emplazamiento se combinan como su máximo puntual): un [terrain] station_horizon o user_horizon indicado con su fuente etiquetada, y/o un horizonte trazado por rayos sobre un DEM polar estereográfico del polo sur (la disposición polar en cuadrícula de LRO LOLA, leída de un descriptor que fija su tamaño y SHA-256, o un mosaico realdata::lola_dem de latitud/longitud con [terrain] dem_tile_path, repetido con su SHA-256) a lo largo de círculos máximos de la esfera lunar con curvatura exacta, desde una altura de mástil indicada, con un paso de acimut y un alcance indicados. Un satélite cuenta en un emplazamiento cuando supera la máscara plana mask_deg y el horizonte en su acimut (lunar_service::topocentric); una época que el horizonte deja con menos de cuatro satélites en un punto, donde la máscara plana da cuatro, se cuenta como la razón de no disponibilidad terrain_masked. El DEM incorporado es un recorte del producto LOLA LDEM_75S_240M de dominio público, remuestreado por media de bloques de { "5" } x { "5" } a { "1200" } m (data/lunar-dem/NOTICE.md). Si falta, cada emplazamiento conserva la máscara plana y cada documento es idéntico byte a byte

# text
seg-d37bb01e270b = Términos de multitrayecto y de hardware del receptor de la estación de referencia lunar

# text
seg-1103199f019b = La sección opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multitrayecto dependiente de la elevación sigma(el) = a + b exp(-el / el0) en el usuario y en la estación (la forma funcional aerotransportada de RTCA DO-229, con a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grados por defecto; en la Luna cada valor es ILUSTRATIVO), blanco en el usuario y de Gauss-Markov de primer orden sobre épocas en la estación (rho = exp(-dt / tau)); ruido térmico de código del DLL anticipado menos retardado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); sesgos entre canales por canal constantes durante un ensayo, en el usuario y en la estación. Los términos de estación entran en sus correcciones, los del usuario en las mediciones brutas y corregidas, cada uno con su propio flujo con semilla. Si faltan, cada documento no cambia

# text
seg-03796cb741b6 = Crecimiento del error de efemérides de la estación de referencia lunar durante la latencia de corrección

# text
seg-13b0ae9a874a = La entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): una corrección aplicada latency_s después de calcularse no recoge el crecimiento g latency_s del error de órbita difundida, siendo g isótropo de tasa RMS 3-D, sorteado por satélite y ensayo en su propio flujo con semilla (tasa de 1 sigma del rango tau / sqrt({ "3" })), además de la reproyección de línea de visión del error congelado. Si falta, cada documento no cambia. Un anexo K5 de la comparación con afirmaciones publicadas, preregistrado por separado, ejecuta K5 a { "0.001" }, { "0.01" } y { "0.1" } m/s (ILUSTRATIVO)

# text
seg-90307f07e0ef = Modos de solución de la estación de referencia lunar: restricción de altura, tres satélites, ventana de usuario estático

# text
seg-366c7ad03fb2 = La sección opcional [solution] de lunar-station-coverage (LRS-06): una fila de pseudomedición de altura up . dx = e_h de 1-sigma indicado ponderada frente a las filas de distancia, un mínimo de tres satélites permitido solo con ella, y una solución de mínimos cuadrados ponderados sobre las últimas window_epochs épocas con una posición estática compartida y un reloj por época (la respuesta de un filtro para una posición estática sin ruido de proceso sobre los mismos datos; los errores de las épocas se tratan como independientes). Si falta, la solución instantánea y cada documento no cambian. Un anexo a la comparación con afirmaciones publicadas con el estilo de solución de las fuentes, preregistrado por separado

# text
seg-611ba369ed00 = Exactitud y cobertura de la estación de referencia lunar frente a afirmaciones publicadas

# text
seg-4fe4f1cffa2b = El tipo de escenario lunar-station-coverage ejecutado bajo los supuestos públicos del material publicado sobre una estación de referencia diferencial lunar (cuatro satélites de navegación en órbitas elípticas congeladas de { "24" } h, SISE de { "10" } m al { "95" } %, ruido de código de { "0.30" } m, latencia de corrección de { "1" } s y { "600" } s, un levantamiento de estación submétrico, el emplazamiento de estación de ejemplo publicado, los círculos polares sur de { "300" } km y { "600" } km) y puntuado frente a las afirmaciones numéricas de las fuentes con seis umbrales unilaterales preregistrados antes de la ejecución: cobertura de todo el polo sur con p95 submétrico (K1, K2), p95 corregido submétrico y de nivel decimétrico (K3, K4), nivel submétrico mantenido con una latencia de { "600" } s (K5) y exactitud mantenida desde { "10" } km hasta { "500" } km de línea base (K6)

# text
seg-7bfcb5c6a985 = ARAIM con hipótesis de fallo simultáneo de varios satélites

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: la regla de determinación de subconjuntos de ADD v4.2 (P_THRES, FC_THRES, subconjuntos monitorizados con menos eliminados primero) generalizada de pares a combinaciones simultáneas de hasta max_order eventos de satélite y de constelación, con el prior exacto P_no fault prod q_e; add_v42_protection_levels_to_order ejecuta sobre él la vía de nivel de protección de ADD v4.2 (el orden { "2" } es exactamente la vía existente). raim::araim_subset_raim (opcional): RAIM avanzado sobre ese conjunto de hipótesis, cada subconjunto monitorizado como un modo (p_fault, T, b, sigma) en la suma de riesgo de integridad, subconjuntos inobservables trasladados al riesgo no monitorizado, el presupuesto escalado por la asignación de ADD del riesgo no monitorizado, e informando del subconjunto de mayor separación normalizada cuando se detecta un fallo. Los priors que necesitan subconjuntos más profundos que max_order se rechazan, nunca se truncan

# text
seg-48ca01332f8f = RAIM junto a las cifras de mérito de holdover del reloj

# text
seg-890f1006a75d = La sección opcional [integrity] del tipo de escenario clock (clock_integrity::run): a partir de un emplazamiento indicado y de preajustes de constelación (geometry::sky_geometry), en cada época de integridad mientras la línea de tiempo de GNSS no está denegada, RAIM instantáneo (raim::snapshot_raim: prueba chi cuadrado de paridad, niveles de protección por pendiente) sobre los satélites por encima de la máscara con residuos gaussianos con semilla del sigma indicado y un sesgo indicado opcional; un bloque integrity_fom separado con veredictos por época, niveles de protección y disponibilidad. Las épocas denegadas se informan como no disponibles, nunca extrapoladas; las cifras de mérito de holdover no cambian y, sin la sección, la salida es idéntica byte a byte

# text
seg-9cbb4ee7588a = Observabilidad cislunar por longitud de arco espacial, con ruido y de varias familias

# text
seg-5ebd771deef8 = El umbral de observabilidad cislunar por longitud de arco en el CR3BP ESPACIAL de seis estados en lugar del plano de cuatro estados, en las familias DRO, halo L2 y halo casi rectilíneo L2, con ruido de medición que entra en el gramiano y DOS criterios informados porque no hay uno único honesto: el criterio de rango publicado, que es demostrablemente invariante a un sigma de medición homocedástico (el blanqueo multiplica la matriz de observabilidad por un escalar, dejando sin cambios el espectro relativo de valores singulares y por tanto el rango, el defecto y la condición), y un criterio de estimabilidad (el primer arco en el que la incertidumbre formal 1σ de posición del estado inicial del jefe cae por debajo de una cota indicada), que es el que sí se mueve con el ruido. Cada umbral lleva el intervalo de la cuadrícula de épocas en el que se sitúa; un criterio no alcanzado es null con una razón. El modo plano sigue siendo el predeterminado y las familias fuera del plano se rechazan allí en lugar de aplanarse en un estado que no puede representarlas

# text
seg-e250321394bc = Error de predicción de orientación terrestre de estilo operativo, medido de predicho frente a final

# text
seg-0e443d241460 = Un ajuste de mínimos cuadrados de sesgo más tasa sobre una ventana final más los principales términos periódicos (anual, semianual y las dos mareas zonales principales para UT1; Chandler, anual y semianual para el polo), extrapolado arrastrando hacia delante el último residuo dentro de la ventana: la clase que usa el Boletín A de IERS, en lugar del predictor de persistencia en el que se apoyaba el horizonte publicado. Puntuado de la única manera honesta: un pronóstico para T+h construido a partir de filas rápidas del Boletín A en T o antes, medido frente al valor final del Boletín B PUBLICADO DESPUÉS en T+h, con la persistencia puntuada sobre el mismo conjunto de épocas frente a los mismos valores finales a su lado. Una época objetivo sin valor final publicado se descarta en lugar de volver a puntuarse frente a la columna rápida; un término periódico que la ventana no puede restringir se informa como rechazado con los ciclos que realmente abarca; una ventana incompleta se rechaza en lugar de acortarse en silencio

# text
seg-f4efd94dd746 = Datum del marco lunar a partir de una campaña de observación

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = El datum de Helmert de siete parámetros propagado desde una CAMPAÑA DE OBSERVACIÓN SIMULADA en lugar de recuperado de una transformación inyectada. Estaciones terrestres observan un catálogo con fuente de balizas de superficie lunar según un plan explícito; los parciales de retardo de VLBI lunar se acumulan en una matriz de información de Fisher de coordenadas de baliza y se llevan por el diseño de Helmert A = [I₃ | [p]ₓ | p] a H = AᵀM_bA, de modo que la exactitud del datum informada es función del programa de observación: exactamente lineal en el sigma de retardo y monótona en el arco a través de la libración que el informe MIDE. El defecto de datum es el tema y no una nota al pie: el rango, el defecto, el número de condición, el espectro, las direcciones no observables en la base de siete parámetros, la dirección más débil incluso a rango completo y la parte de ella de cada parámetro se emiten en cada ejecución, y cualquier parámetro que la campaña no restrinja se publica como NULL con un estado. La correlación de error de balizas se MIDE, no se supone: exactamente cero con las estaciones fijas, y se imprime con su coste cuando se estiman. Ejecutable como el tipo de escenario <c1/>

# text
seg-ca481f2d8f9e = Corroboración por estimador independiente del umbral de longitud de arco cislunar

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Un estimador de mínimos cuadrados por lotes que RECUPERA el estado inicial del jefe a partir de mediciones intersatelitales simuladas sobre prefijos crecientes de la misma cuadrícula de épocas que usa la tabla de rango frente a arco, con los parciales de medición tomados como diferencias finitas centrales del modelo directo compuesto. No consume nada de la maquinaria con la que se midió el umbral (ninguna fila de jacobiano analítico, ninguna matriz de transición de estado variacional, ninguna descomposición en valores singulares o autovalores, ninguna tolerancia de rango, ningún filtro de información en raíz cuadrada) y comparte solo la dinámica, las condiciones iniciales, el observable escalar y la cuadrícula de épocas, cada uno nombrado en el documento emitido. Dos criterios, ambos barridos: recuperación sin ruido (el análogo del rango) y estimabilidad de Monte Carlo (el análogo de la estimabilidad, medido frente a una verdad conocida y no predicho a partir de una covarianza). Ejecutable como el tipo de escenario <c1/>

# text
seg-f839285852d9 = Volumen de servicio lunar a partir de geometría de constelación real y obtenida

# text
# c1: ephemeris_path
seg-c3059fcced49 = Acepta unas efemérides de estado tabuladas centradas en la Luna (la evaluación de un núcleo SPK/BSP) o una definición de constelación publicada tras <c1/>, ejecuta contra ella el mismo barrido de cobertura / DOP / nivel de protección y emite el requisito de medición de distancia σ_URE que implica JUNTO A los resultados ilustrativos kepleriano y perturbado sin cambios, con la diferencia como magnitud con nombre propio. Cada cifra lleva una clase de procedencia que distingue lo derivado de núcleo de lo derivado de elementos publicados y de lo modelado, de modo que nunca pueden confundirse en una cita posterior

# text
seg-36a6cfaf5afa = Unidad y procedencia declaradas para cada magnitud informada

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Un esquema legible por máquina que da unidad, clase de procedencia y definición para cada campo numérico de cada informe de escenario, más una única compuerta global que ejecuta cada tipo de escenario registrado y falla si un campo numérico emitido carece de cualquiera de ellas. El vocabulario de procedencia es cerrado y cada clase lleva un nivel de evidencia, con dos clases asignadas deliberadamente a <c1/> y <c2/> en lugar de recibir un nivel que la clase no determina

# text
seg-c815cb90dcde = Geodesia de la estación de referencia lunar: retrorreflector y baliza de VLBI añadidos frente al datum de cinco arreglos

# text
seg-103cf21173ac = Las entradas opcionales extra_reflectors y extra_beacons del escenario lunar-llr-datum añaden un bloque station_geodesy: la información de Helmert de cinco arreglos del tramo archivado de telemetría láser lunar más la información que un retrorreflector añadido (medido en las épocas de puntos normales archivadas en las que la estación de medición está sobre su horizonte, cada una con el peso archivado de ese punto normal) y una baliza de VLBI añadida (observada por la red y el plan de lunar-frame-campaign con las estaciones terrestres fijas, mediante los parciales de retardo de lunar-vlbi-fim) en emplazamientos indicados aportan al datum de siete parámetros, vuelto a resolver, con el 1-sigma de cada parámetro de Helmert antes y después, su razón, las normas antes y después y los autovalores extremos de la diferencia de Fisher. Si falta o está vacía, el informe no cambia

# text
seg-44f582b17fa9 = Integridad de la compuerta: un verde que significa lo que dice

# text
# c1: cargo test --all
seg-43fbcfbe990c = Tres guardas estructurales sobre el propio proceso de verificación, cada una cerrando una clase de defecto que llegó a la compuerta canónica como un rojo intermitente o espurio. ({ "1" }) Cada ruta temporal construida en las fuentes de Rust debe llevar un componente único por llamada; se rechaza un identificador de proceso, porque cargo ejecuta las pruebas de la biblioteca como hilos paralelos de UN solo proceso y el pid es compartido por todos ellos. ({ "2" }) Cada fijación byte a byte o por hash debe declarar, junto a sí misma o en la cabecera de su módulo, qué cubre y qué excluye deliberadamente, de modo que un cambio transversal pueda decir de un vistazo qué fijaciones están en alcance y cuáles se han convertido en silencio en detectores de cambios de todo el repositorio. ({ "3" }) Un verde solo puede afirmarse a partir de la suite COMPLETA: scripts/gate.sh ejecuta <c1/>, captura el código de salida verdadero sin ninguna tubería en medio y escribe un recibo que nombra el commit, el número de binarios de integración, el número de pruebas y la duración; la comprobación previa al push rechaza un push cuyo commit no nombra ningún recibo válido, en un árbol limpio. La repetibilidad se muestrea por separado con scripts/check-repeatability.sh, que ejecuta la suite de la biblioteca N veces y falla si el conjunto de pruebas superadas difiere.

# text
seg-b7cd952ff133 = PL de temporización compuesto: travesía de holdover sembrada con P0

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); semicontinuo inferiormente PL({ "0" }+)≥PL({ "0" }−); máximo corrido de K(IR/2); exponentes de fase τ/τ³/τ⁵

# text
seg-096b6cdfe2dc = PL de temporización compuesto: envolvente LIL c.s. (imposibilidad + coherencia)

# text
seg-1671add2210d = Ningún holdover de peor caso finito (el supremo browniano diverge); HPL asignado por IR coherente con la envolvente de Hartman-Wintner cuando IR→{ "0" }

# text
seg-5a27c9f0a67d = Sobrecota de integridad del sesgo de trazabilidad heterogéneo de UTC(k)

# text
seg-fd09ab2adbf6 = Sobrecota de sesgo por fuente b = (U/k_cov)·Phi^-1(1-tail/2) + envejecimiento, que infla una incertidumbre expandida de tipo B publicada hasta una cola de integridad asignada; se enlaza con tpl_scalar como bias_s

# text
seg-d75b900ad25f = Covarianza cruzada del sesgo de trazabilidad correlacionado (asignación insegura de modo común)

# text
seg-0641f6d38c23 = Covarianza cruzada de sesgo de N×N con fuera de diagonal rho·b_i·b_j para fuentes que comparten un realizador de UTC(k); DEMOSTRADO correlated_fused_bias >= independent_fused_bias (la asignación independiente ingenua subacota el sesgo fusionado -> optimista -> insegura)

# text
seg-1a3bb032960f = Estadístico de consistencia de modo común (fallo de referencia compartida ciego a la separación)

# text
seg-1b03f522b8fc = Estadístico de puntuación ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 para un desplazamiento de modo común que la separación de soluciones (contrastes ortogonales a { "1" }) no puede ver; un desplazamiento de modo común lo infla mientras las separaciones por pares permanecen planas

# text
seg-3359eee713a5 = Clasificación del espacio nulo del datum lunar (aditividad de rango de LLR + elevación del defecto por libración)

# text
seg-6d722c176052 = Clasificación del problema de datum de medición interna de distancias: una sola observación de distancia aporta rango { "1" } (espacio nulo de 6 dimensiones); el par origen X y escala es casi nulo y la libración física de DE440 eleva el defecto a cero mientras el par sigue casi degenerado

# text
seg-3fd19007ea67 = Información de datum lunar multitécnica (LLR + VLBI lunar + distancia de orbitador)

# text
seg-23d0dd7d0666 = Filas del jacobiano del datum para la distancia LLR a reflectores terrestres, el retardo diferencial de VLBI lunar entre dos estaciones y la distancia de orbitador a baliza sobre el datum de 7 parámetros, combinadas en una única Fisher preacondicionada de forma coherente; demuestra que el seguimiento fuera de la dirección radial (orbitador / diverso en profundidad) rompe la degeneración entre origen X y escala, mientras que el VLBI transversal ayuda solo de forma indirecta

# text
seg-ab96cfc8d48c = Sustrato de geometría del datum LLR lunar (reflectores en ejes principales, estaciones terrestres, derivadas parciales analíticas de la distancia)

# text
seg-40e91288f81a = Los cinco conjuntos de retrorreflectores de la cara visible en metros del sistema de ejes principales (PA) del cuerpo y las estaciones terrestres LLR en coordenadas geodésicas; colocación de los reflectores del sistema del cuerpo al inercial mediante la orientación PA de DE440; derivadas parciales analíticas de la distancia Tierra-reflector respecto al datum de 4 parámetros; y la matriz de Fisher solo de LLR que muestra la degeneración entre lunocentro-X y escala que motiva el análisis de 7 parámetros

# text
seg-63a8571f8eb0 = Degeneración entre distancia y desfase de reloj en telemetría lunar unidireccional, y la ley de diseño de diversidad geométrica

# text
seg-cdd70f56051a = La degeneración por nodo entre distancia radial y desfase del reloj del receptor es exacta en { "1" } m a { "3.336" } ns (uno sobre c). El marginal por complemento de Schur { "{" }scale, offset{ "}" } (coupled_marginal_fisher) muestra que, en una red geométricamente diversa, la telemetría bidireccional eleva el marginal en aproximadamente el mismo factor que un número igual de datos unidireccionales adicionales, mientras que en el régimen idealizado de un solo nodo la elevación bidireccional es de órdenes de magnitud mayor. La ley de diseño que se deduce: la diversidad geométrica, y no la telemetría bidireccional como tal, es lo que separa la escala del marco lunar del desfase de la escala de tiempo en la telemetría unidireccional; un enlace de tiempo bidireccional o externo solo es necesario en el régimen de baja diversidad o de un solo usuario.

# text
seg-2c074d6260ba = Menú representativo de mediciones multitécnica y regla aditiva de combinación de Fisher

# text
seg-beefac5c1b13 = MeasurementBlock contiene una campaña de medición candidata como una contribución de información de Fisher de 7x7 más un coste relativo escalar; block_from_rows construye uno a partir de filas crudas del jacobiano del datum, de modo que todos los bloques se preacondicionan de forma idéntica mediante lunar_identifiability::assemble_multi_info; combine suma la información de un subconjunto elegido, que es la regla correcta porque la información de Fisher es aditiva entre mediciones independientes; representative_lunar_menu aporta un menú determinista de cuatro bloques (LLR, una baliza transversal de limbo VLBI, un orbitador de la cara visible y un orbitador de la cara oculta). El optimizador de diseño con restricción de presupuesto que consume este menú no forma parte de este crate.

# text
seg-2d3347bcb15e = Tolerancia de consistencia entre proveedores para un usuario con proveedores mixtos

# text
seg-9decf2cb6b0c = consistency_tolerance: invierte un presupuesto de posición del usuario en un requisito de acuerdo de Helmert entre proveedores por parámetro (origen/escala/rotación) con un brazo de palanca de referencia, opcionalmente inflado por la CRLB de realización de un solo proveedor P1

# text
seg-5450d921dfc9 = Presupuesto de error de interoperabilidad lunar multiproveedor y ley de diseño de marco frente a efemérides

# text
seg-e1e30f5c17a6 = interop_budget: división entre reducible (enlace de marco común) e irreducible (dinámica) bajo las convenciones PerProvider / CommonFrameTie / CommonEphemeris, con la métrica de ley de diseño de fracción irreducible (~{ "0.69" } con DE440/INPOP/EPM reales: una etiqueta de marco común por sí sola deja el suelo dominante)

# text
seg-ebb827739614 = Cota de chispa por bloques bizantina de detección/identificación en la red lunar autónoma por nodo (T3)

# text
seg-4fb935e6193d = byzantine_bound instancia la cota de codificación / observabilidad dispersa de la estimación segura de estado sobre la geometría de la red por nodo: un par bizantino inyecta una combinación lineal arbitraria de las mediciones en las que participa, y la red DETECTA cualquier coalición de ≤ f = block_spark − { "1" } pares e IDENTIFICA de forma única cualquier coalición de ≤ ⌊(block_spark − { "1" })/2⌋, donde block_spark es la menor coalición de pares cuyas firmas efectivas apiladas P⊥·B_T tienen rango de columna deficiente. La detectabilidad de un par es el RANGO DE COLUMNA COMPLETO de P⊥·B_j (un bloque distinto de cero pero con rango deficiente es un ataque distinto de cero que cae en range(G) y no deja residuo), no meramente P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Suelo de calibre temporal de holdover autónomo para la constelación lunar autorreferencial (T4)

# text
seg-eb690e8f5c9b = holdover_floor establece que, en un conjunto de nodos autónomos conectados únicamente por mediciones entre nodos, la deriva de reloj común (δα_j += { "1" } ∀j) es un parámetro libre del tiempo del conjunto que pertenece a N(GᵀWG): ninguna cantidad de telemetría adicional entre nodos puede observarla (rate_in_gauge = true, temporal_gauge_dim = { "2" } con el desfase común). Este es el verdadero suelo de holdover, el análogo temporal del calibre de posición del marco rígido. Añadir un enlace externo de deriva absoluta (un enlace directo a una referencia fuera de la red) expulsa la deriva común del espacio nulo (rate_in_gauge = false, temporal_gauge_dim = { "1" }), lo que demuestra que el suelo es un calibre real y no un artefacto del modelo de oscilador

# text
seg-25ffd6e1979c = División común/diferencial por proveedor, unificación de la deficiencia de un rango y pendiente de la brecha de protección (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Tres facetas de la descomposición única ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), con el calibre datum⊕escala de tiempo de 8 dimensiones como N(G) y las state_dim − { "8" } = { "32" } direcciones observables como range(G): (T5) provider_mismatch_split clasifica un sesgo común multiproveedor (∈ range(G)) como INDETECTABLE, ya que requiere un enlace externo, y un sesgo diferencial (∉ range(G)) como automonitorizado / DETECTABLE; (§{ "0" }) la unificación consiste en que el MISMO subespacio ciego range(G) gobierna la clase de fallo indetectable, de modo que el calibre del datum N(G) y el subespacio ciego a fallos range(G) son una sola geometría, no dos; (g7) slope devuelve la pendiente de brecha de protección de Brown ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ para un fallo b ∈ range(G) (estimador corrompido con paridad cero) y finita para un fallo detectable

# text
seg-632add2dbd3c = Máscaras de sincronización de telecomunicaciones de ITU-T con PASS/FAIL y margen

# text
# c1: telecom-timing
seg-47687529aee7 = Límites transcritos de ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC bloqueado y holdover de ePRTC-A (incluida la envolvente de error de tiempo de la Tabla { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) clases T-BC/T-TSC A-D y G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punto de referencia C, cada intervalo abierto o cerrado tal como lo indica la tabla, con todas las entradas 'para estudio ulterior' omitidas; un veredicto y un margen en el punto limitante de cada comprobación, y el tiempo que tarda en superarse cada presupuesto. Ejecutable como tipo de escenario <c1/>

# text
seg-165ed2bc771a = Máscaras de generación de wander de sincronización de frecuencia de ITU-T (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Siete máscaras de generación de wander MTIE y TDEV a temperatura constante para el tipo <c1/>: G.811 (09/1997) PRC (autónomo), G.812 (06/2004) Tipos I, II y III, G.8262 (10/2024) EEC Opciones { "1" } y { "2" } y G.8262.1 (11/2025) eEEC (modo bloqueado), incluidos los tramos de ley de potencia que escriben las tablas (<c2/> y similares), cada intervalo abierto o cerrado como se imprime, medidos a través del filtro de { "10" } Hz que indican las cláusulas (tomado como aplicado antes del muestreo); el escenario de referencia scenarios/telecom-synce-eec.toml enfrenta un OCXO en marcha libre con las tres máscaras EEC. No implementado: las tolerancias de temperatura variable, el holdover, los transitorios, el jitter y la exactitud de frecuencia de G.811

# text
seg-5fc2ad88faf0 = Formatos de registro de reloj (reloj RINEX, ASCII de TimeLab, TICC de TAPR) leídos a una serie de fase normalizada

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: una capa de análisis que convierte un archivo de reloj RINEX (registros AS/AR de un reloj con nombre, versiones { "2" } y { "3.00" } a { "3.04" }), un registro ASCII de fase o frecuencia al estilo de TimeLab, o un registro de marcas de tiempo o intervalos de TAPR TICC en una rejilla de fase uniforme, con tau0 indicado, tomado de una cabecera o como el espaciado mediano, con cada hueco, lectura fuera de rejilla y duplicado contabilizados, y una política de huecos de rechazo, tramo más largo o lineal; conectada de forma opcional a la serie de telecom-timing (<c1/>, que añade un bloque <c2/>) y al tipo clock (<c3/>, que añade un bloque <c4/> con ADEV, TDEV y MTIE, el SHA-256 de la tabla y el SHA-256 de la fase; runs = { "1" }). Sin la tabla, ambos tipos son idénticos byte a byte

# text
seg-acdb0337bce7 = Formatos de registro de reloj de linuxptp (ptp4l, phc2sys, ts2phc) y chrony (tracking, statistics) leídos a una serie de fase normalizada

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input con los formatos ptp4l, phc2sys, ts2phc, chrony-tracking y chrony-statistics: el desfase registrado de una línea de servo de linuxptp (ns, la propia marca de tiempo entre corchetes de la línea, con las lecturas anteriores a la primera notificación de s2 del servo omitidas y contabilizadas) o de un registro tracking o statistics de chrony (s, por posición de columna, fecha y hora UTC) se convierte en una rejilla de fase uniforme mediante las mismas políticas de huecos que los demás formatos; un selector de fuente (<c1/>) nombra una de varias interfaces, relojes o direcciones; los registros alimentan la serie de telecom-timing, el tipo clock y el tipo holdover-test

# text
seg-97aebb84576e = Prueba de holdover puntuada a partir de un registro de error de tiempo suministrado por el operador

# text
# c1: holdover-test
seg-ab533cf99c56 = El tipo <c1/>: un registro de error de tiempo (un registro de reloj de linuxptp, chrony, TICC, TimeLab o RINEX, o pares time_s,time_error_ns) se divide, en los dos instantes que el operador indica para la retirada y la restauración de GNSS, en una etapa de línea base, una de holdover y una de recuperación; la línea base se mide frente a las máscaras de ITU-T escritas para un reloj bloqueado y el holdover frente a las escritas para holdover o un reloj autónomo, la envolvente de holdover de ePRTC-A y los presupuestos de error de tiempo; el holdover informa del desfase de frecuencia por mínimos cuadrados que mantuvo el sistema, y la recuperación informa de si |TE| entró en una banda indicada y cuándo, y permaneció en ella durante una permanencia indicada, con el pico y el mayor salto. Cada límite es el que transcribe el tipo telecom-timing; los dos instantes son una declaración del operador y no se verifican

# text
seg-94cbac97a1aa = Disponibilidad de señales GNSS en el Volumen de Servicio Espacial y más allá, comparada con el folleto SSV del ICG

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Los barridos de disponibilidad del tipo <c1/>: por constelación (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) y combinadas, la proporción de pares (usuario, época) con al menos una y al menos cuatro señales y la interrupción más larga, para un usuario sobre una esfera (la capa global de 2,562 puntos del folleto, { "14" } días a { "1" } minuto) o sobre una trayectoria (GEO, HEO, transferencia lunar), a partir de las órbitas keplerianas del anexo C del folleto, una potencia radiada mínima constante dentro del ángulo de referencia fuera del eje, bloqueo terrestre por la esfera más { "50" } km y un umbral de C/N0; antenas de usuario de la tabla B10 del folleto

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Efectos de ionosfera, plasmasfera y atmósfera en el rayo del limbo sobre señales GNSS rasantes, y el diseño de receptor de señal débil, en el tipo <c1/>

# text
seg-1a1786ba90b6 = Una ionosfera de Chapman, una plasmasfera de tipo Gallagher y una atmósfera neutra (curvatura por refractividad, absorción de oxígeno, desenfoque) integradas a lo largo del rayo recto entre transmisor y usuario: contenido total de electrones oblicuo, su parte plasmasférica, retardo en exceso, altitud tangente y la pérdida en enlaces rasantes; y un diseño de receptor de señal débil (integración coherente y no coherente, límite de bits de datos, ayuda externa, búsqueda Doppler) que fija el umbral de C/N0 a partir de los modelos de adquisición y de lazo de seguimiento

# text
seg-6b8f9f3ca2a3 = Filtro de navegación GNSS a bordo para naves de órbita alta y de transferencia lunar

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = El modo <c2/> del tipo <c1/>: un filtro de Kalman extendido de nueve estados (posición, velocidad, sesgo y deriva del reloj del receptor, una escala de presión de radiación solar) sobre pseudodistancias cuya disponibilidad, ruido y C/N0 proceden de la misma geometría de enlace que los barridos; la verdad de referencia se integra con J2, tercer cuerpo del Sol y la Luna y presión de radiación con sombra, el filtro modela J2 y los terceros cuerpos y estima la presión de radiación; informa de los errores de posición y velocidad dentro y por encima de las órbitas GNSS, el mayor hueco de mediciones y el NEES medio

# text
seg-5fc242476828 = Navegación relativa de una formación de varias naves en una órbita muy elíptica a partir de GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = El modo <c2/> del tipo <c1/>: una nave principal y sus subordinadas ejecutan cada una el filtro absoluto; la posición de la subordinada respecto a la principal se estima restando las estimaciones absolutas y mediante un filtro relativo sobre pseudodistancias de diferencia simple de las señales que ambas naves siguen, con la dinámica relativa como la diferencia de dos trayectorias no lineales

# text
seg-7038f6902820 = Términos de error del interferómetro de átomos fríos: ruido de fase del láser Raman, sesgo por curvatura del frente de onda y resolución de la ambigüedad de franja

# text
seg-4d9690207607 = inertial::cai_error_terms (funciones de biblioteca, aún no accesibles desde un tipo de escenario): la función de ponderación de fase Raman de un interferómetro de tres pulsos de pulso cuadrado (Cheinet et al. { "2008" }, Ec. { "8" }) con la forma cerrada de fase blanca (pi/2)^{ "2" } S_phi0/tau_R y una vía numérica para cualquier espectro; el ruido de frecuencia del láser que el retardo de retrorreflexión no cancela (Le Gouet et al. { "2007" }, Ecs. { "9" } a { "11" }); el sesgo de frente de onda de desenfoque puro sigma_v^2/R de una nube térmica y su reducción mediante un radio de detección; la probabilidad de índice de franja erróneo erfc(pi/(sqrt({ "2" }) s)) para una ayuda de acelerómetro clásico y para dos tiempos de interrogación, y su inversa

# text
seg-363705e03bac = Preajustes de holdover de osciladores a partir de hojas de datos públicas

# text
seg-9750d9e0ec7a = Cuatro preajustes (OCXO (Microchip OX-208), rubidio (Microchip 8040C), cesio (Microchip 5071A tubo de alto rendimiento) y CSAC (Microchip SA.45s)), cada uno con los máximos de desviación de Allan, el envejecimiento y la cota de temperatura de su hoja de datos; un ajuste de ruido de frecuencia blanco + flicker + paseo aleatorio por mínimos cuadrados no negativos, escalado para envolver cada punto de la hoja de datos, un suelo de flicker nunca inferior a la cifra de τ más largo, envejecimiento lineal y un término de temperatura sinusoidal, sintetizado como un holdover con semilla tras una pérdida de GNSS

# text
seg-d7e03158b972 = Segundos hasta que un reloj en marcha libre sale de la guarda de una ranura indexada en el tiempo, y la cadencia de correcciones que lo mantiene dentro

# text
# c1: slot-timing
seg-0b4d8815f756 = El tipo <c1/>: el error predicho E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertido para obtener la superación, el tiempo restante, el intervalo de resincronización neto de la latencia de corrección y las correcciones por día, con cada término desglosado y el dominante nombrado; relojes a partir de los seis valores por defecto de ClockClass (TCXO, OCXO y RAFS añadidos, cada uno citando una hoja de datos), los preajustes de telecom-timing, una hoja de datos en línea o un registro medido; una superación más allá del mayor tiempo de promediado de la fuente se marca como extrapolada

# text
seg-2797643153dc = Nivel de protección de temporización para un receptor en órbita bajo spoofing de GNSS

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, accesible como la sección de spoofing del tipo <c1/>: velocidad y periodo de una órbita circular, el mayor tiempo que un spoofer terrestre puede alcanzar al satélite por pasada, el suelo del monitor asistido por reloj y la latencia de detección CUSUM, el nivel de protección condicional (suelo más deriva durante la latencia), el arrastre que acumula un spoofer con una tasa máxima de rampa indicada antes de que el satélite salga de su huella o se ejecute una comprobación independiente, y si cada comprobación de contacto con tierra o de enlace cruzado es independiente de un spoofer terrestre

# text
seg-f134975d4ffa = Cascada del espectro en banda L con J/S por banda y C/N0 efectivo bajo una cronología de jammers programada

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = El tipo <c1/>: una rejilla de frecuencia por tiempo de la densidad espectral de potencia en banda L (suelo térmico k T_sys con T_sys = T_ant + { "290" } K (F - { "1" }), las señales con sus potencias recibidas mínimas de la especificación de interfaz, y jammers de onda continua, de banda estrecha, de chirp y de ruido adaptado con tiempos de encendido/apagado), con cada celda promediada sobre su casilla y fila (los chirps exactamente sobre barridos completos y parciales, los jammers por ciclo de trabajo), C/N0 efectivo por banda = [1/(C/N0) + sum (J/S) kappa]^-1 por fila, J/S por banda, J/S en banda y una cascada SVG con barras de C/N0. El informe incluye una comprobación cruzada con la cadena del tipo <c2/> sobre las mismas entradas de enlace

# text
seg-6e0b9687e8ee = Urano y Neptuno a partir de la Tabla { "1" } de Standish, Plutón y velocidades planetarias

# text
seg-df3bf502dfe9 = Posiciones de Urano y Neptuno a partir de la Tabla { "1" } de Standish (la predeterminada dentro de { "1800" } d. C. a { "2050" } d. C.), de Plutón a partir de la fila de la Tabla { "1" } de { "1992" } que la página actual de JPL ya no incluye, y la velocidad heliocéntrica de cada planeta: la derivada de dos cuerpos con el movimiento medio que implican los elementos más el giro de la elipse por las tasas de perihelio, inclinación y nodo

# text
seg-a50be56f605a = Posiciones de la Luna y de siete lunas principales (Fobos, Deimos, las lunas galileanas, Titán)

# text
seg-2cfbe5a1eece = La Luna geocéntrica a partir de la serie de Montenbruck & Gill (cuyo término de -1.3972 grados por siglo ya la refiere al equinoccio J2000), y posiciones y velocidades planetocéntricas de Fobos, Deimos, Ío, Europa, Ganímedes y Calisto a partir de los elementos medios de Solar System Dynamics de JPL en el plano de Laplace de cada luna, con la tasa de longitud media tomada de la tasa de rotación síncrona de la IAU (la tabla imprime el periodo con demasiado pocos dígitos para mantener la fase), y de Titán a partir del modelo de rotación de la IAU (la luna sobre el eje x fijo al cuerpo cambiado de signo a la distancia media), porque la fila impresa del plano de Laplace de Titán no reproduce Horizons ni siquiera en su propia época

# text
seg-8b8c8e28ece9 = Constantes físicas de cada cuerpo del sistema solar y el informe del sistema completo

# text
# c1: solar-system
seg-d225a30de35c = Body incorpora Mercurio, Venus, Júpiter, Saturno, Urano, Neptuno, Plutón, Fobos, Deimos, Ío, Europa, Ganímedes, Calisto y Titán (parámetro gravitacional, radio de referencia, J2 donde se publica con el radio al que se refiere, polo y meridiano origen de la IAU), una búsqueda por nombre y un registro BodyFacts (código NAIF, clase, padre, radio ecuatorial y medio); el tipo <c1/> los informa para los dieciocho cuerpos con las posiciones, los tiempos de luz y una traza orbital durante una revolución, con cada cuerpo etiquetado como VALIDATED o MODELLED

# text
seg-87ab655f8270 = Posicionamiento alrededor de cualquier cuerpo del sistema solar con una constelación local y un enlace de espacio profundo desde la Tierra

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = El tipo <c1/>: un orbitador o un módulo de aterrizaje en superficie alrededor de un cuerpo elegido por nombre navega con pseudodistancias unidireccionales de una constelación de navegación Walker alrededor del cuerpo (órbitas de dos cuerpos con la deriva secular J2 del cuerpo, un reloj de usuario desconocido) y una distancia bidireccional opcional sin reloj desde la Tierra, con la dirección y la distancia de la Tierra tomadas de la efeméride analítica en cada época; líneas de visión bloqueadas por la esfera del cuerpo y una máscara de elevación en superficie; por época, el GDOP y el PDOP solo de la constelación (orbit::dop), la incertidumbre formal de posición con y sin la fila de la Tierra, y soluciones de Gauss-Newton con semilla (batch_ls::gauss_newton) en cada caso, con el tiempo de luz y el viaje de ida y vuelta del cuerpo a la Tierra

# text
seg-7d4d7200cbca = Mapas de cobertura y de dilución de la precisión para diseños multiconstelación arbitrarios a gran escala, alrededor de cualquier cuerpo central

# text
# c1: constellation-design
seg-b78b79e9fae4 = El tipo <c1/> más allá de los dos casos fijados: diseños explícitos y de varias capas, varias constelaciones por ejecución con un reloj de receptor por constelación, la Tierra, la Luna y Marte a partir de las constantes de cuerpo, el preajuste de BeiDou (se modelan la fase de órbita media y el cruce geosíncrono inclinado a { "118" } grados E), satélites en vista por celda, GDOP, PDOP, HDOP, VDOP y disponibilidad, trazas terrestres submuestreadas y un prefiltro de visibilidad por latitud del subsatélite que ejecuta un diseño de { "5" } 000 satélites sobre una rejilla de { "10" } grados en una fracción de segundo

# text
seg-278c77438493 = Una misión encadenada entre tipos de escenario sobre una cronología compartida

# text
# c1: campaign
seg-3dcfb26f6234 = Las fases del tipo <c1/>: cada fase ejecuta uno o más escenarios de tipos existentes mediante run_toml, lee sus salidas en canales con nombre (error de tiempo del reloj y guarda, relación media efectiva portadora-densidad de ruido y suelo de seguimiento, nivel de protección vertical y límite de alerta, error de posición, satélites en seguimiento, indicadores de alarma) mediante preajustes por tipo o rutas de resultado explícitas, las sitúa al comienzo de la fase y las mantiene sobre una rejilla común, con límites de fase y eventos; el estado se transfiere mediante carry (un canal continúa desde el valor final de la fase anterior), handoff (un número de una fase anterior escrito en el escenario siguiente) y end_at (una fase termina en un instante que calculó una ejecución, como el instante de detección de un monitor de spoofing); un hash de campaña y un resumen sobre el resultado de cada miembro

# text
seg-ad6105af464c = Barridos de parámetros y conjuntos Monte Carlo con semilla sobre cualquier tipo de escenario

# text
# c1: campaign
seg-95921611839e = Las secciones sweep del tipo <c1/> (de una a tres claves con puntos de cualquier tipo, sobre los valores de eje del barrido genérico, opcionalmente un conjunto en cada nodo) y monte_carlo: la realización k se ejecuta con base_seed + k; cada métrica informa de la media, la desviación típica, los percentiles 5/50/95 por rango más cercano y un intervalo de confianza del { "95" } % por bootstrap de percentiles con semilla fija sobre la media (inertial::metric_stat); las unidades de las métricas se leen del propio bloque de unidades del tipo barrido

# text
seg-24327a0ed82e = Varios escenarios bajo condiciones compartidas, con un resumen combinado

# text
# c1: campaign
seg-5833fb3b06e3 = La sección compose del tipo <c1/>: valores compartidos con nombre (por ejemplo, la potencia y la posición de un jammer) escritos en cada miembro en las claves a las que los vincula, ejecución de cada miembro y, por métrica, el menor, el mayor y el valor medio entre los miembros con el miembro nombrado; las unidades de las métricas deben coincidir entre los miembros

# text
seg-0bc866720bde = Optimización acotada de una métrica sobre parámetros de campaña

# text
# c1: campaign
seg-f9bdb89c2b4f = La sección optimize del tipo <c1/> (CAP-32): de una a tres claves de escenario con puntos acotadas a [lo, hi] en escala lin o log, una métrica leída por ruta de resultado, objetivo minimize, maximize o target; método grid (los valores de eje del barrido) o un símplex determinista de Nelder-Mead en coordenadas normalizadas con proyección sobre la caja y los coeficientes estándar; una métrica ausente o no finita puntúa como la peor y permanece en la traza; con runs > { "1" } la métrica es la media sobre semillas comunes; cada evaluación es una ejecución real del tipo indicado, listada en trace y contada en el resumen de reproducibilidad

# text
seg-652e28dfa10f = Diseños de señal de posicionamiento, navegación y temporización de órbita terrestre baja: seguimiento de código, adquisición, compatibilidad con GNSS y un compromiso de banda para cualquier sistema

# text
# c1: leo-signal
seg-c0ba5c7e708e = El tipo <c1/>: diseños de señal parametrizados (banda, ancho de banda de transmisión, asignación de la UIT; componentes de adquisición, de datos y piloto con espectros BPSK(n), BOC(m,n), MBOC o planos, reparto de potencia, subportadoras FDMA, longitudes de código y tasas de datos) a partir de archivos de preajuste públicos compilados (Xona Pulsar, Iridium STL, señal de oportunidad de Starlink, CentiSpace, un diseño genérico en banda C y diseños genéricos UHF/L/S/C/C ancha, cada uno con su URL de origen y con los valores no publicados rotulados REPRESENTATIVE) o escritos en línea; por señal, la densidad espectral de potencia de banda limitada, las fracciones de potencia en banda, el ancho de banda de Gabor, el jitter de código frente a C/N0 y espaciado y la exactitud de medición de distancia, el espacio de búsqueda de adquisición, la probabilidad de detección de ley cuadrática y el tiempo medio de adquisición serie y paralela de código, el coeficiente de separación espectral hacia y desde GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b y AltBOC con la degradación de C/N0, y la tolerancia de J/S CW, de banda ancha y adaptada a partir de la cadena SSC del tipo spectrum; un compromiso de banda de retardo ionosférico, pérdida en espacio libre, exactitud de medición de distancia con igual C/N0 e igual EIRP y tolerancia a jammers; y comprobaciones cualitativas de forma de un diseño frente a una medición descrita

# text
seg-c2b9c8e4a364 = Cascada de espectro multibanda (UHF, L, S, C) con señales diseñadas y jammers por banda

# text
# c1: spectrum
seg-609df4e0a085 = El tipo <c1/> ampliado más allá de la banda L: bandas dadas como un diseño de señal preajustado (dibujado con cada componente, de banda limitada al ancho de banda de transmisión, con C/N0 y J/S referidos al componente seguido) o como una portadora y modulación personalizadas; paneles de cascada adicionales sobre cualquier rango de frecuencias en la misma cronología y escala de color; un jammer de banda ancha (de barrera) junto a ruido CW, de banda estrecha, de chirp y adaptado; J/S por banda y C/N0 efectivo a partir de la cadena del coeficiente de separación espectral sin cambios

# text
seg-d9eb3e7e69c2 = Una pasada LEO-PNT y su presupuesto de enlace por banda frente a los satélites GNSS MEO a la vista

# text
# c1: leo-pass
seg-d986e44443dd = El tipo <c1/>: satélites a partir de una pasada diseñada, elementos, un TLE mediante SGP4 o una constelación Walker de constellation-design; por banda y época, los ángulos de visión, la distancia, la tasa de variación de distancia y la aceleración de distancia en forma cerrada (comprobadas en cada ejecución con diferencias centrales e informadas), pérdida en espacio libre, EIRP con patrón isoflux, gaussiano o plano, una antena de usuario de parche, hemisférica o isótropa, atenuación gaseosa del Anexo { "2" } de ITU-R P.676-10, lluvia y centelleo de P.618, pérdida de entrada en edificios de P.2109, desajuste de polarización, temperatura de ruido del sistema, C/N0, Doppler y tasa de Doppler, y el retardo de primer orden a partir de un TEC oblicuo de Klobuchar o de TEC vertical escalado por la fracción de Chapman por debajo del satélite; pares libres de ionosfera con ruido de código en el pico de la pasada; portadoras de Galileo o GPS a partir de sus potencias recibidas del documento de interfaz a través del mismo receptor

# text
seg-95a077a980b6 = Preajustes de sistemas LEO-PNT con nombre y fuentes indicadas, y un motor independiente del sistema

# text
seg-4b47033cda24 = leo_link::presets: multibanda genérico (UHF, L, S, C), banda C genérica, Xona Pulsar X1/X5, Iridium STL, Starlink como señal de oportunidad solo Doppler, CentiSpace y un preajuste opcional Celeste IOD, cada uno con su fuente marcada como PUBLIC (con URL), REPRESENTATIVE o WORKSHOP, el de workshop en el archivo opcional del preajuste Celeste IOD, compilado solo cuando ese archivo existe; cada banda y órbita puede sobrescribirse en un escenario, y un escenario puede no nombrar ningún preajuste

# text
seg-a39f34973373 = Posicionamiento de bajo consumo: tiempo hasta la primera solución y energía por solución frente al ciclo de trabajo

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy y la sección [iot] del tipo <c1/>: integración coherente limitada por la tasa de Doppler, sumas no coherentes de ley cuadrática hasta un umbral de detección, una búsqueda en casillas Doppler sobre la envolvente de usuario estático de la órbita (en frío) o una ventana asistida (en caliente), búsqueda de código paralela o serie, tiempo de mensaje de navegación en un arranque en frío, energía por solución y vida de la batería según los intervalos de solución, para cada banda LEO y la señal GNSS

# text
seg-8121e7db3db3 = Actualización del mensaje de navegación LEO a mitad de pasada con una comprobación de continuidad en el cambio

# text
# c1: leo-navmsg
seg-34c310d85c42 = El análisis de actualización a mitad de pasada del tipo <c1/>: la pasada más alta sobre un usuario dentro de un intervalo de búsqueda, mensajes en un calendario global con periodos de uso centrados en sus ventanas de ajuste, y en cada cambio el salto de posición 3D, el salto de reloj, el salto de pseudodistancia del usuario, el mayor salto sobre cualquier línea de visión visible (forma cerrada sobre el cono de nadir), el error de distancia antes y después, y PASS/FAIL frente a un umbral

# text
seg-7635a8339e78 = Codificación binaria documentada del mensaje de navegación LEO con un presupuesto de error de cuantización

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: la trama propia de Kshana (preámbulo, versión, modelo, longitud, carga útil, CRC-24Q) para los cuatro modelos de efemérides, el polinomio de reloj, SVID, edad de los datos, banda, salud, un conjunto de Klobuchar, coeficientes NeQuick-G y parámetros UTC, cada campo con un ancho y un paso indicados (field_table), cuantización con rechazo de rango, y un presupuesto del mayor cambio de posición y de reloj que provoca un cambio de medio paso de cada campo sobre la ventana de validez

# text
seg-17ca41d7fd71 = Exportaciones al estilo RINEX 4 y CSV de mensajes de navegación LEO

# text
seg-185e12ccef0d = leo_navmsg::text: un bloque al estilo RINEX 4 (cabecera de registro > EPH, línea de satélite y época con tres términos de reloj, líneas de órbita de difusión D19.12) con letra de sistema L y tipos de registro KP16, KRAC, LU22 y APOL, rotulado en cada cabecera como una extensión de Kshana que no forma parte de RINEX { "4.02" }, y una tabla CSV con un esquema de columnas por defecto y esquemas preajustados, cada uno con un importador

# text
seg-e79047fc95af = Polinomio ECEF de reloj cero de ATOMIC y la comparación sintética de modelos LEO a cinco altitudes

# text
seg-e261843e35b1 = la variante EcefPoly de leo_navmsg::elements::EphemerisModel: un polinomio ECEF por eje sin términos de reloj, con el término relativista a partir de -2 r.v/c^{ "2" }, puntuado frente a un reloj gobernado. También el análisis de comparación de modelos (liu_comparison sobre LIU2025_TABLE), que ajusta el modelo de 22 parámetros a las cinco altitudes del artículo en arcos de 20 minutos de una órbita integrada por Kshana e imprime el resultado junto al SISRE publicado

# text
seg-d2e18c8bdc14 = Posicionamiento a partir de Doppler LEO, con uno o varios satélites, con estados de deriva de reloj y de velocidad

# text
# c1: leo-pvt
seg-de6cb3c06490 = Posicionamiento por lotes de Gauss-Newton a partir de la tasa de variación de distancia con derivadas parciales analíticas (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), una velocidad constante del usuario como opción, una pseudomedición de altura para un usuario en superficie, pasos amortiguados; la covarianza formal en la verdad de referencia; proyecciones a lo largo de la traza, transversal y vertical; la exactitud de una sola pasada frente al desplazamiento transversal del usuario; el instante de máximo acercamiento. El modo doppler del tipo <c1/> añade el error frente a la longitud de la ventana y un modo de señales de oportunidad solo Doppler (el preajuste starlink-sop)

# text
seg-7f462969d2d4 = Posicionamiento conjunto por pseudodistancias de GNSS y LEO con sesgos entre sistemas y modelos de error por señal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Soluciones de Gauss-Newton por mínimos cuadrados ponderados sobre cualquier mezcla de sistemas, con un reloj de receptor por sistema (el sesgo entre sistemas se estima junto con la posición) o un desfase de difusión conocido sobre la escala de tiempo de referencia; sigmas por medición suministrados por quien llama y, por defecto, el ruido térmico del lazo de seguimiento de retardo del motor (navsignal::dll_code_jitter_chips) al C/N0 de la elevación combinado con el error de distancia de la señal en el espacio; DOP sin ponderar (GDOP, PDOP, HDOP, VDOP, TDOP) en el marco geodésico local, sigmas formales este-norte-arriba y los sigmas de sesgo; el modo conjunto del tipo <c1/> compara soluciones solo GNSS, solo LEO y fusionadas y barre el DOP frente al número de satélites LEO añadidos

# text
seg-ee9a4a0cb530 = Convergencia del posicionamiento de punto preciso con solo GNSS y con aumentación LEO

# text
# c1: leo-ppp
seg-a54f36c27d90 = Un filtro de Kalman extendido PPP flotante sobre código y fase libres de ionosfera: coordenadas estáticas, un reloj de receptor blanco, un sesgo entre sistemas por cada sistema adicional, un retardo cenital húmedo de paseo aleatorio proyectado por 1/sin(elevación), una ambigüedad flotante por cada arco de satélite añadida a la salida y descartada a la puesta, y el error de órbita y reloj precisos común al código y a la fase de un satélite, procesado como una actualización correlacionada de dos filas en forma estabilizada de Joseph; mediciones simuladas a partir del mismo modelo; tiempo de convergencia (errores por debajo de los umbrales hasta el final de la ejecución), curvas de error y el NEES de posición promediado sobre la ejecución para solo GNSS y cada caso LEO, ejecutado como el tipo <c1/>

# text
seg-9306f1c06081 = Transferencia de tiempo asistida por LEO a UTC frente al C/N0 y el oscilador del receptor

# text
# c1: leo-pvt
seg-c618feb01476 = Mediciones de reloj de cada satélite LEO a la vista en una posición conocida, combinadas por varianza inversa a partir del modelo de ruido de pseudodistancia, filtradas por un filtro de Kalman de dos estados (fase, frecuencia) cuyo ruido de proceso es el ruido de frecuencia blanco y de paseo aleatorio de la clase del oscilador (slot_timing::ClockNoise, clock_state::ClockClass; la varianza de deriva de holdover::coast_phase_variance), un reloj de referencia con semilla de los mismos niveles, y la expresión de tiempo del sistema a UTC de la sección { "20.3.3.5.2.4" } de IS-GPS-200 con una incertidumbre del desfase de difusión añadida como sesgo por ejecución; el modo de temporización del tipo <c1/> barre osciladores y desplazamientos de C/N0

# text
seg-d92777401093 = Sistemas LEO PNT con nombre como preajustes de datos opcionales, cada uno con su fuente

# text
seg-5130bfe2410c = Entradas independientes del sistema: cada sistema son capas Walker, elementos explícitos o un preajuste GNSS, una señal (portadora, tasa de chips, ancho de banda, potencia recibida o rango de C/N0), un SISRE, un sigma Doppler y un modelo de reloj; los preajustes rellenan solo lo que un escenario deja fuera, un archivo cada uno con fuentes marcadas como PUBLIC (con una URL), WORKSHOP o DERIVED y los valores no publicados enumerados como representativos: Xona Pulsar X1/X5, Iridium STL, señales de oportunidad de Starlink, CentiSpace, un sistema representativo en banda C, el modelo de efemérides de reloj cero ATOMIC y un preajuste derivado de un taller en el archivo opcional del preajuste Celeste IOD, que se retiene borrando ese archivo y sus escenarios

# text
seg-dec52b5b9cd6 = Un sistema LEO-PNT de extremo a extremo: diseño de señal, presupuesto de enlace de pasada, mensaje de navegación y posicionamiento fusionado, con la salida de cada etapa entregada a la siguiente

# text
# c1: leo-pnt-chain
seg-39443b31d418 = El tipo <c1/>: un diseño leo-signal (preajuste público o en línea) fija el centro, el ancho de banda, la tasa de chips y el reparto de EIRP de una banda leo-pass; la pasada da el C/N0 del componente seguido y el jitter de código de banda limitada por época; una recta de C/N0 por mínimos cuadrados en sin(elevación), el SISRE del mensaje leo-navmsg (ajustado en la órbita del satélite de la pasada, más un término indicado de determinación de órbita en suma cuadrática) y la portadora y la tasa de chips del diseño pasan a cada sistema LEO de una solución conjunta leo-pvt y, opcionalmente, a los casos LEO de leo-ppp; cada traspaso se informa con su valor y su unidad

# text
seg-55ca63edff02 = Detección de spoofing mediante la consistencia entre Doppler LEO y geometría de la pasada

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = La sección <c2/> del tipo <c1/>: un spoofer falsifica, de forma autoconsistente en distancia y tasa de variación de distancia, las señales vistas en una posición declarada que salta y/o se desplaza respecto a la verdadera tras un inicio (por banda LEO y para la señal GNSS MEO); el receptor predice cada tasa de variación de distancia a partir de la órbita de difusión y una posición y velocidad previas independientes, y contrasta las tasas medidas con un estadístico chi-cuadrado de mínimos cuadrados generalizados sobre una ventana de épocas (deriva de reloj como parámetro de molestia o con un a priori), en los canales GNSS, los canales LEO y todos los canales, con ruido térmico del lazo de seguimiento de frecuencia a partir de C/N0 (Kaplan & Hegarty { "2006" }, sección { "5.6.2" }); probabilidad de detección a partir de la ley chi-cuadrado no central con una probabilidad de falsa alarma indicada, con la detección declarada con una probabilidad de detección fallida indicada

# text
seg-5f341f85ac07 = Detección de spoofing mediante la consistencia entre bandas de una señal LEO multibanda

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Para cada satélite LEO y par de bandas de medición de distancia, la sección <c1/> forma la combinación de pseudodistancia libre de geometría, elimina el modelo ionosférico del receptor y contrasta su salto de época a época con el ruido de código de las dos bandas y una tasa ionosférica no modelada tolerada indicada (gaussiana bilateral, probabilidad de detección exacta); un spoofer que falsifica algunas bandas y no otras, o todas las bandas sin la ionosfera, se ve en su inicio; uno que falsifica todas las bandas y simula la ionosfera no se ve, lo cual indica el resultado

# text
seg-97dbcd5f2728 = Sondeo de la ionosfera: TEC oblicuo a partir del retardo de doble banda de una pasada LEO

# text
# c1: leo-pass
seg-844de34fd2f3 = Para cada par de bandas de un satélite <c1/>, el informe da el contenido total de electrones oblicuo que recupera la combinación de código libre de geometría en el pico de la pasada, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), y su sigma de 1 a partir del ruido térmico de código de las dos bandas, de modo que cualquier diseño LEO-PNT multibanda puede evaluarse como sondeador de la ionosfera

# text
seg-1fdbb476c8ab = Puntuación de confianza marítima: la agregación de la evidencia de los monitores en una puntuación de 0-100 y sus tres bandas

# text
seg-0d76b33144f1 = Cada monitor reduce su evidencia a una razón entre estadístico y umbral; la puntuación es { "100" } menos la suma sobre los monitores del peso por una rampa lineal acotada de la razón ({ "0" } hasta { "0.5" }, { "1" } en { "1.5" }), acotada a de { "0" } a { "100" } y redondeada a { "0.1" }, con bandas en { "90" } y { "55" }; cada época enumera los monitores que dedujeron y sus puntos.

# text
seg-51640405c9b7 = Eventos SIEM de telemetría de confianza: Log Event Extended Format (LEEF) sobre syslog

# text
seg-1b3245506847 = Eventos de cambio de banda (o por época) como cargas útiles de Log Event Extended Format { "2.0" } en un envoltorio RFC { "5424" } sobre UDP o TCP, con una asignación de campos documentada.

# text
seg-c04042b0270a = Umbrales de interferencia de confianza del receptor calibrados con el conjunto de datos JammerTest { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: la calibración preregistrada de los monitores de caída de C/N0, AGC e indicador de jamming sobre el conjunto de datos público JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, obtenido en tiempo de ejecución, nunca incorporado): por carpeta una cronología de { "1" } s a partir de mon_rf.csv y rinex.csv, los monitores se ejecutan una vez, cada época posterior a la calibración se etiqueta como limpia o con jamming a partir del attack_log de la carpeta (desplazado de CEST a UTC, guarda de { "60" } s), cada umbral se barre sobre una rejilla fija, se selecciona el menor umbral con una probabilidad de falsa alarma limpia agrupada de como máximo { "0.01" }, y recuentos reservados dejando fuera una carpeta cada vez; una comprobación cruzada del lector UBX. La selección se distribuye solo como el perfil opcional [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); la regla por defecto y cada salida sin él permanecen sin cambios

# text
seg-65a8361b4a22 = Puntuación de Jammertest: un registro de receptor puntuado por cada ensayo programado (latencia de detección, alarmas omitidas, falsas alarmas, tiempo de recuperación) frente al plan de ensayos publicado

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): el catálogo de ensayos y el plan de transmisión de la NPRA (MIT, obtenidos con un SHA-256 fijado, nunca incorporados al repositorio) leídos como verdad programada, con los identificadores del catálogo conservados; una ejecución de receiver-trust puntuada por ensayo (primera alarma menos inicio planificado, detectado/tardío/omitido según una tolerancia, tiempo hasta el primer tramo sin alarmas, alarmas fuera de cualquier franja y de su margen de guarda), con un paquete de evidencias firmado que contiene la tarjeta de puntuación. El calendario son franjas planificadas, no horas de emisión registradas

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): una correspondencia entre las salidas de Kshana y las cláusulas de marcos públicos, solo por número, rellenada a partir de las ejecuciones proporcionadas; un resultado cuenta para una capacidad solo cuando incluye la evidencia que nombra la correspondencia, un conjunto vacío no evidencia nada y la formulación es "aporta evidencias a favor de"; el informe no constata que se alcance ningún marco ni es una calificación ni una aprobación por parte de nadie.

# text
seg-98c360d82d56 = Integraciones marinas: plugin de Signal K, flujo de la puerta y panel de puntuación de OpenCPN, build de referencia

# text
seg-7af9ce566646 = La puntuación de confianza, la banda, los motivos, el estado de la puerta y la posición comunicada por el receptor publicados en navigation.gnss.kshana en un servidor Signal K con una notificación de aviso, alarma y normal (integrations/signalk); el flujo NMEA filtrado por la puerta, con la solución marcada como no válida mientras la confianza esté colapsada y una sentencia PKSHT por ciclo, servido a OpenCPN por TCP por la propia puerta o por un pequeño relé, y un panel de puntuación nativo de OpenCPN que lee la sentencia PKSHT (integrations/opencpn); y unidades de systemd y un contenedor que ejecutan la puerta (deploy/reference-build). Cuando muestran resultados, llevan la declaración consultiva: Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
seg-89ab9ef155eb = Seguimiento de BOC({ "1,1" }): escalado del DLL y resolución de ambigüedad por salto de pico (opcional)

# text
seg-ef24be9b5917 = El campo boc de iq::track::LoopConfig (opcional, None por defecto): los tres discriminadores del DLL reescalados para leer el error de código en chips con pendiente unitaria sobre el pico principal del BOC({ "1,1" }) senoidal, y un monitor de salto de pico sobre correladores muy adelantado y muy retrasado a medio periodo de subportadora ({ "0.5" } chip) que salta el NCO de código hacia el pico principal cuando un contador ascendente/descendente alcanza N ({ "8" } por defecto). Sin la opción, todas las salidas permanecen sin cambios.

# text
seg-2c32955cbfb3 = Canal de centelleo ionosférico IQ (modelo de Cornell) frente al centelleo medido de GPS L1 a { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, el modelo de centelleo de Cornell (intensidad de Rice, espectro de Butterworth de segundo orden, fase arg z) accionado con el S4 y el tiempo de decorrelación de la intensidad de una ventana medida, comparado en lo que genera más allá de esas dos entradas; realdata::scint50 lee el registro medido, le quita la tendencia y ejecuta la comparación.

# text
seg-160507ac3702 = Opción CFAR de promediado de celdas en la adquisición IQ

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar y ca_cfar_cells (opcional): una celda de una cuadrícula de adquisición se compara con la media de celdas de referencia de su fila Doppler (retardos de guarda y de paso, con ajuste cíclico alrededor del periodo), con un factor alfa fijado a partir de la probabilidad de falsa alarma de forma cerrada del CA-CFAR para M bloques no coherentes (ca_cfar_pfa, ca_cfar_alpha). El detector de potencia de muestra sigue siendo el predeterminado y todas las salidas existentes permanecen sin cambios.

# text
seg-5bd3bf0c22a7 = Modelo de espectro: bandas GLONASS, BeiDou y Galileo E6 (opcional)

# text
seg-9c16189c63ac = spectrum::default_band resuelve, solo por nombre (MORE_BAND_NAMES), GLONASS L1OF y L2OF en cada canal FDMA K = -7 a { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a y B3I (BPSK({ "10" })) y Galileo E6 (BPSK({ "5" })), con las portadoras y las potencias mínimas recibidas de sus documentos de control de interfaz; el conjunto de bandas predeterminado y todas las salidas existentes permanecen sin cambios.

# text
seg-7b1ae0c7ca28 = Códigos terciarios y capa de mensaje de LunaNet AFS (BCH SB1, CRC-24Q, entrelazador) frente a LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: patrón de sincronización, codificador BCH({ "51,8" }) de SB1 y decodificador de 256 hipótesis, CRC-24Q, el entrelazador de bloques de { "60" } x { "98" }, un verificador de flujos de símbolos (kshana lunanet-afs-check) y un generador de flujos de prueba con subtramas provisionales. La codificación LDPC de tasa 1/2 de las subtramas { "2" } a { "4" } no está implementada (sus matrices están en un anexo aparte).

# text
seg-0d7b17524c04 = Paquetes de normas: escenarios puntuados frente a umbrales establecidos antes de la ejecución

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): los perfiles de ensayo del marco Resilient PNT del DHS para los niveles { "1" } a { "4" }, los niveles de precisión y la evaluación de integridad de IMO MSC.1/Circ.1575 y los paquetes de monitorizar, evaluar y mitigar del Apéndice F de ICAO Doc { "9849" }: cada ensayo ejecuta un tipo de escenario incluido y compara los campos de resultado con los umbrales establecidos en el paquete, y los ensayos que necesitan un registro de receptor se listan como NEEDS INPUT y no se puntúan.

# text
seg-8a8f2c85e0c3 = Paquete de evidencias de ida y vuelta de laboratorio (escenario, condiciones de ensayo, registro del receptor, puntuación)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) y la exportación de registro de receptor kshana.test-conditions/1 de kshana bench-export: un paquete firmado que registra el hash del escenario, el hash de las condiciones declaradas, el hash del registro y la puntuación frente a los eventos declarados, y rechaza condiciones que no coincidan con los eventos de puntuación o un registro cuyo hash no sea el declarado. No se escribe, reproduce ni programa ninguna señal.

# text
seg-a9189e4fe413 = Motor de seguimiento IQ frente a GNSS-SDR { "0.0.19" } con grabaciones independientes

# text
seg-364de05e5b1b = El motor completo de seguimiento de la capa IQ (iq::track mediante kshana iq track: traspaso de la adquisición, correladores, NCO, PLL Costas de segundo orden de { "15" } Hz, DLL de envolvente EML de primer orden de { "2" } Hz asistido por portadora, indicador de enganche y estimadores de C/N0) sobre GPS L1 C/A a { "30" } hasta { "45" } dB-Hz.

# text
seg-259d201c2ff8 = Ganancias de antena CRPA en el tipo de escenario jamming frente a un recálculo independiente con numpy

# text
seg-192144c57783 = La sección opcional [crpa] del tipo de escenario jamming: un haz por canal hacia cada satélite (anulación dirigida con el jammer como nulo, o MVDR sobre sigma^{ "2" } I + P_j a_j a_j^H), que escala el ruido de cada enlace por ||w||^{ "2" } y el jammer por |w^H a_j|^{ "2" } antes de la ecuación C/N0 antiinterferencia existente.

# text
seg-a2f34cff9338 = Sombra del terreno sobre el jammer en el tipo de escenario jamming frente a un recálculo independiente con numpy sobre una tesela SRTM real

# text
seg-334c569d9cae = La sección opcional [terrain] del tipo de escenario jamming: el perfil del terreno por círculo máximo entre el jammer y el receptor sobre una tesela SRTM .hgt con una curvatura terrestre de factor k, el filo de cuchillo dominante (mayor nu de Fresnel-Kirchhoff) y la pérdida por un único filo de cuchillo de la sección { "4.1" } de ITU-R P.526-15, restada de la potencia recibida del jammer.

# text
seg-825c121c7512 = Histéresis de adquisición y cuantificador del front end en el tipo de escenario jamming frente a recálculos independientes

# text
seg-f7207263d881 = La sección opcional [acquisition] del tipo de escenario jamming (un satélite se adquiere en o por encima de un umbral de adquisición tras un retardo de readquisición y se mantiene mientras esté en o por encima del umbral de seguimiento) y la sección [front_end] (la lectura del AGC { "10" } log10({ "1" } + J/N) y la pérdida del cuantificador del ADC con entrada gaussiana descontadas de cada enlace, señaladas como no válidas para jammers no gaussianos).

# text
seg-9c46f1c76486 = Enganche inicial del FLL limitado por debajo del piso de traspaso FLL-PLL del diseño predeterminado (opcional)

# text
seg-efa1d1a9e904 = carrier.fll_pull_in_max_s opcional de iq::track (el campo fll_pull_in_max_s de iq::track::LoopConfig): con fll_assist = pull-in, el FLL traspasa al PLL tras un tiempo de enganche fijo, sea cual sea el PLI, con un tiempo de permanencia de retorno equivalente hasta que el PLI alcanza por primera vez fll_off_pli.

# text
seg-ac0f97e945a7 = Lector de soluciones .pos de RTKLIB para receiver-trust

# text
seg-0b8bc2c89de4 = Lee un archivo de solución de RTKLIB (hora de calendario o semana GPS/TOW, posición en latitud/longitud o ECEF, satélites utilizados) en la línea temporal de receiver-trust (receiver_trust::machines::rtklib).

# text
seg-849393517c04 = Registros ASCII y binarios de NovAtel OEM7 (BESTPOS, RANGE, RXSTATUS) para receiver-trust

# text
seg-7e0021922025 = Lee BESTPOS (posición), RANGE (C/No por señal) y RXSTATUS (el indicador de jammer del receptor, como autoinforme de la época) de registros OEM7 ASCII y binarios, con CRC comprobado, solo lectura (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = Lector de relación portadora-ruido MSM4 y MSM7 de RTCM { "3" } para receiver-trust

# text
seg-0a0c9976236f = Lee el C/N0 de cada celda de señal de los mensajes MSM4 y MSM7 de RTCM { "3" } (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) a partir de un flujo de tramas, con CRC-24Q comprobado (receiver_trust::machines::rtcm3). Disposiciones tomadas de las tablas de pyrtcm con licencia BSD, no del texto del estándar RTCM.

# text
seg-cd554a7c1649 = Adaptador de monitor GNSS-SDR para receiver-trust

# text
seg-22b587ac642d = Lee los mensajes de GNSS-SDR Monitor (Gnss_Synchro) y de PVT-monitor, retransmitidos como líneas JSON con los nombres de campo de proto, en C/N0 por canal, solución, satélites utilizados, HDOP y cielo (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = Ingesta de registros IMU, entrada de rumbo del giróscopo y ajuste Allan de parámetros de sensores híbridos

# text
seg-9dadc819daef = Lee un CSV de IMU (columnas documentadas o la disposición EuRoC); integra la velocidad de guiñada en el rumbo que lee el monitor heading-course ([log.imu]); y ajusta los parámetros de ruido del acelerómetro y del giróscopo de los escenarios híbridos y de fusión a partir de un registro estacionario mediante desviación de Allan con solapamiento (imu-fit).

# text
seg-15a852a2dcb0 = Descubrimiento MQTT de Home Assistant y exportador de estado para la telemetría de confianza

# text
seg-6d6b07b26966 = Un documento de estado JSON y mensajes de descubrimiento MQTT de Home Assistant para el flujo de confianza, impresos como texto en cada superficie y publicados por MQTT { "3.1.1" } QoS { "0" } por la CLI (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-68caf86157c2 = Paquete ROS { "2" } receiver-trust y puente gnss_lib_py

# text
seg-e7d7d99fe538 = Un puente sin ROS que escribe mensajes de solución y de satélites como NMEA y los puntúa mediante el binding de Python (integrations/ros2/kshana_trust), y un puente de NavData de gnss_lib_py a receiver-trust mediante el formato rtklib-pos (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Pruebas
