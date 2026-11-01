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
seg-af3ff120b707 = VLBI geodésico lunar

# text
seg-cfd7d0126028 = Retardo VLBI de campo cercano para una línea base terrestre que observa una baliza lunar + derivadas parciales

# text
seg-e08e98908f3a = Earth-GNSS a distancia lunar

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Recepción de Earth-GNSS a distancia lunar: la capa de señal débil que nombra la Tabla { "1" } de P7 y para la que el motor no tenía modelo. Por satélite y por época calcula el ángulo fuera del eje respecto al nadir del transmisor, si la Tierra ocluye el trayecto recto, la distancia oblicua y su pérdida en espacio libre, la ganancia de transmisión en ese ángulo, la potencia recibida y la densidad de portadora a ruido; luego agrega solo los enlaces que superan un umbral de seguimiento, y barre una revolución completa de la constelación para que la respuesta sea una DISTRIBUCIÓN y no una instantánea. Tres hechos determinan el resultado y el informe declara cada uno: la Tierra subtiende { "13.90" } grados desde el radio de la constelación, por lo que el PICO del haz no está geométricamente disponible para ningún rayo dirigido a la Luna; lo que queda es el borde del lóbulo principal y los lóbulos laterales, el régimen en el que LuGRE operó en la Luna en { "2025" }; y la pérdida de trayecto en L1 es de unos { "208" } dB, unos { "25" } dB más que la que paga un usuario terrestre. MEASURED sobre la geometría incluida de 24 satélites de clase GPS durante { "64" } épocas de un periodo orbital: disponibilidad de SEÑAL { "0.375" } con un mejor enlace de { "30.93" } dB-Hz, y disponibilidad de SOLUCIÓN DE POSICIÓN { "0.000" }: como máximo dos enlaces seguibles simultáneos, nunca los cuatro que necesita una posición. La separación de esas dos disponibilidades es el punto central, y el informe se niega a que se confundan: Earth-GNSS a distancia lunar es una capa de grado de TEMPORIZACIÓN, no de posición, y un a priori de resiliencia en capas debe tomar la disponibilidad de solución de posición. El condicionamiento se emite por la misma razón: todo satélite visible queda dentro de un cono de un par de grados de anchura visto desde la Luna, de modo que las líneas de visión son casi paralelas por construcción. Ejecutable como el tipo de escenario <c1/> Reformulado según D7: la afirmación a distancia lunar es la densidad de portadora a ruido RELATIVA entre satélites en una misma época, a partir de patrones de transmisión bidimensionales medidos (NAVCEN Block IIR/IIR-M), más visibilidad geométrica; no se afirma el C/N0 absoluto (Parker et al. informan de una pérdida común de { "7" } a { "12" } dB).

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
seg-83e6341e01b1 = Dilución de la precisión aumentada con balizas para un usuario de superficie lunar: las filas de línea de visión de los satélites visibles y las filas de medición de distancia de las balizas de superficie visibles se concatenan en una única matriz de diseño y se evalúan mediante el kernel DOP compartido, y el DOP resultante se transforma en una exactitud realizada de 1 sigma EN METROS mediante un error equivalente de medición de distancia del usuario por baliza compuesto como raíz de la suma de cuadrados de términos de sincronización de reloj, multitrayecto y levantamiento. La visibilidad de balizas es el horizonte geométrico de dos alturas de la Luna sin atmósfera, que no tiene extensión refractiva y es por tanto exacto en lugar de aproximado. Ejecutable como el tipo de escenario <c1/>, que informa de los satélites solos, los satélites más las balizas, y una constelación mayor como la vía alternativa hacia la misma geometría. MEASURED sobre la geometría de referencia incluida (usuario a -80 grados, tres balizas topografiadas, LCNS ilustrativo de seis satélites en t={ "0" }, máscara de { "5" } grados): { "5" } satélites visibles dan PDOP { "9.6941" } y un 1 sigma 3-D de { "11.222" } m; añadir las balizas que realmente superan el horizonte da PDOP { "4.1160" } y { "4.765" } m, un factor de { "2.355" }; el servicio de 24 satélites da en cambio PDOP { "2.4226" } y { "2.804" } m, un factor de { "4.002" }. El informe imprime el número de balizas VISIBLES y no el configurado, y en esta geometría solo UNA de las tres balizas supera el horizonte: los dos emplazamientos laterales están a unos { "333" } km del usuario frente a un horizonte de { "86" } km para una antena de { "2" } m, de modo que nunca se deja al lector suponer que contribuyeron las tres

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
seg-03796cb741b6 = Crecimiento del error de efemérides de la estación de referencia lunar durante la latencia de corrección

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
seg-a6972eb89d7d = El datum de Helmert de siete parámetros propagado desde una CAMPAÑA DE OBSERVACIÓN SIMULADA en lugar de recuperado de una transformación inyectada. Estaciones terrestres observan un catálogo con fuente de balizas de superficie lunar según un plan explícito; los parciales de retardo de VLBI lunar se acumulan en una matriz de información de Fisher de coordenadas de baliza y se llevan por el diseño de Helmert A = [I₃ | [p]ₓ | p] a H = AᵀM_bA, de modo que la exactitud del datum informada es función del programa de observación: exactamente lineal en el sigma de retardo y monótona en el arco a través de la libración que el informe MEASURED. El defecto de datum es el tema y no una nota al pie: el rango, el defecto, el número de condición, el espectro, las direcciones no observables en la base de siete parámetros, la dirección más débil incluso a rango completo y la parte de ella de cada parámetro se emiten en cada ejecución, y cualquier parámetro que la campaña no restrinja se publica como NULL con un estado. La correlación de error de balizas se MIDE, no se supone: exactamente cero con las estaciones fijas, y se imprime con su coste cuando se estiman. Ejecutable como el tipo de escenario <c1/>

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

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Fuente: <c1/>

# text
seg-34d1304c9555 = Capacidades modeladas: justificación

# text
# c1: ExternalDataset
seg-144f441bf52b = Estas capacidades están implementadas a partir de física publicada o de primeros principios y con pruebas, pero están <b>etiquetadas con honestidad como MODELLED</b>: no se han comprobado frente a una referencia independiente externa con una tolerancia indicada. Las pruebas de invariantes de la matriz exigen que solo las filas respaldadas por <c1/> puedan ser VALIDATED, de modo que nada de lo que aparece aquí puede ascender sin que se note. Cada fila indica por qué sigue siendo modelada.

# text
seg-0630e39b4de3 = Tipo de referencia independiente

# text
seg-bb023086bbe3 = Por qué sigue siendo modelada

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ninguna externa: Orekit { "12.2" } no tiene una razón de iluminación con oscurecimiento del limbo. Comprobada solo frente a formas cerradas de la misma ley

# text
seg-33d506570c1b = srp_shadow::tests (la forma cerrada anular, la ley uniforme que reproduce la sombra cónica, límites de sol pleno y de umbra)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 con ThirdBodyAttraction y SolarRadiationPressure sobre el propio lector DE440 de Orekit (orekit-data lnxp1990.440), ejecutado como programa aparte; kshana lee un recorte de NAIF de440s.bsp idéntico bit a bit y comprobado con SPICE. Umbrales preregistrados en xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). El umbral de órbita ({ "0.5" } m) y el control de sensibilidad se alcanzan, pero el umbral de posición del Sol y la Luna ({ "3" } m / { "0.2" } m) no se alcanzó, con { "6.39" } m / { "0.244" } m. SPICE, leyendo el mismo kernel en su TDB exacto, se aparta de Orekit en la misma magnitud ({ "6.25" } m / { "0.240" } m), así que la diferencia está entre la ruta de de440s de NAIF y el lector DE440 o la escala de tiempo de Orekit; la causa no se aisló. Registrado y fijado, por lo que la fila sigue siendo MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } casos x { "25" } estados horarios durante { "24" } h, LEO, GEO y HEO, tercer cuerpo y tercer cuerpo + SRP: peor |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; el control de serie analítica falla por { "9.96" } m; Sol { "6.39" } m y Luna { "0.244" } m respecto de las posiciones DE440 de Orekit, un fallo registrado); pruebas unitarias de propagator (rechazo del proveedor, recuento de respaldo compartido entre clones)

# text
seg-b55bcab6f986 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ninguna externa para el efecto del geopotencial. Los { "24" } coeficientes se transcribieron de GFZ STR06/01 Tabla { "1" } modelo N1 y se volvieron a comprobar fila por fila con el informe (SHA-256 890865ae); los grados { "0" }, { "1" }, { "7" } y { "8" } no se usan. Ray y Ponte ({ "2003" }) no imprimen ninguna tabla de armónicos esféricos, así que no se comparó con una segunda fuente

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (el término S1 es diurno, gira { "90" } grados en un cuarto de día y tiene la amplitud del factor de carga de cada fila; magnitud física en LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel y pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, ejecutados como programas aparte; umbrales preregistrados en xval/high-degree-gravity/PREREGISTRATION.md (276c869f) y xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit coincide en todo lugar donde está definido, pero pyshtools no alcanza su umbral preregistrado en los dos puntos cercanos al polo (hasta { "7.3e-10" } m/s^{ "2" }; una comprobación mpmath de 50 dígitos sitúa el error en pyshtools), no hay valor de referencia independiente exactamente sobre el eje polar, y el control de sensibilidad de grado 70 preregistrado de la órbita de { "24" } h no se alcanzó ({ "0.726" } m frente a > { "1" } m). Cada fallo se registra, no se ajusta para ocultarlo, por lo que la fila sigue siendo MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit en { "8" } puntos fuera del eje: máx. |da| { "2.2e-17" } m/s^{ "2" } con N = { "70" }, se ejecuta siempre; { "3.5e-17" }, { "3.9e-17" } y { "7.3e-17" } m/s^{ "2" } con N = { "200" }, { "360" }, { "2190" }, condicionado a datos en KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (órbita de { "24" } h 200x200, condicionada a datos: peor |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; control de grado 70 { "0.726" } m); pruebas unitarias de gravity_sh (coincidencia con el evaluador clásico hasta { "1e-13" } en grado { "70" }, diferencia finita y continuidad en el polo sobre un campo de grado 2190, un término de grado 2190 con desbordamiento por defecto frente a un cálculo con exponente extendido)

# text
seg-84a9851b838c = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Orekit { "12.2" } (Apache-2.0) BatchLSEstimator con mediciones geométricas instantáneas personalizadas RangeRate y AzEl (contrastadas con el TopocentricFrame de Orekit), ejecutado como programa aparte sobre observaciones idénticas, enmascaradas y con semilla. Umbrales preregistrados en xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Se alcanzan todos los umbrales salvo B4, la coincidencia de estado sin ruido de { "1" } cm, que falló en { "2" } de { "4" } escenarios ({ "1.46" }, { "1.74" } cm): la propia estimación sin ruido de Orekit está a esa distancia de su verdad simulada (causa en el lado de Orekit no aislada). Registrado y fijado, por lo que la fila sigue siendo MODELLED. No modelado: tiempo de luz, aberración, refracción, rotación terrestre, un filtro secuencial para estos tipos de medición

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } escenarios: range-rate, az/el y mixtos, LEO y MEO, sin ruido y con sigma con semilla { "5" } m / { "5" } mm/s / { "1e-4" } rad, máscaras de { "5" } y { "10" } grados, frente a Orekit { "12.2" }: conjuntos visibles idénticos; valores de medición dentro de { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM dentro de { "1.2e-14" } en relativo; estados con ruido dentro de { "1.74" } cm y { "1.14e-5" } m/s; RMS posajuste por tipo dentro de { "2.7e-4" } en relativo; kshana sin ruido frente a la verdad { "1.06e-8" } m; kshana sin ruido frente a Orekit { "1.464" } y { "1.740" } cm en dos escenarios, un fallo registrado del umbral de { "1" } cm); pruebas unitarias de orbit_determination y batch_ls

# text
seg-a5554f29b2d7 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ninguna externa: los pesos son una elección de modelado (el formato SP3 define el código solo como indicador de exactitud del productor; aquí se lee como una desviación típica de un sigma por eje). Las ejecuciones registradas existentes de agencias no cambian

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = pruebas unitarias de src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (fixture de ESOC de { "8" } h incluido en el repositorio, sigma { "0.032" } m a partir del exponente de cabecera { "5" }: RMS 3D del nivel 1 { "0.132" } m sin cambios, nivel 2 { "0.035" } m frente a { "0.070" } m con sigma { "1" } m, procediendo el cambio de la restricción empírica a priori reequilibrada); tests/agency_swarm.rs (el producto Swarm no incluye códigos de exactitud y recurre al respaldo, fijado)

# text
seg-a5ad470a4816 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Solo consistencia interna. Cada campo publicado se define en el marco fijo al cuerpo de su productor (GMM-3 en el marco de Marte de Konopliv et al. { "2006" }, GL0660B en el marco de ejes principales lunar de DE421), mientras que el campo se evalúa en el marco IAU; el desfase no se modela

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Solo ida y vuelta interna y respuestas conocidas del ICD; no se ha ejecutado ningún decodificador de terceros (el arnés RTKLIB/GNSS-SDR que lee KSHANA_NAVMSG_ORACLE_JSON está condicionado a datos). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (valor de comprobación de CRC-24Q 0xCDE703; respuesta al impulso convolucional; Viterbi corrige errores inyectados; anchos de disposición); tests/gnss_navmsg_roundtrip.rs (los bits de inicio de campo igualan los números de bit del ICD; la ida y vuelta codificar -> FEC -> entrelazar -> Viterbi -> decodificar queda dentro de medio LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (registros Galileo de IGS BRDC 2018-133 en la rejilla de LSB, peor { "3.6e-3" } LSB; el umbral preregistrado de número de satélites no se alcanzó, { "15" } de { "20" }, FINDING)

# text
seg-81b76a6d1bcd = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. FINDING frente a la coordenada ITRF2020 publicada de WTZR: los umbrales preregistrados (mediana y p95 suavizados como máximo { "0.6" } x el valor bruto; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) no se alcanzaron, con razones { "0.718" } y { "0.923" }; el error residual de nivel métrico es de tipo sesgo (sesgo de código C1C, antena, marea, multitrayecto de largo periodo), no el ruido blanco que elimina el suavizado. MODELLED: los estadísticos del filtro se comprueban internamente

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (paso directo sin ruido; varianza de ruido blanco 1/(2N-1); reinicios); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } épocas, N = { "100" }: error 3-D mediano { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ajuste a la norma del formato en un archivo RINEX { "4.00" } real publicado (los valores leídos de vuelta igualan los literales impresos del archivo) y una cabecera derivada de la especificación; no se ejecutó ningún lector independiente, por lo que MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (primeras { "4" } épocas del archivo RINEX { "4.00" } de IGS MGEX MAO000USA_R_20231980000_01D_30S_MO, { "58" } satélites, { "7" } sistemas: los registros de cabecera y los valores de la primera época igualan los literales publicados); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (cabecera sintética { "4.02" } a partir de la especificación)

# text
seg-5afb3c4bf171 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Preregistrada (7aa264b, 110fef9) frente a una órbita precisa de IGS MGEX con los GEO; ningún producto de ese tipo estaba al alcance de la sesión que la construyó, de modo que la comparación está pendiente y la fila es MODELLED (comprobada solo frente a las posiciones GEO nominales publicadas)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (registros reales C01-C04: radio geoestacionario, longitudes 140.02/80.04/110.55/159.99 grados en las posiciones publicadas, |latitud| { "2.13" } grados con la inclinación frente a { "6.65" } sin ella; la comparación preregistrada de difusión frente a SP3 preciso está condicionada a datos en KSHANA_BDS_GEO_SP3 y no se ha ejecutado); rinex::tests

# text
seg-70f61250d256 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: las mediciones se sintetizan a partir de los modelos que usa el filtro (χ² NEES/NIS sobre semillas, una convergencia sin ruido, inyección de saltos). MODELLED; no se compara con datos de un receptor real ni con un filtro de terceros

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (recorrido en forma de 8: RMS 3-D estable de { "0.025" } m con portadora frente a { "0.470" } m con código sobre mediciones idénticas; { "12" } semillas con NIS/dof medio { "1.00" } y NEES/dof estable { "0.92" }; un salto de 1 ciclo detectado en su época sin falsas alarmas y con la solución intacta; desactivar las correcciones de difusión eleva el error de código de { "0.51" } m a { "19.6" } m (ionosfera) y { "8.0" } m (troposfera); la ejecución sin ruido converge a { "0.3" } mm)

# text
seg-6f3f6483690e = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Interna: las cifras de mérito de cada paquete frente a su propia verdad de referencia y una comparación entre acoplamiento débil y estrecho con entradas idénticas. MODELLED; la comparación con NaveGo de la auditoría no se ha ejecutado

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (cada paquete: fusionado por debajo de INS libre durante la interrupción con ambos sensores; ferroviario: estrecho { "5.3" } m frente a débil { "12.9" } m con grado de navegación y { "15.6" } m frente a { "18.8" } m con grado táctico durante la interrupción, disponibilidad { "0.97" } frente a { "0.95" }; tabla de acoplamiento estrecho validada); tests/gnss_ins_legacy_trajectory_pin.rs (el valor por defecto de acoplamiento débil, idéntico bit a bit)

# text
seg-2c7c37506aab = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: verdad de referencia simulada a partir de los propios modelos de los filtros (χ² NEES sobre semillas de Monte Carlo, el paquete desacoplado con sensores idénticos). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (filtro 3-D con { "60" } semillas: NEES medio de la segunda mitad { "8.12" } para { "8" } estados, suma de χ² de la última época dentro de su banda del { "95" } %; una corrección de reloj de { "0.1" } ns reduce la sigma de posición 3-D de { "5.58" } m a { "3.07" } m; filtro de sesgo con { "60" } semillas: suma de χ²({ "5" }) dentro de la banda, sesgo dentro de { "3" } sigma en { "59" } de { "60" }; fusion-pnt-coupled con acelerómetros sesgados: p95 de posición { "18.7" } m / { "90.0" } m e integridad { "1.00" } / { "0.97" } acoplado frente a { "430" } m / { "4060" } m y { "0.006" } / { "0.000" } desacoplado); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion e hybrid sin [coupled], idénticos bit a bit)

# text
seg-0866862d2264 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Interna: identidades de cinemática de cuerpo rígido, la ida y vuelta por CSV y la propia covarianza del filtro. MODELLED (no se compara con ningún registro de recorrido real)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (un giro coordinado no tiene fuerza lateral y el factor de carga es 1/cos φ; la importación de CSV reproduce un perfil volado hasta { "1e-3" } m/s y { "1" } m); tests/gnss_ins_trajectory_library.rs (todos los perfiles se ejecutan y la fusión supera a INS libre durante la interrupción; cada uno vuela su movimiento nombrado; observabilidad del rumbo: sigma de guiñada tras { "240" } s de { "1.27" } grados en crucero rectilíneo frente a { "0.039" } grados en figura de 8 y { "0.062" } grados en arranque y parada); tests/gnss_ins_legacy_trajectory_pin.rs (hashes de resultado y de verdad de referencia heredados, idénticos bit a bit)

# text
seg-5cb3b7bba7be = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Medida frente a la efeméride reconstruida de CAPSTONE de JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF centrado en la Luna, 2023-03-01..31 a { "10" } min), incluida byte a byte (tests/fixtures/capstone_horizons/, NOTICE.md), preregistrada { "4e868170" } antes de obtenerla, como una medición con umbrales sobre la geometría media. No es una validación: el CR3BP omite el Sol, la excentricidad de la Luna y el mantenimiento de posición que realizó CAPSTONE, de modo que los umbrales describen cuán representativa es la órbita del modelo, no una exactitud. Resultados: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE marzo de { "2023" }, { "4" } perilunios y { "5" } apolunios: periodo { "6.5004" } d frente a { "6.5699" } d ({ "1.07" } %, umbral { "3" } %), apolunio { "71 182" } frente a { "71 215" } km ({ "0.05" } %, umbral { "5" } %), perilunio { "3 385" } frente a { "3 245" } km ({ "4.1" } %, umbral { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna frente a una forma cerrada: bajo el modelo gaussiano lineal, la covarianza de mínimos cuadrados es sigma^{ "2" } (H^T H)^-1 (Kaplan y Hegarty (eds.), Understanding GPS: Principles and Applications, 2.ª ed., Artech House, { "2006" }, cap. { "7" }). Método y tolerancias de la nota de diseño de geometría { "0.36" }, sección { "5.2" }, fijados en un commit de preregistro antes de la primera ejecución: cada varianza dentro del { "5" } % ({ "5" } errores estándar de una varianza muestral con N = { "20,000" }), cada RMS dentro del { "2.5" } %, la correlación este-norte dentro de { "0.035" } (5/sqrt(N)), cada media dentro de { "5" } errores estándar, la fracción de la elipse del { "95" } % dentro de { "0.95" } +/- { "0.0077" } ({ "5" } errores estándar binomiales); los controles negativos (PDOP duplicado; errores que crecen como 1/sin(elevación) frente a la Q sin ponderar) deben fallar. CÓMO SE COMPONE: Q es el factor de covarianza del núcleo orbit::dop, VALIDATED frente a gnss_lib_py { "1.0.4" } sobre estas mismas { "8" } geometrías en tests/dop_reference.rs (fila 'GNSS geometry / dilution of precision'); esta fila añade el paso de esos factores a metros mediante el resolutor del motor y no toma prestado el estado de aquella fila. POR QUÉ MODELLED: no interviene ningún conjunto de datos externo; la coincidencia muestra que el estimador y el ruido realizan sigma x DOP bajo el modelo de manual, no que el error de ningún receptor sea igual a UERE x DOP, y sigma_UERE es una entrada

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: las { "104" } comprobaciones pasan en la primera ejecución tras el preregistro e50c88d2, peor varianza { "3.2" } %, RMS { "1.6" } %, correlación { "0.012" }, media { "2.2" } errores estándar, fracción de elipse { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: ambos controles fallan como se exige; position_error_is_sigma_times_dop_on_masked_skies: las dos geometrías de horizonte enmascarado de la nota de diseño, el cielo 10sat-mixed bajo los preajustes city-street ({ "4" } satélites, PDOP { "16.6" }) y container-terminal ({ "9" } satélites, PDOP { "2.5" }), las { "26" } comprobaciones pasan en la primera ejecución tras el preregistro 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (una primera comprobación aparte sobre cuatro cielos elegidos a mano (abierto, agrupado, cañón, medio cielo; sigma { "1" } m, semilla 0x0D0B5EED) con intervalos de confianza de chi cuadrado de { "1e-6" } en total sobre { "20" } comprobaciones: razones de { "0.987" } a { "1.009" }, el PDOP/GDOP del propio resolutor igual al del núcleo hasta { "2.5e-12" }, y controles negativos para un error de DOP del { "10" } % y errores de 1/sin(elevación); ejecutada antes del preregistro, por lo que se informa, no está preregistrada); dop_error_mc::tests; dop_error_ci::tests

# text
seg-d40d54b79e58 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la clasificación se comprueba frente a las reglas que enuncia y frente a razones derivadas a mano sobre ediciones sintéticas del registro de demostración incluido, y las fijaciones de ausencia de cambio mantienen las salidas de { "0.35.0" }: ninguna puntuación cambia salvo que la geometría sea mala; la etiqueta se informa siempre. POR QUÉ MODELLED: los umbrales se eligen, no se ajustan (procedencia en el geometry_model de cada ejecución; las cifras de IEC 61108-1 y GPS SPS tal como se citan, por comprobar con el texto de las normas), y no existe un conjunto de datos externo etiquetado de degradación natural de la geometría frente a ataques con el que validar la clasificación. El DOP derivado reutiliza el núcleo orbit::dop, VALIDATED frente a gnss_lib_py, cuyo estado esta fila no toma prestado. Una clase de geometría es una afirmación sobre el cielo, no una conclusión de que no ocurrió ningún ataque

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: en el paso sintético por el fiordo de scenarios/training/fjord-natural-degradation.toml se deducen las mismas { "624" } épocas con y sin el [skyline] indicado; con él se informa de cielo bloqueado en { "680" } épocas ({ "0" } sin él: el recurso por hueco de azimut no ve nada en un fiordo con dos lados), open_fraction es { "0.758" }, y las épocas de clase entorno bajan de { "78" } a { "33" }, siendo el resto pérdidas de satélites que el horizonte indicado deja al descubierto; fuera del evento el horizonte no cambia ninguna puntuación); receiver_trust::geometry::tests (razones derivadas a mano en los umbrales, los bordes de los umbrales, la rampa y el tope, el suelo, los bordes de las etiquetas, las sustituciones de [geometry], el DOP sobre el núcleo validado, cielos retenidos y caducados, lo desconocido no se adivina, pérdida de señal, la tolerancia a geometría mala, centinelas de ausencia de solución); tests/geometry_trust.rs (un cielo enmascarado aceptable etiquetado y no puntuado, un cielo enmascarado malo, una pérdida a baja elevación, una caída de potencia, un HDOP falsificado, pérdida total de señal, un arrastre durante geometría mala, geometría desconocida, sustituciones de sesión, el esquema en vivo); tests/geometry_trust_no_change.rs (las dos sesiones de ejemplo idénticas byte a byte a { "0.35.0" } una vez eliminadas las claves añadidas); tests/geometry_corpus_identity.rs (todo corpus NMEA de buque incluido, también como cielo abierto solo con GPS, y los escenarios de formación de tripulaciones: idénticos byte a byte a { "0.35.0" } salvo las épocas malas, que difieren únicamente por la deducción de geometría)

# text
seg-7e9cae219d72 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Interna: las formas cerradas se comprueban frente a valores calculados a mano (elevaciones de la parte superior de los muros de una calle indicada, la condición de extremo abierto, la caída por curvatura de un punto indicado). Sin referencia independiente externa: la nota de diseño acota estas reducciones como MODELLED, y el ElevationMask de Orekit toma una tabla, de modo que la comparación de la fila 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' lee sus tablas de 360 puntos como entradas y no las comprueba

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ninguna: dimensiones elegidas e indicadas, no un levantamiento de ninguna calle, puerto, fiordo o terminal (la relación de aspecto de la calle está dentro de la banda 0.5-2 de Oke ({ "1988" }); el fiordo es del orden de los fiordos del oeste de Noruega; las pilas usan la altura de contenedor high-cube de ISO { "668" }). La prueba comprueba los preajustes frente a sus propias dimensiones indicadas, una comprobación de transcripción, que la regla de validación no cuenta

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Los factores de DOP de reloj único se apoyan en el núcleo validado frente a gnss_lib_py { "1.0.4" } (fila 'GNSS geometry / dilution of precision (DOP)'); las comprobaciones propias de esta fila son internas: sky_geometry reproduce orbit::dop y dop_cov sobre la misma geometría, la elipse reproduce una descomposición analítica en valores propios 2x2, las entradas ECEF y de azimut/elevación coinciden, y el RMS y la contención del { "95" } % de la nube con semilla coinciden con la geometría. La covarianza ENU con un reloj por sistema y la elipse son VALIDATED en la fila 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); lo que sigue siendo MODELLED aquí es la composición: la propagación de los preajustes a un cielo representativo, la nube de Monte Carlo (comprobada frente a la geometría que muestrea, una comprobación de autoconsistencia) y las superficies. Los preajustes de constelación dan un cielo representativo, no uno con fecha; el modelo de error gaussiano y la UERE son entradas indicadas, no una exactitud medida ni una cota de integridad

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (el núcleo de reloj único frente a gnss_lib_py)

# text
seg-0b5caf359b15 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Recursión de covarianza de clock_state en varios pasos (comprobación cruzada dentro del mismo código base); el núcleo subyacente de varianza de deriva e inversión de holdover está validado externamente frente a scipy (véase 'Clock-holdover coast-variance & threshold inversion'). Las cifras de holdover por clase con suelo de ruido rojo siguen siendo MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (frente a la recursión de covarianza de Kalman en varios pasos; FM blanca exacta; ida y vuelta); núcleo de varianza de deriva validado externamente en tests/gnss_denied_clock_holdover_reference.rs (frente a scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Registros medidos, reservados: relojes combinados finales de IGS a { "30" } s de los { "11" } satélites GPS Block IIF del 2026-03-01 al { "14" } (una ventana que ninguna prueba había abierto; IGS, abierto con atribución) y el receptor u-blox ZED-F9P de JammerTest { "2024" } en sus sesiones estacionarias no puntuadas (GPL-3.0-or-later). Comparación externa D9 (preregistrada 2ec76864, desviación de Allan prevista / medida de cada tarjeta dentro de [1/1.5, { "1.5" }] en sus tiempos de promediado ajustados), un hallazgo (sigue siendo MODELLED): { "10" } de las { "11" } tarjetas GPS IIF están dentro del umbral; G27 es optimista a la escala de dos horas ({ "0.662" } a { "7680" } s, peor factor { "1.510" }), el error periódico a escala de hora que una tarjeta de ley de potencias no recoge. La tarjeta del TCXO del receptor está bloqueada: fuera de las transmisiones registradas, las demás sesiones del conjunto de datos dejan { "167" } épocas frente a las { "3600" } necesarias. Informadas, no a ciegas (registros abiertos por filas anteriores): la tarjeta del cesio 5071A está dentro del umbral (peor { "1.070" } hasta { "4096" } s), la tarjeta del OCXO es conservadora y queda fuera ({ "2.348" } a { "128" } s; su suelo de ruido cambia durante el registro), y la tarjeta del estroncio de Norcia ajustada a los tres puntos publicados más cortos está dentro en los dos puntos puntuados ({ "1.291" }, { "1.405" }). Los másers de hidrógeno pasivos de Galileo (no hay una fuente de relojes finales de Galileo accesible sin inicio de sesión) y el Deep Space Atomic Clock (un único valor abierto en el espacio) están bloqueados. D9 ronda { "2" }, el TCXO de receptor ZED-F9P como clase de modelo con { "14" } días de { "12" } estaciones estáticas de Wrocław (Zenodo { "6488497" }, CC BY { "4.0" }; preregistrada fb475550), un hallazgo: con el procesamiento registrado, { "11" } de las { "12" } estaciones no eran evaluables (RAIM rechazó la mayoría de las épocas libres de ionosfera) y BX14 falló; una repetición declarada con un procesamiento corregido (preregistrada c9cc0d49) pasa { "1" } de { "11" } estaciones a ciegas (BX12, { "1.412" }; BX07 { "1.532" } y BX13 { "1.542" } justo fuera), porque los relojes de receptor de punto único obtenidos de archivos intermitentes de { "30" } s no son un registro limpio de un oscilador

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; preregistrada 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; condicionado a datos)

# text
seg-a2202f0e06b2 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Registros medidos, reservados: relojes combinados finales de IGS a { "30" } s de los { "11" } satélites GPS Block IIF del 2026-04-01 al { "14" } (una ventana que ninguna prueba había abierto; IGS, abierto con atribución). Comparación externa D9 (preregistrada fb475550, desviación de Allan prevista / medida dentro de [1/1.5, { "1.5" }] en cada tiempo de promediado ajustado de cada satélite), un hallazgo (sigue siendo MODELLED): { "9" } de las { "11" } tarjetas están dentro del umbral; G03 ({ "1.947" }) y G25 ({ "1.581" }) son optimistas entre { "60" } s y { "2000" } s porque sus registros reservados son más ruidosos que sus tercios de ajuste (la parte reservada de G25 contiene { "16" } huecos y { "29" } valores atípicos de fase), un cambio del reloj y no la falta de un término periódico. Quitar los términos periódicos de la predicción hace fallar las { "11" } tarjetas ({ "1.77" } a { "4.96" }), así que los términos sostienen la predicción

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; preregistrada fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), con F mediante scipy.linalg.expm y Q mediante la matriz por bloques de Van-Loan { "1978" }: una implementación de referencia independiente que reproduce la trayectoria completa del filtro de kshana. Consistencia entre implementaciones: la física del reloj y la calibración de Allan no están validadas externamente, por lo que sigue siendo MODELLED. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): con relojes finales de IGS a { "30" } s de { "11" } satélites GPS Block IIF (2025-08-17 al { "30" }), con Q ajustada a la ADEV de la primera mitad y el filtro puntuado en la segunda mitad reservada, el filtro es consistente a un paso ({ "0.906" } a { "0.971" } de las épocas dentro de su banda del { "95" } %, umbral { "90" } %) pero demasiado confiado a una hora en { "9" } de los { "11" } relojes ({ "0.486" } a { "0.829" }) y sus sumas de innovación quedan fuera de [{ "2.4" }, { "3.6" }] en { "5" }. El ruido de fase blanco ajustado es cero en todos los satélites, y el error a escala de hora (términos periódicos, FM flicker) no está en el modelo de 3 estados. Ronda { "2" } de { "0.30" }, un filtro ampliado (FM flicker y estados de una y dos veces por revolución) sobre relojes de IGS reservados nuevos del 2025-09-01 al { "14" } (preregistrada 4b1a841e), un hallazgo (sigue siendo MODELLED): los criterios de consistencia a un paso y a una hora se mantienen en los { "11" } satélites ({ "0.948" } a { "0.988" } y { "0.907" } a { "0.996" }), pero el criterio de la suma de innovaciones falla en G24 ({ "0.964" }) y G30 ({ "1.929" }) frente a [{ "2.4" }, { "3.6" }]. D9 ronda { "3" }, el filtro ampliado de la ronda 2, con ajuste y criterios sin cambios tras el detector de acondicionamiento congelado de clock_library, sobre relojes de IGS nuevos del 2026-04-01 al { "14" } (preregistrada fb475550), un hallazgo (sigue siendo MODELLED): (a) a un paso { "0.941" } a { "0.968" } y (c) NIS triple medio { "2.641" } a { "3.549" } se mantienen en los { "11" } satélites; (b) una hora falla en G09 ({ "0.894" }) y G26 ({ "0.876" }) frente a { "0.90" }

# text
seg-3016100a7015 = clock_state::tests (Q analítica de van-Loan; NEES; positividad de la PSD); tests/clock_state_reference.rs (trayectoria completa de predicción y actualización: estado x y covarianza P de { "3" }×{ "3" } sobre { "1925" } pasos / { "4" } conjuntos de parámetros frente a filterpy { "1.4.5" }; peor |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fija el hallazgo); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ronda { "3" })

# text
seg-27554b73549b = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Magnitud de Sagnac comprobada frente a un VALOR PUBLICADO de referencia: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Ec. { "1.29" }: una circunnavegación ecuatorial hacia el este acumula { "207.4" } ns (2ωA_E/c²); kshana reproduce { "207.386" } ns. Corroborada de forma independiente por geodist() de RTKLIB { "2.4.3" } (Takasu, BSD-2-Clause), que incorpora la misma geometría 2Aω/c². El presupuesto compuesto de transpondedor, vista común y PPP de TWSTFT del BIPM no tiene referencia independiente externa, así que la capacidad sigue siendo modelada

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (cancelación recíproca; identidad de Sagnac de dos formas); tests/time_transfer_error_budgeting_reference.rs (Sagnac de circunnavegación ecuatorial = { "207.386" } ns frente al valor publicado de Ashby de { "207.4" } ns con diferencia < { "0.05" } ns; además, la geometría Sagnac/geodist comprobada de forma cruzada con geodist() de RTKLIB { "2.4.3" } compilado a partir del código fuente en C)

# text
seg-a5714c98b299 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. La correlación cruzada y la autocorrelación de los códigos Gold C/A de GPS coinciden EXACTAMENTE (enteros ±65/−1/63) con una generación independiente de códigos según IS-GPS-200; la forma de la PSD de BPSK-R({ "1" })/BOC({ "1,1" }) frente a un periodograma independiente de scipy. Las formas cerradas de modulación/SSC/DLL (Betz { "2001" } / Kaplan y Hegarty) siguen siendo analíticas, así que la fila sigue siendo MODELLED, pero la subafirmación de correlación de códigos se contrasta externamente. Ronda { "2" } de { "0.30" }, frente a los valores impresos de Betz { "2001" } y Hein et al. { "2006" } (preregistrada 9f4f2ce8, media unidad impresa), un hallazgo (sigue siendo MODELLED): coinciden las { "45" } celdas espectrales de la Tabla { "1" }, los valores de correlación de { "1" } GHz, las cifras de interferencia de MBOC y { "2" } de los { "3" } desfases de la Fig. { "17" }; no coinciden los primeros lóbulos laterales de { "24" } MHz, el desfase de BOC({ "8,4" }) de la Fig. { "17" } ni cada sesgo de multitrayecto en el peor caso de las Figs. 18-21 ({ "11" } a { "15" } % por debajo). Kshana y una evaluación independiente con NumPy de la lectura preregistrada coinciden, de modo que la diferencia está en esa lectura o en un detalle no indicado del artículo; causa sin resolver

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (SSC propia de BPSK = 2/3R_c; PSD de área unidad; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (coincidencia entera exacta de la correlación cruzada y la autocorrelación Gold C/A de GPS con una generación independiente de códigos según IS-GPS-200; PSD de BPSK-R({ "1" })/BOC seno({ "1,1" }) frente a un periodograma independiente de scipy); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fijado)

# text
seg-9fe0ec8c4531 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Vectores numéricos de los artículos primarios publicados de CAI (función de transferencia de Cheinet { "2008" }; sensibilidad de Peters/Freier): k_eff·T² coincide exactamente, la ASD de ruido de disparo es un suelo unilateral a ~{ "2" }× como máximo de cada instrumento publicado (los dispositivos reales presentan ruido técnico por encima del suelo cuántico). Una cota, no una paridad. Ronda { "2" } de { "0.30" } (preregistrada fcb9ac64), un hallazgo (sigue siendo MODELLED): el ruido de rotación solo de QPN frente a los puntos medidos de la Fig. { "14" } de Gauguet et al. { "2009" } da razones de { "0.695" } a { "0.788" } en los tres puntos admitidos ({ "0.751" } en el punto de funcionamiento), y no alcanza el umbral preregistrado del { "30" } % por { "0.5" } puntos; el suelo de QPN queda entre un { "21" } y un { "31" } % por debajo del ruido medido, como cabe esperar de un modelo sin ruido de láser ni de detección. La composición del gradiómetro coincide con la línea del modelo de QPN de Janvier et al. { "2022" } (razón de { "1.013" } a { "1.017" }, Reference). La prueba medida no puede discriminar un error de composición de sqrt({ "2" }); solo puede la línea de Janvier de contraste desigual

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; T² de Mach-Zehnder; cota del suelo de Freier-2016); tests/quantum_inertial_sensor_reference.rs (función de transferencia |H(ω)|, k_eff·T² y ASD de ruido de disparo frente a los vectores numéricos publicados de Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fijado; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Autoconsistencia del modelo de franjas del interferómetro: el borde de media franja, la estructura de aliasing periódica en 2π y la cancelación del factor de escala en la razón alcance/resolución son identidades algebraicas de forma cerrada comprobadas frente a las propias funciones de fase y sensibilidad de Mach–Zehnder del motor; son comprobaciones de consistencia interna, NO un conjunto de datos externo, por lo que la fila sigue siendo InternalConsistency. Ambigüedad de franja ideal de tres pulsos, MODELLED; sin cotas de aberración de frente de onda ni de pérdida de contraste sobre el alcance sin ambigüedad

# text
seg-81802510f112 = quantum_imu::tests (a_max se sitúa en el borde de media franja ±π con el escalado de alcance 1/T²; la recuperación de fase desenvuelta es exacta dentro de [−a_max,a_max] y produce aliasing de exactamente { "2" }·a_max fuera de él; el rango dinámico sin ambigüedad a_max/σ_a=π/σ_Φ es idéntico para dos factores de escala de longitud de onda/T muy distintos; los métodos de CaiAccelerometer coinciden con las funciones libres)

# text
seg-91728172ea50 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Integración independiente por SDE de Monte Carlo con numpy del ruido de aceleración blanca doblemente integrado (valida la varianza analítica de VRW con un algoritmo genuinamente independiente) más un ancla de valor publicado de Groves { "2013" } para los términos de sesgo y factor de escala; las cifras de dispositivos CAI cuantifican hardware del socio y siguen siendo MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (sesgo frente al integrador de AccelModel; VRW frente a la integral analítica); tests/quantum_inertial_dead_reckoning_reference.rs (VRW frente a una doble integración independiente de Monte Carlo con numpy del ruido de aceleración blanca, peor desviación { "0.42" }% dentro de ±{ "3" }% en { "6" } tiempos de deriva; sesgo/factor de escala frente a un valor de forma cerrada de Groves { "2013" }; ida y vuelta de holdover)

# text
seg-8bc5bc7d553c = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Ecuación del presupuesto de enlace de C/N₀ antiinterferencia contrastada con una rederivación independiente en numpy (comparte la misma forma cerrada → InternalConsistency) más una caracterización de la degradación de C/N₀ de JammerTest-2024 real. Ronda { "2" } de { "0.30" }, bloqueada (sigue siendo MODELLED): la caída medida de C/N0 de JammerTest { "2024" } frente a una predicción del presupuesto de enlace (preregistrada 6a66994b, dentro de { "3" } dB) no se ejecutó porque la posición y la orientación de la antena F8.1 en Bleik y la parte de L1 de la potencia de rampa multibanda { "1.6.4" } no están documentadas en el catálogo de pruebas ni en el registro oficial

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form y cw_q_equals_the_spectral_separation_closed_form: la tabla de Q, CW y banda estrecha { "1" }, banda ancha y barrido { "2" }, fijada a las formas cerradas de navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/C-N₀ efectivo frente a una rederivación independiente en numpy del presupuesto de enlace de Kaplan y Hegarty §{ "9.4" }; el C/N₀ real de JammerTest cae de forma monótona al atravesar el umbral de { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (preregistrada, bloqueada, no ejecutada)

# text
seg-26b6c4436ca0 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Parámetros de escenario de TEXBAT (Humphreys { "2012" }): caracterización, no vectores fijados. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): en JammerTest { "2024" } (Bleik; datos GPL-3.0) los monitores a nivel de observable (chi cuadrado asistido por reloj, RAIM, fallo de resolución) no dieron alarma en { "10" } s de ninguno de los { "8" } inicios de suplantación publicados evaluables (donde la ventana previa al inicio estaba limpia, la primera alarma llegó de { "10.2" } a { "39" } s después del comienzo de la ranura publicada), y tres ventanas previas al inicio contenían falsas alarmas del monitor de reloj ({ "81" }, { "64" } y { "173" } épocas). El primer efecto observable fue una pérdida del seguimiento GPS de doble frecuencia, no una inconsistencia de RAIM. Los inicios publicados son comienzos de ranuras de un calendario con resolución de minuto; que precedan a la captura de RF es una interpretación, no una medición. Ronda { "2" } de { "0.30" }, frente al registro oficial de JammerTest { "2024" } de los organizadores (resolución de segundo; preregistrada 6a66994b con un monitor de reloj de tres estados calibrado con Hadamard y sin enclavamiento), un hallazgo (sigue siendo MODELLED): el monitor da alarma en { "10" } s en { "4" } de los { "10" } inicios registrados; en los otros seis llega de { "18" } a { "211" } s tarde o da falsas alarmas de reloj previas al inicio ({ "1" } en { "2.1.4" }, { "85" } en { "2.3.15" }). D9 ronda { "3" } (una tarjeta de receptor de las otras sesiones de la unidad de JammerTest, preregistrada 2ec76864) bloqueada: { "167" } épocas de entrenamiento frente a { "3600" }. D9 rondas { "4" } y 4b (niveles de ruido de una tarjeta de clase de modelo u-blox ZED-F9P, Wrocław { "2021" }, preregistrada fb475550; 4b una repetición declarada con una extracción corregida, c9cc0d49), un hallazgo (sigue siendo MODELLED): cero falsas alarmas previas al inicio en los { "10" } inicios registrados y { "6" } de { "10" } en { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } y { "2.6.1" } siguen tarde (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), sin cambio por el nivel de ruido del reloj

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (caracterización de parámetros de TEXBAT); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fija el hallazgo); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-964d859381f5 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Compone primitivas validadas (allan/holdover van-Loan, suelo de seguridad); calibrada con el escenario { "2.1.1" } de JammerTest { "2024" } (~{ "1.01" } ms de arrastre real del tiempo servido frente a ≤{ "51" } ns declarados). Puente sobre partes validadas: no es en sí una validación externa. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): en los escenarios de suplantación de JammerTest { "2024" } el error medido de tiempo servido no detectado supera el TPL nominal en { "3" } de { "8" } inicios detectados: { "184.3" } frente a { "34.6" } ns ({ "2.1.4" }), { "295.7" } frente a { "159.3" } ns ({ "2.3.5" }) y { "143.0" } frente a { "69.0" } ns ({ "2.3.11" }); tres de los cinco que quedan dentro son triviales (una falsa alarma previa al inicio enclavada). Causa probable: el término de deriva de una calibración de { "60" } s con ruido de deriva nulo no cubre la divagación de frecuencia del TCXO del receptor durante { "15" } a { "39" } s. El error medido es la propia estimación de reloj de punto único de Kshana frente a una recta ajustada a sus propias estimaciones previas al inicio, de modo que ni siquiera una coincidencia habría sido plenamente independiente. Ronda { "2" } de { "0.30" }, frente a los inicios del registro oficial de JammerTest { "2024" } y al error de tiempo medido del receptor (preregistrada 6a66994b), un hallazgo (sigue siendo MODELLED): en { "4" } de los { "10" } inicios registrados el error no detectado supera el TPL de estado de deriva ({ "634.7" } frente a { "458.5" } ns en { "2.1.1" }, { "232.6" } frente a { "16.2" } ns en { "2.3.5" }, { "41.3" } frente a { "6.0" } ns en { "2.3.10" }, { "218.6" } frente a { "47.4" } ns en { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (referencias independientes de forma cerrada + CUSUM); examples/tpl_jammertest.rs (calibración con suplantación real de JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fija el hallazgo); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Coeficientes de IGRF-14; CRLB de filtro adaptado a partir de primeros principios. El campo del benchmark de gravedad de campo real se comprueba externamente (fila 'Gravity-anomaly synthesis from a spherical-harmonic model'), pero su resultado de navegación no tiene referencia independiente externa

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB de correspondencia con mapa; campo IGRF-14); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (el benchmark de 60 min sin GPS sobre el campo real EGM2008 de grado 70, preregistrado en xval/icgem-egm2008/: con correspondencia { "3106" } m, de modo que el umbral de < { "500" } m es NOT MET y se afirma como no alcanzado, y la reducción de diez veces de la deriva de { "70.6" } km es MET; más el Monte Carlo con semilla del error de mapa); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel y tests/emag2_real_grid.rs (lector de EMAG2v3 condicionado a datos sobre un recorte real; no se afirma ningún resultado de navegación con él); tests/terrain_slam_rbpf.rs (estimación conjunta del mapa, un RBPF de tipo FastSLAM, frente a SITAN de mapa conocido con un error de mapa correlado de { "15" } m sobre { "20" } semillas, preregistrado en xval/terrain-slam-rbpf/: ganancia media del { "1.5" }% y mejor en { "10" } de { "20" }, de modo que los umbrales del { "10" }% y de 12 de 20 son NOT MET y se afirman como no alcanzados; sin perjuicio en un mapa perfecto, MET)

# text
seg-d7fd40dc37c6 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Ajuste a la norma del SBOM al esquema JSON oficial de CycloneDX { "1.5" } (+ identificadores SPDX válidos): una norma publicada externa, cero errores de validación en todo el grafo de dependencias; la parte de determinismo de la FoM y reproducibilidad byte a byte sigue siendo una comprobación de autoconsistencia fijada, por lo que la fila sigue siendo MODELLED

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (el SBOM generado valida con cero errores frente al esquema JSON oficial de CycloneDX { "1.5" } sobre el grafo completo de 66 componentes distribuido: características default + python + wasm, sin dependencias de desarrollo)

# text
seg-a014f82f28b0 = Evaluación de detección de deterioros de RF mediante aprendizaje automático ({ "13494" })

# text
seg-400e45e7e700 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Cotas de AUC de forma cerrada (Mann–Whitney) + un detector con referencia independiente perfecta; el corpus es SINTÉTICO (basado en parámetros, no de campo/IQ)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfecta=1/idéntica=0.5/empate={ "0.125" }, ROC monótona, fusionada>{ "0.8" }, separación de capas por clase, protección frente a fugas, corpus reproducible, los indicadores de desplazamiento de distribución señalan optimismo); dominance_demonstrators (alcanzable + reproducible + MODELLED-not-VALIDATED + brecha de optimismo autoconsistente)

# text
seg-7566da9904ba = Estudio de la brecha de optimismo en detección de deterioros de RF mediante aprendizaje automático y predictor de la brecha solo con ID

# text
seg-0d7f46d20a0d = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Estadísticos derivados a mano frente a formas cerradas (AUC binormal Φ(d'/√{ "2" }), varianza de DeLong, Spearman con rangos empatados, recuperación exacta de MCO) + validación cruzada dejando uno fuera frente a la línea base de predecir la media. El corpus es SINTÉTICO (basado en parámetros, nunca de campo/IQ) y la brecha de optimismo es un desplazamiento de severidad sintético→sintético, NO un resultado de simulación a campo

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC de referencia independiente por clase≈{ "1" }, brecha de optimismo aprendida>{ "0" }, forma de la rejilla + el IC bootstrap acota la media + tendencia de escalado positiva, características de ID finitas, el predictor de la brecha supera a predecir la media tanto con validación cruzada dejando fuera un detector como dejando fuera una clase + determinista); impairment_ml::tests (logreg separa + determinista + pérdida↓, el MLP resuelve XOR, que un modelo lineal no puede + con semilla); eval_stats::tests (bootstrap/DeLong/Spearman/ridge frente a formas cerradas)

# text
seg-590ec8589ce6 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. El núcleo de ajuste de ADEV medida→PSD (NNLS) coincide con scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs): un núcleo externo independiente; pero las CIFRAS del estudio comparativo cuantifican (nunca validan) un reloj o un CAI del socio, de modo que el propio estudio sigue siendo MODELLED, sin halo de validación

# text
seg-e0f68f57399d = quantum_trade::tests (recuperación en ida y vuelta de la ADEV, no negatividad de NNLS, aviso de suelo presente/ausente, beneficio>{ "1" }, envolvente monótona + cota de alt-PNT); dominance_demonstrators (la ADEV medida se guía por datos y no se supone un suelo, la clase supuesta marca suelo + aviso, curva mal formada rechazada, MODELLED-not-VALIDATED)

# text
seg-7d1d24d8f8f5 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Tabla definicional Kp↔ap + forma cerrada de la temperatura exosférica de Jacchia-1971 (coincide a <{ "1" } K con las anclas publicadas, tests/space_weather_reference.rs); la densidad se caracteriza frente a pymsis NRLMSISE-00 (un modelo independiente del NRL): la oscilación del ciclo solar a { "800" } km es 10.4x frente a 13.6x de NRLMSISE-00. Revisión { "0.30" }: el factor de actividad de primer orden calibrado se sustituyó por Jacchia { "1971" } (densidad del escenario por defecto a { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; se eliminó reference_exospheric_temperature_k, se añadió mean_exospheric_temperature_k). Ronda { "2" } de { "0.30" }, densidades medidas de acelerómetro de TOLEOS CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; preregistrada 20eed695), un hallazgo (sigue siendo MODELLED): los promedios por órbita a { "400" } a { "500" } km están dentro de un factor { "2" } en el máximo solar fuera de tormentas (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), pero Jacchia { "1971" } es unas 1.7x demasiado densa en el mínimo solar de { "2008" } (GRACE-A 412/544 dentro de un factor { "2" }), de modo que la densidad no está validada

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exacto en los puntos de la rejilla + ida y vuelta + monótono, media de Ap diaria, T exosférica frente a las anclas publicadas de mínimo/media/máximo solar + incremento por tormenta, densidad igual a la unidad en la referencia, oscilación del ciclo solar dentro de la banda observada de { "5" }–{ "10" }×, escenario reproducible + MODELLED-not-VALIDATED + rechazo de fuera de rango); dominance_demonstrators (alcanzable + reproducible + T física + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Geometría de lanzamiento de trigonometría esférica de forma cerrada frente a anclas de ejemplos resueltos publicados (Vallado, Fundamentals of Astrodynamics 4.ª ed., Algoritmo { "37" } de acimut de lanzamiento + cap. 6 de cambio de plano; tests/launch_window_ascent_geometry_reference.rs). Estas reutilizan la misma forma cerrada que implementa kshana (una comprobación de paridad con un valor publicado o de transcripción, InternalConsistency); de dos cuerpos, MODELLED, sin triángulo de velocidades de Tierra en rotación, ni modelo de ascenso ni de pérdidas por arrastre. Comparación externa { "0.30" } frente a Orekit { "12.2" } (Apache-2.0), un hallazgo (sigue siendo MODELLED): la geometría coincide hasta el redondeo (inclinación recuperada del acimut de agotamiento en { "158" } casos, peor { "2.6e-15" } rad; inclinación mínima, velocidad circular y delta-v de dogleg hasta { "3e-16" }), pero la velocidad del emplazamiento por rotación terrestre no alcanza el relativo preregistrado de { "1e-6" } a { "62.9" } grados de latitud ({ "1.12e-6" }). La diferencia crece como tan(lat), lo que es coherente con un desfase del polo por movimiento polar de unos { "5.8e-7" } rad en el marco terrestre de Orekit que la expresión esférica ω·R·cos(lat) omite. La afirmación no se acotó antes de la ejecución, por lo que la fila no puede ascender con esta comparación. Ronda { "2" } de { "0.30" } (preregistrada 71bebf63): con una época y filas de IERS, la velocidad del emplazamiento con el polo verdadero (campo de escenario site_rotation_speed_true_pole_m_s) coincide con Orekit dentro de { "1e-6" } en { "24" } emplazamientos sobre cuatro longitudes (peor { "4.9e-8" }), pero la velocidad nominal sin época que el escenario emite por defecto como bonificación de rotación terrestre sigue sin alcanzarlo por { "1.12e-6" }, de modo que la fila sigue siendo MODELLED a la espera de una decisión sobre la salida por defecto

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (un lanzamiento hacia el este exacto alcanza i=latitud, KSC→ISS = { "45" }° de manual, polar = N/S, i<lat inalcanzable, bonificación ecuatorial de { "465" } m/s, cambio de plano de { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, recuentos de oportunidades diarias, escenario reproducible/MODELLED + trayectoria dogleg); dominance_demonstrators (alcanzable + reproducible + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Entrada analítica de forma cerrada de Allen–Eggers, contrastada además con una integración numérica con solve_ivp (DOP853) de scipy { "1.18" } de la MISMA EDO de entrada con solo arrastre (tests/ballistic_re_entry_corridor_reference.rs, { "36" } casos, peor a_max relativo { "2.9e-9" }): una comprobación de integral numérica frente a su propia forma analítica, de modo que sigue siendo InternalConsistency, NO una validación externa. Balístico MODELLED (sin sustentación), sin aerotermia/TPS: la salida de calentamiento es una velocidad, no un flujo de calor. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a la reconstrucción de la entrada de la SRC de Stardust (Desai y Qualls, NASA NTRS { "20080008567" }), la deceleración máxima de Allen–Eggers para el estado inercial de entrada impreso ({ "12.9" } km/s, -8.2 grados, H { "7200" } m) es { "61.8" } g frente a los { "32.89" } g de la mejor trayectoria estimada, +{ "88" } % frente a una tolerancia del { "15" } %: la solución de ángulo de trayectoria constante y sin gravedad casi duplica el máximo de una entrada rasante y más rápida que la de escape. Stardust no llevaba acelerómetro, de modo que la reconstrucción es una estimación de trayectoria. Ronda { "2" } de { "0.30" }, bloqueada (sigue siendo MODELLED): una solución integrada de masa puntual plana (reentry::simulate_planar_entry, US76, gravedad del inverso del cuadrado, curvatura) coincide con las mejores trayectorias estimadas de Stardust y Genesis dentro del { "15" } % (+{ "11.3" } %, +{ "5.6" } %), pero esos máximos son salidas de simulación de agencias, no mediciones, de modo que es solo una comprobación cruzada. La comparación con acelerómetro (preregistrada a94a283d) está bloqueada a la espera de una copia legible del análisis REMM de Hayabusa2 (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (g máximo independiente del coeficiente balístico + banda física de g, crece con γ más pronunciado / entrada más rápida, la velocidad del g máximo = V_e·e^(−1/2) y la del calentamiento máximo = V_e·e^(−1/6) más rápida, la altitud del g máximo física + más profunda para B mayor, escenario reproducible/MODELLED + geometría degenerada rechazada); dominance_demonstrators (alcanzable + reproducible + fracción V_e·e^(−1/2) + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (solo comprobación cruzada); tests/reentry_point_mass_accelerometer_oracle.rs (bloqueada, no ejecutada)

# text
seg-f40cd1b25160 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la eficiencia espectral calculada en forma cerrada a partir de K_bch de la Tabla 5a y las longitudes de trama coincide con las eficiencias que imprime la Tabla { "13" } (una comprobación de transcripción de la tabla de umbrales); las piezas del presupuesto de enlace coinciden con sus formas cerradas; la selección es monótona en Es/N0 y respeta el margen; ACM mueve al menos el volumen de la codificación constante. La geometría del pase procede del predictor de pases aparentes, VALIDATED por separado. LO QUE NO SE CUBRE: no se ha comparado ninguna herramienta externa ni enlace medido; los umbrales son los valores AWGN ideales de la norma, no los de un módem; no se modelan el desvanecimiento por lluvia, la pérdida de apuntamiento a lo largo del pase ni los pilotos.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la ramificación y acotación exacta coincide con la enumeración por fuerza bruta en conjuntos aleatorios pequeños, todo plan se comprueba factible frente a las reglas de conflicto, y el voraz nunca supera al óptimo exacto. LO QUE NO SE CUBRE: no se ha comparado ningún planificador externo ni plan operativo; los contactos se toman enteros (sin división), la acumulación pendiente se fija al inicio de la ventana, y no se modelan el tiempo de reorientación más allá del tiempo de giro fijo ni el almacenamiento a bordo.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Aritmética de costes de forma cerrada frente a valores derivados a mano; un ENCUADRE económico de una cifra de cobertura modelada, no un presupuesto ni un modelo de costes validado

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (coste por cobertura derivado a mano 48/96={ "0.5" }, razón de ROI { "2.667" }, ordenación de cotas + protecciones de cobertura cero)

# text
seg-8204455973cc = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Compone la clasificación Stanford de RAIM validada externamente (raim::classify_stanford); la correspondencia entre fallo de detección y AL es en sí modelada, no una asignación de integridad certificada

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (el mismo fallo pasa de Available a MI y a HMI al endurecerse el contexto; PL conservador→Unavailable; HMI por eje; protecciones de entrada)

# text
seg-7bb58c89a1fb = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la cota de VRW citada contrastada con la física de CaiAccelerometer::accel_asd + el rango dinámico bruto calculado a partir del límite de ambigüedad de franja; las cifras son cotas MODELLED de revisión bibliográfica (needs_source_confirmation), ningún dispositivo validado, sin halo de validación

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (el VRW físico cae dentro de la cota de VRW citada en los { "3" } niveles; rango bruto de ambigüedad de franja calculado a partir de k_eff·T²; el presupuesto conservador deriva más que el mejor; toda cota con fuente y marcada para confirmación; protecciones de ordenación de cotas)

# text
seg-3f5094fa7a30 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Reimplementación independiente en numpy de la regla de cuatro regiones (scripts/gen_tib_scorer_reference.py) sobre el mismo conjunto de muestras; método citado del diagrama de integridad Stanford–ESA (Tossaint et al., ION GNSS { "2007" }) y de RTCA DO-229 WAAS MOPS. NO es una referencia independiente de exactitud con ExternalDataset: el benchmark es inmune a la honestidad.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (cuatro regiones + límites inclusivos + |error| + indisponibilidad por PL>AL); tests/tib_scorer_reference.rs (recuentos de clasificación frente a numpy independiente sobre un conjunto sintético fijo)

# text
seg-10befbc6faae = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Recuento independiente de regiones con numpy en tests/fixtures/tib/reference.json; solo comprobación cruzada de la maquinaria del puntuador, sin afirmación de exactitud.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (limpio/subacotado/todo no disponible/vacío); tests/tib_scorer_reference.rs (recuentos + tasas + coverage_ok frente a numpy hasta { "1e-12" })

# text
seg-cee919e2058e = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Generadores de fallos paramétricos representativos (modelados); el conjunto indetectable (retardo simétrico, repetición dentro de la frescura) se cita de Mizrahi RFC { "7384" } y Narula y Humphreys (IEEE JSTSP { "2018" }). Sin referencia independiente externa: un catálogo de fallos no hace ninguna afirmación medida.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (perfiles de desfase, deriva monótona, marcado del conjunto indetectable, consistencia de max_offset, exactamente dos clases indetectables)

# text
seg-0cc84aedee42 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Comprobación de propiedad de que la enumeración Verdict no puede, por su estructura, informar de un fallo indetectable como detectado (Mizrahi RFC { "7384" }); absorbido ⟺ PL ≥ desfase. Sin referencia independiente de exactitud.

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (el PL de referencia absorbe; PL roto no absorbido sin detección nunca; veredicto de cobertura detectable; la propiedad de honestidad de que no se puede alcanzar ningún veredicto de cobertura/detección para un escenario indetectable)

# text
# c1: variance
seg-350aaf43f349 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Sin referencia independiente externa, y no es posible ninguna: esto es una autodescripción, no una medición. Se registra porque su ausencia era un defecto: P5 tuvo que citar la longitud de onda de portadora y la apertura de transmisión a partir de valores por defecto del código fuente, e inferir que un <c1/> sin más estaba en metros cuadrados a partir de una comprobación de consistencia interna. La inferencia era correcta, y precisamente por eso importaba: nada habría detectado que fuera errónea

# text
seg-6d963d838eed = hybrid_integrity::tests (la configuración resuelta se repite tanto para los valores por defecto como para las sustituciones, sin hacer pasar la longitud de onda por metros en una ida y vuelta; cada entrada de unidades lleva una unidad y una clase de procedencia; todo campo que nombra el bloque de unidades se emite de verdad, de modo que no puede documentar un campo fantasma)

# text
seg-cbd0ee1c1e97 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Sin referencia independiente externa, y se rechaza ExternalDataset. Las dos entradas son un margen de Eb/N0 y un cruce de umbral de C/N0, ambos funciones de una EIRP MODELLED, una figura de mérito y una asignación de pérdidas agrupadas; no existe ningún registro medido de disponibilidad de un servicio híbrido óptico/RF Tierra-Luna con el que comprobar la cifra compuesta. Las comprobaciones que existen son internas y se declaran como tales: la composición se recalcula a partir de los márgenes publicados en el propio informe y no de las interioridades del emisor, y el alcance de cierre se verifica volviendo a ejecutar la ecuación del enlace EN él y exigiendo que el margen se anule: una ida y vuelta de inversión, no una implementación independiente. El límite honesto de la cifra se registra en el propio informe: es un indicador determinista 0/1, no una probabilidad, porque nada en este motor mide una distribución de interrupciones del enlace RF en esta banda y geometría. Esa entrada que falta se nombra en rf_availability.factors_not_included en lugar de inventarla, y suministrarla es lo que necesitaría una disponibilidad RF probabilista

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (la disponibilidad es igual al producto de los dos indicadores recalculados a partir de los márgenes del propio informe, y esos márgenes se reconstruyen a su vez a partir de la EIRP, la pérdida en espacio libre, la pérdida agrupada, la figura de mérito, el término de Boltzmann, la tasa de datos y el requisito del propio informe hasta { "1e-9" } dB; se mide que el valor es { "0" } o { "1" } mientras que se mide que la disponibilidad óptica en la misma ejecución está estrictamente entre ambos; cada fila de factor lleva una clase de procedencia del vocabulario cerrado de field_schema; el alcance de cierre indicado, vuelto a pasar por el presupuesto de enlace, devuelve un margen de { "0" } a { "1e-9" } dB y se mide que es independiente del alcance al que estaba la ejecución a lo largo de cuatro décadas, mientras que la utilización del alcance se mueve exactamente según la razón de alcances; un enlace de -40 dBW indica disponibilidad { "0" }, LOST, y una utilización superior a { "1" } en lugar de una fracción; se afirma que la nota obsoleta 'no RF-availability counterpart is computed by this engine' ha desaparecido y que la que la sustituye nombra el campo nuevo; una entrada RF mal formada se rechaza en lugar de recortarse)

# text
seg-6471f38fc505 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Sin referencia independiente externa para la RAZÓN, y se rechaza ExternalDataset deliberadamente. La cadena RF subyacente sí la tiene: tests/validate_p5_rf_ranging_precision.rs comprueba linkbudget::link_budget y navsignal::dll_code_jitter_chips frente a un fixture independiente de Python/NumPy y frente al valor resuelto codificado de Kaplan y Hegarty ({ "2.814e-3" } chip / { "0.825" } m a { "45" } dB-Hz), y el CRLB óptico tiene su propia fila de forma cerrada. Reclamar cualquiera de las dos anclas para esta fila sería una validación prestada, que los invariantes de la matriz existen para impedir: la magnitud aquí es una RAZÓN en una configuración con una EIRP MODELLED, figura de mérito, potencia de transmisión y apertura, y no existe ninguna comparación medida de telemetría óptica frente a RF en un punto de funcionamiento común con la que comprobarla. Lo que se comprueba internamente es lo que la razón puede hacer mal de verdad: que los dos tramos estén en un mismo punto de funcionamiento. Eso se mide escalando el tiempo de acumulación común y exigiendo que ambos tramos se muevan según la misma ley de raíz cuadrada y que la razón permanezca fija, y se impone rechazando la razón por completo cuando los tiempos de promediado discrepan. Ambos tramos son cotas de ruido térmico y de disparo y ambos excluyen el retardo del medio, el error de reloj y la ambigüedad, de modo que la exclusión es idéntica en cada lado; el informe lo dice en lugar de dejarlo inferido

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (la razón es igual a los dos tramos emitidos divididos, con precisión relativa de { "1e-15" }, y sus formas recíproca y en decibelios coinciden; el alcance y la sigma de tiempo de cada tramo se relacionan exactamente por c; se afirma que la configuración común emitida es igual al alcance y al tiempo de integración del propio escenario y que el alcance del tramo RF es igual al del tramo óptico; el C/N0 del tramo RF es bit a bit el del bloque de disponibilidad, de un único presupuesto de enlace, no una rederivación; la propiedad de COMPARACIÓN HOMOGÉNEA se MEASURED en lugar de afirmarse: cuadruplicar el tiempo de acumulación común reduce a la mitad el tramo óptico con { "1e-12" } y el tramo RF con { "1e-7" } y deja la razón sin moverse con { "3.19e-9" } relativo, cosa que un tramo que promediara en secreto sobre otra cosa no podría hacer; una sustitución de rf_dll_bandwidth_hz que rompe el tiempo de promediado común hace que la razón sea nula con un motivo que nombra ambos tiempos, mientras que ambos tramos se siguen emitiendo; una ejecución de un solo sentido hace que el tramo de comparación sea bit a bit el valor destacado publicado con un factor de penalización de exactamente { "1" }, y una ejecución de doble sentido reproduce la penalización 0.5/sqrt(pérdida geométrica del camino de retorno) recalculada a partir de la propia geometric_loss_db del informe con { "1e-12" })

# text
seg-7c14f0734623 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Sin referencia independiente externa: esto es una autodescripción sobre una ecuación ya validada frente a una tabla de control de diseño publicada (véase la fila del presupuesto de enlace de un solo sentido). Se registra porque su ausencia era un defecto medido: reproducir el d1_rate_gain_beamwidth.csv publicado exigió despejar una constante efectiva con { "0.0034" } dB a partir de las treinta filas, y el motor ahora tanto nombra esa combinación como demuestra, mediante una prueba, que ninguna tabla publicada habría podido separar nunca sus tres componentes

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (en tres bandas, cuatro décadas de alcance y ambos veredictos de cierre, el margen y la pérdida en espacio libre que lo sustenta se recalculan solo a partir del informe con mejor de { "1e-9" } dB; el G/T requerido ensamblado a partir de los términos de la ecuación coincide con la misma magnitud obtenida como G/T menos margen, y volver a ejecutar en él anula el margen; tres presupuestos con EIRP, pérdidas y umbral muy distintos pero igual constante de enlace dan un requisito idéntico, mientras que { "1" } dB en la constante lo mueve exactamente { "1" } dB; el reparto de ganancia está ausente salvo que se indique una temperatura de ruido y se rechaza una no positiva; todo campo que nombra el bloque de unidades se emite de verdad)

# text
seg-5a05659a1cbb = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Dos cálculos distintos dentro del código base de la misma magnitud, no uno repetido: la bisección sobre la curva de ley de potencias de IEEE-1139 no sabe nada del tipo de ruido, mientras que la forma cerrada invierte algebraicamente el tipo dominante, de modo que un tipo de ruido mal clasificado o un intervalo inicial malo aparece como una diferencia relativa no diminuta. Los cuatro valores también reproducen la tabla publicada del artículo hasta la mitad de su último dígito impreso, pero esa tabla se reconstruyó a su vez a partir de la misma forma cerrada, de modo que es una comprobación de reproducibilidad y no una referencia independiente externa, y el término de marco con el que se mide es una asignación modelada

# text
seg-d9742b5a3a48 = lunar_time_budget::tests y lunar_time_budget_scenario::tests (las cuatro clases presentes en una ejecución y en el orden de un subconjunto solicitado; cada fila coincide con su propia forma cerrada con mejor de { "1e-12" } relativo; escalar el error de marco por k escala el cruce por k para un reloj de FM flicker y por k^{ "2" } para uno de FM blanca, comprobado con k={ "2" } y k={ "3" }, lo que separa las dos clases de ruido; cada fila reproduce el cruce de reloj único que el presupuesto ya informaba; cada fila recupera el único término de marco compartido; un nombre de reloj desconocido se rechaza)

# text
seg-75715af43b8b = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Inclusión de conjuntos: la razón interferente a señal entra como un desfase uniforme en decibelios, de modo que el conjunto capturado con una potencia de transmisión mayor contiene el de una menor y la fracción solo puede aumentar, una propiedad que el patrón de Airy NO da en anchura de haz ni en altitud, donde la región capturada se rompe en anillos y la fracción es realmente no monótona. Ninguna tabla publicada da la fracción de disco capturada de un transmisor orbital lunar frente a la altitud y la anchura de haz, de modo que no hay nada externo con lo que comprobar estas celdas; el patrón subyacente se valida por separado frente a valores de Bessel publicados y tiene su propia fila

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests y attack_surface::tests (la rejilla está completa y toda fracción capturada está en [{ "0,1" }]; la fracción capturada no decrece con la potencia de transmisión en ningún nodo; NO es monótona en anchura de haz ni en altitud, lo cual fija su propia prueba para que el barrido no pueda suavizarse después; el nodo de línea base reproduce bit a bit la fracción capturada existente; la evaluación solo del limbo es idéntica bit a bit al último punto del barrido completo; un cruce localizado está en el umbral con { "1e-9" } dB y queda enmarcado)

# text
seg-eebb00692020 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Solo autoconsistencia: el total publicado se comprueba frente a la raíz de la suma de cuadrados de los términos del mismo archivo, y la curva emitida reproduce la p3_time_budget_curve.csv publicada en los { "57" } puntos. Ambas comprobaciones comparten las propias definiciones de términos de este motor, de modo que ninguna es independiente. El término de reloj se apoya en especificaciones de reloj publicadas, pero las MAGNITUDES del suelo de enlace, de marco, relativista y de efemérides son asignaciones de presupuesto documentadas sin referencia independiente externa

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (los { "57" } tiempos de promediado x { "8" } términos presentes, el índice de la rejilla va de { "0" }..={ "56" } y lleva { "8" } filas cada uno; la fila <c1/> es igual a la raíz de la suma de cuadrados de los siete términos que la acompañan en cada tau; la tabla sigue una rejilla solicitada y no una codificada; emitirla deja el JSON del informe idéntico byte a byte)

# text
seg-af88df24ce81 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Solo consistencia interna: el tiempo hasta el umbral obtenido por bisección se comprueba frente a la inversa de forma cerrada del tipo de ruido dominante del reloj, y el término de reloj libre frente al propio término de reloj del presupuesto. Las clases de reloj se apoyan en especificaciones publicadas de un día (sus propias filas); la tasa de LTC no se vuelve a derivar aquí y conserva su propia fila VALIDATED (Lunar coordinate time); el residuo de gobierno es ILLUSTRATIVE, el residuo de realización es una asignación de presupuesto y no se incluye ningún modelo térmico. El objetivo de nivel de nanosegundos descrito en el material de PNT lunar del ICG WG-B de junio de { "2024" } se cita como declaración de la fuente, no se adopta como afirmación; nada de lo que figura aquí es una afirmación sobre ningún reloj de estación real

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: con el gobierno desactivado, el término de reloj es igual al término de reloj del presupuesto hasta el último bit en las cuatro clases; bisection_matches_the_closed_form dentro de { "1e-9" } relativo para ambas clases de ruido; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: el documento, la tabla y el resumen por defecto no cambian y el bloque solo añade su propio objeto y sus unidades; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: óptico < PHM < RAFS < miniRAFS de { "1" } s a { "7e5" } s, con las curvas de PHM y RAFS cruzándose entre { "7e5" } y { "8e5" } s, fijado como propiedad declarada de los modelos de reloj de un solo tipo de ruido; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. delta_dor de onda plana (mismo código base) en el límite de campo lejano; derivadas parciales por diferencias finitas. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a los tiempos de luz convergidos de ANISE { "0.10" } a través de DE440 ({ "75" } retardos el 2024-01-01 sobre tres líneas base de DSN, generados por xval/anise-lunar-od sin código de Kshana), ningún retardo está dentro de la tolerancia de { "1" } ps. La mayor diferencia es de { "24" } µs, debida al centro lunar analítico (a unos { "200" } km de DE440), la única geometría instantánea sin iteración de tiempo de luz ({ "3.6" } µs) y el movimiento polar omitido; las derivadas parciales de las balizas difieren hasta { "2.9e-3" } en relativo frente a { "1e-6" }. La afirmación de la documentación del módulo de que las aproximaciones de marco están por debajo de la fidelidad del modelo no se sostiene a este nivel. Ronda { "2" } de { "0.30" }: la ruta de kernel (lunar_vlbi::KernelGeometry) se valida frente a los tiempos de luz de NAIF SPICE en su propia fila, Lunar geodetic VLBI, kernel path; la comparación con ANISE de esa ruta (75/75 dentro de { "1" } ps, peor { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) es solo una comprobación cruzada de la evaluación del kernel, porque la resolución del tiempo de luz en ese arnés es propia de este proyecto. Esta fila (la ruta analítica por defecto) sigue siendo MODELLED con el hallazgo anterior

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (el límite de campo lejano coincide con delta_dor; corrección de campo cercano; derivadas parciales por diferencias finitas); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Identidades de forma cerrada y consistencia interna; NO se afirma ninguna referencia independiente externa. El semiángulo del limbo se comprueba frente a asin(R_earth/r_orbit) y la geometría frente a él; la pérdida en espacio libre, el núcleo de DOP y la propagación SGP4 que esto compone están cada uno validados externamente en sus propias filas y esta fila no toma prestado su estado. POR QUÉ MODELLED, y es el patrón de transmisión: la ganancia en función del ángulo es una apertura circular iluminada uniformemente, el patrón de Airy, mientras que una antena GPS L1 real es una agrupación helicoidal de doce elementos con un lóbulo principal de forma moldeada, con el máximo fuera del eje de visión para igualar la potencia sobre el disco terrestre, y con lóbulos laterales que no son de Airy. Existen patrones medidos publicados y no se incluyen aquí, de modo que los órdenes y los órdenes de magnitud son fiables, mientras que los dB de un satélite individual no lo son. UNA PRIMERA IMPLEMENTACIÓN DE ESTA FILA ERA ERRÓNEA DE UNA FORMA QUE MERECE REGISTRARSE: la expresión de Airy solo es válida en el hemisferio frontal, su argumento va como sin(theta), y con theta cercano a { "180" } grados da la vuelta y devuelve LA GANANCIA COMPLETA EN EL EJE DE VISIÓN detrás de la apertura, de modo que los dos enlaces más fuertes del primer informe eran satélites con sus antenas apuntando en dirección contraria a la Luna, y eran los únicos dos que superaban el umbral. Detrás de la apertura, el modelo aplica ahora un suelo plano de lóbulo posterior, declarado como una cota y no como una forma de patrón fabricada. Ausentes deliberadamente, y cada una hace que el presupuesto sea OPTIMISTA: ninguna pérdida ionosférica ni troposférica en los rayos rasantes al limbo, ninguna pérdida por polarización, apuntamiento o implementación, y una Tierra esférica sin extensión refractiva. La posición de la Luna es una ENTRADA, no una consulta de efemérides, porque la magnitud sometida a prueba es el enlace y la geometría del haz. Ascender esta fila a validada exige un patrón de transmisión medido y puntos normales de LuGRE con los que comprobar; ninguno está en el repositorio y ninguno se inventa aquí. Ronda { "2" } de { "0.30" }, un hallazgo (sigue siendo MODELLED): una ruta de enlace con entradas medidas (posiciones reales de SP3, potencia de transmisión por bloque, patrones tabulados de transmisión y recepción, histéresis de adquisición y seguimiento) se comprobó frente a Montenbruck et al. { "2023" } Tabla { "3" } para GENESIS a { "6000" } km (preregistrada 5b414f0a): las medias de antena al cenit coinciden en { "5" } de { "6" } dentro de un dB de la sensibilidad del artículo; las medias de antena al nadir son de { "1.0" } a { "2.4" } satélites más altas que las impresas, probablemente porque el artículo usó patrones de lóbulos laterales de GPS dependientes del acimut que no se publican. Las cifras a distancia lunar de esta fila siguen usando el sustituto de Airy. { "0.30" }+ D7, un hallazgo (sigue siendo MODELLED): la magnitud reformulada, la DIFERENCIA de C/N0 entre satélites Block IIR/IIR-M seguidos en una misma época, predicha con los patrones L1 medidos por SVN de NAVCEN (bidimensionales, en el marco de gobierno de guiñada) frente al C/N0 de vuelo de LuGRE (preregistrada 768cb62b: { "99" } % visible, RMS de pares <= { "3.0" } dB, mediana <= { "2.0" } dB, al menos { "50" } registros y { "30" } pares) tiene muy pocos datos: las { "26" } épocas de tránsito y de órbita lunar que reúnen los criterios contienen { "15" } registros IIR/IIR-M seguidos (se siguen sobre todo IIF y III) y un par. Los { "15" } se predicen visibles y el residuo del único par es -0.06 dB; no se afirma nada

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } pruebas de biblioteca: el semiángulo del limbo terrestre frente a su forma cerrada asin(R/r) con una aserción adicional de que TODO enlace no ocultado queda fuera de ese cono, de modo que la prueba de ocultación y el ángulo del limbo no pueden discrepar; el predicado de ocultación comprobado en el lado cercano, el lado lejano y el caso en que el cuerpo queda DETRÁS del transmisor; pérdida de trayecto acotada a la banda plausible de alcance lunar en todo enlace; el conjunto seguible se muestra como subconjunto del conjunto geométricamente visible y disjunto del ocultado; monotonía en ambos sentidos: más ganancia de recepción nunca reduce el recuento, un umbral más estricto nunca lo aumenta; ningún enlace recibe más que la ganancia en el eje de visión; un receptor dentro de la Tierra se rechaza; se afirma que el barrido VARÍA de verdad con la época; y se afirma que la disponibilidad de señal y de solución son distintas, están correctamente ordenadas y son coherentes con las filas por época); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fijado); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (hallazgo fijado)

# text
seg-5242a1ecb1f9 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Un programa independiente de scipy/numpy integra las mismas ecuaciones variacionales (umbral O1). No se compara nada con una medición de una órbita lunar. La referencia independiente comprueba la numérica de las fórmulas indicadas, no la física, por lo que la fila sigue siendo MODELLED. Modelo restringido de tres cuerpos: sin Sol, sin armónicos lunares, con el eje de rotación terrestre a lo largo de la normal de la órbita, con entradas de receptor y de estación ILLUSTRATIVE.

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (umbral O1: la matriz de transición de estado encadenada durante tres días y durante un periodo es igual a scipy DOP853 con un relativo de { "1e-6" }; umbral C1: q medio y la fracción dentro del 95 %; umbral C2: muestra sobre traza formal de cada estimador; umbral C3, NOT MET y fijado: con { "3e-10" } m/s2 de aceleración no modelada, la superación dentro del 95 % es { "0.0525" }, no al menos { "0.5" }: la estimación a bordo solo se conoce con centenares de metros, de modo que unos diez metros de desplazamiento quedan ocultos dentro de su covarianza); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Una resolución independiente en numpy de las mismas ecuaciones normales a partir de las filas exportadas (Q3) y una enumeración entera por fuerza bruta (Q4). No se compara con ninguna medición de fase de portadora de GNSS ni lunar. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (umbral Q1: éxito de Monte Carlo al menos la cota bootstrap menos tres errores estándar; Q2: ninguna caída con la longitud del arco más allá de tres errores estándar; Q4: LAMBDA es igual a la enumeración por fuerza bruta para { "200" } extracciones de dimensión hasta cinco; Q3: el diseño flotante es igual a una resolución independiente en numpy con { "1e-9" } para las covarianzas de ambigüedad y de posición, y la tasa con bootstrap es NOT MET con { "1e-9" }, fijado: difiere en un relativo de { "1.7e-6" } porque la CDF normal de LAMBDA es una aproximación de Abramowitz y Stegun)

# text
seg-ee535014d898 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Una diferencia finita independiente en numpy del modelo directo (F2). No se compara nada con soluciones reales de marco lunar. El factor es condicional a la órbita supuesta conocida y a la sigma de alcance de { "1" } m. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (umbral F1: la traza del CRLB no sube y el menor valor propio no baja con enlaces de orbitador, en el ejemplo y en { "20" } conjuntos aleatorios con semilla; umbral F2: las derivadas parciales de alcance son iguales a una diferencia finita independiente en numpy longdouble del modelo directo de Rodrigues en { "50" } geometrías; umbral F3: el menor valor propio sube al menos 2.0x, se halló unas 111x)

# text
seg-8d70ea5318fa = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Un sistema apilado independiente en numpy con las incógnitas de posición eliminadas mediante complementos de Schur explícitos (T3). No se compara con datos de GRASP, Genesis ni de ninguna otra misión. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (umbral T1: las sigmas de traslación no bajan al aflojarse el enlace local; T2: con las sigmas de técnica escaladas por { "1e-6" }, la sigma de traslación de cada par está dentro del { "1" } % de sqrt({ "2" }) veces la sigma del enlace local, hallada dentro de { "3e-7" }; T3: la matriz de información es igual a un ensamblado apilado independiente en numpy con { "1e-9" }). La primera ejecución de T2 con inversión de ecuaciones normales falló ({ "1.3" } % con un enlace de { "0.1" } m, valores por debajo del suelo con { "1" } m); la causa era numérica y la covarianza pasó a la vía de raíz cuadrada antes de volver a puntuar el umbral.

# text
seg-6c1a6dc96a6a = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Un ensamblado independiente por diferencias finitas en numpy (G2) y una evaluación de forma cerrada (G4). La sensibilidad a k2 de la familia de orbitadores es una cifra del extremo superior (el estado de la órbita absorbe aquí solo una constante y una tendencia). No se compara con ninguna medición de marea ni de libración lunar; k2 se cita de Lemoine et al. { "2014" } como valor nominal. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (umbral G1: las derivadas parciales analíticas son iguales a una diferencia finita centrada de cada modelo directo con { "1e-8" }; G2: la información 5x5 es igual a un ensamblado independiente en numpy con { "1e-6" }; G4: la amplitud de la marea de reloj y sus sensibilidades a k2 y h2 son iguales a una evaluación independiente con { "1e-9" }; umbral G3 NOT MET en su mitad de traza, fijado: añadir una familia nunca baja el menor valor propio ({ "28" } de { "28" }) pero la traza de la pseudoinversa subió en { "12" } de { "28" } adiciones porque la familia añadida elevó el rango)

# text
seg-3ead905e6a5c = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. La aritmética de DOP es el núcleo crate::orbit::dop, validado externamente por separado frente a gnss_lib_py en tests/dop_reference.rs; esta fila no vuelve a tomar prestado el estado de aquella. El horizonte de visibilidad de las balizas es la forma cerrada L01, y sigma = DOP x sigma_URE es la relación estándar de GNSS (Kaplan y Hegarty, Understanding GPS/GNSS, sección { "7" }). Dentro de esta fila, la propia ampliación se comprueba frente a una ruta de DOP independiente dentro del repositorio y se fija a un golden incluido. POR QUÉ MODELLED: el diseño de la constelación, la ubicación de las balizas, las alturas de antena y las tres magnitudes del presupuesto de errores son entradas ilustrativas y no un levantamiento desplegado ni un enlace medido, de modo que los metros indicados son propiedad de un escenario elegido y no de ningún servicio desplegado. NOTA SOBRE LA PROCEDENCIA: esta capacidad se anunciaba en el README y la ejercitaban dos pruebas de validación, y sin embargo NO tenía ninguna fila de la matriz ni ningún tipo de escenario, de modo que no se podía alcanzar desde ninguna ejecución. Se afirmaba en prosa, faltaba en el registro y era inalcanzable en el motor, todo a la vez. La fila y el tipo de escenario se añadieron juntos. Ronda { "2" } de { "0.30" } (preregistrada db0eb9ec), bloqueada (sigue siendo MODELLED): la visibilidad de ANISE { "0.10.6" } y un DOP en numpy sobre la geometría de la fila coinciden (conjuntos visibles exactos, incluidos { "72" } casos cercanos al horizonte y { "48" } cercanos a la máscara; DOP dentro de { "7.2e-13" }), pero los metros indicados son DOP por un error de alcance ilustrativo de { "1.158" } m de raíz de la suma de cuadrados sin referencia independiente; el alcance que los excluiría espera una decisión del responsable

# text
seg-2e097e952eb5 = lunar_beacon::tests (visibilidad de horizonte frente a la forma cerrada L01; el DOP aumentado con balizas frente al desnudo; la raíz de la suma de cuadrados del presupuesto de errores; la relación DOP-a-metros); tests/validate_p2_beacon_before_after_table.rs (toda la tabla de antes y después fijada a un golden incluido con { "1e-9" } relativo); tests/validate_p2_beacon_before_after_independent_dop.rs (la misma geometría por una ruta de DOP INDEPENDIENTE, de modo que la ampliación no se comprueba frente al núcleo que la produjo); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal acota el error de posición horizontal a k sigmas aportado por la clase de modo común ciega, formando blind_position_covariance = S<em>Cov</em>S^T y proyectándola a ENU; integrity_envelope informa hpl_total = hpl_araim + cmpl. La distinción que el par existe para hacer: la prueba de RESIDUO de RAIM/ARAIM es demostrablemente ciega a los errores de range(G), pero el NIVEL DE PROTECCIÓN de ARAIM no lo es: su término sin fallos ya los acota hasta una URA del proveedor más un sesgo nominal. Por tanto, el CMPL es solo el EXCESO entre proveedores que la URA/ISM por proveedor de un único proveedor no sobreacota, y la suma es una cota conservadora por desigualdad triangular y no una RSS, válida solo donde ese exceso no está ya dentro de la URA.

# text
seg-753412b4c8f3 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Álgebra analítica de proyectores comprobada frente a sí misma: una covarianza confinada a range(G) debe dar un CMPL positivo, una covarianza confinada al espacio de paridad debe dar aproximadamente cero, y la envolvente debe sumar dos contribuciones ortogonales en el espacio de mediciones. La covarianza de modo común, la geometría de la constelación y k son entradas modeladas representativas, NO un presupuesto certificado, y no se afirma que la cota triangular sea ajustada. NOTA SOBRE LA PROCEDENCIA: cmpl_horizontal, blind_position_covariance e integrity_envelope son públicas y se distribuyen, y sus pruebas unitarias ya las citaba la fila de ceguera de modo común, pero la AFIRMACIÓN DE LA ENVOLVENTE en sí no tenía fila, de modo que la única salvedad que la mantiene honesta, que la suma es una cota triangular y no una RSS, no se indicaba en ningún lugar del registro. La fila registra la afirmación y la salvedad juntas.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Estructura analítica del defecto de datum: el modo absoluto de marco inobservable está en el espacio nulo de la información de Fisher (forma cerrada), el umbral de rango coincide con la justificación de diseño publicada de 3 estaciones, y el estimador alcanza el CRLB resultante en Monte Carlo. La geometría lunar en sí es una red representativa (no una efeméride volada), por lo que la fila sigue siendo MODELLED; el motor de FIM/CRLB subyacente se comprueba por separado frente a las formas cerradas de Kay ({ "1993" }). Ronda { "2" } de { "0.30" } (preregistrada fab02df9), bloqueada (sigue siendo MODELLED): NumPy/SciPy recalculan el rango y el defecto con el umbral indicado de { "1e-9" }, la parte de los ejes de estación en el espacio nulo (dentro de { "8.4e-10" }) y el CRLB de estación (dentro de { "1.2e-10" }) en { "17" } configuraciones incluidas generadas por Kshana (P2). No ascendida: la afirmación de que el estimador alcanza la cota (eficiencia de Monte Carlo de unos { "0.98" }) no tiene referencia independiente, y el alcance que la dejaría como MODELLED espera una decisión del responsable

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (rango deficiente sin líneas base con la Tierra; tres líneas base restablecen el rango completo: el umbral de 3 estaciones sale del rango de la información, no del error de resolución; CRLB de estación alcanzado por el estimador con eficiencia { "0.98" }; el CRLB se estrecha de forma monótona con las líneas base); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Referencia: los valores que LSIS V1.0 imprime para su validación (Tablas C-1 a C-5, D-1 a D-6, E-1 a E-6) y sus archivos electrónicos de código del Anexo { "3" }, con un criterio de cero discrepancias fijado antes de la comparación. El criterio no se alcanza por una celda impresa que es internamente inconsistente con el propio archivo del Anexo { "3" } de la norma, por lo que la fila sigue siendo MODELLED; hay una nota de fe de erratas en borrador. Los mismos chips también son iguales a los de LANS-AFS-SIM (fila 'LunaNet AFS baseband rendering against an independent generator, given its channel state')

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (índices de IS-GPS-800J)

# text
seg-d111b6550515 = lunar_afs::codes::tests (registros de longitud máxima, equilibrio de Legendre, ida y vuelta del retardo G2, composición de niveles); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (sin la caché de LSIS: cuatro números citados fijan el hallazgo; con ella: { "2 937 232" } chips y bits frente a los archivos del Anexo { "3" } de LSIS, los primeros y últimos { "24" } chips impresos, las Tablas D-1 y E-1 de Legendre y las inicializaciones de G2 dan exactamente un elemento diferente, la celda de 'últimos { "24" } chips' de la Tabla E-5 para el PRN { "147" }, que duplica la del PRN { "151" } mientras que el archivo del Anexo { "3" } coincide con el generador); la prueba estricta preregistrada afs_codes_match_lsis_v1_tables_and_annex3_bit_exact se ignora con esa diferencia

# text
seg-f30130dca525 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. Biblioteca: PocketSDR-AFS (T. Ebinuma a partir del PocketSDR { "0.13" } de T. Takasu, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, compilación de banda S, copia con nivel de registro solo de impresión), con criterios fijados antes de cada ejecución. La tercera comparación preregistrada alcanza por completo sus umbrales de decodificación y seguimiento C1 y C2 pero no su salvaguarda G0 tal como está escrita (dos ejecuciones del receptor sin modificar difieren en los mismos cuatro registros de adquisición), y la segunda falló por { "5" } violaciones, por lo que la fila sigue siendo MODELLED. LANS-AFS-SIM y PocketSDR-AFS comparten autor y cuentan como una sola implementación independiente; las comprobaciones con vectores impresos de la fila de codificación de tramas protegen frente a una lectura errónea compartida

# text
seg-8cd700abad59 = lunar_afs::waveform (grabación y etiquetas de verdad de referencia), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (tercer preregistro: { "2" } nodos, { "4" } canales seguidos, peor error de Doppler { "0.57" } Hz, peor error de desfase de código { "0.008" } chip, las { "6" } tramas decodificadas con el TOI correcto a través del salto { "99" } -> { "0" } y con la subtrama { "2" } coincidente; G0 no se alcanza tal como está escrita, la propia variación de ejecución a ejecución del receptor en sus registros de adquisición); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (segunda: { "5" } violaciones); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (primera: nula); las pruebas estrictas de los tres archivos se ignoran con sus diferencias

# text
seg-2f05d26e8be6 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. gps-sdr-sim (MIT, commit 28ca29a6, ejecutado como programa aparte mediante un arnés incluido), preregistrado f88f2969 con un umbral exacto bit a bit sobre (A) los chips C/A, (B) todo campo LNAV calculado, (C) todo bit de paridad. FINDING: (A) { "0" } de { "32 736" } chips difieren, (C) la paridad de { "0" } de { "1 920" } palabras difiere, (B) { "230" } de { "1 152" } campos calculados difieren en una unidad: eph2sbf de gps-sdr-sim trunca hacia cero con conversiones de C donde el entero difundido necesita redondeo (todo valor diferente está a { "0.01" } de una unidad del entero redondeado de Kshana). Sigue siendo MODELLED: el umbral registrado era la conjunción

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (hallazgo fijado); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (estricta, ignorada con la diferencia); gps_lnav::tests

# text
seg-d61a6fd7896c = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. gps-sdr-sim (MIT, commit 28ca29a6) muestras I/Q y su propio estado de canal, preregistrado 7777da53: (B1) todo PRN simulado adquirido, (B2) ningún otro PRN adquirido, (B3) fase de código dentro de { "0.5" } chip, (B4) Doppler dentro de { "125" } Hz. FINDING: B1, B3 y B4 se mantienen en ambas ventanas (peor { "0.195" } chip, { "72" } Hz), pero B2 falla: los { "21" } PRN que gps-sdr-sim no simuló también cruzan el umbral (estadístico de { "151" } a { "206" } frente a { "79.5" }; PRN simulados { "1 300" } y superiores). El umbral se fija para ruido gaussiano de la potencia de muestra medida; gps-sdr-sim no añade ruido, así que las celdas de un PRN ausente contienen la correlación cruzada de los otros satélites. Sigue siendo MODELLED: el umbral registrado era la conjunción

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (hallazgo fijado); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (estricta, ignorada con la diferencia)

# text
seg-9f9b58158cde = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Las propias formas cerradas de los monitores sobre las escenas GPS L1 C/A de la propia Kshana (ruido y señales legítimas; eventos de atenuación de las propias señales de los satélites), frente a umbrales preregistrados en docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). FINDING: M1, M2 y M4 alcanzados. M3 alcanzado en detección ({ "18" } de { "18" } atenuaciones, P_md { "0" }) y NOT MET en su cláusula de tiempo: la mediana del tiempo hasta detectar es { "1.001" } s frente a { "2" } x ARL1 muestras = { "0.433" } s. El CUSUM ve una estimación por ventana de { "1" } s, de modo que la cota en número de muestras es inferior a una muestra. Solo consistencia interna: no se comprueba ningún receptor real ni interferencia registrada

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } de { "5900" } bloques frente al intervalo binomial del { "99" } % [{ "40" }, { "80" }] de P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, razón { "0.0131" } frente a { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } frente a { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (estricta, ignorada con la diferencia); pruebas de iq::campaign::detect; pruebas de iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (los resúmenes fijados no cambian sin la tabla)

# text
seg-491de717dd05 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Campañas sintéticas a partir de las escenas GPS L1 C/A de la propia Kshana (atenuaciones de las propias señales de los satélites), frente a umbrales preregistrados en docs/design/DETECTION-ROC.md (b47e358d). FINDING: R2 alcanzado (nivel de azar sin nada que detectar). R1 NOT MET: AUC de cn0_drop { "0.7855" } frente a { "0.95" }, porque toda ventana negativa posterior a un evento hereda el decaimiento del CUSUM desde la detección (los { "18" } negativos posteriores al evento llegan a { "81" } o más; los { "18" } anteriores al evento se quedan en { "0" }). Solo consistencia interna: no se comprueba ningún receptor real ni interferencia registrada

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } en eventos indicados que no atenúan nada); r1_the_cn0_drop_roc_separates_6_db_attenuations (estricta, ignorada con la diferencia); pruebas de iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Recuperación sintética de parámetros sobre las escenas GPS L1 C/A de la propia Kshana con un perfil de C/N0 conocido impuesto a partir de la fórmula de la sección { "3.1" }, seguido y puntuado por kshana iq campaign, frente a umbrales preregistrados en docs/design/LABFIT-FROM-IQ.md (sección { "5.1" }, enmendada el 2026-10-12 en b7117bf, sección { "13" }). El estimador de C/N0 de las campañas (M2M4) se fijó en 5b13e3c2, subido antes de la primera evaluación de umbrales (confirmado junto con el código de ajuste, no solo), tras una ejecución de seguimiento de diagnóstico declarada. FINDING en la campaña de umbrales de 18 eventos: (c) PASS; (a') NOT MET, error de delta_eff -1.097 dB frente a { "0.5" } dB (aún -0.89 dB en los intervalos de { "38" } dB-Hz y superiores); (b') NOT MET, { "0" } de { "50" } campañas cubren la verdad de referencia (error -1.189 +/- { "0.093" } dB, intervalo de unos { "0.3" } dB); (d) NOT MET, la forma cerrada { "2.20" } dB por debajo de la J/S directa en la pérdida, en torno al descenso ajustado por los tiempos de permanencia por la tasa de rampa ({ "2.09" } dB); las cláusulas originales de Q de (a) y (b) son NOT MET porque Q no es identificable. SEGUIMIENTO (umbrales preregistrados en 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): en una campaña de J/S escalonada, delta_eff se recupera dentro de +{ "0.185" } dB (S1 MET: el error de rampa es retardo del estimador); (d) tal como está escrita sobre ella se alcanza con el modelo del lazo de seguimiento ({ "0.45" } dB) pero no con el empírico ({ "6.42" } dB), de modo que S2 es NOT MET; en una campaña de rampa nueva, (d) con el descenso ajustado por los tiempos de permanencia más la tasa de rampa de cada evento queda dentro de { "1" } dB para ambos modelos (R1 MET), y (a') y (d) tal como están escritas vuelven a fallar (-1.25 dB; { "2.32" } y { "9.47" } dB). Se comprueba el método, no ningún receptor: no puede ser VALIDATED con datos sintéticos

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (cobertura de PI90 { "0.891" } sobre { "558" } intervalos, { "0.900" } sobre { "10" } eventos de tiempo hasta la pérdida con cada modelo de enganche), the_report_carries_its_inputs_censoring_validation_and_labels (entradas, censura, hash y veredictos de [validation], auditoría del bloque de unidades), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db y bar_b_prime_ci_subset (estrictas, ignoradas con la diferencia); bar_b_prime_full_set_of_50_campaigns (ignorada, se ejecuta antes de la publicación); pruebas de iq::labfit::cn0 (degeneración exacta de Q-delta, recuperación de delta con la Q indicada, inversa del umbral de forma cerrada); pruebas de iq::labfit::iqfit (las condiciones del modelo de enganche reproducen exactamente el modelo de C/N0); tests/iq_labfit_followup.rs (el seguimiento registrado en 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign que afirma el NOT MET registrado, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, en release)

# text
seg-52d2a721c38a = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame como programa aparte, preregistrado ca5f0142: R1 paridad y decodificación, R2 valor decodificado igual al entero de Kshana por la escala de IS-GPS-200 dentro de { "2" }^-52 relativo, R3 dentro de medio cuanto de la entrada. FINDING: R1 { "960" } de { "960" } palabras y { "96" } de { "96" } subtramas; R3 todos los parámetros, la semana y los tiempos de referencia exactos; R2 falla en { "41" } valores (af1, delta-n, IDOT) por { "1" } a { "4" } unidades en el último lugar porque P2_43 de RTKLIB es el decimal { "1.136868377216160E-13" }, { "2.6e-16" } relativo respecto de { "2" }^-43; dividir por la constante de RTKLIB devuelve el entero de Kshana en todos los casos. Sigue siendo MODELLED: el umbral R2 registrado era demasiado estricto para la propia constante de la referencia independiente

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (hallazgo fijado); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (estricta, ignorada con la diferencia)

# text
seg-d0d7bf57aa68 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx analizando el archivo diario de difusión de IGS BRDC00IGS_R_20250610000_01D_MN.rnx y decode_word/decode_frame decodificando las palabras de Kshana, ejecutado como programa aparte; preregistrado d4d9eb9d antes de obtener el archivo, umbral de enteros exactos. Mutación: truncar en lugar de redondear da { "235" } fallos. Las comparaciones anteriores del mismo codificador se registran como hallazgos: frente a gps-sdr-sim, que trunca ({ "230" } campos), y frente a los valores escalados de RTKLIB, cuya constante decimal { "2" }^-43 no alcanzó un umbral de un ulp ({ "41" } valores). Poscomprobación del integrador (sigue siendo MODELLED): la comparación coincide y una mutación del conjunto de paridad también la pone en rojo, pero el preregistro d4d9eb9d llegó a la rama pública a las { "20" }:{ "02" }:{ "29" } UTC, dos segundos después del commit de resultados 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) que ya contiene la salida de RTKLIB para el archivo, de modo que no puede demostrarse el orden 'registrado antes de obtener el archivo'; un registro nuevo subido antes de obtener un archivo de difusión no visto lo zanjaría

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satélites del archivo de difusión de IGS del { "2" } de marzo de { "2025" }: { "960" } de { "960" } palabras pasan la paridad de RTKLIB, { "96" } de { "96" } subtramas se decodifican, { "608" } de { "608" } enteros difundidos decodificados son iguales a los de Kshana, toda entrada dentro de medio cuanto, semana y tiempos exactos); gps_lnav::tests

# text
seg-407f33fff57c = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. GNSS-SDR { "0.0.19" } (GPL-3.0, programa aparte, configuración fijada) sobre los nueve lotes de L1 que no son de superficie y el C/N0 RAW del receptor de vuelo (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), preregistrado 768cb62b. FINDING: el lector de Kshana decodifica los { "288" } tramos comparados de forma idéntica a un conversor independiente; GNSS-SDR declara positivas { "266" } de { "288" } búsquedas y Kshana coincide en las { "266" } decisiones, pero solo { "250" } se localizan en la celda de GNSS-SDR (A2 falla); el tramo de C/N0 es vacuo, ninguna época RAW de vuelo está a menos de { "30" } s de ningún lote (la más cercana, { "141" } s). La mayoría de los positivos son artefactos: los niveles desnudos en complemento a dos llevan una media de -0.5 en I y Q, una línea de frecuencia cero { "32" } dB por encima del ruido en un intervalo de { "1" } kHz, que ambos receptores adquieren. Dos lotes (OP5, OP12) se excluyeron por error: una lectura sin dígitos de sus metadatos se tomó por una contradicción con sus cabeceras; la causa real era que el lector no podía leer una muestra más ancha que una palabra (corregido desde entonces). Sigue siendo MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (estricta, ignorada con la diferencia); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-90535435d10d = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Doppler previsto a partir de órbitas finales de ESA/ESOC y de la trayectoria reconstruida de NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independiente de Kshana), preregistrado 0d1839d2. FINDING: las { "288" } búsquedas cruzan el umbral con ruido (estadísticos de potencia de muestra de unos { "430" } a { "520" } frente a { "346.3" }), de modo que P1 se mantiene de forma trivial y P3 se mantiene ({ "274" } de { "288" } previstos visibles) mientras que P2 falla en { "4033" } de { "4036" } pares. El front-end de banda limitada eleva el ruido de cada celda unas { "1.46" } veces (fijado: suelo de ruido { "292" } frente a los { "200" } de ruido blanco en OP2 PRN { "1" }), cosa que el estadístico de potencia de muestra no ve. Sigue siendo MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (estricta, ignorada con la diferencia)

# text
seg-46dbb16e2ba8 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Doppler previsto a partir de órbitas finales de ESA/ESOC y de la trayectoria reconstruida de NAIF CLPS (xval/lugre-predicted-doppler/predict.py, independiente de Kshana), preregistrado a81a9a4e. FINDING: P1 y P3 se mantienen ({ "4" } lotes, { "12" } de { "12" } adquisiciones previstas visibles) pero P2 falla en { "8" } de { "8" } pares. Los dos pares más fuertes coinciden con la predicción en magnitud con el signo invertido (OP2 PRN 18/24: +{ "7670.0" } Hz medidos, -7693.9 previstos; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), de modo que el orden I-en-el-nibble-bajo registrado es el conjugado del de los lotes; las seis detecciones apenas por encima del umbral no coinciden con ningún signo. La dispersión Doppler del refinamiento ({ "30" } a { "50" } Hz entre dos ejecuciones) también fue subestimada por el registro. Sigue siendo MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (hallazgo fijado, condicionado a datos); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (estricta, ignorada con la diferencia)

# text
seg-e10ffc7f4280 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Doppler previsto a partir de órbitas finales de ESA/ESOC y del kernel del lugar de aterrizaje de NAIF CLPS Firefly (xval/lugre-predicted-doppler/predict_surface.py, independiente de Kshana), preregistrado 2108e6ff sobre lotes nunca abiertos antes. FINDING: la no vacuidad falla; ningún lote contiene dos adquisiciones. OP40 excluido (los metadatos nombran un archivo ausente); OP38, OP73, OP77_0 y OP77_1 no adquieren nada y no muestran falsa alarma con { "1e-7" } (estadísticos máximos de { "325" } a { "356" } frente a { "385.9" }); OP74 y OP76 adquieren el PRN { "31" } y OP78_0 y OP78_1 el PRN { "12" }, cada uno solo, todos previstos visibles. Sigue siendo MODELLED. Desviaciones declaradas: el umbral Doppler registrado de { "10" } Hz se apoya en un Monte Carlo sintético del refinamiento coherente, no en la dispersión de los lotes ya vistos que pidió el integrador; OP40 se excluyó antes de la ejecución porque sus metadatos nombran un archivo de muestras que el conjunto de datos no incluye

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (hallazgo fijado, condicionado a datos); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (estricta, ignorada con la diferencia)

# text
seg-9b89d7ff555a = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Identidad diferencial de cancelación de errores + reutilización de la maquinaria de PL de SBAS de DO-229E; la diferencia simple + la resolución por WLS se contrastan además con lsq()/matinv() de RTKLIB (Takasu, BSD-2-Clause, C compilado): código de resolutor independiente, pero con el mismo álgebra de diferencias de LOS de primer orden, de modo que sigue siendo InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (el modo común del reloj se cancela exactamente; el residuo crece con la línea base; reutiliza el PL de SBAS; el número de satélites se respeta hasta el límite del constructor de { "24" }, de modo que una constelación mayor no puede devolver en silencio una menor); tests/lunar_differential_pnt_reference.rs (residuo de diferencia simple + resolución de posición por WLS frente a lsq() de RTKLIB compilado a partir del código fuente en C)

# text
# c1: oem
seg-4d32db579be8 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. La exportación OEM lunar de kshana releída con la biblioteca independiente de terceros <c1/> (R. J. Anderson): los tokens de marco y de tiempo y el estado por época coinciden con la precisión de escritura ({ "1" } mm / { "1e-9" } km/s) y se rechaza una exportación sin TIME_SYSTEM: una ida y vuelta estructural de intercambio; la semántica física de marco y tiempo lunares está validada por sus propias filas, por lo que esto sigue siendo MODELLED. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): un segundo lector independiente, el analizador OEM de CCSDS de Orekit { "12.2" } (Apache-2.0, valores por defecto estrictos), rechaza los dos archivos lunares porque no implementa los sistemas de tiempo LTC y TCL (decodifica el OEM EME2000/UTC del crate, y decodifica los archivos lunares una vez que TIME_SYSTEM se sustituye por TDB); oem { "0.4.5" } los decodifica con la precisión escrita solo recurriendo a un sistema de tiempo no admitido. No está establecido el intercambio de estos archivos lunares con lectores CCSDS habituales

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (el OEM lleva REF_FRAME/TIME_SYSTEM lunares; los metadatos de tiempo hacen ida y vuelta; envoltura KIF); tests/lunar_interoperability_export_reference.rs (el OEM lunar emitido por kshana releído con la biblioteca independiente de Python <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + estado por época con la precisión del formato; una exportación corrompida se rechaza); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Fórmulas por métrica derivadas a mano: diversidad de Simpson inversa, compuesto de media ponderada, duraciones de línea de tiempo acotadas/no acotadas, escalera de niveles por eslabón más débil

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotonía, cotas del compuesto, tope de nivel, procedencia modelada); resilience::diversity::tests (Simpson inversa, modo común, SPOF)

# text
seg-173a6b137751 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Identidades de estadísticos de rango de forma cerrada (tau en [-1,{ "1" }] con valores calculados a mano; Dirichlet determinista con semilla) y testigos estables/inestables construidos

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (ejemplo a mano de tau de Kendall, símplex de Dirichlet, tasa de inversión); resilience::study::tests (control de estabilidad, testigo de inestabilidad, declarado frente a medido, colapso de la diversidad)

# text
seg-6ee8465d60c7 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Invariantes de forma cerrada que se corresponden con la disciplina de compliance de 'representatividad justificada + brechas hacia el vuelo identificadas'; ligada a la frontera entre el estado de verificación y el tipo de referencia independiente

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, campos JSON)

# text
seg-177c7c6f506a = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Identidades de beneficio/ganador de forma cerrada + envoltura fiel del quantum_trade::TradeResult existente; honestidad ligada al registro de representatividad y a las etiquetas de verificación

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (polaridad del beneficio, mayor/menor es mejor; envuelve fielmente un TradeResult real; evidencia deshonesta rechazada; una FoM validada necesita ancla externa; JSON determinista)

# text
seg-05e779241ded = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Coeficientes de reloj/CAI reutilizados (holdover/clock_state, valores publicados) + identidades de forma cerrada de ruido de disparo y pérdidas para el enlace de entrelazamiento

# text
seg-fe77856b9e9d = quantum_devices::tests (tarjetas de reloj honestas y ordenadas; precisión del entrelazamiento ~1/sqrt(tau); tasa detectada -10x/10dB; las cuentas oscuras degradan; cotas del suelo sistemático; tarjeta modelada y válida)

# text
seg-06a01a48fcad = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Presupuesto en cuadratura de forma cerrada sobre núcleos validados reutilizados (ADEV frente a Stable32/NIST; cota TPL; detección analytic_pd/pmd); honestidad ligada al registro de representatividad

# text
seg-65f4bc801f94 = timetransfer_chain::tests (la precisión mejora con la integración; lo cuántico puede ganar Y perder; PL finito y positivo; FoM de seguridad en [{ "0,1" }] y crece con el retardo del ataque; Pd de anomalía monótona; el estudio comparativo is_honest)

# text
seg-6ccf2bd93426 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Presupuestos inerciales reutilizados contrastados con una doble integración independiente en Octave de la misma EDO de navegación a estima (distinto entorno de ejecución, modelo compartido → ReferenceImpl) más el ruido de corto plazo publicado de Freier-2016 como ancla unilateral; el compuesto cuántico frente a clásico sigue siendo MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (lo cuántico supera a lo clásico en una interrupción larga; la ventaja depende de la interrupción; el estudio comparativo is_honest); tests/gnss_free_quantum_navigation_reference.rs (crecimiento de la posición a estima frente a una doble integración independiente en Octave + el ancla de ruido publicado de Freier-2016)

# text
seg-a06ba11bd079 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. AUC gaussiana de forma cerrada = Phi(mu/(sigma*sqrt2)) contrastada con eval_stats::bootstrap_auc_ci validado externamente (frente a scikit-learn) + umbrales analíticos de detección

# text
seg-8e49ee940482 = quantum_faults::tests (valores conocidos de AUC analítica; la AUC bootstrap empírica acota la forma cerrada; lo cuántico detecta fallos menores / mayor AUC; la ventaja desaparece para fallos enormes; catálogo de 5 clases; el estudio comparativo is_honest)

# text
seg-c38a05cc3fdb = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Autoconsistencia del estimador y de la geometría: ida y vuelta directa→inversa, la identidad de Fisher/CRLB J·CRLB=I, la monotonía de GDOP y el estimador que alcanza su propia cota de Cramér–Rao con ruido de Monte Carlo; son comprobaciones de consistencia interna, NO un conjunto de datos externo, por lo que la fila sigue siendo InternalConsistency. Geolocalización pasiva MODELLED: modelo de línea de visión de fuente puntual; sin términos de multitrayecto / NLOS, sesgo de reloj del receptor ni refracción atmosférica. Ronda { "2" } de { "0.30" }, frente a Ho y Chan { "1993" } y Ho y Xu { "2004" } (preregistrada f89018b8, { "1" } % de cada valor impreso), un hallazgo (sigue siendo MODELLED): la cota de TDOA restringida a la superficie reproduce los factores geométricos de { "40" } N (-0.11 %, -0.02 %) y la TDOA máxima; la cota conjunta de TDOA+FDOA reproduce la Fig. { "6" } (+{ "0.06" } %, -0.17 %) y, en la fuente que el propio código de los autores nombra para la Fig. { "7" } (enmienda escrita después de ver ese resultado, declarada), la Fig. { "7" } (+{ "0.11" } %, -0.02 %); es igual al código publicado de la cota de los autores (estilo BSD, ejecutado con GNU Octave) con { "3e-12" }; el resolutor de máxima verosimilitud ponderado por covarianza alcanza la cota impresa (+{ "0.3" } a +{ "0.4" } %). Los factores de Ottawa que el artículo imprime a partir de un Monte Carlo ({ "251" }, { "7.1" }) difieren en +{ "1.3" } % y +{ "4.4" } %, fuera del umbral del { "1" } %

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (TDOA sin ruido directa→inversa hasta { "1e-6" } m; J·CRLB=I con una covarianza simétrica definida positiva; la traza de la varianza de posición del CRLB no aumenta cuando se añade un receptor; TDOA+FDOA conjuntas recuperan la posición+velocidad de un emisor en movimiento; se rechazan <{ "4" } receptores); tests/geolocation_reference.rs (ida y vuelta sobre cuatro geometrías con una red diversa en 3-D; el estimador de Gauss–Newton alcanza su cota de Cramér–Rao: la covarianza empírica del error sigue la cota analítica en { "4000" } ensayos de Monte Carlo); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound y finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, fijados)

# text
seg-8ac63d14e24b = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la relación y las constantes tal como se imprimen en NASA TR R-376, una comprobación de convergencia por medio paso y el orden esperado de los máximos de calentamiento y deceleración. LO QUE NO SE CUBRE: no se ha comparado ningún valor de calentamiento publicado (los artículos de Stardust dan un límite de diseño y una estimación convectiva más radiativa de unos { "1200" } W/cm2, que una relación solo convectiva no puede igualar); ni calentamiento radiativo, ni corrección por temperatura de pared o catalicidad, ni respuesta de la protección térmica.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registra { "746" } W/cm2 para Stardust sin umbral)

# text
seg-1f6aec0085c2 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Formas cerradas: la MTF de difracción a la mitad del corte, el borde en rampa de un píxel de una apertura de detector pura (RER { "1" }), el borde de CDF normal de un desenfoque gaussiano (RER = erf(0.5/(sigma sqrt { "2" }))), el escalado del ruido de disparo y los coeficientes de GIQE { "4" } tal como se publican (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). LO QUE NO SE CUBRE: no se ha comparado ningún generador de imágenes externo, MTF medida ni imagen calificada; GIQE es una regresión empírica con su propio error; ni luz parásita, ni MTF atmosférica, ni compensación de MTF ni aliasing.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: la identidad exacta velocidad de agotamiento = suma Isp g0 ln(m0/mf) menos las cuatro pérdidas integradas (residuo por debajo de { "1e-6" } m/s), la ecuación de Tsiolkovski en una combustión vertical en vacío con la gravedad como única pérdida, y las presiones de US76 al nivel del mar y en la tropopausa. LO QUE NO SE CUBRE: no se han comparado las pérdidas de ningún vehículo publicado; ni rotación terrestre, ni deriva, ni regulación de empuje, ni guiado más allá del giro inicial; C_D constante; no es un optimizador de trayectoria.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: el modelo directo y la ecuación resuelta coinciden hasta { "1e-15" } s, el término de Sagnac es igual a la forma de lazo independiente de BIPM 2A omega/c^{ "2" } del módulo, el término ionosférico es { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, y los procesos de ruido muestran las formas de TDEV esperadas. LO QUE NO SE CUBRE: no se ha comparado ninguna medición real de TWSTFT ni informe de calibración; los retardos y las incertidumbres indicados son entradas, no medidos; las estabilidades de las series suministradas se informan, no se validan.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (la ecuación bidireccional recupera exactamente el desfase; el término de Sagnac es igual a la forma cerrada del lazo de BIPM; el término ionosférico sigue la división de frecuencias y la troposfera se cancela; la fase flicker tiene una TDEV plana; un residuo diurno eleva la TDEV hacia medio día; un sesgo de reciprocidad desplaza el desfase y no la TDEV; la estabilidad de series elimina una tasa); time_transfer_budget::tests

# text
seg-4ca4b46b128c = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. La numérica se compara con un programa independiente (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } con { "30" } dígitos, cuadratura tanh-sinh sobre la variable original de altura y densidades gamma-gamma de Bessel-K) que no comparte código con Kshana, con umbrales fijados antes de que existiera cualquier implementación (xval/optical-atmosphere/PREREGISTRATION.md). POR QUÉ MODELLED: esa referencia independiente evalúa las mismas fórmulas publicadas, de modo que comprueba la implementación de las fórmulas indicadas y no la atmósfera; no se usa ningún ejemplo de validación de ITU-R ni ningún registro medido de centelleo o de extinción en trayecto oblicuo (los valores de ITU son una decisión de licencia pendiente y se mantienen fuera del repositorio). El nivel del perfil de Cn2, la visibilidad, las alturas de escala de aerosoles y moléculas, la longitud de trayecto del promediado de apertura y el ajuste de momentos usado para aplicar el promediado de apertura a los parámetros gamma-gamma son entradas o convenciones indicadas. Una línea de fuente del módulo registra que una revisión muy copiada imprime el segundo exponente de centelleo como 7/6 donde Andrews y Phillips dan 5/6; se implementa la forma 5/6

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (umbrales preregistrados A1-A3 frente a la referencia independiente mpmath: { "216" } puntos de la rejilla de Rytov con peor error relativo { "3.4e-7" } frente a un umbral de { "1e-6" }, centelleo peor { "4.5e-16" }, factor de apertura peor { "5.7e-16" }, { "96" } probabilidades de desvanecimiento gamma-gamma con peor { "1.3e-12" } en log10, profundidad óptica de nubes y de aire despejado peor { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (umbral A5: el presupuesto de enlace con pérdidas agrupadas y las salidas existentes de disponibilidad de emplazamiento son idénticos bit a bit al commit base sobre { "1,000" } conjuntos de parámetros)

# text
seg-6cf381ac2e3d = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: límites de forma cerrada y monotonía del modelo de diversidad, la forma cerrada del techo de nubes y las identidades de interrupción lognormal. NO se afirma ninguna referencia independiente externa y no se ha comparado ninguna: no se usa ningún registro medido de disponibilidad de estaciones terrestres ópticas ni de línea de visión sin nubes. POR QUÉ MODELLED: el clima de nubes (probabilidad de nube, mediana y dispersión de la columna de agua líquida, duraciones de interrupción), la independencia entre nubes y turbulencia, la forma de cópula gaussiana, la longitud de decorrelación y toda ganancia de técnica son supuestos; los escenarios incluidos indican climas ILLUSTRATIVE, no un conjunto de datos. Ascender esta fila exige un registro medido de disponibilidad citado y un umbral registrado antes de la comparación

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (umbral A4: rho = { "0" } es igual a la unión independiente y rho = { "1" } al mejor emplazamiento individual hasta { "1e-12" }, y cero violaciones de monotonía en el número de emplazamientos y en la correlación; la primera ejecución de este umbral falló por { "3e-9" } porque la CDF normal en uso era la forma de Abramowitz-Stegun de { "1.5e-7" }, un defecto de implementación sustituido por la CDF de gamma incompleta con el umbral sin cambios); optical_weather::tests y optical_sitediv::tests (margen monótono, el techo de nubes como forma cerrada, las identidades de duración de interrupción, inversión de la búsqueda del margen)

# text
seg-1d817d8409d3 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna con el módulo de holdover, bit a bit; NO se afirma ninguna referencia independiente externa. Las PSD de clase son los suelos sintetizados de tau largo que el módulo de holdover ya incluye, de modo que las cifras heredan su salvedad indicada de que el holdover hasta un umbral estricto lo gobierna el suelo de ruido rojo supuesto y no la desviación de Allan citada. Las duraciones de interrupción son un modelo lognormal con parámetros indicados, no un registro medido de permanencia de nubes

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (umbral A6: el error de temporización por interrupción es igual a holdover::coast_phase_sigma y el error de alcance es igual a phase_to_range_m bit a bit sobre { "9" } relojes, { "3" } duraciones medias, { "3" } dispersiones y { "4" } cuantiles); optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Solo consistencia interna; NO se afirma ninguna referencia independiente externa y no existe ninguna para una realización meteorológica. Las comprobaciones comparan una extracción con la salida estadística del mismo modelo, de modo que superarlas indica que el generador muestrea las distribuciones indicadas (la disponibilidad y la proporción de nubes de la extracción están dentro de tolerancias preregistradas de las cifras indicadas), no que ningún emplazamiento real se comporte así. La serie es una realización, no el clima: su disponibilidad difiere de la indicada por el error de muestreo de la extracción, y las muestras de centelleo en pasos distintos son independientes, una simplificación indicada de un proceso que se decorrela en milisegundos. Las entradas meteorológicas siguen siendo los supuestos del escenario.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (umbrales T1-T6 de xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fijados antes de la primera ejecución: misma semilla, mismos bytes, y otra semilla, otros bytes; sin clave sin la tabla; en { "8760" } h a { "600" } s, semillas { "37" } y { "38" }, la disponibilidad realizada de cada uno de los tres emplazamientos por defecto dentro de { "6" } puntos de la indicada (peor { "3.3" }) y la fracción de nubes realizada dentro de { "5" } puntos de la probabilidad indicada (peor { "2.1" }); el margen es igual al presupuesto menos los dos desvanecimientos y «up» es igual a margen no negativo en cada paso; ninguna llamada matemática no portable en el módulo; las ejecuciones demasiado largas y los pasos erróneos se rechazan)

# text
seg-4dfa142a94c4 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada. La etiqueta PDS3 que el proceso de acondicionamiento de datos de navegación de la DSN produjo con el archivo (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), comprobada frente a umbrales preregistrados en xval/mro-odf/PREREGISTRATION.md antes de que existiera el lector. MODELLED porque un umbral registrado (las filas de la tabla de fin de archivo, { "121" } en el archivo frente a { "120" } en la etiqueta) no se alcanzó; la etiqueta es internamente inconsistente ahí. Etapa { "2" } (xval/mro-od/PREREGISTRATION.md, enmiendas A1 y A2 antes del resultado puntuado): el Doppler previsto a partir de la reconstrucción del equipo de navegación de MRO (mro_psp5, NAIF) coincide con el Doppler de 2 vías con rampa observado hasta { "12.5" } mHz en pasadas no usadas en el desarrollo, umbral alcanzado; la determinación de órbita registrada falló en el arco puntuado (la matriz normal no es definida positiva) y no produjo ninguna órbita, de modo que los umbrales de órbita no se alcanzaron. La ejecución { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, un estimador amortiguado, el mismo arco y los mismos umbrales, una enmienda de puntuación R2-A1 declarada en docs/revisions) convergió: la órbita estimada está a { "0.36" } km RMS ({ "0.53" } km máximo) de la reconstrucción, umbrales alcanzados, pero el RMS del Doppler posajuste es { "48.6" } mHz frente al umbral de { "30" } mHz, no alcanzado, de modo que la fila sigue siendo MODELLED. LO QUE NO SE CUBRE: ninguna órbita estimada ha alcanzado todos los umbrales registrados; no se modelan la ionosfera, el plasma solar ni la mayor parte del desfase de antena (se ajusta un desfase radial de { "1.5" } m en la pasada de desarrollo).

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (un ODF real de MRO, 2007-304/305, frente a su etiqueta PDS: el recuento de registros, las posiciones de grupo, las estaciones, las horas de inicio y fin y los tipos de datos se mantienen; el recuento de filas de la tabla de fin de archivo falla por uno, una inconsistencia de la etiqueta, fijada como hallazgo); odf::tests (ida y vuelta de un registro construido a mano, época { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (condicionado a datos, SHA-256 de entradas fijado, CI mensual con datos reales obligatorio: Doppler previsto a partir de la reconstrucción de navegación de MRO mro_psp5 en las pasadas puntuadas de DSS { "63" } y DSS { "14" }, { "12.5" } mHz RMS, umbral { "30" } mHz, alcanzado; la determinación de órbita registrada no produjo ninguna órbita, fijado como hallazgo; ejecución { "2" } con un estimador amortiguado, registrada por separado: órbita { "0.36" } km RMS y { "0.53" } km máximo frente a mro_psp5, alcanzado, Doppler posajuste { "48.6" } mHz frente a { "30" } mHz, no alcanzado, fijado como hallazgo; lector de SPK tipo { "1" } frente a CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-8566593647ee = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna: el error de estimación normalizado al cuadrado del filtro frente a una verdad de referencia simulada a partir de los mismos modelos de sensor sobre semillas de Monte Carlo, y la convergencia de las estimaciones de actitud y de sesgo. LO QUE NO SE CUBRE: no se ha comparado ningún estimador externo ni datos de vuelo (Basilisk { "2.9.1" } no tiene módulo MEKF); los modelos de sensor son los de manual, sin desalineación, factor de escala ni efectos del campo de visión del seguidor estelar.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } semillas, NEES medio de seis grados de libertad en la segunda mitad dentro de { "4.5" } a { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = comprobada frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa. Consistencia interna, a partir de tres magnitudes calculadas con expresiones distintas en el mismo barrido y que luego deben cuadrar. Los segundos de apertura de navegación, los segundos de apertura de comunicaciones y los segundos de apertura ociosos se acumulan por separado (los ociosos a partir de (aperturas − |servidos|) por intervalo elemental, nunca como resto) y su suma se afirma frente a aperturas × horizon_s, lo que rompe de inmediato un límite mal acotado, un intervalo contado dos veces o uno omitido; los tiempos servidos por sesión deben sumar de nuevo, por separado, los dos totales de servicio. Las propiedades estructurales del planificador se miden en lugar de suponerse: se afirma que el tiempo servido no decrece con el número de aperturas en { "200" } planes pseudoaleatorios para las tres políticas (no es obvio para la política sin expropiación, donde una apertura adicional cambia quién tiene qué en cada límite posterior), y la aritmética de límites se fija en el par de contacto/solapamiento de un segundo donde un error de uno de otro modo pasaría inadvertido. El puente con el predictor de pases se comprueba frente a la salida de <c1/>: con una apertura y ningún servicio en competencia, los segundos de apertura de navegación son iguales a la suma de las duraciones de pase del propio predictor. No se afirma ninguna referencia independiente externa y no existe ninguna: la capacidad sustituye a la aritmética a mano en lugar de comprobarse frente a ella, el plan de contactos incluido es ilustrativo y no volado, y ningún planificador operativo publica un par plan-más-respuesta con su regla de arbitraje indicada: un ciclo de trabajo calculado con una política no indicada no es comparable con uno calculado con una indicada, y la dependencia de la política se mide (ciclos de trabajo de navegación de 100/150 frente a 50/150 sobre el plan idéntico). El tiempo de reorientación y de cambio, el volumen de datos, el estado de los búferes, la energía y el cierre del enlace quedan excluidos en la etiqueta del informe en lugar de modelarse en silencio

# text
seg-4da98593fe6a = aperture_duty::tests (una ventana que termina exactamente cuando empieza la siguiente no compite, y adelantarla un segundo cuesta exactamente un segundo: la protección contra el error de uno; las ventanas solapadas más allá del número de aperturas dejan en interrupción a la sesión de menor rango, con el intervalo de contienda fijado; la política de arbitraje decide qué servicio ocupa la apertura, con las cifras de las tres políticas fijadas en un mismo plan; el primero en llegar es el primero en ser atendido no expropia una sesión que ya tiene una apertura; una sesión que pierde el arbitraje al comenzar adquiere una apertura cuando una queda libre; los tres ciclos de trabajo dan cuenta de cada segundo de apertura disponible en { "3" } políticas × { "4" } números de aperturas; añadir una apertura nunca aumenta la interrupción de ninguna sesión, medido en { "200" } planes pseudoaleatorios × { "3" } políticas × cada número de aperturas; con aperturas suficientes para cada sesión no queda ninguna interrupción; el horizonte de informe recorta el plan y fija el denominador del ciclo de trabajo; una lista de pases previstos se convierte en un plan de contactos sin un segundo tipo de ventana; las cifras de ciclo de trabajo del plan incluido son salidas del motor para una y dos aperturas; el informe indica la política que produjo las cifras; toda cifra informada lleva una unidad y una clase de procedencia; el escenario es reproducible y se declara MODELLED; el escenario rechaza un plan que no puede planificar); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = comprobada frente a una implementación aparte de este mismo código base: independiente de la unidad probada, pero sin autoridad externa. Comprobación cruzada de composición frente a una ruta de código independiente dentro del repositorio: cada J/S por enlace se rederiva como la diferencia de dos presupuestos de enlace calculados con linkbudget::received_signal_power_dbw, cuya pérdida en espacio libre es la expresión única { "20" }·log10(4πRf/c) y no la suma de tres términos que usa jamming::free_space_path_loss_db: ambas coinciden hasta < { "1e-9" } dB en cada fila (peor caso medido { "7.11e-14" } dB, es decir, redondeo de coma flotante). La cadena de interferencia subyacente que compone está anclada externamente por separado en tests/gnss_denied_jamming_resilience_reference.rs (rederivación independiente en numpy/scipy de J/S y de C/N₀ efectivo fijada a Kaplan y Hegarty §{ "9.4" }, más el C/N₀ medido de JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); la geometría lunar que compone es la geometría de lunar_service/lunar con sus propias referencias independientes. Identidades de forma cerrada comprobadas aquí: una distancia de seguridad del interferente reducida a la mitad añade exactamente { "20" }·log10({ "2" }) dB a cada fila; J/S es exactamente invariante a la ganancia en el eje de visión de la antena del usuario mientras que C/N₀ se mueve exactamente esa ganancia; una máscara de elevación no cambia bit a bit ninguna fila que sobreviva. La fila en sí sigue siendo ReferenceImpl/modelada: no existe ninguna campaña medida de interferencia lunar con la que validarla, y la constelación es una geometría ilustrativa de clase Moonlight/LCNS de fuentes públicas, no una efeméride volada

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } pruebas de biblioteca: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna frente a las propias funciones directas del motor, que es lo único que esta capacidad puede afirmar con honestidad. Cada punto del contorno es una inversión de forma cerrada, y cada inversión se comprueba devolviendo su resultado a través de la función DIRECTA con la que se puntuaron las propias filas del informe: la columna J/S mediante jamming::effective_cn0_dbhz (que debe devolver tracking_threshold_dbhz con una diferencia < { "1e-9" } dB-Hz), la columna de distancia de separación mediante jamming::free_space_path_loss_db y jamming::j_over_s_db (la misma J/S con una diferencia < { "1e-9" } dB), la columna de EIRP mediante jamming::j_over_s_db a la distancia de separación propia del escenario. Además se comprueba que el contorno es el LÍMITE del conjunto de denegación y no un punto interior: lock_status pierde el enganche con una desigualdad estricta, de modo que se mide que el veredicto pasa de DEGRADED a LOST dentro de { "1e-4" } dB de J/S a cada lado del contorno, algo que un contorno desplazado un epsilon no superaría. La comprobación más sólida es por enlace y no por cuantil: aplicar la misma transformación al C/N₀ propio de cada fila reproduce exactamente la columna de estado del informe — { "0" } discrepancias en { "38" } de { "38" } filas en el punto de operación documentado (kind = lunar-jamming, todas las entradas por defecto salvo jammer.range_m = { "25 000" } m), en el que { "26" } filas son LOST y { "12" } no lo son. La monotonía se mide, no se supone: { "20 001" } muestras en [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } violaciones de una distancia de separación estrictamente decreciente y de una potencia requerida estrictamente creciente, de modo que el orden por cuantiles de la banda queda demostrado y no meramente afirmado. ExternalDataset se descarta y, con él, la validación: no existe ninguna campaña medida de interferencia lunar con la que comparar un radio de denegación, la constelación es una geometría ilustrativa de fuentes públicas de clase Moonlight/LCNS y no unas efemérides de vuelo, y las entradas del contorno (EIRP, potencia del interferente, ganancias de antena, temperatura de ruido) son magnitudes representativas. ReferenceImpl también se consideró y se descartó: la inversa y la expresión directa son el MISMO álgebra leído en dos sentidos, por lo que el viaje de ida y vuelta detecta errores de transcripción y de signo, pero no es una implementación independiente; presentarlo como una comprobación cruzada sería la maniobra de independencia prestada que las invariantes de la matriz existen para impedir. Lo que aporta la banda se mide y se cita, no se afirma: en ese punto de operación el contorno de un único escalar es de { "27.402916" } km y deja { "25" } km en el lado denegado para las { "38" } filas, mientras que la banda de { "21.256108" } .. { "29.921360" } km contiene el punto de operación y por tanto refleja la división que muestra realmente la tabla. También se mide que los dos criterios discrepan — la banda de relación de potencias ({ "38.186527" } .. { "53.691675" } km) no contiene en absoluto { "25" } km —, y por eso se imprimen ambos

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; invirtiendo jamming::effective_cn0_dbhz, jamming::j_over_s_db y jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } pruebas de biblioteca: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Dos referencias independientes internas, ningún conjunto de datos externo. ({ "1" }) Viaje de ida y vuelta de forma cerrada: el sesgo mínimo detectable se obtiene invirtiendo la cola de la chi-cuadrado no central en el parámetro de no centralidad (raim::pbias) y se verifica devolviendo la no centralidad resultante a raim::noncentral_chi2_cdf en el umbral propio del monitor, que debe devolver P_md. ({ "2" }) Inyección frente a análisis: se escribe un sesgo en la estimación RF de un eje y se vuelve a ejecutar cross_raim::run_cross_raim, de modo que el estadístico comparado con la no centralidad analítica es el que calculó el monitor, no una nueva derivación. Una simulación de Monte Carlo con semilla del propio estadístico se incluye en las pruebas como tercera comprobación; deliberadamente NO figura en el informe, porque una estimación muestreada sería más lenta y no reproducible bit a bit. ExternalDataset se descarta: la magnitud es la potencia de detección de ESTE monitor con la asignación de sigma de ESTE escenario, y las magnitudes de sigma por las que se escala el MDB son entradas representativas modeladas, no mediciones. ReferenceImpl también se consideró y se descartó: la simulación de Monte Carlo muestrea el mismo estadístico que describe el análisis, por lo que detecta errores de transcripción y de coeficientes, pero no es una implementación independiente del monitor. { "0.30" } ronda { "2" } (preregistrada 0135a9e4), bloqueada (sigue siendo MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq reproducen el umbral del informe (con una diferencia de { "5.4e-12" }), el MDB por eje, la curva de potencia, el múltiplo de cruce y el tiempo de detección de rampa (con una diferencia de { "5.3e-10" }) en cinco configuraciones; las estadísticas de fallos inyectados carecen de referencia independiente y las magnitudes de sigma son entradas modeladas, por lo que la delimitación del alcance queda a la espera de una decisión del responsable

# text
seg-83724a2a8e06 = hybrid_integrity::tests (la curva de potencia de detección va desde la tasa de falsas alarmas con fallo cero hasta { "1" } − P_md en el sesgo mínimo detectable; el sesgo mínimo detectable devuelto a noncentral_chi2_cdf en el umbral que aplicó el propio monitor devuelve P_md con una diferencia de { "1e-9" }, en todos los ejes y a través del asistente público; un sesgo realmente inyectado en la estimación RF desplaza el estadístico propio del monitor exactamente en el valor b²/(σ_rf² + σ_opt²) calculado a mano; un sesgo sin ruido se detecta por encima de √(T/λ*)×MDB y se pierde por debajo, con la escalera inyectada a ambos lados de ese cruce; la potencia de detección es monótona en la magnitud del fallo e idéntica en los cuatro ejes en múltiplos de MDB; una simulación de Monte Carlo con semilla de 200,000 muestras del estadístico del monitor reproduce la potencia analítica dentro de 4σ en cuatro puntos de la curva; el MDB de temporización queda fijado por encima del límite de alerta de temporización, lo que es una debilidad medida y no una característica; se mide que el cuantil de Wilson-Hilferty discrepa del umbral exacto del monitor en ~{ "4" }%, lo que deja constancia de por qué no se usó; la cifra de rampa es exactamente MDB/velocidad y escala inversamente con la velocidad, y una velocidad no positiva da null y no cero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Sin referencia independiente externa. El cruce es una solución de forma cerrada del crecimiento de la varianza de un paseo aleatorio, y las pruebas lo recalculan de forma independiente a partir de los valores que publica el propio informe y no a partir de los componentes internos del emisor. La covarianza inicial queda fijada bit a bit a la traza que el bloque de traspaso existente ya notificaba, de modo que el avance en inercia no puede propagar una covarianza que nadie más haya visto. Las PSD de ruido de proceso son entradas representativas MODELLED y los tiempos de cruce escalan directamente con ellas, lo que la prueba de escalado enuncia como una propiedad medida y no como una afirmación. ExternalDataset se descarta deliberadamente: el tiempo de avance en inercia es una función directa de dos PSD modeladas y de límites de alerta que son a su vez representativos, y no existe ningún avance en inercia lunar medido tras un traspaso óptico/RF con el que compararlo. Una referencia independiente externa requeriría aquí una curva publicada de crecimiento de la covarianza tras el traspaso, o de exactitud en holdover, para un receptor comparable con su modelo de ruido de proceso indicado, comprobada con una tolerancia

# text
seg-f9767a6109d5 = hybrid_integrity::tests (el avance en inercia parte exactamente de la traza de covarianza que notifica el bloque de traspaso, en ambos sentidos, de modo que la diagonal reproducida no puede desviarse del traspaso notificado; el tiempo de cruce notificado se recalcula a partir del propio sigma de traspaso del informe, de la PSD de ruido de proceso y del factor de cobertura, y la cota queda dentro del límite de alerta justo antes de él y fuera justo después; el tiempo de avance en inercia escala exactamente de forma inversa con la PSD de ruido de proceso y se acorta cuando el límite de alerta se estrecha; un avance en inercia con PSD cero notifica null y no un tiempo cero, porque nunca no es inmediatamente; el perfil emitido cruza exactamente una vez y acota el cruce notificado; el tiempo de duplicación de la varianza y el tiempo de cruce del límite de alerta se mantienen separados, al diferir en ocho órdenes de magnitud tras la etapa óptica ajustada y en menos de un orden de magnitud tras la etapa RF holgada; abandonar la modalidad óptica da más tiempo de avance en inercia que abandonar la RF, exactamente en la diferencia de covarianzas dividida por la tasa de crecimiento horizontal; y random_walk_time_to_limit distingue ya-fuera, cruza-en-t y nunca-cruza)

# text
seg-903acaa666a9 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Mixto, y separado en lugar de agrupado. El PATRÓN subyacente está validado externamente y conserva su propia fila (un fixture scipy.special.j1 con una diferencia < { "0.05" } dB en tests/validate_p1_orbital_footprint.rs, además de la abscisa de potencia mitad de Airy publicada x = { "1.61634" }, localizada aquí por bisección y no supuesta). La GEOMETRÍA se comprueba frente a trigonometría de triángulos de forma cerrada, escrita como una expresión distinta del producto escalar sometido a prueba. La CONTENCIÓN del haz real por el cono aproximado es álgebra derivada (28.019/√η frente a { "29.479" } grados por λ/D), de modo que la corrección solo puede ser no positiva para η ≤ { "0.9035" }. Pero los RECUENTOS dentro del haz en sí no tienen referencia independiente externa: ninguna tabla publicada indica cuántos satélites de una capa de clase Moonlight/LCNS mantienen un emplazamiento del polo sur dentro del haz de potencia mitad de una antena parabólica dada, y la constelación es una aproximación ilustrativa de fuentes públicas, no unas efemérides de vuelo. La discrepancia medida en el punto de trabajo documentado — { "0" } enlaces dentro del haz con el patrón real frente a { "28" } con la aproximación, −{ "2.33" } satélites por época, peor época { "3" }, sobre { "76" } enlaces evaluados — es por tanto un hallazgo MODELLED sobre la aproximación, fijado como literal de regresión (la fila más cercana está a { "0.069" }° de cualquiera de los bordes del haz, cuatro órdenes de magnitud por encima de cualquier discrepancia en la última cifra), y no una cifra de cobertura validada externamente. Etiquetar la fila como ExternalDataset en virtud del anclaje externo propio del patrón sería validación prestada, que es la maniobra que las invariantes de la matriz existen para impedir. { "0.30" } ronda { "2" } (preregistrada d9755d28), bloqueada (sigue siendo MODELLED): la geometría SPICE y las funciones de Bessel de SciPy reproducen el ángulo fuera del eje (peor caso { "3.0e-5" } grados), la ganancia de Airy y los indicadores de haz sobre { "6 336" } filas de estados de orbitadores en vuelo y el punto de trabajo documentado; pero con geometría de vuelo los indicadores se dividen según la identidad del satélite (el enlace más cercano está a { "1.66" } grados del borde del haz), la visibilidad de { "5" } grados se comprueba como indicador y no como elevación numérica, el indicador de aproximación simétrica aplica la regla empírica 31000/G a un ángulo validado sin validar la regla, y las eficiencias implícitas carecen de referencia independiente; la delimitación del alcance queda a la espera de una decisión del responsable

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests y lunar_service::tests (el cruce de potencia mitad localizado por bisección sobre el patrón coincide con la x de Airy publicada = { "1.61634" } y da el ancho exacto { "1.02899" }·λ/D, lo que deja constancia de que el coeficiente convencional { "1.02" } se sitúa en −{ "2.955" } dB y no en −{ "3.010" } dB; el patrón es estrictamente decreciente a lo largo de { "400" } puntos desde el eje hasta el primer nulo; el álgebra de eficiencia implícita hace el viaje de ida y vuelta con una diferencia de { "1e-12" } y reproduce { "0.641" } / { "0.920" }; el ángulo fuera del eje coincide con tan θ = R·sin γ/(r − R·cos γ) en { "20" } puntos y en ambos límites con una diferencia de { "1e-12" }; el cono aproximado contiene el haz real fila por fila; los recuentos de cabecera son iguales a los indicadores por fila que resumen y la corrección es igual a su diferencia; cada veredicto de fila puede recalcularse solo a partir del informe emitido; cada campo numérico y booleano emitido tiene una unidad y una clase de procedencia; una abertura imposible no emite ningún bloque; sin antena configurada la exportación conserva exactamente sus seis claves preexistentes, { "0" } hojas cambiadas y { "0" } eliminadas); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = comprobado frente a una implementación independiente de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — El correlador sdr propio del motor (sdr::correlate / synth_if / CaCode) avanzado paso a paso sobre IF sintética con semilla a un C/N₀ calibrado: una ruta de código distinta que llega a los mismos números por correlación numérica de IQ muestreada y no mediante una expresión algebraica del jitter, de modo que es un camino diferente y no una reformulación; además de valores tabulados estándar de I₀ de Bessel modificada para el término de salto de ciclo. Teoría de lazos según Kaplan y Hegarty, cap. { "8" }, y Viterbi/Gardner para el tiempo hasta el salto. La fila sigue siendo ReferenceImpl/MODELLED: la comprobación cruzada reside en este mismo código base, y la comprobación de bessel_i0 valida una función especial y no el modelo de seguimiento, por lo que promover la fila sobre esa base sería un etiquetado interesado. ExternalDataset requeriría un conjunto de datos de IF en bruto registrado, con C/N₀ de referencia y un instante de pérdida de enganche anotado (clase TEXBAT/OAKBAT); ninguno se incluye en este árbol, e incluso con las IQ esos conjuntos de datos no publican la verdad de estado del lazo por época, de modo que un tiempo declarado de pérdida de enganche solo podría validarse frente al detector de enganche de otro receptor, lo cual es una elección modelada y no una referencia independiente. Los anchos de banda de lazo, el tiempo de integración, el espaciado del correlador, la relación de enganche, los tiempos de permanencia, la potencia del interferente y las ganancias de antena son cifras representativas de la banda, no una hoja de datos. { "0.30" } ronda { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, ejecutado como programa) sobre IF generada de forma independiente (preregistrada 6ef7698c, con modificaciones del método de medición divulgadas), un hallazgo (sigue siendo MODELLED): el jitter de PLL y DLL en lazo cerrado coincide dentro del { "8" } % entre { "35" } y { "45" } dB-Hz, la tensión dinámica de { "10" } Hz/s dentro del { "1" } % y el retardo de rampa de código de primer orden dentro del { "2" } %; a { "30" } dB-Hz el jitter de PLL es un { "21" } % mayor y el de DLL un { "32" } % menor, los umbrales medidos de la regla de 15 grados quedan { "1.5" } dB por encima del motor, y el lazo de segundo orden salta de { "0.5" } a { "2" } décadas más a menudo que la cota de tiempo de salto de primer orden. Revisión { "0.30" }: el tiempo de salto de Costas usa ahora la SNR de lazo rho/4 (saltos de medio ciclo); el log10_mean_time_to_cycle_slip_s por defecto de jitter_table baja de { "11.58" } a { "2.10" } en el umbral de { "25.47" } dB-Hz

# text
seg-9910640b7886 = tracking_loop (compuesto de sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (jitter del discriminador de Costas en lazo abierto frente a sdr::correlate avanzado paso a paso sobre IF sintética con semilla, { "3" } realizaciones de ruido agrupadas × { "900" } épocas, con una coincidencia de { "0.63" }% entre 35 y 45 dB-Hz, exigiendo que el término de pérdida por elevación al cuadrado se ajuste al menos { "3" }× mejor que la forma sin pérdida por elevación al cuadrado allí donde sea resoluble; la saturación del discriminador atan en ~{ "32" } dB-Hz afirmada y no meramente enunciada, de modo que el límite de validez queda fijado; σ en lazo cerrado frente a un lazo de Costas sdr avanzado paso a paso a lo largo de { "4000" } épocas con { "3.7" }%; retardo de rampa del DLL de primer orden frente a un DLL sdr avanzado paso a paso con { "0.17" }%; bessel_i0 frente a I₀ tabulado con { "7.4e-8" }; el ancho de histéresis obligado a caer en [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] en { "4" } relaciones × { "2" } tiempos de integración × { "3" } anchos de banda); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = comprobado frente a una implementación independiente de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Identidades de forma cerrada, sin que se reclame ni exista referencia independiente externa. El brazo de palanca se comprueba frente a ρ/B y las dos formas de equirrepartición entre sí con una diferencia de { "1e-15" }: identidades algebraicas, de modo que detectan un error de cableado y nada más, y se etiquetan como tales. El resultado sustantivo se MEASURED y no se afirma: un retardo medido desde una línea base fija restringe la DIRECCIÓN de la baliza, de modo que la componente de la línea de visión llega a la matriz de información solo a través del término de distancia de campo cercano, y la prueba lee la anisotropía resultante del espectro emitido en lugar de derivarla. La desigualdad AM-HM convierte √(p/trace(M)) en un suelo estricto, de modo que un enlace de equirrepartición isótropa solo puede SUBESTIMAR, y la relación entre lo calculado y la equirrepartición es exactamente la anisotropía que descartó. MEASURED sobre el par tipo Goldstone/tipo Canberra cuya cuerda mide { "10726.748" } km: a lo largo de { "112" } días muestreados, { "36" } no admiten ninguna época de visibilidad mutua con una máscara de { "10" }°, lo máximo que se ve mutuamente es { "17" } de un calendario de 49 muestras, y en los { "73" } días viables la relación de tres componentes va de { "113.9" }× a cuatro órdenes de magnitud más, con mediana { "1513" }×, mientras que al restringirse a las dos direcciones transversales de las que la línea de visión no priva da de { "3.94" }× a { "25.8" }×, con mediana { "7.8" }×. LO QUE ESTA FILA NO AFIRMA: ninguna de esas cifras como propiedad de una campaña real. Establece que la magnitud del punto de superficie se CALCULA ahora en lugar de suponerse, y que no puede intercambiarse en silencio con la de nivel de estación. Sigue siendo ReferenceImpl/MODELLED: no existe ninguna covarianza publicada de un punto de superficie lunar por VLBI con la que validar, las estaciones y el emplazamiento de la baliza son ilustrativos y no están medidos, y las efemérides, los relojes, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS, de modo que esto es una cota de Cramér-Rao para un conjunto reducido de parámetros y es optimista por sí misma. La misma magnitud en la ruta con núcleo (baliza sobre la Luna DE440) se valida en su propia fila, "…, kernel path"; en esta ruta analítica el menor sigma de baliza es un { "3.9" } % inferior a la referencia independiente SPICE de esa fila, y por eso esta fila sigue siendo MODELLED

# text
seg-e6236f142dae = lunar_vlbi_fim (compuesto de lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } pruebas de biblioteca: cada grafía de datum hace el viaje de ida y vuelta por parse/as_str y una desconocida se rechaza; mantener todas las estaciones sin la baliza se rechaza con un error que nombra <c1/>; se afirma que el brazo de palanca es IGUAL a ρ/B y que la equirrepartición de la baliza es IGUAL a la equirrepartición de la estación multiplicada por él, ambos con una diferencia de { "1e-15" }, con una afirmación adicional de que el brazo de palanca supera { "10" } para que los dos presupuestos no puedan confundirse en esta geometría; la línea base publicada del fixture queda fijada en { "10726.748" } km y se afirma que su calendario de 49 muestras da estrictamente menos de { "49" } observaciones de visibilidad mutua; se mide que el espectro de la baliza en una única línea base abarca al menos cinco décadas y se afirma que la relación resultante es superior a { "1" } por AM-HM y superior a { "100" } en la práctica; se afirma que la configuración estación más baliza es de rango deficiente con AMBOS campos calculados en null mientras el término modelado de comparación sigue notificándose. Además, una salvaguarda sobre el propio fixture: una clave de nivel superior intercalada después de una matriz de tablas pasa a ser, en cambio, un dato de estación, por lo que se afirma el punto de intercalación y se comprueba que el escenario analizado lleva la clave: el modo de fallo es una ejecución que usa en silencio una configuración distinta de la que nombra la prueba)

# text
seg-27b8c06d7d01 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidades de forma cerrada y autoconsistencia: la varianza del cuantificador uniforme step²/12, la propagación exacta de covarianza (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ que se reduce a σ·PDOP para σ iguales, la transferencia { "1" }:{ "1" } del término de levantamiento como consecuencia de û_user ≈ û_ref, y el cierre en cuadratura al desactivar términos. La comprobación cruzada de PDOP frente a orbit::dop comparte la matriz normal [−û, { "1" }], de modo que es una comprobación de coherencia y se etiqueta como tal, no como referencia independiente. No se dispone de ExternalDataset ni se reclama: ninguna estación de superficie lunar tiene una exactitud de levantamiento publicada, ningún enlace de corrección diferencial lunar tiene una latencia o un formato de mensaje publicados, y el resultado de cuantificación es una forma cerrada y no una medición. RTKLIB, que ya es la referencia independiente de código externo para el núcleo de diferencia simple y mínimos cuadrados ponderados, podría ejecutarse con una base deliberadamente mal levantada para confirmar la transferencia { "1" }:{ "1" } del levantamiento, pero eso es código independiente sobre el mismo álgebra de línea de visión de primer orden. LAS MAGNITUDES SON MODELLED: el valor por defecto del levantamiento es la propia asignación de realización del marco lunar de este crate y no una estación medida, la latencia y el número de bits son entradas ILLUSTRATIVE, y el crecimiento del propio VECTOR de error de efemérides de la difusión no se modela en absoluto — se indica en la cadena emitida de la ley de envejecimiento, porque es el término con más probabilidad de dominar un enlace real

# text
seg-08708f044bb5 = lunar_dpnt::tests (una salvaguarda puramente aditiva cuya diferencia de conjunto de claves es exactamente { "{" }correction_link, units{ "}" }, con todos los valores preexistentes idénticos bit a bit frente a literales capturados antes del cambio; el error de levantamiento NO se decorrelaciona con la línea base mientras que el término de órbita sí, y sobrevive a una línea base cero donde el término de órbita es exactamente cero: la comprobación estructural que detecta haber cableado el término en el lugar equivocado; un error de estación de { "1" } m se transfiere { "1" }:{ "1" } y se demuestra que no es amplificado por el DOP; una latencia cero reproduce bit a bit el residuo sin envejecer y el residuo es monótono en la latencia, con la curva emitida igual a las ejecuciones directas; el paso de cuantificación se reduce exactamente a la mitad por bit y σ² = step²/12, y la escala completa sigue las magnitudes inyectadas; cada término desactivado por turno recupera los otros dos en cuadratura; un σ igual por satélite se propaga exactamente a σ·PDOP y ese PDOP coincide con orbit::dop; cada campo emitido lleva una unidad y una clase de procedencia, comprobado en ambos sentidos)

# text
seg-37f07885bbf0 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Aritmética recalculada por un script numpy independiente sobre casos exportados (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; preregistrado en tests/fixtures/lunar_station/PREREGISTRATION.md, confirmado en solitario en 9caedf97 antes de la primera ejecución): en { "20" } casos con todos los términos de error activados, los conjuntos visibles y el estado son idénticos, los errores brutos de distancia coinciden con una diferencia de { "1.4e-14" } m, los vectores y magnitudes de error de posición con una diferencia de { "1.4e-9" } m frente a un umbral de { "1e-6" } m, y el p95 de cada punto es igual a numpy.percentile bit a bit; las correcciones de estación NO ALCANZARON su umbral de { "1e-9" } m (peor caso { "3.73e-9" } m, { "15" } de { "20" } casos), y con ellas los errores de distancia corregidos: comprobado con aritmética de 60 dígitos, ambos lados están dentro del redondeo de doble precisión del valor exacto, siendo el término de levantamiento una diferencia de dos distancias de { "1e7" } m cuya unidad en la última posición es { "1.86e-9" } m; registrado, no ajustado. El tipo de escenario se reduce exactamente al tipo de escenario lunar-differential-pnt con un punto, una época y un ensayo. El modelo de error, el modelo de decorrelación y cada umbral son propios de este proyecto o ILLUSTRATIVE; nada de lo aquí expuesto es una afirmación sobre ningún sistema real

# text
seg-810a6946b5cd = lunar_station (sobre lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: con una diferencia de { "1e-12" } m con y sin ruido de receptor; zero_baseline_floor_is_zero_in_every_trial: { "0" } con una diferencia de { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 dentro de la banda del { "5" } % indicada antes de la ejecución; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (el recálculo numpy preregistrado, registrado con su fallo); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs y los registros y goldens multiplataforma sin cambios (aditividad); tests/field_units_global.rs (cada campo emitido descrito, sin excepciones)

# text
seg-bfee8a9a8b64 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Superficies de forma cerrada (InternalConsistency): la depresión de la esfera desnuda, un cráter en una meseta sobre la esfera con un observador sobre su centro y fuera de él, y un cono analítico frente a su propia rasterización. Sobre el recorte real, un trazado de rayos numpy independiente (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; preregistrado en tests/fixtures/lunar_terrain/PREREGISTRATION.md, confirmado en solitario en edbb9b02 antes de que existiera el script) coincide en cinco emplazamientos: alturas de emplazamiento con una diferencia de { "1.0e-11" } m y las { "1800" } elevaciones de horizonte con una diferencia de { "5.5e-10" } grados frente a umbrales de { "1e-6" }, con recuentos de rayos truncados exactos; esto comprueba la aritmética, no el terreno. No se ha reproducido ninguna cifra publicada de horizonte o iluminación polar: el recorte incorporado de { "1200" } m suaviza el relieve inferior al kilómetro que resuelven los estudios de iluminación publicados, de modo que los horizontes del DEM son una línea de visión MODELLED sobre un DEM real remuestreado, no un horizonte validado. El emplazamiento de la estación y la constelación siguen siendo ILLUSTRATIVE; nada de lo aquí expuesto es una afirmación sobre ningún sistema real

# text
seg-641b41572fd9 = lunar_terrain (sobre skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: el avance del rayo reproduce -acos(R / (R + a)) con una diferencia de { "1e-3" } grados en cada acimut; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: el mismo cono muestreado sobre una tesela de latitud/longitud de { "0.005" } grados coincide con el cono analítico con una diferencia de { "0.25" } grados; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: un cráter de fondo plano sobre la esfera, con el observador en el centro y a { "4" } km y { "7" } km de él, frente a la elevación del borde de forma cerrada atan2((R + H) cos s - (R + a), (R + H) sin s) con s de la ecuación esférica de cruce del borde, con una diferencia de { "0.01" } grados en cada acimut; rasterised_cone_matches_the_analytic_cone: un cono rasterizado sobre una cuadrícula estereográfica polar de { "200" } m y leído mediante el muestreador de cuadrícula coincide con el cono analítico con una diferencia de { "0.25" } grados; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, para ambos tipos de escenario; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 conserva su recuento plano y las épocas que cuesta un horizonte son terrain_masked (la propia disponibilidad puede aumentar, porque un horizonte puede ocultar un satélite que la estación no ve), y un horizonte de { "89" } grados en la estación no deja nada disponible; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: los fondos de los cráteres Shackleton y Haworth bajos, el macizo Malapert alto, no la imagen especular; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: una tesela remuestreada del recorte incorporado da a la estación el horizonte del recorte con una diferencia de { "0.22" } grados (cota { "0.5" } grados, fijada antes de la ejecución), con el eco de la tesela y las unidades, y dem_path con dem_tile_path rechazado; the_export_site_is_masked_by_the_terrain: cada fila de exportación supera el terreno exactamente cuando es visible y está a la altura del horizonte del emplazamiento o por encima de ella en su acimut, la geometría no se mueve, el CSV gana la columna solo con terreno; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs y los registros y goldens multiplataforma sin cambios (aditividad)

# text
seg-f7719057f56b = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas y estadísticas de las propias muestras del modelo (InternalConsistency): la fórmula del DLL frente a un cálculo manual, la forma DO-229, la diferencia de línea base cero entre dos receptores, la correlación de retardo 1 de Gauss-Markov. No existe ninguna medición de multitrayecto o de receptor lunar con la que comparar; los valores son ILLUSTRATIVE y nada de lo aquí expuesto es una afirmación sobre ningún receptor real

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m a { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: sigma de la muestra sqrt({ "2" }) a dentro del { "6" } %; station_multipath_is_gauss_markov: correlación de retardo 1 exp(-dt / tau) dentro de { "0.01" }, varianza unitaria dentro del { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs y los goldens sin cambios (aditividad)

# text
seg-3c6a533c15dc = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — El sigma de forma cerrada del término de crecimiento y la comprobación de propagación de primer orden (InternalConsistency). El anexo K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, preregistrado en solitario en 59d88248): K5 falla con todas las tasas, con un p95 corregido en 3-D de { "369.8" } m, { "2315" } m y { "22797" } m frente a un umbral de { "1.5" } m ({ "292.96" } m registrados sin crecimiento), tal como se indicó antes de la ejecución. Ninguna fuente pública da una tasa de crecimiento lunar: ILLUSTRATIVE

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: la diferencia de error de enlace entre con crecimiento y sin crecimiento tiene una sigma de muestra rate tau / sqrt({ "3" }) dentro del { "6" } % sobre { "1600" } muestras; linear_growth_is_the_first_order_propagated_error: un error de velocidad dv propagado con el integrador de dos cuerpos del propio árbol desde la órbita del escenario desplaza la posición en dv tau con una diferencia dentro del { "1" } % a { "60" } s y { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignorada, el anexo registrado)

# text
seg-f55331e7b5af = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La reducción de instantánea y los casos de forma cerrada del solucionador (InternalConsistency). El anexo (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, preregistrado en solitario en 001ca100) con una restricción de altura de { "1" } m, tres satélites y una ventana de 6 épocas (ajustes ILLUSTRATIVE; las fuentes indican un filtro, una restricción de altura y tres satélites, pero no sus ajustes): K1 a K5 fallan y K6 se supera, { "1" } de { "6" } como en la ejecución registrada; el error corregido p95 en 3-D de R300 baja de { "280.6" } m a { "2.11" } m (horizontal { "0.90" } m, sin puntuar) y la cobertura se mantiene en { "0" }. El supuesto de independencia de la ventana la favorece. No es una afirmación sobre ningún sistema real

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: igual a lunar_dpnt::position_error_vector_from_range_errors con una diferencia de { "1e-8" } m, una fila de altura laxa no cambia nada, una ajustada fija el error de altura; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: cada cifra con { "1e-6" } relativo; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignorada, el anexo registrado)

# text
seg-6613341c6bc0 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Referencia: las afirmaciones numéricas de cinco fuentes públicas registradas con URL, fecha de obtención, SHA-256 y licencia en tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; diapositivas del IOAG Cislunar PNT Workshop { "2025" } y { "2026" }; UNOOSA ICG WG-B Lunar PNT, junio de { "2024" }), transcritas con referencias de página en tests/fixtures/lunar_station_published/CLAIMS.md. Los umbrales, los casos y las entradas se preregistraron en tests/fixtures/lunar_station_published/PREREGISTRATION.md (revisión { "2" }, 05bf9a19, confirmada en solitario antes de la ejecución). Primera ejecución { "0.36" }, un hallazgo (sigue siendo MODELLED): se supera { "1" } de { "6" } umbrales. La cobertura es { "0.00" } en ambos círculos frente a >= { "0.95" }, y el error corregido p95 en 3-D es de { "280.6" } m ({ "300" } km), y de { "293.0" } m con una latencia de { "600" } s, frente a <= { "1.5" } m. El umbral decimétrico (K4) no podía superarse con el ruido de código de { "0.30" } m de las fuentes, lo que refleja un conflicto entre las fuentes y no un resultado del modelo. K6 se supera (relación { "1.39" } frente a <= { "1.5" }), pero, al ser una relación entre dos cifras dominadas por la geometría, no aporta evidencia sobre la decorrelación en ningún sentido. Causa: los elementos orbitales de los satélites no son públicos, y con los elementos ILLUSTRATIVE del propio árbol un usuario y la estación comparten cuatro satélites por encima de { "5" } grados solo en el { "8.2" } % ({ "300" } km) y el { "6.3" } % ({ "600" } km) de las épocas, con una geometría casi singular (p95 sin corregir de { "3.8" } km frente a < { "10" } m en las fuentes). Las simulaciones de las fuentes usaron un filtro, una restricción de altura y tres satélites en visibilidad común, lo que el tipo de escenario snapshot no modela. Por tanto, la comparación ni confirma ni refuta el «submétrico en todo el polo sur» publicado. Muestra que el resultado de este modelo depende de órbitas que no se han publicado. No es una afirmación sobre ningún sistema real; sin afiliación ni respaldo de ninguna agencia

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (las cifras registradas frente a los umbrales registrados); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignorada, unos { "7" } s en release: vuelve a ejecutar los seis casos registrados y afirma las cifras registradas)

# text
seg-f4648485be52 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna (InternalConsistency): la reducción de orden 2 a la ruta ADD v4.2 comprobada con MAAST, la rederivación independiente de las probabilidades a priori y un fallo construido de dos satélites. No se ha hecho ninguna ejecución de MAAST ni de RTKLIB más allá de los pares, de modo que los conjuntos de hipótesis más profundos y los niveles de protección del RAIM por subconjuntos no están comprobados externamente. araim_subset_raim comparte las simplificaciones de araim_dual_raim (un sigma para integridad y exactitud, un reloj, la cola normal simple): no está ajustado a la norma ADD

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, el riesgo no monitorizado dentro de P_THRES, un subconjunto que elimina tres o más satélites monitorizado, y más de diez probabilidades a priori monitorizadas rederivadas de forma independiente como P_no fault q^k con una diferencia de { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: sin alarma sin fallo, y un sesgo de { "30" } m en dos satélites detectado con el par como el subconjunto de mayor separación normalizada); tests/araim_reference_vectors.rs y tests/integrity_araim_stanford_oracle.rs sin cambios (la ruta de orden 2 es la comprobada con MAAST)

# text
seg-a2b978f8bb5a = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna (InternalConsistency): los niveles de protección son los de snapshot_raim, que está validado frente a RTKLIB en su propia fila, recalculados sobre la misma geometría; comportamiento sin fallos y con fallo inyectado. El cielo es una geometría preestablecida representativa (no un almanaque con fecha), los residuos son sintéticos y el sigma, los límites de alerta y las probabilidades son entradas indicadas; nada de lo aquí expuesto es una afirmación sobre la disponibilidad de un receptor real

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: cifras de holdover sin cambios, { "111" } épocas denegadas no disponibles y sin nivel de protección, rechazado con ejecuciones > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: el HPL y el VPL de cada época muestreada son exactamente iguales a los de un snapshot_raim de residuo cero sobre el mismo cielo preestablecido, y la ejecución sin fallos no da ninguna alarma; a_stated_bias_is_detected_while_it_lasts: un sesgo de { "60" } m da alarma exactamente en las { "10" } épocas que abarca; every_integrity_field_has_a_unit); clock_integrity::tests; los goldens del reloj sin cambios

# text
seg-6a7d171f880f = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Un rango independiente por forma escalonada por filas mediante eliminación gaussiana con pivoteo parcial confirma cada veredicto de rango de seis estados: un algoritmo distinto que no comparte código con la ruta de valores propios/SVD sometida a prueba. La matriz de transición de estados del CR3BP de { "6" }×{ "6" } que esto compone lleva su propia referencia independiente ReferenceImpl frente a la integración variacional de SciPy, y las condiciones iniciales de halo/NRHO proceden de un corrector que reproduce la órbita publicada del Gateway L2 sur { "9" }:{ "2" }. El tramo existente del filtro de información de raíz cuadrada NO se cuenta expresamente como corroboración: consume los mismos jacobianos y se reduce a la misma matriz normal, de modo que es una comprobación de coherencia entre dos máquinas numéricas, y la etiqueta de extensión emitida así lo dice. NO está anclado externamente, y por ello ExternalDataset se descarta en lugar de tomarse prestado de la fila de la STM: las longitudes de arco umbral dependen en sí mismas del diseño de constelación MODELLED, de la cuadrícula de épocas y — de forma medible, hasta en { "40" }× — de la tolerancia de valores singulares. Las { "2.09" } h planas publicadas se reproducen exactamente con rel_tol = { "1e-6" } y dependen ellas mismas de la tolerancia ({ "10.25" } h con { "1e-4" }, { "0.42" } h con { "1e-8" }), lo cual es una propiedad del criterio y no de la órbita. Ningún conjunto de datos público publica un umbral de longitud de arco para la observabilidad de una constelación cislunar elegida. RESULTADO MEASURED: el umbral espacial de seis estados es de { "22.17" } h para la NRHO L2 y de { "40.42" } h para el halo L2, y NO EXISTE para la familia DRO plana sobre la que se derivó la afirmación publicada — rango { "4" } de { "6" } con defecto de datum { "2" } y dos valores propios exactamente nulos, un defecto estructural que ninguna longitud de arco subsana

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests y observability_gramian::tests (el documento por defecto fijado bit a bit mediante FNV-1a de su JSON, resumen y SVG, con los valores por defecto explícitos afirmados como no-op y las ocho claves de extensión afirmadas como AUSENTES, de modo que la captura no pueda regenerarse como una autocomparación; el bloque aditivo <c1/> excluido de la congelación al despojarlo y volver a calcular su hash frente a la constante fijada antes de que existiera, lo que demuestra, en lugar de suponer, que nada de lo publicado se movió; invariancia del rango bajo un sigma homocedástico afirmada con σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos afirmado como escalado exactamente lineal con σ con { "1e-6" } relativo; el espacio nulo del DRO afirmado como exactamente los ejes de coordenadas z y ż con las dos causas separadas — una fila de distancia entre naves coplanares tiene û_z = { "0" }, y el bloque fuera del plano del CR3BP se desacopla exactamente en z = { "0" }; jacobianos espaciales frente a diferencias finitas centrales y frente al observable de velocidad de distancia en 3-D independiente del crate; familias fuera del plano rechazadas en modo plano)

# text
seg-d1770a478184 = comprobado frente a una implementación independiente de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Tres rutas independientes, ninguna de ellas una cifra publicada de exactitud de predicción. ({ "1" }) Una señal analítica con coeficientes conocidos: la única forma de ejercitar la maquinaria periódica, ya que ninguna serie incluida es lo bastante larga para admitir un término anual. ({ "2" }) La solución de mínimos cuadrados de forma cerrada de los manuales, con un álgebra distinta de la resolución matricial sometida a prueba, sobre filas reales. ({ "3" }) Las filas de predicción reales archivadas del Bulletin A que publica el producto real de { "2026" }, comparadas por plazo como estadístico de CONCORDANCIA y expresamente no como error: { "0.256" } ms a { "1" } día, { "0.695" } ms a { "2" } días, { "1.252" } ms a { "3" } días, con deriva hasta { "3.885" } ms a { "9" } días. Es decir, se trata de la CLASE del Bulletin A, cercana a plazo corto, no del Bulletin A. Los residuos entre lo predicho y lo final son magnitudes reales medidas sobre filas reales del IERS, pero su magnitud solo se comprueba frente a la DIRECCIÓN de la comparación, nunca frente a una cifra de exactitud publicada por el IERS: leer un producto real es procedencia, no una referencia independiente. MEASURED: el día { "1" } el predictor operativo da { "3.78" } m de error en el marco lunar frente a los { "11.39" } m de la persistencia ({ "3.01" }×), el día { "2" } { "10.23" } m frente a { "21.72" } m ({ "2.12" }×), el día { "3" } { "20.33" } m frente a { "30.57" } m ({ "1.50" }×), y es PEOR pasados tres días ({ "0.87" }× a { "5" } días, { "0.43" }× a { "10" }), lo que el informe emite en lugar de mostrar solo los horizontes que lo favorecen. NO reproducidos: el filtro autorregresivo de residuos y la reducción tabulada de mareas zonales, la ventana operativa de 365 días es inalcanzable con los datos incluidos, y NO existe en este repositorio ninguna versión archivada anterior de la serie, de modo que la tabla de versiones archivadas no notifica filas en lugar de puntuar una sintetizada. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): puntuado frente a las mismas finales sobre { "178" } emisiones archivadas del Bulletin A con la ventana de 15 días por defecto del crate, el MAE de UT1 del predictor es de 2.4x a 12.6x el del Bulletin A de { "1" } a { "10" } días (umbral 1.5x) y de { "5.32" } ms a { "10" } días, fuera del rango de { "0.36" } a { "3.13" } ms del 2nd EOP PCC; el polo es de 1.5x a 1.85x el del Bulletin A (dentro de 1.5x solo a { "6" } y { "7" } días); fallan { "19" } de { "21" } condiciones preregistradas. Corrección a la ruta ({ "3" }): las filas del producto de { "2026" } con las que se comparó llevan el indicador I (medido) del IERS, no P, de modo que esas cifras de concordancia se refieren a valores rápidos medidos, no a predicciones del Bulletin A. Ronda { "2" } de { "0.30" }, un predictor de mínimos cuadrados más autorregresivo con las mareas zonales eliminadas analíticamente, frente a { "178" } emisiones archivadas del Bulletin A con el umbral de la ronda 1 (preregistrado c93605b4), un hallazgo (sigue siendo MODELLED): se satisfacen { "12" } de { "21" } condiciones; el MAE de UT1 es de { "1.73" } a 2.11x el del Bulletin A de { "2" } a { "10" } días (umbral 1.5x) mientras que el polo está dentro de 1.27x en todos los plazos. Revisión { "0.30" }: con la entrada sin conexión ahora clasificada por el indicador del IERS, las cifras de concordancia de la ruta ({ "3" }) se refieren a predicciones reales del Bulletin A (0.256/0.695/1.252/3.885 ms a 1/2/3/9 días frente a filas rápidas -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests y tests/operational_eop_predictor_reference.rs (recuperación de coeficientes de señal analítica con { "1e-9" } en una ventana de 365 días; un ajuste de sesgo más tasa igual a la pendiente y la ordenada en el origen de los mínimos cuadrados ordinarios de forma cerrada con { "1e-12" } sobre filas reales; DOS detectores de anticipación que destrozan las columnas rápidas de UT1 y de polo de cada fila posterior a la época de emisión — dejando intactas las finales del Bulletin B — y exigen una salida idéntica bit a bit, verificados por mutación para poner en rojo { "10" } pruebas cuando la barrera del ajuste se afloja exactamente un día; una lista de épocas reconstruida de forma independiente; el bloque Bulletin B de un objetivo en blanco y la época mostrada saliendo de la tabla; admisión de términos comprobada con ventanas de { "6" }, { "15" }, { "150" } y 365 días; recuentos de filas monótonos; y una captura previa al cambio congelada del informe por defecto afirmada campo a campo sin tolerancia, que además afirma que la captura no contiene las claves nuevas para que no pueda regenerarse en silencio como una autocomparación); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (la extensión opcional EopSeries::with_ls_ar_prediction más allá de la última fila: respuestas dentro de la tabla idénticas bit a bit, filas de pronóstico iguales a ls_ar_predict, los argumentos de marco más allá de la tabla siguen el pronóstico en lugar de quedar acotados; coherencia interna)

# text
seg-546d8034c488 = comprobado frente a una implementación independiente de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Identidades de forma cerrada y una ruta independiente dentro del repositorio, sin que se reclame referencia independiente externa. El diseño de Helmert, la única derivada nueva del módulo, se rederiva por diferencia finita central de lunar_frame_realise::apply_helmert, una ruta que no comparte ninguna expresión con la forma analítica. La acumulación que compone es la de lunar-vlbi-fim, cuyo jacobiano se deriva por diferencias finitas frente a lunar_vlbi::vlbi_delay_s allí, y cuyo núcleo de álgebra lineal está anclado externamente por separado frente a numpy en tests/fim_observability_reference.rs: esta fila no toma prestado ninguno de los dos estados. La referencia independiente física es estructural y no numérica: la parcial de retardo de una baliza es la DIFERENCIA de campo cercano de dos vectores unitarios casi paralelos, de modo que la dirección de traslación peor determinada DEBE ser la dirección fija al cuerpo hacia la Tierra, y la prueba afirma la respuesta calculada frente a la dirección medida por separado. MEASURED: sigma de traslación derivado de la campaña de { "6.3975" } m frente al error de recuperación de { "0.3125" } m del escenario de transformación inyectada ({ "20.5" }× más estrecho), mientras que la rotación y la escala van en el sentido CONTRARIO, { "2.32" }× y { "13.5" }× más holgadas: la ruta inyectada supone un único sigma isótropo y por tanto reparte su error de forma uniforme entre siete parámetros, lo que el observable de retardo no hace. Rango 7/7 pero condición de { "3.8e5" }, con una dirección { "99.57" } % de traslación pura hacia la Tierra y cuarenta veces peor que cualquier otra. LO QUE ESTA FILA NO AFIRMA: que la cifra de la campaña sea correcta en términos absolutos. Establece que la cifra ahora se DERIVA de un calendario, una geometría y un modelo de error y no de una respuesta implantada. Sigue siendo ReferenceImpl/MODELLED: no existe ningún par publicado de campaña VLBI lunar y covarianza de datum, la red de estaciones y el sigma de retardo son entradas ILLUSTRATIVE (el catálogo de balizas tiene fuente, la campaña no), las observaciones se tratan como independientes mientras que la troposfera y el reloj de una sesión real están correlacionados entre barridos cercanos, y las efemérides, los relojes, la troposfera y los parámetros de orientación terrestre se mantienen FIJOS. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): con cada fila del jacobiano de balizas reconstruida a partir de tiempos de luz de NAIF SPICE (DE440, ITRF93, MOON_ME; preregistrado { "50863551" }), el calendario, el rango de Helmert, los sigmas de datum (dentro de { "4.7e-3" }), la condición, la dirección más débil ({ "0.07" } grados), el barrido de libración y el orden de los arcos coinciden en seis escenarios dentro de { "1" } % / { "0.2" } / { "0.05" } grados preregistrados. NumPy sobre el jacobiano confirmado del motor coincide con { "3e-14" } donde las estaciones están fijas. Con las estaciones estimadas difiere en { "6.8e-6" } frente a un { "1e-9" } preregistrado, cuya premisa sobre el número de condición era errónea (condición de Helmert { "2.1e8" }; las rutas independientes de NumPy discrepan en { "3e-6" }; no se descarta una contribución del respaldo de pseudoinversa { "1e-9" } del motor), por lo que la fila no se promueve sobre ese preregistro. Reregistro { "0.36" } con un umbral escalado por la condición (preregistrado b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) a partir del condicionamiento de la información conjunta y de su reducción de Helmert), un hallazgo (sigue siendo MODELLED, NOT MET): el paso { "0" } DESCARTA el respaldo de pseudoinversa como causa de la brecha de { "6.8e-6" } (ninguna matriz anterior a la matriz de Helmert recurre al respaldo en los seis escenarios originales, con un margen más estrecho de un factor { "2.6" }), el tramo SPICE sigue satisfaciéndose en los seis, y NumPy coincide dentro del umbral en seis de ocho escenarios (por defecto, los dos arcos, el sigma de retardo 3x, el defecto colineal y la nueva ejecución con estaciones fijas del 2026-12-01; peor caso { "0.13" } de su umbral). Falla en stations_estimated (sigmas de datum de hasta { "6.8e-6" }, condición { "9.1e-6" }, norma con independencia descartada { "3.5e-6" }, frente a t = { "5.9e-7" }), y en la fecha nueva la baliza del polo sur no tiene ninguna observación, de modo que la información de la baliza es de rango deficiente (respaldo de pseudoinversa anterior a la matriz de Helmert en ambos escenarios nuevos) y la referencia independiente NumPy sin cambios no puede evaluar stations_estimated_fresh (matriz singular). Resultados: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-c77bd56a0619 = lunar_frame_campaign (compuesto de lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } pruebas de biblioteca: el diseño de Helmert frente a una diferencia finita central de lunar_frame_realise::apply_helmert — el módulo PARA el que es el datum, que no calcula ninguna derivada y por tanto fija la convención de signo [p]ₓ — con las { "84" } entradas del diseño coincidiendo con < { "1e-6" }; una traslación pura de la red leída de vuelta como traslación pura con una fuga < { "1e-6" } hacia los otros seis parámetros; el sigma del datum exactamente lineal en el sigma de retardo con { "1e-8" } en un cambio de { "3" }× en los siete parámetros; un arco de { "16" } h medido peor y un arco de { "48" } h medido mejor que { "24" } h, con el barrido de libración emitido ordenado del mismo modo; el peor eje de traslación afirmado como el eje dominante de la dirección fija al cuerpo hacia la Tierra medida por separado y peor que los demás en > { "5" }×, una referencia independiente física de la que nada en el solucionador fue informado; tres balizas colineales que producen un defecto con cada sigma de datum NULL y las direcciones nulas emitidas en la base de siete parámetros; offblock_fraction y la correlación entre balizas exactamente { "0.0" } con las estaciones fijas y ambas > { "0" } con ellas estimadas; las cifras de transformación inyectada del bloque de comparación mostradas iguales a una ejecución independiente de ese escenario con { "1e-14" } relativo en lugar de transcritas; una salvaguarda de que no aparece ningún datum inyectado/recuperado en ninguna parte del documento; la emisión de realización del marco lunar fijada byte a byte mediante FNV-1a-64 sobre json‖summary‖svg para tres formas de entrada, con huella tomada antes de empezar el trabajo); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (con puerta; el estricto lunar_frame_campaign_matches_spice_geometry_and_numpy sigue ignorado); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (hallazgo; decisión del fundador 2026-10-02, opción A: esta fila sigue siendo MODELLED y no toma prestado el estado de la fila separada; frente a una referencia independiente mpmath de 50 dígitos, preregistrada 804662d5, los sigmas de datum con estaciones estimadas del motor están dentro de su cota de error hacia atrás a priori, con { "9.7e-6" } de diferencia el 2024-01-01, y el umbral de { "1e-9" } estaba por debajo de lo que alcanza cualquier ruta de doble precisión, siendo la mejor, una proyección QR de NumPy, de { "5.5e-9" } de diferencia; la evidencia respalda la fila separada «Lunar frame datum covariance with the stations estimated, against 50-digit extended precision»); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (fijada); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (fijada)

# text
seg-114007ecc9fe = comprobado frente a una implementación independiente de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Un estimador independiente de este código base con un algoritmo distinto y una ruta de código disjunta: Gauss-Newton ponderado no lineal con parciales por diferencias finitas, cuyo veredicto se lee como error medido de recuperación de estado en km y mm/s. No tiene ninguna expresión en común con la ruta de rango y covarianza del gramiano, y la separación se IMPONE mediante una salvaguarda sobre el texto fuente en lugar de afirmarse. MEASURED en la cuadrícula DRO plana publicada: el criterio de ESTIMABILIDAD está CORROBORATED — el límite de Monte Carlo medido es de { "5.739130" } h frente a las { "5.739130" } h formales (relación { "1.0000" }), y el RMS medido reproduce el 1σ formal en { "21" } longitudes de arco con una relación de media geométrica de { "0.9804" }. El criterio de RANGO NO está corroborado como límite de recuperabilidad: el estimador recupera a partir de { "0.782609" } h frente a las { "2.086957" } h del gramiano, relación { "0.375" }, y a { "1.826087" } h — el último prefijo que la lectura de rango puntúa con { "3" } de { "4" } — recupera hasta { "1.96e-5" } del desplazamiento a priori. El límite de recuperación no se mueve a lo largo de tres décadas de su propia cota, mientras que el umbral de rango abarca de «nunca» a { "0.782609" } h a lo largo de cuatro décadas de rel_tol, y ambos coinciden exactamente con rel_tol = { "1e-8" }. Ese intervalo se registró en un principio como si alcanzara { "0.260870" } h; esa cifra era un ARTEFACTO, producido por una lectura de rango que contó { "4" } direcciones a partir de { "2" } filas de medición por debajo del suelo de ruido de f64, y aquí se corrige en lugar de dejarla subsistir. La lectura de rango queda ahora acotada por la desigualdad de Sylvester con el motivo emitido, y el intervalo corregido se satura exactamente en el arco en el que recupera el estimador independiente, lo que refuerza la validación cruzada de esta fila en lugar de debilitarla: el { "1e-6" } publicado es una CONVENCIÓN conservadora de valores singulares, no una afirmación sobre la recuperabilidad. El mismo patrón en el espacio: NRHO { "9.290323" } h frente a { "21.677419" } h, halo { "22.978723" } h frente a { "39.829787" } h, con la estimabilidad coincidiendo exactamente en ambos. El DRO plano de seis estados no recupera con ningún arco, reproduciendo de forma independiente el defecto estructural de datum de esa familia a partir de un estimador al que no se le dijo nada sobre él. NO está anclado externamente — la dinámica y las condiciones iniciales se comparten con el análisis sometido a prueba y ningún conjunto de datos público publica tal umbral —, de modo que ExternalDataset se descarta

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests y tests/cislunar_arc_recovery_reference.rs (ambos límites y sus relaciones fijados sobre la cuadrícula publicada; la curva de error medida comparada con la fila de covarianza formal fila por fila con una cota de factor dos por fila y una cota de media geométrica; un CONTROL NEGATIVO — el DRO plano de seis estados — que afirma que el criterio PUEDE fallar y que el estimador sin regularizar diverge más allá de { "1e6" } km en lugar de devolver un error pequeño verosímil; invariancia de parametrización afirmada en cada prefijo con { "1e-3" } relativo; una salvaguarda sobre el texto fuente que elimina comentarios, literales de cadena y el módulo de pruebas y falla ante cualquier mención del jacobiano, la STM, el rango SVD o la maquinaria SRIF, verificada por mutación inyectando una llamada prohibida; una comprobación solo de prueba de que las diferencias finitas son iguales a las filas analíticas, de modo que la linealización se sabe correcta mientras la ruta analítica sigue ausente del estimador; determinismo afirmado byte a byte; el documento publicado de observabilidad cislunar fijado por conjunto de claves, huella canónica y línea de resumen)

# text
seg-03751f09c5c9 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La GEOMETRÍA es externa y tiene hash: tres fixtures cuyos números proceden únicamente de documentos obtenidos con URL, fecha de obtención y SHA-256, regenerables mediante generadores confirmados que verifican el hash de origen y ABORTAN en lugar de emitir un número — la constelación de referencia de demostración de interoperabilidad de LANS (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), los casos de estudio de LNCSS (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) y unas efemérides genuinas de naves en vuelo para LRO, Danuri, Chandrayaan-2 y CAPSTONE evaluadas a partir de los núcleos reconstruidos del propio JPL mediante Horizons. NO existe públicamente ningún núcleo de constelación de navegación lunar — Moonlight/LCNS, LCRNS y LNSS no están en vuelo y NAIF no publica nada para ellos — y no se inventó ninguno. El requisito DERIVADO de σ_URE NO tiene referencia independiente externa (nadie publica la exactitud de medición de distancia que exige un HPL lunar de { "50" } m sobre este volumen de servicio), por lo que se comprueba frente a su propia identidad algebraica y, de forma independiente, volviendo a ejecutar todo el barrido con el requisito calculado y confirmando que la disponibilidad cambia allí. MEASURED: el diseño publicado de 8 satélites necesita σ_URE de { "2.9044" } m con una cobertura del { "100" } % frente a los { "0.3591" } m con el { "37.85" } % de la constelación ilustrativa: una revisión de { "8.09" }× de una cifra publicada según la regla R4 del programa. La conclusión cualitativa se mantiene (la clase LNIS de { "30" } m sigue sin cerrar un HPL polar sur de { "50" } m), pero el déficit se había exagerado ocho veces. La demostración LANS de 5 satélites da CERO muestras de nivel de protección — cinco satélites no pueden dar los seis a la vista que necesita un conjunto de hipótesis de fallo único — y el campo del requisito está AUSENTE en lugar de fabricado; lo mismo ocurre con las cuatro naves reales con una cobertura del { "0" } %. InternalConsistency es el tipo honesto: los datos de ENTRADA son externos y tienen hash, pero la magnitud de esta fila solo se valida frente a sí misma. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a las estadísticas del caso de estudio de LNCSS de navi.613 en { "346" } puntos de cuadrícula, { "4" } de { "12" } estadísticas de disponibilidad quedan fuera de los { "2" } puntos porcentuales preregistrados (caso A: -4.0, +{ "22.5" } y -3.6 pp; caso B: -12.1 pp). Causas probables: elementos leídos en el marco equivocado, Kepler de dos cuerpos a lo largo de { "15" } días frente al modelo de fuerzas no indicado del artículo y una cuadrícula no reproducible a partir del texto. La mitad de PDOP no pudo evaluarse (LANS no imprime ninguna estadística numérica); la prueba de comparación está confirmada como ignorada. Ronda { "2" } de { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a una referencia independiente Orekit { "12.2" } / Hipparchus { "3.1" } que calcula todo el informe (propagación de Orekit, visibilidad y DOP de DOPComputer, niveles de protección MHSS compuestos con Hipparchus, el requisito resuelto por muestra; preregistrado d3ce97b2) sobre las cinco geometrías obtenidas y dos cuadrículas, { "155" } de { "160" } valores coinciden dentro de los umbrales preregistrados ({ "2" } pp, { "5" } %, { "1" } %), incluido el requisito sigma_URE para LNCSS A y C ({ "3.879072208" } m en ambos lados para el caso A) y el requisito ausente para LANS y los orbitadores. LNCSS B en la cuadrícula densa falla en sus estadísticas de peor muestra (sigma_required { "0.000923" } frente a { "0.001511" } m, hpl_max { "1.63e6" } frente a { "0.99e6" } m), donde las geometrías casi singulares (PDOP de aproximadamente { "1e6" }) amplifican la coincidencia de posición a nivel de metro; su requisito p95 coincide ({ "1.6343" } frente a { "1.6357" } m). El requisito de peor muestra está mal planteado en geometría degenerada. Frente a navi.613: { "4" } de { "12" } siguen fuera de { "2" } pp (fijado)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (análisis de formato y de marco; interpolación de Lagrange exacta en los nodos y sobre una trayectoria lineal fuera de los nodos; los elementos ICRF toman la reducción IAU { "2015" } y son iguales byte a byte a una aplicación explícita de icrf_to_iau_moon; anomalía verdadera↔media con viaje de ida y vuelta frente a una resolución directa de Kepler; archivos malformados rechazados con el motivo indicado). lunar_service::tests (con <c1/> sin establecer, el conjunto de claves y el SHA-256 del informe quedan fijados; la fila kepleriana es igual a la ejecución kepleriana independiente campo a campo; la identidad σ_required · HPL_max / σ_URE = AL, y luego una nueva ejecución DE EXTREMO A EXTREMO con el requisito calculado que alcanza el { "100" } % de disponibilidad de nivel de protección y una nueva ejecución un { "1" } % por encima que no lo alcanza; cada campo numérico emitido de los dos bloques nuevos recorrido en el JSON producido en busca de una unidad y una clase de procedencia; los fixtures confirmados contrastados con sus tablas de origen satélite por satélite; un horizonte que supera el final de una tabla rechazado); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-1e414b2a33b2 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — El propio documento emitido: cada hoja numérica debe resolverse en una entrada del bloque de unidades de ese documento. No existe ningún registro externo de unidades con el que comprobar una unidad DECLARADA, de modo que una unidad declarada es una afirmación revisada y no verificada: la puerta verifica la COMPLETITUD y la CORRECCIÓN FORMAL, no la verdad, y «validado» sería erróneo porque nada externo confirma que <c1/> sea la unidad correcta para un campo llamado <c2/>. Se ejecutó una comprobación cruzada independiente de sufijos de nombre sobre los { "1,434" } campos descritos EN ESE MOMENTO: de los { "691" } con un sufijo que indica unidad, { "40" } discrepan de la unidad declarada y los { "40" } están explicados (sufijos por segundo, mínimos, segundos de apertura, newton-metros frente a un sufijo que parece nanómetro), por lo que no apareció ninguna unidad errónea. Esa comprobación cruzada no se ha vuelto a ejecutar desde entonces y la cobertura ha crecido más allá de ella: la cifra se deja en lo que realmente se midió en lugar de reformularla con el total actual. En el momento de ese cambio ({ "0.27.0" }), la cobertura pasó de { "7" } de { "56" } tipos de escenario a { "60" } de { "61" }, y de { "389" } de { "1354" } campos a { "1,742" } de { "1,744" } (docs/field-units-schema.json, que una comprobación de obsolescencia mantiene al día). NINGÚN tipo de escenario queda sin cubrir (techo { "0" }, FUT-28, { "0.36" }): el último fue <c3/>, dos de cuyas columnas se identifican por clave del llamante, por lo que sus unidades son datos; ahora se describen como <c4/> y la unidad de cada posición se lee de la propia tabla de unidades del paquete BARRIDO en <c5/> y <c6/> (o se toma de la <c7/> declarada del eje, que debe coincidir con la del paquete cuando existen ambas; null cuando no existe ninguna, indicado en lugar de adivinado). <c8/> fue el anterior, y salió de la lista cuando su documento publicado ganó un bloque de unidades: la fijación de aditividad que había nombrado <c9/> como clave prohibida ahora DEMUESTRA que la adición es aditiva — si se retira de nuevo el bloque, el documento sigue dando el hash de las dos constantes congeladas antes de que existiera, de modo que un valor publicado que se hubiera movido por debajo de la adición seguiría fallando. El trabajo también sacó a la luz doce defectos de unidades o de documentación en código existente, notificados y no corregidos según R1

# text
seg-34bff3218a01 = tests/field_units_global.rs (se ejecutan los { "61" } tipos de escenario registrados, con una forma de documento cada uno: cada hoja numérica debe resolverse en una entrada del bloque de unidades de ese documento; una entrada malformada cuenta como ausente para CADA tipo de escenario, exento o no, de modo que un marcador de posición no compra cobertura; la lista de exenciones no puede superar su techo fijado, un tipo de escenario de la lista que resulte estar totalmente cubierto HACE FALLAR la puerta para que la lista no pueda rellenarse, y un tipo de escenario registrado ausente de la tabla del ejecutor hace fallar la puerta para que un paquete nuevo no pueda colarse sin examinar — lo que ocurrió, detectando los dos tipos de escenario añadidos después de empezar este trabajo; un trinquete unidireccional sobre el atraso de lo descrito pero no definido; y una comprobación de obsolescencia sobre el documento de esquema confirmado); field_schema::tests

# text
seg-8efc76b4ee1d = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Solo coherencia interna: cada emplazamiento añadido es un punto distinto y una medición láser de distancia o un retardo VLBI de estación fija toca un punto, de modo que su información A_p^T M_p A_p es semidefinida positiva y se suma; la prueba comprueba la diferencia de Fisher y cada varianza frente a ello. El resultado de cinco redes es la fila de datos reales existente y no cambia. El reflector añadido reutiliza épocas programadas para las cinco redes existentes, un calendario ILLUSTRATIVE, y la red, el calendario y el sigma de retardo de la baliza añadida son las entradas ILLUSTRATIVE de la campaña del marco lunar; el emplazamiento es una posición polar sur ILLUSTRATIVE. Un emplazamiento polar sur ve la Tierra baja sobre su horizonte o no la ve en absoluto, lo que expresan las pruebas de ángulo de visión existentes; ninguno de los dos emplazamientos se mide con láser de forma continua. Las cifras son cotas de Cramer-Rao para un conjunto reducido de parámetros, no un datum resuelto ni una afirmación sobre ninguna estación real

# text
seg-926c069f8a2e = lunar_llr (sobre lunar_frame_campaign::beacon_information, schedule_for y solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: las listas vacías y el ejemplo de línea base dan el informe y el resumen por defecto byte a byte; an_added_site_never_increases_any_variance: el menor valor propio de H_after - H_before es no negativo con { "1e-9" } del mayor, cada relación de sigma después/antes es como máximo uno y ambos emplazamientos añadidos se observan; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml y scenarios/lunar-station-geodesy-with-station.toml (mismo calendario archivado y mismo bloque de campaña VLBI)

# text
seg-cc6113ce33c0 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Forma cerrada: cada salvaguarda se ejecuta sobre un fragmento defectuoso conocido y fijo que debe disparar la alarma y un fragmento correcto conocido y fijo que debe permanecer en silencio, ambos constantes literales sobre las que el detector no puede influir. Los dos fragmentos defectuosos conocidos son los defectos F22 y F25 en su forma original. Esta es una referencia independiente INTERNA y la fila es MODELLED en consecuencia: demuestra que las salvaguardas distinguen el defecto de su corrección, no que las clases que describen sean exhaustivas. Sus puntos ciegos declarados — un estado compartido que no es una ruta, una fijación contenida en una constante corta con nombre, una condición de carrera rara que tres ejecuciones no muestrean y un recibo que puede falsificar cualquiera que pueda escribir el archivo — están escritos en la documentación del módulo de tests/source_guards.rs y en la cabecera de cada script en lugar de dejarlos para que se descubran.

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } pruebas: ambas salvaguardas sobre todo el árbol de código fuente, más fixtures de mutación que califican cada salvaguarda en ambos sentidos — el patrón F22 notificado en ambas rutas que colisionan, la corrección de secuencia atómica publicada aceptada, una corrección a medias notificada exactamente en la ruta que perdió su componente único, un identificador de archivo temporal y un directorio único heredado aceptados, un reloj de pared rechazado; una fijación no declarada notificada, una declarada aceptada, un ámbito sin exclusión rechazado, una declaración en el comentario de documentación de la prueba envolvente aceptada y que se demuestra que no se filtra a la prueba siguiente; y cada grafía de fijación — hexadecimal, decimal, cadena de resumen, longitud en bytes, recuento de bytes con nombre, archivo golden — detectada, mientras que las constantes de algoritmos, las semillas de RNG y las pequeñas comprobaciones de cardinalidad no lo son)

# text
seg-b99e60173863 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Pruebas de propiedades (monotonía, sin caída en el traspaso) + lint de exponentes frente a holdover::coast_phase_variance

# text
seg-416def055790 = integrity::composed_pl::tests (monotonía, suelo P0, K(IR/2), exponentes, semicontinuidad inferior)

# text
seg-5b20d21462cb = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidad de la envolvente casi segura de forma cerrada √(2Dt·lnln t) + comprobación de dominancia del HPL; junta de imposibilidad de Baweja arXiv:{ "2606.24210" }

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergencia, umbral, dominancia del estrechamiento por IR)

# text
seg-b286777831de = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reproducción independiente con numpy y estadísticas de la biblioteca estándar de la forma cerrada del overbound (InternalConsistency). La serie [UTC-UTC(USNO)] de la Circular T del BIPM es solo una entrada CITADA: es la MISMA serie ya validada para la fila de cobertura de holdover R4 y NO se vuelve a validar aquí; reproducir sus valores no demuestra nada sobre R2. La cola profunda de integridad es modelada. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): en los archivos UTC-UTC(k) por laboratorio del BIPM ({ "102" } laboratorios, { "105 024" } filas con incertidumbres publicadas) el overbound b = { "2.576" } u en la cola de { "1e-2" } es superado por el { "50.8" } % de las filas (Clopper-Pearson { "95" } %: { "50.4" } a { "51.1" } %) y en más de un { "1" } % en { "101" } de los { "102" } laboratorios. La u publicada es la incertidumbre de la determinación por el BIPM de UTC-UTC(k), no una cota del desfase, que habitualmente alcanza muchas veces u; el overbound tal como está especificado no acota el sesgo real de trazabilidad de UTC(k). Ronda { "2" } de { "0.30" }, un overbound de los desfases UTC-UTC(k) realizados, entrenado con datos de la Circular T del BIPM de 2015-2022 y probado con los de 2023-2026 (preregistrado ca0921a4, excedencia agrupada como máximo { "1e-2" }), un hallazgo (sigue siendo MODELLED): la excedencia agrupada es { "0.0333" } ({ "694" } de { "20 826" } filas en { "82" } laboratorios; { "0.0127" } sin las { "430" } filas que no tienen cota por regla). D9 ronda { "3" }, una cota de envejecimiento jerárquica agrupada (utck_bound), preregistrada fb475550 y puntuada de forma prospectiva sobre las emisiones de la Circular T a partir de { "465" }: aún no ejecutada (la emisión { "465" } se publicó el 2026-10-12 con unos { "285" } valores de prueba; la regla preregistrada de 1000 valores necesita emisiones hasta aproximadamente { "468" }, y la ejecución necesita los archivos por laboratorio archivados del 2026-09-30, ya que el BIPM ha reescrito desde entonces { "87" } de los { "113" })

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (condicionada a los datos: se omite con un mensaje cuando falta la serie del BIPM); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 ronda { "3" }, prospectiva, aún no ejecutada: la Circular T { "465" } apareció el 2026-10-12, y la regla preregistrada de 1000 valores necesita emisiones hasta aproximadamente { "468" })

# text
seg-98b92da9ce83 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reproducción independiente con numpy de la covarianza cruzada y de la desigualdad del sesgo fusionado correlacionado frente a independiente (InternalConsistency). Conjunto de fuentes representativo; escenario modelado.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reproducción independiente con numpy del estadístico + prueba de propiedad de que una inyección de modo común lo infla (InternalConsistency). Escenario modelado. Ronda { "2" } de { "0.30" } (preregistrada f9aa360d), bloqueada (sigue siendo MODELLED): numpy { "2.3.5" } LAPACK gesv reproduce el valor del estadístico en { "261" } casos confirmados (con una diferencia de { "3.5e-15" } bien condicionados, { "1.2e-9" } con condición de hasta { "6.1e7" }); la ley nula chi-cuadrado({ "1" }) es un teorema citado y las separaciones por pares planas una identidad sin salida del motor con la que comparar, por lo que la delimitación del alcance queda a la espera de una decisión del responsable

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Estructura geométrica reproducida por el motor más la identidad de Schur 2x2 de forma cerrada; coherente en ESTRUCTURA con Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), cuyas magnitudes informadas NO se reproducen aquí. La clasificación es estructural; las magnitudes de correlación/CRLB bajo geometría real son MODELLED (coordenadas y orientación de los reflectores mantenidas fijas). Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): frente a Sosnica et al. { "2025" }, la correlación origen-escala de Fisher de distancias (-0.993 / -0.988) está dentro de { "0.05" } del -0.97 publicado, pero en la propia geometría de cinco reflectores del artículo la correlación de Helmert de 7 parámetros con pesos iguales es -0.78 (el valor publicado se apoya en errores por reflector que el artículo no imprime), y el CRLB del origen ({ "0.6" } a { "1.2" } mm con un ruido de distancia de { "3" } mm) es de un { "96" } a un { "98" } % inferior a los { "3.07" } cm del artículo frente a una tolerancia del { "20" } %. Magnitudes no reproducidas

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Comprobaciones cruzadas analítico frente a diferencia finita de las parciales de cada técnica (internas); la DIRECCIÓN de la mejora es un hecho geométrico. Las ubicaciones de las balizas, los calendarios y el ruido son MODELLED/representativos (véase tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (parciales analíticas de LLR/VLBI/orbitador frente a diferencia finita); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transversal frente a radial mediante crlb_diag)

# text
seg-b5169f1f17d9 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — El cálculo se comprueba internamente: cada parcial analítica frente a una diferencia finita, y el caso de datum cero frente a la distancia nominal. El CATÁLOGO se comprueba externa e independientemente: las coordenadas de ejes principales de DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) se contrastan con la Tabla { "6" } del memorando de coordenadas de superficie de DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, extraído automáticamente de un PDF con SHA-256 verificado mediante tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) y coinciden con una diferencia de { "1.12" } m, mientras que la realización de Tierra media de las mismas cinco redes difiere en { "672" } a { "871" } m. La ESTRUCTURA DE DEGENERACIÓN se comprueba frente a un resultado publicado: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, que informa, para el marco lunar de ejes principales, de un coeficiente de correlación entre la X del lunocentro y la escala de r = -0.97, y de que el LLR no logra alcanzar el centro de masas real de la Luna con una exactitud mejor que { "12" } cm a causa de esa correlación. Este módulo recupera la misma estructura (|corr(t_x, scale)| entre { "0.9" } y { "0.9999" }, defecto de datum <= { "1" }) a partir de un diseño de Fisher solo con LLR. La corroboración se da entre efemérides, no es un viaje de ida y vuelta: el artículo combina INPOP21a, DE430 y EPM2021, mientras que este módulo se alimenta de la libración de DE440. Lo que NO se reproduce es la magnitud: la correlación aquí es de aproximadamente -0.988 frente a su -0.97, y el CRLB de 4 parámetros es submilimétrico frente a su suelo alcanzado de { "12" } cm, porque aquí la orientación y las coordenadas de los reflectores se mantienen fijas y allí se resuelven. Solo geometría y estructura de degeneración; ninguna afirmación de exactitud sobre un datum resuelto. Comparación externa { "0.30" }: las partes de distancia medida de este módulo (reflectors(), stations_itrf(), la colocación PA de DE440 y el tiempo de luz baricéntrico llr_bcrs_one_way_m) se validan en su propia fila, LLR measured-range model, frente a { "192" } puntos normales del ILRS (RMS { "2.81" } m frente a { "10" } m). Esta fila sigue siendo MODELLED porque la comparación medida no ejercita el resto de su afirmación. El catálogo de estaciones geodésicas stations() redondea APOLLO a { "0.001" } grados; con un tiempo de luz geocéntrico da { "22.7" } m sobre los mismos puntos (prueba reflector_ranges_against_ilrs_normal_points; { "96" } m con la interpolación de orientación elemento a elemento anterior). Las parciales analíticas de distancia y el Fisher solo con LLR se calculan mediante llr_range_m y reflector_inertial con la serie analítica de la Luna (ephem::moon_position, a unos { "0.3" } grados del GCRS) y sin tiempo de luz

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Fisher marginal por complemento de Schur de la matriz de información acoplada, en álgebra lineal de forma cerrada, comprobado frente a los dos regímenes límite que predice. La equivalencia de { "1" } m a { "3.336" } ns es la definición del metro mediante c y no es un resultado empírico. Las redes de observación son una geometría modelada representativa, de modo que la ley de diseño es una afirmación sobre la geometría que se le presenta y no hace ninguna afirmación sobre ninguna red lunar desplegada.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La aditividad de la información de Fisher entre mediciones independientes es una propiedad de forma cerrada, comprobada aquí frente a una suma elemento a elemento escrita de forma independiente y frente a la invariancia de orden y la monotonía que se derivan de ella. NOTA SOBRE LA EVIDENCIA: el combinador antes no tenía ninguna prueba, y la única prueba del módulo sumaba las dos matrices de información en línea en lugar de llamarlo, de modo que un combinador roto habría dejado el módulo en verde; ahora la prueba pasa por combine y falla cuando se muta. Todas las ubicaciones de balizas, la geometría del orbitador, las precisiones por técnica y los costes relativos son elecciones representativas y no valores de misión (véase tests/fixtures/llr_geometry/NOTICE.md), de modo que cada métrica de degeneración y cada cifra de CRLB alcanzada a través de este menú hereda el estado modelado de lunar_identifiability::decompose.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - una selección vacía da la matriz cero, una selección única es la identidad, un par es igual a una suma elemento a elemento escrita de forma independiente, y el resultado es invariante respecto al orden de selección; adding_a_block_never_reduces_the_degeneracy_metric - monotonía bajo información añadida; radial_diversity_beats_transverse_for_breaking_the_degeneracy - el bloque del orbitador de la cara oculta eleva la métrica de degeneración más que el bloque VLBI transversal)

# text
seg-66020d555be6 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Cota triangular del peor caso sobre la acción del jacobiano de punto de Helmert (forma cerrada)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotonía en el presupuesto; reducción del presupuesto RSS bajo un CRLB por proveedor; tolerancia de rotación resuelta en el brazo de palanca lunar; término vinculante = rotación)

# text
seg-da0791f2edc4 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Agregación RMS de las divisiones por pares validadas bajo cada convención (forma cerrada)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris pone a cero el presupuesto; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } en las divisiones reales; ordenación de convenciones)

# text
seg-303947e00325 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Instanciación geométrica de la cota de spark por bloques / estimación segura del estado (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; spark por bloques de Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NO el umbral de consenso 3f+{ "1" } de Lamport–Shostak–Pease («Byzantine» nombra únicamente el MODELO de fallo arbitrario/colusorio). El número concreto de fallos tolerados es una propiedad modelada de la geometría representativa de la red, comprobada en cuanto a autoconsistencia mediante casos analíticos construidos a mano y las fórmulas de recuento

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (bloque no nulo pero de rango deficiente ⇒ block_spark { "1" }, f_detect { "0" }; columnas independientes ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (un par que posee todas las mediciones de un nodo = un error de desfase de reloj ∈ range(G), indetectable, con un claro salto espectral de Gram), byzantine_redundant_net_identifies_at_least_one (seis pares independientes de una sola medición ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (los casos manuales con P⊥ = I fijan f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-c4b1731814f5 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Argumento de parámetro libre del tiempo de conjunto (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanciado sobre la red representativa por nodo con DE440 real: una prueba nula de residuo relativo del generador analítico de tasa común frente a GᵀWG, con el contraste de desempate que distingue el calibre genuino de un artefacto del modelo de oscilador. Geometría modelada representativa, no un presupuesto de temporización certificado

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (red autorreferencial: la tasa común está en N(GᵀWG), temporal_gauge_dim { "2" }; tras una fila externa de enlace de tasa: tasa expulsada del calibre, temporal_gauge_dim { "1" } con el desfase común subsistiendo)

# text
seg-1b1f761bd9a9 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Álgebra de forma cerrada de proyector de paridad / pseudoinversa sobre la red representativa por nodo con DE440 real: la división común/diferencial, la unificación N(G) ⊕ range(G) y la pendiente de la brecha de protección de Brown ({ "1992" }) se derivan todas de la anulación del rango P⊥·G = { "0" }. Geometría modelada representativa, no un nivel de protección certificado

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (sesgo común indetectable, diferencial detectable), slope_infinity_in_range_finite_detectable (g7: pendiente ∞ para b ∈ range(G), finita para b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, el calibre de 8 dimensiones es todo el espacio nulo con un salto espectral >{ "1e6" })

# text
seg-1ac1dc1c053d = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Transcripción de las Recomendaciones nombradas (descargables libremente desde itu.int), con cada límite acompañado de su tabla o cláusula, enumeradas con cada elemento sin confirmar o sin implementar en docs/TELECOM-TIMING.md; las identidades de continuidad en los puntos de ruptura que implican las tablas se comprueban en las pruebas. Una transcripción de normas con comprobaciones de coherencia interna, no una prueba de ajuste a la norma ni una validación externa. Ronda { "2" } de { "0.30" } (preregistrada 970003ee), bloqueada (sigue siendo MODELLED): los diez valores de máscara y los trece valores de holdover de ePRTC-A que las Recomendaciones imprimen como números resueltos (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } y Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 a 7-4) se reproducen con una diferencia de menos de media unidad impresa, la mayoría de ellos constantes de tabla o puntos de ruptura; G.8271.1 Fig. 7-2 rotula { "200" } ns a { "1.3" } s frente a su propia Tabla 7-1 ({ "197.5" } ns). Los límites de clase A-D de G.8273.2 no tienen ningún valor resuelto impreso, y las etiquetas de los puntos de ruptura con enganche de ePRTC de G.8272.1 (sobre líneas de construcción continuas) se excluyeron por la regla de selección preregistrada, por lo que siguen siendo transcripciones

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — extremos abiertos y cerrados, el intervalo τ = { "400" } s de la Tabla 7-3 de G.8271.1, continuidad en cada punto de ruptura que implican las tablas; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Transcripción de las Recomendaciones nombradas (descargadas de itu.int el 2026-10-13), con cada fila releída frente al texto, y con la continuidad en los puntos de ruptura que implican los coeficientes impresos acotada en las pruebas (por ejemplo { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns frente a la meseta de { "100" } ns de la Tabla { "4" } de G.812). Una transcripción de normas con comprobaciones de coherencia interna, no una prueba de ajuste a la norma ni una validación externa. G.812 (06/2004) figura como sustituida por una edición 08/2026 prepublicada y G.811 tiene una Amd. { "1" } (04/2016); ninguna pudo leerse, por lo que ninguna está comprobada. El escenario de OCXO en funcionamiento libre sobrestima la contribución del oscilador en intervalos de observación largos frente a la constante de tiempo de un lazo; no dice nada sobre el reloj de ningún equipo

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Preregistrado en tests/fixtures/clock_log/PREREGISTRATION.md (confirmado en solitario, 159334f2, antes de que existiera el fixture); registrado en RESULTS.md. Tres registros sintéticos con semilla, uno por formato (un hueco de TICC de tres épocas, un segundo reloj RINEX que hay que ignorar), leídos de nuevo por un lector independiente escrito a partir de docs/CLOCK-LOG-FORMATS.md por el mismo autor: los recuentos de cuadrícula, huecos y relleno son iguales y la mayor diferencia de fase es { "0" } s (umbral { "1e-13" } s). oadev, tdev y mtie de allantools { "2024.6" } sobre esa fase coinciden con una diferencia relativa de { "2.5e-14" } (umbral { "1e-10" }) en cada factor de promediado que evalúa; no evalúa MTIE sobre todo el registro, que es lo que notifica el motor, de modo que ese punto por registro no tiene valor de referencia independiente y el umbral tal como está formulado no se alcanza ahí. MODELLED: registros sintéticos, y la referencia independiente del lector comparte autor; no se compararon archivos de reloj reales de TimeLab, TICC y RINEX procedentes de instrumentos

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (tipo de escenario clock [clock_log])

# text
seg-df411365b9ab = clock_log::tests (registros escritos a mano por formato: cabeceras, separadores, unidades, integración de frecuencia, canales y modos de TICC, huecos y políticas, rechazos); tests/clock_log_allantools.rs (la comparación preregistrada: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Fixtures escritos para Kshana a partir de los formatos de línea públicos de los daemons, con valores inventados (NOTICE.md en la carpeta del fixture); no se leyó ningún registro de una instalación real y ninguna referencia independiente compara el análisis con otro lector, de modo que un formato que difiera entre versiones del daemon aún puede rechazarse o leerse mal. Los estimadores alimentados por la serie de fase son los validados frente a allantools en las filas anteriores

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) sobre los fixtures en tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Cálculo manual sobre registros construidos a partir de fórmulas cuya pendiente, escalón, extremo y tiempo de recuperación se conocen antes de la ejecución (las pruebas los indican), y las máscaras, la envolvente y los presupuestos de las filas de temporización de telecomunicaciones anteriores. No se puntuó ninguna medición de laboratorio de un holdover real ni se comparó ninguna referencia independiente externa, de modo que el tipo de escenario no hace ninguna afirmación sobre ningún reloj ni sistema; se necesita un socio de laboratorio de temporización antes de poder promover cualquier cifra por clase de reloj

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — El folleto del Volumen de Servicio Espacial del ICG (UN OOSA ST/SPACE/75, { "2018" }), que es en sí una simulación, comparado bajo un preregistro confirmado antes de la ejecución (xval/gnss-ssv/PREREGISTRATION.md; resultados en xval/gnss-ssv/RESULTS.md, fijados por tests/ssv_booklet_results.rs, fallos incluidos). Ejecución { "1" } con la lectura preregistrada: las constantes de potencia radiada mínima y el umbral lunar coinciden (S0 y S6 alcanzados); los umbrales del SSV superior e inferior, del umbral de RF, de GEO y de HEO son NOT MET, casi todos por GLONASS, para el que el folleto da { "20" } y { "28" } grados en las tablas B2 y B6 y { "26" } y { "34" } grados en la tabla { "4.2" }. Una variante de diagnóstico con los ángulos de la tabla { "4.2" } coincide en todas las celdas del SSV superior, del SSV inferior y de las seis misiones GEO (no sustituye a la ejecución { "1" }; las celdas de RF, HEO y lunares siguen sin coincidir). Los patrones medidos de los paneles de GPS L1 no se reproducen con el sustituto paramétrico (RMS de { "6" } a { "9" } dB frente a un umbral de { "3" } dB). La coincidencia muestra que se reproduce el método indicado en el folleto, no que las señales GNSS se comporten así

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas y magnitudes publicadas en las pruebas (el pico de una capa de Chapman y la curvatura del limbo de la superficie, unos pocos TECU de plasmasfera en un rayo de GPS a GEO); el diseño del receptor reutiliza los modelos de adquisición y de lazo de seguimiento y sus pruebas. No se compara con ningún dato medido de sondeo del limbo ni de recepción de señal débil

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Verdad simulada frente a la estimación propia del filtro (el error de estimación normalizado al cuadrado medio de un filtro consistente es de aproximadamente { "3" } para la posición) y determinismo para una semilla fija. No se compara con ningún dato GNSS de vuelo ni registrado en órbita alta; el Sol y la Luna son sustitutos circulares de baja precisión

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La misma verdad simulada que el filtro absoluto: el error del filtro relativo frente al estado relativo verdadero, y la comprobación de que lo hace al menos igual de bien que restar dos fijaciones absolutas independientes. No se compara con ningún dato de formación en vuelo

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Cada forma cerrada frente a una ruta numérica independiente en las pruebas (cuadratura en el dominio de la frecuencia de la función de transferencia exacta y del filtro de retardo, un Monte Carlo sobre átomos para el sesgo del frente de onda, un Monte Carlo sobre disparos para el índice de franjas) y sus casos límite. Un valor resuelto publicado: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) indican que con tau_R = { "20" } us se necesita un ruido de fase Raman blanco inferior a -111 dB rad^2/Hz para { "1" } mrad por disparo; el término blanco por sí solo da { "0.99" } mrad (el artículo deriva el nivel con su Ec. { "17" }, flicker más blanco). Coherencia interna y un valor resuelto, no una validación externa; no se modelan las aberraciones de orden superior ni el ruido de ningún láser concreto

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Las cuatro hojas de datos nombradas de Microchip (números de documento y URL en cada preajuste y en docs/TELECOM-TIMING.md) para las cifras de entrada; la rampa de envejecimiento de forma cerrada y la propiedad de envolvente del ajuste como comprobaciones internas. Cómo se convierten las cifras en un modelo de ruido — el ajuste, la regla del suelo, el mes de 30 días, la lectura lineal de la temperatura — es una decisión de modelado; ningún preajuste es una medición de una unidad. Ronda { "2" } de { "0.30" }, umbrales unilaterales frente a unidades medidas (preregistrada a01c491c), un hallazgo (sigue siendo MODELLED): la estación IGS THU2 Symmetricom 8040C en los relojes finales MGEX de la ESA tiene una desviación de Allan de { "0.35" } a { "0.87" } de la del preajuste de rubidio pero un error de holdover de { "1.07" } a { "1.60" } de él; el registro del 5071A queda fuera del preajuste de cesio hasta { "1000" } s (ruido de fase blanco de medición, 30x a { "1" } s) y en holdover ({ "1.15" } a { "8.74" }); el peor SA.45s de producción de { "2011" } es 1.26x el preajuste CSAC a { "1" } s; el OX-208 no tiene ningún registro medido (bloqueado)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — la rampa de envejecimiento discreta dentro del { "0.1" } % de (1/2)·D·t² a lo largo de un día; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas para cada término por separado y la búsqueda independiente de raíz de holdover::holdover_seconds; las cifras de la hoja de datos son los documentos nombrados (docs/SLOT-TIMING.md). El valor por defecto de una clase se apoya en un suelo de ruido rojo supuesto y una fuente de hoja de datos es una envolvente de máximos, por lo que ninguna de las dos es una medición de ninguna unidad

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } relojes de satélites GPS Block IIF, { "14" } días de relojes finales del IGS: { "8" } dentro del umbral de { "1.5" }, G25 y G30 optimistas hasta aproximadamente 2x, fijado); tests/slot_timing_ocxo_holdout.rs (un OCXO medido: la predicción reservada nunca es optimista, de { "0.59" } a { "0.70" } de la superación medida; dentro de la muestra, de { "0.98" } a { "1.17" }; sin el término de frecuencia de fijación, la predicción dentro de la muestra es optimista en cada umbral); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — cada clase frente a holdover::holdover_seconds con { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reducción al nivel de protección de temporización existente y a las formas cerradas de visibilidad de órbita circular y Tierra esférica. Condicionado a la detección, un suplantador terrestre con una tasa de rampa indicada, un paso por encima en una Tierra que no rota; no validado sobre un receptor suplantado en órbita

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exactamente tpl::timing_protection_level_ns cuando el reloj no tiene término de flicker, de fase blanca ni de recorrido aleatorio; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reducción a la ecuación antiinterferencia y al presupuesto de enlace del tipo de escenario <c1/> existente (el mismo código, invocado con las mismas entradas), y la forma cerrada del suelo de ruido k T0 F. Los espectros de señal subyacentes son los de la fila validada anterior; las potencias del interferente, la cronología y los anchos de banda del front-end son entradas del escenario, los espectros son continuos (sin líneas de código de ensanchamiento) y ninguna regulación automática de ganancia, supresión o diagrama de antena actúa sobre el interferente. No hay en el repositorio ningún espectro interferido medido con el que comprobar el compuesto. La tabla de Q del tipo de escenario <c2/> (CW y banda estrecha { "1" }, banda ancha y barrido { "2" } desde { "0.36" }: los valores de los manuales, fijados a las formas cerradas de navsignal) coincide con el valor CW de este modelo y difiere de lo que este deriva para ruido adaptado a C/A ({ "1.5" }) y para ruido plano de nulo a nulo sin normalización en banda ({ "2.2" }); el informe imprime ambos

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S igual a jamming::j_over_s_db y C/N0 efectivo igual a jamming::effective_cn0_dbhz con Q = 1/(R_c kappa) con una diferencia de { "1e-9" } dB, y el ancla de { "32.105" } dB de la propia prueba del tipo de escenario jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Medido frente a JPL Horizons DE441 (los mismos fixtures confirmados), pero no validado: las cifras indicadas en la Tabla { "1" } para Urano y Neptuno se superan hasta en { "2.0" } y { "5.2" } veces frente a las posiciones heliocéntricas de DE441 (Neptuno las satisface frente a posiciones baricéntricas, lo que sugiere que el ajuste no era heliocéntrico), la página no indica ningún error para Plutón y no existe ninguna cota publicada para las velocidades. Las Tablas 2a/2b satisfacen sus propias cifras para Urano y Neptuno y están cubiertas por la fila validada

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fijado en { "2.04" } y { "5.16" } veces el error nominal de longitud, por debajo de seis veces; pluto_from_the_1992_row_is_measured_not_validated: dentro de { "39" } segundos de arco y { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: peor caso { "3.7e-3" } de la velocidad); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Medido frente a las efemérides de satélites de JPL Horizons (DE441, MAR099, JUP365, SAT441) confirmadas en tests/fixtures/solar_system/horizons_satellites_icrf.csv con la consulta y la fecha de obtención; no existe ninguna exactitud publicada para los elementos medios ni para la colocación con el modelo de rotación, por lo que los umbrales fijados detectan regresiones y no validan. Los elementos medios omiten las perturbaciones resonantes y solares, y la aceleración secular de Fobos no está modelada

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: peor error angular visto desde el planeta entre { "2000" } y { "2040" }, Fobos { "5.65" } grados, Deimos { "0.38" }, Ío { "0.40" }, Europa { "1.63" }, Ganímedes { "0.22" }, Calisto { "0.27" }, Titán { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } grados); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-d0dd931332c8 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Transcripción de constantes publicadas, cada una citada donde se define: parámetros gravitacionales de los registros de cuerpos de JPL Horizons y de la tabla de parámetros físicos de satélites de JPL, radios de las tablas de parámetros físicos de JPL (IAU WGCCRE { "2015" }), polos y meridianos de origen del Grupo de Trabajo de la IAU sobre Coordenadas Cartográficas y Elementos Rotacionales (valores medios, sin los términos de tasa T ni periódicos), J2 de Smith et al. { "2012" }, Iess et al. { "2018" } y { "2019" }, y Jacobson { "2009" } y { "2014" }. Comprobado en cuanto a coherencia interna (el periodo de rotación de Júpiter frente a la tasa del Sistema III, cada J2 frente a su radio de referencia), no frente a una referencia independiente externa. Ronda { "2" } de { "0.30" }: los valores de GM se adoptaron de gm_de440 y los elementos de Fobos y Deimos de pck00011, de modo que { "0" } de { "84" } constantes de los catorce cuerpos añadidos difieren ahora de NAIF (antes { "12" }), lo que es una comprobación de transcripción y no se cuenta. { "0.36" }: la orientación IAU fija al cuerpo y el GM de los catorce cuerpos añadidos se separan a su propia fila VALIDATED («IAU body orientation and gravitational parameter of the fourteen added solar-system bodies»); esta fila conserva lo que queda. J2 y el radio medio están citados, no validados; las posiciones del informe se apoyan en sus propias filas; y el prime_meridian_deg del informe para la Tierra, la Luna y Marte sigue sobre constantes convencionales (hasta { "6.6e-3" }, { "2.8e-2" } y { "9.6e-4" } rad respecto de IAU_<BODY>). Revisiones de { "0.30" }: GM de Fobos { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Urano { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuno { "6.83509997e15" } -> { "6.835103145462294e15" }, Plutón { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; radio ecuatorial de Fobos { "13.1" } -> { "13.0" } km; prime_meridian_deg incluye ahora los términos cuadrático y periódicos

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas y autoconsistencia: la tercera ley de Kepler para el periodo del relé, el radio de órbita y el radio de superficie mantenidos a lo largo de la ejecución, el hecho de que añadir una medición nunca aumenta la incertidumbre formal, y los errores con semilla coincidiendo con la covarianza. Las órbitas de los relés ignoran los terceros cuerpos (no se modela la atracción de Júpiter sobre los relés alrededor de Europa), el ruido es gaussiano con los niveles indicados y el modelo de medición es instantáneo, por lo que esto no está validado frente a los datos de navegación de ninguna misión

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: la raíz cuadrática media de cada error de fijación sobre su propio sigma formal en [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna: el barrido de elevación por fuerza bruta, las reducciones calculadas a mano y con orbit::dop, y la geometría de forma cerrada de Walker y geosíncrona. Órbitas de dos cuerpos con un J2 secular opcional, un cuerpo esférico con la vertical local a lo largo del radio, solo visibilidad geométrica (sin potencia de señal, estado de salud del satélite, terreno ni perturbación de terceros cuerpos), y la fase relativa entre sistemas tomada de épocas de referencia distintas, de modo que no es una instantánea de ninguna fecha. Revisión de { "0.30" }, un hallazgo (sigue siendo MODELLED): los preajustes satisfacen los suelos publicados unilaterales de disponibilidad de DOP (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) al { "100" } %, pero con el PDOP del motor duplicado en una copia de trabajo siguen satisfaciéndolos (peor punto { "99.36" } %), de modo que los suelos no pueden detectar ni siquiera un error del { "100" } % en la magnitud que calcula esta fila; endurecerlos después de la ejecución sería una tolerancia a posteriori. La promoción requiere una comparación bilateral de valores de DOP sobre una geometría idéntica con una tolerancia fijada de antemano. Ronda { "2" } de { "0.30" } (tests/coverage_dop_full_oracle.rs, preregistrada add671d6), un hallazgo (sigue siendo MODELLED): las posiciones, elevaciones, acimuts y trazas terrestres de Orekit { "12.2" } con GDOP/PDOP/HDOP/VDOP de gnss_lib_py { "1.0.4" } (reloj común) y una inversa de numpy (un reloj por constelación) coinciden en todos los umbrales en las constelaciones Galileo, GPS, BeiDou, Galileo+GPS (un reloj cada una) y un diseño terrestre de 1584 satélites (DOP con una diferencia relativa de { "2e-14" }, fijación idéntica, recuentos de disponibilidad y de visibilidad idénticos). En los diseños de la Luna y de Marte coinciden los elementos, las posiciones, la visibilidad y las trazas, pero el DOP supera el umbral relativo fijado de { "1e-9" } en celdas cuyo mayor PDOP es de { "1434" } o más (hasta { "8e-6" }), y { "4" } celdas difieren en una época de fijación en una geometría numéricamente singular (pivote del motor { "1e-10" } frente al rango de numpy), por lo que la fila no está validada. Revisiones de { "0.30" }: el reloj de referencia de TDOP/GDOP es ahora la constelación de menor numeración a la vista (GDOP máximo global de constellation-multi-gnss-coverage { "2.2236" } -> { "2.1205" }, media { "1.122" } -> { "1.131" }), y los recuentos de visibles por constelación se suman como enteros

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — cada mapa y contador es igual a un barrido con la prueba directa de elevación; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satélites, imprime el tiempo de ejecución y las pruebas de pares conservadas; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (solo comprobación de regresión); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regresión)

# text
seg-41b300bb888a = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidades de composición frente a las ejecuciones independientes de los mismos tipos de escenario: una campaña de una fase reproduce la salida independiente bit a bit, el desfase arrastrado es igual a la última muestra propia de la ejecución anterior, y la fase terminada por end_at tiene exactamente como duración el tiempo de detección de la ejecución. El arrastre aditivo a través del límite de una fase y la retención de orden cero son decisiones de modelado, y cada fase es tan buena como el tipo de escenario que la ejecutó; ninguna misión encadenada se ha comprobado frente a una medida

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — el resultado del miembro idéntico byte a byte a la ejecución independiente y cada valor alineado igual a la serie independiente; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La forma cerrada del paseo aleatorio de fase bajo ruido blanco de frecuencia, varianza q_wf tau (NIST Technical Note { "1337" }), para la maquinaria estadística, y la igualdad byte a byte con las ejecuciones independientes para la siembra. Comprueba la aritmética del conjunto sobre el propio modelo de reloj del motor, no un conjunto de datos externo

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } semillas de un reloj de ruido blanco de frecuencia en avance en inercia tau = { "3010" } s: la media verdadera { "0" } dentro del intervalo notificado, la semianchura del intervalo dentro del { "25" }% de { "1.96" } sigma/sqrt(n), y la varianza muestral dentro del intervalo chi-cuadrado bilateral del { "99" }% de sigma = sqrt(q_wf tau) = { "16.459" } ns; conjunto de calibración (CAP-10, preregistrado ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): sobre { "200" } conjuntos independientes el intervalo cubre la media verdadera en { "192" } (dentro de la región del { "99" } % de Binomial({ "200" }, { "0.95" }) [{ "181" }, { "197" }]) y la comprobación chi-cuadrado se supera en { "196" }, mientras que la tolerancia de percentil de una sola semilla (p05 y p95 dentro de { "0.3" } sigma) se supera solo en { "183" } de { "200" }, NOT MET frente a los { "190" } preregistrados, una comprobación frágil ante la semilla registrada y no relajada; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidad de composición frente a la ejecución independiente. La aritmética de condiciones compartidas es contabilidad; la física es la de los tipos de escenario miembros, cada uno con su propia fila

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — una composición de un miembro lee el número independiente y el resumen del resultado)

# text
seg-ef402841914e = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Solo interno: la forma cerrada exacta -20 log10(range) de la ecuación de enlace, una cuadrícula independiente de fuerza bruta sobre el mismo tipo de escenario y la función de Rosenbrock. El umbral de 1-D de la ronda { "1" } es NOT MET (el recuadro preregistrado excluía la solución de { "3" } dB; el optimizador se detuvo en el límite), registrado en docs/design/evidence/cap32-optimize/RESULTS.md y no vuelto a puntuar. El óptimo es local al recuadro y al punto de partida; no se afirma ningún óptimo global

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (preregistrado fbe6c8b3 y, tras un fallo de protocolo en la ronda 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — resolución de objetivo 1-D con una diferencia de { "6.1e-15" } respecto de r* = r0 { "10" }^((m(r0) - { "3" })/20) en { "96" } evaluaciones; p3_prime_contour_target_grid_and_nelder_mead y p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — el mejor resultado del método de cuadrícula igual bit a bit a un bucle independiente de fuerza bruta de { "41" } x { "41" } sobre run_toml, con Nelder-Mead al menos igual de bueno en { "177" } y { "161" } evaluaciones; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, que fija el fallo registrado de la ronda 1); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } en { "234" } evaluaciones; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Las formas cerradas validadas de las dos filas anteriores, la identidad de falsa alarma de ley cuadrática P_d(snr = { "0" }) = P_fa y el tiempo medio de adquisición de Holmes, y la reducción a la propia cadena SSC del tipo de escenario spectrum (el mismo código Jammer::ssc). Los diseños en sí son entradas: los preajustes marcados REPRESENTATIVE o WORKSHOP no son especificaciones publicadas, los espectros de QPSK Feher mejorado, de modulación por desplazamiento de código y de OFDM son aproximados, y las comprobaciones de forma comparan formas, no niveles calibrados.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (cada escenario incluido agnóstico del sistema se ejecuta sin datos del workshop, las relaciones ionosféricas del intercambio de bandas son iguales a (f_ref/f)^{ "2" } y sus diferencias de espacio libre a { "20" } log10(f/f_ref), el jitter en el C/N0 de referencia se sitúa entre su cota de Gabor y su forma de banda ilimitada, las comprobaciones de forma E5 del escenario con parámetros del workshop son coherentes cuando ese archivo está presente, y ningún archivo fuente compila ese archivo)

# text
seg-c83f81eb8726 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Reducción a la cadena de espectro existente y a la ecuación antiinterferencia del tipo de escenario jamming (una banda de un solo componente da los mismos números que antes de la extensión) y a los espectros de señal de las filas validadas. Las potencias del interferente, la cronología, los anchos de banda del front-end y las señales diseñadas son entradas, y una señal diseñada se trunca en su banda de transmisión (sin emisión fuera de banda).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (la cascada multibanda se ejecuta con cuatro paneles, los interferentes de UHF, banda L5, S y C deniegan cada uno solo su propia banda, y una ejecución de banda simple no cambia con la extensión); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas y autoconsistencia: las identidades de velocidad de distancia y de aceleración de distancia frente a derivadas numéricas, la ganancia isoflujo que cancela el crecimiento de la distancia, los límites de pérdida de polarización de los manuales, la observación cualitativa LEO frente a GNSS (un paso en forma de campana de minutos con un pico de varios dB por encima de portadoras GNSS planas de 44-51 dB-Hz). Las EIRP y los diagramas son potencias recibidas publicadas convertidas en una EIRP o elecciones representativas, el término gaseoso es el método simplificado P.676-10, ya sustituido, y nada se compara con un C/N0 de LEO medido

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: por debajo de { "0.01" } Hz y { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-d9e965c108ea = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Transcripción de las cifras públicas citadas y una comprobación de coherencia: una EIRP fijada a partir de una potencia mínima recibida publicada predice el máximo publicado con una diferencia de { "0.5" } dB con un diagrama plano. Es una comprobación de la dispersión de distancia, no una validación de la antena de ningún satélite; los preajustes representativos no hacen ninguna afirmación sobre un sistema real

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: con una diferencia de { "0.5" } dB respecto de -139.1 y -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna de un modelo de diseño indicado: cada potencia, umbral y elección de búsqueda es una entrada, y el modelo ignora la ambigüedad de borde de bit, la detección fallida y la readquisición. No se compara con ningún receptor medido

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna (la identidad de salto y la cota del cono frente a un muestreo de fuerza bruta). El umbral es una entrada; no se fija ningún requisito publicado de continuidad para LEO

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (el salto de distancia de cada conmutación es igual al cambio en el error de distancia, y un ajuste corregido de { "300" } s actualizado cada { "150" } s supera un umbral de { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (la forma cerrada acota un muestreo denso del cono)

# text
seg-bae9c4665c45 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidades de ida y vuelta y el propio presupuesto. El formato es propio de Kshana, modelado sobre los componentes de mensaje publicados y el conjunto de campos del ICD de Galileo; no es la disposición de bits de Celeste ni de ningún otro sistema (ninguna es pública), de modo que no hay ninguna disposición externa frente a la que validar

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (cada modelo a { "2" } mm del mensaje exacto tras decodificar, recodificación idéntica bit a bit, un bit invertido rechazado por el CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Viajes de ida y vuelta y aritmética de calendario. RINEX { "4.02" } no define ningún registro de navegación LEO (IGS RINEX { "4.02" }), de modo que la disposición es una extensión documentada con arXiv { "2401.17767" } citado como antecedente; no existe ningún lector externo con el que comprobarla

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (cada modelo a { "0.1" } mm tras el bloque de texto, el CSV exacto)

# text
seg-9c1e46397382 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Hechos del modelo ATOMIC de InsideGNSS (polinomio de 6.º orden, aproximadamente un minuto de validez, refresco de { "30" } s, reloj dirigido, error de reloj de { "24" } cm). Son hechos descriptivos sin cifras publicadas con las que comparar. La tabla de cinco altitudes imprime el SISRE de Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } y { "0.75" } cm a { "320" }, { "475" }, { "786" }, { "966" } y { "1336" } km en un arco de 20 minutos) junto al ajuste de Kshana sobre su propia órbita integrada ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } y { "0.51" } cm; relaciones de { "0.46" } a { "0.77" }), sin fijar, porque el artículo ajustó órbitas precisas reales y las verdades difieren. El modelo de 22 parámetros y su ajuste están validados frente a órbitas reales en la fila Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. Revisión de { "0.30" }: las cifras de la tabla cambiaron con el ajuste según la convención del artículo (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna: recuperación sin ruido, la identidad cinemática rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivada numéricamente, Doppler cero en la máxima aproximación, la solución especular de un solo paso y errores con semilla frente a la covarianza formal. La cifra de Starlink de Kozhaya, Saroufim y Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: unos { "2" } m en { "20" } s con tres satélites) es solo una comparación: el receptor modelado, con unas efemérides perfectas y todo el error en un sigma Doppler de { "30" } Hz, es varias veces menos exacto en la misma ventana, y no se reproducen el receptor ni la tasa de medición del artículo

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: hasta { "1" } mm y la deriva hasta { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: el RMS del residuo ponderado en [{ "0.8" }, { "1.2" }] y el error por debajo de cuatro sigmas formales); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (un proxy preregistrado frente a los percentiles publicados del conjunto de datos 3 de "Unveiling Starlink for PNT", doi:10.33012/navi.685: con { "3" } satélites (máscara de { "47" } grados), sin ayuda de altura y { "30" } Hz, el error 3-D p90 es de { "92.2" } m a { "20" } s y de { "870" } m a { "8" } s frente a los { "2" } m y { "10" } m publicados, de modo que ambos umbrales de factor dos son NOT MET, por el lado alto, y se afirman como no alcanzados; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Un DOP de cuatro satélites derivado a mano (un satélite en el cenit y tres en el horizonte a { "120" } grados entre sí, cuya matriz normal se invierte a mano), la identidad estructural de que un sistema con su propio reloj y un satélite no añade geometría, la recuperación sin ruido de posición, reloj y sesgo, y errores con semilla frente a la covarianza. Solo comprobaciones internas; no se compara con la salida de ningún receptor. Comparación externa { "0.30" }, un hallazgo (sigue siendo MODELLED): en un día IGS multi-GNSS (ABMF 2018-05-13, C1C de GPS y Galileo, efemérides de difusión, Klobuchar) el sesgo entre sistemas coincide con RTKLIB v2.4.2-p13 rnx2rtkp (diferencia mediana -0.11 ns tras la corrección de retardo de grupo de difusión de { "0.30" }, -0.35 ns antes; umbral { "1" } ns), pero solo el { "93.6" } % de las { "280" } épocas ({ "93.2" } % antes de la corrección) están a menos de { "3" } m de la coordenada ITRF2020 frente al { "95" } % preregistrado. El propio RTKLIB alcanza el { "88.2" } % con los mismos datos, de modo que el umbral queda más allá del posicionamiento de difusión monofrecuencia en esta estación y este día y no se debe a una discrepancia del solucionador; la prueba de comparación está confirmada como ignorada. Ronda { "2" } de { "0.30" }, entradas más estrictas con el umbral sin cambios de { "3" } m / { "95" } % / { "1" } ns, un hallazgo (sigue siendo MODELLED): con el par libre de ionosfera E1/E5a de Galileo (preregistrado { "6927e039" }) el { "79.9" } % de las épocas están a menos de { "3" } m (RTKLIB { "67.9" } %); con órbitas, relojes, desfases de antena de satélite y sesgos de código precisos de CODE MGEX (preregistrado 7d8c3597) el { "94.2" } % (RTKLIB { "94.1" } %), y el sesgo entre sistemas difiere de RTKLIB en -1.03 ns porque el modo simple de RTKLIB ignora los desfases de antena de satélite (+{ "0.04" } ns cuando ambos los omiten)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) con una diferencia de { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-e86eb864ba1a = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — La prueba chi-cuadrado de NEES es una comprobación de coherencia interna (la verdad y el filtro comparten el modelo). La tendencia se compara con Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min acortados a { "7.0" }, { "3.2" }, { "2.1" } y { "1.3" } min con { "60" }, { "96" }, { "192" } y { "288" } satélites LEO. El escenario incluido da { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } y { "2.3" } min con sus propias capas representativas de { "1000" } km y { "60" } grados, ruido y estaciones; no se reproducen las constelaciones, el ruido ni la definición de convergencia del artículo, de modo que esto es una coherencia MODELLED de la tendencia (acortamiento monótono, la mayor constelación por debajo de un tercio del tiempo solo con GNSS), no una validación

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } semillas, media de NEES promediada por ejecución en [{ "2.4" }, { "3.6" }] y al menos el { "75" }% de las épocas dentro de la banda chi-cuadrado bilateral del { "95" }%; medido con { "150" } semillas, media { "2.84" } solo con GNSS y { "2.87" } con LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna: la expresión publicada del desfase evaluada a mano, el error normalizado sobre { "40" } semillas y el suelo fijado por la incertidumbre del desfase. La cifra del NIST para receptores de temporización de Iridium con un reloj atómico en miniatura (menos de { "40" } ns respecto de UTC(NIST) a lo largo de { "40" } días) es solo una comparación; el escenario de Iridium incluido da de { "10" } a { "11" } ns RMS con potencia nominal con su error de distancia representativo de { "5" } m. No se simulan el ruido de frecuencia flicker ni el retardo ionosférico

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Transcripción de los valores públicos citados, comprobada en cuanto a estructura (cada fuente pública tiene una URL, los patrones de Walker se dividen de forma exacta, el C/N0 a partir de la potencia recibida sobre kT a { "290" } K), no frente a una referencia independiente externa. Los valores representativos se nombran en cada preajuste y son ilustrativos

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: análisis del texto fuente de src, scenarios y tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Autoconsistencia de los traspasos: cada valor traspasado es igual a la propia salida de la etapa anterior, y mutar una entrada anterior mueve cada cifra posterior que depende de ella. Las etapas conservan sus propias etiquetas; la cadena no añade física ni referencia independiente externa

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: una EIRP más fuerte, un intervalo de ajuste más largo y un término de determinación de órbita mayor mueven cada uno el valor traspasado y la fijación fusionada; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Formas cerradas e identidades, no una medición externa: el gradiente de velocidad de distancia frente a una diferencia central, el estadístico en forma de información frente a la forma de covarianza densa, una deriva de reloj pura que da cero, un empuje explicado por el a priori que da como máximo |dx|^2/sigma_p^{ "2" }, el estadístico cuadrático en un salto. Ninguna cifra de detección se compara con un ataque medido; el suplantador está idealizado (sin firma de potencia, de ángulo de llegada ni de pico de correlación)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Identidades: el escalón de inicio de un suplantador libre de ionosfera es igual a la diferencia de retardo ionosférico modelada del par, el umbral es el cuantil normal bilateral multiplicado por la desviación típica del escalón más la cota de tasa. El modelo ionosférico del receptor es el del motor, de modo que el residuo auténtico es cero en media por construcción; sin referencia independiente externa

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La identidad de dispersión de primer orden, exacta por construcción frente al propio retardo de primer orden del motor (cuyo escalado 1/f^{ "2" } está VALIDATED frente a IS-GPS-200 en su propia fila); la precisión es solo ruido térmico de código, sin multitrayecto ni sesgos entre frecuencias. Ronda { "2" } de { "0.30" }, medida (preregistrada 5e795f93), un hallazgo (sigue siendo MODELLED): el mapa global de ionosfera de CODE CODG1330.18I frente al código C1C/C2W de ABMF con los sesgos de CODE da { "33" } de { "36" } medias de arco dentro de { "3" } TECU (peor caso +{ "6.84" } TECU en un arco vespertino; RMS por época { "3.95" } TECU), frente a un umbral de todos los arcos; no validado

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: es igual al TEC oblicuo del paso en el pico con una diferencia de { "1e-9" } y su sigma es igual al ruido de código RSS sobre { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Implementación frente a especificación, NO una referencia independiente externa: una reimplementación en Python en sala limpia (scripts/maritime_score_cleanroom.py), escrita por un lector al que solo se dieron docs/RECEIVER-TRUST.md y docs/MARITIME-TRUST.md y no el código fuente en Rust, coincide con score_from_ratios en { "600" } vectores de relaciones (puntuación, banda, puntos y orden de las deducciones, diferencia { "0" }), tras completar la documentación donde el primer lector la encontró callada o incoherente (orden de empates, redondeo, la relación de un monitor de aprobado o suspenso, dos ejemplos cuyos números no coincidían con la fórmula). Eso demuestra que la documentación es suficiente y que el código hace lo que dice. LO QUE NO SE COMPRUEBA, y por qué la fila sigue siendo MODELLED: la regla en sí (los pesos, la rampa, los límites de banda, la retención de evidencia) es propia de este proyecto, preregistrada pero sin fuente externa, y nada de lo aquí expuesto demuestra que una puntuación de { "80" } o { "40" } signifique lo que un navegante querría que significara ante interferencia real; no se da ninguna cifra de ese tipo. Los umbrales de los monitores son igualmente propios de este proyecto (la Fila A solo comprueba su aritmética).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monótona en cada estadístico, añadir un monitor nunca sube la puntuación, los estadísticos sanos se mantienen en { "100" })

# text
seg-26753cc49103 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — LO QUE SE COMPRUEBA: las pruebas de cadena exacta propias de este crate sobre la correspondencia de campos LEEF documentada y los campos del sobre RFC { "5424" }; no existe ningún analizador LEEF de código abierto mantenido (una búsqueda en el índice de paquetes de Python no encontró ninguno), de modo que el formato se comprueba frente a su propia especificación leída por el mismo autor, no frente a una referencia independiente externa. LO QUE NO: si las cargas LEEF son aceptadas por el analizador o el SIEM de algún proveedor; las reglas de escape más allá de las documentadas; el comportamiento de un colector de syslog real.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (cadenas LEEF exactas, escape, gravedad, sobre RFC { "5424" }, tiempos de espera de entrega y reconexión); tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Los registros de eventos publicados del conjunto de datos (ventanas de attack_log), como verdad de eventos, bajo el preregistro xval/jammertest-trust/PREREGISTRATION.md (confirmado en solitario, 0fa012b, antes de que se ejecutara el arnés). Primera y única ejecución (xval/jammertest-trust/RESULTS.md): { "14" } de { "24" } carpetas evaluables ({ "7" } con interferencia), { "3,502" } épocas limpias y { "9,560" } con interferencia. Probabilidad de falsa alarma limpia reservada: cn0_drop_db { "0.0231" } (81/3502) frente a un umbral de { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, se supera; jam_ind_threshold { "0.0094" }, se supera; unión de los tres: falsas alarmas { "0.0328" }, detección { "0.807" } frente a { "0.05" } y { "0.50" }, se supera. Según la regla registrada, la fila es MODELLED (falló un umbral). Estrecho: un tipo de receptor (u-blox ZED-F9P), un evento, franjas programadas de un minuto como verdad (la detección es una cota inferior; limpio significa fuera de las ventanas registradas); calibrado con los registros CSV, y el lector UBX da más falsas alarmas en dos carpetas. Las bandas de la puntuación de confianza marítima no están calibradas

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignorada, condicionada a los datos por KSHANA_JAMMERTEST_DIR: la selección registrada, los recuentos reservados, los veredictos de los umbrales y el veredicto); receiver_trust::calibration::tests (marcas de tiempo, emparejamiento de ventanas y desplazamiento de zona horaria, etiquetas, bandas de guarda, exclusión, selección); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Los recuentos de franjas del plan por área de prueba (franjas { "76" }, { "77" } y { "45" }, de las cuales { "61" }, { "63" } y { "32" } transmiten) se contaron de forma independiente con un script sobre el mismo JSON; las ventanas de attack_log del conjunto de datos de { "2024" } como verdad de eventos, bajo xval/jammertest-score/PREREGISTRATION.md (confirmado en solitario, c2e6d3b, antes de que se ejecutara el evaluador). Primera y única ejecución (xval/jammertest-score/RESULTS.md): la regla registrada de datos mínimos FALLÓ ({ "4" } ventanas de interferencia evaluables de { "4" } de { "12" } carpetas UBX frente a un mínimo de { "10" } ventanas de { "2" } carpetas: { "5" } carpetas descartadas por la regla de línea base, { "3" } registros UBX llevan solo la semana de GPS y el tiempo de la semana), de modo que los umbrales B1 a B4 no son evaluables; no se relajó ni se volvió a ejecutar nada. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, confirmado en solitario, solo tratamiento de datos: registros con solo tiempo GPS situados a partir de la fecha, las { "12" } carpetas solo CSV, una sesión de plataforma móvil para rovers móviles; mismos umbrales y misma regla de datos mínimos): { "14" } de { "24" } carpetas conservadas pero { "7" } ventanas de interferencia evaluables, la regla de datos mínimos falló de nuevo, ningún umbral evaluable (RESULTS-v2.md). Verdad programada: una franja planificada no es un registro de emisión, un fallo puede ser una prueba que nunca se ejecutó, una latencia se mide desde el inicio planificado y limpio significa fuera de las franjas planificadas. La detección mediante monitores del dominio de medición no dice nada sobre un suplantador de baja potencia. Un tipo de receptor (u-blox ZED-F9P). No se usa el conjunto de datos NMEA de SimulaMet de { "2025" } (sin licencia indicada, con acceso por suscripción)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (condicionada a los datos por KSHANA_JAMMERTEST_PLAN_DIR: recuentos de franjas por área de prueba del plan de { "2025" }, identificadores de catálogo, viaje de ida y vuelta de TOML); tests/jammertest_score.rs (un registro sintético con una caída conocida: detectada, no detectada, no evaluable, ejecución con falsa alarma, paquete firmado con la tarjeta de puntuación); jammertest::plan::tests; tests/jammertest_score_2024.rs (condicionada a los datos por KSHANA_JAMMERTEST_DIR: la ejecución registrada)

# text
seg-c70f3f97d479 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Referencias comprobadas frente a un índice de encabezados extraído por script de los documentos públicos citados leídos el 2026-10-10 (tests/compliance_references.rs). LO QUE SE COMPRUEBA: { "49" } referencias citadas a cláusulas, secciones, párrafos o encabezados existen en el documento citado, y { "7" } URL citadas se resolvieron en la fecha registrada ({ "2" } por una segunda vía); los controles negativos fallan. LO QUE NO: que cualquier paráfrasis, correspondencia o laguna sea correcta; las cláusulas de EN { "16803" } (de pago, solo texto del catálogo); revisiones posteriores; el índice no es una implementación independiente.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = ejercitado frente a una aplicación anfitriona real; una ejecución de integración no es una referencia independiente — LO QUE SE COMPRUEBA, indicado de forma estricta: que estas integraciones funcionan con el software real para el que están escritas. La EVIDENCIA está confirmada en integrations/signalk/evidence/README.md (con sus archivos JSON) y en integrations/opencpn/evidence/README.md (con sus capturas de pantalla y registros), cada una con el script que la reproduce. ({ "1" }) Signal K: el plugin cargado en el paquete npm signalk-server { "2.33.0" } fijado, en un espacio de nombres de red privado solo de bucle local, alimentado con datos sintéticos. Las propias interfaces REST y WebSocket del servidor mostraron las rutas publicadas, los metadatos de la puntuación y una notificación que pasó por ausente, warn, alarm, normal (tras la retención) y warn de nuevo cuando los datos se detuvieron. Con el kshana real ejecutado por el plugin sobre el NMEA que recibió el propio servidor, la notificación pasó a warn y luego a alarm y se publicó la posición notificada; el propio navigation.position del servidor lo escribió su proveedor NMEA, nunca el plugin. Se volvió a ejecutar con el esquema JSON en vivo { "1.2" }. ({ "2" }) OpenCPN: el plugin compilado con la cabecera de la API de plugins de OpenCPN y wxWidgets { "3.2.4" }, cargado en el paquete de Ubuntu { "24.04" } de OpenCPN { "5.8.4" } bajo una pantalla virtual; OpenCPN lo cargó, ejecutó su inicialización y le entregó las sentencias PKSHT del flujo con puerta, y el panel se puso en rojo en la banda no confiable. En una ejecución limpia, la propia posición del buque de OpenCPN dejó de actualizarse y su indicador de fijación cayó cuando la puerta marcó la fijación como no válida. Una segunda ejecución alimentada directamente por el oyente TCP de la puerta mostró la entrega al plugin, pero no un antes y un después limpios. ({ "3" }) Las pruebas de relé reproducen un extracto registrado del flujo con puerta a través de un socket TCP real y comprueban lo que recibe un consumidor (los bytes sin cambios, sumas de comprobación válidas en cada sentencia, incluidas las reescritas, GGA y RMC coincidiendo, un PKSHT por ciclo con el campo de puerta donde la fijación no es válida), y el script de extremo a extremo comprueba que un consumidor del oyente de la puerta recibe exactamente los bytes que la misma puerta escribe en la salida estándar. ({ "4" }) Los analizadores de PKSHT (JavaScript y C++) se ejecutan sobre sentencias registradas a partir de la salida de kshana y rechazan una suma de comprobación errónea, una versión errónea o una puntuación fuera de { "0" } a { "100" }. ({ "5" }) Las unidades de systemd se comprueban con systemd-analyze verify (systemd { "255" }, binarios sustituidos por stubs) y con salvaguardas para un shell en ExecStart, la política de reinicio y las claves del sandbox; el tratamiento de argumentos del punto de entrada del contenedor se comprueba con un binario stub. LO QUE NO: no existe ninguna referencia independiente externa para ningún valor que muestran estas integraciones. Los valores de confianza en sí son las filas anteriores, y una ejecución de integración solo muestra que la tubería los transporta; por eso esta fila es MODELLED y no VALIDATED (docs/VALIDATION.md). No se usó ningún buque real, receptor, ejecución larga, otra versión de ninguno de los dos anfitriones, otro sistema operativo ni otro escritorio; todos los datos son texto sintético y nada de lo aquí expuesto es una medición. No se ejercitaron el tratamiento sonoro y visual de la notificación por parte de un cliente real de Signal K, el botón de la barra de herramientas de OpenCPN, las preferencias y el estado obsoleto, ni el empaquetado para el gestor de plugins de OpenCPN. Las claves del sandbox de systemd se comprobaron solo en cuanto a sintaxis, sin ejecutarlas bajo un systemd en vivo, y la compilación de la imagen del contenedor y su comprobación de salud no tienen aquí evidencia confirmada. No se afirma ninguna cifra de detección ni de falsas alarmas. Software de carácter consultivo, no un equipo de navegación homologado (IEC { "61108" }, IEC { "61162" }): el operador sigue siendo responsable de la navegación del buque.

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (la puerta y su oyente TCP, lado Rust); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js e integrations/signalk/test/plugin.test.js ({ "24" } pruebas de Node sobre salida sintética registrada); integrations/opencpn/test/relay.test.mjs ({ "5" } pruebas de Node); integrations/opencpn/test/e2e-live.mjs (el binario real hacia un consumidor TCP, ejecutado a mano y en CI); integrations/opencpn/plugin/test/pksht_test.cpp e integrations/opencpn/plugin/test/trust_state_test.cpp (comprobaciones en C++ del analizador de PKSHT y del estado del panel); deploy/reference-build/check-units.sh y deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna frente a una verdad inyectada y a formas cerradas, bajo umbrales preregistrados en 6b68f6cc (docs/design/evidence/boc-bump-jump/). Una señal de datos BeiDou B1C (PRN { "19" }, { "5" } MS/s) generada por iq::scene: con la opción desactivada, un inicio en un pico lateral permanece enganchado en falso en los ±({ "0.5" } + d/4) chips predichos (medido ±{ "0.549" }); con ella activada, un salto hacia el pico principal a los { "0.08" } s y un RMS de ventana tardía de { "0.0008" } chips a { "45" } dB-Hz y de { "0.0048" } chips a { "35" } dB-Hz; ningún salto desde el pico principal a { "35" }, { "40" } y { "45" } dB-Hz durante { "4" } s; la pendiente de EMLP escalada de { "0.94" } a { "0.99" } sobre la señal muestreada (sin escalar de { "3.6" } a { "3.8" }). El detector de bump-jump por sí solo, sobre tripletes de correlador con la covarianza de ruido exacta de BOC({ "1,1" }), no produjo ningún salto falso en { "100 000" } actualizaciones de { "25" } a { "45" } dB-Hz y detectó { "1000" } de { "1000" } inicios en un pico lateral a { "35" } dB-Hz. NOT MET (hallazgo F1): la cuadrícula de pruebas unitarias preregistrada para el escalado incluye desfases fuera del rango lineal de los discriminadores, donde las lecturas escaladas pierden el desfase hasta en un { "48" } %. LO QUE NO SE COMPRUEBA: IQ de campo, front-ends de banda limitada, réplicas compuestas MBOC/QMBOC y cualquier receptor externo.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); pruebas unitarias de iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: el umbral de prueba unitaria B4 preregistrado se conserva tal como estaba escrito, con sus fallos registrados afirmados como hallazgo F1)

# text
seg-d2d08312c05d = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Datos medidos bajo umbrales preregistrados en b6ccb499 (xval/scint-malindi/): registro de Zenodo { "16941224" } (INGV, Malindi, { "18" } de marzo de { "2023" }, GPS PRN { "26" }, intensidad y fase de portadora a { "50" } Hz, CC BY { "4.0" }, SHA-256 comprobado). { "22" } ventanas cualificadas de { "60" } s (N1 alcanzado). MET: la distribución de intensidad (Kolmogorov-Smirnov D { "0.0415" }, umbral { "0.05" }) y el centelleo de fase ligado a S4 (sigma-phi medido/modelo mediano { "0.779" }, umbral de 2/3 a 3/2). NOT MET (hallazgo F1): la fracción de desvanecimientos profundos del modelo es { "2.38" } veces la medida (umbral de { "0.5" } a { "2" }) y su desvanecimiento medio dura { "3.51" } veces más (umbral de 2/3 a 3/2). Hallazgo F2: el procesamiento registrado lee la fase envuelta del modelo, lo que reveló una autocomprobación; B3 repetido a posteriori con la fase desenvuelta da { "0.804" }. LO QUE NO SE COMPRUEBA: otras noches, estaciones, latitudes o señales; el ruido del receptor en el modelo. La fila sigue siendo MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, el veredicto registrado afirmado tal como se registró, hallazgo F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, solo notificado; condicionada a los datos, obtenida mediante scripts/fetch_scint_malindi.sh); pruebas unitarias de realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, hallazgo F2)

# text
seg-16578e7dd2fe = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Forma cerrada, bajo umbrales preregistrados en 3724aefa (docs/design/evidence/acq-cfar/). La probabilidad de falsa alarma de CA-CFAR para celdas Gamma(M), frente a Monte Carlo del modelo exacto: { "18" } de { "18" } casos dentro de { "3" } sigmas binomiales. En cada celda de las búsquedas de iq::acq (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } celdas cada una) con un diseño del { "1" } %: { "0.977" } % y { "0.969" } % con ruido gaussiano y { "1.006" } % y { "0.999" } % con ruido cuantizado de 2 bits (M = { "1" } y { "4" }; umbral más o menos { "20" } %); decisiones sin cambios cuando se escala la entrada. NOT MET (hallazgo F1): con una señal de 2 bits sin ruido, la detección y su celda son correctas, pero el { "1.28" } % de las celdas fuera del pico de la fila del pico (umbral { "1" } %) supera el umbral, en los lóbulos laterales de correlación deterministas del código. LO QUE NO SE COMPRUEBA: otras variantes de CFAR, ventanas bidimensionales, front-ends de banda limitada, datos de campo.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, el veredicto registrado afirmado tal como se registró, hallazgo F1, fijado por finding_noise_free_sidelobes_exceed_the_cfar_rate); prueba unitaria de iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Documentos de control de interfaz publicados y formas cerradas, bajo umbrales preregistrados en 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } y B3I { "1.0" }, Galileo OS SIS ICD Issue { "2.1" }. MET: cada portadora, velocidad de chip y potencia recibida tal como se transcribe ({ "28" } canales GLONASS), los primeros nulos de BPSK en la velocidad de chip, el compuesto B1C igual a MBOC(6,1,1/11) como da la tabla de potencias de su ICD, la identidad de la ruta C/N0 y los escenarios de espectro idénticos byte a byte. NOT MET: el umbral de área unitaria, que era inalcanzable tal como estaba escrito (hallazgo F1; las áreas son iguales a la fracción en banda de forma cerrada), y la coincidencia por contenedor de las formas de onda B1I y B1C de la capa IQ con la envolvente del modelo ({ "1.26" } y { "1.56" } dB frente a { "0.5" } dB, hallazgo F2; GLONASS { "0.07" } dB), porque los códigos Gold y Weil tienen espectros de líneas desiguales; promediados en banda, los lóbulos principales coinciden con una diferencia de { "0.25" } dB. LO QUE NO SE COMPRUEBA: IQ registrado, otras señales, interferencia intrasistema.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, hallazgo F1, fijado por finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, hallazgo F2, fijado por finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, solo notificado)

# text
seg-07554505b56b = una subafirmación se comprueba externamente, pero toda la capacidad compone piezas modeladas, así que la capacidad sigue siendo modelada — LSIS-AFS V1.0 (como arriba): la secuencia de Legendre de longitud 1499 (Tabla E-1, idéntica) y los primeros y los últimos { "24" } chips terciarios (Tablas E-2 a E-6: { "419" } de { "420" } columnas idénticas; el documento imprime los mismos últimos { "24" } chips, A14850, para el PRN { "147" } y el PRN { "151" } y el generador reproduce los del PRN { "151" }, de modo que la entrada del PRN { "147" } es con toda probabilidad una errata; el umbral de { "420" } de { "420" } es NOT MET y el fallo queda fijado); el ejemplo resuelto de la Figura { "8" } del código SB1 (un solo ejemplo: 0x045 se codifica como 0x229F61DBB84A0); CRC-24Q frente al valor de comprobación del catálogo 0xCDE703 para el ASCII { "123456789" }; la aritmética de tramas del propio documento. Umbrales preregistrados en b3ba5d5. Un fallo registrado y un solo ejemplo resuelto para la capa de mensaje, así que la fila sigue siendo MODELLED. LO QUE NO SE COMPRUEBA: LDPC y las palabras CRC dentro de las subtramas { "2" } a { "4" }, el contenido de los mensajes y cualquier flujo grabado

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-3a9a9d15186c = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa para los resultados de escenario: cada prueba del paquete ejecuta un tipo de escenario MODELLED. Los umbrales son el perfil declarado por el autor del paquete (el marco del DHS no indica valores; los límites de exactitud de la OMI son la Tabla C-1 de MSC.1/Circ.1575, leída completa; el paquete de la OACI sigue la presentación del propio Plan de Mitigación de RFI de la OACI porque el Doc { "9849" } es una publicación de pago y no se leyó), fijados antes de cualquier ejecución puntuada en archivos PREREGISTRATION.md de estilo xval bajo standards/. Un umbral MET dice que un escenario modelado alcanzó un umbral declarado, nada sobre un producto

# text
seg-662887e17adb = standards_pack; compliance (hechos del paquete de normas en compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: el estado de cada prueba, incluidos los fallos L4-T1 y las cuatro pruebas de exactitud de la OMI); standards_pack::tests

# text
seg-37b0efd0a7e5 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: el paquete enlaza hashes y una puntuación MODELLED del registro del receptor, comprobada con datos sintéticos (el NMEA exportado de un escenario incluido, tratado como registro del receptor). No se afirma ninguna ejecución de laboratorio

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-e9bde2e0a342 = una subafirmación se comprueba externamente, pero toda la capacidad compone piezas modeladas, así que la capacidad sigue siendo modelada — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, el paquete de Ubuntu { "24.04" }, ejecutado como programa aparte; solo se registran los números derivados) siguiendo las mismas grabaciones de numpy (independientes del motor), ambos medidos frente a la verdad analítica. Umbrales preregistrados en 48edd4a5, enmendados antes de cualquier grabación de prueba en 1e4288c4 (un FLL de { "10" } Hz solo durante la captura en ambos receptores, tras fallar la calibración registrada por un traspaso erróneo de GNSS-SDR, hallazgo F3). MET a { "30" }, { "35" }, { "40" } y { "45" } dB-Hz: jitter de portadora dentro del { "4.3" } %, jitter de código dentro del { "4.6" } % y media y dispersión del Doppler dentro de las de GNSS-SDR. NOT MET: el C/N0 NWPR del motor queda entre { "2.3" } y { "7.1" } dB por debajo del SNV de GNSS-SDR (hallazgo F4, el límite conocido del NWPR; su M2M4 está a { "0.06" } dB de la verdad); los indicadores de enganche de fase difieren por definición (F5); a { "30" } dB-Hz GNSS-SDR perdió el ciclo dos veces y el motor no (F6). El propio traspaso de GNSS-SDR se enganchó a una frecuencia errónea en { "3" } de { "30" } ejecuciones de calibración. LO QUE NO SE COMPRUEBA: otras señales, eliminación de bits de datos, readquisición, grabaciones de campo. La fila sigue siendo MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), sobre números derivados por tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

# text
seg-5d76e6627df0 = comprobado frente a otra implementación de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Un recálculo independiente en numpy (xval/crpa-jamming/oracle.py, sin código compartido: vectores de apuntamiento de numpy, numpy.linalg.solve e inv) de cada enlace de la geometría de la demostración de jamming con una agrupación cuadrada de 4 elementos, con ambas ponderaciones. Umbrales preregistrados en 08d83b4d. MET: A1 (los { "150" } resultados de escenario idénticos byte a byte sin la sección, tras una corrección: la primera compilación añadió las unidades de crpa a la tabla de unidades de cada ejecución de jamming), A2 (un elemento equivale a ninguna agrupación hasta { "1e-12" } dB), A3 sobre la ganancia de ruido de la agrupación y el C/N0 efectivo ({ "912" } ponderaciones de enlace dentro de { "1e-9" } dB, peor caso { "2.1e-14" } dB) y sobre el nulo del jammer con anulación dirigida (por debajo de -200 dB a ambos lados), A4 (MVDR a menos de { "0.1" } dB de la anulación dirigida con un JNR de { "80" } dB). NOT MET: A3 sobre la ganancia del jammer con MVDR, { "194" } de { "456" } enlaces por encima de { "1e-9" } dB con { "0.36" } de matemática portátil ({ "202" } con matemática del host; docs/revisions/STUDIO15-batch4-rebaseline.md) (peor caso { "1.7e-6" } dB) sobre residuos de -100 a -188 dB, donde la cancelación en float64 limita ambas implementaciones (inv y solve de numpy discrepan entre sí en { "169" } enlaces, peor caso { "7.9e-7" } dB); el C/N0 efectivo que estos alimentan no se ve afectado. LO QUE NO SE COMPRUEBA: acoplamiento mutuo, desajuste entre elementos, procesamiento de banda ancha, varios jammers, cualquier hardware de antena. Un recálculo de las mismas ecuaciones, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), frente a xval/crpa-jamming/expected.json generado por xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = comprobado frente a otra implementación de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Un recálculo independiente en numpy (xval/jamming-terrain/oracle.py, sin código compartido: su propia lectura de .hgt, interpolación bilineal, ida y vuelta WGS { "84" }, perfil, abombamiento, nu y J(nu)) de diez ubicaciones de jammer alrededor de un receptor en Badwater Basin sobre la tesela SRTM real registrada tests/fixtures/terrain/N36W117_sub6.hgt. Umbrales y ubicaciones preregistrados en 92cd2bfd. Todos MET: aditividad (los { "150" } resultados de escenario idénticos byte a byte sin la sección); los puntos del perfil y el obstáculo de cada ubicación iguales, y nu y la pérdida dentro de { "1.6e-10" } (umbral { "1e-9" }); la pérdida nunca aumenta al subir el jammer de { "2" } a { "4902" } m; la pérdida reduce cada J/S exactamente en su valor y en nada más; J(nu) dentro de { "1e-12" } dB del de la referencia. Hallazgos: las ubicaciones al otro lado de las montañas Black y Funeral pierden entre { "44" } y { "48" } dB; dos ubicaciones en el fondo del valle pierden { "8" } y { "15" } dB solo por el abombamiento de la Tierra con antenas a { "2" } m de altura, el caso rasante del modelo de filo de cuchillo simple. LO QUE NO SE COMPRUEBA: cualquier propagación medida, difracción de múltiples filos, reflexión en el suelo, clutter, el error propio del DEM. Un recálculo del mismo modelo, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), frente a xval/jamming-terrain/expected.json generado por xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = comprobado frente a otra implementación de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — Un recálculo independiente en Python de cada indicador de adquisición (xval/jamming-acq-agc/hysteresis.py) a partir del C/N0 efectivo por época del motor, un Monte Carlo independiente en numpy de la pérdida del cuantificador (xval/jamming-acq-agc/quantiser_mc.py, con su propia búsqueda del paso óptimo, { "2" }^{ "22" } muestras) y el lazo AGC de la capa IQ. Umbrales preregistrados en 70c72fcc, con un conjunto de ejecuciones suplementarias en { "37793290" }. MET: aditividad (los { "150" } resultados de escenario idénticos byte a byte sin las secciones); todos los indicadores iguales en las ejecuciones suplementarias ({ "1824" } enlaces, { "732" } de ellos con histéresis); monótono respecto al umbral; la pérdida del cuantificador a menos de { "0.0007" } dB del Monte Carlo con { "1" } a { "4" } bits (umbral { "0.02" } dB); la lectura del AGC a menos de { "0.012" } dB del lazo AGC (umbral { "0.05" } dB). NOT MET: las ejecuciones de histéresis registradas (jamming-demo a { "10" } a { "30" } dBW) no fueron informativas, con todos los enlaces perdidos, y sus H2 y H4 se satisfacen solo de forma trivial. Hallazgo: con un jammer CW un ADC de 1 bit pierde unos { "5" } dB más que la cifra gaussiana que aplica el motor, y se marca como no válido. LO QUE NO SE COMPRUEBA: la búsqueda de adquisición en sí, la dinámica temporal del AGC, cualquier hardware de receptor. Recálculos del mismo modelo, no una referencia independiente externa; la fila sigue siendo MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), frente a xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json y expected_quantiser.json

# text
seg-19788df00e45 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Coherencia interna frente a una verdad inyectada: una fuente sintética sin datos de GPS L1 C/A (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, diez semillas de ruido) cuya fase de portadora es conocida, con umbrales preregistrados en 58789af0 (docs/design/evidence/fll-handover-floor/). MET: el control (el valor por defecto sin tope nunca traspasa en { "9" } de { "10" } semillas a { "33" } dB-Hz); aditividad (el hash por defecto y las pruebas de seguimiento existentes sin cambios); captura de un traspaso con { "100" } Hz de error a { "45" } dB-Hz. NOT MET: con un tope de { "1.0" } s, traspaso y mantenimiento en cada ejecución ({ "16" } de { "20" } a { "33" } dB-Hz, { "8" } de { "20" } a { "31" } dB-Hz; el resto alterna entre traspasos forzados y el regreso del FLL) y jitter de fase a menos del { "25" } % del PLL solo ({ "10.8" } frente a { "6.1" } grados a { "33" } dB-Hz). LO QUE NO SE COMPRUEBA: bits de datos, otras señales y frecuencias de muestreo, grabaciones de campo. El valor por defecto no cambia; la fila sigue siendo MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (la compuerta del FLL)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), sobre tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: no se leyó ningún archivo producido por RTKLIB y la disposición de columnas procede del manual de RTKLIB. Comprobado solo con archivos escritos por nosotros; la conversión ECEF reutiliza frames::ecef_to_geodetic, que tiene sus propias filas

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (épocas lat/lon, semana/TOW y ECEF, dms rechazado, entrada hostil); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa como umbral de aprobación. Las disposiciones de campos y el CRC siguen la documentación pública de OEM7 (docs.novatel.com); la rutina de CRC se comprobó una vez frente al CRC que la documentación indica para su propio ejemplo BESTPOSA (citado, no reproducido). Los archivos de prueba están escritos por nosotros; no se leyó ningún registro de un receptor real

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (CRC fijado, registros ASCII y binarios, CRC erróneo omitido, entrada hostil); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = comprobado frente a otra implementación de este mismo código base: independiente de la unidad sometida a prueba, pero sin autoridad externa — ReferenceImpl en una comprobación puntual, no una prueba de la suite: el decodificador de pyrtcm { "1.2.0" } lee las mismas tramas escritas por nosotros y obtiene el mismo C/N0 y la misma hora de época. Comparte con este lector el origen de sus tablas, así que comprueba el tratamiento de bits, no la disposición. No se leyó ninguna captura de un receptor real ni de una estación base

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (valor de comprobación del catálogo de CRC-24Q, fusión de C/N0 y de épocas de MSM4/MSM7, hora de GLONASS y correspondencia de identificadores SBAS, CRC erróneo y otros mensajes)

# text
seg-15841bb986fe = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: los nombres de campo proceden de la documentación de GNSS-SDR; ni el lector ni relay.py se ejecutaron contra un GNSS-SDR en vivo ni contra una captura real

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: el ajuste se comprueba con registros sintéticos de ruido blanco con coeficientes conocidos, y el rumbo con registros de velocidad de guiñada constante. No se ajustó ningún registro real de IMU, y q_aa no se ajusta

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (coeficientes conocidos de ruido blanco recuperados con un error de hasta el { "10" } %, rechazos, el TOML se interpreta como AccelCfg); tests/receiver_trust_machines.rs (coincidencia y discrepancia de rumbo, portadora en línea, imu_fit)

# text
seg-93283b08d1f9 = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: los paquetes los leyó un oyente de bucle local escrito para la prueba, no un broker real, y no se ejecutó Home Assistant

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (bytes de paquete, broker de bucle local, broker caído contabilizado); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = comprobado frente a su propia identidad analítica o de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa: el nodo ROS no se ejecutó en un grafo ROS { "2" } en vivo, y los nombres de campo de ublox_ubx_msgs no se comprobaron contra un controlador en ejecución. gnss_lib_py (MIT) se ejecutó para la prueba del puente

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: el formato que escribe el puente gnss_lib_py, ejecutado con receiver-trust); las pruebas en Python de los puentes son integrations/ros2/kshana_trust/test/test_bridge.py (puente con un motor simulado), integrations/ros2/kshana_trust/test/test_engine_integration.py (la wheel real puntúa como nominal una posición estable y como no confiable un salto de { "1.1" } km) e integrations/gnss_lib_py/test_bridge.py (gnss_lib_py real { "1.1.0" } y la wheel), ejecutadas con pytest, no con cargo

# text
seg-7a0503f925c1 = <s1>Anterior</s1>Referencia de capacidades

# text
seg-b5832e94f926 = <s1>Siguiente</s1>Afirmaciones frente a la realidad

# text
seg-1103199f019b = La sección opcional [receiver] de lunar-station-coverage (LRS-02): sigma de multitrayecto dependiente de la elevación sigma(el) = a + b exp(-el / el0) en el usuario y en la estación (la forma funcional aerotransportada de RTCA DO-229, con a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grados por defecto; en la Luna cada valor es ILLUSTRATIVE), blanco en el usuario y de Gauss-Markov de primer orden sobre épocas en la estación (rho = exp(-dt / tau)); ruido térmico de código del DLL anticipado menos retardado sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); sesgos entre canales por canal constantes durante un ensayo, en el usuario y en la estación. Los términos de estación entran en sus correcciones, los del usuario en las mediciones brutas y corregidas, cada uno con su propio flujo con semilla. Si faltan, cada documento no cambia

# text
seg-13b0ae9a874a = La entrada opcional orbit_err_growth_m_per_s de lunar-station-coverage (LRS-03): una corrección aplicada latency_s después de calcularse no recoge el crecimiento g latency_s del error de órbita difundida, siendo g isótropo de tasa RMS 3-D, sorteado por satélite y ensayo en su propio flujo con semilla (tasa de 1 sigma del rango tau / sqrt({ "3" })), además de la reproyección de línea de visión del error congelado. Si falta, cada documento no cambia. Un anexo K5 de la comparación con afirmaciones publicadas, preregistrado por separado, ejecuta K5 a { "0.001" }, { "0.01" } y { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-7dfedc40da6a = El bloque opcional [time_lab] del escenario lunar-time-budget modela un reloj de estación de referencia lunar (por defecto de la clase miniRAFS, o cualquier clase nombrada, o una tarjeta de dispositivo ajustada a puntos de estabilidad indicados) dirigido al Tiempo Lunar Coordinado y luego en marcha libre o redirigido cada N segundos: la curva de error de tiempo x(t) como raíz de la suma de cuadrados del término de ley de potencias del reloj, un residuo de dirección constante (ILLUSTRATIVE), un residuo constante de realización del LTC y un término opcional de tasa por altura de estación; el tiempo tras una dirección hasta { "1" }, { "10" } y { "100" } ns (o umbrales indicados) por bisección junto a la inversa en forma cerrada para el tipo de ruido dominante, y el término dominante en cada horizonte indicado, todo con unidades

# text
seg-b915c06fa3f1 = skyline::PRESETS: cuatro geometrías REPRESENTATIVE con las dimensiones indicadas en la nota de diseño y una línea de procedencia cada una: city-street (un cañón, calle { "0" } grados, { "20" } m entre muros de { "30" } m, antena { "1.5" } m), harbour-approach (sectores: abierto hacia el mar en { "180" } grados, edificios de muelle { "8" } grados en { "90" } grados, el rompeolas { "3" } grados), fjord (terreno: paredes { "600" } m por encima de la antena a { "1.5" } km a cada lado de un canal norte-sur, caída por curvatura aplicada), container-terminal (sectores: pilas { "12" } grados sobre la mitad hacia tierra, plumas de grúa { "35" } grados y { "25" } grados sobre dos sectores estrechos); sobrescribible campo por campo

seg-65185cb68d6b = Presupuesto de errores de navegación y temporización de una cadena de fases de misión desde el lanzamiento hasta la entrada (<c1/>)

seg-86a132e1a243 = El tipo de escenario <c1/>: un documento de fases, cada una de uno de ocho tipos registrados, ejecutadas en orden con la covarianza de 6x6, el reloj y el marco transmitidos bajo una regla indicada (<c2/>; <c3/>, ruido de aceleración blanco sobre un intervalo indicado en un modelo de línea recta; <c4/>, navegación a estima y luego el piso de la fuente, nunca por debajo de él, nunca un reinicio); conversiones de marco GCRF, MCI y MCMF y conversiones de escala de tiempo a través de TT, cada una con su propia fila de presupuesto, con el estado de la Luna a partir de un recorte opcional del kernel DE440 y la serie analítica como alternativa indicada; el margen frente a un requisito indicado, el eslabón más débil, los eventos y una figura de línea de tiempo. Cada número es una entrada indicada o un modelo de una de ellas

seg-87b2b2459b45 = Lanzamiento y ascenso a una órbita de estacionamiento con adquisición y desvanecimiento de GNSS (<c1/>)

seg-725e7ce83533 = La fase <c1/>: una covarianza de posición y velocidad de velocidad constante con ruido de aceleración blanco (el grado de navegación a estima), una posición GNSS de precisión indicada aplicada tras el tiempo de adquisición y fuera de los desvanecimientos indicados, un reloj de sesgo y deriva disciplinado por las mismas posiciones, y el estado de inserción en la órbita de estacionamiento

seg-eb66a49b0306 = Navegación relativa hasta la envolvente de acoplamiento en órbita terrestre baja a lo largo de tramos de sensor (<c1/>)

seg-658a0448d80d = La fase <c1/>: el estado relativo en los ejes LVLH del objetivo con la transición de Clohessy-Wiltshire de forma cerrada, una covarianza de Kalman de 6x6 con ruido de aceleración blanco y actualizaciones de posición cuya varianza es la del sensor a la distancia actual, a lo largo de tramos de un sensor indicado (formas ILLUSTRATIVE de cámara óptica, lidar y medición de distancia por radio); la ventana de acoplamiento es el tiempo desde que el sigma relativo permanece dentro de la envolvente de captura hasta el final de la fase. La covarianza absoluta del perseguidor se transmite sin cambios y una fila lo indica

seg-b45a8a357faf = Inyección translunar y crucero cislunar: estado medio y covarianza propagados con actualizaciones de seguimiento (<c1/>)

seg-ab5c79789754 = La fase <c1/>: el estado medio mediante el propagador de Cowell del motor (masa puntual terrestre y J2, el Sol y la Luna como terceros cuerpos, la Luna a partir del kernel DE440 del hilo donde cubre el segmento y el Sol a partir de la serie analítica); la covarianza mediante una matriz de transición de estado por diferencias hacia adelante de esa propagación (la ejecución nominal y seis ejecuciones perturbadas por segmento) con ruido de aceleración blanco; el tamaño y el error de apuntamiento de la maniobra TLI; posiciones <c2/> cuya disponibilidad y PDOP proceden del barrido del volumen de servicio espacial a lo largo de una órbita osculatriz que sustituye al arco; seguimiento de distancia y velocidad de distancia a lo largo de la dirección geocéntrica, escalado por el ciclo de la red terrestre, con la actualización de forma de Joseph

seg-7a3eb4fae324 = Covarianza en la interfaz de entrada, probabilidad de corredor, deceleración máxima y huella de aterrizaje (<c1/>)

seg-93f07906d7bf = La fase <c1/>: la deriva de regreso de <c2/> sin maniobra, que termina en la interfaz de entrada; el ángulo de trayectoria de vuelo y su sigma a partir de la covarianza completa mediante un gradiente por diferencias finitas; la probabilidad de que el ángulo esté dentro de un corredor indicado; la deceleración máxima en el ángulo nominal y en ambos bordes del corredor a partir de la entrada balística plana de masa puntual del propio motor (con detección de rebote) junto a la forma cerrada de Allen-Eggers; la huella de aterrizaje a partir de una sensibilidad indicada en el sentido del alcance y la covarianza de la interfaz a través del plano orbital. No se modela sustentación, guiado ni calentamiento

seg-3f0951532f6e = Cobertura de la red terrestre y ciclo de seguimiento para una fase del hilo (<c1/> de <c2/>)

seg-5204af351299 = La superposición de la red terrestre: estaciones con una elevación mínima, la visibilidad del vehículo en una geometría indicada (el estado de entrada volado en dos cuerpos con J2, la posición de la Luna para el crucero, o un ciclo indicado), traspasos entre estaciones que pierden cada uno un tiempo indicado, y el ciclo resultante transmitido a la tasa de actualización de seguimiento terrestre de la fase; el intervalo más largo sin ninguna estación a la vista es una fila de presupuesto

seg-4ba700726208 = Navegación relativa hasta el acoplamiento en una órbita lunar (<c1/>)

seg-2e30e78e49f7 = El tipo de escenario y fase <c1/>: una estimación conjunta por lotes de Gauss-Newton de dos vehículos a lo largo del arco (veintiún parámetros: ambos estados y sesgos persistentes de posición de la señal en el espacio, comunes e independientes), ampliada sobre un cuarto, la mitad y todo el arco con reducción de paso a la mitad, a partir de una posición absoluta por vehículo (cota de seguimiento de código del piloto AFS, conjunto de relés ILLUSTRATIVE) y una distancia de enlace cruzado, bajo el modelo de fuerzas lunar del crate; el error de estimación normalizado cuadrático medio, la comprobación de Clohessy-Wiltshire en una órbita circular y la covarianza de 6x6 transmitida

seg-c85d7e5e63a3 = Presupuesto de dispersión de aterrizaje en un emplazamiento polar lunar (<c1/>)

seg-bd88ab3ad105 = El tipo de escenario y fase <c1/>: un modelo de error inercial de cinco estados por eje (posición, velocidad, sesgo del acelerómetro, inclinación, sesgo del giróscopo) durante un descenso propulsado, ayudado por posiciones AFS (autónomas o diferenciales, con el caso de tres relés asistido por reloj), una posición relativa al terreno (el correlador terrain-nav del motor sobre relieve sintético, o una cota de Cramer-Rao sobre un DEM de LOLA con una regla del problema de apertura) y la hora lunar, con una elipse de toma de contacto por Monte Carlo

seg-8dfc1600cf8c = Disponibilidad de posicionamiento y temporización en la superficie por emplazamiento y estación en los polos lunares (<c1/>)

seg-f91c1da9ab55 = El tipo de escenario y fase <c1/>: disponibilidad de relés y PDOP, visibilidad de la Tierra y del Sol y un reloj de superficie disciplinado para cada emplazamiento y estación, con el horizonte de terreno de <c2/>; una ejecución de un solo emplazamiento iguala la disponibilidad y el PDOP de ese tipo de escenario bit a bit

seg-0db91d70a079 = Ascenso propulsado desde un emplazamiento polar lunar a una órbita de inserción (<c1/>)

seg-b5b1125d515c = El tipo de escenario y fase <c1/>: el modelo de error inercial de cinco estados por eje ejecutado durante un ascenso propulsado con fuerza específica a lo largo de la trayectoria, ayudado por posiciones AFS y la hora lunar, que informa de la covarianza de posición y velocidad de inserción transportada a la órbita y de la dispersión al corte del motor (informada, no transportada)

seg-1983ce9cc6da = La propagación con el modelo de fuerzas lunar frente a trayectorias públicas reconstruidas de orbitadores lunares y cislunares

seg-57f53a7d1fa2 = El propagador que comparten los tipos de escenario lunares (GRAIL GL0660B de grado y orden { "150" }, la Tierra y el Sol como terceros cuerpos, relatividad, orientación lunar DE440) comparado con las trayectorias públicas de JPL Horizons de LRO ({ "24" } h, muestras cada { "10" } minutos) y CAPSTONE (una revolución de { "6.5" } días, muestras cada hora), bajo umbrales fijados en un archivo confirmado antes de la ejecución

seg-c557d317389a = La propagación del estado medio cislunar frente a la trayectoria pública de Artemis I (<c1/>)

seg-539d4c3e9b56 = La propagación del estado medio de la fase <c1/> (Cowell, masa puntual terrestre y J2, el Sol y la Luna como terceros cuerpos, la Luna a partir de un recorte de DE440) comparada con la trayectoria pública de Artemis I de JPL Horizons a lo largo de un arco de deriva de { "72" } h desde 2022-11-16 { "18" }:{ "00" } TDB, en épocas cada { "12" } horas, bajo umbrales fijados en un archivo confirmado antes de la ejecución

seg-150ae9c3d755 = Región de la fuente de interferencia: una región factible del emisor a partir de informes de posición de aeronaves y buques

seg-b5c49044a7a1 = Una región factible para la ubicación de una fuente de informes de navegación degradada, a partir de informes de posición ADS-B (NIC/NACp) o AIS: línea de visión radioeléctrica con un radio terrestre de 4/3 desde la altura del informe y un intervalo de alturas de antena del emisor, un alcance efectivo limitado para la potencia desconocida, unidades afectadas que atraen la distribución a posteriori hacia su alcance y unidades no afectadas con línea de visión que la empujan en sentido contrario, agrupadas en sesiones en el tiempo y el espacio. La salida son regiones de máxima densidad con niveles de confianza indicados, un centroide a posteriori con una elipse de momentos, el inicio, el final y la duración de la sesión, el área afectada y el número de aeronaves distintas por encima del mínimo de publicación, un perfil de la hora del día y las horas por día. Sin terreno; una sola fuente por sesión; la credibilidad depende del modelo. Fusión opcional con una posición TDOA de la geolocalización.

seg-26d9a520eb6a = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Cálculos manuales en las pruebas (el crecimiento de la covarianza en línea recta, la rotación sidérea media, la tasa secular del reloj lunar) y, solo para el estado de la Luna, los recortes del kernel DE440 confirmados frente a valores fijados de JPL Horizons (el peor { "2.6" } m y { "7e-6" } m/s). No se compara ningún dato de misión con la cadena; sus fases son filas propias. El documento es una cadena declarada con entradas ILLUSTRATIVE, solo fuentes públicas y sin respaldo de ninguna agencia

seg-308cb3c31a16 = mission_thread (scenario, handover, conversions, budget, phase)

seg-65bd744f29c6 = mission_thread::scenario::tests::a_thread_runs_hands_over_converts_and_names_the_weakest_link; mission_thread::scenario::tests::bad_documents_fail_with_the_reason; mission_thread::handover::tests::inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation; mission_thread::handover::tests::reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller; mission_thread::conversions::tests::mci_mcmf_round_trip_returns_the_state_and_the_covariance; mission_thread::conversions::tests::tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back; mission_thread::conversions::tests::the_committed_kernel_cuts_agree_with_pinned_horizons_values; tests/field_units_global.rs (the report's units block)

seg-d77218b48910 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — El estado estacionario de Riccati y el cálculo manual de la predicción en las pruebas. Nada de aquí modela un vehículo de lanzamiento ni un receptor; cada número es una entrada indicada

seg-9e5314dc6b0a = mission_thread::earth::launch (LaunchAscent)

seg-083f9245ff63 = mission_thread::earth::launch::tests::with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow; mission_thread::earth::launch::tests::before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse; mission_thread::earth::launch::tests::a_phase_that_does_not_list_gnss_never_uses_it; mission_thread::earth::launch::tests::bad_models_and_entries_are_refused; mission_thread::earth::filter::tests::repeated_updates_reach_the_riccati_steady_state

seg-24aae90bcf56 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Un cálculo manual de un solo eje de la predicción y la actualización en la prueba; la transición de Clohessy-Wiltshire es la que cw_dynamics comprueba frente a una integración numérica independiente. Los sensores son ILLUSTRATIVE y no se compara ningún encuentro real

seg-da26dd6773fb = mission_thread::earth::rendezvous (LeoRendezvous); cw_dynamics; mission_thread::sensors

seg-940d19eaea64 = mission_thread::earth::rendezvous::tests::the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window; mission_thread::earth::rendezvous::tests::without_relative_sensing_the_sigma_only_grows_and_no_window_opens; mission_thread::earth::rendezvous::tests::the_covariance_recursion_matches_a_one_axis_hand_calculation; mission_thread::earth::rendezvous::tests::bad_models_and_a_duration_mismatch_are_refused; mission_thread::sensors::tests::the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close

seg-4bbee1892183 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — El teorema de Liouville (el determinante de la matriz de transición de estado de la parte conservativa es uno) y una diferencia más fina en las pruebas; el estado medio se compara con una trayectoria pública en la fila siguiente, que no alcanza. El error de maniobra, las actualizaciones y la covarianza no se comparan con nada

seg-88b5123a7c1f = mission_thread::earth::tli_cruise (TliCruise); propagator; ssv::sweep

seg-be98276d9788 = mission_thread::earth::tli_cruise::tests::the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference; mission_thread::earth::tli_cruise::tests::with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn; mission_thread::earth::tli_cruise::tests::range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky; mission_thread::earth::tli_cruise::tests::the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside; mission_thread::earth::tli_cruise::tests::gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals; mission_thread::earth::tli_cruise::tests::a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too

seg-2dc8a48d5ffe = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Cálculos manuales en las pruebas (el sigma del ángulo es el sigma de la velocidad perpendicular dividido por la velocidad; la masa gaussiana en un corredor). La entrada plana es la propia del motor y la forma de Allen-Eggers es una comparación de forma cerrada; no se compara ninguna entrada real en vuelo

seg-6057015a7a7c = mission_thread::earth::entry (Entry); reentry

seg-dcb831f6f492 = mission_thread::earth::entry::tests::the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed; mission_thread::earth::entry::tests::the_corridor_probability_is_the_gaussian_mass_inside; mission_thread::earth::entry::tests::the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint; mission_thread::earth::entry::tests::the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged; mission_thread::earth::entry::tests::bad_corridors_unknown_keys_and_burn_keys_are_refused

seg-2a78aa543666 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Comprobaciones de geometría de cenit y antípoda y la visibilidad esperada de un objetivo distante en las pruebas. No se modela ninguna red, antena ni programación reales

seg-f937752c7a50 = mission_thread::earth::ground_network::tests::a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not; mission_thread::earth::ground_network::tests::the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time; mission_thread::earth::ground_network::tests::handover_losses_reduce_the_duty_and_never_below_zero; mission_thread::earth::ground_network::tests::a_stated_duty_is_passed_through_and_bad_documents_are_refused; mission_thread::scenario::tests::the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking

seg-addac2398a5e = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Autoconsistencia bajo un preregistro (xval/mission-thread-lunar/PREREGISTRATION.md, resultados e historial del estimador en RESULTS.md): el NEES medio del estado relativo es de { "5.85" } a { "5.93" } frente a la banda de { "5.2" } a { "6.8" } en cuatro configuraciones, MET con el cuarto diseño de estimador tras fallar tres diseños de filtro secuencial; la verdad de referencia y el estimador comparten un modelo de fuerzas, de modo que esto no dice nada sobre el error del modelo. El propagador que comparten se compara con LRO y CAPSTONE en una fila más abajo

seg-75f11c7aa6bc = lunar_rendezvous (LunarRendezvousScenario); lunar_phase; mission_thread::lunar

seg-995afbdc6a9f = lunar_rendezvous::tests::b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations; lunar_rendezvous::tests::circular_cw_check_is_within_the_pre_registered_bar; lunar_rendezvous::tests::same_seed_gives_identical_documents; lunar_rendezvous::tests::b6_handover_without_a_measurement_only_propagates; mission_thread::lunar::tests::every_phase_runs_and_returns_a_modelled_outcome; tests/mission_thread_lunar_oracles.rs

seg-3270c832c0fe = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La deriva inercial de forma cerrada, los resultados propios de los tipos de escenario reutilizados y la calibración de la elipse de 3 sigma (la fracción interior coincide con su valor esperado) en las pruebas. No se compara ningún aterrizaje en vuelo ni ensayado

seg-2c293a58fb25 = lunar_landing (LunarLandingScenario); lunar_phase; terrain_nav

seg-7ac44470d95d = lunar_landing::tests::b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift; lunar_landing::tests::b4_each_aid_reports_exactly_what_the_reused_kind_gives; lunar_landing::tests::b3_ellipse_calibration; lunar_landing::tests::a_plane_gives_no_fix_the_aperture_problem; lunar_landing::tests::a_bowl_matches_the_closed_form_bound; lunar_landing::tests::three_relays_make_the_fix_depend_on_the_clock

seg-a8b9da63334b = comprobado frente a una implementación separada de este mismo código: independiente de la unidad probada, pero sin autoridad externa — Igualdad exacta con el tipo de escenario existente para un emplazamiento, y comprobaciones de monotonicidad, en las pruebas. El conjunto de relés es ILLUSTRATIVE y no se compara ninguna medición de superficie

seg-dd3ab355cb4f = lunar_surface_map (LunarSurfaceMapScenario); lunar_phase

seg-6b6210646fdd = lunar_surface_map::tests::b5_equals_the_service_volume_for_a_single_site; lunar_surface_map::tests::b5_equals_the_service_volume_with_the_real_terrain; lunar_surface_map::tests::terrain_never_adds_availability; lunar_surface_map::tests::timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun; lunar_surface_map::tests::same_inputs_give_identical_documents

seg-aa4a409d28b4 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — La deriva inercial de forma cerrada y comprobaciones de monotonicidad en las pruebas. No se compara ningún ascenso en vuelo

seg-b95197d3e058 = lunar_ascent (LunarAscentScenario); lunar_phase

seg-977149f40c72 = lunar_ascent::tests::with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift; lunar_ascent::tests::the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation; lunar_ascent::tests::a_stale_tt_clock_costs_a_three_relay_fix; lunar_ascent::tests::the_same_inputs_give_identical_documents

seg-581586ff816c = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — Efemérides de nave de JPL Horizons para LRO y CAPSTONE, frente a umbrales fijados de antemano en xval/mission-thread-lunar/PREREGISTRATION.md (enmiendas { "1" } a { "6" }). LRO: MET, { "33" } m de mayor diferencia 3D y { "2.4" } m RMS radial frente a { "500" } m y { "60" } m. CAPSTONE: NOT MET, una diferencia de posición final de { "136.8" } km frente a { "25" } km y una diferencia de periapsis de { "28.4" } km frente a { "10" } km, sin haberse aislado las causas. La fila es modelada porque el umbral de CAPSTONE no se alcanza y la comparación prueba el propagador compartido, no ningún filtro, señal ni presupuesto

seg-48ac8187364f = lunar_od (LunarForceModel); precise_od; mission_thread_lunar_oracles (example)

seg-7372185d4dd9 = tests/mission_thread_lunar_oracles.rs::the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded; tests/mission_thread_lunar_oracles.rs::the_fixtures_match_their_recorded_hashes

seg-7ce4f3fbb3c4 = una subafirmación se comprueba externamente, pero la capacidad completa compone piezas modeladas, de modo que la capacidad sigue siendo modelada — JPL Horizons objetivo -1023 (la trayectoria posterior a la TLI tal como voló, de la navegación de la NASA), frente a umbrales fijados de antemano en xval/mission-thread/PREREGISTRATION.md (la enmienda { "1" } cambia solo el intervalo solicitado). NOT MET y declarado como no alcanzado: { "45.3" } km de mayor diferencia de posición frente a { "5" } km, y { "0.249" } m/s de diferencia de velocidad a { "72" } h frente a { "0.05" } m/s. Un diagnóstico escrito después del veredicto sitúa el fallo en cinco pasos de velocidad impulsivos de { "0.09" } a { "0.22" } m/s en la referencia (la lectura fijada de antemano de que la ventana no contenía ninguna maniobra era errónea); durante las otras { "67" } horas el modelo reproduce el siguiente estado horario con una mediana de { "0.38" } m. Prueba solo el estado medio de un único arco de inercia: sin covarianza, filtro, actualización ni otra fase

seg-7089ca12dbe0 = mission_thread::earth::tli_cruise; propagator; mission_thread_oracle (example)

seg-f4b44b14d819 = tests/mission_thread_oracle.rs::the_stored_numbers_miss_the_registered_bars_as_recorded; tests/mission_thread_oracle.rs::the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model; tests/mission_thread_oracle.rs::the_kernel_cut_and_the_recorded_inputs_match_their_hashes

seg-2630978c5675 = comprobado frente a su propia identidad analítica / de forma cerrada: detecta errores de transcripción y de coeficientes, pero no es una referencia independiente externa — Ninguna externa todavía. Solo ejecuciones sintéticas de ida y vuelta directa e inversa, de un generador que comparte el modelo del estimador, por lo que comprueban el código y la calibración de los niveles indicados bajo ese modelo y nada sobre emisores reales. Una comprobación externa frente a los emplazamientos de transmisores publicados de Jammertest { "2025" } se preregistró (docs/emitter-region/PREREGISTRATION.md, aprobada por el propietario antes de cualquier ejecución puntuada) y se ejecutó una vez (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } sesiones programadas, menos del mínimo registrado de { "4" }) y AIS NOT ASSESSABLE (ninguna sesión publicada), de modo que no se probó ningún umbral y la fila sigue siendo MODELLED

seg-67fdcdfdb635 = interference_map::emitter (estimate, sessions, build_units, profile, GaussianFix::from_tdoa), interference_map::emitter_out (locate), <c1/>

seg-920b26e226ab = pruebas unitarias de interference_map::emitter (ida y vuelta de la proyección, cifra del horizonte, ida y vuelta sintéticas directa e inversa: el emisor conocido queda dentro de la región indicada con aproximadamente la tasa indicada, casos límite, agrupación en sesiones, perfil, privacidad y redacción); casos de locate de tests/interference_map_cli.rs

seg-a2bf08b8e82d = { "221" } capacidades etiquetadas como MODELLED.
